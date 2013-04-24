/* OnlineOpinion v5.1.11 */
/* Released: 4/21/2011 */
/* Components: Tiny
/* The following code is Copyright 1998-2011 Opinionlab, Inc.  All rights reserved. Unauthorized use is prohibited. This product and other products of OpinionLab, Inc. are protected by U.S. Patent No. 6606581, 6421724, 6785717 B1 and other patents pending. http://www.opinionlab.com */

var OOo = function(options) {
  var self = this;
  self.t1 = (new Date()).getTime();
  self.r = options.domain ? location.href.replace(/^(https?:\/\/)[^\/]*/, '$1' + options.domain) : location.href;
  self.cV = options.customVariables || '';
  self.tI = options.tealeafId || '';

  if (Math.random() >= 1 - options.onEntry/100) {
    self.show();
    options.onExit = 0;
  }

  if (Math.random() >= 1 - options.onExit/100) {
    var oldOnUnload = window.onunload || function(){};
    window.onunload = function() {
      oldOnUnload();
      self.show.call(self);
    };
  }
};

OOo.prototype = {
    show: function() {
        
        var self = this,
            screenWidth = screen.availWidth,
            screenHeight = screen.availHeight,
            popup = {
                url: 'https://secure.opinionlab.com/ccc01/comment_card_d.asp?referer=' + encodeURIComponent(self.r) + '&prev=' + encodeURIComponent(document.referrer) + '&time1=' + self.t1 + '&time2=' + (new Date()).getTime()+'&ocodeVersion=5.1.11&customVars='+encodeURIComponent(self.cV)+'&custom_var='+self.tI,
                name: 'OnlineOpinion',
                props: 'location=no,status=no,width=545,height=500,left=' + (screenWidth-545)/2 + ',top=' + (screenHeight-600)/2
            };
            
        window.open(popup.url, popup.name, popup.props);
        
  }
};