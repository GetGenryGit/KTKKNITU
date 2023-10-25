namespace OperatorApp_Client
{
    public partial class App : Application
    {
        public App()
        {
            InitializeComponent();

            MainPage = new MainPage();
        }
        protected override Window CreateWindow(IActivationState activationState)
        {
            Window window = base.CreateWindow(activationState);
            window.Activated += Window_Activated;
            return window;
        }

        private async void Window_Activated(object sender, EventArgs e)
        {

            await Task.Delay(0);
#if DEBUG

#else
#if WINDOWS
    const int MinWidth = 1024;
    const int MinHeight = 772;

    var window = sender as Window;

    // change window size.
    window.MinimumWidth = MinWidth;
    window.MinimumHeight = MinHeight;

    // give it some time to complete window resizing task.
    await window.Dispatcher.DispatchAsync(() => { });

    var disp = DeviceDisplay.Current.MainDisplayInfo;

    // move to screen center
    /*window.X = (disp.Width / disp.Density - window.Width) / 2;
    window.Y = (disp.Height / disp.Density - window.Height) / 2;*/
#endif
#endif

        }
    }
}