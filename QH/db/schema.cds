namespace qh.employees;

using {zhr_person_extn_srv} from '../srv/external/zhr_person_extn_srv';

@cds.persistence.exists
entity PersonDataEnt {
    key pid      : String;
    key pan      : String;
    name     : String;
    key position : String;
    posname  : String;
    ahpra    : String;
    expirydate  : String;
    work    : String;
    mobile   : String;
    email    : String;


} 

//@cds.persistence.exists
entity Position    as projection on zhr_person_extn_srv.PositionSet {
    key PersonNumber              as PersonNumber,
        PersonnelAssignmentNumber as PersonnelAssignmentNumber,
        PositionNumber            as PositionNumber,
        PositionName              as PositionName,
        Persons : Association to personItems on Persons.PersonNumber = PersonNumber
}

//@cds.persistence.exists
entity personItems as projection on zhr_person_extn_srv.PersonSet {
    key PersonSet.PersonNumber as PersonNumber,
        PersonSet.PersonName   as PersonName,
        assignMents : Association to many Position on assignMents.PersonNumber = PersonNumber
}
