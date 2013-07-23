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
		
		@count_vs={}
		
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
		@obj_file.puts("# sketchup")
        
        @msg<<'. '; Sketchup.set_status_text(@msg)
		self.export_obj()
		
		tempPath=@obj_filepath
		tempName = @obj_name
		
        @obj_file.flush if @obj_file
		@obj_file.close if @obj_file
        ###
		
		oFile = File.open(tempPath)
		contents = ""
		oFile.each {|line|
			contents << line
		}
		
		tempName.slice!(".obj")
		txtName = tempName+".txt"
		txtFile = File.new(txtName, "w")
			txtFile.puts(contents)
		txtFile.close

      @model.abort_operation ##############################################
        
	end

	def export_obj()
        @img_mats=[]
		objname=@title+"-SKP"
        faces=@ents.find_all{|e|next unless e.valid?; e.class==Sketchup::Face}
	    if faces[0]
		    #self.export_faces(faces, objname)          
		end#if
        
        @tr=Geom::Transformation.new()
		@ot = Geom::Transformation.new()
		#@nt = Geom::Transformation.new()
		@vCount = 0

        # @ents.find_all{|e|next unless e.valid?; e.class==Sketchup::Image}.each{|ci| self.export_image(ci, @tr) }
	    @ents.find_all{|e|next unless e.valid?; e.class==Sketchup::Group}.each{|gp| self.export_group(gp, @tr) }
	    @ents.find_all{|e|next unless e.valid?; e.class==Sketchup::ComponentInstance}.each{|ci| self.export_component_instance(ci, @tr) }
		###
	end
    
    def flattenUVQ(uvq) ### Get UV coordinates from UVQ matrix.
	
    end

	def export_group(gp, tr=nil, mat=nil)
	
		################################get transformation and other data from parent group
		return if gp.hidden? or not gp.layer.visible?
        gp.make_unique if gp.entities.parent.instances[1]
        gp.locked=false
		################################## GET GROUP TRANSFORMATION
		tc = Geom::Transformation.new(gp.transformation)
		tca=tc.to_a
		tca.each{|t|
			if t.to_s == "-0.0"	
				t = t*-1
			end
		}
		ot=Geom::Transformation.new(tca)
		#@ot = nt
		#@nt = nt
		#@ot = @ot*@nt
		
		@ot = Geom::Transformation.new(ot)

        ################################## GET GROUP TRANSFORMATION
        defmat=mat
		defmat=gp.material if gp.material
		@used_materials << defmat
		name=gp.entityID.to_s
        name=gp.name+"-"+name unless gp.name.empty?
		name.gsub!(/[^0-9A-Za-z_-]/, "_")
		objname=@title+"-GRP-"+name
		objname=@title
        @msg<<'. '; Sketchup.set_status_text(@msg)
		################################get transformation and other data from parent group
		
		if gp.entities.find{|e|e.class==Sketchup::Face}
		  self.export_faces(gp.entities.find_all{|e|e.class==Sketchup::Face}, objname, ot, defmat)
        end
        #########gp.entities.find_all{|e|next unless e.valid?; e.class==Sketchup::Image}.each{|f| self.export_image(f, ot) }
		gp.entities.find_all{|e|next unless e.valid?; e.class==Sketchup::Group}.each{|f| self.export_group(f, ot, defmat) }
	    #gp.entities.find_all{|e|next unless e.valid?; e.class==Sketchup::ComponentInstance}.each{|f| self.export_component_instance(f, ot, defmat) }
	end
     
	def export_component_instance(ci, tr=nil, mat=nil)
		# return if ci.hidden? or not ci.layer.visible?
        # ci.locked=false
        # tc=ci.transformation
        ##
        # tca=tc.to_a
        # ssx=tca[0].to_s
        # ssy=tca[5].to_s
        # ssz=tca[10].to_s
        # if ssx=="-0.0"
          # tca[0]= -0.000000001
        # end
        # if ssy=="-0.0"
          # tca[5]= -0.000000001
        # end
        # if ssz=="-0.0"
          # tca[10]= -0.000000001
        # end
        # tc=Geom::Transformation.new(tca)
        ##
        # ot=tc
		# ot=tr*tc if tr!=nil
        # sx=ot.to_a[0]
        # sy=ot.to_a[5]
        # sz=ot.to_a[10]
        # if sx>0 and sy>0 and sz>0
          # flipped=false
        # elsif sx<0 and sy<0 and sz<0
          # flipped=true
        # elsif sx<0 and sy>=0 and sz>0
          # flipped=true
        # elsif sx<0 and sy>0 and sz>=0
          # flipped=true
        # elsif sx>=0 and sy<0 and sz>0
          # flipped=true
        # elsif sx>0 and sy<0 and sz>=0
          # flipped=true
        # elsif sx>=0 and sy>0 and sz<0
          # flipped=true
        # elsif sx>0 and sy>=0 and sz<0
          # flipped=true
        # else
          # flipped=false
        # end
        # texture_writer=Sketchup.create_texture_writer
        # if flipped
          # ci.make_unique if ci.definition.instances[1]
          # faces=ci.definition.entities.find_all{|e|e.class==Sketchup::Face}
          # faces.each{|face|
            # if not face.material or face.material.texture==nil
              # face.back_material=face.material
              # face.reverse!
            # else
              # samples = []
              # samples << face.vertices[0].position			   ### 0,0 | Origin
		      # samples << samples[0].offset(face.normal.axes.x) ### 1,0 | Offset Origin in X
	  	      # samples << samples[0].offset(face.normal.axes.y) ### 0,1 | Offset Origin in Y
		      # samples << samples[1].offset(face.normal.axes.y) ### 1,1 | Offset X in Y
		      # xyz= []
              # uv = []### Arrays containing 3D and UV points.
		      # uvh = face.get_UVHelper(true, true, texture_writer)
		      # samples.each { |position|
			    # xyz << position ### XYZ 3D coordinates
			    # uvq = uvh.get_front_UVQ(position) ### UV 2D coordinates
			    # uv << self.flattenUVQ(uvq)
		      # }
		      # pts = [] ### Position texture.
		      # (0..3).each { |i|
			     # pts << xyz[i]
			     # pts << uv[i]
		      # }
              # mat=face.material
              # face.position_material(mat, pts, false)
              # face.reverse!
              # face.position_material(mat, pts, true)
            # end#if face
          # }
        # end
		
        # defmat=mat
		# defmat=ci.material if ci.material
		# @used_materials << defmat
		# name=ci.definition.name
		# name=name+"-"+ci.entityID.to_s
		# name.gsub!(/[^0-9A-Za-z_-]/, "_")
		# objname=@title+"-COM-"+name
        ##
        # @msg<<'. '; Sketchup.set_status_text(@msg)
		# if ci.definition.entities.find{|e| e.class==Sketchup::Face }
			# self.export_faces(ci.definition.entities.find_all{|e|e.class==Sketchup::Face}, objname, ot, defmat)
		# end
		# (ci.definition.entities.find_all{|e| e.class==Sketchup::Image}).each{|f| self.export_image(f, ot) }
        # (ci.definition.entities.find_all{|e| e.class==Sketchup::Group}).each{|f| self.export_group(f, ot, defmat) }
	    # (ci.definition.entities.find_all{|e| e.class==Sketchup::ComponentInstance}).each{|f| self.export_component_instance(f, ot, defmat) }
	end
    
    def export_image(img, tr=nil)
		
	end

	def export_faces(all_faces=[], objname="", tr=nil, defmat=nil)
	
		fString = "f"
		transform = Geom::Transformation.new(@ot)
		
		
		# ot=Geom::Transformation.new()
		# ot=tr if tr!=nil
	    # tr=Geom::Transformation.new() if tr==nil
		
		##### loop through each material
		@all_mats.each{|mat| 

			faces=all_faces.find_all{|face|face.material==mat}
			
			if faces.length != 0
				all_faces=all_faces-faces
								
				@used_materials << mat
				###################################################
				@obj_file.puts("g #{mat.name}")
				###################################################
				vs=[]
				nos=[]
				uvs=[]
				meshes=[]
				loops=[]
				
				##### collect all vertices of faces with this material
				faces.each{|face|
					
					face
					fString = "f"
					@obj_file.puts("o #{objname}-#{mat.name}-#{rand(1000-0)}")
					###################################################
					loop = face.outer_loop
					loops = []
					edges = []
					vStart = []
					
					loops << face.outer_loop
					edges = face.edges
					
					loopVert = loop.vertices
					loopVert.each{|vL|

						##################################################################################
						pt3D = Geom::Point3d.new vL.position[0],vL.position[1],vL.position[2]
						pt3D.transform! transform
						##################################################################################
						
						xPos = pt3D[0].to_m.to_f
						yPos = pt3D[1].to_m.to_f 
						zPos = pt3D[2].to_m.to_f
						
						if xPos==-0
							xPos=0
						end
						if yPos==-0
							yPos=0
						end
						if zPos==-0
							zPos=0
						end
						#####write vertiex data to obj file
						@obj_file.puts"v #{xPos} #{yPos} #{zPos}"

						@vCount = @vCount+1
						fString << " "
						fString << @vCount.to_s
					}
					
					@obj_file.puts("#{fString}")
					
					###################################################
					
					vs=[]
					meshes=[]
					
					@loops=loops
					@meshes=meshes
					@nos=nos
					@vs=vs
					@uvs=uvs

					defn=faces[0].parent

					self.export_obj_file(objname, tr, mat)# NEW 
				
				}#faces.each
				
			end #if
			
		}#@mats.each
		
		# if @nt!= nil
			# @ot = @ot/@nt
		# end #if
		
	end
	  
    def distorted?(face=nil, objname="", tr=nil) ### check for distortion
      
    end
    
    def process_distorted()
        
    end

	def export_obj_file(objname="", tr=nil, mat=nil)
		# @loops=nil
		# @meshes=nil
		# @uvs=nil
		# @nos=nil
		# @vs=nil
	end
    
    def export_distorted_obj(objname="", tr=nil, mat=nil)
       
	end
    
	def make_texture_folder()

	end
    
	def export_textures()
        
	end

	def export_mtl_material()
      
	end
    
    def distorted_mtl(mtl_file)
      
    end
    
    def export_distorted_texture(face, texture_path)
       
    end
    
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
  exportLayerList=[]
  en_count=0
	
  if modelpath==""
    puts "Model has not been saved..."
    return nil
  end#if
  
  layers.each{|layer|
		if layer.name !="Layer0" and layer.visible? == true
			en_count=0
			entities.each{|en|
				en_count = en_count+1
			}
			if en_count != 0
				model.active_layer = layer
				model.start_operation("Export by Layer")
					entities.each{|e|
					  if e.layer !=layer
						e.hidden = true
					  end#if
					}				
					layername=layer.name.gsub(/[^_a-zA-Z0-9]/,'_')
					exportLayerList << layername
					OBJexporter.new
					Sketchup.undo 
				model.commit_operation
				exportLayerList.sort!
				outFile = File.new("loadLayers.txt", "w")
				#outFile.puts(en_count)
				outFile.puts(exportLayerList)
				outFile.close
			end
			
		end#if
	}#end layer
					



  
end#def

UI.menu("Plugins").add_item("WORKSHOP-OBJ-exportByLayer") { export_by_layer()}