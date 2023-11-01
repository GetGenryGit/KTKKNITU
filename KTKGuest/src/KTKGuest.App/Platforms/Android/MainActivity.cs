using Android;
using Android.App;
using Android.Content;
using Android.Content.PM;
using Android.OS;
using Firebase.Messaging;
using Plugin.Firebase.CloudMessaging;

namespace KTKGuest.App;

[Activity(Theme = "@style/Maui.SplashTheme", MainLauncher = true,
    ConfigurationChanges = ConfigChanges.ScreenSize | ConfigChanges.Orientation | ConfigChanges.UiMode |
                           ConfigChanges.ScreenLayout | ConfigChanges.SmallestScreenSize | ConfigChanges.Density)]
public class MainActivity : MauiAppCompatActivity
{
    protected override void OnCreate(Bundle savedInstanceState)
    {
        base.OnCreate(savedInstanceState);
        HandleIntent(Intent);
        CreateNotificationChannelIfNeeded();
#if DEBUG
        FirebaseMessaging.Instance.SubscribeToTopic("schedule_debug");
#else
        FirebaseMessaging.Instance.SubscribeToTopic("schedule_release");
#endif
    }

    protected override void OnStart()
    {
        base.OnStart();
        const int requestNotification = 0;
        string[] notiPermission =
        {
            Manifest.Permission.PostNotifications
        };

        if ((int)Build.VERSION.SdkInt < 33) return;
        if (CheckSelfPermission(Manifest.Permission.PostNotifications) != Permission.Granted)
        {
            RequestPermissions(notiPermission, requestNotification);
        }


    }

    protected override void OnNewIntent(Intent intent)
    {
        base.OnNewIntent(intent);
        HandleIntent(intent);
    }

    private static void HandleIntent(Intent intent)
    {
        FirebaseCloudMessagingImplementation.OnNewIntent(intent);
    }

    private void CreateNotificationChannelIfNeeded()
    {
        if (Build.VERSION.SdkInt >= BuildVersionCodes.O)
        {
            CreateNotificationChannel();
        }
    }

    private void CreateNotificationChannel()
    {
        var channelId = $"{PackageName}.general";
        var notificationManager = (NotificationManager)GetSystemService(NotificationService);
        var channel = new NotificationChannel(channelId, "General", NotificationImportance.Default);
        notificationManager.CreateNotificationChannel(channel);
        FirebaseCloudMessagingImplementation.ChannelId = channelId;
        // FirebaseCloudMessagingImplementation.SmallIconRef = Resource.Drawable.notify_panel_notification_icon_bg;
    }

}