﻿using System.Web;
using System.Web.Mvc;

namespace TLindst9.ADFSWebApp
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
