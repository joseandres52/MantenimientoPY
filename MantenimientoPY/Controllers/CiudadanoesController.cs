using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using System.Web;
using System.Web.Mvc;
using MantenimientoPY.Models;

namespace MantenimientoPY.Controllers
{
    public class CiudadanoesController : Controller
    {
        private ProtectEntities db = new ProtectEntities();

        // GET: Ciudadanoes
        public async Task<ActionResult> Index()
        {
            if (Request.Cookies["myCookie"] != null)
            {
                var value = Request.Cookies["myCookie"].Value;
                if (value == "logueado")
                {
                    return View(await db.Ciudadanos.ToListAsync());
                }
            }
            return RedirectToAction("Index", "Home");
        }

        // GET: Ciudadanoes/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (Request.Cookies["myCookie"] != null)
            {
                var value = Request.Cookies["myCookie"].Value;
                if (value == "logueado")
                {
                    if (id == null)
                    {
                        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                    }
                    Ciudadano ciudadano = await db.Ciudadanos.FindAsync(id);
                    if (ciudadano == null)
                    {
                        return HttpNotFound();
                    }
                    return View(ciudadano);
                }
            }
            return RedirectToAction("Index", "Home");
        }

        // GET: Ciudadanoes/Create
        public ActionResult Create()
        {
            if (Request.Cookies["myCookie"] != null)
            {
                var value = Request.Cookies["myCookie"].Value;
                if (value == "logueado")
                {
                    return View();
                }
            }
            return RedirectToAction("Index", "Home");
        }

        // POST: Ciudadanoes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "idCiudadano,nombreCiudadano,apellidoPatCiudadano,apellidoMatCiudadano,direccionCiudadano,passwordCiudadano,correoCiudadano,estadoCiudadano,numReportesFalsosCiudadano,telefonoCiudadano")] Ciudadano ciudadano)
        {
            if (Request.Cookies["myCookie"] != null)
            {
                var value = Request.Cookies["myCookie"].Value;
                if (value == "logueado")
                {
                    if (ModelState.IsValid)
                    {
                        db.Ciudadanos.Add(ciudadano);
                        await db.SaveChangesAsync();
                        return RedirectToAction("Index");
                    }

                    return View(ciudadano);
                }
            }
            return RedirectToAction("Index", "Home");
        }

        // GET: Ciudadanoes/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (Request.Cookies["myCookie"] != null)
            {
                var value = Request.Cookies["myCookie"].Value;
                if (value == "logueado")
                {
                    if (id == null)
                    {
                        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                    }
                    Ciudadano ciudadano = await db.Ciudadanos.FindAsync(id);
                    if (ciudadano == null)
                    {
                        return HttpNotFound();
                    }
                    return View(ciudadano);
                }
            }
            return RedirectToAction("Index", "Home");
        }

        // POST: Ciudadanoes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "idCiudadano,nombreCiudadano,apellidoPatCiudadano,apellidoMatCiudadano,direccionCiudadano,passwordCiudadano,correoCiudadano,estadoCiudadano,numReportesFalsosCiudadano,telefonoCiudadano")] Ciudadano ciudadano)
        {
            if (Request.Cookies["myCookie"] != null)
            {
                var value = Request.Cookies["myCookie"].Value;
                if (value == "logueado")
                {
                    if (ModelState.IsValid)
                    {
                        db.Entry(ciudadano).State = EntityState.Modified;
                        await db.SaveChangesAsync();
                        return RedirectToAction("Index");
                    }
                    return View(ciudadano);
                }
            }
            return RedirectToAction("Index", "Home");
        }

        // GET: Ciudadanoes/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (Request.Cookies["myCookie"] != null)
            {
                var value = Request.Cookies["myCookie"].Value;
                if (value == "logueado")
                {
                    if (id == null)
                    {
                        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                    }
                    Ciudadano ciudadano = await db.Ciudadanos.FindAsync(id);
                    if (ciudadano == null)
                    {
                        return HttpNotFound();
                    }
                    return View(ciudadano);
                }
            }
            return RedirectToAction("Index", "Home");
        }

        // POST: Ciudadanoes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            if (Request.Cookies["myCookie"] != null)
            {
                var value = Request.Cookies["myCookie"].Value;
                if (value == "logueado")
                {
                    Ciudadano ciudadano = await db.Ciudadanos.FindAsync(id);
                    db.Ciudadanos.Remove(ciudadano);
                    await db.SaveChangesAsync();
                    return RedirectToAction("Index");
                }
            }
            return RedirectToAction("Index", "Home");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
