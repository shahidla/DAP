using { emp } from './external/emp';
using { qhemp } from './external/zhr_person_extn_srv';

service CatalogService {

    // @readonly
    // entity Interactions_Header as projection on local.Interactions_Header;
    @readonly
    @requires: 'authenticated-user'
    entity Employees as projection on emp.zpersdata;

    @readonly
    @requires: 'authenticated-user'
    entity QHEmployees as projection on qhemp.zhr_person_extn_srv;


}

// New UI annotations
annotate CatalogService.Employees with @(
    UI : { 
        SelectionFields  : [
            Pemail
        ],
        LineItem  : [
            { Value : Pemail },
            { Value : Pfname }, 
            { Value : Phloc }                                   
        ],
     }
){
    Pemail @( title: 'Email' );    
    Pfname @( title: 'Name' );
    Phloc @( title: 'Location' );
};