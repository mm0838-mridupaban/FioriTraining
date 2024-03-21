namespace my.bookshop;

entity Books {
  key ID : Integer;
  title  : String;
  stock  : Integer;
  author  : String;
  isDeletable: Boolean;
}

// entity Author {
//   key ID : Integer;
//   name  : String;
//   phone  : String;
//   email  : String;
// }