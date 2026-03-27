using StudentService as service from '../../srv/student-service';


/* =========================
   STUDENT
========================= */

annotate service.Students with @(

    /* -------- General Field Group -------- */
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

    /* -------- Student Details Field Group (FIXED HERE) -------- */
    UI.FieldGroup #DetailsGroup : {
        $Type: 'UI.FieldGroupType',
        Data : [
            { $Type: 'UI.DataField', Label: 'Father Name', Value: details.fatherName },
            { $Type: 'UI.DataField', Label: 'Mother Name', Value: details.motherName },
            { $Type: 'UI.DataField', Label: 'Guardian', Value: details.guardian },
            { $Type: 'UI.DataField', Label: 'Notes', Value: details.notes }
        ]
    },

    /* -------- Object Page Facets -------- */
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

    /* -------- List Report -------- */
    UI.LineItem : [
        { $Type: 'UI.DataField', Label: 'FirstName', Value: firstName },
        { $Type: 'UI.DataField', Label: 'LastName', Value: lastName },
        { $Type: 'UI.DataField', Label: 'FullName', Value: fullName },
        { $Type: 'UI.DataField', Label: 'Gender', Value: gender },
        { $Type: 'UI.DataField', Label: 'DOB', Value: dateOfBirth }
    ]

);


/* =========================
   STUDENT ADDRESS
========================= */

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


/* =========================
   STUDENT DETAILS (OPTIONAL - NO NAVIGATION)
========================= */

annotate service.StudentDetails with @(

    UI.LineItem : [
        { $Type: 'UI.DataField', Label: 'Father Name', Value: fatherName },
        { $Type: 'UI.DataField', Label: 'Mother Name', Value: motherName },
        { $Type: 'UI.DataField', Label: 'Guardian', Value: guardian },
        { $Type: 'UI.DataField', Label: 'Notes', Value: notes }
    ]

);