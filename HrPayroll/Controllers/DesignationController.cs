using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HrPayroll.Models;

namespace HrPayroll.Controllers
{
    public class DesignationController : Controller
    {
        HrEntities hrEntities = new HrEntities();
        //
        // GET: /Designation/
        public ActionResult Index()
        {
            List<Designation> designations = hrEntities.Designations.ToList();
            return View(designations);
        }
        public ActionResult Create()
        {
            List<Department> departments = hrEntities.Departments.ToList();
            ViewBag.DepartmentCode = departments;
            return View();
        }
        [HttpPost]
        public ActionResult Create(Designation designation)
        {
            if (ModelState.IsValid)
            {
                hrEntities.Designations.Add(designation);
                hrEntities.SaveChanges();
                return RedirectToAction("Index");
            }
            hrEntities.Designations.Add(designation);
            hrEntities.SaveChanges();
            return View(designation);
        }
        public ActionResult Edit(string id)
        {
            Designation designation = hrEntities.Designations.Where(x => x.DesignationCode.Equals(id)).ToList().FirstOrDefault();
            return View(designation); 
        }
        [HttpPost]
        public ActionResult Edit(Designation designation)
        {
            if (ModelState.IsValid)
            {
                hrEntities.Designations.AddOrUpdate(designation);
                hrEntities.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(designation);
        }
        public ActionResult Delete(string id)
        {
            Designation designation = hrEntities.Designations.Where(x => x.DesignationCode.Equals(id)).ToList().FirstOrDefault();
            hrEntities.Designations.Remove(designation);
            return RedirectToAction("Index");
        }
	}
}