/****************************************************************************************************

									CREAMOS NUESTRO ESQUEMA

*****************************************************************************************************/
/*
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'HAVA_BEI')
    DROP SCHEMA [HAVA_BEI]
-- GO

/****** Object:  Schema [HAVA_BEI]    Script Date: 12/08/2013 17:52:52 ******/
CREATE SCHEMA [HAVA_BEI] AUTHORIZATION [gd]

-- GO
*/
/****************************************************************************************************

									FIN CREACION ESQUEMA

*****************************************************************************************************/

/****************************************************************************************************

										ELIMINAMOS TODO

*****************************************************************************************************/

/* LOS IF LOS PONGO PARA QUE SI LA TABLA EXISTE LA ELIMINE Y LUEGO LA CREACIÓN NO DE ERROR POR TRATAR DE CREAR UNA TABLA QUE YA EXISTE */

-- 11
if OBJECT_ID(N'HAVA_BEI.calificacion') is not null
    drop table HAVA_BEI.calificacion
-- 12
if OBJECT_ID(N'HAVA_BEI.cliente') is not null
    drop table HAVA_BEI.cliente
-- 13
if OBJECT_ID(N'HAVA_BEI.empresa') is not null
    drop table HAVA_BEI.empresa
-- 14
if OBJECT_ID(N'HAVA_BEI.item_factura') is not null
    drop table HAVA_BEI.item_factura
-- 15
if OBJECT_ID(N'HAVA_BEI.oferta') is not null
    drop table HAVA_BEI.oferta
-- 16
if OBJECT_ID(N'HAVA_BEI.pregunta') is not null
    drop table HAVA_BEI.pregunta
-- 17
if OBJECT_ID(N'HAVA_BEI.rol_funcionalidad') is not null
    drop table HAVA_BEI.rol_funcionalidad
-- 18
if OBJECT_ID(N'HAVA_BEI.rubro_publicacion') is not null
    drop table HAVA_BEI.rubro_publicacion
-- 19
if OBJECT_ID(N'HAVA_BEI.usuario_rol') is not null
    drop table HAVA_BEI.usuario_rol
-------
-- 05
if OBJECT_ID(N'HAVA_BEI.compras') is not null
    drop table HAVA_BEI.compras
-- 06
if OBJECT_ID(N'HAVA_BEI.facturacion') is not null
    drop table HAVA_BEI.facturacion
-- 07
if OBJECT_ID(N'HAVA_BEI.funcionalidad') is not null
    drop table HAVA_BEI.funcionalidad
-- 08
if OBJECT_ID(N'HAVA_BEI.rol') is not null
    drop table HAVA_BEI.rol
-- 09
if OBJECT_ID(N'HAVA_BEI.rubro') is not null
    drop table HAVA_BEI.rubro
-- 10
if OBJECT_ID(N'HAVA_BEI.tipo_documento') is not null
	drop table HAVA_BEI.tipo_documento
-------
-- 04
if OBJECT_ID(N'HAVA_BEI.publicacion') is not null
    drop table HAVA_BEI.publicacion
-------
-- 03
if OBJECT_ID(N'HAVA_BEI.visibilidad_publicacion') is not null
    drop table HAVA_BEI.visibilidad_publicacion
-------
-- 02
if OBJECT_ID(N'HAVA_BEI.usuario') is not null
    drop table HAVA_BEI.usuario
-------
-- 01
if OBJECT_ID(N'HAVA_BEI.estados_usuario') is not null
    drop table HAVA_BEI.estados_usuario

/****************************************************************************************************

										FIN ELIMINAMOS TODO

*****************************************************************************************************/


/****************************************************************************************************

								CREAMOS TODAS LAS TABLAS DEL MODELO

*****************************************************************************************************/

/* EL IF LOS PONGO PARA QUE SI LA TABLA EXISTE NO LA VUELVA A CREAR, ASÍ NO DA ERROR */

/****************************************************************************************************/

if object_id(N'HAVA_BEI.calificacion') is null
begin
	create table HAVA_BEI.calificacion(
		calif_codigo int not null,
		calif_compra int not null,
		calif_puntos smallint not null,
		calif_detalle nvarchar(500)
	)
	
	/*AGREGAMOS LA CLAVE PRIMARIA*/
	alter table HAVA_BEI.calificacion add constraint
	cp_calificacion primary key clustered(calif_codigo)
end

/*BORRAMOS LOS DATOS QUE PUDIERA HABER*/
delete from HAVA_BEI.calificacion

/****************************************************************************************************/

if object_id(N'HAVA_BEI.cliente') is null
begin
	create table HAVA_BEI.cliente(
		clie_nombre nvarchar(255) not null,
		clie_apellido nvarchar(255) not null,
		clie_numero_doc int not null,
		clie_tipo_doc smallint not null,
		clie_mail nvarchar(255) not null,
		clie_telefono nvarchar(255) not null,
		clie_dir_calle nvarchar(255) not null,
		clie_cod_pos nvarchar(255) not null,
		clie_fec_nac smalldatetime not null,
		clie_usuario nvarchar(15) not null,
		clie_cuil int not null,
		clie_dir_numero int not null,
		clie_dir_piso int not null,
		clie_dir_depto nvarchar(50) not null,
		clie_dir_localidad nvarchar(255) not null
	)
	
	/*AGREGAMOS LA CLAVE PRIMARIA*/
	alter table HAVA_BEI.cliente add constraint
	cp_cliente primary key clustered(clie_usuario)
end

/*BORRAMOS LOS DATOS QUE PUDIERA HABER*/
delete from HAVA_BEI.cliente

/****************************************************************************************************/

if object_id(N'HAVA_BEI.compras') is null
begin
	create table HAVA_BEI.compras(
		comp_cod int not null identity(1,1), -- empieza en 1 y se incrementa de a uno
		comp_publicacion int not null,
		comp_comprador nvarchar(15) not null,
		comp_fecha smalldatetime not null,		
		comp_unidades smallint not null,
		comp_comision decimal(18,2) not null
	)

	/*AGREGAMOS LA CLAVE PRIMARIA*/
	alter table HAVA_BEI.compras add constraint
	cp_compras primary key clustered(comp_cod)
end

/*BORRAMOS LOS DATOS QUE PUDIERA HABER*/
delete from HAVA_BEI.compras

/****************************************************************************************************/

if object_id(N'HAVA_BEI.empresa') is null
begin
	create table HAVA_BEI.empresa(
		empr_razon nvarchar(255) not null,
		empr_mail nvarchar(50) not null,
		empr_telefono nvarchar(255) not null,
		empr_dir_calle nvarchar(100) not null,
		empr_cod_pos nvarchar(50) not null,
		empr_ciudad nvarchar(255) not null,
		empr_cuit nvarchar(50) not null,
		empr_contacto nvarchar(255) not null,
		empr_fecha smalldatetime not null,
		empr_usuario nvarchar(15) not null,
		empr_dir_numero int not null,
		empr_dir_piso int not null,
		empr_dir_depto nvarchar(50) not null,
		empr_dir_localidad nvarchar(255) not null
	)
	
	/*AGREGAMOS LA CLAVE PRIMARIA*/
	alter table HAVA_BEI.empresa add constraint
	cp_empresa primary key clustered(empr_usuario)
end

/*BORRAMOS LOS DATOS QUE PUDIERA HABER*/
delete from HAVA_BEI.empresa

/****************************************************************************************************/

if object_id(N'HAVA_BEI.estados_usuario') is null
begin
	create table HAVA_BEI.estados_usuario(
		estus_estado smallint not null,
		estus_descripcion nvarchar(255) not null
	)
	
	/*AGREGAMOS LA CLAVE PRIMARIA*/
	alter table HAVA_BEI.estados_usuario add constraint
	cp_estados_usuario primary key clustered(estus_estado)
end

/*BORRAMOS LOS DATOS QUE PUDIERA HABER*/
delete from HAVA_BEI.estados_usuario

/****************************************************************************************************/

if object_id(N'HAVA_BEI.facturacion') is null
begin
	create table HAVA_BEI.facturacion(
		fact_id int not null,
		fact_forma_pago nvarchar(255) not null,
		fact_precio_total decimal(18,2) not null,
		fact_usuario nvarchar(15) not null,
		fact_fecha smalldatetime not null
	)
	
	/*AGREGAMOS LA CLAVE PRIMARIA*/
	alter table HAVA_BEI.facturacion add constraint
	cp_facturacion primary key clustered(fact_id)
end

/*BORRAMOS LOS DATOS QUE PUDIERA HABER*/
delete from HAVA_BEI.facturacion

/****************************************************************************************************/

if object_id(N'HAVA_BEI.funcionalidad') is null
begin
	create table HAVA_BEI.funcionalidad(
		fun_codigo smallint not null,
		fun_descripcion nvarchar(50) not null
	)
	
	/*AGREGAMOS LA CLAVE PRIMARIA*/
	alter table HAVA_BEI.funcionalidad add constraint
	cp_funcionalidad primary key clustered(fun_codigo)
end

/*BORRAMOS LOS DATOS QUE PUDIERA HABER*/
delete from HAVA_BEI.funcionalidad

/****************************************************************************************************/

if object_id(N'HAVA_BEI.item_factura') is null
begin
	create table HAVA_BEI.item_factura(
		item_factura int not null,
		item_public int not null,
		item_monto decimal(18,2) not null,
		item_cantidad int not null,
		item_id int not null identity(1,1),
		item_compra int null,
		item_comision decimal(18,2) null
	)
	
	/*AGREGAMOS LA CLAVE PRIMARIA*/
	alter table HAVA_BEI.item_factura add constraint
	cp_item_factura primary key clustered(item_id)
end

/*BORRAMOS LOS DATOS QUE PUDIERA HABER*/
delete from HAVA_BEI.item_factura

/****************************************************************************************************/

if object_id(N'HAVA_BEI.oferta') is null
begin
	create table HAVA_BEI.oferta(
		ofer_cod int not null identity(1,1),
		ofer_publicacion int not null,
		ofer_precio decimal(18,2) not null,
		ofer_oferente nvarchar(15) not null,
		ofer_fecha smalldatetime not null
	)
	
	/*AGREGAMOS LA CLAVE PRIMARIA*/
	alter table HAVA_BEI.oferta add constraint
	cp_oferta primary key clustered(ofer_cod)
end

/*BORRAMOS LOS DATOS QUE PUDIERA HABER*/
delete from HAVA_BEI.oferta

/****************************************************************************************************/

if object_id(N'HAVA_BEI.pregunta') is null
begin
	create table HAVA_BEI.pregunta(
		preg_cod_publicacion int not null,
		preg_pregunta nvarchar(255) not null,
		preg_respuesta nvarchar(255),
		preg_respuesta_fecha smalldatetime,
		preg_id int not null,
		preg_pregunta_fecha smalldatetime not null
	)
	
	/*AGREGAMOS LA CLAVE PRIMARIA*/
	alter table HAVA_BEI.pregunta add constraint
	cp_pregunta primary key clustered(preg_id)
end

/*BORRAMOS LOS DATOS QUE PUDIERA HABER*/
delete from HAVA_BEI.pregunta

/****************************************************************************************************/

if object_id(N'HAVA_BEI.publicacion') is null
begin
	create table HAVA_BEI.publicacion(
		publ_codigo int not null,
		publ_stock int not null,
		publ_precio_in numeric(18,2) not null,
		publ_estado nvarchar(255) not null,
		publ_descripcion nvarchar(255) not null,
		publ_fecha_ini smalldatetime,		
		publ_fecha_fin smalldatetime,
		publ_visibilidad int not null,
		publ_usuario nvarchar(15) not null,
		publ_tipo nvarchar(255) not null,
		publ_preguntas char(1) not null
	)
	
	/*AGREGAMOS LA CLAVE PRIMARIA*/
	alter table HAVA_BEI.publicacion add constraint
	cp_publicacion primary key clustered(publ_codigo)
end

/*BORRAMOS LOS DATOS QUE PUDIERA HABER*/
delete from HAVA_BEI.publicacion

/****************************************************************************************************/

if OBJECT_ID(N'HAVA_BEI.rol') is null
begin
	create table HAVA_BEI.rol(
		rol_activo	char(1) not null,
		rol_nombre	nvarchar(20) not null,
		rol_id	smallint not null
	)

	/*AGREGAMOS LA CLAVE PRIMARIA*/
	alter table HAVA_BEI.rol add constraint
	cp_rol primary key clustered(rol_id)
end

/*BORRAMOS LOS DATOS QUE PUDIERA HABER*/
delete from HAVA_BEI.rol

/****************************************************************************************************/

if object_id(N'HAVA_BEI.rol_funcionalidad') is null
begin
	create table HAVA_BEI.rol_funcionalidad(
		rolfun_rol smallint not null,
		rolfun_funcionalidad smallint not null
	)
	
	/*AGREGAMOS LA CLAVE PRIMARIA*/
	alter table HAVA_BEI.rol_funcionalidad add constraint
	cp_rolFun primary key clustered(rolfun_rol, rolfun_funcionalidad)
end

/*BORRAMOS LOS DATOS QUE PUDIERA HABER*/
delete from HAVA_BEI.rol_funcionalidad

/****************************************************************************************************/

if object_id(N'HAVA_BEI.rubro') is null
begin
	create table HAVA_BEI.rubro(
		rub_id int not null identity(1,1),
		rub_descripcion nvarchar(255) not null,
		rub_codigo int not null
	)
	
	/*AGREGAMOS LA CLAVE PRIMARIA*/
	alter table HAVA_BEI.rubro add constraint
	cp_rubro primary key clustered(rub_id)
end

/*BORRAMOS LOS DATOS QUE PUDIERA HABER*/
delete from HAVA_BEI.rubro

/****************************************************************************************************/

if object_id(N'HAVA_BEI.rubro_publicacion') is null
begin
	create table HAVA_BEI.rubro_publicacion(
		rubpu_rubro int not null,
		rubpu_publicacion int not null
	)
	
	/*AGREGAMOS LA CLAVE PRIMARIA*/
	alter table HAVA_BEI.rubro_publicacion add constraint
	cp_rubro_publicacion primary key clustered(rubpu_rubro, rubpu_publicacion)
end

/*BORRAMOS LOS DATOS QUE PUDIERA HABER*/
delete from HAVA_BEI.rubro_publicacion

/****************************************************************************************************/

if OBJECT_ID(N'HAVA_BEI.tipo_documento') is null
begin
	create table HAVA_BEI.tipo_documento(
		tipdoc_codigo smallint not null,
		tipdoc_detalle nvarchar(40) not null,
		tipdoc_sigla nvarchar(10) not null
	)
	/*AGREGAMOS LA CLAVE PRIMARIA*/
	alter table HAVA_BEI.tipo_documento add  constraint
	cp_tipo_documento primary key clustered(tipdoc_codigo)
end

/*BORRAMOS LOS DATOS QUE PUDIERA HABER*/
delete from HAVA_BEI.tipo_documento
/****************************************************************************************************/

if object_id(N'HAVA_BEI.usuario') is null
begin
	create table HAVA_BEI.usuario(
		us_nombre nvarchar(15) not null,
		us_clave nvarchar(30) not null,
		us_intentosFallidos smallint not null,
		us_estado smallint not null,
		us_primera_vez char(1) not null
	)
	
	/*AGREGAMOS LA CLAVE PRIMARIA*/
	alter table HAVA_BEI.usuario add constraint
	cp_usuario primary key clustered(us_nombre)
end

/*BORRAMOS LOS DATOS QUE PUDIERA HABER*/
delete from HAVA_BEI.usuario

/****************************************************************************************************/

if object_id(N'HAVA_BEI.usuario_rol') is null
begin
	create table HAVA_BEI.usuario_rol(
		usrol_usuario nvarchar(15) not null,
		usrol_rol smallint not null
	)
	
	/*AGREGAMOS LA CLAVE PRIMARIA*/
	alter table HAVA_BEI.usuario_rol add constraint
	cp_usuarioRol primary key clustered(usrol_usuario, usrol_rol)
end

/*BORRAMOS LOS DATOS QUE PUDIERA HABER*/
delete from HAVA_BEI.usuario_rol

/****************************************************************************************************/

if object_id(N'HAVA_BEI.visibilidad_publicacion') is null
begin
	create table HAVA_BEI.visibilidad_publicacion(
		vipu_codigo int not null,
		vipu_descripcion nvarchar(255) not null,
		vipu_costo decimal(18,2) not null,
		vipu_porcentaje_ventas int not null,
		vipu_duracion int not null
	)
	
	/*AGREGAMOS LA CLAVE PRIMARIA*/
	alter table HAVA_BEI.visibilidad_publicacion add constraint
	cp_visibilidad_publicacion primary key clustered(vipu_codigo)
end

/*BORRAMOS LOS DATOS QUE PUDIERA HABER*/
delete from HAVA_BEI.visibilidad_publicacion


/****************************************************************************************************

								FIN CREACIÓN DE LAS TABLAS DEL MODELO

*****************************************************************************************************/

/*******************************************
		HAVA_BEI.calificacion
*******************************************/

/*******************************************
			HAVA_BEI.cliente
*******************************************/

ALTER TABLE [HAVA_BEI].[cliente]  WITH CHECK 
ADD  CONSTRAINT [cf_cliente_UsuarioNombre] 
FOREIGN KEY([clie_usuario])
REFERENCES [HAVA_BEI].[usuario] ([us_nombre])

/*******************************************
			HAVA_BEI.compras
*******************************************/

ALTER TABLE [HAVA_BEI].[compras]  WITH CHECK 
ADD  CONSTRAINT [cf_compras_publicacionCodigo] 
FOREIGN KEY([comp_publicacion])
REFERENCES [HAVA_BEI].[publicacion] ([publ_codigo])

ALTER TABLE [HAVA_BEI].[compras]  WITH CHECK 
ADD  CONSTRAINT [cf_compras_usuarioNombre] 
FOREIGN KEY([comp_comprador])
REFERENCES [HAVA_BEI].[usuario] ([us_nombre])

/*******************************************
			HAVA_BEI.empresa
*******************************************/

ALTER TABLE [HAVA_BEI].[empresa]  WITH CHECK 
ADD  CONSTRAINT [cf_empresa_usuarioNombre] 
FOREIGN KEY([empr_usuario])
REFERENCES [HAVA_BEI].[usuario] ([us_nombre])

/*******************************************
	   HAVA_BEI.estados_usuario
*******************************************/

/*******************************************
		HAVA_BEI.facturacion
*******************************************/

ALTER TABLE [HAVA_BEI].[facturacion]  WITH CHECK 
ADD  CONSTRAINT [cf_facturacion_usuarioNombre] 
FOREIGN KEY([fact_usuario])
REFERENCES [HAVA_BEI].[usuario] ([us_nombre])

/*******************************************
		HAVA_BEI.funcionalidad
*******************************************/

/*******************************************
		HAVA_BEI.item_factura
*******************************************/

ALTER TABLE [HAVA_BEI].[item_factura]  WITH CHECK 
ADD  CONSTRAINT [cf_itemFactura_comprasCodigo] 
FOREIGN KEY([item_compra])
REFERENCES [HAVA_BEI].[compras] ([comp_cod])

ALTER TABLE [HAVA_BEI].[item_factura]  WITH CHECK 
ADD  CONSTRAINT [cf_itemFactura_FacturaID] 
FOREIGN KEY([item_factura])
REFERENCES [HAVA_BEI].[facturacion] ([fact_id])

ALTER TABLE [HAVA_BEI].[item_factura]  WITH CHECK 
ADD  CONSTRAINT [cf_itemFactura_publicacionCodigo] 
FOREIGN KEY([item_public])
REFERENCES [HAVA_BEI].[publicacion] ([publ_codigo])

/*******************************************
			HAVA_BEI.oferta
*******************************************/

ALTER TABLE [HAVA_BEI].[oferta]  WITH CHECK 
ADD  CONSTRAINT [cf_oferta_UsuarioNombre] 
FOREIGN KEY([ofer_publicacion])
REFERENCES [HAVA_BEI].[publicacion] ([publ_codigo])

/*******************************************
			HAVA_BEI.pregunta
*******************************************/

ALTER TABLE [HAVA_BEI].[pregunta]  WITH CHECK 
ADD  CONSTRAINT [cf_pregunta_publicacionCodigo] 
FOREIGN KEY([preg_id])
REFERENCES [HAVA_BEI].[publicacion] ([publ_codigo])

/*******************************************
		HAVA_BEI.publicacion
*******************************************/

ALTER TABLE [HAVA_BEI].[publicacion]  WITH CHECK 
ADD  CONSTRAINT [cf_publicacion_usuarioNombre] 
FOREIGN KEY([publ_usuario])
REFERENCES [HAVA_BEI].[usuario] ([us_nombre])

ALTER TABLE [HAVA_BEI].[publicacion]  WITH CHECK 
ADD  CONSTRAINT [cf_publicacion_VisibilidadCodigo] 
FOREIGN KEY([publ_visibilidad])
REFERENCES [HAVA_BEI].[visibilidad_publicacion] ([vipu_codigo])

/*******************************************
			HAVA_BEI.rol
*******************************************/



/*******************************************
		HAVA_BEI.rol_funcionalidad
*******************************************/

ALTER TABLE [HAVA_BEI].[rol_funcionalidad]  WITH CHECK 
ADD  CONSTRAINT [cf_rolFuncionalidad_funcionalidadCodigo] 
FOREIGN KEY([rolfun_funcionalidad])
REFERENCES [HAVA_BEI].[funcionalidad] ([fun_codigo])

ALTER TABLE [HAVA_BEI].[rol_funcionalidad]  WITH CHECK 
ADD  CONSTRAINT [cf_rolFuncionalidad_rolID] 
FOREIGN KEY([rolfun_rol])
REFERENCES [HAVA_BEI].[rol] ([rol_id])

/*******************************************
			HAVA_BEI.rubro
*******************************************/



/*******************************************
		HAVA_BEI.rubro_publicacion
*******************************************/

ALTER TABLE [HAVA_BEI].[rubro_publicacion]  WITH CHECK 
ADD  CONSTRAINT [cf_rubroPub_publicacionCodigo] 
FOREIGN KEY([rubpu_publicacion])
REFERENCES [HAVA_BEI].[publicacion] ([publ_codigo])

ALTER TABLE [HAVA_BEI].[rubro_publicacion]  WITH CHECK 
ADD  CONSTRAINT [cf_rubroPub_rubroID] 
FOREIGN KEY([rubpu_rubro])
REFERENCES [HAVA_BEI].[rubro] ([rub_id])

/*******************************************
			HAVA_BEI.usuario
*******************************************/

ALTER TABLE [HAVA_BEI].[usuario]  WITH CHECK 
ADD  CONSTRAINT [cf_usuario_estadoUsuarioEstado] 
FOREIGN KEY([us_estado])
REFERENCES [HAVA_BEI].[estados_usuario] ([estus_estado])

/*******************************************
			HAVA_BEI.usuario_rol
*******************************************/

ALTER TABLE [HAVA_BEI].[usuario_rol]  WITH CHECK 
ADD  CONSTRAINT [cf_usuarioRol_rolID] 
FOREIGN KEY([usrol_rol])
REFERENCES [HAVA_BEI].[rol] ([rol_id])

ALTER TABLE [HAVA_BEI].[usuario_rol]  WITH CHECK 
ADD  CONSTRAINT [cf_usuarioRol_usuarioNombre] 
FOREIGN KEY([usrol_usuario])
REFERENCES [HAVA_BEI].[usuario] ([us_nombre])

/*******************************************
	   HAVA_BEI.visibilidad_publicacion
*******************************************/


/****************************************************************************************************

										CREAMOS FUNCIONES
										
*****************************************************************************************************/

if OBJECT_ID(N'HAVA_BEI.existeObjeto') is not null
	drop function HAVA_BEI.existeObjeto
	
GO
-- FUNCIÓN PARA SABER SI UN OBJETO EXISTE EN LA BASE DE DATOS, COMO TABLAS O RESTRICCIONES*/
	
create function HAVA_BEI.existeObjeto (@nombreDelObjeto nvarchar(50)) returns int
as
begin
	declare @res int
	select @res = count(*)
	from sysobjects
	where	name = @nombreDelObjeto
	return @res
end

GO

if OBJECT_ID(N'HAVA_BEI.generoUsuario') is not null
	drop function HAVA_BEI.generoUsuario
	
GO

-- FUNCIÓN PARA GENERAR UN NOMBRE DE USUARIO A LOS CLIENTES DE LA PLATAFORMA.

create function HAVA_BEI.generoUsuario(@identificacion nvarchar(50)) returns nvarchar(50)
as
begin
	/*	POR AHORA CREO EL NOMBRE DE CUALQUIER MANERA, LUEGO SI AMERITA SE CAMBIA, ES PARA HACER EL INSERT MASIVO
		Y NO TENER QUE CAMBIARLO LUEGO */
		
	/*	EL PARÁMETRO IDENTIFICACIÓN ES UN VALOR QUE IDENTIFICA A LA ENTIDAD QUE ESTOY QUERIENDO ASIGNARLE UN NOMBRE
		DE USUARIO, YA SEA UNA PERSONA O UNA EMPRESA, Y ES CHAR PORQUE EL CUIT DE LAS EMPRESAS SON DE ESE TIPO, Y 
		LOS DNI DE LAS PERSONAS LO TRANSFORMAREMOS ANTES DE PASARLO A LA FUNCIÓN. */
	
	/*	EL NOMBRE DE USUARIO PUEDE TENER MÁXIMO 15 CARACTERES, SI ES MAS LARGO RETORNO 1 */
	
--	declare @result nvarchar(50)
	
	if len(@identificacion) > 15 
		set @identificacion = 'ERROR'
		
-- VERIFICAMOS QUE NO EXISTA EL USUARIO
	select @identificacion = 'ERROR'
	from HAVA_BEI.usuario
	where	us_nombre = @identificacion

--	select @result = rtrim(ltrim(@identificacion)) + ltrim(rtrim(convert(nvarchar(50), COUNT(*))))
--	from HAVA_BEI.usuario
	
--	return @result
	return @identificacion
end

GO

if OBJECT_ID(N'HAVA_BEI.generoClave') is not null
	drop function HAVA_BEI.generoClave
	
GO

-- FUNCIÓN PARA GENERAR UNA CLAVE A LOS CLIENTES DE LA PLATAFORMA.

create function HAVA_BEI.generoClave(@identificacion nvarchar(50)) returns nvarchar(50)
as
begin

	/*	LA CLAVE TIENE UNA LONGITUD MÁXIMA DE 30, SI ES MAS LARGO DEVOLVEMOS ERROR */
	
	if len(@identificacion) > 30 
		set @identificacion = 'ERROR'
	
	return @identificacion
end

GO
/****************************************************************************************************

										IMPORTAMOS DATOS
										
*****************************************************************************************************/

-- ESTADOS USUARIOS

INSERT INTO HAVA_BEI.estados_usuario(estus_estado, estus_descripcion) VALUES (0, 'CORRECTO')
INSERT INTO HAVA_BEI.estados_usuario(estus_estado, estus_descripcion) VALUES (1, 'BLOQUEADO POR INGRESO INCORRECTO')
INSERT INTO HAVA_BEI.estados_usuario(estus_estado, estus_descripcion) VALUES (2, 'DADO DE BAJA')
INSERT INTO HAVA_BEI.estados_usuario(estus_estado, estus_descripcion) VALUES (3, 'BLOQUEADO POR DEUDA DE COMISIONES')
GO
-- VISIBILIDAD PUBLICACIÓN

INSERT INTO [GD1C2014].[HAVA_BEI].[visibilidad_publicacion]
           ([vipu_codigo] ,[vipu_costo] ,[vipu_descripcion], [vipu_duracion] ,[vipu_porcentaje_ventas])               
select Publicacion_Visibilidad_Cod, Publicacion_Visibilidad_Precio, Publicacion_Visibilidad_Desc, DATEDIFF(DAY, Publicacion_Fecha, Publicacion_Fecha_Venc), CONVERT(INT, Publicacion_Visibilidad_Porcentaje * 100)
from gd_esquema.Maestra
group by Publicacion_Visibilidad_Cod, Publicacion_Visibilidad_Precio, Publicacion_Visibilidad_Desc, Publicacion_Visibilidad_Porcentaje, DATEDIFF(DAY, Publicacion_Fecha, Publicacion_Fecha_Venc)
order by Publicacion_Visibilidad_Cod
GO
-- CLIENTE

/**********************************/
/*			IMPORTANTE			  */
/**********************************/
--CONSULTAR EL VALOR DEL CAMPO US_ESTADO, Y SI LE PONEMOS A PRIMERA VEZ, 'S' SI ES VERDAD O 'N' SI YA TIENE ALGÚN INGRESO AL SISTEMA 

-- CURSOR PARA RECORRER TODOS LOS CLIENTES E IR DE A UNO INSERTANDO UN REGISTRO EN LA TABLA DE USUARIOS

-- VARIABLES PARA EL CURSOR
declare @cliente numeric(18,0)

-- VARIABLES PARA EL PROCESO
declare @nombreUsuario nvarchar(15)
declare @contraseña nvarchar(30)

-- TABLA TEMPORAL PARA INSERTAR LOS CLIENTES
select  [Cli_Apeliido], [Cli_Cod_Postal], 0 as cli_cuil, -- averiguar el cuil
		[Cli_Dom_Calle], [Cli_Depto], 'averiguar la localidad' as cli_localidad,
		[Cli_Nro_Calle], [Cli_Piso], [Cli_Fecha_Nac],
		[Cli_Mail], [Cli_Nombre], [Cli_Dni],
		0 as cli_telefono, /* averiguar el tel */ 3 as cli_tipDNI /* averiguar el tipo de dni */
into #CLIENTES
from gd_esquema.Maestra
where Cli_Dni is not null
group by [Cli_Dni] ,[Cli_Apeliido] ,[Cli_Nombre]
		 ,[Cli_Fecha_Nac] ,[Cli_Mail] ,[Cli_Dom_Calle]
		 ,[Cli_Nro_Calle] ,[Cli_Piso] ,[Cli_Depto]
		 ,[Cli_Cod_Postal]

declare c_clientes cursor for
--SELECT
SELECT [Cli_Dni]
FROM #clientes
order by [Cli_Dni]

open c_clientes

fetch next from c_clientes into @cliente

while (@@FETCH_STATUS = 0 )
begin
	-- LLAMO A LAS FUNCIONES CON EL CLIENTE ACTUAL, PARA QUE GENERE LOS DATOS
	set @nombreUsuario = HAVA_BEI.generoUsuario(@cliente)
	
	if @nombreUsuario = 'ERROR'
		print 'HUBO UN ERROR CON EL NOMBRE DE USUARIO'
	else
	begin
		set @contraseña = HAVA_BEI.generoClave(@cliente)
		if @contraseña = 'ERROR'
			print 'HUBO UN ERROR CON LA CONTRASEÑA'
		else
		begin
			-- HACEMOS EL INSERT EN LA TABLA DE USUARIOS			
			insert into HAVA_BEI.usuario(us_clave, us_estado, us_nombre, us_primera_vez, us_intentosFallidos)
								values(@contraseña, 0, @nombreUsuario, 'S', 0)

			-- HACEMOS EL INSERT EN LA TABLA DE CLIENTES
			insert into HAVA_BEI.cliente(clie_apellido, clie_cod_pos, clie_cuil,
										 clie_dir_calle, clie_dir_depto, clie_dir_localidad,
										 clie_dir_numero, clie_dir_piso, clie_fec_nac,
										 clie_mail, clie_nombre, clie_numero_doc,
										 clie_telefono, clie_tipo_doc, clie_usuario)
								 select  *, @nombreUsuario
								 from #clientes
								 where	Cli_Dni = @cliente
		end -- end if contraseña
	end -- end if usuario
										  
	fetch next from c_clientes into @cliente
end

-- CERRAMOS EL CURSOR
close c_clientes
deallocate c_clientes

-- ELIMINAMOS LA TABLA TEMPORAL
drop table #CLIENTES
GO
-- EMPRESA

-- CURSOR PARA RECORRER TODOS LAS EMPRESAS E IR DE A UNA INSERTANDO UN REGISTRO EN LA TABLA DE USUARIOS

-- VARIABLES PARA EL CURSOR
declare @empresa nvarchar(50)

-- VARIABLES PARA EL PROCESO
declare @nombreUsuario nvarchar(15)
declare @contraseña nvarchar(30)

-- TABLA TEMPORAL PARA INSERTAR LAS EMPRESAS
SELECT 'CIUDAD' as empr_ciudad
      ,[Publ_Empresa_Cod_Postal],
      'CONTACTO' as empr_contacto
      ,[Publ_Empresa_Cuit]
      ,[Publ_Empresa_Dom_Calle]
      ,[Publ_Empresa_Depto],
      'LOCALIDAD' as localidad
	  ,[Publ_Empresa_Nro_Calle]
      ,[Publ_Empresa_Piso]
      ,[Publ_Empresa_Fecha_Creacion]
      ,[Publ_Empresa_Mail],
      [Publ_Empresa_Razon_Social],
      'TELÉFONO' as telefono -- TELÉFONO
INTO #empresas
  FROM [GD1C2014].[gd_esquema].[Maestra]
WHERE	Publ_Empresa_Cuit IS NOT NULL
group by [Publ_Empresa_Razon_Social]
      ,[Publ_Empresa_Cuit]
      ,[Publ_Empresa_Fecha_Creacion]
      ,[Publ_Empresa_Mail]
      ,[Publ_Empresa_Dom_Calle]
      ,[Publ_Empresa_Nro_Calle]
      ,[Publ_Empresa_Piso]
      ,[Publ_Empresa_Depto]
      ,[Publ_Empresa_Cod_Postal]
order by [Publ_Empresa_Cuit]

declare c_empresa cursor for
SELECT [Publ_Empresa_Cuit]
  FROM #empresas
order by [Publ_Empresa_Cuit]

open c_empresa

fetch next from c_empresa into @empresa

while (@@FETCH_STATUS = 0 )
begin
	-- LLAMO A LAS FUNCIONES CON EL CLIENTE ACTUAL, PARA QUE GENERE LOS DATOS
	set @nombreUsuario = HAVA_BEI.generoUsuario(@empresa)
	
	if @nombreUsuario = 'ERROR'
		print 'HUBO UN ERROR CON EL NOMBRE DE USUARIO'
	else
	begin
		set @contraseña = HAVA_BEI.generoClave(@empresa)
		if @contraseña = 'ERROR'
			print 'HUBO UN ERROR CON LA CONTRASEÑA'
		else
		begin
			-- HACEMOS EL INSERT EN LA TABLA DE USUARIOS			
			insert into HAVA_BEI.usuario(us_clave, us_estado, us_nombre, us_primera_vez, us_intentosFallidos)
								values(@contraseña, 0, @nombreUsuario, 'S', 0)
			-- HACEMOS EL INSERT EN LA TABLA DE EMPRESAS
			INSERT INTO [GD1C2014].[HAVA_BEI].[empresa]([empr_ciudad], [empr_cod_pos], [empr_contacto],
														[empr_cuit], [empr_dir_calle], [empr_dir_depto],
														[empr_dir_localidad], [empr_dir_numero], [empr_dir_piso],
														[empr_fecha], [empr_mail], [empr_razon],
														[empr_telefono], [empr_usuario])
												select *, @nombreUsuario
												from #empresas
												where	Publ_Empresa_Cuit = @empresa
		end -- if contraseña
	end -- if usuario
	
	fetch next from c_empresa into @empresa
end

-- CERRAMOS EL CURSOR
close c_empresa
deallocate c_empresa

-- ELIMINAMOS LA TABLA TEMPORAL
drop table #empresas
GO
-- PUBLICACIÓN

-- PONEMOS COMO QUE TODAS LAS PUBLICACIONES ACTUALES ADMITEN PREGUNTAS.

INSERT INTO [GD1C2014].[HAVA_BEI].[publicacion]
           ([publ_codigo]
           ,[publ_descripcion]
           ,[publ_estado]
           ,[publ_fecha_fin]
           ,[publ_fecha_ini]
           ,[publ_precio_in]
           ,[publ_preguntas]
           ,[publ_stock]
           ,[publ_tipo]
           ,[publ_usuario]
           ,[publ_visibilidad])
select Publicacion_Cod, Publicacion_Descripcion, Publicacion_Estado, Publicacion_Fecha_Venc, Publicacion_Fecha, Publicacion_Precio,
		'S' as preg, Publicacion_Stock, Publicacion_Tipo, clie_usuario, Publicacion_Visibilidad_Cod
from gd_esquema.Maestra, HAVA_BEI.cliente
where [Publ_Cli_Dni] is not null
and	clie_numero_doc = [Publ_Cli_Dni]
group by [Publ_Cli_Dni], Publicacion_Cod, Publicacion_Descripcion, Publicacion_Estado, Publicacion_Fecha_Venc, Publicacion_Fecha,
		Publicacion_Precio, Publicacion_Stock, Publicacion_Tipo, clie_usuario, Publicacion_Visibilidad_Cod
--order by Publicacion_Cod
union all
select Publicacion_Cod, Publicacion_Descripcion, Publicacion_Estado, Publicacion_Fecha_Venc, Publicacion_Fecha, Publicacion_Precio,
		'S' as preg, Publicacion_Stock, Publicacion_Tipo, empr_usuario, Publicacion_Visibilidad_Cod
from gd_esquema.Maestra, HAVA_BEI.empresa
where [Publ_Empresa_Cuit] is not null
and	empr_cuit = [Publ_Empresa_Cuit]
group by [Publ_Empresa_Cuit], Publicacion_Cod, Publicacion_Descripcion, Publicacion_Estado, Publicacion_Fecha_Venc, Publicacion_Fecha,
		Publicacion_Precio, Publicacion_Stock, Publicacion_Tipo, empr_usuario, Publicacion_Visibilidad_Cod 
order by Publicacion_Cod
GO
-- COMPRAS

INSERT INTO [GD1C2014].[HAVA_BEI].[compras]
           ([comp_comision]
           ,[comp_comprador]
           ,[comp_fecha]
           ,[comp_publicacion]
           ,[comp_unidades])
select Publicacion_Visibilidad_Porcentaje, clie_usuario, Compra_Fecha, Publicacion_Cod, Compra_Cantidad
from gd_esquema.Maestra, HAVA_BEI.cliente
where	Compra_Fecha is not null
and		Cli_Dni = clie_numero_doc
and		Calificacion_Codigo is null
order by Publicacion_Cod
GO
-- FACTURACIÓN

INSERT INTO [GD1C2014].[HAVA_BEI].[facturacion]
           ([fact_id]
           ,[fact_forma_pago]
           ,[fact_precio_total]
           ,[fact_usuario]
           ,[fact_fecha])
select Factura_Nro, Forma_Pago_Desc, Factura_Total, clie_usuario, Factura_Fecha
from gd_esquema.Maestra, HAVA_BEI.cliente
where	Factura_Nro is not null
and		Publ_Cli_Dni is not null
and		Publ_Cli_Dni = clie_numero_doc
group by Factura_Nro, Forma_Pago_Desc, Factura_Total, clie_usuario, Factura_Fecha
union all
select Factura_Nro, Forma_Pago_Desc, Factura_Total, empr_usuario, Factura_Fecha
from gd_esquema.Maestra, HAVA_BEI.empresa
where	Factura_Nro is not null
and		Publ_Empresa_Cuit is not null
and		Publ_Empresa_Cuit = empr_cuit
group by Factura_Nro, Forma_Pago_Desc, Factura_Total, empr_usuario, Factura_Fecha
order by Factura_Nro
GO
-- FUNCIONALIDAD

insert into HAVA_BEI.funcionalidad(fun_codigo, fun_descripcion) values ( 1, 'Login y Seguridad')
insert into HAVA_BEI.funcionalidad(fun_codigo, fun_descripcion) values ( 2, 'ABM de Rol')
insert into HAVA_BEI.funcionalidad(fun_codigo, fun_descripcion) values ( 3, 'Registro de Usuario')
insert into HAVA_BEI.funcionalidad(fun_codigo, fun_descripcion) values ( 4, 'ABM de Cliente (comprador/vendedor')
insert into HAVA_BEI.funcionalidad(fun_codigo, fun_descripcion) values ( 5, 'ABM de Empresa (vendedor)')
insert into HAVA_BEI.funcionalidad(fun_codigo, fun_descripcion) values ( 6, 'ABM de Rubro')
insert into HAVA_BEI.funcionalidad(fun_codigo, fun_descripcion) values ( 7, 'ABM de Visibilidad de Publicación')
insert into HAVA_BEI.funcionalidad(fun_codigo, fun_descripcion) values ( 8, 'Generar Publicación')
insert into HAVA_BEI.funcionalidad(fun_codigo, fun_descripcion) values ( 9, 'Editar Publicación')
insert into HAVA_BEI.funcionalidad(fun_codigo, fun_descripcion) values (10, 'Gestión de Preguntas')
insert into HAVA_BEI.funcionalidad(fun_codigo, fun_descripcion) values (11, 'Comprar/Ofertar')
insert into HAVA_BEI.funcionalidad(fun_codigo, fun_descripcion) values (12, 'Historial del Cliente')
insert into HAVA_BEI.funcionalidad(fun_codigo, fun_descripcion) values (13, 'Calificar al vendedor')
insert into HAVA_BEI.funcionalidad(fun_codigo, fun_descripcion) values (14, 'Facturar Publicaciones')
insert into HAVA_BEI.funcionalidad(fun_codigo, fun_descripcion) values (15, 'Listado Estadístico')
GO
-- ROL

-- 'S' = ACTIVO
-- 'N' = DESACTIVADO

INSERT INTO [GD1C2014].[HAVA_BEI].[rol] ([rol_id], [rol_activo] ,[rol_nombre]) values(2, 'S', 'ADMINISTRATIVO')
INSERT INTO [GD1C2014].[HAVA_BEI].[rol] ([rol_id], [rol_activo] ,[rol_nombre]) values(3, 'S', 'CLIENTE')
INSERT INTO [GD1C2014].[HAVA_BEI].[rol] ([rol_id], [rol_activo] ,[rol_nombre]) values(1, 'S', 'EMPRESA')
GO
-- RUBRO

declare @rubro as table(codigo tinyint identity(1,1), descripcion nvarchar(255))
insert into @rubro 
select m.Publicacion_Rubro_Descripcion
from gd_esquema.Maestra m
group by m.Publicacion_Rubro_Descripcion
order by m.Publicacion_Rubro_Descripcion

INSERT INTO [GD1C2014].[HAVA_BEI].[rubro] 
				([rub_codigo], [rub_descripcion]) 
			select codigo, descripcion
			from @rubro r
			order by r.descripcion
GO
-- TIPO_DOCUMENTO

INSERT INTO HAVA_BEI.tipo_documento(tipdoc_codigo, tipdoc_detalle, tipdoc_sigla) values (0, 'DOCUMENTO NACIONAL DE IDENTIDAD', 'DNI')
INSERT INTO HAVA_BEI.tipo_documento(tipdoc_codigo, tipdoc_detalle, tipdoc_sigla) values (1, 'LIBRETA CÍVICA', 'LC')
INSERT INTO HAVA_BEI.tipo_documento(tipdoc_codigo, tipdoc_detalle, tipdoc_sigla) values (2, 'LIBRETA DE ENROLAMIENTO', 'LE')
INSERT INTO HAVA_BEI.tipo_documento(tipdoc_codigo, tipdoc_detalle, tipdoc_sigla) values (3, 'TIPO DE DOCUMENTO DESCONOCIDO', '')
GO
-- CALIFICACIÓN

-- SELECT DEL CÓDIGO DE CALIFICACIÓN, EL NOMBRE DE USUARIO, LA CALIFICACIÓN LA CAMBIAMOS PARA QUE SEA ENTRE UNO Y CINCO
-- Y EL DETALLE. AGRUPO PORQUE HAY REGISTROS COMO POR EJ LA CALIFICACIÓN 17720 Y 17721 QUE SON LA MISMA PERSONA, EN LA
-- MISMA PUBLICACIÓN Y COMPRÓ A LA MISMA HORA, ENTONCES NO PUEDO UNIR LAS TABLAS SIN QUE ME DUPLIQUE CADA UNO DE ESOS
-- DOS REGISTROS, DEJANDO DOS FILAS EXACTAMENTE IGUALES.

INSERT INTO [GD1C2014].[HAVA_BEI].[calificacion]
           ([calif_codigo]
           ,[calif_compra]
           ,[calif_puntos]
           ,[calif_detalle])
select Calificacion_Codigo, u.us_nombre,
								case when Calificacion_Cant_Estrellas between 1 and 2 then 1
									 when Calificacion_Cant_Estrellas between 3 and 4 then 2
									 when Calificacion_Cant_Estrellas between 5 and 6 then 3
									 when Calificacion_Cant_Estrellas between 7 and 8 then 4
									 when Calificacion_Cant_Estrellas between 9 and 10 then 5
									 else 0 end calif,
									 Calificacion_Descripcion
from gd_esquema.Maestra m, HAVA_BEI.cliente c, HAVA_BEI.usuario u, HAVA_BEI.compras co
where	m.Calificacion_Codigo is not null
and		m.Cli_Dni = c.clie_numero_doc
and		c.clie_usuario = u.us_nombre
and		m.Publicacion_Cod = co.comp_publicacion
and		u.us_nombre = co.comp_comprador
and		m.Compra_Fecha = co.comp_fecha
group by Calificacion_Codigo, u.us_nombre,
								case when Calificacion_Cant_Estrellas between 1 and 2 then 1
									 when Calificacion_Cant_Estrellas between 3 and 4 then 2
									 when Calificacion_Cant_Estrellas between 5 and 6 then 3
									 when Calificacion_Cant_Estrellas between 7 and 8 then 4
									 when Calificacion_Cant_Estrellas between 9 and 10 then 5
									 else 0 end,
									 Calificacion_Descripcion
order by Calificacion_Codigo
GO
-- ITEM FACTURA

-- TABLA PARA SABER QUE PUBLICACIONES SON GRATUITAS Y CUALES NO

select publicacion_cod
into #gratuitas
from gd_esquema.Maestra
where	Publicacion_Visibilidad_Cod = 10006
group by Publicacion_Cod
order by Publicacion_Cod

-- HAGO ESA DIFERENCIA PORQUE LAS GRATUITAS NO TIENEN NI GASTO POR PUBLICAR NI COMISIÓN POR VENDER, ENTONCES TODOS LOS ITEM_FACTURA_MONTO SON CERO
-- ¿POR QUÉ ESA DIFERENCIA?, PORQUE HAGO UN NOT IN CON LOS VALORES DE LAS PUBLICACIONES, QUE SON 0, 60, 100, 140, 180, PARA ELIMINAR EL RENGLÓN QUE FACTURA EL COSTO DE LA PUBLICACIÓN EN SI
-- ENTONCES LAS GRATUITAS SE FILTRAN LAS FILAS QUE CORRESPONDE A LOS PRODUCTOS TAMBIÉN POR SER TODAS CERO


-- EN ESTE SELECT TOMO TODAS LAS PUBLICACIONES QUE SON PAGAS (O SEA TIENEN QUE PAGAR COMISIÓN POR VENTAS), LOS DATOS QUE ME FALTAN PARA LLENAR LA TABLA ITEM_FACTURA, ES EL NÚMERO DE FACTURA
-- Y EL TOTAL DEL ITEM FACTURADO, PARA ENCONTRAR EL PRIMER DATO HAGO UN SUBSELECT A LA TABLA MAESTRA, IGUALO LA PUBLICACIÓN Y BUSCO ALGUNA FILA QUE NO TENGA EL NÚMERO DE FACTURA EN NULL
-- TOTAL TODAS LAS FILAS TIENEN EL MISMO VALOR.
-- PARA EL SEGUNDO VALOR, LO QUE HAGO ES BUSCAR LA PUBLICACIÓN, QUE EL ITEM_FACTURA_CANTIDAD SEA IGUAL A LAS UNIDADES DE LA VENTA (DE LA TABLA COMPRAS) Y QUE EL MONTO NO SEA -0, 60, 100, 140, 180-
-- PARA EXCLUIR LOS REGISTROS DEL COBRO DE LA PUBLICACIÓN EN SI.
-- LA PUBLICACIÓN 61252 LA EXCLUÍ YA QUE DEBIDO A UN MAL REDONDEO, LA COMISIÓN DE PUBLICAR Y DE DOS COMPRAS ES 180, ENTONCES PERDERÍA ESAS DOS FILAS.

INSERT INTO [GD1C2014].[HAVA_BEI].[item_factura]
           ([item_factura]
           ,[item_public]
           ,[item_monto]
           ,[item_cantidad]
           ,[item_compra]
           ,[item_comision])
SELECT (select top 1 m.Factura_Nro from gd_esquema.Maestra m where m.Publicacion_Cod = comp_publicacion and m.Factura_Nro is not null) as factura,
	   [comp_publicacion],
       (select top 1 m.Item_Factura_Monto from gd_esquema.Maestra m where m.Publicacion_Cod = comp_publicacion and m.Factura_Nro is not null and m.Item_Factura_Cantidad = c.comp_unidades and m.Item_Factura_Monto not in (0, 60, 100, 140, 180)) as monto,
       [comp_unidades],
       [comp_cod],      
       [comp_comision]
FROM [GD1C2014].[HAVA_BEI].[compras] c
where	not exists (select publicacion_cod from #gratuitas where c.comp_publicacion = publicacion_cod)
and	c.comp_publicacion <> 61252
UNION ALL
SELECT (select top 1 m.Factura_Nro from gd_esquema.Maestra m where m.Publicacion_Cod = comp_publicacion and m.Factura_Nro is not null) as factura,
		 [comp_publicacion],
         (select top 1 m.Item_Factura_Monto from gd_esquema.Maestra m where m.Publicacion_Cod = comp_publicacion and m.Factura_Nro is not null and m.Item_Factura_Cantidad = c.comp_unidades) as cantidad,
         [comp_unidades],
		 [comp_cod],      
		 [comp_comision]
FROM [GD1C2014].[HAVA_BEI].[compras] c
where	exists (select publicacion_cod from #gratuitas where c.comp_publicacion = publicacion_cod)
or	c.comp_publicacion = 61252
order by c.comp_publicacion

-- EN ESTE OTRO SELECT HAGO LO MISMO QUE ARRIBA, SOLO QUE PARA OBTENER LA CANTIDAD SOLO IGUALO LA PUBLICACIÓN, EL NÚMERO DE FACTURA QUE SEA DISTINTO DE NULL Y LA CANTIDAD, AUNQUE BIEN PODRÍA PONER
-- DIRECTAMENTE UN CERO, Y ADEMÁS INCLUYO LA CAUSA 61252 YA QUE AHORA NO ME IMPORTA SI ME TRAE EL COSTO DE PUBLICAR PARA EL ITEM_FACTURA_CANTIDAD IGUAL A UNO (HAY DOS FILAS CON UNA COMPRA Y LA TER
-- CERA ES LA PUBLICACIÓN, PERO TODAS SON 180, ASÍ QUE ES LO MISMO).

-- ELIMINAMOS LA TABLA TEMPORAL
drop table #gratuitas

-- INSERTAMOS LAS FACTURAS DE LAS COMISIONES POR PUBLICAR

-- BUSCO LOS REGISTROS CON ITEM_FACTURA_CANTIDAD IGUAL A UNO, YA QUE LAS PUBLICACIONES SE FACTURAN DE A UNA, Y ME FIJO QUE EL VALOR TIENE QUE SER
-- ALGUNO DE LOS VALORES QUE CUESTAN LAS PUBLICACIONES, ADEMÁS AGRUPO PARA ELIMINAR RESULTADOS EXACTAMENTE IGUALES.

INSERT INTO [GD1C2014].[HAVA_BEI].[item_factura]
           ([item_factura]
           ,[item_public]
           ,[item_monto]
           ,[item_cantidad]
           ,[item_compra]
           ,[item_comision])
SELECT m.[Factura_Nro],
	   m.[Publicacion_Cod],
       m.[Item_Factura_Monto],
       m.[Item_Factura_Cantidad],
       NULL, -- NO TIENE UNA COMPRA ASOCIADA
       NULL  -- NO TIENE UN PORCENTAJE DE COMISIÓN
  FROM [GD1C2014].[gd_esquema].[Maestra] m
where	Item_Factura_Monto in (0, 60, 100, 140, 180)
and		Item_Factura_Cantidad = 1
group by m.[Publicacion_Cod],
       m.[Item_Factura_Monto],
       m.[Item_Factura_Cantidad],
       m.[Factura_Nro]
order by Publicacion_Cod
GO
-- OFERTA

INSERT INTO [GD1C2014].[HAVA_BEI].[oferta]
           ([ofer_publicacion]
           ,[ofer_precio]
           ,[ofer_oferente]
           ,[ofer_fecha])
SELECT m.Publicacion_Cod, m.Oferta_Monto, c.clie_usuario,  m.Oferta_Fecha
FROM gd_esquema.Maestra m, HAVA_BEI.cliente c
where	Oferta_Monto is not null
and		c.clie_numero_doc = m.Cli_Dni
GO
-- RUBRO PUBLICACIÓN

INSERT INTO [GD1C2014].[HAVA_BEI].[rubro_publicacion]
           ([rubpu_publicacion]
           ,[rubpu_rubro])
select m.Publicacion_Cod, r.rub_codigo
from gd_esquema.Maestra m, HAVA_BEI.rubro r
where	r.rub_descripcion = m.Publicacion_Rubro_Descripcion
group by m.Publicacion_Cod, r.rub_codigo
GO


/****************************************************************************************************

										CREAMOS PROCEDIMIENTOS
										
*****************************************************************************************************/

CREATE PROC [HAVA_BEI].[ALTA_FUN] (@auxnombre as char (100), @retorno as INT output) AS
BEGIN
--OBJETIVO: REALIZA EL ALTA DE UNA FUNCIONALIDAD
--PARAMETROS: INGRESA EL NOMBRE DE LA FUNCIONALIDAD, Y RETORNA EL EXITO DE LA FUNCION
	DECLARE @CONTADOR smallINT;
	SET @CONTADOR = 0;
	set @retorno = 0;	
	SELECT @CONTADOR = COUNT(*) FROM funcionalidad   
--VERIFICA QUE EXISTA ALGUNA FUNCIONALIDAD	
	if (@CONTADOR>0)
	  BEGIN
	   SELECT @CONTADOR = COUNT(*) FROM funcionalidad where @auxnombre = FUN_DESCRIPCION
--VERIFICA QUE EXISTA ALGUNA FUNCIONALIDAD	
	   if @CONTADOR = 0
	    begin
--NO EXISTE OTRA FUNCIONALIDAD Y LA INSERTA
	     SELECT @CONTADOR = MAX(FUN_CODIGO) FROM funcionalidad   
	     insert INTO funcionalidad (fun_codigo,fun_descripcion) VALUES (@CONTADOR + 1, @auxnombre)
	    end
	   ELSE
	    BEGIN
-- YA EXISTE ESA FUNCIONALIDAD
	     SET @retorno = 1;
	    END 
	  END
	else
	 begin
-- CARGA LA PRIMERA FUNCIONALIDAD
	  insert INTO funcionalidad (fun_codigo,fun_descripcion) VALUES (@CONTADOR + 1, @auxnombre)
	 end
END
GO


CREATE PROC [HAVA_BEI].[ALTA_ROL] (@auxnombre as char (100), @retorno as INT output) AS
BEGIN
-- OBJETIVO: REALIZA EL ALTA DEL ROL
-- PARAMETROS: INGRESA EL NOMBRE DEL ROL, RETORNA EL EXITO DE LA PROC 
	DECLARE @CONTADOR smallINT;
	DECLARE @CONTADOR2 smallINT;
	SET @CONTADOR = 0;
	SELECT @CONTADOR = COUNT(*) FROM ROL  
-- VALIDA QUE NO SE CARGUEN MAS DE 3 ROLES
	IF (@CONTADOR >= 3)
	 BEGIN
	  set @retorno = 'F';
	 END 
	ELSE
	 begin
	  SELECT @CONTADOR2 = COUNT(*) FROM ROL  WHERE @auxnombre = ROL_NOMBRE
-- VERIFICA QUE NO EXISTA EL ROL INGRESADO
	  IF (@CONTADOR2 = 0)
	   BEGIN  
	    insert INTO ROL (ROL_ACTIVO,ROL_NOMBRE) VALUES ('A', @auxnombre);
	    set @retorno = 0;
	   END
	  ELSE
	   BEGIN
	    set @retorno = 1;
	   END 
	 end	
END
GO


CREATE PROC [HAVA_BEI].[ALTA_rolxfun] (@ROL as smallint, @FUNC as smallint, @RETORNO as INT OUTPUT) AS
BEGIN
--OBJETIVO: DAR ALTA DE UNA RELACION DE ROL Y FUNCION
--PARAMETROS: INGRESA EL ROL, LA FUNCIONALIDAD, Y RETORNA EL EXITO DEL PROC
	DECLARE @CONTRXF INT;
	DECLARE @CONTROL INT;
	DECLARE @CONTFUN INT;
	SET @CONTRXF = 0;
	SELECT @CONTROL = COUNT(*) FROM ROL	where @ROL = rol_id
	SELECT @CONTFUN = COUNT(*) FROM funcionalidad	where @FUNC = fun_codigo
--VERIFICA QUE EXISTA UN UNICO ROL Y UNA UNICA FUNCIONALIDAD
	IF (@CONTROL = 1) AND (@CONTFUN = 1)
	 BEGIN
		SELECT @CONTRXF = COUNT(*) FROM rol_funcionalidad 
		where rolfun_funcionalidad = @FUNC AND rolfun_rol = @ROL
--VERIFICA QUE NO EXISTA LA RELACION ENTRE EL ROL Y LA FUNCIONALIDAD
	  	 if (@CONTRXF=0)
		  BEGIN
		   insert INTO rol_funcionalidad (rolfun_rol,rolfun_funcionalidad) VALUES (@ROL, @FUNC)
	       SET @RETORNO = 0;
          END
         ELSE
          BEGIN
           SET @RETORNO = 1;
          END
     END      
END
GO


CREATE PROC [HAVA_BEI].[ALTA_rolxUSU] (@ROL as SMALLINT, @user as char(15), @RETORNO as INT OUTPUT) AS
BEGIN
--OBJETIVO: DAR DE ALTA UNA RELACION ENTRE UN ROL Y UN USUARIO
--PARAMETRO: SE INGRESAN NOMBRE DEL ROL, EL USUARIO, Y RETORNA EL EXITO DE LA PROC
	DECLARE @CONTRXF INT;
	DECLARE @CONTROL smallINT;
	SET @CONTRXF = 0;
	SELECT @CONTROL = COUNT(*) FROM ROL	where @ROL = rol_id and rol_activo = 'A'
-- VERIFICA QUE EXISTA EL ROL INDICADO EN EL PARAMETRO Y QUE ESTE ACTIVO
	IF (@CONTROL = 1)
	 BEGIN
		SELECT @CONTRXF = COUNT(*) FROM usuario_rol
		where usrol_usuario = @user AND usrol_rol = @ROL
-- VERIFICA QUE NO EXISTA DE ANTES DICHA RELACION
	  	 if (@CONTRXF=0)
		  BEGIN
		   insert INTO usuario_rol (usrol_usuario,usrol_rol) VALUES (@user,@rol)
	       SET @RETORNO = 0;
          END
         ELSE
          BEGIN
           SET @RETORNO = 1;
          END
     END      
END
GO


CREATE PROC [HAVA_BEI].[ALTA_usu] (@auxnombre as char (15), @auxpass as char (30), @retorno as INT output) AS
BEGIN
--OBJETIVO: REALIZA EL ALTA DEL USUARIO
--PARAMETRO: INGRESA EL USUARIO, LA PASSWORD Y RETORNA EL EXITO DE LA PROC
	DECLARE @CONTADORUSU INT;
	SET @CONTADORUSU = 0;
	SELECT @CONTADORUSU = COUNT(*) FROM USUARIO where @auxnombre = us_NOMBRE
--VERIFICA QUE NO EXISTA EL USUARIO
	if (@CONTADORUSU > 0) 
	 begin
      set @retorno = 1; 
 	 end
	else
  	 begin   
-- para encriptar una pass se usa HASHBYTES('SHA2_256',@auxpass).. no la pude usar porque me lo toma como null
-- ver mas adelante si lo modificamos
	  insert INTO USUARIO (us_nombre,us_clave,us_intentosFallidos,us_estado,us_primera_vez) VALUES (@auxnombre, @auxpass,0,0,'N')
	   set @retorno = 0;
	end
END
GO


CREATE PROC [HAVA_BEI].[BAJA_FUN] (@FUNC as SMALLINT, @retorno as INT output) AS
BEGIN  
--OBJETIVO: REALIZA LA BAJA DE UNA FUNCIONALIDAD
--PARAMETRO: SE INGRESA EL NOMBRE DE LA FUNCIONALIDAD, Y RETORNA EL EXITO DE LA PROC
	DECLARE @CONTADOR INT;
	SET @CONTADOR = 0;
	SELECT @CONTADOR = COUNT(*) FROM FUNCIONALIDAD where fun_codigo = @FUNC
--VERIFICA QUE EXISTA LA FUNCIONALIDAD INGRESADA
	if @CONTADOR = 0 or @CONTADOR > 1
		begin
		 set @retorno = 1;
		end;
	else
	    begin 
		 delete from funcionalidad WHERE fun_codigo = @FUNC;
		 set @retorno = 0;
	    end;
END
GO


CREATE PROC [HAVA_BEI].[BAJA_ROL] (@ROL as SMALLINT, @retorno as INT OUTPUT) AS
BEGIN  
--OBJETIVO: REALIZA LA BAJA DEL ROL
--PARAMETROS: SE INGRESA EL ROL, Y RETORNA EL EXITO DE LA PROC
	DECLARE @CONTADOR INT;
	SET @CONTADOR = 0;
	SELECT @CONTADOR = COUNT(*) FROM ROL where rol_id = @ROL AND ROL_ACTIVO = 'A'
--VERIFICA QUE EXISTA UN SOLO ROL Y QUE ESTE ACTIVO
	if (@CONTADOR = 0 or @CONTADOR > 1)
		begin
		 set @retorno = 1;
		end;
	else
	    begin 
		 update ROL SET rol_activo = 'D' WHERE rol_id = @ROL AND rol_activo = 'A';
		 set @retorno = 0;
	    end;
END
GO


CREATE PROC [HAVA_BEI].[BAJA_rolxfun] (@ROL as SMALLINT, @FUNC as SMALLINT, @RETORNO as INT OUTPUT) AS
BEGIN
--OBJETIVO: REALIZA LA BAJA DE LA RELACION DEL ROL Y LA FUNCIONALIDAD
--PARAMETROS: SE INGRESA EL ROL Y LA FUNCIONALIDAD, Y RETORNA EL EXITO DE LA PROC
	DECLARE @CONTRXF INT;
	SET @CONTRXF = 0;
	SELECT @CONTRXF = COUNT(*) FROM rol_funcionalidad
	where rolfun_funcionalidad = @FUNC AND rolfun_rol = @ROL
--VERIFICA QUE EXISTA UNA UNICA RELACION    
	if (@CONTRXF=1)
	 BEGIN
	  delete from rol_funcionalidad WHERE rolfun_funcionalidad = @FUNC AND rolfun_rol = @ROL
	  SET @RETORNO = 0;
     END
    ELSE
     BEGIN
      SET @RETORNO = 1;
     END
END
GO


CREATE PROC [HAVA_BEI].[BAJA_rolxusu] (@ROL as SMALLINT, @usu as char(15), @RETORNO as INT OUTPUT) AS
BEGIN
--OBJETIVO: REALIZA LA BAJA DE LA RELACION ENTRE EL ROL Y EL USUARIO
--PARAMETRO: SE INGRESA EL ROL, EL USUARIO, Y RETORNA EL EXITO DE LA PROC
	DECLARE @CONTRXF INT;
	SET @CONTRXF = 0;
	SELECT @CONTRXF = COUNT(*) FROM usuario_rol
	where usrol_usuario = @usu AND usrol_rol = @ROL 
-- VERIFICA QUE EXISTA UNA UNICA RELACION   
	if (@CONTRXF=1)
	 BEGIN
	  delete from usuario_rol where usrol_usuario = @usu AND usrol_rol = @ROL    
	  SET @RETORNO = 0;
     END
    ELSE
     BEGIN
      SET @RETORNO = 1;
     END
END
GO


CREATE PROC [HAVA_BEI].[baja_usu] (@auxnombre as char (15)) AS
BEGIN
--OBJETIVO: REALIZA LA BAJA DEL USUARIO
--PARAMETRO: SE INGRESA EL USUARIO
	 UPDATE USUARIO SET US_ESTADO = 2 WHERE US_NOMBRE = @auxnombre;	
END
GO


create PROC [HAVA_BEI].[login] (@auxnombre as char (15), @auxpass as char (30),@auxpassnue as char (30),@auxpassconf as char (30),@idrol as smallint,@retorno as INT output) AS
BEGIN
--OBJETIVO: LOGRAR EL LOGIN DE USUARIO, TAMBIEN DESHABILITARLO SI ES ERRONEO (NO CONSIDERA COMO LOGIN A LA FUNCIONALIDAD
--PARAMETROS: SE INGRESA EL USUARIO, LA PASSWORD, Y EL CODIGO DE ROL, Y RETORNA EL EXITO DE LA PROC 
--PUBL_ESTADO = 1 INHABILITADO POR INGRESAR 3 VECES MAL LA CLAVE
	DECLARE @CONTADORUSU INT;
	declare @contadorrol smallint;
	DECLARE @cantidad_f int;
	declare @estado char(1);
	SET @CONTADORUSU = 0;
	SET @cantidad_f = 0;
	SELECT @estado = US_ESTADO FROM USUARIO where @auxnombre = US_nombre;
--VERIFICA QUE EL USUARIO ESTE HABILITADO
	if (@estado =0)
	 BEGIN
	  SELECT @CONTADORUSU = COUNT(*) FROM USUARIO where @auxnombre = US_nombre and @auxpass = US_clave ;
-- VERIFICA EL MATCH DEL USUARIO Y EL PASSWORD 
      if (@CONTADORUSU = 0)
       begin
--NO ACERTÓ LA PASSWORD
        SELECT @cantidad_f = US_INTENTOSFALLIDOS FROM USUARIO WHERE @auxnombre = US_nombre;
        if (@cantidad_f = 2)
         begin
--NO TIENE MAS OPORTUNIDADES (SE BLOQUEA Y SE CUENTA 3)
		  UPDATE USUARIO SET US_INTENTOSFALLIDOS = 3, US_ESTADO = 1 WHERE @auxnombre = US_nombre;
         end
        ELSE
         BEGIN
--ACUMULA UN ERROR FALLIDO
          UPDATE USUARIO set US_INTENTOSFALLIDOS = (@cantidad_f + 1) WHERE @auxnombre = US_nombre;
         END
        set @retorno = 1;
       end
      else
       BEGIN
--ACERTÓ. VERIFICA EL ROL
        select @contadorrol = count(*) from USUARIO_ROL where USROL_USUARIO = @auxnombre and USROL_ROL = @idrol;
        if (@contadorrol = 1)
         begin
         IF((select US_PRIMERA_VEZ from USUARIO where @auxnombre = US_nombre) = 'N')           
           BEGIN
		       UPDATE USUARIO SET US_INTENTOSFALLIDOS = 0 WHERE @auxnombre = US_nombre;
	           set @retorno = 0;
           END
         ELSE
          BEGIN
--DEBE CAMBIAR LA PASSWORD POR PRIMERA VEZ
			IF (@auxpass != @auxpassnue) AND (@auxpassnue = @auxpassconf)
			 BEGIN
			  UPDATE USUARIO SET US_INTENTOSFALLIDOS = 0,US_PRIMERA_VEZ='N' WHERE @auxnombre = US_nombre;
              set @retorno = 0;
			 END
			ELSE
			 BEGIN
			  IF (@auxpass = @auxpassnue) 
			   BEGIN
			    SET @retorno = 3;
			   END
			  ELSE IF (@auxpassnue != @auxpassconf)
			   BEGIN
			    SET @retorno = 4;
			   END
			 END		       
		    END
         end
        else
         BEGIN
-- NO SE PUDO REHABILITAR EL LOGIN
          set @retorno = 2;
         END 
       END
       END
    ELSE
     BEGIN
-- USUARIO DESHABILITADO
      SET @retorno = 5;
     END
END
GO


CREATE PROC [HAVA_BEI].[MODI_FUN] (@auxnombre as char (100),@auxnombrenue as char (100), @retorno as int OUTPUT) AS
BEGIN  
--OBJETIVO: MODIFICA UNA FUNCIONALIDAD
--PARAMETROS: SE INGRESA NOMBRE DE LA FUNCIONALIDAD, EL NOMBRE NUEVO DE LA FUNCIONALIDAD, Y RETORNA EL EXITO DE LA PROC
	DECLARE @CONTADOR INT;
	SET @CONTADOR = 0;
	SELECT @CONTADOR = COUNT(*) FROM funcionalidad where FUN_DESCRIPCION = @auxnombre
--VERIFICA SI EXISTE LA FUNCIONALIDAD ANTIGUA, O QUE NO EXISTA MAS DE UNA
	if @CONTADOR = 0 or @CONTADOR > 1
		begin
		 set @retorno = 1;
		end;
	else
	    begin 
		 update funcionalidad SET FUN_DESCRIPCION = @auxnombrenue WHERE FUN_DESCRIPCION = @auxnombre;
		 set @retorno = 0;
	    end;
END
GO


CREATE PROC [HAVA_BEI].[MODI_ROL] (@auxnombre as char (100),@auxnombrenue as char (100), @retorno as int OUTPUT) AS
BEGIN  
--OBJETIVO: REALIZA LA MODIFICACION DE UN ROL
--PARAMETROS: SE INGRESA EL NOMBRE DEL ROL, EL NUEVO NOMBRE DEL ROL, Y RETORNA EL EXITO DE LA PROC
	DECLARE @CONTADOR INT;
	SET @CONTADOR = 0;
	SELECT @CONTADOR = COUNT(*) FROM ROL where rol_nombre = @auxnombre AND rol_activo = 'A'
--VERIFICA QUE EXISTA UN UNICO ROL
	if @CONTADOR = 0 or @CONTADOR > 1
		begin
		 set @retorno = 1;
		end;
	else
	    begin 
		 update ROL SET rol_nombre = @auxnombrenue WHERE rol_nombre = @auxnombre AND rol_activo = 'A';
		 set @retorno = 0;
	    end;
END
GO


CREATE PROC [HAVA_BEI].[reab_login] (@auxnombre as char (15), @auxpass as char (15),@retorno as int output) AS
BEGIN
--OBJETIVO:REHABILITA UN USUARIO DESHABILITADO
--PARAMETROS: SE INGRESA EL USUARIO, LA PASSWORD, Y RETORNA EL EXITO DE LA PROC
	declare @estado char(1);
	SELECT @estado = log_habilitado FROM logueo where @auxnombre = log_nombre and @auxpass = LOG_CLAVE;
--VERIFICA QUE EL USUARIO ESTE DESACTIVADO
	if (@estado ='I')
	 BEGIN
 	  UPDATE logueo SET log_intentosfallidos = 0, log_habilitado = 'H' WHERE @auxnombre = log_nombre;
      SET @retorno = 0;
     END 
    ELSE
     BEGIN
      SET @retorno = 1;
     END
END
GO


CREATE PROC [HAVA_BEI].[REAB_ROL] (@ROL as SMALLINT, @retorno as INT OUTPUT) AS
BEGIN  
--OBJETIVO: REHABILITA ROL
--PARAMETROS: SE INGRESA NOMBRE DEL ROL, RETORNA EL EXITO DE LA PROC
	DECLARE @CONTADOR INT;
	SET @CONTADOR = 0;
	SELECT @CONTADOR = COUNT(*) FROM ROL where rol_id = @ROL AND rol_activo = 'D'
--VERIFICA QUE EXISTA UN UNICO ROL DESACTIVADO
	if @CONTADOR = 0 or @CONTADOR > 1
		begin
		 set @retorno = 1;
		end;
	else
	    begin 
		 update ROL SET rol_activo = 'A' WHERE rol_id = @ROL AND rol_activo = 'D';
		 set @retorno = 0;
	    end;
END
GO


CREATE PROC [HAVA_BEI].[baja_usu] (@auxnombre as char (15)) AS

BEGIN
--OBJETIVO: REALIZA LA BAJA DEL USUARIO
--PARAMETRO: SE INGRESA EL USUARIO
	 UPDATE USUARIO SET US_ESTADO = 0 WHERE US_NOMBRE = @auxnombre;	
END
GO


CREATE PROC [HAVA_BEI].[ALTA_CLIE] (@auxnombre as char (255), @auxapellido char (255), @auxdni as int, @auxtipodoc as SMALLINT, @auxmail as char (255), @auxtelef as char (255), @auxdire as char (255),@auxcodpos as char (50),  @auxfecha as datetime, @auxcuil as int, @auxnumcalle as int, @auxpiso as int, @auxdepto as char(50),@auxlocal as char(50), @RETORNO AS INT OUTPUT, @RETusu AS char(15) OUTPUT) AS
BEGIN
--OBJETIVO: REALIZA EL ALTA DEL CLIENTE. 
--PARAMETROS: SE INGRESAN EL NOMBRE, EL APELLIDO, EL DNI, EL TIPO DOCUMENTO, EL MAIL, EL TELEFONO, 
--LA DIRECCION, EL CODIGO POSTAL, LA FECHA DE NACIMIENTO, EL USUARIO, 
--SI ESTA HABILITADO, EL NUMERO DE CUIL, LA CANTIDAD DE COMPRAS SIN CALIFICAR, NUMERO DE CALLE, EL PISO Y EL DEPARTAMENTO
-- Y RETORNA EL EXITO DE LA PROC 
	DECLARE @CONTADOR INT;
	declare @contadormail int;
	DECLARE @CONTADORTEL INT;
	DECLARE @CONTADORCUIL INT;
	declare @contadni int;
	DECLARE @auxusu as char (15);
	SET @CONTADOR = 0;
	SET @contadormail = 0;
	SET @CONTADORTEL = 0;
	SET @CONTADORCUIL  = 0;
	SET @contadni = 0;
	SET @RETORNO = 0;
	SELECT @CONTADOR = COUNT(*) FROM CLIENTE  
	SELECT @contadni = COUNT(*) FROM CLIENTE  where CLIE_NUMERO_DOC = @auxdni AND CLIE_TIPO_DOC = @auxtipodoc
	SELECT @contadormail = COUNT(*) FROM CLIENTE  where CLIE_MAIL = @auxmail
	SELECT @CONTADORTEL = COUNT(*) FROM CLIENTE  where CLIE_TELEFONO = @auxtelef
	SELECT @CONTADORCUIL = COUNT(*) FROM CLIENTE  where CLIE_CUIL = @auxcuil
-- VERIFICA QUE:
-- A) QUE NO EXISTA EL DNI EN LA TABLA 
-- B) QUE NO EXISTA EL MAIL EN LA TABLA 
-- C) QUE NO EXISTA EL TELEFONO EN LA TABLA 

	IF (@contadni = 0 and @contadormail = 0 and @CONTADORTEL = 0 AND @CONTADORCUIL = 0) 
	  BEGIN
		  BEGIN
			 EXEC GENERA_USU @auxnombre,@auxapellido,@auxusu OUTPUT
			 INSERT INTO USUARIO (us_nombre,us_clave,us_intentosFallidos,us_estado,us_primera_vez)
			 VALUES (@auxusu,@auxusu,0,0,'S')
			 INSERT INTO USUARIO_ROL (usrol_usuario,usrol_rol)
			 VALUES (@auxusu,3)
			 INSERT INTO CLIENTE (clie_nombre,clie_apellido,clie_numero_doc,clie_tipo_doc,clie_mail,clie_telefono,clie_dir_calle,clie_cod_pos,clie_fec_nac,clie_usuario,clie_cuil,clie_dir_numero,clie_dir_piso,clie_dir_depto,clie_dir_localidad)
			 VALUES (@auxnombre,@auxapellido,@auxdni,@auxtipodoc,@auxmail,@auxtelef,@auxdire,@auxcodpos,@auxfecha,@auxusu,@auxcuil,@auxnumcalle,@auxpiso,@auxdepto,@auxlocal)
			set @retusu = @auxusu 
		  END
	  END
	ELSE
		begin
		  --RETORNO = 1: EXISTE EL DNI O DIRECCION O TELEFONO O CUIL
		  set @RETORNO = 1;
		  set @retusu = null
	end  
END
GO


CREATE PROC [HAVA_BEI].[BAJA_CLIE] (@auxusu as char (15), @RETORNO AS INT OUTPUT) AS
BEGIN
--OBJETIVO: REALIZA LA BAJA DEL CLIENTE. 
--PARAMETROS: SE INGRESAN EL USUARIO
-- Y RETORNA EL EXITO DE LA PROC 
	DECLARE @contadorusu int;
	SET @contadorusu = 0;

	SET @RETORNO = 0;

	SELECT @contadorusu = COUNT(*) FROM CLIENTE, USUARIO  where CLIE_USUARIO = @auxusu AND US_NOMBRE = @auxusu AND US_ESTADO = 0

-- VERIFICA QUE:
-- A) QUE EXISTA EL USUARIO

	IF (@contadorusu = 1)  
	BEGIN
		BEGIN
			UPDATE USUARIO SET US_ESTADO = 2 WHERE US_NOMBRE = @auxusu;	
		END
	END
	ELSE
	begin
		--RETORNO = 1: NO EXISTE EL USUARIO O YA ESTABA INHABILITADO
		set @RETORNO = 1;
	end  
END
GO


CREATE PROC [HAVA_BEI].[MODI_CLIE] (@auxnombre as char (255), @auxapellido char (255), @auxdni as int, @auxtipodoc as INT, @auxmail as char (255), @auxtelef as char (255), @auxdire as char (255),@auxcodpos as char (50), @auxusu as char (15), @auxfecha as datetime,@auxcuil as int, @auxnumcalle as int, @auxpiso as int, @auxdepto as char(50),@auxlocal as char(50), @RETORNO AS INT OUTPUT) AS
BEGIN
--OBJETIVO: REALIZA LA MODIFICACION DEL CLIENTE. 
--PARAMETROS: SE INGRESAN EL NOMBRE, EL APELLIDO, EL DNI, EL TIPO DOCUMENTO, EL MAIL, EL TELEFONO, 
--LA DIRECCION, EL CODIGO POSTAL, LA FECHA DE NACIMIENTO, EL USUARIO, 
--NUMERO DE CALLE, EL PISO Y EL DEPARTAMENTO
-- Y RETORNA EL EXITO DE LA PROC 
	DECLARE @contadorusu int;
	SET @contadorusu = 0;

	declare @contadormail int;
	DECLARE @CONTADORTEL INT;
	declare @contadni int;

	SET @contadormail = 0;
	SET @CONTADORTEL = 0;
	SET @contadni = 0;
	SET @RETORNO = 0;

	SELECT @contadni = COUNT(*) FROM CLIENTE  where CLIE_NUMERO_DOC = @auxdni AND CLIE_TIPO_DOC = @auxtipodoc AND CLIE_USUARIO != @auxusu
	SELECT @contadormail = COUNT(*) FROM CLIENTE  where CLIE_MAIL = @auxmail AND CLIE_USUARIO != @auxusu
	SELECT @CONTADORTEL = COUNT(*) FROM CLIENTE  where CLIE_TELEFONO = @auxtelef AND CLIE_USUARIO != @auxusu
	SELECT @contadorusu = COUNT(*) FROM CLIENTE  where CLIE_USUARIO = @auxusu
	
	-- VERIFICA QUE:
	-- A) QUE NO EXISTA EL DNI EN LA TABLA 
	-- B) QUE NO EXISTA EL MAIL EN LA TABLA 
	-- C) QUE NO EXISTA EL TELEFONO EN LA TABLA 
	-- D) QUE EXISTA EL USUARIO

	IF (@contadorusu = 1 AND @contadni = 0 and @contadormail = 0 and @CONTADORTEL = 0)  
	BEGIN
		BEGIN
			update CLIENTE set CLIE_NOMBRE=@auxnombre, CLIE_APELLIDO=@auxapellido, CLIE_NUMERO_DOC=@auxdni, CLIE_TIPO_DOC=@auxtipodoc, CLIE_MAIL= @auxmail, CLIE_TELEFONO= @auxtelef, CLIE_DIR_CALLE=@auxdire, CLIE_COD_POS=@auxcodpos, CLIE_FEC_NAC=@auxfecha,CLIE_CUIL=@auxcuil, CLIE_DIR_NUMERO=@auxnumcalle, CLIE_DIR_PISO=@auxpiso, CLIE_DIR_DEPTO=@auxdepto, CLIE_DIR_LOCALIDAD = @auxlocal WHERE CLIE_USUARIO = @auxusu
		END
	END
	ELSE
	begin
		--RETORNO = 1: EXISTE EL DNI O DIRECCION O TELEFONO O NO EXISTE EL USUARIO
		set @RETORNO = 1;
	end  
END
GO


CREATE PROC [HAVA_BEI].[REAB_CLIE] (@auxusu as char (15), @RETORNO AS INT OUTPUT) AS
BEGIN
--OBJETIVO: REALIZA LA BAJA DEL CLIENTE. 
--PARAMETROS: SE INGRESAN EL USUARIO
-- Y RETORNA EL EXITO DE LA PROC 
	DECLARE @contadorusu int;
	SET @contadorusu = 0;

	SET @RETORNO = 0;

	SELECT @contadorusu = COUNT(*) FROM CLIENTE, USUARIO  where CLIE_USUARIO = @auxusu AND US_NOMBRE = @auxusu AND US_ESTADO != 0

-- VERIFICA QUE:
-- A) QUE EXISTA EL USUARIO

	IF (@contadorusu = 1)  
	BEGIN
		BEGIN
			UPDATE USUARIO SET US_ESTADO = 0 WHERE US_NOMBRE = @auxusu;	
		END
	END
	ELSE
	begin
	--RETORNO = 1: NO EXISTE EL USUARIO O YA ESTABA HABILITADO
	set @RETORNO = 1;
	end  
END
GO
