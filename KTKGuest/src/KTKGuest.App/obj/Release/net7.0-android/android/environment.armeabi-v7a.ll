; ModuleID = 'obj\Release\net7.0-android\android\environment.armeabi-v7a.ll'
source_filename = "obj\Release\net7.0-android\android\environment.armeabi-v7a.ll"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-linux-android"


%struct.ApplicationConfig = type {
	i8,; bool uses_mono_llvm
	i8,; bool uses_mono_aot
	i8,; bool aot_lazy_load
	i8,; bool uses_assembly_preload
	i8,; bool is_a_bundled_app
	i8,; bool broken_exception_transitions
	i8,; bool instant_run_enabled
	i8,; bool jni_add_native_method_registration_attribute_present
	i8,; bool have_runtime_config_blob
	i8,; bool have_assemblies_blob
	i8,; uint8_t bound_stream_io_exception_type
	i32,; uint32_t package_naming_policy
	i32,; uint32_t environment_variable_count
	i32,; uint32_t system_property_count
	i32,; uint32_t number_of_assemblies_in_apk
	i32,; uint32_t bundled_assembly_name_width
	i32,; uint32_t number_of_assembly_store_files
	i32,; uint32_t number_of_dso_cache_entries
	i32,; uint32_t android_runtime_jnienv_class_token
	i32,; uint32_t jnienv_initialize_method_token
	i32,; uint32_t jnienv_registerjninatives_method_token
	i32,; uint32_t jni_remapping_replacement_type_count
	i32,; uint32_t jni_remapping_replacement_method_index_entry_count
	i32,; uint32_t mono_components_mask
	i8*; char* android_package_name
}

%struct.AssemblyStoreAssemblyDescriptor = type {
	i32,; uint32_t data_offset
	i32,; uint32_t data_size
	i32,; uint32_t debug_data_offset
	i32,; uint32_t debug_data_size
	i32,; uint32_t config_data_offset
	i32; uint32_t config_data_size
}

%struct.AssemblyStoreSingleAssemblyRuntimeData = type {
	i8*,; uint8_t* image_data
	i8*,; uint8_t* debug_info_data
	i8*,; uint8_t* config_data
	%struct.AssemblyStoreAssemblyDescriptor*; AssemblyStoreAssemblyDescriptor* descriptor
}

%struct.AssemblyStoreRuntimeData = type {
	i8*,; uint8_t* data_start
	i32,; uint32_t assembly_count
	%struct.AssemblyStoreAssemblyDescriptor*; AssemblyStoreAssemblyDescriptor* assemblies
}

%struct.XamarinAndroidBundledAssembly = type {
	i32,; int32_t apk_fd
	i32,; uint32_t data_offset
	i32,; uint32_t data_size
	i8*,; uint8_t* data
	i32,; uint32_t name_length
	i8*; char* name
}

%struct.DSOCacheEntry = type {
	i64,; uint64_t hash
	i8,; bool ignore
	i8*,; char* name
	i8*; void* handle
}

@format_tag = local_unnamed_addr constant i64 385281960275288, align 8
@__mono_aot_mode_name = internal constant [7 x i8] c"normal\00", align 1
@mono_aot_mode_name = local_unnamed_addr constant i8* getelementptr inbounds ([7 x i8], [7 x i8]* @__mono_aot_mode_name, i32 0, i32 0), align 4

; app_environment_variables
@__app_environment_variables_n_0.0 = internal constant [15 x i8] c"MONO_GC_PARAMS\00", align 1
@__app_environment_variables_v_0.1 = internal constant [21 x i8] c"major=marksweep-conc\00", align 1
@__app_environment_variables_n_1.2 = internal constant [17 x i8] c"XAMARIN_BUILD_ID\00", align 1
@__app_environment_variables_v_1.3 = internal constant [37 x i8] c"48c54e3c-88ed-4872-8ec7-d3ba28e750c8\00", align 1
@__app_environment_variables_n_2.4 = internal constant [28 x i8] c"XA_HTTP_CLIENT_HANDLER_TYPE\00", align 1
@__app_environment_variables_v_2.5 = internal constant [42 x i8] c"Xamarin.Android.Net.AndroidMessageHandler\00", align 1
@__app_environment_variables_n_3.6 = internal constant [29 x i8] c"__XA_PACKAGE_NAMING_POLICY__\00", align 1
@__app_environment_variables_v_3.7 = internal constant [15 x i8] c"LowercaseCrc64\00", align 1

@app_environment_variables = local_unnamed_addr constant [8 x i8*] [
	i8* getelementptr inbounds ([15 x i8], [15 x i8]* @__app_environment_variables_n_0.0, i32 0, i32 0),
	i8* getelementptr inbounds ([21 x i8], [21 x i8]* @__app_environment_variables_v_0.1, i32 0, i32 0),
	i8* getelementptr inbounds ([17 x i8], [17 x i8]* @__app_environment_variables_n_1.2, i32 0, i32 0),
	i8* getelementptr inbounds ([37 x i8], [37 x i8]* @__app_environment_variables_v_1.3, i32 0, i32 0),
	i8* getelementptr inbounds ([28 x i8], [28 x i8]* @__app_environment_variables_n_2.4, i32 0, i32 0),
	i8* getelementptr inbounds ([42 x i8], [42 x i8]* @__app_environment_variables_v_2.5, i32 0, i32 0),
	i8* getelementptr inbounds ([29 x i8], [29 x i8]* @__app_environment_variables_n_3.6, i32 0, i32 0),
	i8* getelementptr inbounds ([15 x i8], [15 x i8]* @__app_environment_variables_v_3.7, i32 0, i32 0)
], align 4

; app_system_properties
@app_system_properties = local_unnamed_addr constant [0 x i8*] zeroinitializer, align 4
@__ApplicationConfig_android_package_name.0 = internal constant [28 x i8] c"ru.com.ilyaoleynik.ktkguest\00", align 1

; application_config
@application_config = local_unnamed_addr constant %struct.ApplicationConfig {
	i8 0, ; uses_mono_llvm
	i8 1, ; uses_mono_aot
	i8 1, ; aot_lazy_load
	i8 0, ; uses_assembly_preload
	i8 0, ; is_a_bundled_app
	i8 0, ; broken_exception_transitions
	i8 0, ; instant_run_enabled
	i8 0, ; jni_add_native_method_registration_attribute_present
	i8 1, ; have_runtime_config_blob
	i8 1, ; have_assemblies_blob
	i8 0, ; bound_stream_io_exception_type
	i32 3, ; package_naming_policy
	i32 8, ; environment_variable_count
	i32 0, ; system_property_count
	i32 128, ; number_of_assemblies_in_apk
	i32 0, ; bundled_assembly_name_width
	i32 2, ; number_of_assembly_store_files
	i32 788, ; number_of_dso_cache_entries
	i32 33555318, ; android_runtime_jnienv_class_token
	i32 100672636, ; jnienv_initialize_method_token
	i32 100672635, ; jnienv_registerjninatives_method_token
	i32 0, ; jni_remapping_replacement_type_count
	i32 0, ; jni_remapping_replacement_method_index_entry_count
	i32 0, ; mono_components_mask
	i8* getelementptr inbounds ([28 x i8], [28 x i8]* @__ApplicationConfig_android_package_name.0, i32 0, i32 0); android_package_name
}, align 4

@__DSOCacheEntry_name.1 = internal constant [44 x i8] c"libaot-System.Collections.NonGeneric.dll.so\00", align 1
@__DSOCacheEntry_name.2 = internal constant [50 x i8] c"libaot-Xamarin.KotlinX.Coroutines.Core.Jvm.dll.so\00", align 1
@__DSOCacheEntry_name.3 = internal constant [38 x i8] c"libaot-System.Threading.Thread.dll.so\00", align 1
@__DSOCacheEntry_name.4 = internal constant [45 x i8] c"libaot-Xamarin.Firebase.Dynamic.Links.dll.so\00", align 1
@__DSOCacheEntry_name.5 = internal constant [38 x i8] c"libaot-System.Numerics.Vectors.dll.so\00", align 1
@__DSOCacheEntry_name.6 = internal constant [36 x i8] c"libaot-Xamarin.AndroidX.Core.dll.so\00", align 1
@__DSOCacheEntry_name.7 = internal constant [41 x i8] c"libaot-Xamarin.Firebase.Messaging.dll.so\00", align 1
@__DSOCacheEntry_name.8 = internal constant [46 x i8] c"libaot-Xamarin.GooglePlayServices.Auth.dll.so\00", align 1
@__DSOCacheEntry_name.9 = internal constant [48 x i8] c"libaot-Xamarin.Facebook.AppLinks.Android.dll.so\00", align 1
@__DSOCacheEntry_name.10 = internal constant [43 x i8] c"libaot-Microsoft.Extensions.Logging.dll.so\00", align 1
@__DSOCacheEntry_name.11 = internal constant [45 x i8] c"libaot-System.Runtime.InteropServices.dll.so\00", align 1
@__DSOCacheEntry_name.12 = internal constant [49 x i8] c"libaot-Xamarin.Facebook.Messenger.Android.dll.so\00", align 1
@__DSOCacheEntry_name.13 = internal constant [55 x i8] c"libaot-Xamarin.AndroidX.Lifecycle.LiveData.Core.dll.so\00", align 1
@__DSOCacheEntry_name.14 = internal constant [23 x i8] c"libaot-mscorlib.dll.so\00", align 1
@__DSOCacheEntry_name.15 = internal constant [50 x i8] c"libSystem.Security.Cryptography.Native.Android.so\00", align 1
@__DSOCacheEntry_name.16 = internal constant [50 x i8] c"libaot-Xamarin.AndroidX.Navigation.Runtime.dll.so\00", align 1
@__DSOCacheEntry_name.17 = internal constant [26 x i8] c"libaot-System.Core.dll.so\00", align 1
@__DSOCacheEntry_name.18 = internal constant [40 x i8] c"libaot-Xamarin.AndroidX.Activity.dll.so\00", align 1
@__DSOCacheEntry_name.19 = internal constant [48 x i8] c"libaot-Xamarin.AndroidX.Lifecycle.Common.dll.so\00", align 1
@__DSOCacheEntry_name.20 = internal constant [38 x i8] c"libaot-Blazored.SessionStorage.dll.so\00", align 1
@__DSOCacheEntry_name.21 = internal constant [59 x i8] c"libaot-Microsoft.Extensions.FileProviders.Composite.dll.so\00", align 1
@__DSOCacheEntry_name.22 = internal constant [42 x i8] c"libaot-Xamarin.AndroidX.CustomView.dll.so\00", align 1
@__DSOCacheEntry_name.23 = internal constant [31 x i8] c"libaot-Microsoft.CSharp.dll.so\00", align 1
@__DSOCacheEntry_name.24 = internal constant [42 x i8] c"libaot-Xamarin.AndroidX.SavedState.dll.so\00", align 1
@__DSOCacheEntry_name.25 = internal constant [36 x i8] c"libaot-System.ComponentModel.dll.so\00", align 1
@__DSOCacheEntry_name.26 = internal constant [34 x i8] c"libaot-System.Net.Requests.dll.so\00", align 1
@__DSOCacheEntry_name.27 = internal constant [54 x i8] c"libaot-Microsoft.Extensions.FileSystemGlobbing.dll.so\00", align 1
@__DSOCacheEntry_name.28 = internal constant [37 x i8] c"libaot-KTKGuest.WebComponents.dll.so\00", align 1
@__DSOCacheEntry_name.29 = internal constant [46 x i8] c"libaot-Xamarin.GooglePlayServices.Base.dll.so\00", align 1
@__DSOCacheEntry_name.30 = internal constant [16 x i8] c"libmonodroid.so\00", align 1
@__DSOCacheEntry_name.31 = internal constant [44 x i8] c"libaot-System.Collections.Concurrent.dll.so\00", align 1
@__DSOCacheEntry_name.32 = internal constant [36 x i8] c"libaot-Xamarin.Kotlin.StdLib.dll.so\00", align 1
@__DSOCacheEntry_name.33 = internal constant [36 x i8] c"libaot-System.Runtime.Loader.dll.so\00", align 1
@__DSOCacheEntry_name.34 = internal constant [45 x i8] c"libaot-System.Text.RegularExpressions.dll.so\00", align 1
@__DSOCacheEntry_name.35 = internal constant [55 x i8] c"libaot-Microsoft.Extensions.DependencyInjection.dll.so\00", align 1
@__DSOCacheEntry_name.36 = internal constant [49 x i8] c"libaot-Xamarin.AndroidX.CoordinatorLayout.dll.so\00", align 1
@__DSOCacheEntry_name.37 = internal constant [39 x i8] c"libaot-Xamarin.AndroidX.Browser.dll.so\00", align 1
@__DSOCacheEntry_name.38 = internal constant [38 x i8] c"libaot-System.Xml.ReaderWriter.dll.so\00", align 1
@__DSOCacheEntry_name.39 = internal constant [31 x i8] c"libaot-System.Text.Json.dll.so\00", align 1
@__DSOCacheEntry_name.40 = internal constant [27 x i8] c"libaot-Mono.Android.dll.so\00", align 1
@__DSOCacheEntry_name.41 = internal constant [38 x i8] c"libaot-Xamarin.Firebase.Config.dll.so\00", align 1
@__DSOCacheEntry_name.42 = internal constant [43 x i8] c"libaot-Xamarin.Firebase.Crashlytics.dll.so\00", align 1
@__DSOCacheEntry_name.43 = internal constant [47 x i8] c"libaot-System.ComponentModel.Primitives.dll.so\00", align 1
@__DSOCacheEntry_name.44 = internal constant [45 x i8] c"libaot-Xamarin.AndroidX.Navigation.UI.dll.so\00", align 1
@__DSOCacheEntry_name.45 = internal constant [56 x i8] c"libaot-Microsoft.Extensions.Logging.Abstractions.dll.so\00", align 1
@__DSOCacheEntry_name.46 = internal constant [41 x i8] c"libaot-Xamarin.AndroidX.AppCompat.dll.so\00", align 1
@__DSOCacheEntry_name.47 = internal constant [58 x i8] c"libaot-Microsoft.Extensions.FileProviders.Physical.dll.so\00", align 1
@__DSOCacheEntry_name.48 = internal constant [33 x i8] c"libaot-System.Collections.dll.so\00", align 1
@__DSOCacheEntry_name.49 = internal constant [50 x i8] c"libaot-Xamarin.GooglePlayServices.Basement.dll.so\00", align 1
@__DSOCacheEntry_name.50 = internal constant [27 x i8] c"libaot-KTKGuest.App.dll.so\00", align 1
@__DSOCacheEntry_name.51 = internal constant [68 x i8] c"libaot-Microsoft.Extensions.DependencyInjection.Abstractions.dll.so\00", align 1
@__DSOCacheEntry_name.52 = internal constant [54 x i8] c"libaot-Microsoft.AspNetCore.Components.WebView.dll.so\00", align 1
@__DSOCacheEntry_name.53 = internal constant [28 x i8] c"libaot-System.Memory.dll.so\00", align 1
@__DSOCacheEntry_name.54 = internal constant [42 x i8] c"libaot-Xamarin.AndroidX.ViewPager2.dll.so\00", align 1
@__DSOCacheEntry_name.55 = internal constant [54 x i8] c"libaot-Xamarin.Android.Binding.InstallReferrer.dll.so\00", align 1
@__DSOCacheEntry_name.56 = internal constant [38 x i8] c"libaot-Microsoft.Maui.Controls.dll.so\00", align 1
@__DSOCacheEntry_name.57 = internal constant [54 x i8] c"libaot-Xamarin.Facebook.GamingServices.Android.dll.so\00", align 1
@__DSOCacheEntry_name.58 = internal constant [36 x i8] c"libaot-System.IO.Compression.dll.so\00", align 1
@__DSOCacheEntry_name.59 = internal constant [60 x i8] c"libaot-Xamarin.AndroidX.AppCompat.AppCompatResources.dll.so\00", align 1
@__DSOCacheEntry_name.60 = internal constant [38 x i8] c"libaot-Xamarin.AndroidX.Loader.dll.so\00", align 1
@__DSOCacheEntry_name.61 = internal constant [40 x i8] c"libaot-Xamarin.AndroidX.Fragment.dll.so\00", align 1
@__DSOCacheEntry_name.62 = internal constant [41 x i8] c"libaot-Xamarin.Firebase.Functions.dll.so\00", align 1
@__DSOCacheEntry_name.63 = internal constant [42 x i8] c"libaot-Xamarin.Firebase.Components.dll.so\00", align 1
@__DSOCacheEntry_name.64 = internal constant [33 x i8] c"libaot-System.ObjectModel.dll.so\00", align 1
@__DSOCacheEntry_name.65 = internal constant [20 x i8] c"libSystem.Native.so\00", align 1
@__DSOCacheEntry_name.66 = internal constant [46 x i8] c"libaot-Xamarin.Facebook.Common.Android.dll.so\00", align 1
@__DSOCacheEntry_name.67 = internal constant [36 x i8] c"libaot-Blazored.LocalStorage.dll.so\00", align 1
@__DSOCacheEntry_name.68 = internal constant [43 x i8] c"libaot-System.IO.FileSystem.Watcher.dll.so\00", align 1
@__DSOCacheEntry_name.69 = internal constant [30 x i8] c"libaot-Plugin.Firebase.dll.so\00", align 1
@__DSOCacheEntry_name.70 = internal constant [52 x i8] c"libaot-Microsoft.Maui.Controls.Compatibility.dll.so\00", align 1
@__DSOCacheEntry_name.71 = internal constant [57 x i8] c"libaot-Xamarin.GooglePlayServices.Measurement.Api.dll.so\00", align 1
@__DSOCacheEntry_name.72 = internal constant [61 x i8] c"libaot-Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll.so\00", align 1
@__DSOCacheEntry_name.73 = internal constant [40 x i8] c"libaot-System.Text.Encodings.Web.dll.so\00", align 1
@__DSOCacheEntry_name.74 = internal constant [42 x i8] c"libaot-Xamarin.AndroidX.Collection.dll.so\00", align 1
@__DSOCacheEntry_name.75 = internal constant [39 x i8] c"libaot-Xamarin.Facebook.Android.dll.so\00", align 1
@__DSOCacheEntry_name.76 = internal constant [29 x i8] c"libaot-Microsoft.Maui.dll.so\00", align 1
@__DSOCacheEntry_name.77 = internal constant [58 x i8] c"libaot-Microsoft.Extensions.FileProviders.Embedded.dll.so\00", align 1
@__DSOCacheEntry_name.78 = internal constant [40 x i8] c"libaot-Xamarin.AndroidX.CardView.dll.so\00", align 1
@__DSOCacheEntry_name.79 = internal constant [46 x i8] c"libaot-Xamarin.Google.Android.Material.dll.so\00", align 1
@__DSOCacheEntry_name.80 = internal constant [51 x i8] c"libaot-Xamarin.AndroidX.VersionedParcelable.dll.so\00", align 1
@__DSOCacheEntry_name.81 = internal constant [43 x i8] c"libaot-Microsoft.Maui.Controls.Xaml.dll.so\00", align 1
@__DSOCacheEntry_name.82 = internal constant [45 x i8] c"libaot-Xamarin.Facebook.Login.Android.dll.so\00", align 1
@__DSOCacheEntry_name.83 = internal constant [43 x i8] c"libaot-Microsoft.Extensions.Options.dll.so\00", align 1
@__DSOCacheEntry_name.84 = internal constant [44 x i8] c"libaot-Xamarin.AndroidX.DrawerLayout.dll.so\00", align 1
@__DSOCacheEntry_name.85 = internal constant [59 x i8] c"libaot-Microsoft.AspNetCore.Components.WebView.Maui.dll.so\00", align 1
@__DSOCacheEntry_name.86 = internal constant [38 x i8] c"libaot-System.Private.Xml.Linq.dll.so\00", align 1
@__DSOCacheEntry_name.87 = internal constant [38 x i8] c"libaot-Microsoft.Maui.Graphics.dll.so\00", align 1
@__DSOCacheEntry_name.88 = internal constant [38 x i8] c"libaot-System.Linq.Expressions.dll.so\00", align 1
@__DSOCacheEntry_name.89 = internal constant [36 x i8] c"libaot-Xamarin.Firebase.Auth.dll.so\00", align 1
@__DSOCacheEntry_name.90 = internal constant [45 x i8] c"libaot-Xamarin.Facebook.Share.Android.dll.so\00", align 1
@__DSOCacheEntry_name.91 = internal constant [36 x i8] c"libaot-System.Net.Primitives.dll.so\00", align 1
@__DSOCacheEntry_name.92 = internal constant [46 x i8] c"libaot-Microsoft.Extensions.Primitives.dll.so\00", align 1
@__DSOCacheEntry_name.93 = internal constant [43 x i8] c"libaot-System.Security.Cryptography.dll.so\00", align 1
@__DSOCacheEntry_name.94 = internal constant [26 x i8] c"libaot-System.Linq.dll.so\00", align 1
@__DSOCacheEntry_name.95 = internal constant [21 x i8] c"libaot-System.dll.so\00", align 1
@__DSOCacheEntry_name.96 = internal constant [44 x i8] c"libaot-Xamarin.Firebase.Auth.Interop.dll.so\00", align 1
@__DSOCacheEntry_name.97 = internal constant [51 x i8] c"libaot-Xamarin.AndroidX.Lifecycle.ViewModel.dll.so\00", align 1
@__DSOCacheEntry_name.98 = internal constant [35 x i8] c"libaot-System.Xml.XDocument.dll.so\00", align 1
@__DSOCacheEntry_name.99 = internal constant [50 x i8] c"libaot-System.ComponentModel.TypeConverter.dll.so\00", align 1
@__DSOCacheEntry_name.100 = internal constant [44 x i8] c"libaot-Xamarin.Facebook.Core.Android.dll.so\00", align 1
@__DSOCacheEntry_name.101 = internal constant [50 x i8] c"libaot-Xamarin.AndroidX.SwipeRefreshLayout.dll.so\00", align 1
@__DSOCacheEntry_name.102 = internal constant [30 x i8] c"libaot-System.Net.Http.dll.so\00", align 1
@__DSOCacheEntry_name.103 = internal constant [40 x i8] c"libaot-Microsoft.Maui.Essentials.dll.so\00", align 1
@__DSOCacheEntry_name.104 = internal constant [25 x i8] c"libaot-GoogleGson.dll.so\00", align 1
@__DSOCacheEntry_name.105 = internal constant [45 x i8] c"libaot-Xamarin.AndroidX.CursorAdapter.dll.so\00", align 1
@__DSOCacheEntry_name.106 = internal constant [64 x i8] c"libaot-Xamarin.Google.Android.DataTransport.TransportApi.dll.so\00", align 1
@__DSOCacheEntry_name.107 = internal constant [49 x i8] c"libaot-Xamarin.AndroidX.Navigation.Common.dll.so\00", align 1
@__DSOCacheEntry_name.108 = internal constant [38 x i8] c"libaot-Xamarin.AndroidX.Window.dll.so\00", align 1
@__DSOCacheEntry_name.109 = internal constant [38 x i8] c"libaot-Xamarin.Firebase.Common.dll.so\00", align 1
@__DSOCacheEntry_name.110 = internal constant [34 x i8] c"libaot-Microsoft.JSInterop.dll.so\00", align 1
@__DSOCacheEntry_name.111 = internal constant [46 x i8] c"libaot-Microsoft.AspNetCore.Components.dll.so\00", align 1
@__DSOCacheEntry_name.112 = internal constant [51 x i8] c"libaot-Xamarin.AndroidX.Navigation.Fragment.dll.so\00", align 1
@__DSOCacheEntry_name.113 = internal constant [37 x i8] c"libaot-System.Private.CoreLib.dll.so\00", align 1
@__DSOCacheEntry_name.114 = internal constant [31 x i8] c"libaot-System.Threading.dll.so\00", align 1
@__DSOCacheEntry_name.115 = internal constant [41 x i8] c"libaot-Xamarin.Firebase.Firestore.dll.so\00", align 1
@__DSOCacheEntry_name.116 = internal constant [44 x i8] c"libaot-Xamarin.AndroidX.RecyclerView.dll.so\00", align 1
@__DSOCacheEntry_name.117 = internal constant [47 x i8] c"libaot-Xamarin.GooglePlayServices.Tasks.dll.so\00", align 1
@__DSOCacheEntry_name.118 = internal constant [29 x i8] c"libaot-System.Runtime.dll.so\00", align 1
@__DSOCacheEntry_name.119 = internal constant [30 x i8] c"libaot-System.Xml.Linq.dll.so\00", align 1
@__DSOCacheEntry_name.120 = internal constant [39 x i8] c"libaot-Xamarin.Firebase.Storage.dll.so\00", align 1
@__DSOCacheEntry_name.121 = internal constant [33 x i8] c"libaot-System.Private.Xml.dll.so\00", align 1
@__DSOCacheEntry_name.122 = internal constant [41 x i8] c"libaot-Xamarin.AndroidX.ViewPager.dll.so\00", align 1
@__DSOCacheEntry_name.123 = internal constant [40 x i8] c"libaot-Xamarin.Protobuf.JavaLite.dll.so\00", align 1
@__DSOCacheEntry_name.124 = internal constant [62 x i8] c"libaot-Microsoft.Extensions.Configuration.Abstractions.dll.so\00", align 1
@__DSOCacheEntry_name.125 = internal constant [49 x i8] c"libaot-Microsoft.Extensions.Configuration.dll.so\00", align 1
@__DSOCacheEntry_name.126 = internal constant [29 x i8] c"libaot-System.Console.dll.so\00", align 1
@__DSOCacheEntry_name.127 = internal constant [33 x i8] c"libaot-System.Private.Uri.dll.so\00", align 1
@__DSOCacheEntry_name.128 = internal constant [35 x i8] c"libSystem.IO.Compression.Native.so\00", align 1
@__DSOCacheEntry_name.129 = internal constant [27 x i8] c"libaot-Java.Interop.dll.so\00", align 1
@__DSOCacheEntry_name.130 = internal constant [50 x i8] c"libaot-Microsoft.AspNetCore.Components.Web.dll.so\00", align 1
@__DSOCacheEntry_name.131 = internal constant [62 x i8] c"libaot-Microsoft.Extensions.FileProviders.Abstractions.dll.so\00", align 1
@__DSOCacheEntry_name.132 = internal constant [19 x i8] c"libmonosgen-2.0.so\00", align 1
@__DSOCacheEntry_name.133 = internal constant [32 x i8] c"libaot-Google.ZXing.Core.dll.so\00", align 1

; dso_cache
@dso_cache = local_unnamed_addr global [788 x %struct.DSOCacheEntry] [
	; 0
	%struct.DSOCacheEntry {
		i64 20489825, ; hash 0x138a661, from name: aot-System.Collections.NonGeneric.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([44 x i8], [44 x i8]* @__DSOCacheEntry_name.1, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 1
	%struct.DSOCacheEntry {
		i64 36746888, ; hash 0x230b688, from name: aot-Xamarin.KotlinX.Coroutines.Core.Jvm
		i8 0, ; ignore
		i8* getelementptr inbounds ([50 x i8], [50 x i8]* @__DSOCacheEntry_name.2, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 2
	%struct.DSOCacheEntry {
		i64 42639949, ; hash 0x28aa24d, from name: System.Threading.Thread
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.3, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 3
	%struct.DSOCacheEntry {
		i64 43163720, ; hash 0x292a048, from name: aot-Xamarin.Firebase.Dynamic.Links
		i8 0, ; ignore
		i8* getelementptr inbounds ([45 x i8], [45 x i8]* @__DSOCacheEntry_name.4, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 4
	%struct.DSOCacheEntry {
		i64 56604468, ; hash 0x35fb734, from name: libaot-System.Numerics.Vectors
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.5, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 5
	%struct.DSOCacheEntry {
		i64 62384850, ; hash 0x3b7ead2, from name: libaot-Xamarin.AndroidX.Core.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([36 x i8], [36 x i8]* @__DSOCacheEntry_name.6, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 6
	%struct.DSOCacheEntry {
		i64 68522427, ; hash 0x41591bb, from name: libaot-Xamarin.Firebase.Messaging.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([41 x i8], [41 x i8]* @__DSOCacheEntry_name.7, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 7
	%struct.DSOCacheEntry {
		i64 80744613, ; hash 0x4d010a5, from name: libaot-Xamarin.GooglePlayServices.Auth
		i8 0, ; ignore
		i8* getelementptr inbounds ([46 x i8], [46 x i8]* @__DSOCacheEntry_name.8, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 8
	%struct.DSOCacheEntry {
		i64 110480051, ; hash 0x695cab3, from name: libaot-Xamarin.Facebook.AppLinks.Android
		i8 0, ; ignore
		i8* getelementptr inbounds ([48 x i8], [48 x i8]* @__DSOCacheEntry_name.9, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 9
	%struct.DSOCacheEntry {
		i64 116541649, ; hash 0x6f248d1, from name: aot-Microsoft.Extensions.Logging.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([43 x i8], [43 x i8]* @__DSOCacheEntry_name.10, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 10
	%struct.DSOCacheEntry {
		i64 117431740, ; hash 0x6ffddbc, from name: System.Runtime.InteropServices
		i8 0, ; ignore
		i8* getelementptr inbounds ([45 x i8], [45 x i8]* @__DSOCacheEntry_name.11, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 11
	%struct.DSOCacheEntry {
		i64 122318002, ; hash 0x74a6cb2, from name: libaot-Xamarin.Facebook.Messenger.Android
		i8 0, ; ignore
		i8* getelementptr inbounds ([49 x i8], [49 x i8]* @__DSOCacheEntry_name.12, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 12
	%struct.DSOCacheEntry {
		i64 132747680, ; hash 0x7e991a0, from name: libaot-Xamarin.AndroidX.Lifecycle.LiveData.Core
		i8 0, ; ignore
		i8* getelementptr inbounds ([55 x i8], [55 x i8]* @__DSOCacheEntry_name.13, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 13
	%struct.DSOCacheEntry {
		i64 135821890, ; hash 0x8187a42, from name: aot-mscorlib
		i8 0, ; ignore
		i8* getelementptr inbounds ([23 x i8], [23 x i8]* @__DSOCacheEntry_name.14, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 14
	%struct.DSOCacheEntry {
		i64 153552311, ; hash 0x92705b7, from name: aot-Xamarin.AndroidX.Lifecycle.LiveData.Core.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([55 x i8], [55 x i8]* @__DSOCacheEntry_name.13, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 15
	%struct.DSOCacheEntry {
		i64 154543565, ; hash 0x93625cd, from name: libSystem.Security.Cryptography.Native.Android
		i8 0, ; ignore
		i8* getelementptr inbounds ([50 x i8], [50 x i8]* @__DSOCacheEntry_name.15, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 16
	%struct.DSOCacheEntry {
		i64 155166714, ; hash 0x93fa7fa, from name: aot-Xamarin.AndroidX.Navigation.Runtime.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([50 x i8], [50 x i8]* @__DSOCacheEntry_name.16, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 17
	%struct.DSOCacheEntry {
		i64 155189489, ; hash 0x94000f1, from name: aot-System.Core
		i8 0, ; ignore
		i8* getelementptr inbounds ([26 x i8], [26 x i8]* @__DSOCacheEntry_name.17, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 18
	%struct.DSOCacheEntry {
		i64 160724438, ; hash 0x99475d6, from name: libaot-Xamarin.AndroidX.Activity
		i8 0, ; ignore
		i8* getelementptr inbounds ([40 x i8], [40 x i8]* @__DSOCacheEntry_name.18, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 19
	%struct.DSOCacheEntry {
		i64 165120050, ; hash 0x9d78832, from name: libaot-Xamarin.AndroidX.Lifecycle.Common
		i8 0, ; ignore
		i8* getelementptr inbounds ([48 x i8], [48 x i8]* @__DSOCacheEntry_name.19, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 20
	%struct.DSOCacheEntry {
		i64 171750478, ; hash 0xa3cb44e, from name: libaot-Blazored.SessionStorage.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.20, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 21
	%struct.DSOCacheEntry {
		i64 176815410, ; hash 0xa89fd32, from name: Xamarin.AndroidX.Lifecycle.Common.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([48 x i8], [48 x i8]* @__DSOCacheEntry_name.19, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 22
	%struct.DSOCacheEntry {
		i64 182437567, ; hash 0xadfc6bf, from name: libaot-Microsoft.Extensions.FileProviders.Composite
		i8 0, ; ignore
		i8* getelementptr inbounds ([59 x i8], [59 x i8]* @__DSOCacheEntry_name.21, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 23
	%struct.DSOCacheEntry {
		i64 195166226, ; hash 0xba20012, from name: libaot-Xamarin.AndroidX.CustomView
		i8 0, ; ignore
		i8* getelementptr inbounds ([42 x i8], [42 x i8]* @__DSOCacheEntry_name.22, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 24
	%struct.DSOCacheEntry {
		i64 197501317, ; hash 0xbc5a185, from name: libaot-Microsoft.CSharp.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([31 x i8], [31 x i8]* @__DSOCacheEntry_name.23, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 25
	%struct.DSOCacheEntry {
		i64 200694997, ; hash 0xbf65cd5, from name: libaot-Xamarin.AndroidX.SavedState.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([42 x i8], [42 x i8]* @__DSOCacheEntry_name.24, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 26
	%struct.DSOCacheEntry {
		i64 205061960, ; hash 0xc38ff48, from name: System.ComponentModel
		i8 0, ; ignore
		i8* getelementptr inbounds ([36 x i8], [36 x i8]* @__DSOCacheEntry_name.25, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 27
	%struct.DSOCacheEntry {
		i64 206071461, ; hash 0xc4866a5, from name: aot-System.Net.Requests
		i8 0, ; ignore
		i8* getelementptr inbounds ([34 x i8], [34 x i8]* @__DSOCacheEntry_name.26, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 28
	%struct.DSOCacheEntry {
		i64 207636085, ; hash 0xc604675, from name: aot-Microsoft.Extensions.FileSystemGlobbing.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([54 x i8], [54 x i8]* @__DSOCacheEntry_name.27, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 29
	%struct.DSOCacheEntry {
		i64 218153831, ; hash 0xd00c367, from name: KTKGuest.WebComponents
		i8 0, ; ignore
		i8* getelementptr inbounds ([37 x i8], [37 x i8]* @__DSOCacheEntry_name.28, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 30
	%struct.DSOCacheEntry {
		i64 220846655, ; hash 0xd29da3f, from name: aot-Xamarin.GooglePlayServices.Base.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([46 x i8], [46 x i8]* @__DSOCacheEntry_name.29, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 31
	%struct.DSOCacheEntry {
		i64 229294244, ; hash 0xdaac0a4, from name: monodroid.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([16 x i8], [16 x i8]* @__DSOCacheEntry_name.30, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 32
	%struct.DSOCacheEntry {
		i64 231913179, ; hash 0xdd2b6db, from name: libaot-System.Collections.Concurrent
		i8 0, ; ignore
		i8* getelementptr inbounds ([44 x i8], [44 x i8]* @__DSOCacheEntry_name.31, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 33
	%struct.DSOCacheEntry {
		i64 234893954, ; hash 0xe003282, from name: libaot-Xamarin.Kotlin.StdLib.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([36 x i8], [36 x i8]* @__DSOCacheEntry_name.32, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 34
	%struct.DSOCacheEntry {
		i64 241552641, ; hash 0xe65cd01, from name: libaot-System.Runtime.Loader.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([36 x i8], [36 x i8]* @__DSOCacheEntry_name.33, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 35
	%struct.DSOCacheEntry {
		i64 246921316, ; hash 0xeb7b864, from name: libaot-System.Text.RegularExpressions.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([45 x i8], [45 x i8]* @__DSOCacheEntry_name.34, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 36
	%struct.DSOCacheEntry {
		i64 254718238, ; hash 0xf2eb11e, from name: libaot-Microsoft.Extensions.DependencyInjection
		i8 0, ; ignore
		i8* getelementptr inbounds ([55 x i8], [55 x i8]* @__DSOCacheEntry_name.35, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 37
	%struct.DSOCacheEntry {
		i64 257906758, ; hash 0xf5f5846, from name: libaot-Xamarin.AndroidX.CoordinatorLayout
		i8 0, ; ignore
		i8* getelementptr inbounds ([49 x i8], [49 x i8]* @__DSOCacheEntry_name.36, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 38
	%struct.DSOCacheEntry {
		i64 258230989, ; hash 0xf644acd, from name: Xamarin.Kotlin.StdLib.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([36 x i8], [36 x i8]* @__DSOCacheEntry_name.32, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 39
	%struct.DSOCacheEntry {
		i64 263077002, ; hash 0xfae3c8a, from name: libaot-Xamarin.AndroidX.Browser.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([39 x i8], [39 x i8]* @__DSOCacheEntry_name.37, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 40
	%struct.DSOCacheEntry {
		i64 270150149, ; hash 0x101a2a05, from name: System.Xml.ReaderWriter.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.38, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 41
	%struct.DSOCacheEntry {
		i64 278844578, ; hash 0x109ed4a2, from name: aot-Xamarin.AndroidX.Navigation.Runtime
		i8 0, ; ignore
		i8* getelementptr inbounds ([50 x i8], [50 x i8]* @__DSOCacheEntry_name.16, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 42
	%struct.DSOCacheEntry {
		i64 282800165, ; hash 0x10db3025, from name: System.Text.Json.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([31 x i8], [31 x i8]* @__DSOCacheEntry_name.39, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 43
	%struct.DSOCacheEntry {
		i64 291348661, ; hash 0x115da0b5, from name: aot-System.Xml.ReaderWriter
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.38, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 44
	%struct.DSOCacheEntry {
		i64 292529153, ; hash 0x116fa401, from name: libaot-Mono.Android.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([27 x i8], [27 x i8]* @__DSOCacheEntry_name.40, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 45
	%struct.DSOCacheEntry {
		i64 315322683, ; hash 0x12cb713b, from name: aot-Xamarin.Firebase.Config.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.41, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 46
	%struct.DSOCacheEntry {
		i64 315333590, ; hash 0x12cb9bd6, from name: aot-System.Text.Json
		i8 0, ; ignore
		i8* getelementptr inbounds ([31 x i8], [31 x i8]* @__DSOCacheEntry_name.39, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 47
	%struct.DSOCacheEntry {
		i64 319080588, ; hash 0x1304c88c, from name: Xamarin.Firebase.Crashlytics.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([43 x i8], [43 x i8]* @__DSOCacheEntry_name.42, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 48
	%struct.DSOCacheEntry {
		i64 321003452, ; hash 0x13221fbc, from name: libaot-System.ComponentModel.Primitives.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([47 x i8], [47 x i8]* @__DSOCacheEntry_name.43, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 49
	%struct.DSOCacheEntry {
		i64 334172448, ; hash 0x13eb1120, from name: aot-System.ComponentModel.Primitives
		i8 0, ; ignore
		i8* getelementptr inbounds ([47 x i8], [47 x i8]* @__DSOCacheEntry_name.43, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 50
	%struct.DSOCacheEntry {
		i64 337425530, ; hash 0x141cb47a, from name: libaot-Xamarin.AndroidX.Navigation.UI.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([45 x i8], [45 x i8]* @__DSOCacheEntry_name.44, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 51
	%struct.DSOCacheEntry {
		i64 341082126, ; hash 0x1454800e, from name: libaot-Microsoft.Extensions.Logging.Abstractions
		i8 0, ; ignore
		i8* getelementptr inbounds ([56 x i8], [56 x i8]* @__DSOCacheEntry_name.45, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 52
	%struct.DSOCacheEntry {
		i64 342366114, ; hash 0x146817a2, from name: Xamarin.AndroidX.Lifecycle.Common
		i8 0, ; ignore
		i8* getelementptr inbounds ([48 x i8], [48 x i8]* @__DSOCacheEntry_name.19, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 53
	%struct.DSOCacheEntry {
		i64 349605155, ; hash 0x14d68d23, from name: Xamarin.AndroidX.AppCompat.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([41 x i8], [41 x i8]* @__DSOCacheEntry_name.46, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 54
	%struct.DSOCacheEntry {
		i64 354896388, ; hash 0x15274a04, from name: aot-Microsoft.Extensions.FileProviders.Physical
		i8 0, ; ignore
		i8* getelementptr inbounds ([58 x i8], [58 x i8]* @__DSOCacheEntry_name.47, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 55
	%struct.DSOCacheEntry {
		i64 359463689, ; hash 0x156cfb09, from name: libaot-System.Collections
		i8 0, ; ignore
		i8* getelementptr inbounds ([33 x i8], [33 x i8]* @__DSOCacheEntry_name.48, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 56
	%struct.DSOCacheEntry {
		i64 362792438, ; hash 0x159fc5f6, from name: libaot-Xamarin.GooglePlayServices.Basement.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([50 x i8], [50 x i8]* @__DSOCacheEntry_name.49, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 57
	%struct.DSOCacheEntry {
		i64 366632779, ; hash 0x15da5f4b, from name: aot-KTKGuest.App.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([27 x i8], [27 x i8]* @__DSOCacheEntry_name.50, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 58
	%struct.DSOCacheEntry {
		i64 367117185, ; hash 0x15e1c381, from name: aot-Microsoft.Extensions.DependencyInjection.Abstractions
		i8 0, ; ignore
		i8* getelementptr inbounds ([68 x i8], [68 x i8]* @__DSOCacheEntry_name.51, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 59
	%struct.DSOCacheEntry {
		i64 367423889, ; hash 0x15e67191, from name: libaot-Microsoft.AspNetCore.Components.WebView
		i8 0, ; ignore
		i8* getelementptr inbounds ([54 x i8], [54 x i8]* @__DSOCacheEntry_name.52, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 60
	%struct.DSOCacheEntry {
		i64 369872811, ; hash 0x160bcfab, from name: System.Memory.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([28 x i8], [28 x i8]* @__DSOCacheEntry_name.53, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 61
	%struct.DSOCacheEntry {
		i64 373418536, ; hash 0x1641ea28, from name: libaot-Xamarin.AndroidX.ViewPager2.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([42 x i8], [42 x i8]* @__DSOCacheEntry_name.54, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 62
	%struct.DSOCacheEntry {
		i64 384891006, ; hash 0x16f0f87e, from name: aot-Xamarin.Android.Binding.InstallReferrer.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([54 x i8], [54 x i8]* @__DSOCacheEntry_name.55, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 63
	%struct.DSOCacheEntry {
		i64 390538561, ; hash 0x17472541, from name: aot-Microsoft.Maui.Controls.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.56, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 64
	%struct.DSOCacheEntry {
		i64 407355551, ; hash 0x1847c09f, from name: aot-Microsoft.Extensions.FileSystemGlobbing
		i8 0, ; ignore
		i8* getelementptr inbounds ([54 x i8], [54 x i8]* @__DSOCacheEntry_name.27, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 65
	%struct.DSOCacheEntry {
		i64 426763054, ; hash 0x196fe32e, from name: aot-Xamarin.AndroidX.Navigation.UI
		i8 0, ; ignore
		i8* getelementptr inbounds ([45 x i8], [45 x i8]* @__DSOCacheEntry_name.44, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 66
	%struct.DSOCacheEntry {
		i64 432008502, ; hash 0x19bfed36, from name: Xamarin.Facebook.GamingServices.Android.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([54 x i8], [54 x i8]* @__DSOCacheEntry_name.57, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 67
	%struct.DSOCacheEntry {
		i64 432639454, ; hash 0x19c98dde, from name: Xamarin.Firebase.Dynamic.Links.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([45 x i8], [45 x i8]* @__DSOCacheEntry_name.4, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 68
	%struct.DSOCacheEntry {
		i64 442565967, ; hash 0x1a61054f, from name: System.Collections
		i8 0, ; ignore
		i8* getelementptr inbounds ([33 x i8], [33 x i8]* @__DSOCacheEntry_name.48, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 69
	%struct.DSOCacheEntry {
		i64 451696200, ; hash 0x1aec5648, from name: libaot-System.IO.Compression
		i8 0, ; ignore
		i8* getelementptr inbounds ([36 x i8], [36 x i8]* @__DSOCacheEntry_name.58, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 70
	%struct.DSOCacheEntry {
		i64 459786305, ; hash 0x1b67c841, from name: Xamarin.AndroidX.AppCompat.AppCompatResources.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([60 x i8], [60 x i8]* @__DSOCacheEntry_name.59, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 71
	%struct.DSOCacheEntry {
		i64 462554793, ; hash 0x1b9206a9, from name: KTKGuest.App.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([27 x i8], [27 x i8]* @__DSOCacheEntry_name.50, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 72
	%struct.DSOCacheEntry {
		i64 463154707, ; hash 0x1b9b2e13, from name: aot-System.Memory.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([28 x i8], [28 x i8]* @__DSOCacheEntry_name.53, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 73
	%struct.DSOCacheEntry {
		i64 463726861, ; hash 0x1ba3e90d, from name: Xamarin.Facebook.AppLinks.Android
		i8 0, ; ignore
		i8* getelementptr inbounds ([48 x i8], [48 x i8]* @__DSOCacheEntry_name.9, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 74
	%struct.DSOCacheEntry {
		i64 465846621, ; hash 0x1bc4415d, from name: mscorlib
		i8 0, ; ignore
		i8* getelementptr inbounds ([23 x i8], [23 x i8]* @__DSOCacheEntry_name.14, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 75
	%struct.DSOCacheEntry {
		i64 467362390, ; hash 0x1bdb6256, from name: aot-Xamarin.Kotlin.StdLib
		i8 0, ; ignore
		i8* getelementptr inbounds ([36 x i8], [36 x i8]* @__DSOCacheEntry_name.32, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 76
	%struct.DSOCacheEntry {
		i64 467725327, ; hash 0x1be0ec0f, from name: aot-Xamarin.AndroidX.Loader
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.60, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 77
	%struct.DSOCacheEntry {
		i64 468077253, ; hash 0x1be64ac5, from name: aot-Xamarin.AndroidX.Fragment.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([40 x i8], [40 x i8]* @__DSOCacheEntry_name.61, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 78
	%struct.DSOCacheEntry {
		i64 484061764, ; hash 0x1cda3244, from name: libaot-Xamarin.Firebase.Functions
		i8 0, ; ignore
		i8* getelementptr inbounds ([41 x i8], [41 x i8]* @__DSOCacheEntry_name.62, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 79
	%struct.DSOCacheEntry {
		i64 492636602, ; hash 0x1d5d09ba, from name: aot-Xamarin.Firebase.Components
		i8 0, ; ignore
		i8* getelementptr inbounds ([42 x i8], [42 x i8]* @__DSOCacheEntry_name.63, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 80
	%struct.DSOCacheEntry {
		i64 492719914, ; hash 0x1d5e4f2a, from name: aot-System.Text.Json.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([31 x i8], [31 x i8]* @__DSOCacheEntry_name.39, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 81
	%struct.DSOCacheEntry {
		i64 498788369, ; hash 0x1dbae811, from name: System.ObjectModel
		i8 0, ; ignore
		i8* getelementptr inbounds ([33 x i8], [33 x i8]* @__DSOCacheEntry_name.64, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 82
	%struct.DSOCacheEntry {
		i64 500609955, ; hash 0x1dd6b3a3, from name: System.Native.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([20 x i8], [20 x i8]* @__DSOCacheEntry_name.65, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 83
	%struct.DSOCacheEntry {
		i64 512612874, ; hash 0x1e8dda0a, from name: libaot-Microsoft.Extensions.FileProviders.Physical.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([58 x i8], [58 x i8]* @__DSOCacheEntry_name.47, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 84
	%struct.DSOCacheEntry {
		i64 517857212, ; hash 0x1edddfbc, from name: Xamarin.Facebook.Common.Android
		i8 0, ; ignore
		i8* getelementptr inbounds ([46 x i8], [46 x i8]* @__DSOCacheEntry_name.66, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 85
	%struct.DSOCacheEntry {
		i64 521260537, ; hash 0x1f11cdf9, from name: libaot-Blazored.LocalStorage.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([36 x i8], [36 x i8]* @__DSOCacheEntry_name.67, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 86
	%struct.DSOCacheEntry {
		i64 526937330, ; hash 0x1f686cf2, from name: aot-System.IO.FileSystem.Watcher
		i8 0, ; ignore
		i8* getelementptr inbounds ([43 x i8], [43 x i8]* @__DSOCacheEntry_name.68, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 87
	%struct.DSOCacheEntry {
		i64 529603795, ; hash 0x1f911cd3, from name: libaot-Xamarin.Android.Binding.InstallReferrer
		i8 0, ; ignore
		i8* getelementptr inbounds ([54 x i8], [54 x i8]* @__DSOCacheEntry_name.55, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 88
	%struct.DSOCacheEntry {
		i64 537148196, ; hash 0x20043b24, from name: Plugin.Firebase.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([30 x i8], [30 x i8]* @__DSOCacheEntry_name.69, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 89
	%struct.DSOCacheEntry {
		i64 539058512, ; hash 0x20216150, from name: Microsoft.Extensions.Logging
		i8 0, ; ignore
		i8* getelementptr inbounds ([43 x i8], [43 x i8]* @__DSOCacheEntry_name.10, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 90
	%struct.DSOCacheEntry {
		i64 542686644, ; hash 0x2058bdb4, from name: libaot-Microsoft.Maui.Controls.Compatibility
		i8 0, ; ignore
		i8* getelementptr inbounds ([52 x i8], [52 x i8]* @__DSOCacheEntry_name.70, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 91
	%struct.DSOCacheEntry {
		i64 550368715, ; hash 0x20cdf5cb, from name: System.Core.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([26 x i8], [26 x i8]* @__DSOCacheEntry_name.17, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 92
	%struct.DSOCacheEntry {
		i64 553863972, ; hash 0x21034b24, from name: aot-System.Collections
		i8 0, ; ignore
		i8* getelementptr inbounds ([33 x i8], [33 x i8]* @__DSOCacheEntry_name.48, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 93
	%struct.DSOCacheEntry {
		i64 554840301, ; hash 0x211230ed, from name: aot-System.Net.Requests.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([34 x i8], [34 x i8]* @__DSOCacheEntry_name.26, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 94
	%struct.DSOCacheEntry {
		i64 563700166, ; hash 0x219961c6, from name: libaot-Xamarin.AndroidX.AppCompat
		i8 0, ; ignore
		i8* getelementptr inbounds ([41 x i8], [41 x i8]* @__DSOCacheEntry_name.46, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 95
	%struct.DSOCacheEntry {
		i64 575540603, ; hash 0x224e0d7b, from name: libaot-Xamarin.GooglePlayServices.Base
		i8 0, ; ignore
		i8* getelementptr inbounds ([46 x i8], [46 x i8]* @__DSOCacheEntry_name.29, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 96
	%struct.DSOCacheEntry {
		i64 585770835, ; hash 0x22ea2753, from name: Xamarin.GooglePlayServices.Measurement.Api.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([57 x i8], [57 x i8]* @__DSOCacheEntry_name.71, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 97
	%struct.DSOCacheEntry {
		i64 595217260, ; hash 0x237a4b6c, from name: Xamarin.AndroidX.Navigation.UI.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([45 x i8], [45 x i8]* @__DSOCacheEntry_name.44, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 98
	%struct.DSOCacheEntry {
		i64 599950454, ; hash 0x23c28476, from name: aot-Xamarin.AndroidX.Lifecycle.ViewModelSavedState
		i8 0, ; ignore
		i8* getelementptr inbounds ([61 x i8], [61 x i8]* @__DSOCacheEntry_name.72, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 99
	%struct.DSOCacheEntry {
		i64 602566721, ; hash 0x23ea7041, from name: aot-System.Text.Encodings.Web.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([40 x i8], [40 x i8]* @__DSOCacheEntry_name.73, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 100
	%struct.DSOCacheEntry {
		i64 619290284, ; hash 0x24e99eac, from name: Xamarin.AndroidX.Collection.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([42 x i8], [42 x i8]* @__DSOCacheEntry_name.74, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 101
	%struct.DSOCacheEntry {
		i64 624688707, ; hash 0x253bfe43, from name: Xamarin.Facebook.Messenger.Android
		i8 0, ; ignore
		i8* getelementptr inbounds ([49 x i8], [49 x i8]* @__DSOCacheEntry_name.12, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 102
	%struct.DSOCacheEntry {
		i64 627609679, ; hash 0x2568904f, from name: Xamarin.AndroidX.CustomView
		i8 0, ; ignore
		i8* getelementptr inbounds ([42 x i8], [42 x i8]* @__DSOCacheEntry_name.22, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 103
	%struct.DSOCacheEntry {
		i64 628702715, ; hash 0x25793dfb, from name: libaot-Xamarin.Facebook.Android
		i8 0, ; ignore
		i8* getelementptr inbounds ([39 x i8], [39 x i8]* @__DSOCacheEntry_name.75, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 104
	%struct.DSOCacheEntry {
		i64 629828598, ; hash 0x258a6bf6, from name: Microsoft.Maui.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([29 x i8], [29 x i8]* @__DSOCacheEntry_name.76, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 105
	%struct.DSOCacheEntry {
		i64 640779692, ; hash 0x263185ac, from name: libaot-Microsoft.Extensions.FileProviders.Embedded.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([58 x i8], [58 x i8]* @__DSOCacheEntry_name.77, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 106
	%struct.DSOCacheEntry {
		i64 641360513, ; hash 0x263a6281, from name: aot-System.Numerics.Vectors.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.5, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 107
	%struct.DSOCacheEntry {
		i64 645288582, ; hash 0x26765286, from name: libaot-Xamarin.AndroidX.CardView
		i8 0, ; ignore
		i8* getelementptr inbounds ([40 x i8], [40 x i8]* @__DSOCacheEntry_name.78, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 108
	%struct.DSOCacheEntry {
		i64 654604942, ; hash 0x27047a8e, from name: aot-Microsoft.Extensions.FileProviders.Embedded
		i8 0, ; ignore
		i8* getelementptr inbounds ([58 x i8], [58 x i8]* @__DSOCacheEntry_name.77, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 109
	%struct.DSOCacheEntry {
		i64 660366738, ; hash 0x275c6592, from name: aot-Xamarin.Google.Android.Material.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([46 x i8], [46 x i8]* @__DSOCacheEntry_name.79, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 110
	%struct.DSOCacheEntry {
		i64 663517072, ; hash 0x278c7790, from name: Xamarin.AndroidX.VersionedParcelable
		i8 0, ; ignore
		i8* getelementptr inbounds ([51 x i8], [51 x i8]* @__DSOCacheEntry_name.80, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 111
	%struct.DSOCacheEntry {
		i64 672442732, ; hash 0x2814a96c, from name: System.Collections.Concurrent
		i8 0, ; ignore
		i8* getelementptr inbounds ([44 x i8], [44 x i8]* @__DSOCacheEntry_name.31, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 112
	%struct.DSOCacheEntry {
		i64 675936804, ; hash 0x2849fa24, from name: System.Net.Requests.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([34 x i8], [34 x i8]* @__DSOCacheEntry_name.26, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 113
	%struct.DSOCacheEntry {
		i64 679655364, ; hash 0x2882b7c4, from name: aot-System.Runtime.InteropServices
		i8 0, ; ignore
		i8* getelementptr inbounds ([45 x i8], [45 x i8]* @__DSOCacheEntry_name.11, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 114
	%struct.DSOCacheEntry {
		i64 695176253, ; hash 0x296f8c3d, from name: aot-Plugin.Firebase.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([30 x i8], [30 x i8]* @__DSOCacheEntry_name.69, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 115
	%struct.DSOCacheEntry {
		i64 719428787, ; hash 0x2ae19cb3, from name: libaot-Microsoft.AspNetCore.Components.WebView.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([54 x i8], [54 x i8]* @__DSOCacheEntry_name.52, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 116
	%struct.DSOCacheEntry {
		i64 738487011, ; hash 0x2c046ae3, from name: aot-System.Memory
		i8 0, ; ignore
		i8* getelementptr inbounds ([28 x i8], [28 x i8]* @__DSOCacheEntry_name.53, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 117
	%struct.DSOCacheEntry {
		i64 748366034, ; hash 0x2c9b28d2, from name: monodroid
		i8 0, ; ignore
		i8* getelementptr inbounds ([16 x i8], [16 x i8]* @__DSOCacheEntry_name.30, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 118
	%struct.DSOCacheEntry {
		i64 753634573, ; hash 0x2ceb8d0d, from name: libaot-Xamarin.Firebase.Crashlytics.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([43 x i8], [43 x i8]* @__DSOCacheEntry_name.42, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 119
	%struct.DSOCacheEntry {
		i64 759156225, ; hash 0x2d3fce01, from name: aot-Xamarin.AndroidX.Collection.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([42 x i8], [42 x i8]* @__DSOCacheEntry_name.74, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 120
	%struct.DSOCacheEntry {
		i64 759454413, ; hash 0x2d445acd, from name: System.Net.Requests
		i8 0, ; ignore
		i8* getelementptr inbounds ([34 x i8], [34 x i8]* @__DSOCacheEntry_name.26, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 121
	%struct.DSOCacheEntry {
		i64 761332650, ; hash 0x2d6103aa, from name: libaot-Microsoft.Maui.Controls.Xaml.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([43 x i8], [43 x i8]* @__DSOCacheEntry_name.81, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 122
	%struct.DSOCacheEntry {
		i64 775507847, ; hash 0x2e394f87, from name: System.IO.Compression
		i8 0, ; ignore
		i8* getelementptr inbounds ([36 x i8], [36 x i8]* @__DSOCacheEntry_name.58, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 123
	%struct.DSOCacheEntry {
		i64 786376881, ; hash 0x2edf28b1, from name: aot-Xamarin.Facebook.Login.Android.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([45 x i8], [45 x i8]* @__DSOCacheEntry_name.82, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 124
	%struct.DSOCacheEntry {
		i64 789074706, ; hash 0x2f085312, from name: aot-System.Threading.Thread
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.3, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 125
	%struct.DSOCacheEntry {
		i64 789151979, ; hash 0x2f0980eb, from name: Microsoft.Extensions.Options
		i8 0, ; ignore
		i8* getelementptr inbounds ([43 x i8], [43 x i8]* @__DSOCacheEntry_name.83, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 126
	%struct.DSOCacheEntry {
		i64 802286629, ; hash 0x2fd1ec25, from name: aot-Xamarin.AndroidX.DrawerLayout.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([44 x i8], [44 x i8]* @__DSOCacheEntry_name.84, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 127
	%struct.DSOCacheEntry {
		i64 804008546, ; hash 0x2fec3262, from name: Microsoft.AspNetCore.Components.WebView.Maui
		i8 0, ; ignore
		i8* getelementptr inbounds ([59 x i8], [59 x i8]* @__DSOCacheEntry_name.85, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 128
	%struct.DSOCacheEntry {
		i64 806746267, ; hash 0x3015f89b, from name: aot-System.Private.Xml.Linq
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.86, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 129
	%struct.DSOCacheEntry {
		i64 826035354, ; hash 0x313c4c9a, from name: libaot-Microsoft.Maui.Graphics.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.87, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 130
	%struct.DSOCacheEntry {
		i64 837478634, ; hash 0x31eae8ea, from name: libaot-System.Linq.Expressions
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.88, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 131
	%struct.DSOCacheEntry {
		i64 838232158, ; hash 0x31f6685e, from name: aot-Xamarin.AndroidX.Lifecycle.Common.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([48 x i8], [48 x i8]* @__DSOCacheEntry_name.19, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 132
	%struct.DSOCacheEntry {
		i64 845281079, ; hash 0x3261f737, from name: aot-Xamarin.Firebase.Components.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([42 x i8], [42 x i8]* @__DSOCacheEntry_name.63, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 133
	%struct.DSOCacheEntry {
		i64 845614355, ; hash 0x32670d13, from name: aot-System.Collections.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([33 x i8], [33 x i8]* @__DSOCacheEntry_name.48, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 134
	%struct.DSOCacheEntry {
		i64 846646212, ; hash 0x3276cbc4, from name: aot-System.Collections.Concurrent.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([44 x i8], [44 x i8]* @__DSOCacheEntry_name.31, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 135
	%struct.DSOCacheEntry {
		i64 850113928, ; hash 0x32abb588, from name: libaot-Xamarin.AndroidX.AppCompat.AppCompatResources.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([60 x i8], [60 x i8]* @__DSOCacheEntry_name.59, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 136
	%struct.DSOCacheEntry {
		i64 852004286, ; hash 0x32c88dbe, from name: libaot-Xamarin.GooglePlayServices.Basement
		i8 0, ; ignore
		i8* getelementptr inbounds ([50 x i8], [50 x i8]* @__DSOCacheEntry_name.49, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 137
	%struct.DSOCacheEntry {
		i64 855129724, ; hash 0x32f83e7c, from name: libaot-System.Private.Xml.Linq.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.86, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 138
	%struct.DSOCacheEntry {
		i64 855910803, ; hash 0x33042993, from name: aot-System.Threading.Thread.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.3, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 139
	%struct.DSOCacheEntry {
		i64 859072783, ; hash 0x3334690f, from name: libaot-Xamarin.Firebase.Auth.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([36 x i8], [36 x i8]* @__DSOCacheEntry_name.89, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 140
	%struct.DSOCacheEntry {
		i64 860285464, ; hash 0x3346ea18, from name: aot-Xamarin.Facebook.Share.Android
		i8 0, ; ignore
		i8* getelementptr inbounds ([45 x i8], [45 x i8]* @__DSOCacheEntry_name.90, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 141
	%struct.DSOCacheEntry {
		i64 862126818, ; hash 0x336302e2, from name: libaot-Xamarin.AndroidX.CoordinatorLayout.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([49 x i8], [49 x i8]* @__DSOCacheEntry_name.36, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 142
	%struct.DSOCacheEntry {
		i64 870587408, ; hash 0x33e41c10, from name: System.Security.Cryptography.Native.Android.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([50 x i8], [50 x i8]* @__DSOCacheEntry_name.15, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 143
	%struct.DSOCacheEntry {
		i64 874318146, ; hash 0x341d0942, from name: libaot-System.IO.Compression.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([36 x i8], [36 x i8]* @__DSOCacheEntry_name.58, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 144
	%struct.DSOCacheEntry {
		i64 876853269, ; hash 0x3443b815, from name: libaot-System.Net.Primitives
		i8 0, ; ignore
		i8* getelementptr inbounds ([36 x i8], [36 x i8]* @__DSOCacheEntry_name.91, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 145
	%struct.DSOCacheEntry {
		i64 880254817, ; hash 0x34779f61, from name: Microsoft.Extensions.DependencyInjection.Abstractions.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([68 x i8], [68 x i8]* @__DSOCacheEntry_name.51, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 146
	%struct.DSOCacheEntry {
		i64 884884248, ; hash 0x34be4318, from name: aot-Xamarin.AndroidX.Collection
		i8 0, ; ignore
		i8* getelementptr inbounds ([42 x i8], [42 x i8]* @__DSOCacheEntry_name.74, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 147
	%struct.DSOCacheEntry {
		i64 899702261, ; hash 0x35a05df5, from name: aot-Microsoft.Extensions.Primitives.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([46 x i8], [46 x i8]* @__DSOCacheEntry_name.92, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 148
	%struct.DSOCacheEntry {
		i64 905680937, ; hash 0x35fb9829, from name: aot-mscorlib.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([23 x i8], [23 x i8]* @__DSOCacheEntry_name.14, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 149
	%struct.DSOCacheEntry {
		i64 907714710, ; hash 0x361aa096, from name: libaot-System.Security.Cryptography
		i8 0, ; ignore
		i8* getelementptr inbounds ([43 x i8], [43 x i8]* @__DSOCacheEntry_name.93, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 150
	%struct.DSOCacheEntry {
		i64 925053072, ; hash 0x37233090, from name: aot-Microsoft.Extensions.FileProviders.Embedded.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([58 x i8], [58 x i8]* @__DSOCacheEntry_name.77, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 151
	%struct.DSOCacheEntry {
		i64 938354468, ; hash 0x37ee2724, from name: aot-Microsoft.AspNetCore.Components.WebView.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([54 x i8], [54 x i8]* @__DSOCacheEntry_name.52, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 152
	%struct.DSOCacheEntry {
		i64 940524279, ; hash 0x380f42f7, from name: libaot-Xamarin.Firebase.Functions.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([41 x i8], [41 x i8]* @__DSOCacheEntry_name.62, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 153
	%struct.DSOCacheEntry {
		i64 940742254, ; hash 0x3812966e, from name: libaot-System.Linq.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([26 x i8], [26 x i8]* @__DSOCacheEntry_name.94, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 154
	%struct.DSOCacheEntry {
		i64 956022431, ; hash 0x38fbbe9f, from name: aot-System.Text.Encodings.Web
		i8 0, ; ignore
		i8* getelementptr inbounds ([40 x i8], [40 x i8]* @__DSOCacheEntry_name.73, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 155
	%struct.DSOCacheEntry {
		i64 965570903, ; hash 0x398d7157, from name: libaot-System
		i8 0, ; ignore
		i8* getelementptr inbounds ([21 x i8], [21 x i8]* @__DSOCacheEntry_name.95, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 156
	%struct.DSOCacheEntry {
		i64 969956558, ; hash 0x39d05cce, from name: libaot-Xamarin.Firebase.Auth.Interop
		i8 0, ; ignore
		i8* getelementptr inbounds ([44 x i8], [44 x i8]* @__DSOCacheEntry_name.96, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 157
	%struct.DSOCacheEntry {
		i64 970896636, ; hash 0x39deb4fc, from name: libaot-Xamarin.AndroidX.Lifecycle.ViewModel.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([51 x i8], [51 x i8]* @__DSOCacheEntry_name.97, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 158
	%struct.DSOCacheEntry {
		i64 975874589, ; hash 0x3a2aaa1d, from name: System.Xml.XDocument
		i8 0, ; ignore
		i8* getelementptr inbounds ([35 x i8], [35 x i8]* @__DSOCacheEntry_name.98, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 159
	%struct.DSOCacheEntry {
		i64 981249547, ; hash 0x3a7cae0b, from name: Xamarin.AndroidX.Browser.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([39 x i8], [39 x i8]* @__DSOCacheEntry_name.37, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 160
	%struct.DSOCacheEntry {
		i64 983724495, ; hash 0x3aa271cf, from name: libaot-System.Private.Xml.Linq
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.86, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 161
	%struct.DSOCacheEntry {
		i64 991024368, ; hash 0x3b11d4f0, from name: aot-System.ComponentModel.TypeConverter
		i8 0, ; ignore
		i8* getelementptr inbounds ([50 x i8], [50 x i8]* @__DSOCacheEntry_name.99, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 162
	%struct.DSOCacheEntry {
		i64 991370235, ; hash 0x3b171bfb, from name: libaot-Xamarin.AndroidX.Loader.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.60, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 163
	%struct.DSOCacheEntry {
		i64 999372639, ; hash 0x3b91375f, from name: Xamarin.Facebook.Core.Android
		i8 0, ; ignore
		i8* getelementptr inbounds ([44 x i8], [44 x i8]* @__DSOCacheEntry_name.100, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 164
	%struct.DSOCacheEntry {
		i64 999807200, ; hash 0x3b97d8e0, from name: Xamarin.AndroidX.SwipeRefreshLayout.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([50 x i8], [50 x i8]* @__DSOCacheEntry_name.101, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 165
	%struct.DSOCacheEntry {
		i64 1000172987, ; hash 0x3b9d6dbb, from name: libaot-System.Xml.ReaderWriter
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.38, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 166
	%struct.DSOCacheEntry {
		i64 1000318620, ; hash 0x3b9fa69c, from name: libaot-System.Net.Http.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([30 x i8], [30 x i8]* @__DSOCacheEntry_name.102, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 167
	%struct.DSOCacheEntry {
		i64 1014632550, ; hash 0x3c7a1066, from name: Microsoft.Maui.Essentials.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([40 x i8], [40 x i8]* @__DSOCacheEntry_name.103, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 168
	%struct.DSOCacheEntry {
		i64 1020599761, ; hash 0x3cd51dd1, from name: libaot-Microsoft.Maui.Controls.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.56, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 169
	%struct.DSOCacheEntry {
		i64 1021628303, ; hash 0x3ce4cf8f, from name: libaot-Microsoft.Extensions.Options.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([43 x i8], [43 x i8]* @__DSOCacheEntry_name.83, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 170
	%struct.DSOCacheEntry {
		i64 1027261693, ; hash 0x3d3ac4fd, from name: aot-Xamarin.AndroidX.DrawerLayout
		i8 0, ; ignore
		i8* getelementptr inbounds ([44 x i8], [44 x i8]* @__DSOCacheEntry_name.84, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 171
	%struct.DSOCacheEntry {
		i64 1028951442, ; hash 0x3d548d92, from name: Microsoft.Extensions.DependencyInjection.Abstractions
		i8 0, ; ignore
		i8* getelementptr inbounds ([68 x i8], [68 x i8]* @__DSOCacheEntry_name.51, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 172
	%struct.DSOCacheEntry {
		i64 1035644815, ; hash 0x3dbaaf8f, from name: Xamarin.AndroidX.AppCompat
		i8 0, ; ignore
		i8* getelementptr inbounds ([41 x i8], [41 x i8]* @__DSOCacheEntry_name.46, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 173
	%struct.DSOCacheEntry {
		i64 1064597976, ; hash 0x3f7479d8, from name: Xamarin.AndroidX.Fragment.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([40 x i8], [40 x i8]* @__DSOCacheEntry_name.61, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 174
	%struct.DSOCacheEntry {
		i64 1067306892, ; hash 0x3f9dcf8c, from name: GoogleGson
		i8 0, ; ignore
		i8* getelementptr inbounds ([25 x i8], [25 x i8]* @__DSOCacheEntry_name.104, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 175
	%struct.DSOCacheEntry {
		i64 1070600820, ; hash 0x3fd01274, from name: Xamarin.AndroidX.VersionedParcelable.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([51 x i8], [51 x i8]* @__DSOCacheEntry_name.80, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 176
	%struct.DSOCacheEntry {
		i64 1074670799, ; hash 0x400e2ccf, from name: Microsoft.Maui.Controls.Xaml.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([43 x i8], [43 x i8]* @__DSOCacheEntry_name.81, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 177
	%struct.DSOCacheEntry {
		i64 1076071578, ; hash 0x40238c9a, from name: libaot-Microsoft.CSharp
		i8 0, ; ignore
		i8* getelementptr inbounds ([31 x i8], [31 x i8]* @__DSOCacheEntry_name.23, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 178
	%struct.DSOCacheEntry {
		i64 1079503280, ; hash 0x4057e9b0, from name: libaot-Xamarin.AndroidX.CursorAdapter.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([45 x i8], [45 x i8]* @__DSOCacheEntry_name.105, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 179
	%struct.DSOCacheEntry {
		i64 1081389552, ; hash 0x4074b1f0, from name: libaot-Xamarin.Facebook.Login.Android.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([45 x i8], [45 x i8]* @__DSOCacheEntry_name.82, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 180
	%struct.DSOCacheEntry {
		i64 1082857460, ; hash 0x408b17f4, from name: System.ComponentModel.TypeConverter
		i8 0, ; ignore
		i8* getelementptr inbounds ([50 x i8], [50 x i8]* @__DSOCacheEntry_name.99, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 181
	%struct.DSOCacheEntry {
		i64 1084122840, ; hash 0x409e66d8, from name: Xamarin.Kotlin.StdLib
		i8 0, ; ignore
		i8* getelementptr inbounds ([36 x i8], [36 x i8]* @__DSOCacheEntry_name.32, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 182
	%struct.DSOCacheEntry {
		i64 1094227347, ; hash 0x41389593, from name: aot-Xamarin.Facebook.Android
		i8 0, ; ignore
		i8* getelementptr inbounds ([39 x i8], [39 x i8]* @__DSOCacheEntry_name.75, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 183
	%struct.DSOCacheEntry {
		i64 1098259244, ; hash 0x41761b2c, from name: System
		i8 0, ; ignore
		i8* getelementptr inbounds ([21 x i8], [21 x i8]* @__DSOCacheEntry_name.95, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 184
	%struct.DSOCacheEntry {
		i64 1101485939, ; hash 0x41a75773, from name: libaot-Blazored.LocalStorage
		i8 0, ; ignore
		i8* getelementptr inbounds ([36 x i8], [36 x i8]* @__DSOCacheEntry_name.67, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 185
	%struct.DSOCacheEntry {
		i64 1110581358, ; hash 0x4232206e, from name: Xamarin.Firebase.Auth
		i8 0, ; ignore
		i8* getelementptr inbounds ([36 x i8], [36 x i8]* @__DSOCacheEntry_name.89, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 186
	%struct.DSOCacheEntry {
		i64 1121069432, ; hash 0x42d22978, from name: libaot-Microsoft.Extensions.DependencyInjection.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([55 x i8], [55 x i8]* @__DSOCacheEntry_name.35, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 187
	%struct.DSOCacheEntry {
		i64 1122022473, ; hash 0x42e0b449, from name: libaot-Xamarin.Google.Android.DataTransport.TransportApi.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([64 x i8], [64 x i8]* @__DSOCacheEntry_name.106, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 188
	%struct.DSOCacheEntry {
		i64 1132337183, ; hash 0x437e181f, from name: aot-Xamarin.Firebase.Auth.Interop
		i8 0, ; ignore
		i8* getelementptr inbounds ([44 x i8], [44 x i8]* @__DSOCacheEntry_name.96, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 189
	%struct.DSOCacheEntry {
		i64 1136326207, ; hash 0x43baf63f, from name: libaot-Xamarin.AndroidX.Navigation.Common
		i8 0, ; ignore
		i8* getelementptr inbounds ([49 x i8], [49 x i8]* @__DSOCacheEntry_name.107, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 190
	%struct.DSOCacheEntry {
		i64 1141279138, ; hash 0x440689a2, from name: libaot-System.Core
		i8 0, ; ignore
		i8* getelementptr inbounds ([26 x i8], [26 x i8]* @__DSOCacheEntry_name.17, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 191
	%struct.DSOCacheEntry {
		i64 1149092582, ; hash 0x447dc2e6, from name: Xamarin.AndroidX.Window
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.108, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 192
	%struct.DSOCacheEntry {
		i64 1151863355, ; hash 0x44a80a3b, from name: libaot-Microsoft.Extensions.FileSystemGlobbing.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([54 x i8], [54 x i8]* @__DSOCacheEntry_name.27, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 193
	%struct.DSOCacheEntry {
		i64 1158083819, ; hash 0x4506f4eb, from name: libaot-System.Net.Requests.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([34 x i8], [34 x i8]* @__DSOCacheEntry_name.26, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 194
	%struct.DSOCacheEntry {
		i64 1162145747, ; hash 0x4544efd3, from name: aot-Xamarin.AndroidX.Activity.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([40 x i8], [40 x i8]* @__DSOCacheEntry_name.18, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 195
	%struct.DSOCacheEntry {
		i64 1166279424, ; hash 0x45840300, from name: libaot-Microsoft.Extensions.Primitives.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([46 x i8], [46 x i8]* @__DSOCacheEntry_name.92, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 196
	%struct.DSOCacheEntry {
		i64 1166903420, ; hash 0x458d887c, from name: System.Collections.Concurrent.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([44 x i8], [44 x i8]* @__DSOCacheEntry_name.31, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 197
	%struct.DSOCacheEntry {
		i64 1168283859, ; hash 0x45a298d3, from name: libaot-System.Collections.NonGeneric.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([44 x i8], [44 x i8]* @__DSOCacheEntry_name.1, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 198
	%struct.DSOCacheEntry {
		i64 1173940943, ; hash 0x45f8eacf, from name: libaot-Xamarin.AndroidX.Window
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.108, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 199
	%struct.DSOCacheEntry {
		i64 1188200450, ; hash 0x46d28002, from name: aot-Xamarin.Firebase.Common
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.109, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 200
	%struct.DSOCacheEntry {
		i64 1194435441, ; hash 0x4731a371, from name: libaot-Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([61 x i8], [61 x i8]* @__DSOCacheEntry_name.72, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 201
	%struct.DSOCacheEntry {
		i64 1198981621, ; hash 0x477701f5, from name: aot-System.IO.FileSystem.Watcher.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([43 x i8], [43 x i8]* @__DSOCacheEntry_name.68, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 202
	%struct.DSOCacheEntry {
		i64 1210650032, ; hash 0x48290db0, from name: Microsoft.AspNetCore.Components.WebView.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([54 x i8], [54 x i8]* @__DSOCacheEntry_name.52, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 203
	%struct.DSOCacheEntry {
		i64 1220496844, ; hash 0x48bf4dcc, from name: libaot-Microsoft.AspNetCore.Components.WebView.Maui
		i8 0, ; ignore
		i8* getelementptr inbounds ([59 x i8], [59 x i8]* @__DSOCacheEntry_name.85, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 204
	%struct.DSOCacheEntry {
		i64 1245232106, ; hash 0x4a38bbea, from name: aot-Blazored.SessionStorage.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.20, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 205
	%struct.DSOCacheEntry {
		i64 1245505396, ; hash 0x4a3ce774, from name: libaot-Microsoft.JSInterop.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([34 x i8], [34 x i8]* @__DSOCacheEntry_name.110, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 206
	%struct.DSOCacheEntry {
		i64 1248415137, ; hash 0x4a694da1, from name: aot-System.Runtime.Loader
		i8 0, ; ignore
		i8* getelementptr inbounds ([36 x i8], [36 x i8]* @__DSOCacheEntry_name.33, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 207
	%struct.DSOCacheEntry {
		i64 1249626734, ; hash 0x4a7bca6e, from name: Xamarin.AndroidX.CoordinatorLayout.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([49 x i8], [49 x i8]* @__DSOCacheEntry_name.36, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 208
	%struct.DSOCacheEntry {
		i64 1253376382, ; hash 0x4ab5017e, from name: Microsoft.AspNetCore.Components.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([46 x i8], [46 x i8]* @__DSOCacheEntry_name.111, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 209
	%struct.DSOCacheEntry {
		i64 1262296313, ; hash 0x4b3d1cf9, from name: libaot-Xamarin.Firebase.Components
		i8 0, ; ignore
		i8* getelementptr inbounds ([42 x i8], [42 x i8]* @__DSOCacheEntry_name.63, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 210
	%struct.DSOCacheEntry {
		i64 1264007745, ; hash 0x4b573a41, from name: aot-Xamarin.AndroidX.CustomView
		i8 0, ; ignore
		i8* getelementptr inbounds ([42 x i8], [42 x i8]* @__DSOCacheEntry_name.22, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 211
	%struct.DSOCacheEntry {
		i64 1277412854, ; hash 0x4c23c5f6, from name: libaot-System.Core.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([26 x i8], [26 x i8]* @__DSOCacheEntry_name.17, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 212
	%struct.DSOCacheEntry {
		i64 1281955724, ; hash 0x4c69178c, from name: libaot-Microsoft.Maui.Controls.Xaml
		i8 0, ; ignore
		i8* getelementptr inbounds ([43 x i8], [43 x i8]* @__DSOCacheEntry_name.81, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 213
	%struct.DSOCacheEntry {
		i64 1285465351, ; hash 0x4c9ea507, from name: aot-System.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([21 x i8], [21 x i8]* @__DSOCacheEntry_name.95, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 214
	%struct.DSOCacheEntry {
		i64 1299330171, ; hash 0x4d72347b, from name: aot-Microsoft.AspNetCore.Components.WebView
		i8 0, ; ignore
		i8* getelementptr inbounds ([54 x i8], [54 x i8]* @__DSOCacheEntry_name.52, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 215
	%struct.DSOCacheEntry {
		i64 1303631868, ; hash 0x4db3d7fc, from name: libaot-Microsoft.Maui.Graphics
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.87, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 216
	%struct.DSOCacheEntry {
		i64 1314616103, ; hash 0x4e5b7327, from name: aot-KTKGuest.WebComponents.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([37 x i8], [37 x i8]* @__DSOCacheEntry_name.28, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 217
	%struct.DSOCacheEntry {
		i64 1324164729, ; hash 0x4eed2679, from name: System.Linq
		i8 0, ; ignore
		i8* getelementptr inbounds ([26 x i8], [26 x i8]* @__DSOCacheEntry_name.94, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 218
	%struct.DSOCacheEntry {
		i64 1326422064, ; hash 0x4f0f9830, from name: libaot-System.ObjectModel.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([33 x i8], [33 x i8]* @__DSOCacheEntry_name.64, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 219
	%struct.DSOCacheEntry {
		i64 1330538025, ; hash 0x4f4e6629, from name: libaot-System.ObjectModel
		i8 0, ; ignore
		i8* getelementptr inbounds ([33 x i8], [33 x i8]* @__DSOCacheEntry_name.64, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 220
	%struct.DSOCacheEntry {
		i64 1331715804, ; hash 0x4f605edc, from name: aot-Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([61 x i8], [61 x i8]* @__DSOCacheEntry_name.72, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 221
	%struct.DSOCacheEntry {
		i64 1333047053, ; hash 0x4f74af0d, from name: Xamarin.Firebase.Common
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.109, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 222
	%struct.DSOCacheEntry {
		i64 1355858023, ; hash 0x50d0c067, from name: Xamarin.Firebase.Common.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.109, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 223
	%struct.DSOCacheEntry {
		i64 1356916091, ; hash 0x50e0e57b, from name: Microsoft.Maui.Controls.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.56, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 224
	%struct.DSOCacheEntry {
		i64 1357966046, ; hash 0x50f0eade, from name: Xamarin.Facebook.AppLinks.Android.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([48 x i8], [48 x i8]* @__DSOCacheEntry_name.9, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 225
	%struct.DSOCacheEntry {
		i64 1360868007, ; hash 0x511d32a7, from name: libaot-Xamarin.Google.Android.Material
		i8 0, ; ignore
		i8* getelementptr inbounds ([46 x i8], [46 x i8]* @__DSOCacheEntry_name.79, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 226
	%struct.DSOCacheEntry {
		i64 1363166739, ; hash 0x51404613, from name: libaot-Xamarin.AndroidX.Navigation.Fragment
		i8 0, ; ignore
		i8* getelementptr inbounds ([51 x i8], [51 x i8]* @__DSOCacheEntry_name.112, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 227
	%struct.DSOCacheEntry {
		i64 1364629429, ; hash 0x515697b5, from name: System.Linq.Expressions.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.88, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 228
	%struct.DSOCacheEntry {
		i64 1369292404, ; hash 0x519dbe74, from name: aot-Xamarin.AndroidX.ViewPager2
		i8 0, ; ignore
		i8* getelementptr inbounds ([42 x i8], [42 x i8]* @__DSOCacheEntry_name.54, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 229
	%struct.DSOCacheEntry {
		i64 1369635430, ; hash 0x51a2fa66, from name: aot-Xamarin.AndroidX.Window
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.108, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 230
	%struct.DSOCacheEntry {
		i64 1373613485, ; hash 0x51dfadad, from name: libaot-Microsoft.Maui.Essentials
		i8 0, ; ignore
		i8* getelementptr inbounds ([40 x i8], [40 x i8]* @__DSOCacheEntry_name.103, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 231
	%struct.DSOCacheEntry {
		i64 1376113003, ; hash 0x5205d16b, from name: aot-Microsoft.CSharp.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([31 x i8], [31 x i8]* @__DSOCacheEntry_name.23, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 232
	%struct.DSOCacheEntry {
		i64 1376238345, ; hash 0x5207bb09, from name: aot-System.Private.CoreLib.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([37 x i8], [37 x i8]* @__DSOCacheEntry_name.113, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 233
	%struct.DSOCacheEntry {
		i64 1376866003, ; hash 0x52114ed3, from name: Xamarin.AndroidX.SavedState
		i8 0, ; ignore
		i8* getelementptr inbounds ([42 x i8], [42 x i8]* @__DSOCacheEntry_name.24, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 234
	%struct.DSOCacheEntry {
		i64 1381714709, ; hash 0x525b4b15, from name: libaot-Xamarin.Firebase.Dynamic.Links.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([45 x i8], [45 x i8]* @__DSOCacheEntry_name.4, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 235
	%struct.DSOCacheEntry {
		i64 1383009688, ; hash 0x526f0d98, from name: aot-System.Net.Http.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([30 x i8], [30 x i8]* @__DSOCacheEntry_name.102, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 236
	%struct.DSOCacheEntry {
		i64 1383267250, ; hash 0x5272fbb2, from name: aot-System.ObjectModel
		i8 0, ; ignore
		i8* getelementptr inbounds ([33 x i8], [33 x i8]* @__DSOCacheEntry_name.64, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 237
	%struct.DSOCacheEntry {
		i64 1383556038, ; hash 0x527763c6, from name: Xamarin.Google.Android.DataTransport.TransportApi.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([64 x i8], [64 x i8]* @__DSOCacheEntry_name.106, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 238
	%struct.DSOCacheEntry {
		i64 1385495541, ; hash 0x5294fbf5, from name: aot-Microsoft.Extensions.FileProviders.Composite.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([59 x i8], [59 x i8]* @__DSOCacheEntry_name.21, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 239
	%struct.DSOCacheEntry {
		i64 1386166540, ; hash 0x529f390c, from name: libaot-System.Threading
		i8 0, ; ignore
		i8* getelementptr inbounds ([31 x i8], [31 x i8]* @__DSOCacheEntry_name.114, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 240
	%struct.DSOCacheEntry {
		i64 1388636356, ; hash 0x52c4e8c4, from name: aot-Microsoft.Extensions.DependencyInjection.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([55 x i8], [55 x i8]* @__DSOCacheEntry_name.35, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 241
	%struct.DSOCacheEntry {
		i64 1393518053, ; hash 0x530f65e5, from name: aot-Xamarin.Firebase.Firestore
		i8 0, ; ignore
		i8* getelementptr inbounds ([41 x i8], [41 x i8]* @__DSOCacheEntry_name.115, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 242
	%struct.DSOCacheEntry {
		i64 1395919151, ; hash 0x5334092f, from name: libaot-System.ComponentModel.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([36 x i8], [36 x i8]* @__DSOCacheEntry_name.25, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 243
	%struct.DSOCacheEntry {
		i64 1396668899, ; hash 0x533f79e3, from name: libaot-Xamarin.AndroidX.RecyclerView.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([44 x i8], [44 x i8]* @__DSOCacheEntry_name.116, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 244
	%struct.DSOCacheEntry {
		i64 1398864029, ; hash 0x5360f89d, from name: System.Security.Cryptography.Native.Android
		i8 0, ; ignore
		i8* getelementptr inbounds ([50 x i8], [50 x i8]* @__DSOCacheEntry_name.15, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 245
	%struct.DSOCacheEntry {
		i64 1406073936, ; hash 0x53cefc50, from name: Xamarin.AndroidX.CoordinatorLayout
		i8 0, ; ignore
		i8* getelementptr inbounds ([49 x i8], [49 x i8]* @__DSOCacheEntry_name.36, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 246
	%struct.DSOCacheEntry {
		i64 1409736290, ; hash 0x5406de62, from name: aot-Xamarin.AndroidX.AppCompat.AppCompatResources.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([60 x i8], [60 x i8]* @__DSOCacheEntry_name.59, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 247
	%struct.DSOCacheEntry {
		i64 1415442257, ; hash 0x545def51, from name: aot-Microsoft.AspNetCore.Components.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([46 x i8], [46 x i8]* @__DSOCacheEntry_name.111, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 248
	%struct.DSOCacheEntry {
		i64 1427200648, ; hash 0x55115a88, from name: aot-Microsoft.Extensions.Logging
		i8 0, ; ignore
		i8* getelementptr inbounds ([43 x i8], [43 x i8]* @__DSOCacheEntry_name.10, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 249
	%struct.DSOCacheEntry {
		i64 1438276081, ; hash 0x55ba59f1, from name: Xamarin.GooglePlayServices.Tasks.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([47 x i8], [47 x i8]* @__DSOCacheEntry_name.117, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 250
	%struct.DSOCacheEntry {
		i64 1441908576, ; hash 0x55f1c760, from name: aot-Microsoft.AspNetCore.Components
		i8 0, ; ignore
		i8* getelementptr inbounds ([46 x i8], [46 x i8]* @__DSOCacheEntry_name.111, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 251
	%struct.DSOCacheEntry {
		i64 1452208284, ; hash 0x568ef09c, from name: libaot-Xamarin.AndroidX.Loader
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.60, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 252
	%struct.DSOCacheEntry {
		i64 1454105418, ; hash 0x56abe34a, from name: Microsoft.Extensions.FileProviders.Composite
		i8 0, ; ignore
		i8* getelementptr inbounds ([59 x i8], [59 x i8]* @__DSOCacheEntry_name.21, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 253
	%struct.DSOCacheEntry {
		i64 1457202274, ; hash 0x56db2462, from name: aot-System.Collections.NonGeneric
		i8 0, ; ignore
		i8* getelementptr inbounds ([44 x i8], [44 x i8]* @__DSOCacheEntry_name.1, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 254
	%struct.DSOCacheEntry {
		i64 1461178057, ; hash 0x5717cec9, from name: libaot-Xamarin.Facebook.Login.Android
		i8 0, ; ignore
		i8* getelementptr inbounds ([45 x i8], [45 x i8]* @__DSOCacheEntry_name.82, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 255
	%struct.DSOCacheEntry {
		i64 1463625931, ; hash 0x573d28cb, from name: libaot-Xamarin.Firebase.Config.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.41, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 256
	%struct.DSOCacheEntry {
		i64 1469204771, ; hash 0x57924923, from name: Xamarin.AndroidX.AppCompat.AppCompatResources
		i8 0, ; ignore
		i8* getelementptr inbounds ([60 x i8], [60 x i8]* @__DSOCacheEntry_name.59, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 257
	%struct.DSOCacheEntry {
		i64 1470490898, ; hash 0x57a5e912, from name: Microsoft.Extensions.Primitives
		i8 0, ; ignore
		i8* getelementptr inbounds ([46 x i8], [46 x i8]* @__DSOCacheEntry_name.92, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 258
	%struct.DSOCacheEntry {
		i64 1480146353, ; hash 0x58393db1, from name: libaot-Xamarin.AndroidX.Fragment
		i8 0, ; ignore
		i8* getelementptr inbounds ([40 x i8], [40 x i8]* @__DSOCacheEntry_name.61, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 259
	%struct.DSOCacheEntry {
		i64 1488589746, ; hash 0x58ba13b2, from name: aot-Xamarin.AndroidX.AppCompat
		i8 0, ; ignore
		i8* getelementptr inbounds ([41 x i8], [41 x i8]* @__DSOCacheEntry_name.46, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 260
	%struct.DSOCacheEntry {
		i64 1498085062, ; hash 0x594af6c6, from name: Xamarin.Firebase.Messaging.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([41 x i8], [41 x i8]* @__DSOCacheEntry_name.7, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 261
	%struct.DSOCacheEntry {
		i64 1498647657, ; hash 0x59538c69, from name: aot-Microsoft.Maui.Controls.Compatibility
		i8 0, ; ignore
		i8* getelementptr inbounds ([52 x i8], [52 x i8]* @__DSOCacheEntry_name.70, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 262
	%struct.DSOCacheEntry {
		i64 1503765866, ; hash 0x59a1a56a, from name: aot-System.Runtime
		i8 0, ; ignore
		i8* getelementptr inbounds ([29 x i8], [29 x i8]* @__DSOCacheEntry_name.118, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 263
	%struct.DSOCacheEntry {
		i64 1505467903, ; hash 0x59bb9dff, from name: aot-System.Xml.Linq
		i8 0, ; ignore
		i8* getelementptr inbounds ([30 x i8], [30 x i8]* @__DSOCacheEntry_name.119, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 264
	%struct.DSOCacheEntry {
		i64 1506849058, ; hash 0x59d0b122, from name: Xamarin.Firebase.Auth.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([36 x i8], [36 x i8]* @__DSOCacheEntry_name.89, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 265
	%struct.DSOCacheEntry {
		i64 1512975453, ; hash 0x5a2e2c5d, from name: aot-Microsoft.Extensions.Logging.Abstractions
		i8 0, ; ignore
		i8* getelementptr inbounds ([56 x i8], [56 x i8]* @__DSOCacheEntry_name.45, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 266
	%struct.DSOCacheEntry {
		i64 1518218766, ; hash 0x5a7e2e0e, from name: libaot-System.Collections.NonGeneric
		i8 0, ; ignore
		i8* getelementptr inbounds ([44 x i8], [44 x i8]* @__DSOCacheEntry_name.1, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 267
	%struct.DSOCacheEntry {
		i64 1521091094, ; hash 0x5aaa0216, from name: Microsoft.Extensions.FileSystemGlobbing
		i8 0, ; ignore
		i8* getelementptr inbounds ([54 x i8], [54 x i8]* @__DSOCacheEntry_name.27, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 268
	%struct.DSOCacheEntry {
		i64 1536876128, ; hash 0x5b9ade60, from name: libSystem.Native
		i8 0, ; ignore
		i8* getelementptr inbounds ([20 x i8], [20 x i8]* @__DSOCacheEntry_name.65, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 269
	%struct.DSOCacheEntry {
		i64 1556291890, ; hash 0x5cc32132, from name: libaot-Xamarin.Firebase.Storage
		i8 0, ; ignore
		i8* getelementptr inbounds ([39 x i8], [39 x i8]* @__DSOCacheEntry_name.120, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 270
	%struct.DSOCacheEntry {
		i64 1566308565, ; hash 0x5d5bf8d5, from name: System.Xml.XDocument.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([35 x i8], [35 x i8]* @__DSOCacheEntry_name.98, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 271
	%struct.DSOCacheEntry {
		i64 1581679995, ; hash 0x5e46857b, from name: Xamarin.Firebase.Functions.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([41 x i8], [41 x i8]* @__DSOCacheEntry_name.62, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 272
	%struct.DSOCacheEntry {
		i64 1581957937, ; hash 0x5e4ac331, from name: aot-Xamarin.GooglePlayServices.Measurement.Api.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([57 x i8], [57 x i8]* @__DSOCacheEntry_name.71, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 273
	%struct.DSOCacheEntry {
		i64 1613852951, ; hash 0x60317117, from name: Xamarin.Firebase.Components.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([42 x i8], [42 x i8]* @__DSOCacheEntry_name.63, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 274
	%struct.DSOCacheEntry {
		i64 1624863272, ; hash 0x60d97228, from name: Xamarin.AndroidX.ViewPager2
		i8 0, ; ignore
		i8* getelementptr inbounds ([42 x i8], [42 x i8]* @__DSOCacheEntry_name.54, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 275
	%struct.DSOCacheEntry {
		i64 1636350590, ; hash 0x6188ba7e, from name: Xamarin.AndroidX.CursorAdapter
		i8 0, ; ignore
		i8* getelementptr inbounds ([45 x i8], [45 x i8]* @__DSOCacheEntry_name.105, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 276
	%struct.DSOCacheEntry {
		i64 1637436415, ; hash 0x61994bff, from name: aot-System.Private.Xml.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([33 x i8], [33 x i8]* @__DSOCacheEntry_name.121, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 277
	%struct.DSOCacheEntry {
		i64 1639986890, ; hash 0x61c036ca, from name: System.Text.RegularExpressions
		i8 0, ; ignore
		i8* getelementptr inbounds ([45 x i8], [45 x i8]* @__DSOCacheEntry_name.34, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 278
	%struct.DSOCacheEntry {
		i64 1643369834, ; hash 0x61f3d56a, from name: aot-System.Linq.Expressions
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.88, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 279
	%struct.DSOCacheEntry {
		i64 1644368985, ; hash 0x62031459, from name: libaot-KTKGuest.WebComponents
		i8 0, ; ignore
		i8* getelementptr inbounds ([37 x i8], [37 x i8]* @__DSOCacheEntry_name.28, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 280
	%struct.DSOCacheEntry {
		i64 1651622786, ; hash 0x6271c382, from name: aot-Xamarin.AndroidX.Core
		i8 0, ; ignore
		i8* getelementptr inbounds ([36 x i8], [36 x i8]* @__DSOCacheEntry_name.6, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 281
	%struct.DSOCacheEntry {
		i64 1654881142, ; hash 0x62a37b76, from name: Microsoft.AspNetCore.Components.WebView
		i8 0, ; ignore
		i8* getelementptr inbounds ([54 x i8], [54 x i8]* @__DSOCacheEntry_name.52, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 282
	%struct.DSOCacheEntry {
		i64 1657153582, ; hash 0x62c6282e, from name: System.Runtime
		i8 0, ; ignore
		i8* getelementptr inbounds ([29 x i8], [29 x i8]* @__DSOCacheEntry_name.118, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 283
	%struct.DSOCacheEntry {
		i64 1666759325, ; hash 0x6358ba9d, from name: libaot-KTKGuest.App
		i8 0, ; ignore
		i8* getelementptr inbounds ([27 x i8], [27 x i8]* @__DSOCacheEntry_name.50, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 284
	%struct.DSOCacheEntry {
		i64 1676014415, ; hash 0x63e5f34f, from name: Xamarin.AndroidX.Lifecycle.ViewModel.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([51 x i8], [51 x i8]* @__DSOCacheEntry_name.97, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 285
	%struct.DSOCacheEntry {
		i64 1677371468, ; hash 0x63faa84c, from name: aot-Xamarin.GooglePlayServices.Auth.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([46 x i8], [46 x i8]* @__DSOCacheEntry_name.8, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 286
	%struct.DSOCacheEntry {
		i64 1679018464, ; hash 0x6413c9e0, from name: Blazored.LocalStorage
		i8 0, ; ignore
		i8* getelementptr inbounds ([36 x i8], [36 x i8]* @__DSOCacheEntry_name.67, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 287
	%struct.DSOCacheEntry {
		i64 1679769178, ; hash 0x641f3e5a, from name: System.Security.Cryptography
		i8 0, ; ignore
		i8* getelementptr inbounds ([43 x i8], [43 x i8]* @__DSOCacheEntry_name.93, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 288
	%struct.DSOCacheEntry {
		i64 1697931522, ; hash 0x65346102, from name: aot-Blazored.LocalStorage.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([36 x i8], [36 x i8]* @__DSOCacheEntry_name.67, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 289
	%struct.DSOCacheEntry {
		i64 1701847939, ; hash 0x65702383, from name: libaot-Xamarin.AndroidX.DrawerLayout
		i8 0, ; ignore
		i8* getelementptr inbounds ([44 x i8], [44 x i8]* @__DSOCacheEntry_name.84, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 290
	%struct.DSOCacheEntry {
		i64 1710596193, ; hash 0x65f5a061, from name: Xamarin.Facebook.Android.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([39 x i8], [39 x i8]* @__DSOCacheEntry_name.75, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 291
	%struct.DSOCacheEntry {
		i64 1718376423, ; hash 0x666c57e7, from name: Blazored.SessionStorage
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.20, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 292
	%struct.DSOCacheEntry {
		i64 1723608128, ; hash 0x66bc2c40, from name: aot-Xamarin.AndroidX.Activity
		i8 0, ; ignore
		i8* getelementptr inbounds ([40 x i8], [40 x i8]* @__DSOCacheEntry_name.18, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 293
	%struct.DSOCacheEntry {
		i64 1740020094, ; hash 0x67b6997e, from name: System.Xml.Linq.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([30 x i8], [30 x i8]* @__DSOCacheEntry_name.119, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 294
	%struct.DSOCacheEntry {
		i64 1741899193, ; hash 0x67d345b9, from name: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([61 x i8], [61 x i8]* @__DSOCacheEntry_name.72, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 295
	%struct.DSOCacheEntry {
		i64 1743439659, ; hash 0x67eac72b, from name: aot-Xamarin.AndroidX.ViewPager.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([41 x i8], [41 x i8]* @__DSOCacheEntry_name.122, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 296
	%struct.DSOCacheEntry {
		i64 1746885852, ; hash 0x681f5cdc, from name: libaot-System.Collections.Concurrent.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([44 x i8], [44 x i8]* @__DSOCacheEntry_name.31, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 297
	%struct.DSOCacheEntry {
		i64 1750218741, ; hash 0x685237f5, from name: aot-Xamarin.Firebase.Auth.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([36 x i8], [36 x i8]* @__DSOCacheEntry_name.89, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 298
	%struct.DSOCacheEntry {
		i64 1757787625, ; hash 0x68c5b5e9, from name: Xamarin.Google.Android.Material.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([46 x i8], [46 x i8]* @__DSOCacheEntry_name.79, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 299
	%struct.DSOCacheEntry {
		i64 1761572692, ; hash 0x68ff7754, from name: System.Numerics.Vectors.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.5, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 300
	%struct.DSOCacheEntry {
		i64 1762279646, ; hash 0x690a40de, from name: aot-Xamarin.Protobuf.JavaLite.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([40 x i8], [40 x i8]* @__DSOCacheEntry_name.123, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 301
	%struct.DSOCacheEntry {
		i64 1762368869, ; hash 0x690b9d65, from name: libaot-Xamarin.AndroidX.Navigation.Runtime
		i8 0, ; ignore
		i8* getelementptr inbounds ([50 x i8], [50 x i8]* @__DSOCacheEntry_name.16, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 302
	%struct.DSOCacheEntry {
		i64 1766324549, ; hash 0x6947f945, from name: Xamarin.AndroidX.SwipeRefreshLayout
		i8 0, ; ignore
		i8* getelementptr inbounds ([50 x i8], [50 x i8]* @__DSOCacheEntry_name.101, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 303
	%struct.DSOCacheEntry {
		i64 1770409065, ; hash 0x69864c69, from name: libaot-Microsoft.Maui.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([29 x i8], [29 x i8]* @__DSOCacheEntry_name.76, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 304
	%struct.DSOCacheEntry {
		i64 1770432664, ; hash 0x6986a898, from name: Xamarin.Firebase.Storage.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([39 x i8], [39 x i8]* @__DSOCacheEntry_name.120, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 305
	%struct.DSOCacheEntry {
		i64 1785210584, ; hash 0x6a6826d8, from name: libaot-Microsoft.Extensions.Configuration.Abstractions.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([62 x i8], [62 x i8]* @__DSOCacheEntry_name.124, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 306
	%struct.DSOCacheEntry {
		i64 1788241197, ; hash 0x6a96652d, from name: Xamarin.AndroidX.Fragment
		i8 0, ; ignore
		i8* getelementptr inbounds ([40 x i8], [40 x i8]* @__DSOCacheEntry_name.61, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 307
	%struct.DSOCacheEntry {
		i64 1789909275, ; hash 0x6aafd91b, from name: libaot-Xamarin.Facebook.Messenger.Android.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([49 x i8], [49 x i8]* @__DSOCacheEntry_name.12, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 308
	%struct.DSOCacheEntry {
		i64 1805149144, ; hash 0x6b9863d8, from name: libaot-Xamarin.GooglePlayServices.Measurement.Api
		i8 0, ; ignore
		i8* getelementptr inbounds ([57 x i8], [57 x i8]* @__DSOCacheEntry_name.71, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 309
	%struct.DSOCacheEntry {
		i64 1807794426, ; hash 0x6bc0c0fa, from name: aot-Xamarin.AndroidX.Navigation.Common
		i8 0, ; ignore
		i8* getelementptr inbounds ([49 x i8], [49 x i8]* @__DSOCacheEntry_name.107, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 310
	%struct.DSOCacheEntry {
		i64 1808609942, ; hash 0x6bcd3296, from name: Xamarin.AndroidX.Loader
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.60, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 311
	%struct.DSOCacheEntry {
		i64 1813201214, ; hash 0x6c13413e, from name: Xamarin.Google.Android.Material
		i8 0, ; ignore
		i8* getelementptr inbounds ([46 x i8], [46 x i8]* @__DSOCacheEntry_name.79, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 312
	%struct.DSOCacheEntry {
		i64 1816605001, ; hash 0x6c473149, from name: aot-Microsoft.Extensions.Configuration.Abstractions
		i8 0, ; ignore
		i8* getelementptr inbounds ([62 x i8], [62 x i8]* @__DSOCacheEntry_name.124, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 313
	%struct.DSOCacheEntry {
		i64 1822997506, ; hash 0x6ca8bc02, from name: libaot-System.Text.Encodings.Web.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([40 x i8], [40 x i8]* @__DSOCacheEntry_name.73, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 314
	%struct.DSOCacheEntry {
		i64 1825590591, ; hash 0x6cd04d3f, from name: Blazored.LocalStorage.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([36 x i8], [36 x i8]* @__DSOCacheEntry_name.67, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 315
	%struct.DSOCacheEntry {
		i64 1828981094, ; hash 0x6d040966, from name: Xamarin.Facebook.Messenger.Android.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([49 x i8], [49 x i8]* @__DSOCacheEntry_name.12, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 316
	%struct.DSOCacheEntry {
		i64 1836222811, ; hash 0x6d72895b, from name: aot-Microsoft.Extensions.Configuration.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([49 x i8], [49 x i8]* @__DSOCacheEntry_name.125, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 317
	%struct.DSOCacheEntry {
		i64 1838737787, ; hash 0x6d98e97b, from name: aot-Xamarin.AndroidX.SavedState.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([42 x i8], [42 x i8]* @__DSOCacheEntry_name.24, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 318
	%struct.DSOCacheEntry {
		i64 1858542181, ; hash 0x6ec71a65, from name: System.Linq.Expressions
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.88, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 319
	%struct.DSOCacheEntry {
		i64 1866095656, ; hash 0x6f3a5c28, from name: Xamarin.Android.Binding.InstallReferrer
		i8 0, ; ignore
		i8* getelementptr inbounds ([54 x i8], [54 x i8]* @__DSOCacheEntry_name.55, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 320
	%struct.DSOCacheEntry {
		i64 1866393793, ; hash 0x6f3ee8c1, from name: aot-Microsoft.AspNetCore.Components.WebView.Maui.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([59 x i8], [59 x i8]* @__DSOCacheEntry_name.85, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 321
	%struct.DSOCacheEntry {
		i64 1868438852, ; hash 0x6f5e1d44, from name: aot-Xamarin.AndroidX.CustomView.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([42 x i8], [42 x i8]* @__DSOCacheEntry_name.22, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 322
	%struct.DSOCacheEntry {
		i64 1875053220, ; hash 0x6fc30aa4, from name: Xamarin.Firebase.Auth.Interop
		i8 0, ; ignore
		i8* getelementptr inbounds ([44 x i8], [44 x i8]* @__DSOCacheEntry_name.96, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 323
	%struct.DSOCacheEntry {
		i64 1882302579, ; hash 0x7031a873, from name: Xamarin.Facebook.Share.Android.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([45 x i8], [45 x i8]* @__DSOCacheEntry_name.90, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 324
	%struct.DSOCacheEntry {
		i64 1889411128, ; hash 0x709e2038, from name: aot-Xamarin.AndroidX.Lifecycle.ViewModel.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([51 x i8], [51 x i8]* @__DSOCacheEntry_name.97, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 325
	%struct.DSOCacheEntry {
		i64 1891375500, ; hash 0x70bc198c, from name: libaot-Microsoft.AspNetCore.Components
		i8 0, ; ignore
		i8* getelementptr inbounds ([46 x i8], [46 x i8]* @__DSOCacheEntry_name.111, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 326
	%struct.DSOCacheEntry {
		i64 1900739026, ; hash 0x714af9d2, from name: libaot-System.Net.Http
		i8 0, ; ignore
		i8* getelementptr inbounds ([30 x i8], [30 x i8]* @__DSOCacheEntry_name.102, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 327
	%struct.DSOCacheEntry {
		i64 1902824622, ; hash 0x716accae, from name: libaot-System.Xml.ReaderWriter.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.38, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 328
	%struct.DSOCacheEntry {
		i64 1907175328, ; hash 0x71ad2fa0, from name: Xamarin.AndroidX.Window.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.108, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 329
	%struct.DSOCacheEntry {
		i64 1908813208, ; hash 0x71c62d98, from name: Xamarin.GooglePlayServices.Basement
		i8 0, ; ignore
		i8* getelementptr inbounds ([50 x i8], [50 x i8]* @__DSOCacheEntry_name.49, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 330
	%struct.DSOCacheEntry {
		i64 1910187103, ; hash 0x71db245f, from name: libaot-Xamarin.GooglePlayServices.Measurement.Api.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([57 x i8], [57 x i8]* @__DSOCacheEntry_name.71, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 331
	%struct.DSOCacheEntry {
		i64 1911147258, ; hash 0x71e9cafa, from name: aot-System.Security.Cryptography.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([43 x i8], [43 x i8]* @__DSOCacheEntry_name.93, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 332
	%struct.DSOCacheEntry {
		i64 1913538475, ; hash 0x720e47ab, from name: GoogleGson.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([25 x i8], [25 x i8]* @__DSOCacheEntry_name.104, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 333
	%struct.DSOCacheEntry {
		i64 1917270479, ; hash 0x724739cf, from name: libaot-System.ComponentModel.TypeConverter
		i8 0, ; ignore
		i8* getelementptr inbounds ([50 x i8], [50 x i8]* @__DSOCacheEntry_name.99, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 334
	%struct.DSOCacheEntry {
		i64 1927204088, ; hash 0x72deccf8, from name: Xamarin.AndroidX.Navigation.Fragment.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([51 x i8], [51 x i8]* @__DSOCacheEntry_name.112, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 335
	%struct.DSOCacheEntry {
		i64 1928478135, ; hash 0x72f23db7, from name: Microsoft.Extensions.FileProviders.Physical.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([58 x i8], [58 x i8]* @__DSOCacheEntry_name.47, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 336
	%struct.DSOCacheEntry {
		i64 1939226026, ; hash 0x73963daa, from name: aot-System.Console
		i8 0, ; ignore
		i8* getelementptr inbounds ([29 x i8], [29 x i8]* @__DSOCacheEntry_name.126, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 337
	%struct.DSOCacheEntry {
		i64 1939592360, ; hash 0x739bd4a8, from name: System.Private.Xml.Linq
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.86, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 338
	%struct.DSOCacheEntry {
		i64 1947440624, ; hash 0x741395f0, from name: Xamarin.AndroidX.CursorAdapter.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([45 x i8], [45 x i8]* @__DSOCacheEntry_name.105, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 339
	%struct.DSOCacheEntry {
		i64 1953900240, ; hash 0x747626d0, from name: aot-System.Private.Uri.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([33 x i8], [33 x i8]* @__DSOCacheEntry_name.127, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 340
	%struct.DSOCacheEntry {
		i64 1954803200, ; hash 0x7483ee00, from name: libaot-System.Console
		i8 0, ; ignore
		i8* getelementptr inbounds ([29 x i8], [29 x i8]* @__DSOCacheEntry_name.126, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 341
	%struct.DSOCacheEntry {
		i64 1959705688, ; hash 0x74cebc58, from name: System.IO.Compression.Native
		i8 0, ; ignore
		i8* getelementptr inbounds ([35 x i8], [35 x i8]* @__DSOCacheEntry_name.128, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 342
	%struct.DSOCacheEntry {
		i64 1961541945, ; hash 0x74eac139, from name: aot-System.ComponentModel
		i8 0, ; ignore
		i8* getelementptr inbounds ([36 x i8], [36 x i8]* @__DSOCacheEntry_name.25, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 343
	%struct.DSOCacheEntry {
		i64 1967114972, ; hash 0x753fcadc, from name: libaot-Xamarin.AndroidX.ViewPager2
		i8 0, ; ignore
		i8* getelementptr inbounds ([42 x i8], [42 x i8]* @__DSOCacheEntry_name.54, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 344
	%struct.DSOCacheEntry {
		i64 1967347000, ; hash 0x75435538, from name: libaot-Xamarin.Facebook.Core.Android
		i8 0, ; ignore
		i8* getelementptr inbounds ([44 x i8], [44 x i8]* @__DSOCacheEntry_name.100, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 345
	%struct.DSOCacheEntry {
		i64 1970157169, ; hash 0x756e3671, from name: System.ComponentModel.Primitives.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([47 x i8], [47 x i8]* @__DSOCacheEntry_name.43, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 346
	%struct.DSOCacheEntry {
		i64 1971847110, ; hash 0x7587ffc6, from name: aot-System.Linq.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([26 x i8], [26 x i8]* @__DSOCacheEntry_name.94, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 347
	%struct.DSOCacheEntry {
		i64 1975492760, ; hash 0x75bfa098, from name: libaot-Java.Interop
		i8 0, ; ignore
		i8* getelementptr inbounds ([27 x i8], [27 x i8]* @__DSOCacheEntry_name.129, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 348
	%struct.DSOCacheEntry {
		i64 1980932665, ; hash 0x7612a239, from name: aot-KTKGuest.WebComponents
		i8 0, ; ignore
		i8* getelementptr inbounds ([37 x i8], [37 x i8]* @__DSOCacheEntry_name.28, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 349
	%struct.DSOCacheEntry {
		i64 1988920992, ; hash 0x768c86a0, from name: Xamarin.Facebook.Common.Android.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([46 x i8], [46 x i8]* @__DSOCacheEntry_name.66, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 350
	%struct.DSOCacheEntry {
		i64 1990892090, ; hash 0x76aa9a3a, from name: libaot-Blazored.SessionStorage
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.20, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 351
	%struct.DSOCacheEntry {
		i64 2002272907, ; hash 0x7758428b, from name: KTKGuest.App
		i8 0, ; ignore
		i8* getelementptr inbounds ([27 x i8], [27 x i8]* @__DSOCacheEntry_name.50, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 352
	%struct.DSOCacheEntry {
		i64 2014256110, ; hash 0x780f1bee, from name: Xamarin.Firebase.Config.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.41, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 353
	%struct.DSOCacheEntry {
		i64 2019465201, ; hash 0x785e97f1, from name: Xamarin.AndroidX.Lifecycle.ViewModel
		i8 0, ; ignore
		i8* getelementptr inbounds ([51 x i8], [51 x i8]* @__DSOCacheEntry_name.97, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 354
	%struct.DSOCacheEntry {
		i64 2020751356, ; hash 0x787237fc, from name: libaot-Xamarin.Firebase.Crashlytics
		i8 0, ; ignore
		i8* getelementptr inbounds ([43 x i8], [43 x i8]* @__DSOCacheEntry_name.42, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 355
	%struct.DSOCacheEntry {
		i64 2027186647, ; hash 0x78d469d7, from name: Xamarin.Facebook.Login.Android
		i8 0, ; ignore
		i8* getelementptr inbounds ([45 x i8], [45 x i8]* @__DSOCacheEntry_name.82, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 356
	%struct.DSOCacheEntry {
		i64 2027538643, ; hash 0x78d9c8d3, from name: Xamarin.Android.Binding.InstallReferrer.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([54 x i8], [54 x i8]* @__DSOCacheEntry_name.55, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 357
	%struct.DSOCacheEntry {
		i64 2032290587, ; hash 0x79224b1b, from name: aot-Xamarin.Facebook.Common.Android
		i8 0, ; ignore
		i8* getelementptr inbounds ([46 x i8], [46 x i8]* @__DSOCacheEntry_name.66, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 358
	%struct.DSOCacheEntry {
		i64 2033486643, ; hash 0x79348b33, from name: aot-Xamarin.Firebase.Crashlytics
		i8 0, ; ignore
		i8* getelementptr inbounds ([43 x i8], [43 x i8]* @__DSOCacheEntry_name.42, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 359
	%struct.DSOCacheEntry {
		i64 2036392541, ; hash 0x7960e25d, from name: Xamarin.Facebook.Android
		i8 0, ; ignore
		i8* getelementptr inbounds ([39 x i8], [39 x i8]* @__DSOCacheEntry_name.75, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 360
	%struct.DSOCacheEntry {
		i64 2036643236, ; hash 0x7964b5a4, from name: aot-Xamarin.AndroidX.Navigation.UI.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([45 x i8], [45 x i8]* @__DSOCacheEntry_name.44, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 361
	%struct.DSOCacheEntry {
		i64 2043472270, ; hash 0x79cce98e, from name: aot-System.ComponentModel.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([36 x i8], [36 x i8]* @__DSOCacheEntry_name.25, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 362
	%struct.DSOCacheEntry {
		i64 2044108986, ; hash 0x79d6a0ba, from name: libSystem.Native.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([20 x i8], [20 x i8]* @__DSOCacheEntry_name.65, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 363
	%struct.DSOCacheEntry {
		i64 2045470958, ; hash 0x79eb68ee, from name: System.Private.Xml
		i8 0, ; ignore
		i8* getelementptr inbounds ([33 x i8], [33 x i8]* @__DSOCacheEntry_name.121, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 364
	%struct.DSOCacheEntry {
		i64 2046194820, ; hash 0x79f67484, from name: libaot-System.Xml.XDocument.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([35 x i8], [35 x i8]* @__DSOCacheEntry_name.98, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 365
	%struct.DSOCacheEntry {
		i64 2071976611, ; hash 0x7b7fdaa3, from name: aot-Microsoft.Extensions.DependencyInjection
		i8 0, ; ignore
		i8* getelementptr inbounds ([55 x i8], [55 x i8]* @__DSOCacheEntry_name.35, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 366
	%struct.DSOCacheEntry {
		i64 2072397586, ; hash 0x7b864712, from name: Microsoft.Extensions.FileProviders.Physical
		i8 0, ; ignore
		i8* getelementptr inbounds ([58 x i8], [58 x i8]* @__DSOCacheEntry_name.47, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 367
	%struct.DSOCacheEntry {
		i64 2072777569, ; hash 0x7b8c1361, from name: System.IO.Compression.Native.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([35 x i8], [35 x i8]* @__DSOCacheEntry_name.128, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 368
	%struct.DSOCacheEntry {
		i64 2082659839, ; hash 0x7c22ddff, from name: Microsoft.CSharp.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([31 x i8], [31 x i8]* @__DSOCacheEntry_name.23, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 369
	%struct.DSOCacheEntry {
		i64 2090596640, ; hash 0x7c9bf920, from name: System.Numerics.Vectors
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.5, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 370
	%struct.DSOCacheEntry {
		i64 2097043733, ; hash 0x7cfe5915, from name: Microsoft.Extensions.DependencyInjection.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([55 x i8], [55 x i8]* @__DSOCacheEntry_name.35, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 371
	%struct.DSOCacheEntry {
		i64 2097756828, ; hash 0x7d093a9c, from name: aot-Xamarin.Firebase.Storage
		i8 0, ; ignore
		i8* getelementptr inbounds ([39 x i8], [39 x i8]* @__DSOCacheEntry_name.120, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 372
	%struct.DSOCacheEntry {
		i64 2101192894, ; hash 0x7d3da8be, from name: libSystem.Security.Cryptography.Native.Android.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([50 x i8], [50 x i8]* @__DSOCacheEntry_name.15, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 373
	%struct.DSOCacheEntry {
		i64 2105884241, ; hash 0x7d853e51, from name: libaot-Microsoft.Extensions.Logging.Abstractions.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([56 x i8], [56 x i8]* @__DSOCacheEntry_name.45, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 374
	%struct.DSOCacheEntry {
		i64 2111107150, ; hash 0x7dd4f04e, from name: aot-Microsoft.AspNetCore.Components.Web.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([50 x i8], [50 x i8]* @__DSOCacheEntry_name.130, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 375
	%struct.DSOCacheEntry {
		i64 2115594265, ; hash 0x7e196819, from name: aot-System.Collections.Concurrent
		i8 0, ; ignore
		i8* getelementptr inbounds ([44 x i8], [44 x i8]* @__DSOCacheEntry_name.31, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 376
	%struct.DSOCacheEntry {
		i64 2119570579, ; hash 0x7e561493, from name: libaot-Java.Interop.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([27 x i8], [27 x i8]* @__DSOCacheEntry_name.129, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 377
	%struct.DSOCacheEntry {
		i64 2127167465, ; hash 0x7ec9ffe9, from name: System.Console
		i8 0, ; ignore
		i8* getelementptr inbounds ([29 x i8], [29 x i8]* @__DSOCacheEntry_name.126, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 378
	%struct.DSOCacheEntry {
		i64 2127972116, ; hash 0x7ed64714, from name: aot-Xamarin.Facebook.Share.Android.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([45 x i8], [45 x i8]* @__DSOCacheEntry_name.90, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 379
	%struct.DSOCacheEntry {
		i64 2131872925, ; hash 0x7f11cc9d, from name: Microsoft.Extensions.FileProviders.Abstractions.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([62 x i8], [62 x i8]* @__DSOCacheEntry_name.131, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 380
	%struct.DSOCacheEntry {
		i64 2142360577, ; hash 0x7fb1d401, from name: aot-Microsoft.AspNetCore.Components.Web
		i8 0, ; ignore
		i8* getelementptr inbounds ([50 x i8], [50 x i8]* @__DSOCacheEntry_name.130, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 381
	%struct.DSOCacheEntry {
		i64 2149461079, ; hash 0x801e2c57, from name: aot-System.Threading.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([31 x i8], [31 x i8]* @__DSOCacheEntry_name.114, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 382
	%struct.DSOCacheEntry {
		i64 2155306486, ; hash 0x80775df6, from name: aot-Xamarin.GooglePlayServices.Base
		i8 0, ; ignore
		i8* getelementptr inbounds ([46 x i8], [46 x i8]* @__DSOCacheEntry_name.29, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 383
	%struct.DSOCacheEntry {
		i64 2159891885, ; hash 0x80bd55ad, from name: Microsoft.Maui
		i8 0, ; ignore
		i8* getelementptr inbounds ([29 x i8], [29 x i8]* @__DSOCacheEntry_name.76, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 384
	%struct.DSOCacheEntry {
		i64 2161602736, ; hash 0x80d770b0, from name: aot-Microsoft.Extensions.FileProviders.Abstractions.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([62 x i8], [62 x i8]* @__DSOCacheEntry_name.131, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 385
	%struct.DSOCacheEntry {
		i64 2162156863, ; hash 0x80dfe53f, from name: libaot-Xamarin.AndroidX.CustomView.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([42 x i8], [42 x i8]* @__DSOCacheEntry_name.22, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 386
	%struct.DSOCacheEntry {
		i64 2167011298, ; hash 0x8129f7e2, from name: libaot-Microsoft.Maui.Controls
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.56, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 387
	%struct.DSOCacheEntry {
		i64 2167987959, ; hash 0x8138def7, from name: aot-Microsoft.Maui.Graphics.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.87, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 388
	%struct.DSOCacheEntry {
		i64 2170173082, ; hash 0x815a369a, from name: libaot-System.Private.Xml
		i8 0, ; ignore
		i8* getelementptr inbounds ([33 x i8], [33 x i8]* @__DSOCacheEntry_name.121, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 389
	%struct.DSOCacheEntry {
		i64 2172943413, ; hash 0x81847c35, from name: libaot-System.ComponentModel.TypeConverter.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([50 x i8], [50 x i8]* @__DSOCacheEntry_name.99, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 390
	%struct.DSOCacheEntry {
		i64 2192057212, ; hash 0x82a8237c, from name: Microsoft.Extensions.Logging.Abstractions
		i8 0, ; ignore
		i8* getelementptr inbounds ([56 x i8], [56 x i8]* @__DSOCacheEntry_name.45, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 391
	%struct.DSOCacheEntry {
		i64 2201231467, ; hash 0x8334206b, from name: System.Net.Http
		i8 0, ; ignore
		i8* getelementptr inbounds ([30 x i8], [30 x i8]* @__DSOCacheEntry_name.102, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 392
	%struct.DSOCacheEntry {
		i64 2205453355, ; hash 0x83748c2b, from name: libaot-Xamarin.AndroidX.VersionedParcelable
		i8 0, ; ignore
		i8* getelementptr inbounds ([51 x i8], [51 x i8]* @__DSOCacheEntry_name.80, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 393
	%struct.DSOCacheEntry {
		i64 2205484532, ; hash 0x837505f4, from name: aot-KTKGuest.App
		i8 0, ; ignore
		i8* getelementptr inbounds ([27 x i8], [27 x i8]* @__DSOCacheEntry_name.50, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 394
	%struct.DSOCacheEntry {
		i64 2205907654, ; hash 0x837b7ac6, from name: aot-Xamarin.Protobuf.JavaLite
		i8 0, ; ignore
		i8* getelementptr inbounds ([40 x i8], [40 x i8]* @__DSOCacheEntry_name.123, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 395
	%struct.DSOCacheEntry {
		i64 2211380618, ; hash 0x83cefd8a, from name: aot-Microsoft.Extensions.DependencyInjection.Abstractions.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([68 x i8], [68 x i8]* @__DSOCacheEntry_name.51, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 396
	%struct.DSOCacheEntry {
		i64 2211767232, ; hash 0x83d4e3c0, from name: aot-Microsoft.Maui.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([29 x i8], [29 x i8]* @__DSOCacheEntry_name.76, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 397
	%struct.DSOCacheEntry {
		i64 2212031953, ; hash 0x83d8edd1, from name: libaot-System.Xml.Linq
		i8 0, ; ignore
		i8* getelementptr inbounds ([30 x i8], [30 x i8]* @__DSOCacheEntry_name.119, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 398
	%struct.DSOCacheEntry {
		i64 2215411539, ; hash 0x840c7f53, from name: libaot-Xamarin.Facebook.GamingServices.Android
		i8 0, ; ignore
		i8* getelementptr inbounds ([54 x i8], [54 x i8]* @__DSOCacheEntry_name.57, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 399
	%struct.DSOCacheEntry {
		i64 2223531549, ; hash 0x8488661d, from name: libaot-System.ComponentModel.Primitives
		i8 0, ; ignore
		i8* getelementptr inbounds ([47 x i8], [47 x i8]* @__DSOCacheEntry_name.43, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 400
	%struct.DSOCacheEntry {
		i64 2225682495, ; hash 0x84a9383f, from name: Microsoft.Extensions.Logging.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([43 x i8], [43 x i8]* @__DSOCacheEntry_name.10, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 401
	%struct.DSOCacheEntry {
		i64 2241953027, ; hash 0x85a17d03, from name: libaot-Xamarin.AndroidX.RecyclerView
		i8 0, ; ignore
		i8* getelementptr inbounds ([44 x i8], [44 x i8]* @__DSOCacheEntry_name.116, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 402
	%struct.DSOCacheEntry {
		i64 2242331687, ; hash 0x85a74427, from name: aot-GoogleGson.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([25 x i8], [25 x i8]* @__DSOCacheEntry_name.104, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 403
	%struct.DSOCacheEntry {
		i64 2242776558, ; hash 0x85ae0dee, from name: aot-Xamarin.Facebook.AppLinks.Android.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([48 x i8], [48 x i8]* @__DSOCacheEntry_name.9, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 404
	%struct.DSOCacheEntry {
		i64 2243920916, ; hash 0x85bf8414, from name: Xamarin.Firebase.Functions
		i8 0, ; ignore
		i8* getelementptr inbounds ([41 x i8], [41 x i8]* @__DSOCacheEntry_name.62, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 405
	%struct.DSOCacheEntry {
		i64 2245181094, ; hash 0x85d2bea6, from name: libaot-Microsoft.Maui.Essentials.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([40 x i8], [40 x i8]* @__DSOCacheEntry_name.103, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 406
	%struct.DSOCacheEntry {
		i64 2248739311, ; hash 0x860909ef, from name: aot-Microsoft.Extensions.Options
		i8 0, ; ignore
		i8* getelementptr inbounds ([43 x i8], [43 x i8]* @__DSOCacheEntry_name.83, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 407
	%struct.DSOCacheEntry {
		i64 2254027380, ; hash 0x8659ba74, from name: libaot-System.Xml.Linq.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([30 x i8], [30 x i8]* @__DSOCacheEntry_name.119, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 408
	%struct.DSOCacheEntry {
		i64 2254155312, ; hash 0x865bae30, from name: libaot-Xamarin.AndroidX.Navigation.Common.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([49 x i8], [49 x i8]* @__DSOCacheEntry_name.107, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 409
	%struct.DSOCacheEntry {
		i64 2265178066, ; hash 0x8703dfd2, from name: aot-Xamarin.AndroidX.RecyclerView
		i8 0, ; ignore
		i8* getelementptr inbounds ([44 x i8], [44 x i8]* @__DSOCacheEntry_name.116, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 410
	%struct.DSOCacheEntry {
		i64 2266799131, ; hash 0x871c9c1b, from name: Microsoft.Extensions.Configuration.Abstractions
		i8 0, ; ignore
		i8* getelementptr inbounds ([62 x i8], [62 x i8]* @__DSOCacheEntry_name.124, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 411
	%struct.DSOCacheEntry {
		i64 2279427068, ; hash 0x87dd4bfc, from name: aot-Xamarin.Android.Binding.InstallReferrer
		i8 0, ; ignore
		i8* getelementptr inbounds ([54 x i8], [54 x i8]* @__DSOCacheEntry_name.55, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 412
	%struct.DSOCacheEntry {
		i64 2279498149, ; hash 0x87de61a5, from name: libaot-System.Runtime.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([29 x i8], [29 x i8]* @__DSOCacheEntry_name.118, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 413
	%struct.DSOCacheEntry {
		i64 2282650294, ; hash 0x880e7ab6, from name: aot-Xamarin.AndroidX.Fragment
		i8 0, ; ignore
		i8* getelementptr inbounds ([40 x i8], [40 x i8]* @__DSOCacheEntry_name.61, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 414
	%struct.DSOCacheEntry {
		i64 2283539775, ; hash 0x881c0d3f, from name: aot-Xamarin.Kotlin.StdLib.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([36 x i8], [36 x i8]* @__DSOCacheEntry_name.32, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 415
	%struct.DSOCacheEntry {
		i64 2283652759, ; hash 0x881dc697, from name: libaot-Xamarin.Firebase.Common
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.109, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 416
	%struct.DSOCacheEntry {
		i64 2284562302, ; hash 0x882ba77e, from name: aot-Xamarin.AndroidX.CursorAdapter.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([45 x i8], [45 x i8]* @__DSOCacheEntry_name.105, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 417
	%struct.DSOCacheEntry {
		i64 2287488165, ; hash 0x88584ca5, from name: KTKGuest.WebComponents.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([37 x i8], [37 x i8]* @__DSOCacheEntry_name.28, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 418
	%struct.DSOCacheEntry {
		i64 2290491696, ; hash 0x88862130, from name: aot-Microsoft.Extensions.FileProviders.Composite
		i8 0, ; ignore
		i8* getelementptr inbounds ([59 x i8], [59 x i8]* @__DSOCacheEntry_name.21, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 419
	%struct.DSOCacheEntry {
		i64 2297029851, ; hash 0x88e9e4db, from name: libaot-Microsoft.Extensions.FileProviders.Abstractions
		i8 0, ; ignore
		i8* getelementptr inbounds ([62 x i8], [62 x i8]* @__DSOCacheEntry_name.131, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 420
	%struct.DSOCacheEntry {
		i64 2300115772, ; hash 0x8918fb3c, from name: aot-Java.Interop.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([27 x i8], [27 x i8]* @__DSOCacheEntry_name.129, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 421
	%struct.DSOCacheEntry {
		i64 2324844566, ; hash 0x8a925016, from name: libaot-Xamarin.Firebase.Messaging
		i8 0, ; ignore
		i8* getelementptr inbounds ([41 x i8], [41 x i8]* @__DSOCacheEntry_name.7, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 422
	%struct.DSOCacheEntry {
		i64 2325416183, ; hash 0x8a9b08f7, from name: aot-Blazored.SessionStorage
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.20, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 423
	%struct.DSOCacheEntry {
		i64 2327830411, ; hash 0x8abfdf8b, from name: System.Private.Xml.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([33 x i8], [33 x i8]* @__DSOCacheEntry_name.121, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 424
	%struct.DSOCacheEntry {
		i64 2329568742, ; hash 0x8ada65e6, from name: aot-Xamarin.Facebook.Core.Android
		i8 0, ; ignore
		i8* getelementptr inbounds ([44 x i8], [44 x i8]* @__DSOCacheEntry_name.100, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 425
	%struct.DSOCacheEntry {
		i64 2329916048, ; hash 0x8adfb290, from name: aot-Xamarin.Firebase.Storage.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([39 x i8], [39 x i8]* @__DSOCacheEntry_name.120, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 426
	%struct.DSOCacheEntry {
		i64 2341396428, ; hash 0x8b8edfcc, from name: libaot-Microsoft.AspNetCore.Components.Web.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([50 x i8], [50 x i8]* @__DSOCacheEntry_name.130, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 427
	%struct.DSOCacheEntry {
		i64 2344176925, ; hash 0x8bb94d1d, from name: libaot-Microsoft.AspNetCore.Components.WebView.Maui.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([59 x i8], [59 x i8]* @__DSOCacheEntry_name.85, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 428
	%struct.DSOCacheEntry {
		i64 2344356833, ; hash 0x8bbc0be1, from name: libaot-System.Runtime.InteropServices.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([45 x i8], [45 x i8]* @__DSOCacheEntry_name.11, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 429
	%struct.DSOCacheEntry {
		i64 2350046653, ; hash 0x8c12ddbd, from name: Xamarin.AndroidX.SavedState.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([42 x i8], [42 x i8]* @__DSOCacheEntry_name.24, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 430
	%struct.DSOCacheEntry {
		i64 2353062107, ; hash 0x8c40e0db, from name: System.Net.Primitives
		i8 0, ; ignore
		i8* getelementptr inbounds ([36 x i8], [36 x i8]* @__DSOCacheEntry_name.91, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 431
	%struct.DSOCacheEntry {
		i64 2357807512, ; hash 0x8c894998, from name: aot-Plugin.Firebase
		i8 0, ; ignore
		i8* getelementptr inbounds ([30 x i8], [30 x i8]* @__DSOCacheEntry_name.69, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 432
	%struct.DSOCacheEntry {
		i64 2371007202, ; hash 0x8d52b2e2, from name: Microsoft.Extensions.Configuration
		i8 0, ; ignore
		i8* getelementptr inbounds ([49 x i8], [49 x i8]* @__DSOCacheEntry_name.125, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 433
	%struct.DSOCacheEntry {
		i64 2380784797, ; hash 0x8de7e49d, from name: Microsoft.Extensions.Configuration.Abstractions.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([62 x i8], [62 x i8]* @__DSOCacheEntry_name.124, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 434
	%struct.DSOCacheEntry {
		i64 2389733863, ; hash 0x8e7071e7, from name: aot-System.Private.Xml
		i8 0, ; ignore
		i8* getelementptr inbounds ([33 x i8], [33 x i8]* @__DSOCacheEntry_name.121, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 435
	%struct.DSOCacheEntry {
		i64 2396723635, ; hash 0x8edb19b3, from name: aot-Microsoft.Maui.Controls.Xaml
		i8 0, ; ignore
		i8* getelementptr inbounds ([43 x i8], [43 x i8]* @__DSOCacheEntry_name.81, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 436
	%struct.DSOCacheEntry {
		i64 2398397622, ; hash 0x8ef4a4b6, from name: libaot-Xamarin.AndroidX.Lifecycle.ViewModel
		i8 0, ; ignore
		i8* getelementptr inbounds ([51 x i8], [51 x i8]* @__DSOCacheEntry_name.97, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 437
	%struct.DSOCacheEntry {
		i64 2406593473, ; hash 0x8f71b3c1, from name: libaot-System.Runtime
		i8 0, ; ignore
		i8* getelementptr inbounds ([29 x i8], [29 x i8]* @__DSOCacheEntry_name.118, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 438
	%struct.DSOCacheEntry {
		i64 2409943815, ; hash 0x8fa4d307, from name: Microsoft.Extensions.FileSystemGlobbing.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([54 x i8], [54 x i8]* @__DSOCacheEntry_name.27, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 439
	%struct.DSOCacheEntry {
		i64 2411328690, ; hash 0x8fb9f4b2, from name: Microsoft.AspNetCore.Components
		i8 0, ; ignore
		i8* getelementptr inbounds ([46 x i8], [46 x i8]* @__DSOCacheEntry_name.111, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 440
	%struct.DSOCacheEntry {
		i64 2430242750, ; hash 0x90da8fbe, from name: aot-Xamarin.AndroidX.CursorAdapter
		i8 0, ; ignore
		i8* getelementptr inbounds ([45 x i8], [45 x i8]* @__DSOCacheEntry_name.105, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 441
	%struct.DSOCacheEntry {
		i64 2432891663, ; hash 0x9102fb0f, from name: aot-System.Text.RegularExpressions
		i8 0, ; ignore
		i8* getelementptr inbounds ([45 x i8], [45 x i8]* @__DSOCacheEntry_name.34, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 442
	%struct.DSOCacheEntry {
		i64 2438431458, ; hash 0x915782e2, from name: libaot-Xamarin.AndroidX.Activity.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([40 x i8], [40 x i8]* @__DSOCacheEntry_name.18, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 443
	%struct.DSOCacheEntry {
		i64 2448201744, ; hash 0x91ec9810, from name: System.Private.CoreLib.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([37 x i8], [37 x i8]* @__DSOCacheEntry_name.113, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 444
	%struct.DSOCacheEntry {
		i64 2452809944, ; hash 0x9232e8d8, from name: aot-System.Linq
		i8 0, ; ignore
		i8* getelementptr inbounds ([26 x i8], [26 x i8]* @__DSOCacheEntry_name.94, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 445
	%struct.DSOCacheEntry {
		i64 2453033447, ; hash 0x923651e7, from name: aot-Microsoft.Maui.Essentials.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([40 x i8], [40 x i8]* @__DSOCacheEntry_name.103, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 446
	%struct.DSOCacheEntry {
		i64 2458563039, ; hash 0x928ab1df, from name: System.Collections.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([33 x i8], [33 x i8]* @__DSOCacheEntry_name.48, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 447
	%struct.DSOCacheEntry {
		i64 2463331002, ; hash 0x92d372ba, from name: Microsoft.Extensions.Configuration.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([49 x i8], [49 x i8]* @__DSOCacheEntry_name.125, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 448
	%struct.DSOCacheEntry {
		i64 2473124778, ; hash 0x9368e3aa, from name: System.Threading.Thread.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.3, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 449
	%struct.DSOCacheEntry {
		i64 2474087874, ; hash 0x937795c2, from name: aot-Xamarin.GooglePlayServices.Basement.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([50 x i8], [50 x i8]* @__DSOCacheEntry_name.49, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 450
	%struct.DSOCacheEntry {
		i64 2480646305, ; hash 0x93dba8a1, from name: Microsoft.Maui.Controls
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.56, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 451
	%struct.DSOCacheEntry {
		i64 2482494827, ; hash 0x93f7dd6b, from name: Xamarin.Firebase.Auth.Interop.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([44 x i8], [44 x i8]* @__DSOCacheEntry_name.96, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 452
	%struct.DSOCacheEntry {
		i64 2483742551, ; hash 0x940ae757, from name: Xamarin.Firebase.Messaging
		i8 0, ; ignore
		i8* getelementptr inbounds ([41 x i8], [41 x i8]* @__DSOCacheEntry_name.7, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 453
	%struct.DSOCacheEntry {
		i64 2496112763, ; hash 0x94c7a87b, from name: libmonosgen-2.0
		i8 0, ; ignore
		i8* getelementptr inbounds ([19 x i8], [19 x i8]* @__DSOCacheEntry_name.132, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 454
	%struct.DSOCacheEntry {
		i64 2515941137, ; hash 0x95f63711, from name: libaot-System.Numerics.Vectors.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.5, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 455
	%struct.DSOCacheEntry {
		i64 2531051056, ; hash 0x96dcc630, from name: libaot-System.Console.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([29 x i8], [29 x i8]* @__DSOCacheEntry_name.126, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 456
	%struct.DSOCacheEntry {
		i64 2534138912, ; hash 0x970be420, from name: Xamarin.Firebase.Crashlytics
		i8 0, ; ignore
		i8* getelementptr inbounds ([43 x i8], [43 x i8]* @__DSOCacheEntry_name.42, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 457
	%struct.DSOCacheEntry {
		i64 2541614751, ; hash 0x977df69f, from name: aot-Microsoft.Extensions.FileProviders.Physical.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([58 x i8], [58 x i8]* @__DSOCacheEntry_name.47, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 458
	%struct.DSOCacheEntry {
		i64 2547110758, ; hash 0x97d1d366, from name: libaot-Microsoft.Extensions.Configuration
		i8 0, ; ignore
		i8* getelementptr inbounds ([49 x i8], [49 x i8]* @__DSOCacheEntry_name.125, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 459
	%struct.DSOCacheEntry {
		i64 2562349572, ; hash 0x98ba5a04, from name: Microsoft.CSharp
		i8 0, ; ignore
		i8* getelementptr inbounds ([31 x i8], [31 x i8]* @__DSOCacheEntry_name.23, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 460
	%struct.DSOCacheEntry {
		i64 2563576348, ; hash 0x98cd121c, from name: Xamarin.Facebook.Core.Android.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([44 x i8], [44 x i8]* @__DSOCacheEntry_name.100, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 461
	%struct.DSOCacheEntry {
		i64 2565766952, ; hash 0x98ee7f28, from name: Microsoft.Extensions.FileProviders.Composite.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([59 x i8], [59 x i8]* @__DSOCacheEntry_name.21, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 462
	%struct.DSOCacheEntry {
		i64 2570120770, ; hash 0x9930ee42, from name: System.Text.Encodings.Web
		i8 0, ; ignore
		i8* getelementptr inbounds ([40 x i8], [40 x i8]* @__DSOCacheEntry_name.73, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 463
	%struct.DSOCacheEntry {
		i64 2578174356, ; hash 0x99abd194, from name: System.Native
		i8 0, ; ignore
		i8* getelementptr inbounds ([20 x i8], [20 x i8]* @__DSOCacheEntry_name.65, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 464
	%struct.DSOCacheEntry {
		i64 2579183305, ; hash 0x99bb36c9, from name: aot-System.Text.RegularExpressions.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([45 x i8], [45 x i8]* @__DSOCacheEntry_name.34, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 465
	%struct.DSOCacheEntry {
		i64 2580278470, ; hash 0x99cbecc6, from name: libaot-System.Private.Uri.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([33 x i8], [33 x i8]* @__DSOCacheEntry_name.127, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 466
	%struct.DSOCacheEntry {
		i64 2583342705, ; hash 0x99faae71, from name: System.IO.Compression.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([36 x i8], [36 x i8]* @__DSOCacheEntry_name.58, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 467
	%struct.DSOCacheEntry {
		i64 2584814180, ; hash 0x9a112264, from name: libaot-System.Text.RegularExpressions
		i8 0, ; ignore
		i8* getelementptr inbounds ([45 x i8], [45 x i8]* @__DSOCacheEntry_name.34, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 468
	%struct.DSOCacheEntry {
		i64 2586467844, ; hash 0x9a2a5e04, from name: aot-System.Private.Uri
		i8 0, ; ignore
		i8* getelementptr inbounds ([33 x i8], [33 x i8]* @__DSOCacheEntry_name.127, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 469
	%struct.DSOCacheEntry {
		i64 2588318116, ; hash 0x9a4699a4, from name: libaot-Xamarin.GooglePlayServices.Tasks.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([47 x i8], [47 x i8]* @__DSOCacheEntry_name.117, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 470
	%struct.DSOCacheEntry {
		i64 2592341985, ; hash 0x9a83ffe1, from name: Microsoft.Extensions.FileProviders.Abstractions
		i8 0, ; ignore
		i8* getelementptr inbounds ([62 x i8], [62 x i8]* @__DSOCacheEntry_name.131, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 471
	%struct.DSOCacheEntry {
		i64 2596751594, ; hash 0x9ac748ea, from name: aot-System.ComponentModel.TypeConverter.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([50 x i8], [50 x i8]* @__DSOCacheEntry_name.99, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 472
	%struct.DSOCacheEntry {
		i64 2602792014, ; hash 0x9b23744e, from name: aot-Xamarin.AndroidX.Navigation.Fragment
		i8 0, ; ignore
		i8* getelementptr inbounds ([51 x i8], [51 x i8]* @__DSOCacheEntry_name.112, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 473
	%struct.DSOCacheEntry {
		i64 2605712449, ; hash 0x9b500441, from name: Xamarin.KotlinX.Coroutines.Core.Jvm
		i8 0, ; ignore
		i8* getelementptr inbounds ([50 x i8], [50 x i8]* @__DSOCacheEntry_name.2, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 474
	%struct.DSOCacheEntry {
		i64 2608178168, ; hash 0x9b75a3f8, from name: aot-GoogleGson
		i8 0, ; ignore
		i8* getelementptr inbounds ([25 x i8], [25 x i8]* @__DSOCacheEntry_name.104, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 475
	%struct.DSOCacheEntry {
		i64 2620018659, ; hash 0x9c2a4fe3, from name: System.Private.Uri.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([33 x i8], [33 x i8]* @__DSOCacheEntry_name.127, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 476
	%struct.DSOCacheEntry {
		i64 2637039988, ; hash 0x9d2e0974, from name: libaot-Xamarin.Firebase.Auth
		i8 0, ; ignore
		i8* getelementptr inbounds ([36 x i8], [36 x i8]* @__DSOCacheEntry_name.89, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 477
	%struct.DSOCacheEntry {
		i64 2637639566, ; hash 0x9d372f8e, from name: libaot-System.IO.FileSystem.Watcher
		i8 0, ; ignore
		i8* getelementptr inbounds ([43 x i8], [43 x i8]* @__DSOCacheEntry_name.68, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 478
	%struct.DSOCacheEntry {
		i64 2639209874, ; hash 0x9d4f2592, from name: System.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([21 x i8], [21 x i8]* @__DSOCacheEntry_name.95, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 479
	%struct.DSOCacheEntry {
		i64 2639724514, ; hash 0x9d56ffe2, from name: libaot-Xamarin.AndroidX.Lifecycle.ViewModelSavedState
		i8 0, ; ignore
		i8* getelementptr inbounds ([61 x i8], [61 x i8]* @__DSOCacheEntry_name.72, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 480
	%struct.DSOCacheEntry {
		i64 2646943518, ; hash 0x9dc5271e, from name: libaot-System.Net.Primitives.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([36 x i8], [36 x i8]* @__DSOCacheEntry_name.91, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 481
	%struct.DSOCacheEntry {
		i64 2654345952, ; hash 0x9e361ae0, from name: libaot-Xamarin.GooglePlayServices.Tasks
		i8 0, ; ignore
		i8* getelementptr inbounds ([47 x i8], [47 x i8]* @__DSOCacheEntry_name.117, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 482
	%struct.DSOCacheEntry {
		i64 2658407468, ; hash 0x9e74142c, from name: aot-Xamarin.Facebook.Core.Android.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([44 x i8], [44 x i8]* @__DSOCacheEntry_name.100, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 483
	%struct.DSOCacheEntry {
		i64 2658598962, ; hash 0x9e770032, from name: monosgen-2.0.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([19 x i8], [19 x i8]* @__DSOCacheEntry_name.132, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 484
	%struct.DSOCacheEntry {
		i64 2663219906, ; hash 0x9ebd82c2, from name: Java.Interop.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([27 x i8], [27 x i8]* @__DSOCacheEntry_name.129, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 485
	%struct.DSOCacheEntry {
		i64 2663698177, ; hash 0x9ec4cf01, from name: System.Runtime.Loader
		i8 0, ; ignore
		i8* getelementptr inbounds ([36 x i8], [36 x i8]* @__DSOCacheEntry_name.33, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 486
	%struct.DSOCacheEntry {
		i64 2668849790, ; hash 0x9f136a7e, from name: aot-Xamarin.Google.Android.DataTransport.TransportApi
		i8 0, ; ignore
		i8* getelementptr inbounds ([64 x i8], [64 x i8]* @__DSOCacheEntry_name.106, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 487
	%struct.DSOCacheEntry {
		i64 2671942323, ; hash 0x9f429ab3, from name: Xamarin.GooglePlayServices.Basement.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([50 x i8], [50 x i8]* @__DSOCacheEntry_name.49, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 488
	%struct.DSOCacheEntry {
		i64 2678767976, ; hash 0x9faac168, from name: libaot-Microsoft.Extensions.Logging.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([43 x i8], [43 x i8]* @__DSOCacheEntry_name.10, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 489
	%struct.DSOCacheEntry {
		i64 2692189915, ; hash 0xa0778edb, from name: libaot-Xamarin.Google.Android.Material.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([46 x i8], [46 x i8]* @__DSOCacheEntry_name.79, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 490
	%struct.DSOCacheEntry {
		i64 2692951224, ; hash 0xa0832cb8, from name: libaot-Xamarin.AndroidX.Navigation.UI
		i8 0, ; ignore
		i8* getelementptr inbounds ([45 x i8], [45 x i8]* @__DSOCacheEntry_name.44, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 491
	%struct.DSOCacheEntry {
		i64 2696750469, ; hash 0xa0bd2585, from name: libaot-Xamarin.Firebase.Dynamic.Links
		i8 0, ; ignore
		i8* getelementptr inbounds ([45 x i8], [45 x i8]* @__DSOCacheEntry_name.4, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 492
	%struct.DSOCacheEntry {
		i64 2702877437, ; hash 0xa11aa2fd, from name: aot-Xamarin.AndroidX.VersionedParcelable.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([51 x i8], [51 x i8]* @__DSOCacheEntry_name.80, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 493
	%struct.DSOCacheEntry {
		i64 2708530770, ; hash 0xa170e652, from name: libaot-System.Text.Json.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([31 x i8], [31 x i8]* @__DSOCacheEntry_name.39, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 494
	%struct.DSOCacheEntry {
		i64 2709717763, ; hash 0xa1830303, from name: aot-Mono.Android
		i8 0, ; ignore
		i8* getelementptr inbounds ([27 x i8], [27 x i8]* @__DSOCacheEntry_name.40, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 495
	%struct.DSOCacheEntry {
		i64 2713623161, ; hash 0xa1be9a79, from name: aot-Xamarin.Google.Android.Material
		i8 0, ; ignore
		i8* getelementptr inbounds ([46 x i8], [46 x i8]* @__DSOCacheEntry_name.79, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 496
	%struct.DSOCacheEntry {
		i64 2722617920, ; hash 0xa247da40, from name: aot-Microsoft.Extensions.Primitives
		i8 0, ; ignore
		i8* getelementptr inbounds ([46 x i8], [46 x i8]* @__DSOCacheEntry_name.92, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 497
	%struct.DSOCacheEntry {
		i64 2732626843, ; hash 0xa2e0939b, from name: Xamarin.AndroidX.Activity
		i8 0, ; ignore
		i8* getelementptr inbounds ([40 x i8], [40 x i8]* @__DSOCacheEntry_name.18, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 498
	%struct.DSOCacheEntry {
		i64 2732977029, ; hash 0xa2e5eb85, from name: libaot-Xamarin.AndroidX.DrawerLayout.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([44 x i8], [44 x i8]* @__DSOCacheEntry_name.84, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 499
	%struct.DSOCacheEntry {
		i64 2734026122, ; hash 0xa2f5ed8a, from name: aot-Microsoft.Extensions.FileProviders.Abstractions
		i8 0, ; ignore
		i8* getelementptr inbounds ([62 x i8], [62 x i8]* @__DSOCacheEntry_name.131, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 500
	%struct.DSOCacheEntry {
		i64 2735279357, ; hash 0xa3090cfd, from name: Xamarin.KotlinX.Coroutines.Core.Jvm.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([50 x i8], [50 x i8]* @__DSOCacheEntry_name.2, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 501
	%struct.DSOCacheEntry {
		i64 2739992681, ; hash 0xa350f869, from name: Xamarin.Firebase.Firestore.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([41 x i8], [41 x i8]* @__DSOCacheEntry_name.115, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 502
	%struct.DSOCacheEntry {
		i64 2743508320, ; hash 0xa3869d60, from name: aot-Microsoft.Maui.Controls.Xaml.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([43 x i8], [43 x i8]* @__DSOCacheEntry_name.81, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 503
	%struct.DSOCacheEntry {
		i64 2756708150, ; hash 0xa4500736, from name: aot-Xamarin.AndroidX.ViewPager2.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([42 x i8], [42 x i8]* @__DSOCacheEntry_name.54, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 504
	%struct.DSOCacheEntry {
		i64 2758225723, ; hash 0xa4672f3b, from name: Microsoft.Maui.Controls.Xaml
		i8 0, ; ignore
		i8* getelementptr inbounds ([43 x i8], [43 x i8]* @__DSOCacheEntry_name.81, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 505
	%struct.DSOCacheEntry {
		i64 2760088126, ; hash 0xa4839a3e, from name: libaot-Xamarin.KotlinX.Coroutines.Core.Jvm.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([50 x i8], [50 x i8]* @__DSOCacheEntry_name.2, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 506
	%struct.DSOCacheEntry {
		i64 2760209227, ; hash 0xa485734b, from name: Plugin.Firebase
		i8 0, ; ignore
		i8* getelementptr inbounds ([30 x i8], [30 x i8]* @__DSOCacheEntry_name.69, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 507
	%struct.DSOCacheEntry {
		i64 2767811655, ; hash 0xa4f97447, from name: Xamarin.Firebase.Dynamic.Links
		i8 0, ; ignore
		i8* getelementptr inbounds ([45 x i8], [45 x i8]* @__DSOCacheEntry_name.4, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 508
	%struct.DSOCacheEntry {
		i64 2771312189, ; hash 0xa52ede3d, from name: aot-Xamarin.AndroidX.CoordinatorLayout
		i8 0, ; ignore
		i8* getelementptr inbounds ([49 x i8], [49 x i8]* @__DSOCacheEntry_name.36, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 509
	%struct.DSOCacheEntry {
		i64 2782456148, ; hash 0xa5d8e954, from name: aot-Xamarin.Facebook.GamingServices.Android.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([54 x i8], [54 x i8]* @__DSOCacheEntry_name.57, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 510
	%struct.DSOCacheEntry {
		i64 2792282324, ; hash 0xa66ed8d4, from name: aot-Xamarin.Firebase.Messaging.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([41 x i8], [41 x i8]* @__DSOCacheEntry_name.7, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 511
	%struct.DSOCacheEntry {
		i64 2801675701, ; hash 0xa6fe2db5, from name: aot-Xamarin.Firebase.Functions.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([41 x i8], [41 x i8]* @__DSOCacheEntry_name.62, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 512
	%struct.DSOCacheEntry {
		i64 2801831435, ; hash 0xa7008e0b, from name: Microsoft.Maui.Graphics
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.87, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 513
	%struct.DSOCacheEntry {
		i64 2803929169, ; hash 0xa7209051, from name: Xamarin.AndroidX.CustomView.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([42 x i8], [42 x i8]* @__DSOCacheEntry_name.22, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 514
	%struct.DSOCacheEntry {
		i64 2811243932, ; hash 0xa7902d9c, from name: libaot-Microsoft.Extensions.Options
		i8 0, ; ignore
		i8* getelementptr inbounds ([43 x i8], [43 x i8]* @__DSOCacheEntry_name.83, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 515
	%struct.DSOCacheEntry {
		i64 2811640309, ; hash 0xa79639f5, from name: aot-Xamarin.AndroidX.SwipeRefreshLayout
		i8 0, ; ignore
		i8* getelementptr inbounds ([50 x i8], [50 x i8]* @__DSOCacheEntry_name.101, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 516
	%struct.DSOCacheEntry {
		i64 2816977087, ; hash 0xa7e7a8bf, from name: libaot-Xamarin.AndroidX.Fragment.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([40 x i8], [40 x i8]* @__DSOCacheEntry_name.61, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 517
	%struct.DSOCacheEntry {
		i64 2818182733, ; hash 0xa7fa0e4d, from name: libaot-Microsoft.Extensions.FileProviders.Abstractions.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([62 x i8], [62 x i8]* @__DSOCacheEntry_name.131, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 518
	%struct.DSOCacheEntry {
		i64 2820403756, ; hash 0xa81bf22c, from name: Microsoft.Extensions.Logging.Abstractions.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([56 x i8], [56 x i8]* @__DSOCacheEntry_name.45, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 519
	%struct.DSOCacheEntry {
		i64 2822068442, ; hash 0xa83558da, from name: aot-Xamarin.Firebase.Config
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.41, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 520
	%struct.DSOCacheEntry {
		i64 2829276674, ; hash 0xa8a35602, from name: aot-Xamarin.Firebase.Messaging
		i8 0, ; ignore
		i8* getelementptr inbounds ([41 x i8], [41 x i8]* @__DSOCacheEntry_name.7, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 521
	%struct.DSOCacheEntry {
		i64 2830354901, ; hash 0xa8b3c9d5, from name: aot-Microsoft.AspNetCore.Components.WebView.Maui
		i8 0, ; ignore
		i8* getelementptr inbounds ([59 x i8], [59 x i8]* @__DSOCacheEntry_name.85, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 522
	%struct.DSOCacheEntry {
		i64 2831658147, ; hash 0xa8c7aca3, from name: aot-System.Runtime.Loader.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([36 x i8], [36 x i8]* @__DSOCacheEntry_name.33, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 523
	%struct.DSOCacheEntry {
		i64 2840175643, ; hash 0xa949a41b, from name: aot-Microsoft.Extensions.Logging.Abstractions.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([56 x i8], [56 x i8]* @__DSOCacheEntry_name.45, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 524
	%struct.DSOCacheEntry {
		i64 2843443372, ; hash 0xa97b80ac, from name: aot-System.Console.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([29 x i8], [29 x i8]* @__DSOCacheEntry_name.126, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 525
	%struct.DSOCacheEntry {
		i64 2847418871, ; hash 0xa9b829f7, from name: Xamarin.GooglePlayServices.Base
		i8 0, ; ignore
		i8* getelementptr inbounds ([46 x i8], [46 x i8]* @__DSOCacheEntry_name.29, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 526
	%struct.DSOCacheEntry {
		i64 2853208004, ; hash 0xaa107fc4, from name: Xamarin.AndroidX.ViewPager
		i8 0, ; ignore
		i8* getelementptr inbounds ([41 x i8], [41 x i8]* @__DSOCacheEntry_name.122, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 527
	%struct.DSOCacheEntry {
		i64 2853773753, ; hash 0xaa1921b9, from name: libaot-System.Text.Json
		i8 0, ; ignore
		i8* getelementptr inbounds ([31 x i8], [31 x i8]* @__DSOCacheEntry_name.39, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 528
	%struct.DSOCacheEntry {
		i64 2856475054, ; hash 0xaa4259ae, from name: aot-Xamarin.Firebase.Firestore.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([41 x i8], [41 x i8]* @__DSOCacheEntry_name.115, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 529
	%struct.DSOCacheEntry {
		i64 2861189240, ; hash 0xaa8a4878, from name: Microsoft.Maui.Essentials
		i8 0, ; ignore
		i8* getelementptr inbounds ([40 x i8], [40 x i8]* @__DSOCacheEntry_name.103, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 530
	%struct.DSOCacheEntry {
		i64 2866113648, ; hash 0xaad56c70, from name: libaot-Microsoft.Maui.Controls.Compatibility.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([52 x i8], [52 x i8]* @__DSOCacheEntry_name.70, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 531
	%struct.DSOCacheEntry {
		i64 2872345283, ; hash 0xab3482c3, from name: Google.ZXing.Core.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([32 x i8], [32 x i8]* @__DSOCacheEntry_name.133, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 532
	%struct.DSOCacheEntry {
		i64 2882500561, ; hash 0xabcf77d1, from name: System.Security.Cryptography.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([43 x i8], [43 x i8]* @__DSOCacheEntry_name.93, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 533
	%struct.DSOCacheEntry {
		i64 2890459314, ; hash 0xac48e8b2, from name: aot-Xamarin.Facebook.Messenger.Android
		i8 0, ; ignore
		i8* getelementptr inbounds ([49 x i8], [49 x i8]* @__DSOCacheEntry_name.12, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 534
	%struct.DSOCacheEntry {
		i64 2892341533, ; hash 0xac65a11d, from name: Microsoft.AspNetCore.Components.Web
		i8 0, ; ignore
		i8* getelementptr inbounds ([50 x i8], [50 x i8]* @__DSOCacheEntry_name.130, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 535
	%struct.DSOCacheEntry {
		i64 2894204443, ; hash 0xac820e1b, from name: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([55 x i8], [55 x i8]* @__DSOCacheEntry_name.13, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 536
	%struct.DSOCacheEntry {
		i64 2898183597, ; hash 0xacbec5ad, from name: aot-Xamarin.Firebase.Crashlytics.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([43 x i8], [43 x i8]* @__DSOCacheEntry_name.42, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 537
	%struct.DSOCacheEntry {
		i64 2905256141, ; hash 0xad2ab0cd, from name: System.Threading.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([31 x i8], [31 x i8]* @__DSOCacheEntry_name.114, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 538
	%struct.DSOCacheEntry {
		i64 2907369062, ; hash 0xad4aee66, from name: libaot-Xamarin.AndroidX.CursorAdapter
		i8 0, ; ignore
		i8* getelementptr inbounds ([45 x i8], [45 x i8]* @__DSOCacheEntry_name.105, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 539
	%struct.DSOCacheEntry {
		i64 2909740682, ; hash 0xad6f1e8a, from name: System.Private.CoreLib
		i8 0, ; ignore
		i8* getelementptr inbounds ([37 x i8], [37 x i8]* @__DSOCacheEntry_name.113, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 540
	%struct.DSOCacheEntry {
		i64 2928588566, ; hash 0xae8eb716, from name: libaot-Xamarin.Firebase.Firestore
		i8 0, ; ignore
		i8* getelementptr inbounds ([41 x i8], [41 x i8]* @__DSOCacheEntry_name.115, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 541
	%struct.DSOCacheEntry {
		i64 2932769875, ; hash 0xaece8453, from name: libaot-Xamarin.KotlinX.Coroutines.Core.Jvm
		i8 0, ; ignore
		i8* getelementptr inbounds ([50 x i8], [50 x i8]* @__DSOCacheEntry_name.2, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 542
	%struct.DSOCacheEntry {
		i64 2937215678, ; hash 0xaf125abe, from name: libaot-Xamarin.Firebase.Storage.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([39 x i8], [39 x i8]* @__DSOCacheEntry_name.120, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 543
	%struct.DSOCacheEntry {
		i64 2938740861, ; hash 0xaf29a07d, from name: libSystem.IO.Compression.Native.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([35 x i8], [35 x i8]* @__DSOCacheEntry_name.128, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 544
	%struct.DSOCacheEntry {
		i64 2942668026, ; hash 0xaf658cfa, from name: aot-Microsoft.Maui.Controls.Compatibility.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([52 x i8], [52 x i8]* @__DSOCacheEntry_name.70, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 545
	%struct.DSOCacheEntry {
		i64 2945162751, ; hash 0xaf8b9dff, from name: System.Collections.NonGeneric.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([44 x i8], [44 x i8]* @__DSOCacheEntry_name.1, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 546
	%struct.DSOCacheEntry {
		i64 2950894636, ; hash 0xafe3142c, from name: libSystem.IO.Compression.Native
		i8 0, ; ignore
		i8* getelementptr inbounds ([35 x i8], [35 x i8]* @__DSOCacheEntry_name.128, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 547
	%struct.DSOCacheEntry {
		i64 2951189309, ; hash 0xafe7933d, from name: aot-Microsoft.Maui
		i8 0, ; ignore
		i8* getelementptr inbounds ([29 x i8], [29 x i8]* @__DSOCacheEntry_name.76, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 548
	%struct.DSOCacheEntry {
		i64 2955414144, ; hash 0xb0280a80, from name: aot-System.Core.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([26 x i8], [26 x i8]* @__DSOCacheEntry_name.17, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 549
	%struct.DSOCacheEntry {
		i64 2965141360, ; hash 0xb0bc7770, from name: aot-Xamarin.AndroidX.SwipeRefreshLayout.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([50 x i8], [50 x i8]* @__DSOCacheEntry_name.101, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 550
	%struct.DSOCacheEntry {
		i64 2967395179, ; hash 0xb0dedb6b, from name: libaot-Microsoft.Extensions.DependencyInjection.Abstractions.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([68 x i8], [68 x i8]* @__DSOCacheEntry_name.51, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 551
	%struct.DSOCacheEntry {
		i64 2968962103, ; hash 0xb0f6c437, from name: Xamarin.AndroidX.Navigation.Common.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([49 x i8], [49 x i8]* @__DSOCacheEntry_name.107, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 552
	%struct.DSOCacheEntry {
		i64 2974011576, ; hash 0xb143d0b8, from name: aot-Xamarin.AndroidX.AppCompat.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([41 x i8], [41 x i8]* @__DSOCacheEntry_name.46, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 553
	%struct.DSOCacheEntry {
		i64 2978675010, ; hash 0xb18af942, from name: Xamarin.AndroidX.DrawerLayout
		i8 0, ; ignore
		i8* getelementptr inbounds ([44 x i8], [44 x i8]* @__DSOCacheEntry_name.84, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 554
	%struct.DSOCacheEntry {
		i64 2980629364, ; hash 0xb1a8cb74, from name: libaot-Xamarin.AndroidX.AppCompat.AppCompatResources
		i8 0, ; ignore
		i8* getelementptr inbounds ([60 x i8], [60 x i8]* @__DSOCacheEntry_name.59, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 555
	%struct.DSOCacheEntry {
		i64 2982794884, ; hash 0xb1c9d684, from name: libaot-Microsoft.Extensions.Configuration.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([49 x i8], [49 x i8]* @__DSOCacheEntry_name.125, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 556
	%struct.DSOCacheEntry {
		i64 2984169794, ; hash 0xb1ded142, from name: Xamarin.GooglePlayServices.Base.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([46 x i8], [46 x i8]* @__DSOCacheEntry_name.29, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 557
	%struct.DSOCacheEntry {
		i64 2985735645, ; hash 0xb1f6b5dd, from name: aot-System.Xml.ReaderWriter.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.38, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 558
	%struct.DSOCacheEntry {
		i64 2994111342, ; hash 0xb276836e, from name: aot-System.Xml.XDocument.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([35 x i8], [35 x i8]* @__DSOCacheEntry_name.98, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 559
	%struct.DSOCacheEntry {
		i64 2995613563, ; hash 0xb28d6f7b, from name: libaot-Xamarin.Facebook.Android.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([39 x i8], [39 x i8]* @__DSOCacheEntry_name.75, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 560
	%struct.DSOCacheEntry {
		i64 3002033339, ; hash 0xb2ef64bb, from name: aot-Microsoft.CSharp
		i8 0, ; ignore
		i8* getelementptr inbounds ([31 x i8], [31 x i8]* @__DSOCacheEntry_name.23, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 561
	%struct.DSOCacheEntry {
		i64 3011705742, ; hash 0xb382fb8e, from name: libaot-Xamarin.AndroidX.ViewPager
		i8 0, ; ignore
		i8* getelementptr inbounds ([41 x i8], [41 x i8]* @__DSOCacheEntry_name.122, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 562
	%struct.DSOCacheEntry {
		i64 3019636524, ; hash 0xb3fbff2c, from name: Microsoft.AspNetCore.Components.Web.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([50 x i8], [50 x i8]* @__DSOCacheEntry_name.130, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 563
	%struct.DSOCacheEntry {
		i64 3024529297, ; hash 0xb446a791, from name: aot-System.Runtime.InteropServices.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([45 x i8], [45 x i8]* @__DSOCacheEntry_name.11, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 564
	%struct.DSOCacheEntry {
		i64 3025818980, ; hash 0xb45a5564, from name: aot-Xamarin.AndroidX.AppCompat.AppCompatResources
		i8 0, ; ignore
		i8* getelementptr inbounds ([60 x i8], [60 x i8]* @__DSOCacheEntry_name.59, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 565
	%struct.DSOCacheEntry {
		i64 3027832605, ; hash 0xb4790f1d, from name: Microsoft.JSInterop.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([34 x i8], [34 x i8]* @__DSOCacheEntry_name.110, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 566
	%struct.DSOCacheEntry {
		i64 3032834059, ; hash 0xb4c5600b, from name: libaot-Xamarin.Facebook.Common.Android.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([46 x i8], [46 x i8]* @__DSOCacheEntry_name.66, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 567
	%struct.DSOCacheEntry {
		i64 3040261996, ; hash 0xb536b76c, from name: aot-Xamarin.KotlinX.Coroutines.Core.Jvm.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([50 x i8], [50 x i8]* @__DSOCacheEntry_name.2, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 568
	%struct.DSOCacheEntry {
		i64 3044365891, ; hash 0xb5755643, from name: aot-System.Numerics.Vectors
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.5, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 569
	%struct.DSOCacheEntry {
		i64 3044487710, ; hash 0xb577321e, from name: libaot-Google.ZXing.Core
		i8 0, ; ignore
		i8* getelementptr inbounds ([32 x i8], [32 x i8]* @__DSOCacheEntry_name.133, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 570
	%struct.DSOCacheEntry {
		i64 3051226419, ; hash 0xb5de0533, from name: System.Runtime.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([29 x i8], [29 x i8]* @__DSOCacheEntry_name.118, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 571
	%struct.DSOCacheEntry {
		i64 3056290812, ; hash 0xb62b4bfc, from name: aot-System.Net.Primitives.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([36 x i8], [36 x i8]* @__DSOCacheEntry_name.91, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 572
	%struct.DSOCacheEntry {
		i64 3057625584, ; hash 0xb63fa9f0, from name: Xamarin.AndroidX.Navigation.Common
		i8 0, ; ignore
		i8* getelementptr inbounds ([49 x i8], [49 x i8]* @__DSOCacheEntry_name.107, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 573
	%struct.DSOCacheEntry {
		i64 3057718947, ; hash 0xb64116a3, from name: aot-System.Linq.Expressions.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.88, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 574
	%struct.DSOCacheEntry {
		i64 3058099980, ; hash 0xb646e70c, from name: Xamarin.GooglePlayServices.Tasks
		i8 0, ; ignore
		i8* getelementptr inbounds ([47 x i8], [47 x i8]* @__DSOCacheEntry_name.117, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 575
	%struct.DSOCacheEntry {
		i64 3058175140, ; hash 0xb6480ca4, from name: System.Text.RegularExpressions.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([45 x i8], [45 x i8]* @__DSOCacheEntry_name.34, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 576
	%struct.DSOCacheEntry {
		i64 3059793426, ; hash 0xb660be12, from name: System.ComponentModel.Primitives
		i8 0, ; ignore
		i8* getelementptr inbounds ([47 x i8], [47 x i8]* @__DSOCacheEntry_name.43, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 577
	%struct.DSOCacheEntry {
		i64 3063139248, ; hash 0xb693cbb0, from name: libaot-Xamarin.Facebook.Core.Android.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([44 x i8], [44 x i8]* @__DSOCacheEntry_name.100, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 578
	%struct.DSOCacheEntry {
		i64 3065213464, ; hash 0xb6b37218, from name: Xamarin.GooglePlayServices.Auth.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([46 x i8], [46 x i8]* @__DSOCacheEntry_name.8, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 579
	%struct.DSOCacheEntry {
		i64 3073434459, ; hash 0xb730e35b, from name: aot-System.Private.CoreLib
		i8 0, ; ignore
		i8* getelementptr inbounds ([37 x i8], [37 x i8]* @__DSOCacheEntry_name.113, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 580
	%struct.DSOCacheEntry {
		i64 3077614056, ; hash 0xb770a9e8, from name: aot-Xamarin.AndroidX.VersionedParcelable
		i8 0, ; ignore
		i8* getelementptr inbounds ([51 x i8], [51 x i8]* @__DSOCacheEntry_name.80, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 581
	%struct.DSOCacheEntry {
		i64 3080099370, ; hash 0xb796962a, from name: libaot-Microsoft.JSInterop
		i8 0, ; ignore
		i8* getelementptr inbounds ([34 x i8], [34 x i8]* @__DSOCacheEntry_name.110, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 582
	%struct.DSOCacheEntry {
		i64 3083233925, ; hash 0xb7c66a85, from name: aot-Xamarin.GooglePlayServices.Measurement.Api
		i8 0, ; ignore
		i8* getelementptr inbounds ([57 x i8], [57 x i8]* @__DSOCacheEntry_name.71, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 583
	%struct.DSOCacheEntry {
		i64 3085820003, ; hash 0xb7ede063, from name: aot-Xamarin.Facebook.Common.Android.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([46 x i8], [46 x i8]* @__DSOCacheEntry_name.66, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 584
	%struct.DSOCacheEntry {
		i64 3089352571, ; hash 0xb823c77b, from name: aot-Xamarin.AndroidX.RecyclerView.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([44 x i8], [44 x i8]* @__DSOCacheEntry_name.116, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 585
	%struct.DSOCacheEntry {
		i64 3095590497, ; hash 0xb882f661, from name: aot-Xamarin.AndroidX.SavedState
		i8 0, ; ignore
		i8* getelementptr inbounds ([42 x i8], [42 x i8]* @__DSOCacheEntry_name.24, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 586
	%struct.DSOCacheEntry {
		i64 3097728972, ; hash 0xb8a397cc, from name: Xamarin.Firebase.Config
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.41, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 587
	%struct.DSOCacheEntry {
		i64 3097746105, ; hash 0xb8a3dab9, from name: System.Console.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([29 x i8], [29 x i8]* @__DSOCacheEntry_name.126, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 588
	%struct.DSOCacheEntry {
		i64 3103429300, ; hash 0xb8fa92b4, from name: libaot-Xamarin.AndroidX.AppCompat.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([41 x i8], [41 x i8]* @__DSOCacheEntry_name.46, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 589
	%struct.DSOCacheEntry {
		i64 3104224272, ; hash 0xb906b410, from name: libaot-Xamarin.AndroidX.VersionedParcelable.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([51 x i8], [51 x i8]* @__DSOCacheEntry_name.80, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 590
	%struct.DSOCacheEntry {
		i64 3118795923, ; hash 0xb9e50c93, from name: aot-Xamarin.AndroidX.CoordinatorLayout.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([49 x i8], [49 x i8]* @__DSOCacheEntry_name.36, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 591
	%struct.DSOCacheEntry {
		i64 3119114540, ; hash 0xb9e9e92c, from name: aot-Microsoft.Maui.Controls
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.56, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 592
	%struct.DSOCacheEntry {
		i64 3119652235, ; hash 0xb9f21d8b, from name: Mono.Android.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([27 x i8], [27 x i8]* @__DSOCacheEntry_name.40, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 593
	%struct.DSOCacheEntry {
		i64 3127835167, ; hash 0xba6efa1f, from name: System.ObjectModel.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([33 x i8], [33 x i8]* @__DSOCacheEntry_name.64, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 594
	%struct.DSOCacheEntry {
		i64 3129695436, ; hash 0xba8b5ccc, from name: libaot-System.Private.Uri
		i8 0, ; ignore
		i8* getelementptr inbounds ([33 x i8], [33 x i8]* @__DSOCacheEntry_name.127, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 595
	%struct.DSOCacheEntry {
		i64 3137986923, ; hash 0xbb09e16b, from name: libaot-System.Net.Requests
		i8 0, ; ignore
		i8* getelementptr inbounds ([34 x i8], [34 x i8]* @__DSOCacheEntry_name.26, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 596
	%struct.DSOCacheEntry {
		i64 3153787776, ; hash 0xbbfafb80, from name: aot-Xamarin.Firebase.Dynamic.Links.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([45 x i8], [45 x i8]* @__DSOCacheEntry_name.4, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 597
	%struct.DSOCacheEntry {
		i64 3155362983, ; hash 0xbc1304a7, from name: Xamarin.Google.Android.DataTransport.TransportApi
		i8 0, ; ignore
		i8* getelementptr inbounds ([64 x i8], [64 x i8]* @__DSOCacheEntry_name.106, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 598
	%struct.DSOCacheEntry {
		i64 3156994069, ; hash 0xbc2be815, from name: aot-Xamarin.GooglePlayServices.Auth
		i8 0, ; ignore
		i8* getelementptr inbounds ([46 x i8], [46 x i8]* @__DSOCacheEntry_name.8, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 599
	%struct.DSOCacheEntry {
		i64 3175528047, ; hash 0xbd46b66f, from name: aot-Xamarin.Firebase.Auth
		i8 0, ; ignore
		i8* getelementptr inbounds ([36 x i8], [36 x i8]* @__DSOCacheEntry_name.89, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 600
	%struct.DSOCacheEntry {
		i64 3177211174, ; hash 0xbd606526, from name: libaot-Xamarin.AndroidX.Lifecycle.Common.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([48 x i8], [48 x i8]* @__DSOCacheEntry_name.19, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 601
	%struct.DSOCacheEntry {
		i64 3187756475, ; hash 0xbe014dbb, from name: aot-Xamarin.Facebook.Android.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([39 x i8], [39 x i8]* @__DSOCacheEntry_name.75, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 602
	%struct.DSOCacheEntry {
		i64 3194979304, ; hash 0xbe6f83e8, from name: aot-Xamarin.AndroidX.ViewPager
		i8 0, ; ignore
		i8* getelementptr inbounds ([41 x i8], [41 x i8]* @__DSOCacheEntry_name.122, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 603
	%struct.DSOCacheEntry {
		i64 3207263341, ; hash 0xbf2af46d, from name: libaot-Plugin.Firebase.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([30 x i8], [30 x i8]* @__DSOCacheEntry_name.69, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 604
	%struct.DSOCacheEntry {
		i64 3209389372, ; hash 0xbf4b653c, from name: libaot-Xamarin.GooglePlayServices.Auth.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([46 x i8], [46 x i8]* @__DSOCacheEntry_name.8, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 605
	%struct.DSOCacheEntry {
		i64 3210556674, ; hash 0xbf5d3502, from name: System.IO.FileSystem.Watcher.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([43 x i8], [43 x i8]* @__DSOCacheEntry_name.68, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 606
	%struct.DSOCacheEntry {
		i64 3212987759, ; hash 0xbf824d6f, from name: aot-System.Net.Primitives
		i8 0, ; ignore
		i8* getelementptr inbounds ([36 x i8], [36 x i8]* @__DSOCacheEntry_name.91, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 607
	%struct.DSOCacheEntry {
		i64 3216491085, ; hash 0xbfb7c24d, from name: aot-Microsoft.Extensions.Configuration
		i8 0, ; ignore
		i8* getelementptr inbounds ([49 x i8], [49 x i8]* @__DSOCacheEntry_name.125, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 608
	%struct.DSOCacheEntry {
		i64 3220365878, ; hash 0xbff2e236, from name: System.Threading
		i8 0, ; ignore
		i8* getelementptr inbounds ([31 x i8], [31 x i8]* @__DSOCacheEntry_name.114, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 609
	%struct.DSOCacheEntry {
		i64 3222740722, ; hash 0xc0171ef2, from name: Xamarin.Protobuf.JavaLite
		i8 0, ; ignore
		i8* getelementptr inbounds ([40 x i8], [40 x i8]* @__DSOCacheEntry_name.123, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 610
	%struct.DSOCacheEntry {
		i64 3230163380, ; hash 0xc08861b4, from name: aot-Xamarin.GooglePlayServices.Basement
		i8 0, ; ignore
		i8* getelementptr inbounds ([50 x i8], [50 x i8]* @__DSOCacheEntry_name.49, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 611
	%struct.DSOCacheEntry {
		i64 3231939099, ; hash 0xc0a37a1b, from name: libaot-Microsoft.Extensions.FileSystemGlobbing
		i8 0, ; ignore
		i8* getelementptr inbounds ([54 x i8], [54 x i8]* @__DSOCacheEntry_name.27, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 612
	%struct.DSOCacheEntry {
		i64 3240981972, ; hash 0xc12d75d4, from name: aot-System.Threading
		i8 0, ; ignore
		i8* getelementptr inbounds ([31 x i8], [31 x i8]* @__DSOCacheEntry_name.114, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 613
	%struct.DSOCacheEntry {
		i64 3243272429, ; hash 0xc15068ed, from name: aot-System.Xml.Linq.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([30 x i8], [30 x i8]* @__DSOCacheEntry_name.119, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 614
	%struct.DSOCacheEntry {
		i64 3255351766, ; hash 0xc208b9d6, from name: libaot-KTKGuest.WebComponents.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([37 x i8], [37 x i8]* @__DSOCacheEntry_name.28, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 615
	%struct.DSOCacheEntry {
		i64 3257875127, ; hash 0xc22f3ab7, from name: libaot-System.IO.FileSystem.Watcher.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([43 x i8], [43 x i8]* @__DSOCacheEntry_name.68, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 616
	%struct.DSOCacheEntry {
		i64 3258312781, ; hash 0xc235e84d, from name: Xamarin.AndroidX.CardView
		i8 0, ; ignore
		i8* getelementptr inbounds ([40 x i8], [40 x i8]* @__DSOCacheEntry_name.78, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 617
	%struct.DSOCacheEntry {
		i64 3259652464, ; hash 0xc24a5970, from name: libaot-System.Private.Xml.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([33 x i8], [33 x i8]* @__DSOCacheEntry_name.121, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 618
	%struct.DSOCacheEntry {
		i64 3268042121, ; hash 0xc2ca5d89, from name: aot-Xamarin.AndroidX.Loader.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.60, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 619
	%struct.DSOCacheEntry {
		i64 3271438092, ; hash 0xc2fe2f0c, from name: libaot-mscorlib.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([23 x i8], [23 x i8]* @__DSOCacheEntry_name.14, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 620
	%struct.DSOCacheEntry {
		i64 3275660490, ; hash 0xc33e9cca, from name: System.Net.Http.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([30 x i8], [30 x i8]* @__DSOCacheEntry_name.102, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 621
	%struct.DSOCacheEntry {
		i64 3281210244, ; hash 0xc3934b84, from name: aot-Microsoft.JSInterop.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([34 x i8], [34 x i8]* @__DSOCacheEntry_name.110, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 622
	%struct.DSOCacheEntry {
		i64 3291879728, ; hash 0xc4361930, from name: Xamarin.Facebook.Share.Android
		i8 0, ; ignore
		i8* getelementptr inbounds ([45 x i8], [45 x i8]* @__DSOCacheEntry_name.90, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 623
	%struct.DSOCacheEntry {
		i64 3294137703, ; hash 0xc4588d67, from name: libaot-System.Linq.Expressions.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.88, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 624
	%struct.DSOCacheEntry {
		i64 3295381226, ; hash 0xc46b86ea, from name: libaot-Xamarin.Firebase.Common.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.109, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 625
	%struct.DSOCacheEntry {
		i64 3304807096, ; hash 0xc4fb5ab8, from name: aot-Xamarin.Google.Android.DataTransport.TransportApi.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([64 x i8], [64 x i8]* @__DSOCacheEntry_name.106, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 626
	%struct.DSOCacheEntry {
		i64 3320200080, ; hash 0xc5e63b90, from name: System.Linq.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([26 x i8], [26 x i8]* @__DSOCacheEntry_name.94, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 627
	%struct.DSOCacheEntry {
		i64 3321816931, ; hash 0xc5fee763, from name: libaot-Xamarin.AndroidX.ViewPager.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([41 x i8], [41 x i8]* @__DSOCacheEntry_name.122, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 628
	%struct.DSOCacheEntry {
		i64 3330991993, ; hash 0xc68ae779, from name: libaot-Microsoft.Maui
		i8 0, ; ignore
		i8* getelementptr inbounds ([29 x i8], [29 x i8]* @__DSOCacheEntry_name.76, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 629
	%struct.DSOCacheEntry {
		i64 3346324047, ; hash 0xc774da4f, from name: Xamarin.AndroidX.Navigation.Runtime
		i8 0, ; ignore
		i8* getelementptr inbounds ([50 x i8], [50 x i8]* @__DSOCacheEntry_name.16, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 630
	%struct.DSOCacheEntry {
		i64 3357027669, ; hash 0xc8182d55, from name: aot-Xamarin.GooglePlayServices.Tasks.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([47 x i8], [47 x i8]* @__DSOCacheEntry_name.117, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 631
	%struct.DSOCacheEntry {
		i64 3358260929, ; hash 0xc82afec1, from name: System.Text.Json
		i8 0, ; ignore
		i8* getelementptr inbounds ([31 x i8], [31 x i8]* @__DSOCacheEntry_name.39, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 632
	%struct.DSOCacheEntry {
		i64 3362522851, ; hash 0xc86c06e3, from name: Xamarin.AndroidX.Core
		i8 0, ; ignore
		i8* getelementptr inbounds ([36 x i8], [36 x i8]* @__DSOCacheEntry_name.6, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 633
	%struct.DSOCacheEntry {
		i64 3366347497, ; hash 0xc8a662e9, from name: Java.Interop
		i8 0, ; ignore
		i8* getelementptr inbounds ([27 x i8], [27 x i8]* @__DSOCacheEntry_name.129, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 634
	%struct.DSOCacheEntry {
		i64 3368557256, ; hash 0xc8c81ac8, from name: libaot-GoogleGson
		i8 0, ; ignore
		i8* getelementptr inbounds ([25 x i8], [25 x i8]* @__DSOCacheEntry_name.104, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 635
	%struct.DSOCacheEntry {
		i64 3373535460, ; hash 0xc91410e4, from name: Blazored.SessionStorage.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.20, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 636
	%struct.DSOCacheEntry {
		i64 3374999561, ; hash 0xc92a6809, from name: Xamarin.AndroidX.RecyclerView
		i8 0, ; ignore
		i8* getelementptr inbounds ([44 x i8], [44 x i8]* @__DSOCacheEntry_name.116, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 637
	%struct.DSOCacheEntry {
		i64 3394171410, ; hash 0xca4ef212, from name: Xamarin.AndroidX.Activity.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([40 x i8], [40 x i8]* @__DSOCacheEntry_name.18, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 638
	%struct.DSOCacheEntry {
		i64 3396494892, ; hash 0xca72662c, from name: System.Net.Primitives.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([36 x i8], [36 x i8]* @__DSOCacheEntry_name.91, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 639
	%struct.DSOCacheEntry {
		i64 3400462534, ; hash 0xcaaef0c6, from name: mscorlib.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([23 x i8], [23 x i8]* @__DSOCacheEntry_name.14, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 640
	%struct.DSOCacheEntry {
		i64 3401606454, ; hash 0xcac06536, from name: Xamarin.AndroidX.ViewPager.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([41 x i8], [41 x i8]* @__DSOCacheEntry_name.122, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 641
	%struct.DSOCacheEntry {
		i64 3403922660, ; hash 0xcae3bce4, from name: aot-Xamarin.AndroidX.CardView.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([40 x i8], [40 x i8]* @__DSOCacheEntry_name.78, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 642
	%struct.DSOCacheEntry {
		i64 3409284616, ; hash 0xcb358e08, from name: aot-Xamarin.AndroidX.Browser
		i8 0, ; ignore
		i8* getelementptr inbounds ([39 x i8], [39 x i8]* @__DSOCacheEntry_name.37, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 643
	%struct.DSOCacheEntry {
		i64 3422266863, ; hash 0xcbfba5ef, from name: libmonodroid.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([16 x i8], [16 x i8]* @__DSOCacheEntry_name.30, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 644
	%struct.DSOCacheEntry {
		i64 3436153507, ; hash 0xcccf8aa3, from name: aot-Google.ZXing.Core
		i8 0, ; ignore
		i8* getelementptr inbounds ([32 x i8], [32 x i8]* @__DSOCacheEntry_name.133, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 645
	%struct.DSOCacheEntry {
		i64 3437748879, ; hash 0xcce7e28f, from name: Xamarin.Firebase.Storage
		i8 0, ; ignore
		i8* getelementptr inbounds ([39 x i8], [39 x i8]* @__DSOCacheEntry_name.120, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 646
	%struct.DSOCacheEntry {
		i64 3445624513, ; hash 0xcd600ec1, from name: aot-System.ComponentModel.Primitives.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([47 x i8], [47 x i8]* @__DSOCacheEntry_name.43, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 647
	%struct.DSOCacheEntry {
		i64 3448212429, ; hash 0xcd878bcd, from name: aot-System.IO.Compression
		i8 0, ; ignore
		i8* getelementptr inbounds ([36 x i8], [36 x i8]* @__DSOCacheEntry_name.58, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 648
	%struct.DSOCacheEntry {
		i64 3470465183, ; hash 0xcedb189f, from name: libaot-KTKGuest.App.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([27 x i8], [27 x i8]* @__DSOCacheEntry_name.50, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 649
	%struct.DSOCacheEntry {
		i64 3475398840, ; hash 0xcf2660b8, from name: libaot-Xamarin.Facebook.AppLinks.Android.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([48 x i8], [48 x i8]* @__DSOCacheEntry_name.9, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 650
	%struct.DSOCacheEntry {
		i64 3476120550, ; hash 0xcf3163e6, from name: Mono.Android
		i8 0, ; ignore
		i8* getelementptr inbounds ([27 x i8], [27 x i8]* @__DSOCacheEntry_name.40, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 651
	%struct.DSOCacheEntry {
		i64 3498419225, ; hash 0xd085a419, from name: aot-Xamarin.AndroidX.Navigation.Common.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([49 x i8], [49 x i8]* @__DSOCacheEntry_name.107, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 652
	%struct.DSOCacheEntry {
		i64 3500000672, ; hash 0xd09dc5a0, from name: Microsoft.JSInterop
		i8 0, ; ignore
		i8* getelementptr inbounds ([34 x i8], [34 x i8]* @__DSOCacheEntry_name.110, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 653
	%struct.DSOCacheEntry {
		i64 3509114376, ; hash 0xd128d608, from name: System.Xml.Linq
		i8 0, ; ignore
		i8* getelementptr inbounds ([30 x i8], [30 x i8]* @__DSOCacheEntry_name.119, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 654
	%struct.DSOCacheEntry {
		i64 3511347855, ; hash 0xd14aea8f, from name: libaot-Plugin.Firebase
		i8 0, ; ignore
		i8* getelementptr inbounds ([30 x i8], [30 x i8]* @__DSOCacheEntry_name.69, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 655
	%struct.DSOCacheEntry {
		i64 3514162118, ; hash 0xd175dbc6, from name: libaot-Xamarin.Protobuf.JavaLite
		i8 0, ; ignore
		i8* getelementptr inbounds ([40 x i8], [40 x i8]* @__DSOCacheEntry_name.123, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 656
	%struct.DSOCacheEntry {
		i64 3527981548, ; hash 0xd248b9ec, from name: System.Runtime.Loader.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([36 x i8], [36 x i8]* @__DSOCacheEntry_name.33, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 657
	%struct.DSOCacheEntry {
		i64 3531467364, ; hash 0xd27dea64, from name: Microsoft.Extensions.Options.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([43 x i8], [43 x i8]* @__DSOCacheEntry_name.83, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 658
	%struct.DSOCacheEntry {
		i64 3531635423, ; hash 0xd2807adf, from name: Xamarin.Facebook.Login.Android.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([45 x i8], [45 x i8]* @__DSOCacheEntry_name.82, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 659
	%struct.DSOCacheEntry {
		i64 3547939516, ; hash 0xd37942bc, from name: System.Private.Xml.Linq.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.86, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 660
	%struct.DSOCacheEntry {
		i64 3550099434, ; hash 0xd39a37ea, from name: aot-Xamarin.Firebase.Auth.Interop.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([44 x i8], [44 x i8]* @__DSOCacheEntry_name.96, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 661
	%struct.DSOCacheEntry {
		i64 3554143940, ; hash 0xd3d7eec4, from name: libaot-System.Collections.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([33 x i8], [33 x i8]* @__DSOCacheEntry_name.48, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 662
	%struct.DSOCacheEntry {
		i64 3557887367, ; hash 0xd4110d87, from name: libaot-System.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([21 x i8], [21 x i8]* @__DSOCacheEntry_name.95, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 663
	%struct.DSOCacheEntry {
		i64 3563790061, ; hash 0xd46b1eed, from name: libaot-Microsoft.Extensions.Configuration.Abstractions
		i8 0, ; ignore
		i8* getelementptr inbounds ([62 x i8], [62 x i8]* @__DSOCacheEntry_name.124, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 664
	%struct.DSOCacheEntry {
		i64 3569135103, ; hash 0xd4bcadff, from name: aot-Xamarin.AndroidX.Lifecycle.ViewModel
		i8 0, ; ignore
		i8* getelementptr inbounds ([51 x i8], [51 x i8]* @__DSOCacheEntry_name.97, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 665
	%struct.DSOCacheEntry {
		i64 3574279395, ; hash 0xd50b2ce3, from name: libaot-System.Runtime.Loader
		i8 0, ; ignore
		i8* getelementptr inbounds ([36 x i8], [36 x i8]* @__DSOCacheEntry_name.33, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 666
	%struct.DSOCacheEntry {
		i64 3580899767, ; hash 0xd57031b7, from name: libaot-Xamarin.AndroidX.Navigation.Fragment.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([51 x i8], [51 x i8]* @__DSOCacheEntry_name.112, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 667
	%struct.DSOCacheEntry {
		i64 3580928879, ; hash 0xd570a36f, from name: aot-Xamarin.AndroidX.Lifecycle.Common
		i8 0, ; ignore
		i8* getelementptr inbounds ([48 x i8], [48 x i8]* @__DSOCacheEntry_name.19, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 668
	%struct.DSOCacheEntry {
		i64 3581103432, ; hash 0xd5734d48, from name: libaot-Xamarin.Kotlin.StdLib
		i8 0, ; ignore
		i8* getelementptr inbounds ([36 x i8], [36 x i8]* @__DSOCacheEntry_name.32, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 669
	%struct.DSOCacheEntry {
		i64 3582297397, ; hash 0xd5858535, from name: aot-Xamarin.AndroidX.Lifecycle.LiveData.Core
		i8 0, ; ignore
		i8* getelementptr inbounds ([55 x i8], [55 x i8]* @__DSOCacheEntry_name.13, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 670
	%struct.DSOCacheEntry {
		i64 3586228282, ; hash 0xd5c1803a, from name: Xamarin.Facebook.GamingServices.Android
		i8 0, ; ignore
		i8* getelementptr inbounds ([54 x i8], [54 x i8]* @__DSOCacheEntry_name.57, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 671
	%struct.DSOCacheEntry {
		i64 3597794883, ; hash 0xd671fe43, from name: Xamarin.Firebase.Firestore
		i8 0, ; ignore
		i8* getelementptr inbounds ([41 x i8], [41 x i8]* @__DSOCacheEntry_name.115, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 672
	%struct.DSOCacheEntry {
		i64 3610022767, ; hash 0xd72c936f, from name: libaot-System.Security.Cryptography.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([43 x i8], [43 x i8]* @__DSOCacheEntry_name.93, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 673
	%struct.DSOCacheEntry {
		i64 3611224142, ; hash 0xd73ee84e, from name: libaot-Xamarin.Firebase.Config
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.41, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 674
	%struct.DSOCacheEntry {
		i64 3616174750, ; hash 0xd78a729e, from name: libaot-Xamarin.AndroidX.Browser
		i8 0, ; ignore
		i8* getelementptr inbounds ([39 x i8], [39 x i8]* @__DSOCacheEntry_name.37, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 675
	%struct.DSOCacheEntry {
		i64 3617535095, ; hash 0xd79f3477, from name: libaot-System.Xml.XDocument
		i8 0, ; ignore
		i8* getelementptr inbounds ([35 x i8], [35 x i8]* @__DSOCacheEntry_name.98, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 676
	%struct.DSOCacheEntry {
		i64 3623194064, ; hash 0xd7f58dd0, from name: libaot-System.Linq
		i8 0, ; ignore
		i8* getelementptr inbounds ([26 x i8], [26 x i8]* @__DSOCacheEntry_name.94, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 677
	%struct.DSOCacheEntry {
		i64 3629173998, ; hash 0xd850ccee, from name: libaot-mscorlib
		i8 0, ; ignore
		i8* getelementptr inbounds ([23 x i8], [23 x i8]* @__DSOCacheEntry_name.14, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 678
	%struct.DSOCacheEntry {
		i64 3633555782, ; hash 0xd893a946, from name: libaot-Xamarin.Protobuf.JavaLite.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([40 x i8], [40 x i8]* @__DSOCacheEntry_name.123, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 679
	%struct.DSOCacheEntry {
		i64 3634717083, ; hash 0xd8a5619b, from name: libaot-Microsoft.Extensions.FileProviders.Composite.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([59 x i8], [59 x i8]* @__DSOCacheEntry_name.21, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 680
	%struct.DSOCacheEntry {
		i64 3635284347, ; hash 0xd8ae097b, from name: aot-Xamarin.Firebase.Common.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.109, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 681
	%struct.DSOCacheEntry {
		i64 3636393175, ; hash 0xd8bef4d7, from name: libmonodroid
		i8 0, ; ignore
		i8* getelementptr inbounds ([16 x i8], [16 x i8]* @__DSOCacheEntry_name.30, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 682
	%struct.DSOCacheEntry {
		i64 3641597786, ; hash 0xd90e5f5a, from name: Xamarin.AndroidX.Lifecycle.LiveData.Core
		i8 0, ; ignore
		i8* getelementptr inbounds ([55 x i8], [55 x i8]* @__DSOCacheEntry_name.13, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 683
	%struct.DSOCacheEntry {
		i64 3643767377, ; hash 0xd92f7a51, from name: libaot-Xamarin.Firebase.Components.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([42 x i8], [42 x i8]* @__DSOCacheEntry_name.63, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 684
	%struct.DSOCacheEntry {
		i64 3643854240, ; hash 0xd930cda0, from name: Xamarin.AndroidX.Navigation.Fragment
		i8 0, ; ignore
		i8* getelementptr inbounds ([51 x i8], [51 x i8]* @__DSOCacheEntry_name.112, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 685
	%struct.DSOCacheEntry {
		i64 3647597548, ; hash 0xd969ebec, from name: System.Runtime.InteropServices.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([45 x i8], [45 x i8]* @__DSOCacheEntry_name.11, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 686
	%struct.DSOCacheEntry {
		i64 3650306124, ; hash 0xd993404c, from name: System.Text.Encodings.Web.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([40 x i8], [40 x i8]* @__DSOCacheEntry_name.73, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 687
	%struct.DSOCacheEntry {
		i64 3653801034, ; hash 0xd9c8944a, from name: libaot-Xamarin.AndroidX.Collection.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([42 x i8], [42 x i8]* @__DSOCacheEntry_name.74, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 688
	%struct.DSOCacheEntry {
		i64 3654320306, ; hash 0xd9d080b2, from name: libaot-Microsoft.AspNetCore.Components.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([46 x i8], [46 x i8]* @__DSOCacheEntry_name.111, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 689
	%struct.DSOCacheEntry {
		i64 3662939194, ; hash 0xda54043a, from name: aot-Xamarin.AndroidX.Navigation.Fragment.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([51 x i8], [51 x i8]* @__DSOCacheEntry_name.112, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 690
	%struct.DSOCacheEntry {
		i64 3665348534, ; hash 0xda78c7b6, from name: Xamarin.Protobuf.JavaLite.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([40 x i8], [40 x i8]* @__DSOCacheEntry_name.123, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 691
	%struct.DSOCacheEntry {
		i64 3681226846, ; hash 0xdb6b105e, from name: libaot-Xamarin.Facebook.Share.Android.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([45 x i8], [45 x i8]* @__DSOCacheEntry_name.90, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 692
	%struct.DSOCacheEntry {
		i64 3682565725, ; hash 0xdb7f7e5d, from name: Xamarin.AndroidX.Browser
		i8 0, ; ignore
		i8* getelementptr inbounds ([39 x i8], [39 x i8]* @__DSOCacheEntry_name.37, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 693
	%struct.DSOCacheEntry {
		i64 3684032917, ; hash 0xdb95e195, from name: libaot-Xamarin.AndroidX.SavedState
		i8 0, ; ignore
		i8* getelementptr inbounds ([42 x i8], [42 x i8]* @__DSOCacheEntry_name.24, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 694
	%struct.DSOCacheEntry {
		i64 3691770169, ; hash 0xdc0bf139, from name: Xamarin.AndroidX.Core.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([36 x i8], [36 x i8]* @__DSOCacheEntry_name.6, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 695
	%struct.DSOCacheEntry {
		i64 3699984852, ; hash 0xdc8949d4, from name: aot-Xamarin.Facebook.Login.Android
		i8 0, ; ignore
		i8* getelementptr inbounds ([45 x i8], [45 x i8]* @__DSOCacheEntry_name.82, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 696
	%struct.DSOCacheEntry {
		i64 3701567872, ; hash 0xdca17180, from name: libaot-Xamarin.Firebase.Auth.Interop.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([44 x i8], [44 x i8]* @__DSOCacheEntry_name.96, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 697
	%struct.DSOCacheEntry {
		i64 3705667778, ; hash 0xdce000c2, from name: libaot-System.Threading.Thread.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.3, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 698
	%struct.DSOCacheEntry {
		i64 3706752653, ; hash 0xdcf08e8d, from name: libaot-Xamarin.Facebook.Common.Android
		i8 0, ; ignore
		i8* getelementptr inbounds ([46 x i8], [46 x i8]* @__DSOCacheEntry_name.66, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 699
	%struct.DSOCacheEntry {
		i64 3712627230, ; hash 0xdd4a321e, from name: aot-System.Xml.XDocument
		i8 0, ; ignore
		i8* getelementptr inbounds ([35 x i8], [35 x i8]* @__DSOCacheEntry_name.98, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 700
	%struct.DSOCacheEntry {
		i64 3713574350, ; hash 0xdd58a5ce, from name: libaot-Google.ZXing.Core.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([32 x i8], [32 x i8]* @__DSOCacheEntry_name.133, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 701
	%struct.DSOCacheEntry {
		i64 3729900704, ; hash 0xde51c4a0, from name: aot-Microsoft.JSInterop
		i8 0, ; ignore
		i8* getelementptr inbounds ([34 x i8], [34 x i8]* @__DSOCacheEntry_name.110, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 702
	%struct.DSOCacheEntry {
		i64 3729924096, ; hash 0xde522000, from name: Xamarin.GooglePlayServices.Auth
		i8 0, ; ignore
		i8* getelementptr inbounds ([46 x i8], [46 x i8]* @__DSOCacheEntry_name.8, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 703
	%struct.DSOCacheEntry {
		i64 3772146816, ; hash 0xe0d66480, from name: aot-Xamarin.Facebook.AppLinks.Android
		i8 0, ; ignore
		i8* getelementptr inbounds ([48 x i8], [48 x i8]* @__DSOCacheEntry_name.9, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 704
	%struct.DSOCacheEntry {
		i64 3786282454, ; hash 0xe1ae15d6, from name: Xamarin.AndroidX.Collection
		i8 0, ; ignore
		i8* getelementptr inbounds ([42 x i8], [42 x i8]* @__DSOCacheEntry_name.74, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 705
	%struct.DSOCacheEntry {
		i64 3786898687, ; hash 0xe1b77cff, from name: Microsoft.Maui.Controls.Compatibility.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([52 x i8], [52 x i8]* @__DSOCacheEntry_name.70, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 706
	%struct.DSOCacheEntry {
		i64 3790421216, ; hash 0xe1ed3ce0, from name: monosgen-2.0
		i8 0, ; ignore
		i8* getelementptr inbounds ([19 x i8], [19 x i8]* @__DSOCacheEntry_name.132, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 707
	%struct.DSOCacheEntry {
		i64 3792276235, ; hash 0xe2098b0b, from name: System.Collections.NonGeneric
		i8 0, ; ignore
		i8* getelementptr inbounds ([44 x i8], [44 x i8]* @__DSOCacheEntry_name.1, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 708
	%struct.DSOCacheEntry {
		i64 3800979733, ; hash 0xe28e5915, from name: Microsoft.Maui.Controls.Compatibility
		i8 0, ; ignore
		i8* getelementptr inbounds ([52 x i8], [52 x i8]* @__DSOCacheEntry_name.70, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 709
	%struct.DSOCacheEntry {
		i64 3808105303, ; hash 0xe2fb1357, from name: libaot-System.Threading.Thread
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.3, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 710
	%struct.DSOCacheEntry {
		i64 3808542031, ; hash 0xe301bd4f, from name: aot-Microsoft.Extensions.Configuration.Abstractions.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([62 x i8], [62 x i8]* @__DSOCacheEntry_name.124, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 711
	%struct.DSOCacheEntry {
		i64 3809844785, ; hash 0xe3159e31, from name: libaot-Microsoft.AspNetCore.Components.Web
		i8 0, ; ignore
		i8* getelementptr inbounds ([50 x i8], [50 x i8]* @__DSOCacheEntry_name.130, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 712
	%struct.DSOCacheEntry {
		i64 3817984437, ; hash 0xe391d1b5, from name: libmonosgen-2.0.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([19 x i8], [19 x i8]* @__DSOCacheEntry_name.132, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 713
	%struct.DSOCacheEntry {
		i64 3824070419, ; hash 0xe3eeaf13, from name: aot-System.ObjectModel.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([33 x i8], [33 x i8]* @__DSOCacheEntry_name.64, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 714
	%struct.DSOCacheEntry {
		i64 3827383881, ; hash 0xe4213e49, from name: Xamarin.AndroidX.Loader.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.60, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 715
	%struct.DSOCacheEntry {
		i64 3831263026, ; hash 0xe45c6f32, from name: System.ComponentModel.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([36 x i8], [36 x i8]* @__DSOCacheEntry_name.25, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 716
	%struct.DSOCacheEntry {
		i64 3882710139, ; hash 0xe76d747b, from name: aot-Mono.Android.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([27 x i8], [27 x i8]* @__DSOCacheEntry_name.40, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 717
	%struct.DSOCacheEntry {
		i64 3884965556, ; hash 0xe78fdeb4, from name: aot-Xamarin.Firebase.Functions
		i8 0, ; ignore
		i8* getelementptr inbounds ([41 x i8], [41 x i8]* @__DSOCacheEntry_name.62, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 718
	%struct.DSOCacheEntry {
		i64 3889554181, ; hash 0xe7d5e305, from name: libaot-Microsoft.Extensions.Logging
		i8 0, ; ignore
		i8* getelementptr inbounds ([43 x i8], [43 x i8]* @__DSOCacheEntry_name.10, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 719
	%struct.DSOCacheEntry {
		i64 3891366301, ; hash 0xe7f1899d, from name: aot-System.Net.Http
		i8 0, ; ignore
		i8* getelementptr inbounds ([30 x i8], [30 x i8]* @__DSOCacheEntry_name.102, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 720
	%struct.DSOCacheEntry {
		i64 3894530715, ; hash 0xe821d29b, from name: libaot-Xamarin.AndroidX.Navigation.Runtime.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([50 x i8], [50 x i8]* @__DSOCacheEntry_name.16, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 721
	%struct.DSOCacheEntry {
		i64 3909437042, ; hash 0xe9054672, from name: libaot-System.Memory
		i8 0, ; ignore
		i8* getelementptr inbounds ([28 x i8], [28 x i8]* @__DSOCacheEntry_name.53, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 722
	%struct.DSOCacheEntry {
		i64 3914492688, ; hash 0xe9526b10, from name: libaot-Xamarin.Android.Binding.InstallReferrer.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([54 x i8], [54 x i8]* @__DSOCacheEntry_name.55, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 723
	%struct.DSOCacheEntry {
		i64 3915264716, ; hash 0xe95e32cc, from name: aot-System.Security.Cryptography
		i8 0, ; ignore
		i8* getelementptr inbounds ([43 x i8], [43 x i8]* @__DSOCacheEntry_name.93, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 724
	%struct.DSOCacheEntry {
		i64 3915500067, ; hash 0xe961ca23, from name: Microsoft.Extensions.FileProviders.Embedded.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([58 x i8], [58 x i8]* @__DSOCacheEntry_name.77, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 725
	%struct.DSOCacheEntry {
		i64 3925086652, ; hash 0xe9f411bc, from name: libaot-Xamarin.Firebase.Firestore.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([41 x i8], [41 x i8]* @__DSOCacheEntry_name.115, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 726
	%struct.DSOCacheEntry {
		i64 3928044579, ; hash 0xea213423, from name: System.Xml.ReaderWriter
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.38, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 727
	%struct.DSOCacheEntry {
		i64 3930233922, ; hash 0xea429c42, from name: libaot-Xamarin.AndroidX.Collection
		i8 0, ; ignore
		i8* getelementptr inbounds ([42 x i8], [42 x i8]* @__DSOCacheEntry_name.74, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 728
	%struct.DSOCacheEntry {
		i64 3931092270, ; hash 0xea4fb52e, from name: Xamarin.AndroidX.Navigation.UI
		i8 0, ; ignore
		i8* getelementptr inbounds ([45 x i8], [45 x i8]* @__DSOCacheEntry_name.44, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 729
	%struct.DSOCacheEntry {
		i64 3934808307, ; hash 0xea8868f3, from name: libaot-Mono.Android
		i8 0, ; ignore
		i8* getelementptr inbounds ([27 x i8], [27 x i8]* @__DSOCacheEntry_name.40, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 730
	%struct.DSOCacheEntry {
		i64 3936467727, ; hash 0xeaa1bb0f, from name: libaot-Xamarin.AndroidX.CardView.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([40 x i8], [40 x i8]* @__DSOCacheEntry_name.78, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 731
	%struct.DSOCacheEntry {
		i64 3956193289, ; hash 0xebceb809, from name: libaot-System.Memory.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([28 x i8], [28 x i8]* @__DSOCacheEntry_name.53, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 732
	%struct.DSOCacheEntry {
		i64 3956495024, ; hash 0xebd352b0, from name: Microsoft.AspNetCore.Components.WebView.Maui.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([59 x i8], [59 x i8]* @__DSOCacheEntry_name.85, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 733
	%struct.DSOCacheEntry {
		i64 3961737229, ; hash 0xec23500d, from name: libaot-Xamarin.Facebook.Share.Android
		i8 0, ; ignore
		i8* getelementptr inbounds ([45 x i8], [45 x i8]* @__DSOCacheEntry_name.90, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 734
	%struct.DSOCacheEntry {
		i64 3961980352, ; hash 0xec2705c0, from name: libaot-Microsoft.Extensions.FileProviders.Embedded
		i8 0, ; ignore
		i8* getelementptr inbounds ([58 x i8], [58 x i8]* @__DSOCacheEntry_name.77, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 735
	%struct.DSOCacheEntry {
		i64 3964477410, ; hash 0xec4d1fe2, from name: Microsoft.Maui.Graphics.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.87, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 736
	%struct.DSOCacheEntry {
		i64 3983604604, ; hash 0xed70fb7c, from name: aot-Java.Interop
		i8 0, ; ignore
		i8* getelementptr inbounds ([27 x i8], [27 x i8]* @__DSOCacheEntry_name.129, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 737
	%struct.DSOCacheEntry {
		i64 3993813431, ; hash 0xee0cc1b7, from name: libaot-Xamarin.AndroidX.Lifecycle.LiveData.Core.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([55 x i8], [55 x i8]* @__DSOCacheEntry_name.13, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 738
	%struct.DSOCacheEntry {
		i64 3996561484, ; hash 0xee36b04c, from name: aot-System.Runtime.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([29 x i8], [29 x i8]* @__DSOCacheEntry_name.118, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 739
	%struct.DSOCacheEntry {
		i64 4000318121, ; hash 0xee7002a9, from name: Google.ZXing.Core
		i8 0, ; ignore
		i8* getelementptr inbounds ([32 x i8], [32 x i8]* @__DSOCacheEntry_name.133, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 740
	%struct.DSOCacheEntry {
		i64 4001521982, ; hash 0xee82613e, from name: libaot-GoogleGson.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([25 x i8], [25 x i8]* @__DSOCacheEntry_name.104, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 741
	%struct.DSOCacheEntry {
		i64 4008891760, ; hash 0xeef2d570, from name: Xamarin.AndroidX.DrawerLayout.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([44 x i8], [44 x i8]* @__DSOCacheEntry_name.84, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 742
	%struct.DSOCacheEntry {
		i64 4025784931, ; hash 0xeff49a63, from name: System.Memory
		i8 0, ; ignore
		i8* getelementptr inbounds ([28 x i8], [28 x i8]* @__DSOCacheEntry_name.53, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 743
	%struct.DSOCacheEntry {
		i64 4027140892, ; hash 0xf0094b1c, from name: libaot-Xamarin.AndroidX.SwipeRefreshLayout
		i8 0, ; ignore
		i8* getelementptr inbounds ([50 x i8], [50 x i8]* @__DSOCacheEntry_name.101, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 744
	%struct.DSOCacheEntry {
		i64 4031292811, ; hash 0xf048a58b, from name: Xamarin.AndroidX.CardView.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([40 x i8], [40 x i8]* @__DSOCacheEntry_name.78, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 745
	%struct.DSOCacheEntry {
		i64 4040627290, ; hash 0xf0d7145a, from name: aot-Xamarin.GooglePlayServices.Tasks
		i8 0, ; ignore
		i8* getelementptr inbounds ([47 x i8], [47 x i8]* @__DSOCacheEntry_name.117, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 746
	%struct.DSOCacheEntry {
		i64 4042557652, ; hash 0xf0f488d4, from name: libaot-System.ComponentModel
		i8 0, ; ignore
		i8* getelementptr inbounds ([36 x i8], [36 x i8]* @__DSOCacheEntry_name.25, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 747
	%struct.DSOCacheEntry {
		i64 4057390768, ; hash 0xf1d6deb0, from name: Microsoft.Extensions.Primitives.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([46 x i8], [46 x i8]* @__DSOCacheEntry_name.92, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 748
	%struct.DSOCacheEntry {
		i64 4063454328, ; hash 0xf2336478, from name: aot-System.IO.Compression.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([36 x i8], [36 x i8]* @__DSOCacheEntry_name.58, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 749
	%struct.DSOCacheEntry {
		i64 4100113165, ; hash 0xf462c30d, from name: System.Private.Uri
		i8 0, ; ignore
		i8* getelementptr inbounds ([33 x i8], [33 x i8]* @__DSOCacheEntry_name.127, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 750
	%struct.DSOCacheEntry {
		i64 4112220824, ; hash 0xf51b8298, from name: aot-Xamarin.AndroidX.Core.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([36 x i8], [36 x i8]* @__DSOCacheEntry_name.6, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 751
	%struct.DSOCacheEntry {
		i64 4112572424, ; hash 0xf520e008, from name: libaot-Xamarin.AndroidX.Window.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.108, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 752
	%struct.DSOCacheEntry {
		i64 4113193990, ; hash 0xf52a5c06, from name: libaot-Xamarin.AndroidX.SwipeRefreshLayout.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([50 x i8], [50 x i8]* @__DSOCacheEntry_name.101, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 753
	%struct.DSOCacheEntry {
		i64 4117511225, ; hash 0xf56c3c39, from name: Xamarin.AndroidX.ViewPager2.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([42 x i8], [42 x i8]* @__DSOCacheEntry_name.54, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 754
	%struct.DSOCacheEntry {
		i64 4124759570, ; hash 0xf5dad612, from name: libaot-System.Private.CoreLib.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([37 x i8], [37 x i8]* @__DSOCacheEntry_name.113, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 755
	%struct.DSOCacheEntry {
		i64 4125976845, ; hash 0xf5ed690d, from name: System.ComponentModel.TypeConverter.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([50 x i8], [50 x i8]* @__DSOCacheEntry_name.99, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 756
	%struct.DSOCacheEntry {
		i64 4126470640, ; hash 0xf5f4f1f0, from name: Microsoft.Extensions.DependencyInjection
		i8 0, ; ignore
		i8* getelementptr inbounds ([55 x i8], [55 x i8]* @__DSOCacheEntry_name.35, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 757
	%struct.DSOCacheEntry {
		i64 4126614450, ; hash 0xf5f723b2, from name: aot-Microsoft.Maui.Graphics
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.87, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 758
	%struct.DSOCacheEntry {
		i64 4127495256, ; hash 0xf6049458, from name: libaot-Xamarin.Facebook.GamingServices.Android.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([54 x i8], [54 x i8]* @__DSOCacheEntry_name.57, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 759
	%struct.DSOCacheEntry {
		i64 4127667938, ; hash 0xf60736e2, from name: System.IO.FileSystem.Watcher
		i8 0, ; ignore
		i8* getelementptr inbounds ([43 x i8], [43 x i8]* @__DSOCacheEntry_name.68, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 760
	%struct.DSOCacheEntry {
		i64 4136001892, ; hash 0xf6866164, from name: aot-Blazored.LocalStorage
		i8 0, ; ignore
		i8* getelementptr inbounds ([36 x i8], [36 x i8]* @__DSOCacheEntry_name.67, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 761
	%struct.DSOCacheEntry {
		i64 4138639952, ; hash 0xf6aea250, from name: aot-Xamarin.Facebook.GamingServices.Android
		i8 0, ; ignore
		i8* getelementptr inbounds ([54 x i8], [54 x i8]* @__DSOCacheEntry_name.57, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 762
	%struct.DSOCacheEntry {
		i64 4138783678, ; hash 0xf6b0d3be, from name: aot-Xamarin.AndroidX.Browser.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([39 x i8], [39 x i8]* @__DSOCacheEntry_name.37, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 763
	%struct.DSOCacheEntry {
		i64 4141496111, ; hash 0xf6da372f, from name: libaot-Microsoft.Extensions.Primitives
		i8 0, ; ignore
		i8* getelementptr inbounds ([46 x i8], [46 x i8]* @__DSOCacheEntry_name.92, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 764
	%struct.DSOCacheEntry {
		i64 4147491756, ; hash 0xf735b3ac, from name: Xamarin.AndroidX.RecyclerView.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([44 x i8], [44 x i8]* @__DSOCacheEntry_name.116, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 765
	%struct.DSOCacheEntry {
		i64 4151237749, ; hash 0xf76edc75, from name: System.Core
		i8 0, ; ignore
		i8* getelementptr inbounds ([26 x i8], [26 x i8]* @__DSOCacheEntry_name.17, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 766
	%struct.DSOCacheEntry {
		i64 4154531413, ; hash 0xf7a11e55, from name: aot-System
		i8 0, ; ignore
		i8* getelementptr inbounds ([21 x i8], [21 x i8]* @__DSOCacheEntry_name.95, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 767
	%struct.DSOCacheEntry {
		i64 4161309507, ; hash 0xf8088b43, from name: libaot-System.Private.CoreLib
		i8 0, ; ignore
		i8* getelementptr inbounds ([37 x i8], [37 x i8]* @__DSOCacheEntry_name.113, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 768
	%struct.DSOCacheEntry {
		i64 4167848361, ; hash 0xf86c51a9, from name: aot-Google.ZXing.Core.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([32 x i8], [32 x i8]* @__DSOCacheEntry_name.133, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 769
	%struct.DSOCacheEntry {
		i64 4169082996, ; hash 0xf87f2874, from name: libaot-Xamarin.AndroidX.Core
		i8 0, ; ignore
		i8* getelementptr inbounds ([36 x i8], [36 x i8]* @__DSOCacheEntry_name.6, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 770
	%struct.DSOCacheEntry {
		i64 4174629528, ; hash 0xf8d3ca98, from name: aot-Microsoft.Maui.Essentials
		i8 0, ; ignore
		i8* getelementptr inbounds ([40 x i8], [40 x i8]* @__DSOCacheEntry_name.103, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 771
	%struct.DSOCacheEntry {
		i64 4185748872, ; hash 0xf97d7588, from name: libaot-System.Threading.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([31 x i8], [31 x i8]* @__DSOCacheEntry_name.114, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 772
	%struct.DSOCacheEntry {
		i64 4187363747, ; hash 0xf99619a3, from name: libaot-Microsoft.Extensions.FileProviders.Physical
		i8 0, ; ignore
		i8* getelementptr inbounds ([58 x i8], [58 x i8]* @__DSOCacheEntry_name.47, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 773
	%struct.DSOCacheEntry {
		i64 4194414906, ; hash 0xfa01b13a, from name: aot-System.Private.Xml.Linq.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.86, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 774
	%struct.DSOCacheEntry {
		i64 4195517926, ; hash 0xfa1285e6, from name: libaot-Xamarin.GooglePlayServices.Base.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([46 x i8], [46 x i8]* @__DSOCacheEntry_name.29, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 775
	%struct.DSOCacheEntry {
		i64 4198755985, ; hash 0xfa43ee91, from name: aot-Xamarin.AndroidX.CardView
		i8 0, ; ignore
		i8* getelementptr inbounds ([40 x i8], [40 x i8]* @__DSOCacheEntry_name.78, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 776
	%struct.DSOCacheEntry {
		i64 4227031240, ; hash 0xfbf360c8, from name: aot-Xamarin.Facebook.Messenger.Android.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([49 x i8], [49 x i8]* @__DSOCacheEntry_name.12, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 777
	%struct.DSOCacheEntry {
		i64 4231174900, ; hash 0xfc329af4, from name: libaot-Xamarin.Google.Android.DataTransport.TransportApi
		i8 0, ; ignore
		i8* getelementptr inbounds ([64 x i8], [64 x i8]* @__DSOCacheEntry_name.106, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 778
	%struct.DSOCacheEntry {
		i64 4238158203, ; hash 0xfc9d297b, from name: Xamarin.GooglePlayServices.Measurement.Api
		i8 0, ; ignore
		i8* getelementptr inbounds ([57 x i8], [57 x i8]* @__DSOCacheEntry_name.71, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 779
	%struct.DSOCacheEntry {
		i64 4249989576, ; hash 0xfd51b1c8, from name: aot-Xamarin.AndroidX.Window.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([38 x i8], [38 x i8]* @__DSOCacheEntry_name.108, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 780
	%struct.DSOCacheEntry {
		i64 4254568634, ; hash 0xfd9790ba, from name: Xamarin.AndroidX.Navigation.Runtime.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([50 x i8], [50 x i8]* @__DSOCacheEntry_name.16, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 781
	%struct.DSOCacheEntry {
		i64 4264044254, ; hash 0xfe2826de, from name: libaot-System.Runtime.InteropServices
		i8 0, ; ignore
		i8* getelementptr inbounds ([45 x i8], [45 x i8]* @__DSOCacheEntry_name.11, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 782
	%struct.DSOCacheEntry {
		i64 4270991500, ; hash 0xfe92288c, from name: aot-Microsoft.Extensions.Options.dll.so
		i8 0, ; ignore
		i8* getelementptr inbounds ([43 x i8], [43 x i8]* @__DSOCacheEntry_name.83, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 783
	%struct.DSOCacheEntry {
		i64 4280470307, ; hash 0xff22cb23, from name: libaot-System.Text.Encodings.Web
		i8 0, ; ignore
		i8* getelementptr inbounds ([40 x i8], [40 x i8]* @__DSOCacheEntry_name.73, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 784
	%struct.DSOCacheEntry {
		i64 4284549794, ; hash 0xff610aa2, from name: Xamarin.Firebase.Components
		i8 0, ; ignore
		i8* getelementptr inbounds ([42 x i8], [42 x i8]* @__DSOCacheEntry_name.63, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 785
	%struct.DSOCacheEntry {
		i64 4292120959, ; hash 0xffd4917f, from name: Xamarin.AndroidX.Lifecycle.ViewModelSavedState
		i8 0, ; ignore
		i8* getelementptr inbounds ([61 x i8], [61 x i8]* @__DSOCacheEntry_name.72, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 786
	%struct.DSOCacheEntry {
		i64 4294570506, ; hash 0xfff9f20a, from name: libaot-Microsoft.Extensions.DependencyInjection.Abstractions
		i8 0, ; ignore
		i8* getelementptr inbounds ([68 x i8], [68 x i8]* @__DSOCacheEntry_name.51, i32 0, i32 0), ; name
		i8* null; handle
	}, 
	; 787
	%struct.DSOCacheEntry {
		i64 4294648842, ; hash 0xfffb240a, from name: Microsoft.Extensions.FileProviders.Embedded
		i8 0, ; ignore
		i8* getelementptr inbounds ([58 x i8], [58 x i8]* @__DSOCacheEntry_name.77, i32 0, i32 0), ; name
		i8* null; handle
	}
], align 8; end of 'dso_cache' array


; Bundled assembly name buffers, all 0 bytes long
@bundled_assemblies = local_unnamed_addr global [0 x %struct.XamarinAndroidBundledAssembly] zeroinitializer, align 4


; Assembly store individual assembly data
@assembly_store_bundled_assemblies = local_unnamed_addr global [128 x %struct.AssemblyStoreSingleAssemblyRuntimeData] zeroinitializer, align 4

; Assembly store data
@assembly_stores = local_unnamed_addr global [2 x %struct.AssemblyStoreRuntimeData] zeroinitializer, align 4

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 1, !"min_enum_size", i32 4}
!3 = !{!"Xamarin.Android remotes/origin/release/7.0.2xx @ a7e0eff127904fe24804423572ac38864346d200"}
