using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(_12SATProject.Startup))]
namespace _12SATProject
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
