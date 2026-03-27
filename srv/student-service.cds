using { ec.masters as db } from '../db/schema';

service StudentService @(requires: 'any') {

    @odata.draft.enabled

    entity Students        as projection on db.Student;
    entity StudentAddress  as projection on db.StudentAddress;
    entity StudentDetails  as projection on db.StudentDetails;

}