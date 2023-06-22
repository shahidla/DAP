using CatalogService as service from '../../srv/catalog-service';

annotate service.personDetail with @(UI.LineItem: [
    {
        $Type: 'UI.DataField',
        Label: 'person number',
        Value: pid,
    },
    {
        $Type: 'UI.DataField',
        Label: 'pad',
        Value: pad,
    },
    {
        $Type: 'UI.DataField',
        Label: 'name',
        Value: name,
    },
    {
        $Type: 'UI.DataField',
        Label: 'position name',
        Value: posname,
    },
    {
        $Type: 'UI.DataField',
        Label: 'ahpra',
        Value: ahpra,
    },
]);

annotate service.personDetail with @(
    UI.FieldGroup #GeneratedGroup1: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: 'person number',
                Value: pid,
            },
            {
                $Type: 'UI.DataField',
                Label: 'pad',
                Value: pad,
            },
            {
                $Type: 'UI.DataField',
                Label: 'name',
                Value: name,
            },

        ],
    },
    UI.FieldGroup #GeneratedGroup2: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: 'position name',
                Value: posname,
            },
            {
                $Type: 'UI.DataField',
                Label: 'ahpra',
                Value: ahpra,
            },
            {
                $Type: 'UI.DataField',
                Label: 'expirydate',
                Value: expirydate,
            },
           

        ],
    },
    UI.FieldGroup #GeneratedGroup3: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: 'work',
                Value: work,
            },
            {
                $Type: 'UI.DataField',
                Label: 'position id',
                Value: position,
            },
        ],
    },
     UI.FieldGroup #GeneratedGroup4: {
        $Type: 'UI.FieldGroupType',
        Data : [
            
            {
                $Type: 'UI.DataField',
                Label: 'mobile',
                Value: mobile,
            },
            {
                $Type: 'UI.DataField',
                Label: 'email',
                Value: email,
            },
        ],
    },
    UI.Facets                     : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'GeneratedFacet4',
        Label : 'Passport Details',
        Target: '@UI.FieldGroup#GeneratedGroup3',
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
    ]
);

// annotate service.personDetail with @(UI.SelectionFields: [
//     posname,
//     pid,
// ]);

annotate service.personDetail with @(UI.HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : 'Passports',
    TypeNamePlural: 'Passports',
    // Title         : {
    //     $Type: 'UI.DataField',
    //     Value: name,
    // },
    // Description   : {
    //     $Type: 'UI.DataField',
    //     Value: pid,
    // },
    TypeImageUrl  : 'REPLACE_WITH_TYPEIMAGE_PATH',
    ImageUrl      : 'REPLACE_WITH_IMAGE_URL_PATH',
});

annotate service.personDetail with @(UI.DataPoint #test1: {
    $Type      : 'UI.DataPointType',
    Title      : 'position',
    Value      : position,
    Criticality: position,
});
annotate service.personDetail with {
    name @Common.Label : 'posName'
};
annotate service.personDetail with {
    name @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'personDetail',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : name,
                    ValueListProperty : 'posname',
                },
            ],
        },
        Common.ValueListWithFixedValues : true
)};
