# Shortly App

Application that converts your link to short link.Created with flutter.

## Getting Started

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  cupertino_icons: ^1.0.2
  provider: ^4.0.0
  dio: ^4.0.0
  share: ^2.0.4
  flutter_svg: ^0.22.0
  flutter_launcher_icons: ^0.9.2
``` 
You can install packages from the command line:

```bash
$ pub get
..
```

While creating the application, I first made the design screens, then I created the textfromfield field of the application with the stack structure. After this 	stage, I created a model structure with provider, saved the data in the provider list and displayed it on the second screen. Then, I made the application work by 	posting with the dio service. Additionally I added theme switcher to the app.

what i can't create in the app
 => I wanted to save the data I extracted with the shared preferences structure for the application with the heart button and transfer it to another list, but I could not register to the list. Apart from this, the color of the button does not change when pressed, the codes are written, but it is not active in the application, similarly, the validate does not work for the textfromfield, I do not understand why they do not work. In addition, according to some situations, it may take a long time for the data screen to appear and the response from the API.



 Folder Type
 
 
    ├── main.dart
    └── src
        ├── config
        │   ├── constants
        │      ├── image_constants.dart
        │      └── text_constants.dart
        │                
        ├── model
        │   └── provider_model.dart
        ├── screens
        │   ├── view
				│      ├── homepage.dart
       	│      └── link_list_page.dart      
        ├── service
        │   └── api_service.dart
        └── utils
            ├── extensions
            │   └── context_extensions.dart
						│
						└── widgets
								└── stack.dart
		
		
								
		
