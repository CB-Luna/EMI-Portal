const String queryODSAlignment = """
 query ODSAligmentContent {
  webOdsAlignment{
    data{
      attributes{
        Description
        OdsTable{
          Header1
          Header2
          projects{
            data{
              attributes{
                Name
                RelatedODS(sort: "name:asc", pagination: { limit: 20 }){
                  data{
                    attributes{
                      url
                    }
                  }
                }
              }
            }
          }
          
          
        }
        PgpSection{
          Description
          Compromisos(sort: "name:asc", pagination: { limit: 20 }){
            data{
              attributes{
                url
              }
            }
          }
        }
      }
    }
  }
  
}
  """;
