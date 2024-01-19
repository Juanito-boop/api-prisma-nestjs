/*
  Warnings:

  - You are about to drop the `tasks` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "tasks";

-- CreateTable
CREATE TABLE "categorias" (
    "id_categoria" SERIAL NOT NULL,
    "nombre" VARCHAR(50) NOT NULL,
    "descripcion" VARCHAR(140),

    CONSTRAINT "categorias_pkey" PRIMARY KEY ("id_categoria")
);

-- CreateTable
CREATE TABLE "detalles_facturas" (
    "id_detalle_factura" SERIAL NOT NULL,
    "id_factura" INTEGER NOT NULL,
    "id_producto" INTEGER NOT NULL,
    "cantidad_producto" INTEGER NOT NULL,
    "fecha_creacion" DATE NOT NULL,

    CONSTRAINT "detalles_facturas_pkey" PRIMARY KEY ("id_detalle_factura")
);

-- CreateTable
CREATE TABLE "facturas" (
    "id_factura" SERIAL NOT NULL,
    "fecha_venta" DATE NOT NULL,
    "vendedor_factura" VARCHAR(100) NOT NULL,
    "cantidad_producto" INTEGER NOT NULL,
    "id_tienda" INTEGER NOT NULL,

    CONSTRAINT "facturas_pkey" PRIMARY KEY ("id_factura")
);

-- CreateTable
CREATE TABLE "productos" (
    "id_producto" SERIAL NOT NULL,
    "nombre" VARCHAR(50) NOT NULL,
    "marca" VARCHAR(50) NOT NULL,
    "precio_unitario" DOUBLE PRECISION NOT NULL,
    "fecha_caducidad" DATE,
    "descripcion" VARCHAR(255) NOT NULL,
    "stock" INTEGER NOT NULL,
    "id_categoria" INTEGER NOT NULL,

    CONSTRAINT "productos_pkey" PRIMARY KEY ("id_producto")
);

-- CreateTable
CREATE TABLE "roles" (
    "id_rol" SERIAL NOT NULL,
    "nombre_rol" VARCHAR(50) NOT NULL,

    CONSTRAINT "roles_pkey" PRIMARY KEY ("id_rol")
);

-- CreateTable
CREATE TABLE "tiendas" (
    "id_tienda" SERIAL NOT NULL,
    "nombre_tienda" VARCHAR(50) NOT NULL,
    "direccion_tienda" VARCHAR(50) NOT NULL,
    "telefono_tienda" VARCHAR(15) NOT NULL,
    "propietario_tienda" VARCHAR(50) NOT NULL,

    CONSTRAINT "tiendas_pkey" PRIMARY KEY ("id_tienda")
);

-- CreateTable
CREATE TABLE "usuarios" (
    "id_usuario" SERIAL NOT NULL,
    "username" VARCHAR(50) NOT NULL,
    "password" VARCHAR(255) NOT NULL,
    "id_tienda" INTEGER NOT NULL,
    "id_rol" INTEGER NOT NULL,

    CONSTRAINT "usuarios_pkey" PRIMARY KEY ("id_usuario")
);

-- CreateIndex
CREATE UNIQUE INDEX "categorias_nombre_key" ON "categorias"("nombre");

-- CreateIndex
CREATE UNIQUE INDEX "roles_nombre_rol_key" ON "roles"("nombre_rol");

-- CreateIndex
CREATE UNIQUE INDEX "usuarios_username_key" ON "usuarios"("username");

-- AddForeignKey
ALTER TABLE "detalles_facturas" ADD CONSTRAINT "fk_facturas_detalles" FOREIGN KEY ("id_factura") REFERENCES "facturas"("id_factura") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "detalles_facturas" ADD CONSTRAINT "fk_productos_detalles" FOREIGN KEY ("id_producto") REFERENCES "productos"("id_producto") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "facturas" ADD CONSTRAINT "fk_tiendas_facturas" FOREIGN KEY ("id_tienda") REFERENCES "tiendas"("id_tienda") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "productos" ADD CONSTRAINT "fk_categorias_productos" FOREIGN KEY ("id_categoria") REFERENCES "categorias"("id_categoria") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "usuarios" ADD CONSTRAINT "fk_roles_usuarios" FOREIGN KEY ("id_rol") REFERENCES "roles"("id_rol") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "usuarios" ADD CONSTRAINT "fk_tiendas_usuarios" FOREIGN KEY ("id_tienda") REFERENCES "tiendas"("id_tienda") ON DELETE CASCADE ON UPDATE NO ACTION;
