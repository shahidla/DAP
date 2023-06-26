using {emp} from './external/emp';
using {zhr_person_extn_srv} from './external/zhr_person_extn_srv';

service CatalogService {
    entity QHPosition                 as projection on zhr_person_extn_srv.PositionSet;
    entity QHPersonIdentity           as projection on zhr_person_extn_srv.PersonIdentitySet;
    entity QHPersonnelAssignments     as projection on zhr_person_extn_srv.PersonnelAssignmentsSet;
    entity QHPersonProfileContact       as projection on zhr_person_extn_srv.PersonProfileContactSet;
    entity QHPersonProfleQualifications as projection on zhr_person_extn_srv.PersonProfleQualificationsSet;
}
