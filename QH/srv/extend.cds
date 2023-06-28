using {CatalogService} from './catalog-service';

extend projection CatalogService.QHPersonnelAssignments with {
  PersonNumber as Pernr : String,
  ProfileQfl            : Association to many CatalogService.QHPersonProfleQualifications on ProfileQfl.pid = PersonNumber,
  ProContact            : Association to one CatalogService.QHPersonIdentity on ProContact.pid = PersonNumber,
  ReProfile             : Association to many CatalogService.QHRePerProQualifications on ReProfile.pid = PersonNumber,
  ProfileGroups         : Association to many CatalogService.QHProfileGroups on ProfileGroups.pid = PersonNumber,

}

extend entity CatalogService.QHProfileGroups with {
  ProInfo      : Association to one CatalogService.QHPersonnelAssignments
                   on ProInfo.PersonNumber = pid;

  ProfileNames : Association to many CatalogService.QHPersonProfleQualifications
                   on ProfileNames.pid = pid

}
