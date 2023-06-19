using CatalogService as service from '../../srv/cat-service';

// New UI annotations
annotate service.Books with @(
    UI : { 
        SelectionFields  : [
            title
        ],
        LineItem  : [
            { Value : ID },
            { Value : title }, 
            { Value : stock }                                   
        ],
     }
){
    ID @( title: 'ID' );    
    title @( title: 'Title' );
    stock @( title: 'Stock value' );
};

annotate service.Books with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : ID,
            },
            {
                $Type : 'UI.DataField',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Value : stock,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
    ]
);
