/*
 * cn-advert.js - relies on jQuery 1.2+
 */
var CnAdvert = {};
CnAdvert.defaultSelector = ".cnAd";
CnAdvert.init = function() {
    
};

/*
 * Place after all advert controls in the page, or call from document.ready
 */
CnAdvert.hideEmptyAds = function (strAdSelector, blnHideContainer, strIgnoreAdSelector) {
    if (typeof (blnHideContainer) == "undefined") {
        blnHideContainer = true;
    }

    if (typeof (strAdSelector) == "undefined") {
        strAdSelector = CnAdvert.defaultSelector;
    }
    var ads = $(strAdSelector);

    var ignoredAds = (typeof (strIgnoreAdSelector) == "undefined") ? [] : $(strIgnoreAdSelector);
    ads.each(function () {
        var objAd = $(this);
        // If we're not ignoring the ad...
        if ($.inArray(objAd, ignoredAds) == -1) {
            CnAdvert.hideEmptyAd(objAd, false, blnHideContainer);
        }
    });

};

CnAdvert.hideEmptyAdWithSelector = function (strSelector, blnConsumeSpace, blnHideContainer) {
    if (typeof (blnHideContainer) == "undefined") {
        blnHideContainer = true;
    }
    if (typeof (blnConsumeSpace) == "undefined") {
        blnConsumeSpace = false;
    }
    $(strSelector).each(function () {
        CnAdvert.hideEmptyAd($(this), blnConsumeSpace, blnHideContainer);
    });
};

CnAdvert.getEmptyAds = function (objAds) {
    return objAds.filter(function () {
        return $(this).find("a:first img[src$='817-grey.gif'],> div.no-ad").length || $(this).children(":not(script,noscript)").length == 0;
    });
};

CnAdvert.getEmptyAdsWithSelector = function (strSelector) {
    if (typeof (strSelector) == "undefined") {
        strSelector = CnAdvert.defaultSelector;
    }
    return CnAdvert.getEmptyAds($(strSelector));
};

CnAdvert.isEmptyAd = function (objAd) {
    return CnAdvert.getEmptyAds(objAd).length != 0;
};

CnAdvert.hideEmptyAd = function (objAd, blnConsumeSpace, blnHideContainer) {
    if (typeof (blnHideContainer) == "undefined") {
        blnHideContainer = true;
    }
    if (typeof (blnConsumeSpace) == "undefined") {
        blnConsumeSpace = false;
    }
    if (objAd.css("visibility") != "hidden" && // We don't need to hide these, they're intentionally set to consume space.
        CnAdvert.isEmptyAd(objAd)) {

        var objToHide = objAd;
        if (blnHideContainer) {
            var parent = objAd.parent();
            if (parent[0].tagName.toLowerCase() == "div"
                && !parent.children(":not(script,.cnAd)").length) {
                objToHide = $(parent);
            }
        }

        if (blnConsumeSpace) {
            objToHide.css("visibility", "hidden");
        }
        else {
            objToHide.css("display", "none");
        }

    }
};

CnAdvert.isDoubleSky = function (strSelector) {
    var elems = $(strSelector);
    var elemsHeight = elems.height();
    return elemsHeight >= 600 && elemsHeight < 650;
};

CnAdvert.isMpu = function (strSelector) {
    var elems = $(strSelector);
    var elemsHeight = elems.height();
    return elemsHeight >= 250 && elemsHeight < 300;
};
