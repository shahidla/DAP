using {CatalogService} from './catalog-service';

extend projection CatalogService.QHPersonnelAssignments with {
  PersonNumber as Pernr : String,
  ProfileQfl            : Association to many CatalogService.QHPersonProfleQualifications on ProfileQfl.pid = PersonNumber,
  // ProContact            : Association to one CatalogService.QHPersonProfileContact on ProContact.pid = PersonNumber,
  ProContact            : Association to one CatalogService.QHPersonIdentity on ProContact.pid = PersonNumber,
  ReProfile             : Association to many CatalogService.QHRePerProQualifications on ReProfile.pid = PersonNumber,
  ProfileGroups         : Association to many CatalogService.QHProfileGroups on ProfileGroups.pid = PersonNumber,
  ProfileList           : Association to many CatalogService.QHProfileList on ProfileList.pid = PersonNumber,
}

extend entity CatalogService.QHProfileGroups with {


  ProfileQfl : Association to many CatalogService.QHPersonProfleQualifications

                 on  ProfileQfl.pid                = pid
                 and ProfileQfl.qualificationGroup = qualificationGroup


}
