using CatalogService as service from '../../srv/catalog-service';

// New UI annotations
annotate service.PersonSrv with @(
    UI: {  SelectionFields: [name],
    LineItem       : [
        {Value: name},
        {Value: email},
        {Value: ahpra}
    ],
}) {
    email @(title: 'Email');
    name @(title: 'Name');
    ahpra  @(title: 'AHPRA');
};

annotate service.PersonSrv with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Pid',
                Value : pid,
            },
            {
                $Type : 'UI.DataField',
                Value : pan,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Plname',
                Value :  name,
            },
            {
                $Type : 'UI.DataField',
                Value : position,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Position Name',
                Value : posname,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Pmphone',
                Value : ahpra,
            },
            {
                $Type : 'UI.DataField',
                Value : expirydate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Pstatus',
                Value : work,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Pareg',
                Value : work,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Prstatus',
                Value : mobile,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Prstatus',
                Value : email,
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
