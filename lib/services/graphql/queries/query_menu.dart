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
          ButtonIcon{
            data{
              attributes{
                url
              }
            }
          }
        }
        FeaturedButton{
          ButtonText
          ButtonLink
        }
        SubMenu{
          ButtonText
          ButtonLink
          ButtonIcon{
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
