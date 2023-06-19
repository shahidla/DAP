sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'cap/tutorial/feprojectui/test/integration/FirstJourney',
		'cap/tutorial/feprojectui/test/integration/pages/BooksList',
		'cap/tutorial/feprojectui/test/integration/pages/BooksObjectPage'
    ],
    function(JourneyRunner, opaJourney, BooksList, BooksObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('cap/tutorial/feprojectui') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheBooksList: BooksList,
					onTheBooksObjectPage: BooksObjectPage
                }
            },
            opaJourney.run
        );
    }
);