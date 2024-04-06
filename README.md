# 1. Github workflow

You will clone this github repository: https://github.com/sindrila/business-pages
Please do not use the command line exclusively, I had to make 4 pull requests to successfully push some files and I got really scared. Use github desktop or visual studio integration.

Important stuff:
- The `main` branch represents the stable, functional codebase.
- No direct commits are made to the `main` branch.
- For each feature or manageable chunk of work, create a new branch off the `main` branch.
- Name branches descriptively: e.g., `business-profile-creation`, `business-search`, `user-reviews`.
- Commit regularly with clear commit messages.
- When a feature is complete, create a pull request to merge it into the `main` branch.
Learn here: [https://learngitbranching.js.org/](https://learngitbranching.js.org/ "https://learngitbranching.js.org/")

**Everybody should create a test branch on the repository, create a file, commit and merge. You should do this in order to familiarise yourselves with how we'll work.**

Remember to 'git pull' the repository everytime before working on it. That way, you get all the files that other people pushed.

# 2. Documentation

## Typing conventions

**Constante**: ALL_CAPS_UNDERSCORE
**Clase**: PascalCase
Methods, properties, fields, variables, parameters **PRIVATE**: \_camelCase
Methods, properties, fields, variables, parameters **PUBLICE**: PascalCase

### **Names**

**Metode**: predicat si subiect (AddObject, RemoveObject)
**Proprietati**: substantive si booleane (BusinessName, IsLoggedIn)
**Interfete**: incep cu “I” (IComparable, IRepository) ca la MAP

## Documentation 

For functions that are harder to understand than a getter or setter, please please please use **comments**.
If you place the cursor above a method declaration in Visual Studio and press `/` three times you will see a context-specific template generated for you like this:

```csharp
    /// <summary>
    /// 
    /// </summary>
    /// <param name="arg1"></param>
    /// <param name="arg2"></param>
    /// <returns></returns>
```

More info: https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/language-specification/documentation-comments

# 3. MVVM Design pattern

We will use the Model View ViewModel (MVVM) design pattern. It's very similar to the MPP app:
1. **Presentation Layer (View):**
   * **Components:** This layer consists of WPF UI elements like buttons, text boxes, lists, and layouts. XAML is used to define the UI and its visual appearance.
   * **Responsibilities:** 
       * Presents data to the user through UI elements.
       * Captures user interactions through events (button clicks, text input, etc.).
       * Binds UI elements to properties exposed by the ViewModel layer. This binding allows for automatic updates in the UI when the underlying data changes. 

2. **Business Logic Layer (ViewModel):**
   * **Components:** This layer is composed of ViewModel classes. Each ViewModel typically corresponds to a view or a section of the UI.
   * **Responsibilities:**
       * Acts as an intermediary between the View and the Model layer.
       * Prepares data for display in the View (formatting, filtering).
       * Handles user interactions triggered by the View (e.g., button clicks).
       * Exposes observable properties that reflect the underlying data. Changes to these properties automatically trigger updates in the bound UI elements.
       * Communicates with the Model layer to retrieve or update data.
   Think of ViewModel as a Service layer.

3. **Data Access Layer (Model):**
   * **Components:** This layer consists of classes that represent the data model of your application.  Examples include User, Business, Post, Comment, etc.
   * **Responsibilities:**
       * Defines data structures and properties for your application entities.
       * Provides methods for interacting with the data source (in this case, XML files). This may include functionalities for saving, loading, adding, and deleting data.

**Communication Between Layers:**

* **View to ViewModel:**
    * The View typically binds to properties exposed by the ViewModel using a data binding mechanism provided by WPF. 
    * User interactions with UI elements (e.g., button clicks) are typically translated into method calls on the ViewModel.
* **ViewModel to Model:**
    * The ViewModel interacts with the Model layer to retrieve or update data. This may involve calling methods on the Model classes to access or modify data in the data store (XML files in this case).
* **Model to ViewModel (Data Updates):**
    * The Model layer often doesn't directly communicate with the ViewModel. However, when data in the data store changes (e.g., after a save operation), the ViewModel can be notified of these changes through events or other mechanisms (implementations may vary). This allows the ViewModel to update the UI accordingly.

**Class Placement Examples:**

* **User.cs (Model):** This class would reside in the Model layer and define properties for username, password (hashed for security), etc.
* **BusinessProfileViewModel.cs (ViewModel):** This class would reside in the ViewModel layer and handle functionalities for creating, viewing, and editing business profiles. It would expose properties for business name, description, category, logo, etc., and bind them to corresponding UI elements in the View.
* **PostFeedView.xaml (View):** This XAML file would define the UI layout for displaying a list of posts, potentially including elements for post content, author, comments, etc. It would bind these elements to properties exposed by a corresponding ViewModel.
## IMPORTANT READ FOR EVERYONE: https://learn.microsoft.com/en-us/dotnet/architecture/maui/mvvm 
# 4. App architecture

For our app, we will be having these layers:

1. **Presentation Layer (View):** UI-only, defining how the app will look. This layer uses WPF (Windows Presentation Foundation) components to define the user interface (UI) elements like buttons, text boxes, and layouts. XAML (Extensible Application Markup Language) will be used to design the UI and bind it to the ViewModel layer. The buttons and forms should do nothing on their on, they should talk to the business logic layer.
2. **Business Logic Layer (ViewModel):** This layer acts as the intermediary between the UI and the data access layer. It handles user interactions, data manipulation, and exposes observable properties for the View. Example class: Business Profile. The Business class in in the Model layer, but the Business Profile class handles the Business data (retrieval of business info) as well as the user interaction from the View (liking a post).
3. **Data Access Layer (Model):** This layer handles data persistence and retrieval. We'll use XML serialization/deserialization to store and load data from XML files. This layer can be further abstracted to potentially integrate with a database in the future.

- ### 1. High-Priority Features (Phase 1):
    
    - **User Management (ViewModel & Model):** Develop a basic user class with properties like username, password (hashed and salted for Imre, ask chat gpt). Implement functionalities for user login (hardcoded users initially, later integration with the separate login team's solution). **Stiu ca Narcis Grecu se ocupa de useri, dar habar nu am cum se numeste grupa lui pe github so if y'all could find out that would be great**
    - **Business Profile (ViewModel & Model):** Design classes for Business and its related data (name, description, category, logo, contact info, location). Implement functionalities for creating, viewing, and editing business profiles. 
    - **Content Management (ViewModel & Model):** Create Post and Comment classes. Implement functionalities for creating and displaying post feeds with comments (like/comment functionality). **Cross reference group *blank* on github for feed and post information**
    - **Data Access (Model):** Develop services for saving and loading data to/from XML files using serialization/deserialization techniques.
    - **UI (View):** Design core UI elements using XAML for login, signup (temporary for now), business profile browsing and editing, and the user landing page.

- ### 2.  **Medium-Priority Features (Phase 2):**
    
    - **Search Functionality (ViewModel & View):** Implement functionalities for searching businesses by name and potentially add filtering by location (using address) or category. Update UI to incorporate search features.
    - **Review System (ViewModel & Model):** Create a Review class with rating and comments. Implement functionalities for viewing and leaving reviews on business profiles. Update UI to display reviews.
    - **Contact Management (ViewModel & View):** Design functionalities for displaying contact information (phone, email) and potentially FAQs for businesses. Update UI to show contact information and FAQs.

- ### 3. **Low-Priority Features (Phase 3):**
    
    - **Business page administrator roles (Optional):** Add different roles for managing the business page.
    - **User Account Management (Optional):** If time permits, implement functionalities for user sending/accepting business management invitations 


# 5. Phase 1 tasks

- **User Management:** Development of the User class (Model) and the UserService class (ViewModel).
- **Business Profile Management:** Development of Business class (Model) and BusinessService class (ViewModel) for creating, viewing, and editing profiles. This may include collaborating with the UI developer on profile display aspects.
- **Content Management:** Development of Post, Comment classes (Model) and PostService, Comment service classes (ViewModel) related to post creation, display, and comments to a team member. They will collaborate with the UI developer on integrating post feeds and comment interactions.
- **UI Development:** UI development using XAML to a team member who will collaborate with ViewModel developers to bind data and user interactions to the UI elements. They will be responsible for designing login, signup (temporary), business profile browsing, and other core UI components. There will be two people working on this.
- **Data Access:** Development of data access functionalities (saving/loading from XML) of class data. Unfortunately, to create this, the person has to wait for the creation of all classes. In the meantime, please look into XML and .NET integration.
