var DEBUG_FLAG = window.ALLOW_DEBUG && false;
DEBUG_FLAG |= (window.location.search + "").indexOf("jsdebug") >= 0;

/* BEGIN: Link it */

if (typeof (WIRED) == "undefined") {
    var WIRED = {};
}

WIRED.checkShowIpad = function (objBlah) {
    var cookieName = "wired.ipad";
    return true;
    if (navigator.userAgent.match(/iPad/i)) {
        if ($.cookie(cookieName)) {
            return false;
        }
        else {
            $.cookie(cookieName, "shown", { expires: 365 });
            return true;
        }
    }

    return false;
};

WIRED.cutOnWordBoundary = function (strString, intCharLimit, objResult) {
    if (!objResult) {
        objResult = {};
    }
    var boundaryRegex = /\w\b/g;
    var lastValidBoundary = 0;
    while (boundaryRegex.test(strString) && boundaryRegex.lastIndex < intCharLimit && boundaryRegex.lastIndex != 0) {
        lastValidBoundary = boundaryRegex.lastIndex;
    }
    objResult.trimmed = false;
    var returnString = strString;
    if (boundaryRegex.lastIndex >= intCharLimit) {
        returnString = (strString.substring(0, lastValidBoundary) + "...");
        objResult.trimmed = true;
    }
    return returnString;
};

WIRED.linkItUp = function (container) {
    // todo: dont wrap links
    // todo: dont wrap something containing a link
    // todo: wrap some things inner, some outer
    var elems = container.context ? container.find(".linkit:has(.linkme)") : $(".linkit:has(.linkme)");
    elems.each(function (index, element) {
        var cssToCopy = ["color", "font-weight", "font-size", "line-height", "font-family", "display"];
        var outer = ["span", "img"]; // link will surround these elements - otherwise, link will surround their contents
        var url = $(element).find("a.readLink:first").attr("href") || $(element).find("a").attr("href");
        var link = "<a class='autoLink' href=\"" + url + "\"></a>";
        if (url.length) {
            var linkmes = $(element).find(".linkme");
            var elementsToWrap = linkmes;

            if (elementsToWrap.length) {
                $(elementsToWrap).each(function (index, elementToWrap) {
                    var tagName = $(elementToWrap).context.tagName.toLowerCase();
                    var wrapper;

                    if ($.inArray(tagName, outer) > -1) {
                        wrapper = $(elementToWrap).wrap(link).parent();
                    }
                    else {
                        wrapper = $(elementToWrap).wrapInner(link).children();
                    }

                    for (var i = 0; i < cssToCopy.length; i++) {

                        var cssAttrib = cssToCopy[i];
                        wrapper.css(cssAttrib, $(elementToWrap).css(cssAttrib));
                    }

                    wrapper.css("margin", "0px").css("padding", "0px");
                });
            }
        }
    });
};
$(WIRED.linkItUp); 
/* END: Link it */
/* BEGIN: Client Side Gallery */

WIRED.clientSideGallery = function (selector, fullImageUrls) {
    function gotoPage(pageIndex) {
        // remove the border from the currently selected thumbnail
        $(galleryContainer).find(".selected").removeClass("selected");
        // update the src attribute of the large image
        if (fullImageUrls.length > pageIndex) {
            $(galleryContainer).children("img").attr("src", fullImageUrls[pageIndex]);
        }
        // set the clicked thumbnail to be selected
        $($(galleryContainer).find("li").get(pageIndex)).addClass("selected");
        // update the image description
        var descElement = $(galleryContainer).find(".selected").children("p");
        if (descElement.length > 0) {
            $(galleryContainer).children("p").html($(descElement).html());
            if ($(galleryContainer).children("p:hidden")) {
                $(galleryContainer).children("p").show("slow");
            }
        } else {
            if ($(galleryContainer).children("p:visible")) {
                $(galleryContainer).children("p").hide("slow");
            }
            $(galleryContainer).children("p").html("");
        }
    };
    function nextPage() {
        var currentPageIndex = selectedPageIndex();
        var nextPageIndex = 0;
        if (currentPageIndex + 1 < $(galleryContainer).find("li").length) {
            nextPageIndex = currentPageIndex + 1;
        }
        gotoPage(nextPageIndex);
    };
    function prevPage() {
        var currentPageIndex = selectedPageIndex();
        var prevPageIndex = $(galleryContainer).find("li").length;
        if (currentPageIndex - 1 >= 0) {
            prevPageIndex = currentPageIndex - 1;
        }
        gotoPage(prevPageIndex);
    };
    function selectedPageIndex() {
        return $(galleryContainer).find("li").index($(galleryContainer).find(".selected"));
    };
    function thumbnailClick() {
        // get the index of the clicked thumbnail
        var thumbIndex = $(galleryContainer).find("li").index($(this));
        // change the page
        gotoPage(thumbIndex);
    };

    // find the gallery element
    var galleryContainer = $(selector);
    // exit if the element wasn't found
    if (galleryContainer.length == 0) return;
    // change the mouse pointer and select the first image
    $(galleryContainer).find("li").css("cursor", "pointer").first().addClass("selected");
    // add the element for the image description
    $(galleryContainer).append("<p class=\"imageDescription\"></p>");
    // insert the description for the selected image and display the description
    $(galleryContainer).children("p").html($(galleryContainer).find(".selected p").html()).show("slow");
    // create the onclick event for the thumbnails
    $(galleryContainer).find("li").click(thumbnailClick);
    // add controls
    $(galleryContainer).append("<div class=\"control controlPrev\"><!----></div><div class=\"control controlNext\"><!----></div>");
    $(galleryContainer).children(".controlPrev").click(prevPage);
    $(galleryContainer).children(".controlNext").click(nextPage);
};
/* END: Client Side Gallery */

/* BEGIN: Expand to contain absolutely positioned elements */
$(
    function () {
        $(".expandPositionedAncestor").each(
            function (index, element) {
                var elementHeight = $(element).outerHeight();
                var ancestor = $(element).parent();
                while (ancestor && $(ancestor).css("position") != "relative") {
                    ancestor = $(element).parent();
                }
                if (ancestor && $(ancestor).outerHeight() < elementHeight) {
                    $(ancestor).height(elementHeight);
                }
            }
        )
    }
);
/* END: Expand to contain absolutely positioned elements */

///* BEGIN: Audio Player */
//if (typeof (WIRED) == "undefined") {
//    var WIRED = {};
//}
//WIRED.initSidebarPlayer = function () {
//    $("audio", "/_/flowplayer/flowplayer-3.2.5.swf", {
//            
//            controls: {
//                fullscreen: false,
//                height: 35,
//                autoHide: false,
//                time: false,
//                backgroundColor: "#333333",
//                backgroundGradient: "none",
//                mute: false,
//                volume: false
//            }
//        },
//        clip: {
//            autoPlay: false
//        }
//    });
//};
// $('.audioHeader').click(function () {
       
// });
///* END: Audio Player */

/* BEGIN: Horizontal Carousel */
if (typeof (HORIZONTALCAROUSEL) == "undefined") {
    var HORIZONTALCAROUSEL = {};
}
HORIZONTALCAROUSEL.animatingDataKey = "animating";
HORIZONTALCAROUSEL.init = function (container) {
    // create control click events
    function pagingControlClick() {
        if (!$(container).data(HORIZONTALCAROUSEL.animatingDataKey)) {
            $(container).data(HORIZONTALCAROUSEL.animatingDataKey, true);
            var direction = $(this).hasClass("controlLeft") ? "L" : "R";
            var visibleWidth = $(container).parent().width();
            var nonVisibleAreaInDirectionOfMovement;
            if (direction == "L") {
                nonVisibleAreaInDirectionOfMovement = parseInt($(container).css("marginLeft")) * -1;
            } else {
                nonVisibleAreaInDirectionOfMovement = carouselWidth + parseInt($(container).css("marginLeft")) - visibleWidth;
            }
            if (nonVisibleAreaInDirectionOfMovement > 0) {
                var moveDistance = visibleWidth < nonVisibleAreaInDirectionOfMovement ? visibleWidth : nonVisibleAreaInDirectionOfMovement;
                if (nonVisibleAreaInDirectionOfMovement > visibleWidth * .8) {
                    moveDistance = moveDistance * .8;
                }
                $(container).animate(
                    { marginLeft: (direction == "L" ? "+" : "-") + "=" + moveDistance },
                    500,
                    "swing",
                    function () { $(container).data(HORIZONTALCAROUSEL.animatingDataKey, false); }
                );
            } else {
                $(container).data(HORIZONTALCAROUSEL.animatingDataKey, false);
            }
            if (nonVisibleAreaInDirectionOfMovement <= visibleWidth) {
                if (direction == "L") {
                    $(container).parent().children(".controlLeft").fadeOut(fadeTime);
                } else {
                    $(container).parent().children(".controlRight").fadeOut(fadeTime);
                }
            }
            if (direction == "L" && $(container).parent().children(".controlRight:hidden").length > 0) {
                $(container).parent().children(".controlRight").fadeIn(fadeTime);
            } else if ($(container).parent().children(".controlLeft:hidden").length > 0) {
                $(container).parent().children(".controlLeft").fadeIn(fadeTime);
            }
        }
    };
    var fadeTime = 250;
    // calculate the width of this carousel
    var carouselWidth = 0;
    $(container).children().each(
        function (index, element) {
            carouselWidth += $(element).outerWidth(true);
        }
    );
    if ($(container).parent().width() < carouselWidth) {
        // create controls
        $(container).parent().append("<div class=\"control controlLeft\"><!----></div><div class=\"control controlRight\"><!----></div>");
        // hook up events to the controls
        $(container).parent().children(".control").click(pagingControlClick);
        // display the control to move right
        $(container).parent().children(".controlRight").fadeIn(fadeTime);
    } else {
        $(container).css("padding-left", (($(container).parent().width() - carouselWidth) / 2) + "px");
    }
};
$(
    function () {
        $(".horizontalCarousel").each(
            function (index, element) {
                HORIZONTALCAROUSEL.init(element);
            }
        );
    }
);
/* END: Horizontal Carousel */

/* BEGIN: List roll-up */
if (typeof (WIRED) == "undefined") {
    var WIRED = {};
}
WIRED.rollUpList = function (selector, visibleItemCount, expandoText) {
    var list = $(selector);
    if (list.length == 0) {
        return;
    }
    if ($(list).children().length <= visibleItemCount) {
        return;
    }
    $(list).css("overflow", "hidden");
    var fullHeight = $(list).height();
    var requiredHeight = 0;
    for (var count = 0; count < visibleItemCount; count++) {
        requiredHeight += $($(list).children().get(count)).outerHeight(true);
    }
    if (requiredHeight < fullHeight) {
        $(list).animate({ height: requiredHeight }, "normal");
    }
    $(list).after("<div class=\"expando\">" + expandoText + "<span><!----></span></div>");
    $(list).parent().children(".expando").click(
        function () {
            $(list).animate({ height: fullHeight }, "normal", function () { $(list).parent().children(".expando").hide(); });
        }
    );
};
/* END: List roll-up */

/* BEGIN: Commenting */
if (typeof (WIRED) == "undefined") {
    var WIRED = {};
}

WIRED.CommentVoteIncrement = function (commentId, category) {
    var ajaxData = JSON.stringify({
        UmbracoId: commentId,
        Category: category
    });

    var routeUrl = "/Controllers/CommentVoting/IncrementCount";

    var currentComment = $('.comment input.commentid[value=' + commentId + ']').closest('.comment');

    $.ajax({
        url: routeUrl,
        type: 'POST',
        data: ajaxData,
        contentType: "application/json; charset=utf-8",
        dataType: 'json',
        success: function (result) {
            //do success stuff
            if (category == "Positive")
                $(currentComment).find('.voteUp').addClass('complete').unbind();
            if (category == "Negative")
                $(currentComment).find('.voteDown').addClass('complete').unbind();
        },
        error: function (result) {
            //do error stuff
            alert('Sorry there has been an error submitting your vote');
        }
    });
};

$(function () {
    $('.comment input.reply').click(function () {
        $('.commentSubmitted').hide();
        $('.commentForm').removeClass('displayCommentHidden');
        if ($(this).closest('li').next('.replysubmit:visible').length > 0 || $(this).closest('li').find('.replysubmit:visible').length > 0) {
            $('.replysubmit').hide()
        } else {
            $(this).closest('.comment').after($('.replysubmit').show());
            var commentid;
            if ($(this).hasClass('replyToParent')) {
                commentid = $(this).closest('ol').prev().find('.commentid').val();
                $('.replysubmit [id$=ParentCommentID]').val(commentid);
                $('.replysubmit h1').html('Reply to ' + $(this).closest('ol').prev().find('.commentMeta div:first').html());
            }
            else {
                commentid = $(this).closest('li').find('.commentid').val();
                $('.replysubmit [id$=ParentCommentID]').val(commentid);
                $('.replysubmit h1').html('Reply to ' + $(this).closest('li').find('.commentMeta div:first').html());
            }
        }
    });

    $('.comment').each(function (i, val) {
        var commentid = $(this).find('.commentid').val();
        $(this).find('input.voteUp').click(function () {
            WIRED.CommentVoteIncrement(commentid, "Positive");
        });
        $(this).find('input.voteDown').click(function () {
            WIRED.CommentVoteIncrement(commentid, "Negative");
        });
    });
});

WIRED.validateCaptcha = function (source, arguments) {
    arguments.IsValid = $(".commentcaptcha #recaptcha_response_field").val().length > 0;
};
/* END: Commenting */

/* BEGIN: List display helpers */
if (typeof (WIRED) == "undefined") {
    var WIRED = {};
}
WIRED.listInRowsInit = function (strSelector, intMinHeight) {
    WIRED.displayListInRows($(strSelector), intMinHeight);
    $(window).resize(
    function () {
        WIRED.displayListInRows($(strSelector), intMinHeight);
    }
);
};
WIRED.displayListInRows = function (list, intMinHeight) {
    if (intMinHeight === undefined) {
        intMinHeight = 0;
    }
    var listObject = $(list);
    var listItems = listObject.children("li");
    var yOffset = null;
    var maxHeightInRow = 0;
    var itemsInCurrentRow = new Array();
    for (var i = 0; i < listItems.length; i++) {
        $(listItems[i]).height("auto").removeClass("lastInRow");
    }
    listObject.removeClass("equalHeight");
    for (var i = 0; i < listItems.length; i++) {
        // if this listitem is on the same row as the previous one
        var itemOffset = $(listItems[i]).offset().top;
        if (yOffset == itemOffset) {
            // check if the height of this item is greater than any other items found on the same row
            if ($(listItems[i]).height() > maxHeightInRow) {
                maxHeightInRow = $(listItems[i]).height();
            }
            // add this list item to the items in the current row array
            itemsInCurrentRow.push($(listItems[i]));
        }
        // if this item does not have the same offset as the previous one, or if it is the last item
        if (yOffset != itemOffset || i == listItems.length - 1) {
            if (i > 0) {
                if (i + 1 == listItems.length) { // last item in the list
                    $(listItems[i]).addClass("lastInRow");
                }
                if (yOffset != itemOffset) { // first item on new row
                    $(listItems[i - 1]).addClass("lastInRow");
                }
            }
            // set the height of all items in the previous row
            for (var j = 0; j < itemsInCurrentRow.length; j++) {
                $(itemsInCurrentRow[j]).height(Math.max(maxHeightInRow, intMinHeight));
            }
            // reset items in current row
            itemsInCurrentRow = new Array();
            // set the new yOffset
            yOffset = $(listItems[i]).offset().top;
            // set the maximum height to be that of the current item
            maxHeightInRow = $(listItems[i]).height();
            // add this list item to the items in the current row array
            itemsInCurrentRow.push($(listItems[i]));
        }
    }
    listObject.addClass("equalHeight");
};
WIRED.addClassToFirstLastInRows = function (selector) {
    $(selector).each(function (listIndex, listElement) {
        var previousYOffset;
        $(listElement).children().each(function (listItemIndex, listItemElement) {
            // get offset of current item
            var currentYOffset = $(listItemElement).offset().top;
            // if first item in list
            if (listItemIndex == 0) {
                $(listItemElement).addClass("firstInRow");
                previousYOffset = currentYOffset;
            }
            // if last item in collection
            if (listItemIndex == $(listElement).children().length - 1) {
                $(listItemElement).addClass("lastInRow");
                return;
            }
            // check if this item is the first in a row
            if (previousYOffset != currentYOffset) {
                $(listItemElement).addClass("firstInRow");
                if (listItemIndex != 0) {
                    $($(listElement).children().get(listItemIndex - 1)).addClass("lastInRow");
                }
                previousYOffset = currentYOffset;
            }
        });
    });
};
$(function () { WIRED.addClassToFirstLastInRows(".siteFooter nav ul"); });
/* END: List display helpers */

/* BEGIN: JSON Helpers */
if (typeof (WIRED) == "undefined") {
    var WIRED = {};
}
WIRED.serialiseVal = function (paramVal) {
    return (typeof (paramVal) == "string") ? ("\"" + paramVal + "\"") : paramVal;
};
WIRED.serialiseParam = function (paramName, paramVal) {
    return WIRED.serialiseVal(paramName) + ": " + WIRED.serialiseVal(paramVal);
};
WIRED.serialiseParams = function (objParams) {
    var paramList = "";
    for (var currentParamKey in objParams) {
        if (paramList != "") {
            paramList += ", ";
        }
        paramList += WIRED.serialiseParam(currentParamKey, objParams[currentParamKey]);
    }
    return paramList;
};
WIRED.serialiseObject = function (obj) {
    return "{" + WIRED.serialiseParams(obj) + "}";
};
WIRED.getJsonFromWebservice = function (url, data, onDataLoaded) {
    $.ajax({
        type: "POST",
        url: url,
        data: WIRED.serialiseObject(data),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) { onDataLoaded(data.d); }
    });
};
/* END: JSON Helpers */

/* BEGIN: Carousel */
if (typeof (WIRED) == "undefined") {
    var WIRED = {};
}
WIRED.carousel = {};
WIRED.carousel.containerCssClass = "sectionCarousel";
WIRED.carousel.cancelAutoPlay = function () {
    if (typeof (WIRED.carousel.autoPlayIntervalId) != "undefined") {
        window.clearInterval(WIRED.carousel.autoPlayIntervalId);
        WIRED.carousel.autoPlayIntervalId = null;
    }
};
WIRED.carousel.init = function () {
    var carouselContainer = $("." + WIRED.carousel.containerCssClass);
    // check if the carousel container exists
    if (carouselContainer.length == 0) return;
    var carouselFrames = $("." + WIRED.carousel.containerCssClass + " li");
    // check that there are some frames in the carousel
    if (carouselFrames.length < 2) return;
    // add paging control
    var pagingHtml = "<div class=\"carouselPaging\"><span class=\"button prev\"><!----></span><div><span class=\"currentPage\">1</span><span>/" + carouselFrames.length + "</span></div><span class=\"button next\"><!----></span></div>";
    carouselContainer.append(pagingHtml);
    // wire up events on the paging control
    $(".carouselPaging .prev").click(WIRED.carousel.pagingMovePrevious_Click);
    $(".carouselPaging .next").click(WIRED.carousel.pagingMoveNext_Click);
    // indicate that the first page is displayed
    $($(carouselFrames)[0]).addClass("selected");
    // hide the other pages
    $(carouselFrames).not(":first-child").fadeOut(0).css("visibility", "visible");
    // kick off autoplay
    WIRED.carousel.autoPlayIntervalId = window.setInterval(WIRED.carousel.pagingMoveNext, 5000);
};
WIRED.carousel.getCurrentPageIndex = function () {
    return $("." + WIRED.carousel.containerCssClass + " li").index($("." + WIRED.carousel.containerCssClass + " li.selected"));
};
WIRED.carousel.getPageCount = function () {
    return $("." + WIRED.carousel.containerCssClass + " li").length;
};
WIRED.carousel.pagingMoveNext = function () {
    var currentPageIndex = WIRED.carousel.getCurrentPageIndex();
    var nextPageIndex = currentPageIndex + 1 < WIRED.carousel.getPageCount() ? currentPageIndex + 1 : 0;
    WIRED.carousel.pagingMoveTo(nextPageIndex);
};
WIRED.carousel.pagingMoveNext_Click = function () {
    WIRED.carousel.cancelAutoPlay();
    WIRED.carousel.pagingMoveNext();
};
WIRED.carousel.pagingMovePrevious = function () {
    var currentPageIndex = WIRED.carousel.getCurrentPageIndex();
    var previousPageIndex = currentPageIndex - 1 >= 0 ? currentPageIndex - 1 : WIRED.carousel.getPageCount() - 1;
    WIRED.carousel.pagingMoveTo(previousPageIndex);
};
WIRED.carousel.pagingMovePrevious_Click = function () {
    WIRED.carousel.cancelAutoPlay();
    WIRED.carousel.pagingMovePrevious();
};
WIRED.carousel.pagingMoveTo = function (newPageIndex) {
    if ($("." + WIRED.carousel.containerCssClass).data("isAnimating")) {
        return;
    }
    $("." + WIRED.carousel.containerCssClass).data("isAnimating", true);
    var currentPageIndex = WIRED.carousel.getCurrentPageIndex();
    if (newPageIndex == currentPageIndex) return;
    $($("." + WIRED.carousel.containerCssClass + " li").get(currentPageIndex)).fadeOut(250, function () { $(this).removeClass("selected"); $($("." + WIRED.carousel.containerCssClass + " li").get(newPageIndex)).fadeIn(250, function () { $(this).addClass("selected"); $("." + WIRED.carousel.containerCssClass).data("isAnimating", false); }); });
    $(".carouselPaging .currentPage").text(newPageIndex + 1);
};
/* END: Carousel */

/* BEGIN: IFrame-based galleries */
var IFrameGallery = {};

IFrameGallery.numberOfImages = 0;
IFrameGallery.imageNoParamName = "image-number";
IFrameGallery.iFrameImageNoParamName = "image";
IFrameGallery.baseGalleryIFrameUrl = window.location.href;
IFrameGallery.intervalMilliseconds = 5000;
IFrameGallery.stopAtLastSlide = true;

IFrameGallery.intervalVariable = null;

/*
* Are we waiting for the the IFrame to tell us
* that it has fully loaded?
*/
IFrameGallery.awaitingLoad = true;

IFrameGallery.init = function (
    strBaseGalleryIFrameUrl,
    strIFrameImageNoParamName,
    strImageNoParamName,
    intNumberOfImages,
    blnShowIntroText,
    blnStopAtLastSlide,
    strIFrameSelector,
    boolUseQueryString, forceStart, slideshowInterval) {

    IFrameGallery.numberOfImages = intNumberOfImages;
    IFrameGallery.imageNoParamName = strImageNoParamName;
    IFrameGallery.baseGalleryIFrameUrl = strBaseGalleryIFrameUrl;
    IFrameGallery.iFrameImageNoParamName = strIFrameImageNoParamName;
    IFrameGallery.useQueryString = boolUseQueryString;

    // Optional parameters
    if (typeof (blnStopAtLastSlide) != "undefined") {
        IFrameGallery.stopAtLastSlide = blnStopAtLastSlide;
    }

    if (typeof (blnShowIntroText) == "undefined") {
        blnShowIntroText = true;
    }

    if (typeof (strIFrameSelector) == "undefined") {
        strIFrameSelector = "#GalleryIFrame";
    }

    if (typeof (boolUseQueryString) == "undefined") {
        IFrameGallery.useQueryString = false;
    }

    if (typeof (slideshowInterval) != "undefined") {
        IFrameGallery.intervalMilliseconds = slideshowInterval;
    }

    // Reset everything to the defaults
    IFrameGallery.stopSlideshow();

    /*
    * If the user entered a hash url containing an image url containing a number,
    * go straight to that image
    */
    var imageNumber = 1;
    var blnUserSpecifiedImage = false;
    if (window.location.hash) {
        var results = new RegExp("!" + IFrameGallery.imageNoParamName + "=(\\d+)").exec(window.location.hash);
        if (results != null) {
            imageNumber = parseInt(results[1], 10);
        }
    }

    if (imageNumber > 0) {
        blnUserSpecifiedImage = true;
        IFrameGallery.showSlideNumber(imageNumber, false);
    }

    // Intro box
    var blnIntroMode = blnShowIntroText && !blnUserSpecifiedImage
//    if (blnIntroMode) {
//        $(".galleryControls li").addClass("introTextState");
//        $(".galleryControls .playpause").addClass("playPauseIntroTextState").html("Slideshow");
//    }
//    else {
//        $(".introBox").remove();
//    }

//    // Outro box
//    if (IFrameGallery.stopAtLastSlide) {
//        $(".outroBox .backToStartButton").click(IFrameGallery.backToStart);
//    }

//    if ((!blnUserSpecifiedImage && !blnShowIntroText) || forceStart) {
//        IFrameGallery.runSlideshow();
//    }

    IFrameGallery.bindNext();
    IFrameGallery.bindPrevious();
    IFrameGallery.bindPause(blnIntroMode);
};

IFrameGallery.backToStart = function () {
    IFrameGallery.hideOutro();
    IFrameGallery.showSlideNumber(1);
    IFrameGallery.runSlideshow();
};

IFrameGallery.bindNext = function () {
    $(".galleryControls .next a").click(function (evt) {
        IFrameGallery.stopSlideshow();
        IFrameGallery.showNextSlide();
        evt.preventDefault();
        //return false;
    });
};

IFrameGallery.bindPrevious = function () {
    $(".galleryControls .prev a").click(function (evt) {
        IFrameGallery.stopSlideshow();
        IFrameGallery.showPreviousSlide();
        evt.preventDefault();
        //return false;
    });
};

IFrameGallery.removeIntroText = function () {
    $(".galleryControls li").removeClass("introTextState playPauseIntroTextState");
    var playPauseButton = $(".galleryControls .playpause");

    playPauseButton.unbind("click", IFrameGallery.removeIntroText);
    IFrameGallery.bindPause(false);
    $(".introBox").remove();
    IFrameGallery.runSlideshow();
};

IFrameGallery.bindPause = function (blnIntroMode) {
    var playPauseButton = $(".galleryControls .playpause");
    if (blnIntroMode) {
        playPauseButton.click(IFrameGallery.removeIntroText);
        $(".introBox .startButton").click(IFrameGallery.removeIntroText);
    }
    else {
        playPauseButton.click(function (evt) {
            if (IFrameGallery.isRunning()) {
                IFrameGallery.stopSlideshow();
            }
            else {
                IFrameGallery.runSlideshow();
            }
        });
    }
};

IFrameGallery.onZoom = function () {
    if (IFrameGallery.isRunning()) {
        IFrameGallery.stopSlideshow();
    }
};

IFrameGallery.isRunning = function () {
    return IFrameGallery.intervalVariable != null;
};

IFrameGallery.currentImageNumber = function () {
    var strIFrameUrl = $("#GalleryIFrame").attr("src");
    var imageNoTest;
    if (IFrameGallery.useQueryString) {
        imageNoTest = new RegExp("&" + IFrameGallery.iFrameImageNoParamName + "=(\\d+)").exec(strIFrameUrl);
    }
    else {
        imageNoTest = new RegExp("/" + IFrameGallery.iFrameImageNoParamName + "/(\\d+)").exec(strIFrameUrl);
    }
    var imageNumber = 1;
    if (imageNoTest != null) {
        var imageNumber = parseInt(imageNoTest[1], 10);
    }
    return imageNumber;
};

IFrameGallery.runSlideshow = function () {
    $(".galleryControls .playpause").removeClass("paused");//.text("Pause");
    if (!IFrameGallery.isRunning()) {
        IFrameGallery.intervalVariable = setInterval("IFrameGallery.intervalShowNextSlide()", IFrameGallery.intervalMilliseconds);
    }
};

IFrameGallery.showSlideNumber = function (intSlideNumber, blnBindEvents) {
    if (typeof (blnBindEvents) == "undefined") {
        blnBindEvents = true;
    }    
    $("#GalleryIFrame").attr("src", IFrameGallery.getGalleryImageUrl(intSlideNumber));    
    window.location.hash = "!" + IFrameGallery.imageNoParamName + "=" + IFrameGallery.currentImageNumber();
    IFrameGallery.updateButtons(blnBindEvents);
};

IFrameGallery.notifyLoaded = function (intImageNumber) {
    this.awaitingLoad = false;
};

// Wrapper for showNextSlide
// Used solely from the timed interval execution
IFrameGallery.intervalShowNextSlide = function () {
    if (!this.awaitingLoad) {
        this.awaitingLoad = true;
        this.showNextSlide();
    }
};

IFrameGallery.showNextSlide = function () {
    var nextImageNumber = (IFrameGallery.currentImageNumber() % IFrameGallery.numberOfImages) + 1;
    IFrameGallery.showSlideNumber(nextImageNumber);
};

IFrameGallery.showPreviousSlide = function () {
    var previousImageNumber = IFrameGallery.currentImageNumber() - 1;
    if (previousImageNumber < 1) {
        previousImageNumber = IFrameGallery.numberOfImages;
    }
    IFrameGallery.showSlideNumber(previousImageNumber);
};

IFrameGallery.updatePagingPosition = function () {
    var pagingPlaceHolder = $(".pagingPlaceHolder");
    var imagePaging = parent.$(".imagePaging");

    var left = Math.round(pagingPlaceHolder.position().left);

    imagePaging.css("left", left);
    imagePaging.css("top", "398px");
    imagePaging.show();
};

IFrameGallery.updateButtons = function (blnBindEvents) {
    
    var previousButtonContainer = $(".galleryControls .prev");
    var nextButtonContainer = $(".galleryControls .next");
    if (IFrameGallery.currentImageNumber() > 1) {
        if (previousButtonContainer.children("a").length == 0) {
            previousButtonContainer.html("<a class=\"ir\">Previous</a>");
            if (blnBindEvents) {
                IFrameGallery.bindPrevious();
            }
        }
    }
    if (IFrameGallery.currentImageNumber() == 1) {
        previousButtonContainer.html("<span class=\"ir\"></span>");
    }

    if ((IFrameGallery.currentImageNumber() == IFrameGallery.numberOfImages && IFrameGallery.stopAtLastSlide)
        || IFrameGallery.numberOfImages < 2) {
        $(".galleryControls .next").html("<span class=\"ir\"></span>");
        if (IFrameGallery.isRunning()) {
            IFrameGallery.stopSlideshow();
            $(".outroBox").css("display", "block");
            $("body").click(IFrameGallery.hideOutro);
        }
    }
    else if (IFrameGallery.currentImageNumber() < IFrameGallery.numberOfImages) {
        if (nextButtonContainer.children("a").length == 0) {
            nextButtonContainer.html("<a class=\"ir\">Next</a>");
            if (blnBindEvents) {
                IFrameGallery.bindNext();
            }
        }
    }    
};

IFrameGallery.hideOutro = function () {
    $("body").unbind("click", IFrameGallery.hideOutro);
    $(".outroBox").css("display", "none");
};

IFrameGallery.stopSlideshow = function () {
    $(".galleryControls .playpause").addClass("paused");//.text("Slide Show");
    if (IFrameGallery.isRunning()) {
        clearTimeout(IFrameGallery.intervalVariable);
        IFrameGallery.intervalVariable = null;
    }
};

IFrameGallery.getGalleryImageUrl = function (intImageNumber) {
    var strUrl;
    if (IFrameGallery.useQueryString) {
        strUrl = IFrameGallery.baseGalleryIFrameUrl + "&" + IFrameGallery.iFrameImageNoParamName + "=" + intImageNumber;
    }
    else {
        strUrl = IFrameGallery.baseGalleryIFrameUrl + "/" + IFrameGallery.iFrameImageNoParamName + "/" + intImageNumber;
    }
    return strUrl;
};

/* END: IFrame-based galleries */

/* BEGIN: IFrame -> parent slideshow intercommunication */
var SlideShowInterface = {};
SlideShowInterface.notifiedLoad = false;
SlideShowInterface.stopSlideShow = function () {
    if (parent != null && typeof (parent.IFrameGallery) != "undefined" && parent.IFrameGallery != null) {
        parent.IFrameGallery.onZoom();
    }
};
SlideShowInterface.notifyLoaded = function (intSlideNumber) {
    if (!this.notifiedLoad) {
        this.notifiedLoad = true;
        if (parent != null && typeof (parent.IFrameGallery) != "undefined" && parent.IFrameGallery != null) {
            parent.IFrameGallery.notifyLoaded(intSlideNumber);
        }
    }
};
/* END: IFrame -> parent slideshow intercommunication */

/* BEGIN: Image Settings Helper */
var ImageSettingsHelper = {};
ImageSettingsHelper.loadingIFrame = $('.imageIFrame .imageLoading');
ImageSettingsHelper.loadingFullscreen = $('div#fullscreenOverlay div.imageLoading');
ImageSettingsHelper.updateImageSettings = function (currentImageSelector, afterZoom) {

    var isStandardImage = currentImageSelector == "div.standardImage img";
    var currentImage = $(currentImageSelector);
    var hasCurrentImage = currentImage.attr("src") != "" && currentImage.attr("src") != undefined;

    if (hasCurrentImage) {
        // Set image top padding
        var imageTop = (692 / 2) - (currentImage.height() / 2);
        if (imageTop < 0) imageTop = 0;
        if (!isStandardImage) imageTop = 0;
        currentImage.css("margin-top", imageTop);
        currentImage.css("display", "inline");

        // Set footer position
        var footerLeft = ((620 / 2) - (currentImage.width() / 2)) + 9; // 9 = margin around the image
        if (footerLeft < 9) footerLeft = 9;
        var footerWidth = currentImage.width() > 620 ? 620 : currentImage.width();
        var footerTop = currentImage.height() > 692 ? 692 + 10 : currentImage.height() + imageTop + 10; // 10 = height of the footer box                
        var imageFooter = $(".imageFooter");
        imageFooter.width(footerWidth);
        imageFooter.css("top", footerTop);
        imageFooter.css("left", footerLeft);
        imageFooter.css("display", "block");

        // Set zoom overlay position        
        var magImage = $("div.magnifiedImage img");
        var hasMagnifiedImage = magImage.attr("src") != "" && magImage.attr("src") != undefined;
        if (hasMagnifiedImage && isStandardImage) {
            var zoomOverlay = $(".imageViewPort").siblings("span.zoom");
            zoomOverlay.css("top", currentImage.height() - (140 - imageTop));
            zoomOverlay.show();
            window.setTimeout(function () { $(zoomOverlay).fadeOut("slow") }, 3000);
        }
    }
};
ImageSettingsHelper.standardImageLoaded = false;
ImageSettingsHelper.standardImageLoadedProcess = function () {
    if (!ImageSettingsHelper.standardImageLoaded) {
        $("div.standardImage").css("display", "inline");
        if ($("div.standardImage img").width() > 0) ImageSettingsHelper.updateImageSettings("div.standardImage img");
        ImageSettingsHelper.loadingIFrame.hide();
        ImageSettingsHelper.standardImageLoaded = true;
    }
};
ImageSettingsHelper.downloadLargeImages = function () {

    var largeImageUrl = ImageGalleryHelper.FrameQuery.find('.imageIFrame div.magnifiedImage span').text();
    if (!ImageSettingsHelper.magnifiedImageLoaded) { // Magnified image load
        ImageSettingsHelper.loadingIFrame.show();
        var magImage = $('div.magnifiedImage img');
        magImage.attr('src', largeImageUrl);
    }
    if (!ImageSettingsHelper.fullscreenImageLoaded) { // Fullscreen image load                
        ImageSettingsHelper.loadingFullscreen.show();
        var fullscreen = parent.$('div.fullscreenMagnifiyImage img');
        fullscreen.attr('src', largeImageUrl);
    }
};
ImageSettingsHelper.magnifiedImageLoaded = false;
ImageSettingsHelper.magnifiedImageLoadedProcess = function () {
    if (!ImageSettingsHelper.magnifiedImageLoaded) {
        if ($("div.magnifiedImage img").width() > 0) {                                    
            ImageSettingsHelper.updateImageSettings("div.magnifiedImage img");
        }
        ImageSettingsHelper.loadingIFrame.hide();
        ImageSettingsHelper.magnifiedImageLoaded = true;
    }
};
ImageSettingsHelper.fullscreenImageLoaded = false;
ImageSettingsHelper.fullscreenImageLoadedProcess = function () {
    if (!ImageSettingsHelper.fullscreenImageLoaded) {
        ImageSettingsHelper.fullscreenImageLoaded = true;
    }
};
ImageSettingsHelper.addRemoveViewPortClass = function (add) {
    var viewPortClass = $(".viewportClass").text();
    if (viewPortClass != "") {
        if (add) {
            $(".imageViewPort").addClass(viewPortClass);
        }
        else {
            $(".imageViewPort").removeClass(viewPortClass);
        }
    }
};
/* END: Image Settings Helper */

/* BEGIN: Image Magnifier */
$(
    function () {
        var imageViewPort = $(".imageViewPort");
        var zoomOverlay = imageViewPort.siblings("span.zoom");

        if (imageViewPort.find(".magnifiedImage").length > 0) {
            $(".imageViewPort").mapbox({
                clickZoom: true,
                mousewheel: true,
                callBefore: function (theLayer, xcoord, ycoord, theViewport) {
                    // Viewport is being passed incorrectly
                    var actualViewport = $(theLayer).parent();
                    actualViewport.addClass("dragging");
                },
                callAfter: function (theLayer, xcoord, ycoord, theViewport) {
                    // Viewport is being passed incorrectly
                    var actualViewport = $(theLayer).parent();
                    actualViewport.removeClass("dragging");
                },
                beforeZoom: function (theLayer, xcoord, ycoord, theViewport) {
                    /* TODO - Check for undefined? */
                    var actualViewport = $(theLayer).parent();
                    actualViewport.siblings("span").fadeOut("slow");

                    ImageSettingsHelper.addRemoveViewPortClass(false);

                    /* This should ideally be done only within
                    * the iframe version, however for expediency
                    * we'll add the slideshow capabilities
                    * to all zoomable images.
                    */
                    SlideShowInterface.stopSlideShow();

                    // Download the large images
                    if ($("div.magnifiedImage img").attr("src") == "/_/img/1x1.gif") {
                        var imageFooter = $(".imageFooter");
                        imageFooter.css("display", "none");
                        ImageSettingsHelper.downloadLargeImages();
                    }
                },
                afterZoom: function (theLayer, xcoord, ycoord, theViewport) {
                    var zoomedIn = $(".zoomedIn");
                    if (zoomedIn.css("display") == "none") { zoomedIn.fadeIn("slow"); }

                    // Viewport is being passed incorrectly
                    var actualViewport = $(theLayer).parent();
                    var zoomFactor = actualViewport.attr("visible");
                    if (zoomFactor == 1) {
                        actualViewport.addClass("fullyZoomed");
                        $(this).attr("clickZoom", false);
                        $(this).attr("clickZoomOut", true);
                        $(this).attr("clickDistance", 4);
                    }
                    else {
                        actualViewport.removeClass("fullyZoomed");
                        if (zoomFactor == 0) {
                            zoomedIn.hide();
                            zoomOverlay.show();
                            $(this).attr("clickZoom", true);
                            $(this).attr("clickZoomOut", false);
                            $(this).attr("clickDistance", 1);

                            ImageSettingsHelper.updateImageSettings("div.standardImage img", true);
                            ImageSettingsHelper.addRemoveViewPortClass(true);
                            
                            $(".current-map-layer").attr("style", "display:block");
                        }
                    }

                    if (ImageSettingsHelper.magnifiedImageLoaded && zoomFactor != 0) {
                        ImageSettingsHelper.updateImageSettings("div.magnifiedImage img");
                    }
                }
            }).addClass("mapbox");

            ImageSettingsHelper.addRemoveViewPortClass(true);
        }
    }
);
    /* END: Image Magnifier */



/* BEGIN: Search */
var Search = {};

Search.query = null;
Search.days = null;
Search.tag = null;

Search.DaysClick = function (days) {
    window.location = $.param.querystring(location.href, 'days=' + days); return false;
};

$(function () {
    Search.query = $.deparam.querystring()["q"];
    Search.days = $.deparam.querystring()["days"] || 0;
    Search.tag = $.deparam.querystring()["tag"];

    $('.searchCategoryDays ul li a[data-days=' + Search.days + ']').contents().unwrap().parent().addClass('selected');
    
    $('.searchCategoryDays ul li a').click(function () {
        Search.DaysClick($(this).attr('data-days')); 
        return false;
    });

    $("#SiteSearchButton").click(function () {
        window.location = "/search?q=" + $('#SiteSearchTextInput').val();
    });

    $(".searchGlass").click(function () {
        window.location = "/search?q=" + $(".searchInput").val();
    });

    $('#SiteSearchTextInput').keyup( // make Enter key initiate search
        function (e) {
            if (e.keyCode == 13) {
                $('#SiteSearchButton').click();
            }
        }
    );

    $(".searchInput").keyup( // make Enter key initiate search
        function (e) {
            if (e.keyCode == 13) {
                $(".searchGlass").click();
            }
        }
    );

    $('#SiteSearchTextInput').val(Search.query);
});
/* END: Search */

/* START: Custom scrolling */
var CustomScroller = {};

CustomScroller.clickDistance = 200; // in pixels
CustomScroller.clickDuration = 300; // in milliseconds

CustomScroller.downButtonMouseDown = function (target, copyDiv, wrapperDiv, objOnClickFunction) {
    if (typeof (objOnClickFunction) != "undefined") {
        objOnClickFunction();
    }
    wrapperDiv.data("clickStart", new Date().getTime());
    var delta = copyDiv.height() + copyDiv.position().top - wrapperDiv.height();
    if (delta > 0) {
        target.parent().children(".up").removeClass("disabled");
    }
    copyDiv.animate({ "top": "-=" + delta }, { "duration": "slow", "easing": "swing",
        "complete": function () { CustomScroller.disableButtons(wrapperDiv, copyDiv); }
    });
};

CustomScroller.downButtonMouseUp = function (target, copyDiv, wrapperDiv) {
    var intTimeElapsed = new Date().getTime() - wrapperDiv.data("clickStart");
    copyDiv.stop(true);
    /* If it was a click, execute the minimum delta animation */
    if (intTimeElapsed < CustomScroller.clickDuration) {
        var intDelta = Math.min(CustomScroller.clickDistance, copyDiv.height() + copyDiv.position().top - wrapperDiv.height());
        copyDiv.animate({ "top": "-=" + intDelta },
                { "duration": "slow", "complete": function () { CustomScroller.disableButtons(wrapperDiv, copyDiv); }
                });
    }
};

CustomScroller.upButtonMouseDown = function (target, copyDiv, wrapperDiv, objOnClickFunction) {
    if (typeof (objOnClickFunction) != "undefined") {
        objOnClickFunction();
    }
    wrapperDiv.data("clickStart", new Date().getTime());
    var delta = copyDiv.position().top * -1;
    if (delta > 0) {
        target.parent().children(".down").removeClass("disabled");
    }
    copyDiv.animate({ "top": "+=" + delta }, { "duration": "slow", "easing": "swing",
        "complete": function () { CustomScroller.disableButtons(wrapperDiv, copyDiv); }
    });
};

CustomScroller.upButtonMouseUp = function (target, copyDiv, wrapperDiv) {
    var intTimeElapsed = new Date().getTime() - wrapperDiv.data("clickStart");
    copyDiv.stop(true);
    /* If it was a click, execute the minimum delta animation */
    if (intTimeElapsed < CustomScroller.clickDuration) {
        var intDelta = Math.min(CustomScroller.clickDistance, copyDiv.position().top * -1);
        copyDiv.animate({ "top": "+=" + intDelta }, { "duration": "slow",
            "complete": function () { CustomScroller.disableButtons(wrapperDiv, copyDiv); }
        });
    }
};

CustomScroller.disableButtons = function (wrapperDiv, copyDiv) {
    if (copyDiv.position().top >= 0) {
        wrapperDiv.find(".up").addClass("disabled upDisabled");
    } else if (copyDiv.height() + copyDiv.position().top <= wrapperDiv.height()) {
        wrapperDiv.find(".down").addClass("disabled downDisabled");
    }
};

CustomScroller.init = function (strSelector, objOnClickFunction) {
    var copyDiv = $(strSelector);    
    copyDiv.each(function () {
        var oldHeight = Math.round($(this).height());
        $(this).wrap("<div class='scrollableDiv' />");
        var wrapperDiv = $(this).parent();
        wrapperDiv.css({ height: oldHeight + "px" });
        $(this).css({ overflow: "visible", position: "absolute", height: "auto" }).addClass("copyDiv");

        if (wrapperDiv.height() < copyDiv.height()) {
            wrapperDiv.append($("<div class='controls'><a class='up'>Up</a><a class='down'>Down</a></div>"))
            .addClass("scrollableDivWithControls");
            wrapperDiv
                .find(".down")
                .mousedown(function () {
                    CustomScroller.downButtonMouseDown($(this), copyDiv, wrapperDiv, objOnClickFunction);
                })
                .mouseup(function () {
                    CustomScroller.downButtonMouseUp($(this), copyDiv, wrapperDiv);
                });
            wrapperDiv
                .find(".up")
                .mousedown(function () {
                    CustomScroller.upButtonMouseDown($(this), copyDiv, wrapperDiv, objOnClickFunction);
                })
                .mouseup(function () {
                    CustomScroller.upButtonMouseUp($(this), copyDiv, wrapperDiv);
                });
            CustomScroller.disableButtons(wrapperDiv, copyDiv);
        }
    });
};
/* END: Custom scrolling */

//** Start: Flash embed code. **
var blnHasFlash = false;
function CN_HasFlash(FlashVersion) {
    var isIE = (navigator.appVersion.indexOf("MSIE") != -1) ? true : false;
    var isWin = (navigator.appVersion.indexOf("Windows") != -1) ? true : false;
    // Write vbscript detection on ie win. IE on Win
    if (isIE && isWin) {
        document.write('<SCR' + 'IPT LANGUAGE=VBScript\> \n');
        document.write('on error resume next \n');
        document.write('blnHasFlash = (IsObject(CreateObject("ShockwaveFlash.ShockwaveFlash.' + FlashVersion + '"))) \n');
        document.write('</SCR' + 'IPT\> \n');
    }
    // ElseIf netscape or mac(not version 4.5) check flash version
    else if (navigator.plugins && navigator.plugins["Shockwave Flash"]) {
        var strFlashDescription = navigator.plugins["Shockwave Flash"].description;
        var intFlashVersion = 0;
        var regexMatches = strFlashDescription.match(/\s(\d+)\./);
        if (regexMatches && regexMatches.length > 0) {
            intFlashVersion = parseInt(regexMatches[1]);
        }
        blnHasFlash = intFlashVersion >= FlashVersion;
    }
    if (blnHasFlash != true) {
        blnHasFlash = false;
    }
    return blnHasFlash;
}

//function CN_WriteFlash(FlashVersion, FlashSource, FlashWidth, FlashHeight, FlashBgColor, FlashImage, WMode, FlashImageMap, ConfigFilePath) {
//        document.write('<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=' + FlashVersion + ',0,0,0" width="' + FlashWidth + '" height="' + FlashHeight + '" id="flashtest">');
//        document.write('<param name="movie" value="' + FlashSource + '"> ');
//        document.write('<param name="quality" value="high"> ');
//        document.write('<param name="menu" value="false">');
//        document.write('<param name="wmode" value="' + WMode + '" />');
//        if (ConfigFilePath != null)
//            document.write('<param name="FlashVars" value="configXMLURL=' + ConfigFilePath + '">');
//        if (FlashImage != '') {
//            document.write('<img src="' + FlashImage + '" border="0">')
//        }
//        document.write('</object>');

//    //return Result;
//}

function CN_WriteFlash(FlashVersion, FlashSource, FlashWidth, FlashHeight, FlashBgColor, FlashImage, WMode, FlashImageMap, ConfigFilePath) {
    var Result = CN_HasFlash(FlashVersion);

    if (Result) {
        document.write('<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=' + FlashVersion + ',0,0,0" width="' + FlashWidth + '" height="' + FlashHeight + '" id="flashtest">');
        document.write('<param name="movie" value="' + FlashSource + '"> ');
        document.write('<param name="quality" value="high"> ');
        document.write('<param name="menu" value="false">');
        document.write('<param name="wmode" value="' + WMode + '" />');
        if (ConfigFilePath != null)
            document.write('<param name="FlashVars" value="configXMLURL=' + ConfigFilePath + '">');
        document.write('<embed swliveconnect="true" name="flashtest" src="' + FlashSource + '" quality="high" menu="false" ');
        document.write('swLiveConnect="false" width="' + FlashWidth + '" height="' + FlashHeight + '"');
        if (ConfigFilePath != null)
            document.write(' flashvars="configXMLURL=' + ConfigFilePath + '" ');
        document.write('type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" wmode="' + WMode + '">');
        document.write('</object>');
    }
    else if (FlashImage != '' && FlashImageMap == '') {
        document.write('<a href="http://www.macromedia.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" target="_blank">')
        document.write('<img src="' + FlashImage + '" border="0" alt="Click here to get flash player">')
        document.write('</a>')
    }
    else if (FlashImage != '' && FlashImageMap != '') {
        document.write('<img src="' + FlashImage + '" border="0" usemap="#' + FlashImageMap + '" />');
    }

    return Result;
}

//** END: Flash embed code **
/* BEGIN: Facebook */
if (typeof (WIRED) == "undefined") {
    var WIRED = {};
}
WIRED.initialiseFacebook = function (strAppId, fnCallback) {
    window.fbAsyncInit = function () {
        FB.init({ appId: strAppId, status: true, cookie: true, xfbml: true }); //NEED TO REPLACE THIS WITH WIRED APPID
        if (typeof(fnCallback) != "undefined")
        {
            fnCallback();
        }        
    };

    (function () {
        var e = document.createElement('script');
        e.type = 'text/javascript';
        e.src = document.location.protocol + '//connect.facebook.net/en_US/all.js';
        e.async = true;
        document.getElementById('fb-root').appendChild(e);
    } ());
};
//$(WIRED.initialiseFacebook);
/* END:   Facebook */
/* BEGIN: Zoom Arrow Scroll */
var ImageGalleryHelper = {};
ImageGalleryHelper.SetFrame = function (obj) {
    this.Frame = obj;
    this.FrameQuery = $(obj.document);
}

var ZoomArrowScroll = {};
var zoomArrowTarget = null;
var zoomViewPortX = 0;
var zoomViewPortY = 0;
ZoomArrowScroll.init = function (imageDivSelector, viewPortSelector) {
    zoomArrowTarget = $(imageDivSelector);
    viewPort = $(viewPortSelector);
    zoomViewPortX = viewPort.width();
    zoomViewPortY = viewPort.height();

    $('.zoomedIn .top').hover(ZoomArrowScroll.startScroll, ZoomArrowScroll.stopScroll);
    $('.zoomedIn .left').hover(ZoomArrowScroll.startScroll, ZoomArrowScroll.stopScroll);
    $('.zoomedIn .bottom').hover(ZoomArrowScroll.startScroll, ZoomArrowScroll.stopScroll);
    $('.zoomedIn .right').hover(ZoomArrowScroll.startScroll, ZoomArrowScroll.stopScroll);
};
ZoomArrowScroll.startScroll = function () {

    var delay = 1500;
    var t = 0;
    var l = 0;
    switch ($(this).attr('class')) {
        case 'top':
            t = 0;
            zoomArrowTarget.animate({ top: '0px' }, delay);
            break;
        case 'left':
            l = 0;
            zoomArrowTarget.animate({ left: '0px' }, delay);
            break;
        case 'right':
            var left = zoomViewPortX - zoomArrowTarget.width();
            if (left >= 0) left = 0;
            if (zoomViewPortX < 620) left = left + (620 - zoomViewPortX); // Offset smaller viewports
            l = left;
            zoomArrowTarget.animate({ left: left + 'px' }, delay);
            break;
        case 'bottom':
            var top = zoomViewPortY - zoomArrowTarget.height();
            if (top >= 0) top = 0;
            if (zoomViewPortX < 692) left = left + (692 - zoomViewPortX); // Offset smaller viewports
            t = top;
            zoomArrowTarget.animate({ top: top + 'px' }, delay);
            break;
    }

    parent.$("#coords").text("top:" + t + "," +
    "left:" + l + "," +
    "zoomViewPortX:" + zoomViewPortX + "," +
    "zoomViewPortY:" + zoomViewPortY + "," +
    "zoomArrowTarget.width():" + zoomArrowTarget.width() + "," +
    "zoomArrowTarget.height():" + zoomArrowTarget.height() + ",");
};
ZoomArrowScroll.stopScroll = function () {
    zoomArrowTarget.stop();
};
/* END: Zoom Arrow Scroll */

/* BEGIN: Fullscreen */
var Fullscreen = {};
Fullscreen.init = function () {
    $('div#fullscreenOverlay').click(function () { Fullscreen.close(); });
    $('div#fullscreen .fullscreenHeader .fullscreenClose').click(function () { Fullscreen.close(); });
    Fullscreen.onLoadImage();

    $(window).resize(function () {
        Fullscreen.setZoomConstraints();
        Fullscreen.checkZoom();
    });    
};
Fullscreen.checkZoom = function () {
    var zoomedIn = $('div#fullscreen .zoomedIn');
    var viewPort = $('div#fullscreen .fullscreenViewPort');
    
    if ($(document).width() >= $(window).width()) { // Horizontal scroll bar so reposition arrows.            
        Fullscreen.positionZoomArrows(zoomedIn, viewPort);
    }

    zoomViewPortX = viewPort.width();
    zoomViewPortY = viewPort.height();
};
Fullscreen.open = function () {
    IFrameGallery.stopSlideshow();

    parent.$('div#fullscreenOverlay').show();
    if (parent.$('div.fullscreenMagnifiyImage img').attr('src') == '/_/img/1x1.gif') {
        parent.$('div#fullscreen').attr('data', 'openFullScreen'); // Flag to open full screen after image loaded.        
        // Download the large images        
        ImageSettingsHelper.downloadLargeImages();
        ImageSettingsHelper.loadingIFrame.hide();
    }
    else {
        Fullscreen.showFullscreen();
    }
};
Fullscreen.close = function () {
    $('div#fullscreenOverlay').hide();
    $('div#fullscreen').css('margin-top', '-2000px');
};
Fullscreen.showFullscreen = function () {
    // Set opacity and z-index as you can't set display=none else width and height methods don't work - that's why we hide the fullscreen outside the window        
    parent.$('div#fullscreen').animate({ 'margin-top': '0px' }, 0, function () { Fullscreen.checkZoom(); });
};
Fullscreen.onLoadImage = function () {
    var image = parent.$('div#fullscreen .fullscreenViewPort .fullscreenMagnifiyImage img');
    var processImage = function () { // Only once image has been loaded        

        if (image.attr("src") == "/_/img/1x1.gif") {
            return;
        }
        ImageSettingsHelper.fullscreenImageLoadedProcess();
        Fullscreen.setZoomConstraints();
        if (parent.$('div#fullscreen').attr('data') == 'openFullScreen') {
            parent.$('div#fullscreen').attr('data', '');
            Fullscreen.showFullscreen();
        }
        var viewPort = $('div#fullscreen .fullscreenViewPort');
        viewPort.mapbox({ zoom: false, pan: true });
    };

    image.load(processImage);


};
Fullscreen.setZoomConstraints = function () {

    var full = $('div#fullscreen');
    var zoomedIn = $('div#fullscreen .zoomedIn');
    var viewPort = $('div#fullscreen .fullscreenViewPort');
    var imageContainer = $('div#fullscreen .fullscreenViewPort .fullscreenMagnifiyImage');
    var image = $('div#fullscreen .fullscreenViewPort .fullscreenMagnifiyImage img');

    // Set image container to image size
    imageContainer.width(image.width());
    imageContainer.height(image.height());

    // Set view port size
    var w = image.width() > viewPort.width() ? viewPort.width() : image.width();
    if (w < $(window).width() && w < image.width()) w = image.width();
    if (w > $(window).width()) w = $(window).width();
    var h = image.height() > viewPort.height() ? viewPort.height() : image.height();
    if (h < $(window).height() && h < image.height()) h = image.height();
    if (h > $(window).height()) h = $(window).height();
    viewPort.width(w);
    viewPort.height(h);

    // Set full screen window height
    full.height(viewPort.height() + 45);

    // Set the zoom arrow positions
    Fullscreen.positionZoomArrows(zoomedIn, viewPort);   
};
Fullscreen.positionZoomArrows = function (zoomedIn, viewPort) {
    var top = $('.top', zoomedIn);
    var left = $('.left', zoomedIn);
    var right = $('.right', zoomedIn);
    var bottom = $('.bottom', zoomedIn);
    var midX = (viewPort.width()) / 2 - (top.width() / 2);
    var midY = (viewPort.height()) / 2 - (left.height() / 2);
    var bottomTop = (viewPort.height() + 45) - bottom.height();
    if (bottomTop >= $(window).height()) bottomTop = $(window).height() - bottom.height();
    top.css('left', midX + 'px');
    left.css('top', midY + 'px');
    right.css('top', midY + 'px');
    right.css('left', viewPort.width() - right.width() + 'px');
    bottom.css('left', midX + 'px');
    bottom.css('top', bottomTop + 'px');
    zoomedIn.show();   
};
/* END: Fullscreen */

/* BEGIN: Review Sidebar */
WIRED.InitThreeColumnArticleListing = function () {
    var img = $(".articleList > li:first img:first");
    var pos = img.parents(".image").position();
    var y = pos.top;
    if (!img.hasClass("portrait_14_309"))
        y = pos.top + img.outerHeight(true);


    $(".sidebar").css("top", y + "px").show();
};
/* END: Review Sidebar */

/* BEGIN: Equalise height */
// set the height of all elements passed in to the height of the highest element in the collection
WIRED.equaliseHeight = function (elements) {
    if (elements && elements.length > 1) {
        var maxHeight = 0;
        for (var count = 0; count < elements.length; count++) {
            if ($(elements[count]).innerHeight() > maxHeight) {
                maxHeight = $(elements[count]).innerHeight();
            }
        }
        for (var count = 0; count < elements.length; count++) {
            $(elements[count]).css("height", maxHeight);
        }
    }
};
/* END: Equalise height */

/* BEGIN: Tab menu */
WIRED.relTabMenu = function (menuElements, intSelectedIndex) {
    if (typeof(intSelectedIndex) == "undefined")
    {
        intSelectedIndex = 0;
    }
    if (menuElements && menuElements.length > 0) {
        $(menuElements).each(
            function (menuElementIndex, menuElement) {
                $(menuElement).children().each(
                    function (index, element) {
                        if (index == intSelectedIndex) {
                            // the first menu item becomes "selected"
                            $(element).addClass("selected");
                        } else {
                            // other menu items have their related content hidden
                            $("#" + $(element).attr("data-relatedcontent")).hide();
                        }
                        // remove the href from any anchors in this menu item
                        $(element).find("a").removeAttr("href");
                        // add cursor style for this element
                        $(element).css("cursor", "pointer");
                        // add click event
                        $(element).click(
                            function () {
                                if ($(this).hasClass("selected")) {
                                    // don't do anything if the user has clicked on an already selected menu item
                                    return;
                                }
                                $(this).siblings().each(
                                    function (index, element) {
                                        // other menu items have their related content hidden
                                        $("#" + $(element).attr("data-relatedcontent")).hide();
                                    }
                                );
                                // de-select the selected menu item
                                $(this).siblings(".selected").removeClass("selected");
                                // display the related content of the clicked item
                                $("#" + $(this).attr("data-relatedcontent")).show();
                                // select the clicked item
                                $(this).addClass("selected");
                            }
                        );
                    }
                );
            }
        );
    }
};
/* END: Tab menu */
$(function () { WIRED.relTabMenu($(".mostPopular ul,.twitterFeeds .menu")); });
/* BEGIN: Email signup control */
WIRED.EmailSignupInit = function () {
    if ($.deparam.querystring()["submitted"] == "1") {
        $('.emailSignup .beforeSubmit').hide();
        $('.emailSignup .afterSubmit').show();
    }

    $('.emailSignup input, .emailSignup textarea').keydown(function () {
        $(this).prev().removeClass('redify');
    });

    $('#emailSignupSubmitButton').click(function () {
        var emailRegex = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
        var errors = false;

        if (!emailRegex.test($('#emailSignupEmailAddress').val())) {
            $('#emailSignupEmailAddress').prev().addClass('redify');
            errors = true;

        }
        if ($('#emailSignupName').val() == "") {
            $('#emailSignupName').prev().addClass('redify');
            errors = true;
        }
        if ($('#emailFeedback').length > 0) {
            if ($('#emailFeedback').val() == "") {
                $('#emailFeedback').prev().addClass('redify');
                errors = true;
            }
        }

        if (!errors) {
            document.getElementById("aspnetForm").setAttribute("action", "http://services.condenastinteractive.co.uk/FormCapture/");
            document.getElementById("__VIEWSTATE").parentNode.removeChild(document.getElementById("__VIEWSTATE"));
            document.forms['aspnetForm'].submit();
        }
        return false;
    });
};    
/* END: Email signup control */
/* BEGIN: Competitions */
var COMPS = {};

COMPS.Initialise = function (isInternational, isFreeText) {
    // remember settings
    COMPS.isInternational = isInternational;
    COMPS.isFreeText = isFreeText;
    // preload the elements we are going to need
    COMPS.Elements = {};

    COMPS.Elements.questionsWrapper = $(".questionsWrapper");
    COMPS.Elements.tAnswer = $("[id$=tAnswer]");
    COMPS.Elements.rAnswer = $(".questionsWrapper :radio");
    COMPS.Elements.SubmitStep1 = $(".submitStep1 a");

    COMPS.Elements.yourDetailsWrapper = $(".yourDetailsWrapper");
    COMPS.Elements.tFirstName = $("[id$=tFirstName]");
    COMPS.Elements.tSurname = $("[id$=tSurname]");
    COMPS.Elements.tEmailAddress = $("[id$=tEmailAddress]");
    COMPS.Elements.dDobDay = $("[id$=dDobDay]");
    COMPS.Elements.dDobMonth = $("[id$=dDobMonth]");
    COMPS.Elements.dDobYear = $("[id$=dDobYear]");
    COMPS.Elements.dGender = $("[id$=dGender]");
    COMPS.Elements.tCountry = $("[id$=tCountry]");
    COMPS.Elements.tAddress = $("[id$=tAddress]");
    COMPS.Elements.tTown = $("[id$=tTown]");
    COMPS.Elements.tCounty = $("[id$=tCounty]");
    COMPS.Elements.tPostcode = $("[id$=tPostcode]");
    COMPS.Elements.chkAgreeTerms = $("[id$=chkAgreeTerms]");
    COMPS.Elements.recaptcha_response_field = $("[id$=recaptcha_response_field]");

    COMPS.Elements.SubmitStep2 = $(".submitStep2 input");

    COMPS.Elements.TermsContainer = $("#TermsAndConditions");
    COMPS.Elements.TermsLink = $("label[for$=chkAgreeTerms] a");

    // wire events
    COMPS.Elements.SubmitStep1.click(COMPS.SubmitStep1_click);    

    // set up T's & C's stuff
    COMPS.Elements.TermsLink.removeAttr("href");
    COMPS.Elements.TermsLink.colorbox({ width: "50%", inline: true, href: "#TermsAndConditions" });
};

COMPS.validateCaptcha = function (source, arguments) {
    arguments.IsValid = $(COMPS.Elements.recaptcha_response_field).val().length > 0;
    if (!arguments.IsValid) {
        COMPS.ValidateField(COMPS.Elements.recaptcha_response_field);
    }
    arguments.IsValid = COMPS.SubmitStep2() && arguments.IsValid;
    if (!arguments.IsValid) COMPS.DisplayValidationErrorMessage();
};

COMPS.SubmitStep1_click = function () {
    if (COMPS.ValidateStep1()) {
        COMPS.Elements.questionsWrapper.hide();
        COMPS.Elements.yourDetailsWrapper.show();
    }
};

COMPS.SubmitStep2 = function () {
    var validControls = COMPS.ValidateStep2();

    // Validate email address
    var validEmail = COMPS.Elements.tEmailAddress.next("span").attr("style").indexOf("visible") == -1;
    if (!validEmail) {
        COMPS.DisplayValidation(COMPS.Elements.tEmailAddress, false);
        COMPS.Elements.tEmailAddress.next("span").attr("style", "display:none");
    }
        
    return validControls && validEmail;
};

COMPS.ValidateStep1 = function () {
    var isValid = false;

    if (COMPS.isFreeText) {
        var elements = [COMPS.Elements.tAnswer];
        isValid = COMPS.ValidateFields(elements);
    }
    else {
        var val = COMPS.Elements.rAnswer.filter(":checked").val();
        isValid = val != null && val != "";
    }

    if (!isValid) COMPS.DisplayValidationErrorMessage();
    return isValid;
};

COMPS.ValidateStep2 = function () {
    var elements = [COMPS.Elements.tFirstName, COMPS.Elements.tSurname, COMPS.Elements.tEmailAddress, COMPS.Elements.dDobDay, COMPS.Elements.dDobMonth, COMPS.Elements.dDobYear, COMPS.Elements.dGender, COMPS.Elements.tAddress, COMPS.Elements.tTown, COMPS.Elements.tCounty, COMPS.Elements.tPostcode, COMPS.Elements.chkAgreeTerms];
    if (COMPS.isInternational) elements.push(COMPS.Elements.tCountry);
    var isValid = COMPS.ValidateFields(elements);    
    return isValid;
};

COMPS.ValidateFields = function (elements) {

    var allValid = true;

    for (var i = 0; i < elements.length; i++) {
        var element = elements[i];
        var thisValid = COMPS.ValidateField(element);
        allValid = allValid && thisValid;
    }

    return allValid;
}

COMPS.ValidateField = function (element) {

    var isValid = false;

    if (element[0].type == "checkbox") {
        isValid = element[0].checked;
    }
    else {
        var val = element.val();
        isValid = val != null && val != "";
    }

    COMPS.DisplayValidation(element, isValid);

    return isValid;
}

COMPS.DisplayValidation = function (element, isValid) {

    if (element[0].type == "checkbox")
        element = element.parent();

    if (isValid)
        element.removeClass("validationError");
    else
        element.addClass("validationError");
}

COMPS.DisplayValidationErrorMessage = function () {
    alert("Please make sure you have filled all fields correctly.");
}
/* Do we really have to put in END: comments? */
function Statistics(umbracoId) {

    this._umbracoId = umbracoId;

    this.logPageView = function () {

        var stats = this;

        var ajaxData = JSON.stringify({
            UmbracoId: stats._umbracoId
        });


        $.ajax({
            url: '/Controllers/Statistics/LogPageView',
            type: 'POST',
            data: ajaxData,
            contentType: "application/json; charset=utf-8",
            dataType: 'json'
        });

    };
}
/* BEGIN: Twitter feed */
$(document).ready(function () {
    $(".tweetfeed .content-box").tweet({
        username: "GQRecommends",
        join_text: "auto",
        avatar_size: null,
        count: 5,
        auto_join_text_default: "",
        auto_join_text_ed: "",
        auto_join_text_ing: "",
        auto_join_text_reply: "",
        auto_join_text_url: "",
        loading_text: "loading tweets...",
        callback: null
    });
});
/* END: Twitter feed */

/* BEGIN: Twitter library */
// This file has been modified by Conde Nast
(function ($) {
    $.fn.tweet = function (o) {
        var s = {
            username: ["seaofclouds"],              // [string]   required, unless you want to display our tweets. :) it can be an array, just do ["username1","username2","etc"]
            list: null,                             // [string]   optional name of list belonging to username
            avatar_size: null,                      // [integer]  height and width of avatar if displayed (48px max)
            count: 3,                               // [integer]  how many tweets to display?
            intro_text: null,                       // [string]   do you want text BEFORE your your tweets?
            outro_text: null,                       // [string]   do you want text AFTER your tweets?
            join_text: null,                        // [string]   optional text in between date and tweet, try setting to "auto"
            auto_join_text_default: "i said,",      // [string]   auto text for non verb: "i said" bullocks
            auto_join_text_ed: "i",                 // [string]   auto text for past tense: "i" surfed
            auto_join_text_ing: "i am",             // [string]   auto tense for present tense: "i was" surfing
            auto_join_text_reply: "i replied to",   // [string]   auto tense for replies: "i replied to" @someone "with"
            auto_join_text_url: "i was looking at", // [string]   auto tense for urls: "i was looking at" http:...
            loading_text: null,                     // [string]   optional loading text, displayed while tweets load
            query: null,                            // [string]   optional search query
            refresh_interval: null,                 // [integer]  optional number of seconds after which to reload tweets
            time_after_tweet: false,                // [boolean]  display the tweet time after the tweet text
            open_links_in_new_windows: false,       // [boolean]  open links in a new window (not recommended)
            search_phrase: null,                    // [string] optional search phrase
            display_from_user: false                // [boolean] optional display name of the tweet author
        };

        if (o) $.extend(s, o);

        $.fn.extend({
            linkUrl: function () {
                var returning = [];
                var regexp = /((ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?)/gi;
                this.each(function () {
                    returning.push(this.replace(regexp, "<a href=\"$1\">$1</a>"));
                });
                return $(returning);
            },
            linkUser: function () {
                var returning = [];
                var regexp = /[\@]+([A-Za-z0-9-_]+)/gi;
                this.each(function () {
                    returning.push(this.replace(regexp, "<a href=\"http://twitter.com/$1\"" + (s.open_links_in_new_windows ? " target=\"_blank\"" : "") + ">@$1</a>"));
                });
                return $(returning);
            },
            linkHash: function () {
                var returning = [];
                var regexp = /(?:^| )[\#]+([A-Za-z0-9-_]+)/gi;
                this.each(function () {
                    returning.push(this.replace(regexp, ' <a href="http://search.twitter.com/search?q=&tag=$1&lang=all' + (s.username != null ? '&from=' + s.username.join("%2BOR%2B") : '') + '"' + (s.open_links_in_new_windows ? " target=\"_blank\"" : "") + '>#$1</a>'));
                });
                return $(returning);
            },
            capAwesome: function () {
                var returning = [];
                this.each(function () {
                    returning.push(this.replace(/\b(awesome)\b/gi, '<span class="awesome">$1</span>'));
                });
                return $(returning);
            },
            capEpic: function () {
                var returning = [];
                this.each(function () {
                    returning.push(this.replace(/\b(epic)\b/gi, '<span class="epic">$1</span>'));
                });
                return $(returning);
            },
            makeHeart: function () {
                var returning = [];
                this.each(function () {
                    returning.push(this.replace(/(&lt;)+[3]/gi, "<tt class='heart'>&#x2665;</tt>"));
                });
                return $(returning);
            }
        });

        function parse_date(date_str) {
            // The non-search twitter APIs return inconsistently-formatted dates, which Date.parse
            // cannot handle in IE. We therefore perform the following transformation:
            // "Wed Apr 29 08:53:31 +0000 2009" => "Wed, Apr 29 2009 08:53:31 +0000"
            return Date.parse(date_str.replace(/^([a-z]{3})( [a-z]{3} \d\d?)(.*)( \d{4})$/i, '$1,$2$4$3'));
        }

        function relative_time(time_value) {
            var parsed_date = parse_date(time_value);
            var relative_to = (arguments.length > 1) ? arguments[1] : new Date();
            var delta = parseInt((relative_to.getTime() - parsed_date) / 1000);
            var r = '';
            if (delta < 60) {
                r = delta + ' seconds ago';
            } else if (delta < 120) {
                r = 'a minute ago';
            } else if (delta < (45 * 60)) {
                r = (parseInt(delta / 60, 10)).toString() + ' minutes ago';
            } else if (delta < (2 * 60 * 60)) {
                r = 'an hour ago';
            } else if (delta < (24 * 60 * 60)) {
                r = '' + (parseInt(delta / 3600, 10)).toString() + ' hours ago';
            } else if (delta < (48 * 60 * 60)) {
                r = 'a day ago';
            } else {
                r = (parseInt(delta / 86400, 10)).toString() + ' days ago';
            }
            return 'about ' + r;
        }

        function build_url() {
            var proto = ('https:' == document.location.protocol ? 'https:' : 'http:');
            if (s.list) {
                return proto + "//api.twitter.com/1/" + s.username[0] + "/lists/" + s.list + "/statuses.json?per_page=" + s.count + "&callback=?";
            } else {
                var query = null;
                if (s.query != null) {
                    query = s.query;
                } else if (s.username != null && s.username.length > 0) {
                    query = "from:" + s.username.join(" OR from:");
                }
                return proto + "//search.twitter.com/search.json?" + (query && query.length > 0 ? "q=" + encodeURIComponent(query) : "") + (s.search_phrase && s.search_phrase.length > 0 ? "&phrase=" + encodeURIComponent(s.search_phrase) : "") + "&rpp=" + s.count + "&callback=?";
            }
        }

        return this.each(function (i, widget) {
            var list = $('<ul class="tweet_list">').appendTo(widget);
            var intro = '<p class="tweet_intro">' + s.intro_text + '</p>';
            var outro = '<p class="tweet_outro">' + s.outro_text + '</p>';
            var loading = $('<p class="loading">' + s.loading_text + '</p>');

            if (typeof (s.username) == "string") {
                s.username = [s.username];
            }

            if (s.loading_text) $(widget).append(loading);
            $(widget).bind("load", function () {
                $.getJSON(build_url(), function (data) {
                    if (s.loading_text) loading.remove();
                    if (s.intro_text) list.before(intro);
                    list.empty();
                    var tweets = (data.results || data);
                    $.each(tweets, function (i, item) {
                        // auto join text based on verb tense and content
                        if (s.join_text == "auto") {
                            if (item.text.match(/^(@([A-Za-z0-9-_]+)) .*/i)) {
                                var join_text = s.auto_join_text_reply;
                            } else if (item.text.match(/(^\w+:\/\/[A-Za-z0-9-_]+\.[A-Za-z0-9-_:%&\?\/.=]+) .*/i)) {
                                var join_text = s.auto_join_text_url;
                            } else if (item.text.match(/^((\w+ed)|just) .*/im)) {
                                var join_text = s.auto_join_text_ed;
                            } else if (item.text.match(/^(\w*ing) .*/i)) {
                                var join_text = s.auto_join_text_ing;
                            } else {
                                var join_text = s.auto_join_text_default;
                            }
                        } else {
                            var join_text = s.join_text;
                        };

                        var from_user = item.from_user || item.user.screen_name;
                        var profile_image_url = item.profile_image_url || item.user.profile_image_url;
                        var join_template = '<span class="tweet_join"> ' + join_text + ' </span>';
                        var join = ((s.join_text) ? join_template : ' ');
                        var avatar_template = '<a class="tweet_avatar" href="http://twitter.com/' + from_user + '"><img src="' + profile_image_url + '" height="' + s.avatar_size + '" width="' + s.avatar_size + '" alt="' + from_user + '\'s avatar" title="' + from_user + '\'s avatar" border="0"/></a>';
                        var avatar = (s.avatar_size ? avatar_template : '');
                        var date = '<span class="tweet_time"><a href="http://twitter.com/' + from_user + '/statuses/' + item.id + '" title="View tweet on twitter"' + (s.open_links_in_new_windows ? " target=\"_blank\"" : "") + '>' + relative_time(item.created_at) + '</a></span>';
                        var text = '<span class="tweet_text">' + $([item.text]).linkUrl().linkUser().linkHash().makeHeart().capAwesome().capEpic()[0] + '</span>';
                        var from_user_text = s.display_from_user ? "<a class=\"tweet_author\" href=\"http://twitter.com/" + from_user + "\" title=\"View " + from_user + " on twitter\"" + (s.open_links_in_new_windows ? " target=\"_blank\"" : "") + ">" + from_user + "</a> " : "";

                        // until we create a template option, arrange the items below to alter a tweet's display.
                        list.append('<li>' + avatar + from_user_text + (s.time_after_tweet ? text + join + date : date + join + text) + '</li>');

                        list.children('li:first').addClass('tweet_first');
                        list.children('li:odd').addClass('tweet_even');
                        list.children('li:even').addClass('tweet_odd');
                    });
                    if (s.outro_text) list.after(outro);
                    $(widget).trigger("loaded").trigger((tweets.length == 0 ? "empty" : "full"));
                    if (s.refresh_interval) {
                        window.setTimeout(function () { $(widget).trigger("load"); }, 1000 * s.refresh_interval);
                    };
                });
            }).trigger("load");
        });
    };
})(jQuery);

WIRED.twitterInit = function(elementSelector, username, searchPhrase) {
    $(function () {
        $(elementSelector).tweet({
            username: username,
            join_text: null,
            count: 3,
            loading_text: "Loading tweets...",
            search_phrase: searchPhrase,
            time_after_tweet: true,
            open_links_in_new_windows: true
        });
    });
};
/* END: Twitter */
/* BEGIN: Promotion buttons */
PROMBUTTONS = {};
PROMBUTTONS.carousel;
PROMBUTTONS.data = new Array();
PROMBUTTONS.getCurrentPageIndex = function () {
    return $("#SidebarPromotions li").index($("#SidebarPromotions .selected"));
};
PROMBUTTONS.init = function () {
    if (PROMBUTTONS.data.length == 0) {
        $("#SidebarPromotions").remove();
        return;
    }
    var data = PROMBUTTONS.data;
    var html = "<h5 class=\"sir\">Promotions</h5><div class=\"contentPlaceholder\"></div><ul class=\"clearfix\">";
    for (var i = 0; i < data.length; i++) {
        html += "<li><img src=\"" + data[i].ThumbnailSrc + "\" /></li>";
    }
    html += "</ul>";
    $("#SidebarPromotions").html(html);
    $("#SidebarPromotions li img").mouseenter(PROMBUTTONS.thumbnail_MouseEnter)
    $("#SidebarPromotions li img").mouseleave(PROMBUTTONS.thumbnail_MouseLeave)
    $("#SidebarPromotions li img").click(PROMBUTTONS.thumbnail_MouseClick)
    PROMBUTTONS.setSelectedPage(Math.floor(Math.random() * data.length));
    if (data.length == 1) {
        $("#SidebarPromotions ul").css("display", "none");
    }
    $("#SidebarPromotions").show();

    PROMBUTTONS.startCarousel();
};
PROMBUTTONS.startCarousel = function () {
    PROMBUTTONS.carousel = setInterval("PROMBUTTONS.moveNextPage()", 3000);
};
PROMBUTTONS.stopCarousel = function () {
    clearInterval(PROMBUTTONS.carousel);
};
PROMBUTTONS.moveNextPage = function () {
    var currentPage = PROMBUTTONS.getCurrentPageIndex();
    var nextPage = currentPage + 1;
    if (nextPage == PROMBUTTONS.data.length) {
        nextPage = 0;
    }
    PROMBUTTONS.setSelectedPage(nextPage);
};
PROMBUTTONS.movePrevPage = function () {
    var currentPage = PROMBUTTONS.getCurrentPageIndex();
    var previousPage = currentPage - 1;
    if (previousPage < 0) {
        previousPage = PROMBUTTONS.data.length - 1;
    }
    PROMBUTTONS.setSelectedPage(previousPage);
};
PROMBUTTONS.setSelectedPage = function (index) {
    if (index != PROMBUTTONS.getCurrentPageIndex()) {
        var data = PROMBUTTONS.data[index];
        if (data != null) {
            $("#SidebarPromotions .contentPlaceholder").fadeOut(200, function () {
                $("#SidebarPromotions .contentPlaceholder").css("display", "hidden");
                $("#SidebarPromotions .contentPlaceholder").html("<a class=\"cropSize0\" href=\"" + data.LinkUrl + "\"><img src=\"" + data.ImgSrc + "\" /></a><div><h6><a href=\"" + data.LinkUrl + "\">" + data.Title + "</a></h6><p><a href=\"" + data.LinkUrl + "\">" + data.Teaser + "</a></p><a class=\"aText\" href=\"" + data.LinkUrl + "\">Read more</a></div>");
                $("#SidebarPromotions .contentPlaceholder").fadeIn(200);
                $($("#SidebarPromotions li").removeAttr("class").get(index)).addClass("selected");
            });
        }
    }
};
PROMBUTTONS.thumbnail_MouseEnter = function () {
    // get the index of the item
    var itemIndex = $("#SidebarPromotions li img").index($(this));
    if (itemIndex != PROMBUTTONS.getCurrentPageIndex()) {
        PROMBUTTONS.setSelectedPage(itemIndex);
    }
    PROMBUTTONS.stopCarousel();
};
PROMBUTTONS.thumbnail_MouseLeave = function () {
    PROMBUTTONS.startCarousel();
};
PROMBUTTONS.thumbnail_MouseClick = function () {
    // get the index of the clicked item
    var itemIndex = $("#SidebarPromotions li img").index($(this));
    var data = PROMBUTTONS.data[itemIndex];
    if (data != null) {
        window.location(data.LinkUrl);
    }
};
$(PROMBUTTONS.init);
/* END: Promotion buttons */

/* BEGIN: Footer */
$(function () {
    $(".siteFooter .legal .closed").click(function () {
        if ($(this).hasClass("closed")) {
            $(this).removeClass("closed").addClass("open");
            $(this).closest(".heightRestrictor").addClass("expand");
            $(this).closest(".colourband2").animate({ height: 89 });
        } else {
            var button = this;
            $(this).closest(".colourband2").animate({ height: 33 }, function () {
                $(button).removeClass("open").addClass("closed");
                $(button).closest(".heightRestrictor").removeClass("expand");
            });
        }
    });
});
/* END: Footer */

/* BEGIN: Ads */
$(function () {
    $(".no-ad").closest(".mpu").css("display", "none");
});
/* END: Ads */

/* BEGIN: Device pixel ratio cookie */

(function () {
    if ((window.location.search || '').toLowerCase().indexOf('cleardpr') >= 0) {
        document.cookie = 'devicePixelRatio=1; expires=Thu, 1 Aug 1999 12:34:56 UTC; path=/';
        console.log('device pixel ratio cookie clear');
    } else {
        var dpr = 1;
        if (typeof window.devicePixelRatio == 'number') {
            dpr = (+(window.devicePixelRatio));
        }
        document.cookie = 'devicePixelRatio=' + dpr + '; expires=Thu, 1 Aug ' + (new Date().getFullYear() + 5) + ' 12:34:56 UTC; path=/';
    }
})();

/* END: Device pixel ratio cookie */

/* BEGIN: SrcTwizzle */
var SrcTwizzle = {};
(function () {
    var resizeTimeoutId;

    $(window).resize(function () {
        if (SrcTwizzle.resizeTimeoutId == null) { //throttle
            SrcTwizzle.resizeTimeoutId = setTimeout(SrcTwizzle.srcTwizzleAll, 100);
        } else {
            SrcTwizzle.queueExtraTimeout = true;
        }
    })
    $(window).load(onLoadTwizzle);

    function onLoadTwizzle() {
        // cookie stuff moved elsewhere
        SrcTwizzle.srcTwizzleAll();
    }
})();
SrcTwizzle.srcTwizzleAll = function () {
    SrcTwizzle.resizeTimeoutId = null;
    if (SrcTwizzle.queueExtraTimeout) {
        SrcTwizzle.queueExtraTimeout = false;
        SrcTwizzle.resizeTimeoutId = setTimeout(SrcTwizzle.srcTwizzleAll, 100);
    }
    //if (!confirm("Can twizzle?")) return;
    $("img.multiImg").each(function (index, elem) {
        SrcTwizzle.srcTwizzle(elem);
    });
}
SrcTwizzle.srcTwizzle = function (img) {
    var $img = $(img);
    var width = $img.width();
    var height = $img.height();
    var sizeData = $img.data("srcSizeData");
    if (sizeData == null) {
        sizeData = [];
        for (var i = 0; i < img.attributes.length; i++) {
            var attr = $(img)[0].attributes[i];
            var name = attr.name;
            if (name.indexOf("data-src") == 0) {
                var values = name.substr(8).split("x");
                sizeData.push({
                    url: attr.value,
                    width: +(values[0]),
                    height: +(values[1])
                });
            }
        }
        $img.data("srcSizeData", sizeData);
    }

    var dpiAwareWidth = width * (window.devicePixelRatio || 1);
    var dpiAwareHeight = height * (window.devicePixelRatio || 1);

    var chosenCropBig = null, chosenCropSmall = null;
    for (var i = 0; i < sizeData.length; i++) {
        var thisCrop = sizeData[i];
        var thisCropDifference = (thisCrop.width - dpiAwareWidth) + (thisCrop.height - dpiAwareHeight);
        if (thisCrop.width >= dpiAwareWidth || thisCrop.height >= dpiAwareHeight) {
            if (chosenCropBig == null) {
                chosenCropBig = thisCrop;
            } else {
                var chosenCropDifference = (chosenCropBig.width - dpiAwareWidth) + (chosenCropBig.height - dpiAwareHeight);
                if (thisCropDifference < chosenCropDifference) {
                    chosenCropBig = thisCrop;
                }
            }
        }
        else {
            if (chosenCropSmall == null) {
                chosenCropSmall = thisCrop;
            } else {
                var chosenCropDifference = (chosenCropSmall.width - dpiAwareWidth) + (chosenCropSmall.height - dpiAwareHeight);
                if (thisCropDifference > chosenCropDifference) {
                    chosenCropSmall = thisCrop;
                }
            }
        }
    }

    var finalCrop;
    var debugInfo;
    if (chosenCropBig != null) {
        finalSrc = chosenCropBig.url;
        finalCrop = chosenCropBig;
        if (window.DEBUG_FLAG && chosenCropBig.width > width) {
            debugInfo = "#0f0";
        }
    } else if (chosenCropSmall != null) {
        finalSrc = chosenCropSmall.url;
        finalCrop = chosenCropSmall;
        if (window.DEBUG_FLAG && chosenCropSmall.width > width) {
            debugInfo = "#f00";
        }
    } else {
        finalSrc = null;
    }
    if (finalSrc != null) {
        var existingSrc = $img.attr("src");
        if (existingSrc != finalSrc) $img.attr("src", finalSrc);
    }
    if (window.DEBUG_FLAG) {
        var randomId = $img.data("srcTwizzleDebugId") || (Math.random() + "").substr(2);
        $img.data("srcTwizzleDebugId", randomId);
        $("#SrcTwizzleDebug" + randomId).remove();

        var debugLeft = $img.offset().left + $img.width() / 2;
        var debugTop = $img.offset().top + $img.height() / 2;
        $("body").append($("<div/>").
            attr("id", "SrcTwizzleDebug" + randomId).
            css("position", "absolute").
            css("top", debugTop).
            css("left", debugLeft).
            css("background", debugInfo || "#ff0").
            css("font-size", "8px").
            html(width + "x" + height + "<br />[" + (finalCrop ? (finalCrop.width + "x" + finalCrop.height) : "NoCrop") + "]")
        );
    }
}
/* END: SrcTwizzle */