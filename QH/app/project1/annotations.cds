using CatalogService as service from '../../srv/catalog-service';
// New UI annotations
annotate service.PersonSrv with @(
    UI: {  SelectionFields: [name],
    LineItem       : [
        {
            $Type : 'UI.DataField',
            Label : 'pid',
            Value : pid,
        },
        {
            $Type : 'UI.DataField',
            Label : 'pan',
            Value : pan,
        },
        {
            $Type : 'UI.DataField',
            Label : 'name',
            Value : name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'posname',
            Value : posname,
        },
        {
            $Type : 'UI.DataField',
            Label : 'ahpra',
            Value : ahpra,
        },
    ],
}) {
    email @(title: 'Email');
    name @(title: 'Name');
    ahpra  @(title: 'AHPRA');
};

annotate service.PersonSrv with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'pid',
                Value : pid,
            },
            {
                $Type : 'UI.DataField',
                Label : 'pad',
                Value : pan,
            },
            {
                $Type : 'UI.DataField',
                Label : 'name',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'posname',
                Value : posname,
            },
            {
                $Type : 'UI.DataField',
                Label : 'ahpra',
                Value : ahpra,
            },
            {
                $Type : 'UI.DataField',
                Label : 'expirydate',
                Value : expirydate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'position',
                Value : position,
            },
            {
                $Type : 'UI.DataField',
                Label : 'work',
                Value : work,
            },
            {
                $Type : 'UI.DataField',
                Label : 'mobile',
                Value : mobile,
            },
            {
                $Type : 'UI.DataField',
                Label : 'email',
                Value : email,
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

annotate service.PersonSrv with @(
    UI.HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'section1',
            ID : 'section1',
            Target : '@UI.FieldGroup#section1',
        },
    ],
    UI.FieldGroup #section1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataFieldForAnnotation',
                Target : '@Communication.Contact#contact',
                Label : 'Contact Name',
            },
            {
                $Type : 'UI.DataFieldForAnnotation',
                Target : '@Communication.Contact#contact1',
                Label : 'Contact Name',
            },],
    }
);
annotate service.PersonSrv with @(
    Communication.Contact #contact : {
        $Type : 'Communication.ContactType',
        fn : position,
    }
);
annotate service.PersonSrv with @(
    Communication.Contact #contact1 : {
        $Type : 'Communication.ContactType',
        fn : name,
    }
);
annotate service.PersonSrv with @(
    UI.HeaderInfo : {
        TypeName : 'Test',
        TypeNamePlural : 'Tests',
    }
);
