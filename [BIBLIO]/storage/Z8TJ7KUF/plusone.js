var gapi=window.gapi=window.gapi||{};gapi._bs=new Date().getTime();(function(){var m=void 0,r=!0,s=null,t=!1,aa=encodeURIComponent,u=window,ba=Object,v=document,w=String,x=decodeURIComponent;function ca(a,b){return a.type=b}
var da="appendChild",z="push",A="test",ea="shift",fa="exec",ga="width",B="replace",ha="getElementById",ia="concat",ja="JSON",C="indexOf",ka="match",la="readyState",D="createElement",E="setAttribute",ma="getTime",na="getElementsByTagName",oa="substr",F="length",pa="prototype",G="split",I="location",K="style",qa="removeChild",ra="call",L="getAttribute",sa="charCodeAt",M="href",ta="substring",ua="action",N="apply",va="attributes",O="parentNode",wa="update",xa="height",P="join",ya="toLowerCase";var Q=u,S=v,za=Q[I],Aa=function(){},Ba=/\[native code\]/,T=function(a,b,c){return a[b]=a[b]||c},Ca=function(a){for(var b=0;b<this[F];b++)if(this[b]===a)return b;return-1},Da=function(a){a=a.sort();for(var b=[],c=m,d=0;d<a[F];d++){var e=a[d];e!=c&&b[z](e);c=e}return b},Ea=/&/g,Fa=/</g,Ga=/>/g,Ha=/"/g,Ia=/'/g,Ja=function(a){return w(a)[B](Ea,"&amp;")[B](Fa,"&lt;")[B](Ga,"&gt;")[B](Ha,"&quot;")[B](Ia,"&#39;")},U=function(){var a;if((a=ba.create)&&Ba[A](a))a=a(s);else{a={};for(var b in a)a[b]=m}return a},
V=function(a,b){return ba[pa].hasOwnProperty[ra](a,b)},Ka=function(a){if(Ba[A](ba.keys))return ba.keys(a);var b=[],c;for(c in a)V(a,c)&&b[z](c);return b},W=function(a,b){a=a||{};for(var c in a)V(a,c)&&(b[c]=a[c])},La=function(a){return function(){Q.setTimeout(a,0)}},Ma=function(a,b){if(!a)throw Error(b||"");},X=T(Q,"gapi",{});var Na=function(a,b,c){var d=RegExp("([#].*&|[#])"+b+"=([^&#]*)","g");b=RegExp("([?#].*&|[?#])"+b+"=([^&#]*)","g");if(a=a&&(d[fa](a)||b[fa](a)))try{c=x(a[2])}catch(e){}return c},Oa=/^([^?#]*)(\?([^#]*))?(\#(.*))?$/,Pa=function(a){a=a[ka](Oa);var b=U();b.q=a[1];b.c=a[3]?[a[3]]:[];b.i=a[5]?[a[5]]:[];return b},Qa=function(a){return a.q+(0<a.c[F]?"?"+a.c[P]("&"):"")+(0<a.i[F]?"#"+a.i[P]("&"):"")},Ra=function(a,b){var c=[];if(a)for(var d in a)if(V(a,d)&&a[d]!=s){var e=b?b(a[d]):a[d];c[z](aa(d)+"="+aa(e))}return c},
Sa=function(a,b,c,d){a=Pa(a);a.c[z][N](a.c,Ra(b,d));a.i[z][N](a.i,Ra(c,d));return Qa(a)},Ta=function(a,b){var c="";2E3<b[F]&&(c=b[ta](2E3),b=b[ta](0,2E3));var d=a[D]("div"),e=a[D]("a");e.href=b;d[da](e);d.innerHTML=d.innerHTML;b=w(d.firstChild[M]);d[O]&&d[O][qa](d);return b+c},Ua=/^https?:\/\/[^\/%\\?#\s]+\/[^\s]*$/i;var Va=function(a,b,c,d){if(Q[c+"EventListener"])Q[c+"EventListener"](a,b,t);else if(Q[d+"tachEvent"])Q[d+"tachEvent"]("on"+a,b)},Ya=function(a){var b=Wa;if("complete"!==S[la])try{b()}catch(c){}Xa(a)},Xa=function(a){if("complete"===S[la])a();else{var b=t,c=function(){if(!b)return b=r,a[N](this,arguments)};Q.addEventListener?(Q.addEventListener("load",c,t),Q.addEventListener("DOMContentLoaded",c,t)):Q.attachEvent&&(Q.attachEvent("onreadystatechange",function(){"complete"===S[la]&&c[N](this,arguments)}),
Q.attachEvent("onload",c))}},Za=function(a){for(;a.firstChild;)a[qa](a.firstChild)},$a={button:r,div:r,span:r};var Y;Y=T(Q,"___jsl",U());T(Y,"I",0);T(Y,"hel",10);var ab=function(a){return!Y.dpo?Na(a,"jsh",Y.h):Y.h},bb=function(a){var b=T(Y,"sws",[]);b[z][N](b,a)},cb=function(a){var b=T(Y,"PQ",[]);Y.PQ=[];var c=b[F];if(0===c)a();else for(var d=0,e=function(){++d===c&&a()},f=0;f<c;f++)b[f](e)},db=function(a){return T(T(Y,"H",U()),a,U())};var eb=T(Y,"perf",U()),fb=T(eb,"g",U()),gb=T(eb,"i",U());T(eb,"r",[]);U();U();var hb=function(a,b,c){var d=eb.r;"function"===typeof d?d(a,b,c):d[z]([a,b,c])},ib=function(a,b,c){fb[a]=!b&&fb[a]||c||(new Date)[ma]();hb(a)},kb=function(a,b,c){b&&0<b[F]&&(b=jb(b),c&&0<c[F]&&(b+="___"+jb(c)),28<b[F]&&(b=b[oa](0,28)+(b[F]-28)),c=b,b=T(gb,"_p",U()),T(b,c,U())[a]=(new Date)[ma](),hb(a,"_p",c))},jb=function(a){return a[P]("__")[B](/\./g,"_")[B](/\-/g,"_")[B](/\,/g,"_")};var lb=U(),mb=[],Z=function(a){throw Error("Bad hint"+(a?": "+a:""));};mb[z](["jsl",function(a){for(var b in a)if(V(a,b)){var c=a[b];"object"==typeof c?Y[b]=T(Y,b,[])[ia](c):T(Y,b,c)}if(b=a.u)a=T(Y,"us",[]),a[z](b),(b=/^https:(.*)$/[fa](b))&&a[z]("http:"+b[1])}]);var nb=/^(\/[a-zA-Z0-9_\-]+)+$/,ob=/^[a-zA-Z0-9\-_\.!]+$/,pb=/^gapi\.loaded_[0-9]+$/,qb=/^[a-zA-Z0-9,._-]+$/,ub=function(a,b,c,d){var e=a[G](";"),f=lb[e[ea]()],l=s;f&&(l=f(e,b,c,d));if(!(b=!l))b=l,c=b[ka](rb),d=b[ka](sb),b=!(d&&1===d[F]&&tb[A](b)&&c&&1===c[F]);b&&Z(a);return l},xb=function(a,b,c,d){a=vb(a);pb[A](c)||Z("invalid_callback");b=wb(b);d=d&&d[F]?wb(d):s;var e=function(a){return aa(a)[B](/%2C/g,",")};return[aa(a.t)[B](/%2C/g,",")[B](/%2F/g,"/"),"/k=",e(a.version),"/m=",e(b),d?"/exm="+e(d):
"","/rt=j/sv=1/d=1/ed=1",a.l?"/am="+e(a.l):"",a.n?"/rs="+e(a.n):"","/cb=",e(c)][P]("")},vb=function(a){"/"!==a.charAt(0)&&Z("relative path");for(var b=a[ta](1)[G]("/"),c=[];b[F];){a=b[ea]();if(!a[F]||0==a[C]("."))Z("empty/relative directory");else if(0<a[C]("=")){b.unshift(a);break}c[z](a)}a={};for(var d=0,e=b[F];d<e;++d){var f=b[d][G]("="),l=x(f[0]),h=x(f[1]);2!=f[F]||(!l||!h)||(a[l]=a[l]||h)}b="/"+c[P]("/");nb[A](b)||Z("invalid_prefix");c=yb(a,"k",r);d=yb(a,"am");a=yb(a,"rs");return{t:b,version:c,
l:d,n:a}},wb=function(a){for(var b=[],c=0,d=a[F];c<d;++c){var e=a[c][B](/\./g,"_")[B](/-/g,"_");qb[A](e)&&b[z](e)}return b[P](",")},yb=function(a,b,c){a=a[b];!a&&c&&Z("missing: "+b);if(a){if(ob[A](a))return a;Z("invalid: "+b)}return s},tb=/^https?:\/\/[a-z0-9_.-]+\.google\.com(:\d+)?\/[a-zA-Z0-9_.,!=\-\/]+$/,sb=/\/cb=/g,rb=/\/\//g,zb=function(){var a=ab(za[M]);if(!a)throw Error("Bad hint");return a};lb.m=function(a,b,c,d){(a=a[0])||Z("missing_hint");return"https://apis.google.com"+xb(a,b,c,d)};var Ab=decodeURI("%73cript"),Bb=function(a,b){for(var c=[],d=0;d<a[F];++d){var e=a[d];e&&0>Ca[ra](b,e)&&c[z](e)}return c},Db=function(a){"loading"!=S[la]?Cb(a):S.write("<"+Ab+' src="'+encodeURI(a)+'"></'+Ab+">")},Cb=function(a){var b=S[D](Ab);b[E]("src",a);b.async="true";(a=S[na](Ab)[0])?a[O].insertBefore(b,a):(S.head||S.body||S.documentElement)[da](b)},Eb=function(a,b){var c=b&&b._c;if(c)for(var d=0;d<mb[F];d++){var e=mb[d][0],f=mb[d][1];f&&V(c,e)&&f(c[e],a,b)}},Hb=function(a,b){Gb(function(){var c;
c=b===ab(za[M])?T(X,"_",U()):U();c=T(db(b),"_",c);a(c)})},Jb=function(a,b){var c=b||{};"function"==typeof b&&(c={},c.callback=b);Eb(a,c);var d=a?a[G](":"):[],e=c.h||zb(),f=T(Y,"ah",U());if(!f["::"]||!d[F])Ib(d||[],c,e);else{for(var l=[],h=s;h=d[ea]();){var n=h[G]("."),n=f[h]||f[n[1]&&"ns:"+n[0]||""]||e,g=l[F]&&l[l[F]-1]||s,k=g;if(!g||g.hint!=n)k={hint:n,o:[]},l[z](k);k.o[z](h)}var p=l[F];if(1<p){var y=c.callback;y&&(c.callback=function(){0==--p&&y()})}for(;d=l[ea]();)Ib(d.o,c,d.hint)}},Ib=function(a,
b,c){a=Da(a)||[];var d=b.callback,e=b.config,f=b.timeout,l=b.ontimeout,h=s,n=t;if(f&&!l||!f&&l)throw"Timeout requires both the timeout parameter and ontimeout parameter to be set";var g=T(db(c),"r",[]).sort(),k=T(db(c),"L",[]).sort(),p=[][ia](g),y=function(a,b){if(n)return 0;Q.clearTimeout(h);k[z][N](k,q);var d=((X||{}).config||{})[wa];d?d(e):e&&T(Y,"cu",[])[z](e);if(b){kb("me0",a,p);try{Hb(b,c)}finally{kb("me1",a,p)}}return 1};0<f&&(h=Q.setTimeout(function(){n=r;l()},f));var q=Bb(a,k);if(q[F]){var q=
Bb(a,g),H=T(Y,"CP",[]),J=H[F];H[J]=function(a){if(!a)return 0;kb("ml1",q,p);var b=function(b){H[J]=s;y(q,a)&&cb(function(){d&&d();b()})},c=function(){var a=H[J+1];a&&a()};0<J&&H[J-1]?H[J]=function(){b(c)}:b(c)};if(q[F]){var R="loaded_"+Y.I++;X[R]=function(a){H[J](a);X[R]=s};a=ub(c,q,"gapi."+R,g);g[z][N](g,q);kb("ml0",q,p);b.sync||Q.___gapisync?Db(a):Cb(a)}else H[J](Aa)}else y(q)&&d&&d()};var Gb=function(a){if(Y.hee&&0<Y.hel)try{return a()}catch(b){Y.hel--,Jb("debug_error",function(){u.___jsl.hefn(b)})}else return a()};X.load=function(a,b){return Gb(function(){return Jb(a,b)})};var Kb=function(a){var b=u.___jsl=u.___jsl||{};b[a]=b[a]||[];return b[a]},Lb=function(a){var b=u.___jsl=u.___jsl||{};b.cfg=!a&&b.cfg||{};return b.cfg},Mb=function(a){return"object"===typeof a&&/\[native code\]/[A](a[z])},Nb=function(a,b){if(b)for(var c in b)b.hasOwnProperty(c)&&(a[c]&&b[c]&&"object"===typeof a[c]&&"object"===typeof b[c]&&!Mb(a[c])&&!Mb(b[c])?Nb(a[c],b[c]):b[c]&&"object"===typeof b[c]?(a[c]=Mb(b[c])?[]:{},Nb(a[c],b[c])):a[c]=b[c])},Ob=function(a){if(a&&!/^\s+$/[A](a)){for(;0==a[sa](a[F]-
1);)a=a[ta](0,a[F]-1);var b;try{b=u[ja].parse(a)}catch(c){}if("object"===typeof b)return b;try{b=(new Function("return ("+a+"\n)"))()}catch(d){}if("object"===typeof b)return b;try{b=(new Function("return ({"+a+"\n})"))()}catch(e){}return"object"===typeof b?b:{}}},$=function(a){if(!a)return Lb();a=a[G]("/");for(var b=Lb(),c=0,d=a[F];b&&"object"===typeof b&&c<d;++c)b=b[a[c]];return c===a[F]&&b!==m?b:m},Pb=function(){Lb(r);var a=u.___gcfg,b=Kb("cu");if(a&&a!==u.___gu){var c={};Nb(c,a);b[z](c);u.___gu=
a}var a=Kb("cu"),d=v.scripts||v[na]("script")||[],c=[],e=[];e[z][N](e,Kb("us"));for(var f=0;f<d[F];++f)for(var l=d[f],h=0;h<e[F];++h)l.src&&0==l.src[C](e[h])&&c[z](l);0==c[F]&&(0<d[F]&&d[d[F]-1].src)&&c[z](d[d[F]-1]);for(d=0;d<c[F];++d)c[d][L]("gapi_processed")||(c[d][E]("gapi_processed",r),(e=c[d])?(f=e.nodeType,e=3==f||4==f?e.nodeValue:e.textContent||e.innerText||e.innerHTML||""):e=m,(e=Ob(e))&&a[z](e));d=Kb("cd");a=0;for(c=d[F];a<c;++a)Nb(Lb(),d[a]);d=Kb("ci");a=0;for(c=d[F];a<c;++a)Nb(Lb(),d[a]);
a=0;for(c=b[F];a<c;++a)Nb(Lb(),b[a])};var Qb=function(){var a=u.__GOOGLEAPIS;a&&(a.googleapis&&!a["googleapis.config"]&&(a["googleapis.config"]=a.googleapis),T(Y,"ci",[])[z](a),u.__GOOGLEAPIS=m)};var Rb=u.console,Sb=function(a){Rb&&Rb.log&&Rb.log(a)};var Tb=T(Y,"rw",U()),Ub=function(a,b){var c=Tb[a];c&&c.state<b&&(c.state=b)};var Vb=function(a){var b;a[ka](/^https?%3A/i)&&(b=x(a));return Ta(v,b?b:a)},Wb=function(a){a=a||"canonical";for(var b=v[na]("link"),c=0,d=b[F];c<d;c++){var e=b[c],f=e[L]("rel");if(f&&f[ya]()==a&&(e=e[L]("href")))if((e=Vb(e))&&e[ka](/^https?:\/\/[\w\-\_\.]+/i)!=s)return e}return u[I][M]};var Xb;var Yb=function(){};var Zb=function(){this.b=[];this.j=[];this.p=[];this.g=[];this.g[0]=128;for(var a=1;64>a;++a)this.g[a]=0;this.reset()};(function(){function a(){}a.prototype=Yb[pa];Zb.v=Yb[pa];Zb.prototype=new a})();Zb[pa].reset=function(){this.b[0]=1732584193;this.b[1]=4023233417;this.b[2]=2562383102;this.b[3]=271733878;this.b[4]=3285377520;this.k=this.d=0};
var $b=function(a,b,c){c||(c=0);var d=a.p;if("string"==typeof b)for(var e=0;16>e;e++)d[e]=b[sa](c)<<24|b[sa](c+1)<<16|b[sa](c+2)<<8|b[sa](c+3),c+=4;else for(e=0;16>e;e++)d[e]=b[c]<<24|b[c+1]<<16|b[c+2]<<8|b[c+3],c+=4;for(e=16;80>e;e++){var f=d[e-3]^d[e-8]^d[e-14]^d[e-16];d[e]=(f<<1|f>>>31)&4294967295}b=a.b[0];c=a.b[1];for(var l=a.b[2],h=a.b[3],n=a.b[4],g,e=0;80>e;e++)40>e?20>e?(f=h^c&(l^h),g=1518500249):(f=c^l^h,g=1859775393):60>e?(f=c&l|h&(c|l),g=2400959708):(f=c^l^h,g=3395469782),f=(b<<5|b>>>27)+
f+n+g+d[e]&4294967295,n=h,h=l,l=(c<<30|c>>>2)&4294967295,c=b,b=f;a.b[0]=a.b[0]+b&4294967295;a.b[1]=a.b[1]+c&4294967295;a.b[2]=a.b[2]+l&4294967295;a.b[3]=a.b[3]+h&4294967295;a.b[4]=a.b[4]+n&4294967295};Zb[pa].update=function(a,b){b===m&&(b=a[F]);for(var c=b-64,d=0,e=this.j,f=this.d;d<b;){if(0==f)for(;d<=c;)$b(this,a,d),d+=64;if("string"==typeof a)for(;d<b;){if(e[f]=a[sa](d),++f,++d,64==f){$b(this,e);f=0;break}}else for(;d<b;)if(e[f]=a[d],++f,++d,64==f){$b(this,e);f=0;break}}this.d=f;this.k+=b};var gc=function(){var a;ac?(a=new Q.Uint32Array(1),bc.getRandomValues(a),a=Number("0."+a[0])):(a=cc,a+=parseInt(dc[oa](0,20),16),dc=ec(dc),a/=fc+Math.pow(16,20));return a},bc=Q.crypto,ac=t,hc=0,ic=0,cc=1,fc=0,dc="",jc=function(a){a=a||Q.event;var b=a.screenX+a.clientX<<16,b=b+(a.screenY+a.clientY),b=b*((new Date)[ma]()%1E6);cc=cc*b%fc;0<hc&&++ic==hc&&Va("mousemove",jc,"remove","de")},ec=function(a){var b=new Zb;b[wa](a);a=[];var c=8*b.k;56>b.d?b[wa](b.g,56-b.d):b[wa](b.g,64-(b.d-56));for(var d=63;56<=
d;d--)b.j[d]=c&255,c/=256;$b(b,b.j);for(d=c=0;5>d;d++)for(var e=24;0<=e;e-=8)a[c]=b.b[d]>>e&255,++c;b="";for(d=0;d<a[F];d++)b+="0123456789ABCDEF".charAt(Math.floor(a[d]/16))+"0123456789ABCDEF".charAt(a[d]%16);return b},ac=!!bc&&"function"==typeof bc.getRandomValues;ac||(fc=1E6*(screen[ga]*screen[ga]+screen[xa]),dc=ec(S.cookie+"|"+S[I]+"|"+(new Date)[ma]()+"|"+Math.random()),hc=$("random/maxObserveMousemove")||0,0!=hc&&Va("mousemove",jc,"add","at"));var kc=function(){var a=Y.onl;if(!a){a=U();Y.onl=a;var b=U();a.e=function(a){var d=b[a];d&&(delete b[a],d())};a.a=function(a,d){b[a]=d};a.r=function(a){delete b[a]}}return a},lc=function(a,b){var c=b.onload;return"function"===typeof c?(kc().a(a,c),c):s},mc=function(a){Ma(/^\w+$/[A](a),"Unsupported id - "+a);kc();return'onload="window.___jsl.onl.e(&#34;'+a+'&#34;)"'},nc=function(a){kc().r(a)};var oc={allowtransparency:"true",frameborder:"0",hspace:"0",marginheight:"0",marginwidth:"0",scrolling:"no",style:"",tabindex:"0",vspace:"0",width:"100%"},pc={allowtransparency:r,onload:r},qc=0,rc=function(a){Ma(!a||Ua[A](a),"Illegal url for new iframe - "+a)},sc=function(a,b,c,d,e){rc(c.src);var f,l=lc(d,c),h=l?mc(d):"";try{f=a[D]('<iframe frameborder="'+Ja(w(c.frameborder))+'" scrolling="'+Ja(w(c.scrolling))+'" '+h+' name="'+Ja(w(c.name))+'"/>')}catch(n){f=a[D]("iframe"),l&&(f.onload=function(){f.onload=
s;l[ra](this)},nc(d))}for(var g in c)a=c[g],"style"===g&&"object"===typeof a?W(a,f[K]):pc[g]||f[E](g,w(a));g=e&&e.beforeNode||s;!g&&(!e||!e.dontclear)&&Za(b);b.insertBefore(f,g);f=g?g.previousSibling:b.lastChild;c.allowtransparency&&(f.allowTransparency=r);return f};var tc=/^:[\w]+$/,uc=/:([a-zA-Z_]+):/g,vc=function(){var a=$("googleapis.config/sessionIndex");a==s&&(a=u.__X_GOOG_AUTHUSER);if(a==s){var b=u.google;b&&(a=b.authuser)}a==s&&(a=m,a==s&&(a=u[I][M]),a=a?Na(a,"authuser")||s:s);return a==s?s:w(a)},wc=function(a,b){if(!Xb){var c=$("iframes/:socialhost:"),d=vc()||"0",e=vc();Xb={socialhost:c,session_index:d,session_prefix:e!==m&&e!==s&&""!==e?"u/"+e+"/":"",im_prefix:$("googleapis.config/signedIn")===t?"_/im/":""}}return Xb[b]||""};var xc={style:"position:absolute;top:-10000px;width:450px;margin:0px;borderStyle:none"},yc="onPlusOne _ready _close,_open _resizeMe _renderstart oncircled".split(" "),zc=T(Y,"WI",U()),Ac=["style","data-gapiscan"],Bc=function(a){var b=m;"number"===typeof a?b=a:"string"===typeof a&&(b=parseInt(a,10));return b},Cc=function(){};var Dc,Ec,Fc,Gc,Hc,Ic=/(?:^|\s)g-((\S)*)(?:$|\s)/;Dc=T(Y,"SW",U());Ec=T(Y,"SA",U());Fc=T(Y,"SM",U());Gc=T(Y,"FW",[]);Hc=s;
var Kc=function(a,b){Jc(m,t,a,b)},Jc=function(a,b,c,d){ib("ps0",r);c=("string"===typeof c?v[ha](c):c)||S;var e;e=S.documentMode;if(c.querySelectorAll&&(!e||8<e)){e=d?[d]:Ka(Dc)[ia](Ka(Ec))[ia](Ka(Fc));for(var f=[],l=0;l<e[F];l++){var h=e[l];f[z](".g-"+h,"g\\:"+h)}e=c.querySelectorAll(f[P](","))}else e=c[na]("*");c=U();for(f=0;f<e[F];f++){l=e[f];var n=l,h=d,g=n.nodeName[ya](),k=m;n[L]("data-gapiscan")?h=s:(0==g[C]("g:")?k=g[oa](2):(n=(n=w(n.className||n[L]("class")))&&Ic[fa](n))&&(k=n[1]),h=k&&(Dc[k]||
Ec[k]||Fc[k])&&(!h||k===h)?k:s);h&&(l[E]("data-gapiscan",r),T(c,h,[])[z](l))}if(b)for(var p in c){b=c[p];for(d=0;d<b[F];d++)b[d][E]("data-onload",r)}for(var y in c)Gc[z](y);ib("ps1",r);if((p=Gc[P](":"))||a)try{X.load(p,a)}catch(q){Sb(q);return}if(Lc(Hc||{}))for(var H in c){a=c[H];y=0;for(b=a[F];y<b;y++)a[y].removeAttribute("data-gapiscan");Mc(H)}else{d=[];for(H in c){a=c[H];y=0;for(b=a[F];y<b;y++){l=a[y];e=H;h=f=l;l=U();k=0!=h.nodeName[ya]()[C]("g:");n=0;for(g=h[va][F];n<g;n++){var J=h[va][n],R=J.name,
Fb=J.value;0<=Ca[ra](Ac,R)||(k&&0!=R[C]("data-")||"null"===Fb||"specified"in J&&!J.specified)||(k&&(R=R[oa](5)),l[R[ya]()]=Fb)}k=l;h=h[K];(n=Bc(h&&h[xa]))&&(k.height=w(n));(h=Bc(h&&h[ga]))&&(k.width=w(h));Nc(e,f,l,d,b)}}Oc(p,d)}},Pc=function(a){var b=T(X,a,{});b.go||(b.go=function(b){return Kc(b,a)},b.render=function(b,d){var e=d||{};ca(e,a);var f=e.type;delete e.type;var l=("string"===typeof b?v[ha](b):b)||m;if(l){var h={},n;for(n in e)V(e,n)&&(h[n[ya]()]=e[n]);h.rd=1;e=[];Nc(f,l,h,e,0);Oc(f,e)}else Sb("string"===
"gapi."+f+".render: missing element "+typeof b?b:"")})},Qc=function(a){Dc[a]=r},Rc=function(a){Ec[a]=r},Sc=function(a){Fc[a]=r};var Mc=function(a,b){var c=T(Y,"watt",U())[a];b&&c?(c(b),(c=b.iframeNode)&&c[E]("data-gapiattached",r)):X.load(a,function(){var c=T(Y,"watt",U())[a],e=b&&b.iframeNode;!e||!c?(0,X[a].go)(e&&e[O]):(c(b),e[E]("data-gapiattached",r))})},Lc=function(){return t},Oc=function(){},Nc=function(a,b,c,d,e){switch(Tc(b,a)){case 0:a=Fc[a]?a+"_annotation":a;d={};d.iframeNode=b;d.userParams=c;Mc(a,d);break;case 1:var f;if(b[O]){var l=r;c.dontclear&&(l=t);delete c.dontclear;var h,n,g;n=g=a;"plus"==a&&c[ua]&&(g=a+
"_"+c[ua],n=a+"/"+c[ua]);(g=$("iframes/"+g+"/url"))||(g=":socialhost:/_/widget/render/"+n);n=Ta(S,g[B](uc,wc));g={};W(c,g);g.hl=$("lang")||$("gwidget/lang")||"en-US";g.origin=u[I].origin||u[I].protocol+"//"+u[I].host;g.exp=$("iframes/"+a+"/params/exp");var k=$("iframes/"+a+"/params/location");if(k)for(var p=0;p<k[F];p++){var y=k[p];g[y]=Q[I][y]}switch(a){case "plus":case "follow":k=g[M];p=c[ua]?m:"publisher";k=(k="string"==typeof k?k:m)?Vb(k):Wb(p);g.url=k;delete g[M];break;case "plusone":case "recobox":g.url=
c[M]?Vb(c[M]):Wb();k=c.db;p=$();k==s&&p&&(k=p.db,k==s&&(k=p.gwidget&&p.gwidget.db));g.db=k||m;k=c.ecp;p=$();k==s&&p&&(k=p.ecp,k==s&&(k=p.gwidget&&p.gwidget.ecp));g.ecp=k||m;delete g[M];break;case "signin":g.url=Wb()}Y.ILI&&(g.iloader="1");delete g["data-onload"];delete g.rd;g.gsrc=$("iframes/:source:");k=$("inline/css");"undefined"!==typeof k&&(0<e&&k>=e)&&(g.ic="1");k=/^#|^fr-/;e={};for(h in g)V(g,h)&&k[A](h)&&(e[h[B](k,"")]=g[h],delete g[h]);h=[][ia](yc);(k=$("iframes/"+a+"/methods"))&&("object"===
typeof k&&Ba[A](k[z]))&&(h=h[ia](k));for(var q in c)if(V(c,q)&&/^on/[A](q)&&("plus"!=a||"onconnect"!=q))h[z](q),delete g[q];delete g.callback;e._methods=h[P](",");h=Sa(n,g,e);q={allowPost:1,attributes:xc};q.dontclear=!l;l={};l.userParams=c;l.url=h;ca(l,a);c.rd?g=b:(g=v[D]("div"),b[E]("data-gapistub",r),g[K].cssText="position:absolute;width:450px;left:-10000px;",b[O].insertBefore(g,b));l.siteElement=g;g.id||(b=g,T(zc,a,0),n="___"+a+"_"+zc[a]++,b.id=n);b=U();b[">type"]=a;W(c,b);n=h;c=g;h=q||{};b=h[va]||
{};Ma(!h.allowPost||!b.onload,"onload is not supported by post iframe");q=b=n;tc[A](b)&&(q=$("iframes/"+q[ta](1)+"/url"),Ma(!!q,"Unknown iframe url config for - "+b));n=Ta(S,q[B](uc,wc));b=c.ownerDocument||S;g=0;do q=h.id||["I",qc++,"_",(new Date)[ma]()][P]("");while(b[ha](q)&&5>++g);Ma(5>g,"Error creating iframe id");g={};e={};W(h.queryParams||{},g);W(h.fragmentParams||{},e);k=U();k.id=q;k.parent=b[I].protocol+"//"+b[I].host;p=Na(b[I][M],"id","");y=Na(b[I][M],"pfname","");(p=p?y+"/"+p:"")&&(k.pfname=
p);W(k,e);(k=Na(n,"rpctoken")||g.rpctoken||e.rpctoken)||(k=e.rpctoken=h.rpctoken||w(Math.round(1E8*gc())));h.rpctoken=k;p=b[I][M];k=U();(y=Na(p,"_bsh",Y.bsh))&&(k._bsh=y);(p=ab(p))&&(k.jsh=p);h.hintInFragment?W(k,e):W(k,g);n=Sa(n,g,e,h.paramsSerializer);e=U();W(oc,e);W(h[va],e);e.name=e.id=q;e.src=n;if((h||{}).allowPost&&2E3<n[F]){g=Pa(n);e.src="";e["data-postorigin"]=n;n=sc(b,c,e,q);-1!=navigator.userAgent[C]("WebKit")&&(f=n.contentWindow.document,f.open(),e=f[D]("div"),k={},p=q+"_inner",k.name=
p,k.src="",k.style="display:none",sc(b,e,k,p,h));e=(h=g.c[0])?h[G]("&"):[];h=[];for(k=0;k<e[F];k++)p=e[k][G]("=",2),h[z]([x(p[0]),x(p[1])]);g.c=[];e=Qa(g);g=b[D]("form");g.action=e;g.method="POST";g.target=q;g[K].display="none";for(q=0;q<h[F];q++)e=b[D]("input"),ca(e,"hidden"),e.name=h[q][0],e.value=h[q][1],g[da](e);c[da](g);g.submit();g[O][qa](g);f&&f.close();f=n}else f=sc(b,c,e,q,h);l.iframeNode=f;l.id=f[L]("id");f=l.id;c=U();c.id=f;c.userParams=l.userParams;c.url=l.url;ca(c,l.type);c.state=1;Tb[f]=
c;f=l}else f=s;f&&((l=f.id)&&d[z](l),Mc(a,f))}},Tc=function(a,b){if(a&&1===a.nodeType&&b)if(Fc[b]){if($a[a.nodeName[ya]()]){var c=a.innerHTML;return c&&c[B](/^[\s\xa0]+|[\s\xa0]+$/g,"")?0:1}}else{if(Ec[b])return 0;if(Dc[b])return 1}return s};T(X,"platform",{}).go=Kc;var Lc=function(a){for(var b=["_c","jsl","h"],c=0;c<b[F]&&a;c++)a=a[b[c]];b=ab(za[M]);return!a||0!=a[C]("n;")&&0!=b[C]("n;")&&a!==b},Oc=function(a,b){Uc(a,b)},Wa=function(a){Jc(a,r)},Vc=function(a,b){for(var c=b||[],d=0;d<c[F];++d)a(c[d]);for(d=0;d<c[F];d++)Pc(c[d])};mb[z](["platform",function(a,b,c){Hc=c;b&&Gc[z](b);Vc(Qc,a);Vc(Rc,c._c.annotation);Vc(Sc,c._c.bimodal);Qb();Pb();if("explicit"!=$("parsetags")){bb(a);var d;if(c&&(a=c.callback))d=La(a),delete c.callback;Ya(function(){Wa(d)})}}]);var Wc=function(a){a=(a=Tb[a])?a.oid:m;if(a){var b=S[ha](a);b&&b[O][qa](b);delete Tb[a];Wc(a)}},Cc=function(a,b,c){if(c[ga]&&c[xa]){a:{c=c||{};var d=Y.ssfn;if(d&&d(m)){if("number"===typeof Y.ucs)break a;var e=b.id;if(e){d=(d=Tb[e])?d.state:m;if(1===d||4===d)break a;Wc(e)}}if((d=a.nextSibling)&&d[L]&&d[L]("data-gapistub"))a[O][qa](d),a[K].cssText="";d=c[ga];c=c[xa];var f=a[K];f.textIndent="0";f.margin="0";f.padding="0";f.background="transparent";f.borderStyle="none";f.cssFloat="none";f.styleFloat=
"none";f.lineHeight="normal";f.fontSize="1px";f.verticalAlign="baseline";a=a[K];a.display="inline-block";f=b[K];f.position="static";f.left=0;f.top=0;f.visibility="visible";d&&(a.width=f.width=d+"px");c&&(a.height=f.height=c+"px");e&&Ub(e,3)}b["data-csi-wdt"]=(new Date)[ma]()}};var Xc=/^\{h\:'/,Yc=/^!_/,Uc=function(a,b){function c(){Va("message",d,"remove","de")}function d(d){var l=d.data,h=d.origin;if(Zc(l,b)){var n=e;e=t;n&&ib("rqe");$c(a,function(){n&&ib("rqd");c();for(var a=T(Y,"RPMQ",[]),b=0;b<a[F];b++)a[b]({data:l,origin:h})})}}if(!(0===b[F]||!u[ja]||!u[ja].parse)){var e=r;Va("message",d,"add","at");Jb(a,c)}},Zc=function(a,b){a=w(a);if(Xc[A](a))return r;a=a[B](Yc,"");if(!/^\{/[A](a))return t;try{var c=u[ja].parse(a)}catch(d){return t}if(!c)return t;var e=c.f;if(c.s&&
e&&-1!=Ca[ra](b,e)){if("_renderstart"===c.s){var c=c.a&&c.a[1],f=S[ha](e);Ub(e,2);(e=Tb[e])&&(e.args=c);c&&f&&Cc(f[O],f,c)}return r}return t},$c=function(a,b){Jb(a,b)};ib("bs0",r,u.gapi._bs);ib("bs1",r);delete u.gapi._bs;})();
gapi.load("plusone",{callback:window["gapi_onload"],_c:{"jsl":{"ci":{"services":{},"deviceType":"desktop","lexps":[102,103,100,71,98,96,79,106,45,17,86,81,61,30],"inline":{"css":1},"report":{},"oauth-flow":{"authUrl":"https://accounts.google.com/o/oauth2/auth","proxyUrl":"https://accounts.google.com/o/oauth2/postmessageRelay","persist":true},"isLoggedIn":true,"isPlusUser":true,"iframes":{"additnow":{"methods":["launchurl"],"url":"https://apis.google.com/additnow/additnow.html?bsv"},"shortlists":{"url":"?bsv"},"plus":{"methods":["onauth"],"url":":socialhost:/u/:session_index:/_/pages/badge?bsv"},":socialhost:":"https://plusone.google.com","recobox":{"params":{"url":""},"url":":socialhost:/:session_prefix:_/widget/render/recobox?bsv"},"plus_followers":{"params":{"url":""},"url":":socialhost:/_/im/_/widget/render/plus/followers?bsv"},"autocomplete":{"params":{"url":""},"url":":socialhost:/:session_prefix:_/widget/render/autocomplete?bsv"},"plus_share":{"params":{"url":""},"url":":socialhost:/:session_prefix:_/+1/sharebutton?plusShare\u003dtrue\u0026bsv"},"savetowallet":{"url":"https://clients5.google.com/s2w/o/savetowallet?bsv"},"panoembed":{"url":"https://ssl.gstatic.com/pano/embed/?bsv"},"signin":{"methods":["onauth"],"params":{"url":""},"url":":socialhost:/:session_prefix:_/widget/render/signin?bsv"},"appcirclepicker":{"url":":socialhost:/:session_prefix:_/widget/render/appcirclepicker?bsv"},"hangout":{"url":"https://talkgadget.google.com/:session_prefix:talkgadget/_/widget?bsv"},"plus_circle":{"params":{"url":""},"url":":socialhost:/:session_prefix:_/widget/plus/circle?bsv"},"savetodrive":{"methods":["save"],"url":"https://drive.google.com/savetodrivebutton?bsv"},"card":{"url":":socialhost:/:session_prefix:_/hovercard/card?bsv"},"evwidget":{"params":{"url":""},"url":":socialhost:/:session_prefix:_/events/widget?bsv"},":signuphost:":"https://plus.google.com","plusone":{"preloadUrl":["https://ssl.gstatic.com/s2/oz/images/stars/po/Publisher/sprite4-a67f741843ffc4220554c34bd01bb0bb.png"],"params":{"count":"","size":"","url":""},"url":":socialhost:/:session_prefix:_/+1/fastbutton?bsv"}},"debug":{"host":"https://plusone.google.com","reportExceptionRate":0.05,"rethrowException":true},"csi":{"rate":0.01},"googleapis.config":{"mobilesignupurl":"https://m.google.com/app/plus/oob?"}},"h":"m;/_/scs/apps-static/_/js/k\u003doz.gapi.en.CqNG-rHlV_Y.O/m\u003d__features__/am\u003dQQ/rt\u003dj/d\u003d1/rs\u003dAItRSTPbm59ToxQmNYFYDQ9kkwqhmvcGVA","u":"https://apis.google.com/js/plusone.js","hee":true,"fp":"440ea58dd3bbdc6592a855ac7662fe3b5788dbef","dpo":false},"platform":["additnow","identity","panoembed","plus","plusone","recobox","savetodrive","shortlists","savetowallet","notifications","hangout","follow"],"fp":"440ea58dd3bbdc6592a855ac7662fe3b5788dbef","annotation":["autocomplete","profile","interactivepost"],"bimodal":["signin"]}});