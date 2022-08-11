const String queryBlog = """
       query BlogContent {
      posts(sort: "Date:desc", pagination: { limit: 50 }){
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
  """;
