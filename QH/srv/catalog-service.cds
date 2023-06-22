using {emp} from './external/emp';
using {zhr_person_extn_srv} from './external/zhr_person_extn_srv';
using qh.employees as my from '../db/schema';

service CatalogService {

    //@requires: 'authenticated-user'
    @readonly
    entity PersonSrv                  as projection on my.PersonDataEnt;

    @readonly
    //@requires: 'authenticated-user'
    entity Employees                  as projection on emp.zpersdata;

    @cds.redirection.target //DELETE DUPLICATE ENTITIES
    entity QHPosition                 as projection on zhr_person_extn_srv.PositionSet;
    entity QHPersonIdentity           as projection on zhr_person_extn_srv.PersonIdentitySet;
    entity QHPersonnelAssignments     as projection on zhr_person_extn_srv.PersonnelAssignmentsSet;
    entity PersonProfileContact       as projection on zhr_person_extn_srv.PersonProfileContactSet;
    entity PersonProfleQualifications as projection on zhr_person_extn_srv.PersonProfleQualificationsSet;
    entity Position                   as projection on zhr_person_extn_srv.PositionSet;

    entity personDetail               as
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

    entity PersonProfileTask          as
        select from zhr_person_extn_srv.PersonProfileTaskSet as personItems
        left join PersonProfleQualifications
            on  personItems.pan = PersonProfleQualifications.pan
            and personItems.pid = PersonProfleQualifications.pid
        {
            personItems.due                       as due,
            PersonProfleQualifications.positionId as positionId
        };

    @readonly
    //@requires: 'authenticated-user'
    entity personItems                as projection on my.personItems
}
