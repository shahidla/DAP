using CatalogService as service from '../../srv/catalog-service';

annotate service.QHPersonnelAssignments with @(UI.LineItem: [
    {
        $Type: 'UI.DataField',
        Value: Pernr,
        Label: 'Person ID',
    },
    {
        $Type: 'UI.DataField',
        Value: PersonnelAssignmentNumber,
        Label: 'Personnel Assignment Number',
    },
    {
        $Type: 'UI.DataField',
        Value: PersonFullName,
        Label: 'Full Name',
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
    // {
    //     $Type: 'UI.DataField',
    //     Value: Role,
    //     Label: 'Role',
    // },
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
    // {
    //     $Type: 'UI.DataField',
    //     Value: OrganisationalUnitNumber,
    //     Label: 'Organisational Unit Number',
    // },
    {
        $Type: 'UI.DataField',
        Value: PositionNumber,
        Label: 'PositionNumber',
    },
// {
//     $Type: 'UI.DataField',
//     Value: PersonName,
//     Label: 'Person Name',
// },

]);

annotate service.QHPersonProfleQualifications with {
    referenceNumber @Common.Label: 'AHPRA Registration Number'
};

annotate service.QHPersonnelAssignments with @(
    UI.HeaderInfo             : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : '',
        TypeNamePlural: '',
        Title         : {Value: PersonNumber},
        Description   : {
            $Type: 'UI.DataField',
            Value: 'Person ID',
        }
    // Description   : {Value: PersonFullName}
    },
    UI.HeaderFacets           : [
                                 // {
                                 //     $Type : 'UI.ReferenceFacet',
                                 //     Label : 'Person ID',
                                 //     ID    : 'PersonID',
                                 //     Target: '@UI.FieldGroup#PersonID',
                                 // },
                                {
        $Type : 'UI.ReferenceFacet',
        ID    : 'INFORMATION',
        Target: '@UI.FieldGroup#INFORMATION',
        Label : 'Contact',
    },

    // {
    //     $Type : 'UI.ReferenceFacet',
    //     ID    : 'CRV',
    //     Target: '@UI.FieldGroup#CRV',
    //     Label : 'Citizenship/Residency/Visa',
    // },
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

    fn   : ProContact.Personfullname,
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
        Label: 'Person ID',
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

// annotate service.QHPersonnelAssignments with {
//     PersonFullName @(
//         Common.ValueList               : {
//             $Type         : 'Common.ValueListType',
//             CollectionPath: 'QHPersonnelAssignments',
//             Parameters    : [{
//                 $Type            : 'Common.ValueListParameterInOut',
//                 LocalDataProperty: PersonFullName,
//                 ValueListProperty: 'PersonFullName',
//             }, ],
//         },
//         Common.ValueListWithFixedValues: true
//     )
// };


// annotate service.QHPersonnelAssignments with {
//     PersonNumber @(
//         Common.ValueList               : {
//             $Type         : 'Common.ValueListType',
//             CollectionPath: 'QHPersonIdentity',
//             Parameters    : [{
//                 $Type            : 'Common.ValueListParameterInOut',
//                 LocalDataProperty: PersonNumber,
//                 ValueListProperty: 'pid',
//             }, ],
//         },
//         Common.ValueListWithFixedValues: true
//     )
// };

annotate service.QHPersonnelAssignments with {
    PersonnelAssignmentNumber @Common.Label: 'Personnel Assignment Number'
};

// annotate service.QHPersonnelAssignments with {
//     PersonnelAssignmentNumber @(
//         Common.ValueList               : {
//             $Type         : 'Common.ValueListType',
//             CollectionPath: 'QHPersonnelAssignments',
//             Parameters    : [{
//                 $Type            : 'Common.ValueListParameterInOut',
//                 LocalDataProperty: PersonnelAssignmentNumber,
//                 ValueListProperty: 'PersonnelAssignmentNumber',
//             }, ],
//         },
//         Common.ValueListWithFixedValues: true
//     )
// };

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
        Label: 'Requiring Position Title',
    },
    {
        $Type: 'UI.DataField',
        Value: ratingText,
        Label: 'Position Requirement',
    },
]);


annotate service.QHProfileGroups with @(

    UI.HeaderInfo              : {
        // $Type : 'UI.HeaderInfoType',
        TypeName      : '',
        TypeNamePlural: '',
        Title         : {Value: pid},
        Description   : {
            $Type: 'UI.DataField',
            Value: 'Person ID',
        }
    // Description   : {Value: pid}
    },

    UI.HeaderFacets            : [{
        $Type : 'UI.ReferenceFacet',
        Label : 'Type of Stamps',
        ID    : 'TypeofStamps',
        Target: '@UI.FieldGroup#TypeofStamps',
    }
    // {
    //     $Type : 'UI.ReferenceFacet',
    //     Label : 'Person ID',
    //     ID    : 'PersonID',
    //     Target: '@UI.FieldGroup#PersonID',
    // }
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

annotate service.QHPersonProfleQualifications with @(UI.LineItem #HR: [
    // {
    //     $Type: 'UI.DataField',
    //     Value: Pernr,
    //     Label: 'Person ID',
    // },
    // {
    //     $Type: 'UI.DataField',
    //     Value: pan,
    //     Label: 'Personnel Assignment Number',
    // },
    // {
    //     $Type: 'UI.DataField',
    //     Value: positionId,
    //     Label: 'Position Number',
    // },
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
        Label: 'AHPRA Number',
    },
    {
        $Type: 'UI.DataField',
        Value: empQualficationStart,
        Label: ' VaccinationValidity Start',
    },
    {
        $Type: 'UI.DataField',
        Value: empQualifictionEnd,
        Label: 'VaccinationValidity End',
    },
    {
        $Type: 'UI.DataField',
        Value: requiringPositionTitle,
        Label: 'Requiring Position Title',
    },
    {
        $Type: 'UI.DataField',
        Value: ratingText,
        Label: 'Position Requirement',
    },
]);

annotate service.EHCredentialling with @(UI.LineItem #Credentialling: [
    {
        $Type: 'UI.DataField',
        Value: HHS,
        Label: 'HHS',
    },
    // {
    //     $Type: 'UI.DataField',
    //     Value: pid,
    //     Label: 'Person ID',
    // },
    {
        $Type: 'UI.DataField',
        Value: AHPRANumber,
        Label: 'AHPRA Number',
    },
    {
        $Type: 'UI.DataField',
        Value: ScopePracticeType,
        Label: 'Scope  of Practice Type',
    },
    {
        $Type: 'UI.DataField',
        Value: ScopePracticeStatus,
        Label: 'Scope  of Practice Status',
    },
    {
        $Type: 'UI.DataField',
        Value: ApprovedScopePractice,
        Label: 'Approved Scope of Practice',
    },
    {
        $Type: 'UI.DataField',
        Value: SubSpecialty,
        Label: 'Sub Specialty',
    },
    {
        $Type: 'UI.DataField',
        Value: ScopePracticeStartDate,
        Label: 'Scope of Practice Start Date',
    },
    {
        $Type: 'UI.DataField',
        Value: ScopePracticeExpiryDate,
        Label: 'Scope of Practice Expiry Date',
    },
    {
        $Type: 'UI.DataField',
        Value: ScopePracticeConditions,
        Label: 'Scope of Practice Conditions',
    },
    {
        $Type: 'UI.DataField',
        Value: RequiredSupervisionRequirements,
        Label: 'Required Supervision Requirements',
    },

]);

annotate service.EHTraining with @(UI.LineItem #EHTraining: [
    // {
    //     $Type: 'UI.DataField',
    //     Value: pid,
    //     Label: 'Person ID',
    // },
    {
        $Type: 'UI.DataField',
        Value: CourseID,
        Label: 'Course ID',
    },
    {
        $Type: 'UI.DataField',
        Value: CourseName,
        Label: 'Course Name',
    },
    {
        $Type: 'UI.DataField',
        Value: G6CourseEquivalent,
        Label: 'G6 Course Equivalent',
    },
    {
        $Type: 'UI.DataField',
        Value: HHSCompleted,
        Label: 'HHS Completed',
    },
    {
        $Type: 'UI.DataField',
        Value: CompletionDate,
        Label: 'Completion Date',
    },
    {
        $Type: 'UI.DataField',
        Value: ExpiryDate,
        Label: 'Expiry Date',
    },

]);

annotate service.QHProfileGroups with @(UI.Facets: [
    {
        $Type        : 'UI.ReferenceFacet',
        Label        : 'Vaccination',
        ID           : 'HR',
        Target       : 'ProfileNames/@UI.LineItem#HR',
        ![@UI.Hidden]: showt1
    },
    {
        $Type        : 'UI.ReferenceFacet',
        Label        : 'Credentialling',
        ID           : 'Credentialling',
        Target       : 'EHCredentialling/@UI.LineItem#Credentialling',
        ![@UI.Hidden]: showt2
    },
    {
        $Type        : 'UI.ReferenceFacet',
        Label        : 'Training',
        ID           : 'EHTraining',
        Target       : 'EHTraining/@UI.LineItem#EHTraining',
        ![@UI.Hidden]: showt3
    },
    {
        $Type        : 'UI.ReferenceFacet',
        Label        : 'Citizenship/residency/visa',
        ID           : 'Citizenshipresidencyvisa',
        Target       : '@UI.FieldGroup#Citizenshipresidencyvisa',
        ![@UI.Hidden]: showt1
    },
    {
        $Type        : 'UI.ReferenceFacet',
        Label        : 'Criminal',
        ID           : 'Criminal',
        Target       : '@UI.FieldGroup#Criminal',
        ![@UI.Hidden]: showt1

    },
]);


// annotate service.QHPersonnelAssignments with @(UI.FieldGroup #Information2: {
//     $Type: 'UI.FieldGroupType',
//     Data : [{
//         $Type: 'UI.DataField',
//         Value: FirstName,
//     }, ],
// });

// annotate service.QHPersonnelAssignments with @(UI.FieldGroup #information3: {
//     $Type: 'UI.FieldGroupType',
//     Data : [{
//         $Type: 'UI.DataField',
//         Value: LastName,
//     }, ],
// });

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

annotate service.QHPersonnelAssignments with @(UI.FieldGroup #PersonID: {
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

annotate service.QHProfileGroups with @(UI.FieldGroup #Citizenshipresidencyvisa: {
    $Type: 'UI.FieldGroupType',
    Data : [{
        $Type: 'UI.DataField',
        Value: 'Citizen'
    }


    ],
});

annotate service.QHProfileGroups with @(UI.FieldGroup #Criminal: {
    $Type: 'UI.FieldGroupType',
    Data : [],
});
