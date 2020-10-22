using System;
using System.Threading.Tasks;
using Microsoft.Owin;
using Owin;

namespace TLindst9.ADFSWebApp
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
