const String queryFriendsChange = """
  query FriendsChangeContent {
  webFriendsChange{
    data{
      attributes{
        Amigos{
          Title
          Picture{
            data{
              attributes{
                url
              }
            }
          }
          Categories{
            Icon{
              data{
                attributes{
                  url
                }
              }
            }
            Title
            Description
          }
        }
        Patrocinios{
          Description
        }
        Form{
          Field{
            Icon{
              data{
                attributes{
                  url
                }
              }
            }
            Description
            isMail
            isPhone
            InputLength
          }
          Button{
            ButtonText
            ButtonLink
            ButtonIcon
          }
        }
      }
    }
  }
  
}
  """;