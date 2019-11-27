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
    public class TipoDenunciasController : Controller
    {
        private ProtectEntities db = new ProtectEntities();

        // GET: TipoDenuncias
        public async Task<ActionResult> Index()
        {
            if (Request.Cookies["myCookie"] != null)
            {
                var value = Request.Cookies["myCookie"].Value;
                if (value == "logueado")
                {
                    return View(await db.TipoDenuncias.ToListAsync());
                }
            }
            return RedirectToAction("Index", "Home");
        }

        // GET: TipoDenuncias/Details/5
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
                    TipoDenuncia tipoDenuncia = await db.TipoDenuncias.FindAsync(id);
                    if (tipoDenuncia == null)
                    {
                        return HttpNotFound();
                    }
                    return View(tipoDenuncia);
                }
            }
            return RedirectToAction("Index", "Home");
        }

        // GET: TipoDenuncias/Create
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

        // POST: TipoDenuncias/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "idTipoDenuncia,nombreDenuncia,descripcionDenincua")] TipoDenuncia tipoDenuncia)
        {
            if (Request.Cookies["myCookie"] != null)
            {
                var value = Request.Cookies["myCookie"].Value;
                if (value == "logueado")
                {
                    if (ModelState.IsValid)
                    {
                        db.TipoDenuncias.Add(tipoDenuncia);
                        await db.SaveChangesAsync();
                        return RedirectToAction("Index");
                    }

                    return View(tipoDenuncia);
                }
            }
            return RedirectToAction("Index", "Home");
        }

        // GET: TipoDenuncias/Edit/5
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
                    TipoDenuncia tipoDenuncia = await db.TipoDenuncias.FindAsync(id);
                    if (tipoDenuncia == null)
                    {
                        return HttpNotFound();
                    }
                    return View(tipoDenuncia);
                }
            }
            return RedirectToAction("Index", "Home");
        }

        // POST: TipoDenuncias/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "idTipoDenuncia,nombreDenuncia,descripcionDenincua")] TipoDenuncia tipoDenuncia)
        {
            if (Request.Cookies["myCookie"] != null)
            {
                var value = Request.Cookies["myCookie"].Value;
                if (value == "logueado")
                {
                    if (ModelState.IsValid)
                    {
                        db.Entry(tipoDenuncia).State = EntityState.Modified;
                        await db.SaveChangesAsync();
                        return RedirectToAction("Index");
                    }
                    return View(tipoDenuncia);
                }
            }
            return RedirectToAction("Index", "Home");
        }

        // GET: TipoDenuncias/Delete/5
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
                    TipoDenuncia tipoDenuncia = await db.TipoDenuncias.FindAsync(id);
                    if (tipoDenuncia == null)
                    {
                        return HttpNotFound();
                    }
                    return View(tipoDenuncia);
                }
            }
            return RedirectToAction("Index", "Home");
        }

        // POST: TipoDenuncias/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            if (Request.Cookies["myCookie"] != null)
            {
                var value = Request.Cookies["myCookie"].Value;
                if (value == "logueado")
                {
                    TipoDenuncia tipoDenuncia = await db.TipoDenuncias.FindAsync(id);
                    db.TipoDenuncias.Remove(tipoDenuncia);
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
