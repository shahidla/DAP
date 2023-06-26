using CatalogService as service from '../../srv/catalog-service';

annotate service.QHPersonnelAssignments with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : PersonNumber,
            Label : 'Person ID',
        },
        {
            $Type : 'UI.DataField',
            Value : PersonnelAssignmentNumber,
            Label : 'Personnel Assignment Number',
        },
        {
            $Type : 'UI.DataField',
            Value : FirstName,
            Label : 'First Name',
        },
        {
            $Type : 'UI.DataField',
            Value : LastName,
            Label : 'Last Name',
        },
    ]
);
annotate service.QHPersonnelAssignments with @(
    UI.HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'INFORMATION',
            Target : '@UI.FieldGroup#INFORMATION',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'Contact',
            Target : '@UI.FieldGroup#Contact',
        },
    ],
    UI.FieldGroup #INFORMATION : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : FirstName,
                Label : 'First Name',
            },{
                $Type : 'UI.DataField',
                Value : LastName,
                Label : 'Last Name',
            },{
                $Type : 'UI.DataField',
                Value : PersonnelAssignmentNumber,
                Label : 'Personnel Assignment Number',
            },{
                $Type : 'UI.DataField',
                Value : PersonNumber,
                Label : 'Person ID',
            },],
    }
);
annotate service.QHPersonnelAssignments with @(
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Org Data',
            ID : 'OrgData',
            Target : 'PositionNavn/@UI.LineItem#OrgData',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Stamp Data',
            ID : 'StampData',
            Target : 'ProfileQfl/@UI.LineItem#StampData',
        },
    ]
);
annotate service.QHPosition with @(
    UI.LineItem #OrgData : [
        {
            $Type : 'UI.DataField',
            Value : PersonNumber,
            Label : 'PersonNumber',
        },{
            $Type : 'UI.DataField',
            Value : PositionName,
            Label : 'PositionName',
        },{
            $Type : 'UI.DataField',
            Value : PositionNumber,
            Label : 'PositionNumber',
        },{
            $Type : 'UI.DataField',
            Value : PersonnelAssignmentNumber,
            Label : 'PersonnelAssignmentNumber',
        },{
            $Type : 'UI.DataField',
            Value : OrganisationalUnitNumber,
            Label : 'OrganisationalUnitNumber',
        },{
            $Type : 'UI.DataField',
            Value : OrganisationalUnitName,
            Label : 'OrganisationalUnitName',
        },]
);
annotate service.QHPersonProfleQualifications with @(
    UI.LineItem #StampData : [
        {
            $Type : 'UI.DataField',
            Value : pan,
            Label : 'Personnel Assignment Number',
        },
        {
            $Type : 'UI.DataField',
            Value : positionId,
            Label : 'Position ID',
        },
        {
            $Type : 'UI.DataField',
            Value : qualificationGroup,
            Label : 'Stamp Type',
        },{
            $Type : 'UI.DataField',
            Value : qualificationName,
            Label : 'Stamp Name',
        },{
            $Type : 'UI.DataField',
            Value : referenceNumber,
            Label : 'Reference',
        },
        {
            $Type : 'UI.DataField',
            Value : positionRequirementStart,
            Label : 'Last Checked',
        },
        {
            $Type : 'UI.DataField',
            Value : positionRequirementEnd,
            Label : 'Validity End',
        },]
);
annotate service.QHPersonnelAssignments with @(
    UI.FieldGroup #Contact : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : PerIdentity.email,
                Label : 'Email',
            },{
                $Type : 'UI.DataField',
                Value : PerIdentity.mobilePhone,
                Label : 'Mobile Phone',
            },{
                $Type : 'UI.DataField',
                Value : PerIdentity.workPhone,
                Label : 'Work Phone',
            },],
    }
);
annotate service.QHPersonnelAssignments with @(
    UI.SelectionFields : [
        PersonFullName,
        PersonNumber,
    ]
);
annotate service.QHPersonnelAssignments with {
    PersonFullName @Common.Label : 'Full Name'
};
annotate service.QHPersonnelAssignments with {
    PersonNumber @Common.Label : 'Person ID'
};
annotate service.QHPersonnelAssignments with {
    PersonFullName @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'QHPersonnelAssignments',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : PersonFullName,
                    ValueListProperty : 'PersonFullName',
                },
            ],
        },
        Common.ValueListWithFixedValues : true
)};
annotate service.QHPersonnelAssignments with {
    PersonNumber @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'QHPersonnelAssignments',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : PersonNumber,
                    ValueListProperty : 'PersonNumber',
                },
            ],
        },
        Common.ValueListWithFixedValues : true
)};