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
    public class PoliciasController : Controller
    {
        private ProtectEntities db = new ProtectEntities();

        // GET: Policias
        public async Task<ActionResult> Index()
        {
            if (Request.Cookies["myCookie"] != null)
            {
                var value = Request.Cookies["myCookie"].Value;
                if (value == "logueado")
                {
                    var policias = db.Policias.Include(p => p.TipoUsuario);
                    return View(await policias.ToListAsync());
                }
            }
            return RedirectToAction("Index", "Home");
        }

        // GET: Policias/Details/5
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
                    Policia policia = await db.Policias.FindAsync(id);
                    if (policia == null)
                    {
                        return HttpNotFound();
                    }
                    return View(policia);
                }
            }
            return RedirectToAction("Index", "Home");
        }

        // GET: Policias/Create
        public ActionResult Create()
        {
            if (Request.Cookies["myCookie"] != null)
            {
                var value = Request.Cookies["myCookie"].Value;
                if (value == "logueado")
                {
                    ViewBag.idTipoUsuario = new SelectList(db.TipoUsuarios, "idTipoUsuario", "descripcionTipoUsuario");
                    return View();
                }
            }
            return RedirectToAction("Index", "Home");
        }

        // POST: Policias/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "idPolicia,idTipoUsuario,identificacionPolicia,nombrePolicia,apellidoPaternoPolicia,apellidoMaternoPolicia,direccionPolicia,telefonoPolicia,correoPolicia,passwordPolicia,estadoPolicia")] Policia policia)
        {
            if (Request.Cookies["myCookie"] != null)
            {
                var value = Request.Cookies["myCookie"].Value;
                if (value == "logueado")
                {
                    if (ModelState.IsValid)
                    {
                        db.Policias.Add(policia);
                        await db.SaveChangesAsync();
                        return RedirectToAction("Index");
                    }

                    ViewBag.idTipoUsuario = new SelectList(db.TipoUsuarios, "idTipoUsuario", "descripcionTipoUsuario", policia.idTipoUsuario);
                    return View(policia);
                }
            }
            return RedirectToAction("Index", "Home");
        }

        // GET: Policias/Edit/5
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
                    Policia policia = await db.Policias.FindAsync(id);
                    if (policia == null)
                    {
                        return HttpNotFound();
                    }
                    ViewBag.idTipoUsuario = new SelectList(db.TipoUsuarios, "idTipoUsuario", "descripcionTipoUsuario", policia.idTipoUsuario);
                    return View(policia);
                }
            }
            return RedirectToAction("Index", "Home");
        }

        // POST: Policias/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "idPolicia,idTipoUsuario,identificacionPolicia,nombrePolicia,apellidoPaternoPolicia,apellidoMaternoPolicia,direccionPolicia,telefonoPolicia,correoPolicia,passwordPolicia,estadoPolicia")] Policia policia)
        {
            if (Request.Cookies["myCookie"] != null)
            {
                var value = Request.Cookies["myCookie"].Value;
                if (value == "logueado")
                {
                    if (ModelState.IsValid)
                    {
                        db.Entry(policia).State = EntityState.Modified;
                        await db.SaveChangesAsync();
                        return RedirectToAction("Index");
                    }
                    ViewBag.idTipoUsuario = new SelectList(db.TipoUsuarios, "idTipoUsuario", "descripcionTipoUsuario", policia.idTipoUsuario);
                    return View(policia);
                }
            }
            return RedirectToAction("Index", "Home");
        }

        // GET: Policias/Delete/5
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
                    Policia policia = await db.Policias.FindAsync(id);
                    if (policia == null)
                    {
                        return HttpNotFound();
                    }
                    return View(policia);
                }
            }
            return RedirectToAction("Index", "Home");
        }

        // POST: Policias/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            if (Request.Cookies["myCookie"] != null)
            {
                var value = Request.Cookies["myCookie"].Value;
                if (value == "logueado")
                {
                    Policia policia = await db.Policias.FindAsync(id);
                    db.Policias.Remove(policia);
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
