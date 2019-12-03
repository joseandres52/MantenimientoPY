﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using System.Web;
using System.Web.Mvc;
using MantenimientoPY.Models;
using System.Data.SqlClient;

namespace MantenimientoPY.Controllers
{
    public class DenunciasController : Controller
    {

        private ProtectEntities db = new ProtectEntities();

        // GET: Denuncias
        public async Task<ActionResult> Index()
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
        public void GetCoordenadas(int id)
        {
            string queryString = "SELECT latitudDenuncia, longitudDenuncia FROM Denuncias Where idDenuncia = " + id;
            string connectionString = "data source=protectyourselfdatabase.database.windows.net;initial catalog=Protect;user id=dbmaster;password=DbMa$ter;MultipleActiveResultSets=True;App=EntityFramework";

            using (SqlConnection connection = new SqlConnection(
                connectionString))
            {
                connection.Open();

                SqlCommand command = new SqlCommand(queryString, connection);
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    ViewBag.latitud = reader[0];
                    ViewBag.longitud = reader[1];
                }
            }
        }
        public async Task<ActionResult> MapaEmergencias()
        {
            if (Request.Cookies["myCookie"] != null)
            {
                var value = Request.Cookies["myCookie"].Value;
                if (value == "logueado")
                {
                    var denuncias = from denuncia in db.Denuncias
                                    where denuncia.idEstadoDenuncia == 0 && denuncia.idTipoDenuncia == 1
                                    select denuncia;
                   
                    return View(await denuncias.ToListAsync());
                }
            }
            return RedirectToAction("Index", "Home");
        }
        public async Task<ActionResult> MapaDenuncias()
        {
            if (Request.Cookies["myCookie"] != null)
            {
                var value = Request.Cookies["myCookie"].Value;
                if (value == "logueado")
                {
                    var denuncias = from denuncia in db.Denuncias
                                    where denuncia.idEstadoDenuncia == 0 && denuncia.idTipoDenuncia == 2
                                    select denuncia;

                    return View(await denuncias.ToListAsync());
                }
            }
            return RedirectToAction("Index", "Home");
        }
        public async Task<ActionResult> EmergenciasActivas()
        {
            if (Request.Cookies["myCookie"] != null)
            {
                var value = Request.Cookies["myCookie"].Value;
                if (value == "logueado")
                {
                    var denuncias = from denuncia in db.Denuncias
                                    where denuncia.idEstadoDenuncia == 0 && denuncia.idTipoDenuncia == 1
                                    select denuncia;
                    Response.AddHeader("Refresh", "120");
                    return View(await denuncias.ToListAsync());
                }
            }
            return RedirectToAction("Index", "Home");
        }
        public async Task<ActionResult> DenunciasActivas()
        {
            if (Request.Cookies["myCookie"] != null)
            {
                var value = Request.Cookies["myCookie"].Value;
                if (value == "logueado")
                {
                    var denuncias = from denuncia in db.Denuncias
                                    where denuncia.idEstadoDenuncia == 0 && denuncia.idTipoDenuncia == 2
                                    select denuncia;
                    Response.AddHeader("Refresh", "120");
                    return View(await denuncias.ToListAsync());
                }
            }
            return RedirectToAction("Index", "Home");
        }
        // GET: Denuncias/Details/5
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
                    Denuncia denuncia = await db.Denuncias.FindAsync(id);
                    if (denuncia == null)
                    {
                        return HttpNotFound();
                    }
                    GetCoordenadas(id.GetValueOrDefault());
                    return View(denuncia);
                }
            }

            return RedirectToAction("Index", "Home");
        }

        // GET: Denuncias/Create
        public ActionResult Create()
        {
            if (Request.Cookies["myCookie"] != null)
            {
                var value = Request.Cookies["myCookie"].Value;
                if (value == "logueado")
                {
                    ViewBag.idCiudadano = new SelectList(db.Ciudadanos, "idCiudadano", "nombreCiudadano");
                    ViewBag.idTipoDenuncia = new SelectList(db.TipoDenuncias, "idTipoDenuncia", "nombreDenuncia");
                    ViewBag.idTipoDelito = new SelectList(db.TipoDelitoes, "idTipoDelito", "nombreTipoDelito");
                    ViewBag.idEstadoDenuncia = new SelectList(db.EstadoDenuncias, "idEstadoDenuncia", "descripcionEstadoDenuncia");
                    ViewBag.idPolicia = new SelectList(db.Policias, "idPolicia", "nombrePolicia");
                    return View();
                }
            }
            return RedirectToAction("Index", "Home");
        }

        // POST: Denuncias/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "idDenuncia,idCiudadano,idPolicia,idTipoDenuncia,idTipoDelito,idEstadoDenuncia,latitudDenuncia,longitudDenuncia,descripcionDenuncia,afectadoDenuncia")] Denuncia denuncia)
        {
            if (Request.Cookies["myCookie"] != null)
            {
                var value = Request.Cookies["myCookie"].Value;
                if (value == "logueado")
                {
                    if (ModelState.IsValid)
                    {
                        db.Denuncias.Add(denuncia);
                        await db.SaveChangesAsync();
                        return RedirectToAction("Index");
                    }

                    ViewBag.idCiudadano = new SelectList(db.Ciudadanos, "idCiudadano", "nombreCiudadano", denuncia.idCiudadano);
                    ViewBag.idTipoDenuncia = new SelectList(db.TipoDenuncias, "idTipoDenuncia", "nombreDenuncia", denuncia.idTipoDenuncia);
                    ViewBag.idTipoDelito = new SelectList(db.TipoDelitoes, "idTipoDelito", "nombreTipoDelito", denuncia.idTipoDelito);
                    ViewBag.idEstadoDenuncia = new SelectList(db.EstadoDenuncias, "idEstadoDenuncia", "descripcionEstadoDenuncia", denuncia.idEstadoDenuncia);
                    ViewBag.idPolicia = new SelectList(db.Policias, "idPolicia", "nombrePolicia", denuncia.idPolicia);

                    return View(denuncia);
                }
            }
            return RedirectToAction("Index", "Home");
        }
        private Ciudadano ObtenerInfoCiudadano(int id)
        {

            Ciudadano ciudadano = db.Ciudadanos.Find(id);
            if (ciudadano == null)
            {
                return null;
            }

            return ciudadano;
        }

        // GET: Denuncias/Edit/5
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
                    Denuncia denuncia = await db.Denuncias.FindAsync(id);
                    if (denuncia == null)
                    {
                        return HttpNotFound();
                    }


                    ViewBag.idCiudadano = new SelectList(db.Ciudadanos, "idCiudadano", "nombreCiudadano", denuncia.idCiudadano);
                    ViewBag.idTipoDenuncia = new SelectList(db.TipoDenuncias, "idTipoDenuncia", "nombreDenuncia", denuncia.idTipoDenuncia);
                    ViewBag.idTipoDelito = new SelectList(db.TipoDelitoes, "idTipoDelito", "nombreTipoDelito", denuncia.idTipoDelito);
                    ViewBag.idEstadoDenuncia = new SelectList(db.EstadoDenuncias, "idEstadoDenuncia", "descripcionEstadoDenuncia", denuncia.idEstadoDenuncia);
                    ViewBag.idPolicia = new SelectList(db.Policias, "idPolicia", "nomCompleto", denuncia.idPolicia);

                    GetCoordenadas(id.GetValueOrDefault());
                    return View(denuncia);
                }
            }
            return RedirectToAction("Index", "Home");
        }

        // POST: Denuncias/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "idDenuncia,idCiudadano,idPolicia,idTipoDenuncia,idTipoDelito,idEstadoDenuncia,latitudDenuncia,longitudDenuncia,descripcionDenuncia,afectadoDenuncia")] Denuncia denuncia)
        {
            if (Request.Cookies["myCookie"] != null)
            {
                var value = Request.Cookies["myCookie"].Value;
                if (value == "logueado")
                {
                    if (ModelState.IsValid)
                    {
                        db.Entry(denuncia).State = EntityState.Modified;
                        await db.SaveChangesAsync();
                        if (denuncia.idTipoDenuncia == 2)
                        {
                            return RedirectToAction("DenunciasActivas");
                        }
                        return RedirectToAction("EmergenciasActivas");
                    }
                    ViewBag.idCiudadano = new SelectList(db.Ciudadanos, "idCiudadano", "nombreCiudadano", denuncia.idCiudadano);
                    ViewBag.idTipoDenuncia = new SelectList(db.TipoDenuncias, "idTipoDenuncia", "nombreDenuncia", denuncia.idTipoDenuncia);
                    ViewBag.idTipoDelito = new SelectList(db.TipoDelitoes, "idTipoDelito", "nombreTipoDelito", denuncia.idTipoDelito);
                    ViewBag.idEstadoDenuncia = new SelectList(db.EstadoDenuncias, "idEstadoDenuncia", "descripcionEstadoDenuncia", denuncia.idEstadoDenuncia);
                    ViewBag.idPolicia = new SelectList(db.Policias, "idPolicia", "nombrePolicia", denuncia.idPolicia);
                    return View(denuncia);
                }
            }
            return RedirectToAction("Index", "Home");
        }

        // GET: Denuncias/Delete/5
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
                    Denuncia denuncia = await db.Denuncias.FindAsync(id);
                    if (denuncia == null)
                    {
                        return HttpNotFound();
                    }
                    return View(denuncia);
                }
            }
            return RedirectToAction("Index", "Home");
        }

        // POST: Denuncias/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            if (Request.Cookies["myCookie"] != null)
            {
                var value = Request.Cookies["myCookie"].Value;
                if (value == "logueado")
                {
                    Denuncia denuncia = await db.Denuncias.FindAsync(id);
                    db.Denuncias.Remove(denuncia);
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
