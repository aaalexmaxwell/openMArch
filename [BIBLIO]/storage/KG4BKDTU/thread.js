/*jslint evil:true */
/*global DISQUS:false */
/**
 * Dynamic thread loader
 *
 * 
 *  * 
 * 
*/

(function (window) {
    var DISQUS = window.DISQUS;
    var jsonData, cookieMessages, session;

    // 
    if (!DISQUS || typeof DISQUS === 'function') {
        throw "DISQUS object is not initialized";
    }
    // 
    // json_data and default_json django template variables will close
    // and re-open javascript comment tags

    /* */ jsonData = {"reactions": [], "reactions_limit": 10, "ordered_highlighted": [], "posts": {"851436196": {"edited": false, "author_is_moderator": false, "from_request_user": null, "up_voted": false, "can_edit": false, "ip": "", "last_modified_date": null, "dislikes": 0, "raw_message": "Really well thought. Nice work.", "has_replies": false, "vote": false, "votable": true, "last_modified_by": null, "real_date": "2013-04-04_01:19:04", "date": "Today 01:19 AM", "message": "<p>Really well thought. Nice work.</p>", "approved": true, "is_last_child": false, "author_is_founder": false, "can_reply": true, "likes": 0, "user_voted": null, "num_replies": 0, "down_voted": false, "is_first_child": false, "has_been_anonymized": false, "highlighted": false, "parent_post_id": null, "depth": 0, "points": 0, "user_key": "b549e52756dcfd435fe60f3052465fa9", "author_is_creator": false, "email": "", "killed": false, "is_realtime": false}, "851443229": {"edited": false, "author_is_moderator": false, "from_request_user": false, "up_voted": false, "can_edit": false, "ip": "", "last_modified_date": null, "dislikes": 0, "raw_message": "Now you should do one for a luggage on an airline and see what happens...\u00a0 ", "has_replies": false, "vote": false, "votable": true, "last_modified_by": null, "real_date": "2013-04-04_01:38:43", "date": "Today 01:38 AM", "message": "<p>Now you should do one for a luggage on an airline and see what happens...\u00a0 </p>", "approved": true, "is_last_child": false, "author_is_founder": false, "can_reply": true, "likes": 0, "user_voted": null, "num_replies": 0, "down_voted": false, "is_first_child": false, "has_been_anonymized": false, "highlighted": false, "parent_post_id": null, "depth": 0, "points": 0, "user_key": "twitter-14256164", "author_is_creator": false, "email": "", "killed": false, "is_realtime": false}, "851327215": {"edited": false, "author_is_moderator": false, "from_request_user": false, "up_voted": false, "can_edit": false, "ip": "", "last_modified_date": null, "dislikes": 0, "raw_message": "Yea great idea, lets mail a box that has lots of wire inside, maybe make it tick while you are at it?\n\u00a0", "has_replies": false, "vote": false, "votable": true, "last_modified_by": null, "real_date": "2013-04-03_21:23:32", "date": "Yesterday 09:23 PM", "message": "<p>Yea great idea, lets mail a box that has lots of wire inside, maybe make it tick while you are at it?<br>\u00a0</p>", "approved": true, "is_last_child": false, "author_is_founder": false, "can_reply": true, "likes": 0, "user_voted": null, "num_replies": 0, "down_voted": false, "is_first_child": false, "has_been_anonymized": false, "highlighted": false, "parent_post_id": null, "depth": 0, "points": 0, "user_key": "Bulldog_Hero", "author_is_creator": false, "email": "", "killed": false, "is_realtime": false}}, "ordered_posts": [851443229, 851436196, 851327215], "realtime_enabled": true, "ready": true, "mediaembed": [], "has_more_reactions": false, "realtime_paused": false, "integration": {"receiver_url": "http://www.fastcodesign.com/page-not-found", "hide_user_votes": true, "reply_position": false, "disqus_logo": false}, "highlighted": {}, "reactions_start": 0, "media_url": "http://mediacdn.disqus.com/1365023628", "users": {"b549e52756dcfd435fe60f3052465fa9": {"username": "Fake Name Goes Here", "registered": false, "is_remote": false, "facebook": "", "verified": false, "about": "", "display_name": "Fake Name Goes Here", "url": "http://disqus.com/guest/b549e52756dcfd435fe60f3052465fa9/", "remote_id": null, "blog": "", "points": 0, "avatar": "http://mediacdn.disqus.com/1365023628/images/noavatar32.png", "remote_domain": "", "twitter": "", "remote_domain_name": ""}, "Bulldog_Hero": {"username": "Bulldog_Hero", "registered": true, "is_remote": false, "facebook": "", "verified": true, "about": "", "display_name": "Bulldog_Hero", "url": "http://disqus.com/Bulldog_Hero/", "remote_id": null, "blog": "", "points": 168, "avatar": "http://mediacdn.disqus.com/uploads/users/2374/4290/avatar32.jpg?1365038614", "remote_domain": "", "twitter": "", "remote_domain_name": ""}, "twitter-14256164": {"username": "twitter-14256164", "registered": true, "is_remote": true, "facebook": "", "verified": false, "about": "", "display_name": "sleeplessinva", "url": "http://disqus.com/twitter-14256164/", "remote_id": "14256164", "blog": "http://twitter.com/sleeplessinva", "points": 190, "avatar": "http://mediacdn.disqus.com/uploads/users/1356/1851/avatar32.jpg?1365053924", "remote_domain": 2, "twitter": "http://twitter.com/sleeplessinva", "remote_domain_name": "Twitter"}}, "user_unapproved": {}, "messagesx": {"count": 0, "unread": []}, "thread": {"voters_count": 0, "offset_posts": 0, "slug": "watch_a_behind_the_scenes_journey_of_a_door_to_door_package_delivery", "likes": 0, "num_pages": 1, "days_alive": 0, "moderate_none": false, "voters": {}, "total_posts": 3, "realtime_paused": false, "queued": false, "pagination_type": "num", "user_vote": null, "num_posts": 3, "closed": false, "per_page": 40, "id": 1181314336, "killed": false, "moderate_all": false}, "forum": {"use_media": true, "avatar_size": 32, "apiKey": "aWu4jyEb3WVXFH0Ph2Gd2rE4piOzceQGPBqKxkkGkweButQfqxexLTdRenDKKvZW", "features": {"achievements": true, "training": true, "logs": true, "realtime": true, "support_implementation": true, "partner_key": true, "multiauthor_moderation": true, "support_vip": true, "reports": true, "vip_servers": true, "analytics": true, "sso": true, "multisite_admin": true, "uptime": true, "dtpl_editor": true}, "comment_max_words": 0, "mobile_theme_disabled": true, "is_early_adopter": true, "login_buttons_enabled": false, "streaming_realtime": false, "reply_position": false, "id": 313437, "default_avatar_url": "http://mediacdn.disqus.com/1365023628/images/noavatar32.png", "template": {"url": "http://mediacdn.disqus.com/1365023628/uploads/themes/dsq5227b6aaf294f5f027273aebf16015f2.js?39", "mobile": {"url": "http://mediacdn.disqus.com/1365023628/uploads/themes/mobile/theme.js?254", "css": "http://mediacdn.disqus.com/1365023628/uploads/themes/mobile/theme.css?254"}, "api": "1.1", "name": "Co.Design", "css": "http://mediacdn.disqus.com/1365023628/uploads/themes/dsq5227b6aaf294f5f027273aebf16015f2.css?39"}, "max_depth": 1, "ranks_enabled": false, "lastUpdate": 1342640459, "linkbacks_enabled": false, "allow_anon_votes": true, "revert_new_login_flow": false, "stylesUrl": "http://mediacdn.disqus.com/uploads/styles/31/3437/fastcodesign.css", "show_avatar": false, "reactions_enabled": true, "disqus_auth_disabled": false, "name": "Co.Design", "language": "en", "mentions_enabled": true, "url": "fastcodesign", "allow_anon_post": true, "thread_votes_disabled": true, "hasCustomStyles": false, "moderate_all": false}, "settings": {"uploads_url": "http://mediacdn.disqus.com/uploads", "ssl_media_url": "https://securecdn.disqus.com/1365023628", "realtime_url": "http://rt.disqus.com/forums/realtime-cached.js", "facebook_app_id": "52254943976", "minify_js": true, "recaptcha_public_key": "6LdKMrwSAAAAAPPLVhQE9LPRW4LUSZb810_iaa8u", "read_only": false, "facebook_api_key": "52254943976", "juggler_url": "http://juggler.services.disqus.com", "debug": false, "disqus_url": "http://disqus.com", "media_url": "http://mediacdn.disqus.com/1365023628"}, "ranks": {"Bulldog_Hero": null, "twitter-14256164": null}, "request": {"sort": "best", "is_authenticated": false, "user_type": "anon", "subscribe_on_post": 0, "missing_perm": null, "user_id": null, "remote_domain_name": "", "remote_domain": "", "is_verified": false, "profile_url": "", "username": "", "is_global_moderator": false, "sharing": {}, "timestamp": "2013-04-04_06:46:10", "is_moderator": false, "ordered_unapproved_posts": [], "unapproved_posts": {}, "forum": "fastcodesign", "is_initial_load": true, "display_username": "", "points": null, "has_email": false, "moderator_can_edit": false, "is_remote": false, "userkey": "", "page": 1}, "context": {"use_twitter_signin": true, "use_fb_connect": true, "show_reply": true, "sigma_chance": 10, "use_google_signin": true, "switches": {"use_rs_paginator_30m": true, "juggler_enabled": true, "next_realtime_indicators": true, "community_icon": true, "static_styles": true, "stats": true, "website_addons": true, "firehose_gnip_http": true, "discovery_next": true, "show_captcha_on_links": true, "next_dragdrop_nag": true, "firehose_gnip": true, "firehose_pubsub": true, "dark_jester": true, "limit_get_posts_days_30d": true, "juggler_thread_onReady": true, "next_comments_truncation_enabled": true, "discovery_next:top_placement": true, "next_discard_low_rep": true, "upload_media": true, "shardpost:index": true, "filter_ads_by_country": true, "new_sort_paginator": true, "use_rs_paginator_5m": true, "firehose_push": true, "enable_link_affiliation": true, "moz_content_security_policy": true, "shardpost": true, "textdigger_crawler": true, "discovery_analytics": true, "discovery_next:truncate": true, "next_show_new_media": true, "use_rs_paginator_60m": true, "mentions": true, "content_security_policy": true, "limit_textdigger": true}, "forum_facebook_key": "123388861116012", "use_yahoo": true, "subscribed": false, "active_gargoyle_switches": ["community_icon", "content_security_policy", "dark_jester", "discovery_analytics", "discovery_next", "discovery_next:top_placement", "discovery_next:truncate", "enable_link_affiliation", "filter_ads_by_country", "firehose_gnip", "firehose_gnip_http", "firehose_pubsub", "firehose_push", "juggler_enabled", "juggler_thread_onReady", "limit_get_posts_days_30d", "limit_textdigger", "mentions", "moz_content_security_policy", "new_sort_paginator", "next_comments_truncation_enabled", "next_discard_low_rep", "next_dragdrop_nag", "next_realtime_indicators", "next_show_new_media", "shardpost", "shardpost:index", "show_captcha_on_links", "static_styles", "stats", "textdigger_crawler", "use_rs_paginator_30m", "use_rs_paginator_5m", "use_rs_paginator_60m", "website_addons"], "realtime_speed": 15000, "use_openid": true}}; /* */
    /* __extrajson__ */
    cookieMessages = {"user_created": null, "post_has_profile": null, "post_twitter": null, "post_not_approved": null}; session = {"url": null, "name": null, "email": null};

    DISQUS.jsonData = jsonData;
    DISQUS.jsonData.cookie_messages = cookieMessages;
    DISQUS.jsonData.session = session;

    if (DISQUS.useSSL) {
        DISQUS.useSSL(DISQUS.jsonData.settings);
    }

    // The mappings below are for backwards compatibility--before we port all the code that
    // accesses jsonData.settings to DISQUS.settings

    var mappings = {
        debug:                'disqus.debug',
        minify_js:            'disqus.minified',
        read_only:            'disqus.readonly',
        recaptcha_public_key: 'disqus.recaptcha.key',
        facebook_app_id:      'disqus.facebook.appId',
        facebook_api_key:     'disqus.facebook.apiKey'
    };

    var urlMappings = {
        disqus_url:    'disqus.urls.main',
        media_url:     'disqus.urls.media',
        ssl_media_url: 'disqus.urls.sslMedia',
        realtime_url:  'disqus.urls.realtime',
        uploads_url:   'disqus.urls.uploads'
    };

    if (DISQUS.jsonData.context.switches.realtime_setting_change) {
        urlMappings.realtimeHost = 'realtime.host';
        urlMappings.realtimePort = 'realtime.port';
    }
    for (key in mappings) {
        if (mappings.hasOwnProperty(key)) {
            DISQUS.settings.set(mappings[key], DISQUS.jsonData.settings[key]);
        }
    }

    for (key in urlMappings) {
        if (urlMappings.hasOwnProperty(key)) {
            DISQUS.jsonData.settings[key] = DISQUS.settings.get(urlMappings[key]);
        }
    }

    DISQUS.jsonData.context.csrf_token = '21bc467119200cb06806902fa8e2f5b0';

    DISQUS.jsonData.urls = {
        login: 'http://disqus.com/profile/login/',
        logout: 'http://disqus.com/logout/',
        upload_remove: 'http://fastcodesign.disqus.com/thread/watch_a_behind_the_scenes_journey_of_a_door_to_door_package_delivery/async_media_remove/',
        request_user_profile: 'http://disqus.com/AnonymousUser/',
        request_user_avatar: 'http://mediacdn.disqus.com/1365023628/images/noavatar92.png',
        verify_email: 'http://disqus.com/verify/',
        remote_settings: 'http://fastcodesign.disqus.com/_auth/embed/remote_settings/',
        edit_profile_window: 'http://disqus.com/embed/profile/edit/',
        embed_thread: 'http://fastcodesign.disqus.com/thread.js',
        embed_vote: 'http://fastcodesign.disqus.com/vote.js',
        embed_thread_vote: 'http://fastcodesign.disqus.com/thread_vote.js',
        embed_thread_share: 'http://fastcodesign.disqus.com/thread_share.js',
        embed_queueurl: 'http://fastcodesign.disqus.com/queueurl.js',
        embed_hidereaction: 'http://fastcodesign.disqus.com/hidereaction.js',
        embed_more_reactions: 'http://fastcodesign.disqus.com/more_reactions.js',
        embed_subscribe: 'http://fastcodesign.disqus.com/subscribe.js',
        embed_highlight: 'http://fastcodesign.disqus.com/highlight.js',
        embed_block: 'http://fastcodesign.disqus.com/block.js',
        update_moderate_all: 'http://fastcodesign.disqus.com/update_moderate_all.js',
        update_days_alive: 'http://fastcodesign.disqus.com/update_days_alive.js',
        show_user_votes: 'http://fastcodesign.disqus.com/show_user_votes.js',
        forum_view: 'http://fastcodesign.disqus.com/watch_a_behind_the_scenes_journey_of_a_door_to_door_package_delivery',
        cnn_saml_try: 'http://disqus.com/saml/cnn/try/',
        realtime: DISQUS.jsonData.settings.realtime_url,
        thread_view: 'http://fastcodesign.disqus.com/thread/watch_a_behind_the_scenes_journey_of_a_door_to_door_package_delivery/',
        twitter_connect: DISQUS.jsonData.settings.disqus_url + '/_ax/twitter/begin/',
        yahoo_connect: DISQUS.jsonData.settings.disqus_url + '/_ax/yahoo/begin/',
        openid_connect: DISQUS.jsonData.settings.disqus_url + '/_ax/openid/begin/',
        googleConnect: DISQUS.jsonData.settings.disqus_url + '/_ax/google/begin/',
        community: 'http://fastcodesign.disqus.com/community.html',
        admin: 'http://fastcodesign.disqus.com/admin/moderate/',
        moderate: 'http://fastcodesign.disqus.com/admin/moderate/',
        moderate_threads: 'http://fastcodesign.disqus.com/admin/moderate-threads/',
        settings: 'http://fastcodesign.disqus.com/admin/settings/',
        unmerged_profiles: 'http://disqus.com/embed/profile/unmerged_profiles/',
        juggler: DISQUS.jsonData.settings.juggler_url,

        channels: {
            def:      'http://disqus.com/default.html', /* default channel */
            auth:     'https://disqus.com/embed/login.html',
            tweetbox: 'http://disqus.com/forums/integrations/twitter/tweetbox.html?f=fastcodesign',
            edit:     'http://fastcodesign.disqus.com/embed/editcomment.html'
        }
    };


    // 
    //     
    DISQUS.jsonData.urls.channels.reply = 'http://mediacdn.disqus.com/1365023628/build/system/reply.html';
    DISQUS.jsonData.urls.channels.upload = 'http://mediacdn.disqus.com/1365023628/build/system/upload.html';
    DISQUS.jsonData.urls.channels.sso = 'http://mediacdn.disqus.com/1365023628/build/system/sso.html';
    DISQUS.jsonData.urls.channels.facebook = 'http://mediacdn.disqus.com/1365023628/build/system/facebook.html';
    //     
    // 
}(window));
