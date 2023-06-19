using CatalogService as service from '../../srv/catalog-service';

annotate service.Employees with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Pid',
                Value : Pid,
            },
            {
                $Type : 'UI.DataField',
                Value : Pfname,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Plname',
                Value : Plname,
            },
            {
                $Type : 'UI.DataField',
                Value : Phloc,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Pwphone',
                Value : Pwphone,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Pmphone',
                Value : Pmphone,
            },
            {
                $Type : 'UI.DataField',
                Value : Pemail,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Pstatus',
                Value : Pstatus,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Pareg',
                Value : Pareg,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Prstatus',
                Value : Prstatus,
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
