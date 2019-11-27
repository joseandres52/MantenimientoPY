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
    public class ContactosEmergenciasController : Controller
    {
        private ProtectEntities db = new ProtectEntities();

        // GET: ContactosEmergencias
        public async Task<ActionResult> Index()
        {
            if (Request.Cookies["myCookie"] != null)
            {
                var value = Request.Cookies["myCookie"].Value;
                if (value == "logueado")
                {
                    var contactosEmergencias = db.ContactosEmergencias.Include(c => c.Ciudadano);
                    return View(await contactosEmergencias.ToListAsync());
                }
            }
            return RedirectToAction("Index", "Home");
        }

        // GET: ContactosEmergencias/Details/5
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
                    ContactosEmergencia contactosEmergencia = await db.ContactosEmergencias.FindAsync(id);
                    if (contactosEmergencia == null)
                    {
                        return HttpNotFound();
                    }
                    return View(contactosEmergencia);
                }
            }
            return RedirectToAction("Index", "Home");
        }

        // GET: ContactosEmergencias/Create
        public ActionResult Create()
        {
            if (Request.Cookies["myCookie"] != null)
            {
                var value = Request.Cookies["myCookie"].Value;
                if (value == "logueado")
                {
                    ViewBag.idCiudadano = new SelectList(db.Ciudadanos, "idCiudadano", "idCiudadano");
                    return View();
                }
            }
            return RedirectToAction("Index", "Home");
        }

        // POST: ContactosEmergencias/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "idContactoEmergencia,idCiudadano,numContactoEmergencia,nombreContactoEmergencia")] ContactosEmergencia contactosEmergencia)
        {
            if (Request.Cookies["myCookie"] != null)
            {
                var value = Request.Cookies["myCookie"].Value;
                if (value == "logueado")
                {
                    if (ModelState.IsValid)
                    {
                        db.ContactosEmergencias.Add(contactosEmergencia);
                        await db.SaveChangesAsync();
                        return RedirectToAction("Index");
                    }

                    ViewBag.idCiudadano = new SelectList(db.Ciudadanos, "idCiudadano", "idCiudadano", contactosEmergencia.idCiudadano);
                    return View(contactosEmergencia);
                }
            }
            return RedirectToAction("Index", "Home");
        }

        // GET: ContactosEmergencias/Edit/5
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
                    ContactosEmergencia contactosEmergencia = await db.ContactosEmergencias.FindAsync(id);
                    if (contactosEmergencia == null)
                    {
                        return HttpNotFound();
                    }
                    ViewBag.idCiudadano = new SelectList(db.Ciudadanos, "idCiudadano", "idCiudadano", contactosEmergencia.idCiudadano);
                    return View(contactosEmergencia);
                }
            }
            return RedirectToAction("Index", "Home");
        }

        // POST: ContactosEmergencias/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "idContactoEmergencia,idCiudadano,numContactoEmergencia,nombreContactoEmergencia")] ContactosEmergencia contactosEmergencia)
        {
            if (Request.Cookies["myCookie"] != null)
            {
                var value = Request.Cookies["myCookie"].Value;
                if (value == "logueado")
                {
                    if (ModelState.IsValid)
                    {
                        db.Entry(contactosEmergencia).State = EntityState.Modified;
                        await db.SaveChangesAsync();
                        return RedirectToAction("Index");
                    }
                    ViewBag.idCiudadano = new SelectList(db.Ciudadanos, "idCiudadano", "nombreCiudadano", contactosEmergencia.idCiudadano);
                    return View(contactosEmergencia);
                }
            }
            return RedirectToAction("Index", "Home");
        }

        // GET: ContactosEmergencias/Delete/5
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
                    ContactosEmergencia contactosEmergencia = await db.ContactosEmergencias.FindAsync(id);
                    if (contactosEmergencia == null)
                    {
                        return HttpNotFound();
                    }
                    return View(contactosEmergencia);
                }
            }
            return RedirectToAction("Index", "Home");
        }

        // POST: ContactosEmergencias/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            if (Request.Cookies["myCookie"] != null)
            {
                var value = Request.Cookies["myCookie"].Value;
                if (value == "logueado")
                {
                    ContactosEmergencia contactosEmergencia = await db.ContactosEmergencias.FindAsync(id);
                    db.ContactosEmergencias.Remove(contactosEmergencia);
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
