(function($){LOVEFiLM.widget.define('auto-complete',{init:function($el,opts){this.superApply('init',arguments);var self=this;self.initDefaults();self.initElements();},autoComplete:function(searchTerm){var self=this,catalogQuery='',JSONurl,results;if(searchTerm.length>=self.minSearchChars&&searchTerm.length<=self.maxSearchChars){if(self.$catSelect.length){catalogQuery=self.$catSelect
.find('option:selected')
.attr('data-type')
.replace(/\t/g,'')
.replace(/\n/g,'');catalogQuery='&category='+encodeURIComponent(catalogQuery);}
if(self.$loadingIcon.length){self.$loadingIcon.stop().fadeIn(self.speed.loading);}
JSONurl='/ajax/autocomplete.html?term='+encodeURIComponent(searchTerm)+catalogQuery;results=$.getJSON(JSONurl,function(data){self.buildSuggestions(data);});}else{self.closeSuggestions();}},buildSuggestions:function(data){var self=this,$results,resultsHeight;if(self.$loadingIcon.length){self.$loadingIcon.stop().fadeOut(self.speed.loading);}
if(data&&data.items&&data.items.length){if(window.hidePlayer){hidePlayer();}
$results=$('<ul/>');var limit=(data.items.length<self.maxResults)?data.items.length:self.maxResults;for(var i=0;i<limit;i++){$results.append(self.buildSuggestionItem(data.items[i],data.keyword));}
self.$resultsList
.empty()
.append($results);self.positionResults();resultsHeight=self.$resultsList
.css({display:'block',height:'auto'}).height();self.$resultsList
.css({opacity:0,height:0})
.animate({opacity:1,height:resultsHeight});self.menuOpen=1;}else{self.closeSuggestions();}},buildSuggestionItem:function(suggestion,searchTerm){var self=this,selectedCategory=$.trim($('option:selected',self.$catSelect).text()),$format,$link=$('<a/>'),$suggestion=$('<li/>');$link
.attr({'data-auto_complete_keyword':suggestion.name,'data-auto_complete_filter':selectedCategory,'data-track_activity':'AUTO_COMPLETE','href':suggestion.url})
.addClass(suggestion.type)
.html(suggestion.name.replace(new RegExp('('+searchTerm+')',"gi"),'<strong>$1</strong>'));if(suggestion.format!==undefined&&suggestion.type==='g'){$format=$('<span/>')
.addClass('has_format')
.html(suggestion.format);$link
.append(' (')
.append($format)
.append(')');}
$suggestion.append($link);return $suggestion;},positionResults:function(){var self=this;self.$resultsList.css({left:self.$searchInput.position().left,width:self.$searchInput.outerWidth()-6});},submitSelection:function($link){var self=this,url;self.useExactMatch=($link.closest('li').siblings().length<=self.maxMatchesForExact)?1:0;if(self.useExactMatch){url=$link.attr('href');window.location=url;}else{self.$searchInput.val($link.text());self.$searchForm.submit();}},nextSelection:function(){var self=this;self.hoverItem++;self.updateSelection();},prevSelection:function(){var self=this;self.hoverItem--;self.updateSelection();},updateSelection:function(){var self=this,$listLinks=$('a',self.$resultsList),linkCount=$listLinks.length;if(self.hoverItem<0){self.hoverItem=linkCount-1;}else if(self.hoverItem>=linkCount||self.hoverItem===undefined){self.hoverItem=0;}
$listLinks
.removeClass('hover')
.filter(':eq('+self.hoverItem+')')
.addClass('hover');},closeSuggestions:function(){var self=this;if(self.menuOpen){self.$resultsList
.stop()
.animate({opacity:0,height:0},self.speed.results);if(window.showPlayer){showPlayer();}
if(self.$loadingIcon.length){self.$loadingIcon.stop().fadeOut(self.speed.loading);}
self.menuOpen=0;self.hoverItem=-1;}},resizeForm:function(){var self=this,width={searchForm:self.$searchForm.outerWidth(),submit:self.$submit.outerWidth(),categoryWrapper:self.$categoryWrapper.outerWidth(),inputPadding:parseInt(self.$searchInput.css('padding-left'))*2},newWidth=width.searchForm-width.submit-width.categoryWrapper-width.inputPadding;self.$catSelect.blur();self.$searchInput.css({width:newWidth});},trackAutoComplete:function($link){var trackdata=LOVEFiLM.Tracking.gatherTrackingData($link);LOVEFiLM.Tracking.trackActivity(trackdata.track_activity,trackdata);},initDefaults:function(){var self=this;self.minSearchChars=3;self.maxSearchChars=100;self.maxResults=10;self.speedUpAfterChars=20;self.maxMatchesForExact=3;self.menuOpen=0;self.hoverItem=-1;self.useExactMatch=0;self.speed={autoComplete:400,loading:150,results:250};self.currentTerm='';},initElements:function(){var self=this;self.$searchForm=$('form.site-search',self.$el);self.$catSelect=$('select.lf-search-select',self.$el);self.$resultsList=$('div.lf-auto-complete-results',self.$el);self.$searchInput=$('input.lf-search-keywords',self.$el);self.$submit=$('input.btn',self.$el);if(self.$catSelect.length){self.enhanceCategorySelect();}
if(!self.$resultsList.length){$('div.lfautoComplete',self.$el);}
if(self.$searchInput.attr('autocomplete-enabled').toLowerCase()=='y'){self.initLoadingIcon();self.bindEvents();}},enhanceCategorySelect:function(){var self=this,catSelectStyle={hover:'category-select-hover',focus:'category-select-focus'};self.$catSelectEnhanced=$('div.search-category',self.$el);self.$categoryWrapper=$('div.search-category-wrapper',self.$el);self.$catSelect
.hover(function(){self.$categoryWrapper.addClass(catSelectStyle.hover);},function(){self.$categoryWrapper.removeClass(catSelectStyle.hover);})
.focus(function(){self.$categoryWrapper.addClass(catSelectStyle.focus);})
.blur(function(){self.$categoryWrapper.removeClass(catSelectStyle.focus);})
.change(function(){var selectedCategory=$('option:selected',self.$catSelect).text();self.$catSelectEnhanced.text(selectedCategory);self.$searchInput.focus();self.resizeForm();self.positionResults();self.closeSuggestions();self.autoComplete(self.$searchInput.val());});self.$searchInput
.focus(function(){self.$categoryWrapper.addClass(catSelectStyle.hover);}).blur(function(){self.$categoryWrapper.removeClass(catSelectStyle.hover);});self.resizeForm();},initLoadingIcon:function(){var self=this;self.$loadingIcon=$('<div/>')
.addClass('loading-icon')
.css({right:self.$submit.outerWidth()+9})
.hide()
.appendTo(self.$searchForm);},bindEvents:function(){var self=this;$(document).click(function(){self.closeSuggestions();});self.$searchForm
.click(function(e){e.stopPropagation();})
.submit(function(){self.closeSuggestions();});if(!self.useExactMatch){self.$resultsList.delegate('ul li a','click',function(e){self.trackAutoComplete($(this));e.preventDefault();});}
self.$resultsList
.delegate('a','click',function(){self.submitSelection($(this))})
.delegate('a','hover',function(){$('a.hover',self.$resultsList).removeClass('hover');$(this).addClass('hover');});self.$searchInput.keyup(function(e){clearTimeout(self.timeout);switch(e.keyCode){case 38:e.preventDefault();self.prevSelection();break;case 40:e.preventDefault();self.nextSelection();break;case 13:var $selectedItem=$('a.hover',self.$resultsList);if($selectedItem.length){e.preventDefault();self.submitSelection($selectedItem);}
break;case 27:self.closeSuggestions();break;default:var newSpeed,searchTerm=self.$searchInput.val();if(searchTerm!==self.currentTerm){newSpeed=(searchTerm.length>=self.speedUpAfterChars)?self.speed.autoComplete:self.speed.autoComplete/2;if(searchTerm.length>=self.minSearchChars&&searchTerm.length<=self.maxSearchChars){self.timeout=window.setTimeout(function(){self.autoComplete(searchTerm);self.timeout=null;},newSpeed);}else{self.closeSuggestions();}}
self.currentTerm=searchTerm;break;}});}});})(jQuery);;