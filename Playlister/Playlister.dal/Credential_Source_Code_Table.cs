//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Playlister.dal
{
    using System;
    using System.Collections.Generic;
    
    public partial class Credential_Source_Code_Table
    {
        public Credential_Source_Code_Table()
        {
            this.User_Credentials = new HashSet<User_Credential>();
        }
    
        public int Credential_Source_Code { get; set; }
        public string Credential_Source { get; set; }
        public string Credential_Description { get; set; }
    
        public virtual ICollection<User_Credential> User_Credentials { get; set; }
    }
}
