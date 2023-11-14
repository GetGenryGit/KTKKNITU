using Blazored.SessionStorage;
using KTKAdmin.Models;
using Microsoft.AspNetCore.Components.Authorization;
using System.Security.Claims;
using System.Text.Json;

namespace KTKAdmin.Services;

public class AuthenticationService : AuthenticationStateProvider
{
    private readonly ISessionStorageService sessionStorage;

    public AuthenticationService(ISessionStorageService SessionStorage)
    {
        sessionStorage = SessionStorage;
    }

    private ClaimsPrincipal errorInformation = new ClaimsPrincipal(new ClaimsIdentity());

    public async Task ActualizerAuthInf(UserDetails? sessionUserDetails)
    {
        ClaimsPrincipal claimsPrincipal;

        if (sessionUserDetails != null)
        {
            claimsPrincipal = new ClaimsPrincipal(new ClaimsIdentity(new List<Claim>
            {
                new Claim(ClaimTypes.Name, sessionUserDetails.Login),
                new Claim(ClaimTypes.Role, sessionUserDetails.Role)
            }, "JwtAuth"));

            await sessionStorage.SetItemAsStringAsync("sessionUserDetails", JsonSerializer.Serialize(sessionUserDetails));
        }
        else
        {
            claimsPrincipal = errorInformation;
            await sessionStorage.RemoveItemAsync("sessionUserDetails");
        }

        NotifyAuthenticationStateChanged(Task.FromResult(new AuthenticationState(claimsPrincipal)));
    }

    public override async Task<AuthenticationState> GetAuthenticationStateAsync()
    {
        var sessionUserDetails = await sessionStorage.GetItemAsync<UserDetails>("sessionUserDetails");

        if (sessionUserDetails == null)
            return await Task.FromResult(new AuthenticationState(errorInformation));

        var claimPrincipal = new ClaimsPrincipal(new ClaimsIdentity(new List<Claim>
        {
            new Claim(ClaimTypes.Name, sessionUserDetails.Login),
            new Claim(ClaimTypes.Role, sessionUserDetails.Role)
        }, "JwtAuth"));

        return await Task.FromResult(new AuthenticationState(claimPrincipal));
    }
}
