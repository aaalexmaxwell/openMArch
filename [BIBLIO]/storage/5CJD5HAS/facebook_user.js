// The Facebook library looks for a global named fbAsyncInit.
// If it exists, this function will be executed once the library has been loaded.
// http://developers.facebook.com/docs/?u=facebook.joey.FB

window.fbAsyncInit = function() {
    
    var widget_sizes = {
        activity: {
            signed_in:  {
                width:  298,
                height: 170
            },
            signed_out: {
                width:  298, 
                height: 230
            }
        }
    };

    var activity_template = '<fb:activity header="false" border_color="#FFFFFF" style="display:block"></fb:activity>';
    
    // initialize the library with the API key
    FB.init({
      apiKey : LOVEFiLM.facebook.api_key,
      status : true, // check login status
      cookie : true, // enable cookies to allow the server to access the session
      xfbml  : true  // parse XFBML
    });
    
    FB.Event.subscribe('edge.create', function(href, widget) {
        //Log.info('You liked ' + href, widget);
        // Omniture
        var s = s_gi(s_account);
        s.tl(href,'o',LOVEFiLM.facebook.metric_pagename);
    });

    FB.getLoginStatus(function(response) {
        var isLoggedIn = !!response.session;

        // Dynamically insert widget (variable size depending
        // whether the user is signed into Facebook or not)
        var activityEl = $('h3.FBsocial');
        if (activityEl) {
            insertActivityWidget(activityEl, isLoggedIn);
        }
    });

    var insertActivityWidget = function(activityEl, isLoggedIn){
        var size_key = (isLoggedIn)?'signed_in':'signed_out';
        var size = widget_sizes.activity[size_key];
        if (size) {
            insertWidget(activityEl, size);
        }
    };
    
    var insertWidget = function(activityEl, size) {
        $(activityEl).after(
            $(activity_template).attr({
                height: size.height,
                width:  size.width,
                site:   LOVEFiLM.company_domain
            })
        );
    };

    // fetch the status on load
    // FB.getLoginStatus(FB_handleSessionResponse);
    
    // $('#login').bind('click', function() {
    //     FB.login(FB_handleSessionResponse);
    // });
    
    // $('#logout').bind('click', function() {
    //     FB.logout(FB_handleSessionResponse);
    // });
    
    // $('#disconnect').bind('click', function() {
    //     FB.api({ method: 'Auth.revokeAuthorization' }, function(response) {
    //         FB_clearDisplay();
    //         $('#disconnect').hide();
    //     });
    // });
    
    // no user, clear display
    function FB_clearDisplay() {
        $('#user-info').hide();
        $('#login').show();
    }
    
    
    // handle a session response from any of the auth related calls
    function FB_handleSessionResponse(response) {
        // if we dont have a session, just hide the user info
        if (!response.session) {
            FB_clearDisplay();
            return;
        }
        
        // if we have a session, query for the user's profile picture and name
        FB.api(
            {
                method: 'fql.query',
                query: 'SELECT name, pic FROM profile WHERE id=' + FB.getSession().uid
            },
            function(response) {
                $('#login').hide();
                $('#disconnect').show();
                var user = response[0];
                var string = '';
                $.each(user, function(index, value) {
                    string += '<br />' + index + ': ' + value;
                });
                $('h1').html(user.name).show();
                $('#user-info').html(string + '<p><img src="' + user.pic + '"></p>').show('fast');
            }
        );
    }
};
