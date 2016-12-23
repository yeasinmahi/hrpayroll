using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web.Mvc;
using HrPayroll.Models;

namespace HrPayroll.Controllers
{
    public class DepartmentController : Controller
    {
        HrEntities hrEntities = new HrEntities();
        //
        // GET: /Department/
        public ActionResult Index()
        {
            List<Department> departments = hrEntities.Departments.ToList();
            return View(departments);
        }
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(Department department)
        {
            if (ModelState.IsValid)
            {
                hrEntities.Departments.Add(department);
                hrEntities.SaveChanges();
                return RedirectToAction("Index");
            }
            hrEntities.Departments.Add(department);
            hrEntities.SaveChanges();
            return View(department);
        }
        public ActionResult Edit(int id)
        {
            Department department = hrEntities.Departments.Where(x => x.DeptId.Equals(id)).ToList().FirstOrDefault();
            return View(department);
        }
        [HttpPost]
        public ActionResult Edit(Department department)
        {
            if (ModelState.IsValid)
            {
                hrEntities.Departments.AddOrUpdate(department);
                hrEntities.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(department);
        }
        public ActionResult Delete(int id)
        {
            Department department = hrEntities.Departments.Where(x => x.DeptId.Equals(id)).ToList().FirstOrDefault();
            hrEntities.Departments.Remove(department);
            return RedirectToAction("Index");
        }
	}
}