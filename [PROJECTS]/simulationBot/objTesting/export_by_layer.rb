=begin
(c) TIG 2009

  export_by_layer.rb
  
Usage: export_by_layer(type)
Exports everything in the active Model into a set of files 'by layer', 
the argument 'type' sets the file export type...
Faces with Edges on another layer take those Edges with them...
e.g. export_by_layer('obj')

### load"export_by_layer.rb"
=end 

require 'sketchup.rb'

class OBJexporter

    def initialize()
        @model=Sketchup.active_model
        path=@model.path.tr("\\", "/")
        if path.empty?
            UI.messagebox("OBJExporter:\n\nSave the SKP before Exporting it as OBJ\n")
            return nil
        end#if
		
		layer = @model.active_layer
		layerText = layer.name
		
        @project_path=File.dirname(path)
        #@title=@model.title.gsub(/[^0-9A-Za-z_-]/, "_")
		@title = layerText
        @base_name=@title

		
        ### save dialog
        #result=UI.savepanel("OBJexporter - File Name ?", @project_path, @base_name+".obj")
		puts @project_path
		result = @project_path + "/" + layerText + ".obj"
		
        return nil if not result or result==""
        @sel=@model.selection
		#@use_sel=false
		# if @sel and @sel[0]
			# UI.beep
			# if UI.messagebox("OBJexporter:\n\nYES\t=\tSelection Only...\nNO\t=\tEverything Active/Visible...\n", MB_YESNO)==6
				# @use_sel=true
			# else
				# @use_sel=false
			# end
		# else
			# @use_sel=false
		# end
        ### PNG?
		@png=true
		# UI.beep
        # if UI.messagebox("OBJExporter:\n\nConvert ALL Texture Files to PNG ?\n",MB_YESNO,"")==6 ### 6=YES
          # @png=true
        # else
          # @png=false
        # end#if
        ###
        @base_name=File.basename(result, ".*").gsub(/[^0-9A-Za-z_-]/, "_")
        @project_path=File.dirname(result)
        ### set up mat list
        @all_mats=[nil] ### for 'default'
        mats=@model.materials.to_a
        @mats=[]
        @saved_names=[]
        mats.each{|mat|
          mat_name=mat.display_name.gsub(/ /, '_').gsub(/[^0-9A-Za-z_-]/, '')
          saved_name=File.basename(mat_name)
          saved_name_uniq=self.make_name_unique(@saved_names, saved_name)
		  @saved_names << saved_name_uniq
          @mats << [mat, saved_name_uniq]
          @all_mats << mat
        }
        defns=@model.definitions
        img_mats=[]; @imgs=[]
        defns.each{|defn|
          next if not defn.image?
          face=nil
          defn.entities.each{|e|
            if e.class==Sketchup::Face
              face=e
              break
            end#if
          }
          next if not face
		  mat=face.material
          mat_name=mat.display_name.gsub(/ /, '_').gsub(/[^0-9A-Za-z_-]/, '')
          saved_name=File.basename(mat_name)
          saved_name_uniq=self.make_name_unique(@saved_names, saved_name)
		  @saved_names << saved_name_uniq
          @imgs << [mat, saved_name_uniq]
          @all_mats << mat
        }
        ### get settings etc...
        self.export()
        ###
    end

    def export()
        @obj_name=@base_name+".obj"
        Sketchup.set_status_text(@obj_name)
        @obj_filepath=File.join(@project_path, @obj_name)
        @mtllib=@base_name+".mtl"
        @mtl_file=File.join(@project_path, @mtllib)
		@textures_name=@base_name+"_Textures"
        @textures_path=File.join(@project_path, @textures_name)
		@used_vs={}
		@used_vts={}
		@used_vns={}
		@used_materials=[]
        @distorted=[]
        @dmats=[]
        @msg="OBJExporter: "; Sketchup.set_status_text(@msg)
        puts(@msg)
        puts(@obj_filepath.tr("\\","/"))
		start_time=Time.now.to_f
        self.export_start()
		end_time=(((Time.now.to_f - start_time)*10000).to_i/10000.0).to_f.to_s
		@msg="OBJexporter: Completed in #{end_time} seconds"
        Sketchup.set_status_text(@msg)
        UI.beep; puts(@msg)
        ###
	end
    
    def export_start()
        ###
      @model.start_operation("OBJexporter") ###############################
        ###
		if @use_sel
			@ents=@sel.to_a
		else
			#while @model.active_entities != @model.entities
			  #@model.close_active
			#end
			@ents=@model.active_entities.to_a
		end
        ###
		@obj_file=File.new(@obj_filepath, "w")
        @obj_file.puts("# Alias Wavefront OBJ File Exported from SketchUp")
        @obj_file.puts("# with OBJexporter (c) 2013 TIG")
        @obj_file.puts("# Units = meters")
        @obj_file.puts
		@obj_file.puts("mtllib #{@mtllib}")
        @obj_file.puts
        ###
        @msg<<'. '; Sketchup.set_status_text(@msg)
		self.export_obj()
		@obj_file.puts("#EOF")
        @obj_file.flush if @obj_file
		@obj_file.close if @obj_file
        ###
        @msg<<'. '; Sketchup.set_status_text(@msg)
		self.export_textures()
        @msg<<'. '; Sketchup.set_status_text(@msg)
		self.export_mtl_material()
        @msg<<'. '; Sketchup.set_status_text(@msg)
        ###
      @model.abort_operation ##############################################
        ###
	end

	def export_obj()
        @img_mats=[]
		objname=@title+"-SKP"
        faces=@ents.find_all{|e|next unless e.valid?; e.class==Sketchup::Face}
	    if faces[0]
            @msg<<'. '; Sketchup.set_status_text(@msg)
		    self.export_faces(faces, objname)          
		end#if
        ###
        @tr=Geom::Transformation.new()
        ###
        @msg<<'. '; Sketchup.set_status_text(@msg)
        @ents.find_all{|e|next unless e.valid?; e.class==Sketchup::Image}.each{|ci| self.export_image(ci, @tr) }
        @msg<<'. '; Sketchup.set_status_text(@msg)
	    @ents.find_all{|e|next unless e.valid?; e.class==Sketchup::Group}.each{|gp| self.export_group(gp, @tr) }
        @msg<<'. '; Sketchup.set_status_text(@msg)
	    @ents.find_all{|e|next unless e.valid?; e.class==Sketchup::ComponentInstance}.each{|ci| self.export_component_instance(ci, @tr) }
		###
	end
    
    def flattenUVQ(uvq) ### Get UV coordinates from UVQ matrix.
	  return Geom::Point3d.new(uvq.x / uvq.z, uvq.y / uvq.z, 1.0)
    end

	def export_group(gp, tr=nil, mat=nil)
		return if gp.hidden? or not gp.layer.visible?
        gp.make_unique if gp.entities.parent.instances[1]
        gp.locked=false
        tc=gp.transformation
        ###
        tca=tc.to_a
        ssx=tca[0].to_s
        ssy=tca[5].to_s
        ssz=tca[10].to_s
        if ssx=="-0.0"
          tca[0]= -0.000000001
        end
        if ssy=="-0.0"
          tca[5]= -0.000000001
        end
        if ssz=="-0.0"
          tca[10]= -0.000000001
        end
        tc=Geom::Transformation.new(tca)
        ###
        ot=tc
		ot=tr*tc if tr!=nil
        sx=ot.to_a[0]
        sy=ot.to_a[5]
        sz=ot.to_a[10]
        if sx>0 and sy>0 and sz>0
          flipped=false
        elsif sx<0 and sy<0 and sz<0
          flipped=true
        elsif sx<0 and sy>=0 and sz>0
          flipped=true
        elsif sx<0 and sy>0 and sz>=0
          flipped=true
        elsif sx>=0 and sy<0 and sz>0
          flipped=true
        elsif sx>0 and sy<0 and sz>=0
          flipped=true
        elsif sx>=0 and sy>0 and sz<0
          flipped=true
        elsif sx>0 and sy>=0 and sz<0
          flipped=true
        else
          flipped=false
        end
        texture_writer=Sketchup.create_texture_writer
        if flipped
          faces=gp.entities.find_all{|e|e.class==Sketchup::Face}
          faces.each{|face|
            if not face.material or face.material.texture==nil
              face.back_material=face.material
              face.reverse!
            else
              samples = []
              samples << face.vertices[0].position			   ### 0,0 | Origin
		      samples << samples[0].offset(face.normal.axes.x) ### 1,0 | Offset Origin in X
	  	      samples << samples[0].offset(face.normal.axes.y) ### 0,1 | Offset Origin in Y
		      samples << samples[1].offset(face.normal.axes.y) ### 1,1 | Offset X in Y
		      xyz= []
              uv = []### Arrays containing 3D and UV points.
		      uvh = face.get_UVHelper(true, true, texture_writer)
		      samples.each { |position|
			    xyz << position ### XYZ 3D coordinates
			    uvq = uvh.get_front_UVQ(position) ### UV 2D coordinates
			    uv << self.flattenUVQ(uvq)
		      }
		      pts = [] ### Position texture.
		      (0..3).each { |i|
			     pts << xyz[i]
			     pts << uv[i]
		      }
              mat=face.material
              face.position_material(mat, pts, false)
              face.reverse!
              face.position_material(mat, pts, true)
            end#if face
          }
        end
        defmat=mat
		defmat=gp.material if gp.material
		@used_materials << defmat
		name=gp.entityID.to_s
        name=gp.name+"-"+name unless gp.name.empty?
		name.gsub!(/[^0-9A-Za-z_-]/, "_")
		objname=@title+"-GRP-"+name
		objname=@title
        @msg<<'. '; Sketchup.set_status_text(@msg)
		if gp.entities.find{|e|e.class==Sketchup::Face}
		  self.export_faces(gp.entities.find_all{|e|e.class==Sketchup::Face}, objname, ot, defmat)
        end
        gp.entities.find_all{|e|next unless e.valid?; e.class==Sketchup::Image}.each{|f| self.export_image(f, ot) }
		gp.entities.find_all{|e|next unless e.valid?; e.class==Sketchup::Group}.each{|f| self.export_group(f, ot, defmat) }
	    gp.entities.find_all{|e|next unless e.valid?; e.class==Sketchup::ComponentInstance}.each{|f| self.export_component_instance(f, ot, defmat) }
	end
     
	def export_component_instance(ci, tr=nil, mat=nil)
		return if ci.hidden? or not ci.layer.visible?
        ci.locked=false
        tc=ci.transformation
        ###
        tca=tc.to_a
        ssx=tca[0].to_s
        ssy=tca[5].to_s
        ssz=tca[10].to_s
        if ssx=="-0.0"
          tca[0]= -0.000000001
        end
        if ssy=="-0.0"
          tca[5]= -0.000000001
        end
        if ssz=="-0.0"
          tca[10]= -0.000000001
        end
        tc=Geom::Transformation.new(tca)
        ###
        ot=tc
		ot=tr*tc if tr!=nil
        sx=ot.to_a[0]
        sy=ot.to_a[5]
        sz=ot.to_a[10]
        if sx>0 and sy>0 and sz>0
          flipped=false
        elsif sx<0 and sy<0 and sz<0
          flipped=true
        elsif sx<0 and sy>=0 and sz>0
          flipped=true
        elsif sx<0 and sy>0 and sz>=0
          flipped=true
        elsif sx>=0 and sy<0 and sz>0
          flipped=true
        elsif sx>0 and sy<0 and sz>=0
          flipped=true
        elsif sx>=0 and sy>0 and sz<0
          flipped=true
        elsif sx>0 and sy>=0 and sz<0
          flipped=true
        else
          flipped=false
        end
        texture_writer=Sketchup.create_texture_writer
        if flipped
          ci.make_unique if ci.definition.instances[1]
          faces=ci.definition.entities.find_all{|e|e.class==Sketchup::Face}
          faces.each{|face|
            if not face.material or face.material.texture==nil
              face.back_material=face.material
              face.reverse!
            else
              samples = []
              samples << face.vertices[0].position			   ### 0,0 | Origin
		      samples << samples[0].offset(face.normal.axes.x) ### 1,0 | Offset Origin in X
	  	      samples << samples[0].offset(face.normal.axes.y) ### 0,1 | Offset Origin in Y
		      samples << samples[1].offset(face.normal.axes.y) ### 1,1 | Offset X in Y
		      xyz= []
              uv = []### Arrays containing 3D and UV points.
		      uvh = face.get_UVHelper(true, true, texture_writer)
		      samples.each { |position|
			    xyz << position ### XYZ 3D coordinates
			    uvq = uvh.get_front_UVQ(position) ### UV 2D coordinates
			    uv << self.flattenUVQ(uvq)
		      }
		      pts = [] ### Position texture.
		      (0..3).each { |i|
			     pts << xyz[i]
			     pts << uv[i]
		      }
              mat=face.material
              face.position_material(mat, pts, false)
              face.reverse!
              face.position_material(mat, pts, true)
            end#if face
          }
        end
        defmat=mat
		defmat=ci.material if ci.material
		@used_materials << defmat
		name=ci.definition.name
		name=name+"-"+ci.entityID.to_s
		name.gsub!(/[^0-9A-Za-z_-]/, "_")
		objname=@title+"-COM-"+name
        ###
        @msg<<'. '; Sketchup.set_status_text(@msg)
		if ci.definition.entities.find{|e| e.class==Sketchup::Face }
			self.export_faces(ci.definition.entities.find_all{|e|e.class==Sketchup::Face}, objname, ot, defmat)
		end
		(ci.definition.entities.find_all{|e| e.class==Sketchup::Image}).each{|f| self.export_image(f, ot) }
        (ci.definition.entities.find_all{|e| e.class==Sketchup::Group}).each{|f| self.export_group(f, ot, defmat) }
	    (ci.definition.entities.find_all{|e| e.class==Sketchup::ComponentInstance}).each{|f| self.export_component_instance(f, ot, defmat) }
	end
    
    def export_image(img, tr=nil)
		return if img.hidden? or not img.layer.visible?
        defn=img.definition
        return if not defn
        face=nil
        defn.entities.each{|e|
          if e.class==Sketchup::Face
            face=e
            break
          end#if
        }
        return if not face
        tc=img.transformation
        ###
        tca=tc.to_a
        ssx=tca[0].to_s
        ssy=tca[5].to_s
        ssz=tca[10].to_s
        if ssx=="-0.0"
          tca[0]= -0.000000001
        end
        if ssy=="-0.0"
          tca[5]= -0.000000001
        end
        if ssz=="-0.0"
          tca[10]= -0.000000001
        end
        tc=Geom::Transformation.new(tca)
        ###
        ot=tc
		ot=tr*tc if tr!=nil
		defmat=face.material
		@used_materials << defmat
		name=img.entityID.to_s
		name.gsub!(/[^0-9A-Za-z_-]/, "_")
		objname=@title+"-IMG-"+name
        self.export_faces([face], objname, ot, defmat)
        ###
	end

	def export_faces(all_faces=[], objname="", tr=nil, defmat=nil)
        tr=Geom::Transformation.new() if tr==nil
        @msg<<'.'; Sketchup.set_status_text(@msg)### do it by material per object
		@all_mats.each{|mat|
			faces=all_faces.find_all{|face|face.material==mat}
			next if not faces[0]
            all_faces=all_faces-faces
            @used_materials << mat
            vs=[]
			nos=[]
			uvs=[]
			meshes=[]
			faces.each{|face|
				next if face.hidden? or not face.layer.visible?
                next if self.distorted?(face, objname, tr)
				mesh=face.mesh(5)###7=backs too
				next if not mesh
                f_uvs=(1..mesh.count_points).map{|i|mesh.uv_at(i,1)}####1=front
                f_vs=[]
                f_vs=(1..mesh.count_points).map{|i|mesh.points[i-1]}
				f_nos=[]
                f_nos=(1..mesh.count_points).map{|i|mesh.normal_at(i)}
                f_vcount=1; f_vcount=vs.length + 1 if vs[0]
				meshes.concat(mesh.polygons.map{|p| [p.map{|px|(f_vs.index(mesh.points[(px.abs-1)]) + f_vcount)}] })
                if f_vs
                  vs.concat(f_vs)
                end
                if f_uvs
                  uvs.concat(f_uvs)
                end
                if f_nos
                  nos.concat(f_nos)
                end
			}#faces.each
			@meshes=meshes
			@nos=nos
            @vs=vs
			@uvs=uvs
            defn=faces[0].parent
            if not mat
              mat=defmat
              if defn != @model and defmat and defmat.texture
                ### re-map - it's on an Instance/Group 
                tgp=@model.active_entities.add_group()### we make exploded copy of it and map textures...
                tents=tgp.entities
                inst=tents.add_instance(defn, Geom::Transformation.new())
                inst.explode
                tents.to_a.each{|e|e.erase! if e.class==Sketchup::Face and e.material}
                tents.to_a.each{|e|e.material=mat if e.class==Sketchup::Face}
                self.export_faces(tents.find_all{|e|e.class==Sketchup::Face}, objname, tr, nil)
                tgp.erase!
              else
                self.export_obj_file(objname, tr, mat)
              end#if
            else
			  self.export_obj_file(objname, tr, mat)
            end#if
		}#@mats.each
        ###
        self.process_distorted() if @distorted
		###
	end
	  
    def distorted?(face=nil, objname="", tr=nil) ### check for distortion
        return false if not face
        mat=face.material
        return false if not mat
        texture=mat.texture
        return false if not texture
        mesh=face.mesh(5)###7=backs too
        uvs=[]
        f_uvs=(1..mesh.count_points).map{|i|mesh.uv_at(i, 1)}####1=front
        uvs.concat(f_uvs) if f_uvs
        disto=false
        uvs.each{|uvq| disto=true if ((uvq.z.to_f)*1000).round != 1000 }
        @distorted << [face, objname, tr, mat] if disto
        return disto
    end#distorted?
    
    def process_distorted()
        @msg<<'.'; Sketchup.set_status_text(@msg)
        @distorted.each{|a|
          face=a[0]
          objname=a[1]
          tr=a[2]
          mat=a[3]
          next if not face or not mat
          mesh=face.mesh(5)###7=backs too
		  next if not mesh
          vs=[]
		  nos=[]
		  uvs=[]
		  meshes=[]
          f_uvs=(1..mesh.count_points).map{|i|mesh.uv_at(i, 1)}####1=front
          f_vs=[]
          f_vs=(1..mesh.count_points).map{|i|mesh.points[i-1]}
          f_nos=[]
          f_nos=(1..mesh.count_points).map{|i|mesh.normal_at(i)}
          f_vcount=1; f_vcount=vs.length + 1 if vs[0]
          meshes.concat(mesh.polygons.map{|p| [p.map{|px|(f_vs.index(mesh.points[(px.abs-1)]) + f_vcount)}] })
          ###
          vs.concat(f_vs) if f_vs
          uvs.concat(f_uvs) if f_uvs
         if uvs
          i=0; uvs.each{
            next if not uvs[i]
            j=i
            while j > 3
              j=j-4
            end
            uvs[i].z=1
            if j==0
              uvs[i].x= 1
              uvs[i].y= 1
            elsif j==1
              uvs[i].x= 0
              uvs[i].y= 0
            elsif j==2
              uvs[i].x= 1
              uvs[i].y= 0
            else
              uvs[i].x= 0
              uvs[i].y= 1
            end#if
            i+=1
          } if (vs[0].z >= vs[1].z and vs[0].z >= vs[2].z) or (vs[0].z <= vs[1].z and vs[0].z <= vs[2].z)
          i=0; uvs.each{
            next if not uvs[i]
            j=i
            while j > 3
              j=j-4
            end
            uvs[i].z=1
            if j==0
              uvs[i].x= 0
              uvs[i].y= 1
            elsif j==1
              uvs[i].x= 1
              uvs[i].y= 0
            elsif j==2
              uvs[i].x= 1
              uvs[i].y= 1
            else
              uvs[i].x= 0
              uvs[i].y= 0
            end#if
            i+=1
          } if (vs[0].z >= vs[1].z and vs[0].z <= vs[2].z)
          i=0; uvs.each{
            next if not uvs[i]
            j=i
            while j > 3
              j=j-4
            end
            uvs[i].z=1
            if j==0
              uvs[i].x= 1
              uvs[i].y= 0
            elsif j==1
              uvs[i].x= 0
              uvs[i].y= 1
            elsif j==2
              uvs[i].x= 0
              uvs[i].y= 0
            else
              uvs[i].x= 1
              uvs[i].y= 1
            end#if
            i+=1
          } if (vs[0].z <= vs[1].z and vs[0].z >= vs[2].z)
         end#if
          nos.concat(f_nos) if f_nos
          @vs=vs
		  @nos=nos
          @uvs=uvs
          @meshes=meshes
          dmatname = self.export_distorted_obj(objname, tr, mat)
          gp=@model.active_entities.add_group(face) ### to stop deletion
          face=nil
          gp.entities.each{|e|
            if e.class==Sketchup::Face
              face=e
              break
            end
          }
          gp.hidden=true
          @dmats << [face, mat, dmatname]
        }#end distorted.each
        @distorted=[]
    end#process_distorted

	def export_obj_file(objname="", tr=nil, mat=nil)
		ot=Geom::Transformation.new()
		ot=tr if tr!=nil
        if mat
		  mat_name=""
          (@mats+@imgs).each{|ar|
            (mat_name=ar[1]; break) if ar[0]==mat
          }
        else
          mat_name="Default_Material"
		end
		return if not @meshes
		objname=objname.gsub(/ /, '_').gsub(/[^0-9A-Za-z_-]/, '')
		if @meshes.length != 0 and @vs.length != 0
            ###
			@obj_file.puts("g #{objname}-#{mat_name}")
		    @obj_file.puts("usemtl #{mat_name}")
            ###
			kv=[]
			kvt=[]
			kvn=[]
			@vs.each{|v|
				v=ot * v
				xx=v.x
				yy=v.z
				zz=-v.y
				xx=0 if xx==-0
				yy=0 if yy==-0
				zz=0 if zz==-0
				newv="v #{"%.12g" % (xx.to_m.to_f)} #{"%.12g" % (yy.to_m.to_f)} #{"%.12g" % (zz.to_m.to_f)}"
				i=@used_vs.length
				unless @used_vs[newv]
					@used_vs[newv]=i+1
					@obj_file.puts(newv)
				end
				kv << @used_vs[newv]
			}
			@uvs.each{|uv|
				newvt="vt #{"%.12g" % (uv.x)} #{"%.12g" % (uv.y)}"
				i=@used_vts.length
				unless @used_vts[newvt]
					@used_vts[newvt]=i+1
					@obj_file.puts(newvt)
				end
				kvt << @used_vts[newvt]
			}
			@nos.each{|vnor|
				nor=ot * vnor
				nor.normalize!
				xx=nor.x
				yy=nor.z
				zz=-nor.y
				xx=0 if xx==-0
				yy=0 if yy==-0
				zz=0 if zz==-0
				newvn="vn #{"%.12g" % (xx)} #{"%.12g" % (yy)} #{"%.12g" % (zz)}"
				i=@used_vns.length
				unless @used_vns[newvn]
					@used_vns[newvn]=i+1
					@obj_file.puts(newvn)
				end
				kvn << @used_vns[newvn]
			}
			###
			@meshes.each{|mesh|
				f_str="f"
				mesh.each{|pg|
					pg.each{|i|
						kvv=kv[i-1]
						kvtt=kvt[i-1]
						kvnn=kvn[i-1]
						f_str << " #{kvv}/#{kvtt}/#{kvnn}"
					}
					@obj_file.puts(f_str)
				}
			}
			###
			@obj_file.puts
			###
		end
		@meshes=nil
		@uvs=nil
		@nos=nil
		@vs=nil
	end
    
    def export_distorted_obj(objname="", tr=nil, mat=nil)
        @msg<<'.'; Sketchup.set_status_text(@msg)
		ot=Geom::Transformation.new()
		ot=tr if tr!=nil
        if mat
			mat_name=mat.display_name.gsub(/ /, '_').gsub(/[^0-9A-Za-z_-]/, '')
            saved_name=File.basename(mat_name)
			saved_name_uniq=self.make_name_unique(@saved_names, saved_name)
			@saved_names << saved_name_uniq
            matname=saved_name_uniq # we always uniquify distorts
        else
            matname="Default_Material" ### should never happen !
		end
		return if not @meshes
		objname=objname.gsub(/ /, '_').gsub(/[^0-9A-Za-z_-]/, '')
		if @vs.length != 0
			@obj_file.puts("g #{objname}-#{matname}")
			@obj_file.puts("usemtl #{matname}")
			###
		    kv=[]
			kvt=[]
			kvn=[]
			@vs.each{|v|
				v=ot * v
				xx=v.x
				yy=v.z
				zz=-v.y
				xx=0 if xx==-0
				yy=0 if yy==-0
				zz=0 if zz==-0
				newv="v #{"%.12g" % (xx.to_m.to_f)} #{"%.12g" % (yy.to_m.to_f)} #{"%.12g" % (zz.to_m.to_f)}"
				i=@used_vs.length
				unless @used_vs[newv]
					@used_vs[newv]=i+1
					@obj_file.puts(newv)
				end
				kv << @used_vs[newv]
			}
			@uvs.each{|uv|
				newvt="vt #{"%.12g" % (uv.x)} #{"%.12g" % (uv.y)}"
				i=@used_vts.length
				unless @used_vts[newvt]
					@used_vts[newvt]=i+1
					@obj_file.puts(newvt)
				end
				kvt << @used_vts[newvt]
			}
			@nos.each{|vnor|
				nor=ot * vnor
				nor.normalize!
				xx=nor.x
				yy=nor.z
				zz=-nor.y
				xx=0 if xx==-0
				yy=0 if yy==-0
				zz=0 if zz==-0
				newvn="vn #{"%.12g" % (xx)} #{"%.12g" % (yy)} #{"%.12g" % (zz)}"
				i=@used_vns.length
				unless @used_vns[newvn]
					@used_vns[newvn]=i+1
					@obj_file.puts(newvn)
				end
				kvn << @used_vns[newvn]
			}
			###
			@meshes.each{|mesh|
				f_str="f"
				mesh.each{|pg|
					pg.each{|i|
						kvv=kv[i-1]
						kvtt=kvt[i-1]
						kvnn=kvn[i-1]
						f_str << " #{kvv}/#{kvtt}/#{kvnn}"
					}
					@obj_file.puts(f_str)
				}
			}
			###
			@obj_file.puts
			###
		end
		@meshes=nil
		@uvs=nil
		@nos=nil
		@vs=nil
        return matname
	end
    
	def make_texture_folder()
        begin
          Dir.mkdir(@textures_path) if not File.exist?(@textures_path)
        rescue
          UI.messagebox(@textures_path+" ??")
        end
	end
    
	def export_textures()
        txtr=false
        @used_materials.compact.uniq.each{|mat|
          if mat.texture
            txtr=true
            break
          end
        }
        return unless txtr
		self.make_texture_folder()
		temp_group=@model.active_entities.add_group()
        tw=Sketchup.create_texture_writer
        @all_mats.each{|mat|
            next if not mat
            next if not @used_materials.include?(mat)
			if mat.texture 
                @msg<<'.'; Sketchup.set_status_text(@msg)
				temp_group.material=mat
                mat_texture_file=mat.texture.filename.tr("\\", "/")
                if @png
                  texture_extn='.PNG'
                else
                  texture_extn=File.extname(mat_texture_file)
				  texture_extn='.PNG' if texture_extn.empty?
				  itypes=['.png','.jpg','.bmp','.tif','.psd','.tga']
				  texture_extn='.PNG' unless itypes.include?(texture_extn.downcase)
                end#if
                mat_name="";(@mats+@imgs).each{|ar|(mat_name=ar[1];break) if ar[0]==mat}
                mat_texture_name=mat_name+texture_extn
                tpath=File.join(@textures_path, mat_texture_name)
                tw.load(temp_group)
                tw.write(temp_group, tpath)
			end#if
		}#end.each
		temp_group.erase! if temp_group.valid?
	end

	def export_mtl_material()
        @msg<<'.'
        Sketchup.set_status_text(@msg)
        ffcol=@model.rendering_options["FaceFrontColor"]
		mtl_file=File.new(@mtl_file,"w")
        mtl_file.puts("# Alias Wavefront MTL File Exported from SketchUp")
        mtl_file.puts("# with OBJexporter (c) 2013 TIG")
        mtl_file.puts("# Made for '"+@obj_name+"'")
        mtl_file.puts
		mtl_file.puts("newmtl Default_Material")
		mtl_file.puts("Ka " + ffcol.to_a[0..2].collect{|c| "%.6g" % ((c.to_f/255)) }.join(" "))
		mtl_file.puts("Kd " + ffcol.to_a[0..2].collect{|c| "%.6g" % ((c.to_f/255)) }.join(" "))
		mtl_file.puts("Ks 0.333 0.333 0.333")
        mtl_file.puts("Ns 0")
        mtl_file.puts("d 1")
        mtl_file.puts("Tr 1")
		mtl_file.puts
        saved_names=[]
		@used_materials.uniq!
		@used_materials.each{|mat|
			next if not mat
            @msg<<'.'; Sketchup.set_status_text(@msg)
            matname="";(@mats+@imgs).each{|ar|(matname=ar[1];break) if ar[0]==mat}
			if mat and mat.texture
                if @png
                  texture_extn='.PNG'
                else
                  texture_extn=File.extname(mat.texture.filename)
				  texture_extn='.PNG' if texture_extn.empty?
				  itypes=['.png','.jpg','.bmp','.tif','.psd','.tga']
				  texture_extn='.PNG' unless itypes.include?(texture_extn.downcase)
                end#if
				texture_path=File.join(@textures_name, matname + texture_extn)
			end
			mtl_file.puts("newmtl #{matname}")
			if not mat.use_alpha?
                mtl_file.puts("Ka " + mat.color.to_a[0..2].collect{|c| "%.6g" % ((c.to_f/255)) }.join(" "))
				mtl_file.puts("Kd " + mat.color.to_a[0..2].collect{|c| "%.6g" % ((c.to_f/255)) }.join(" "))
				mtl_file.puts("Ks 0.333 0.333 0.333")
                mtl_file.puts("Ns 0")
				mtl_file.puts("d 1")
				mtl_file.puts("Tr 1")
				mtl_file.puts("map_Kd #{texture_path}") if texture_path
			else ### it's transparent
                mtl_file.puts("Ka " + mat.color.to_a[0..2].collect{|c| "%.6g" % ((c.to_f/255)) }.join(" "))
				mtl_file.puts("Kd " + mat.color.to_a[0..2].collect{|c| "%.6g" % ((c.to_f/255)) }.join(" "))
				mtl_file.puts("Ks 0.333 0.333 0.333")
                mtl_file.puts("Ns 0")
				mtl_file.puts("d #{"%.3g" % mat.alpha }")
				mtl_file.puts("Tr #{"%.3g" % mat.alpha }")
				mtl_file.puts("map_Kd #{texture_path}") if texture_path
			end#if
            mtl_file.puts
		}
        ### do any distorts
        self.distorted_mtl(mtl_file) if @dmats[0]
        ###
		mtl_file.puts("#EOF")
        ###
		mtl_file.flush
		mtl_file.close
	end
    
    def distorted_mtl(mtl_file)
        ###
        mtl_file.puts("#Distorted-Textures\n")
        ###
        @dmats.each{|ar|
            @msg<<'.'
            Sketchup.set_status_text(@msg)
            face=ar[0]
            mat=ar[1]
            matname=ar[2]
			if mat and mat.texture
                if @png
                  texture_extn='.PNG'
                else
                  texture_extn=File.extname(mat.texture.filename)
				  texture_extn='.PNG' if texture_extn.empty?
				  itypes=['.png','.jpg','.bmp','.tif','.psd','.tga']
				  texture_extn='.PNG' unless itypes.include?(texture_extn.downcase)
                end#if
				texture_path=File.join(@textures_name, matname + texture_extn)
			end
			mtl_file.puts("newmtl #{matname}")
			if not mat.use_alpha?
				mtl_file.puts("Ka " + mat.color.to_a[0..2].collect{|c| "%.6g" % ((c.to_f/255)) }.join(" "))
				mtl_file.puts("Kd " + mat.color.to_a[0..2].collect{|c| "%.6g" % ((c.to_f/255)) }.join(" "))
				mtl_file.puts("Ks 0.333 0.333 0.333")
                mtl_file.puts("Ns 0")
				mtl_file.puts("d 1")
				mtl_file.puts("Tr 1")
				mtl_file.puts("map_Kd #{texture_path}") if texture_path
			else ### it's transparent
				mtl_file.puts("Ka " + mat.color.to_a[0..2].collect{|c| "%.6g" % ((c.to_f/255)) }.join(" "))
				mtl_file.puts("Kd " + mat.color.to_a[0..2].collect{|c| "%.6g" % ((c.to_f/255)) }.join(" "))
				mtl_file.puts("Ks 0.333 0.333 0.333")
                mtl_file.puts("Ns 0")
				mtl_file.puts("d #{"%.3g" % mat.alpha }")
				mtl_file.puts("Tr #{"%.3g" % mat.alpha }")
				mtl_file.puts("map_Kd #{texture_path}") if texture_path
			end#if
            mtl_file.puts
            ###
            self.export_distorted_texture(face, texture_path)
            ###
        }
    end#distorted_mtl
    
    def export_distorted_texture(face, texture_path)
        tpath=File.join(@project_path, texture_path)
        tw=Sketchup.create_texture_writer
        tw.load(face, true)
        tw.write(face, true, tpath)
    end#export_distorted_texture
    
	def make_name_unique(saved_names=[], saved_name="")
		if saved_names.include?(saved_name)
			counter=1
			while counter < 10000
				new_name=File.basename(saved_name, ".*") + counter.to_s + File.extname(saved_name)
				return new_name if not saved_names.include?(new_name)
				counter+=1
			end
		end
		return saved_name
	end
############## end of exporter code #########################

end#class OBJexporter ##########################################################
###

def export_by_layer

  model=Sketchup.active_model
  entities=model.active_entities
  defns=model.definitions
  clayer=model.active_layer
  model.active_layer=nil
  dlayer=model.active_layer
  model.active_layer=clayer
  layers=model.layers
  ###layers=layers.to_a-[dlayer]###ignore default layer
  modelpath=File.dirname(model.path)
  modeltitle=model.title
  
  if modelpath==""
    puts "Model has not been saved..."
    return nil
  end#if
  
  count=0
  layers.each{|layer|
	if layer.name !="Layer0"
		model.active_layer = layer

		model.start_operation("Export by Layer")
		entities.each{|e|
		  if e.layer !=layer
			  #e.erase!
			  e.hidden = true
		  end#if
		}
		
		layername=layer.name.gsub(/[^_a-zA-Z0-9]/,'_')
		
		#model.export(modelpath+"/"+modeltitle+"__Layer_"+layername+"."+type,false)### exporter
		OBJexporter.new
		
		count+=1
		model.commit_operation
		Sketchup.undo ### undeletes stuff ?
	end#if
	}#end layer
	
	
  #puts count.to_s+" files exported by layer
  
end#def

UI.menu("Plugins").add_item("export_by_layer") { export_by_layer()}