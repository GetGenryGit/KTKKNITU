using Blazored.LocalStorage;
using Microsoft.AspNetCore.Components.Web;
using Microsoft.AspNetCore.Components.WebAssembly.Hosting;
using KTKGuest.WebComponents;
using KTKGuest.WebComponents.Services;

var builder = WebAssemblyHostBuilder.CreateDefault(args);
builder.RootComponents.Add<App>("#app");
builder.RootComponents.Add<HeadOutlet>("head::after");

builder.Services.AddTransient<IHttpService, HttpService>();
builder.Services.AddBlazoredLocalStorage();
builder.Services.AddScoped<IToastService, ToastService>();

await builder.Build().RunAsync();