using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InsuranceManagementSystem.entity
{
    public class Policy
    {
        public int PolicyId { get; set; }
        public string PolicyName { get; set; }
        public string PolicyType { get; set; }
        public decimal CoverageAmount { get; set; }
        public decimal PremiumAmount { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }

        public Policy() { }

        public Policy(int policyId, string policyName, string policyType, decimal coverageAmount,
                     decimal premiumAmount, DateTime startDate, DateTime endDate)
        {
            PolicyId = policyId;
            PolicyName = policyName;
            PolicyType = policyType;
            CoverageAmount = coverageAmount;
            PremiumAmount = premiumAmount;
            StartDate = startDate;
            EndDate = endDate;
        }

        public override string ToString()
        {
            return $"Policy ID: {PolicyId}, Name: {PolicyName}, Type: {PolicyType}, " +
                   $"Coverage: {CoverageAmount}, Premium: {PremiumAmount}, " +
                   $"Period: {StartDate.ToShortDateString()} to {EndDate.ToShortDateString()}";
        }
    }
}
