using {emp} from './external/emp';
using {zhr_person_extn_srv} from './external/zhr_person_extn_srv';
using { empqfl } from './external/empqfl';

service CatalogService {
    @readonly
    entity QHPosition                   as projection on zhr_person_extn_srv.PositionSet;
    @readonly
    entity QHPersonIdentity             as projection on zhr_person_extn_srv.PersonIdentitySet;
    @readonly
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
    @readonly
    entity QHPersonProfileContact       as projection on zhr_person_extn_srv.PersonProfileContactSet;
    @readonly
    entity QHPersonProfleQualifications as projection on zhr_person_extn_srv.PersonProfleQualificationsSet
    { 
        key pid ,
        key pan,
        key positionId,
        key qualificationGroup,
        qualificationName,
        referenceNumber,
        requiringPositionTitle,
        empQualficationStart,
        empQualifictionEnd,
        pid as Pernr: String
    };
   @readonly 
   @cds.persistence.exists
   entity QHRePerProQualifications  
    { 
        key pid : String;
        key pan: String;
        key positionId: String;
        key qualificationGroup: String;
        qualificationName: String;
        referenceNumber: String;
        requiringPositionTitle: String;
        empQualficationStart : DateTime;
        empQualifictionEnd :DateTime;
    };
    @readonly
   @cds.persistence.exists
   entity QHProfileGroups
    { 
        key pid : String;
        key qualificationGroup: String;
        
    };
         
    @readonly
    entity EHProfleQualifications as projection on empqfl.ZPERSDATA_QFL;    
}
