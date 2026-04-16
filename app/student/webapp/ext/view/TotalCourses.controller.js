sap.ui.define([
    "sap/fe/core/PageController"
], function (PageController) {
    "use strict";

    return PageController.extend("webapp.student.ext.view.TotalCourses", {
        onInit: function () {
            PageController.prototype.onInit.apply(this, arguments);
        }
    });
});