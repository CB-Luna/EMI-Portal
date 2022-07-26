const String queryMenu = """
    query MenuContent{
  webMenu{
    data{
      attributes{
        logo{
          data{
            attributes{
              url 
              
            }
          }
        }
        MainMenu{
          ButtonText
          ButtonLink
        }
        FeaturedButton{
          ButtonText
          ButtonLink
        }
        SubMenu{
          ButtonText
          ButtonLink
        }
      }
    }
  }
}
  """;
