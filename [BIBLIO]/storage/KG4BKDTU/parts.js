var _calltime, _type;


if (typeof(_ch) == 'undefined') {
    _ch = "";
}
if (typeof(_radate) == 'undefined') {
    _radate = new Date();
}

if (typeof(_prot) == 'undefined') {
    _prot = document.location.protocol == "https:" ? "https" : "http";
}

function debug(data) {
}

function error(message, e) {
    if (typeof(_ca_enable_error_logs) != 'undefined' && _ca_enable_error_logs) {
        if (typeof(console) != 'undefined' && typeof(console.log) == 'function') {
            console.log("CA: " + message, e);
        }
    }
}

function getNdlNdrParams() {
    var ndl = "", ndr = "", result = "";
    try {
        if (typeof(_ca_ndl) != 'undefined' && _ca_ndl) {
            ndl = _ca_ndl;
        } else {
            ndl = encodeURIComponent(document.location.toString().substr(0, 1000));
        }
        if (typeof(_ca_ndr) != 'undefined' && _ca_ndr) {
            ndr = _ca_ndr;
        } else {
            ndr = encodeURIComponent(document.referrer.toString().substr(0, 1000));
        }
    } catch (e) {
        error("URL set error", e);
    }
    if (ndl) result += "&ndl=" + ndl;
    if (ndr) result += "&ndr=" + ndr;
    return result;
}

function _ratag() {
    if (typeof(_pixel) == "undefined" || !_pixel) {
        error("Tag installation problem: no _pixel");
        return;
    }
    var _rah = "p.raasnet.com";
    var _rad = "";
    try {
        if (typeof(_calltime) != 'undefined') {
            _rad = _radate.getTime() - _calltime;
        }
    } catch (e) {
        error("Can't calculate time dif", e);
    }

    var src = _prot + "://" + _rah + "/partners/universal/in?pid=" + _pixel + "&channel=" + _ch + getNdlNdrParams() + "&pt=" + (_prot == "https" ? "s" : "") + "&et=" + _rad + "&imps=" + _find_calls_by_regxep();
    var node;


    try {
        if (typeof(_type) == 'undefined' || _type == 'image') {
            node = document.createElement('img');
            node.width = 1;
            node.height = 1;
            node.border = 0;
            node.src = src + "&t=i";
            debug('RA.SRC ' + node.src);
            document.body.appendChild(node);
        } else if (_type == 'script') {
            node = document.createElement('script');
            node.src = src;
            debug('RA.SRC ' + node.src);
            document.body.appendChild(node)
        } else if (_type == 'frame') {
            node = document.createElement('iframe');
            (node.frameElement || node).style.cssText = "display: none;";
            node.width = 0;
            node.height = 0;
            node.frameborder = 0;
            node.scrolling = 'no';
            node.src = src + "&t=f";
            debug('RA.SRC ' + node.src);
            document.body.appendChild(node);
        }
    } catch (e) {
        error('ERROR in parts.js -> _raTag', e);
    }
}

var onDOMContent = (function () {
    var ready_event_fired = false;
    var ready_event_listener = function (fn) {

        // Create an idempotent version of the 'fn' function
        var idempotent_fn = function () {
            if (ready_event_fired) {
                return;
            }
            ready_event_fired = true;
            return fn();
        };

        // The DOM ready check for Internet Explorer
        var do_scroll_check = function () {
            if (ready_event_fired) {
                return;
            }

            // If IE is used, use the trick

            try {
                document.documentElement.doScroll('left');
            } catch(e) {
                setTimeout(do_scroll_check, 1);
                return;
            }

            // Execute any waiting functions
            return idempotent_fn();
        };

        // If the browser ready event has already occured
        if (document.readyState === "complete") {
            return idempotent_fn()
        }

        // Mozilla, Opera and webkit nightlies currently support this event
        if (document.addEventListener) {

            // Use the handy event callback
            document.addEventListener("DOMContentLoaded", idempotent_fn, false);

            // A fallback to window.onload, that will always work
            window.addEventListener("load", idempotent_fn, false);

            // If IE event model is used
        } else if (document.attachEvent) {

            // ensure firing before onload; maybe late but safe also for iframes
            document.attachEvent("onreadystatechange", idempotent_fn);

            // A fallback to window.onload, that will always work
            window.attachEvent("onload", idempotent_fn);

            // If IE and not a frame: continually check to see if the document is ready
            var toplevel = false;

            try {
                toplevel = window.frameElement == null;
            } catch (e) {}

            if (document.documentElement.doScroll && toplevel) {
                return do_scroll_check();
            }
        }
    };
    return ready_event_listener;
})();



function _find_calls_by_regxep(regexp) {
    var found =0;
    try {


        var regexString = regexp || 'ad.doubleclick.net/adj(.+)(300x250|728x90|120x600|160x600)';


        var regex = new RegExp(regexString);

        //var tagsWithSrc = ['img' , 'script',  'iframe' ];
        var tagsWithSrc = ['script',  'iframe'];
        var tagsWithSrcLen = tagsWithSrc.length;
        var elementsSrc = [];

        while (tagsWithSrcLen--) {
            var elsArray = document.getElementsByTagName(tagsWithSrc[tagsWithSrcLen]);
            var elsArrayLen = elsArray.length;
            while (elsArrayLen--) {
                if (!!elsArray[elsArrayLen].src ) {

                    var cnt = 0;
                    if (regex.exec(elsArray[elsArrayLen].src)){

                        found++;
                        cnt =  found;
                        elementsSrc.push(elsArray[elsArrayLen].src);

                    }
                    //debug(cnt + ' ' +  tagsWithSrc[tagsWithSrcLen] + ': ' + elsArray[elsArrayLen].src);

                }
            }
        }
        return found;
    } catch (e) {
        error('ERROR in parts.js -> _find_calls_by_regxep', e);
        return found;
    }

}



onDOMContent(_ratag);