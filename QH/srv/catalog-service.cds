using {emp} from './external/emp';
using {zhr_person_extn_srv} from './external/zhr_person_extn_srv';
using {empqfl} from './external/empqfl';

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
        // Role,
        PositionNumber,
        PersonFullName,
        LastName,
      //  PersonName,
        PositionName,
      //  OrganisationalUnitNumber,
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
    entity QHPersonProfleQualifications as projection on zhr_person_extn_srv.PersonProfleQualificationsSet {
        key pid,
        key pan,
        key positionId,
        key qualificationGroup,
            qualificationName,
            referenceNumber,
            requiringPositionTitle,
            empQualficationStart : DateTime,
            empQualifictionEnd   : DateTime,
            pid as Pernr         : String,
            ratingText: String
    };

    @readonly
    @cds.persistence.exists
    entity QHRePerProQualifications {
        key pid                    : String;
        key pan                    : String;
        key positionId             : String;
        key qualificationGroup     : String;
            qualificationName      : String;
            referenceNumber        : String;
            requiringPositionTitle : String;
            empQualficationStart   : DateTime;
            empQualifictionEnd     : DateTime;
            ratingText: String
    };

    @readonly
    @cds.persistence.exists
    entity QHProfileGroups {
        key pid                   : String;
        key qualificationGroup    : String;
            qualificationGroupDes : String;
            virtual showt1 : Boolean ;
            virtual showt2 : Boolean ;
            virtual showt3 : Boolean ;
    };  

    @readonly
    entity EHProfleQualifications       as projection on empqfl.ZPERSDATA_QFL {
        *,
        pid as Pernr : String

    };

    @readonly

    //@cds.persistence.exists

    entity EHCredentialling {

        key pid                             : String;
        key HHS                             : String;
            AHPRANumber                     : String;
            ScopePracticeType               : String; //Type (MR/Interim/Formal)

            ScopePracticeStatus             : String; // (Approved/Expired/Revoked)

            ApprovedScopePractice           : String;
            SubSpecialty                    : String;
            ScopePracticeStartDate          : Date;
            ScopePracticeExpiryDate         : Date;
            ScopePracticeConditions         : String;
            RequiredSupervisionRequirements : String;

    };

    @readonly

    //@cds.persistence.exists

    entity EHTraining {

        key pid                : String;
        key CourseID           : String;
            CourseName         : String;
            G6CourseEquivalent : String;
            HHSCompleted       : String;
            CompletionDate     : Date;
            ExpiryDate         : Date;

    };
}
