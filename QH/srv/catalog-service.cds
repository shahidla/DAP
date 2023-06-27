using {emp} from './external/emp';
using {zhr_person_extn_srv} from './external/zhr_person_extn_srv';
using { empqfl } from './external/empqfl';

service CatalogService {
    entity QHPosition                   as projection on zhr_person_extn_srv.PositionSet;
    entity QHPersonIdentity             as projection on zhr_person_extn_srv.PersonIdentitySet;

    entity QHPersonnelAssignments       as projection on zhr_person_extn_srv.PersonnelAssignmentsSet {
        PersonNumber,
        PersonnelAssignmentNumber,
        FirstName,
        Role,
        PositionNumber,
        PersonFullName,
        LastName,
        PersonName,
        PositionName,
        OrganisationalUnitNumber,
        OrganisationalUnitName,
        PositionNavn,
        PersonProfileAssignmentsSet,
        PersonProfileTaskSet,
        PersonProfleQualificationsSet,
        PersonProfileAllowsSet,
        PersonProfileAwardsSet
    };

    entity QHPersonProfileContact       as projection on zhr_person_extn_srv.PersonProfileContactSet;
    entity QHPersonProfleQualifications as projection on zhr_person_extn_srv.PersonProfleQualificationsSet
    { 
        key pid,
        key pan,
        key positionId,
        key qualificationGroup,
        key qualificationName,
        key referenceNumber,
        requiringPositionTitle
    };    
    @readonly
    entity EHProfleQualifications as projection on empqfl.ZPERSDATA_QFL;    
}
