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
    public class TipoDelitoesController : Controller
    {
        private ProtectEntities db = new ProtectEntities();

        // GET: TipoDelitoes
        public async Task<ActionResult> Index()
        {
            if (Request.Cookies["myCookie"] != null)
            {
                var value = Request.Cookies["myCookie"].Value;
                if (value == "logueado")
                {
                    return View(await db.TipoDelitoes.ToListAsync());
                }
            }
            return RedirectToAction("Index", "Home");
        }

        // GET: TipoDelitoes/Details/5
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
                    TipoDelito tipoDelito = await db.TipoDelitoes.FindAsync(id);
                    if (tipoDelito == null)
                    {
                        return HttpNotFound();
                    }
                    return View(tipoDelito);
                }
            }
            return RedirectToAction("Index", "Home");
        }

        // GET: TipoDelitoes/Create
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

        // POST: TipoDelitoes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "idTipoDelito,nombreTipoDelito,descripcionTipoDelito")] TipoDelito tipoDelito)
        {
            if (Request.Cookies["myCookie"] != null)
            {
                var value = Request.Cookies["myCookie"].Value;
                if (value == "logueado")
                {
                    if (ModelState.IsValid)
                    {
                        db.TipoDelitoes.Add(tipoDelito);
                        await db.SaveChangesAsync();
                        return RedirectToAction("Index");
                    }

                    return View(tipoDelito);
                }
            }
            return RedirectToAction("Index", "Home");
        }

        // GET: TipoDelitoes/Edit/5
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
                    TipoDelito tipoDelito = await db.TipoDelitoes.FindAsync(id);
                    if (tipoDelito == null)
                    {
                        return HttpNotFound();
                    }
                    return View(tipoDelito);
                }
            }
            return RedirectToAction("Index", "Home");
        }

        // POST: TipoDelitoes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "idTipoDelito,nombreTipoDelito,descripcionTipoDelito")] TipoDelito tipoDelito)
        {
            if (Request.Cookies["myCookie"] != null)
            {
                var value = Request.Cookies["myCookie"].Value;
                if (value == "logueado")
                {
                    if (ModelState.IsValid)
                    {
                        db.Entry(tipoDelito).State = EntityState.Modified;
                        await db.SaveChangesAsync();
                        return RedirectToAction("Index");
                    }
                    return View(tipoDelito);
                }
            }
            return RedirectToAction("Index", "Home");
        }

        // GET: TipoDelitoes/Delete/5
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
                    TipoDelito tipoDelito = await db.TipoDelitoes.FindAsync(id);
                    if (tipoDelito == null)
                    {
                        return HttpNotFound();
                    }
                    return View(tipoDelito);
                }
            }
            return RedirectToAction("Index", "Home");
        }

        // POST: TipoDelitoes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            if (Request.Cookies["myCookie"] != null)
            {
                var value = Request.Cookies["myCookie"].Value;
                if (value == "logueado")
                {
                    TipoDelito tipoDelito = await db.TipoDelitoes.FindAsync(id);
                    db.TipoDelitoes.Remove(tipoDelito);
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
