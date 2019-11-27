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
    public class TipoUsuariosController : Controller
    {
        private ProtectEntities db = new ProtectEntities();

        // GET: TipoUsuarios
        public async Task<ActionResult> Index()
        {
            if (Request.Cookies["myCookie"] != null)
            {
                var value = Request.Cookies["myCookie"].Value;
                if (value == "logueado")
                {
                    return View(await db.TipoUsuarios.ToListAsync());
                }
            }
            return RedirectToAction("Index", "Home");
        }

        // GET: TipoUsuarios/Details/5
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
                    TipoUsuario tipoUsuario = await db.TipoUsuarios.FindAsync(id);
                    if (tipoUsuario == null)
                    {
                        return HttpNotFound();
                    }
                    return View(tipoUsuario);
                }
            }
            return RedirectToAction("Index", "Home");
        }

        // GET: TipoUsuarios/Create
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

        // POST: TipoUsuarios/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "idTipoUsuario,descripcionTipoUsuario")] TipoUsuario tipoUsuario)
        {
            if (Request.Cookies["myCookie"] != null)
            {
                var value = Request.Cookies["myCookie"].Value;
                if (value == "logueado")
                {
                    if (ModelState.IsValid)
                    {
                        db.TipoUsuarios.Add(tipoUsuario);
                        await db.SaveChangesAsync();
                        return RedirectToAction("Index");
                    }

                    return View(tipoUsuario);
                }
            }
            return RedirectToAction("Index", "Home");
        }

        // GET: TipoUsuarios/Edit/5
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
                    TipoUsuario tipoUsuario = await db.TipoUsuarios.FindAsync(id);
                    if (tipoUsuario == null)
                    {
                        return HttpNotFound();
                    }
                    return View(tipoUsuario);
                }
            }
            return RedirectToAction("Index", "Home");
        }

        // POST: TipoUsuarios/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "idTipoUsuario,descripcionTipoUsuario")] TipoUsuario tipoUsuario)
        {
            if (Request.Cookies["myCookie"] != null)
            {
                var value = Request.Cookies["myCookie"].Value;
                if (value == "logueado")
                {
                    if (ModelState.IsValid)
                    {
                        db.Entry(tipoUsuario).State = EntityState.Modified;
                        await db.SaveChangesAsync();
                        return RedirectToAction("Index");
                    }
                    return View(tipoUsuario);
                }
            }
            return RedirectToAction("Index", "Home");
        }

        // GET: TipoUsuarios/Delete/5
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
                    TipoUsuario tipoUsuario = await db.TipoUsuarios.FindAsync(id);
                    if (tipoUsuario == null)
                    {
                        return HttpNotFound();
                    }
                    return View(tipoUsuario);
                }
            }
            return RedirectToAction("Index", "Home");
        }

        // POST: TipoUsuarios/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            if (Request.Cookies["myCookie"] != null)
            {
                var value = Request.Cookies["myCookie"].Value;
                if (value == "logueado")
                {
                    TipoUsuario tipoUsuario = await db.TipoUsuarios.FindAsync(id);
                    db.TipoUsuarios.Remove(tipoUsuario);
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
