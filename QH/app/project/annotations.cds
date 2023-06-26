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
                Label : 'FirstName',
            },{
                $Type : 'UI.DataField',
                Value : LastName,
                Label : 'LastName',
            },{
                $Type : 'UI.DataField',
                Value : PersonnelAssignmentNumber,
                Label : 'PersonnelAssignmentNumber',
            },{
                $Type : 'UI.DataField',
                Value : PersonNumber,
                Label : 'PersonNumber',
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
            Value : pid,
            Label : 'pid',
        },{
            $Type : 'UI.DataField',
            Value : pan,
            Label : 'pan',
        },{
            $Type : 'UI.DataField',
            Value : positionId,
            Label : 'positionId',
        },{
            $Type : 'UI.DataField',
            Value : qualificationGroup,
            Label : 'qualificationGroup',
        },{
            $Type : 'UI.DataField',
            Value : qualificationName,
            Label : 'qualificationName',
        },{
            $Type : 'UI.DataField',
            Value : referenceNumber,
            Label : 'referenceNumber',
        },{
            $Type : 'UI.DataField',
            Value : requiringPositionTitle,
            Label : 'requiringPositionTitle',
        },]
);
annotate service.QHPersonnelAssignments with @(
    UI.FieldGroup #Contact : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : ProContact.relationship,
                Label : 'relationship',
            },{
                $Type : 'UI.DataField',
                Value : ProContact.street,
                Label : 'street',
            },{
                $Type : 'UI.DataField',
                Value : ProContact.workPhone,
                Label : 'workPhone',
            },],
    }
);
