sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'qh/dap/feprojectui/test/integration/FirstJourney',
		'qh/dap/feprojectui/test/integration/pages/EmployeesList',
		'qh/dap/feprojectui/test/integration/pages/EmployeesObjectPage'
    ],
    function(JourneyRunner, opaJourney, EmployeesList, EmployeesObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('qh/dap/feprojectui') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheEmployeesList: EmployeesList,
					onTheEmployeesObjectPage: EmployeesObjectPage
                }
            },
            opaJourney.run
        );
    }
);