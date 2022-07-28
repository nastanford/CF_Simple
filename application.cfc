component {

    this.name = "cf_simple";
    this.applicationTimeout = CreateTimeSpan(10, 0, 0, 0); //10 days
    this.datasource = "cfbookclub";
    this.sessionManagement = true;
    this.sessionTimeout = CreateTimeSpan(0, 0, 30, 0); //30 minutes

    if(!ListGetAt(cgi.script_name,ListLen(cgi.script_name,'/'),'/') eq 'index.cfm'){
      location(url="index.cfm/main/index"); 
    }


    // this.customTagPaths = [ expandPath('/myAppCustomTags') ];
    // this.mappings = {
    //     "/foo" = expandPath('/com/myCompany/foo')
    // };

    function onApplicationStart() {
        return true;
    }

    function onSessionStart() {}

    // the target page is passed in for reference,
    // but you are not required to include it
    function onRequestStart( string targetPage ) {
    /* default event - Handler.Action */
    request.default_event = 'main.index';      
    }

    function onRequest( string targetPage ) {
        include arguments.targetPage;        
    }

    function onRequestEnd() {}

    function onSessionEnd( struct SessionScope, struct ApplicationScope ) {}

    function onApplicationEnd( struct ApplicationScope ) {}

    function onError( any Exception, string EventName ) {}

}