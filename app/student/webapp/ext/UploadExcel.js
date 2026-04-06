sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/m/MessageBox",
    "sap/m/MessageToast"
], function (Controller, MessageBox, MessageToast) {
    "use strict";

    return Controller.extend("student.controller.List", {

        onOpenUploadDialog: function () {
            if (!this._oUploadDialog) {
                this._oUploadDialog = this.loadFragment({
                    name: "student.fragments.UploadDialog"
                });
            }
            this._oUploadDialog.then(function (oDialog) {
                oDialog.open();
            });
        },

        onCloseUploadDialog: function () {
            this.byId("uploadDialog").close();
        },

        onFileChange: function (oEvent) {
            const oFile = oEvent.getParameter("files")[0];
            if (oFile) {
                this._selectedFile = oFile;

                if (!this.byId("fileNameInput").getValue()) {
                    this.byId("fileNameInput").setValue(oFile.name);
                }
            }
        },

        onUploadExcel: function () {
            const oFile = this._selectedFile;
            const fileName = this.byId("fileNameInput").getValue();

            if (!oFile) {
                MessageBox.error("Please select a file.");
                return;
            }

            if (!fileName) {
                MessageBox.error("Please enter a file name.");
                return;
            }

            const reader = new FileReader();

            reader.onload = function (e) {
                let base64String = e.target.result;

                // ✅ FIX: remove metadata prefix
                base64String = base64String.split(",")[1];

                console.log("Base64 length:", base64String.length);

                const oModel = this.getView().getModel();
                const oContext = oModel.bindContext("/uploadExcel(...)");

                oContext.setParameter("file", base64String);
                oContext.setParameter("fileName", fileName);

                oContext.execute()
                    .then(() => {
                        const result = oContext.getBoundContext().getObject();
                        MessageToast.show(result.message);

                        this.byId("uploadDialog").close();
                        this._selectedFile = null;
                        this.byId("fileUploader").clear();
                        this.byId("fileNameInput").setValue("");
                    })
                    .catch(err => {
                        MessageBox.error("Upload failed: " + err.message);
                    });

            }.bind(this);

            // ✅ IMPORTANT CHANGE HERE
            reader.readAsDataURL(oFile);
        }
    });
});