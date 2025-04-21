using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;
using System.Threading.Tasks;

namespace InsuranceManagementSystem.util
{
    public static class DBPropertyUtil
    {
        public static string GetConnectionString(string propertyFileName)
        {
            return ConfigurationManager.ConnectionStrings["InsuranceDB"].ConnectionString;
        }
    }

}
