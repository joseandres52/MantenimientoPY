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
    public class EstadoDenunciaController : Controller
    {
        private ProtectEntities db = new ProtectEntities();

        // GET: EstadoDenuncia
        public async Task<ActionResult> Index()
        {
            if (Request.Cookies["myCookie"] != null)
            {
                var value = Request.Cookies["myCookie"].Value;
                if (value == "logueado")
                {
                    return View(await db.EstadoDenuncias.ToListAsync());
                }
            }
            return RedirectToAction("Index", "Home");
        }

        // GET: EstadoDenuncia/Details/5
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
                    EstadoDenuncia estadoDenuncia = await db.EstadoDenuncias.FindAsync(id);
                    if (estadoDenuncia == null)
                    {
                        return HttpNotFound();
                    }
                    return View(estadoDenuncia);
                }
            }
            return RedirectToAction("Index", "Home");
        }

        // GET: EstadoDenuncia/Create
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

        // POST: EstadoDenuncia/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "idEstadoDenuncia,descripcionEstadoDenuncia")] EstadoDenuncia estadoDenuncia)
        {
            if (Request.Cookies["myCookie"] != null)
            {
                var value = Request.Cookies["myCookie"].Value;
                if (value == "logueado")
                {
                    if (ModelState.IsValid)
                    {
                        db.EstadoDenuncias.Add(estadoDenuncia);
                        await db.SaveChangesAsync();
                        return RedirectToAction("Index");
                    }

                    return View(estadoDenuncia);
                }
            }
            return RedirectToAction("Index", "Home");
        }

        // GET: EstadoDenuncia/Edit/5
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
                    EstadoDenuncia estadoDenuncia = await db.EstadoDenuncias.FindAsync(id);
                    if (estadoDenuncia == null)
                    {
                        return HttpNotFound();
                    }
                    return View(estadoDenuncia);
                }
            }
            return RedirectToAction("Index", "Home");
        }

        // POST: EstadoDenuncia/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "idEstadoDenuncia,descripcionEstadoDenuncia")] EstadoDenuncia estadoDenuncia)
        {
            if (Request.Cookies["myCookie"] != null)
            {
                var value = Request.Cookies["myCookie"].Value;
                if (value == "logueado")
                {
                    if (ModelState.IsValid)
                    {
                        db.Entry(estadoDenuncia).State = EntityState.Modified;
                        await db.SaveChangesAsync();
                        return RedirectToAction("Index");
                    }
                    return View(estadoDenuncia);
                }
            }
            return RedirectToAction("Index", "Home");
        }

        // GET: EstadoDenuncia/Delete/5
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
                    EstadoDenuncia estadoDenuncia = await db.EstadoDenuncias.FindAsync(id);
                    if (estadoDenuncia == null)
                    {
                        return HttpNotFound();
                    }
                    return View(estadoDenuncia);
                }
            }
            return RedirectToAction("Index", "Home");
        }

        // POST: EstadoDenuncia/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            if (Request.Cookies["myCookie"] != null)
            {
                var value = Request.Cookies["myCookie"].Value;
                if (value == "logueado")
                {
                    EstadoDenuncia estadoDenuncia = await db.EstadoDenuncias.FindAsync(id);
                    db.EstadoDenuncias.Remove(estadoDenuncia);
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
