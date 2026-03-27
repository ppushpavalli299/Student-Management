sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"webapp/student/test/integration/pages/StudentsList",
	"webapp/student/test/integration/pages/StudentsObjectPage"
], function (JourneyRunner, StudentsList, StudentsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('webapp/student') + '/test/flpSandbox.html#webappstudent-tile',
        pages: {
			onTheStudentsList: StudentsList,
			onTheStudentsObjectPage: StudentsObjectPage
        },
        async: true
    });

    return runner;
});

