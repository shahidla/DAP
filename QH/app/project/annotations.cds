using CatalogService as service from '../../srv/catalog-service';

annotate service.QHPersonnelAssignments with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : Pernr,
            Label : 'Personl ID',
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
        {
            $Type : 'UI.DataField',
            Value : PersonProfleQualificationsSet.referenceNumber,
            Label : 'Reference Number',
        },
        {
            $Type : 'UI.DataField',
            Value : OrganisationalUnitName,
            Label : 'Organisational Unit Name',
        },
        {
            $Type : 'UI.DataField',
            Value : OrganisationalUnitNumber,
            Label : 'Organisational Unit Number',
        },
        {
            $Type : 'UI.DataField',
            Value : Role,
            Label : 'Role',
        },
        {
            $Type : 'UI.DataField',
            Value : PositionNumber,
            Label : 'PositionNumber',
        },
        {
            $Type : 'UI.DataField',
            Value : PositionName,
            Label : 'PositionName',
        },
        {
            $Type : 'UI.DataField',
            Value : PersonName,
            Label : 'Person Name',
        },
        {
            $Type : 'UI.DataField',
            Value : PersonFullName,
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
            },
            {
                $Type : 'UI.DataFieldForAnnotation',
                Target: '@Communication.Contact',
                Label : 'Contact'
            }  
            ],
    }
);
annotate service.QHPersonnelAssignments with @(
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Org Data',
            ID : 'OrgData',
            Target : 'PositionNavn/@UI.PresentationVariant#OrgData',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Stamp Data',
            ID : 'StampData',
            Target : 'ProfileQfl/@UI.LineItem#StampData1',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Rigistration',
            ID : 'Rigistration',
            Target : 'ReProfile/@UI.LineItem#Rigistration',
        },
    ]
);

annotate service.QHPersonnelAssignments with @(Communication.Contact : {

    fn   : PersonFullName,
    kind   : #individual,
    tel: 
    [{type :  #cell,
      uri  : ProContact.mobilePhone },
     {type :  #work,
      uri  : ProContact.workPhone }
      
      ],

    email  : [{
        address : ProContact.email,
        type    : #work
    }]
 
  });

annotate service.QHPosition with @(
    UI.LineItem #OrgData : [
        {
            $Type : 'UI.DataField',
            Value : PersonNumber,
            Label : 'Person Number',
        },
        {
            $Type : 'UI.DataField',
            Value : PersonnelAssignmentNumber,
            Label : 'Personnel Assignment Number',
        },{
            $Type : 'UI.DataField',
            Value : PositionName,
            Label : 'Position Name',
        },{
            $Type : 'UI.DataField',
            Value : PositionNumber,
            Label : 'Position Number',
        },{
            $Type : 'UI.DataField',
            Value : OrganisationalUnitNumber,
            Label : 'Organisational Unit Number',
        },{
            $Type : 'UI.DataField',
            Value : OrganisationalUnitName,
            Label : 'Organisational Unit Name',
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

// annotate service.QHPersonnelAssignments with @(
//     UI.FieldGroup #Contact : {
//         $Type : 'UI.FieldGroupType',
//         Data : [
//             {
//                 $Type : 'UI.DataField',
//                 Value : PerIdentity.email,
//                 Label : 'Email',
//             },{
//                 $Type : 'UI.DataField',
//                 Value : PerIdentity.mobilePhone,
//                 Label : 'Mobile Phone',
//             },{
//                 $Type : 'UI.DataField',
//                 Value : PerIdentity.workPhone,
//                 Label : 'Work Phone',
//             },],
//     }
// );

annotate service.QHPersonnelAssignments with @(
    UI.SelectionFields : [
        PersonFullName,
        PersonNumber,
        PersonnelAssignmentNumber,
        PersonProfleQualificationsSet.referenceNumber
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

annotate service.QHPersonnelAssignments with {
    PersonnelAssignmentNumber @Common.Label : 'Personnel Assignment Number'
};
annotate service.QHPersonnelAssignments with {
    PersonnelAssignmentNumber @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'QHPersonnelAssignments',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : PersonnelAssignmentNumber,
                    ValueListProperty : 'PersonnelAssignmentNumber',
                },
            ],
        },
        Common.ValueListWithFixedValues : true
)};
annotate service.QHPosition with @(
    UI.PresentationVariant #OrgData : {
        $Type : 'UI.PresentationVariantType',
        Visualizations : [
            '@UI.LineItem#OrgData',
        ],
    }
);
annotate service.QHPersonProfleQualifications with @(
    UI.PresentationVariant #StampData : {
        $Type : 'UI.PresentationVariantType',
        Visualizations : [
            '@UI.LineItem#StampData',
        ],
    }
);
annotate service.QHPersonProfleQualifications with @(
    UI.LineItem #StampData1 : [
        {
            $Type : 'UI.DataField',
            Value : pid,
            Label : 'Personl ID',
        },
        {
            $Type : 'UI.DataField',
            Value : pan,
            Label : 'Personnel Assignment Number',
        },{
            $Type : 'UI.DataField',
            Value : positionId,
            Label : 'Position ID',
        },{
            $Type : 'UI.DataField',
            Value : qualificationName,
            Label : 'Stamp Name',
        },{
            $Type : 'UI.DataField',
            Value : qualificationGroup,
            Label : 'Stamp Type',
        },
        {
            $Type : 'UI.DataField',
            Value : referenceNumber,
            Label : 'Reference',
        },]
);
annotate service.QHRePerProQualifications with @(
    UI.LineItem #Rigistration : [
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
