using InsuranceManagementSystem.entity;
using InsuranceManagementSystem.exception;
using InsuranceManagementSystem.util;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InsuranceManagementSystem.dao
{
    public class PolicyServiceImpl : IPolicyService
    {
        private string connectionString;

        public PolicyServiceImpl()
        {
            connectionString = DBPropertyUtil.GetConnectionString("database.properties");
        }

        public bool CreatePolicy(Policy policy)
        {
            using (SqlConnection connection = DBConnUtil.GetConnection(connectionString))
            {
                string query = "INSERT INTO Policy (policyName, policyType, coverageAmount, premiumAmount, startDate, endDate) " +
                               "VALUES (@PolicyName, @PolicyType, @CoverageAmount, @PremiumAmount, @StartDate, @EndDate)";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@PolicyName", policy.PolicyName);
                    command.Parameters.AddWithValue("@PolicyType", policy.PolicyType);
                    command.Parameters.AddWithValue("@CoverageAmount", policy.CoverageAmount);
                    command.Parameters.AddWithValue("@PremiumAmount", policy.PremiumAmount);
                    command.Parameters.AddWithValue("@StartDate", policy.StartDate);
                    command.Parameters.AddWithValue("@EndDate", policy.EndDate);

                    connection.Open();
                    int rowsAffected = command.ExecuteNonQuery();
                    return rowsAffected > 0;
                }
            }
        }

        public Policy GetPolicy(int policyId)
        {
            string connectionString = DBPropertyUtil.GetConnectionString("database.properties");

            using (SqlConnection connection = DBConnUtil.GetConnection(connectionString))
            {
                string query = "SELECT * FROM Policy WHERE policyId = @PolicyId";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@PolicyId", policyId);

                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            return new Policy(
                                Convert.ToInt32(reader["policyId"]),
                                reader["policyName"].ToString(),
                                reader["policyType"].ToString(),
                                Convert.ToDecimal(reader["coverageAmount"]),
                                Convert.ToDecimal(reader["premiumAmount"]),
                                Convert.ToDateTime(reader["startDate"]),
                                Convert.ToDateTime(reader["endDate"])
                            );
                        }
                        else
                        {
                            throw new PolicyNotFoundException();
                        }
                    }
                }
            }
        }

        public List<Policy> GetAllPolicies()
        {
            List<Policy> policies = new List<Policy>();

            using (SqlConnection connection = DBConnUtil.GetConnection(connectionString))
            {
                string query = "SELECT * FROM Policy";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            policies.Add(new Policy(
                                Convert.ToInt32(reader["policyId"]),
                                reader["policyName"].ToString(),
                                reader["policyType"].ToString(),
                                Convert.ToDecimal(reader["coverageAmount"]),
                                Convert.ToDecimal(reader["premiumAmount"]),
                                Convert.ToDateTime(reader["startDate"]),
                                Convert.ToDateTime(reader["endDate"])
                            ));
                        }
                    }
                }
            }

            return policies;
        }

        public bool UpdatePolicy(Policy policy)
        {
            using (SqlConnection connection = DBConnUtil.GetConnection(connectionString))
            {
                string query = "UPDATE Policy SET policyName = @PolicyName, policyType = @PolicyType, " +
                               "coverageAmount = @CoverageAmount, premiumAmount = @PremiumAmount, " +
                               "startDate = @StartDate, endDate = @EndDate WHERE policyId = @PolicyId";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@PolicyName", policy.PolicyName);
                    command.Parameters.AddWithValue("@PolicyType", policy.PolicyType);
                    command.Parameters.AddWithValue("@CoverageAmount", policy.CoverageAmount);
                    command.Parameters.AddWithValue("@PremiumAmount", policy.PremiumAmount);
                    command.Parameters.AddWithValue("@StartDate", policy.StartDate);
                    command.Parameters.AddWithValue("@EndDate", policy.EndDate);
                    command.Parameters.AddWithValue("@PolicyId", policy.PolicyId);

                    connection.Open();
                    int rowsAffected = command.ExecuteNonQuery();
                    return rowsAffected > 0;
                }
            }
        }

        public bool DeletePolicy(int policyId)
        {
            using (SqlConnection connection = DBConnUtil.GetConnection(connectionString))
            {
                string query = "DELETE FROM Policy WHERE policyId = @PolicyId";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@PolicyId", policyId);

                    connection.Open();
                    int rowsAffected = command.ExecuteNonQuery();

                    if (rowsAffected == 0)
                    {
                        throw new PolicyNotFoundException();
                    }

                    return rowsAffected > 0;
                }
            }
        }
    }
}
