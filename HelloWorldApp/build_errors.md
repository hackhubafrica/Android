➜  HelloWorldApp ls app/build 
generated  intermediates
➜  HelloWorldApp ls app/build/generated 
source
➜  HelloWorldApp ls app/build/generated/source/            
buildConfig
➜  HelloWorldApp 
➜  HelloWorldApp ls app/build/generated/source/buildConfig/debug 
com
➜  HelloWorldApp ls app/build/generated/source/buildConfig/debug/com 
example
➜  HelloWorldApp 
➜  HelloWorldApp ls app/build/generated/source/buildConfig/debug/com/example 
helloworldapp
➜  HelloWorldApp ls app/build/generated/source/buildConfig/debug/com/example/helloworldapp 
BuildConfig.java
➜  HelloWorldApp ls app/build 
generated  intermediates
➜  HelloWorldApp ls app/src/main/java 
com
➜  HelloWorldApp        l
total 36K
drwxr-xr-x 4 dante dante 4.0K Feb  2 03:59 app
drwxr-xr-x 3 dante dante 4.0K Feb  2 03:47 build
-rw-r--r-- 1 dante dante  246 Feb  2 03:57 build.gradle
drwxr-xr-x 3 dante dante 4.0K Feb  2 03:37 gradle
-rwxr-xr-x 1 dante dante 8.6K Feb  2 03:37 gradlew
-rw-r--r-- 1 dante dante 2.9K Feb  2 03:37 gradlew.bat
-rw-r--r-- 1 dante dante   50 Feb  2 03:52 settings.gradle
➜  HelloWorldApp n gradle.properties       

➜  HelloWorldApp ./gradlew app:assembleDebug
> Task :app:mergeDebugResources FAILED

> Task :app:processDebugMainManifest
package="com.example.helloworldapp" found in source AndroidManifest.xml: /home/dante/Documents/HelloWorldApp/app/src/main/AndroidManifest.xml.
Setting the namespace via a source AndroidManifest.xml's package attribute is deprecated.
Please instead set the namespace (or testNamespace) in the module's build.gradle file, as described here: https://developer.android.com/studio/build/configure-app-module#set-namespace
This migration can be done automatically using the AGP Upgrade Assistant, please refer to https://developer.android.com/studio/build/agp-upgrade-assistant for more information.
/home/dante/Documents/HelloWorldApp/app/src/main/AndroidManifest.xml:10:9-15:20 Error:
        android:exported needs to be explicitly specified for element <activity#com.example.helloworldapp.MainActivity>. Apps targeting Android 12 and higher are required to specify an explicit value for `android:exported` when the corresponding component has an intent filter defined. See https://developer.android.com/guide/topics/manifest/activity-element#exported for details.

See http://g.co/androidstudio/manifest-merger for more information about the manifest merger.


> Task :app:processDebugMainManifest FAILED

[Incubating] Problems report is available at: file:///home/dante/Documents/HelloWorldApp/build/reports/problems/problems-report.html

FAILURE: Build completed with 2 failures.

1: Task failed with an exception.
-----------
* What went wrong:
Execution failed for task ':app:mergeDebugResources'.
> A failure occurred while executing com.android.build.gradle.internal.res.ResourceCompilerRunnable
   > Resource compilation failed (Failed to compile resource file: /home/dante/Documents/HelloWorldApp/app/src/main/res/layout/activity_date.xml: . Cause: javax.xml.stream.XMLStreamException: ParseError at [row,col]:[14,37]
     Message: The entity name must immediately follow the '&' in the entity reference.). Check logs for more details.

* Try:
> Run with --stacktrace option to get the stack trace.
> Run with --info or --debug option to get more log output.
> Run with --scan to get full insights.
> Get more help at https://help.gradle.org.
==============================================================================

2: Task failed with an exception.
-----------
* What went wrong:
Execution failed for task ':app:processDebugMainManifest'.
> Manifest merger failed : android:exported needs to be explicitly specified for element <activity#com.example.helloworldapp.MainActivity>. Apps targeting Android 12 and higher are required to specify an explicit value for `android:exported` when the corresponding component has an intent filter defined. See https://developer.android.com/guide/topics/manifest/activity-element#exported for details.

* Try:
> Run with --stacktrace option to get the stack trace.
> Run with --info or --debug option to get more log output.
> Run with --scan to get full insights.
> Get more help at https://help.gradle.org.
==============================================================================

Deprecated Gradle features were used in this build, making it incompatible with Gradle 9.0.

You can use '--warning-mode all' to show the individual deprecation warnings and determine if they come from your own scripts or plugins.

For more on this, please refer to https://docs.gradle.org/8.12/userguide/command_line_interface.html#sec:command_line_warnings in the Gradle documentation.

BUILD FAILED in 17s
9 actionable tasks: 7 executed, 2 up-to-date
➜  HelloWorldApp ls -lah app/build/outputs/apk/debug/

ls: cannot access 'app/build/outputs/apk/debug/': No such file or directory
➜  HelloWorldApp ./gradlew clean
./gradlew --refresh-dependencies
./gradlew app:assembleDebug


[Incubating] Problems report is available at: file:///home/dante/Documents/HelloWorldApp/build/reports/problems/problems-report.html

Deprecated Gradle features were used in this build, making it incompatible with Gradle 9.0.

You can use '--warning-mode all' to show the individual deprecation warnings and determine if they come from your own scripts or plugins.

For more on this, please refer to https://docs.gradle.org/8.12/userguide/command_line_interface.html#sec:command_line_warnings in the Gradle documentation.

BUILD SUCCESSFUL in 1s
1 actionable task: 1 executed

> Task :help

Welcome to Gradle 8.12.

To run a build, run gradlew <task> ...

To see a list of available tasks, run gradlew tasks

To see more detail about a task, run gradlew help --task <task>

To see a list of command-line options, run gradlew --help

For more detail on using Gradle, see https://docs.gradle.org/8.12/userguide/command_line_interface.html

For troubleshooting, visit https://help.gradle.org

[Incubating] Problems report is available at: file:///home/dante/Documents/HelloWorldApp/build/reports/problems/problems-report.html

Deprecated Gradle features were used in this build, making it incompatible with Gradle 9.0.

You can use '--warning-mode all' to show the individual deprecation warnings and determine if they come from your own scripts or plugins.

For more on this, please refer to https://docs.gradle.org/8.12/userguide/command_line_interface.html#sec:command_line_warnings in the Gradle documentation.

BUILD SUCCESSFUL in 42s
1 actionable task: 1 executed

> Task :app:processDebugMainManifest FAILED
package="com.example.helloworldapp" found in source AndroidManifest.xml: /home/dante/Documents/HelloWorldApp/app/src/main/AndroidManifest.xml.
Setting the namespace via a source AndroidManifest.xml's package attribute is deprecated.
Please instead set the namespace (or testNamespace) in the module's build.gradle file, as described here: https://developer.android.com/studio/build/configure-app-module#set-namespace
This migration can be done automatically using the AGP Upgrade Assistant, please refer to https://developer.android.com/studio/build/agp-upgrade-assistant for more information.
/home/dante/Documents/HelloWorldApp/app/src/main/AndroidManifest.xml:10:9-15:20 Error:
        android:exported needs to be explicitly specified for element <activity#com.example.helloworldapp.MainActivity>. Apps targeting Android 12 and higher are required to specify an explicit value for `android:exported` when the corresponding component has an intent filter defined. See https://developer.android.com/guide/topics/manifest/activity-element#exported for details.

See http://g.co/androidstudio/manifest-merger for more information about the manifest merger.


> Task :app:mergeDebugResources FAILED

[Incubating] Problems report is available at: file:///home/dante/Documents/HelloWorldApp/build/reports/problems/problems-report.html

FAILURE: Build completed with 2 failures.

1: Task failed with an exception.
-----------
* What went wrong:
Execution failed for task ':app:processDebugMainManifest'.
> Manifest merger failed : android:exported needs to be explicitly specified for element <activity#com.example.helloworldapp.MainActivity>. Apps targeting Android 12 and higher are required to specify an explicit value for `android:exported` when the corresponding component has an intent filter defined. See https://developer.android.com/guide/topics/manifest/activity-element#exported for details.

* Try:
> Run with --stacktrace option to get the stack trace.
> Run with --info or --debug option to get more log output.
> Run with --scan to get full insights.
> Get more help at https://help.gradle.org.
==============================================================================

2: Task failed with an exception.
-----------
* What went wrong:
Execution failed for task ':app:mergeDebugResources'.
> A failure occurred while executing com.android.build.gradle.internal.res.ResourceCompilerRunnable
   > Resource compilation failed (Failed to compile resource file: /home/dante/Documents/HelloWorldApp/app/src/main/res/layout/activity_date.xml: . Cause: javax.xml.stream.XMLStreamException: ParseError at [row,col]:[14,37]
     Message: The entity name must immediately follow the '&' in the entity reference.). Check logs for more details.

* Try:
> Run with --stacktrace option to get the stack trace.
> Run with --info or --debug option to get more log output.
> Run with --scan to get full insights.
> Get more help at https://help.gradle.org.
==============================================================================

Deprecated Gradle features were used in this build, making it incompatible with Gradle 9.0.

You can use '--warning-mode all' to show the individual deprecation warnings and determine if they come from your own scripts or plugins.

For more on this, please refer to https://docs.gradle.org/8.12/userguide/command_line_interface.html#sec:command_line_warnings in the Gradle documentation.

BUILD FAILED in 4s
9 actionable tasks: 9 executed
➜  HelloWorldApp n app/src/main/AndroidManifest.xml
➜  HelloWorldApp n app/src/main/java/com/example/helloworldapp/DateActivity.java 
➜  HelloWorldApp n app/src/main/res/layout/activity_date.xml 
➜  HelloWorldApp n app/src/main/AndroidManifest.xml                             
➜  HelloWorldApp n app/src/main/res/layout/activity_date.xml                    
➜  HelloWorldApp ./gradlew clean                                                
./gradlew --refresh-dependencies
./gradlew app:assembleDebug


[Incubating] Problems report is available at: file:///home/dante/Documents/HelloWorldApp/build/reports/problems/problems-report.html

Deprecated Gradle features were used in this build, making it incompatible with Gradle 9.0.

You can use '--warning-mode all' to show the individual deprecation warnings and determine if they come from your own scripts or plugins.

For more on this, please refer to https://docs.gradle.org/8.12/userguide/command_line_interface.html#sec:command_line_warnings in the Gradle documentation.

BUILD SUCCESSFUL in 1s
1 actionable task: 1 executed

> Task :help

Welcome to Gradle 8.12.

To run a build, run gradlew <task> ...

To see a list of available tasks, run gradlew tasks

To see more detail about a task, run gradlew help --task <task>

To see a list of command-line options, run gradlew --help

For more detail on using Gradle, see https://docs.gradle.org/8.12/userguide/command_line_interface.html

For troubleshooting, visit https://help.gradle.org

[Incubating] Problems report is available at: file:///home/dante/Documents/HelloWorldApp/build/reports/problems/problems-report.html

Deprecated Gradle features were used in this build, making it incompatible with Gradle 9.0.

You can use '--warning-mode all' to show the individual deprecation warnings and determine if they come from your own scripts or plugins.

For more on this, please refer to https://docs.gradle.org/8.12/userguide/command_line_interface.html#sec:command_line_warnings in the Gradle documentation.

BUILD SUCCESSFUL in 42s
1 actionable task: 1 executed

> Task :app:processDebugMainManifest
package="com.example.helloworldapp" found in source AndroidManifest.xml: /home/dante/Documents/HelloWorldApp/app/src/main/AndroidManifest.xml.
Setting the namespace via a source AndroidManifest.xml's package attribute is deprecated.
Please instead set the namespace (or testNamespace) in the module's build.gradle file, as described here: https://developer.android.com/studio/build/configure-app-module#set-namespace
This migration can be done automatically using the AGP Upgrade Assistant, please refer to https://developer.android.com/studio/build/agp-upgrade-assistant for more information.

> Task :app:compileDebugJavaWithJavac
Note: /home/dante/Documents/HelloWorldApp/app/src/main/java/com/example/helloworldapp/MainActivity.java uses or overrides a deprecated API.
Note: Recompile with -Xlint:deprecation for details.

[Incubating] Problems report is available at: file:///home/dante/Documents/HelloWorldApp/build/reports/problems/problems-report.html

Deprecated Gradle features were used in this build, making it incompatible with Gradle 9.0.

You can use '--warning-mode all' to show the individual deprecation warnings and determine if they come from your own scripts or plugins.

For more on this, please refer to https://docs.gradle.org/8.12/userguide/command_line_interface.html#sec:command_line_warnings in the Gradle documentation.

BUILD SUCCESSFUL in 1m 20s
29 actionable tasks: 29 executed
➜  HelloWorldApp ls -lah app/build/outputs/apk/debug/                           

total 3.5M
drwxr-xr-x 2 dante dante 4.0K Feb  2 04:16 .
drwxr-xr-x 3 dante dante 4.0K Feb  2 04:16 ..
-rw-r--r-- 1 dante dante 3.5M Feb  2 04:16 app-debug.apk
-rw-r--r-- 1 dante dante  375 Feb  2 04:16 output-metadata.json
➜  HelloWorldApp adb install app/build/outputs/apk/debug/

adb: no devices/emulators found
➜  HelloWorldApp adb install app/build/outputs/apk/debug/app-debug.apk 

Performing Streamed Install
Success
➜  HelloWorldApp 
