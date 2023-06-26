using CatalogService as service from '../../srv/catalog-service';

annotate service.QHPerson with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'PersonNumber',
            Value : PersonNumber,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Person Name',
            Value : PersonName,
        },
        {
            $Type : 'UI.DataField',
            Value : PersonnelAssignmentsNavn.PersonnelAssignmentNumber,
            Label : 'PersonnelAssignmentNumber',
        },
        {
            $Type : 'UI.DataField',
            Value : PersonnelAssignmentsNavn.FirstName,
            Label : 'First Name',
        },
        {
            $Type : 'UI.DataField',
            Value : PersonnelAssignmentsNavn.LastName,
            Label : 'Last Name',
        },
    ]
);
annotate service.QHPerson with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'PersonNumber',
                Value : PersonNumber,
            },
            {
                $Type : 'UI.DataField',
                Label : 'PersonName',
                Value : PersonName,
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
