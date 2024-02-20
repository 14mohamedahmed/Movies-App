# Movies App

A new flutter app for TMDB movies, We are using thier APIs to showing the most popular movies.

## Getting Started

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
