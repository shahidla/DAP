using CatalogService as service from '../../srv/catalog-service';
using from '../uiproject/annotations';

annotate service.personDetail with @(
    UI.SelectionFields : [
        name,
        pid,
    ]
);
annotate service.personDetail with {
    pid @Common.Label : 'Personal Number'
};
annotate service.personDetail with {
    name @Common.Label : 'Position Name'
};
annotate service.personDetail with {
    pid @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'personDetail',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : pid,
                    ValueListProperty : 'pid',
                },
            ],
        },
        Common.ValueListWithFixedValues : true
)};
annotate service.personDetail with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'person number',
            Value : pid,
            Criticality : pid,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Personnel Assignment Number',
            Value : pad,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Full Name',
            Value : name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Position Name',
            Value : posname,
        },
        {
            $Type : 'UI.DataField',
            Label : 'AHPRA Registration',
            Value : ahpra,
        },
    ]
);
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
                Label: 'Personnel Assignment Number',
                Value: pad,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Full Name',
                Value: name,
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
            {
                $Type: 'UI.DataField',
                Label: 'Expiry Date',
                Value: expirydate,
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
