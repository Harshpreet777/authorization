Boilerplate with Flavors
------------------------

-   **assets**  

    -   It will be located at "project/assets"

    -   This folder will keep all the local resources that we will use in our application. It can further contain subcategories like "fonts", "images" etc having the corresponding folders.

-   To make use of the contents of this folder we need to define it in pubspec.yaml.\
![](https://lh7-us.googleusercontent.com/BDVqACb4gUg_bC4v_dPyoKL9R7qjdb60ubbB5hUQFT0adO8DZI5Quokrkijv2YZOpSAhs3YhKoMa1sxanl_D4uLYUIYxbTZBntO5NxKmPfchoNNMI_Z6pqdRi3TbJ9kfD1QDOnTevW9AzHWn1YfsR7Y)

-   **lib**

    -   It will be located at "project/lib"

    -   This is the most important folder in a flutter project, everything that we code will sit here in most cases, if we are not using any platform-specific or native coding in our flutter application.

    -   "Here we will not have a main.dart file. We will have a folder named flavors, we will look into it in more detail in coming steps."

-   This boilerplate will contain following subcategories in lib folder:

    -   **constants**

    -   **controllers**

    -   **i18n**

    -   **models**

    -   **router**

    -   **store**

    -   **theme**

    -   **utils**

    -   **viewmodel**

    -   **views**

    -   **flavors**

![](https://lh7-us.googleusercontent.com/F2SmKZJXt4BwENVW2WGoPTTGh3JsGAGfGFuEt9odYeIEMLppEjPDMB5CvIDsvJTajOzT7vmLNYzTXz6r-BaW34TVRk9qSdLH53mesrqPBvvk2CLDiTKJ-Qb-elzxdUsFGT44GiwktGprM7SrFLqPFDY)

Let us understand one by one what each folder is going to do:

-   ### Constants 

-   This folder will contain all the constants that we will be using in our application.

-   It can be subcategorized into categories like api constants, string constants, message constants, enums etc.

![](https://lh7-us.googleusercontent.com/3EqvrUdpMm150OA4syX-RtbWIxCkyjE0wXSXcAtPKMyTFtap8yGmUtfsH1heVEGRBS1O3yBaH7iC2XvFwdfZlnp9bOMf1Zqwe-GtUsGuE3lIRp8u8Or-9sptZvd4gcZ38ZcBvnBhnJqeO0ZQCl1sHTU)

-   ### Controllers

    -   This folder will contain the code for all the network calls, in simpler language we can call it the "Network Layer" of our project.

    -   Essentially, it will contain a base api class which contains the generic method for all kind of requests i.e. GET, POST, PUT, DELETE, PATCH, in this project we are using Dio for making API calls.

-   ### i18n 

    -   This folder will contain json for using localization in the project.

    -   It can contain a json file for every language that we'll be using in the project.

-   ### Models

    -   This folder will contain the parsing models of every json object that we receive after a successful/unsuccessful API request. 

    -   It will contain a generic response class that will be used in the base API class we discussed earlier.

    -   Note: While making a response/request model make sure to remove the methods that are not in use, like toJson(), fromJson() etc.

-   ### Router

    -   This folder will contain our router class, that has all the navigation logic written as per Navigation 2.0 (route named navigation).

-   ### Store

    -   This folder will have any files or folders containing code for any local storage that we might use in our application.

    -   It can have files for SQLite, Shared preferences, secure storage, hive database etc.

-   ### Theme

    -   This folder will contain files for colors, themes, textstyles etc that will be used in the project.

-   ### Utils

    -   Utils folder will have folders like various helper functions, validation functions etc.

    -   Helper functions can have any general function that we can use in the entire application.

    -   Validation functions will contain validation logic for text inputs etc.

-   ### Viewmodels

    -   This folder will contain mostly all the business logic that will be used in the application.

    -   We are using Provider for state management in the given boilerplate.

    -   This will contain a generic viewmodel, which will have common functions or attributes like state variables, update UI methods etc for all the viewmodels.

    -   All the viewmodels that we make will be extension of the BaseViewModel in order to use the common functions.

-   ### Views

    -   This folder will contain the UI element of the application. 

    -   This will further be categorized into screens and widgets.

    -   Screen folder will contain the distinct screen UI.

    -   Widgets folder will contain common UI elements that will be used in the entire application or entire module of the project.

-   ### flavors

    -   While using flavors, we will make use of this folder.

    -   It will contain one main_common.dart file that will have the code with MaterialApp, it is the main entry point of our project, but it won't have runApp() method called in here.

    -   Now comes the interesting part, each flavor will have its own file, say prod environment will have a file main_prod.dart and here runApp() will be called by passing the class that we created in main_common.dart.

### Handling Flavors

#### Running application while using flavors

   - Using command

        -   Simple flutter run won't work out in the case of flavors. We will need to call the following command to run our app. 

        -   flutter run --flavor flavor_name -t corresponding_main_flavor_file_path

        -   E.g. flutter run --flavor qa -t lib/flavors/main_qa.dart

   -   Via VS Code

        -   In this boilerplate launch.json file has been configured with three flavors, prod, dev and qa.

        -   So in the located section there will be option to choose from any flavor, as shown below

![](https://lh7-us.googleusercontent.com/efMUc3akDpAQVoRRoiPiN_wJPS2KNPZ6wkyGFgsnkNs0WgkYt4yjIW0FNp2T6EtyjTy3JHCcvnj1mro6bcqXpTUWN6mbj70-y09eLvW_GScP3KcLkvV63gSlvPwD-dJz4TpeGCUucuyigm_qeUyZn90)

   -   Creating Build via command

        -   Simple flutter build apk won't work out in case of flavors. We will need to call the following command to build an android apk. 

        -   flutter build apk --release --flavor flavor_name -t corresponding_main_flavor_file_path or

        -   flutter build apk --release --obfuscate --split-debug-info=build/app/outputs/symbols --flavor flavor_name -t corresponding_main_flavor_file_path

        -   E.g. flutter build apk --release --flavor qa -t lib/flavors/main_qa.dart or

        -   flutter build apk --release --obfuscate --split-debug-info=build/app/outputs/symbols --flavor qa -t lib/flavors/main_qa.dart

   -   Adding/deleting flavors

        -   Android

            -   Just add/remove the object for your flavor in android/app/build.gradle as follows,\
![](https://lh7-us.googleusercontent.com/CTamBcXzqJzZ9n1KeQiQfrTFgCclCcBs8NgtPranNgWqA4CB3y_ZUPNOm8fkz059eQBSGqRasRKT7aCdvW2wcdVKP-f5pJCKuWZ6oxHLBP6HANtM17HuuJLffP-_OLK-qTSnhUV7XLiipiZAuVi86JQ)

        -   VS Code

            -   Just add / remove the flavor object from .vscode/launch.json as follows:

![](https://lh7-us.googleusercontent.com/nQWm96bcAEoeIv5Ew_vH-qY53zI5yc-_Kmbp7e5lB9f45dIpsnp9xtGdjOU0hmm3JDlXubl8y9mdfk2yMzZKEBPNNkkWU1chUtWHkTNXM_G4olmaLU43HPffNL2aANZF7MZYfGytIFn7O-C-pwbN_sw)

-   iOS

      -   Adding or removing flavors from iOS will take a few setup, let's see how we can add a new flavor or edit the existing one for iOS.

      -   Open XCode for your project > Product > Scheme > Manage Scheme

![](https://lh7-us.googleusercontent.com/qcNKzJc1KaqKaVGvjEJV408l-WNVMlW7xAJ8bcfpBHy9lnV6wHsFuEc-JV3WV24IOvZT3pOY9YqWEsXAy-qKNoSH9LQ_KaKfwUkqviYgBc5oB-dGBWJ_3PVIlRkGxp85R7LXhu9OarQ6O85CimNlZOQ)


    -  This will show all the existing flavors that we are using this boilerplate, we can delete any flavor from here if not required by clicking on "-" and can add a new one by clicking on "+".

      -   While adding a new flavor from here, make sure to select the target as "Runner" only.

![](https://lh7-us.googleusercontent.com/wwA_1UBtx3p4pDHGVFGp4aFU-I17gw3Io1a0n3WYikQPr9fuUUIR_iPhmdycCYajYq_DSF4sBo3ypmXrtbS7ts9AomlyLT9MLfzSlpMbof4izqr6CqygFI3pHRdWct6KNhicyLJY9xT94Y9AES3YC10)


      -   Once the scheme (flavor) is added we will need to make a few more changes.

![](https://lh7-us.googleusercontent.com/YWenK-EEFcInPttzCoBhwNhmBAEmM7ts3KcSRjca-MW223339GY4jPRpM9toOI5PK68I6oythNHXOwp1LGkTpb3SNdFxq-2wn_TKAT3FrCS23ovcbnrkHSp4k7d0QdfODMWFJklQVe8FTQnaDIGgNX4)

      -   Go to Project Runner > Info & add debug, profile and release as per the name of the scheme. E.g. Debug-flavorname, Profile-flavorname & Release-flavorname.

![](https://lh7-us.googleusercontent.com/7cr8xckW90mWvVrkvMkkPdt5NWkoKAMUX3YwhDg6GEq2AUrnbjq0BNeHNAlhHrMT48tmTZwIfhHsaK8V9XhE1Z18BGYobNW_5oNhvbu2VaT1PXtqAawRM9leUKZeZ05UtGTOqsWxfaEMTuHwcJ2YqxY)

      -   Go to Target Runner > Build Setting & change the display name of app as per different flavors, if required.

![](https://lh7-us.googleusercontent.com/Yzm_ykjfjjfrLXMeXvh2NaAaRXDoKSy46242K69mgP0stj_aav_zwPmY0p-W9XKNUpn-cMIcCeqXx25PRbhKoSq3-rtYaFLxKNKHUcEBCPcOBDTfGJVPqvGuMN0NoixHfqsbUN0JWIVb_ql3gTAAUHM)

      -   Open XCode for your project > Product > Scheme > Edit Scheme and add the respective configuration file for the flavor.

![](https://lh7-us.googleusercontent.com/DgTd_T75FqZ52Tp2DR9LtDAxKSxHPGc-OfHDuMftc9FddG-qWVDsH_2mFalyUfCD5BykTTRtD4-BW7oBvs0X398I5Yl4IW0f-rxpox22hElJB2BSlh1FlBDx12PYL0OR8NjbHSxIGMG6L2T0EfLoBkA)


**<Note:>** To use boilerplate without flavors, checkout to **dev** branch.
