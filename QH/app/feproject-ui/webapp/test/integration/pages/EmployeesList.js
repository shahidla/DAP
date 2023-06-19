sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'qh.dap.feprojectui',
            componentId: 'EmployeesList',
            entitySet: 'Employees'
        },
        CustomPageDefinitions
    );
});