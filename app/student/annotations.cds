using StudentService as service from '../../srv/student-service';


// ─── STUDENTS ────────────────────────────────────────────────────────────────
annotate service.Students with {

    //CRITICAL: Hide auto-generated section for association
    details @UI.Hidden;

};

annotate service.Students with @(

    // ✅ ONLY General Info
    UI.FieldGroup #GeneralGroup : {
        $Type: 'UI.FieldGroupType',
        Data : [
            { $Type: 'UI.DataField', Label: 'First Name', Value: firstName },
            { $Type: 'UI.DataField', Label: 'Last Name',  Value: lastName },
            { $Type: 'UI.DataField', Label: 'Full Name',  Value: fullName },
            { $Type: 'UI.DataField', Label: 'Gender',     Value: gender },
            { $Type: 'UI.DataField', Label: 'DOB',        Value: dateOfBirth },
            { $Type: 'UI.DataField', Label: 'Email',      Value: email }
        ]
    },

    // ✅ ONLY 2 SECTIONS (IMPORTANT)
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'General Information',
            Target: '@UI.FieldGroup#GeneralGroup'
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Addresses',
            Target: 'addresses/@UI.LineItem'
        }
    ],

    UI.LineItem : [
        { $Type: 'UI.DataField', Value: firstName },
        { $Type: 'UI.DataField', Value: lastName },
        { $Type: 'UI.DataField', Value: fullName },
        { $Type: 'UI.DataField', Value: gender },
        { $Type: 'UI.DataField', Value: dateOfBirth },
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
    fullName @Common.Label: 'Full Name';
    gender   @Common.Label: 'Gender';
};



// ─── STUDENT ADDRESS ─────────────────────────────────────────────────────────
annotate service.StudentAddress with @(

    // Address Info
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

    //Student Details (FROM PARENT)
    UI.FieldGroup #StudentInfoGroup : {
        $Type: 'UI.FieldGroupType',
        Data : [
            { $Type: 'UI.DataField', Label: 'Father Name', Value: parent.details.fatherName },
            { $Type: 'UI.DataField', Label: 'Mother Name', Value: parent.details.motherName },
            { $Type: 'UI.DataField', Label: 'Guardian',    Value: parent.details.guardian },
            { $Type: 'UI.DataField', Label: 'Notes',       Value: parent.details.notes }
        ]
    },

    // 2 Sections in Address Page
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Address Details',
            Target: '@UI.FieldGroup#AddressGroup'
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Student Details',
            Target: '@UI.FieldGroup#StudentInfoGroup'
        }
    ],

    UI.LineItem : [
        { $Type: 'UI.DataField', Value: streetName },
        { $Type: 'UI.DataField', Value: region },
        { $Type: 'UI.DataField', Value: country },
        { $Type: 'UI.DataField', Value: postalCode },
        { $Type: 'UI.DataField', Value: phoneNumber },
        { $Type: 'UI.DataField', Value: email }
    ]
);



// ─── STUDENT DETAILS (NO UI on Student Page) ──────────────────────────────────
annotate service.StudentDetails with @(

    UI.LineItem : [
        { $Type: 'UI.DataField', Value: fatherName },
        { $Type: 'UI.DataField', Value: motherName },
        { $Type: 'UI.DataField', Value: guardian },
        { $Type: 'UI.DataField', Value: notes }
    ]
);