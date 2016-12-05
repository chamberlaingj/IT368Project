using System;
using System.Configuration;

public static class TechSupportDB
{
	public static string GetConnectionString()
	{
        return ConfigurationManager.ConnectionStrings
            ["ConnectionString1"].ConnectionString;
    }
}
