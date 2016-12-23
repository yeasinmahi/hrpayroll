using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web.Mvc;

namespace HrPayroll.Controllers
{
    public class EmployeeController : Controller
    {
        HrEntities hrEntities = new HrEntities();
        //
        // GET: /Employee/
        public ActionResult Get()
        {
            List<Employee> employees = hrEntities.Employees.ToList();
            return View(employees);
        }

        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(Employee employee)
        {
            if (ModelState.IsValid)
            {
                hrEntities.Employees.Add(employee);
                hrEntities.SaveChanges();
                return RedirectToAction("Get");
            }
            return View(employee);
        }
        public ActionResult Edit(int id)
        {
            Employee employee = hrEntities.Employees.Where(x => x.EmpId.Equals(id)).ToList().FirstOrDefault();
            return View(employee);
        }
        [HttpPost]
        public ActionResult Edit(Employee employee)
        {
            if (ModelState.IsValid)
            {
                hrEntities.Employees.AddOrUpdate(employee);
                hrEntities.SaveChanges();
                return RedirectToAction("Get");
            }
            return View(employee);
        }
        public ActionResult Delete(int id)
        {
            Employee employee = hrEntities.Employees.Where(x => x.EmpId.Equals(id)).ToList().FirstOrDefault();
            hrEntities.Employees.Remove(employee);
            hrEntities.SaveChanges();
            return RedirectToAction("Get");
        }
    }
}