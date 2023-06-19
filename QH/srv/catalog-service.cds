using { emp } from './external/emp';
using { zhr_person_extn_srv  } from './external/zhr_person_extn_srv';
using qh.employees as my from '../db/schema';

service CatalogService {

//@requires: 'authenticated-user'
    @readonly entity Person as projection on my.PersonData;


    // @readonly
    // entity Interactions_Header as projection on local.Interactions_Header;
    @readonly
    //@requires: 'authenticated-user'
    entity Employees as projection on emp.zpersdata;

    //@readonly
   // @requires: 'authenticated-user'
    entity QHPerson as projection on zhr_person_extn_srv.PersonIdentitySet;

    entity QHPosition as projection on zhr_person_extn_srv.PositionSet;
    
 
 
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