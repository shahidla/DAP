using CatalogService as service from '../../srv/catalog-service';

annotate service.QHPersonnelAssignments with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'PersonnelAssignmentNumber',
            Value : PersonnelAssignmentNumber,
        },
        {
            $Type : 'UI.DataField',
            Label : 'PersonNumber',
            Value : PersonNumber,
        },
        {
            $Type : 'UI.DataField',
            Label : 'FirstName',
            Value : FirstName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'WorkingHours',
            Value : WorkingHours,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Message',
            Value : Message,
        },
    ]
);
annotate service.QHPersonnelAssignments with @(
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
                Label : 'PersonnelAssignmentNumber',
                Value : PersonnelAssignmentNumber,
            },
            {
                $Type : 'UI.DataField',
                Label : 'FirstName',
                Value : FirstName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'WorkingHours',
                Value : WorkingHours,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Message',
                Value : Message,
            },
            {
                $Type : 'UI.DataField',
                Label : 'PeriodEnd',
                Value : PeriodEnd,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Role',
                Value : Role,
            },
            {
                $Type : 'UI.DataField',
                Label : 'PositionNumber',
                Value : PositionNumber,
            },
            {
                $Type : 'UI.DataField',
                Label : 'PersonFullName',
                Value : PersonFullName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'LastName',
                Value : LastName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'BirthDate',
                Value : BirthDate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'PersonName',
                Value : PersonName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'PositionName',
                Value : PositionName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'OrganisationalUnitNumber',
                Value : OrganisationalUnitNumber,
            },
            {
                $Type : 'UI.DataField',
                Label : 'OrganisationalUnitName',
                Value : OrganisationalUnitName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'PeriodStart',
                Value : PeriodStart,
            },
            {
                $Type : 'UI.DataField',
                Label : 'MovementTypeCode',
                Value : MovementTypeCode,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Appname',
                Value : Appname,
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
