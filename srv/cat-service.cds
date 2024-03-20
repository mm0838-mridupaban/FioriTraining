using my.bookshop as my from '../db/data-model';

service CatalogService {
     entity Books as projection on my.Books;
}


// annotate CatalogService.Books with @(
//     UI.LineItem : [
//         {
//             $Type : 'UI.DataField',
//             Label : 'ID',
//             Value : ID,
//         },
//         {
//             $Type : 'UI.DataField',
//             Label : 'title',
//             Value : title,
//         },
//         {
//             $Type : 'UI.DataField',
//             Label : 'stock',
//             Value : stock,
//         },
//         {
//         $Type : 'UI.DataFieldForAnnotation',
//         Label : 'Supplier',
//         Target : '@Communication.Contact',
//         ![@UI.Importance] : #High
//     },
//     ],
//     Communication.Contact : {
//     fn : title,
//     email : [
//         {
//             type :#work,
//             address : title
//         },
        
//     ],

// }

// );
// annotate CatalogService.Books with @(
//     UI.FieldGroup #GeneratedGroup1 : {
//         $Type : 'UI.FieldGroupType',
//         Data : [
//             {
//                 $Type : 'UI.DataField',
//                 Label : 'ID',
//                 Value : ID,
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Label : 'title',
//                 Value : title,
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Label : 'stock',
//                 Value : stock,
//             },
//         ],
//     },
//     UI.Facets : [
//         {
//             $Type : 'UI.ReferenceFacet',
//             ID : 'GeneratedFacet1',
//             Label : 'General Information',
//             Target : '@UI.FieldGroup#GeneratedGroup1',
//         },
//     ],
    

// );