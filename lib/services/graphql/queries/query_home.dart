const String queryHome = """
    query HomeContent{
  webHome{
    data{
      attributes{
        VideoHeader{
          data{
            attributes{
              url
            }
          }
        }
        Rows{
          Icon{
            data{
              attributes{
                url
              }
            }
          }
          Title
          Description
          Picture{
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
