using CatalogService as service from '../../srv/cat-service';

// ---------------------------------------------List Page------------------------------->>>>>>>>>>>>>>>>

// adding columns
annotate service.Books with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : 'ID',
            ![@UI.Importance] : #High

        },
        {
            $Type : 'UI.DataField',
            Value : author,
            Label : 'author',
            ![@UI.Importance] : #High

        },
        // commented stock column so that the progress for stock column we can show,or else getting error for duplicate keys
        // {
        //     $Type : 'UI.DataField',
        //     Value : stock,
        //     Label : 'stock',
        // },
        {
            $Type : 'UI.DataField',
            Value : title,
            Label : 'title',
            ![@UI.Importance] : #High
        },
        // adding progress bar for column stock --1
        {
            $Type : 'UI.DataFieldForAnnotation',
            Target : '@UI.DataPoint#stock',
            Label : 'Instock',
            ![@UI.Importance] : #High

        },
    ]
);
// adding filter for author ---- starts--------->>>>
annotate service.Books with @(
    UI.SelectionFields : [
        author,
    ]
);
annotate service.Books with {
    author @Common.Label : 'author'
};
// adding filter for autor ---- ends---------<<<<

// adding progress bar for column stock --2
annotate service.Books with @(
    UI.DataPoint #stock : {
        Value : stock,
        Visualization : #Progress,
        TargetValue : 1000,
    }
);

// ---ComboBox in out
annotate service.Books {
    author @Common.ValueList: {
        Label         : 'author',
        CollectionPath: 'Books',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterOut',
                LocalDataProperty: 'author',
                ValueListProperty: 'author'
            },
            {
                $Type            : 'Common.ValueListParameterIn',
                LocalDataProperty: 'author',
                ValueListProperty: 'author'
            }
        ]
    }
}




// ---------------------------------------------List Page------Ends-------------------------<<<<<<<<



// -------------------------------------------------Object Page----------------------------------->>>>>>>>>>>>

// adding "header section" in object page------>>>>
annotate service.Books with @(
    UI.DataPoint #title : {
        $Type : 'UI.DataPointType', //Target : '@UI.DataPoint#title',
        Value : title,
        Title : 'title',
    },
    UI.HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet', //ading data point
            ID : 'title',
            Target : '@UI.DataPoint#title',
        },
        {
            $Type : 'UI.ReferenceFacet', //adding micro chart bullet
            ID : 'stock',
            Target : '@UI.Chart#stock',
        },
        {
            $Type : 'UI.ReferenceFacet', //adding micro chart Radial
            ID : 'stock1',
            Target : '@UI.Chart#stock1',
        },
    ]
);
annotate service.Books with @(
    UI.DataPoint #stock1 : {
        Value : stock,
        MinimumValue : 0,
        MaximumValue : 1000,
    },
    UI.Chart #stock : {
        ChartType : #Bullet, //Target : '@UI.Chart#stock',
        Title : 'stock',
        Measures : [
            stock,
        ],
        MeasureAttributes : [
            {
                DataPoint : '@UI.DataPoint#stock1',
                Role : #Axis1,
                Measure : stock,
            },
        ],
    }
);
annotate service.Books with @(
    UI.DataPoint #stock2 : {
        Value : stock,
        TargetValue : stock,
    },
    UI.Chart #stock1 : { 
        ChartType : #Donut, ////Target : 'UI.Chart #stock1',
        Title : 'stock',
        Measures : [
            stock,
        ],
        MeasureAttributes : [
            {
                DataPoint : '@UI.DataPoint#stock2',
                Role : #Axis1,
                Measure : stock,
            },
        ],
    }
);
// <<<<<<<<--------------------<<<<<<<<<<<<<<