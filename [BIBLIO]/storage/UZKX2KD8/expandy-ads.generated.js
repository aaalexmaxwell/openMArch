// Combined with SharedResources v2
var PushDownAd = {};

PushDownAd.minHeight = '90px';

PushDownAd.adServerBaseUrl = null;

PushDownAd.init = function (strAdServerBaseUrl) {
    PushDownAd.adServerBaseUrl = strAdServerBaseUrl;
};

PushDownAd.getAdUrl = function (strPartialUrl) {
    if (!/^[a-z]+:\/\//i.test(strPartialUrl)) {
        if (strPartialUrl.indexOf("/") != 0) {
            strPartialUrl = "/" + strPartialUrl;
        }
        strPartialUrl = PushDownAd.adServerBaseUrl + strPartialUrl;
    }
    return strPartialUrl;
};

PushDownAd.writeImageWithExpansion = function (strImageSrc, strAdSrc, intHeight) {
    var pushDownDiv = $('.pushDownAd > div');
    if (!pushDownDiv.length) {
        pushDownDiv = $('.pushDownAd');
        if (!pushDownDiv.length) {
            return;
        }
    }
    var closeButtonHtml = '<span style="background-color:#fff;cursor:pointer;display:inline-block;filter:alpha(opacity=60);font-family:sans-serif;font-size:20px;font-weight:bold;height:20px;line-height:20px;-moz-opacity:0.60;opacity:0.6;position:absolute;right:10px;text-align:center;top:10px;width:20px;z-index:100;" class="closeButton" title="Close ad" alt="Close ad">X</span>';
    var $closeButtonElement = null;
    var imgElement = $('<img src="' + strImageSrc + '" alt="Advertisement" style="cursor:pointer" />');
    var strAdSrcFull = PushDownAd.getAdUrl(strAdSrc);
    pushDownDiv.append(imgElement);
    var iframeHtml = '<iframe frameborder="0" style="width:100%;height:' + intHeight + 'px;border:none;padding:none;overflow:hidden;display:none" src="/_marketResources/StandaloneContent/iframe-ad-housing.html?adsrc=' + strAdSrcFull + '" />';
    var $iframeElement = null;
    imgElement.click(function () {
        $iframeElement = $(iframeHtml);
        $iframeElement.one('load', function () {
            imgElement.hide();
            $iframeElement.css('height', PushDownAd.minHeight).show().animate({ 'height': intHeight + 'px' }, function () {
                $closeButtonElement = $(closeButtonHtml);
                pushDownDiv.append($closeButtonElement);
                $closeButtonElement.one('click', function () {
                    $closeButtonElement.remove();
                    $iframeElement.animate({ 'height': PushDownAd.minHeight }, function () {
                        $iframeElement.remove();
                        imgElement.show();
                    });
                });
            });
        });
        pushDownDiv.append($iframeElement);
    });
};;
/* -----------------------------*/

