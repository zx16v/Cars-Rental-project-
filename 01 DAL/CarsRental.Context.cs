﻿//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Shim_Cars
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Objects;
    using System.Data.Objects.DataClasses;
    using System.Linq;
    
    public partial class CarsRentalEntities : DbContext
    {
        public CarsRentalEntities()
            : base("name=CarsRentalEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<Car> Cars { get; set; }
        public DbSet<CarsModel> CarsModels { get; set; }
        public DbSet<CarsRental> CarsRentals { get; set; }
        public DbSet<Manufacturer> Manufacturers { get; set; }
        public DbSet<Role> Roles { get; set; }
        public DbSet<sysdiagram> sysdiagrams { get; set; }
        public DbSet<User> Users { get; set; }
    
        [EdmFunction("CarsRentalEntities", "SearchRentedCarsByDateRange")]
        public virtual IQueryable<SearchRentedCarsByDateRange_Result> SearchRentedCarsByDateRange(Nullable<System.DateTime> beginDate, Nullable<System.DateTime> endDate)
        {
            var beginDateParameter = beginDate.HasValue ?
                new ObjectParameter("BeginDate", beginDate) :
                new ObjectParameter("BeginDate", typeof(System.DateTime));
    
            var endDateParameter = endDate.HasValue ?
                new ObjectParameter("EndDate", endDate) :
                new ObjectParameter("EndDate", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.CreateQuery<SearchRentedCarsByDateRange_Result>("[CarsRentalEntities].[SearchRentedCarsByDateRange](@BeginDate, @EndDate)", beginDateParameter, endDateParameter);
        }
    
        public virtual ObjectResult<GetAvailableCars_Result> GetAvailableCars(Nullable<System.DateTime> desiredStartDate, Nullable<System.DateTime> desiredEndDate, Nullable<int> makeID, Nullable<int> modelCode, Nullable<bool> gearType)
        {
            var desiredStartDateParameter = desiredStartDate.HasValue ?
                new ObjectParameter("desiredStartDate", desiredStartDate) :
                new ObjectParameter("desiredStartDate", typeof(System.DateTime));
    
            var desiredEndDateParameter = desiredEndDate.HasValue ?
                new ObjectParameter("desiredEndDate", desiredEndDate) :
                new ObjectParameter("desiredEndDate", typeof(System.DateTime));
    
            var makeIDParameter = makeID.HasValue ?
                new ObjectParameter("MakeID", makeID) :
                new ObjectParameter("MakeID", typeof(int));
    
            var modelCodeParameter = modelCode.HasValue ?
                new ObjectParameter("ModelCode", modelCode) :
                new ObjectParameter("ModelCode", typeof(int));
    
            var gearTypeParameter = gearType.HasValue ?
                new ObjectParameter("GearType", gearType) :
                new ObjectParameter("GearType", typeof(bool));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<GetAvailableCars_Result>("GetAvailableCars", desiredStartDateParameter, desiredEndDateParameter, makeIDParameter, modelCodeParameter, gearTypeParameter);
        }
    
        public virtual ObjectResult<GetAvailableCarsByModels_Result> GetAvailableCarsByModels(Nullable<System.DateTime> desiredStartDate, Nullable<System.DateTime> desiredEndDate, Nullable<int> makeID, Nullable<int> modelCode, Nullable<bool> gearType)
        {
            var desiredStartDateParameter = desiredStartDate.HasValue ?
                new ObjectParameter("desiredStartDate", desiredStartDate) :
                new ObjectParameter("desiredStartDate", typeof(System.DateTime));
    
            var desiredEndDateParameter = desiredEndDate.HasValue ?
                new ObjectParameter("desiredEndDate", desiredEndDate) :
                new ObjectParameter("desiredEndDate", typeof(System.DateTime));
    
            var makeIDParameter = makeID.HasValue ?
                new ObjectParameter("MakeID", makeID) :
                new ObjectParameter("MakeID", typeof(int));
    
            var modelCodeParameter = modelCode.HasValue ?
                new ObjectParameter("ModelCode", modelCode) :
                new ObjectParameter("ModelCode", typeof(int));
    
            var gearTypeParameter = gearType.HasValue ?
                new ObjectParameter("GearType", gearType) :
                new ObjectParameter("GearType", typeof(bool));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<GetAvailableCarsByModels_Result>("GetAvailableCarsByModels", desiredStartDateParameter, desiredEndDateParameter, makeIDParameter, modelCodeParameter, gearTypeParameter);
        }
    
        public virtual ObjectResult<GetAvailableCarsColumn_Result> GetAvailableCarsColumn(Nullable<System.DateTime> desiredStartDate, Nullable<System.DateTime> desiredEndDate)
        {
            var desiredStartDateParameter = desiredStartDate.HasValue ?
                new ObjectParameter("desiredStartDate", desiredStartDate) :
                new ObjectParameter("desiredStartDate", typeof(System.DateTime));
    
            var desiredEndDateParameter = desiredEndDate.HasValue ?
                new ObjectParameter("desiredEndDate", desiredEndDate) :
                new ObjectParameter("desiredEndDate", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<GetAvailableCarsColumn_Result>("GetAvailableCarsColumn", desiredStartDateParameter, desiredEndDateParameter);
        }
    
        public virtual ObjectResult<GetCars_Result> GetCars()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<GetCars_Result>("GetCars");
        }
    
        public virtual ObjectResult<GetCarsModelByMaker_Result> GetCarsModelByMaker(Nullable<int> makerID)
        {
            var makerIDParameter = makerID.HasValue ?
                new ObjectParameter("MakerID", makerID) :
                new ObjectParameter("MakerID", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<GetCarsModelByMaker_Result>("GetCarsModelByMaker", makerIDParameter);
        }
    
        public virtual ObjectResult<GetUnicAvailableCars_Result> GetUnicAvailableCars(Nullable<System.DateTime> desiredStartDate, Nullable<System.DateTime> desiredEndDate, Nullable<int> makeID, Nullable<int> modelCode, Nullable<bool> gearType)
        {
            var desiredStartDateParameter = desiredStartDate.HasValue ?
                new ObjectParameter("desiredStartDate", desiredStartDate) :
                new ObjectParameter("desiredStartDate", typeof(System.DateTime));
    
            var desiredEndDateParameter = desiredEndDate.HasValue ?
                new ObjectParameter("desiredEndDate", desiredEndDate) :
                new ObjectParameter("desiredEndDate", typeof(System.DateTime));
    
            var makeIDParameter = makeID.HasValue ?
                new ObjectParameter("MakeID", makeID) :
                new ObjectParameter("MakeID", typeof(int));
    
            var modelCodeParameter = modelCode.HasValue ?
                new ObjectParameter("ModelCode", modelCode) :
                new ObjectParameter("ModelCode", typeof(int));
    
            var gearTypeParameter = gearType.HasValue ?
                new ObjectParameter("GearType", gearType) :
                new ObjectParameter("GearType", typeof(bool));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<GetUnicAvailableCars_Result>("GetUnicAvailableCars", desiredStartDateParameter, desiredEndDateParameter, makeIDParameter, modelCodeParameter, gearTypeParameter);
        }
    
        public virtual ObjectResult<string> nulltest(string rmk)
        {
            var rmkParameter = rmk != null ?
                new ObjectParameter("rmk", rmk) :
                new ObjectParameter("rmk", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<string>("nulltest", rmkParameter);
        }
    
        public virtual int RentOrder(Nullable<System.DateTime> desiredStartDate, Nullable<System.DateTime> desiredEndDate, Nullable<int> carNumber, Nullable<int> userIdCode)
        {
            var desiredStartDateParameter = desiredStartDate.HasValue ?
                new ObjectParameter("desiredStartDate", desiredStartDate) :
                new ObjectParameter("desiredStartDate", typeof(System.DateTime));
    
            var desiredEndDateParameter = desiredEndDate.HasValue ?
                new ObjectParameter("desiredEndDate", desiredEndDate) :
                new ObjectParameter("desiredEndDate", typeof(System.DateTime));
    
            var carNumberParameter = carNumber.HasValue ?
                new ObjectParameter("CarNumber", carNumber) :
                new ObjectParameter("CarNumber", typeof(int));
    
            var userIdCodeParameter = userIdCode.HasValue ?
                new ObjectParameter("UserIdCode", userIdCode) :
                new ObjectParameter("UserIdCode", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("RentOrder", desiredStartDateParameter, desiredEndDateParameter, carNumberParameter, userIdCodeParameter);
        }
    
        public virtual ObjectResult<SearchCar_Result> SearchCar(Nullable<System.DateTime> beginDate, Nullable<System.DateTime> endDate, Nullable<int> makerID, Nullable<int> modelCode)
        {
            var beginDateParameter = beginDate.HasValue ?
                new ObjectParameter("BeginDate", beginDate) :
                new ObjectParameter("BeginDate", typeof(System.DateTime));
    
            var endDateParameter = endDate.HasValue ?
                new ObjectParameter("EndDate", endDate) :
                new ObjectParameter("EndDate", typeof(System.DateTime));
    
            var makerIDParameter = makerID.HasValue ?
                new ObjectParameter("MakerID", makerID) :
                new ObjectParameter("MakerID", typeof(int));
    
            var modelCodeParameter = modelCode.HasValue ?
                new ObjectParameter("ModelCode", modelCode) :
                new ObjectParameter("ModelCode", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SearchCar_Result>("SearchCar", beginDateParameter, endDateParameter, makerIDParameter, modelCodeParameter);
        }
    
        public virtual int sp_alterdiagram(string diagramname, Nullable<int> owner_id, Nullable<int> version, byte[] definition)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            var versionParameter = version.HasValue ?
                new ObjectParameter("version", version) :
                new ObjectParameter("version", typeof(int));
    
            var definitionParameter = definition != null ?
                new ObjectParameter("definition", definition) :
                new ObjectParameter("definition", typeof(byte[]));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_alterdiagram", diagramnameParameter, owner_idParameter, versionParameter, definitionParameter);
        }
    
        public virtual int sp_creatediagram(string diagramname, Nullable<int> owner_id, Nullable<int> version, byte[] definition)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            var versionParameter = version.HasValue ?
                new ObjectParameter("version", version) :
                new ObjectParameter("version", typeof(int));
    
            var definitionParameter = definition != null ?
                new ObjectParameter("definition", definition) :
                new ObjectParameter("definition", typeof(byte[]));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_creatediagram", diagramnameParameter, owner_idParameter, versionParameter, definitionParameter);
        }
    
        public virtual int sp_dropdiagram(string diagramname, Nullable<int> owner_id)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_dropdiagram", diagramnameParameter, owner_idParameter);
        }
    
        public virtual ObjectResult<sp_helpdiagramdefinition_Result> sp_helpdiagramdefinition(string diagramname, Nullable<int> owner_id)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_helpdiagramdefinition_Result>("sp_helpdiagramdefinition", diagramnameParameter, owner_idParameter);
        }
    
        public virtual ObjectResult<sp_helpdiagrams_Result> sp_helpdiagrams(string diagramname, Nullable<int> owner_id)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_helpdiagrams_Result>("sp_helpdiagrams", diagramnameParameter, owner_idParameter);
        }
    
        public virtual int sp_renamediagram(string diagramname, Nullable<int> owner_id, string new_diagramname)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            var new_diagramnameParameter = new_diagramname != null ?
                new ObjectParameter("new_diagramname", new_diagramname) :
                new ObjectParameter("new_diagramname", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_renamediagram", diagramnameParameter, owner_idParameter, new_diagramnameParameter);
        }
    
        public virtual int sp_upgraddiagrams()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_upgraddiagrams");
        }
    }
}