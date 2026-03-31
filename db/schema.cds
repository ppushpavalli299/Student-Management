namespace ec.masters;

using {
    cuid,
    managed
} from '@sap/cds/common';

entity Student : cuid, managed {
    firstName   : String(50);
    lastName    : String(50) @mandatory;
    fullName    : String(100);
    gender      : String(10);
    dateOfBirth : Date;
    email       : String(100);

    // Composition: Student → Addresses
    addresses   : Composition of many StudentAddress
                      on addresses.parent = $self;

    // Optional: Student → Details (1:1)
    details     : Composition of one StudentDetails
                      on details.parent = $self;
}

entity StudentAddress : cuid, managed {
    streetName  : String(100);
    region      : String(50);
    country     : String(50);
    postalCode  : String(20);
    phoneNumber : String(20);
    email       : String(100);

    parent      : Association to Student;
}

entity StudentDetails : cuid, managed {
    parent     : Association to Student;
    fatherName : String(100);
    motherName : String(100);
    guardian   : String(100);
    notes      : String(255);
}

entity ExcelFiles {
    key ID       : UUID;
        fileName : String;
        content  : LargeBinary;
        mimeType : String;
}
