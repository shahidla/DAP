using { CatalogService }  from './catalog-service';

extend projection CatalogService.QHPersonnelAssignments with {
   ProfileQfl: Association to many CatalogService.QHPersonProfleQualifications on ProfileQfl.pid  = PersonNumber
 }