using Microsoft.Owin.Security;
using Microsoft.Owin.Security.Cookies;
using Microsoft.Owin.Security.DataHandler;
using Microsoft.Owin.Security.DataProtection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Security.Principal;
using System.Web;

namespace TLindst9.ADFSWebApp.Helpers
{
    public static class IdentityHelper
    {
        public static IPrincipal GetCurrentClaimsPrincipal()
        {
            var ticket = GetAuthenticationKeyTicket();
            IPrincipal p = null;
            if (ticket != null && ticket.Identity != null)
                p = new ClaimsPrincipal(ticket.Identity);
            return p;
        }

        public static IEnumerable<Claim> GetClaimsForCurrentUser()
        {
            var identity = GetAuthTokenForCurrentUser();
            if (identity != null)
                return GetAuthTokenForCurrentUser().Claims;
            return null;
        }

        public static ClaimsIdentity GetAuthTokenForCurrentUser()
        {
            AuthenticationTicket ticket = GetAuthenticationKeyTicket();
            if (ticket != null)
                return ticket.Identity;
            return null;
        }

        public static AuthenticationTicket GetAuthenticationKeyTicket()
        {
            AuthenticationTicket ticket = null;

            var ctx = HttpContext.Current.Request;
            if (ctx.Cookies != null && ctx.Cookies[".AspNet.Cookies"] != null)
            {
                var cookie = ctx.Cookies[".AspNet.Cookies"];
                var secureDataFormat = new TicketDataFormat(new MachineKeyProtector());
                ticket = secureDataFormat.Unprotect(cookie.Value);
            }
            return ticket;
        }
    }

    internal class MachineKeyProtector : IDataProtector
    {
        private readonly string[] _purpose =
        {
         typeof(CookieAuthenticationMiddleware).FullName,
            CookieAuthenticationDefaults.AuthenticationType,
            "v1"
        };

        public byte[] Protect(byte[] userData)
        {
            return System.Web.Security.MachineKey.Protect(userData, _purpose);
        }

        public byte[] Unprotect(byte[] protectedData)
        {
            return System.Web.Security.MachineKey.Unprotect(protectedData, _purpose);
        }
    }
}