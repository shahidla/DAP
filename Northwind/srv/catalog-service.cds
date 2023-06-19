using {NorthWind as external} from './external/NorthWind';
using { emp } from './external/emp';
//using { app.localdb as local } from '../db/localdb';

service CatalogService {

    // @readonly
    // entity Interactions_Header as projection on local.Interactions_Header;
    @readonly
    entity Employees as projection on emp.zpersdata;

    @readonly
    entity Products as projection on external.Products {
        key ID,
            Name,
            Description,
            ReleaseDate,
            DiscontinuedDate,
            Rating,
            Price
    };

}