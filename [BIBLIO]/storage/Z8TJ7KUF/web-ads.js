/*!
 * jQuery Cookie Plugin
 * https://github.com/carhartl/jquery-cookie
 *
 * Copyright 2011, Klaus Hartl
 * Dual licensed under the MIT or GPL Version 2 licenses.
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.opensource.org/licenses/GPL-2.0
 */
(function($) {
    $.adCookie = function(key, value, options) {

        // key and at least value given, set cookie...
        if (arguments.length > 1 && (!/Object/.test(Object.prototype.toString.call(value)) || value === null || value === undefined)) {
            options = $.extend({}, options);

            if (value === null || value === undefined) {
                options.expires = -1;
            }

            if (typeof options.expires === 'number') {
                var days = options.expires, t = options.expires = new Date();
                t.setDate(t.getDate() + days);
            }

            value = String(value);

            return (document.cookie = [
                encodeURIComponent(key), '=', options.raw ? value : encodeURIComponent(value),
                options.expires ? '; expires=' + options.expires.toUTCString() : '', // use expires attribute, max-age is not supported by IE
                options.path    ? '; path=' + options.path : '',
                options.domain  ? '; domain=' + options.domain : '',
                options.secure  ? '; secure' : ''
            ].join(''));
        }

        // key and possibly options given, get cookie...
        options = value || {};
        var decode = options.raw ? function(s) { return s; } : decodeURIComponent;

        var pairs = document.cookie.split('; ');
        for (var i = 0, pair; pair = pairs[i] && pairs[i].split('='); i++) {
            if (decode(pair[0]) === key) return decode(pair[1] || ''); // IE saves cookies with empty string as "c; ", e.g. without "=" as opposed to EOMB, thus pair[1] may be undefined
        }
        return null;
    };
})(jQuery);

/*****/
if (typeof (WebAds) == "undefined") {
    var WebAds = {};
}

WebAds.checkShowIpad = function (objAdParameters) {
    var cookieName = "iPadWebAds.1.0.0";
    if (navigator.userAgent.match(/iPad/i)) {
        if ($.adCookie(cookieName)) {
            return false;
        }
        else {
            $.adCookie(cookieName, "shown", { expires: 31 });
            return true;
        }
    }

    return false;
};

WebAds.sendOrientation = function() {
	var theframes = $(".cnResponsiveAd");
	theframes.each(function () {
		this.contentWindow.postMessage({orientation: window.orientation % 180 == 0 ? "portrait" : "landscape"}, "*");		
	});
};

WebAds.setFrameHeight = function (frameSrcUrl, height) {
    var sourceFrame = $("iframe[src='" + frameSrcUrl + "']");
    sourceFrame.height(height);
    sourceFrame.css("visibility", "visible");
};

if (window.addEventListener) {
	window.addEventListener("orientationchange", function (evt) {
		WebAds.sendOrientation();
	});
}

$(document).ready(function () {
    if (window.addEventListener) {
        window.addEventListener("message",
		function (evt) {
		    if (typeof (evt.data.height) != "undefined") {
		        WebAds.setFrameHeight(evt.data.url, evt.data.height);
		    }
		});
        WebAds.sendOrientation();
    }
});



