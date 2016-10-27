using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Routing;
using Microsoft.AspNet.FriendlyUrls;

namespace ASP
{
    public static class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            var settings = new FriendlyUrlSettings();
            settings.AutoRedirectMode = RedirectMode.Permanent;
            routes.EnableFriendlyUrls(settings);
            routes.MapPageRoute("ContactDisplay", "ContactDisplay", "~/Administration/ContactDisplay.aspx");
            routes.MapPageRoute("CustomerDisplay", "CustomerDisplay", "~/Administration/CustomerDisplay.aspx");
            routes.MapPageRoute("CustomerMaintenance", "CustomerMaintenance", "~/Administration/CustomerMaintenance.aspx");
            routes.MapPageRoute("IncidentDisplay", "IncidentDisplay", "~/Administration/IncidentDisplay.aspx");
            routes.MapPageRoute("ProductMaintenance", "ProductMaintenance", "~/Administration/ProductMaintenance.aspx");
            routes.MapPageRoute("TechnicianIncidentSummary", "TechnicianIncidentSummary", "~/Administration/TechnicianIncidentSummary.aspx");
            routes.MapPageRoute("TechnicianMaintenance", "TechnicianMaintenance", "~/Administration/TechnicianMaintenance.aspx");
            routes.MapPageRoute("ProductRegistration", "CustomerSupport_ProductRegistration", "~/ProductRegistration.aspx");
            routes.MapPageRoute("ContactUs", "ContactUs", "~/ContactUs.aspx");
            routes.MapPageRoute("IncidentUpdate", "TechSupport_IncidentUpdate", "~/IncidentUpdate.aspx");
            routes.MapPageRoute("CustomerIncidentDisplay", "TechSupport_CustomerIncidentDisplay", "~/CustomerIncidentDisplay.aspx");
            routes.MapPageRoute("CustomerSupport", "CustomerSupport", "~/CustomerSupport.aspx");
            routes.MapPageRoute("CustomerSurvey", "CustomerSupport_CustomerSurvey", "~/CustomerSurvey.aspx");
            routes.MapPageRoute("SurveyComplete", "SurveyComplete", "~/SurveyComplete.aspx");
            routes.MapPageRoute("TechnicianSupport", "TechnicianSupport", "~/TechnicianSupport.aspx");


        }
    }
}
 