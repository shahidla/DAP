sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'uiproject/test/integration/FirstJourney',
		'uiproject/test/integration/pages/personDetailList',
		'uiproject/test/integration/pages/personDetailObjectPage'
    ],
    function(JourneyRunner, opaJourney, personDetailList, personDetailObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('uiproject') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onThepersonDetailList: personDetailList,
					onThepersonDetailObjectPage: personDetailObjectPage
                }
            },
            opaJourney.run
        );
    }
);