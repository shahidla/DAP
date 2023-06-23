using CatalogService as service from '../../srv/catalog-service';
using from '../uiproject/annotations';

annotate service.personDetail with @(UI.SelectionFields: [
    firstname,
    pid,
]);

annotate service.personDetail with {
    pid @Common.Label: 'Personal Number'
};

annotate service.personDetail with {
    posname @Common.Label: 'Position Name'
};

annotate service.personDetail with {
    pid @(
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'personDetail',
            Parameters    : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: pid,
                ValueListProperty: 'pid',
            }, ],
        },
        Common.ValueListWithFixedValues: true
    )
};

annotate service.personDetail with @(UI.LineItem: [
    {
        $Type: 'UI.DataField',
        Label: 'Person Number',
        Value: pid,
    },
    {
        $Type: 'UI.DataField',
        Label: 'Personnel Assignment Number',
        Value: pad,
    },
    {
        $Type: 'UI.DataField',
        Label: 'First Name',
        Value: firstname,
    },
    {
        $Type: 'UI.DataField',
        Label: 'Last Name',
        Value: lastname,
    },    
    {
        $Type: 'UI.DataField',
        Label: 'Position Name',
        Value: posname,
    },
    {
        $Type: 'UI.DataField',
        Label: 'AHPRA Registration',
        Value: ahpra,
    },
    {
        $Type: 'UI.DataField',
        Value: mobile,
        Label: 'Mobile',
    },
]);
// annotate service.personDetail with @(UI.LineItem: [
//     {
//         $Type: 'UI.DataField',
//         Label: 'person number',
//         Value: pid,
//     },
//     {
//         $Type: 'UI.DataField',
//         Label: 'pad',
//         Value: pad,
//     },
//     {
//         $Type: 'UI.DataField',
//         Label: 'name',
//         Value: name,
//     },
//     {
//         $Type: 'UI.DataField',
//         Label: 'position name',
//         Value: posname,
//     },
//     {
//         $Type: 'UI.DataField',
//         Label: 'ahpra',
//         Value: ahpra,
//     },
// ]);

annotate service.personDetail with @(
    UI.FieldGroup #GeneratedGroup1: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: 'Person number',
                Value: pid,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Personnel Assignment Number',
                Value: pad,
            },


        ],
    },
    UI.FieldGroup #GeneratedGroup2: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: 'Position Name',
                Value: posname,
            },
            {
                $Type: 'UI.DataField',
                Label: 'AHPRA Registration',
                Value: ahpra,
            },


        ],
    },
    UI.FieldGroup #GeneratedGroup3: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: 'Work',
                Value: work,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Position Id',
                Value: position,
            },
        ],
    },
    UI.FieldGroup #GeneratedGroup4: {
        $Type: 'UI.FieldGroupType',
        Data : [

            {
                $Type: 'UI.DataField',
                Label: 'Mobile',
                Value: mobile,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Email',
                Value: email,
            },
        ],
    },
    UI.FieldGroup #GeneratedGroup5: {
        $Type: 'UI.FieldGroupType',
        Data : [

            {
                $Type: 'UI.DataField',
                Label: 'Expiry Date',
                Value: expirydate,
            },
            {
                $Type: 'UI.DataField',
                Label: 'First Name',
                Value: firstname,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Last Name',
                Value: lastname,
            },            
        ],
    },
    UI.FieldGroup #GeneratedGroup6: {
        $Type: 'UI.FieldGroupType',
        Data : [


        ],
    },
    UI.Facets                     : [{
        $Type : 'UI.ReferenceFacet',
        Label : 'Passport Stamps',
        Target: '@UI.FieldGroup#GeneratedGroup6',
    }],
    UI.HeaderFacets               : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'GeneratedFacet1',
            Target: '@UI.FieldGroup#GeneratedGroup1',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'GeneratedFacet2',
            Target: '@UI.FieldGroup#GeneratedGroup2',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'GeneratedFacet3',
            Target: '@UI.FieldGroup#GeneratedGroup3',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'GeneratedFacet4',
            Target: '@UI.FieldGroup#GeneratedGroup4',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'GeneratedFacet5',
            Target: '@UI.FieldGroup#GeneratedGroup5',
        },
    ]
);
annotate service.personDetail with @(
    UI.HeaderInfo : {
        $Type : 'UI.HeaderInfoType',
        TypeName : 'Passports',
        TypeNamePlural : 'Passports',
        TypeImageUrl : '',
        ImageUrl : null,
    }
);
annotate service.personDetail with {
    firstname @Common.Label : 'First Name'
};
annotate service.personDetail with {
    firstname @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'personDetail',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : firstname,
                    ValueListProperty : 'firstname',
                },
            ],
        },
        Common.ValueListWithFixedValues : true
)};
