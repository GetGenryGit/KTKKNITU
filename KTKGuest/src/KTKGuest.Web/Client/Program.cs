using Blazored.LocalStorage;
using Microsoft.AspNetCore.Components.Web;
using Microsoft.AspNetCore.Components.WebAssembly.Hosting;
using KTKGuest.WebComponents;
using KTKGuest.WebComponents.Services;
using Blazored.SessionStorage;

var builder = WebAssemblyHostBuilder.CreateDefault(args);
builder.RootComponents.Add<App>("#app");
builder.RootComponents.Add<HeadOutlet>("head::after");

builder.Services.AddTransient<IHttpService, HttpService>();
builder.Services.AddBlazoredLocalStorage();
builder.Services.AddScoped<IToastService, ToastService>();
builder.Services.AddBlazoredSessionStorage();


await builder.Build().RunAsync();