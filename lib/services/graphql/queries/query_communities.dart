const String queryCommunity = """
       query CommunitiesContent {
      communities(sort: "Title:asc", pagination: { limit: 50 }){
        data{
          attributes{
            Title
            Gallery{
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
""";
