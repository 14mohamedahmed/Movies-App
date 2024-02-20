# Movies App

A new flutter app for TMDB movies, We are using thier APIs to showing the most popular movies.

## Getting Started

-> How To use:-

  1- clone the app from [repo link](https://github.com/14mohamedahmed/Movies-App.git)
  
  2- open api_constants.dart in path root-> core-> network-> api_constants.dart set your access token you can generate one from [TMDB movies](https://www.themoviedb.org/)

  3- run the app using ```flutter run``` command line

-> What we are using:-

  1- Clean Architecture
  
  2- Bloc pattern as state management to handle app data and states
  
  3- get_it package to inject all services inside it as singelton instance
  
  4- dio package to handle HTTP requests to server
  
-> Folder strucutre 
  
  ```
    - root
      - Core
        - network
        - utilies
      - features
        - configurations
          - data
            - datasource
            - models
            - repository
          - domain
            - entities
            - repository
            - usecases
        - movies
          - data
            - datasource
            - models
            - repository
          - domain
            - entities
            - repository
            - usecases
          - presentations
            - controller
            - screens
            - widgets
  ```
