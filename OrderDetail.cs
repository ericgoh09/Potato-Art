//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Assignment
{
    using System;
    using System.Collections.Generic;
    
    public partial class OrderDetail
    {
        public string OrderID { get; set; }
        public string awID { get; set; }
        public decimal UnitPrice { get; set; }
        public short Quantity { get; set; }
    
        public virtual ArtWork ArtWork { get; set; }
        public virtual order order { get; set; }
    }
}
