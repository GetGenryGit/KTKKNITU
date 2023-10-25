using OperatorApp_Client.MVVMS.Models;
using Blazored.SessionStorage;
using Microsoft.AspNetCore.Components.Authorization;
using System.Security.Claims;

namespace OperatorApp_Client.MVVMS.Services;

public class AuthenticationService : AuthenticationStateProvider
{
    private readonly ISessionStorageService SessionStorage;
    private ClaimsPrincipal errorInformation = new ClaimsPrincipal(new ClaimsIdentity());

    public AuthenticationService(ISessionStorageService sessionStorage)
    {
        SessionStorage = sessionStorage;
    }

    public async Task ActualizerAuthInf(UserDetails? sessionUserDetails)
    {
        ClaimsPrincipal claimsPrincipal;

        if (sessionUserDetails != null)
        {
            claimsPrincipal = new ClaimsPrincipal(new ClaimsIdentity(new List<Claim>
            {
                new Claim(ClaimTypes.Name, sessionUserDetails.FirstName),
                new Claim(ClaimTypes.Role, sessionUserDetails.Role)
            }, "JwtAuth"));

            await SessionStorage.SetStorageItem("sessionUserDetails", sessionUserDetails);
        }
        else
        {
            claimsPrincipal = errorInformation;
            await SessionStorage.RemoveItemAsync("sessionUserDetails");
        }

        NotifyAuthenticationStateChanged(Task.FromResult(new AuthenticationState(claimsPrincipal)));
    }

    public override async Task<AuthenticationState> GetAuthenticationStateAsync()
    {
        var sessionUserDetails = await SessionStorage.GetStorageItem<UserDetails>("sessionUserDetails");

        if (sessionUserDetails == null)
            return await Task.FromResult(new AuthenticationState(errorInformation));

        var claimPrincipal = new ClaimsPrincipal(new ClaimsIdentity(new List<Claim>
        {
            new Claim(ClaimTypes.Name, sessionUserDetails.FirstName),
            new Claim(ClaimTypes.Role, sessionUserDetails.Role)
        }, "JwtAuth"));

        return await Task.FromResult(new AuthenticationState(claimPrincipal));
    }
}
