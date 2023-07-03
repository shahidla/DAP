using CatalogService as service from '../../srv/catalog-service';

annotate service.QHPersonnelAssignments with @(UI.LineItem: [
    {
        $Type: 'UI.DataField',
        Value: Pernr,
        Label: 'Personl ID',
    },
    {
        $Type: 'UI.DataField',
        Value: PersonnelAssignmentNumber,
        Label: 'Personnel Assignment Number',
    },
    {
        $Type: 'UI.DataField',
        Value: PersonFullName,
    },
    {
        $Type: 'UI.DataField',
        Value: PersonProfleQualificationsSet.referenceNumber,
    //Label: 'Reference Number',
    },
    {
        $Type: 'UI.DataField',
        Value: OrganisationalUnitName,
        Label: 'Organisational Unit Name',
    },
    {
        $Type: 'UI.DataField',
        Value: PositionName,
        Label: 'PositionName',
    },
    {
        $Type: 'UI.DataField',
        Value: Role,
        Label: 'Role',
    },
    {
        $Type: 'UI.DataField',
        Value: FirstName,
        Label: 'First Name',
    },
    {
        $Type: 'UI.DataField',
        Value: LastName,
        Label: 'Last Name',
    },
    {
        $Type: 'UI.DataField',
        Value: OrganisationalUnitNumber,
        Label: 'Organisational Unit Number',
    },
    {
        $Type: 'UI.DataField',
        Value: PositionNumber,
        Label: 'PositionNumber',
    },
    {
        $Type: 'UI.DataField',
        Value: PersonName,
        Label: 'Person Name',
    },

]);


annotate service.QHPersonProfleQualifications with {
    referenceNumber @Common.Label: 'AHPRA Registration Number'
};

annotate service.QHPersonnelAssignments with @(
    UI.HeaderFacets           : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Personl ID',
            ID    : 'PersonlID',
            Target: '@UI.FieldGroup#PersonlID',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'INFORMATION',
            Target: '@UI.FieldGroup#INFORMATION',
            Label : 'Contact',
        },

        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'CRV',
            Target: '@UI.FieldGroup#CRV',
            Label : 'Citizenship/Residency/Visa',
        },             
    ],
    UI.FieldGroup #INFORMATION: {
        $Type: 'UI.FieldGroupType',
        Data : [{
            $Type : 'UI.DataFieldForAnnotation',
            Target: '@Communication.Contact'
        }],
    }
);

annotate service.QHPersonnelAssignments with @(UI.Facets: [
    {
        $Type : 'UI.ReferenceFacet',
        Label : 'Org Data',
        ID    : 'OrgData',
        Target: 'ProPositions/@UI.PresentationVariant#OrgData',

    },
    {
        $Type : 'UI.ReferenceFacet',
        Label : 'AHPRA Registration Data',
        ID    : 'Registration',
        Target: 'ReProfile/@UI.LineItem#Registration',
    },
    {
        $Type : 'UI.ReferenceFacet',
        Label : 'Stamp List',
        ID    : 'StampList',
        Target: 'ProfileGroups/@UI.LineItem#StampList',
    },
]);

annotate service.QHPersonnelAssignments with @(Communication.Contact: {

    fn   : PersonFullName,
    kind : #individual,
    tel  : [
        {
            type: #cell,
            uri : ProContact.mobilePhone
        },
        {
            type: #work,
            uri : ProContact.workPhone
        }

    ],

    email: [{
        address: ProContact.email,
        type   : #work
    }]

});

annotate service.QHPosition with @(UI.LineItem #OrgData: [
    {
        $Type: 'UI.DataField',
        Value: PersonNumber,
        Label: 'Personl ID',
    },
    {
        $Type: 'UI.DataField',
        Value: PersonnelAssignmentNumber,
        Label: 'Personnel Assignment Number',
    },
    {
        $Type: 'UI.DataField',
        Value: PositionNumber,
        Label: 'Position Number',
    },
    {
        $Type: 'UI.DataField',
        Value: PositionName,
        Label: 'Position Name',
    },
    {
        $Type: 'UI.DataField',
        Value: OrganisationalUnitName,
        Label: 'Organisational Unit Name',
    },
    {
        $Type: 'UI.DataField',
        Value: OrganisationalUnitNumber,
        Label: 'Organisational Unit Number',
    },

]);


// annotate service.QHPersonProfleQualifications with @(UI.LineItem #StampData: [
//     {
//         $Type: 'UI.DataField',
//         Value: pan,
//         Label: 'Personnel Assignment Number',
//     },
//     {
//         $Type: 'UI.DataField',
//         Value: positionId,
//         Label: 'Position ID',
//     },
//     {
//         $Type: 'UI.DataField',
//         Value: qualificationGroup,
//         Label: 'Stamp Type',
//     },
//     {
//         $Type: 'UI.DataField',
//         Value: qualificationName,
//         Label: 'Stamp Name',
//     },
//     {
//         $Type: 'UI.DataField',
//         Value: referenceNumber,
//         Label: 'Reference',
//     },
//     {
//         $Type: 'UI.DataField',
//         Value: positionRequirementStart,
//         Label: 'Last Checked',
//     },
//     {
//         $Type: 'UI.DataField',
//         Value: positionRequirementEnd,
//         Label: 'Validity End',
//     },
// ]);

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

annotate service.QHPersonnelAssignments with @(UI.SelectionFields: [
    PersonNumber,
    PersonnelAssignmentNumber,
    PersonFullName,
    PersonProfleQualificationsSet.referenceNumber
]);

annotate service.QHPersonnelAssignments with {
    PersonFullName @Common.Label: 'Full Name'
};

annotate service.QHPersonnelAssignments with {
    PersonNumber @Common.Label: 'Person ID'
};

annotate service.QHPersonnelAssignments with {
    PersonFullName @(
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'QHPersonnelAssignments',
            Parameters    : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: PersonFullName,
                ValueListProperty: 'PersonFullName',
            }, ],
        },
        Common.ValueListWithFixedValues: true
    )
};


annotate service.QHPersonnelAssignments with {
    PersonNumber @(
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'QHPersonIdentity',
            Parameters    : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: PersonNumber,
                ValueListProperty: 'pid',
            }, ],
        },
        Common.ValueListWithFixedValues: true
    )
};

annotate service.QHPersonnelAssignments with {
    PersonnelAssignmentNumber @Common.Label: 'Personnel Assignment Number'
};

annotate service.QHPersonnelAssignments with {
    PersonnelAssignmentNumber @(
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'QHPersonnelAssignments',
            Parameters    : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: PersonnelAssignmentNumber,
                ValueListProperty: 'PersonnelAssignmentNumber',
            }, ],
        },
        Common.ValueListWithFixedValues: true
    )
};

annotate service.QHPosition with @(UI.PresentationVariant #OrgData: {
    $Type         : 'UI.PresentationVariantType',
    Visualizations: ['@UI.LineItem#OrgData', ],
});

// annotate service.QHPersonProfleQualifications with @(UI.PresentationVariant #StampData: {
//     $Type         : 'UI.PresentationVariantType',
//     Visualizations: ['@UI.LineItem#StampData', ],
// });


annotate service.QHPersonProfleQualifications with @(UI.LineItem #StampData1: [
    {
        $Type: 'UI.DataField',
        Value: pid,
        Label: 'Personl ID',
    },
    {
        $Type: 'UI.DataField',
        Value: pan,
        Label: 'Personnel Assignment Number',
    },
    {
        $Type: 'UI.DataField',
        Value: positionId,
        Label: 'Position Number',
    },
    {
        $Type: 'UI.DataField',
        Value: qualificationName,
        Label: 'Stamp Name',
    },
    {
        $Type: 'UI.DataField',
        Value: qualificationGroup,
        Label: 'Stamp Type',
    },
    {
        $Type: 'UI.DataField',
        Value: referenceNumber,
        Label: 'Reference',
    },
]);

annotate service.QHRePerProQualifications with @(UI.LineItem #Registration: [
    {
        $Type: 'UI.DataField',
        Value: pid,
        Label: 'Pesonl ID',
    },
    {
        $Type: 'UI.DataField',
        Value: pan,
        Label: 'Personnel Assignment Number',
    },
    {
        $Type: 'UI.DataField',
        Value: positionId,
        Label: 'Position ID',
    },
    {
        $Type: 'UI.DataField',
        Value: qualificationGroup,
        Label: 'Stamp Type',
    },
    {
        $Type: 'UI.DataField',
        Value: qualificationName,
        Label: 'Stamp Name',
    },
    {
        $Type: 'UI.DataField',
        Value: referenceNumber,
        Label: 'AHPRA Registration Number',
    },
    {
        $Type: 'UI.DataField',
        Value: empQualficationStart,
        Label: 'AHPRA Registration Validity Start',
    },
    {
        $Type: 'UI.DataField',
        Value: empQualifictionEnd,
        Label: 'AHPRA Registration Validity End',
    },
    {
        $Type: 'UI.DataField',
        Value: requiringPositionTitle,
        Label: 'Position Title',
    },
]);


annotate service.QHProfileGroups with @(
    UI.HeaderFacets            : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Type of Stamps',
            ID    : 'TypeofStamps',
            Target: '@UI.FieldGroup#TypeofStamps',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Person ID',
            ID    : 'PersonID',
            Target: '@UI.FieldGroup#PersonID',
        }
    ],
    UI.FieldGroup #TypeofStamps: {
        $Type: 'UI.FieldGroupType',
        Data : [{
            $Type: 'UI.DataField',
            Value: qualificationGroupDes,
        }

        ],
    }
);

annotate service.QHProfileGroups with @(UI.LineItem #StampList: [{
    $Type: 'UI.DataField',
    Value: qualificationGroupDes,
    Label: 'Stamp Types',
}, ]);

annotate service.QHPersonProfleQualifications with @(UI.LineItem #test: [
    {
        $Type: 'UI.DataField',
        Value: Pernr,
        Label: 'Person ID',
    },
    {
        $Type: 'UI.DataField',
        Value: pan,
        Label: 'Personnel Assignment Number',
    },
    {
        $Type: 'UI.DataField',
        Value: positionId,
        Label: 'Position Number',
    },
    {
        $Type: 'UI.DataField',
        Value: qualificationGroup,
        Label: 'Stamp Type',
    },
    {
        $Type: 'UI.DataField',
        Value: qualificationName,
        Label: 'Stamp Name',
    },
    {
        $Type: 'UI.DataField',
        Value: referenceNumber,
        Label: 'Registration Number',
    },
    {
        $Type: 'UI.DataField',
        Value: empQualficationStart,
        Label: 'Registration Validity Start',
    },
    {
        $Type: 'UI.DataField',
        Value: empQualifictionEnd,
        Label: 'Registration Validity End',
    },
    {
        $Type: 'UI.DataField',
        Value: requiringPositionTitle,
        Label: 'Position Title',
    },
]);

annotate service.EHCredentialling with @(UI.LineItem #Credentialling: [{
    $Type: 'UI.DataField',
    Value: pid,
    Label: 'Person ID',
},
    {
        $Type : 'UI.DataField',
        Value : AHPRANumber,
        Label : 'AHPRA Number',
    },
    {
        $Type : 'UI.DataField',
        Value : ApprovedScopePractice,
        Label : 'Approved Scope Practice',
    },
    {
        $Type : 'UI.DataField',
        Value : HHS,
        Label : 'HHS',
    },
    {
        $Type : 'UI.DataField',
        Value : RequiredSupervisionRequirements,
        Label : 'Required Supervision Requirements',
    },
    {
        $Type : 'UI.DataField',
        Value : ScopePracticeConditions,
        Label : 'Scope Practice Conditions',
    },
    {
        $Type : 'UI.DataField',
        Value : ScopePracticeExpiryDate,
        Label : 'Scope Practice Expiry Date',
    },
    {
        $Type : 'UI.DataField',
        Value : ScopePracticeStartDate,
        Label : 'Scope Practice Start Date',
    },
    {
        $Type : 'UI.DataField',
        Value : ScopePracticeStatus,
        Label : 'Scope Practice Status',
    },
    {
        $Type : 'UI.DataField',
        Value : ScopePracticeType,
        Label : 'Scope Practice Type',
    },
    {
        $Type : 'UI.DataField',
        Value : SubSpecialty,
        Label : 'Sub Specialty',
    },

]);
annotate service.EHTraining with @(UI.LineItem #EHTraining: [{
    $Type: 'UI.DataField',
    Value: pid,
    Label: 'Person ID',
},
    {
        $Type : 'UI.DataField',
        Value : CompletionDate,
        Label : 'Completion Date',
    },
    {
        $Type : 'UI.DataField',
        Value : CourseID,
        Label : 'Course ID',
    },
    {
        $Type : 'UI.DataField',
        Value : CourseName,
        Label : 'Course Name',
    },
    {
        $Type : 'UI.DataField',
        Value : ExpiryDate,
        Label : 'Expiry Date',
    },
    {
        $Type : 'UI.DataField',
        Value : G6CourseEquivalent,
        Label : 'G6 Course Equivalent',
    },
    {
        $Type : 'UI.DataField',
        Value : HHSCompleted,
        Label : 'HHS Completed',
    },

]);
annotate service.QHProfileGroups with @(UI.Facets: [
    {
        $Type        : 'UI.ReferenceFacet',
        Label        : 'Other HR Data',
        ID           : 'test',
        Target       : 'ProfileNames/@UI.LineItem#test',
        ![@UI.Hidden]:showt1
    },
    {
        $Type : 'UI.ReferenceFacet',
        Label : 'Credentialling',
        ID    : 'Credentialling',
        Target: 'EHCredentialling/@UI.LineItem#Credentialling',
         ![@UI.Hidden]:showt2
    },
    {
        $Type : 'UI.ReferenceFacet',
        Label : 'Training',
        ID    : 'EHTraining',
        Target: 'EHTraining/@UI.LineItem#EHTraining',
         ![@UI.Hidden]:showt3
    },
]);


annotate service.QHPersonnelAssignments with @(UI.FieldGroup #Information2: {
    $Type: 'UI.FieldGroupType',
    Data : [{
        $Type: 'UI.DataField',
        Value: FirstName,
    }, ],
});

annotate service.QHPersonnelAssignments with @(UI.FieldGroup #information3: {
    $Type: 'UI.FieldGroupType',
    Data : [{
        $Type: 'UI.DataField',
        Value: LastName,
    }, ],
});

annotate service.QHProfileGroups with @(UI.FieldGroup #FistName: {
    $Type: 'UI.FieldGroupType',
    Data : [
        {
            $Type: 'UI.DataField',
            Value: ProInfo.FirstName,
            Label: 'First Name',
        },
        {
            $Type: 'UI.DataField',
            Value: ProInfo.PersonFullName,
        },
    ],
});

annotate service.QHProfileGroups with @(UI.FieldGroup #LastName: {
    $Type: 'UI.FieldGroupType',
    Data : [{
        $Type: 'UI.DataField',
        Value: ProInfo.LastName,
        Label: 'Last Name',
    }, ],
});

annotate service.QHPersonnelAssignments with @(UI.FieldGroup #PersonlID: {
    $Type: 'UI.FieldGroupType',
    Data : [{
        $Type: 'UI.DataField',
        Value: Pernr,
    }, ],
});

annotate service.QHPersonnelAssignments with @(UI.FieldGroup #CRV: {
    $Type: 'UI.FieldGroupType',
    Data : [{
        $Type: 'UI.DataField',
        Value: ProContact.Residencystatus,
    }, ],
});

annotate service.QHProfileGroups with @(UI.FieldGroup #PersonID: {
    $Type: 'UI.FieldGroupType',
    Data : [{
        $Type: 'UI.DataField',
        Value: pid,
    }, ],
});
// annotate service.QHPersonnelAssignments with @(

//     UI.HeaderFacets           : [{

//         $Type : 'UI.ReferenceFacet',

//         ID    : 'INFORMATION',

//         Label  : 'Employee Information',

//         Target: '@UI.FieldGroup#INFORMATION',

//     }]
// );
