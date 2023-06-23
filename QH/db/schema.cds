namespace qh.employees;

using {zhr_person_extn_srv} from '../srv/external/zhr_person_extn_srv';

@cds.persistence.exists
entity PersonDataEnt @(odata.key){
    key pid        : String;
    key pan        : String;
        name       : String;
    key position   : String;
        posname    : String;
        ahpra      : String;
        expirydate : String;
        work       : String;
        mobile     : String;
        email      : String;


}

//@cds.persistence.exists
entity Position      as projection on zhr_person_extn_srv.PositionSet {
    key PersonNumber              as PersonNumber,
        PersonnelAssignmentNumber as PersonnelAssignmentNumber,
        PositionNumber            as PositionNumber,
        PositionName              as PositionName,
        Persons : Association to personItems on Persons.PersonNumber = PersonNumber
}

//@cds.persistence.exists
entity personItems   as projection on zhr_person_extn_srv.PersonSet {
    key PersonSet.PersonNumber as PersonNumber,
        PersonSet.PersonName   as PersonName,
        assignMents : Association to many Position on assignMents.PersonNumber = PersonNumber
}
@cds.persistence.exists
entity QHPersonIdentity as projection on zhr_person_extn_srv.PersonIdentitySet;
@cds.persistence.exists
entity PersonProfleQualifications as projection on zhr_person_extn_srv.PersonProfleQualificationsSet;

@cds.persistence.exists
entity personDetail2 as
    select from zhr_person_extn_srv.PersonnelAssignmentsSet as PersonnelAssignments
    left join QHPersonIdentity
        on PersonnelAssignments.PersonNumber = QHPersonIdentity.pid
    left join Position
        on  Position.PersonNumber              = PersonnelAssignments.PersonNumber
        and Position.PersonnelAssignmentNumber = PersonnelAssignments.PersonnelAssignmentNumber
    left join PersonProfleQualifications
        on  PersonProfleQualifications.pid = PersonnelAssignments.PersonNumber
        and PersonProfleQualifications.pan = PersonnelAssignments.PersonnelAssignmentNumber
    {
        key PersonnelAssignments.PersonNumber              as pid,
        key PersonnelAssignments.PersonnelAssignmentNumber as pad,
        key Position.PositionNumber                        as position,
            PersonnelAssignments.FirstName                 as name,
            Position.PositionName                          as posname,
            PersonProfleQualifications.referenceNumber     as ahpra,
            PersonProfleQualifications.empQualifictionEnd  as expirydate,
            QHPersonIdentity.workPhone                     as work,
            QHPersonIdentity.mobilePhone                   as mobile,
            QHPersonIdentity.email                         as email

    };
