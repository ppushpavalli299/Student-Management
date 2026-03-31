using StudentService as service from '../../srv/student-service';
annotate service.Students with @(
    UI.FieldGroup #GeneralGroup : {
        $Type: 'UI.FieldGroupType',
        Data : [
            { $Type: 'UI.DataField', Label: 'FirstName', Value: firstName },
            { $Type: 'UI.DataField', Label: 'LastName', Value: lastName },
            { $Type: 'UI.DataField', Label: 'FullName', Value: fullName },
            { $Type: 'UI.DataField', Label: 'Gender', Value: gender },
            { $Type: 'UI.DataField', Label: 'DOB', Value: dateOfBirth },
            { $Type: 'UI.DataField', Label: 'Email', Value: email }
        ]
    },
    UI.FieldGroup #DetailsGroup : {
        $Type: 'UI.FieldGroupType',
        Data : [
            { $Type: 'UI.DataField', Label: 'Father Name', Value: details.fatherName },
            { $Type: 'UI.DataField', Label: 'Mother Name', Value: details.motherName },
            { $Type: 'UI.DataField', Label: 'Guardian', Value: details.guardian },
            { $Type: 'UI.DataField', Label: 'Notes', Value: details.notes }
        ]
    },
    UI.Facets : [

        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'GeneralFacet',
            Label : 'General Information',
            Target: '@UI.FieldGroup#GeneralGroup'
        },

        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'AddressFacet',
            Label : 'Addresses',
            Target: 'addresses/@UI.LineItem'
        },

        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'DetailsFacet',
            Label : 'Student Details',
            Target: '@UI.FieldGroup#DetailsGroup'
        }

    ],
    UI.LineItem : [
        { $Type: 'UI.DataField', Label: 'FirstName', Value: firstName },
        { $Type: 'UI.DataField', Label: 'LastName', Value: lastName },
        { $Type: 'UI.DataField', Label: 'FullName', Value: fullName },
        { $Type: 'UI.DataField', Label: 'Gender', Value: gender },
        { $Type: 'UI.DataField', Label: 'DOB', Value: dateOfBirth },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'StudentService.EntityContainer/uploadExcel',
            Label : 'uploadExcel',
        },
    ],
    UI.SelectionFields : [
        fullName,
        gender,
    ],

);
annotate service.StudentAddress with @(

    UI.FieldGroup #AddressGroup : {
        $Type: 'UI.FieldGroupType',
        Data : [
            { $Type: 'UI.DataField', Label: 'Street Name', Value: streetName },
            { $Type: 'UI.DataField', Label: 'Region', Value: region },
            { $Type: 'UI.DataField', Label: 'Country', Value: country },
            { $Type: 'UI.DataField', Label: 'Postal Code', Value: postalCode },
            { $Type: 'UI.DataField', Label: 'Phone Number', Value: phoneNumber },
            { $Type: 'UI.DataField', Label: 'Email', Value: email }
        ]
    },

    UI.LineItem : [
        { $Type: 'UI.DataField', Label: 'Street Name', Value: streetName },
        { $Type: 'UI.DataField', Label: 'Region', Value: region },
        { $Type: 'UI.DataField', Label: 'Country', Value: country },
        { $Type: 'UI.DataField', Label: 'Postal Code', Value: postalCode },
        { $Type: 'UI.DataField', Label: 'Phone Number', Value: phoneNumber },
        { $Type: 'UI.DataField', Label: 'Email', Value: email }
    ]

);
annotate service.StudentDetails with @(

    UI.LineItem : [
        { $Type: 'UI.DataField', Label: 'Father Name', Value: fatherName },
        { $Type: 'UI.DataField', Label: 'Mother Name', Value: motherName },
        { $Type: 'UI.DataField', Label: 'Guardian', Value: guardian },
        { $Type: 'UI.DataField', Label: 'Notes', Value: notes }
    ]

);
annotate service.Students with {
    fullName @Common.Label : 'fullName'
};

annotate service.Students with {
    gender @Common.Label : 'gender'
};

