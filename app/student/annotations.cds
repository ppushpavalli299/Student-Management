using StudentService as service from '../../srv/student-service';

// ─── STUDENTS ────────────────────────────────────────────────────────────────
annotate service.Students with @(

    UI.FieldGroup #GeneralGroup : {
        $Type: 'UI.FieldGroupType',
        Data : [
            { $Type: 'UI.DataField', Label: 'FirstName', Value: firstName },
            { $Type: 'UI.DataField', Label: 'LastName',  Value: lastName },
            { $Type: 'UI.DataField', Label: 'FullName',  Value: fullName },
            { $Type: 'UI.DataField', Label: 'Gender',    Value: gender },
            { $Type: 'UI.DataField', Label: 'DOB',       Value: dateOfBirth },
            { $Type: 'UI.DataField', Label: 'Email',     Value: email }
        ]
    },

    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'GeneralFacet',
            Label : 'General Information',
            Target: '@UI.FieldGroup#GeneralGroup'   // ✅ tab 1
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'AddressFacet',
            Label : 'Addresses',
            Target: 'addresses/@UI.LineItem'        // ✅ tab 2 → nav to address list
        }
        // ✅ Student Details tab REMOVED from here
    ],

    UI.LineItem : [
        { $Type: 'UI.DataField', Label: 'FirstName', Value: firstName },
        { $Type: 'UI.DataField', Label: 'LastName',  Value: lastName },
        { $Type: 'UI.DataField', Label: 'FullName',  Value: fullName },
        { $Type: 'UI.DataField', Label: 'Gender',    Value: gender },
        { $Type: 'UI.DataField', Label: 'DOB',       Value: dateOfBirth },
        {
            $Type : 'UI.DataFieldForAction',
            Action: 'StudentService.EntityContainer/uploadExcel',
            Label : 'uploadExcel'
        }
    ],

    UI.SelectionFields : [
        fullName,
        gender
    ]
);

annotate service.Students with {
    fullName @Common.Label: 'fullName';
    gender   @Common.Label: 'gender'
};


// ─── STUDENT ADDRESS ─────────────────────────────────────────────────────────
annotate service.StudentAddress with @(

    UI.FieldGroup #AddressGroup : {
        $Type: 'UI.FieldGroupType',
        Data : [
            { $Type: 'UI.DataField', Label: 'Street Name',  Value: streetName },
            { $Type: 'UI.DataField', Label: 'Region',       Value: region },
            { $Type: 'UI.DataField', Label: 'Country',      Value: country },
            { $Type: 'UI.DataField', Label: 'Postal Code',  Value: postalCode },
            { $Type: 'UI.DataField', Label: 'Phone Number', Value: phoneNumber },
            { $Type: 'UI.DataField', Label: 'Email',        Value: email }
        ]
    },

    UI.FieldGroup #StudentInfoGroup : {
        $Type: 'UI.FieldGroupType',
        Data : [
            { $Type: 'UI.DataField', Label: 'Father Name', Value: parent.details.fatherName },
            { $Type: 'UI.DataField', Label: 'Mother Name', Value: parent.details.motherName },
            { $Type: 'UI.DataField', Label: 'Guardian',    Value: parent.details.guardian },
            { $Type: 'UI.DataField', Label: 'Notes',       Value: parent.details.notes }
        ]
    },

    // ✅ Address sub-page: Address Details on top, Student Details below
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'AddressDetailFacet',
            Label : 'Address Details',
            Target: '@UI.FieldGroup#AddressGroup'
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'StudentDetailFacet',
            Label : 'Student Details',
            Target: '@UI.FieldGroup#StudentInfoGroup'
        }
    ],

    UI.LineItem : [
        { $Type: 'UI.DataField', Label: 'Street Name',  Value: streetName },
        { $Type: 'UI.DataField', Label: 'Region',       Value: region },
        { $Type: 'UI.DataField', Label: 'Country',      Value: country },
        { $Type: 'UI.DataField', Label: 'Postal Code',  Value: postalCode },
        { $Type: 'UI.DataField', Label: 'Phone Number', Value: phoneNumber },
        { $Type: 'UI.DataField', Label: 'Email',        Value: email }
    ]
);


// ─── STUDENT DETAILS ─────────────────────────────────────────────────────────
annotate service.StudentDetails with @(

    UI.LineItem : [
        { $Type: 'UI.DataField', Label: 'Father Name', Value: fatherName },
        { $Type: 'UI.DataField', Label: 'Mother Name', Value: motherName },
        { $Type: 'UI.DataField', Label: 'Guardian',    Value: guardian },
        { $Type: 'UI.DataField', Label: 'Notes',       Value: notes }
    ]
);
