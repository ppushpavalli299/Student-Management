sap.ui.define([
    "sap/ui/core/mvc/Controller"
], function (Controller) {
    "use strict";

    return Controller.extend("webapp.student.controller.Dashboard", {
        onInit() { },

        onStudentsTilePress: function () {
            const oRouter = this.getOwnerComponent().getRouter();
            oRouter.navTo("StudentsList", { layout: "TwoColumnsMidExpanded" });
        },

        onCourseTilePress: function () {
            this.getOwnerComponent().getRouter().navTo("StudentsTotalCoursesPage");
        }

    });
});