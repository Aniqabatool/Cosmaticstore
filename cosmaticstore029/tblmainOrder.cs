//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace cosmaticstore029
{
    using System;
    using System.Collections.Generic;
    
    public partial class tblmainOrder
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tblmainOrder()
        {
            this.orderdetails = new HashSet<orderdetail>();
        }
    
        public int orderMainid { get; set; }
        public string orderMainname { get; set; }
        public string orderMainEmail { get; set; }
        public string orderMainphoneno { get; set; }
        public string orderMainaddress { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<orderdetail> orderdetails { get; set; }
    }
}
