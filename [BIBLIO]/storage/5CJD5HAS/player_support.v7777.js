<!--
function parentalControlRequired(){$('#parental_control_required').show();hidePlayer();$('#parental_control_required .closeBtn').click(function(e){e.preventDefault();$('#parental_control_required').hide();showPlayer();});}
var parentalControlReminder=(function(){var reminderCallback=null;function init(reminder){reminderCallback=reminder;$('#parental_control_reminder .closeBtn').unbind();$('#parental_control_reminder').show();hidePlayer();$('#parental_control_reminder .closeBtn').click(function(e){if($('#noReminder').is(':checked')){$.ajax({url:'/apps/catalog/ajax/player/parental_control_pref.html'});}
e.preventDefault();$('#parental_control_reminder').hide();showPlayer();reminderCallback();});}
return{init:init}})();var parentalControl=(function(){var regEx=/\d/;var container='';var passwordInputs='';var buttons='';var pinNumber=new Array(4);var pinContainer='';var message='';var initialMessage='';var submitBtn='';var closeBtn='';var authoriseCallback=null;var resetPlayerCallback=null;var callbacks={};var deletingKeys={8:'backspace',46:'delete'};function init(selectorId,authorise,resetPlayer){if(!selectorId||!authorise||!resetPlayer){throw new Error("Expected arguments selectorId, authorise and resetPlayer");}
authoriseCallback=authorise;resetPlayerCallback=resetPlayer;container=$(selectorId);if(!container.length>0)return;container.show();hidePlayer();callbacks={authorised:function(resp){message.css('color','white');message.html(initialMessage);container.hide();resetPin();removeCSS(passwordInputs,['selected','done']);showPlayer();},unauthorised:function(resp){message.css('color','red');message.html(resp.message);removeCSS(passwordInputs,['selected','done']);setFocusFirstPasswordInput(passwordInputs);resetPin();submitBtn.hide();},accountLocked:function(resp){message.css('color','red');message.html(resp.message);removeCSS(passwordInputs,['selected','done']);resetPin();accountBlock();}};message=container.find('#message');if(message.length>0){initialMessage=message.html();message.css('color','white');}
container.unbind();container.submit(submitPin);closeBtn=container.find('.closeBtn');if(closeBtn.length>0){closeBtn.bind('click',function(e){e.preventDefault();closeModalWindow(container);});}
pinNumber=new Array(4);pinContainer=container.find('#pin_number_wrapper');passwordInputs=container.find("input[type='password']");passwordInputs.attr({'disabled':'disabled'});buttons=container.find('#parentalBtns input');submitBtn=buttons.filter("input[type='submit']");submitBtn.hide();setFocusFirstPasswordInput(passwordInputs);$(passwordInputs).unbind();$(passwordInputs).each(function(index){$(this).bind('keyup',function(e){var isValid=regEx.test(this.value);if(deletingKeys[e.which]==='backspace'||deletingKeys[e.which]==='delete'){moveToPrev(passwordInputs);}else if(isValid){if($(this).hasClass('error'))$(this).removeClass('error');moveToNext(passwordInputs);}else{this.value='';submitBtn.hide();}});});}
function setFocusFirstPasswordInput(obj){if(!obj)return;var obj=obj;obj.attr({'disabled':'disabled'});$(obj[0]).removeAttr('disabled');$(obj[0]).addClass('selected');$(obj[0]).trigger('focus');}
function storePinNumber(obj){if(!obj)throw new Error("Obj hasn't been passed to the storePinNumber function.");obj.each(function(index,value){pinNumber[index]=this.value;});return pinNumber.join('');}
function getPin(){return storePinNumber(passwordInputs);}
function resetPin(){passwordInputs.each(function(){this.value='';});pinNumber=[];}
function removeCSS(objs,cssClasses){var objs=objs;var cssClasses=cssClasses;var cssClass='';if(!objs||!cssClasses){throw new Error("The object  or the CSS class have not been passed to removeClass function.");return;}
$(objs).each(function(){var $this=$(this);if(typeof cssClasses==='string'){cssClass=cssClasses;$this.removeClass(cssClass);}else{$.each(cssClasses,function(index,value){cssClass=value;if($this.hasClass(cssClass)){$this.removeClass(cssClass);}});}});}
function moveToNext(obj){if(!obj)return;var current=obj.filter('.selected');if(current.next().length>0){current.attr({'disabled':'disabled'});current.addClass('done');current.removeClass('selected');current.next().removeAttr('disabled').addClass('selected').trigger('focus');}else{submitBtn.show();}}
function moveToPrev(obj){if(!obj)return;var current=obj.filter('.selected');if((current.attr('id')=='pwdFourthDigit')&&(submitBtn.is(":visible"))){current.removeAttr('disabled').removeClass('done').addClass('selected').trigger('focus').attr('value','')}else if(current.prev().length>0){current.removeClass('selected');current.prev().removeAttr('disabled').removeClass('done').addClass('selected').trigger('focus').attr('value','');}
submitBtn.hide();}
function submitPin(){var pin=getPin();if(pin.length!=4){return false;}else{authoriseCallback(pin,callbacks.authorised,callbacks.unauthorised,callbacks.accountLocked);}
return false;}
function cancelSubmit(){removeCSS(passwordInputs,['selected','done']);setFocusFirstPasswordInput(passwordInputs);submitBtn.hide();resetPin();}
function accountBlock(){pinContainer.css({'visibility':'hidden'});submitBtn.hide();}
function closeModalWindow(ele){if(!ele)return;submitBtn.hide();ele.hide();cancelSubmit();pinContainer.css({'visibility':''});message.html(initialMessage);resetPlayerCallback();showPlayer();}
function reset(){closeModalWindow(container);}
return{init:init,reset:reset}})();;var ERROR_BAD_BILLING_DETAILS='bad-billing-details';var ERROR_TRANSACTION_DECLINED='transaction-declined';var ERROR_TEMPORARY='temporary';var ERROR_TIMEOUT='timeout';var ERROR_SUBSCRIPTION_REQUIRED='subscription-required';var ERROR_SUB_UPGRADE_REQUIRED='sub-upgrade-required';var ERROR_CREDIT_REQUIRED='credit-required';var ERROR_MINUTES_REQUIRED='minutes-required';var ERROR_ITEM_EXISTS='item-exists';var ERROR_RESTRICTED_CONTENT='restricted-content';var ERROR_UNAVAILABLE='unavailable';var ERROR_BAD_TERRITORY='bad-territory';var ignore_ioko_player_purchase_event=false;var init_ioko_player_invoked=false;var ioko_player_reset_init_params={};window.onunload=function(){if(playerOrigin=="silverlight-player"){var player=document.getElementById('slPlugin');var data=player.Content.playerApi.onPlayerExit();for(var i=0;i<data.length;i++){var qosImg=document.createElement("img");qosImg.setAttribute('src',data[i]);}}else{return false;}}
function doActionLink(uri,target_window){window.open(uri,target_window);}
function LogQosEventToHTML(args1,args2,args3){}
function showSims(){ioko_tracking_recs_shown();$('#recs_close').click(function(){hideSims();});$('#player_recs').show();hidePlayer();}
function hideSims(){ioko_tracking_recs_interaction();$('#player_recs').hide();showPlayer();}
var popOutLFPlayer=null;function closeWindow(){window.close();}
function closePopOutLFPlayer(){if(popOutLFPlayer!=null){if(!popOutLFPlayer.closed)
popOutLFPlayer.close();}
$("#popout_in_use_wrap").hide();}
function openPopOutLFPlayer(args){if(args.release_id!=null){closePopOutLFPlayer();var windowOptions="resizable=yes,toolbar=no,location=no,scrollbars=no,width=620,height=349,left=10,top=30";var windowUrl='/apps/catalog/module/player/player_popout.mhtml?release_id='+args.release_id;popOutLFPlayer=window.open(windowUrl,'PopOutLFPlayer'+args.release_id,windowOptions);popOutLFPlayer.focus();$("#silverlightControlHost").html('');$("#popout_in_use_wrap").show();}}
function decodeEscapeSequence(string){return string.replace(/\\x([0-9A-Fa-f]{2})/g,function(){return String.fromCharCode(parseInt(arguments[1],16));});};function getPlayerTrackdata(){playerTrackdata={};if(!isPopout){if(s.product_name){product_name=decodeEscapeSequence(s.product_name);playerTrackdata['product_name']=product_name;}
if(s.product_media){playerTrackdata['product_media']=s.product_media;}
if(s.product_type){playerTrackdata['product_type']=s.product_type;}
if(s.genre_names){playerTrackdata['genre_names']=s.genre_names;}
if(s.pageName){playerTrackdata['pageName']=s.pageName;}}}
function ioko_tracking_watch_now(){if(!isPopout){getPlayerTrackdata();LOVEFiLM.Tracking.trackActivity('PLAYER_RELEASE_VIEW',playerTrackdata);}}
function ioko_tracking_trailer_view(){if(!isPopout){getPlayerTrackdata();LOVEFiLM.Tracking.trackActivity('PLAYER_TRAILER_VIEW',playerTrackdata);}}
function ioko_tracking_recs_shown(){if(!isPopout){getPlayerTrackdata();LOVEFiLM.Tracking.trackActivity('PLAYER_RECS_SHOWN',playerTrackdata);}}
function ioko_tracking_recs_interaction(){if(!isPopout){getPlayerTrackdata();LOVEFiLM.Tracking.trackActivity('PLAYER_RECS_CLICK',playerTrackdata);}}
function hidePlayer(){if(windowlessSwitch&&windowlessSwitch==='false'){$('#hide_player').show();}}
function showPlayer(){if(windowlessSwitch&&windowlessSwitch==='false'){$('#hide_player').hide();}}
function redirectToProductPage(args){if(args.product_id!=null){if(window.opener){window.opener.location.href="/product/title.html?product_id="+args.product_id;window.close();}else{window.location.href="/product/title.html?product_id="+args.product_id;}}}
function createCookieLFPlayerSignin(name,value,days){if(days){var date=new Date();date.setTime(date.getTime()+(days*24*60*60*1000));var expires="; expires="+date.toGMTString();}
else var expires="";document.cookie=name+"="+value+expires+"; path=/";}
function readCookieLFPlayerSignin(name){var nameEQ=name+"=";var ca=document.cookie.split(';');for(var i=0;i<ca.length;i++){var c=ca[i];while(c.charAt(0)==' ')c=c.substring(1,c.length);if(c.indexOf(nameEQ)==0)return c.substring(nameEQ.length,c.length);}
return null;}
function eraseCookieLFPlayerSignin(name){createCookieLFPlayerSignin(name,"",-1);}
var playerOrigin;var playerOriginCookie=readCookieLFPlayerSignin("LFplayerOrigin");if(playerOriginCookie){playerOrigin=playerOriginCookie;eraseCookieLFPlayerSignin("LFplayerOrigin");}
function ioko_player_purchase_event_base(args){ioko_player_init_purchase(args,function(response){ioko_player_resolve_purchase(response)});}
function ioko_player_init_purchase(purchase_args,callback){if(ignore_ioko_player_purchase_event)return;ignore_ioko_player_purchase_event=true;var current_page=location.href.replace(/\?.*$/,'');$.ajax({type:'GET',dataType:'json',url:'/apps/catalog/ajax/player/init_purchase.html',data:{origin:playerOrigin,asset:purchase_args['asset'],session_id:purchase_args['session_id'],playhead_time:purchase_args['playheadTime']?purchase_args['playheadTime']:'',return_to_page:current_page},async:false,success:function(response){if(response.error){if(response.error==ERROR_SUBSCRIPTION_REQUIRED){location.replace('/account/reactivate.html');}
else if(response.error==ERROR_SUB_UPGRADE_REQUIRED){location.replace('/account/change_package.html');}
else if(response.error==ERROR_ITEM_EXISTS){location.replace(current_page);}
else if(response.error==ERROR_UNAVAILABLE||response.error==ERROR_BAD_TERRITORY){ignore_ioko_player_purchase_event=false;ioko_log_error(response);ioko_player_content_unavailable(response);}
else{ignore_ioko_player_purchase_event=false;ioko_log_error(response);reinit_ioko_player();}
ioko_reset_parental_controls();return;}
return callback(response);}});}
function ioko_player_resolve_purchase(response){var current_page=location.href.replace(/\?.*$/,'');if(response.error||!response.result.availability.available){ignore_ioko_player_purchase_event=false;ioko_log_error(response);}
else if(response.result.availability.free_with_credit){complete_credit_purchase(response.result.purchase_type,response.result.release_id);}
else if(response.result.availability.free_with_minutes){complete_minutes_purchase(response.result.purchase_type,response.result.release_id);}
else if(response.result.availability.subscription_required||response.result.availability.not_active){if(response.result.user_ids.customer_id){var url='/apps/catalog/module/player/support/prepare_subscription_upgrade.html'
+'?purchase_type='+escape(response.result.purchase_type)
+'&release_id='+escape(response.result.release_id)
+'&go='+escape(current_page);location.replace(url);}
else{ignore_ioko_player_purchase_event=false;ioko_player_redirect_signup();}}
else if(response.result.availability.included_in_subscription){complete_subscription_purchase(response.result.purchase_type,response.result.release_id,current_page);}
else if(response.result.availability.purchase_required){if(response.result.user_ids.customer_id){if(response.result.billing_details_stored){complete_stored_credit_card_purchase(response.result.purchase_type,response.result.release_id,current_page);}
else{var url='/apps/catalog/module/player/support/prepare_payment_details.html'
+'?purchase_type='+escape(response.result.purchase_type)
+'&release_id='+escape(response.result.release_id)
+'&go='+escape(current_page);location.replace(url);}}
else{ignore_ioko_player_purchase_event=false;ioko_player_redirect_signup();}}
else{ignore_ioko_player_purchase_event=false;}}
function ioko_player_resolve_parental_controls_challenge_purchase(response){if(!response.error&&response.result.availability.available){if(response.result.availability.free_with_credit){confirm_credit_purchase(response.result.purchase_type,response.result.release_id);return;}
if(response.result.availability.free_with_minutes){confirm_minutes_purchase(response.result.purchase_type,response.result.release_id);return;}
if(response.result.availability.purchase_required&&response.result.billing_details_stored){confirm_stored_credit_card_purchase(response.result.purchase_type,response.result.release_id);return;}
if(!response.result.availability.subscription_required&&!response.result.availability.purchase_required&&!response.result.availability.included_in_subscription&&!response.result.availability.not_active){complete_queue_free_release(response.result.purchase_type,response.result.release_id);return;}}
ioko_player_resolve_purchase(response);}
function complete_subscription_purchase(purchase_type,release_id,url){$.getJSON("/apps/catalog/ajax/player/complete_subscription_purchase.html",{origin:playerOrigin,purchase_type:purchase_type,release_id:release_id},function(json){url=url||$.url.attr('path');if(json.error){if(json.error==ERROR_RESTRICTED_CONTENT){failed_restricted_content_access(json);}
else{ioko_log_error(json);parent?parent.location.replace(url):location.replace(url);}
return;}
else if(json.result.init_params){reinit_ioko_player(json.result.init_params);ignore_ioko_player_purchase_event=false;}
else{url+='?digital_item_id='+escape(json.result.digital_item_id)+'&play_immediately=1';parent?parent.location.replace(url):location.replace(url);}
if(json.result.digital_item_id){add_digital_item_id_to_parental_controls_args(json.result.digital_item_id);}});}
function complete_queue_free_release(purchase_type,release_id,url){$.getJSON("/apps/catalog/ajax/player/complete_queue_free_release.html",{origin:playerOrigin,purchase_type:purchase_type,release_id:release_id},function(json){url=url||$.url.attr('path');if(json.error){if(json.error==ERROR_RESTRICTED_CONTENT){failed_restricted_content_access(json);}
else{ioko_log_error(json);parent?parent.location.replace(url):location.replace(url);}
return;}
else if(json.result.init_params){reinit_ioko_player(json.result.init_params);ignore_ioko_player_purchase_event=false;}
else{url+='?digital_item_id='+escape(json.result.digital_item_id)+'&play_immediately=1';parent?parent.location.replace(url):location.replace(url);}
if(json.result.digital_item_id){add_digital_item_id_to_parental_controls_args(json.result.digital_item_id);}});}
function confirm_credit_purchase(purchase_type,release_id){$.getJSON("/apps/catalog/ajax/player/confirm_credit_purchase.html",{origin:playerOrigin,purchase_type:purchase_type,release_id:release_id},function(response){ignore_ioko_player_purchase_event=false;if(response.error){ioko_log_error(response);reinit_ioko_player();}
else{reinit_ioko_player(response.result.init_params);}});}
function complete_credit_purchase(purchase_type,release_id,url){$.getJSON("/apps/catalog/ajax/player/complete_credit_purchase.html",{origin:playerOrigin,purchase_type:purchase_type,release_id:release_id},function(json){if(json.error){failed_digital_credit_purchase(json);}
else{url=url||$.url.attr('path');url+='?digital_item_id='+escape(json.result.digital_item_id)
+'&play_immediately=1';parent?parent.location.replace(url):location.replace(url);}
if(json.result.digital_item_id){add_digital_item_id_to_parental_controls_args(json.result.digital_item_id);}});}
function confirm_minutes_purchase(purchase_type,release_id){$.getJSON("/apps/catalog/ajax/player/confirm_minutes_purchase.html",{origin:playerOrigin,purchase_type:purchase_type,release_id:release_id},function(response){ignore_ioko_player_purchase_event=false;if(response.error){ioko_log_error(response);reinit_ioko_player();}
else{reinit_ioko_player(response.result.init_params);}});}
function complete_minutes_purchase(purchase_type,release_id,url){$.getJSON("/apps/catalog/ajax/player/complete_minutes_purchase.html",{origin:playerOrigin,purchase_type:purchase_type,release_id:release_id},function(json){if(json.error){failed_digital_minutes_purchase(json);}
else if(json.result.init_params){reinit_ioko_player(json.result.init_params);ignore_ioko_player_purchase_event=false;}
else{url+='?digital_item_id='+escape(json.result.digital_item_id)+'&play_immediately=1';parent?parent.location.replace(url):location.replace(url);}
if(json.result.digital_item_id){add_digital_item_id_to_parental_controls_args(json.result.digital_item_id);}});}
function confirm_stored_credit_card_purchase(purchase_type,release_id){$.getJSON("/apps/catalog/ajax/player/confirm_stored_credit_card_purchase.html",{origin:playerOrigin,purchase_type:purchase_type,release_id:release_id},function(response){ignore_ioko_player_purchase_event=false;if(response.error){ioko_log_error(response);reinit_ioko_player();}
else{reinit_ioko_player(response.result.init_params);}});}
function complete_stored_credit_card_purchase(purchase_type,release_id,current_page){$.getJSON("/apps/catalog/ajax/player/complete_stored_credit_card_purchase.html",{origin:playerOrigin,purchase_type:purchase_type,release_id:release_id},function(json){if(json.error){if(json.error==ERROR_BAD_BILLING_DETAILS||json.error==ERROR_TIMEOUT||json.error==ERROR_TEMPORARY||json.error==ERROR_TRANSACTION_DECLINED){failed_digital_payment(json);}
else if(json.error==ERROR_ITEM_EXISTS){parent?parent.location.replace(current_page):location.replace(current_page);}
else{ioko_log_error(json);ignore_ioko_player_purchase_event=false;}}
else{if(json.result.init_params){reinit_ioko_player(json.result.init_params);}
ignore_ioko_player_purchase_event=false;}
if(json.result.digital_item_id){add_digital_item_id_to_parental_controls_args(json.result.digital_item_id);}});}
function set_ioko_player_reset_init_params(params){ioko_player_reset_init_params=params;}
function init_ioko_player(args){if(!args){return false;}
if(init_ioko_player_invoked){return true;}
init_ioko_player_invoked=true;if(playerOrigin=="flash-player"){var player=document.getElementById('OnDemandWebPlayer');if(player){player.init(args);init_ioko_player_invoked=false;return true;}}
return false;}
function reinitSilverlightViaXMLJSInjection(strinitUri,strinitMethod,strmessageCatalogueUri){var player=document.getElementById('slPlugin');player.Content.playerApi.init({initUri:strinitUri,initMethod:strinitMethod,messageCatalogueUri:strmessageCatalogueUri});}
function reinit_ioko_player(args){if(!args){args=ioko_player_reset_init_params;}
slInitParams=args;if(playerOrigin=="silverlight-player"){reinitSilverlightViaXMLJSInjection(args.initUri,args.initMethod,args.messageCatalogueUri);}else if(playerOrigin=="flash-player"){init_ioko_player({heroUri:args.heroUri,initUri:args.initUri,initMethod:args.initMethod,messageCatalogueUri:args.messageCatalogueUri});}}
function ioko_log_error(response){try{var message="Error: "+response.error+" ("+response.error_details+")";}
catch(e){}
return false;}
function failed_digital_payment(response){ioko_log_error(response);var url='/apps/catalog/module/player/support/payment_details.html?transaction_error='+escape(response.error);parent?parent.location.replace(url):location.replace(url);}
function failed_digital_credit_purchase(response){ioko_log_error(response);var url='/apps/catalog/module/player/support/credit_purchase_error.html?error='+escape(response.error);parent?parent.location.replace(url):location.replace(url);}
function failed_digital_minutes_purchase(response){ioko_log_error(response);var url='/apps/catalog/module/player/support/minutes_purchase_error.html?error='+escape(response.error);parent?parent.location.replace(url):location.replace(url);}
function failed_restricted_content_access(response){ioko_log_error(response);ignore_ioko_player_purchase_event=false;}
function ioko_player_parental_controls_reminder_base(args){var init_args=args;parentalControlReminder.init(function(reminder_callback){var asset_parts=ioko_decode_asset_string(init_args['asset']);var asset_type=asset_parts.shift();var asset_id=asset_parts.shift();var purchase_type=asset_parts.shift();var digital_item_id=null;if(init_args['digital_item_id']){digital_item_id=init_args['digital_item_id'];}
else if(init_args['asset']){if(asset_type=='digital_item'){digital_item_id=asset_id;}}
if(digital_item_id){ioko_player_parental_controls_authorise({origin:playerOrigin,digital_item_id:digital_item_id,pin:null,reminder:true},function(auth_response){reinit_ioko_player(auth_response.init_params);});}
else{ioko_player_init_purchase(init_args,function(init_response){ioko_player_parental_controls_authorise({origin:playerOrigin,purchase_type:init_response.result.purchase_type,release_id:init_response.result.release_id,pin:null,reminder:true},function(auth_response){ioko_player_resolve_parental_controls_challenge_purchase(init_response);});});}});}
function ioko_player_parental_controls_challenge_base(args){var init_args=args;parentalControl.init('#parental_controls_form',function(pin,authorised_callback,unauthorised_callback,locked_out_callback){var asset_parts=ioko_decode_asset_string(init_args['asset']);var asset_type=asset_parts.shift();var asset_id=asset_parts.shift();var purchase_type=asset_parts.shift();var digital_item_id=null;if(init_args['digital_item_id']){digital_item_id=init_args['digital_item_id'];}
else if(init_args['asset']){if(asset_type=='digital_item'){digital_item_id=asset_id;}}
if(digital_item_id){ioko_player_parental_controls_authorise({origin:playerOrigin,digital_item_id:digital_item_id,pin:pin,reset_playhead_time:init_args['reset_playhead_time']},function(auth_response){authorised_callback(auth_response);reinit_ioko_player(auth_response.init_params);},function(auth_response){unauthorised_callback(auth_response);},function(auth_response){locked_out_callback(auth_response);});}
else{ioko_player_init_purchase(init_args,function(init_response){ioko_player_parental_controls_authorise({origin:playerOrigin,purchase_type:init_response.result.purchase_type,release_id:init_response.result.release_id,pin:pin},function(auth_response){authorised_callback(auth_response);ioko_player_resolve_parental_controls_challenge_purchase(init_response);},function(auth_response){unauthorised_callback(auth_response);},function(auth_response){locked_out_callback(auth_response);});});}},function(){ignore_ioko_player_purchase_event=false;reinit_ioko_player();});}
function ioko_player_parental_controls_authorise(auth_args,authorised_callback,unauthorised_callback,locked_out_callback){$.getJSON("/apps/catalog/ajax/player/parental_controls_authorise.html",auth_args,function(auth_response){ignore_ioko_player_purchase_event=false;if(auth_response.authorised=='1'){authorised_callback(auth_response);}
else if(auth_response.account_locked=='1'){locked_out_callback(auth_response);}
else{unauthorised_callback(auth_response);}});}
function ioko_player_content_unavailable(response){if(response.init_params){reinit_ioko_player(response.init_params);}
else{reinit_ioko_player();}}
function ioko_redirect_to_path(url){parent?parent.location.href=url:location.href=url;}
function ioko_advert_played_event(args){if(!args){return false;}else{$('div.dart').dart({reset_tile:1,inStream_dart_tag:args['tag']}).generateDartTag();}}
function ioko_player_reset_event(){}
function ioko_decode_asset_string(asset){return(asset&&asset.match(/:/))?asset.split(/:/):[];}
function ioko_reset_parental_controls(){if(parentalControl){parentalControl.reset();}}
function ioko_upgrade_to_silverlight(){displayMessage('silverlight');};if(!window.Silverlight)
{window.Silverlight={};Silverlight.disableAutoStartup=true;Silverlight.ua=null;}
Silverlight._silverlightCount=0;Silverlight.__onSilverlightInstalledCalled=false;Silverlight.fwlinkRoot='http://go2.microsoft.com/fwlink/?LinkID=';Silverlight.__installationEventFired=false;Silverlight.onGetSilverlight=null;Silverlight.onSilverlightInstalled=function(){window.location.reload(false);};Silverlight.isInstalled=function(version)
{if(version==undefined)
version=null;var isVersionSupported=false;var container=null;try
{var control=null;var tryNS=false;if(window.ActiveXObject)
{try
{control=new ActiveXObject('AgControl.AgControl');if(version===null)
{isVersionSupported=true;}
else if(control.IsVersionSupported(version))
{isVersionSupported=true;}
control=null;}
catch(e)
{tryNS=true;}}
else
{tryNS=true;}
if(tryNS)
{var plugin=navigator.plugins["Silverlight Plug-In"];if(plugin)
{if(version===null)
{isVersionSupported=true;}
else
{var actualVer=plugin.description;if(actualVer==="1.0.30226.2")
actualVer="2.0.30226.2";var actualVerArray=actualVer.split(".");while(actualVerArray.length>3)
{actualVerArray.pop();}
while(actualVerArray.length<4)
{actualVerArray.push(0);}
var reqVerArray=version.split(".");while(reqVerArray.length>4)
{reqVerArray.pop();}
var requiredVersionPart;var actualVersionPart;var index=0;do
{requiredVersionPart=parseInt(reqVerArray[index]);actualVersionPart=parseInt(actualVerArray[index]);index++;}
while(index<reqVerArray.length&&requiredVersionPart===actualVersionPart);if(requiredVersionPart<=actualVersionPart&&!isNaN(requiredVersionPart))
{isVersionSupported=true;}}}}}
catch(e)
{isVersionSupported=false;}
return isVersionSupported;};Silverlight.WaitForInstallCompletion=function()
{if(!Silverlight.isBrowserRestartRequired&&Silverlight.onSilverlightInstalled)
{try
{navigator.plugins.refresh();}
catch(e)
{}
if(Silverlight.isInstalled(null)&&!Silverlight.__onSilverlightInstalledCalled)
{Silverlight.onSilverlightInstalled();Silverlight.__onSilverlightInstalledCalled=true;}
else
{setTimeout(Silverlight.WaitForInstallCompletion,3000);}}};Silverlight.__startup=function()
{navigator.plugins.refresh();Silverlight.isBrowserRestartRequired=Silverlight.isInstalled(null);if(!Silverlight.isBrowserRestartRequired)
{Silverlight.WaitForInstallCompletion();if(!Silverlight.__installationEventFired)
{Silverlight.onInstallRequired();Silverlight.__installationEventFired=true;}}
else if(window.navigator.mimeTypes)
{var mimeSL2=navigator.mimeTypes["application/x-silverlight-2"];var mimeSL2b2=navigator.mimeTypes["application/x-silverlight-2-b2"];var mimeSL2b1=navigator.mimeTypes["application/x-silverlight-2-b1"];var mimeHighestBeta=mimeSL2b1;if(mimeSL2b2)
mimeHighestBeta=mimeSL2b2;if(!mimeSL2&&(mimeSL2b1||mimeSL2b2))
{if(!Silverlight.__installationEventFired)
{Silverlight.onUpgradeRequired();Silverlight.__installationEventFired=true;}}
else if(mimeSL2&&mimeHighestBeta)
{if(mimeSL2.enabledPlugin&&mimeHighestBeta.enabledPlugin)
{if(mimeSL2.enabledPlugin.description!=mimeHighestBeta.enabledPlugin.description)
{if(!Silverlight.__installationEventFired)
{Silverlight.onRestartRequired();Silverlight.__installationEventFired=true;}}}}}
if(!Silverlight.disableAutoStartup)
{if(window.removeEventListener)
{window.removeEventListener('load',Silverlight.__startup,false);}
else
{window.detachEvent('onload',Silverlight.__startup);}}};if(!Silverlight.disableAutoStartup)
{if(window.addEventListener)
{window.addEventListener('load',Silverlight.__startup,false);}
else
{window.attachEvent('onload',Silverlight.__startup);}}
Silverlight.createObject=function(source,parentElement,id,properties,events,initParams,userContext)
{var slPluginHelper=new Object();var slProperties=properties;var slEvents=events;slPluginHelper.version=slProperties.version;slProperties.source=source;slPluginHelper.alt=slProperties.alt;if(initParams)
slProperties.initParams=initParams;if(slProperties.isWindowless&&!slProperties.windowless)
slProperties.windowless=slProperties.isWindowless;if(slProperties.framerate&&!slProperties.maxFramerate)
slProperties.maxFramerate=slProperties.framerate;if(id&&!slProperties.id)
slProperties.id=id;delete slProperties.ignoreBrowserVer;delete slProperties.inplaceInstallPrompt;delete slProperties.version;delete slProperties.isWindowless;delete slProperties.framerate;delete slProperties.data;delete slProperties.src;delete slProperties.alt;if(Silverlight.isInstalled(slPluginHelper.version))
{for(var name in slEvents)
{if(slEvents[name])
{if(name=="onLoad"&&typeof slEvents[name]=="function"&&slEvents[name].length!=1)
{var onLoadHandler=slEvents[name];slEvents[name]=function(sender){return onLoadHandler(document.getElementById(id),userContext,sender)};}
var handlerName=Silverlight.__getHandlerName(slEvents[name]);if(handlerName!=null)
{slProperties[name]=handlerName;slEvents[name]=null;}
else
{throw"typeof events."+name+" must be 'function' or 'string'";}}}
slPluginHTML=Silverlight.buildHTML(slProperties);}
else
{slPluginHTML=Silverlight.buildPromptHTML(slPluginHelper);}
if(parentElement)
{parentElement.innerHTML=slPluginHTML;}
else
{return slPluginHTML;}};Silverlight.buildHTML=function(slProperties)
{var htmlBuilder=[];htmlBuilder.push('<object type=\"application/x-silverlight-2\" data="data:application/x-silverlight-2,"');if(slProperties.id!=null)
{htmlBuilder.push(' id="'+Silverlight.HtmlAttributeEncode(slProperties.id)+'"');}
if(slProperties.width!=null)
{htmlBuilder.push(' width="'+slProperties.width+'"');}
if(slProperties.height!=null)
{htmlBuilder.push(' height="'+slProperties.height+'"');}
htmlBuilder.push(' >');delete slProperties.id;delete slProperties.width;delete slProperties.height;for(var name in slProperties)
{if(slProperties[name])
{htmlBuilder.push('<param name="'+Silverlight.HtmlAttributeEncode(name)+'" value="'+Silverlight.HtmlAttributeEncode(slProperties[name])+'" />');}}
htmlBuilder.push('<\/object>');return htmlBuilder.join('');};Silverlight.createObjectEx=function(params)
{var parameters=params;var html=Silverlight.createObject(parameters.source,parameters.parentElement,parameters.id,parameters.properties,parameters.events,parameters.initParams,parameters.context);if(parameters.parentElement==null)
{return html;}};Silverlight.buildPromptHTML=function(slPluginHelper)
{var slPluginHTML="";var urlRoot=Silverlight.fwlinkRoot;var version=slPluginHelper.version;if(slPluginHelper.alt)
{slPluginHTML=slPluginHelper.alt;}
else
{if(!version)
{version="";}
slPluginHTML="<a href='javascript:Silverlight.getSilverlight(\"{1}\");' style='text-decoration: none;'><img src='{2}' alt='Get Microsoft Silverlight' style='border-style: none'/></a>";slPluginHTML=slPluginHTML.replace('{1}',version);slPluginHTML=slPluginHTML.replace('{2}',urlRoot+'108181');}
return slPluginHTML;};Silverlight.getSilverlight=function(version)
{if(Silverlight.onGetSilverlight)
{Silverlight.onGetSilverlight();}
var shortVer="";var reqVerArray=String(version).split(".");if(reqVerArray.length>1)
{var majorNum=parseInt(reqVerArray[0]);if(isNaN(majorNum)||majorNum<2)
{shortVer="1.0";}
else
{shortVer=reqVerArray[0]+'.'+reqVerArray[1];}}
var verArg="";if(shortVer.match(/^\d+\056\d+$/))
{verArg="&v="+shortVer;}
Silverlight.followFWLink("149156"+verArg);};Silverlight.followFWLink=function(linkid)
{top.location=Silverlight.fwlinkRoot+String(linkid);};Silverlight.HtmlAttributeEncode=function(strInput)
{var c;var retVal='';if(strInput==null)
{return null;}
for(var cnt=0;cnt<strInput.length;cnt++)
{c=strInput.charCodeAt(cnt);if(((c>96)&&(c<123))||((c>64)&&(c<91))||((c>43)&&(c<58)&&(c!=47))||(c==95))
{retVal=retVal+String.fromCharCode(c);}
else
{retVal=retVal+'&#'+c+';';}}
return retVal;};Silverlight.default_error_handler=function(sender,args)
{var iErrorCode;var errorType=args.ErrorType;iErrorCode=args.ErrorCode;var errMsg="\nSilverlight error message     \n";errMsg+="ErrorCode: "+iErrorCode+"\n";errMsg+="ErrorType: "+errorType+"       \n";errMsg+="Message: "+args.ErrorMessage+"     \n";if(errorType=="ParserError")
{errMsg+="XamlFile: "+args.xamlFile+"     \n";errMsg+="Line: "+args.lineNumber+"     \n";errMsg+="Position: "+args.charPosition+"     \n";}
else if(errorType=="RuntimeError")
{if(args.lineNumber!=0)
{errMsg+="Line: "+args.lineNumber+"     \n";errMsg+="Position: "+args.charPosition+"     \n";}
errMsg+="MethodName: "+args.methodName+"     \n";}
alert(errMsg);};Silverlight.__cleanup=function()
{for(var i=Silverlight._silverlightCount-1;i>=0;i--){window['__slEvent'+i]=null;}
Silverlight._silverlightCount=0;if(window.removeEventListener){window.removeEventListener('unload',Silverlight.__cleanup,false);}
else{window.detachEvent('onunload',Silverlight.__cleanup);}};Silverlight.__getHandlerName=function(handler)
{var handlerName="";if(typeof handler=="string")
{handlerName=handler;}
else if(typeof handler=="function")
{if(Silverlight._silverlightCount==0)
{if(window.addEventListener)
{window.addEventListener('unload',Silverlight.__cleanup,false);}
else
{window.attachEvent('onunload',Silverlight.__cleanup);}}
var count=Silverlight._silverlightCount++;handlerName="__slEvent"+count;window[handlerName]=handler;}
else
{handlerName=null;}
return handlerName;};Silverlight.onRequiredVersionAvailable=function()
{};Silverlight.onUpgradeRequired=function()
{};Silverlight.onInstallRequired=function()
{};Silverlight.IsVersionAvailableOnError=function(sender,args)
{var retVal=false;try
{if(args.ErrorCode==8001&&!Silverlight.__installationEventFired)
{Silverlight.onUpgradeRequired();Silverlight.__installationEventFired=true;}
else if(args.ErrorCode==8002&&!Silverlight.__installationEventFired)
{Silverlight.onRestartRequired();Silverlight.__installationEventFired=true;}
else if(args.ErrorCode==5014||args.ErrorCode==2106)
{if(Silverlight.__verifySilverlight2UpgradeSuccess(args.getHost()))
{retVal=true;}}
else
{retVal=true;}}
catch(e)
{}
return retVal;};Silverlight.IsVersionAvailableOnLoad=function(sender)
{var retVal=false;try
{if(Silverlight.__verifySilverlight2UpgradeSuccess(sender.getHost()))
{retVal=true;}}
catch(e)
{}
return retVal;};Silverlight.__verifySilverlight2UpgradeSuccess=function(host)
{var retVal=false;var version=SILF.minSlVersion.split(".")[0]+"."+SILF.minSlVersion.split(".")[1]+"."+SILF.minSlVersion.split(".")[2];var installationEvent=null;try
{if(host.IsVersionSupported(version+".99"))
{installationEvent=Silverlight.onRequiredVersionAvailable;retVal=true;}
else if(host.IsVersionSupported(version+".0"))
{installationEvent=Silverlight.onRestartRequired;}
else
{installationEvent=Silverlight.onUpgradeRequired;}
if(installationEvent&&!Silverlight.__installationEventFired)
{installationEvent();Silverlight.__installationEventFired=true;}}
catch(e)
{}
return retVal;};Silverlight.detectSilverlightVersion=function(){var container=null;var silverlightVersion;try{var control=null;try{control=new ActiveXObject('AgControl.AgControl');}
catch(z){if(navigator.plugins["Silverlight Plug-In"])
{container=document.createElement('div');document.body.appendChild(container);container.innerHTML='<embed type="application/x-silverlight-2" />';control=container.childNodes[0];}}
if(control.Settings){try{silverlightVersion=control.Settings.version;}
catch(z){}}
var slVers=new Array("4.0.50303.0","4.0.41108.0","3.0.50106.0","3.0.40818.0","3.0.40723.0","3.0.40624.0","3.0.40307.0","2.0.40115.0","2.0.31005.0","2.0.30523.9","2.0.30523.8","2.0.30523.6","2.0.30226.2","1.0.30715.0","1.0.30401.0","1.0.30109.0","1.0.21115.0","1.1.20926.0","1.0.20816");if(!silverlightVersion){for(i in slVers){if(control.IsVersionSupported(slVers[i])){silverlightVersion=slVers[i];break;}}}
if(!silverlightVersion)
{var major=0;var minor=0;var revision=0;var build=0;var buildVersionString=function(versionNumbers){var versionString="";for(var l=0;l<versionNumbers.length;++l){versionString+=versionNumbers[l];if(l!=versionNumbers.length-1)
versionString+=".";}
return versionString;}
var versionNumbers=[0,0,0,0];for(var i=0;i<versionNumbers.length;++i){for(var incrementor=0;incrementor<100000;++incrementor){versionNumbers[i]=incrementor;if(!control.IsVersionSupported(buildVersionString(versionNumbers))){versionNumbers[i]=incrementor-1;break;}}}
silverlightVersion=buildVersionString(versionNumbers);}
control=null;}
catch(e){}
if(container){document.body.removeChild(container);}
if(!silverlightVersion)
silverlightVersion="Not installed!";return silverlightVersion;}
if(!window.SILF)
window.SILF={};SILF.logCount=0;SILF.appName="";SILF.appVersion="";SILF.logEntryflow=false;SILF.logInstall=false;SILF.loggingURIentry="";SILF.loggingURIinstall="";SILF.minSlVersion="3.0.50106.0";SILF.SilverlightControlHost="";SILF.PromptInstall="Please <a href='#' onclick='SILF.InstallClicked()'>click here to install Silverlight</a>";SILF.PromptFinishInstall="Please wait for Silverlight installation to complete. You may need to refresh the page.";SILF.PromptUpgrade="Please <a href='#' onclick='SILF.UpgradeClicked()'>click here to upgrade Silverlight</a>";SILF.PromptFinishUpgrade="Please wait for Silverlight upgrade to complete. You will need to restart your browser.";SILF.PromptRestart="Please exit/quit and restart your browser to proceed";SILF.PromptNotSupported="Sorry, your browser or operating system are not supported";SILF.RedirectNotSupported="";SILF.statusShowInstall=1;SILF.statusShowUpgrade=2;SILF.statusShowUnsupported=3;SILF.statusShowRestart=4;SILF.statusChooseInstall=5;SILF.statusChooseUpgrade=6;SILF.statusChooseReject=7;SILF.statusChooseAbandon=8;SILF.statusSuccess=10;SILF.loggingDelay=1250;SILF.ErrorHandler=function(source,error){alert("Oops! An unexpected error occurred.\n\nSource: "+source+"\nDescription: "+error.description);};SILF.entryFlowCookieName=function(){return SILF.appName+"entryFlow";}
SILF.appIdCookieName=function(){return SILF.appName+"appId";}
SILF.installFlowCookieName=function(){return SILF.appName+"installFlow";}
SILF.getClientState=function(){if(!SILF.clientState){var o={};o.uid=SILF.getUid();o.isLogEntryFlowCookieDefined=SILF.isCookieDefined(SILF.entryFlowCookieName(),"1");o.isLogInstallFlowCookieDefined=SILF.isCookieDefined(SILF.installFlowCookieName(),"2");o.isSlVersionInstalled=Silverlight.isInstalled(SILF.minSlVersion);o.isSlVersionSupported=Silverlight.supportedUserAgent(SILF.minSlVersion.substring(0,1).concat(".0"));o.isSlUpgradeRequired=!o.isSlVersionInstalled&&Silverlight.isInstalled(null);SILF.clientState=o;}
return SILF.clientState;};SILF.onPlayerPageBeforeUnload=function(){if(SILF.installState==SILF.statusShowInstall||SILF.installState==SILF.statusShowUpgrade){SILF.logInstallFlow(SILF.statusChooseAbandon);}
var date=new Date();while(new Date()-date<SILF.loggingDelay){}};SILF.isCookieDefined=function(name,value){var cookieValue=SILF.getCookieValue(name);return SILF.equals(cookieValue,value);};SILF.getCookieValue=function(name,caseSensitive){var cookie=document.cookie;if(cookie&&cookie.length>0){var items=cookie.split(";");return SILF.getParamValue(items,name,caseSensitive);}};SILF.getParamValue=function(items,name,caseSensitive){for(i=0;i<items.length;i++){var item=items[i].split("=");if(SILF.equals(SILF.trim(unescape(item[0])),name,caseSensitive))
return item[1]?unescape(item[1]):item[1];}};SILF.equals=function(s1,s2,caseSensitive){if(s1==s2)
return true;else if(s1==null||s2==null||caseSensitive)
return false;else
return s1.toLowerCase()==s2.toLowerCase();};SILF.trim=function(s){return s.replace(/^\s+|\s+$/g,"");};SILF.setCookie=function(name,value,hours){if(hours){var expDate=new Date(new Date().getTime()+hours*60*60*1000);document.cookie=name+"="+value+";expires="+expDate.toGMTString();}
else{document.cookie=name+"="+value;}};SILF.clearCookie=function(name){document.cookie=name+"=;expires=Thu, 01-Jan-1970 00:00:01 GMT";};SILF.getUid=function(){var uid=SILF.getCookieValue(SILF.appIdCookieName());if(!uid){uid=Math.uuid();SILF.setCookie(SILF.appIdCookieName(),uid);}
return uid;};SILF.getParamValue=function(items,name,caseSensitive){for(i=0;i<items.length;i++){var item=items[i].split("=");if(SILF.equals(SILF.trim(unescape(item[0])),name,caseSensitive))
return item[1]?unescape(item[1]):item[1];}};SILF.appendScript=function(index,src){try{var script=document.createElement("script");script.id="script"+index;script.src=src;script.type="text/javascript";var head=document.getElementsByTagName("head")[0];head.appendChild(script);}
catch(e){SILF.ErrorHandler("SILF.appendScript",e);}};SILF.removeScript=function(index){try{var script=document.getElementById("script"+index);var head=document.getElementsByTagName("head")[0];head.removeChild(script);}
catch(e){SILF.ErrorHandler("SILF.removeScript",e);}};SILF.logEntryFlow=function(){try{var state=SILF.getClientState();if(!state.isLogEntryFlowCookieDefined){SILF.setCookie(SILF.entryFlowCookieName(),"1");if(SILF.logEntryflow&&SILF.loggingURIentry!=""){var sls,sle,p;var u=state.uid;var r=encodeURIComponent(document.referrer);var i=SILF.logCount++;var t=new Date().getTime();if(state.isSlVersionInstalled)
sls=2;else if(state.isSlUpgradeRequired)
sls=1;else
sls=0;if(state.isSlVersionSupported)
sle=1;else if(SILF.Browser=="Chrome"&&SILF.OperatingSystem=="Windows")
sle=1;else
sle=0;var src=SILF.queryTest(SILF.loggingURIentry)+"u="+u+"&s="+sls+"&o="+sle+"&i="+i+'&t='+t+'&an='+SILF.appName+'&av='+SILF.appVersion+'&r='+r;SILF.appendScript(i,src);}}}
catch(e){SILF.ErrorHandler("SILF.logEntryFlow",e);}};SILF.logInstallFlow=function(action){SILF.installState=action;try{if(action==SILF.statusChooseInstall||action==SILF.statusChooseUpgrade)
SILF.setCookie(SILF.installFlowCookieName(),"2",1);else if(action==SILF.statusSuccess||action==SILF.statusChooseReject||action==SILF.statusChooseAbandon)
SILF.clearCookie(SILF.installFlowCookieName());var state=SILF.getClientState();if(action==SILF.statusChooseReject||action==SILF.statusChooseAbandon){}else{SILF.setCookie(SILF.appIdCookieName(),state.uid,24);}
if(SILF.logInstall&&SILF.loggingURIinstall!=""){var u=state.uid;var a=action;var i=SILF.logCount++;var t=new Date().getTime();var src=SILF.queryTest(SILF.loggingURIinstall)+"u="+u+"&a="+a+"&i="+i+'&t='+t+'&an='+SILF.appName+'&av='+SILF.appVersion;SILF.appendScript(i,src);}}
catch(e){SILF.ErrorHandler("SILF.logInstallFlow",e);}};SILF.queryTest=function(testURI){var ret="?";if(testURI.indexOf("?")>0){ret="&";}
return testURI+ret;}
SILF.onLauncherPageLoad=function(){if(document.getElementById(SILF.SilverlightControlHost)){window.onbeforeunload=SILF.onPlayerPageBeforeUnload;SILF.supportedUserAgent=Silverlight.supportedUserAgent(SILF.minSlVersion.split(".")[0]+"."+SILF.minSlVersion.split(".")[1]);SILF.logEntryFlow();Silverlight.__startup()}}
function onSilverlightError(sender,args){if((args.ErrorCode==8001)||(args.ErrorCode==5014)){}else if(args.ErrorCode==8002){Silverlight.onRestartRequired()}else{alert("Debug:  Error Code = "+args.ErrorCode);}}
function onSilverlightLoad(sender){Silverlight.IsVersionAvailableOnLoad(sender);var state=SILF.getClientState();if(state.isSlVersionInstalled){if(state.isLogInstallFlowCookieDefined){SILF.logInstallFlow(SILF.statusSuccess);}}}
SILF.showSlate=function(slate){document.getElementById(SILF.SilverlightControlHost).innerHTML=slate}
Silverlight.onRestartRequired=function(){SILF.logInstallFlow(SILF.statusShowRestart);SILF.showSlate(SILF.PromptRestart);};Silverlight.onUpgradeRequired=function(){SILF.logInstallFlow(SILF.statusShowUpgrade);if(SILF.CheckSupported(SILF.PromptUpgrade)){}};Silverlight.onInstallRequired=function(){SILF.logInstallFlow(SILF.statusShowInstall);if(SILF.CheckSupported(SILF.PromptInstall)){}};SILF.UpgradeClicked=function(){SILF.logInstallFlow(SILF.statusChooseUpgrade);SILF.showSlate(SILF.PromptFinishUpgrade);if(SILF.Browser=="Chrome"&&SILF.OperatingSystem=="Windows"){Silverlight.followFWLink("156091");}else{Silverlight.followFWLink("149156&v="+SILF.minSlVersion);}}
SILF.InstallClicked=function(){SILF.logInstallFlow(SILF.statusChooseInstall);SILF.showSlate(SILF.PromptFinishInstall);if(SILF.Browser=="Chrome"&&SILF.OperatingSystem=="Windows"){Silverlight.followFWLink("156091");}else{Silverlight.followFWLink("149156&v="+SILF.minSlVersion);}}
SILF.CheckSupported=function(msg){var supported=SILF.supportedUserAgent;if(parseInt(SILF.minSlVersion.split(".")[0])<4&&SILF.Browser=="Chrome"&&SILF.OperatingSystem=="Windows"){if((typeof(SILF.PromptNotTested)!="undefined")&&(SILF.PromptNotTested!="")){msg=msg.replace(/<!--warn-->/i,SILF.PromptNotTested);}}
if(supported){SILF.showSlate(msg);if(parseInt(SILF.minSlVersion.split(".")[0])<4&&SILF.Browser=="Chrome"&&SILF.OperatingSystem=="Windows"){if((typeof(SILF.WarningNotTested)!="undefined")&&(SILF.WarningNotTested!="")){alert(SILF.WarningNotTested);}}
return(true);}else{SILF.logInstallFlow(SILF.statusShowUnsupported);if(SILF.RedirectNotSupported!=""){window.location=SILF.RedirectNotSupported;}else{SILF.showSlate(SILF.PromptNotSupported);}
return(false);}}
SILF.OperatingSystem="";SILF.Browser="";Silverlight.supportedUserAgent=function(version,userAgent){try{var ua=null;if(userAgent){ua=userAgent;}
else{ua=window.navigator.userAgent;}
var slua={OS:'Unsupported',Browser:'Unsupported'};v=SILF.parseVersion(version);if(ua.indexOf('Windows NT')>=0||ua.indexOf('Mozilla/4.0 (compatible; MSIE 6.0)')>=0){slua.OS='Windows';}
else if(ua.indexOf('PPC Mac OS X')>=0){slua.OS='MacPPC';}
else if(ua.indexOf('Intel Mac OS X')>=0){slua.OS='MacIntel';}
else if(ua.indexOf('Linux')>=0){slua.OS='Linux';}
SILF.OperatingSystem=slua.OS;if(slua.OS!='Unsupported'){if(ua.indexOf('MSIE')>=0){if(navigator.userAgent.indexOf('Win64')==-1){if(parseInt(ua.split('MSIE')[1])>=6){slua.Browser='MSIE';}}}
else if(ua.indexOf('Firefox')>=0){var versionArr=ua.split('Firefox/')[1].split('.');var major=parseInt(versionArr[0]);if(major>=2){slua.Browser='Firefox';}
else{var minor=parseInt(versionArr[1]);if((major==1)&&(minor>=5)){slua.Browser='Firefox';}}}
else if(ua.indexOf('Chrome')>=0){slua.Browser='Chrome';}
else if(ua.indexOf('Safari')>=0){slua.Browser='Safari';}}
SILF.Browser=slua.Browser;return!((slua.OS=="Unsupported")||(slua.OS=="Linux"&&v<3)||(slua.OS=="MacPPC"&&v>1)||(slua.OS=="MacPPC"&&slua.Browser=="MSIE")||(slua.OS=="MacIntel"&&slua.Browser=="MSIE")||(slua.OS=="Windows"&&slua.Browser=="Safari")||(slua.Browser=="Unsupported")||(ua.indexOf("Windows NT 5.0")>=0&&v<2)||(slua.OS=="Windows"&&slua.Browser=="Chrome"&&v<3));}
catch(e){return false;}}
SILF.parseVersion=function(value)
{try
{if(value)
{var array=value.split(".");if(array.length>1)
{var major=parseInt(array[0]);if(isNaN(major)||major<2)
return 1;else
return parseFloat(array[0]+"."+array[1]);}}
return NaN;}
catch(x)
{SILF.handleError("SIFL.parseVersion",x);}};Math.uuid=(function(){var h='0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'.split('');return function(f,c){var d=h,a=[],g=Math.random;c=c||d.length;if(f){for(var b=0;b<f;b++)a[b]=d[0|g()*c]}else{var e;a[8]=a[13]=a[18]=a[23]='-';a[14]='4';for(var b=0;b<36;b++){if(!a[b]){e=0|g()*16;a[b]=d[(b==19)?(e&0x3)|0x8:e&0xf]}}}return a.join('').toLowerCase()}})();;var swfobject=function(){var D="undefined",r="object",S="Shockwave Flash",W="ShockwaveFlash.ShockwaveFlash",q="application/x-shockwave-flash",R="SWFObjectExprInst",x="onreadystatechange",O=window,j=document,t=navigator,T=false,U=[h],o=[],N=[],I=[],l,Q,E,B,J=false,a=false,n,G,m=true,M=function(){var aa=typeof j.getElementById!=D&&typeof j.getElementsByTagName!=D&&typeof j.createElement!=D,ah=t.userAgent.toLowerCase(),Y=t.platform.toLowerCase(),ae=Y?/win/.test(Y):/win/.test(ah),ac=Y?/mac/.test(Y):/mac/.test(ah),af=/webkit/.test(ah)?parseFloat(ah.replace(/^.*webkit\/(\d+(\.\d+)?).*$/,"$1")):false,X=!+"\v1",ag=[0,0,0],ab=null;if(typeof t.plugins!=D&&typeof t.plugins[S]==r){ab=t.plugins[S].description;if(ab&&!(typeof t.mimeTypes!=D&&t.mimeTypes[q]&&!t.mimeTypes[q].enabledPlugin)){T=true;X=false;ab=ab.replace(/^.*\s+(\S+\s+\S+$)/,"$1");ag[0]=parseInt(ab.replace(/^(.*)\..*$/,"$1"),10);ag[1]=parseInt(ab.replace(/^.*\.(.*)\s.*$/,"$1"),10);ag[2]=/[a-zA-Z]/.test(ab)?parseInt(ab.replace(/^.*[a-zA-Z]+(.*)$/,"$1"),10):0}}else{if(typeof O.ActiveXObject!=D){try{var ad=new ActiveXObject(W);if(ad){ab=ad.GetVariable("$version");if(ab){X=true;ab=ab.split(" ")[1].split(",");ag=[parseInt(ab[0],10),parseInt(ab[1],10),parseInt(ab[2],10)]}}}catch(Z){}}}return{w3:aa,pv:ag,wk:af,ie:X,win:ae,mac:ac}}(),k=function(){if(!M.w3){return}if((typeof j.readyState!=D&&j.readyState=="complete")||(typeof j.readyState==D&&(j.getElementsByTagName("body")[0]||j.body))){f()}if(!J){if(typeof j.addEventListener!=D){j.addEventListener("DOMContentLoaded",f,false)}if(M.ie&&M.win){j.attachEvent(x,function(){if(j.readyState=="complete"){j.detachEvent(x,arguments.callee);f()}});if(O==top){(function(){if(J){return}try{j.documentElement.doScroll("left")}catch(X){setTimeout(arguments.callee,0);return}f()})()}}if(M.wk){(function(){if(J){return}if(!/loaded|complete/.test(j.readyState)){setTimeout(arguments.callee,0);return}f()})()}s(f)}}();function f(){if(J){return}try{var Z=j.getElementsByTagName("body")[0].appendChild(C("span"));Z.parentNode.removeChild(Z)}catch(aa){return}J=true;var X=U.length;for(var Y=0;Y<X;Y++){U[Y]()}}function K(X){if(J){X()}else{U[U.length]=X}}function s(Y){if(typeof O.addEventListener!=D){O.addEventListener("load",Y,false)}else{if(typeof j.addEventListener!=D){j.addEventListener("load",Y,false)}else{if(typeof O.attachEvent!=D){i(O,"onload",Y)}else{if(typeof O.onload=="function"){var X=O.onload;O.onload=function(){X();Y()}}else{O.onload=Y}}}}}function h(){if(T){V()}else{H()}}function V(){var X=j.getElementsByTagName("body")[0];var aa=C(r);aa.setAttribute("type",q);var Z=X.appendChild(aa);if(Z){var Y=0;(function(){if(typeof Z.GetVariable!=D){var ab=Z.GetVariable("$version");if(ab){ab=ab.split(" ")[1].split(",");M.pv=[parseInt(ab[0],10),parseInt(ab[1],10),parseInt(ab[2],10)]}}else{if(Y<10){Y++;setTimeout(arguments.callee,10);return}}X.removeChild(aa);Z=null;H()})()}else{H()}}function H(){var ag=o.length;if(ag>0){for(var af=0;af<ag;af++){var Y=o[af].id;var ab=o[af].callbackFn;var aa={success:false,id:Y};if(M.pv[0]>0){var ae=c(Y);if(ae){if(F(o[af].swfVersion)&&!(M.wk&&M.wk<312)){w(Y,true);if(ab){aa.success=true;aa.ref=z(Y);ab(aa)}}else{if(o[af].expressInstall&&A()){var ai={};ai.data=o[af].expressInstall;ai.width=ae.getAttribute("width")||"0";ai.height=ae.getAttribute("height")||"0";if(ae.getAttribute("class")){ai.styleclass=ae.getAttribute("class")}if(ae.getAttribute("align")){ai.align=ae.getAttribute("align")}var ah={};var X=ae.getElementsByTagName("param");var ac=X.length;for(var ad=0;ad<ac;ad++){if(X[ad].getAttribute("name").toLowerCase()!="movie"){ah[X[ad].getAttribute("name")]=X[ad].getAttribute("value")}}P(ai,ah,Y,ab)}else{p(ae);if(ab){ab(aa)}}}}}else{w(Y,true);if(ab){var Z=z(Y);if(Z&&typeof Z.SetVariable!=D){aa.success=true;aa.ref=Z}ab(aa)}}}}}function z(aa){var X=null;var Y=c(aa);if(Y&&Y.nodeName=="OBJECT"){if(typeof Y.SetVariable!=D){X=Y}else{var Z=Y.getElementsByTagName(r)[0];if(Z){X=Z}}}return X}function A(){return!a&&F("6.0.65")&&(M.win||M.mac)&&!(M.wk&&M.wk<312)}function P(aa,ab,X,Z){a=true;E=Z||null;B={success:false,id:X};var ae=c(X);if(ae){if(ae.nodeName=="OBJECT"){l=g(ae);Q=null}else{l=ae;Q=X}aa.id=R;if(typeof aa.width==D||(!/%$/.test(aa.width)&&parseInt(aa.width,10)<310)){aa.width="310"}if(typeof aa.height==D||(!/%$/.test(aa.height)&&parseInt(aa.height,10)<137)){aa.height="137"}j.title=j.title.slice(0,47)+" - Flash Player Installation";var ad=M.ie&&M.win?"ActiveX":"PlugIn",ac="MMredirectURL="+O.location.toString().replace(/&/g,"%26")+"&MMplayerType="+ad+"&MMdoctitle="+j.title;if(typeof ab.flashvars!=D){ab.flashvars+="&"+ac}else{ab.flashvars=ac}if(M.ie&&M.win&&ae.readyState!=4){var Y=C("div");X+="SWFObjectNew";Y.setAttribute("id",X);ae.parentNode.insertBefore(Y,ae);ae.style.display="none";(function(){if(ae.readyState==4){ae.parentNode.removeChild(ae)}else{setTimeout(arguments.callee,10)}})()}u(aa,ab,X)}}function p(Y){if(M.ie&&M.win&&Y.readyState!=4){var X=C("div");Y.parentNode.insertBefore(X,Y);X.parentNode.replaceChild(g(Y),X);Y.style.display="none";(function(){if(Y.readyState==4){Y.parentNode.removeChild(Y)}else{setTimeout(arguments.callee,10)}})()}else{Y.parentNode.replaceChild(g(Y),Y)}}function g(ab){var aa=C("div");if(M.win&&M.ie){aa.innerHTML=ab.innerHTML}else{var Y=ab.getElementsByTagName(r)[0];if(Y){var ad=Y.childNodes;if(ad){var X=ad.length;for(var Z=0;Z<X;Z++){if(!(ad[Z].nodeType==1&&ad[Z].nodeName=="PARAM")&&!(ad[Z].nodeType==8)){aa.appendChild(ad[Z].cloneNode(true))}}}}}return aa}function u(ai,ag,Y){var X,aa=c(Y);if(M.wk&&M.wk<312){return X}if(aa){if(typeof ai.id==D){ai.id=Y}if(M.ie&&M.win){var ah="";for(var ae in ai){if(ai[ae]!=Object.prototype[ae]){if(ae.toLowerCase()=="data"){ag.movie=ai[ae]}else{if(ae.toLowerCase()=="styleclass"){ah+=' class="'+ai[ae]+'"'}else{if(ae.toLowerCase()!="classid"){ah+=" "+ae+'="'+ai[ae]+'"'}}}}}var af="";for(var ad in ag){if(ag[ad]!=Object.prototype[ad]){af+='<param name="'+ad+'" value="'+ag[ad]+'" />'}}aa.outerHTML='<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"'+ah+">"+af+"</object>";N[N.length]=ai.id;X=c(ai.id)}else{var Z=C(r);Z.setAttribute("type",q);for(var ac in ai){if(ai[ac]!=Object.prototype[ac]){if(ac.toLowerCase()=="styleclass"){Z.setAttribute("class",ai[ac])}else{if(ac.toLowerCase()!="classid"){Z.setAttribute(ac,ai[ac])}}}}for(var ab in ag){if(ag[ab]!=Object.prototype[ab]&&ab.toLowerCase()!="movie"){e(Z,ab,ag[ab])}}aa.parentNode.replaceChild(Z,aa);X=Z}}return X}function e(Z,X,Y){var aa=C("param");aa.setAttribute("name",X);aa.setAttribute("value",Y);Z.appendChild(aa)}function y(Y){var X=c(Y);if(X&&X.nodeName=="OBJECT"){if(M.ie&&M.win){X.style.display="none";(function(){if(X.readyState==4){b(Y)}else{setTimeout(arguments.callee,10)}})()}else{X.parentNode.removeChild(X)}}}function b(Z){var Y=c(Z);if(Y){for(var X in Y){if(typeof Y[X]=="function"){Y[X]=null}}Y.parentNode.removeChild(Y)}}function c(Z){var X=null;try{X=j.getElementById(Z)}catch(Y){}return X}function C(X){return j.createElement(X)}function i(Z,X,Y){Z.attachEvent(X,Y);I[I.length]=[Z,X,Y]}function F(Z){var Y=M.pv,X=Z.split(".");X[0]=parseInt(X[0],10);X[1]=parseInt(X[1],10)||0;X[2]=parseInt(X[2],10)||0;return(Y[0]>X[0]||(Y[0]==X[0]&&Y[1]>X[1])||(Y[0]==X[0]&&Y[1]==X[1]&&Y[2]>=X[2]))?true:false}function v(ac,Y,ad,ab){if(M.ie&&M.mac){return}var aa=j.getElementsByTagName("head")[0];if(!aa){return}var X=(ad&&typeof ad=="string")?ad:"screen";if(ab){n=null;G=null}if(!n||G!=X){var Z=C("style");Z.setAttribute("type","text/css");Z.setAttribute("media",X);n=aa.appendChild(Z);if(M.ie&&M.win&&typeof j.styleSheets!=D&&j.styleSheets.length>0){n=j.styleSheets[j.styleSheets.length-1]}G=X}if(M.ie&&M.win){if(n&&typeof n.addRule==r){n.addRule(ac,Y)}}else{if(n&&typeof j.createTextNode!=D){n.appendChild(j.createTextNode(ac+" {"+Y+"}"))}}}function w(Z,X){if(!m){return}var Y=X?"visible":"hidden";if(J&&c(Z)){c(Z).style.visibility=Y}else{v("#"+Z,"visibility:"+Y)}}function L(Y){var Z=/[\\\"<>\.;]/;var X=Z.exec(Y)!=null;return X&&typeof encodeURIComponent!=D?encodeURIComponent(Y):Y}var d=function(){if(M.ie&&M.win){window.attachEvent("onunload",function(){var ac=I.length;for(var ab=0;ab<ac;ab++){I[ab][0].detachEvent(I[ab][1],I[ab][2])}var Z=N.length;for(var aa=0;aa<Z;aa++){y(N[aa])}for(var Y in M){M[Y]=null}M=null;for(var X in swfobject){swfobject[X]=null}swfobject=null})}}();return{registerObject:function(ab,X,aa,Z){if(M.w3&&ab&&X){var Y={};Y.id=ab;Y.swfVersion=X;Y.expressInstall=aa;Y.callbackFn=Z;o[o.length]=Y;w(ab,false)}else{if(Z){Z({success:false,id:ab})}}},getObjectById:function(X){if(M.w3){return z(X)}},embedSWF:function(ab,ah,ae,ag,Y,aa,Z,ad,af,ac){var X={success:false,id:ah};if(M.w3&&!(M.wk&&M.wk<312)&&ab&&ah&&ae&&ag&&Y){w(ah,false);K(function(){ae+="";ag+="";var aj={};if(af&&typeof af===r){for(var al in af){aj[al]=af[al]}}aj.data=ab;aj.width=ae;aj.height=ag;var am={};if(ad&&typeof ad===r){for(var ak in ad){am[ak]=ad[ak]}}if(Z&&typeof Z===r){for(var ai in Z){if(typeof am.flashvars!=D){am.flashvars+="&"+ai+"="+Z[ai]}else{am.flashvars=ai+"="+Z[ai]}}}if(F(Y)){var an=u(aj,am,ah);if(aj.id==ah){w(ah,true)}X.success=true;X.ref=an}else{if(aa&&A()){aj.data=aa;P(aj,am,ah,ac);return}else{w(ah,true)}}if(ac){ac(X)}})}else{if(ac){ac(X)}}},switchOffAutoHideShow:function(){m=false},ua:M,getFlashPlayerVersion:function(){return{major:M.pv[0],minor:M.pv[1],release:M.pv[2]}},hasFlashPlayerVersion:F,createSWF:function(Z,Y,X){if(M.w3){return u(Z,Y,X)}else{return undefined}},showExpressInstall:function(Z,aa,X,Y){if(M.w3&&A()){P(Z,aa,X,Y)}},removeSWF:function(X){if(M.w3){y(X)}},createCSS:function(aa,Z,Y,X){if(M.w3){v(aa,Z,Y,X)}},addDomLoadEvent:K,addLoadEvent:s,getQueryParamValue:function(aa){var Z=j.location.search||j.location.hash;if(Z){if(/\?/.test(Z)){Z=Z.split("?")[1]}if(aa==null){return L(Z)}var Y=Z.split("&");for(var X=0;X<Y.length;X++){if(Y[X].substring(0,Y[X].indexOf("="))==aa){return L(Y[X].substring((Y[X].indexOf("=")+1)))}}}return""},expressInstallCallback:function(){if(a){var X=c(R);if(X&&l){X.parentNode.replaceChild(l,X);if(Q){w(Q,true);if(M.ie&&M.win){l.style.display="block"}}if(E){E(B)}}a=false}}}}();;