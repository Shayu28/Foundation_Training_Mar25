﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InsuranceManagementSystem.entity
{
    public class Client
    {
        public int ClientId { get; set; }
        public string ClientName { get; set; }
        public string ContactInfo { get; set; }
        public int PolicyId { get; set; }

        public Client() { }

        public Client(int clientId, string clientName, string contactInfo, int policyId)
        {
            ClientId = clientId;
            ClientName = clientName;
            ContactInfo = contactInfo;
            PolicyId = policyId;
        }

        public override string ToString()
        {
            return $"Client ID: {ClientId}, Name: {ClientName}, Contact: {ContactInfo}, Policy ID: {PolicyId}";
        }
    }
}
