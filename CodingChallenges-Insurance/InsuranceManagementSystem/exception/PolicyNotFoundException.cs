using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InsuranceManagementSystem.exception
{
    public class PolicyNotFoundException : ApplicationException
    {
        public PolicyNotFoundException() : base("Policy not found with the specified ID.")
        {
        }

        public PolicyNotFoundException(string message) : base(message)
        {
        }
    }
}
