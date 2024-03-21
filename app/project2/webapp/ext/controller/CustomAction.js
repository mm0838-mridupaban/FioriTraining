sap.ui.define([
    "sap/m/MessageToast"
], function(MessageToast) {
    'use strict';

    return {
        CustomAction: function(oEvent) {
            MessageToast.show("Custom handler invoked.");
        }
    };
});
