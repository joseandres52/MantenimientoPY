using MantenimientoPY.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MantenimientoPY.Controllers
{
    public class HomeController : Controller
    {
        private ProtectEntities db = new ProtectEntities();
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        [HttpPost]
        public ActionResult Login(string correo, string password)
        {
            var item = from policia in db.Policias
                       where policia.correoPolicia == correo && policia.passwordPolicia == password
                       select policia;
            if (item.Count() == 0) {
                ViewBag.Error = "Datos incorrectos";
                return View("Index");
            }
            if (item.First().idTipoUsuario == 2) {
                CreateStudentCookie();
                return RedirectToAction("Index", "Denuncias");
            }
            if (item.First().idTipoUsuario == 1)
            {
                CreateStudentCookie();
                return RedirectToAction("Admin", "Home");
            }
            ViewBag.Error = "Su usuario no posee suficientes permisos";

            return RedirectToAction("Home", "Index");
        }
        private void CreateStudentCookie()
        {
            HttpCookie myCookie = new HttpCookie("myCookie");
            myCookie.Value = "logueado";
            myCookie.Expires = DateTime.Now.AddDays(1d);
            Response.Cookies.Add(myCookie);
        }
        public ActionResult LogOut() {
            if (this.ControllerContext.HttpContext.Request.Cookies.AllKeys.Contains("myCookie"))
            {
                HttpCookie cookie = this.ControllerContext.HttpContext.Request.Cookies["myCookie"];
                cookie.Expires = DateTime.Now.AddDays(-1);
                this.ControllerContext.HttpContext.Response.Cookies.Add(cookie);
            }
            return RedirectToAction("Index", "Home");
        }
        public ActionResult Login()
        {
            return View();
        }
        public ActionResult Admin()
        {
            if (Request.Cookies["myCookie"] != null)
            {
                var value = Request.Cookies["myCookie"].Value;
                if (value == "logueado") {
                    return View();
                }
            }
            return View("Index");
        }
        public ActionResult Error404() {
            return View();
        }
        public ActionResult Error500()
        {
            return View();
        }

    }
}