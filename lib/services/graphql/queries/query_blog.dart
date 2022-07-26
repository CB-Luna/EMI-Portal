const String queryBlog = """
  query BlogContent{
  webBlog{
    data{
      attributes{
        posts(sort: "Date:asc", pagination: { limit: 50 }){
          data{
            attributes{
              Title
              Date
              Picture{
                data{
                  attributes{
                    url
                  }
                }
              }
              Description
              Slug
            }
          }
        }
      }
    }
  }
}
  """;
