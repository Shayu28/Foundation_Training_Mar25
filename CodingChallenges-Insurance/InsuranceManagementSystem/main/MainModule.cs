using InsuranceManagementSystem.dao;
using InsuranceManagementSystem.entity;
using InsuranceManagementSystem.exception;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InsuranceManagementSystem.main
{
    public class MainModule
    {
        private static IPolicyService policyService = new PolicyServiceImpl();

        public static void Main(string[] args)
        {
            Console.WriteLine("Insurance Management System");
            Console.WriteLine("--------------------------");

            bool exit = false;
            while (!exit)
            {
                Console.WriteLine("\nMenu:");
                Console.WriteLine("1. Create Policy");
                Console.WriteLine("2. Get Policy by ID");
                Console.WriteLine("3. Get All Policies");
                Console.WriteLine("4. Update Policy");
                Console.WriteLine("5. Delete Policy");
                Console.WriteLine("6. Exit");
                Console.Write("Enter your choice: ");

                try
                {
                    int choice = Convert.ToInt32(Console.ReadLine());

                    switch (choice)
                    {
                        case 1:
                            CreatePolicyMenu();
                            break;
                        case 2:
                            GetPolicyMenu();
                            break;
                        case 3:
                            GetAllPoliciesMenu();
                            break;
                        case 4:
                            UpdatePolicyMenu();
                            break;
                        case 5:
                            DeletePolicyMenu();
                            break;
                        case 6:
                            exit = true;
                            Console.WriteLine("Exiting the system...");
                            break;
                        default:
                            Console.WriteLine("Invalid choice. Please try again.");
                            break;
                    }
                }
                catch (FormatException)
                {
                    Console.WriteLine("Invalid input. Please enter a number.");
                }
                catch (PolicyNotFoundException ex)
                {
                    Console.WriteLine($"Error: {ex.Message}");
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"An error occurred: {ex.Message}");
                }
            }
        }

        private static void CreatePolicyMenu()
        {
            Console.WriteLine("\nCreate New Policy");
            Console.WriteLine("----------------");

            Console.Write("Enter Policy Name: ");
            string name = Console.ReadLine();

            Console.Write("Enter Policy Type: ");
            string type = Console.ReadLine();

            Console.Write("Enter Coverage Amount: ");
            decimal coverage = Convert.ToDecimal(Console.ReadLine());

            Console.Write("Enter Premium Amount: ");
            decimal premium = Convert.ToDecimal(Console.ReadLine());

            Console.Write("Enter Start Date (yyyy-mm-dd): ");
            DateTime startDate = DateTime.Parse(Console.ReadLine());

            Console.Write("Enter End Date (yyyy-mm-dd): ");
            DateTime endDate = DateTime.Parse(Console.ReadLine());

            Policy newPolicy = new Policy(0, name, type, coverage, premium, startDate, endDate);

            bool success = policyService.CreatePolicy(newPolicy);
            if (success)
            {
                Console.WriteLine("Policy created successfully!");
            }
            else
            {
                Console.WriteLine("Failed to create policy.");
            }
        }

        private static void GetPolicyMenu()
        {
            Console.WriteLine("\nGet Policy by ID");
            Console.WriteLine("----------------");

            Console.Write("Enter Policy ID: ");
            int id = Convert.ToInt32(Console.ReadLine());

            Policy policy = policyService.GetPolicy(id);
            Console.WriteLine("\nPolicy Details:");
            Console.WriteLine(policy);
        }

        private static void GetAllPoliciesMenu()
        {
            Console.WriteLine("\nAll Policies");
            Console.WriteLine("------------");

            List<Policy> policies = policyService.GetAllPolicies();
            if (policies.Count == 0)
            {
                Console.WriteLine("No policies found.");
            }
            else
            {
                foreach (var policy in policies)
                {
                    Console.WriteLine(policy);
                    Console.WriteLine("---------------------");
                }
            }
        }

        private static void UpdatePolicyMenu()
        {
            Console.WriteLine("\nUpdate Policy");
            Console.WriteLine("-------------");

            Console.Write("Enter Policy ID to update: ");
            int id = Convert.ToInt32(Console.ReadLine());

            // First get the existing policy to show current values
            Policy existingPolicy;
            try
            {
                existingPolicy = policyService.GetPolicy(id);
                Console.WriteLine("\nCurrent Policy Details:");
                Console.WriteLine(existingPolicy);
            }
            catch (PolicyNotFoundException)
            {
                Console.WriteLine($"Policy with ID {id} not found.");
                return;
            }

            Console.WriteLine("\nEnter new details (leave blank to keep current value):");

            Console.Write($"Policy Name [{existingPolicy.PolicyName}]: ");
            string name = Console.ReadLine();
            if (string.IsNullOrWhiteSpace(name)) name = existingPolicy.PolicyName;

            Console.Write($"Policy Type [{existingPolicy.PolicyType}]: ");
            string type = Console.ReadLine();
            if (string.IsNullOrWhiteSpace(type)) type = existingPolicy.PolicyType;

            Console.Write($"Coverage Amount [{existingPolicy.CoverageAmount}]: ");
            string coverageInput = Console.ReadLine();
            decimal coverage = string.IsNullOrWhiteSpace(coverageInput) ?
                existingPolicy.CoverageAmount : Convert.ToDecimal(coverageInput);

            Console.Write($"Premium Amount [{existingPolicy.PremiumAmount}]: ");
            string premiumInput = Console.ReadLine();
            decimal premium = string.IsNullOrWhiteSpace(premiumInput) ?
                existingPolicy.PremiumAmount : Convert.ToDecimal(premiumInput);

            Console.Write($"Start Date [{existingPolicy.StartDate.ToShortDateString()}]: ");
            string startDateInput = Console.ReadLine();
            DateTime startDate = string.IsNullOrWhiteSpace(startDateInput) ?
                existingPolicy.StartDate : DateTime.Parse(startDateInput);

            Console.Write($"End Date [{existingPolicy.EndDate.ToShortDateString()}]: ");
            string endDateInput = Console.ReadLine();
            DateTime endDate = string.IsNullOrWhiteSpace(endDateInput) ?
                existingPolicy.EndDate : DateTime.Parse(endDateInput);

            Policy updatedPolicy = new Policy(id, name, type, coverage, premium, startDate, endDate);

            bool success = policyService.UpdatePolicy(updatedPolicy);
            if (success)
            {
                Console.WriteLine("Policy updated successfully!");
            }
            else
            {
                Console.WriteLine("Failed to update policy.");
            }
        }

        private static void DeletePolicyMenu()
        {
            Console.WriteLine("\nDelete Policy");
            Console.WriteLine("-------------");

            Console.Write("Enter Policy ID to delete: ");
            int id = Convert.ToInt32(Console.ReadLine());

            Console.Write($"Are you sure you want to delete policy with ID {id}? (y/n): ");
            string confirmation = Console.ReadLine().ToLower();

            if (confirmation == "y")
            {
                bool success = policyService.DeletePolicy(id);
                if (success)
                {
                    Console.WriteLine("Policy deleted successfully!");
                }
                else
                {
                    Console.WriteLine("Failed to delete policy.");
                }
            }
            else
            {
                Console.WriteLine("Deletion cancelled.");
            }
        }
    }
}
