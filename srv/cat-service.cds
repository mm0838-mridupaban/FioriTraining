using my.bookshop as my from '../db/data-model';

service CatalogService {
     entity Books as projection on my.Books actions{
      action CustomInbound(ID : String, title  : String,stock  : Integer,author  : String) returns String;
         
     };
     action CustomCreateUnbound(ID : String, title  : String,stock  : Integer,author  : String) returns String;
}

annotate  CatalogService.Books with @odata.draft.enabled; //Receiving error in both way either cat-service.cds or anotation.cds


//When false, create button will not work i.e we button will be there, if we click on it nothing happens
annotate CatalogService.Books with @(
  Capabilities.InsertRestrictions : {
    Insertable : true,
  }
);


// If we dont add the below code, by default delete button will be visible and working fine
//When false, delete button will not even be present. i.e remove delete button
annotate CatalogService.Books with @(
 Capabilities.DeleteRestrictions : {
    Deletable :isDeletable
//     Deletable :true
  }
);




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