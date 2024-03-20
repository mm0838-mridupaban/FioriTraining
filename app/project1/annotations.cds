annotate CatalogService.Books with @(
    UI.SelectionFields : [
        ID,
        stock,
        title,
    ]
);
annotate CatalogService.Books with {
    author @Common.Label : 'author'
};
annotate CatalogService.Books with {
    ID @Common.Label : 'ID'
};
annotate CatalogService.Books with {
    stock @Common.Label : 'stock'
};
using from '../../srv/cat-service';
using from '../../db/data-model';

annotate CatalogService.Books with {
    title @Common.Label : 'title'
};
annotate CatalogService.Books with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'ID',
            Value : ID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'title',
            Value : title,
        },
        {
            $Type : 'UI.DataField',
            Label : 'stock',
            Value : stock,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Author',
            Value : author,
        },
        {
            $Type : 'UI.DataFieldForAnnotation',
            Label : 'Supplier',
            Target : '@Communication.Contact',
            ![@UI.Importance] : #High,
        },
    ]
);
