var tracking = tracking || {};
;
var tracking = tracking || {};

tracking.omniture = function() {
  sanitize = function(str) {
    return str.replace(/[^A-Za-z0-9\-\s]*/g, '');
  };

  return {
    search: function(terms) {
      // update a search event
      var s=s_gi(s_account);
      s.linkTrackVars='prop14,eVar12,events';
      s.linkTrackEvents='event1';
      s.eVar12=s.prop14=terms;
      s.events='event1';
      s.tl(this,'o','Internal Search');
    },
    pageView: function(pageName, pageNum, path) {
      // Page view event
      if ( pageName ) {
         // replicate the transformations to the pageName in PHP.
         s.pageName = s.server + ':';
         s.pageName += s.channel + ':';
         pageName = pageName.replace(/\s+?/g, '-').toLowerCase();
         s.pageName += sanitize(pageName);
      }

      if ( pageNum || pageNum === 0) {
        s.prop13 = String(pageNum);
      }

      s.events='event9';

      s.t();
    }
  };
}();
;
/*
 *  Sharrre.com - Make your sharing widget!
 *  Version: beta 1.3.3 
 *  Author: Julien Hany
 *  License: MIT http://en.wikipedia.org/wiki/MIT_License or GPLv2 http://en.wikipedia.org/wiki/GNU_General_Public_License
 */
eval(function(p,a,c,k,e,r){e=function(c){return(c<a?'':e(parseInt(c/a)))+((c=c%a)>35?String.fromCharCode(c+29):c.toString(36))};if(!''.replace(/^/,String)){while(c--)r[e(c)]=k[c]||e(c);k=[function(e){return r[e]}];e=function(){return'\\w+'};c=1};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p}(';(6($,g,h,i){l j=\'2f\',2h={3i:\'2f\',N:{O:E,C:E,z:E,I:E,r:E,L:E,K:E,A:E},2q:0,1a:\'\',13:\'\',3:h.3h.1b,x:h.13,1q:\'2f.3d\',y:{},1o:0,1w:w,3c:w,3b:w,29:E,2c:6(){},39:6(){},1P:6(){},2g:6(){},8:{O:{3:\'\',15:E,1i:\'38\',14:\'36-4Z\',28:\'\'},C:{3:\'\',15:E,S:\'1M\',Z:\'4W\',G:\'\',1A:\'E\',2l:\'E\',2m:\'\',1B:\'\',14:\'4S\'},z:{3:\'\',15:E,2r:\'\',y:\'34\',2v:\'\',19:\'\',1I:\'\',14:\'36\'},I:{3:\'\',15:E,Q:\'4L\'},r:{3:\'\',15:E,1i:\'38\'},L:{3:\'\',15:E,Z:\'1\'},K:{3:\'\',15:E,2a:\'\'},A:{3:\'\',1C:\'\',1s:\'\',Z:\'34\'}}},1n={O:"",C:"1D://4K.C.o/4y?q=4v%2Y,%4k,%4j,%4i,%4g,%4f,3j,%46,%45%43%42%41%2Y=%27{3}%27&1y=?",z:"T://3X.3Q.z.o/1/3E/y.2H?3={3}&1y=?",I:"T://3m.I.o/2.0/5c.5a?55={3}&Q=1c&1y=?",r:\'T://53.r.o/4R/2H/4C/m?3={3}&1y=?\',L:"",K:"T://1p.K.o/4A/y/N?4s=4p&3={3}&1y=?",A:""},2B={O:6(b){l c=b.4.8.O;$(b.p).X(\'.8\').12(\'<n H="U 4e"><n H="g-26" m-1i="\'+c.1i+\'" m-1b="\'+(c.3!==\'\'?c.3:b.4.3)+\'" m-28="\'+c.28+\'"></n></n>\');g.40={14:b.4.8.O.14};l d=0;9(B 2y===\'F\'&&d==0){d=1;(6(){l a=h.1d(\'P\');a.Q=\'x/1c\';a.1h=w;a.17=\'//3x.2x.o/Y/26.Y\';l s=h.1g(\'P\')[0];s.1e.1f(a,s)})()}J{2y.26.3Y()}},C:6(c){l e=c.4.8.C;$(c.p).X(\'.8\').12(\'<n H="U C"><n 2T="1U-47"></n><n H="1U-1M" m-1b="\'+(e.3!==\'\'?e.3:c.4.3)+\'" m-1A="\'+e.1A+\'" m-Z="\'+e.Z+\'" m-G="\'+e.G+\'" m-3v-2l="\'+e.2l+\'" m-S="\'+e.S+\'" m-2m="\'+e.2m+\'" m-1B="\'+e.1B+\'" m-19="\'+e.19+\'"></n></n>\');l f=0;9(B 1j===\'F\'&&f==0){f=1;(6(d,s,a){l b,2t=d.1g(s)[0];9(d.3y(a)){1v}b=d.1d(s);b.2T=a;b.17=\'//4d.C.4o/\'+e.14+\'/4u.Y#4D=1\';2t.1e.1f(b,2t)}(h,\'P\',\'C-5i\'))}J{1j.3o.3q()}},z:6(b){l c=b.4.8.z;$(b.p).X(\'.8\').12(\'<n H="U z"><a 1b="1D://z.o/N" H="z-N-U" m-3="\'+(c.3!==\'\'?c.3:b.4.3)+\'" m-y="\'+c.y+\'" m-x="\'+b.4.x+\'" m-19="\'+c.19+\'" m-2v="\'+c.2v+\'" m-1I="\'+c.1I+\'" m-14="\'+c.14+\'" m-2r="\'+c.2r+\'">3r</a></n>\');l d=0;9(B 2k===\'F\'&&d==0){d=1;(6(){l a=h.1d(\'P\');a.Q=\'x/1c\';a.1h=w;a.17=\'//1L.z.o/1F.Y\';l s=h.1g(\'P\')[0];s.1e.1f(a,s)})()}J{$.3D({3:\'//1L.z.o/1F.Y\',3F:\'P\',3G:w})}},I:6(a){l b=a.4.8.I;$(a.p).X(\'.8\').12(\'<n H="U I"><a H="3I \'+b.Q+\'" 3M="3V 3W" 1b="T://I.o/2z?3=\'+V((b.3!==\'\'?b.3:a.4.3))+\'"></a></n>\');l c=0;9(B 44===\'F\'&&c==0){c=1;(6(){l s=h.1d(\'2A\'),25=h.1g(\'2A\')[0];s.Q=\'x/1c\';s.1h=w;s.17=\'//1F.I.o/8.Y\';25.1e.1f(s,25)})()}},r:6(a){9(a.4.8.r.1i==\'4h\'){l b=\'G:2s;\',2u=\'D:2C;G:2s;1B-1i:4z;1t-D:2C;\',2o=\'D:2D;1t-D:2D;2n-51:1G;\'}J{l b=\'G:54;\',2u=\'2j:59;2i:0 1G;D:1u;G:5d;1t-D:1u;\',2o=\'2j:5g;D:1u;1t-D:1u;\'}l c=a.1w(a.4.y.r);9(B c==="F"){c=0}$(a.p).X(\'.8\').12(\'<n H="U r"><n 1S="\'+b+\'1B:5j 5k,5l,5n-5t;3k:3l;1R:#3n;2E:3p-2F;2j:2G;D:1u;1t-D:3s;2n:0;2i:0;x-3t:0;3u-2e:3w;">\'+\'<n 1S="\'+2u+\'2I-1R:#2J;2n-3z:3A;3B:3C;x-2e:2K;1O:2L 2M #3H;1O-2N:1G;">\'+c+\'</n>\'+\'<n 1S="\'+2o+\'2E:2F;2i:0;x-2e:2K;x-3J:2G;G:2s;2I-1R:#3K;1O:2L 2M #3L;1O-2N:1G;1R:#2J;">\'+\'<2O 17="T://1p.r.o/3N/2O/r.3O.3P" D="10" G="10" 3R="3S" /> 3T</n></n></n>\');$(a.p).X(\'.r\').3U(\'1P\',6(){a.2P(\'r\')})},L:6(b){l c=b.4.8.L;$(b.p).X(\'.8\').12(\'<n H="U L"><2Q:2b Z="\'+c.Z+\'" 3h="\'+(c.3!==\'\'?c.3:b.4.3)+\'"></2Q:2b></n>\');l d=0;9(B 1E===\'F\'&&d==0){d=1;(6(){l a=h.1d(\'P\');a.Q=\'x/1c\';a.1h=w;a.17=\'//1L.L.o/1/1F.Y\';l s=h.1g(\'P\')[0];s.1e.1f(a,s)})();s=g.3Z(6(){9(B 1E!==\'F\'){1E.2R();24(s)}},23)}J{1E.2R()}},K:6(b){l c=b.4.8.K;$(b.p).X(\'.8\').12(\'<n H="U K"><P Q="22/N" m-3="\'+(c.3!==\'\'?c.3:b.4.3)+\'" m-2a="\'+c.2a+\'"></P></n>\');l d=0;9(B g.2S===\'F\'&&d==0){d=1;(6(){l a=h.1d(\'P\');a.Q=\'x/1c\';a.1h=w;a.17=\'//1L.K.o/22.Y\';l s=h.1g(\'P\')[0];s.1e.1f(a,s)})()}J{g.2S.1K()}},A:6(b){l c=b.4.8.A;$(b.p).X(\'.8\').12(\'<n H="U A"><a 1b="T://A.o/1J/1Z/U/?3=\'+(c.3!==\'\'?c.3:b.4.3)+\'&1C=\'+c.1C+\'&1s=\'+c.1s+\'" H="1J-48-U" y-Z="\'+c.Z+\'">49 4a</a></n>\');(6(){l a=h.1d(\'P\');a.Q=\'x/1c\';a.1h=w;a.17=\'//4b.A.o/Y/4c.Y\';l s=h.1g(\'P\')[0];s.1e.1f(a,s)})()}},2w={O:6(){},C:6(){1U=g.2U(6(){9(B 1j!==\'F\'){1j.1Y.1X(\'2V.1Z\',6(a){1m.1l([\'1k\',\'C\',\'1M\',a])});1j.1Y.1X(\'2V.4l\',6(a){1m.1l([\'1k\',\'C\',\'4m\',a])});1j.1Y.1X(\'4n.1A\',6(a){1m.1l([\'1k\',\'C\',\'1A\',a])});24(1U)}},2W)},z:6(){2X=g.2U(6(){9(B 2k!==\'F\'){2k.4q.4r(\'1H\',6(a){9(a){1m.1l([\'1k\',\'z\',\'1H\'])}});24(2X)}},2W)},I:6(){},r:6(){},L:6(){},K:6(){6 4t(){1m.1l([\'1k\',\'K\',\'N\'])}},A:6(){}},2Z={O:6(a){g.16("1D://4w.2x.o/N?4x="+a.8.O.14+"&3="+V((a.8.O.3!==\'\'?a.8.O.3:a.3)),"","18=0, 1V=0, G=30, D=23")},C:6(a){g.16("T://1p.C.o/31/31.3d?u="+V((a.8.C.3!==\'\'?a.8.C.3:a.3))+"&t="+a.x+"","","18=0, 1V=0, G=30, D=23")},z:6(a){g.16("1D://z.o/4B/1H?x="+V(a.x)+"&3="+V((a.8.z.3!==\'\'?a.8.z.3:a.3))+(a.8.z.19!==\'\'?\'&19=\'+a.8.z.19:\'\'),"","18=0, 1V=0, G=32, D=33")},I:6(a){g.16("T://I.o/4E/4F/2z?3="+V((a.8.I.3!==\'\'?a.8.I.3:a.3))+"&13="+a.x+"&1I=w&1S=w","","18=0, 1V=0, G=32, D=33")},r:6(a){g.16(\'T://1p.r.o/4G?v=5&4H&4I=4J&3=\'+V((a.8.r.3!==\'\'?a.8.r.3:a.3))+\'&13=\'+a.x,\'r\',\'18=1N,G=1r,D=1r\')},L:6(a){g.16(\'T://1p.L.o/2b/?3=\'+V((a.8.r.3!==\'\'?a.8.r.3:a.3)),\'L\',\'18=1N,G=1r,D=1r\')},K:6(a){g.16(\'1D://1p.K.o/4M/N?3=\'+V((a.8.r.3!==\'\'?a.8.r.3:a.3))+\'&4N=&4O=w\',\'K\',\'18=1N,G=1r,D=1r\')},A:6(a){g.16(\'T://A.o/1J/1Z/U/?3=\'+V((a.8.A.3!==\'\'?a.8.A.3:a.3))+\'&1C=\'+V(a.8.A.1C)+\'&1s=\'+a.8.A.1s,\'A\',\'18=1N,G=4P,D=4Q\')}};6 R(a,b){7.p=a;7.4=$.4T(w,{},2h,b);7.4.N=b.N;7.4U=2h;7.4V=j;7.1K()};R.W.1K=6(){l c=7;9(7.4.1q!==\'\'){1n.O=7.4.1q+\'?3={3}&Q=O\';1n.L=7.4.1q+\'?3={3}&Q=L\';1n.A=7.4.1q+\'?3={3}&Q=A\'}$(7.p).4X(7.4.3i);9(B $(7.p).m(\'13\')!==\'F\'){7.4.13=$(7.p).4Y(\'m-13\')}9(B $(7.p).m(\'3\')!==\'F\'){7.4.3=$(7.p).m(\'3\')}9(B $(7.p).m(\'x\')!==\'F\'){7.4.x=$(7.p).m(\'x\')}$.1z(7.4.N,6(a,b){9(b===w){c.4.2q++}});9(c.4.3b===w){$.1z(7.4.N,6(a,b){9(b===w){50{c.35(a)}52(e){}}})}J 9(c.4.1a!==\'\'){7.4.2g(7,7.4)}J{7.20()}$(7.p).2c(6(){9($(7).X(\'.8\').37===0&&c.4.3c===w){c.20()}c.4.2c(c,c.4)},6(){c.4.39(c,c.4)});$(7.p).1P(6(){c.4.1P(c,c.4);1v E})};R.W.20=6(){l c=7;$(7.p).12(\'<n H="8"></n>\');$.1z(c.4.N,6(a,b){9(b==w){2B[a](c);9(c.4.29===w){2w[a]()}}})};R.W.35=6(c){l d=7,y=0,3=1n[c].1x(\'{3}\',V(7.4.3));9(7.4.8[c].15===w&&7.4.8[c].3!==\'\'){3=1n[c].1x(\'{3}\',7.4.8[c].3)}9(3!=\'\'&&d.4.1q!==\'\'){$.56(3,6(a){9(B a.y!=="F"){l b=a.y+\'\';b=b.1x(\'\\57\\58\',\'\');y+=2d(b,10)}J 9(a.m&&a.m.37>0&&B a.m[0].3a!=="F"){y+=2d(a.m[0].3a,10)}J 9(B a[0]!=="F"){y+=2d(a[0].5b,10)}J 9(B a[0]!=="F"){}d.4.y[c]=y;d.4.1o+=y;d.21();d.1Q()}).5e(6(){d.4.y[c]=0;d.1Q()})}J{d.21();d.4.y[c]=0;d.1Q()}};R.W.1Q=6(){l a=0;5f(e 22 7.4.y){a++}9(a===7.4.2q){7.4.2g(7,7.4)}};R.W.21=6(){l a=7.4.1o,1a=7.4.1a;9(7.4.1w===w){a=7.1w(a)}9(1a!==\'\'){1a=1a.1x(\'{1o}\',a);$(7.p).1T(1a)}J{$(7.p).1T(\'<n H="5h"><a H="y" 1b="#">\'+a+\'</a>\'+(7.4.13!==\'\'?\'<a H="N" 1b="#">\'+7.4.13+\'</a>\':\'\')+\'</n>\')}};R.W.1w=6(a){9(a>=3e){a=(a/3e).3f(2)+"M"}J 9(a>=3g){a=(a/3g).3f(1)+"k"}1v a};R.W.2P=6(a){2Z[a](7.4);9(7.4.29===w){l b={O:{11:\'5m\',S:\'+1\'},C:{11:\'C\',S:\'1M\'},z:{11:\'z\',S:\'1H\'},I:{11:\'I\',S:\'2p\'},r:{11:\'r\',S:\'2p\'},L:{11:\'L\',S:\'2p\'},K:{11:\'K\',S:\'N\'},A:{11:\'A\',S:\'1J\'}};1m.1l([\'1k\',b[a].11,b[a].S])}};R.W.5o=6(){l a=$(7.p).1T();$(7.p).1T(a.1x(7.4.1o,7.4.1o+1))};R.W.5p=6(a,b){9(a!==\'\'){7.4.3=a}9(b!==\'\'){7.4.x=b}};$.5q[j]=6(b){l c=5r;9(b===i||B b===\'5s\'){1v 7.1z(6(){9(!$.m(7,\'1W\'+j)){$.m(7,\'1W\'+j,5u R(7,b))}})}J 9(B b===\'5v\'&&b[0]!==\'5w\'&&b!==\'1K\'){1v 7.1z(6(){l a=$.m(7,\'1W\'+j);9(a 5x R&&B a[b]===\'6\'){a[b].5y(a,5z.W.5A.5B(c,1))}})}}})(5C,5D,5E);',62,351,'|||url|options||function|this|buttons|if||||||||||||var|data|div|com|element||delicious|||||true|text|count|twitter|pinterest|typeof|facebook|height|false|undefined|width|class|digg|else|linkedin|stumbleupon||share|googlePlus|script|type|Plugin|action|http|button|encodeURIComponent|prototype|find|js|layout||site|append|title|lang|urlCount|open|src|toolbar|via|template|href|javascript|createElement|parentNode|insertBefore|getElementsByTagName|async|size|FB|_trackSocial|push|_gaq|urlJson|total|www|urlCurl|550|description|line|20px|return|shorterTotal|replace|callback|each|send|font|media|https|STMBLPN|widgets|3px|tweet|related|pin|init|platform|like|no|border|click|rendererPerso|color|style|html|fb|status|plugin_|subscribe|Event|create|loadButtons|renderer|in|500|clearInterval|s1|plusone||annotation|enableTracking|counter|badge|hover|parseInt|align|sharrre|render|defaults|padding|float|twttr|faces|colorscheme|margin|cssShare|add|shareTotal|counturl|50px|fjs|cssCount|hashtags|tracking|google|gapi|submit|SCRIPT|loadButton|35px|18px|display|block|none|json|background|fff|center|1px|solid|radius|img|openPopup|su|processWidgets|IN|id|setInterval|edge|1000|tw|20url|popup|900|sharer|650|360|horizontal|getSocialJson|en|length|medium|hide|total_count|enableCounter|enableHover|php|1e6|toFixed|1e3|location|className|commentsbox_count|cursor|pointer|services|666666|XFBML|inline|parse|Tweet|normal|indent|vertical|show|baseline|apis|getElementById|bottom|5px|overflow|hidden|ajax|urls|dataType|cache|ccc|DiggThisButton|decoration|7EACEE|40679C|rel|static|small|gif|api|alt|Delicious|Add|on|nofollow|external|cdn|go|setTimeout|___gcfg|20WHERE|20link_stat|20FROM|__DBW|20click_count|20comments_fbid|root|it|Pin|It|assets|pinit|connect|googleplus|20total_count|20comment_count|tall|20like_count|20share_count|20normalized_url|remove|unlike|message|net|jsonp|events|bind|format|LinkedInShare|all|SELECT|plus|hl|fql|15px|countserv|intent|urlinfo|xfbml|tools|diggthis|save|noui|jump|close|graph|DiggCompact|cws|token|isFramed|700|300|v2|en_US|extend|_defaults|_name|button_count|addClass|attr|US|try|top|catch|feeds|93px|links|getJSON|u00c2|u00a0|right|getInfo|total_posts|story|26px|error|for|left|box|jssdk|12px|Arial|Helvetica|Google|sans|simulateClick|update|fn|arguments|object|serif|new|string|_|instanceof|apply|Array|slice|call|jQuery|window|document'.split('|'),0,{}))
;
(function ($) {
    // Use strict mode to avoid errors: https://developer.mozilla.org/en/JavaScript/Strict_mode
    "use strict";

    Drupal.behaviors.sharrre = function (context) {
        if (typeof(Drupal.settings.sharrre) !== 'undefined') {
            Drupal.sharrre.init({instances:Drupal.settings.sharrre.instances});
        }
    };

    Drupal.sharrre = (function () {
        var config = {},

            sharrreInstance = function (id, settings) {
                $('#' + id).sharrre(settings);
            },

            init = function (options) {
                // Extend config with options
                config = $.extend(config, options);

                var instances = config.instances;

                $.each(instances, function (idx) {
                    sharrreInstance(this.id, this.settings);
                });

                // Move the Fb and Twitter like counts into position above their buttons
                setTimeout(function () {
                    $('.round-counters .facebook').attr("title", $('#count-facebook').text());
                    $('.round-counters .twitter').attr("title", $('#count-twitter').text());
                }, 1500);

            };

        return {
            init:init
        }

    }());

})(jQuery);
;
jQuery.extend(jQuery.browser,
    { SafariMobile : navigator.userAgent.toLowerCase().match(/iP(hone|ad)/i)? true : false }
);
;
/**
 * jQuery Cookie plugin
 *
 * Copyright (c) 2010 Klaus Hartl (stilbuero.de)
 * Dual licensed under the MIT and GPL licenses:
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.gnu.org/licenses/gpl.html
 *
 */
jQuery.cookie = function (key, value, options) {

    // key and at least value given, set cookie...
    if (arguments.length > 1 && String(value) !== "[object Object]") {
        options = jQuery.extend({}, options);

        if (value === null || value === undefined) {
            options.expires = -1;
        }

        if (typeof options.expires === 'number') {
            var days = options.expires, t = options.expires = new Date();
            t.setDate(t.getDate() + days);
        }

        value = String(value);

        return (document.cookie = [
            encodeURIComponent(key), '=',
            options.raw ? value : encodeURIComponent(value),
            options.expires ? '; expires=' + options.expires.toUTCString() : '', // use expires attribute, max-age is not supported by IE
            options.path ? '; path=' + options.path : '',
            options.domain ? '; domain=' + options.domain : '',
            options.secure ? '; secure' : ''
        ].join(''));
    }

    // key and possibly options given, get cookie...
    options = value || {};
    var result, decode = options.raw ? function (s) { return s; } : decodeURIComponent;
    return (result = new RegExp('(?:^|; )' + encodeURIComponent(key) + '=([^;]*)').exec(document.cookie)) ? decode(result[1]) : null;
};
;
/*! http://mths.be/placeholder v1.8.5 by @mathias */
;(function(window, document, $) {

	var isInputSupported = 'placeholder' in document.createElement('input'),
	    isTextareaSupported = 'placeholder' in document.createElement('textarea');

	if (isInputSupported && isTextareaSupported) {

		$.fn.placeholder = function() {
			return this;
		};

		$.fn.placeholder.input = $.fn.placeholder.textarea = true;

	} else {

		$.fn.placeholder = function() {
			return this.filter((isInputSupported ? 'textarea' : ':input') + '[placeholder]')
				.bind('focus.placeholder', clearPlaceholder)
				.bind('blur.placeholder', setPlaceholder)
				.trigger('blur.placeholder').end();
		};

		$.fn.placeholder.input = isInputSupported;
		$.fn.placeholder.textarea = isTextareaSupported;

		$(function() {
			// Look for forms
			$('form').bind('submit.placeholder', function() {
				// Clear the placeholder values so they don’t get submitted
				var $inputs = $('.placeholder', this).each(clearPlaceholder);
				setTimeout(function() {
					$inputs.each(setPlaceholder);
				}, 10);
			});
		});

		// Clear placeholder values upon page reload
		$(window).bind('unload.placeholder', function() {
			$('.placeholder').val('');
		});

	}

	function args(elem) {
		// Return an object of element attributes
		var newAttrs = {},
		    rinlinejQuery = /^jQuery\d+$/;
		$.each(elem.attributes, function(i, attr) {
			if (attr.specified && !rinlinejQuery.test(attr.name)) {
				newAttrs[attr.name] = attr.value;
			}
		});
		return newAttrs;
	}

	function clearPlaceholder() {
		var $input = $(this);
		if ($input.val() === $input.attr('placeholder') && $input.hasClass('placeholder')) {
			if ($input.data('placeholder-password')) {
				$input.hide().next().show().focus().attr('id', $input.removeAttr('id').data('placeholder-id'));
			} else {
				$input.val('').removeClass('placeholder');
			}
		}
	}

	function setPlaceholder() {
		var $replacement,
		    $input = $(this),
		    $origInput = $input,
		    id = this.id;
		if ($input.val() === '') {
			if ($input.is(':password')) {
				if (!$input.data('placeholder-textinput')) {
					try {
						$replacement = $input.clone().attr({ 'type': 'text' });
					} catch(e) {
						$replacement = $('<input>').attr($.extend(args(this), { 'type': 'text' }));
					}
					$replacement
						.removeAttr('name')
						// We could just use the `.data(obj)` syntax here, but that wouldn’t work in pre-1.4.3 jQueries
						.data('placeholder-password', true)
						.data('placeholder-id', id)
						.bind('focus.placeholder', clearPlaceholder);
					$input
						.data('placeholder-textinput', $replacement)
						.data('placeholder-id', id)
						.before($replacement);
				}
				$input = $input.removeAttr('id').hide().prev().attr('id', id).show();
			}
			$input.addClass('placeholder').val($input.attr('placeholder'));
		} else {
			$input.removeClass('placeholder');
		}
	}

}(this, document, jQuery));;
/*
 *  * unwrap - v0.2 - 9/30/2009
 *   * http://benalman.com/projects/jquery-unwrap-plugin/
 *    * 
 *     * Copyright (c) 2009 "Cowboy" Ben Alman
 *      * Licensed under the MIT license
 *       * http://benalman.com/about/license/
 *        */
jQuery.fn.unwrap=function(){return this.parent().each(function(b,a){jQuery.nodeName(a,"body")||jQuery(a).replaceWith(a.childNodes)}).end()};
;
// Ajax block scrolling
// Author: Michael Shick

var AjaxBlockSlide = {

    init: function(options, element) {
        var defaults = {
            limit:    3,
            speed:         800
        };

        this.options = $.extend(defaults, options);

        var element = this.element = $(element);

        this.clickable = true;
        this.c = $('.content-block', element).length;
        this.t = 0;

        var s = this.s = options.limit;
        var w = this.w = $('.content-block:first', element).outerWidth();
        var ts = this.ts = s - 1;
        var d = this.d = $('.block-ajax', element).attr('data-delta');
        var m = this.m = $('.block-ajax', element).attr('data-module');

        $(".prev a", element).hide();
        $(".next a", element).hide();

        var self = this;
        $('.next a', element).click(function() {
            if (self.t + 1 == self.c && self.c < s) {
                self.getContent();
            } else {
                self.animate("next");
                if (self.t >= ts) {
                    $(this).fadeOut();
                }
                $(".prev a", element).fadeIn();
            }
            return false;
        });
        $(".prev a", element).click(function() {
            self.animate("prev");
            if (self.t <= 0) {
                $(this).fadeOut();
            }
            $(".next a", element).fadeIn();
            return false;
        });

        if (this.s > 1) {
            $('.next a', element).fadeIn();
        }
    },

    adjust: function() {
        var element = this.element;
        var w = this.w;
        var t = this.t;
        var ts = this.ts;

        if (t > ts) {
            t = 0;
        }
        if (t < 0) {
            t = ts;
        }
        this.t = t;

        this.clickable = true;
    },

    animate: function(dir) {
        if (this.clickable) {
            this.clickable = false;

            var element = this.element;
            var options = this.options;
            var t = this.t;
            var ts = this.ts;
            var ot = t;
            var w = this.w;

            if (dir == "next") {
                t = (t >= ts) ? ts : t + 1;
            } else {
                t = (t <= 0) ? 0 : t - 1;
            }
            ;
            this.t = t;
            var diff = Math.abs(ot - t);
            var speed = diff * options.speed;
            p = (t * w * -1);
            $('.content-inner', element).animate(
                { marginLeft: p },
                { queue:false, duration:speed, complete:this.adjust(t) }
            );
        }
    },

    getContent: function() {
        var element = this.element;
        var m = this.m;
        var d = this.d;
        var c = this.c;
        var t = this.t;
        var ts = this.ts;

        var self = this;

        $.getJSON('/ajax/' + m + '/trigger/' + d + '/' + c, function(html) {
            $('.content-inner', self.element).append('<div class="content-block">' + html + '</div>');
            self.c = self.c + 1;
            self.animate("next");
            if (t >= ts) {
                $('.next a', element).fadeOut();
            }
            $('.prev a', element).fadeIn();
        });
    }
};

if (typeof Object.create !== 'function') {
    Object.create = function (o) {
        function F() {
        } // optionally move this outside the declaration and into a closure if you need more speed.
        F.prototype = o;
        return new F();
    };
}

(function($) {

    $.fn.ajaxBlockSlide = function(options) {

        // default configuration properties
        var defaults = {
            limit:    3,
            speed:         800
        };

        var options = $.extend(defaults, options);

        if (this.length) {
            return this.each(function() {
                var myBlockSlide = Object.create(AjaxBlockSlide);
                myBlockSlide.init(options, this);
                $.data(this, 'ajaxBlockSlide', myBlockSlide);
            });
        }
    };

})(jQuery);;
/**
 * jQuery.LocalScroll - Animated scrolling navigation, using anchors.
 * Copyright (c) 2007-2009 Ariel Flesler - aflesler(at)gmail(dot)com | http://flesler.blogspot.com
 * Dual licensed under MIT and GPL.
 * Date: 3/11/2009
 * @author Ariel Flesler
 * @version 1.2.7
 **/
;(function($){var l=location.href.replace(/#.*/,'');var g=$.localScroll=function(a){$('body').localScroll(a)};g.defaults={duration:1e3,axis:'y',event:'click',stop:true,target:window,reset:true};g.hash=function(a){if(location.hash){a=$.extend({},g.defaults,a);a.hash=false;if(a.reset){var e=a.duration;delete a.duration;$(a.target).scrollTo(0,a);a.duration=e}i(0,location,a)}};$.fn.localScroll=function(b){b=$.extend({},g.defaults,b);return b.lazy?this.bind(b.event,function(a){var e=$([a.target,a.target.parentNode]).filter(d)[0];if(e)i(a,e,b)}):this.find('a,area').filter(d).bind(b.event,function(a){i(a,this,b)}).end().end();function d(){return!!this.href&&!!this.hash&&this.href.replace(this.hash,'')==l&&(!b.filter||$(this).is(b.filter))}};function i(a,e,b){var d=e.hash.slice(1),f=document.getElementById(d)||document.getElementsByName(d)[0];if(!f)return;if(a)a.preventDefault();var h=$(b.target);if(b.lock&&h.is(':animated')||b.onBefore&&b.onBefore.call(b,a,f,h)===false)return;if(b.stop)h.stop(true);if(b.hash){var j=f.id==d?'id':'name',k=$('<a> </a>').attr(j,d).css({position:'absolute',top:$(window).scrollTop(),left:$(window).scrollLeft()});f[j]='';$('body').prepend(k);location=e.hash;k.remove();f[j]=d}h.scrollTo(f,b).trigger('notify.serialScroll',[f])}})(jQuery);;
/**
 * jQuery.ScrollTo - Easy element scrolling using jQuery.
 * Copyright (c) 2007-2009 Ariel Flesler - aflesler(at)gmail(dot)com | http://flesler.blogspot.com
 * Dual licensed under MIT and GPL.
 * Date: 5/25/2009
 * @author Ariel Flesler
 * @version 1.4.2
 *
 * http://flesler.blogspot.com/2007/10/jqueryscrollto.html
 */
;(function(d){var k=d.scrollTo=function(a,i,e){d(window).scrollTo(a,i,e)};k.defaults={axis:'xy',duration:parseFloat(d.fn.jquery)>=1.3?0:1};k.window=function(a){return d(window)._scrollable()};d.fn._scrollable=function(){return this.map(function(){var a=this,i=!a.nodeName||d.inArray(a.nodeName.toLowerCase(),['iframe','#document','html','body'])!=-1;if(!i)return a;var e=(a.contentWindow||a).document||a.ownerDocument||a;return d.browser.safari||e.compatMode=='BackCompat'?e.body:e.documentElement})};d.fn.scrollTo=function(n,j,b){if(typeof j=='object'){b=j;j=0}if(typeof b=='function')b={onAfter:b};if(n=='max')n=9e9;b=d.extend({},k.defaults,b);j=j||b.speed||b.duration;b.queue=b.queue&&b.axis.length>1;if(b.queue)j/=2;b.offset=p(b.offset);b.over=p(b.over);return this._scrollable().each(function(){var q=this,r=d(q),f=n,s,g={},u=r.is('html,body');switch(typeof f){case'number':case'string':if(/^([+-]=)?\d+(\.\d+)?(px|%)?$/.test(f)){f=p(f);break}f=d(f,this);case'object':if(f.is||f.style)s=(f=d(f)).offset()}d.each(b.axis.split(''),function(a,i){var e=i=='x'?'Left':'Top',h=e.toLowerCase(),c='scroll'+e,l=q[c],m=k.max(q,i);if(s){g[c]=s[h]+(u?0:l-r.offset()[h]);if(b.margin){g[c]-=parseInt(f.css('margin'+e))||0;g[c]-=parseInt(f.css('border'+e+'Width'))||0}g[c]+=b.offset[h]||0;if(b.over[h])g[c]+=f[i=='x'?'width':'height']()*b.over[h]}else{var o=f[h];g[c]=o.slice&&o.slice(-1)=='%'?parseFloat(o)/100*m:o}if(/^\d+$/.test(g[c]))g[c]=g[c]<=0?0:Math.min(g[c],m);if(!a&&b.queue){if(l!=g[c])t(b.onAfterFirst);delete g[c]}});t(b.onAfter);function t(a){r.animate(g,j,b.easing,a&&function(){a.call(this,n,b)})}}).end()};k.max=function(a,i){var e=i=='x'?'Width':'Height',h='scroll'+e;if(!d(a).is('html,body'))return a[h]-d(a)[e.toLowerCase()]();var c='client'+e,l=a.ownerDocument.documentElement,m=a.ownerDocument.body;return Math.max(l[h],m[h])-Math.min(l[c],m[c])};function p(a){return typeof a=='object'?a:{top:a,left:a}}})(jQuery);;
/*
 * jQuery Easing v1.3 - http://gsgd.co.uk/sandbox/jquery/easing/
 *
 * Uses the built in easing capabilities added In jQuery 1.1
 * to offer multiple easing options
 *
 * TERMS OF USE - jQuery Easing
 * 
 * Open source under the BSD License. 
 * 
 * Copyright © 2008 George McGinley Smith
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without modification, 
 * are permitted provided that the following conditions are met:
 * 
 * Redistributions of source code must retain the above copyright notice, this list of 
 * conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice, this list 
 * of conditions and the following disclaimer in the documentation and/or other materials 
 * provided with the distribution.
 * 
 * Neither the name of the author nor the names of contributors may be used to endorse 
 * or promote products derived from this software without specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY 
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 *  COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 *  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
 *  GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED 
 * AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 *  NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED 
 * OF THE POSSIBILITY OF SUCH DAMAGE. 
 *
*/

// t: current time, b: begInnIng value, c: change In value, d: duration
jQuery.easing['jswing'] = jQuery.easing['swing'];

jQuery.extend( jQuery.easing,
{
	def: 'easeOutQuad',
	swing: function (x, t, b, c, d) {
		//alert(jQuery.easing.default);
		return jQuery.easing[jQuery.easing.def](x, t, b, c, d);
	},
	easeInQuad: function (x, t, b, c, d) {
		return c*(t/=d)*t + b;
	},
	easeOutQuad: function (x, t, b, c, d) {
		return -c *(t/=d)*(t-2) + b;
	},
	easeInOutQuad: function (x, t, b, c, d) {
		if ((t/=d/2) < 1) return c/2*t*t + b;
		return -c/2 * ((--t)*(t-2) - 1) + b;
	},
	easeInCubic: function (x, t, b, c, d) {
		return c*(t/=d)*t*t + b;
	},
	easeOutCubic: function (x, t, b, c, d) {
		return c*((t=t/d-1)*t*t + 1) + b;
	},
	easeInOutCubic: function (x, t, b, c, d) {
		if ((t/=d/2) < 1) return c/2*t*t*t + b;
		return c/2*((t-=2)*t*t + 2) + b;
	},
	easeInQuart: function (x, t, b, c, d) {
		return c*(t/=d)*t*t*t + b;
	},
	easeOutQuart: function (x, t, b, c, d) {
		return -c * ((t=t/d-1)*t*t*t - 1) + b;
	},
	easeInOutQuart: function (x, t, b, c, d) {
		if ((t/=d/2) < 1) return c/2*t*t*t*t + b;
		return -c/2 * ((t-=2)*t*t*t - 2) + b;
	},
	easeInQuint: function (x, t, b, c, d) {
		return c*(t/=d)*t*t*t*t + b;
	},
	easeOutQuint: function (x, t, b, c, d) {
		return c*((t=t/d-1)*t*t*t*t + 1) + b;
	},
	easeInOutQuint: function (x, t, b, c, d) {
		if ((t/=d/2) < 1) return c/2*t*t*t*t*t + b;
		return c/2*((t-=2)*t*t*t*t + 2) + b;
	},
	easeInSine: function (x, t, b, c, d) {
		return -c * Math.cos(t/d * (Math.PI/2)) + c + b;
	},
	easeOutSine: function (x, t, b, c, d) {
		return c * Math.sin(t/d * (Math.PI/2)) + b;
	},
	easeInOutSine: function (x, t, b, c, d) {
		return -c/2 * (Math.cos(Math.PI*t/d) - 1) + b;
	},
	easeInExpo: function (x, t, b, c, d) {
		return (t==0) ? b : c * Math.pow(2, 10 * (t/d - 1)) + b;
	},
	easeOutExpo: function (x, t, b, c, d) {
		return (t==d) ? b+c : c * (-Math.pow(2, -10 * t/d) + 1) + b;
	},
	easeInOutExpo: function (x, t, b, c, d) {
		if (t==0) return b;
		if (t==d) return b+c;
		if ((t/=d/2) < 1) return c/2 * Math.pow(2, 10 * (t - 1)) + b;
		return c/2 * (-Math.pow(2, -10 * --t) + 2) + b;
	},
	easeInCirc: function (x, t, b, c, d) {
		return -c * (Math.sqrt(1 - (t/=d)*t) - 1) + b;
	},
	easeOutCirc: function (x, t, b, c, d) {
		return c * Math.sqrt(1 - (t=t/d-1)*t) + b;
	},
	easeInOutCirc: function (x, t, b, c, d) {
		if ((t/=d/2) < 1) return -c/2 * (Math.sqrt(1 - t*t) - 1) + b;
		return c/2 * (Math.sqrt(1 - (t-=2)*t) + 1) + b;
	},
	easeInElastic: function (x, t, b, c, d) {
		var s=1.70158;var p=0;var a=c;
		if (t==0) return b;  if ((t/=d)==1) return b+c;  if (!p) p=d*.3;
		if (a < Math.abs(c)) { a=c; var s=p/4; }
		else var s = p/(2*Math.PI) * Math.asin (c/a);
		return -(a*Math.pow(2,10*(t-=1)) * Math.sin( (t*d-s)*(2*Math.PI)/p )) + b;
	},
	easeOutElastic: function (x, t, b, c, d) {
		var s=1.70158;var p=0;var a=c;
		if (t==0) return b;  if ((t/=d)==1) return b+c;  if (!p) p=d*.3;
		if (a < Math.abs(c)) { a=c; var s=p/4; }
		else var s = p/(2*Math.PI) * Math.asin (c/a);
		return a*Math.pow(2,-10*t) * Math.sin( (t*d-s)*(2*Math.PI)/p ) + c + b;
	},
	easeInOutElastic: function (x, t, b, c, d) {
		var s=1.70158;var p=0;var a=c;
		if (t==0) return b;  if ((t/=d/2)==2) return b+c;  if (!p) p=d*(.3*1.5);
		if (a < Math.abs(c)) { a=c; var s=p/4; }
		else var s = p/(2*Math.PI) * Math.asin (c/a);
		if (t < 1) return -.5*(a*Math.pow(2,10*(t-=1)) * Math.sin( (t*d-s)*(2*Math.PI)/p )) + b;
		return a*Math.pow(2,-10*(t-=1)) * Math.sin( (t*d-s)*(2*Math.PI)/p )*.5 + c + b;
	},
	easeInBack: function (x, t, b, c, d, s) {
		if (s == undefined) s = 1.70158;
		return c*(t/=d)*t*((s+1)*t - s) + b;
	},
	easeOutBack: function (x, t, b, c, d, s) {
		if (s == undefined) s = 1.70158;
		return c*((t=t/d-1)*t*((s+1)*t + s) + 1) + b;
	},
	easeInOutBack: function (x, t, b, c, d, s) {
		if (s == undefined) s = 1.70158; 
		if ((t/=d/2) < 1) return c/2*(t*t*(((s*=(1.525))+1)*t - s)) + b;
		return c/2*((t-=2)*t*(((s*=(1.525))+1)*t + s) + 2) + b;
	},
	easeInBounce: function (x, t, b, c, d) {
		return c - jQuery.easing.easeOutBounce (x, d-t, 0, c, d) + b;
	},
	easeOutBounce: function (x, t, b, c, d) {
		if ((t/=d) < (1/2.75)) {
			return c*(7.5625*t*t) + b;
		} else if (t < (2/2.75)) {
			return c*(7.5625*(t-=(1.5/2.75))*t + .75) + b;
		} else if (t < (2.5/2.75)) {
			return c*(7.5625*(t-=(2.25/2.75))*t + .9375) + b;
		} else {
			return c*(7.5625*(t-=(2.625/2.75))*t + .984375) + b;
		}
	},
	easeInOutBounce: function (x, t, b, c, d) {
		if (t < d/2) return jQuery.easing.easeInBounce (x, t*2, 0, c, d) * .5 + b;
		return jQuery.easing.easeOutBounce (x, t*2-d, 0, c, d) * .5 + c*.5 + b;
	}
});

/*
 *
 * TERMS OF USE - EASING EQUATIONS
 * 
 * Open source under the BSD License. 
 * 
 * Copyright © 2001 Robert Penner
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without modification, 
 * are permitted provided that the following conditions are met:
 * 
 * Redistributions of source code must retain the above copyright notice, this list of 
 * conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice, this list 
 * of conditions and the following disclaimer in the documentation and/or other materials 
 * provided with the distribution.
 * 
 * Neither the name of the author nor the names of contributors may be used to endorse 
 * or promote products derived from this software without specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY 
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 *  COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 *  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
 *  GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED 
 * AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 *  NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED 
 * OF THE POSSIBILITY OF SUCH DAMAGE. 
 *
 */;
/*
* smartresize: debounced resize event for jQuery
*
* latest version and complete README available on Github:
* https://github.com/louisremi/jquery.smartresize.js
*
* Copyright 2011 @louis_remi
* Licensed under the MIT license.
*
* This saved you an hour of work? 
* Send me music http://www.amazon.co.uk/wishlist/HNTU0468LQON
*/
(function($) {

var event = $.event,
 resizeTimeout;

event.special[ "smartresize" ] = {
   setup: function() {
     $( this ).bind( "resize", event.special.smartresize.handler );
   },
   teardown: function() {
     $( this ).unbind( "resize", event.special.smartresize.handler );
   },
   handler: function( event, execAsap ) {
     // Save the context
     var context = this,
       args = arguments;
     
     // set correct event type
         event.type = "smartresize";
     
     if(resizeTimeout)
       clearTimeout(resizeTimeout);
     resizeTimeout = setTimeout(function() {
       jQuery.event.handle.apply( context, args );
     }, execAsap === "execAsap"? 0 : 100);
   }
}

$.fn.smartresize = function( fn ) {
   return fn ? this.bind( "smartresize", fn ) : this.trigger( "smartresize", ["execAsap"] );
};
 
})(jQuery);
;
﻿/**
* hoverIntent is similar to jQuery's built-in "hover" function except that
* instead of firing the onMouseOver event immediately, hoverIntent checks
* to see if the user's mouse has slowed down (beneath the sensitivity
* threshold) before firing the onMouseOver event.
* 
* hoverIntent r6 // 2011.02.26 // jQuery 1.5.1+
* <http://cherne.net/brian/resources/jquery.hoverIntent.html>
* 
* hoverIntent is currently available for use in all personal or commercial 
* projects under both MIT and GPL licenses. This means that you can choose 
* the license that best suits your project, and use it accordingly.
* 
* // basic usage (just like .hover) receives onMouseOver and onMouseOut functions
* $("ul li").hoverIntent( showNav , hideNav );
* 
* // advanced usage receives configuration object only
* $("ul li").hoverIntent({
*	sensitivity: 7, // number = sensitivity threshold (must be 1 or higher)
*	interval: 100,   // number = milliseconds of polling interval
*	over: showNav,  // function = onMouseOver callback (required)
*	timeout: 0,   // number = milliseconds delay before onMouseOut function call
*	out: hideNav    // function = onMouseOut callback (required)
* });
* 
* @param  f  onMouseOver function || An object with configuration options
* @param  g  onMouseOut function  || Nothing (use configuration options object)
* @author    Brian Cherne brian(at)cherne(dot)net
*/
(function($) {
	$.fn.hoverIntent = function(f,g) {
		// default configuration options
		var cfg = {
			sensitivity: 7,
			interval: 100,
			timeout: 0
		};
		// override configuration options with user supplied object
		cfg = $.extend(cfg, g ? { over: f, out: g } : f );

		// instantiate variables
		// cX, cY = current X and Y position of mouse, updated by mousemove event
		// pX, pY = previous X and Y position of mouse, set by mouseover and polling interval
		var cX, cY, pX, pY;

		// A private function for getting mouse position
		var track = function(ev) {
			cX = ev.pageX;
			cY = ev.pageY;
		};

		// A private function for comparing current and previous mouse position
		var compare = function(ev,ob) {
			ob.hoverIntent_t = clearTimeout(ob.hoverIntent_t);
			// compare mouse positions to see if they've crossed the threshold
			if ( ( Math.abs(pX-cX) + Math.abs(pY-cY) ) < cfg.sensitivity ) {
				$(ob).unbind("mousemove",track);
				// set hoverIntent state to true (so mouseOut can be called)
				ob.hoverIntent_s = 1;
				return cfg.over.apply(ob,[ev]);
			} else {
				// set previous coordinates for next time
				pX = cX; pY = cY;
				// use self-calling timeout, guarantees intervals are spaced out properly (avoids JavaScript timer bugs)
				ob.hoverIntent_t = setTimeout( function(){compare(ev, ob);} , cfg.interval );
			}
		};

		// A private function for delaying the mouseOut function
		var delay = function(ev,ob) {
			ob.hoverIntent_t = clearTimeout(ob.hoverIntent_t);
			ob.hoverIntent_s = 0;
			return cfg.out.apply(ob,[ev]);
		};

		// A private function for handling mouse 'hovering'
		var handleHover = function(e) {
			// copy objects to be passed into t (required for event object to be passed in IE)
			var ev = jQuery.extend({},e);
			var ob = this;

			// cancel hoverIntent timer if it exists
			if (ob.hoverIntent_t) { ob.hoverIntent_t = clearTimeout(ob.hoverIntent_t); }

			// if e.type == "mouseenter"
			if (e.type == "mouseenter") {
				// set "previous" X and Y position based on initial entry point
				pX = ev.pageX; pY = ev.pageY;
				// update "current" X and Y position based on mousemove
				$(ob).bind("mousemove",track);
				// start polling interval (self-calling timeout) to compare mouse coordinates over time
				if (ob.hoverIntent_s != 1) { ob.hoverIntent_t = setTimeout( function(){compare(ev,ob);} , cfg.interval );}

			// else e.type == "mouseleave"
			} else {
				// unbind expensive mousemove event
				$(ob).unbind("mousemove",track);
				// if hoverIntent state is true, then call the mouseOut function after the specified delay
				if (ob.hoverIntent_s == 1) { ob.hoverIntent_t = setTimeout( function(){delay(ev,ob);} , cfg.timeout );}
			}
		};

		// bind the function to the two event listeners
		return this.bind('mouseenter',handleHover).bind('mouseleave',handleHover);
	};
})(jQuery);;
/*
 * jReject (jQuery Browser Rejection Plugin)
 * Version 1.0.0
 * URL: http://jreject.turnwheel.com/
 * Description: jReject is a easy method of rejecting specific browsers on your site
 * Author: Steven Bower (TurnWheel Designs) http://turnwheel.com/
 * Copyright: Copyright (c) 2009-2011 Steven Bower under dual MIT/GPL license.
 */

(function($) {
$.reject = function(opts) {
	var opts = $.extend(true,{
		reject : { // Rejection flags for specific browsers
            all: false, // Covers everything (Nothing blocked)
		    unknown: false, // iOS devices will flag otherwise
            msie5: true, msie6: true, msie7: true

			/*
			 * Possibilities are endless...
			 *
			 * // MSIE Flags (Global, 5-8)
			 * msie, msie5, msie6, msie7, msie8,
			 * // Firefox Flags (Global, 1-3)
			 * firefox, firefox1, firefox2, firefox3,
			 * // Konqueror Flags (Global, 1-3)
			 * konqueror, konqueror1, konqueror2, konqueror3,
			 * // Chrome Flags (Global, 1-4)
			 * chrome, chrome1, chrome2, chrome3, chrome4,
			 * // Safari Flags (Global, 1-4)
			 * safari, safari2, safari3, safari4,
			 * // Opera Flags (Global, 7-10)
			 * opera, opera7, opera8, opera9, opera10,
			 * // Rendering Engines (Gecko, Webkit, Trident, KHTML, Presto)
			 * gecko, webkit, trident, khtml, presto,
			 * // Operating Systems (Win, Mac, Linux, Solaris, iPhone)
			 * win, mac, linux, solaris, iphone,
			 * unknown // Unknown covers everything else
			 */
		},
		display: [], // What browsers to display and their order (default set below)
		browserInfo: { // Settings for which browsers to display
			firefox: {
				text: 'Firefox', // Text below the icon
				url: 'http://www.mozilla.com/firefox/' // URL For icon/text link
			},
			safari: {
				text: 'Safari',
				url: 'http://www.apple.com/safari/download/'
			},
			opera: {
				text: 'Opera',
				url: 'http://www.opera.com/download/'
			},
			chrome: {
				text: 'Chrome',
				url: 'http://www.google.com/chrome/'
			},
			msie: {
				text: 'Internet Explorer',
				url: 'http://www.microsoft.com/windows/Internet-explorer/'
			},
			gcf: {
				text: 'Google Chrome Frame',
				url: 'http://code.google.com/chrome/chromeframe/',
				// This browser option will only be displayed for MSIE
				allow: { all: false, msie: true }
			}
		},

		// Header of pop-up window
		header: 'Looks like you&rsquo;re using an unsupported browser.',
		// Paragraph 1
		paragraph1: 'To get the most out of this website please upgrade to the '+
					'latest version of <a href="http://www.google.com/chrome/">Chrome</a>, <a href="http://www.apple.com/safari/download/">Safari</a>, <a href="http://www.mozilla.com/firefox/">Firefox</a> or <a href="http://www.microsoft.com/windows/Internet-explorer/">Internet Explorer</a>.',
		// Paragraph 2
		paragraph2: '',
		close: true, // Allow closing of window
		// Message displayed below closing link
		closeMessage: 'By continuing you acknowledge you may have a less than optimal experience viewing this website on your current browser',
		closeLink: '<img src="sites/all/libraries/jquery-jreject/images/closebox.png" alt="close">', // Text for closing link
		closeURL: '#', // Close URL
		closeESC: true, // Allow closing of window with esc key

		// If cookies should be used to remember if the window was closed
		// See cookieSettings for more options
		closeCookie: true,
		// Cookie settings are only used if closeCookie is true
		cookieSettings: {
			// Path for the cookie to be saved on
			// Should be root domain in most cases
			path: '/',
			// Expiration Date (in seconds)
			// 0 (default) means it ends with the current session
			expires: 0
		},

		imagePath: '/sites/all/libraries/jquery-jreject/images/', // Path where images are located
		overlayBgColor: '#000', // Background color for overlay
		overlayOpacity: 0.6, // Background transparency (0-1)

		// Fade in time on open ('slow','medium','fast' or integer in ms)
		fadeInTime: 'fast',
		// Fade out time on close ('slow','medium','fast' or integer in ms)
		fadeOutTime: 'fast',

		// Google Analytics Link Tracking (Optional)
		// Set to true to enable
		// Note: Analytics tracking code must be added separately
		analytics: false
	},opts);

	// Set default browsers to display if not already defined
	if (opts.display.length < 1)
		opts.display = ['chrome','safari','firefox','msie'];

	// beforeRject: Customized Function
	if ($.isFunction(opts.beforeReject)) opts.beforeReject(opts);

	// Disable 'closeESC' if closing is disabled (mutually exclusive)
	if (!opts.close) opts.closeESC = false;

	// This function parses the advanced browser options
	var browserCheck = function(settings) {
		// Check 1: Look for 'all' forced setting
		// Check 2: Operating System (eg. 'win','mac','linux','solaris','iphone')
		// Check 3: Rendering engine (eg. 'webkit', 'gecko', 'trident')
		// Check 4: Browser name (eg. 'firefox','msie','chrome')
		// Check 5: Browser+major version (eg. 'firefox3','msie7','chrome4')
		return (settings['all'] ? true : false) ||
			(settings[$.os.name] ? true : false) ||
			(settings[$.layout.name] ? true : false) ||
			(settings[$.browser.name] ? true : false) ||
			(settings[$.browser.className] ? true : false);
	};

	// Determine if we need to display rejection for this browser, or exit
	if (!browserCheck(opts.reject)) {
		// onFail: Customized Function
		if ($.isFunction(opts.onFail)) opts.onFail(opts);
		return false;
	}

	// If user can close and set to remember close, initiate cookie functions
	if (opts.close && opts.closeCookie) {
		// Local global setting for the name of the cookie used
		var COOKIE_NAME = 'jreject-close';

		// Cookies Function: Handles creating/retrieving/deleting cookies
		// Cookies are only used for opts.closeCookie parameter functionality
		var _cookie = function(name, value) {
			if (typeof value != 'undefined') {
				var expires = '';

				// Check if we need to set an expiration date
				if (opts.cookieSettings.expires != 0) {
					var date = new Date();
					date.setTime(date.getTime()+(opts.cookieSettings.expires));
					var expires = "; expires="+date.toGMTString();
				}

				// Get path from settings
				var path = opts.cookieSettings.path || '/';

				// Set Cookie with parameters
				document.cookie = name+'='+
					encodeURIComponent(value == null ? '' : value)+expires+
					'; path='+path;
			}
			else { // Get cookie value
				var cookie,val = null;

				if (document.cookie && document.cookie != '') {
					var cookies = document.cookie.split(';');

					// Loop through all cookie values
					var clen = cookies.length;
					for (var i = 0; i < clen; ++i) {
						cookie = $.trim(cookies[i]);

						// Does this cookie string begin with the name we want?
						if (cookie.substring(0,name.length+1) == (name+'=')) {
							var len = name.length;
							val = decodeURIComponent(cookie.substring(len+1));
							break;
						}
					}
				}

				return val; // Return cookie value
			}
		};

		// If cookie is set, return false and don't display rejection
		if (_cookie(COOKIE_NAME) != null) return false;
	}

	// Load background overlay (jr_overlay) + Main wrapper (jr_wrap) +
	// Inner Wrapper (jr_inner) w/ opts.header (jr_header) +
	// opts.paragraph1/opts.paragraph2 if set
	var html = '<div id="jr_overlay"></div><div id="jr_wrap"><div id="jr_inner">'+
        '<div id="jreject-logo">&nbsp;</div>'+
		'<h1 id="jr_header">'+opts.header+'</h1>'+
		(opts.paragraph1 === '' ? '' : '<p>'+opts.paragraph1+'</p>')+
		(opts.paragraph2 === '' ? '' : '<p>'+opts.paragraph2+'</p>')+'<ul>';

	var displayNum = 0; // Tracks number of browsers being displayed
	// Generate the browsers to display
	for (var x in opts.display) {
		var browser = opts.display[x]; // Current Browser
		var info = opts.browserInfo[browser] || false; // Browser Information

		// If no info exists for this browser
		// or if this browser is not suppose to display to this user
		if (!info || (info['allow'] != undefined && !browserCheck(info['allow']))) {
			continue;
		}

		var url = info.url || '#'; // URL to link text/icon to
		// Generate HTML for this browser option
		html += '<li id="jr_'+browser+'"><div class="jr_icon">'+
            '<a href="'+ url +'"></a>'+
                    '</div>'+
				'</li>';
		++displayNum; // Increment number of browser being displayed
	}

	// Close list and #jr_list
	html += '</ul><div id="jr_close">'+
	// Display close links/message if set
	(opts.close ? '<a href="'+opts.closeURL+'">'+opts.closeLink+'</a>'+'</div>':'')+
	// Close #jr_inner and #jr_wrap
	'</div></div>';

	var element = $('<div>'+html+'</div>'); // Create element
	var size = _pageSize(); // Get page size
	var scroll = _scrollSize(); // Get page scroll

	// This function handles closing this reject window
	// When clicked, fadeOut and remove all elements
	element.bind('closejr', function() {
		// Make sure the permission to close is granted
		if (!opts.close) return false;

		// Customized Function
		if ($.isFunction(opts.beforeClose)) opts.beforeClose(opts);

		// Remove binding function so it
		// doesn't get called more than once
		$(this).unbind('closejr');

        alert('By continuing you acknowledge you may have a less than optimal experience viewing this website on your current browser.');
		// Fade out background and modal wrapper
		$('#jr_overlay,#jr_wrap').fadeOut(opts.fadeOutTime,function() {
			$(this).remove(); // Remove element from DOM

			// afterClose: Customized Function
			if ($.isFunction(opts.afterClose)) opts.afterClose(opts);
		});

		// Show elements that were hidden for layering issues
		$('embed, object, select, applet').show();

		// Set close cookie for next run
		if (opts.closeCookie) _cookie(COOKIE_NAME,'true');
		return true;
	});

	// Tracks clicks in Google Analytics (category 'External Links')
	// only if opts.analytics is enabled
	var analytics = function (url) {
		if (!opts.analytics) return false;

		// Get just the hostname
		var host = url.split(/\/+/g)[1];

		// Send external link event to Google Analaytics
		// Attempts both versions of analytics code. (Newest first)
		try {
			// Newest analytics code
			_gaq.push(['_trackEvent','External Links',  host, url]);
		} catch (e) {
			try {
				// Older analytics code
				pageTracker._trackEvent('External Links', host, url);
			} catch (e) { };
		}
	};

	// Called onClick for browser links (and icons)
	// Opens link in new window
	var openBrowserLinks = function(url) {
		// Send link to analytics if enabled
		analytics(url);

		// Open window, generate random id value
		window.open(url, 'jr_'+ Math.round(Math.random()*11));

		return false;
	};

	/*
	 * Trverse through element DOM and apply JS variables
	 * All CSS elements that do not require JS will be in
	 * css/jquery.jreject.css
	 */

	// Creates 'background' (div)
	element.find('#jr_overlay').css({
		width: size[0],
		height: size[1],
		background: opts.overlayBgColor,
		opacity: opts.overlayOpacity
	});

	// Wrapper for our pop-up (div)
	element.find('#jr_wrap').css({
		top: scroll[1]+(size[3]/4),
		left: scroll[0]
	});

	// Wrapper for inner centered content (div)
	element.find('#jr_inner').css({
		width: $.layout.name == 'trident' ? displayNum*155 : '520px'
	});

	element.find('#jr_inner li .jr_icon').each(function() {
		// Dynamically sets the icon background image
		var self = $(this);
		self.css('background','transparent url('+opts.imagePath+'browser_'+
				(self.parent('li').attr('id').replace(/jr_/,''))+'.gif)'+
					' no-repeat scroll center top');

		// Send link clicks to openBrowserLinks
		self.click(function () {
			var url = $(this).children('a').attr('href');
			openBrowserLinks(url);
		});
	});

	element.find('#jr_inner li a').click(function() {
		openBrowserLinks($(this).attr('href'));
		return false;
	});

	// Bind closing event to trigger closejr
	// to be consistant with ESC key close function
	element.find('#jr_close a').click(function() {
		$(this).trigger('closejr');

		// If plain anchor is set, return false so there is no page jump
		if (opts.closeURL === '#') return false;
	});

	// Set focus (fixes ESC key issues with forms and other focus bugs)
	$('#jr_overlay').focus();

	// Hide elements that won't display properly
	$('embed, object, select, applet').hide();

	// Append element to body of document to display
	$('body').append(element.hide().fadeIn(opts.fadeInTime));

	// Handle window resize/scroll events and update overlay dimensions
	$(window).bind('resize scroll',function() {
		var size = _pageSize(); // Get size

		// Update overlay dimensions based on page size
		$('#jr_overlay').css({
			width: size[0],
			height: size[1]
		});

		var scroll = _scrollSize(); // Get page scroll

		// Update modal position based on scroll
		$('#jr_wrap').css({
			top: scroll[1] + (size[3]/4),
			left: scroll[0]
		});
	});

	// Add optional ESC Key functionality
	if (opts.closeESC) {
		$(document).bind('keydown',function(event) {
			// ESC = Keycode 27
			if (event.keyCode == 27) element.trigger('closejr');
		});
	}

	// afterReject: Customized Function
	if ($.isFunction(opts.afterReject)) opts.afterReject(opts);

	return true;
};

// Based on compatibility data from quirksmode.com
var _pageSize = function() {
	var xScroll = window.innerWidth && window.scrollMaxX ?
				window.innerWidth + window.scrollMaxX :
				(document.body.scrollWidth > document.body.offsetWidth ?
				document.body.scrollWidth : document.body.offsetWidth);

	var yScroll = window.innerHeight && window.scrollMaxY ?
				window.innerHeight + window.scrollMaxY :
				(document.body.scrollHeight > document.body.offsetHeight ?
				document.body.scrollHeight : document.body.offsetHeight);

	var windowWidth = window.innerWidth ? window.innerWidth :
				(document.documentElement && document.documentElement.clientWidth ?
				document.documentElement.clientWidth : document.body.clientWidth);

	var windowHeight = window.innerHeight ? window.innerHeight :
				(document.documentElement && document.documentElement.clientHeight ?
				document.documentElement.clientHeight : document.body.clientHeight);

	return [
		xScroll < windowWidth ? xScroll : windowWidth, // Page Width
		yScroll < windowHeight ? windowHeight : yScroll, // Page Height
		windowWidth,windowHeight
	];
};


// Based on compatibility data from quirksmode.com
var _scrollSize = function() {
	return [
		// scrollSize X
		window.pageXOffset ? window.pageXOffset : (document.documentElement &&
				document.documentElement.scrollTop ?
				document.documentElement.scrollLeft : document.body.scrollLeft),

		// scrollSize Y
		window.pageYOffset ? window.pageYOffset : (document.documentElement &&
				document.documentElement.scrollTop ?
				document.documentElement.scrollTop : document.body.scrollTop)
	];
};
})(jQuery);

/*
 * jQuery Browser Plugin
 * Version 2.4 / jReject 1.0.0
 * URL: http://jquery.thewikies.com/browser
 * Description: jQuery Browser Plugin extends browser detection capabilities and
 * can assign browser selectors to CSS classes.
 * Author: Nate Cavanaugh, Minhchau Dang, Jonathan Neal, & Gregory Waxman
 * Updated By: Steven Bower for use with jReject plugin
 * Copyright: Copyright (c) 2008 Jonathan Neal under dual MIT/GPL license.
 */

(function ($) {
	$.browserTest = function (a, z) {
		var u = 'unknown',
			x = 'X',
			m = function (r, h) {
				for (var i = 0; i < h.length; i = i + 1) {
					r = r.replace(h[i][0], h[i][1]);
				}

				return r;
			}, c = function (i, a, b, c) {
				var r = {
					name: m((a.exec(i) || [u, u])[1], b)
				};

				r[r.name] = true;

				if (!r.opera) {
					r.version = (c.exec(i) || [x, x, x, x])[3];
				}
				else {
					r.version = window.opera.version();
				}

				if (/safari/.test(r.name) && r.version > 400) {
					r.version = '2.0';
				}
				else if (r.name === 'presto') {
					r.version = ($.browser.version > 9.27) ? 'futhark' : 'linear_b';
				}

				r.versionNumber = parseFloat(r.version, 10) || 0;
				var minorStart = 1;
				if (r.versionNumber < 100 && r.versionNumber > 9) {
					minorStart = 2;
				}
				r.versionX = (r.version !== x) ? r.version.substr(0, minorStart) : x;
				r.className = r.name + r.versionX;

				return r;
			};

		a = (/Opera|Navigator|Minefield|KHTML|Chrome/.test(a) ? m(a, [
			[/(Firefox|MSIE|KHTML,\slike\sGecko|Konqueror)/, ''],
			['Chrome Safari', 'Chrome'],
			['KHTML', 'Konqueror'],
			['Minefield', 'Firefox'],
			['Navigator', 'Netscape']
		]) : a).toLowerCase();

		$.browser = $.extend((!z) ? $.browser : {}, c(a,
			/(camino|chrome|firefox|netscape|konqueror|lynx|msie|opera|safari)/, [],
			/(camino|chrome|firefox|netscape|netscape6|opera|version|konqueror|lynx|msie|safari)(\/|\s)([a-z0-9\.\+]*?)(\;|dev|rel|\s|$)/
			)
		);

		$.layout = c(a, /(gecko|konqueror|msie|opera|webkit)/, [
			['konqueror', 'khtml'],
			['msie', 'trident'],
			['opera', 'presto']
		], /(applewebkit|rv|konqueror|msie)(\:|\/|\s)([a-z0-9\.]*?)(\;|\)|\s)/);

		$.os = {
			name: (/(win|mac|linux|sunos|solaris|iphone)/.
					exec(navigator.platform.toLowerCase()) || [u])[0]
						.replace('sunos', 'solaris')
		};

		if (!z) {
			$('html').addClass([$.os.name, $.browser.name, $.browser.className,
				$.layout.name, $.layout.className].join(' '));
		}
	};

	$.browserTest(navigator.userAgent);
}(jQuery));
;
/*
    http://www.JSON.org/json2.js
    2011-01-18

    Public Domain.

    NO WARRANTY EXPRESSED OR IMPLIED. USE AT YOUR OWN RISK.

    See http://www.JSON.org/js.html


    This code should be minified before deployment.
    See http://javascript.crockford.com/jsmin.html

    USE YOUR OWN COPY. IT IS EXTREMELY UNWISE TO LOAD CODE FROM SERVERS YOU DO
    NOT CONTROL.


    This file creates a global JSON object containing two methods: stringify
    and parse.

        JSON.stringify(value, replacer, space)
            value       any JavaScript value, usually an object or array.

            replacer    an optional parameter that determines how object
                        values are stringified for objects. It can be a
                        function or an array of strings.

            space       an optional parameter that specifies the indentation
                        of nested structures. If it is omitted, the text will
                        be packed without extra whitespace. If it is a number,
                        it will specify the number of spaces to indent at each
                        level. If it is a string (such as '\t' or '&nbsp;'),
                        it contains the characters used to indent at each level.

            This method produces a JSON text from a JavaScript value.

            When an object value is found, if the object contains a toJSON
            method, its toJSON method will be called and the result will be
            stringified. A toJSON method does not serialize: it returns the
            value represented by the name/value pair that should be serialized,
            or undefined if nothing should be serialized. The toJSON method
            will be passed the key associated with the value, and this will be
            bound to the value

            For example, this would serialize Dates as ISO strings.

                Date.prototype.toJSON = function (key) {
                    function f(n) {
                        // Format integers to have at least two digits.
                        return n < 10 ? '0' + n : n;
                    }

                    return this.getUTCFullYear()   + '-' +
                         f(this.getUTCMonth() + 1) + '-' +
                         f(this.getUTCDate())      + 'T' +
                         f(this.getUTCHours())     + ':' +
                         f(this.getUTCMinutes())   + ':' +
                         f(this.getUTCSeconds())   + 'Z';
                };

            You can provide an optional replacer method. It will be passed the
            key and value of each member, with this bound to the containing
            object. The value that is returned from your method will be
            serialized. If your method returns undefined, then the member will
            be excluded from the serialization.

            If the replacer parameter is an array of strings, then it will be
            used to select the members to be serialized. It filters the results
            such that only members with keys listed in the replacer array are
            stringified.

            Values that do not have JSON representations, such as undefined or
            functions, will not be serialized. Such values in objects will be
            dropped; in arrays they will be replaced with null. You can use
            a replacer function to replace those with JSON values.
            JSON.stringify(undefined) returns undefined.

            The optional space parameter produces a stringification of the
            value that is filled with line breaks and indentation to make it
            easier to read.

            If the space parameter is a non-empty string, then that string will
            be used for indentation. If the space parameter is a number, then
            the indentation will be that many spaces.

            Example:

            text = JSON.stringify(['e', {pluribus: 'unum'}]);
            // text is '["e",{"pluribus":"unum"}]'


            text = JSON.stringify(['e', {pluribus: 'unum'}], null, '\t');
            // text is '[\n\t"e",\n\t{\n\t\t"pluribus": "unum"\n\t}\n]'

            text = JSON.stringify([new Date()], function (key, value) {
                return this[key] instanceof Date ?
                    'Date(' + this[key] + ')' : value;
            });
            // text is '["Date(---current time---)"]'


        JSON.parse(text, reviver)
            This method parses a JSON text to produce an object or array.
            It can throw a SyntaxError exception.

            The optional reviver parameter is a function that can filter and
            transform the results. It receives each of the keys and values,
            and its return value is used instead of the original value.
            If it returns what it received, then the structure is not modified.
            If it returns undefined then the member is deleted.

            Example:

            // Parse the text. Values that look like ISO date strings will
            // be converted to Date objects.

            myData = JSON.parse(text, function (key, value) {
                var a;
                if (typeof value === 'string') {
                    a =
/^(\d{4})-(\d{2})-(\d{2})T(\d{2}):(\d{2}):(\d{2}(?:\.\d*)?)Z$/.exec(value);
                    if (a) {
                        return new Date(Date.UTC(+a[1], +a[2] - 1, +a[3], +a[4],
                            +a[5], +a[6]));
                    }
                }
                return value;
            });

            myData = JSON.parse('["Date(09/09/2001)"]', function (key, value) {
                var d;
                if (typeof value === 'string' &&
                        value.slice(0, 5) === 'Date(' &&
                        value.slice(-1) === ')') {
                    d = new Date(value.slice(5, -1));
                    if (d) {
                        return d;
                    }
                }
                return value;
            });


    This is a reference implementation. You are free to copy, modify, or
    redistribute.
*/

/*jslint evil: true, strict: false, regexp: false */

/*members "", "\b", "\t", "\n", "\f", "\r", "\"", JSON, "\\", apply,
    call, charCodeAt, getUTCDate, getUTCFullYear, getUTCHours,
    getUTCMinutes, getUTCMonth, getUTCSeconds, hasOwnProperty, join,
    lastIndex, length, parse, prototype, push, replace, slice, stringify,
    test, toJSON, toString, valueOf
*/


// Create a JSON object only if one does not already exist. We create the
// methods in a closure to avoid creating global variables.

var JSON;
if (!JSON) {
    JSON = {};
}

(function () {
    "use strict";

    function f(n) {
        // Format integers to have at least two digits.
        return n < 10 ? '0' + n : n;
    }

    if (typeof Date.prototype.toJSON !== 'function') {

        Date.prototype.toJSON = function (key) {

            return isFinite(this.valueOf()) ?
                this.getUTCFullYear()     + '-' +
                f(this.getUTCMonth() + 1) + '-' +
                f(this.getUTCDate())      + 'T' +
                f(this.getUTCHours())     + ':' +
                f(this.getUTCMinutes())   + ':' +
                f(this.getUTCSeconds())   + 'Z' : null;
        };

        String.prototype.toJSON      =
            Number.prototype.toJSON  =
            Boolean.prototype.toJSON = function (key) {
                return this.valueOf();
            };
    }

    var cx = /[\u0000\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g,
        escapable = /[\\\"\x00-\x1f\x7f-\x9f\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g,
        gap,
        indent,
        meta = {    // table of character substitutions
            '\b': '\\b',
            '\t': '\\t',
            '\n': '\\n',
            '\f': '\\f',
            '\r': '\\r',
            '"' : '\\"',
            '\\': '\\\\'
        },
        rep;


    function quote(string) {

// If the string contains no control characters, no quote characters, and no
// backslash characters, then we can safely slap some quotes around it.
// Otherwise we must also replace the offending characters with safe escape
// sequences.

        escapable.lastIndex = 0;
        return escapable.test(string) ? '"' + string.replace(escapable, function (a) {
            var c = meta[a];
            return typeof c === 'string' ? c :
                '\\u' + ('0000' + a.charCodeAt(0).toString(16)).slice(-4);
        }) + '"' : '"' + string + '"';
    }


    function str(key, holder) {

// Produce a string from holder[key].

        var i,          // The loop counter.
            k,          // The member key.
            v,          // The member value.
            length,
            mind = gap,
            partial,
            value = holder[key];

// If the value has a toJSON method, call it to obtain a replacement value.

        if (value && typeof value === 'object' &&
                typeof value.toJSON === 'function') {
            value = value.toJSON(key);
        }

// If we were called with a replacer function, then call the replacer to
// obtain a replacement value.

        if (typeof rep === 'function') {
            value = rep.call(holder, key, value);
        }

// What happens next depends on the value's type.

        switch (typeof value) {
        case 'string':
            return quote(value);

        case 'number':

// JSON numbers must be finite. Encode non-finite numbers as null.

            return isFinite(value) ? String(value) : 'null';

        case 'boolean':
        case 'null':

// If the value is a boolean or null, convert it to a string. Note:
// typeof null does not produce 'null'. The case is included here in
// the remote chance that this gets fixed someday.

            return String(value);

// If the type is 'object', we might be dealing with an object or an array or
// null.

        case 'object':

// Due to a specification blunder in ECMAScript, typeof null is 'object',
// so watch out for that case.

            if (!value) {
                return 'null';
            }

// Make an array to hold the partial results of stringifying this object value.

            gap += indent;
            partial = [];

// Is the value an array?

            if (Object.prototype.toString.apply(value) === '[object Array]') {

// The value is an array. Stringify every element. Use null as a placeholder
// for non-JSON values.

                length = value.length;
                for (i = 0; i < length; i += 1) {
                    partial[i] = str(i, value) || 'null';
                }

// Join all of the elements together, separated with commas, and wrap them in
// brackets.

                v = partial.length === 0 ? '[]' : gap ?
                    '[\n' + gap + partial.join(',\n' + gap) + '\n' + mind + ']' :
                    '[' + partial.join(',') + ']';
                gap = mind;
                return v;
            }

// If the replacer is an array, use it to select the members to be stringified.

            if (rep && typeof rep === 'object') {
                length = rep.length;
                for (i = 0; i < length; i += 1) {
                    k = rep[i];
                    if (typeof k === 'string') {
                        v = str(k, value);
                        if (v) {
                            partial.push(quote(k) + (gap ? ': ' : ':') + v);
                        }
                    }
                }
            } else {

// Otherwise, iterate through all of the keys in the object.

                for (k in value) {
                    if (Object.hasOwnProperty.call(value, k)) {
                        v = str(k, value);
                        if (v) {
                            partial.push(quote(k) + (gap ? ': ' : ':') + v);
                        }
                    }
                }
            }

// Join all of the member texts together, separated with commas,
// and wrap them in braces.

            v = partial.length === 0 ? '{}' : gap ?
                '{\n' + gap + partial.join(',\n' + gap) + '\n' + mind + '}' :
                '{' + partial.join(',') + '}';
            gap = mind;
            return v;
        }
    }

// If the JSON object does not yet have a stringify method, give it one.

    if (typeof JSON.stringify !== 'function') {
        JSON.stringify = function (value, replacer, space) {

// The stringify method takes a value and an optional replacer, and an optional
// space parameter, and returns a JSON text. The replacer can be a function
// that can replace values, or an array of strings that will select the keys.
// A default replacer method can be provided. Use of the space parameter can
// produce text that is more easily readable.

            var i;
            gap = '';
            indent = '';

// If the space parameter is a number, make an indent string containing that
// many spaces.

            if (typeof space === 'number') {
                for (i = 0; i < space; i += 1) {
                    indent += ' ';
                }

// If the space parameter is a string, it will be used as the indent string.

            } else if (typeof space === 'string') {
                indent = space;
            }

// If there is a replacer, it must be a function or an array.
// Otherwise, throw an error.

            rep = replacer;
            if (replacer && typeof replacer !== 'function' &&
                    (typeof replacer !== 'object' ||
                    typeof replacer.length !== 'number')) {
                throw new Error('JSON.stringify');
            }

// Make a fake root object containing our value under the key of ''.
// Return the result of stringifying the value.

            return str('', {'': value});
        };
    }


// If the JSON object does not yet have a parse method, give it one.

    if (typeof JSON.parse !== 'function') {
        JSON.parse = function (text, reviver) {

// The parse method takes a text and an optional reviver function, and returns
// a JavaScript value if the text is a valid JSON text.

            var j;

            function walk(holder, key) {

// The walk method is used to recursively walk the resulting structure so
// that modifications can be made.

                var k, v, value = holder[key];
                if (value && typeof value === 'object') {
                    for (k in value) {
                        if (Object.hasOwnProperty.call(value, k)) {
                            v = walk(value, k);
                            if (v !== undefined) {
                                value[k] = v;
                            } else {
                                delete value[k];
                            }
                        }
                    }
                }
                return reviver.call(holder, key, value);
            }


// Parsing happens in four stages. In the first stage, we replace certain
// Unicode characters with escape sequences. JavaScript handles many characters
// incorrectly, either silently deleting them, or treating them as line endings.

            text = String(text);
            cx.lastIndex = 0;
            if (cx.test(text)) {
                text = text.replace(cx, function (a) {
                    return '\\u' +
                        ('0000' + a.charCodeAt(0).toString(16)).slice(-4);
                });
            }

// In the second stage, we run the text against regular expressions that look
// for non-JSON patterns. We are especially concerned with '()' and 'new'
// because they can cause invocation, and '=' because it can cause mutation.
// But just to be safe, we want to reject all unexpected forms.

// We split the second stage into 4 regexp operations in order to work around
// crippling inefficiencies in IE's and Safari's regexp engines. First we
// replace the JSON backslash pairs with '@' (a non-JSON character). Second, we
// replace all simple value tokens with ']' characters. Third, we delete all
// open brackets that follow a colon or comma or that begin the text. Finally,
// we look to see that the remaining characters are only whitespace or ']' or
// ',' or ':' or '{' or '}'. If that is so, then the text is safe for eval.

            if (/^[\],:{}\s]*$/
                    .test(text.replace(/\\(?:["\\\/bfnrt]|u[0-9a-fA-F]{4})/g, '@')
                        .replace(/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g, ']')
                        .replace(/(?:^|:|,)(?:\s*\[)+/g, ''))) {

// In the third stage we use the eval function to compile the text into a
// JavaScript structure. The '{' operator is subject to a syntactic ambiguity
// in JavaScript: it can begin a block or an object literal. We wrap the text
// in parens to eliminate the ambiguity.

                j = eval('(' + text + ')');

// In the optional fourth stage, we recursively walk the new structure, passing
// each name/value pair to a reviver function for possible transformation.

                return typeof reviver === 'function' ?
                    walk({'': j}, '') : j;
            }

// If the text is not JSON parseable, then a SyntaxError is thrown.

            throw new SyntaxError('JSON.parse');
        };
    }
}());
;
// http://bit.ly/ishiv | WTFPL License
window.innerShiv=function(){function h(c,e,b){return/^(?:area|br|col|embed|hr|img|input|link|meta|param)$/i.test(b)?c:e+"></"+b+">"}var c,e=document,j,g="abbr article aside audio canvas datalist details figcaption figure footer header hgroup mark meter nav output progress section summary time video".split(" ");return function(d,i){if(!c&&(c=e.createElement("div"),c.innerHTML="<nav></nav>",j=c.childNodes.length!==1)){for(var b=e.createDocumentFragment(),f=g.length;f--;)b.createElement(g[f]);b.appendChild(c)}d=d.replace(/^\s\s*/,"").replace(/\s\s*$/,"").replace(/<script\b[^<]*(?:(?!<\/script>)<[^<]*)*<\/script>/gi,"").replace(/(<([\w:]+)[^>]*?)\/>/g,h);c.innerHTML=(b=d.match(/^<(tbody|tr|td|col|colgroup|thead|tfoot)/i))?"<table>"+d+"</table>":d;b=b?c.getElementsByTagName(b[1])[0].parentNode:c;if(i===!1)return b.childNodes;for(var f=e.createDocumentFragment(),k=b.childNodes.length;k--;)f.appendChild(b.firstChild);return f}}();;
/*******************************************************************************************
 * zoomify
 * Written by Craig Francis
 * Absolutely minimal version of GSIV to work with touch screens and very slow processors.
********************************************************************************************

/*global window, document, setTimeout, getComputedStyle */
/*jslint white: true */

(function() {

	//--------------------------------------------------
	// Variables

		var div_ref = null,
			div_half_width = null,
			div_half_height = null,
			img_ref = null,
			img_orig_width = null,
			img_orig_height = null,
			img_zoom_width = null,
			img_zoom_height = null,
			img_start_left = null,
			img_start_top = null,
			img_current_left = null,
			img_current_top = null,
			zoom_control_refs = {},
			zoom_level = 0,
			zoom_levels = [],
			zoom_level_count = [],
			click_last = 0,
			origin = null;

	//--------------------------------------------------
	// Zooming

		function image_zoom(change) {

			//--------------------------------------------------
			// Variables

				var new_zoom,
					new_zoom_width,
					new_zoom_height,
					ratio;

			//--------------------------------------------------
			// Zoom level

				new_zoom = (zoom_level + change);

				if (new_zoom >= zoom_level_count) {
					if (new_zoom > zoom_level_count) {
						//div_ref.style.opacity = 0.5;
						//setTimeout(function() {div_ref.style.opacity = 1;}, 150);
						return;
					}
					zoom_control_refs['in-on'].style.display = 'none';
					zoom_control_refs['in-off'].style.display = 'block';
				} else {
					zoom_control_refs['in-on'].style.display = 'block';
					zoom_control_refs['in-off'].style.display = 'none';
				}

				if (new_zoom <= 0) {
					if (new_zoom < 0) {
						//div_ref.style.opacity = 0.5;
						//setTimeout(function() {div_ref.style.opacity = 1;}, 150);
						return;
					}
					zoom_control_refs['out-on'].style.display = 'none';
					zoom_control_refs['out-off'].style.display = 'block';
				} else {
					zoom_control_refs['out-on'].style.display = 'block';
					zoom_control_refs['out-off'].style.display = 'none';
				}

				zoom_level = new_zoom;

			//--------------------------------------------------
			// New width

				img_ref.style.width = zoom_levels[new_zoom] + 'px';

				new_zoom_width = img_ref.width;
				new_zoom_height = img_ref.height;

			//--------------------------------------------------
			// Update position

				if (img_current_left === null) { // Position in the middle on page load

					img_current_left = (div_half_width - (new_zoom_width  / 2));
					img_current_top  = (div_half_height - (new_zoom_height / 2));

				} else {

					ratio = (new_zoom_width / img_zoom_width);

					img_current_left = (div_half_width - ((div_half_width - img_current_left) * ratio));
					img_current_top  = (div_half_height - ((div_half_height - img_current_top)  * ratio));

				}
				//console.log(img_current_left,img_current_top)
				img_zoom_width = new_zoom_width;
				img_zoom_height = new_zoom_height;

				img_ref.style.left = img_current_left + 'px';
				img_ref.style.top = img_current_top + 'px';

		}

		function image_zoom_in() {
			image_zoom(1);
		}

		function image_zoom_out() {
			image_zoom(-1);
		}

		function scroll_event(e) {

			//--------------------------------------------------
			// Event

				e = e || window.event;

				var wheelData = (e.detail ? e.detail * -1 : e.wheelDelta / 40);

				image_zoom(wheelData > 0 ? 1 : -1);

			//--------------------------------------------------
			// Prevent default

				if (e.preventDefault) {
					e.preventDefault();
				} else {
					e.returnValue = false;
				}

				return false;

		}

	//--------------------------------------------------
	// Movement

		function event_coords(e) {
			var coords = [];
			if (e.touches && e.touches.length) {
				coords[0] = e.touches[0].clientX;
				coords[1] = e.touches[0].clientY;
			} else {
				coords[0] = e.clientX;
				coords[1] = e.clientY;
			}
			//console.log("event_coords", e, coords, e.touches);
			return coords;
		}

		function image_move_update() {

			//--------------------------------------------------
			// Boundary check

				var max_left = (div_half_width - img_zoom_width),
					max_top = (div_half_height - img_zoom_height);

				if (img_current_left > div_half_width)  { img_current_left = div_half_width; }
				if (img_current_top  > div_half_height) { img_current_top  = div_half_height; }
				if (img_current_left < max_left)        { img_current_left = max_left; }
				if (img_current_top  < max_top)         { img_current_top  = max_top;  }

			//--------------------------------------------------
			// Move
				//console.log("image_move_update",img_current_left,div_half_width,max_left,img_zoom_width)
				img_ref.style.left = img_current_left + 'px';
				img_ref.style.top  = img_current_top + 'px';

		}

		function image_move_event(e) {
			
			//--------------------------------------------------
			// Calculations

				e = e || window.event;

				var currentPos = event_coords(e);
				//console.log("image_move_event",img_current_left,img_start_left,currentPos[0],origin[0]);
				img_current_left = (img_start_left + (currentPos[0] - origin[0]));
				img_current_top = (img_start_top + (currentPos[1] - origin[1]));
				
				image_move_update();

			//--------------------------------------------------
			// Prevent default

				if (e.preventDefault) {
					e.preventDefault();
				} else {
					e.returnValue = false;
				}

				return false;

		}

		function image_move_start(e) {

			//--------------------------------------------------
			// Event

				e = e || window.event;

				if (e.preventDefault) {
					e.preventDefault();
				} else {
					e.returnValue = false; // IE: http://stackoverflow.com/questions/1000597/
				}

			//--------------------------------------------------
			// Double tap/click event

				var now = new Date().getTime();
				if (click_last > (now - 200)) {
					image_zoom_in();
				} else {
					click_last = now;
				}

			//--------------------------------------------------
			// Add events

					// http://www.quirksmode.org/blog/archives/2010/02/the_touch_actio.html
					// http://www.quirksmode.org/m/tests/drag.html

				if (e.type === 'touchstart') {

					img_ref.onmousedown = null;
					/*
					$(document).on("touchmove.lightbox","#lightbox img",function(e){
						image_move_event(e);
					}).on("touchend.lightbox","#lightbox img", function(){
						$(document).off("touchmove.lightbox, touchend.lightbox");
					})
					*/
					
					img_ref.ontouchmove = image_move_event;
					img_ref.ontouchend = function() {
						img_ref.ontouchmove = null;
						img_ref.ontouchend = null;
					};
					
					origin = event_coords(e);
					if(origin[0] === undefined && e.originalEvent){	//touch start screws with me
						origin = event_coords(e.originalEvent);
					}
				} else {

					document.onmousemove = image_move_event;
					document.onmouseup = function() {
						document.onmousemove = null;
						document.onmouseup = null;
					};

					origin = event_coords(e);
				}

			//--------------------------------------------------
			// Record starting position

				img_start_left = img_current_left;
				img_start_top = img_current_top;
		}

	//--------------------------------------------------
	// Default styles for JS enabled version

		function css_rule_add(css_rule) {

			var style_element,
				head_ref;

			style_element = document.createElement('style');

			if (style_element.tagName === 'style') { // HTML mode converts tag to upper case

				style_element.setAttribute('type', 'text/css');
				style_element.appendChild(document.createTextNode(css_rule));

				head_ref = document.getElementsByTagName('head');
				if (head_ref[0]) {
					head_ref[0].appendChild(style_element);
				}

			} else {

				document.write('<style type="text\/css"> ' + css_rule + ' <\/style>'); // For older browsers (IE6)

			}

		}

		//css_rule_add('#image-zoom-wrapper {overflow: hidden; position: relative;} #image-zoom {visibility: hidden; position: relative;}');

	//--------------------------------------------------
	// On load

		//public access
		$.zoomify_in = image_zoom_in;
		$.zoomify_out = image_zoom_out;

		$.zoomify = function(div,img) { // Not DOM ready, as we need the image to have loaded

			div_ref = div;//document.getElementById('image-zoom-wrapper');
			img_ref = img;//document.getElementById('image-zoom');


			//reset things
			div_half_width = null;
			div_half_height = null;
			img_orig_width = null;
			img_orig_height = null;
			img_zoom_width = null;
			img_zoom_height = null;
			img_start_left = null;
			img_start_top = null;
			img_current_left = null;
			img_current_top = null;
			zoom_control_refs = {};
			zoom_level = 0;
			zoom_levels = [];
			zoom_level_count = [];
			click_last = 0;
			origin = null;


			if (div_ref && img_ref) {

				//--------------------------------------------------
				// Variables

					var div_border = 0,
						div_style,
						div_width,
						div_height,
						width,
						height,
						button,
						buttons,
						name,
						len,
						k;

				//--------------------------------------------------
				// Wrapper size

					try {
						div_style = getComputedStyle(div_ref, '');
						div_border = div_style.getPropertyValue('border-top-width');
						div_half_width = div_style.getPropertyValue('width');
						div_half_height = div_style.getPropertyValue('height');
					} catch(e) {
						div_border = div_ref.currentStyle.borderWidth;
						div_half_width = div_ref.currentStyle.width;
						div_half_height = div_ref.currentStyle.height;
					}

					div_half_width = Math.round(parseInt(div_half_width, 10) / 2);
					div_half_height = Math.round(parseInt(div_half_height, 10) / 2);

				//--------------------------------------------------
				// Original size

					img_orig_width = img_ref.width;
					img_orig_height = img_ref.height;


				//--------------------------------------------------
				// Zoom levels

					//--------------------------------------------------
					// Defaults

						div_width = (div_half_width * 2);
						div_height = (div_half_height * 2);

						width = img_orig_width;
						height = img_orig_height;

						zoom_levels[zoom_levels.length] = width;

						while (width > div_width || height > div_height) {
							width = (width * 0.75);
							height = (height * 0.75);
							zoom_levels[zoom_levels.length] = Math.round(width);

						}
						zoom_levels.reverse(); // Yep IE5.0 does not support unshift... but I do wonder if a single reverse() is quicker than inserting at the beginning of the array.

					//--------------------------------------------------
					// Mobile phone, over zoom

						if (parseInt(div_border, 10) === 5) { // img width on webkit will return width before CSS is applied
							zoom_levels[zoom_levels.length] = Math.round(img_orig_width * 1.75);
							zoom_levels[zoom_levels.length] = Math.round(img_orig_width * 3);
						}

					//--------------------------------------------------
					// Set default

						zoom_level_count = (zoom_levels.length - 1);





				//--------------------------------------------------
				// Add zoom controls

					buttons = [{'t' : 'in', 's' : 'on'}, {'t' : 'in', 's' : 'off'}, {'t' : 'out', 's' : 'on'}, {'t' : 'out', 's' : 'off'}];

					for (k = 0, len = buttons.length; k < len; k = k + 1) {

						button = buttons[k];
						name = button.t + '-' + button.s;

						zoom_control_refs[name] = document.createElement('div');
						zoom_control_refs[name].className = 'zoom-control zoom-' + button.t + ' zoom-' + button.s;

						if (button.t === 'in') {
							if (button.s === 'on') {
								zoom_control_refs[name].onmousedown = image_zoom_in; // onclick on iPhone seems to have a more pronounced delay
							}
						} else {
							if (button.s === 'on') {
								zoom_control_refs[name].onmousedown = image_zoom_out;
							}
						}

						if (button.s === 'on') {
							try {
								zoom_control_refs[name].style.cursor = 'pointer';
							} catch(err) {
								zoom_control_refs[name].style.cursor = 'hand'; // Yes, even IE5 support
							}
						}
						if( zoom_level_count ) {	//only append buttons if we have actual zoom levels but we need to still build them
							div_ref.appendChild(zoom_control_refs[name]);
						}

					}

					image_zoom(zoom_level_count);

				//--------------------------------------------------
				// Make visible

					//img_ref.style.visibility = 'visible';
					//img_ref.style.cursor = 'move';

					//div_ref.style.backgroundImage = 'none';

				//--------------------------------------------------
				// Add events

					img_ref.onmousedown = image_move_start;

					//img_ref.ontouchstart = image_move_start;
					$(document).on("touchstart.lightbox","#lightbox img",function(e){
						image_move_start(e);
					});


					if (div_ref.addEventListener) {

						div_ref.addEventListener('DOMMouseScroll', scroll_event, false);
						div_ref.addEventListener('mousewheel', scroll_event, false);

					} else if (div_ref.attachEvent) {

						div_ref.attachEvent('onmousewheel', scroll_event);

					}


					document.onkeyup = function(e) {

						var keyCode = (e ? e.which : window.event.keyCode);

						if (keyCode === 37 || keyCode === 39) { // left or right

							img_current_left = (img_current_left + (keyCode === 39 ? 50 : -50));

							image_move_update();

						} else if (keyCode === 38 || keyCode === 40) { // up or down

							img_current_top = (img_current_top + (keyCode === 40 ? 50 : -50));

							image_move_update();

						} else if (keyCode === 107 || keyCode === 187 || keyCode === 61) { // + or = (http://www.javascripter.net/faq/keycodes.htm)

							image_zoom_in();

						} else if (keyCode === 109 || keyCode === 189) { // - or _

							image_zoom_out();

						}

					};

			}

		};

}());
;
/**
 * Lightbox
 *
 * @description
 */
var fastCo = fastCo || {};

fastCo.lightbox = (function() {
  var config = {
      container: '#lightbox',
      selectors: ['inline-large', 'inline-small', 'inline-zoom'],
      expandSelector: 'inline-expanded',
      zoomSelector: 'inline-zoom',
      padding: 10
    };
  
  function lightboxBuild($img) {
    var $figure = $img.closest('figure'),
         selector = '';

    if( $figure.hasClass("loading") ) return; //handle double clicks
    $figure.addClass("loading");

    $.each(config.selectors, function(index, selectorClass) {
      if ( $figure.hasClass(selectorClass) ) {
        selector = selectorClass;
        return false;
      }
    });

    var $div = $(config.container).empty().appendTo("body");  //must move to end of document each time

    $div.append('<a class="lightbox-close" href="javascript://;">close</a>')

    var expandedSrc = $img.attr("src").replace('imagecache\/'+selector, '');  //get the base image url

    // create and append image element
    if (expandedSrc) {
        showLightBox();

        var $image = $('<img />');
        $image.load(function() {
          $div.removeClass("loading");
          $div.prepend($image);
          $.zoomify($div.get(0), this);
        })
        .attr('src', expandedSrc);
    }

    $figure.removeClass("loading"); //the lightbox should have been shown and if not want to remove class anyway
  };

  function showLightBox(){
    $(config.container).show().addClass("loading");
    $("body").addClass("fullscreen");

    $(document).on("keydown.lightbox",function(e){
      if(e.keyCode === 27 ) {
        hideLightbox();
        return false;
      }
    })
    .on("click.lightbox",".lightbox-close",function(){
      hideLightbox();
    });
  }
  function hideLightbox(){
    $(config.container).hide();
    $("body").removeClass("fullscreen");
    $(document).off(".lightbox")
  }



  function init(options) {
      config = $.extend(config, options);

      $.each(config.selectors, function(index, selector) {
        $('.'+selector+' img').before('<div class="lightbox-expand"></div>')

        $('.'+selector+' img').click(function() {
            var $img = $(this);
            lightboxBuild($img);
        });
      });

      $('.lightbox-expand').click(function() {
          var $img = $(this).next();
          lightboxBuild($img);
      });
  };

  return {
      init: init
  };

}());
;
//     Underscore.js 1.3.3
//     (c) 2009-2012 Jeremy Ashkenas, DocumentCloud Inc.
//     Underscore is freely distributable under the MIT license.
//     Portions of Underscore are inspired or borrowed from Prototype,
//     Oliver Steele's Functional, and John Resig's Micro-Templating.
//     For all details and documentation:
//     http://documentcloud.github.com/underscore

(function() {

  // Baseline setup
  // --------------

  // Establish the root object, `window` in the browser, or `global` on the server.
  var root = this;

  // Save the previous value of the `_` variable.
  var previousUnderscore = root._;

  // Establish the object that gets returned to break out of a loop iteration.
  var breaker = {};

  // Save bytes in the minified (but not gzipped) version:
  var ArrayProto = Array.prototype, ObjProto = Object.prototype, FuncProto = Function.prototype;

  // Create quick reference variables for speed access to core prototypes.
  var push             = ArrayProto.push,
      slice            = ArrayProto.slice,
      unshift          = ArrayProto.unshift,
      toString         = ObjProto.toString,
      hasOwnProperty   = ObjProto.hasOwnProperty;

  // All **ECMAScript 5** native function implementations that we hope to use
  // are declared here.
  var
    nativeForEach      = ArrayProto.forEach,
    nativeMap          = ArrayProto.map,
    nativeReduce       = ArrayProto.reduce,
    nativeReduceRight  = ArrayProto.reduceRight,
    nativeFilter       = ArrayProto.filter,
    nativeEvery        = ArrayProto.every,
    nativeSome         = ArrayProto.some,
    nativeIndexOf      = ArrayProto.indexOf,
    nativeLastIndexOf  = ArrayProto.lastIndexOf,
    nativeIsArray      = Array.isArray,
    nativeKeys         = Object.keys,
    nativeBind         = FuncProto.bind;

  // Create a safe reference to the Underscore object for use below.
  var _ = function(obj) { return new wrapper(obj); };

  // Export the Underscore object for **Node.js**, with
  // backwards-compatibility for the old `require()` API. If we're in
  // the browser, add `_` as a global object via a string identifier,
  // for Closure Compiler "advanced" mode.
  if (typeof exports !== 'undefined') {
    if (typeof module !== 'undefined' && module.exports) {
      exports = module.exports = _;
    }
    exports._ = _;
  } else {
    root['_'] = _;
  }

  // Current version.
  _.VERSION = '1.3.3';

  // Collection Functions
  // --------------------

  // The cornerstone, an `each` implementation, aka `forEach`.
  // Handles objects with the built-in `forEach`, arrays, and raw objects.
  // Delegates to **ECMAScript 5**'s native `forEach` if available.
  var each = _.each = _.forEach = function(obj, iterator, context) {
    if (obj == null) return;
    if (nativeForEach && obj.forEach === nativeForEach) {
      obj.forEach(iterator, context);
    } else if (obj.length === +obj.length) {
      for (var i = 0, l = obj.length; i < l; i++) {
        if (i in obj && iterator.call(context, obj[i], i, obj) === breaker) return;
      }
    } else {
      for (var key in obj) {
        if (_.has(obj, key)) {
          if (iterator.call(context, obj[key], key, obj) === breaker) return;
        }
      }
    }
  };

  // Return the results of applying the iterator to each element.
  // Delegates to **ECMAScript 5**'s native `map` if available.
  _.map = _.collect = function(obj, iterator, context) {
    var results = [];
    if (obj == null) return results;
    if (nativeMap && obj.map === nativeMap) return obj.map(iterator, context);
    each(obj, function(value, index, list) {
      results[results.length] = iterator.call(context, value, index, list);
    });
    if (obj.length === +obj.length) results.length = obj.length;
    return results;
  };

  // **Reduce** builds up a single result from a list of values, aka `inject`,
  // or `foldl`. Delegates to **ECMAScript 5**'s native `reduce` if available.
  _.reduce = _.foldl = _.inject = function(obj, iterator, memo, context) {
    var initial = arguments.length > 2;
    if (obj == null) obj = [];
    if (nativeReduce && obj.reduce === nativeReduce) {
      if (context) iterator = _.bind(iterator, context);
      return initial ? obj.reduce(iterator, memo) : obj.reduce(iterator);
    }
    each(obj, function(value, index, list) {
      if (!initial) {
        memo = value;
        initial = true;
      } else {
        memo = iterator.call(context, memo, value, index, list);
      }
    });
    if (!initial) throw new TypeError('Reduce of empty array with no initial value');
    return memo;
  };

  // The right-associative version of reduce, also known as `foldr`.
  // Delegates to **ECMAScript 5**'s native `reduceRight` if available.
  _.reduceRight = _.foldr = function(obj, iterator, memo, context) {
    var initial = arguments.length > 2;
    if (obj == null) obj = [];
    if (nativeReduceRight && obj.reduceRight === nativeReduceRight) {
      if (context) iterator = _.bind(iterator, context);
      return initial ? obj.reduceRight(iterator, memo) : obj.reduceRight(iterator);
    }
    var reversed = _.toArray(obj).reverse();
    if (context && !initial) iterator = _.bind(iterator, context);
    return initial ? _.reduce(reversed, iterator, memo, context) : _.reduce(reversed, iterator);
  };

  // Return the first value which passes a truth test. Aliased as `detect`.
  _.find = _.detect = function(obj, iterator, context) {
    var result;
    any(obj, function(value, index, list) {
      if (iterator.call(context, value, index, list)) {
        result = value;
        return true;
      }
    });
    return result;
  };

  // Return all the elements that pass a truth test.
  // Delegates to **ECMAScript 5**'s native `filter` if available.
  // Aliased as `select`.
  _.filter = _.select = function(obj, iterator, context) {
    var results = [];
    if (obj == null) return results;
    if (nativeFilter && obj.filter === nativeFilter) return obj.filter(iterator, context);
    each(obj, function(value, index, list) {
      if (iterator.call(context, value, index, list)) results[results.length] = value;
    });
    return results;
  };

  // Return all the elements for which a truth test fails.
  _.reject = function(obj, iterator, context) {
    var results = [];
    if (obj == null) return results;
    each(obj, function(value, index, list) {
      if (!iterator.call(context, value, index, list)) results[results.length] = value;
    });
    return results;
  };

  // Determine whether all of the elements match a truth test.
  // Delegates to **ECMAScript 5**'s native `every` if available.
  // Aliased as `all`.
  _.every = _.all = function(obj, iterator, context) {
    var result = true;
    if (obj == null) return result;
    if (nativeEvery && obj.every === nativeEvery) return obj.every(iterator, context);
    each(obj, function(value, index, list) {
      if (!(result = result && iterator.call(context, value, index, list))) return breaker;
    });
    return !!result;
  };

  // Determine if at least one element in the object matches a truth test.
  // Delegates to **ECMAScript 5**'s native `some` if available.
  // Aliased as `any`.
  var any = _.some = _.any = function(obj, iterator, context) {
    iterator || (iterator = _.identity);
    var result = false;
    if (obj == null) return result;
    if (nativeSome && obj.some === nativeSome) return obj.some(iterator, context);
    each(obj, function(value, index, list) {
      if (result || (result = iterator.call(context, value, index, list))) return breaker;
    });
    return !!result;
  };

  // Determine if a given value is included in the array or object using `===`.
  // Aliased as `contains`.
  _.include = _.contains = function(obj, target) {
    var found = false;
    if (obj == null) return found;
    if (nativeIndexOf && obj.indexOf === nativeIndexOf) return obj.indexOf(target) != -1;
    found = any(obj, function(value) {
      return value === target;
    });
    return found;
  };

  // Invoke a method (with arguments) on every item in a collection.
  _.invoke = function(obj, method) {
    var args = slice.call(arguments, 2);
    return _.map(obj, function(value) {
      return (_.isFunction(method) ? method || value : value[method]).apply(value, args);
    });
  };

  // Convenience version of a common use case of `map`: fetching a property.
  _.pluck = function(obj, key) {
    return _.map(obj, function(value){ return value[key]; });
  };

  // Return the maximum element or (element-based computation).
  _.max = function(obj, iterator, context) {
    if (!iterator && _.isArray(obj) && obj[0] === +obj[0]) return Math.max.apply(Math, obj);
    if (!iterator && _.isEmpty(obj)) return -Infinity;
    var result = {computed : -Infinity};
    each(obj, function(value, index, list) {
      var computed = iterator ? iterator.call(context, value, index, list) : value;
      computed >= result.computed && (result = {value : value, computed : computed});
    });
    return result.value;
  };

  // Return the minimum element (or element-based computation).
  _.min = function(obj, iterator, context) {
    if (!iterator && _.isArray(obj) && obj[0] === +obj[0]) return Math.min.apply(Math, obj);
    if (!iterator && _.isEmpty(obj)) return Infinity;
    var result = {computed : Infinity};
    each(obj, function(value, index, list) {
      var computed = iterator ? iterator.call(context, value, index, list) : value;
      computed < result.computed && (result = {value : value, computed : computed});
    });
    return result.value;
  };

  // Shuffle an array.
  _.shuffle = function(obj) {
    var shuffled = [], rand;
    each(obj, function(value, index, list) {
      rand = Math.floor(Math.random() * (index + 1));
      shuffled[index] = shuffled[rand];
      shuffled[rand] = value;
    });
    return shuffled;
  };

  // Sort the object's values by a criterion produced by an iterator.
  _.sortBy = function(obj, val, context) {
    var iterator = _.isFunction(val) ? val : function(obj) { return obj[val]; };
    return _.pluck(_.map(obj, function(value, index, list) {
      return {
        value : value,
        criteria : iterator.call(context, value, index, list)
      };
    }).sort(function(left, right) {
      var a = left.criteria, b = right.criteria;
      if (a === void 0) return 1;
      if (b === void 0) return -1;
      return a < b ? -1 : a > b ? 1 : 0;
    }), 'value');
  };

  // Groups the object's values by a criterion. Pass either a string attribute
  // to group by, or a function that returns the criterion.
  _.groupBy = function(obj, val) {
    var result = {};
    var iterator = _.isFunction(val) ? val : function(obj) { return obj[val]; };
    each(obj, function(value, index) {
      var key = iterator(value, index);
      (result[key] || (result[key] = [])).push(value);
    });
    return result;
  };

  // Use a comparator function to figure out the smallest index at which
  // an object should be inserted so as to maintain order. Uses binary search.
  _.sortedIndex = function(array, obj, iterator) {
    iterator || (iterator = _.identity);
    var value = iterator(obj);
    var low = 0, high = array.length;
    while (low < high) {
      var mid = (low + high) >> 1;
      iterator(array[mid]) < value ? low = mid + 1 : high = mid;
    }
    return low;
  };

  // Safely convert anything iterable into a real, live array.
  _.toArray = function(obj) {
    if (!obj)                                     return [];
    if (_.isArray(obj))                           return slice.call(obj);
    if (_.isArguments(obj))                       return slice.call(obj);
    if (obj.toArray && _.isFunction(obj.toArray)) return obj.toArray();
    return _.values(obj);
  };

  // Return the number of elements in an object.
  _.size = function(obj) {
    return _.isArray(obj) ? obj.length : _.keys(obj).length;
  };

  // Array Functions
  // ---------------

  // Get the first element of an array. Passing **n** will return the first N
  // values in the array. Aliased as `head` and `take`. The **guard** check
  // allows it to work with `_.map`.
  _.first = _.head = _.take = function(array, n, guard) {
    return (n != null) && !guard ? slice.call(array, 0, n) : array[0];
  };

  // Returns everything but the last entry of the array. Especially useful on
  // the arguments object. Passing **n** will return all the values in
  // the array, excluding the last N. The **guard** check allows it to work with
  // `_.map`.
  _.initial = function(array, n, guard) {
    return slice.call(array, 0, array.length - ((n == null) || guard ? 1 : n));
  };

  // Get the last element of an array. Passing **n** will return the last N
  // values in the array. The **guard** check allows it to work with `_.map`.
  _.last = function(array, n, guard) {
    if ((n != null) && !guard) {
      return slice.call(array, Math.max(array.length - n, 0));
    } else {
      return array[array.length - 1];
    }
  };

  // Returns everything but the first entry of the array. Aliased as `tail`.
  // Especially useful on the arguments object. Passing an **index** will return
  // the rest of the values in the array from that index onward. The **guard**
  // check allows it to work with `_.map`.
  _.rest = _.tail = function(array, index, guard) {
    return slice.call(array, (index == null) || guard ? 1 : index);
  };

  // Trim out all falsy values from an array.
  _.compact = function(array) {
    return _.filter(array, function(value){ return !!value; });
  };

  // Return a completely flattened version of an array.
  _.flatten = function(array, shallow) {
    return (function flatten(input, output) {
      each(input, function(value) {
        if (_.isArray(value)) {
          shallow ? push.apply(output, value) : flatten(value, output);
        } else {
          output.push(value);
        }
      });
      return output;
    })(array, []);
  };

  // Return a version of the array that does not contain the specified value(s).
  _.without = function(array) {
    return _.difference(array, slice.call(arguments, 1));
  };

  // Produce a duplicate-free version of the array. If the array has already
  // been sorted, you have the option of using a faster algorithm.
  // Aliased as `unique`.
  _.uniq = _.unique = function(array, isSorted, iterator) {
    var initial = iterator ? _.map(array, iterator) : array;
    var results = [];
    // The `isSorted` flag is irrelevant if the array only contains two elements.
    if (array.length < 3) isSorted = true;
    _.reduce(initial, function(memo, value, index) {
      if (isSorted ? _.last(memo) !== value || !memo.length : !_.include(memo, value)) {
        memo.push(value);
        results.push(array[index]);
      }
      return memo;
    }, []);
    return results;
  };

  // Produce an array that contains the union: each distinct element from all of
  // the passed-in arrays.
  _.union = function() {
    return _.uniq(_.flatten(arguments, true));
  };

  // Produce an array that contains every item shared between all the
  // passed-in arrays. (Aliased as "intersect" for back-compat.)
  _.intersection = _.intersect = function(array) {
    var rest = slice.call(arguments, 1);
    return _.filter(_.uniq(array), function(item) {
      return _.every(rest, function(other) {
        return _.indexOf(other, item) >= 0;
      });
    });
  };

  // Take the difference between one array and a number of other arrays.
  // Only the elements present in just the first array will remain.
  _.difference = function(array) {
    var rest = _.flatten(slice.call(arguments, 1), true);
    return _.filter(array, function(value){ return !_.include(rest, value); });
  };

  // Zip together multiple lists into a single array -- elements that share
  // an index go together.
  _.zip = function() {
    var args = slice.call(arguments);
    var length = _.max(_.pluck(args, 'length'));
    var results = new Array(length);
    for (var i = 0; i < length; i++) results[i] = _.pluck(args, "" + i);
    return results;
  };

  // If the browser doesn't supply us with indexOf (I'm looking at you, **MSIE**),
  // we need this function. Return the position of the first occurrence of an
  // item in an array, or -1 if the item is not included in the array.
  // Delegates to **ECMAScript 5**'s native `indexOf` if available.
  // If the array is large and already in sort order, pass `true`
  // for **isSorted** to use binary search.
  _.indexOf = function(array, item, isSorted) {
    if (array == null) return -1;
    var i, l;
    if (isSorted) {
      i = _.sortedIndex(array, item);
      return array[i] === item ? i : -1;
    }
    if (nativeIndexOf && array.indexOf === nativeIndexOf) return array.indexOf(item);
    for (i = 0, l = array.length; i < l; i++) if (i in array && array[i] === item) return i;
    return -1;
  };

  // Delegates to **ECMAScript 5**'s native `lastIndexOf` if available.
  _.lastIndexOf = function(array, item) {
    if (array == null) return -1;
    if (nativeLastIndexOf && array.lastIndexOf === nativeLastIndexOf) return array.lastIndexOf(item);
    var i = array.length;
    while (i--) if (i in array && array[i] === item) return i;
    return -1;
  };

  // Generate an integer Array containing an arithmetic progression. A port of
  // the native Python `range()` function. See
  // [the Python documentation](http://docs.python.org/library/functions.html#range).
  _.range = function(start, stop, step) {
    if (arguments.length <= 1) {
      stop = start || 0;
      start = 0;
    }
    step = arguments[2] || 1;

    var len = Math.max(Math.ceil((stop - start) / step), 0);
    var idx = 0;
    var range = new Array(len);

    while(idx < len) {
      range[idx++] = start;
      start += step;
    }

    return range;
  };

  // Function (ahem) Functions
  // ------------------

  // Reusable constructor function for prototype setting.
  var ctor = function(){};

  // Create a function bound to a given object (assigning `this`, and arguments,
  // optionally). Binding with arguments is also known as `curry`.
  // Delegates to **ECMAScript 5**'s native `Function.bind` if available.
  // We check for `func.bind` first, to fail fast when `func` is undefined.
  _.bind = function bind(func, context) {
    var bound, args;
    if (func.bind === nativeBind && nativeBind) return nativeBind.apply(func, slice.call(arguments, 1));
    if (!_.isFunction(func)) throw new TypeError;
    args = slice.call(arguments, 2);
    return bound = function() {
      if (!(this instanceof bound)) return func.apply(context, args.concat(slice.call(arguments)));
      ctor.prototype = func.prototype;
      var self = new ctor;
      var result = func.apply(self, args.concat(slice.call(arguments)));
      if (Object(result) === result) return result;
      return self;
    };
  };

  // Bind all of an object's methods to that object. Useful for ensuring that
  // all callbacks defined on an object belong to it.
  _.bindAll = function(obj) {
    var funcs = slice.call(arguments, 1);
    if (funcs.length == 0) funcs = _.functions(obj);
    each(funcs, function(f) { obj[f] = _.bind(obj[f], obj); });
    return obj;
  };

  // Memoize an expensive function by storing its results.
  _.memoize = function(func, hasher) {
    var memo = {};
    hasher || (hasher = _.identity);
    return function() {
      var key = hasher.apply(this, arguments);
      return _.has(memo, key) ? memo[key] : (memo[key] = func.apply(this, arguments));
    };
  };

  // Delays a function for the given number of milliseconds, and then calls
  // it with the arguments supplied.
  _.delay = function(func, wait) {
    var args = slice.call(arguments, 2);
    return setTimeout(function(){ return func.apply(null, args); }, wait);
  };

  // Defers a function, scheduling it to run after the current call stack has
  // cleared.
  _.defer = function(func) {
    return _.delay.apply(_, [func, 1].concat(slice.call(arguments, 1)));
  };

  // Returns a function, that, when invoked, will only be triggered at most once
  // during a given window of time.
  _.throttle = function(func, wait) {
    var context, args, timeout, throttling, more, result;
    var whenDone = _.debounce(function(){ more = throttling = false; }, wait);
    return function() {
      context = this; args = arguments;
      var later = function() {
        timeout = null;
        if (more) func.apply(context, args);
        whenDone();
      };
      if (!timeout) timeout = setTimeout(later, wait);
      if (throttling) {
        more = true;
      } else {
        throttling = true;
        result = func.apply(context, args);
      }
      whenDone();
      return result;
    };
  };

  // Returns a function, that, as long as it continues to be invoked, will not
  // be triggered. The function will be called after it stops being called for
  // N milliseconds. If `immediate` is passed, trigger the function on the
  // leading edge, instead of the trailing.
  _.debounce = function(func, wait, immediate) {
    var timeout;
    return function() {
      var context = this, args = arguments;
      var later = function() {
        timeout = null;
        if (!immediate) func.apply(context, args);
      };
      var callNow = immediate && !timeout;
      clearTimeout(timeout);
      timeout = setTimeout(later, wait);
      if (callNow) func.apply(context, args);
    };
  };

  // Returns a function that will be executed at most one time, no matter how
  // often you call it. Useful for lazy initialization.
  _.once = function(func) {
    var ran = false, memo;
    return function() {
      if (ran) return memo;
      ran = true;
      return memo = func.apply(this, arguments);
    };
  };

  // Returns the first function passed as an argument to the second,
  // allowing you to adjust arguments, run code before and after, and
  // conditionally execute the original function.
  _.wrap = function(func, wrapper) {
    return function() {
      var args = [func].concat(slice.call(arguments, 0));
      return wrapper.apply(this, args);
    };
  };

  // Returns a function that is the composition of a list of functions, each
  // consuming the return value of the function that follows.
  _.compose = function() {
    var funcs = arguments;
    return function() {
      var args = arguments;
      for (var i = funcs.length - 1; i >= 0; i--) {
        args = [funcs[i].apply(this, args)];
      }
      return args[0];
    };
  };

  // Returns a function that will only be executed after being called N times.
  _.after = function(times, func) {
    if (times <= 0) return func();
    return function() {
      if (--times < 1) { return func.apply(this, arguments); }
    };
  };

  // Object Functions
  // ----------------

  // Retrieve the names of an object's properties.
  // Delegates to **ECMAScript 5**'s native `Object.keys`
  _.keys = nativeKeys || function(obj) {
    if (obj !== Object(obj)) throw new TypeError('Invalid object');
    var keys = [];
    for (var key in obj) if (_.has(obj, key)) keys[keys.length] = key;
    return keys;
  };

  // Retrieve the values of an object's properties.
  _.values = function(obj) {
    return _.map(obj, _.identity);
  };

  // Return a sorted list of the function names available on the object.
  // Aliased as `methods`
  _.functions = _.methods = function(obj) {
    var names = [];
    for (var key in obj) {
      if (_.isFunction(obj[key])) names.push(key);
    }
    return names.sort();
  };

  // Extend a given object with all the properties in passed-in object(s).
  _.extend = function(obj) {
    each(slice.call(arguments, 1), function(source) {
      for (var prop in source) {
        obj[prop] = source[prop];
      }
    });
    return obj;
  };

  // Return a copy of the object only containing the whitelisted properties.
  _.pick = function(obj) {
    var result = {};
    each(_.flatten(slice.call(arguments, 1)), function(key) {
      if (key in obj) result[key] = obj[key];
    });
    return result;
  };

  // Fill in a given object with default properties.
  _.defaults = function(obj) {
    each(slice.call(arguments, 1), function(source) {
      for (var prop in source) {
        if (obj[prop] == null) obj[prop] = source[prop];
      }
    });
    return obj;
  };

  // Create a (shallow-cloned) duplicate of an object.
  _.clone = function(obj) {
    if (!_.isObject(obj)) return obj;
    return _.isArray(obj) ? obj.slice() : _.extend({}, obj);
  };

  // Invokes interceptor with the obj, and then returns obj.
  // The primary purpose of this method is to "tap into" a method chain, in
  // order to perform operations on intermediate results within the chain.
  _.tap = function(obj, interceptor) {
    interceptor(obj);
    return obj;
  };

  // Internal recursive comparison function for `isEqual`.
  function eq(a, b, stack) {
    // Identical objects are equal. `0 === -0`, but they aren't identical.
    // See the Harmony `egal` proposal: http://wiki.ecmascript.org/doku.php?id=harmony:egal.
    if (a === b) return a !== 0 || 1 / a == 1 / b;
    // A strict comparison is necessary because `null == undefined`.
    if (a == null || b == null) return a === b;
    // Unwrap any wrapped objects.
    if (a._chain) a = a._wrapped;
    if (b._chain) b = b._wrapped;
    // Invoke a custom `isEqual` method if one is provided.
    if (a.isEqual && _.isFunction(a.isEqual)) return a.isEqual(b);
    if (b.isEqual && _.isFunction(b.isEqual)) return b.isEqual(a);
    // Compare `[[Class]]` names.
    var className = toString.call(a);
    if (className != toString.call(b)) return false;
    switch (className) {
      // Strings, numbers, dates, and booleans are compared by value.
      case '[object String]':
        // Primitives and their corresponding object wrappers are equivalent; thus, `"5"` is
        // equivalent to `new String("5")`.
        return a == String(b);
      case '[object Number]':
        // `NaN`s are equivalent, but non-reflexive. An `egal` comparison is performed for
        // other numeric values.
        return a != +a ? b != +b : (a == 0 ? 1 / a == 1 / b : a == +b);
      case '[object Date]':
      case '[object Boolean]':
        // Coerce dates and booleans to numeric primitive values. Dates are compared by their
        // millisecond representations. Note that invalid dates with millisecond representations
        // of `NaN` are not equivalent.
        return +a == +b;
      // RegExps are compared by their source patterns and flags.
      case '[object RegExp]':
        return a.source == b.source &&
               a.global == b.global &&
               a.multiline == b.multiline &&
               a.ignoreCase == b.ignoreCase;
    }
    if (typeof a != 'object' || typeof b != 'object') return false;
    // Assume equality for cyclic structures. The algorithm for detecting cyclic
    // structures is adapted from ES 5.1 section 15.12.3, abstract operation `JO`.
    var length = stack.length;
    while (length--) {
      // Linear search. Performance is inversely proportional to the number of
      // unique nested structures.
      if (stack[length] == a) return true;
    }
    // Add the first object to the stack of traversed objects.
    stack.push(a);
    var size = 0, result = true;
    // Recursively compare objects and arrays.
    if (className == '[object Array]') {
      // Compare array lengths to determine if a deep comparison is necessary.
      size = a.length;
      result = size == b.length;
      if (result) {
        // Deep compare the contents, ignoring non-numeric properties.
        while (size--) {
          // Ensure commutative equality for sparse arrays.
          if (!(result = size in a == size in b && eq(a[size], b[size], stack))) break;
        }
      }
    } else {
      // Objects with different constructors are not equivalent.
      if ('constructor' in a != 'constructor' in b || a.constructor != b.constructor) return false;
      // Deep compare objects.
      for (var key in a) {
        if (_.has(a, key)) {
          // Count the expected number of properties.
          size++;
          // Deep compare each member.
          if (!(result = _.has(b, key) && eq(a[key], b[key], stack))) break;
        }
      }
      // Ensure that both objects contain the same number of properties.
      if (result) {
        for (key in b) {
          if (_.has(b, key) && !(size--)) break;
        }
        result = !size;
      }
    }
    // Remove the first object from the stack of traversed objects.
    stack.pop();
    return result;
  }

  // Perform a deep comparison to check if two objects are equal.
  _.isEqual = function(a, b) {
    return eq(a, b, []);
  };

  // Is a given array, string, or object empty?
  // An "empty" object has no enumerable own-properties.
  _.isEmpty = function(obj) {
    if (obj == null) return true;
    if (_.isArray(obj) || _.isString(obj)) return obj.length === 0;
    for (var key in obj) if (_.has(obj, key)) return false;
    return true;
  };

  // Is a given value a DOM element?
  _.isElement = function(obj) {
    return !!(obj && obj.nodeType == 1);
  };

  // Is a given value an array?
  // Delegates to ECMA5's native Array.isArray
  _.isArray = nativeIsArray || function(obj) {
    return toString.call(obj) == '[object Array]';
  };

  // Is a given variable an object?
  _.isObject = function(obj) {
    return obj === Object(obj);
  };

  // Is a given variable an arguments object?
  // Define a fallback version of the method in browsers (ahem, IE), where
  // there isn't any inspectable "Arguments" type.
  _.isArguments = function(obj) {
    return toString.call(obj) == '[object Arguments]';
  };
  if (!_.isArguments(arguments)) {
    _.isArguments = function(obj) {
      return !!(obj && _.has(obj, 'callee'));
    };
  }

  // Is a given value a function?
  _.isFunction = function(obj) {
    return toString.call(obj) == '[object Function]';
  };

  // Is a given value a string?
  _.isString = function(obj) {
    return toString.call(obj) == '[object String]';
  };

  // Is a given value a number?
  _.isNumber = function(obj) {
    return toString.call(obj) == '[object Number]';
  };

  // Is a given object a finite number?
  _.isFinite = function(obj) {
    return _.isNumber(obj) && isFinite(obj);
  };

  // Is the given value `NaN`?
  _.isNaN = function(obj) {
    // `NaN` is the only value for which `===` is not reflexive.
    return obj !== obj;
  };

  // Is a given value a boolean?
  _.isBoolean = function(obj) {
    return obj === true || obj === false || toString.call(obj) == '[object Boolean]';
  };

  // Is a given value a date?
  _.isDate = function(obj) {
    return toString.call(obj) == '[object Date]';
  };

  // Is the given value a regular expression?
  _.isRegExp = function(obj) {
    return toString.call(obj) == '[object RegExp]';
  };

  // Is a given value equal to null?
  _.isNull = function(obj) {
    return obj === null;
  };

  // Is a given variable undefined?
  _.isUndefined = function(obj) {
    return obj === void 0;
  };

  // Does an object have the given "own" property?
  _.has = function(obj, key) {
    return hasOwnProperty.call(obj, key);
  };

  // Utility Functions
  // -----------------

  // Run Underscore.js in *noConflict* mode, returning the `_` variable to its
  // previous owner. Returns a reference to the Underscore object.
  _.noConflict = function() {
    root._ = previousUnderscore;
    return this;
  };

  // Keep the identity function around for default iterators.
  _.identity = function(value) {
    return value;
  };

  // Run a function **n** times.
  _.times = function(n, iterator, context) {
    for (var i = 0; i < n; i++) iterator.call(context, i);
  };

  // Escape a string for HTML interpolation.
  _.escape = function(string) {
    return (''+string)
      .replace(/&/g, '&amp;')
      .replace(/</g, '&lt;')
      .replace(/>/g, '&gt;')
      .replace(/"/g, '&quot;')
      .replace(/'/g, '&#x27;')
      .replace(/\//g,'&#x2F;');
  };

  // If the value of the named property is a function then invoke it;
  // otherwise, return it.
  _.result = function(object, property) {
    if (object == null) return null;
    var value = object[property];
    return _.isFunction(value) ? value.call(object) : value;
  };

  // Add your own custom functions to the Underscore object, ensuring that
  // they're correctly added to the OOP wrapper as well.
  _.mixin = function(obj) {
    each(_.functions(obj), function(name){
      addToWrapper(name, _[name] = obj[name]);
    });
  };

  // Generate a unique integer id (unique within the entire client session).
  // Useful for temporary DOM ids.
  var idCounter = 0;
  _.uniqueId = function(prefix) {
    var id = idCounter++;
    return prefix ? prefix + id : id;
  };

  // By default, Underscore uses ERB-style template delimiters, change the
  // following template settings to use alternative delimiters.
  _.templateSettings = {
    evaluate    : /<%([\s\S]+?)%>/g,
    interpolate : /<%=([\s\S]+?)%>/g,
    escape      : /<%-([\s\S]+?)%>/g
  };

  // When customizing `templateSettings`, if you don't want to define an
  // interpolation, evaluation or escaping regex, we need one that is
  // guaranteed not to match.
  var noMatch = /.^/;

  // Certain characters need to be escaped so that they can be put into a
  // string literal.
  var escapes = {
    '\\': '\\',
    "'": "'",
    'r': '\r',
    'n': '\n',
    't': '\t',
    'u2028': '\u2028',
    'u2029': '\u2029'
  };

  for (var p in escapes) escapes[escapes[p]] = p;
  var escaper = /\\|'|\r|\n|\t|\u2028|\u2029/g;
  var unescaper = /\\(\\|'|r|n|t|u2028|u2029)/g;

  // Within an interpolation, evaluation, or escaping, remove HTML escaping
  // that had been previously added.
  var unescape = function(code) {
    return code.replace(unescaper, function(match, escape) {
      return escapes[escape];
    });
  };

  // JavaScript micro-templating, similar to John Resig's implementation.
  // Underscore templating handles arbitrary delimiters, preserves whitespace,
  // and correctly escapes quotes within interpolated code.
  _.template = function(text, data, settings) {
    settings = _.defaults(settings || {}, _.templateSettings);

    // Compile the template source, taking care to escape characters that
    // cannot be included in a string literal and then unescape them in code
    // blocks.
    var source = "__p+='" + text
      .replace(escaper, function(match) {
        return '\\' + escapes[match];
      })
      .replace(settings.escape || noMatch, function(match, code) {
        return "'+\n((__t=(" + unescape(code) + "))==null?'':_.escape(__t))+\n'";
      })
      .replace(settings.interpolate || noMatch, function(match, code) {
        return "'+\n((__t=(" + unescape(code) + "))==null?'':__t)+\n'";
      })
      .replace(settings.evaluate || noMatch, function(match, code) {
        return "';\n" + unescape(code) + "\n;__p+='";
      }) + "';\n";

    // If a variable is not specified, place data values in local scope.
    if (!settings.variable) source = 'with(obj||{}){\n' + source + '}\n';

    source = "var __t,__p='',__j=Array.prototype.join," +
      "print=function(){__p+=__j.call(arguments,'')};\n" +
      source + "return __p;\n";

    var render = new Function(settings.variable || 'obj', '_', source);
    if (data) return render(data, _);
    var template = function(data) {
      return render.call(this, data, _);
    };

    // Provide the compiled function source as a convenience for precompilation.
    template.source = 'function(' + (settings.variable || 'obj') + '){\n' + source + '}';

    return template;
  };

  // Add a "chain" function, which will delegate to the wrapper.
  _.chain = function(obj) {
    return _(obj).chain();
  };

  // The OOP Wrapper
  // ---------------

  // If Underscore is called as a function, it returns a wrapped object that
  // can be used OO-style. This wrapper holds altered versions of all the
  // underscore functions. Wrapped objects may be chained.
  var wrapper = function(obj) { this._wrapped = obj; };

  // Expose `wrapper.prototype` as `_.prototype`
  _.prototype = wrapper.prototype;

  // Helper function to continue chaining intermediate results.
  var result = function(obj, chain) {
    return chain ? _(obj).chain() : obj;
  };

  // A method to easily add functions to the OOP wrapper.
  var addToWrapper = function(name, func) {
    wrapper.prototype[name] = function() {
      var args = slice.call(arguments);
      unshift.call(args, this._wrapped);
      return result(func.apply(_, args), this._chain);
    };
  };

  // Add all of the Underscore functions to the wrapper object.
  _.mixin(_);

  // Add all mutator Array functions to the wrapper.
  each(['pop', 'push', 'reverse', 'shift', 'sort', 'splice', 'unshift'], function(name) {
    var method = ArrayProto[name];
    wrapper.prototype[name] = function() {
      var obj = this._wrapped;
      method.apply(obj, arguments);
      if ((name == 'shift' || name == 'splice') && obj.length === 0) delete obj[0];
      return result(obj, this._chain);
    };
  });

  // Add all accessor Array functions to the wrapper.
  each(['concat', 'join', 'slice'], function(name) {
    var method = ArrayProto[name];
    wrapper.prototype[name] = function() {
      return result(method.apply(this._wrapped, arguments), this._chain);
    };
  });

  // Start chaining a wrapped Underscore object.
  wrapper.prototype.chain = function() {
    this._chain = true;
    return this;
  };

  // Extracts the result from a wrapped and chained object.
  wrapper.prototype.value = function() {
    return this._wrapped;
  };

}).call(this);
;
/**
 * FastCompany Ads
 *
 * @author Mark Catalano, Matt Mankins
 * @description Helper functions for our advertising
  */

var fastCo = fastCo || {};

fastCo.ads = (function() {

    var state = {
        lastAd:0,
        lastInterstitial:0,
        lastSponsorshipAd:0,
        lastLeaderboardAd:0
    }; // for our current state

    var config = {
        adPeriod:1500,
        interstitialPeriod:2000,
        leaderboardPeriod:2000,
        sponsorshipPeriod:2000,
        selector: '.dart-tag'
    };


    init = function(options) {
        // Extend config with options
        config = $.extend(config, options);

        var selector = config.selector;

        $(document).on( 'interstitial.slider', function() {
            var slide = fastCo.slider.current();
            fastCo.ads.showInterstitial($(selector, slide.elem));
        });
    },

    showInterstitial = function($adContainer) {

        // we should only do this every so often, or the ads stop showing up due to writecapture bug/feature
        // we check to see when the last refresh happened, and either do the refresh immediately, or
        // queue it up
        var ts = Math.round((new Date()).getTime());
        var delta = ts - state.lastInterstitial; // the time in ms between now and the last time we saw this ad.

        if (delta >= config.interstitialPeriod) {
            state.lastInterstitial = ts;

           _showInterstitial($adContainer);          // this will only get refreshed when we're over the delta.

        } else {
            var toWait = config.interstitialPeriod - delta;
            setTimeout(function() { showInterstitial($adContainer); }, toWait); // call ourself in the future
        }
    },

    refreshAds = function () {
        window.ord = 1000000000 + Math.floor(Math.random() * 900000000);
        _refreshLeaderboardAd();
        _refreshSponsorshipAd();
    },


    refreshTheseAds = function (params) {

        window.ord = 1000000000 + Math.floor(Math.random() * 900000000);

        var ts = Math.round((new Date()).getTime());
        var delta = ts - state.lastAd;

        if (delta >= config.adPeriod) {
            state.lastAd = ts;

            window.tile = 1;

            for (var x in params) {

                if (Drupal.DART.settings.loadLastTags[params[x].ad_unit]){

                    // Get a New Ad Tag that will eventually replace the old tag
                    var adTag = Drupal.DART.tag( Drupal.DART.settings.loadLastTags[params[x].ad_unit] );

                    // Replace the old ad
                    if ($(params[x].selector).length < 1) {
                        continue;
                    }

                    $(params[x].selector).writeCapture().html(adTag);

                    window.tile++;
                }

            }


        }
    },

    _refreshLeaderboardAd = function () {

        var ts = Math.round((new Date()).getTime());
        var delta = ts - state.lastLeaderboardAd; // the time in ms between now and the last time we saw this ad.

        if (delta >= config.leaderboardPeriod) {

            state.lastLeaderboardAd = ts;

            if (Drupal.DART.settings.loadLastTags.leaderboard) {
                // Since tile and ord are bound to global scope,
                // this is the way to refresh them every time we load new page
                window.tile = 1;

                // Get a New Ad Tag that will eventually replace the old tag
                var adTag = Drupal.DART.tag(Drupal.DART.settings.loadLastTags.leaderboard);

                // Replace the old ad
                $('.header-advert .dart-name-leaderboard').writeCapture().html(adTag);
            }

        } else {
            var toWait = config.leaderboardPeriod - delta;
            setTimeout(function() { _refreshLeaderboardAd(); }, toWait); // call ourself in the future
        }

    },

    _refreshSponsorshipAd = function () {

        var ts = Math.round((new Date()).getTime());
        var delta = ts - state.lastSponsorshipAd; // the time in ms between now and the last time we saw this ad.

        if (delta >= config.sponsorshipPeriod) {

            state.lastSponsorshipAd = ts;

            if (Drupal.DART.settings.loadLastTags.sponsored_by) {
                // Since tile and ord are bound to global scope,
                // this is the way to refresh them every time we load new page
                tile = 3;

                // Get a New Ad Tag that will eventually replace the old tag
                var adTag = Drupal.DART.tag(Drupal.DART.settings.loadLastTags.sponsored_by);

                // Replace the old ad
                $('.dart-name-sponsored_by').writeCapture().html(adTag);
            }
        } else {
            var toWait = config.sponsorshipPeriod - delta;
            setTimeout(function() { _refreshSponsorshipAd(); }, toWait); // call ourself in the future
        }
    },

    _showInterstitial = function ($adContainer) {
        // Since tile and ord are bound to global scope,
        // this is the way to refresh them every time we load new page
        tile = 2;

        // Get a New Ad Tag that will eventually replace the old tag
        var adTag = Drupal.DART.tag(Drupal.DART.settings.loadLastTags.fullscreen_gallery_interstitial);

        // Replace the old ad
        $adContainer.writeCapture().html(adTag);
    };

    return {
        init: init,
        refreshAds: refreshAds,
        refreshTheseAds: refreshTheseAds,
        showInterstitial: showInterstitial
    }

})();

fastCo.ads.init();
;
/*!
 * jQuery doTimeout: Like setTimeout, but better! - v1.0 - 3/3/2010
 * http://benalman.com/projects/jquery-dotimeout-plugin/
 * 
 * Copyright (c) 2010 "Cowboy" Ben Alman
 * Dual licensed under the MIT and GPL licenses.
 * http://benalman.com/about/license/
 */

// Script: jQuery doTimeout: Like setTimeout, but better!
//
// *Version: 1.0, Last updated: 3/3/2010*
// 
// Project Home - http://benalman.com/projects/jquery-dotimeout-plugin/
// GitHub       - http://github.com/cowboy/jquery-dotimeout/
// Source       - http://github.com/cowboy/jquery-dotimeout/raw/master/jquery.ba-dotimeout.js
// (Minified)   - http://github.com/cowboy/jquery-dotimeout/raw/master/jquery.ba-dotimeout.min.js (1.0kb)
// 
// About: License
// 
// Copyright (c) 2010 "Cowboy" Ben Alman,
// Dual licensed under the MIT and GPL licenses.
// http://benalman.com/about/license/
// 
// About: Examples
// 
// These working examples, complete with fully commented code, illustrate a few
// ways in which this plugin can be used.
// 
// Debouncing      - http://benalman.com/code/projects/jquery-dotimeout/examples/debouncing/
// Delays, Polling - http://benalman.com/code/projects/jquery-dotimeout/examples/delay-poll/
// Hover Intent    - http://benalman.com/code/projects/jquery-dotimeout/examples/hoverintent/
// 
// About: Support and Testing
// 
// Information about what version or versions of jQuery this plugin has been
// tested with, what browsers it has been tested in, and where the unit tests
// reside (so you can test it yourself).
// 
// jQuery Versions - 1.3.2, 1.4.2
// Browsers Tested - Internet Explorer 6-8, Firefox 2-3.6, Safari 3-4, Chrome 4-5, Opera 9.6-10.1.
// Unit Tests      - http://benalman.com/code/projects/jquery-dotimeout/unit/
// 
// About: Release History
// 
// 1.0 - (3/3/2010) Callback can now be a string, in which case it will call
//       the appropriate $.method or $.fn.method, depending on where .doTimeout
//       was called. Callback must now return `true` (not just a truthy value)
//       to poll.
// 0.4 - (7/15/2009) Made the "id" argument optional, some other minor tweaks
// 0.3 - (6/25/2009) Initial release

(function($){
  '$:nomunge'; // Used by YUI compressor.
  
  var cache = {},
    
    // Reused internal string.
    doTimeout = 'doTimeout',
    
    // A convenient shortcut.
    aps = Array.prototype.slice;
  
  // Method: jQuery.doTimeout
  // 
  // Initialize, cancel, or force execution of a callback after a delay.
  // 
  // If delay and callback are specified, a doTimeout is initialized. The
  // callback will execute, asynchronously, after the delay. If an id is
  // specified, this doTimeout will override and cancel any existing doTimeout
  // with the same id. Any additional arguments will be passed into callback
  // when it is executed.
  // 
  // If the callback returns true, the doTimeout loop will execute again, after
  // the delay, creating a polling loop until the callback returns a non-true
  // value.
  // 
  // Note that if an id is not passed as the first argument, this doTimeout will
  // NOT be able to be manually canceled or forced. (for debouncing, be sure to
  // specify an id).
  // 
  // If id is specified, but delay and callback are not, the doTimeout will be
  // canceled without executing the callback. If force_mode is specified, the
  // callback will be executed, synchronously, but will only be allowed to
  // continue a polling loop if force_mode is true (provided the callback
  // returns true, of course). If force_mode is false, no polling loop will
  // continue, even if the callback returns true.
  // 
  // Usage:
  // 
  // > jQuery.doTimeout( [ id, ] delay, callback [, arg ... ] );
  // > jQuery.doTimeout( id [, force_mode ] );
  // 
  // Arguments:
  // 
  //  id - (String) An optional unique identifier for this doTimeout. If id is
  //    not specified, the doTimeout will NOT be able to be manually canceled or
  //    forced.
  //  delay - (Number) A zero-or-greater delay in milliseconds after which
  //    callback will be executed. 
  //  callback - (Function) A function to be executed after delay milliseconds.
  //  callback - (String) A jQuery method to be executed after delay
  //    milliseconds. This method will only poll if it explicitly returns
  //    true.
  //  force_mode - (Boolean) If true, execute that id's doTimeout callback
  //    immediately and synchronously, continuing any callback return-true
  //    polling loop. If false, execute the callback immediately and
  //    synchronously but do NOT continue a callback return-true polling loop.
  //    If omitted, cancel that id's doTimeout.
  // 
  // Returns:
  // 
  //  If force_mode is true, false or undefined and there is a
  //  yet-to-be-executed callback to cancel, true is returned, but if no
  //  callback remains to be executed, undefined is returned.
  
  $[doTimeout] = function() {
    return p_doTimeout.apply( window, [ 0 ].concat( aps.call( arguments ) ) );
  };
  
  // Method: jQuery.fn.doTimeout
  // 
  // Initialize, cancel, or force execution of a callback after a delay.
  // Operates like <jQuery.doTimeout>, but the passed callback executes in the
  // context of the jQuery collection of elements, and the id is stored as data
  // on the first element in that collection.
  // 
  // If delay and callback are specified, a doTimeout is initialized. The
  // callback will execute, asynchronously, after the delay. If an id is
  // specified, this doTimeout will override and cancel any existing doTimeout
  // with the same id. Any additional arguments will be passed into callback
  // when it is executed.
  // 
  // If the callback returns true, the doTimeout loop will execute again, after
  // the delay, creating a polling loop until the callback returns a non-true
  // value.
  // 
  // Note that if an id is not passed as the first argument, this doTimeout will
  // NOT be able to be manually canceled or forced (for debouncing, be sure to
  // specify an id).
  // 
  // If id is specified, but delay and callback are not, the doTimeout will be
  // canceled without executing the callback. If force_mode is specified, the
  // callback will be executed, synchronously, but will only be allowed to
  // continue a polling loop if force_mode is true (provided the callback
  // returns true, of course). If force_mode is false, no polling loop will
  // continue, even if the callback returns true.
  // 
  // Usage:
  // 
  // > jQuery('selector').doTimeout( [ id, ] delay, callback [, arg ... ] );
  // > jQuery('selector').doTimeout( id [, force_mode ] );
  // 
  // Arguments:
  // 
  //  id - (String) An optional unique identifier for this doTimeout, stored as
  //    jQuery data on the element. If id is not specified, the doTimeout will
  //    NOT be able to be manually canceled or forced.
  //  delay - (Number) A zero-or-greater delay in milliseconds after which
  //    callback will be executed. 
  //  callback - (Function) A function to be executed after delay milliseconds.
  //  callback - (String) A jQuery.fn method to be executed after delay
  //    milliseconds. This method will only poll if it explicitly returns
  //    true (most jQuery.fn methods return a jQuery object, and not `true`,
  //    which allows them to be chained and prevents polling).
  //  force_mode - (Boolean) If true, execute that id's doTimeout callback
  //    immediately and synchronously, continuing any callback return-true
  //    polling loop. If false, execute the callback immediately and
  //    synchronously but do NOT continue a callback return-true polling loop.
  //    If omitted, cancel that id's doTimeout.
  // 
  // Returns:
  // 
  //  When creating a <jQuery.fn.doTimeout>, the initial jQuery collection of
  //  elements is returned. Otherwise, if force_mode is true, false or undefined
  //  and there is a yet-to-be-executed callback to cancel, true is returned,
  //  but if no callback remains to be executed, undefined is returned.
  
  $.fn[doTimeout] = function() {
    var args = aps.call( arguments ),
      result = p_doTimeout.apply( this, [ doTimeout + args[0] ].concat( args ) );
    
    return typeof args[0] === 'number' || typeof args[1] === 'number'
      ? this
      : result;
  };
  
  function p_doTimeout( jquery_data_key ) {
    var that = this,
      elem,
      data = {},
      
      // Allows the plugin to call a string callback method.
      method_base = jquery_data_key ? $.fn : $,
      
      // Any additional arguments will be passed to the callback.
      args = arguments,
      slice_args = 4,
      
      id        = args[1],
      delay     = args[2],
      callback  = args[3];
    
    if ( typeof id !== 'string' ) {
      slice_args--;
      
      id        = jquery_data_key = 0;
      delay     = args[1];
      callback  = args[2];
    }
    
    // If id is passed, store a data reference either as .data on the first
    // element in a jQuery collection, or in the internal cache.
    if ( jquery_data_key ) { // Note: key is 'doTimeout' + id
      
      // Get id-object from the first element's data, otherwise initialize it to {}.
      elem = that.eq(0);
      elem.data( jquery_data_key, data = elem.data( jquery_data_key ) || {} );
      
    } else if ( id ) {
      // Get id-object from the cache, otherwise initialize it to {}.
      data = cache[ id ] || ( cache[ id ] = {} );
    }
    
    // Clear any existing timeout for this id.
    data.id && clearTimeout( data.id );
    delete data.id;
    
    // Clean up when necessary.
    function cleanup() {
      if ( jquery_data_key ) {
        elem.removeData( jquery_data_key );
      } else if ( id ) {
        delete cache[ id ];
      }
    };
    
    // Yes, there actually is a setTimeout call in here!
    function actually_setTimeout() {
      data.id = setTimeout( function(){ data.fn(); }, delay );
    };
    
    if ( callback ) {
      // A callback (and delay) were specified. Store the callback reference for
      // possible later use, and then setTimeout.
      data.fn = function( no_polling_loop ) {
        
        // If the callback value is a string, it is assumed to be the name of a
        // method on $ or $.fn depending on where doTimeout was executed.
        if ( typeof callback === 'string' ) {
          callback = method_base[ callback ];
        }
        
        callback.apply( that, aps.call( args, slice_args ) ) === true && !no_polling_loop
          
          // Since the callback returned true, and we're not specifically
          // canceling a polling loop, do it again!
          ? actually_setTimeout()
          
          // Otherwise, clean up and quit.
          : cleanup();
      };
      
      // Set that timeout!
      actually_setTimeout();
      
    } else if ( data.fn ) {
      // No callback passed. If force_mode (delay) is true, execute the data.fn
      // callback immediately, continuing any callback return-true polling loop.
      // If force_mode is false, execute the data.fn callback immediately but do
      // NOT continue a callback return-true polling loop. If force_mode is
      // undefined, simply clean up. Since data.fn was still defined, whatever
      // was supposed to happen hadn't yet, so return true.
      delay === undefined ? cleanup() : data.fn( delay === false );
      return true;
      
    } else {
      // Since no callback was passed, and data.fn isn't defined, it looks like
      // whatever was supposed to happen already did. Clean up and quit!
      cleanup();
    }
    
  };
  
})(jQuery);
;
/*!
 * jQuery imagesLoaded plugin v2.0.1
 * http://github.com/desandro/imagesloaded
 *
 * MIT License. by Paul Irish et al.
 */

/*jshint curly: true, eqeqeq: true, noempty: true, strict: true, undef: true, browser: true */
/*global jQuery: false */

;(function($, undefined) {
'use strict';

// blank image data-uri bypasses webkit log warning (thx doug jones)
var BLANK = 'data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///ywAAAAAAQABAAACAUwAOw==';

$.fn.imagesLoaded = function( callback ) {
	var $this = this,
		deferred = $.isFunction($.Deferred) ? $.Deferred() : 0,
		hasNotify = $.isFunction(deferred.notify),
		$images = $this.find('img').add( $this.filter('img') ),
		loaded = [],
		proper = [],
		broken = [];

	function doneLoading() {
		var $proper = $(proper),
			$broken = $(broken);

		if ( deferred ) {
			if ( broken.length ) {
				deferred.reject( $images, $proper, $broken );
			} else {
				deferred.resolve( $images );
			}
		}

		if ( $.isFunction( callback ) ) {
			callback.call( $this, $images, $proper, $broken );
		}
	}

	function imgLoaded( img, isBroken ) {
		// don't proceed if BLANK image, or image is already loaded
		if ( img.src === BLANK || $.inArray( img, loaded ) !== -1 ) {
			return;
		}

		// store element in loaded images array
		loaded.push( img );

		// keep track of broken and properly loaded images
		if ( isBroken ) {
			broken.push( img );
		} else {
			proper.push( img );
		}

		// cache image and its state for future calls
		$.data( img, 'imagesLoaded', { isBroken: isBroken, src: img.src } );

		// trigger deferred progress method if present
		if ( hasNotify ) {
			deferred.notifyWith( $(img), [ isBroken, $images, $(proper), $(broken) ] );
		}

		// call doneLoading and clean listeners if all images are loaded
		if ( $images.length === loaded.length ){
			setTimeout( doneLoading );
			$images.unbind( '.imagesLoaded' );
		}
	}

	// if no images, trigger immediately
	if ( !$images.length ) {
		doneLoading();
	} else {
		$images.bind( 'load.imagesLoaded error.imagesLoaded', function( event ){
			// trigger imgLoaded
			imgLoaded( event.target, event.type === 'error' );
		}).each( function( i, el ) {
			var src = el.src;

			// find out if this image has been already checked for status
			// if it was, and src has not changed, call imgLoaded on it
			var cached = $.data( el, 'imagesLoaded' );
			if ( cached && cached.src === src ) {
				imgLoaded( el, cached.isBroken );
				return;
			}

			// if complete is true and browser supports natural sizes, try
			// to check for image status manually
			if ( el.complete && el.naturalWidth !== undefined ) {
				imgLoaded( el, el.naturalWidth === 0 || el.naturalHeight === 0 );
				return;
			}

			// cached images don't fire load sometimes, so we reset src, but only when
			// dealing with IE, or image is complete (loaded) and failed manual check
			// webkit hack from http://groups.google.com/group/jquery-dev/browse_thread/thread/eee6ab7b2da50e1f
			if ( el.readyState || el.complete ) {
				el.src = BLANK;
				el.src = src;
			}
		});
	}

	return deferred ? deferred.promise( $this ) : $this;
};

})(jQuery);;
/**
 * @name		jQuery FullScreen Plugin
 * @author		Martin Angelov
 * @version 	1.0
 * @url			http://tutorialzine.com/2012/02/enhance-your-website-fullscreen-api/
 * @license		MIT License
 */

(function($){
	
	// Adding a new test to the jQuery support object
	$.support.fullscreen = supportFullScreen();
	
	// Creating the plugin
	$.fn.fullScreen = function(props){
		
		if(!$.support.fullscreen || this.length != 1){
			
			// The plugin can be called only
			// on one element at a time
			
			return this;
		}
		
		if(fullScreenStatus()){
			// if we are already in fullscreen, exit
			cancelFullScreen();
			return this;
		}
		
		// You can potentially pas two arguments a color
		// for the background and a callback function
		
		var options = $.extend({
			'background' : '#111',
			'callback'	 : function(){}
		}, props);
		
		// This temporary div is the element that is
		// actually going to be enlarged in full screen
		
		var fs = $('<div>',{
			'css' : {
				'overflow-y' : 'auto',
				'background' : options.background,
				'width'		 : '100%',
				'height'	 : '100%'
			}
		});

		var elem = this;

		// You can use the .fullScreen class to
		// apply styling to your element
		elem.addClass('fullScreen');
		
		// Inserting our element in the temporary
		// div, after which we zoom it in fullscreen
		fs.insertBefore(elem);
		fs.append(elem);
		requestFullScreen(fs.get(0));
		
		fs.click(function(e){
			if(e.target == this){
				// If the black bar was clicked
				cancelFullScreen();
			}
		});
		
		elem.cancel = function(){
			cancelFullScreen();
			return elem;
		};
		
		onFullScreenEvent(function(fullScreen){
			
			if(!fullScreen){
				
				// We have exited full screen.
				// Remove the class and destroy
				// the temporary div
				
				elem.removeClass('fullScreen').insertBefore(fs);
				fs.remove();
			}
			
			// Calling the user supplied callback
			options.callback(fullScreen);
		});
		
		return elem;
	};
	
	
	// These helper functions available only to our plugin scope.


	function supportFullScreen(){
		var doc = document.documentElement;
		
		return	('requestFullscreen' in doc) ||
				('mozRequestFullScreen' in doc && document.mozFullScreenEnabled) ||
				('webkitRequestFullScreen' in doc);
	}

	function requestFullScreen(elem){

		if (elem.requestFullscreen) {
		    elem.requestFullscreen();
		}
		else if (elem.mozRequestFullScreen) {
		    elem.mozRequestFullScreen();
		}
		else if (elem.webkitRequestFullScreen) {
		    elem.webkitRequestFullScreen();
		}
	}

	function fullScreenStatus(){
		return	document.fullscreen ||
				document.mozFullScreen ||
				document.webkitIsFullScreen;
	}
	
	function cancelFullScreen(){
		if (document.exitFullscreen) {
		    document.exitFullscreen();
		}
		else if (document.mozCancelFullScreen) {
		    document.mozCancelFullScreen();
		}
		else if (document.webkitCancelFullScreen) {
		    document.webkitCancelFullScreen();
		}
	}

	function onFullScreenEvent(callback){
		$(document).on("fullscreenchange mozfullscreenchange webkitfullscreenchange", function(){
			// The full screen status is automatically
			// passed to our callback as an argument.
			callback(fullScreenStatus());
		});
	}

})(jQuery);
;
/*
 * throttledresize: special jQuery event that happens at a reduced rate compared to "resize"
 *
 * latest version and complete README available on Github:
 * https://github.com/louisremi/jquery-smartresize
 *
 * Copyright 2012 @louis_remi
 * Licensed under the MIT license.
 *
 * This saved you an hour of work? 
 * Send me music http://www.amazon.co.uk/wishlist/HNTU0468LQON
 */
(function($) {

var $event = $.event,
	$special,
	dummy = {_:0},
	frame = 0,
	wasResized, animRunning;

$special = $event.special.throttledresize = {
	setup: function() {
		$( this ).on( "resize", $special.handler );
	},
	teardown: function() {
		$( this ).off( "resize", $special.handler );
	},
	handler: function( event, execAsap ) {
		// Save the context
		var context = this,
			args = arguments;

		wasResized = true;

        if ( !animRunning ) {
        	$(dummy).animate(dummy, { duration: Infinity, step: function() {
	        	frame++;

	        	if ( frame > $special.threshold && wasResized || execAsap ) {
	        		// set correct event type
        			event.type = "throttledresize";
	        		$event.dispatch.apply( context, args );
	        		wasResized = false;
	        		frame = 0;
	        	}
	        	if ( frame > 9 ) {
	        		$(dummy).stop();
	        		animRunning = false;
	        		frame = 0;
	        	}
	        }});
	        animRunning = true;
        }
	},
	threshold: 0
};

})(jQuery);;
/**
 * jQuery Plugin to obtain touch gestures from iPhone, iPod Touch and iPad, should also work with Android mobile phones (not tested yet!)
 * Common usage: wipe images (left and right to show the previous or next image)
 * 
 * @author Andreas Waltl, netCU Internetagentur (http://www.netcu.de)
 * @version 1.1.1 (9th December 2010) - fix bug (older IE's had problems)
 * @version 1.1 (1st September 2010) - support wipe up and wipe down
 * @version 1.0 (15th July 2010)
 */
(function($) { 
   $.fn.touchwipe = function(settings) {
     var config = {
    		min_move_x: 20,
    		min_move_y: 20,
 			wipeLeft: function() { },
 			wipeRight: function() { },
 			wipeUp: function() { },
 			wipeDown: function() { },
			preventDefaultEvents: true
	 };
     
     if (settings) $.extend(config, settings);
 
     this.each(function() {
    	 var startX;
    	 var startY;
		 var isMoving = false;

    	 function cancelTouch() {
    		 this.removeEventListener('touchmove', onTouchMove);
    		 startX = null;
    		 isMoving = false;
    	 }	
    	 
    	 function onTouchMove(e) {
    		 if(config.preventDefaultEvents) {
    			 e.preventDefault();
    		 }
    		 if(isMoving) {
	    		 var x = e.touches[0].pageX;
	    		 var y = e.touches[0].pageY;
	    		 var dx = startX - x;
	    		 var dy = startY - y;
	    		 if(Math.abs(dx) >= config.min_move_x) {
	    			cancelTouch();
	    			if(dx > 0) {
	    				config.wipeLeft();
	    			}
	    			else {
	    				config.wipeRight();
	    			}
	    		 }
	    		 else if(Math.abs(dy) >= config.min_move_y) {
		    			cancelTouch();
		    			if(dy > 0) {
		    				config.wipeDown();
		    			}
		    			else {
		    				config.wipeUp();
		    			}
		    		 }
    		 }
    	 }
    	 
    	 function onTouchStart(e)
    	 {
    		 if (e.touches.length == 1) {
    			 startX = e.touches[0].pageX;
    			 startY = e.touches[0].pageY;
    			 isMoving = true;
    			 this.addEventListener('touchmove', onTouchMove, false);
    		 }
    	 }    	 
    	 if ('ontouchstart' in document.documentElement) {
    		 this.addEventListener('touchstart', onTouchStart, false);
    	 }
     });
 
     return this;
   };
 
 })(jQuery);
;
/*
 * jQuery hashchange event - v1.3 - 7/21/2010
 * http://benalman.com/projects/jquery-hashchange-plugin/
 * 
 * Copyright (c) 2010 "Cowboy" Ben Alman
 * Dual licensed under the MIT and GPL licenses.
 * http://benalman.com/about/license/
 */
(function($,e,b){var c="hashchange",h=document,f,g=$.event.special,i=h.documentMode,d="on"+c in e&&(i===b||i>7);function a(j){j=j||location.href;return"#"+j.replace(/^[^#]*#?(.*)$/,"$1")}$.fn[c]=function(j){return j?this.bind(c,j):this.trigger(c)};$.fn[c].delay=50;g[c]=$.extend(g[c],{setup:function(){if(d){return false}$(f.start)},teardown:function(){if(d){return false}$(f.stop)}});f=(function(){var j={},p,m=a(),k=function(q){return q},l=k,o=k;j.start=function(){p||n()};j.stop=function(){p&&clearTimeout(p);p=b};function n(){var r=a(),q=o(m);if(r!==m){l(m=r,q);$(e).trigger(c)}else{if(q!==m){location.href=location.href.replace(/#.*/,"")+q}}p=setTimeout(n,$.fn[c].delay)}$.browser.msie&&!d&&(function(){var q,r;j.start=function(){if(!q){r=$.fn[c].src;r=r&&r+a();q=$('<iframe tabindex="-1" title="empty"/>').hide().one("load",function(){r||l(a());n()}).attr("src",r||"javascript:0").insertAfter("body")[0].contentWindow;h.onpropertychange=function(){try{if(event.propertyName==="title"){q.document.title=h.title}}catch(s){}}}};j.stop=k;o=function(){return a(q.location.href)};l=function(v,s){var u=q.document,t=$.fn[c].domain;if(v!==s){u.title=h.title;u.open();t&&u.write('<script>document.domain="'+t+'"<\/script>');u.close();q.location.hash=v}}})();return j})()})(jQuery,this);
;
/**
 * Slideshow
 *
 * @description    Fastcompany Slideshow - Depends on Underscore.js
 */

var fastCo = fastCo || {};
fastCo.slider = fastCo.slider || {};

//variable to track whether to refresh ads, it should not refresh when first loaded
var adRefresh = false;

fastCo.slider = (function() {

        var defaults = {
            gutterWidth: 150,
            contentWidth: 800,
            newElemPostion: 1,

            circular: true,
            container: "#poster",

            slideBuilder: '',
            // set this to a function to override our builder method
            adSlideBuilder: '',
            // set this to a function to override our adbuilder method
            $thumbnails: $("#thumbs-slider").find(".thumbs-inner a"),

            instructions: 'Click next image or use arrow keys to advance.',

            adShow: true,
            adFrequency: 4,
            adWidth: 550
        },

        settings = {},

        $container = {},
        $slider = {},

        anim = false,
        hashInit = parseInt(location.hash.substring(1), 10),
        hash = (hashInit) ? hashInit : 1,
        // our slides start at position one
        hashChange = false,
        hashUpdate = false,

        slides = [],
        $slides = [],

        currentIndex = 1,
        // Starting default index.
        galleryCount = 0,
        // Total count of all positions, including ads.
        currentSlide = 1,

        $window = $(window),
        windowWidth = $window.width(),
        firstLoad = true,
        containerHeight = 0,
        lastAdRefresh = 0,
        // we only refresh ads when we haven't done it recently
        pageTitle = document.title,

        LOADED = 'loaded.slider',
        SLIDE = 'slide.slider',
        INTERSTITIAL = 'interstitial.slide',

        init = function(options, slidesInit) {
            var self = this;

            // Create our slider, with all slides.
            // position to starting number
            // show ads after every N interactions, if that's turned on.
            settings = $.extend({}, defaults, options);

            slides = slidesInit;

            $container = $(settings.container);

            // If we have no container, return.
            if ($container.length === 0) {
                return;
            }

            // Empty the container of contents.
            $container.empty();

            // Temporarily set these all equal. Recalculate after the gallery is built.
            currentIndex = currentSlide = hash;

            buildGallery(); // this sets up the entire div structure and initialize.

            $(document).on('loaded.slider', function(e) {
                // find the currentSlide
                currentIndex = getNthSlide(currentSlide);

                // this should just reposition the div
                // pass in adRefresh, initially it's false to prevent initial refresh. After the function, it will be set to true.
                showSlide(currentIndex,adRefresh);

                // add processed class to div
                $container.delay(100).addClass('slider-processed');

                _registerEvents();

                _bindControls();

            });


            // Load the image at index that matches hash from page load
            $window.hashchange(function(event) {
                hash = parseInt(location.hash.substring(1), 10);

                // hashChange and hashUpdate flags prevent a loop.
                if (!_.isNaN(hash) && hashUpdate === false && !firstLoad) {
                    hashChange = true;
                    currentSlide = hash;
                    currentIndex = getNthSlide(currentSlide);
                    showSlide(currentIndex,adRefresh);
                } else {
                    hashUpdate = false;
                    event.preventDefault();
                }
            });



        },

        getNthSlide = function(n) {
            // Calculate number of additional ad items for N slides.
            var adShow = settings.adShow;

            if (adShow === true) {
                var adFrequency = settings.adFrequency;
                var slideNumber = parseInt(n, 10);
                var nthAlpha = (Math.floor(slideNumber / adFrequency)) + slideNumber;

                return (Math.floor(nthAlpha / adFrequency)) + slideNumber;
            }

            return parseInt(n, 10);
        },

        buildGallery = function() {

            // this builds the main slider container. we'll add individual slides to this container.
            // this div gets shifted left/right in the viewer's viewport
            $slider = $('<div id="slider" class="clearfix"></div>').appendTo($container);

            _.each(slides, function(slide, id) {

                galleryCount++;

                if (positionIsAd(galleryCount)) {
                    // this is an ad
                    $slide = $(buildAdSlide(galleryCount)).appendTo($slider);
                    $slides.push($slide);

                    // we insert the ad as well as the actual slide.
                    galleryCount++;
                    $slide = $(buildSlide(slide, galleryCount)).appendTo($slider);
                    $slides.push($slide);
                } else {
                    // standard slide, not an ad
                    $slide = $(buildSlide(slide, galleryCount)).appendTo($slider);
                    $slides.push($slide);
                }

            });

            galleryCount++;
            // this is an ad
            $slide = $(buildAdSlide(galleryCount)).appendTo($slider);
            $slides.push($slide);


            $slider.imagesLoaded(function($images, $proper, $broken) {
                // this fires when all the images have loaded in content our container
                var c = 0;

                $images.each(function() {
                    c++;
                    if (!(positionIsAd(c))) {

                        if ($(this).width() > settings.contentWidth) {
                            $(this).width(settings.contentWidth);
                        }

                        // console.log("setting #slide-"+c+" to "+$(this).width());
                        $slide = $('#slide-' + c);
                        $slide.width($(this).width());

                        var cH = $container.height();

                        var topOffset = cH / 2 - $(this).height() / 2;

                        // console.log("#slide-"+c+" height: "+$(this).height());
                        $('#slide-img-' + c).parents('.slide').css({
                            top: topOffset + 'px',
                            width: $(this).width()
                        });

                        var $thisSlide = $('.slide-info', $slide);

                        // add overflow class as necessary
                        var sH = $slide.outerHeight();
                        var iH = $thisSlide.outerHeight() - parseInt($thisSlide.css('padding-bottom'), 10);
                        var sT = topOffset + sH + iH;

                        // a little bit of fudge
                        // var pad = 0.02;
                        var pad = 0;

                        if (sT > (cH + Math.floor(cH * pad))) {
                            $('.slide-info', $slide).addClass('overflow');
                        }
                    }
                });

                // clone first and last for circular mode
                if (settings.circular) {
                    _buildCircular();
                }

                // trigger readiness
                trigger(LOADED);
            });
        },

        buildSlide = function(slideObj, galleryCount) {

            // we want to be able to override this with out own buildSlide function.  All that it has to return is the HTML that will get injected into the position.
            if (typeof settings.slideBuilder == 'function') {
                return settings.slideBuilder(slideObj, galleryCount);
            }

            var filePath = slideObj.filepath,
                title = slideObj.title,
                alt = slideObj.alt,
                caption = slideObj.caption,
                credit = slideObj.credit;

            title.replace(/\"/g, ""); // no quotes, please.
            var html = '';

            if((slideObj.html != null) &&  slideObj.html) {
                html += '<div title="' + title + '" style="width:' + settings.contentWidth + 'px" id="slide-' + galleryCount + '" class="slide html">';
                html += '   <div class="slide-content">';
                html +=         '<img id="slide-img-' + galleryCount + '" style="max-width:' + settings.contentWidth + 'px;" src="' + filePath + '" alt="' + alt + '"/>';
                html +=         '<div class="slide-custom-markup">' + slideObj.html + '</div>';
                html += '   </div>';
                html += '   <div id="slide-info-' + galleryCount + '" class="slide-info">';
                html += '       <div class="inner">';
                if (title.length) {
                    html += '        <div class="title">' + title + '</div>';
                }
                if (caption.length) {
                    html += '        <div class="caption">' + caption + '</div>';
                }
                if (credit.length) {
                    html += '        <div class="credit">' + credit + '</div>';
                }
                html += '       </div>';
                html += '   </div>';
                html += '</div>';

                return html;
            }

            html += '<div title="' + title + '" style="width:' + settings.contentWidth + 'px" id="slide-' + galleryCount + '" class="slide">';
            html += '  <div class="slide-content"><img id="slide-img-' + galleryCount + '" style="max-width:' + settings.contentWidth + 'px;" src="' + filePath + '" alt="' + alt + '"/></div>';
            if (title.length || caption.length || credit.length) {
                html += '  <div id="slide-info-' + galleryCount + '" class="slide-info">';
                html += '    <div class="inner">';
                if (title.length) {
                    html += '        <div class="title">' + title + '</div>';
                }
                if (caption.length) {
                    html += '        <div class="caption">' + caption + '</div>';
                }
                if (credit.length) {
                    html += '        <div class="credit">' + credit + '</div>';
                }
                html += '    </div>';
                html += '  </div>';
            }
            html += '</div>';

            return html;
        },

        buildAdSlide = function(galleryCount) {
            // we want to be able to override this with out own buildSlide function.  All that it has to return is the HTML that will get injected into the position.
            if (typeof settings.adSlideBuilder == 'function') {
                return settings.adSlideBuilder(galleryCount);
            }

            // a little bit of trickery here: we need to load in an invisible gif so that the "imagesloaded" event fires correctly.
            var html = '';

            html += '<div style="width:' + settings.adWidth + 'px" id="slide-' + galleryCount + '" class="slide slide-ad" style="border:3px solid #f00">';
            html += '   <div class="slide-content">';
            html += '       <div class="inner"><div class="dart-tag"><img src="/sites/all/themes/fc/img/0.gif" alt=""></div></div>';
            html += '   </div>';
            html += '</div>';

            return html;
        },

        _buildCircular = function() {
            // Insert cloned slides for better nav.
            var last = $('.slide:last-child', $slider).clone().removeAttr('id').addClass('cloned');


            var first = $('.slide:first-child', $slider).clone().removeAttr('id').addClass('cloned');

            $slider.append(first).prepend(last);

        },

        _registerEvents = function() {
            $window.on("throttledresize", function(event) {
                //update window width
                windowWidth = $window.width();

                //reposition the current slide
                showSlide(currentIndex,adRefresh);
            });

            $container.on('mouseenter', '.slider-current .slide-info.overflow', function() {
                var $this = $(this);

                $.doTimeout('hover', 200, function(elem) {
                    var t = 50;
                    var h = $this.height();
                    var top = (h - t > 0) ? h - t : 0;

                    $this.stop().addClass('open').animate({
                        'position': 'relative',
                        'top': top * -1
                    }, 200);

                });

            });

            $container.on('mouseleave', '.slider-current .slide-info.overflow', function() {
                var $this = $(this);

                $.doTimeout('hover', 0, function(elem) {
                    $this.stop().animate({
                        'position': 'relative',
                        'top': 0
                    }, 200, function() {
                        $this.removeClass('open');
                    });
                });

            });
        },

        _bindControls = function() {
            var self = this;

            // the main ui controls: connect every type of event to our navigate funciton.
            $container.on('click', '.slider-previous', function(e) {
                e.preventDefault();
                fastCo.slider.prev();
            });

            $container.on('click', '.slider-next', function(e) {
                e.preventDefault();
                fastCo.slider.next();
            });

            // add iOS touchwipe events on the large image wrapper
            $(document).touchwipe({
                wipeLeft: function() {
                    fastCo.slider.next();
                },
                wipeRight: function() {
                    fastCo.slider.prev();
                },
                preventDefaultEvents: false
            });

            $(document).on('keyup.slider', function(event) {
                if (event.keyCode == 39) {
                    fastCo.slider.next();
                } else if (event.keyCode == 37) {
                    fastCo.slider.prev();
                }

                // ToDo: Make Fullscreen functionality work
//                else if (event.keyCode == 70) {
//                    makeFullScreen();
//                }
            });

            // ToDo: Make Fullscreen functionality work
//            $container.on('click', '.slider-current img', function() {
//                makeFullScreen($container);
//            });
        },

        positionSlider = function($slide) {
            try {
                var leftOffset = 0;

                if ($slide[0].id === 'slide-1') {
                    // the starting point
                    leftOffset = -(parseInt(($slide.position().left - Math.abs((windowWidth / 2))) + ($slide.outerWidth(true) / 2), 10));
                } else {
                    leftOffset = -(parseInt(Math.abs((windowWidth / 2) - ($slide.outerWidth(true) / 2) - $slide.position().left), 10));
                }

                if (firstLoad) {
                    // position immediately
                    $slider.css({
                        left: leftOffset + 'px'
                    });

                    $slide.prepend("<div class='slide-instructions'><span>" + settings.instructions + "</span></div>");
                    $('.slide-instructions').fadeIn();

                    $slide.addClass("slider-current").next().addClass('slider-next').prev().prev().addClass('slider-previous');

                    anim = false;
                } else {
                    // animate position
                    $slider.animate({
                        left: leftOffset + "px"
                    }, 100, function() {
                        // Sometime a delay would cause an old slide
                        // to be used here, so, we reaquire with the index.
                        $('#slide-' + currentIndex).addClass("slider-current").next().addClass('slider-next').prev().prev().addClass('slider-previous');

                        anim = false;
                    });

                    $('.slide-instructions').fadeOut();
                }
            } catch (e) {
                // console.log('err2'+e);
            }

        },

        positionIsAd = function(positionCount) {
            var adShow = settings.adShow;
            var adFrequency = settings.adFrequency;
            //Calculate the number of ads the slideshow will have based on it's frequency
            var numberOfAds = Math.floor( galleryCount/settings.adFrequency);
            //Calculate the true number of slides with Ad
            var totalSlidesPlusAds =  slides.length + numberOfAds + 1;

            /*
            Debugging purpose only
            console.log("Current Index: " + currentIndex);
            console.log("Current Slide: " + currentSlide);
            console.log("PositionCount: " + positionCount);
            console.log("adFrequency: " + adFrequency);
            console.log("Slides.length: " + slides.length);
            console.log("galleryCount: " + galleryCount);
            console.log ('numberOfAds: ' + numberOfAds);
            console.log('totalSlidesPlusAds: ' + totalSlidesPlusAds);
            console.log("-----------------------------------");
            */

            // we want to show this ever N times, but not at the start
            if ((settings.adShow === true) && ( ((positionCount % settings.adFrequency) === 0) || (positionCount===totalSlidesPlusAds) || (positionCount===0) ) ) {
                if (positionCount != 1) {
                    return true;
                } else {
                    return false;
                }
            } else {
                return false;
            }
        },

// ToDo: Make Fullscreen functionality work
//        makeFullScreen = function($container) {
//
//            if($.support.fullscreen){
//                 $container.fullScreen({
//                     'callback': function(isFullScreen) {
//                     //reposition the current slide
//                     showSlide(currentIndex);
//                     }
//                 });
//            }
//        },

        show = function(index) {
            currentSlide = index;
            currentIndex = getNthSlide(currentSlide);
            showSlide(currentIndex,adRefresh);
        },

        showSlide = function(index,adRefresh) {
            // this should move the slider to position this slide to be the visible slide.
            try {

                // remove current, next and previous classes
                $('.slider-current', $slider).removeClass("slider-current");
                $('.slider-next', $slider).removeClass('slider-next');
                $('.slider-previous', $slider).removeClass('slider-previous');

                var $currentSlide = $('#slide-' + index);

                positionSlider($currentSlide);

                if (firstLoad === false && adRefresh == true) {
                    setTimeout(function(){
                        fastCo.ads.refreshTheseAds([
                            {
                                "selector": ".header-advert .dart-name-leaderboard",
                                "ad_unit": "leaderboard"
                            }, {
                                "selector": ".dart-name-sponsored_by",
                                "ad_unit": "sponsored_by"
                            }
                        ])
                    }, 100 );
                }

                // Load the Ad if the current slide is an ad unit slide
                if (positionIsAd(index)) {
                    //alert('this is an ad');
                    trigger(INTERSTITIAL);
                }

                if (!positionIsAd(index) && !firstLoad) {
                    if (hashChange === false) {
                        hashUpdate = true;
                        window.location.hash = currentSlide;
                    }

                    hashChange = false;

                    _updateBrowser(currentSlide);
                }

                firstLoad = false;
                adRefresh = true;

                trigger( SLIDE );   //this will trigger other slides to refresh.

            } catch (e) {
                // console.log("err: "+e);
            }
        },

        _updateBrowser = function(slideNumber) {
            var slide = slides[slideNumber - 1];
            var slideTitle = '';
            if( slide.title.length ) {
                slideTitle = ': ' + slide.title;
            }

            document.title = slideNumber + slideTitle + ' | ' + pageTitle;
        },

        navigate = function(direction) {
            if (anim) {
                return false;
            }

            anim = true;

            // if we are moving left, then we ++,
            // right, and we --,
            // modulo the size of the slideshow (we wrap around if that mode is set)
            if (direction === 'right') {
                currentIndex++;
                if (!positionIsAd(currentIndex)) {
                    currentSlide++;
                }
            } else {
                // left
                currentIndex--;
                if (!positionIsAd(currentIndex)) {
                    currentSlide--;
                }
            }

            // at the ends, we can change behavior, either wrapping or stopping.
            if (settings.circular) {
                if (currentIndex == 0){
                    currentIndex = galleryCount;
                }
                else if (currentIndex < 0) {
                    currentSlide = slides.length;
                    currentIndex = getNthSlide(currentSlide);
                }
                if (currentIndex > galleryCount) {
                    currentIndex = currentSlide = 1;
                }
            } else {
                if (currentIndex <= 0) {
                    currentIndex = currentSlide = 1;
                }
                if (currentIndex >= galleryCount) {
                    currentSlide = slides.length();
                    currentIndex = getNthSlide(currentSlide);
                }
            }

            // now we move to this slide.
            //By this point, when users are navigating the slides, ads should refresh.
            adRefresh = true;
            showSlide(currentIndex,adRefresh);


        },

        prev = function() {
            navigate('left');
        },

        next = function() {
            navigate('right');
        },

        current = function() {
            // return the slide from slides array, which is 0 indexed.
            return {
                elem: $slides[currentIndex - 1],
                index: currentIndex,
                num: currentSlide,
                interstitial: positionIsAd(currentIndex)
            };
        },

        trigger = function(event) {
            $.event.trigger(event);
        };

        return {
            init: init,
            prev: prev,
            next: next,
            current: current,
            show: show
        };

}());
;
/**
 * Carousel
 *
 * @description    Fast Company Carousel
 */

var fastCo = fastCo || {};
fastCo.carousel = fastCo.carousel || {};

fastCo.carousel = (function() {

    // Initial config values.
    var config = {
        'container': '#slideshow-thumbnails',
        'showNumbers': false
    },

        // Initial container
        $container = $(config.container),

        // Initial hash values
        hashInit = parseInt(location.hash.substring(1), 10),
        hash = (hashInit) ? hashInit : 1,

        // Placeholder carousel object.
        $carousel = {},

        // Slides loaded in JSON blob.
        slides = [],

        // Loaded state
        loaded = false,

        // Current thumb in view.
        current = hash,

        // The current slide object
        $current = {},

        // Total carousel item count.
        carouselCount = 0,

        // To center or not.
        centering = false,

        // Carousel measurements, calculated on init.
        width = 0,
        unit = 0,
        limitUpper = 0,
        limitLower = 0,

        // Carousel events.
        LOADED = 'loaded.carousel',

    init = function(options, slidesInit) {
        // Extend config with options
        config = $.extend(config, options);

        slides = slidesInit;

        $container = $(config.container);

        // If empty container, return.
        if ($container.length === 0) {
            return;
        }

        $container.empty();

        _build();

        $carousel.on(LOADED, function(e) {
            // Add the processed class to container.
            $container.addClass('carousel-processed');

            // Arrows and touch events
            _bindControls();

            // active binding
            _registerEvents();
        });
    },

    _build = function() {
        $carousel = _buildCarousel();

        $carousel.imagesLoaded(function($images, $proper, $broken) {
            // this fires when all the images have loaded in content our container
            // this should just reposition the tray
            show(current, function() {
                loaded = true;

                // All set. R2G
                trigger(LOADED);
            });
        });
    },

    _buildCarousel = function() {
        var dom = '';

        dom += '<div id="carousel" class="clearfix">';
        dom += '    <div class="carousel-prev carousel-nav"><span>&#9664;</span></div>';
        dom += '    <div class="carousel-next carousel-nav"><span>&#9654;</span></div>';
        dom += '    <div id="carousel-tray">';
        dom += '        <ul class="carousel-thumbs"></ul>';
        dom += '    </div>';
        dom += '</div>';

        var carousel = $(dom).appendTo($container);

        return _buildTray(carousel);
    },

    _buildTray = function(carousel) {
        tray = $('ul', carousel);

        _.each(slides, function(slide, id) {
            carouselCount++;

            // Build thumb html
            var thumb = _buildThumb(slide, carouselCount);

            // Add to tray
            $(thumb).appendTo(tray);
        });

        return carousel;
    },

    _buildThumb = function(slide, count) {
        var filepath = slide.thumbnail,
            title = slide.title;

        var img = false;

        var html = '';

        html += '<li class="thumb carousel-item">';
        html += '   <a title="' + title + '" href="#' + count + '">';
        if (filepath.length) {
            html += '   <div class="image"><img src="' + filepath + '" /></div>';
            img = true;
        }
        if (config.showNumbers || !img) {
            var numClass = img ? 'has-thumb' : 'no-thumb';
            html += '   <div class="number ' + numClass + '"><span>' + count + '</span></div>';
        }
        html += '   </a>';
        html += '</li>';

        return html;
    },

    _registerEvents = function() {
        $(document).on('slide.slider', function() {
            var slide = fastCo.slider.current();
            fastCo.carousel.show(slide.num);
        });
    },

    _bindControls = function() {
        // add iOS touchwipe events on the large image wrapper
        $(document).touchwipe({
            wipeLeft: function() {
                fastCo.carousel.next();
            },
            wipeRight: function() {
                fastCo.carousel.prev();
            },
            preventDefaultEvents: false
        });

        // Register events
        $('.carousel-prev', $carousel).on('click', function(e) {
            fastCo.carousel.prev();
        });

        $('.carousel-next', $carousel).on('click', function(e) {
            fastCo.carousel.next();
        });

        $('.carousel-item a', $carousel).on('click', function(e) {
            e.preventDefault();

            var href = $(this).attr('href');
            var idx = parseInt(href.substring(1), 10);
            fastCo.slider.show(idx);
        });
    },

    show = function(slideNumber, callback) {
        // current is no longer current, get rid of styles
        $container.find('.carousel-current').removeClass("carousel-current");
        $current = $('li:nth-child(' + slideNumber + ')', $carousel).addClass('carousel-current');

        // this should move the carousel to position this thumbnail to be within the visible set
        // width the carousel
        if (width === 0) {
            width = parseInt($carousel.css('width'), 10);
        }

        // individual unit width, would be offset + margins
        if (unit === 0) {
            unit = $('li:nth-child(2)', $carousel).position().left;
        }

        // limit for out-of-page right
        if (limitUpper === 0) {
            limitUpper = -($('li:last-child', $carousel).position().left + unit - width);
        }

        // Calculate whether we need centering or not.
        if (!loaded && ( (carouselCount * unit) >= $container.width() )) {
            centering = true;
        }

        if (centering) {
            _show(slideNumber);
        }

        if (callback && typeof(callback) === "function") {
            // execute the callback, passing parameters as necessary
            callback();
        }

        return this;
    },

    _show = function(slideNumber) {
        // right-of-center
        var c1 = Math.ceil(width / (2 * unit)) * unit;

        // left-of-center
        var c2 = Math.floor(width / (2 * unit)) * unit;

        if ($current.length > 0) {
            currLeft = $current.position().left;
            var left = limitLower;

            if (currLeft >= c1) {
                left = (-(currLeft - c2) >= limitUpper) ? -(currLeft - c2) : limitUpper;


            }

            moveTo(left);
        }
    },

    prev = function() {
        // current left position of tray
        var l = parseInt($('ul', $carousel).css('left'), 10);

        var left = (l + width <= limitLower) ? l + width : limitLower;

        moveTo(left);

        return this;
    },

    next = function() {
        // current left position of tray
        var l = parseInt($('ul', $carousel).css('left'), 10);

        var left = ((l - width) >= limitUpper) ? l - width : limitUpper;

        moveTo(left);

        return this;
    },

    moveTo = function(left) {
        $('ul', $carousel).animate({
            'left': left + "px"
        }, 'fast', function() {
            toggleNav(left);
        });
    },

    trigger = function(event) {
        $.event.trigger(event);
    },

    toggleNav = function(left) {
        if (left === limitLower) {
            $('.carousel-prev').fadeOut('fast');
        }

        if (left < limitLower) {
            if ($('.carousel-prev:hidden').length) {
                $('.carousel-prev', $carousel).fadeIn('fast');
            }
        }

        if (left > limitUpper) {
            if ($('.carousel-next:hidden').length) {
                $('.carousel-next', $carousel).fadeIn('fast');
            }
        }

        if (left === limitUpper) {
            $('.carousel-next').fadeOut('fast');
        }

        firstLoad = false;
    };

    return {
        init: init,
        next: next,
        prev: prev,
        show: show
    };

}());
;
/**
 * Headings
 *
 * @description
 */

var fastCo = fastCo || {};

fastCo.headings = function() {

    var config = {}

    var windowWidth = 0;

    var setWindowWidth = function() {
        windowWidth = $(window).width();
    };

    var positionHeading = function() {

        // Make sure the main Title text on General pages and User pages doesn't overlap with logo
        if (windowWidth <= 1180) {
            $('.poster-text-inner').css({'padding-left': '115px'});
        } else {
            $('.poster-text-inner').css({'padding-left': '20px'});
        }

        // Resize the Now Loading for reverse scroll when the window is narrower than 1200px
        if (windowWidth <= 1400) {
            $('.reverse-scroll-break .scroll-break-heading').addClass('narrow');
        } else {
            $('.reverse-scroll-break .scroll-break-heading.narrow').removeClass('narrow');
        }
    };

    var init = function(options){

        // Allows for a config object that can be overridden
        // copy properties of `options` to `config`. Will overwrite existing config options.
        for(var prop in options) {
            if(options.hasOwnProperty(prop)) {
                config[prop] = options[prop];
            }
        }

        setWindowWidth();
        positionHeading();

        $(window).bind("resize", function(){
            setWindowWidth();
            positionHeading();
        });

        amplify.subscribe('dayLoaded', positionHeading);

    };

    return {
        init: init
    }

}();

;
/**
 * Logo
 *
 * @description
 */

var fastCo = fastCo || {};

fastCo.logo = function(){

    var config = {};

    var windowWidth = 0;

    var setWindowWidth = function() {
        windowWidth = $(window).width();
    };

    var positionLogo = function() {
        var $logo = $('#logo');
        var headerAdHeight = $("#site-header .header-advert").height();
        var topNavHeight = $("#internal-nav").height();

        if (windowWidth < 1600) {
            $logo.removeClass('logoStick');
            return;
        }
        if (parseInt($(window).scrollTop(), 10) >= headerAdHeight + topNavHeight - 50) {
            $logo.addClass('logoStick');
            return logoColorSwipe();
        } else {
            return $logo.removeClass('logoStick');
        }
    };

    var logoColorSwipe = function() {
        var scroll = $(window).scrollTop();
        var logoSwipeTop = 0;
        var offsetVal = parseInt($('.main-wrapper').css('margin-top'), 10);
        var contentOffset = $('.main-wrapper').offset().top;
        var $logo = $('#logo');
        var logoHeight = $logo.height();

        if (offsetVal === 0) {
            offsetVal = -56;
        }

        logoSwipeTop = scroll + logoHeight - contentOffset - offsetVal - 1 + 35;
        if (logoSwipeTop < 0) {
            logoSwipeTop = 0;
        }
        if (logoSwipeTop > logoHeight) {
            logoSwipeTop = logoHeight;
        }
        $logo.find("span:first-child").css({
            'height': logoHeight - logoSwipeTop
        });
        return $logo.find(".dark").css({
            'height': logoSwipeTop
        });
    };

    var bindEvents = function() {

        $(window).bind("scroll", function(){
            positionLogo();
            logoColorSwipe();
        });

        $(window).bind("resize", function(){
            setWindowWidth();
            positionLogo();
            logoColorSwipe();
        });

    };

    var init = function(options) {

        // Allows for a config object that can be overridden
        // copy properties of `options` to `config`. Will overwrite existing config options.
        for(var prop in options) {
            if(options.hasOwnProperty(prop)){
                config[prop] = options[prop];
            }
        }
        setWindowWidth();
        bindEvents();
        positionLogo();
        logoColorSwipe();

    };

    return {
        init: init
    }

}();;
/**
 * Feature Image Size Chooser
 *
 * @author Mark Catalano
 * @description Utility to choose the correct size for the feature image to load based on the current window size
 */

var fastCo = fastCo || {};

fastCo.featureImageSizer = (function() {
    /** @type Array */
    var availableImageSizes = [960, 1280, 1920],
        /** @type Number */
        max = availableImageSizes.length,

        /** @type Number */
        i = 0,

        /** @type Number */
        windowWidth = $(window).width(),

        /** @type Array */
        fits = [];

    /**
     * @return {number} The width of the image that most closely fits the window without being less than the window width
     */
    var getFeaturedImageSize = function () {

        availableImageSizes.sort(function(a, b) {
            return b - a;
        });

        // End early if we just need to use the largest image size
        if (windowWidth > availableImageSizes[0]) {

            return availableImageSizes[0];

        } else {
            // Find images that are as wide or wider than the screen width
            for (i = 0; i < max; i++) {

                if (availableImageSizes[i] >= windowWidth) {
                    fits.push(availableImageSizes[i]);
                }

            }

            // Find the smallest image
            fits.sort(function(a, b) {
                return a - b;
            });

            return fits[0];
        }

    };

    /**
     * @return {undefined}
     */
    var init = function () {
        var $image = $('#poster-image').find('.current_img img');
        if ($image.length) {
            var currentImageSize = parseInt($image.attr("data-size"), 10),
                calculatedImageSize = getFeaturedImageSize(),
                imageSrc = $image.attr("src"),
                regex = /\/\d+\//;

            $image.load(function(){
                $('body').trigger("featureImageLoaded");
                amplify.publish('featureImageLoaded');
            });

            if (currentImageSize != calculatedImageSize) {
                $image.attr("src", imageSrc.replace(regex, "/" + calculatedImageSize + "/")).css({'display': 'block'});
            } else {
                $image.css({'display': 'block'});
            }
        }
    };

    return {
        init: init,
        getFeaturedImageSize: getFeaturedImageSize
    };

}());;
/**
 * Feature Image Positioner
 *
 * @description
 */

var fastCo = fastCo || {};

fastCo.featureImagePositioner = (function() {

    var forceRedraw = function(element){

        if (!element) { return; }

        var n = document.createTextNode(' ');
        var disp = element.style.display;  // don't worry about previous display style

        element.appendChild(n);
        element.style.display = 'none';

        setTimeout(function(){
            element.style.display = disp;
            n.parentNode.removeChild(n);
        },20); // you can play with this timeout to make it as short as possible
    }


    var loaded = false,
        centering = 0,
        mover = 0,
        cutin;

    var image = {
        height: 0,
        width: 0,
        ratio: 0,
        offset: 0
    };

    var headingHeight = 0;

    var config = {
      minWidth: 1000,
      minHeight: 500,
          
      container: '#poster',
      figure: '#poster-image',
      content: '#zones-content',
      
      topCenter: true,
      contentCenter: true
    };

    var height = function() {
      return $(window).height();
    };
    
    var width = function() {
      return $(window).width();
    };

    var getCutin = function() {
      var content = config.content;
      return parseInt($(content).find('.main-content').css('margin-top'));
    };

    var getDimensions = function(figure) {
      var image = {};
      
      if ($(figure).length > 0) {
          featureImage = $('img', figure);
          image.height = featureImage.get(0).naturalHeight;
          image.width = featureImage.get(0).naturalWidth;
          image.ratio = image.height / image.width;
          image.offset = $(figure).offset().top;
      }
      return image;
    };

    var topCenter = function(center, w) {
        if (center >= (w * image.ratio) * .25) {
            center = (w * image.ratio) * .25;
        }
        
        $(config.figure).css({
            'margin-top'   :    -center // + image.offset
        });
        
        $('figcaption', config.figure).css({
            'top' :  ( center == 0 ? '' : -center )
        });                 
    };
    
    var contentCenter = function(center) {
        $(config.content).css({
            'margin-top'   :   ( center == 0 ? '' : -center )
        });
        
        $('.credit', config.figure).css({
            'bottom' :  ( center == 0 ? '' : center )
        });                
    };

    var repositionImage = function() {
        var container = config.figure;
        var figure = config.figure;
        var content = config.content;
                
        var minWidth = config.minWidth;
        var minHeight = config.minHeight;        
        
        var h = height();
        var w = ( width() > minWidth ? width() : minWidth );
        
        var ratio = image.ratio;
        var offset = image.offset;
        topAdjust = (w * ratio) - cutin + headingHeight;  //+ offset
        
        var isTakeover = $('body').hasClass('takeover');

        // Page has been indicated as a takeover page
        if (isTakeover && topAdjust > h - 200 ) {
            topAdjust = h - 350;
        }
        
        if ( h < topAdjust && h >= minHeight ) { // Image doesn't fit in view
            if (config.topCenter && config.bottomCenter) {
              var center = (topAdjust - h) * .55;
            } else {
              var center = (topAdjust - h);
            }

            if (center < 20 ) {
              center = 0; // compensate for sloppy size tracking
            }

            centering = 1;
        } else {
            centering = 0;
        }


        if (centering) {
/*             topAdjust = 1920 * ratio; */
          if (config.topCenter) {
              topCenter(center, w);
          }

          if (config.contentCenter) {
              contentCenter(center);
          }

          $('body').trigger("featureImagePositioned");
        }
    };

    /**
     * @return {undefined}
     */
    var init = function (options) {
        config = $.extend(config, options);
        cutin = getCutin();
        if ($('body').hasClass('listing-page')){
            headingHeight = $('.main-content').find('article').eq(0).find('header').height();
        } else if ($('body').hasClass('post-kind-slideshow')) {
            headingHeight = $('.main-content').find('article').eq(0).find('h1').outerHeight() + $('#thumbs_slider').outerHeight();
        } else {
            headingHeight = $('.main-content').find('article').eq(0).find('h1').outerHeight();
        }

        $(window).resize(function() {
            if (loaded) {
              repositionImage();
            }
        });

        amplify.subscribe('featureImageLoaded', function(){
            image = getDimensions(config.figure);
            loaded = true;
            repositionImage();

            // Force Chrome to do a Reflow
            forceRedraw(document.getElementById(config.content));
        });
    };

    return {
        init: init,
        getDimensions: getDimensions
    };

}());;
/**
 * Navigation hiding / showing
 *
 * @description
 */

var fastCo = fastCo || {};

fastCo.navigation = (function() {
    var navTop = 0,
        scrollTop = 0;

    var config = {
        container: '#internal-nav',
        hide: true
    };

    var navScroll = function(container) {
        $(window).scroll(function(){
            scrollTop = $(window).scrollTop();
            navTop = scrollTop-100-36;

            if ( navTop >= 0 ) {
                navTop = 0;
            }

            $(container).css({
                'top'   :   navTop
            });

        });
    };

    var navExpand = function(container) {
        var out;
        $('li.expand', container).hover(function(){
            var $this = $(this);
            var newsletterBody = $('.newsletter-body');

            // Remove any extant timeouts on hover
            if(out != null) {
                clearTimeout(out);
            };

            // Pullup newsletter dropdown if it's visible and another menu item is hovered
            if(!$this.hasClass('newsletter') && newsletterBody.hasClass('visible')) {
                newsletterBody.removeClass('visible');
            };

            $this.children('.expanded').addClass('visible');
        },function(){
            var $this = $(this);
            var expanded = $this.children('.expanded');
            var emailField = $('#edit-email');
            var newsletterBody = $('.newsletter-body', container);

            // If the newsletter dropdown's email field has information entered or is focused,
            // but has not been sent, delay pullup for one second
            if($this.hasClass('newsletter') && $('.newsletter-subscribe-response').html() == null && (emailField.val().length > 0 || newsletterBody.hasClass('focus'))) {
                out = setTimeout(function(){
                    expanded.removeClass('visible');
                }, 1000);
            } else {
                expanded.removeClass('visible');
            }
        });

        $('#google-cse-searchbox-form input.form-text', container).focus(function(){
            $('.search-box').addClass('hovered');
        });
        $('#google-cse-searchbox-form input.form-text', container).blur(function(){
            $('.search-box').removeClass('hovered');
        });

        $('.newsletter-body input', container).focus(function(){
            $('.newsletter .expanded', container).addClass('focus');
        });
        $('.newsletter-body input', container).blur(function(){
            $('.newsletter .expanded', container).removeClass('focus');
        });
    };

    var init = function(options) {
        config = $.extend({}, config, options);

        var container = config.container;
        // initalize scroll bindings
        //console.log(config.hide);
        if (config.hide) {
            navScroll(container);
        }
        // initialize expand bindings
        navExpand(container);

    };

    return {
        init: init
    };

}());
;
/**
 * I18n
 *
 */

var fastCo = fastCo || {};

fastCo.i18n = (function () {

    var config = {
        loc:'',
        subscribeLinkClass:".subscribe-link, .subscribe-thumb"
    };

    var changeSubscriptionLink = function (loc) {

        try {
            var subscribeLink = $(config.subscribeLinkClass);
            if (loc == "CA") {
                subscribeLink.attr("href", "https://magazine.fastcompany.com/loc/FST/Canada");
            } else if (loc != "US") {
                subscribeLink.attr("href", "https://magazine.fastcompany.com/loc/FST/international");
            } else {
                // a noop, we keep as is.
            }
        } catch (e) {
        }

    };

    var subscriptionLink = function () {

        // this looks to set the subscription link based on the geolocation of the user
        // we get the location of the user server side, via the x-geo header, and return it
        // via the geo.php url
        // this geo.php sets the cookie "loc" so that subsequent requests don't need to go back to the server.

        // get user loc from cookie, ajax to server if it doesn't exist
        config.loc = config.loc = config.loc || $.cookie('loc') || '';
        

        if (config.loc == '') {

            // it's empty, call to server to get it,
            $.get("/sites/all/libraries/fastco/geo.php", function (data) {
                changeSubscriptionLink(data);
    
            });
        } else {
            // we have it, process immediately
            changeSubscriptionLink(config.loc);

        }

    };


    var init = function (options) {
        config = $.extend({}, config, options);
        // internationalization starting point, add your i18n functions here.

        // change subscription links based on user cookie.
        subscriptionLink();

    };

    return {
        init:init
    };

}());;
/**
 * Quote
 *
 * @description To aid in the positioning of quotation marks
 */

var fastCo = fastCo || {};

fastCo.quote = (function(){
    var config = {};

    var wrapQuote = function(){
        $('.article.teaser h2 a').each(function(){

            var text = $(this).html();
            var firstChar = text.substr(0, 1);

            if(firstChar == '“') {
                $(this).html('<span class="quote-open">' + firstChar +  '</span>' + text.slice(1));
            }

        });
    };

    var init = function (options) {
        config = $.extend(config, options);

        wrapQuote();

        amplify.subscribe("dayLoaded", wrapQuote);
    };

    return {
        init: init
    };

}());;
var fastCo = fastCo || {};
fastCo.exclusiveEmail = fastCo.exclusiveEmail || {};

fastCo.exclusiveEmail = (function() {

    var defaults = {
        container: null,	// dom elem wrapping all the code for email exclusive subscription
        subscribe: null,	// dom elem pointing to the subscribe button
        email: null,		// dom elem pointing to the text field
        info: null,			// div to display messages
        containerRef: 'newsletter-subscribe-div',	// class name of the main div that contains the subscription div
        posterRef: 'exclusive_email_poster',		// class name of the poster image
        titleRef: 'exclusive-email-link',			// class name of the post title
        subscribeToRead: 'subscribe-to-read',		// class name of the "subscribe to read" text wrapper
        cookieName: 'sub',
        doRedirection: false,
        message: 'Please enter a valid email address.'
    },

    settings = {},

    init = function(options) {
        var self = this;

        // define the settings
        settings = $.extend({}, defaults, options);
	},

	// not intended for public consumption - just check if the email is well defined
	_isEmailValid = function(email) { 
	    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	    return re.test(email);
	},

	_subscribeCallbackSuccess = function(response) {
		var container = settings.container;

    	// create the exclusive email cookie and set the expiration time
	    $.cookie( settings.cookieName, 1, {
	    	path : '/',
	    	expires : 365 * 10 // 10 years from now
    	});

    	// The response.data is: <div class="newsletter-subscribe-response">Thank you, you have been successfully subscribed.</div>
    	// this is coming aligned to the right. let's replace the class if we are in the page mode where it needs to be aligned
    	// to the left
    	var html = response.data;
    	if ( _isExclusivePageMode() ){
    		html = $(html).attr('class', 'subscribe-response-page');

		    // display the thank you message
	    	container.css('display', 'none').after(html);
    	}

    	// unlock all the exclusive posts;
    	unlock();

    	// tie into message handler
    	if (fastCo.headerMessages) {
    		fastCo.headerMessages.set("An email to opt-in to "+(Drupal.settings.siteName ? Drupal.settings.siteName : " our")+" newsletters has been sent to your address. If you are already a subscriber, please enjoy the article below.")
    	}

    	// redirect to the post from the slate. in page mode don't do it
    	if(settings.doRedirection){
    		_redirect();
    	}
	},

	_subscribeCallbackError = function(response) {
		var btn = settings.subscribe;

		if(btn){
			btn.removeAttr('disabled');
		}

		// display the error message
		message(false, response.data);

    	// TODO: unlock the posts? post a error message?
	},

	_redirect = function() {
		var url = settings.subscribe.attr('data-link');

		if(url){
			window.location = url;
		}
	},

	_isExclusivePageMode = function() {
		// return if we are in page mode.
		return ( $('.exclusive_email_class_page').length>0 );
	},

	isSubscribed = function() {
		return ($.cookie( settings.cookieName ) == 1);
	},

	lock = function() {
		// check if we are in page mode. If so hide all the content except the first paragraph and 
		// render the subscription form
		if ( _isExclusivePageMode() ){
			// hide all the content and show the first paragraph
			$('.content.exclusive_email_class_page').children().hide();
			$('.content.exclusive_email_class_page p:eq(0)').show();

			// show the subscription form in the post.
			$('.'+settings.containerRef).removeClass('exclusive-hide');
		}
		// this is the slate mode.
		else{
			// do nothing by the moment. Maybe we will lock the slate posts
		}
	},

	unlock = function() {
		// unlock all the exclusive posts
		if ( isSubscribed() ) {

			// check if we are in page mode. If so hide all the content except the first paragraph and 
			// render the subscription form
			if ( _isExclusivePageMode() ){
				// show all post content under class="content exclusive_email_class_page"
				$('.content.exclusive_email_class_page').children().show();

				// hide the subscription form in the post.
				$('.'+settings.containerRef).addClass('exclusive-hide');

				// hide these elements
				$('.subscribe-to-read').remove();
			}
			// this is the slate mode.
			else{
				// wrap all the poster images with an a link
				$('.'+settings.posterRef).each(function(i) {
					var elem = $(this);
	    			elem.wrap('<a href="' + elem.attr('data-link') + '" title="' + elem.attr('data-title') + '"></a>');
				});

				// wrap all the title with an a link
				$('.'+settings.titleRef).each(function(i) {
					var elem = $(this);
	    			elem.wrap('<a href="' + elem.attr('data-link') +'"></a>');
				});

				// hide all the subscribe forms in the page
				$('.'+settings.containerRef).css('display', 'none');

				// show these dom objects: full story and social stats 
				$('.stats').removeClass('exclusive-hide');
				$('.readmore-link').removeClass('exclusive-hide');

				// hide these elements
				$('.subscribe-to-read').remove();
				/*
					.find('h2').remove().end()
					.find('.exclusive-subscribe-tooltip').remove();
				*/
			}
		}

	},

	message = function( success, message ) {
		// settings.message contains the only client error that could happen. This is when the user
		// enter an incorrect email (it means not well formed, I am not validating if the email exists).
		// this method is also used internally but it will always be called passing the success and
		// message parameters. For external uses it should be okay to pass the success parameter
		
		var info = settings.info;
		message = message || settings.message;

		if ( !success && info) {
			info.html(message);
		}
	},

	subscribe = function() {
        var container = settings.container;
        var email = settings.email.val();
        var btn = settings.subscribe;

        // validate the entered email
        if ( _isEmailValid(email) ) {
        	btn.attr('disabled', 'disabled');
            $.post('/ajax/newsletter', { email: email }, function(response) { _subscribeCallbackSuccess(response); }, 'json')
            	.error( function(response) { _subscribeCallbackError(response); } );

            return true;
        }

        return false;
	};

    return {
    	init: init,
    	subscribe: subscribe,
    	isSubscribed: isSubscribed,
    	unlock: unlock,
    	lock: lock,
    	message: message
    };

}());






;
/**
 *
 *  Message handler for headers of Co.Create, Co.Exist, Co.Design
 *
 */

var fastCo = fastCo || {};
fastCo.headerMessages = fastCo.headerMessages || {};

fastCo.headerMessages = (function() {

	var defaults = {
		site_name: 'Fast Company'
	},

	settings = {},

	container = $('#drupal-messages'),
	cookie_key = 'drupal_messages',
	cookie_plugin = false,

	init = function(options) {
	settings = $.extend({}, defaults, options);
	place();
	},

	// Get the messages from cookie
	get = function() {
		return (_testCookie() ? $.cookie(cookie_key) : false);
	},


	// Set the messages in a cookie
	set = function(message) {
		var origin_msg = get();
		if(!origin_msg) {
			// if cookie val is empty (first set on cookie)
			$.cookie(cookie_key, message, {
			path: '/',
			expires: 365 * 10
			});
		} else {
			// if cookie val already has string
			$.cookie(cookie_key, origin_msg + "|" + message, {
				path: '/',
				expires: 365 * 10
			});
		}

		return _testCookie();
	},


	// Unset cookie holding messages
	unset = function() {
		// kill cookie with expiration date
		$.cookie(cookie_key, "", {
			path: '/',
			expires: -(365 * 10)
		});
		return(!_testCookie());
	},


	// Append to DOM (container)
	place = function() {
		if(_testCookie()) {
			// get our messages from cookie and split into array
			var messages = (get()).split("|");
			for(i = 0; i < messages.length; i++) {
				// output each element into the drupal messages container
				container.append('<div>' + messages[i] + '</div>');
			}
			// unset the cookie after placing
			// it in the DOM
			unset();
		}
	},


	// Test the cookie is set
	_testCookie = function() {
		return Boolean($.cookie(cookie_key));
	};


	return {
		init: init,
		set: set
	};


}());;
Drupal.behaviors.coDesign = function(context) {

    var positionFixedSupported =  Drupal.behaviors.featureTest();

    // Initialize the infinite scroller
    if (typeof(Drupal.scroller) != 'undefined'){
        Drupal.scroller.init({container: '#zones-content'});

        // Bind to scoller day event.
        $(document).on( 'day.scroller', function(e, title, path, pageNum) {
            if ( typeof(tracking) != 'undefined' ) {
                tracking.omniture.pageView(false, pageNum);
            }
        });
    }

    $('.like-count a').click(function(e){
      return false;
    });

    $('#block-sidebar-archive').ajaxBlockSlide({limit:100});
    $('#block-blockqueue-contributors').ajaxBlockSlide({limit:2});
    $('#block-blockqueue-porsche_sidebar').ajaxBlockSlide({limit:9});

    // Initialize placeholder polyfill - jquery.placeholder.js
    $('input, textarea').placeholder();

    $.reject(); // Customized Browsers

//    // Check to see if CSS Fixed positioing is supported and drop a flag class on body
//    if (! positionFixedSupported){
//        $('body').addClass('features-no-position-fixed');
//    }

    //Initalize the Base Section Component that calculates current section
    if (typeof(fastCo.base) != 'undefined') {
      fastCo.base.section.init();
    }

    //Initalize the Base Section Component that calculates current section
    if (typeof(fastCo.headerMessages) != 'undefined') {
      fastCo.headerMessages.init();
    }

    // Initialize the Feature Image Sizer
    if (typeof(fastCo.featureImageSizer) != 'undefined' && $('#poster-image').length && !$('body').hasClass("post-kind-slideshow")) {
        fastCo.featureImageSizer.init();
    }

    // Initialize feature image positioner
    if (typeof(fastCo.featureImagePositioner)) {
      fastCo.featureImagePositioner.init();
    }

    // Initialize navigation
    if (positionFixedSupported){
        fastCo.navigation.init({
            hide: false
        });
    }

    // Initialize sidebar
    if (typeof(fastCo.sidebar) != 'undefined' && positionFixedSupported) {
      fastCo.sidebar.init();
    }

    // Initialize heading adjuster
    if (typeof(fastCo.headings) != 'undefined') {
      fastCo.headings.init();
    }

    // Initialize the lightbox
    if (typeof(fastCo.lightbox) != 'undefined') {
      fastCo.lightbox.init({padding:5});
    }

    // Initialize Internationalization
    if (typeof(fastCo.i18n) != 'undefined') {
      fastCo.i18n.init();
    }

    // Initialize Slider
    if (typeof(Drupal.slider) != 'undefined') {
        var sliderFirstLoad = true;

        var slides = ( typeof(Drupal.slider.slides) != 'undefined' ) ?
            Drupal.slider.slides :
            [];

        if (typeof(fastCo.carousel) != 'undefined') {
            var sliderSettings = ( typeof(Drupal.settings.slider) != 'undefined' ) ?
                Drupal.settings.slider :
                {};

            fastCo.slider.init(sliderSettings, slides);
        }

        // Initialize Carousel
        if (typeof(fastCo.carousel) != 'undefined') {
            var carouselSettings = ( typeof(Drupal.settings.carousel) != 'undefined' ) ?
                Drupal.settings.carousel :
                {};

            fastCo.carousel.init(carouselSettings, slides);
        }

        // Bind to slide event for tracking update.
        $(document).on( 'slide.slider', function() {
            if( !sliderFirstLoad ) {
                var slide = fastCo.slider.current();
                if( !slide.interstitial ) {
                    update_tracking();
                    tracking.omniture.pageView(null, slide.num-1);
                }
            }
            sliderFirstLoad = false;
        });
    }

    // Tracking search events
    if ( typeof(gcse) != 'undefined' ) {
        // Bind to search event.
        $(document).on( 'search.gcse', function(e, query) {
            tracking.omniture.search(query);
        });
    }


};

$(document).ready(function() {
    //FOR SLIDESHOW
    //===IMAGE CAPTIONS
    $('figcaption a.hide').click(function(){
        $(this).parents('figcaption').addClass('hidden');
        return false
    });

    $('figcaption a.show').click(function(){
        $(this).parents('figcaption').removeClass('hidden');
        return false
    });

    // FOR ADMIN, KILLS MESSAGES WHEN X IS CLICKED
    $('a.mesage_kill').click(function(){
        $(this).parent().hide();
    });

    // Dump the scroll position cookie whenever a user clicks on the archive to prevent the page from jumping
    $('.week .day').live('click', function(event){

        $.cookie("fastCo-offsetScrollPosition", null);

    });


    //FOR NEWSLETTER
    // register the click function for all newsletter subscribe buttons
    $(".exclusive-email-form").submit(function(e) {
        e.preventDefault();
        submitExclusiveForm($(this));
    }).find('input[type=button]').click(function(e) {
        e.preventDefault();
        submitExclusiveForm($(this));
    }).keypress(function(e) {
        if(e.keyCode == 13) {
            e.preventDefault();
            submitExclusiveForm($(this));
        }
    });

    var submitExclusiveForm = function($this) {
        // get the closest parent div and other needed DOM objects
        var container = $this.parents('div:first');
        var subscribe = container.find('.subscribe-to-newsletter');
        var email = container.find('.newsletter-subscribe-text');
        var info = container.find('.newsletter-subscribe-info');
        var doRedirection = ($('.exclusive_email_class_page').length == 0); // if we are not in page mode redirect to the post
        // try to subscribe
        fastCo.exclusiveEmail.init({
            container: container,
            subscribe: subscribe,
            email: email,
            info: info,
            doRedirection: doRedirection
        });
        fastCo.exclusiveEmail.message(fastCo.exclusiveEmail.subscribe());
    }

    // try to unlock. check if the exclusive email cookie is active and remove all the locks
    fastCo.exclusiveEmail.init();
    if (fastCo.exclusiveEmail.isSubscribed()){
        fastCo.exclusiveEmail.unlock();
    }
    else{
        fastCo.exclusiveEmail.lock();
    }

    // DRUPAL MESSAGES HANDLER
    $(window).bind('scroll.drupalMessages', function(){

        var $message = $('#drupal-messages'),
            $scrollDistance = $(this).scrollTop();

        // Check to see if we even have Drupal messages
        // If not then remove container and unbind scroll
        if ($message.find('div').length < 1) {
            $message.addClass('hidden').animate({
                'left': "-" + ($message.width() - 10) + "px"
            }, 300);
            $(this).unbind('scroll.drupalMessages');
        }

        // Chrome fires scroll event on window.load with a scroll distance of 0
        // Make sure the scroll is greater than a small value before performing
        // regular message container hiding.
        if ($scrollDistance < 100) { return; }

        if(!$message.hasClass("header-msg-hidden")) {
            $message.addClass("header-msg-hidden").animate({
                'left': "-" + ($message.width() - 10) + "px"
            }, 300);
            // unbind this function
            $(this).unbind('scroll.drupalMessages');
        }
    });
    
    if ($.fn.hoverIntent()) { /* use regular hover fallback when moving to plugin file */ }
    $('#drupal-messages').hoverIntent(function() {
        $(this).animate({
            'left': 0
        }, 300);
    }, function() {
        $(this).animate({
            'left': "-" + ($(this).width() - 10) + "px"
        }, 300);
    });

});
;
