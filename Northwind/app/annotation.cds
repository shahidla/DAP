using CatalogService as service from '../srv/catalog-service';

annotate service.Employees with @(UI : {
    //basic list report annotations
    //the presentation variant defines a per default ascending sorting for the LR table
    //https://github.com/SAP/odata-vocabularies/blob/master/vocabularies/Common.md#SortOrderType
    // PresentationVariant : {
    //     SortOrder      : [{
    //         $Type    : 'Common.SortOrderType',
    //         Property : priority_code
    //     }],
    //     Visualizations : ['@UI.LineItem']
    // },
    //the lineItem annotation defines the table columns for UI display of the annotated entity
    //https://github.com/SAP/odata-vocabularies/blob/master/vocabularies/UI.md#LineItem
    //Table columns are defined by building blocks of type DataFieldAbstract
    //https://github.com/SAP/odata-vocabularies/blob/master/vocabularies/UI.md#DataFieldAbstract
    LineItem : [
        {
            $Type : 'UI.DataField',
            Value : Pid
        },
        {
            $Type : 'UI.DataField',
            Value : Pfname
        },
        {
            $Type : 'UI.DataField',
            Value : Plname
        },
        //insert your line item enhancement here
        {
            $Type : 'UI.DataField',
            Value : Pareg
        }
    ],

    //the managed associations incidentStatus, category and priority provide a denormalized _code property to the root entity SafetIncidents
    //Documentation managed associations: https://cap.cloud.sap/docs/guides/domain-models#use-managed-associations
    //usage of aspect sap.common.codelist for the associated entities automatically provides value help support for the selection fields
    //the entity definitions can be found in file db/schema.cds
    //Documentation codelists: https://cap.cloud.sap/docs/cds/common#aspect-sapcommoncodelist
        
    SelectionFields : [
        Pid,
        Pfname,
        //insert your selection fields enhancement here
        Plname
    ],

    //	Information for the header area of an entity representation
    HeaderInfo : {
        TypeName       : '{i18n>Incident}',
        TypeNamePlural : '{i18n>Incidents}',
        TypeImageUrl   : 'sap-icon://alert',
        Title          : {Value : Pfname},
        Description    : {Value : Plname}
    },

    //Facets for additional object header information (shown in the object page header)
    HeaderFacets                         : [{
        $Type  : 'UI.ReferenceFacet',
        Target : '@UI.FieldGroup#HeaderGeneralInformation'
    }],

    //Group of fields with an optional label
    //https://github.com/SAP/odata-vocabularies/blob/master/vocabularies/UI.md#FieldGroupType
    FieldGroup #HeaderGeneralInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                Value : Pfname
            },
            {
                Value : Plname
            },
            {
                Value : Phloc
            },
            // {
            //     $Type  : 'UI.DataFieldForAnnotation',
            //     Target : 'PfnameassignedIndividual/@Communication.Contact',
            //     Label  : '{i18n>AssignedContact}'
            // }
        ]
    },

    FieldGroup #IncidentDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : Pfname
            },
            {
                $Type : 'UI.DataField',
                Value : Plname
            },
            //insert your field group enhancement here 
            {
                $Type : 'UI.DataField',
                Value : Phloc
            }            
       ]
    },

    //insert your new field group here
    FieldGroup #GeneralInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : Pmphone,
            },
            {
                $Type : 'UI.DataField',
                Value : Pwphone,
            },
            {
                $Type : 'UI.DataField',
                Value : Pemail,
            },
        ],
    },


    //object page content area is organized by facets referring to e.g. fieldgroup and lineItem annotations
    //https://github.com/SAP/odata-vocabularies/blob/master/vocabularies/UI.md#Facet    
    Facets : [
        {
            $Type  : 'UI.CollectionFacet',
            Label  : '{i18n>IncidentOverview}',
            ID     : 'IncidentOverviewFacet',
            Facets : [
                {
                    $Type  : 'UI.ReferenceFacet',
                    Label  : '{i18n>IncidentDetails}',
                    ID     : 'IncidentDetailsFacet',
                    Target : '@UI.FieldGroup#IncidentDetails'
                },
                //insert your reference facet enhancement here
                //insert your reference facet enhancement here
                {
                    $Type : 'UI.ReferenceFacet',
                    Target : '@UI.FieldGroup#GeneralInformation',
                    Label : '{i18n>GeneralInformation}',
                    ID : 'GeneralInformationFacet',
                },

            ]
        }
        //this facet shows a table on the object page by referring to a lineItem annotation via association incidentFlow
        //the referred LineItem annotation definition for entity IncidentFlow is defined below
        // {
        //     $Type         : 'UI.ReferenceFacet',
        //     Label         : '{i18n>IncidentProcessFlow}',
        //     ID            : 'ProcessFlowFacet',
        //     Target        : 'incidentFlow/@UI.LineItem',
        //     ![@UI.Hidden] : isDraft
        // }
    ]
});