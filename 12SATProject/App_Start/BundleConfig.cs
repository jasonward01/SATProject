using System.Web.Optimization;

namespace SATProject.UI.MVC
{
    public class BundleConfig
    {
        // For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at http://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.js",
                      "~/Scripts/respond.js"));

            //Main JS 
            bundles.Add(new ScriptBundle("~/Content/").Include(
                      "~/Content/lib/wow/wow.min.js",
                      "~/Content/lib/easing/easing.js",
                      "~/Content/lib/waypoints/waypoints.min.js",
                      "~/Content/lib/owlcarousel/owl.carousel.min.js",
                      "~/Content/js/main.js"
                      ));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/css/bootstrap.min.css",
                      "~/Content/css/Site.css",
                      "~/Content/css/style.css"));

            bundles.Add(new StyleBundle("~/Content/lib").Include(
                      "~/Content/lib/animate/animate.min.css",
                      "~/Content/lib/owlcarousel/assets/owl.carousel.min.css"));


        }
    }
}
