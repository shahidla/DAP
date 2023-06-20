using app.interactions from '../db/interactions';
service CatalogService {

@requires: 'authenticated-user'
entity Interactions_Header
    as projection on interactions.Interactions_Header;

@requires: 'Admin'
@restrict: [{ grant: 'READ', where: 'LANGU = ''DE'''}]
entity Interactions_Items
    as projection on  interactions.Interactions_Items;

}