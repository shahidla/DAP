using {CatalogService} from './catalog-service';

extend projection CatalogService.QHPersonnelAssignments with {
  PersonNumber as Pernr : String,
  ProfileQfl            : Association to many CatalogService.QHPersonProfleQualifications on ProfileQfl.pid = PersonNumber,
  ProContact            : Association to one CatalogService.QHPersonProfileContact on ProContact.pid = PersonNumber,
  PerIdentity           : Association to one CatalogService.QHPersonIdentity on PerIdentity.pid = PersonNumber
}
