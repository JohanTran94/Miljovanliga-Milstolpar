--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: Kzuki Databas; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "Kzuki Databas";


ALTER SCHEMA "Kzuki Databas" OWNER TO postgres;

--
-- Name: bio; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA bio;


ALTER SCHEMA bio OWNER TO postgres;

--
-- Name: foretagsregister_databas; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA foretagsregister_databas;


ALTER SCHEMA foretagsregister_databas OWNER TO postgres;

--
-- Name: homenet; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA homenet;


ALTER SCHEMA homenet OWNER TO postgres;

--
-- Name: kalenderdatabas; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA kalenderdatabas;


ALTER SCHEMA kalenderdatabas OWNER TO postgres;

--
-- Name: kokböckernas Recept; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "kokböckernas Recept";


ALTER SCHEMA "kokböckernas Recept" OWNER TO postgres;

--
-- Name: miljovanliga_milstolpar; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA miljovanliga_milstolpar;


ALTER SCHEMA miljovanliga_milstolpar OWNER TO postgres;

--
-- Name: schema_name; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA schema_name;


ALTER SCHEMA schema_name OWNER TO postgres;

--
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


--
-- Name: betalningsmetod_typ; Type: TYPE; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE TYPE miljovanliga_milstolpar.betalningsmetod_typ AS ENUM (
    'kort',
    'faktura',
    'klarna'
);


ALTER TYPE miljovanliga_milstolpar.betalningsmetod_typ OWNER TO postgres;

--
-- Name: betalningsstatus_typ; Type: TYPE; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE TYPE miljovanliga_milstolpar.betalningsstatus_typ AS ENUM (
    'betald',
    'obetalad',
    'förfallen'
);


ALTER TYPE miljovanliga_milstolpar.betalningsstatus_typ OWNER TO postgres;

--
-- Name: boende_typ; Type: TYPE; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE TYPE miljovanliga_milstolpar.boende_typ AS ENUM (
    'vandrarhem',
    'tiny house',
    'hotell'
);


ALTER TYPE miljovanliga_milstolpar.boende_typ OWNER TO postgres;

--
-- Name: roller_typ; Type: TYPE; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE TYPE miljovanliga_milstolpar.roller_typ AS ENUM (
    'kund',
    'systemadmin',
    'kundsupport'
);


ALTER TYPE miljovanliga_milstolpar.roller_typ OWNER TO postgres;

--
-- Name: status_enum; Type: TYPE; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE TYPE miljovanliga_milstolpar.status_enum AS ENUM (
    'pågående',
    'avslutad',
    'kommande',
    'avbokad'
);


ALTER TYPE miljovanliga_milstolpar.status_enum OWNER TO postgres;

--
-- Name: statuss_typ; Type: TYPE; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE TYPE miljovanliga_milstolpar.statuss_typ AS ENUM (
    'aktiv',
    'inte aktiv'
);


ALTER TYPE miljovanliga_milstolpar.statuss_typ OWNER TO postgres;

--
-- Name: transport_typ; Type: TYPE; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE TYPE miljovanliga_milstolpar.transport_typ AS ENUM (
    'flyg',
    'buss',
    'tåg',
    'cykel'
);


ALTER TYPE miljovanliga_milstolpar.transport_typ OWNER TO postgres;

--
-- Name: bokning_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.bokning_status AS ENUM (
    'avslutad',
    'pågående',
    'kommande'
);


ALTER TYPE public.bokning_status OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auktion (Annons); Type: TABLE; Schema: Kzuki Databas; Owner: postgres
--

CREATE TABLE "Kzuki Databas"."auktion (Annons)" (
    id integer NOT NULL,
    saljare_id integer NOT NULL,
    starttid timestamp without time zone NOT NULL,
    avslutat timestamp without time zone,
    status character varying(50) NOT NULL,
    startpris integer NOT NULL,
    objekt_typ character varying(30) NOT NULL,
    vinnare_id integer,
    anteckning character varying(1000),
    slutpris integer
);


ALTER TABLE "Kzuki Databas"."auktion (Annons)" OWNER TO postgres;

--
-- Name: Auktion (Annons)_auktion_id_seq; Type: SEQUENCE; Schema: Kzuki Databas; Owner: postgres
--

CREATE SEQUENCE "Kzuki Databas"."Auktion (Annons)_auktion_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "Kzuki Databas"."Auktion (Annons)_auktion_id_seq" OWNER TO postgres;

--
-- Name: Auktion (Annons)_auktion_id_seq; Type: SEQUENCE OWNED BY; Schema: Kzuki Databas; Owner: postgres
--

ALTER SEQUENCE "Kzuki Databas"."Auktion (Annons)_auktion_id_seq" OWNED BY "Kzuki Databas"."auktion (Annons)".id;


--
-- Name: adresser; Type: TABLE; Schema: Kzuki Databas; Owner: postgres
--

CREATE TABLE "Kzuki Databas".adresser (
    id integer NOT NULL,
    gatunamn character varying(100) NOT NULL,
    stad character varying(100) NOT NULL,
    postnummer character varying(20) NOT NULL
);


ALTER TABLE "Kzuki Databas".adresser OWNER TO postgres;

--
-- Name: objekt; Type: TABLE; Schema: Kzuki Databas; Owner: postgres
--

CREATE TABLE "Kzuki Databas".objekt (
    id integer NOT NULL,
    auktion_id integer,
    adress_id integer NOT NULL
);


ALTER TABLE "Kzuki Databas".objekt OWNER TO postgres;

--
-- Name: admin_kan_se_alla_auktioner_med_status; Type: VIEW; Schema: Kzuki Databas; Owner: postgres
--

CREATE VIEW "Kzuki Databas".admin_kan_se_alla_auktioner_med_status AS
 SELECT a.id AS auktion_id,
    o.id AS objekt_id,
    a.objekt_typ,
    adr.stad,
    a.saljare_id,
    a.starttid,
    a.avslutat,
    a.status,
    a.startpris,
    a.slutpris
   FROM (("Kzuki Databas"."auktion (Annons)" a
     JOIN "Kzuki Databas".objekt o ON ((a.id = o.auktion_id)))
     JOIN "Kzuki Databas".adresser adr ON ((o.adress_id = adr.id)))
  ORDER BY a.starttid DESC;


ALTER VIEW "Kzuki Databas".admin_kan_se_alla_auktioner_med_status OWNER TO postgres;

--
-- Name: anvandare; Type: TABLE; Schema: Kzuki Databas; Owner: postgres
--

CREATE TABLE "Kzuki Databas".anvandare (
    id integer NOT NULL,
    anvandarnamn character varying(100) NOT NULL,
    losenord character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    regis_datum timestamp without time zone NOT NULL,
    fornamn character varying(50) NOT NULL,
    efternamn character varying(50) NOT NULL,
    org_nummer character varying(20),
    telefon character varying(20) NOT NULL,
    adress integer NOT NULL
);


ALTER TABLE "Kzuki Databas".anvandare OWNER TO postgres;

--
-- Name: admin_kan_se_anvandarlistan_i_detalj; Type: VIEW; Schema: Kzuki Databas; Owner: postgres
--

CREATE VIEW "Kzuki Databas".admin_kan_se_anvandarlistan_i_detalj AS
 SELECT anv.id AS anvandare_id,
    anv.anvandarnamn,
    anv.email,
    anv.regis_datum,
    anv.fornamn,
    anv.efternamn,
    anv.org_nummer,
    anv.telefon,
    adr.gatunamn,
    adr.stad,
    adr.postnummer
   FROM ("Kzuki Databas".anvandare anv
     JOIN "Kzuki Databas".adresser adr ON ((anv.adress = adr.id)))
  ORDER BY anv.regis_datum DESC;


ALTER VIEW "Kzuki Databas".admin_kan_se_anvandarlistan_i_detalj OWNER TO postgres;

--
-- Name: admin_kan_se_avslutande_auktioner_utan_vinnare; Type: VIEW; Schema: Kzuki Databas; Owner: postgres
--

CREATE VIEW "Kzuki Databas".admin_kan_se_avslutande_auktioner_utan_vinnare AS
 SELECT a.id AS auktion_id,
    o.id AS objekt_id,
    a.objekt_typ,
    adr.stad,
    a.saljare_id,
    a.starttid,
    a.avslutat,
    a.startpris,
    a.slutpris
   FROM (("Kzuki Databas"."auktion (Annons)" a
     JOIN "Kzuki Databas".objekt o ON ((a.id = o.auktion_id)))
     JOIN "Kzuki Databas".adresser adr ON ((o.adress_id = adr.id)))
  WHERE ((a.status)::text = 'avslutade'::text)
  ORDER BY a.starttid DESC;


ALTER VIEW "Kzuki Databas".admin_kan_se_avslutande_auktioner_utan_vinnare OWNER TO postgres;

--
-- Name: adresser_adress_id_seq; Type: SEQUENCE; Schema: Kzuki Databas; Owner: postgres
--

CREATE SEQUENCE "Kzuki Databas".adresser_adress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "Kzuki Databas".adresser_adress_id_seq OWNER TO postgres;

--
-- Name: adresser_adress_id_seq; Type: SEQUENCE OWNED BY; Schema: Kzuki Databas; Owner: postgres
--

ALTER SEQUENCE "Kzuki Databas".adresser_adress_id_seq OWNED BY "Kzuki Databas".adresser.id;


--
-- Name: bud; Type: TABLE; Schema: Kzuki Databas; Owner: postgres
--

CREATE TABLE "Kzuki Databas".bud (
    id integer NOT NULL,
    auktion_id integer NOT NULL,
    budgivare_id integer,
    bud_belopp integer,
    bud_tid timestamp without time zone NOT NULL
);


ALTER TABLE "Kzuki Databas".bud OWNER TO postgres;

--
-- Name: alla_auktioner_dar_budgiavare_lagt_bud; Type: VIEW; Schema: Kzuki Databas; Owner: postgres
--

CREATE VIEW "Kzuki Databas".alla_auktioner_dar_budgiavare_lagt_bud AS
 SELECT a.id AS auktion_id,
    a.objekt_typ,
    adr.stad,
    a.starttid,
    a.avslutat,
    a.status,
    a.startpris,
    a.slutpris,
    count(b.id) AS antal_bud
   FROM ((("Kzuki Databas"."auktion (Annons)" a
     JOIN "Kzuki Databas".bud b ON ((a.id = b.auktion_id)))
     JOIN "Kzuki Databas".anvandare anv ON ((b.budgivare_id = anv.id)))
     JOIN "Kzuki Databas".adresser adr ON ((anv.adress = adr.id)))
  WHERE (anv.id = 20)
  GROUP BY a.id, a.objekt_typ, adr.stad, a.starttid, a.avslutat, a.status, a.startpris, a.slutpris
  ORDER BY a.starttid DESC;


ALTER VIEW "Kzuki Databas".alla_auktioner_dar_budgiavare_lagt_bud OWNER TO postgres;

--
-- Name: anvandare_anvandare_id_seq; Type: SEQUENCE; Schema: Kzuki Databas; Owner: postgres
--

CREATE SEQUENCE "Kzuki Databas".anvandare_anvandare_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "Kzuki Databas".anvandare_anvandare_id_seq OWNER TO postgres;

--
-- Name: anvandare_anvandare_id_seq; Type: SEQUENCE OWNED BY; Schema: Kzuki Databas; Owner: postgres
--

ALTER SEQUENCE "Kzuki Databas".anvandare_anvandare_id_seq OWNED BY "Kzuki Databas".anvandare.id;


--
-- Name: bilder; Type: TABLE; Schema: Kzuki Databas; Owner: postgres
--

CREATE TABLE "Kzuki Databas".bilder (
    id integer NOT NULL,
    objekt_id integer NOT NULL,
    bild_1 character varying(300) NOT NULL,
    bild_2 character varying(255)
);


ALTER TABLE "Kzuki Databas".bilder OWNER TO postgres;

--
-- Name: anvandare_filtrerar_kommande_auktioner; Type: VIEW; Schema: Kzuki Databas; Owner: postgres
--

CREATE VIEW "Kzuki Databas".anvandare_filtrerar_kommande_auktioner AS
 SELECT o.id,
    a.objekt_typ,
    a.status,
    adr.stad,
    a.starttid,
    a.avslutat,
    a.startpris,
    b.bild_1
   FROM ((("Kzuki Databas".objekt o
     JOIN "Kzuki Databas"."auktion (Annons)" a ON ((o.auktion_id = a.id)))
     JOIN "Kzuki Databas".adresser adr ON ((o.adress_id = adr.id)))
     JOIN "Kzuki Databas".bilder b ON ((o.id = b.objekt_id)))
  WHERE ((a.status)::text = 'kommande'::text)
  ORDER BY a.starttid;


ALTER VIEW "Kzuki Databas".anvandare_filtrerar_kommande_auktioner OWNER TO postgres;

--
-- Name: anvandare_kan_jamfora_sitt_bud_med_vinnare_bud; Type: VIEW; Schema: Kzuki Databas; Owner: postgres
--

CREATE VIEW "Kzuki Databas".anvandare_kan_jamfora_sitt_bud_med_vinnare_bud AS
 SELECT a.id AS auktion_id,
    a.objekt_typ,
    adr.stad,
    a.starttid,
    a.avslutat,
    anv.anvandarnamn AS vinnare,
    a.slutpris,
    b.bud_belopp AS mitt_bud
   FROM (((("Kzuki Databas".bud b
     JOIN "Kzuki Databas"."auktion (Annons)" a ON ((b.auktion_id = a.id)))
     JOIN "Kzuki Databas".objekt o ON ((a.id = o.auktion_id)))
     JOIN "Kzuki Databas".adresser adr ON ((o.adress_id = adr.id)))
     LEFT JOIN "Kzuki Databas".anvandare anv ON ((a.vinnare_id = anv.id)))
  WHERE ((b.budgivare_id = 19) AND ((a.status)::text = 'avslutade'::text))
  GROUP BY a.id, a.objekt_typ, adr.stad, a.starttid, a.avslutat, anv.anvandarnamn, a.slutpris, b.bud_belopp
  ORDER BY a.starttid DESC;


ALTER VIEW "Kzuki Databas".anvandare_kan_jamfora_sitt_bud_med_vinnare_bud OWNER TO postgres;

--
-- Name: anvandare_kan_se_salda_objekter; Type: VIEW; Schema: Kzuki Databas; Owner: postgres
--

CREATE VIEW "Kzuki Databas".anvandare_kan_se_salda_objekter AS
 SELECT o.id,
    a.objekt_typ,
    adr.stad,
    a.starttid AS start_tid,
    a.avslutat,
    a.startpris,
    a.slutpris,
    anv.anvandarnamn AS vinnare,
    b.bild_1
   FROM (((("Kzuki Databas".objekt o
     JOIN "Kzuki Databas"."auktion (Annons)" a ON ((o.auktion_id = a.id)))
     JOIN "Kzuki Databas".adresser adr ON ((o.adress_id = adr.id)))
     JOIN "Kzuki Databas".anvandare anv ON ((a.vinnare_id = anv.id)))
     JOIN "Kzuki Databas".bilder b ON ((o.id = b.objekt_id)))
  WHERE ((a.status)::text = 'avslutade'::text)
  ORDER BY a.avslutat DESC;


ALTER VIEW "Kzuki Databas".anvandare_kan_se_salda_objekter OWNER TO postgres;

--
-- Name: anvandare_kan_se_sina_uppgifter; Type: VIEW; Schema: Kzuki Databas; Owner: postgres
--

CREATE VIEW "Kzuki Databas".anvandare_kan_se_sina_uppgifter AS
 SELECT anv.id AS anvandare_id,
    anv.anvandarnamn,
    anv.losenord,
    anv.email,
    anv.regis_datum,
    anv.fornamn,
    anv.efternamn,
    anv.org_nummer,
    anv.telefon,
    adr.gatunamn,
    adr.stad,
    adr.postnummer
   FROM ("Kzuki Databas".anvandare anv
     JOIN "Kzuki Databas".adresser adr ON ((anv.adress = adr.id)))
  WHERE (anv.id = 20);


ALTER VIEW "Kzuki Databas".anvandare_kan_se_sina_uppgifter OWNER TO postgres;

--
-- Name: anvandare_kan_se_vem_ar_vinnare; Type: VIEW; Schema: Kzuki Databas; Owner: postgres
--

CREATE VIEW "Kzuki Databas".anvandare_kan_se_vem_ar_vinnare AS
 SELECT a.id AS auktion_id,
    anv.anvandarnamn AS vinnare
   FROM ("Kzuki Databas"."auktion (Annons)" a
     JOIN "Kzuki Databas".anvandare anv ON ((a.vinnare_id = anv.id)))
  WHERE (a.id = 1);


ALTER VIEW "Kzuki Databas".anvandare_kan_se_vem_ar_vinnare OWNER TO postgres;

--
-- Name: anvandareuppgifter; Type: TABLE; Schema: Kzuki Databas; Owner: postgres
--

CREATE TABLE "Kzuki Databas".anvandareuppgifter (
);


ALTER TABLE "Kzuki Databas".anvandareuppgifter OWNER TO postgres;

--
-- Name: avandare_kan_se_alla_sina_vinnande_auktioner; Type: VIEW; Schema: Kzuki Databas; Owner: postgres
--

CREATE VIEW "Kzuki Databas".avandare_kan_se_alla_sina_vinnande_auktioner AS
 SELECT a.id AS auktion_id,
    o.id AS objekt_id,
    a.objekt_typ,
    adr.stad,
    a.starttid,
    a.avslutat,
    a.status,
    a.startpris,
    a.slutpris,
    bi.bild_1
   FROM (((("Kzuki Databas"."auktion (Annons)" a
     JOIN "Kzuki Databas".anvandare anv ON ((a.vinnare_id = anv.id)))
     JOIN "Kzuki Databas".adresser adr ON ((anv.adress = adr.id)))
     JOIN "Kzuki Databas".objekt o ON ((a.id = o.auktion_id)))
     JOIN "Kzuki Databas".bilder bi ON ((o.id = bi.objekt_id)))
  WHERE (anv.id = 27);


ALTER VIEW "Kzuki Databas".avandare_kan_se_alla_sina_vinnande_auktioner OWNER TO postgres;

--
-- Name: bilder_id_seq; Type: SEQUENCE; Schema: Kzuki Databas; Owner: postgres
--

CREATE SEQUENCE "Kzuki Databas".bilder_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "Kzuki Databas".bilder_id_seq OWNER TO postgres;

--
-- Name: bilder_id_seq; Type: SEQUENCE OWNED BY; Schema: Kzuki Databas; Owner: postgres
--

ALTER SEQUENCE "Kzuki Databas".bilder_id_seq OWNED BY "Kzuki Databas".bilder.id;


--
-- Name: bud_bud_id_seq; Type: SEQUENCE; Schema: Kzuki Databas; Owner: postgres
--

CREATE SEQUENCE "Kzuki Databas".bud_bud_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "Kzuki Databas".bud_bud_id_seq OWNER TO postgres;

--
-- Name: bud_bud_id_seq; Type: SEQUENCE OWNED BY; Schema: Kzuki Databas; Owner: postgres
--

ALTER SEQUENCE "Kzuki Databas".bud_bud_id_seq OWNED BY "Kzuki Databas".bud.id;


--
-- Name: legenhet; Type: TABLE; Schema: Kzuki Databas; Owner: postgres
--

CREATE TABLE "Kzuki Databas".legenhet (
    id integer NOT NULL,
    manad_avgift integer NOT NULL,
    antal_rum numeric,
    hiss integer NOT NULL,
    balkong integer NOT NULL,
    "våning" integer NOT NULL,
    badkar integer NOT NULL,
    "byggnad_år" date NOT NULL,
    boarea numeric NOT NULL,
    objekt_id integer NOT NULL
);


ALTER TABLE "Kzuki Databas".legenhet OWNER TO postgres;

--
-- Name: budgivare_filtrerar_lagenheter_med_hiss_i_stockholm_norrkoping; Type: VIEW; Schema: Kzuki Databas; Owner: postgres
--

CREATE VIEW "Kzuki Databas".budgivare_filtrerar_lagenheter_med_hiss_i_stockholm_norrkoping AS
 SELECT o.id,
    a.objekt_typ,
    a.status,
    adr.gatunamn,
    adr.stad,
    adr.postnummer,
    a.starttid,
    a.avslutat,
    a.startpris,
    l.hiss,
    b.bild_1
   FROM (((("Kzuki Databas".objekt o
     JOIN "Kzuki Databas"."auktion (Annons)" a ON ((o.auktion_id = a.id)))
     JOIN "Kzuki Databas".adresser adr ON ((o.adress_id = adr.id)))
     JOIN "Kzuki Databas".legenhet l ON ((o.id = l.objekt_id)))
     JOIN "Kzuki Databas".bilder b ON ((o.id = b.objekt_id)))
  WHERE (((a.status)::text = 'pågående'::text) AND ((a.objekt_typ)::text = 'lägenhet'::text) AND (l.hiss = 1) AND ((adr.stad)::text = ANY ((ARRAY['Stockholm'::character varying, 'Norrköping'::character varying])::text[])))
  ORDER BY a.starttid;


ALTER VIEW "Kzuki Databas".budgivare_filtrerar_lagenheter_med_hiss_i_stockholm_norrkoping OWNER TO postgres;

--
-- Name: budgivare_kan_se_budhistorik; Type: VIEW; Schema: Kzuki Databas; Owner: postgres
--

CREATE VIEW "Kzuki Databas".budgivare_kan_se_budhistorik AS
 SELECT a.id AS auktion_id,
    o.id AS objekt_id,
    a.objekt_typ,
    a.status,
    anv.anvandarnamn AS budgivare,
    b.bud_belopp,
    b.bud_tid
   FROM ((("Kzuki Databas".objekt o
     JOIN "Kzuki Databas"."auktion (Annons)" a ON ((o.auktion_id = a.id)))
     JOIN "Kzuki Databas".bud b ON ((a.id = b.auktion_id)))
     JOIN "Kzuki Databas".anvandare anv ON ((b.budgivare_id = anv.id)))
  WHERE (a.id = 3)
  ORDER BY b.bud_tid DESC;


ALTER VIEW "Kzuki Databas".budgivare_kan_se_budhistorik OWNER TO postgres;

--
-- Name: bugivare_kan_se_sin_antal_bud_på_en_auktion; Type: VIEW; Schema: Kzuki Databas; Owner: postgres
--

CREATE VIEW "Kzuki Databas"."bugivare_kan_se_sin_antal_bud_på_en_auktion" AS
 SELECT a.id AS auktion_id,
    count(b.id) AS min_antal_bud
   FROM (("Kzuki Databas".bud b
     JOIN "Kzuki Databas"."auktion (Annons)" a ON ((b.auktion_id = a.id)))
     JOIN "Kzuki Databas"."auktion (Annons)" ON ((b.auktion_id = "auktion (Annons)".id)))
  WHERE ((b.auktion_id = 1) AND (b.budgivare_id = 5))
  GROUP BY a.id;


ALTER VIEW "Kzuki Databas"."bugivare_kan_se_sin_antal_bud_på_en_auktion" OWNER TO postgres;

--
-- Name: legenhet_legenhet_id_seq; Type: SEQUENCE; Schema: Kzuki Databas; Owner: postgres
--

CREATE SEQUENCE "Kzuki Databas".legenhet_legenhet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "Kzuki Databas".legenhet_legenhet_id_seq OWNER TO postgres;

--
-- Name: legenhet_legenhet_id_seq; Type: SEQUENCE OWNED BY; Schema: Kzuki Databas; Owner: postgres
--

ALTER SEQUENCE "Kzuki Databas".legenhet_legenhet_id_seq OWNED BY "Kzuki Databas".legenhet.id;


--
-- Name: objekt_objekt_id_seq; Type: SEQUENCE; Schema: Kzuki Databas; Owner: postgres
--

CREATE SEQUENCE "Kzuki Databas".objekt_objekt_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "Kzuki Databas".objekt_objekt_id_seq OWNER TO postgres;

--
-- Name: objekt_objekt_id_seq; Type: SEQUENCE OWNED BY; Schema: Kzuki Databas; Owner: postgres
--

ALTER SEQUENCE "Kzuki Databas".objekt_objekt_id_seq OWNED BY "Kzuki Databas".objekt.id;


--
-- Name: saljare_kan_se_sina_auktioner; Type: VIEW; Schema: Kzuki Databas; Owner: postgres
--

CREATE VIEW "Kzuki Databas".saljare_kan_se_sina_auktioner AS
 SELECT a.id AS auktion_id,
    anv.anvandarnamn AS vinnare,
    a.objekt_typ,
    a.status,
    adr.stad,
    a.starttid,
    a.avslutat,
    a.startpris,
    a.slutpris,
    count(b.budgivare_id) AS antal_bud
   FROM (((("Kzuki Databas"."auktion (Annons)" a
     JOIN "Kzuki Databas".objekt o ON ((a.id = o.auktion_id)))
     JOIN "Kzuki Databas".adresser adr ON ((o.adress_id = adr.id)))
     JOIN "Kzuki Databas".bud b ON ((a.id = b.auktion_id)))
     JOIN "Kzuki Databas".anvandare anv ON ((a.vinnare_id = anv.id)))
  WHERE (a.saljare_id = 2)
  GROUP BY a.id, a.objekt_typ, a.status, adr.stad, a.starttid, a.avslutat, a.startpris, a.slutpris, anv.anvandarnamn;


ALTER VIEW "Kzuki Databas".saljare_kan_se_sina_auktioner OWNER TO postgres;

--
-- Name: saljare_kan_se_statistik_avslutade_auktioner; Type: VIEW; Schema: Kzuki Databas; Owner: postgres
--

CREATE VIEW "Kzuki Databas".saljare_kan_se_statistik_avslutade_auktioner AS
 SELECT a.id AS auktion_id,
    a.starttid,
    a.avslutat,
    a.status,
    a.startpris,
    a.slutpris,
    count(b.id) AS antal_bud
   FROM (("Kzuki Databas"."auktion (Annons)" a
     LEFT JOIN "Kzuki Databas".bud b ON ((a.id = b.auktion_id)))
     JOIN "Kzuki Databas".anvandare anv ON ((a.saljare_id = anv.id)))
  WHERE ((anv.id = 13) AND ((a.status)::text = 'avslutade'::text))
  GROUP BY a.id, a.starttid, a.avslutat, a.status, a.startpris, a.slutpris
  ORDER BY a.starttid DESC;


ALTER VIEW "Kzuki Databas".saljare_kan_se_statistik_avslutade_auktioner OWNER TO postgres;

--
-- Name: tomt; Type: TABLE; Schema: Kzuki Databas; Owner: postgres
--

CREATE TABLE "Kzuki Databas".tomt (
    id integer NOT NULL,
    manad_avgift integer NOT NULL,
    objekt_id integer NOT NULL
);


ALTER TABLE "Kzuki Databas".tomt OWNER TO postgres;

--
-- Name: tomt_tomt_id_seq; Type: SEQUENCE; Schema: Kzuki Databas; Owner: postgres
--

CREATE SEQUENCE "Kzuki Databas".tomt_tomt_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "Kzuki Databas".tomt_tomt_id_seq OWNER TO postgres;

--
-- Name: tomt_tomt_id_seq; Type: SEQUENCE OWNED BY; Schema: Kzuki Databas; Owner: postgres
--

ALTER SEQUENCE "Kzuki Databas".tomt_tomt_id_seq OWNED BY "Kzuki Databas".tomt.id;


--
-- Name: villa; Type: TABLE; Schema: Kzuki Databas; Owner: postgres
--

CREATE TABLE "Kzuki Databas".villa (
    id integer NOT NULL,
    antal_rum numeric NOT NULL,
    tomtarea numeric NOT NULL,
    badkar integer,
    byggnad_ar date NOT NULL,
    boarea numeric NOT NULL,
    objekt_id integer NOT NULL
);


ALTER TABLE "Kzuki Databas".villa OWNER TO postgres;

--
-- Name: villa_villa_id_seq; Type: SEQUENCE; Schema: Kzuki Databas; Owner: postgres
--

CREATE SEQUENCE "Kzuki Databas".villa_villa_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "Kzuki Databas".villa_villa_id_seq OWNER TO postgres;

--
-- Name: villa_villa_id_seq; Type: SEQUENCE OWNED BY; Schema: Kzuki Databas; Owner: postgres
--

ALTER SEQUENCE "Kzuki Databas".villa_villa_id_seq OWNED BY "Kzuki Databas".villa.id;


--
-- Name: filmer; Type: TABLE; Schema: bio; Owner: postgres
--

CREATE TABLE bio.filmer (
    id integer NOT NULL,
    title character varying(255),
    tid_i__minuter integer,
    beskrivning character varying(1000)
);


ALTER TABLE bio.filmer OWNER TO postgres;

--
-- Name: filmer_id_seq; Type: SEQUENCE; Schema: bio; Owner: postgres
--

CREATE SEQUENCE bio.filmer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE bio.filmer_id_seq OWNER TO postgres;

--
-- Name: filmer_id_seq; Type: SEQUENCE OWNED BY; Schema: bio; Owner: postgres
--

ALTER SEQUENCE bio.filmer_id_seq OWNED BY bio.filmer.id;


--
-- Name: salonger; Type: TABLE; Schema: bio; Owner: postgres
--

CREATE TABLE bio.salonger (
    id integer NOT NULL,
    namn character varying(32),
    platser integer,
    vip integer
);


ALTER TABLE bio.salonger OWNER TO postgres;

--
-- Name: salonger_id_seq; Type: SEQUENCE; Schema: bio; Owner: postgres
--

CREATE SEQUENCE bio.salonger_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE bio.salonger_id_seq OWNER TO postgres;

--
-- Name: salonger_id_seq; Type: SEQUENCE OWNED BY; Schema: bio; Owner: postgres
--

ALTER SEQUENCE bio.salonger_id_seq OWNED BY bio.salonger.id;


--
-- Name: visningar; Type: TABLE; Schema: bio; Owner: postgres
--

CREATE TABLE bio.visningar (
    id integer NOT NULL,
    salong_id integer,
    film_id integer,
    datum date,
    tid time without time zone
);


ALTER TABLE bio.visningar OWNER TO postgres;

--
-- Name: visningar_id_seq; Type: SEQUENCE; Schema: bio; Owner: postgres
--

CREATE SEQUENCE bio.visningar_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE bio.visningar_id_seq OWNER TO postgres;

--
-- Name: visningar_id_seq; Type: SEQUENCE OWNED BY; Schema: bio; Owner: postgres
--

ALTER SEQUENCE bio.visningar_id_seq OWNED BY bio.visningar.id;


--
-- Name: kontakt_info; Type: TABLE; Schema: foretagsregister_databas; Owner: postgres
--

CREATE TABLE foretagsregister_databas.kontakt_info (
    id integer NOT NULL,
    gata character varying(100),
    stad character varying(100),
    postnummer bigint,
    land bigint,
    mail character varying(255),
    telefon integer
);


ALTER TABLE foretagsregister_databas.kontakt_info OWNER TO postgres;

--
-- Name: adresser_id_seq; Type: SEQUENCE; Schema: foretagsregister_databas; Owner: postgres
--

CREATE SEQUENCE foretagsregister_databas.adresser_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE foretagsregister_databas.adresser_id_seq OWNER TO postgres;

--
-- Name: adresser_id_seq; Type: SEQUENCE OWNED BY; Schema: foretagsregister_databas; Owner: postgres
--

ALTER SEQUENCE foretagsregister_databas.adresser_id_seq OWNED BY foretagsregister_databas.kontakt_info.id;


--
-- Name: arbetsuppgifter; Type: TABLE; Schema: foretagsregister_databas; Owner: postgres
--

CREATE TABLE foretagsregister_databas.arbetsuppgifter (
    id integer NOT NULL,
    arbetsuppgift character varying(255)
);


ALTER TABLE foretagsregister_databas.arbetsuppgifter OWNER TO postgres;

--
-- Name: arbetsuppgifter_id_seq; Type: SEQUENCE; Schema: foretagsregister_databas; Owner: postgres
--

CREATE SEQUENCE foretagsregister_databas.arbetsuppgifter_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE foretagsregister_databas.arbetsuppgifter_id_seq OWNER TO postgres;

--
-- Name: arbetsuppgifter_id_seq; Type: SEQUENCE OWNED BY; Schema: foretagsregister_databas; Owner: postgres
--

ALTER SEQUENCE foretagsregister_databas.arbetsuppgifter_id_seq OWNED BY foretagsregister_databas.arbetsuppgifter.id;


--
-- Name: bransch; Type: TABLE; Schema: foretagsregister_databas; Owner: postgres
--

CREATE TABLE foretagsregister_databas.bransch (
    id integer NOT NULL,
    bransch_namn character varying(100)
);


ALTER TABLE foretagsregister_databas.bransch OWNER TO postgres;

--
-- Name: bransch_id_seq; Type: SEQUENCE; Schema: foretagsregister_databas; Owner: postgres
--

CREATE SEQUENCE foretagsregister_databas.bransch_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE foretagsregister_databas.bransch_id_seq OWNER TO postgres;

--
-- Name: bransch_id_seq; Type: SEQUENCE OWNED BY; Schema: foretagsregister_databas; Owner: postgres
--

ALTER SEQUENCE foretagsregister_databas.bransch_id_seq OWNED BY foretagsregister_databas.bransch.id;


--
-- Name: foretag; Type: TABLE; Schema: foretagsregister_databas; Owner: postgres
--

CREATE TABLE foretagsregister_databas.foretag (
    id integer NOT NULL,
    foretagsnamn character varying(70),
    org_nr integer,
    kontakt_info integer,
    bransch integer,
    verksmahet character varying(255)
);


ALTER TABLE foretagsregister_databas.foretag OWNER TO postgres;

--
-- Name: foretag_X_person; Type: TABLE; Schema: foretagsregister_databas; Owner: postgres
--

CREATE TABLE foretagsregister_databas."foretag_X_person" (
    foretag integer NOT NULL,
    arbetsuppgift integer,
    person integer NOT NULL,
    agare boolean,
    anstalld boolean
);


ALTER TABLE foretagsregister_databas."foretag_X_person" OWNER TO postgres;

--
-- Name: foretag_id_seq; Type: SEQUENCE; Schema: foretagsregister_databas; Owner: postgres
--

CREATE SEQUENCE foretagsregister_databas.foretag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE foretagsregister_databas.foretag_id_seq OWNER TO postgres;

--
-- Name: foretag_id_seq; Type: SEQUENCE OWNED BY; Schema: foretagsregister_databas; Owner: postgres
--

ALTER SEQUENCE foretagsregister_databas.foretag_id_seq OWNED BY foretagsregister_databas.foretag.id;


--
-- Name: person; Type: TABLE; Schema: foretagsregister_databas; Owner: postgres
--

CREATE TABLE foretagsregister_databas.person (
    id integer NOT NULL,
    fornamn character varying(50),
    efternamn character varying(50),
    personnummer character varying(10),
    kontakt_info integer
);


ALTER TABLE foretagsregister_databas.person OWNER TO postgres;

--
-- Name: adresser; Type: TABLE; Schema: homenet; Owner: postgres
--

CREATE TABLE homenet.adresser (
    id integer NOT NULL,
    gatuadress character varying(255),
    ort character varying(255),
    postnr character varying(5)
);


ALTER TABLE homenet.adresser OWNER TO postgres;

--
-- Name: adresser_id_seq; Type: SEQUENCE; Schema: homenet; Owner: postgres
--

CREATE SEQUENCE homenet.adresser_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE homenet.adresser_id_seq OWNER TO postgres;

--
-- Name: adresser_id_seq; Type: SEQUENCE OWNED BY; Schema: homenet; Owner: postgres
--

ALTER SEQUENCE homenet.adresser_id_seq OWNED BY homenet.adresser.id;


--
-- Name: maklare; Type: TABLE; Schema: homenet; Owner: postgres
--

CREATE TABLE homenet.maklare (
    id integer NOT NULL,
    email character varying(50),
    fornamn character varying(50),
    efternamn character varying(50),
    personnr date,
    telefonnr character varying(50),
    bolag character varying(255)
);


ALTER TABLE homenet.maklare OWNER TO postgres;

--
-- Name: maklare_id_seq; Type: SEQUENCE; Schema: homenet; Owner: postgres
--

CREATE SEQUENCE homenet.maklare_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE homenet.maklare_id_seq OWNER TO postgres;

--
-- Name: maklare_id_seq; Type: SEQUENCE OWNED BY; Schema: homenet; Owner: postgres
--

ALTER SEQUENCE homenet.maklare_id_seq OWNED BY homenet.maklare.id;


--
-- Name: objekt; Type: TABLE; Schema: homenet; Owner: postgres
--

CREATE TABLE homenet.objekt (
    id integer NOT NULL,
    adress integer,
    antal_rum integer,
    storlek integer,
    vaning integer,
    hiss integer,
    balkong integer,
    manadsavgift integer,
    utgangspris integer,
    forsaljningspris integer,
    maklararvode integer,
    saljstart date,
    avslutat date,
    saljare integer,
    kopare integer,
    maklare integer
);


ALTER TABLE homenet.objekt OWNER TO postgres;

--
-- Name: objekt_id_seq; Type: SEQUENCE; Schema: homenet; Owner: postgres
--

CREATE SEQUENCE homenet.objekt_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE homenet.objekt_id_seq OWNER TO postgres;

--
-- Name: objekt_id_seq; Type: SEQUENCE OWNED BY; Schema: homenet; Owner: postgres
--

ALTER SEQUENCE homenet.objekt_id_seq OWNED BY homenet.objekt.id;


--
-- Name: personer; Type: TABLE; Schema: homenet; Owner: postgres
--

CREATE TABLE homenet.personer (
    id integer NOT NULL,
    email character varying(50),
    fornamn character varying(50),
    efternamn character varying(50),
    personnr date,
    telefonnr character varying(50),
    adress integer
);


ALTER TABLE homenet.personer OWNER TO postgres;

--
-- Name: personer_id_seq; Type: SEQUENCE; Schema: homenet; Owner: postgres
--

CREATE SEQUENCE homenet.personer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE homenet.personer_id_seq OWNER TO postgres;

--
-- Name: personer_id_seq; Type: SEQUENCE OWNED BY; Schema: homenet; Owner: postgres
--

ALTER SEQUENCE homenet.personer_id_seq OWNED BY homenet.personer.id;


--
-- Name: kokböcker; Type: TABLE; Schema: kokböckernas Recept; Owner: postgres
--

CREATE TABLE "kokböckernas Recept"."kokböcker" (
    id integer NOT NULL,
    title character varying(100),
    "år" integer,
    "författare" character varying(100)
);


ALTER TABLE "kokböckernas Recept"."kokböcker" OWNER TO postgres;

--
-- Name: kokboköcker_id_seq; Type: SEQUENCE; Schema: kokböckernas Recept; Owner: postgres
--

CREATE SEQUENCE "kokböckernas Recept"."kokboköcker_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "kokböckernas Recept"."kokboköcker_id_seq" OWNER TO postgres;

--
-- Name: kokboköcker_id_seq; Type: SEQUENCE OWNED BY; Schema: kokböckernas Recept; Owner: postgres
--

ALTER SEQUENCE "kokböckernas Recept"."kokboköcker_id_seq" OWNED BY "kokböckernas Recept"."kokböcker".id;


--
-- Name: kokböcker_med_recept; Type: TABLE; Schema: kokböckernas Recept; Owner: postgres
--

CREATE TABLE "kokböckernas Recept"."kokböcker_med_recept" (
    id integer NOT NULL,
    "kokböcker_id" integer,
    recept_id integer
);


ALTER TABLE "kokböckernas Recept"."kokböcker_med_recept" OWNER TO postgres;

--
-- Name: kokböcker_med_recept_id_seq; Type: SEQUENCE; Schema: kokböckernas Recept; Owner: postgres
--

CREATE SEQUENCE "kokböckernas Recept"."kokböcker_med_recept_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "kokböckernas Recept"."kokböcker_med_recept_id_seq" OWNER TO postgres;

--
-- Name: kokböcker_med_recept_id_seq; Type: SEQUENCE OWNED BY; Schema: kokböckernas Recept; Owner: postgres
--

ALTER SEQUENCE "kokböckernas Recept"."kokböcker_med_recept_id_seq" OWNED BY "kokböckernas Recept"."kokböcker_med_recept".id;


--
-- Name: recept; Type: TABLE; Schema: kokböckernas Recept; Owner: postgres
--

CREATE TABLE "kokböckernas Recept".recept (
    id integer NOT NULL,
    "rätter_namn" character varying(1000),
    tillagningstid time without time zone,
    portioner character varying(100)
);


ALTER TABLE "kokböckernas Recept".recept OWNER TO postgres;

--
-- Name: recept_id_seq; Type: SEQUENCE; Schema: kokböckernas Recept; Owner: postgres
--

CREATE SEQUENCE "kokböckernas Recept".recept_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "kokböckernas Recept".recept_id_seq OWNER TO postgres;

--
-- Name: recept_id_seq; Type: SEQUENCE OWNED BY; Schema: kokböckernas Recept; Owner: postgres
--

ALTER SEQUENCE "kokböckernas Recept".recept_id_seq OWNED BY "kokböckernas Recept".recept.id;


--
-- Name: adress; Type: TABLE; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE TABLE miljovanliga_milstolpar.adress (
    id integer NOT NULL,
    gatunamn character varying(32),
    gatunummer character varying(10),
    postnummer character varying(10),
    ort character varying(32),
    land character varying(32),
    stad character varying(32)
);


ALTER TABLE miljovanliga_milstolpar.adress OWNER TO postgres;

--
-- Name: adress_id_seq; Type: SEQUENCE; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE SEQUENCE miljovanliga_milstolpar.adress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE miljovanliga_milstolpar.adress_id_seq OWNER TO postgres;

--
-- Name: adress_id_seq; Type: SEQUENCE OWNED BY; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER SEQUENCE miljovanliga_milstolpar.adress_id_seq OWNED BY miljovanliga_milstolpar.adress.id;


--
-- Name: aktivitet; Type: TABLE; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE TABLE miljovanliga_milstolpar.aktivitet (
    id integer NOT NULL,
    namn character varying(32),
    beskrivning character varying(128),
    status miljovanliga_milstolpar.statuss_typ,
    typ character varying(32),
    "snitt_co2_utsläpp" integer,
    adress_id integer,
    email_id integer,
    pris integer,
    sparas_co2 integer
);


ALTER TABLE miljovanliga_milstolpar.aktivitet OWNER TO postgres;

--
-- Name: aktivitet_id_seq; Type: SEQUENCE; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE SEQUENCE miljovanliga_milstolpar.aktivitet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE miljovanliga_milstolpar.aktivitet_id_seq OWNER TO postgres;

--
-- Name: aktivitet_id_seq; Type: SEQUENCE OWNED BY; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER SEQUENCE miljovanliga_milstolpar.aktivitet_id_seq OWNED BY miljovanliga_milstolpar.aktivitet.id;


--
-- Name: boende; Type: TABLE; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE TABLE miljovanliga_milstolpar.boende (
    id integer NOT NULL,
    typ miljovanliga_milstolpar.boende_typ,
    namn character varying(32),
    "snitt_co2_utsläpp" integer,
    adress_id integer,
    email_id integer
);


ALTER TABLE miljovanliga_milstolpar.boende OWNER TO postgres;

--
-- Name: COLUMN boende.typ; Type: COMMENT; Schema: miljovanliga_milstolpar; Owner: postgres
--

COMMENT ON COLUMN miljovanliga_milstolpar.boende.typ IS 'ska göras till enum';


--
-- Name: bokning_x_boende; Type: TABLE; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE TABLE miljovanliga_milstolpar.bokning_x_boende (
    id integer NOT NULL,
    incheckning timestamp without time zone,
    utcheckning timestamp without time zone,
    "antal_nätter" integer,
    rum_id integer NOT NULL,
    bokning_id integer,
    pris integer
);


ALTER TABLE miljovanliga_milstolpar.bokning_x_boende OWNER TO postgres;

--
-- Name: faciliteter_rum; Type: TABLE; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE TABLE miljovanliga_milstolpar.faciliteter_rum (
    id integer NOT NULL,
    vattensparande_funktioner boolean NOT NULL,
    "panoramafönster" boolean NOT NULL,
    hvac boolean NOT NULL,
    "lågenergi_elektronik" boolean NOT NULL,
    "timer_på_belysning" boolean NOT NULL,
    "tidsstyrd_uppvärmning" boolean NOT NULL,
    "miljövänliga_möbler" boolean NOT NULL,
    "kassaskåp" boolean NOT NULL,
    kyl boolean NOT NULL,
    badkar boolean NOT NULL,
    dusch boolean NOT NULL,
    tv boolean NOT NULL,
    minibar boolean NOT NULL
);


ALTER TABLE miljovanliga_milstolpar.faciliteter_rum OWNER TO postgres;

--
-- Name: rum; Type: TABLE; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE TABLE miljovanliga_milstolpar.rum (
    id integer NOT NULL,
    kvm_storlek integer,
    pris_per_natt integer,
    beskrivning character varying(128),
    "snitt_co2_utsläpp" integer,
    boende_id integer,
    sparas_co2 integer
);


ALTER TABLE miljovanliga_milstolpar.rum OWNER TO postgres;

--
-- Name: rum_x_faciliteter; Type: TABLE; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE TABLE miljovanliga_milstolpar.rum_x_faciliteter (
    id integer NOT NULL,
    rum_id integer,
    fac_rum_id integer
);


ALTER TABLE miljovanliga_milstolpar.rum_x_faciliteter OWNER TO postgres;

--
-- Name: användare_filtrerar_boende_baserad_på_pris_land_co2_facilitet; Type: VIEW; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE VIEW miljovanliga_milstolpar."användare_filtrerar_boende_baserad_på_pris_land_co2_facilitet" AS
 SELECT bo.id AS boende_id,
    bo.namn AS boende_namn,
    bo.typ,
    ad.ort,
    ad.stad,
    ad.land,
    r.id AS rum_id,
    r.kvm_storlek,
    r.pris_per_natt,
    r.beskrivning,
    r."snitt_co2_utsläpp",
    r.sparas_co2,
    fr."lågenergi_elektronik",
    fr.hvac
   FROM (((((miljovanliga_milstolpar.boende bo
     JOIN miljovanliga_milstolpar.adress ad ON ((bo.adress_id = ad.id)))
     JOIN miljovanliga_milstolpar.rum r ON ((bo.id = r.boende_id)))
     JOIN miljovanliga_milstolpar.rum_x_faciliteter ON ((r.id = rum_x_faciliteter.rum_id)))
     JOIN miljovanliga_milstolpar.faciliteter_rum fr ON ((rum_x_faciliteter.fac_rum_id = fr.id)))
     LEFT JOIN miljovanliga_milstolpar.bokning_x_boende bxbo ON ((r.id = bxbo.rum_id)))
  WHERE (((ad.land)::text = 'Polen'::text) AND ((r.pris_per_natt >= 1000) AND (r.pris_per_natt <= 6000)) AND (fr."lågenergi_elektronik" = true) AND (fr.hvac = true) AND (bxbo.bokning_id IS NULL))
  ORDER BY r.sparas_co2 DESC;


ALTER VIEW miljovanliga_milstolpar."användare_filtrerar_boende_baserad_på_pris_land_co2_facilitet" OWNER TO postgres;

--
-- Name: användare_filtrerar_lediga_boende_med_co2; Type: VIEW; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE VIEW miljovanliga_milstolpar."användare_filtrerar_lediga_boende_med_co2" AS
 SELECT bo.id AS boende_id,
    bo.namn AS boende_namn,
    bo.typ,
    ad.ort,
    ad.stad,
    ad.land,
    r.id AS rum_id,
    r.pris_per_natt,
    r."snitt_co2_utsläpp",
    r.sparas_co2
   FROM (((miljovanliga_milstolpar.boende bo
     JOIN miljovanliga_milstolpar.adress ad ON ((bo.adress_id = ad.id)))
     JOIN miljovanliga_milstolpar.rum r ON ((bo.id = r.boende_id)))
     LEFT JOIN miljovanliga_milstolpar.bokning_x_boende bxbo ON ((r.id = bxbo.rum_id)))
  WHERE ((bxbo.bokning_id IS NULL) AND ((r.sparas_co2 >= 10) AND (r.sparas_co2 <= 60)))
  ORDER BY r.sparas_co2 DESC;


ALTER VIEW miljovanliga_milstolpar."användare_filtrerar_lediga_boende_med_co2" OWNER TO postgres;

--
-- Name: användare_konto; Type: TABLE; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE TABLE miljovanliga_milstolpar."användare_konto" (
    id integer NOT NULL,
    "lösenord" character varying,
    reg_datum timestamp without time zone,
    roll miljovanliga_milstolpar.roller_typ,
    "användareuppgifter_id" integer,
    email_id integer
);


ALTER TABLE miljovanliga_milstolpar."användare_konto" OWNER TO postgres;

--
-- Name: email; Type: TABLE; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE TABLE miljovanliga_milstolpar.email (
    id integer NOT NULL,
    mailadress character varying,
    "företagsverksamhet" character varying(32)
);


ALTER TABLE miljovanliga_milstolpar.email OWNER TO postgres;

--
-- Name: användare_inloggad; Type: VIEW; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE VIEW miljovanliga_milstolpar."användare_inloggad" AS
 SELECT mailadress,
    konto_id,
    "lösenord",
    status
   FROM ( SELECT e.mailadress,
            a_k.id AS konto_id,
            a_k."lösenord",
                CASE
                    WHEN (('password1'::text = (a_k."lösenord")::text) AND ('sustainability@greenplanet.com'::text = (e.mailadress)::text)) THEN 'Lyckad inloggning'::text
                    ELSE 'Fel mail eller lösenord'::text
                END AS status
           FROM (miljovanliga_milstolpar."användare_konto" a_k
             JOIN miljovanliga_milstolpar.email e ON ((e.id = a_k.email_id)))) loggain_resultat
  WHERE (status = 'Lyckad inloggning'::text);


ALTER VIEW miljovanliga_milstolpar."användare_inloggad" OWNER TO postgres;

--
-- Name: användare_kan_se_aktiviteter_som_nära_sin_hotell; Type: VIEW; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE VIEW miljovanliga_milstolpar."användare_kan_se_aktiviteter_som_nära_sin_hotell" AS
 SELECT a.id AS aktivitet_id,
    a.namn AS aktivitet_namn,
    a.beskrivning,
    b.id AS boende_id,
    b.namn AS boende_namn,
    boende_adress.stad AS boende_stad,
    aktivitet_adress.stad AS aktivitet_stad
   FROM (((miljovanliga_milstolpar.aktivitet a
     JOIN miljovanliga_milstolpar.adress aktivitet_adress ON ((a.adress_id = aktivitet_adress.id)))
     JOIN miljovanliga_milstolpar.boende b ON ((b.adress_id = aktivitet_adress.id)))
     JOIN miljovanliga_milstolpar.adress boende_adress ON ((b.adress_id = boende_adress.id)));


ALTER VIEW miljovanliga_milstolpar."användare_kan_se_aktiviteter_som_nära_sin_hotell" OWNER TO postgres;

--
-- Name: bokning; Type: TABLE; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE TABLE miljovanliga_milstolpar.bokning (
    id integer NOT NULL,
    bokningstid timestamp without time zone,
    konto_id integer,
    betalning_id integer,
    status miljovanliga_milstolpar.status_enum,
    speciella_behov character varying(255),
    antal_person integer
);


ALTER TABLE miljovanliga_milstolpar.bokning OWNER TO postgres;

--
-- Name: användare_kan_se_aktuella_bokningar; Type: VIEW; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE VIEW miljovanliga_milstolpar."användare_kan_se_aktuella_bokningar" AS
 SELECT id,
    bokningstid,
    konto_id,
    betalning_id,
    status,
    speciella_behov,
    antal_person
   FROM miljovanliga_milstolpar.bokning
  WHERE (status = 'pågående'::miljovanliga_milstolpar.status_enum);


ALTER VIEW miljovanliga_milstolpar."användare_kan_se_aktuella_bokningar" OWNER TO postgres;

--
-- Name: användare_kan_se_lista_över_boende; Type: VIEW; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE VIEW miljovanliga_milstolpar."användare_kan_se_lista_över_boende" AS
 SELECT rum.id AS rum_id,
    rum."snitt_co2_utsläpp",
    rum.sparas_co2,
    boende.namn
   FROM (miljovanliga_milstolpar.rum
     JOIN miljovanliga_milstolpar.boende ON ((rum.boende_id = boende.id)))
  ORDER BY rum.sparas_co2 DESC;


ALTER VIEW miljovanliga_milstolpar."användare_kan_se_lista_över_boende" OWNER TO postgres;

--
-- Name: transport; Type: TABLE; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE TABLE miljovanliga_milstolpar.transport (
    id integer NOT NULL,
    typ miljovanliga_milstolpar.transport_typ,
    pris integer,
    "snitt_co2_utsläpp" integer,
    "avgångsplats" integer,
    ankomstplats integer,
    email_id integer,
    restid character varying,
    "avgångstid" timestamp without time zone,
    ankomsttid timestamp without time zone,
    sparas_co2 integer
);


ALTER TABLE miljovanliga_milstolpar.transport OWNER TO postgres;

--
-- Name: COLUMN transport.typ; Type: COMMENT; Schema: miljovanliga_milstolpar; Owner: postgres
--

COMMENT ON COLUMN miljovanliga_milstolpar.transport.typ IS 'ska göras till enum ';


--
-- Name: användare_kan_se_lista_över_transportalternativ; Type: VIEW; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE VIEW miljovanliga_milstolpar."användare_kan_se_lista_över_transportalternativ" AS
 SELECT id,
    typ,
    "snitt_co2_utsläpp",
    sparas_co2
   FROM miljovanliga_milstolpar.transport
  ORDER BY sparas_co2 DESC;


ALTER VIEW miljovanliga_milstolpar."användare_kan_se_lista_över_transportalternativ" OWNER TO postgres;

--
-- Name: användare_kan_se_sin_bokning; Type: VIEW; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE VIEW miljovanliga_milstolpar."användare_kan_se_sin_bokning" AS
 SELECT id,
    bokningstid,
    konto_id,
    status,
    antal_person
   FROM miljovanliga_milstolpar.bokning
  WHERE (id = 7);


ALTER VIEW miljovanliga_milstolpar."användare_kan_se_sin_bokning" OWNER TO postgres;

--
-- Name: användare_kan_se_sina_kommande_bokningar; Type: VIEW; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE VIEW miljovanliga_milstolpar."användare_kan_se_sina_kommande_bokningar" AS
 SELECT id,
    bokningstid,
    konto_id,
    betalning_id,
    status,
    speciella_behov,
    antal_person
   FROM miljovanliga_milstolpar.bokning
  WHERE ((konto_id = 12) AND (status = 'kommande'::miljovanliga_milstolpar.status_enum));


ALTER VIEW miljovanliga_milstolpar."användare_kan_se_sina_kommande_bokningar" OWNER TO postgres;

--
-- Name: användare_kan_söka_efter_lediga_boende; Type: VIEW; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE VIEW miljovanliga_milstolpar."användare_kan_söka_efter_lediga_boende" AS
 SELECT bo.id AS boende_id,
    bo.namn AS boende_namn,
    bo.typ,
    ad.ort,
    ad.stad,
    ad.land,
    r.id AS rum_id,
    r.kvm_storlek,
    r.pris_per_natt,
    r.beskrivning,
    r."snitt_co2_utsläpp",
    r.sparas_co2
   FROM (((miljovanliga_milstolpar.boende bo
     JOIN miljovanliga_milstolpar.adress ad ON ((bo.adress_id = ad.id)))
     JOIN miljovanliga_milstolpar.rum r ON ((bo.id = r.boende_id)))
     LEFT JOIN miljovanliga_milstolpar.bokning_x_boende bxbo ON ((r.id = bxbo.rum_id)))
  WHERE (bxbo.bokning_id IS NULL)
  ORDER BY ad.land;


ALTER VIEW miljovanliga_milstolpar."användare_kan_söka_efter_lediga_boende" OWNER TO postgres;

--
-- Name: användare_kan_söka_ledgia_aktiviteter; Type: VIEW; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE VIEW miljovanliga_milstolpar."användare_kan_söka_ledgia_aktiviteter" AS
 SELECT ak.id AS aktivitet_id,
    ak.namn,
    ak.typ,
    ad.stad,
    ad.land,
    ak.pris,
    ak.status,
    ak."snitt_co2_utsläpp",
    ak.sparas_co2
   FROM (miljovanliga_milstolpar.aktivitet ak
     JOIN miljovanliga_milstolpar.adress ad ON ((ak.adress_id = ad.id)))
  WHERE (ak.status = 'aktiv'::miljovanliga_milstolpar.statuss_typ);


ALTER VIEW miljovanliga_milstolpar."användare_kan_söka_ledgia_aktiviteter" OWNER TO postgres;

--
-- Name: användare_konto_id_seq; Type: SEQUENCE; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE SEQUENCE miljovanliga_milstolpar."användare_konto_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE miljovanliga_milstolpar."användare_konto_id_seq" OWNER TO postgres;

--
-- Name: användare_konto_id_seq; Type: SEQUENCE OWNED BY; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER SEQUENCE miljovanliga_milstolpar."användare_konto_id_seq" OWNED BY miljovanliga_milstolpar."användare_konto".id;


--
-- Name: användare_söker_transport_från_sthlm_till_polen; Type: VIEW; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE VIEW miljovanliga_milstolpar."användare_söker_transport_från_sthlm_till_polen" AS
 SELECT tr.id AS transport_id,
    tr.typ,
    tr."avgångstid",
    tr.ankomsttid,
    ad1.stad AS "avgångsplats",
    ad2.land AS ankomstplats,
    tr.pris
   FROM ((miljovanliga_milstolpar.transport tr
     JOIN miljovanliga_milstolpar.adress ad1 ON ((tr."avgångsplats" = ad1.id)))
     JOIN miljovanliga_milstolpar.adress ad2 ON ((tr.ankomstplats = ad2.id)))
  WHERE (((ad1.stad)::text = 'Stockholm'::text) AND ((ad2.land)::text = 'Polen'::text));


ALTER VIEW miljovanliga_milstolpar."användare_söker_transport_från_sthlm_till_polen" OWNER TO postgres;

--
-- Name: användare_söker_transport_med_avgångtid_och_ankomsttid; Type: VIEW; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE VIEW miljovanliga_milstolpar."användare_söker_transport_med_avgångtid_och_ankomsttid" AS
 SELECT tr.id AS transport_id,
    tr.typ,
    tr."avgångstid",
    tr.ankomsttid,
    ad1.stad AS "avgångsplats",
    ad2.stad AS ankomstplats,
    tr.pris,
    tr."snitt_co2_utsläpp",
    tr.sparas_co2
   FROM ((miljovanliga_milstolpar.transport tr
     JOIN miljovanliga_milstolpar.adress ad1 ON ((tr."avgångsplats" = ad1.id)))
     JOIN miljovanliga_milstolpar.adress ad2 ON ((tr.ankomstplats = ad2.id)))
  WHERE (((ad1.stad)::text = 'Stockholm'::text) AND ((ad2.stad)::text = 'Paris'::text) AND (tr."avgångstid" = '2022-11-06 14:30:00'::timestamp without time zone) AND (tr.ankomsttid = '2022-11-06 19:32:00'::timestamp without time zone));


ALTER VIEW miljovanliga_milstolpar."användare_söker_transport_med_avgångtid_och_ankomsttid" OWNER TO postgres;

--
-- Name: användareuppgifter; Type: TABLE; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE TABLE miljovanliga_milstolpar."användareuppgifter" (
    id integer NOT NULL,
    "förnamn" character varying(32),
    efternamn character varying(32),
    passnummer character varying(32),
    adress_id integer,
    "födelsedatum" date
);


ALTER TABLE miljovanliga_milstolpar."användareuppgifter" OWNER TO postgres;

--
-- Name: användareuppgifter_id_seq; Type: SEQUENCE; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE SEQUENCE miljovanliga_milstolpar."användareuppgifter_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE miljovanliga_milstolpar."användareuppgifter_id_seq" OWNER TO postgres;

--
-- Name: användareuppgifter_id_seq; Type: SEQUENCE OWNED BY; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER SEQUENCE miljovanliga_milstolpar."användareuppgifter_id_seq" OWNED BY miljovanliga_milstolpar."användareuppgifter".id;


--
-- Name: betalning; Type: TABLE; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE TABLE miljovanliga_milstolpar.betalning (
    id integer NOT NULL,
    betalningsstatus miljovanliga_milstolpar.betalningsstatus_typ,
    belopp integer,
    betalningsmetod miljovanliga_milstolpar.betalningsmetod_typ,
    betalningstid timestamp without time zone
);


ALTER TABLE miljovanliga_milstolpar.betalning OWNER TO postgres;

--
-- Name: COLUMN betalning.betalningsstatus; Type: COMMENT; Schema: miljovanliga_milstolpar; Owner: postgres
--

COMMENT ON COLUMN miljovanliga_milstolpar.betalning.betalningsstatus IS 'ska göras till enum';


--
-- Name: betalning_id_seq; Type: SEQUENCE; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE SEQUENCE miljovanliga_milstolpar.betalning_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE miljovanliga_milstolpar.betalning_id_seq OWNER TO postgres;

--
-- Name: betalning_id_seq; Type: SEQUENCE OWNED BY; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER SEQUENCE miljovanliga_milstolpar.betalning_id_seq OWNED BY miljovanliga_milstolpar.betalning.id;


--
-- Name: bilder; Type: TABLE; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE TABLE miljovanliga_milstolpar.bilder (
    id integer NOT NULL,
    bild character varying(100),
    beskrivning character varying(100),
    boende_id integer,
    aktivitet_id integer,
    rum_id integer
);


ALTER TABLE miljovanliga_milstolpar.bilder OWNER TO postgres;

--
-- Name: bilder_id_seq; Type: SEQUENCE; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE SEQUENCE miljovanliga_milstolpar.bilder_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE miljovanliga_milstolpar.bilder_id_seq OWNER TO postgres;

--
-- Name: bilder_id_seq; Type: SEQUENCE OWNED BY; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER SEQUENCE miljovanliga_milstolpar.bilder_id_seq OWNED BY miljovanliga_milstolpar.bilder.id;


--
-- Name: boende_id_seq; Type: SEQUENCE; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE SEQUENCE miljovanliga_milstolpar.boende_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE miljovanliga_milstolpar.boende_id_seq OWNER TO postgres;

--
-- Name: boende_id_seq; Type: SEQUENCE OWNED BY; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER SEQUENCE miljovanliga_milstolpar.boende_id_seq OWNED BY miljovanliga_milstolpar.boende.id;


--
-- Name: bokning_id_seq; Type: SEQUENCE; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE SEQUENCE miljovanliga_milstolpar.bokning_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE miljovanliga_milstolpar.bokning_id_seq OWNER TO postgres;

--
-- Name: bokning_id_seq; Type: SEQUENCE OWNED BY; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER SEQUENCE miljovanliga_milstolpar.bokning_id_seq OWNED BY miljovanliga_milstolpar.bokning.id;


--
-- Name: bokning_x_aktivitet; Type: TABLE; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE TABLE miljovanliga_milstolpar.bokning_x_aktivitet (
    id integer NOT NULL,
    starttid timestamp without time zone,
    sluttid timestamp without time zone,
    bokning_id integer,
    aktivitet_id integer,
    pris integer
);


ALTER TABLE miljovanliga_milstolpar.bokning_x_aktivitet OWNER TO postgres;

--
-- Name: bokning_x_aktivitet_id_seq; Type: SEQUENCE; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE SEQUENCE miljovanliga_milstolpar.bokning_x_aktivitet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE miljovanliga_milstolpar.bokning_x_aktivitet_id_seq OWNER TO postgres;

--
-- Name: bokning_x_aktivitet_id_seq; Type: SEQUENCE OWNED BY; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER SEQUENCE miljovanliga_milstolpar.bokning_x_aktivitet_id_seq OWNED BY miljovanliga_milstolpar.bokning_x_aktivitet.id;


--
-- Name: bokning_x_boende_id_seq; Type: SEQUENCE; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE SEQUENCE miljovanliga_milstolpar.bokning_x_boende_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE miljovanliga_milstolpar.bokning_x_boende_id_seq OWNER TO postgres;

--
-- Name: bokning_x_boende_id_seq; Type: SEQUENCE OWNED BY; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER SEQUENCE miljovanliga_milstolpar.bokning_x_boende_id_seq OWNED BY miljovanliga_milstolpar.bokning_x_boende.id;


--
-- Name: bokning_x_resepaket; Type: TABLE; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE TABLE miljovanliga_milstolpar.bokning_x_resepaket (
    id integer NOT NULL,
    bokning_id integer,
    bokning_x_boende_id integer,
    bokning_x_transport_id integer,
    bokning_x_aktivitet_id integer
);


ALTER TABLE miljovanliga_milstolpar.bokning_x_resepaket OWNER TO postgres;

--
-- Name: bokning_x_transport; Type: TABLE; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE TABLE miljovanliga_milstolpar.bokning_x_transport (
    id integer NOT NULL,
    ankomsttid timestamp without time zone,
    "avgångstid" timestamp without time zone,
    bokning_id integer,
    transport_id integer,
    pris integer
);


ALTER TABLE miljovanliga_milstolpar.bokning_x_transport OWNER TO postgres;

--
-- Name: bokning_x_transport_id_seq; Type: SEQUENCE; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE SEQUENCE miljovanliga_milstolpar.bokning_x_transport_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE miljovanliga_milstolpar.bokning_x_transport_id_seq OWNER TO postgres;

--
-- Name: bokning_x_transport_id_seq; Type: SEQUENCE OWNED BY; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER SEQUENCE miljovanliga_milstolpar.bokning_x_transport_id_seq OWNED BY miljovanliga_milstolpar.bokning_x_transport.id;


--
-- Name: e_mail_id_seq; Type: SEQUENCE; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE SEQUENCE miljovanliga_milstolpar.e_mail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE miljovanliga_milstolpar.e_mail_id_seq OWNER TO postgres;

--
-- Name: e_mail_id_seq; Type: SEQUENCE OWNED BY; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER SEQUENCE miljovanliga_milstolpar.e_mail_id_seq OWNED BY miljovanliga_milstolpar.email.id;


--
-- Name: faciliteter_boende; Type: TABLE; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE TABLE miljovanliga_milstolpar.faciliteter_boende (
    id integer NOT NULL,
    solpanel boolean NOT NULL,
    "energisnål_uppvärmning" boolean NOT NULL,
    wifi boolean NOT NULL,
    regnvattenuppsamling boolean NOT NULL,
    "närodlad_mat" boolean NOT NULL,
    lokala_samarbeten boolean NOT NULL,
    vegansk_mat boolean NOT NULL,
    "miljöcertifierad" boolean NOT NULL,
    vegetarisk_mat boolean NOT NULL,
    boende_id integer
);


ALTER TABLE miljovanliga_milstolpar.faciliteter_boende OWNER TO postgres;

--
-- Name: faciliteter_boende_id_seq; Type: SEQUENCE; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE SEQUENCE miljovanliga_milstolpar.faciliteter_boende_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE miljovanliga_milstolpar.faciliteter_boende_id_seq OWNER TO postgres;

--
-- Name: faciliteter_boende_id_seq; Type: SEQUENCE OWNED BY; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER SEQUENCE miljovanliga_milstolpar.faciliteter_boende_id_seq OWNED BY miljovanliga_milstolpar.faciliteter_boende.id;


--
-- Name: faciliteter_rum_id_seq; Type: SEQUENCE; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE SEQUENCE miljovanliga_milstolpar.faciliteter_rum_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE miljovanliga_milstolpar.faciliteter_rum_id_seq OWNER TO postgres;

--
-- Name: faciliteter_rum_id_seq; Type: SEQUENCE OWNED BY; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER SEQUENCE miljovanliga_milstolpar.faciliteter_rum_id_seq OWNED BY miljovanliga_milstolpar.faciliteter_rum.id;


--
-- Name: meddelanden; Type: TABLE; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE TABLE miljovanliga_milstolpar.meddelanden (
    id integer NOT NULL,
    "avsändare" integer,
    meddelande character varying(1000),
    mottagare integer,
    tid timestamp without time zone
);


ALTER TABLE miljovanliga_milstolpar.meddelanden OWNER TO postgres;

--
-- Name: meddelanden_id_seq; Type: SEQUENCE; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE SEQUENCE miljovanliga_milstolpar.meddelanden_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE miljovanliga_milstolpar.meddelanden_id_seq OWNER TO postgres;

--
-- Name: meddelanden_id_seq; Type: SEQUENCE OWNED BY; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER SEQUENCE miljovanliga_milstolpar.meddelanden_id_seq OWNED BY miljovanliga_milstolpar.meddelanden.id;


--
-- Name: medresenär; Type: TABLE; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE TABLE miljovanliga_milstolpar."medresenär" (
    id integer NOT NULL,
    "medresenäruppgifter_id" integer,
    bokning_id integer
);


ALTER TABLE miljovanliga_milstolpar."medresenär" OWNER TO postgres;

--
-- Name: medresenär_id_seq; Type: SEQUENCE; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE SEQUENCE miljovanliga_milstolpar."medresenär_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE miljovanliga_milstolpar."medresenär_id_seq" OWNER TO postgres;

--
-- Name: medresenär_id_seq; Type: SEQUENCE OWNED BY; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER SEQUENCE miljovanliga_milstolpar."medresenär_id_seq" OWNED BY miljovanliga_milstolpar."medresenär".id;


--
-- Name: personuppgifter_kopplad_till_bokningsid; Type: VIEW; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE VIEW miljovanliga_milstolpar.personuppgifter_kopplad_till_bokningsid AS
 SELECT b.id AS bokningsid,
    "användareuppgifter"."förnamn",
    "användareuppgifter".efternamn,
    ak.id,
    ak.email_id,
    e.mailadress
   FROM (((miljovanliga_milstolpar."användareuppgifter"
     JOIN miljovanliga_milstolpar."användare_konto" ak ON (("användareuppgifter".id = ak."användareuppgifter_id")))
     JOIN miljovanliga_milstolpar.bokning b ON ((ak.id = b.konto_id)))
     JOIN miljovanliga_milstolpar.email e ON ((e.id = ak.email_id)));


ALTER VIEW miljovanliga_milstolpar.personuppgifter_kopplad_till_bokningsid OWNER TO postgres;

--
-- Name: recension; Type: TABLE; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE TABLE miljovanliga_milstolpar.recension (
    id integer NOT NULL,
    bokning_id integer,
    konto_id integer,
    betyg integer,
    beskrivning character varying(1000),
    tid timestamp without time zone
);


ALTER TABLE miljovanliga_milstolpar.recension OWNER TO postgres;

--
-- Name: recension_id_seq; Type: SEQUENCE; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE SEQUENCE miljovanliga_milstolpar.recension_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE miljovanliga_milstolpar.recension_id_seq OWNER TO postgres;

--
-- Name: recension_id_seq; Type: SEQUENCE OWNED BY; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER SEQUENCE miljovanliga_milstolpar.recension_id_seq OWNED BY miljovanliga_milstolpar.recension.id;


--
-- Name: rum_id_seq; Type: SEQUENCE; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE SEQUENCE miljovanliga_milstolpar.rum_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE miljovanliga_milstolpar.rum_id_seq OWNER TO postgres;

--
-- Name: rum_id_seq; Type: SEQUENCE OWNED BY; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER SEQUENCE miljovanliga_milstolpar.rum_id_seq OWNED BY miljovanliga_milstolpar.rum.id;


--
-- Name: rum_x_faciliteter_id_seq; Type: SEQUENCE; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE SEQUENCE miljovanliga_milstolpar.rum_x_faciliteter_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE miljovanliga_milstolpar.rum_x_faciliteter_id_seq OWNER TO postgres;

--
-- Name: rum_x_faciliteter_id_seq; Type: SEQUENCE OWNED BY; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER SEQUENCE miljovanliga_milstolpar.rum_x_faciliteter_id_seq OWNED BY miljovanliga_milstolpar.rum_x_faciliteter.id;


--
-- Name: systemadmin_kan_se_detaljerad_info_om_bokningar; Type: VIEW; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE VIEW miljovanliga_milstolpar.systemadmin_kan_se_detaljerad_info_om_bokningar AS
 SELECT b.id AS bokning_id,
    a."förnamn",
    a.efternamn,
    b.bokningstid,
    b.antal_person,
    b.status,
    b.speciella_behov,
    bm.betalningsstatus,
    bm.belopp,
    bm.betalningsmetod,
    bm.betalningstid
   FROM (((miljovanliga_milstolpar.bokning b
     JOIN miljovanliga_milstolpar."användare_konto" ak ON ((b.konto_id = ak.id)))
     JOIN miljovanliga_milstolpar."användareuppgifter" a ON ((a.id = ak."användareuppgifter_id")))
     JOIN miljovanliga_milstolpar.betalning bm ON ((bm.id = b.betalning_id)));


ALTER VIEW miljovanliga_milstolpar.systemadmin_kan_se_detaljerad_info_om_bokningar OWNER TO postgres;

--
-- Name: systemadmin_kan_se_lista_av_bokningar; Type: VIEW; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE VIEW miljovanliga_milstolpar.systemadmin_kan_se_lista_av_bokningar AS
 SELECT id,
    bokningstid,
    konto_id,
    status
   FROM miljovanliga_milstolpar.bokning;


ALTER VIEW miljovanliga_milstolpar.systemadmin_kan_se_lista_av_bokningar OWNER TO postgres;

--
-- Name: systemadmin_kan_se_listor_om_kommande_transporter_med_detaljera; Type: VIEW; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE VIEW miljovanliga_milstolpar.systemadmin_kan_se_listor_om_kommande_transporter_med_detaljera AS
 SELECT t.id,
    t.typ,
    t.pris,
    t."snitt_co2_utsläpp",
    t.sparas_co2,
    avg_a.gatunamn AS avg_gatunamn,
    avg_a.gatunummer AS avg_gatunummer,
    avg_a.land AS avg_land,
    ank_a.gatunamn AS ankomst_gatunamn,
    ank_a.gatunummer AS ankomst_gatunummer,
    ank_a.ort AS ankomst_ort,
    ank_a.land AS ankomst_land,
    bxt."avgångstid",
    bxt.ankomsttid
   FROM (((miljovanliga_milstolpar.transport t
     JOIN miljovanliga_milstolpar.bokning_x_transport bxt ON ((t.id = bxt.transport_id)))
     JOIN miljovanliga_milstolpar.adress avg_a ON ((t."avgångsplats" = avg_a.id)))
     JOIN miljovanliga_milstolpar.adress ank_a ON ((t.ankomstplats = ank_a.id)))
  WHERE (bxt."avgångstid" >= now());


ALTER VIEW miljovanliga_milstolpar.systemadmin_kan_se_listor_om_kommande_transporter_med_detaljera OWNER TO postgres;

--
-- Name: transport_id_seq; Type: SEQUENCE; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE SEQUENCE miljovanliga_milstolpar.transport_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE miljovanliga_milstolpar.transport_id_seq OWNER TO postgres;

--
-- Name: transport_id_seq; Type: SEQUENCE OWNED BY; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER SEQUENCE miljovanliga_milstolpar.transport_id_seq OWNED BY miljovanliga_milstolpar.transport.id;


--
-- Name: visa_recensioner; Type: VIEW; Schema: miljovanliga_milstolpar; Owner: postgres
--

CREATE VIEW miljovanliga_milstolpar.visa_recensioner AS
 SELECT r.bokning_id,
    r.betyg,
    r.beskrivning,
    r.tid,
    ak.id AS konto_id
   FROM (miljovanliga_milstolpar.recension r
     JOIN miljovanliga_milstolpar."användare_konto" ak ON ((r.konto_id = ak.id)))
  ORDER BY r.tid DESC;


ALTER VIEW miljovanliga_milstolpar.visa_recensioner OWNER TO postgres;

--
-- Name: användare; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."användare" (
    personid integer NOT NULL,
    "förnamn" character varying(50),
    efternamn character varying(50),
    "användartyp" character varying(20),
    CONSTRAINT "användare_användartyp_check" CHECK ((("användartyp")::text = ANY ((ARRAY['Admin'::character varying, 'RegularUser'::character varying, 'Moderator'::character varying])::text[])))
);


ALTER TABLE public."användare" OWNER TO postgres;

--
-- Name: foretagsregister_databas; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.foretagsregister_databas
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.foretagsregister_databas OWNER TO postgres;

--
-- Name: miljovanliga_milstolpar; Type: TABLE; Schema: schema_name; Owner: postgres
--

CREATE TABLE schema_name.miljovanliga_milstolpar (
    c1 text
);


ALTER TABLE schema_name.miljovanliga_milstolpar OWNER TO postgres;

--
-- Name: adresser id; Type: DEFAULT; Schema: Kzuki Databas; Owner: postgres
--

ALTER TABLE ONLY "Kzuki Databas".adresser ALTER COLUMN id SET DEFAULT nextval('"Kzuki Databas".adresser_adress_id_seq'::regclass);


--
-- Name: anvandare id; Type: DEFAULT; Schema: Kzuki Databas; Owner: postgres
--

ALTER TABLE ONLY "Kzuki Databas".anvandare ALTER COLUMN id SET DEFAULT nextval('"Kzuki Databas".anvandare_anvandare_id_seq'::regclass);


--
-- Name: auktion (Annons) id; Type: DEFAULT; Schema: Kzuki Databas; Owner: postgres
--

ALTER TABLE ONLY "Kzuki Databas"."auktion (Annons)" ALTER COLUMN id SET DEFAULT nextval('"Kzuki Databas"."Auktion (Annons)_auktion_id_seq"'::regclass);


--
-- Name: bilder id; Type: DEFAULT; Schema: Kzuki Databas; Owner: postgres
--

ALTER TABLE ONLY "Kzuki Databas".bilder ALTER COLUMN id SET DEFAULT nextval('"Kzuki Databas".bilder_id_seq'::regclass);


--
-- Name: bud id; Type: DEFAULT; Schema: Kzuki Databas; Owner: postgres
--

ALTER TABLE ONLY "Kzuki Databas".bud ALTER COLUMN id SET DEFAULT nextval('"Kzuki Databas".bud_bud_id_seq'::regclass);


--
-- Name: legenhet id; Type: DEFAULT; Schema: Kzuki Databas; Owner: postgres
--

ALTER TABLE ONLY "Kzuki Databas".legenhet ALTER COLUMN id SET DEFAULT nextval('"Kzuki Databas".legenhet_legenhet_id_seq'::regclass);


--
-- Name: objekt id; Type: DEFAULT; Schema: Kzuki Databas; Owner: postgres
--

ALTER TABLE ONLY "Kzuki Databas".objekt ALTER COLUMN id SET DEFAULT nextval('"Kzuki Databas".objekt_objekt_id_seq'::regclass);


--
-- Name: tomt id; Type: DEFAULT; Schema: Kzuki Databas; Owner: postgres
--

ALTER TABLE ONLY "Kzuki Databas".tomt ALTER COLUMN id SET DEFAULT nextval('"Kzuki Databas".tomt_tomt_id_seq'::regclass);


--
-- Name: villa id; Type: DEFAULT; Schema: Kzuki Databas; Owner: postgres
--

ALTER TABLE ONLY "Kzuki Databas".villa ALTER COLUMN id SET DEFAULT nextval('"Kzuki Databas".villa_villa_id_seq'::regclass);


--
-- Name: filmer id; Type: DEFAULT; Schema: bio; Owner: postgres
--

ALTER TABLE ONLY bio.filmer ALTER COLUMN id SET DEFAULT nextval('bio.filmer_id_seq'::regclass);


--
-- Name: salonger id; Type: DEFAULT; Schema: bio; Owner: postgres
--

ALTER TABLE ONLY bio.salonger ALTER COLUMN id SET DEFAULT nextval('bio.salonger_id_seq'::regclass);


--
-- Name: visningar id; Type: DEFAULT; Schema: bio; Owner: postgres
--

ALTER TABLE ONLY bio.visningar ALTER COLUMN id SET DEFAULT nextval('bio.visningar_id_seq'::regclass);


--
-- Name: arbetsuppgifter id; Type: DEFAULT; Schema: foretagsregister_databas; Owner: postgres
--

ALTER TABLE ONLY foretagsregister_databas.arbetsuppgifter ALTER COLUMN id SET DEFAULT nextval('foretagsregister_databas.arbetsuppgifter_id_seq'::regclass);


--
-- Name: bransch id; Type: DEFAULT; Schema: foretagsregister_databas; Owner: postgres
--

ALTER TABLE ONLY foretagsregister_databas.bransch ALTER COLUMN id SET DEFAULT nextval('foretagsregister_databas.bransch_id_seq'::regclass);


--
-- Name: foretag id; Type: DEFAULT; Schema: foretagsregister_databas; Owner: postgres
--

ALTER TABLE ONLY foretagsregister_databas.foretag ALTER COLUMN id SET DEFAULT nextval('foretagsregister_databas.foretag_id_seq'::regclass);


--
-- Name: kontakt_info id; Type: DEFAULT; Schema: foretagsregister_databas; Owner: postgres
--

ALTER TABLE ONLY foretagsregister_databas.kontakt_info ALTER COLUMN id SET DEFAULT nextval('foretagsregister_databas.adresser_id_seq'::regclass);


--
-- Name: adresser id; Type: DEFAULT; Schema: homenet; Owner: postgres
--

ALTER TABLE ONLY homenet.adresser ALTER COLUMN id SET DEFAULT nextval('homenet.adresser_id_seq'::regclass);


--
-- Name: maklare id; Type: DEFAULT; Schema: homenet; Owner: postgres
--

ALTER TABLE ONLY homenet.maklare ALTER COLUMN id SET DEFAULT nextval('homenet.maklare_id_seq'::regclass);


--
-- Name: objekt id; Type: DEFAULT; Schema: homenet; Owner: postgres
--

ALTER TABLE ONLY homenet.objekt ALTER COLUMN id SET DEFAULT nextval('homenet.objekt_id_seq'::regclass);


--
-- Name: personer id; Type: DEFAULT; Schema: homenet; Owner: postgres
--

ALTER TABLE ONLY homenet.personer ALTER COLUMN id SET DEFAULT nextval('homenet.personer_id_seq'::regclass);


--
-- Name: kokböcker id; Type: DEFAULT; Schema: kokböckernas Recept; Owner: postgres
--

ALTER TABLE ONLY "kokböckernas Recept"."kokböcker" ALTER COLUMN id SET DEFAULT nextval('"kokböckernas Recept"."kokboköcker_id_seq"'::regclass);


--
-- Name: kokböcker_med_recept id; Type: DEFAULT; Schema: kokböckernas Recept; Owner: postgres
--

ALTER TABLE ONLY "kokböckernas Recept"."kokböcker_med_recept" ALTER COLUMN id SET DEFAULT nextval('"kokböckernas Recept"."kokböcker_med_recept_id_seq"'::regclass);


--
-- Name: recept id; Type: DEFAULT; Schema: kokböckernas Recept; Owner: postgres
--

ALTER TABLE ONLY "kokböckernas Recept".recept ALTER COLUMN id SET DEFAULT nextval('"kokböckernas Recept".recept_id_seq'::regclass);


--
-- Name: adress id; Type: DEFAULT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.adress ALTER COLUMN id SET DEFAULT nextval('miljovanliga_milstolpar.adress_id_seq'::regclass);


--
-- Name: aktivitet id; Type: DEFAULT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.aktivitet ALTER COLUMN id SET DEFAULT nextval('miljovanliga_milstolpar.aktivitet_id_seq'::regclass);


--
-- Name: användare_konto id; Type: DEFAULT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar."användare_konto" ALTER COLUMN id SET DEFAULT nextval('miljovanliga_milstolpar."användare_konto_id_seq"'::regclass);


--
-- Name: användareuppgifter id; Type: DEFAULT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar."användareuppgifter" ALTER COLUMN id SET DEFAULT nextval('miljovanliga_milstolpar."användareuppgifter_id_seq"'::regclass);


--
-- Name: betalning id; Type: DEFAULT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.betalning ALTER COLUMN id SET DEFAULT nextval('miljovanliga_milstolpar.betalning_id_seq'::regclass);


--
-- Name: bilder id; Type: DEFAULT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.bilder ALTER COLUMN id SET DEFAULT nextval('miljovanliga_milstolpar.bilder_id_seq'::regclass);


--
-- Name: boende id; Type: DEFAULT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.boende ALTER COLUMN id SET DEFAULT nextval('miljovanliga_milstolpar.boende_id_seq'::regclass);


--
-- Name: bokning id; Type: DEFAULT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.bokning ALTER COLUMN id SET DEFAULT nextval('miljovanliga_milstolpar.bokning_id_seq'::regclass);


--
-- Name: bokning_x_aktivitet id; Type: DEFAULT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.bokning_x_aktivitet ALTER COLUMN id SET DEFAULT nextval('miljovanliga_milstolpar.bokning_x_aktivitet_id_seq'::regclass);


--
-- Name: bokning_x_boende id; Type: DEFAULT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.bokning_x_boende ALTER COLUMN id SET DEFAULT nextval('miljovanliga_milstolpar.bokning_x_boende_id_seq'::regclass);


--
-- Name: bokning_x_transport id; Type: DEFAULT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.bokning_x_transport ALTER COLUMN id SET DEFAULT nextval('miljovanliga_milstolpar.bokning_x_transport_id_seq'::regclass);


--
-- Name: email id; Type: DEFAULT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.email ALTER COLUMN id SET DEFAULT nextval('miljovanliga_milstolpar.e_mail_id_seq'::regclass);


--
-- Name: faciliteter_boende id; Type: DEFAULT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.faciliteter_boende ALTER COLUMN id SET DEFAULT nextval('miljovanliga_milstolpar.faciliteter_boende_id_seq'::regclass);


--
-- Name: faciliteter_rum id; Type: DEFAULT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.faciliteter_rum ALTER COLUMN id SET DEFAULT nextval('miljovanliga_milstolpar.faciliteter_rum_id_seq'::regclass);


--
-- Name: meddelanden id; Type: DEFAULT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.meddelanden ALTER COLUMN id SET DEFAULT nextval('miljovanliga_milstolpar.meddelanden_id_seq'::regclass);


--
-- Name: medresenär id; Type: DEFAULT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar."medresenär" ALTER COLUMN id SET DEFAULT nextval('miljovanliga_milstolpar."medresenär_id_seq"'::regclass);


--
-- Name: recension id; Type: DEFAULT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.recension ALTER COLUMN id SET DEFAULT nextval('miljovanliga_milstolpar.recension_id_seq'::regclass);


--
-- Name: rum id; Type: DEFAULT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.rum ALTER COLUMN id SET DEFAULT nextval('miljovanliga_milstolpar.rum_id_seq'::regclass);


--
-- Name: rum_x_faciliteter id; Type: DEFAULT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.rum_x_faciliteter ALTER COLUMN id SET DEFAULT nextval('miljovanliga_milstolpar.rum_x_faciliteter_id_seq'::regclass);


--
-- Name: transport id; Type: DEFAULT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.transport ALTER COLUMN id SET DEFAULT nextval('miljovanliga_milstolpar.transport_id_seq'::regclass);


--
-- Data for Name: adresser; Type: TABLE DATA; Schema: Kzuki Databas; Owner: postgres
--

INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (27, 'Street 27', 'Norrköping', '88885');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (6, 'Street 6', 'Malmö', '96853');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (4, 'Street 4', 'Norrköping', '62568');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (82, 'Street 74', 'Norrköping', '65265');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (9, 'Street 9', 'Eskilstuna', '63526');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (3, 'Street 3', 'Malmö', '85684');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (8, 'Street 8', 'Norrköping', '65326');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (1, 'Street 1', 'Katrineholm', '12355');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (28, 'Street 28', 'Norrköping', '55562');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (2, 'Street 2', 'Stockholm', '95682');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (7, 'Street 7', 'Helsingborg', '86245');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (15, 'Street 15', 'Eskilstuna', '63529');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (17, 'Street 17', 'Helsingborg', '65963');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (18, 'Street 18', 'Örebro', '36962');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (19, 'Street 19', 'Örebro', '65942');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (20, 'Street 20', 'Linköping', '23657');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (21, 'Street 21', 'Västerås', '85652');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (22, 'Street 22', 'Katrineholm', '99999');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (23, 'Street 23', 'Katrineholm', '55554');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (25, 'Street 25', 'Eskilstuna', '33336');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (26, 'Street 26', 'Linköping', '55529');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (29, 'Street 29', 'Malmö', '33626');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (30, 'Street 30', 'Malmö', '565968');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (31, 'Street 31', 'Västerås', '66245');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (32, 'Street 32', 'Västerås', '88896');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (33, 'Street 33', 'Helsingborg', '22154');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (36, 'Street 36', 'Örebro', '89512');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (37, 'Street 37', 'Västerås', '56234');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (38, 'Street 38', 'Linköping', '86953');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (39, 'Street 39', 'Linköping', '96352');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (43, 'Street 43', 'Malmö', '96352');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (44, 'Street 44', 'Helsingborg', '65235');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (45, 'Street 45', 'Malmö', '52485');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (47, 'Street 47', 'Eskilstuna', '85633');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (51, 'Street 51', 'Eskilstuna', '96322');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (52, 'Street 52', 'Helsingborg', '52652');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (53, 'Street 53', 'Malmö', '63257');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (55, 'Street 55', 'Linköping', '96385');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (57, 'Street 57', 'Helsingborg', '52412');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (58, 'Street 58', 'Malmö', '63585');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (59, 'Street 59', 'Västerås', '36225');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (60, 'Street 60', 'Linköping', '65236');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (62, 'Street 62', 'Malmö', '63636');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (63, 'Street 63', 'Örebro', '63652');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (64, 'Street 64', 'Västerås', '96586');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (65, 'Street 65', 'Katrineholm', '21563');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (78, 'Street 70', 'Katrineholm', '25125');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (79, 'Street 71', 'Helsingborg', '52562');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (80, 'Street 72', 'Malmö', '85652');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (81, 'Street 73', 'Malmö', '62562');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (83, 'Street 75', 'Linköping', '63285');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (76, 'Street 68', 'Stockholm', '52551');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (42, 'Street 42', 'Stockholm', '85642');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (11, 'Street 11', 'Stockholm', '21536');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (5, 'Street 5', 'Stockholm', '75863');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (74, 'Street 66', 'Stockholm', '65862');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (34, 'Street 34', 'Stockholm', '75869');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (46, 'Street 46', 'Stockholm', '22135');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (10, 'Street 10', 'Stockholm', '21456');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (77, 'Street 69', 'Stockholm', '42152');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (75, 'Street 67', 'Stockholm', '62452');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (56, 'Street 56', 'Stockholm', '12365');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (35, 'Street 35', 'Stockholm', '36934');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (12, 'Street 12', 'Stockholm', '25698');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (13, 'Street 13', 'Stockholm', '63598');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (16, 'Street 16', 'Stockholm', '68956');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (14, 'Street 14', 'Stockholm', '85695');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (54, 'Street 54', 'Stockholm', '85362');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (41, 'Street 41', 'Stockholm', '85632');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (24, 'Street 24', 'Stockholm', '22256');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (50, 'Street 50', 'Norrköping', '85145');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (40, 'Street 40', 'Norrköping', '56463');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (61, 'Street 61', 'Norrköping', '63566');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (49, 'Street 49', 'Norrköping', '85932');
INSERT INTO "Kzuki Databas".adresser (id, gatunamn, stad, postnummer) VALUES (48, 'Street 48', 'Norrköping', '22045');


--
-- Data for Name: anvandare; Type: TABLE DATA; Schema: Kzuki Databas; Owner: postgres
--

INSERT INTO "Kzuki Databas".anvandare (id, anvandarnamn, losenord, email, regis_datum, fornamn, efternamn, org_nummer, telefon, adress) VALUES (4, 'user 4', 'pass4', 'jninjnu@gmail.com', '2023-07-01 11:37:52', 'Viktor', 'Karlsson', NULL, '0114455869', 2);
INSERT INTO "Kzuki Databas".anvandare (id, anvandarnamn, losenord, email, regis_datum, fornamn, efternamn, org_nummer, telefon, adress) VALUES (1, 'user 1', 'pass1', 'abc@gmail.com', '2022-10-01 11:35:25', 'Adam', 'Larsson', NULL, '0123659865', 1);
INSERT INTO "Kzuki Databas".anvandare (id, anvandarnamn, losenord, email, regis_datum, fornamn, efternamn, org_nummer, telefon, adress) VALUES (3, 'user 3', 'pass3', 'bfhasb@gmail.com', '2023-06-03 11:37:40', 'John', 'Eriksson', '012364548569', '0336655998', 9);
INSERT INTO "Kzuki Databas".anvandare (id, anvandarnamn, losenord, email, regis_datum, fornamn, efternamn, org_nummer, telefon, adress) VALUES (7, 'user 6', 'pass6', 'dsfsf@gmail.com', '2024-01-11 10:46:06', 'Jemili', 'Gustafsson', NULL, '0114455865', 40);
INSERT INTO "Kzuki Databas".anvandare (id, anvandarnamn, losenord, email, regis_datum, fornamn, efternamn, org_nummer, telefon, adress) VALUES (8, 'user 7', 'pass7', 'bsknlskdnd@gmail.com', '2022-10-11 10:46:16', 'Ash', 'Häggblom', NULL, '0632565474', 39);
INSERT INTO "Kzuki Databas".anvandare (id, anvandarnamn, losenord, email, regis_datum, fornamn, efternamn, org_nummer, telefon, adress) VALUES (9, 'user 8', 'pass8', 'jiamwiwmw@gmail.com', '2022-10-11 10:46:20', 'Troy', 'Söderlund', '965862112365', '0201453214', 38);
INSERT INTO "Kzuki Databas".anvandare (id, anvandarnamn, losenord, email, regis_datum, fornamn, efternamn, org_nummer, telefon, adress) VALUES (10, 'user 9', 'pass9', 'idnwekfn@gmail.com', '2021-10-11 10:46:23', 'Mila', 'Mattsson', NULL, '0852365425', 37);
INSERT INTO "Kzuki Databas".anvandare (id, anvandarnamn, losenord, email, regis_datum, fornamn, efternamn, org_nummer, telefon, adress) VALUES (11, 'user 10', 'pass10', 'joknrfo@gmail.com', '2023-09-11 10:46:26', 'Karl', 'Lindholm', NULL, '0325486252', 36);
INSERT INTO "Kzuki Databas".anvandare (id, anvandarnamn, losenord, email, regis_datum, fornamn, efternamn, org_nummer, telefon, adress) VALUES (12, 'user 11', 'pass11', 'pdkfokwsm@gmail.com', '2022-10-14 10:46:31', 'Malin', 'Svensson', NULL, '0851452145', 35);
INSERT INTO "Kzuki Databas".anvandare (id, anvandarnamn, losenord, email, regis_datum, fornamn, efternamn, org_nummer, telefon, adress) VALUES (13, 'user 12', 'pass12', 'fdv1df51@gmail.com', '2023-07-16 10:46:39', 'Moll', 'Olsson', '965854126555', '0323231215', 34);
INSERT INTO "Kzuki Databas".anvandare (id, anvandarnamn, losenord, email, regis_datum, fornamn, efternamn, org_nummer, telefon, adress) VALUES (14, 'user 13', 'pass13', 'dmfomnfko@gmail.com', '2018-07-11 10:46:48', 'Junas', 'Hellström', NULL, '0856321963', 33);
INSERT INTO "Kzuki Databas".anvandare (id, anvandarnamn, losenord, email, regis_datum, fornamn, efternamn, org_nummer, telefon, adress) VALUES (15, 'user 14', 'pass14', 'iojeoifmklwr@gmail.com', '2022-07-11 10:46:58', 'Juno', 'Jansson', NULL, '0963651758', 32);
INSERT INTO "Kzuki Databas".anvandare (id, anvandarnamn, losenord, email, regis_datum, fornamn, efternamn, org_nummer, telefon, adress) VALUES (16, 'user 15', 'pass15', 'kjnmklamdolw@gmail.com', '2021-10-14 10:47:02', 'Liam', 'Sjölund', NULL, '0256965214', 31);
INSERT INTO "Kzuki Databas".anvandare (id, anvandarnamn, losenord, email, regis_datum, fornamn, efternamn, org_nummer, telefon, adress) VALUES (17, 'user 16', 'pass16', 'wedfknwkenmfoim@gmail.com', '2024-02-12 10:47:06', 'Tannaz', 'Danielsson', NULL, '0854562586', 30);
INSERT INTO "Kzuki Databas".anvandare (id, anvandarnamn, losenord, email, regis_datum, fornamn, efternamn, org_nummer, telefon, adress) VALUES (18, 'user 17', 'pass17', 'klajnfkn@gmail.com', '2023-10-15 10:47:21', 'Hambus', 'Nordberg', '966332256658', '0965423125', 29);
INSERT INTO "Kzuki Databas".anvandare (id, anvandarnamn, losenord, email, regis_datum, fornamn, efternamn, org_nummer, telefon, adress) VALUES (19, 'user 18', 'pass18', 'admkjbf216@gmail.com', '2023-10-18 10:47:26', 'Loy', 'Mattsson', NULL, '0521452522', 28);
INSERT INTO "Kzuki Databas".anvandare (id, anvandarnamn, losenord, email, regis_datum, fornamn, efternamn, org_nummer, telefon, adress) VALUES (20, 'user 19', 'pass19', 'kjhdnaskfns64@gmail.com', '2021-10-11 10:47:32', 'Thomas', 'Eriksson', '855412254478', '0963855563', 27);
INSERT INTO "Kzuki Databas".anvandare (id, anvandarnamn, losenord, email, regis_datum, fornamn, efternamn, org_nummer, telefon, adress) VALUES (21, 'user 20', 'pass20', 'kjdhfiwndfjkn@gmail.com', '2023-11-11 10:47:36', 'Victoria', 'Johansson', NULL, '0856396385', 26);
INSERT INTO "Kzuki Databas".anvandare (id, anvandarnamn, losenord, email, regis_datum, fornamn, efternamn, org_nummer, telefon, adress) VALUES (22, 'user 21', 'pass21', 'wekdhweofj@gmail.com', '2024-06-11 10:47:42', 'Sam', 'Englund', NULL, '0895456213', 25);
INSERT INTO "Kzuki Databas".anvandare (id, anvandarnamn, losenord, email, regis_datum, fornamn, efternamn, org_nummer, telefon, adress) VALUES (23, 'user 22', 'pass22', 'dfanjkwbnfjk@gmail.com', '2023-12-13 10:47:47', 'Sanue', 'Andresson', NULL, '0856325623', 24);
INSERT INTO "Kzuki Databas".anvandare (id, anvandarnamn, losenord, email, regis_datum, fornamn, efternamn, org_nummer, telefon, adress) VALUES (24, 'user 23', 'pass23', 'cjakbjkbnk@gmail.com', '2022-12-16 10:48:04', 'Izabella', 'Wilhelms', '966575511224', '0857496321', 23);
INSERT INTO "Kzuki Databas".anvandare (id, anvandarnamn, losenord, email, regis_datum, fornamn, efternamn, org_nummer, telefon, adress) VALUES (26, 'user 25', 'pass25', 'kcnskjfvnk@gmail.com', '2019-10-11 10:45:26', 'Sund', 'Brändö', '856544125896', '0125262565', 21);
INSERT INTO "Kzuki Databas".anvandare (id, anvandarnamn, losenord, email, regis_datum, fornamn, efternamn, org_nummer, telefon, adress) VALUES (27, 'user 26', 'pass26', 'gfdgdssd@gmail.com', '2019-10-11 15:19:26', 'Åsa', 'Karlsson', NULL, '0854563958', 74);
INSERT INTO "Kzuki Databas".anvandare (id, anvandarnamn, losenord, email, regis_datum, fornamn, efternamn, org_nummer, telefon, adress) VALUES (28, 'user 27', 'pass26', 'fsd952@gmail.com', '2019-10-11 15:19:35', 'Lisa', 'Eriksson', NULL, '0326526525', 75);
INSERT INTO "Kzuki Databas".anvandare (id, anvandarnamn, losenord, email, regis_datum, fornamn, efternamn, org_nummer, telefon, adress) VALUES (29, 'user 28', 'pass27', 'afed9654@gmail.com', '2018-10-11 15:19:40', 'Kristin', 'Englund', NULL, '0898562232', 76);
INSERT INTO "Kzuki Databas".anvandare (id, anvandarnamn, losenord, email, regis_datum, fornamn, efternamn, org_nummer, telefon, adress) VALUES (30, 'user 29', 'pass28', 'dwafsds@gmail.com', '2019-07-11 15:19:46', 'Anneli', 'Andresson', NULL, '0412514514', 77);
INSERT INTO "Kzuki Databas".anvandare (id, anvandarnamn, losenord, email, regis_datum, fornamn, efternamn, org_nummer, telefon, adress) VALUES (31, 'user 30', 'pass29', 'vsdfddf5b25d15@gmail.com', '2019-06-13 15:19:51', 'Siv', 'Larsson', '452145245252', '0321414144', 78);
INSERT INTO "Kzuki Databas".anvandare (id, anvandarnamn, losenord, email, regis_datum, fornamn, efternamn, org_nummer, telefon, adress) VALUES (32, 'user 31', 'pass30', 'dasc9525@gmail.com', '2017-08-11 15:20:01', 'Sofie', 'Olsson', NULL, '0541254574', 79);
INSERT INTO "Kzuki Databas".anvandare (id, anvandarnamn, losenord, email, regis_datum, fornamn, efternamn, org_nummer, telefon, adress) VALUES (33, 'user 32', 'pass31', 'afdbxcsdsf9526@gmail.com', '2019-10-14 15:20:07', 'Emma', 'Bergman', NULL, '0754745544', 80);
INSERT INTO "Kzuki Databas".anvandare (id, anvandarnamn, losenord, email, regis_datum, fornamn, efternamn, org_nummer, telefon, adress) VALUES (34, 'user 33', 'pass32', 'gsdfs85258@gmail.com', '2019-07-11 15:20:12', 'Ella', 'Wilhelms', NULL, '0852558555', 81);
INSERT INTO "Kzuki Databas".anvandare (id, anvandarnamn, losenord, email, regis_datum, fornamn, efternamn, org_nummer, telefon, adress) VALUES (35, 'user 34', 'pass33', 'dscs952625@gmail.com', '2017-10-13 15:20:16', 'Olivia', 'Sjölund', NULL, '0321457474', 82);
INSERT INTO "Kzuki Databas".anvandare (id, anvandarnamn, losenord, email, regis_datum, fornamn, efternamn, org_nummer, telefon, adress) VALUES (36, 'user 35', 'pass34', 'gfds84258@gmail.com', '2017-12-11 15:20:23', 'Ebba', 'Brändö', NULL, '0542542524', 83);
INSERT INTO "Kzuki Databas".anvandare (id, anvandarnamn, losenord, email, regis_datum, fornamn, efternamn, org_nummer, telefon, adress) VALUES (5, 'user 2', 'pass2', 'qwfdw@gmail.com', '2022-05-02 11:37:59', 'Mila', 'Johansson', '963526895496', '0356655829', 6);
INSERT INTO "Kzuki Databas".anvandare (id, anvandarnamn, losenord, email, regis_datum, fornamn, efternamn, org_nummer, telefon, adress) VALUES (2, 'user 5', 'pass5', 'dashb@gmail.com', '2021-06-01 11:37:29', 'Eva', 'Andresson', '', '0369856324', 8);
INSERT INTO "Kzuki Databas".anvandare (id, anvandarnamn, losenord, email, regis_datum, fornamn, efternamn, org_nummer, telefon, adress) VALUES (25, 'user 24', 'abc@123456', 'john.larsson.swe@gmail.com.se', '2023-09-29 10:48:13', 'John', 'Larsson', NULL, '0728327639', 22);
INSERT INTO "Kzuki Databas".anvandare (id, anvandarnamn, losenord, email, regis_datum, fornamn, efternamn, org_nummer, telefon, adress) VALUES (37, 'user 40', 'abc@123', 'john.andresson@gmail.com.se', '2024-10-12 14:46:28.491277', 'John', 'Andresson', '02365325614', '0725638564', 30);


--
-- Data for Name: anvandareuppgifter; Type: TABLE DATA; Schema: Kzuki Databas; Owner: postgres
--



--
-- Data for Name: auktion (Annons); Type: TABLE DATA; Schema: Kzuki Databas; Owner: postgres
--

INSERT INTO "Kzuki Databas"."auktion (Annons)" (id, saljare_id, starttid, avslutat, status, startpris, objekt_typ, vinnare_id, anteckning, slutpris) VALUES (4, 1, '2023-05-01 11:44:20', '2023-05-03 11:44:31', 'avslutade', 850000, 'lägenhet', 4, NULL, 900000);
INSERT INTO "Kzuki Databas"."auktion (Annons)" (id, saljare_id, starttid, avslutat, status, startpris, objekt_typ, vinnare_id, anteckning, slutpris) VALUES (11, 13, '2022-10-11 14:24:52', '2022-10-22 14:31:17', 'avslutade', 1850000, 'lägenhet', 27, NULL, 2100000);
INSERT INTO "Kzuki Databas"."auktion (Annons)" (id, saljare_id, starttid, avslutat, status, startpris, objekt_typ, vinnare_id, anteckning, slutpris) VALUES (15, 17, '2022-07-11 14:25:54', '2022-07-20 14:32:14', 'avslutade', 2600000, 'lägenhet', 28, NULL, 2980000);
INSERT INTO "Kzuki Databas"."auktion (Annons)" (id, saljare_id, starttid, avslutat, status, startpris, objekt_typ, vinnare_id, anteckning, slutpris) VALUES (7, 9, '2023-10-12 14:20:47', '2023-10-22 14:30:57', 'avslutade', 2500000, 'lägenhet', 21, NULL, 2800000);
INSERT INTO "Kzuki Databas"."auktion (Annons)" (id, saljare_id, starttid, avslutat, status, startpris, objekt_typ, vinnare_id, anteckning, slutpris) VALUES (12, 14, '2023-07-11 14:25:21', '2023-07-21 14:31:47', 'avslutade', 970000, 'lägenhet', 32, NULL, 1300000);
INSERT INTO "Kzuki Databas"."auktion (Annons)" (id, saljare_id, starttid, avslutat, status, startpris, objekt_typ, vinnare_id, anteckning, slutpris) VALUES (8, 10, '2024-10-11 14:23:33', '2024-10-31 15:48:46', 'pågående', 3000000, 'lägenhet', NULL, NULL, NULL);
INSERT INTO "Kzuki Databas"."auktion (Annons)" (id, saljare_id, starttid, avslutat, status, startpris, objekt_typ, vinnare_id, anteckning, slutpris) VALUES (9, 11, '2024-11-14 14:23:45', '2024-12-04 15:48:55', 'kommande', 1800000, 'lägenhet', NULL, NULL, NULL);
INSERT INTO "Kzuki Databas"."auktion (Annons)" (id, saljare_id, starttid, avslutat, status, startpris, objekt_typ, vinnare_id, anteckning, slutpris) VALUES (3, 1, '2024-10-01 11:43:47', '2024-10-20 15:48:13', 'pågående', 1000000, 'villa', NULL, NULL, NULL);
INSERT INTO "Kzuki Databas"."auktion (Annons)" (id, saljare_id, starttid, avslutat, status, startpris, objekt_typ, vinnare_id, anteckning, slutpris) VALUES (14, 16, '2024-10-02 14:25:43', '2024-10-22 15:49:29', 'pågående', 1300000, 'tomt', NULL, NULL, NULL);
INSERT INTO "Kzuki Databas"."auktion (Annons)" (id, saljare_id, starttid, avslutat, status, startpris, objekt_typ, vinnare_id, anteckning, slutpris) VALUES (6, 8, '2024-10-06 14:20:25', '2024-10-26 15:48:39', 'pågående', 980000, 'lägenhet', NULL, NULL, NULL);
INSERT INTO "Kzuki Databas"."auktion (Annons)" (id, saljare_id, starttid, avslutat, status, startpris, objekt_typ, vinnare_id, anteckning, slutpris) VALUES (5, 7, '2024-10-03 14:19:44', '2024-10-23 15:48:28', 'pågående', 1200000, 'lägenhet', NULL, NULL, NULL);
INSERT INTO "Kzuki Databas"."auktion (Annons)" (id, saljare_id, starttid, avslutat, status, startpris, objekt_typ, vinnare_id, anteckning, slutpris) VALUES (1, 2, '2023-10-01 11:43:21', '2023-10-04 11:43:26', 'avslutade', 900000, 'lägenhet', 5, NULL, 1050000);
INSERT INTO "Kzuki Databas"."auktion (Annons)" (id, saljare_id, starttid, avslutat, status, startpris, objekt_typ, vinnare_id, anteckning, slutpris) VALUES (2, 2, '2024-07-01 11:43:31', '2024-07-06 11:43:41', 'avslutade', 600000, 'tomt', 27, NULL, 698000);
INSERT INTO "Kzuki Databas"."auktion (Annons)" (id, saljare_id, starttid, avslutat, status, startpris, objekt_typ, vinnare_id, anteckning, slutpris) VALUES (10, 12, '2024-11-11 14:24:34', '2024-11-30 15:49:18', 'kommande', 2400000, 'lägenhet', NULL, NULL, NULL);
INSERT INTO "Kzuki Databas"."auktion (Annons)" (id, saljare_id, starttid, avslutat, status, startpris, objekt_typ, vinnare_id, anteckning, slutpris) VALUES (13, 13, '2023-05-16 14:25:30', '2023-05-24 14:32:00', 'avslutade', 2200000, 'villa', 33, NULL, 2600000);


--
-- Data for Name: bilder; Type: TABLE DATA; Schema: Kzuki Databas; Owner: postgres
--

INSERT INTO "Kzuki Databas".bilder (id, objekt_id, bild_1, bild_2) VALUES (59, 29, 'https://www.hemnet.se/bostad/villa-6rum-soderhamn-soderhamns-kommun-gravidevagen-1-21427589', 'https://www.hemnet.se/bostad/villa-6rum-torrlosa-svalovs-kommun-bjaragarden-1345-21382229');
INSERT INTO "Kzuki Databas".bilder (id, objekt_id, bild_1, bild_2) VALUES (33, 16, 'https://www.hemnet.se/bostad/tomt-heden-bastads-kommun-blabarsslingan-10-20000996', 'https://www.hemnet.se/bostad/tomt-bollebygd-hultangen-bollebygds-kommun-exklusiva-tomter-till-salu-i-hultangen,-bollebygd-skapa-ditt-dromhem-20396679');
INSERT INTO "Kzuki Databas".bilder (id, objekt_id, bild_1, bild_2) VALUES (31, 15, 'https://www.hemnet.se/bostad/tomt-hemavan-tarnaby-storumans-kommun-mosekalla-111-115-21365844', 'https://www.hemnet.se/bostad/tomt-glado-kvarn-huddinge-kommun-malms-vag-44-21422015');
INSERT INTO "Kzuki Databas".bilder (id, objekt_id, bild_1, bild_2) VALUES (7, 3, 'https://www.hemnet.se/bostad/tomt-kyloren-norrbyn-umea-kommun-kyloren-21405611', 'https://www.hemnet.se/bostad/tomt-lerums-kommun-skallsjo-1-66-21425644');
INSERT INTO "Kzuki Databas".bilder (id, objekt_id, bild_1, bild_2) VALUES (9, 4, 'https://www.hemnet.se/bostad/villa-5rum-odeshogs-kommun-omberg-gamla-skola-lararbostaden-1-21427656', 'https://www.hemnet.se/bostad/villa-4rum-edvinshem-ystads-kommun-kaparegatan-9-21427584');
INSERT INTO "Kzuki Databas".bilder (id, objekt_id, bild_1, bild_2) VALUES (49, 24, 'https://www.hemnet.se/bostad/villa-5rum-timra-timra-kommun-tranvagen-10-21426969', 'https://www.hemnet.se/bostad/villa-5rum-margretelund-osterakers-kommun-kungsfagelvagen-20-21395188');
INSERT INTO "Kzuki Databas".bilder (id, objekt_id, bild_1, bild_2) VALUES (41, 20, 'https://www.hemnet.se/bostad/tomt-torslanda-krossholmen-goteborgs-kommun-krossholmsvagen-32c-21368485', 'https://www.hemnet.se/bostad/tomt-aplared-boras-kommun-borasvagen-15a-21426451');
INSERT INTO "Kzuki Databas".bilder (id, objekt_id, bild_1, bild_2) VALUES (55, 27, 'https://www.hemnet.se/bostad/villa-5rum-kolboda-kalmar-kommun-kolbodagatan-34c-21406416', 'https://www.hemnet.se/bostad/villa-7rum-gnarp-nordanstigs-kommun-ostergrangsjo-145-21427569');
INSERT INTO "Kzuki Databas".bilder (id, objekt_id, bild_1, bild_2) VALUES (43, 21, 'https://www.hemnet.se/bostad/villa-5rum-degerfors-degerfors-kommun-karlskogavagen-18-21427242', 'https://www.hemnet.se/bostad/villa-5rum-hedentorp-kristianstads-kommun-astavagen-15-21427690');
INSERT INTO "Kzuki Databas".bilder (id, objekt_id, bild_1, bild_2) VALUES (23, 11, 'https://www.hemnet.se/bostad/lagenhet-3rum-raby-vasteras-kommun-lovhagsgatan-13-21295384', 'https://www.hemnet.se/bostad/lagenhet-2rum-fosiedal-malmo-kommun-hyacintgatan-27-21424542');
INSERT INTO "Kzuki Databas".bilder (id, objekt_id, bild_1, bild_2) VALUES (21, 10, 'https://www.hemnet.se/bostad/lagenhet-1rum-jakobsberg-jarfalla-kommun-manadsvagen-31-21427250', 'https://www.hemnet.se/bostad/lagenhet-2rum-centrala-hisingen-goteborgs-kommun-gullrisgatan-4d-21426483');
INSERT INTO "Kzuki Databas".bilder (id, objekt_id, bild_1, bild_2) VALUES (57, 28, 'https://www.hemnet.se/bostad/villa-4rum-hokarangen-farsta-stockholms-kommun-kontoristvagen-43-21427555', 'https://www.hemnet.se/bostad/villa-5rum-skattkarr-karlstads-kommun-grasandsvagen-3-21374132');
INSERT INTO "Kzuki Databas".bilder (id, objekt_id, bild_1, bild_2) VALUES (11, 5, 'https://www.hemnet.se/bostad/lagenhet-3rum-centrum-trollhattans-kommun-drottninggatan-46a-21427321', 'https://www.hemnet.se/bostad/lagenhet-2rum-alta-strandparken-nacka-kommun-stensovagen-18-21424655');
INSERT INTO "Kzuki Databas".bilder (id, objekt_id, bild_1, bild_2) VALUES (5, 2, 'https://www.hemnet.se/bostad/lagenhet-4rum-huvudsta-solna-kommun-bygatan-15', 'https://www.hemnet.se/bostad/lagenhet-4rum-huvudsta-solna-kommun-bygatan-15,-2tr-21373302');
INSERT INTO "Kzuki Databas".bilder (id, objekt_id, bild_1, bild_2) VALUES (53, 26, 'https://www.hemnet.se/bostad/villa-5rum-glomsta-huddinge-kommun-karolinerstigen-1a-21311797', 'https://www.hemnet.se/bostad/villa-8rum-nynashamns-kommun-badhusgatan-14-21408095');
INSERT INTO "Kzuki Databas".bilder (id, objekt_id, bild_1, bild_2) VALUES (35, 17, 'https://www.hemnet.se/bostad/tomt-ronneby-kommun-aktervagen-6-19912498', 'https://www.hemnet.se/bostad/tomt-gnosjo-kommun-varbruksvagen-21426660');
INSERT INTO "Kzuki Databas".bilder (id, objekt_id, bild_1, bild_2) VALUES (15, 7, 'https://www.hemnet.se/bostad/lagenhet-2rum-gotene-tatort-gotene-kommun-linnegatan-5d-21425275', 'https://www.hemnet.se/bostad/lagenhet-3rum-bagaregarden-goteborgs-kommun-landerigatan-2-c-21427413');
INSERT INTO "Kzuki Databas".bilder (id, objekt_id, bild_1, bild_2) VALUES (37, 18, 'https://www.hemnet.se/bostad/tomt-fjatervalen-alvdalens-kommun-ljungstigen-120-20124157', 'https://www.hemnet.se/bostad/tomt-strangnas-strangnas-kommun-berg-27-21307107');
INSERT INTO "Kzuki Databas".bilder (id, objekt_id, bild_1, bild_2) VALUES (3, 1, 'https://www.hemnet.se/bostad/lagenhet-2rum-hyllie-malmo-kommun-tors-grand-13-21390450', 'https://www.hemnet.se/bostad/lagenhet-1rum-enskede-stockholms-kommun-bastuhagsvagen-6-21427373');
INSERT INTO "Kzuki Databas".bilder (id, objekt_id, bild_1, bild_2) VALUES (39, 19, 'https://www.hemnet.se/bostad/tomt-riala-allemora-norrtalje-kommun-allemoravagen-11-d-g-21310241', 'https://www.hemnet.se/bostad/tomt-ostra-gotland-gotlands-kommun-ostergarn-herrvik-188b-21328494');
INSERT INTO "Kzuki Databas".bilder (id, objekt_id, bild_1, bild_2) VALUES (47, 23, 'https://www.hemnet.se/bostad/villa-4rum-centralt-eslovs-kommun-selarpsvagen-21-21427626', 'https://www.hemnet.se/bostad/villa-2rum-raa-helsingborgs-kommun-lidangsgatan-38-21040035');
INSERT INTO "Kzuki Databas".bilder (id, objekt_id, bild_1, bild_2) VALUES (29, 14, 'https://www.hemnet.se/bostad/lagenhet-2rum-centrala-vasby-upplands-vasby-kommun-forsgrand-1-21426861', 'https://www.hemnet.se/bostad/lagenhet-2rum-jakobsberg-jarfalla-kommun-veckovagen-39-21426075');
INSERT INTO "Kzuki Databas".bilder (id, objekt_id, bild_1, bild_2) VALUES (13, 6, 'https://www.hemnet.se/bostad/lagenhet-2rum-kongahalla-kungalvs-kommun-hansagatan-7-21416448', 'https://www.hemnet.se/bostad/lagenhet-3rum-vasastan-stockholms-kommun-vanadisplan-1,-1-tr-21427388');
INSERT INTO "Kzuki Databas".bilder (id, objekt_id, bild_1, bild_2) VALUES (25, 12, 'https://www.hemnet.se/bostad/lagenhet-2rum-vastertorp-stockholms-kommun-skidskyttevagen-6-21403472', 'https://www.hemnet.se/bostad/lagenhet-3rum-rissne-sundbybergs-kommun-mjolnerbacken-64-21348949');
INSERT INTO "Kzuki Databas".bilder (id, objekt_id, bild_1, bild_2) VALUES (19, 9, 'https://www.hemnet.se/bostad/lagenhet-4rum-sodermalm-stockholms-kommun-hornsgatan-178,-3tr-21427407', 'https://www.hemnet.se/bostad/lagenhet-1rum-sodermalm-stockholms-kommun-brannkyrkagatan-52,-2tr-21427379');
INSERT INTO "Kzuki Databas".bilder (id, objekt_id, bild_1, bild_2) VALUES (51, 25, 'https://www.hemnet.se/bostad/villa-6rum-sundre-sodra-gotland-gotlands-kommun-sundre-vastergarde-152-21321075', 'https://www.hemnet.se/bostad/villa-7rum-sodra-gryta-vasteras-kommun-kronhjortsgatan-4-21402452');
INSERT INTO "Kzuki Databas".bilder (id, objekt_id, bild_1, bild_2) VALUES (17, 8, 'https://www.hemnet.se/bostad/lagenhet-2rum-vasterslatt-umea-kommun-timotejvagen-10-21379445', 'https://www.hemnet.se/bostad/lagenhet-3rum-hantverkarbacken-sandvikens-kommun-hantverkarbacken-26a-20783635');
INSERT INTO "Kzuki Databas".bilder (id, objekt_id, bild_1, bild_2) VALUES (27, 13, 'https://www.hemnet.se/bostad/lagenhet-2rum-lilla-essingen-stockholms-kommun-primusgatan-94', 'https://www.hemnet.se/bostad/lagenhet-3rum-johanneberg-almedal-goteborgs-kommun-ebbe-lieberathsgatan-16c-21427460');
INSERT INTO "Kzuki Databas".bilder (id, objekt_id, bild_1, bild_2) VALUES (61, 30, 'https://www.hemnet.se/bostad/villa-5rum-fristad-boras-kommun-tamta-bryngelid-1-21405111', 'https://www.hemnet.se/bostad/villa-5rum-centrum-sala-kommun-brunnsgatan-39-21427514');
INSERT INTO "Kzuki Databas".bilder (id, objekt_id, bild_1, bild_2) VALUES (45, 22, 'https://www.hemnet.se/bostad/villa-6rum-solvik-eskilstuna-kommun-solvik-6-21410409', 'https://www.hemnet.se/bostad/villa-4rum-skinnskattebergs-kommun-bernshammar-16a-21410656');


--
-- Data for Name: bud; Type: TABLE DATA; Schema: Kzuki Databas; Owner: postgres
--

INSERT INTO "Kzuki Databas".bud (id, auktion_id, budgivare_id, bud_belopp, bud_tid) VALUES (6, 1, 3, 975000, '2023-10-03 10:53:30');
INSERT INTO "Kzuki Databas".bud (id, auktion_id, budgivare_id, bud_belopp, bud_tid) VALUES (13, 1, 5, 105000, '2023-10-04 11:43:05');
INSERT INTO "Kzuki Databas".bud (id, auktion_id, budgivare_id, bud_belopp, bud_tid) VALUES (5, 1, 4, 970000, '2023-10-02 13:53:16');
INSERT INTO "Kzuki Databas".bud (id, auktion_id, budgivare_id, bud_belopp, bud_tid) VALUES (4, 1, 3, 950000, '2023-10-02 11:49:10');
INSERT INTO "Kzuki Databas".bud (id, auktion_id, budgivare_id, bud_belopp, bud_tid) VALUES (7, 2, 3, 680000, '2024-07-02 11:54:48');
INSERT INTO "Kzuki Databas".bud (id, auktion_id, budgivare_id, bud_belopp, bud_tid) VALUES (11, 4, 5, 870000, '2023-05-02 12:26:58');
INSERT INTO "Kzuki Databas".bud (id, auktion_id, budgivare_id, bud_belopp, bud_tid) VALUES (12, 4, 4, 900000, '2023-05-03 11:43:15');
INSERT INTO "Kzuki Databas".bud (id, auktion_id, budgivare_id, bud_belopp, bud_tid) VALUES (10, 3, 5, 1050000, '2024-10-01 11:57:39');
INSERT INTO "Kzuki Databas".bud (id, auktion_id, budgivare_id, bud_belopp, bud_tid) VALUES (9, 3, 4, 1030000, '2024-10-01 11:45:22');
INSERT INTO "Kzuki Databas".bud (id, auktion_id, budgivare_id, bud_belopp, bud_tid) VALUES (15, 5, 18, 1220000, '2024-10-03 15:37:58');
INSERT INTO "Kzuki Databas".bud (id, auktion_id, budgivare_id, bud_belopp, bud_tid) VALUES (16, 5, 19, 1250000, '2024-10-04 15:38:08');
INSERT INTO "Kzuki Databas".bud (id, auktion_id, budgivare_id, bud_belopp, bud_tid) VALUES (17, 5, 18, 1320000, '2024-10-06 15:38:15');
INSERT INTO "Kzuki Databas".bud (id, auktion_id, budgivare_id, bud_belopp, bud_tid) VALUES (18, 6, 19, 1000000, '2024-10-06 15:38:39');
INSERT INTO "Kzuki Databas".bud (id, auktion_id, budgivare_id, bud_belopp, bud_tid) VALUES (19, 6, 20, 1100000, '2024-10-08 15:38:47');
INSERT INTO "Kzuki Databas".bud (id, auktion_id, budgivare_id, bud_belopp, bud_tid) VALUES (20, 7, 21, 2550000, '2023-10-12 15:39:21');
INSERT INTO "Kzuki Databas".bud (id, auktion_id, budgivare_id, bud_belopp, bud_tid) VALUES (21, 7, 22, 2600000, '2023-10-13 15:39:28');
INSERT INTO "Kzuki Databas".bud (id, auktion_id, budgivare_id, bud_belopp, bud_tid) VALUES (22, 7, 23, 2680000, '2023-10-16 15:39:36');
INSERT INTO "Kzuki Databas".bud (id, auktion_id, budgivare_id, bud_belopp, bud_tid) VALUES (23, 7, 21, 2800000, '2023-10-22 15:39:45');
INSERT INTO "Kzuki Databas".bud (id, auktion_id, budgivare_id, bud_belopp, bud_tid) VALUES (24, 8, 24, 3050000, '2024-10-11 15:40:25');
INSERT INTO "Kzuki Databas".bud (id, auktion_id, budgivare_id, bud_belopp, bud_tid) VALUES (25, 8, 25, 3070000, '2024-10-11 16:40:33');
INSERT INTO "Kzuki Databas".bud (id, auktion_id, budgivare_id, bud_belopp, bud_tid) VALUES (26, 8, 26, 3100000, '2024-10-11 16:42:43');
INSERT INTO "Kzuki Databas".bud (id, auktion_id, budgivare_id, bud_belopp, bud_tid) VALUES (27, 11, 27, 1900000, '2022-10-11 15:41:19');
INSERT INTO "Kzuki Databas".bud (id, auktion_id, budgivare_id, bud_belopp, bud_tid) VALUES (29, 11, 29, 2000000, '2022-10-16 15:41:33');
INSERT INTO "Kzuki Databas".bud (id, auktion_id, budgivare_id, bud_belopp, bud_tid) VALUES (30, 11, 27, 2100000, '2022-10-22 14:31:17');
INSERT INTO "Kzuki Databas".bud (id, auktion_id, budgivare_id, bud_belopp, bud_tid) VALUES (31, 12, 30, 980000, '2023-07-11 15:42:51');
INSERT INTO "Kzuki Databas".bud (id, auktion_id, budgivare_id, bud_belopp, bud_tid) VALUES (32, 12, 31, 1000000, '2023-07-13 15:42:59');
INSERT INTO "Kzuki Databas".bud (id, auktion_id, budgivare_id, bud_belopp, bud_tid) VALUES (33, 12, 30, 1150000, '2023-07-14 15:43:08');
INSERT INTO "Kzuki Databas".bud (id, auktion_id, budgivare_id, bud_belopp, bud_tid) VALUES (34, 12, 31, 1200000, '2023-07-18 15:43:20');
INSERT INTO "Kzuki Databas".bud (id, auktion_id, budgivare_id, bud_belopp, bud_tid) VALUES (35, 12, 32, 1300000, '2023-07-21 15:43:27');
INSERT INTO "Kzuki Databas".bud (id, auktion_id, budgivare_id, bud_belopp, bud_tid) VALUES (36, 13, 33, 2300000, '2023-05-16 15:43:53');
INSERT INTO "Kzuki Databas".bud (id, auktion_id, budgivare_id, bud_belopp, bud_tid) VALUES (37, 13, 34, 2400000, '2023-05-17 15:44:00');
INSERT INTO "Kzuki Databas".bud (id, auktion_id, budgivare_id, bud_belopp, bud_tid) VALUES (38, 13, 33, 2600000, '2023-05-24 15:44:08');
INSERT INTO "Kzuki Databas".bud (id, auktion_id, budgivare_id, bud_belopp, bud_tid) VALUES (39, 14, 35, 1350000, '2024-10-02 15:44:43');
INSERT INTO "Kzuki Databas".bud (id, auktion_id, budgivare_id, bud_belopp, bud_tid) VALUES (40, 14, 36, 1400000, '2024-10-03 15:44:52');
INSERT INTO "Kzuki Databas".bud (id, auktion_id, budgivare_id, bud_belopp, bud_tid) VALUES (42, 15, 19, 2250000, '2022-07-11 15:47:09');
INSERT INTO "Kzuki Databas".bud (id, auktion_id, budgivare_id, bud_belopp, bud_tid) VALUES (43, 15, 20, 2300000, '2022-07-12 15:47:14');
INSERT INTO "Kzuki Databas".bud (id, auktion_id, budgivare_id, bud_belopp, bud_tid) VALUES (44, 15, 21, 2400000, '2022-07-13 15:47:19');
INSERT INTO "Kzuki Databas".bud (id, auktion_id, budgivare_id, bud_belopp, bud_tid) VALUES (45, 15, 30, 2450000, '2022-07-14 15:47:26');
INSERT INTO "Kzuki Databas".bud (id, auktion_id, budgivare_id, bud_belopp, bud_tid) VALUES (46, 15, 32, 2550000, '2022-07-20 15:47:40');
INSERT INTO "Kzuki Databas".bud (id, auktion_id, budgivare_id, bud_belopp, bud_tid) VALUES (47, 15, 28, 2600000, '2022-07-21 15:47:50');
INSERT INTO "Kzuki Databas".bud (id, auktion_id, budgivare_id, bud_belopp, bud_tid) VALUES (8, 2, 27, 698000, '2024-07-02 13:55:02');
INSERT INTO "Kzuki Databas".bud (id, auktion_id, budgivare_id, bud_belopp, bud_tid) VALUES (41, 14, 30, 1500000, '2024-10-11 15:45:46');
INSERT INTO "Kzuki Databas".bud (id, auktion_id, budgivare_id, bud_belopp, bud_tid) VALUES (28, 11, 19, 1950000, '2022-10-12 15:41:27');


--
-- Data for Name: legenhet; Type: TABLE DATA; Schema: Kzuki Databas; Owner: postgres
--

INSERT INTO "Kzuki Databas".legenhet (id, manad_avgift, antal_rum, hiss, balkong, "våning", badkar, "byggnad_år", boarea, objekt_id) VALUES (4, 3000, 3, 1, 1, 2, 1, '1994-10-10', 90, 1);
INSERT INTO "Kzuki Databas".legenhet (id, manad_avgift, antal_rum, hiss, balkong, "våning", badkar, "byggnad_år", boarea, objekt_id) VALUES (5, 2400, 2.5, 0, 1, 0, 0, '1986-10-01', 75, 2);
INSERT INTO "Kzuki Databas".legenhet (id, manad_avgift, antal_rum, hiss, balkong, "våning", badkar, "byggnad_år", boarea, objekt_id) VALUES (8, 1800, 1, 0, 0, 1, 0, '1998-01-12', 50, 5);
INSERT INTO "Kzuki Databas".legenhet (id, manad_avgift, antal_rum, hiss, balkong, "våning", badkar, "byggnad_år", boarea, objekt_id) VALUES (9, 3200, 3, 1, 1, 2, 1, '1999-02-02', 80, 6);
INSERT INTO "Kzuki Databas".legenhet (id, manad_avgift, antal_rum, hiss, balkong, "våning", badkar, "byggnad_år", boarea, objekt_id) VALUES (10, 2800, 2, 1, 0, 3, 0, '2000-03-10', 45, 7);
INSERT INTO "Kzuki Databas".legenhet (id, manad_avgift, antal_rum, hiss, balkong, "våning", badkar, "byggnad_år", boarea, objekt_id) VALUES (11, 3000, 3, 1, 1, 4, 1, '2001-08-10', 75, 8);
INSERT INTO "Kzuki Databas".legenhet (id, manad_avgift, antal_rum, hiss, balkong, "våning", badkar, "byggnad_år", boarea, objekt_id) VALUES (12, 1800, 1.5, 0, 0, 5, 0, '2002-02-01', 35, 9);
INSERT INTO "Kzuki Databas".legenhet (id, manad_avgift, antal_rum, hiss, balkong, "våning", badkar, "byggnad_år", boarea, objekt_id) VALUES (13, 1900, 2, 1, 0, 6, 0, '1994-01-18', 50, 10);
INSERT INTO "Kzuki Databas".legenhet (id, manad_avgift, antal_rum, hiss, balkong, "våning", badkar, "byggnad_år", boarea, objekt_id) VALUES (14, 2500, 2, 1, 1, 2, 1, '1998-06-01', 55, 11);
INSERT INTO "Kzuki Databas".legenhet (id, manad_avgift, antal_rum, hiss, balkong, "våning", badkar, "byggnad_år", boarea, objekt_id) VALUES (15, 3400, 2.5, 1, 1, 1, 1, '2000-01-17', 68, 12);
INSERT INTO "Kzuki Databas".legenhet (id, manad_avgift, antal_rum, hiss, balkong, "våning", badkar, "byggnad_år", boarea, objekt_id) VALUES (16, 4000, 3, 1, 1, 3, 1, '2010-08-10', 89, 13);
INSERT INTO "Kzuki Databas".legenhet (id, manad_avgift, antal_rum, hiss, balkong, "våning", badkar, "byggnad_år", boarea, objekt_id) VALUES (17, 4200, 3, 1, 1, 5, 1, '2011-02-09', 85, 14);


--
-- Data for Name: objekt; Type: TABLE DATA; Schema: Kzuki Databas; Owner: postgres
--

INSERT INTO "Kzuki Databas".objekt (id, auktion_id, adress_id) VALUES (17, NULL, 52);
INSERT INTO "Kzuki Databas".objekt (id, auktion_id, adress_id) VALUES (6, 5, 42);
INSERT INTO "Kzuki Databas".objekt (id, auktion_id, adress_id) VALUES (13, 11, 49);
INSERT INTO "Kzuki Databas".objekt (id, auktion_id, adress_id) VALUES (2, 4, 4);
INSERT INTO "Kzuki Databas".objekt (id, auktion_id, adress_id) VALUES (21, NULL, 56);
INSERT INTO "Kzuki Databas".objekt (id, auktion_id, adress_id) VALUES (25, NULL, 60);
INSERT INTO "Kzuki Databas".objekt (id, auktion_id, adress_id) VALUES (7, 9, 43);
INSERT INTO "Kzuki Databas".objekt (id, auktion_id, adress_id) VALUES (30, NULL, 65);
INSERT INTO "Kzuki Databas".objekt (id, auktion_id, adress_id) VALUES (11, 6, 47);
INSERT INTO "Kzuki Databas".objekt (id, auktion_id, adress_id) VALUES (3, 2, 5);
INSERT INTO "Kzuki Databas".objekt (id, auktion_id, adress_id) VALUES (20, NULL, 55);
INSERT INTO "Kzuki Databas".objekt (id, auktion_id, adress_id) VALUES (22, NULL, 57);
INSERT INTO "Kzuki Databas".objekt (id, auktion_id, adress_id) VALUES (15, 14, 50);
INSERT INTO "Kzuki Databas".objekt (id, auktion_id, adress_id) VALUES (16, NULL, 51);
INSERT INTO "Kzuki Databas".objekt (id, auktion_id, adress_id) VALUES (26, NULL, 61);
INSERT INTO "Kzuki Databas".objekt (id, auktion_id, adress_id) VALUES (12, 8, 48);
INSERT INTO "Kzuki Databas".objekt (id, auktion_id, adress_id) VALUES (14, 15, 15);
INSERT INTO "Kzuki Databas".objekt (id, auktion_id, adress_id) VALUES (8, 10, 44);
INSERT INTO "Kzuki Databas".objekt (id, auktion_id, adress_id) VALUES (19, NULL, 54);
INSERT INTO "Kzuki Databas".objekt (id, auktion_id, adress_id) VALUES (27, NULL, 62);
INSERT INTO "Kzuki Databas".objekt (id, auktion_id, adress_id) VALUES (29, NULL, 64);
INSERT INTO "Kzuki Databas".objekt (id, auktion_id, adress_id) VALUES (23, 13, 58);
INSERT INTO "Kzuki Databas".objekt (id, auktion_id, adress_id) VALUES (5, 7, 41);
INSERT INTO "Kzuki Databas".objekt (id, auktion_id, adress_id) VALUES (28, NULL, 63);
INSERT INTO "Kzuki Databas".objekt (id, auktion_id, adress_id) VALUES (9, NULL, 45);
INSERT INTO "Kzuki Databas".objekt (id, auktion_id, adress_id) VALUES (18, NULL, 53);
INSERT INTO "Kzuki Databas".objekt (id, auktion_id, adress_id) VALUES (4, 3, 7);
INSERT INTO "Kzuki Databas".objekt (id, auktion_id, adress_id) VALUES (24, NULL, 59);
INSERT INTO "Kzuki Databas".objekt (id, auktion_id, adress_id) VALUES (10, 12, 46);
INSERT INTO "Kzuki Databas".objekt (id, auktion_id, adress_id) VALUES (1, 1, 3);


--
-- Data for Name: tomt; Type: TABLE DATA; Schema: Kzuki Databas; Owner: postgres
--

INSERT INTO "Kzuki Databas".tomt (id, manad_avgift, objekt_id) VALUES (1, 1500, 3);
INSERT INTO "Kzuki Databas".tomt (id, manad_avgift, objekt_id) VALUES (2, 1800, 15);
INSERT INTO "Kzuki Databas".tomt (id, manad_avgift, objekt_id) VALUES (3, 2200, 16);
INSERT INTO "Kzuki Databas".tomt (id, manad_avgift, objekt_id) VALUES (4, 2400, 17);
INSERT INTO "Kzuki Databas".tomt (id, manad_avgift, objekt_id) VALUES (5, 2500, 18);
INSERT INTO "Kzuki Databas".tomt (id, manad_avgift, objekt_id) VALUES (6, 1900, 19);
INSERT INTO "Kzuki Databas".tomt (id, manad_avgift, objekt_id) VALUES (7, 3000, 20);


--
-- Data for Name: villa; Type: TABLE DATA; Schema: Kzuki Databas; Owner: postgres
--

INSERT INTO "Kzuki Databas".villa (id, antal_rum, tomtarea, badkar, byggnad_ar, boarea, objekt_id) VALUES (2, 4, 450, 0, '1995-10-01', 120, 4);
INSERT INTO "Kzuki Databas".villa (id, antal_rum, tomtarea, badkar, byggnad_ar, boarea, objekt_id) VALUES (3, 5, 560, 1, '1998-01-02', 220, 21);
INSERT INTO "Kzuki Databas".villa (id, antal_rum, tomtarea, badkar, byggnad_ar, boarea, objekt_id) VALUES (4, 4, 400, 1, '1994-01-03', 180, 22);
INSERT INTO "Kzuki Databas".villa (id, antal_rum, tomtarea, badkar, byggnad_ar, boarea, objekt_id) VALUES (5, 6, 389, 1, '1996-08-20', 150, 23);
INSERT INTO "Kzuki Databas".villa (id, antal_rum, tomtarea, badkar, byggnad_ar, boarea, objekt_id) VALUES (6, 5, 580, 1, '1989-07-20', 280, 24);
INSERT INTO "Kzuki Databas".villa (id, antal_rum, tomtarea, badkar, byggnad_ar, boarea, objekt_id) VALUES (7, 3, 650, 1, '1985-02-12', 220, 25);
INSERT INTO "Kzuki Databas".villa (id, antal_rum, tomtarea, badkar, byggnad_ar, boarea, objekt_id) VALUES (8, 4, 800, 1, '1988-02-08', 190, 26);
INSERT INTO "Kzuki Databas".villa (id, antal_rum, tomtarea, badkar, byggnad_ar, boarea, objekt_id) VALUES (9, 3, 180, 1, '1987-07-13', 92, 27);
INSERT INTO "Kzuki Databas".villa (id, antal_rum, tomtarea, badkar, byggnad_ar, boarea, objekt_id) VALUES (10, 5, 280, 0, '1999-02-01', 130, 28);
INSERT INTO "Kzuki Databas".villa (id, antal_rum, tomtarea, badkar, byggnad_ar, boarea, objekt_id) VALUES (11, 4, 540, 1, '1970-10-02', 110, 29);
INSERT INTO "Kzuki Databas".villa (id, antal_rum, tomtarea, badkar, byggnad_ar, boarea, objekt_id) VALUES (12, 4, 585, 1, '1998-02-17', 180, 30);


--
-- Data for Name: filmer; Type: TABLE DATA; Schema: bio; Owner: postgres
--

INSERT INTO bio.filmer (id, title, tid_i__minuter, beskrivning) VALUES (1, 'LOTR 1', 182, 'Måste se!!!!');
INSERT INTO bio.filmer (id, title, tid_i__minuter, beskrivning) VALUES (3, 'LOTR 3', 189, 'Också super bra!');
INSERT INTO bio.filmer (id, title, tid_i__minuter, beskrivning) VALUES (2, 'LOTR 2', 197, 'Nästan lika bra!!!!');


--
-- Data for Name: salonger; Type: TABLE DATA; Schema: bio; Owner: postgres
--

INSERT INTO bio.salonger (id, namn, platser, vip) VALUES (1, 'Salong 1', 200, 30);
INSERT INTO bio.salonger (id, namn, platser, vip) VALUES (2, 'Salong 2', 150, 15);
INSERT INTO bio.salonger (id, namn, platser, vip) VALUES (3, 'Salong 3', 100, 10);


--
-- Data for Name: visningar; Type: TABLE DATA; Schema: bio; Owner: postgres
--

INSERT INTO bio.visningar (id, salong_id, film_id, datum, tid) VALUES (1, 1, 2, '2024-10-09', '16:00:00');
INSERT INTO bio.visningar (id, salong_id, film_id, datum, tid) VALUES (2, 3, 1, '2024-10-09', '16:00:00');
INSERT INTO bio.visningar (id, salong_id, film_id, datum, tid) VALUES (3, 2, 3, '2024-10-10', '20:00:00');


--
-- Data for Name: arbetsuppgifter; Type: TABLE DATA; Schema: foretagsregister_databas; Owner: postgres
--



--
-- Data for Name: bransch; Type: TABLE DATA; Schema: foretagsregister_databas; Owner: postgres
--



--
-- Data for Name: foretag; Type: TABLE DATA; Schema: foretagsregister_databas; Owner: postgres
--



--
-- Data for Name: foretag_X_person; Type: TABLE DATA; Schema: foretagsregister_databas; Owner: postgres
--



--
-- Data for Name: kontakt_info; Type: TABLE DATA; Schema: foretagsregister_databas; Owner: postgres
--



--
-- Data for Name: person; Type: TABLE DATA; Schema: foretagsregister_databas; Owner: postgres
--



--
-- Data for Name: adresser; Type: TABLE DATA; Schema: homenet; Owner: postgres
--

INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (1, 'upproret 75E', 'Helsingborg', '25000');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (2, 'toarp 37', 'Lund', '22100');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (3, 'upproret 33', 'Helsingborg', '25000');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (4, 'supgränd 66F', 'Lund', '22100');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (5, 'solhem', 'Degeberga', '21230');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (6, 'stortorget 55', 'Helsingborg', '25000');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (7, 'storgatan 57A', 'Malmö', '22050');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (8, 'kungstorget 49', 'Tomelilla', '27300');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (9, 'upproret 42', 'Malmö', '22050');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (10, 'toarp 2', 'Helsingborg', '25000');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (11, 'nattgränd 4', 'Lund', '22100');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (12, 'nattgränd 39', 'Tomelilla', '27300');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (13, 'upproret 1', 'Skurup', '27400');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (14, 'ullstorp 72E', 'Svedala', '23041');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (15, 'slutet 19B', 'Lund', '22100');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (16, 'bo 47', 'Lund', '22100');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (17, 'spagettiupploppet 32C', 'Malmö', '22050');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (18, 'toarp 57', 'Sjöbo', '27500');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (19, 'storgatan 8', 'Sjöbo', '27500');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (20, 'toarp 9D', 'Skurup', '27400');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (21, 'upproret 11', 'Helsingborg', '25000');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (22, 'byvägen 2', 'Tomelilla', '27300');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (23, 'storgatan 24', 'Svedala', '23041');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (24, 'byvägen 17F', 'Malmö', '22050');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (25, 'upproret 65D', 'Degeberga', '21230');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (26, 'falsterbogatan 12', 'Svedala', '23041');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (27, 'trädgårdsgatan 9', 'Lund', '22100');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (28, 'solhem', 'Helsingborg', '25000');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (29, 'diagonalen 50', 'Sjöbo', '27500');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (30, 'supgränd 37F', 'Tomelilla', '27300');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (31, 'bo 40', 'Skurup', '27400');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (32, 'alabastergränd 70B', 'Svedala', '23041');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (33, 'bo 47', 'Sjöbo', '27500');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (34, 'storgatan 39', 'Degeberga', '21230');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (35, 'diagonalen 69F', 'Helsingborg', '25000');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (36, 'toarp 49', 'Helsingborg', '25000');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (37, 'spagettiupploppet 29', 'Svedala', '23041');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (38, 'byvägen 73B', 'Lund', '22100');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (39, 'narvavägen 52', 'Malmö', '22050');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (40, 'diagonalen 16', 'Svedala', '23041');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (41, 'kungstorget 70', 'Tomelilla', '27300');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (42, 'trädgårdsgatan 59', 'Skurup', '27400');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (43, 'supgränd 43E', 'Helsingborg', '25000');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (44, 'slutet 30', 'Svedala', '23041');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (45, 'kungstorget 15C', 'Svedala', '23041');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (46, 'storgatan 67', 'Skurup', '27400');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (47, 'spagettiupploppet 64', 'Skurup', '27400');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (48, 'ullstorp 7', 'Lund', '22100');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (49, 'slutet 9F', 'Tomelilla', '27300');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (50, 'kungstorget 7B', 'Lund', '22100');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (51, 'narvavägen 24', 'Malmö', '22050');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (52, 'narvavägen 70E', 'Malmö', '22050');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (53, 'alabastergränd 31', 'Malmö', '22050');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (54, 'trädgårdsgatan 19', 'Sjöbo', '27500');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (55, 'solhem 72C', 'Lund', '22100');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (56, 'narvavägen 67', 'Sjöbo', '27500');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (57, 'toarp 35D', 'Skurup', '27400');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (58, 'supgränd 13', 'Svedala', '23041');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (59, 'kungstorget 1', 'Tomelilla', '27300');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (60, 'falsterbogatan 29E', 'Skurup', '27400');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (61, 'trädgårdsgatan 70', 'Malmö', '22050');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (62, 'falsterbogatan 56', 'Helsingborg', '25000');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (63, 'stortorget 57A', 'Malmö', '22050');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (64, 'bo 41', 'Helsingborg', '25000');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (65, 'bo 32', 'Lund', '22100');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (66, 'upproret 28', 'Svedala', '23041');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (67, 'supgränd 20', 'Malmö', '22050');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (68, 'diagonalen 75', 'Sjöbo', '27500');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (69, 'kungstorget 15', 'Helsingborg', '25000');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (70, 'diagonalen 44', 'Lund', '22100');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (71, 'spagettiupploppet 65C', 'Skurup', '27400');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (72, 'falsterbogatan 55', 'Degeberga', '21230');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (73, 'bo 67', 'Svedala', '23041');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (74, 'alabastergränd 34', 'Degeberga', '21230');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (75, 'solhem', 'Lund', '22100');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (76, 'solhem', 'Lund', '22100');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (77, 'narvavägen 29', 'Lund', '22100');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (78, 'supgränd 53', 'Degeberga', '21230');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (79, 'toarp 68D', 'Sjöbo', '27500');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (80, 'stortorget 44', 'Helsingborg', '25000');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (81, 'upproret 45', 'Degeberga', '21230');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (82, 'toarp 49', 'Malmö', '22050');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (83, 'kungstorget 52', 'Degeberga', '21230');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (84, 'storgatan 52', 'Skurup', '27400');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (85, 'trädgårdsgatan 28', 'Degeberga', '21230');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (86, 'toarp 33', 'Lund', '22100');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (87, 'falsterbogatan 51', 'Svedala', '23041');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (88, 'storgatan 47', 'Tomelilla', '27300');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (89, 'ullstorp 18D', 'Degeberga', '21230');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (90, 'ullstorp 65', 'Skurup', '27400');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (91, 'storgatan 6', 'Skurup', '27400');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (92, 'alabastergränd 15', 'Skurup', '27400');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (93, 'toarp 39', 'Svedala', '23041');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (94, 'stortorget 14C', 'Malmö', '22050');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (95, 'bo 65', 'Svedala', '23041');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (96, 'slutet 45B', 'Skurup', '27400');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (97, 'byvägen 28', 'Malmö', '22050');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (98, 'spagettiupploppet 8', 'Lund', '22100');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (99, 'falsterbogatan 30', 'Lund', '22100');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (100, 'byvägen 10', 'Sjöbo', '27500');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (101, 'diagonalen 52', 'Lund', '22100');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (102, 'diagonalen 30', 'Degeberga', '21230');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (103, 'upproret 4', 'Degeberga', '21230');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (104, 'falsterbogatan 67B', 'Skurup', '27400');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (105, 'alabastergränd 12', 'Helsingborg', '25000');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (106, 'bo 11', 'Svedala', '23041');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (107, 'alabastergränd 42', 'Skurup', '27400');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (108, 'stortorget 41C', 'Svedala', '23041');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (109, 'slutet 65D', 'Svedala', '23041');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (110, 'toarp 25A', 'Lund', '22100');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (111, 'ullstorp 56', 'Tomelilla', '27300');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (112, 'ullstorp 8', 'Lund', '22100');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (113, 'spagettiupploppet 62', 'Helsingborg', '25000');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (114, 'falsterbogatan 74', 'Skurup', '27400');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (115, 'nattgränd 31', 'Sjöbo', '27500');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (116, 'stortorget 2F', 'Malmö', '22050');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (117, 'trädgårdsgatan 41', 'Malmö', '22050');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (118, 'bo 33', 'Tomelilla', '27300');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (119, 'bo 62', 'Helsingborg', '25000');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (120, 'diagonalen 40', 'Degeberga', '21230');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (121, 'storgatan 39C', 'Svedala', '23041');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (122, 'kungstorget 6', 'Tomelilla', '27300');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (123, 'spagettiupploppet 15', 'Tomelilla', '27300');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (124, 'ullstorp 27', 'Tomelilla', '27300');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (125, 'falsterbogatan 25', 'Lund', '22100');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (126, 'slutet 52D', 'Lund', '22100');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (127, 'slutet 13', 'Skurup', '27400');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (128, 'supgränd 40', 'Lund', '22100');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (129, 'narvavägen 55', 'Helsingborg', '25000');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (130, 'slutet 52', 'Helsingborg', '25000');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (131, 'trädgårdsgatan 57', 'Malmö', '22050');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (132, 'bo 20', 'Sjöbo', '27500');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (133, 'spagettiupploppet 39', 'Lund', '22100');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (134, 'kungstorget 23', 'Helsingborg', '25000');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (135, 'alabastergränd 7', 'Skurup', '27400');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (136, 'storgatan 2', 'Lund', '22100');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (137, 'spagettiupploppet 15', 'Svedala', '23041');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (138, 'spagettiupploppet 66C', 'Lund', '22100');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (139, 'bo 71', 'Skurup', '27400');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (140, 'solhem 42E', 'Svedala', '23041');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (141, 'byvägen 27', 'Sjöbo', '27500');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (142, 'solhem', 'Skurup', '27400');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (143, 'nattgränd 32', 'Malmö', '22050');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (144, 'byvägen 23F', 'Tomelilla', '27300');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (145, 'alabastergränd 70', 'Sjöbo', '27500');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (146, 'kungstorget 7', 'Skurup', '27400');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (147, 'narvavägen 15', 'Sjöbo', '27500');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (148, 'falsterbogatan 48', 'Malmö', '22050');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (149, 'solhem 13B', 'Skurup', '27400');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (150, 'nattgränd 75', 'Malmö', '22050');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (151, 'slutet 16', 'Svedala', '23041');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (152, 'nattgränd 25D', 'Degeberga', '21230');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (153, 'nattgränd 18', 'Lund', '22100');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (154, 'falsterbogatan 18F', 'Lund', '22100');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (155, 'upproret 31', 'Svedala', '23041');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (156, 'stortorget 9', 'Tomelilla', '27300');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (157, 'kungstorget 11D', 'Sjöbo', '27500');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (158, 'toarp 22', 'Sjöbo', '27500');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (159, 'slutet 60', 'Lund', '22100');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (160, 'kungstorget 44', 'Sjöbo', '27500');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (161, 'narvavägen 72C', 'Sjöbo', '27500');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (162, 'toarp 9B', 'Sjöbo', '27500');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (163, 'ullstorp 61D', 'Degeberga', '21230');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (164, 'kungstorget 55', 'Helsingborg', '25000');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (165, 'ullstorp 63', 'Degeberga', '21230');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (166, 'slutet 18', 'Malmö', '22050');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (167, 'bo 72', 'Lund', '22100');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (168, 'nattgränd 31', 'Skurup', '27400');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (169, 'falsterbogatan 75', 'Lund', '22100');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (170, 'byvägen 67', 'Malmö', '22050');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (171, 'bo 40F', 'Lund', '22100');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (172, 'ullstorp 69E', 'Sjöbo', '27500');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (173, 'storgatan 44', 'Skurup', '27400');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (174, 'supgränd 30', 'Tomelilla', '27300');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (175, 'trädgårdsgatan 28B', 'Malmö', '22050');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (176, 'falsterbogatan 6', 'Tomelilla', '27300');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (177, 'toarp 27C', 'Malmö', '22050');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (178, 'alabastergränd 46F', 'Svedala', '23041');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (179, 'diagonalen 24', 'Malmö', '22050');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (180, 'alabastergränd 34', 'Lund', '22100');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (181, 'bo 30E', 'Svedala', '23041');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (182, 'alabastergränd 24A', 'Tomelilla', '27300');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (183, 'ullstorp 29', 'Svedala', '23041');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (184, 'ullstorp 51', 'Tomelilla', '27300');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (185, 'stortorget 7F', 'Degeberga', '21230');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (186, 'kungstorget 59A', 'Svedala', '23041');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (187, 'falsterbogatan 65', 'Svedala', '23041');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (188, 'ullstorp 73', 'Lund', '22100');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (189, 'byvägen 20A', 'Skurup', '27400');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (190, 'byvägen 19', 'Svedala', '23041');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (191, 'alabastergränd 35', 'Lund', '22100');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (192, 'alabastergränd 72D', 'Helsingborg', '25000');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (193, 'bo 29B', 'Sjöbo', '27500');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (194, 'narvavägen 36', 'Degeberga', '21230');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (195, 'ullstorp 73', 'Sjöbo', '27500');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (196, 'alabastergränd 36', 'Lund', '22100');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (197, 'kungstorget 33', 'Svedala', '23041');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (198, 'kungstorget 9', 'Tomelilla', '27300');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (199, 'upproret 20B', 'Svedala', '23041');
INSERT INTO homenet.adresser (id, gatuadress, ort, postnr) VALUES (200, 'nattgränd 29', 'Sjöbo', '27500');


--
-- Data for Name: maklare; Type: TABLE DATA; Schema: homenet; Owner: postgres
--

INSERT INTO homenet.maklare (id, email, fornamn, efternamn, personnr, telefonnr, bolag) VALUES (1, 'twhiten0@google.com.hk', 'Maëline', 'Whiten', '1992-04-13', '7375851879', 'Privatmäklare');
INSERT INTO homenet.maklare (id, email, fornamn, efternamn, personnr, telefonnr, bolag) VALUES (2, 'thennington1@marriott.com', 'Marlène', 'Hennington', '1969-04-07', '3616789912', 'Bjurfors');
INSERT INTO homenet.maklare (id, email, fornamn, efternamn, personnr, telefonnr, bolag) VALUES (3, 'lherrema2@tumblr.com', 'Angélique', 'Herrema', '1994-11-26', '2142300664', 'Rumsson & Dyhr');
INSERT INTO homenet.maklare (id, email, fornamn, efternamn, personnr, telefonnr, bolag) VALUES (4, 'lbuckston3@bigcartel.com', 'Kuí', 'Buckston', '1988-09-08', '8781362179', 'Bjurfors');
INSERT INTO homenet.maklare (id, email, fornamn, efternamn, personnr, telefonnr, bolag) VALUES (5, 'cmorriarty4@webnode.com', 'Géraldine', 'Morriarty', '1982-01-20', '8657057248', 'Bolagret');
INSERT INTO homenet.maklare (id, email, fornamn, efternamn, personnr, telefonnr, bolag) VALUES (6, 'awoodford5@devhub.com', 'Börje', 'Woodford', '1983-06-08', '6168798328', 'Rumsson & Dyhr');
INSERT INTO homenet.maklare (id, email, fornamn, efternamn, personnr, telefonnr, bolag) VALUES (7, 'troft6@opera.com', 'Åke', 'Roft', '1961-01-19', '1715371474', 'Hembo');
INSERT INTO homenet.maklare (id, email, fornamn, efternamn, personnr, telefonnr, bolag) VALUES (8, 'idenver7@pagesperso-orange.fr', 'Yú', 'Denver', '1964-09-27', '4089948912', 'Bjurfors');
INSERT INTO homenet.maklare (id, email, fornamn, efternamn, personnr, telefonnr, bolag) VALUES (9, 'gkuhlmey8@thetimes.co.uk', 'Ráo', 'Kuhlmey', '2002-02-21', '8987495835', 'Borta Bäst');
INSERT INTO homenet.maklare (id, email, fornamn, efternamn, personnr, telefonnr, bolag) VALUES (10, 'dboerder9@quantcast.com', 'Anaïs', 'Boerder', '1955-05-17', '8216112719', 'Bolagret');
INSERT INTO homenet.maklare (id, email, fornamn, efternamn, personnr, telefonnr, bolag) VALUES (11, 'mshillsa@globo.com', 'Marie-josée', 'Shills', '1977-04-25', '4027497586', 'Privatmäklare');
INSERT INTO homenet.maklare (id, email, fornamn, efternamn, personnr, telefonnr, bolag) VALUES (12, 'aobroganeb@mozilla.org', 'Yáo', 'O''Brogane', '1954-09-11', '1563273598', 'Rumsson & Dyhr');
INSERT INTO homenet.maklare (id, email, fornamn, efternamn, personnr, telefonnr, bolag) VALUES (13, 'lovenellc@networkadvertising.org', 'Simplifiés', 'Ovenell', '1951-03-18', '5114073054', 'Privatmäklare');
INSERT INTO homenet.maklare (id, email, fornamn, efternamn, personnr, telefonnr, bolag) VALUES (14, 'bgwynethd@wp.com', 'Yáo', 'Gwyneth', '1993-01-27', '7143693587', 'Hembo');
INSERT INTO homenet.maklare (id, email, fornamn, efternamn, personnr, telefonnr, bolag) VALUES (15, 'bbellsone@si.edu', 'Wá', 'Bellson', '1963-12-14', '2972326560', 'Bolagret');
INSERT INTO homenet.maklare (id, email, fornamn, efternamn, personnr, telefonnr, bolag) VALUES (16, 'mtummondf@indiatimes.com', 'Estève', 'Tummond', '1990-09-22', '3591279855', 'Bjurfors');
INSERT INTO homenet.maklare (id, email, fornamn, efternamn, personnr, telefonnr, bolag) VALUES (17, 'astormontg@examiner.com', 'Östen', 'Stormont', '1985-07-01', '1597419983', 'Privatmäklare');
INSERT INTO homenet.maklare (id, email, fornamn, efternamn, personnr, telefonnr, bolag) VALUES (18, 'ininnottih@github.io', 'Publicité', 'Ninnotti', '1983-05-27', '5199119339', 'Borta Bäst');
INSERT INTO homenet.maklare (id, email, fornamn, efternamn, personnr, telefonnr, bolag) VALUES (19, 'gcammiemilei@i2i.jp', 'Marie-josée', 'Cammiemile', '1972-11-30', '9465061611', 'Privatmäklare');
INSERT INTO homenet.maklare (id, email, fornamn, efternamn, personnr, telefonnr, bolag) VALUES (20, 'raudryj@biglobe.ne.jp', 'Dù', 'Audry', '1984-04-21', '1124411988', 'Bolagret');
INSERT INTO homenet.maklare (id, email, fornamn, efternamn, personnr, telefonnr, bolag) VALUES (21, 'rwalkdenk@google.cn', 'Magdalène', 'Walkden', '1954-06-29', '9539254483', 'Hembo');
INSERT INTO homenet.maklare (id, email, fornamn, efternamn, personnr, telefonnr, bolag) VALUES (22, 'mdoughtyl@creativecommons.org', 'Pò', 'Doughty', '1990-02-25', '2444904540', 'Bjurfors');
INSERT INTO homenet.maklare (id, email, fornamn, efternamn, personnr, telefonnr, bolag) VALUES (23, 'psetonm@scribd.com', 'Mélia', 'Seton', '1996-10-13', '8802152723', 'Privatmäklare');
INSERT INTO homenet.maklare (id, email, fornamn, efternamn, personnr, telefonnr, bolag) VALUES (24, 'clisciandron@thetimes.co.uk', 'Zhì', 'Lisciandro', '1986-12-31', '2655055344', 'Rumsson & Dyhr');
INSERT INTO homenet.maklare (id, email, fornamn, efternamn, personnr, telefonnr, bolag) VALUES (25, 'cphysicko@instagram.com', 'Desirée', 'Physick', '1994-03-10', '3972634326', 'Bolagret');
INSERT INTO homenet.maklare (id, email, fornamn, efternamn, personnr, telefonnr, bolag) VALUES (26, 'sedmedp@sphinn.com', 'Athéna', 'Edmed', '1951-01-03', '4138652630', 'Bjurfors');
INSERT INTO homenet.maklare (id, email, fornamn, efternamn, personnr, telefonnr, bolag) VALUES (27, 'elathwoodq@google.ru', 'Clémence', 'Lathwood', '2001-04-24', '8709023370', 'Borta Bäst');
INSERT INTO homenet.maklare (id, email, fornamn, efternamn, personnr, telefonnr, bolag) VALUES (28, 'saronsteinr@nbcnews.com', 'Zhì', 'Aronstein', '1970-04-07', '3721780721', 'Hembo');
INSERT INTO homenet.maklare (id, email, fornamn, efternamn, personnr, telefonnr, bolag) VALUES (29, 'tconverys@hostgator.com', 'Méthode', 'Convery', '1950-05-14', '7137443780', 'Privatmäklare');
INSERT INTO homenet.maklare (id, email, fornamn, efternamn, personnr, telefonnr, bolag) VALUES (30, 'mchataint@usgs.gov', 'Hélèna', 'Chatain', '1972-04-29', '5029917043', 'Bolagret');


--
-- Data for Name: objekt; Type: TABLE DATA; Schema: homenet; Owner: postgres
--

INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (29, 21, 4, 93, 6, 0, 1, 8157, 14640000, 17148500, 257228, '2023-03-23', '2023-12-02', 80, 3, 1);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (31, 95, 4, 143, 6, 0, 0, 13088, 12676000, 14849500, 222743, '2023-02-25', '2023-11-21', 121, 10, 6);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (33, 75, 5, 84, 4, 0, 0, 3006, 683000, 683000, 10245, '2022-12-15', '2022-12-31', 47, 66, 1);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (34, 44, 5, 108, 5, 1, 0, 12108, 11758000, 13781500, 206723, '2023-05-12', '2023-09-17', 30, 60, 6);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (35, 7, 3, 178, 4, 0, 1, 6077, 16178000, 13817000, 207255, '2022-12-28', '2023-11-18', 112, 92, 3);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (37, 80, 6, 180, 6, 0, 0, 5013, 2402000, 2839000, 42585, '2022-12-30', '2023-03-31', 147, 90, 9);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (38, 22, 6, 140, 1, 1, 1, 12043, 6137000, 7210000, 108150, '2023-07-01', '2023-11-18', 190, 157, 4);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (40, 40, 6, 180, 6, 1, 1, 7078, 14121000, 16550000, 248250, '2022-12-10', '2023-07-20', 171, 134, 1);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (42, 19, 3, 160, 5, 1, 0, 9054, 10132000, 10132000, NULL, '2023-07-20', '2023-09-23', 194, 120, NULL);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (43, 74, 2, 58, 6, 0, 0, 5092, 5344000, 6262000, 93930, '2022-12-10', '2023-11-23', 66, 2, 9);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (44, 1, 1, 40, 5, 0, 0, 4065, 2619000, 3068500, 46028, '2023-01-10', '2023-04-03', 164, 130, 4);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (45, 55, 5, 77, 6, 0, 0, 8055, 5024000, 5024000, 75360, '2023-06-04', '2023-08-20', 29, 127, 3);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (46, 70, 5, 81, 3, 1, 0, 5084, 6820000, 8005000, 120075, '2023-02-16', '2023-03-03', 60, 159, 2);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (48, 69, 5, 136, 1, 0, 1, 11061, 9853500, 9853500, 147803, '2023-07-28', '2023-08-15', 181, 137, 4);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (49, 75, 4, 90, 6, 1, 1, 9138, 14590000, 12453000, 186795, '2023-07-20', '2023-08-13', 112, 94, 9);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (50, 50, 2, 80, 4, 0, 0, 9072, 5784000, 6776500, 101648, '2023-01-24', '2023-03-03', 29, 10, 1);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (51, 41, 6, 158, 1, 0, 1, 10084, 15736500, 15736500, 236048, '2023-01-25', '2023-11-05', 162, 106, 5);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (52, 27, 4, 171, 5, 0, 0, 8040, 6934000, 8130500, 162610, '2023-03-16', '2023-04-03', 129, 156, 5);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (53, 71, 3, 175, 3, 0, 0, 6076, 13319000, 15595500, 233933, '2023-01-23', '2023-05-14', 180, 79, 9);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (54, 7, 3, 178, 5, 0, 1, 7060, 12603500, 12603500, 189053, '2023-03-27', '2023-06-25', 136, 139, 3);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (55, 99, 6, 124, 5, 0, 1, 9089, 11138000, 13061500, 195923, '2023-01-05', '2023-07-02', 113, 57, 8);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (56, 49, 6, 116, 3, 0, 1, 13011, 1537000, 1288000, 19320, '2022-12-15', '2023-11-08', 72, 5, 2);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (58, 2, 2, 51, 3, 1, 0, 2571, 3642000, 4271000, NULL, '2023-03-12', '2023-09-25', 50, 87, NULL);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (60, 76, 6, 113, 4, 1, 1, 8115, 15267000, 15267000, 229005, '2022-12-28', '2023-04-16', 151, 151, 7);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (61, 10, 6, 180, 3, 1, 0, 12044, 7989000, 9375500, 140633, '2023-08-20', '2023-09-04', 113, 95, 2);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (62, 28, 6, 140, 2, 0, 0, 8093, 13092000, 15347000, NULL, '2023-01-18', '2023-04-05', 68, 122, NULL);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (63, 43, 1, 52, 1, 0, 1, 5059, 3649000, 3649000, 54735, '2023-05-26', '2023-08-10', 163, 14, 10);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (65, 85, 6, 97, 2, 1, 0, 6050, 4924000, 5791500, 115830, '2023-06-20', '2023-09-30', 3, 44, 8);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (66, 50, 1, 40, 1, 1, 0, 5179, 8406500, 8406500, 126098, '2023-01-19', '2023-07-31', 118, 140, 6);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (67, 87, 3, 78, 5, 0, 0, 8026, 2045000, 2407000, 36105, '2022-12-26', '2023-09-12', 93, 140, 7);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (68, 57, 2, 80, 6, 0, 1, 3056, 4517000, 5294000, NULL, '2023-09-22', '2023-11-06', 3, 139, NULL);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (69, 100, 1, 36, 3, 0, 1, 8270, 11398000, 11398000, NULL, '2023-07-28', '2023-07-28', 10, 103, NULL);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (70, 97, 2, 80, 5, 0, 1, 4176, 16560000, 14146000, NULL, '2023-05-08', '2023-10-05', 140, 107, NULL);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (72, 77, 1, 57, 1, 1, 0, 1248, 16578500, 16578500, 248678, '2023-05-11', '2023-07-31', 112, 40, 5);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (74, 81, 5, 150, 1, 0, 0, 10089, 13427000, 15733500, 236003, '2023-07-01', '2023-11-09', 191, 160, 1);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (76, 15, 6, 101, 6, 0, 0, 5023, 2416000, 2857000, 42855, '2023-01-29', '2023-09-21', 76, 158, 8);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (78, 16, 4, 112, 4, 1, 0, 9016, 2118000, 2118000, 42360, '2023-07-27', '2023-11-18', 35, 94, 2);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (80, 88, 3, 54, 2, 1, 0, 5093, 5043000, 5915500, 88733, '2023-06-16', '2023-10-27', 104, 9, 10);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (82, 3, 3, 120, 5, 0, 1, 5075, 9112000, 10674500, 160118, '2023-02-18', '2023-04-20', 162, 155, 3);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (83, 22, 6, 117, 1, 0, 0, 6060, 7034000, 8260000, 123900, '2023-04-14', '2023-09-21', 161, 100, 9);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (85, 8, 6, 180, 1, 1, 0, 9078, 14212000, 16656500, NULL, '2023-01-21', '2023-11-21', 25, 33, NULL);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (86, 70, 4, 114, 1, 1, 1, 10086, 9805000, 11491000, 172365, '2023-03-08', '2023-10-18', 75, 114, 2);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (88, 40, 1, 55, 3, 0, 1, 3146, 8059000, 9433000, 141495, '2023-09-24', '2023-10-27', 79, 107, 10);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (90, 26, 2, 63, 6, 1, 0, 6193, 14282500, 14282500, 214238, '2023-10-10', '2023-11-14', 12, 77, 8);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (91, 96, 2, 80, 6, 1, 1, 8061, 5810000, 4958000, NULL, '2022-12-30', '2023-06-21', 181, 86, NULL);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (92, 26, 3, 178, 2, 1, 0, 10029, 5219000, 6118500, 91778, '2023-03-17', '2023-10-04', 52, 143, 1);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (94, 33, 4, 120, 5, 1, 1, 10085, 10256000, 12018500, 180278, '2023-07-15', '2023-08-22', 169, 22, 2);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (95, 50, 3, 83, 1, 0, 1, 7150, 12455000, 14587000, 218805, '2023-01-08', '2023-02-20', 6, 58, 2);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (97, 60, 5, 143, 5, 0, 1, 9041, 5963000, 7000500, 105008, '2023-07-21', '2023-08-29', 22, 45, 7);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (98, 78, 5, 150, 5, 0, 1, 13074, 13092500, 11170000, 167550, '2023-02-26', '2023-11-27', 104, 123, 4);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (99, 32, 6, 168, 2, 1, 0, 7035, 7036000, 7036000, 105540, '2023-02-27', '2023-07-15', 10, 150, 9);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (100, 11, 3, 56, 4, 0, 1, 7069, 3871000, 4544000, 68160, '2023-02-22', '2023-02-22', 95, 31, 6);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (102, 86, 3, 109, 4, 1, 0, 7031, 3980000, 3980000, 59700, '2023-06-12', '2023-08-27', 12, 8, 1);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (103, 57, 2, 120, 2, 1, 0, 5060, 7219000, 8454000, 126810, '2023-02-15', '2023-03-06', 183, 145, 3);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (104, 62, 3, 99, 6, 1, 0, 8117, 11608000, 13595500, 271910, '2023-01-19', '2023-08-25', 58, 104, 7);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (105, 29, 6, 180, 4, 1, 1, 5030, 6370000, 6370000, 95550, '2022-12-07', '2023-02-10', 172, 73, 1);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (107, 34, 6, 168, 6, 0, 0, 10071, 12085000, 14168500, 212528, '2023-01-23', '2023-04-23', 46, 25, 5);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (109, 65, 2, 80, 2, 1, 0, 5100, 8078000, 9460500, 141908, '2022-12-06', '2023-02-10', 194, 119, 5);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (110, 29, 2, 80, 2, 0, 1, 3037, 2989000, 3506000, 52590, '2023-07-11', '2023-11-27', 154, 89, 4);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (111, 80, 4, 114, 4, 1, 0, 4121, 16219000, 16219000, 243285, '2023-02-18', '2023-08-18', 135, 2, 5);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (113, 42, 4, 124, 3, 0, 0, 12075, 9331000, 10936000, 164040, '2022-12-25', '2023-01-27', 54, 81, 10);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (114, 92, 4, 173, 1, 1, 1, 10036, 7496500, 7496500, 112448, '2023-07-18', '2023-07-19', 95, 22, 5);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (115, 62, 3, 151, 2, 1, 1, 9067, 10199000, 11945500, 179183, '2022-12-23', '2023-06-28', 145, 154, 10);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (116, 7, 6, 90, 5, 0, 1, 9056, 5091000, 5987000, 89805, '2022-12-10', '2023-02-20', 135, 5, 3);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (117, 81, 6, 144, 1, 1, 1, 7071, 12156500, 12156500, 243130, '2023-02-14', '2023-03-13', 99, 125, 1);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (118, 13, 1, 50, 1, 1, 1, 1299, 14977000, 17527500, 262913, '2022-12-15', '2022-12-16', 21, 97, 7);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (120, 85, 2, 142, 6, 0, 0, 8015, 2635500, 2635500, 39533, '2022-12-15', '2023-08-27', 56, 120, 8);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (121, 42, 2, 115, 4, 1, 1, 7063, 7344000, 8600500, 129008, '2022-12-03', '2023-08-13', 71, 133, 6);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (122, 12, 5, 137, 4, 1, 0, 13088, 12160000, 14251500, 213773, '2023-04-22', '2023-10-19', 131, 138, 1);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (123, 85, 1, 38, 3, 1, 0, 6192, 8541000, 8541000, 128115, '2023-06-27', '2023-09-03', 31, 1, 10);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (124, 31, 6, 162, 4, 0, 0, 11069, 11303000, 13253500, 198803, '2023-03-08', '2023-10-18', 1, 100, 4);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (125, 68, 2, 103, 6, 0, 1, 4128, 13206000, 15459500, 231893, '2023-04-07', '2023-09-18', 2, 90, 10);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (126, 92, 3, 95, 2, 0, 1, 9073, 8214500, 8214500, 123218, '2023-02-04', '2023-08-20', 145, 160, 6);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (128, 17, 5, 130, 5, 1, 1, 10059, 7763000, 9107000, 136605, '2023-03-24', '2023-09-09', 92, 30, 7);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (130, 43, 5, 150, 4, 0, 1, 7062, 9388000, 11007500, 220150, '2022-12-28', '2022-12-31', 83, 159, 10);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (131, 54, 1, 49, 5, 0, 1, 4228, 11183000, 13088500, 196328, '2023-04-15', '2023-11-28', 77, 17, 5);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (132, 78, 1, 29, 4, 0, 1, 7359, 12195000, 12195000, 182925, '2022-12-04', '2023-10-29', 130, 88, 1);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (134, 42, 5, 150, 2, 1, 1, 10026, 3973000, 4672000, 70080, '2023-02-14', '2023-02-15', 194, 151, 6);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (135, 73, 5, 150, 4, 0, 1, 3037, 6615500, 6615500, 99233, '2022-12-16', '2023-01-08', 134, 152, 5);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (137, 31, 1, 65, 1, 0, 1, 3086, 5643000, 6606000, 99090, '2023-05-29', '2023-10-22', 105, 91, 2);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (138, 29, 6, 180, 3, 0, 1, 6054, 11546000, 11546000, 173190, '2023-03-30', '2023-11-14', 16, 63, 2);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (139, 83, 6, 173, 3, 1, 1, 7064, 11235000, 13173500, 197603, '2022-12-02', '2023-08-05', 151, 6, 10);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (140, 79, 1, 40, 1, 1, 1, 4276, 12954000, 11068000, 166020, '2023-01-30', '2023-03-06', 75, 22, 5);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (141, 32, 3, 114, 4, 0, 0, 6038, 5120500, 5120500, 76808, '2023-02-01', '2023-07-22', 130, 17, 1);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (142, 1, 3, 101, 4, 0, 0, 3077, 7815000, 9157500, 137363, '2023-07-28', '2023-10-01', 7, 38, 6);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (143, 1, 6, 180, 5, 1, 0, 3050, 9052000, 10619500, 265488, '2023-02-13', '2023-04-19', 114, 32, 10);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (144, 21, 5, 165, 2, 0, 0, 8085, 16528500, 16528500, 247928, '2022-12-18', '2023-02-04', 93, 32, 10);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (145, 44, 6, 180, 1, 1, 0, 9034, 6124000, 7193500, 107903, '2023-07-27', '2023-11-25', 56, 27, 3);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (146, 66, 1, 69, 2, 0, 1, 8214, 14774000, 17289500, 259343, '2023-05-04', '2023-06-17', 165, 101, 8);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (149, 5, 1, 39, 1, 0, 1, 8027, 1089000, 1278500, 19178, '2023-04-10', '2023-09-10', 179, 39, 8);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (150, 36, 3, 128, 4, 1, 0, 5009, 1445500, 1445500, 21683, '2022-12-29', '2023-07-11', 31, 3, 8);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (151, 29, 3, 154, 5, 0, 1, 8093, 14456000, 16926000, 253890, '2023-06-17', '2023-08-10', 38, 30, 4);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (152, 72, 6, 174, 4, 1, 0, 8025, 4362000, 5132000, 76980, '2023-04-13', '2023-10-04', 67, 46, 8);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (153, 48, 4, 154, 1, 0, 1, 8014, 2580500, 2580500, 38708, '2022-12-24', '2023-08-15', 113, 36, 4);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (154, 70, 6, 136, 3, 0, 1, 8106, 16953500, 14465000, 216975, '2023-01-06', '2023-09-01', 98, 152, 1);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (156, 88, 2, 117, 5, 1, 0, 5017, 2338500, 2338500, NULL, '2022-12-23', '2023-09-07', 145, 40, NULL);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (158, 88, 6, 116, 2, 0, 0, 13075, 8735000, 10250000, 153750, '2023-03-12', '2023-11-15', 70, 153, 10);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (159, 100, 2, 122, 3, 1, 0, 4018, 2583000, 2583000, NULL, '2022-12-04', '2023-04-08', 175, 20, NULL);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (160, 54, 1, 42, 2, 1, 0, 6197, 8310000, 9727000, 145905, '2023-03-10', '2023-11-10', 189, 84, 7);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (161, 44, 2, 76, 3, 0, 1, 4085, 7587000, 6477000, NULL, '2023-01-29', '2023-09-29', 126, 78, NULL);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (1, 75, 6, 137, 5, 1, 1, 3090, 12420000, 14561000, 218415, '2023-01-25', '2023-07-19', 107, 5, 2);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (2, 72, 5, 113, 2, 1, 1, 9044, 5058000, 5942500, 89138, '2023-06-20', '2023-06-23', 129, 27, 5);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (4, 24, 1, 40, 1, 1, 1, 6033, 1332000, 1563000, 23445, '2023-02-08', '2023-10-23', 21, 150, 6);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (5, 45, 4, 137, 1, 1, 1, 8097, 13380000, 15673000, NULL, '2023-03-25', '2023-06-21', 180, 69, NULL);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (6, 76, 4, 124, 1, 1, 1, 8029, 4267000, 4267000, NULL, '2023-05-08', '2023-06-13', 91, 30, NULL);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (8, 32, 5, 150, 6, 1, 0, 3029, 4487000, 5273500, 79103, '2023-02-23', '2023-07-11', 90, 130, 6);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (9, 39, 4, 142, 5, 0, 1, 7021, 3533000, 3533000, 52995, '2023-01-29', '2023-08-08', 99, 145, 5);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (10, 40, 5, 126, 5, 0, 0, 10114, 14462000, 16945000, 254175, '2023-05-21', '2023-08-21', 92, 82, 2);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (11, 15, 4, 125, 1, 1, 0, 6019, 2454000, 2890000, 43350, '2023-02-28', '2023-12-01', 192, 5, 8);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (15, 14, 3, 134, 3, 0, 1, 4014, 2360000, 2360000, 35400, '2023-04-07', '2023-06-17', 121, 58, 8);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (16, 70, 3, 116, 2, 1, 1, 6074, 8648000, 10132000, 151980, '2023-04-11', '2023-07-08', 157, 51, 10);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (18, 47, 6, 106, 3, 1, 0, 11073, 9204500, 9204500, 138068, '2023-03-04', '2023-10-02', 98, 39, 4);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (19, 50, 5, 109, 1, 0, 1, 4137, 14948000, 17514000, 262710, '2023-02-25', '2023-07-30', 159, 15, 3);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (21, 90, 4, 71, 4, 0, 0, 4147, 12234000, 12234000, 183510, '2022-12-26', '2023-04-19', 71, 9, 8);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (22, 76, 2, 83, 6, 0, 0, 7101, 8438000, 9881500, 148223, '2023-07-21', '2023-08-19', 163, 85, 1);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (23, 70, 4, 133, 5, 0, 1, 9066, 8858000, 10382500, 155738, '2023-05-19', '2023-11-08', 20, 135, 10);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (25, 73, 1, 65, 4, 1, 0, 3039, 2560000, 2999000, 44985, '2023-07-04', '2023-11-19', 1, 26, 9);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (26, 23, 5, 148, 1, 0, 1, 7050, 7405000, 8687500, 173750, '2023-08-07', '2023-09-11', 21, 120, 2);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (3, 72, 3, 126, 2, 0, 0, 7075, 11194000, NULL, NULL, '2023-09-24', NULL, 79, NULL, 1);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (7, 61, 5, 150, 6, 0, 1, 4059, 10465000, NULL, NULL, '2023-06-25', NULL, 101, NULL, 6);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (12, 62, 1, 44, 1, 1, 0, 2019, 986000, NULL, NULL, '2023-01-25', NULL, 188, NULL, NULL);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (13, 19, 2, 89, 2, 0, 0, 7137, 12273000, NULL, NULL, '2023-01-04', NULL, 99, NULL, 4);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (14, 96, 4, 107, 2, 1, 1, 11122, 15333500, NULL, NULL, '2023-04-05', NULL, 9, NULL, 1);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (17, 16, 6, 112, 5, 1, 0, 6056, 6330000, NULL, NULL, '2023-06-04', NULL, 192, NULL, 2);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (20, 25, 6, 180, 2, 0, 1, 6067, 12090000, NULL, NULL, '2023-02-14', NULL, 80, NULL, 2);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (24, 73, 1, 64, 4, 0, 0, 2036, 2734500, NULL, NULL, '2023-09-27', NULL, 144, NULL, NULL);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (27, 39, 2, 144, 4, 1, 1, 10079, 13434500, NULL, NULL, '2023-06-07', NULL, 178, NULL, 6);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (28, 51, 2, 118, 4, 0, 0, 3031, 4366500, NULL, NULL, '2023-11-22', NULL, 55, NULL, 4);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (30, 6, 6, 149, 4, 1, 0, 8034, 6028000, NULL, NULL, '2023-03-05', NULL, 77, NULL, 8);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (32, 51, 6, 117, 6, 1, 1, 10031, 3651000, NULL, NULL, '2023-03-02', NULL, 40, NULL, 2);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (36, 24, 4, 179, 2, 1, 1, 4012, 2684000, NULL, NULL, '2023-09-08', NULL, 190, NULL, NULL);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (39, 66, 4, 134, 1, 0, 0, 9084, 13197500, NULL, NULL, '2023-02-28', NULL, 174, NULL, 3);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (41, 96, 4, 112, 4, 0, 0, 11099, 11144000, NULL, NULL, '2023-05-31', NULL, 20, NULL, 4);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (47, 28, 5, 165, 6, 1, 1, 3042, 6953000, NULL, NULL, '2023-07-24', NULL, 78, NULL, 6);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (57, 13, 3, 146, 5, 0, 0, 3062, 10678500, NULL, NULL, '2023-10-31', NULL, 1, NULL, 1);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (59, 1, 5, 120, 5, 0, 0, 13075, 9023000, NULL, NULL, '2023-07-22', NULL, 59, NULL, 5);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (64, 63, 1, 74, 5, 0, 0, 2022, 1646000, NULL, NULL, '2023-08-06', NULL, 116, NULL, 8);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (71, 12, 2, 80, 3, 0, 1, 8124, 9938000, NULL, NULL, '2023-06-18', NULL, 10, NULL, 3);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (183, 17, 2, 79, 4, 0, 0, 10176, 16283500, NULL, NULL, '2023-09-09', NULL, 81, NULL, 8);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (73, 49, 1, 40, 3, 1, 1, 2099, 3980000, NULL, NULL, '2023-03-05', NULL, 95, NULL, 8);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (75, 30, 6, 180, 5, 0, 0, 8010, 2298500, NULL, NULL, '2023-09-25', NULL, 122, NULL, NULL);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (77, 70, 5, 90, 3, 0, 0, 6037, 3923500, NULL, NULL, '2023-08-30', NULL, 70, NULL, NULL);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (79, 96, 1, 38, 2, 0, 1, 5178, 6768000, NULL, NULL, '2023-06-07', NULL, 114, NULL, 5);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (81, 92, 2, 80, 6, 1, 1, 9019, 1870500, NULL, NULL, '2023-07-01', NULL, 108, NULL, 9);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (84, 3, 2, 93, 2, 1, 1, 6083, 9127500, NULL, NULL, '2023-04-10', NULL, 129, NULL, 9);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (87, 15, 3, 119, 2, 1, 0, 8117, 16394500, NULL, NULL, '2023-02-20', NULL, 96, NULL, NULL);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (89, 63, 1, 40, 3, 0, 1, 7056, 2270000, NULL, NULL, '2023-10-30', NULL, 145, NULL, 9);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (93, 97, 2, 93, 4, 1, 1, 9086, 9416500, NULL, NULL, '2023-12-08', NULL, 90, NULL, 1);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (96, 93, 1, 70, 6, 0, 0, 3114, 9401000, NULL, NULL, '2022-12-16', NULL, 113, NULL, NULL);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (101, 76, 3, 128, 5, 0, 1, 8101, 12947000, NULL, NULL, '2023-02-20', NULL, 134, NULL, 1);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (106, 64, 5, 83, 6, 0, 0, 11136, 11330000, NULL, NULL, '2023-06-04', NULL, 23, NULL, 10);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (108, 30, 2, 52, 3, 1, 0, 5187, 11397500, NULL, NULL, '2023-02-11', NULL, 67, NULL, 4);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (112, 75, 1, 42, 5, 0, 1, 6351, 17265500, NULL, NULL, '2023-03-23', NULL, 93, NULL, 9);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (119, 72, 1, 44, 2, 1, 1, 3330, 17005500, NULL, NULL, '2023-09-04', NULL, 89, NULL, 8);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (127, 33, 2, 72, 4, 1, 1, 4097, 7016000, NULL, NULL, '2023-05-13', NULL, 137, NULL, 2);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (129, 60, 4, 91, 3, 0, 1, 10023, 2544500, NULL, NULL, '2022-12-20', NULL, 85, NULL, 1);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (133, 40, 5, 100, 2, 0, 1, 4092, 10861500, NULL, NULL, '2023-10-02', NULL, 43, NULL, 5);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (136, 58, 3, 70, 3, 1, 1, 8026, 1889000, NULL, NULL, '2023-01-18', NULL, 104, NULL, 3);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (147, 39, 2, 80, 5, 0, 0, 10012, 1220000, NULL, NULL, '2023-03-05', NULL, 26, NULL, 3);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (148, 79, 3, 83, 1, 1, 0, 5100, 8359000, NULL, NULL, '2023-06-27', NULL, 159, NULL, 7);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (155, 6, 4, 122, 4, 1, 0, 13046, 5705000, NULL, NULL, '2023-10-18', NULL, 4, NULL, 9);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (157, 54, 4, 120, 5, 1, 0, 10122, 14657000, NULL, NULL, '2023-08-05', NULL, 72, NULL, 2);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (164, 77, 5, 76, 6, 1, 1, 3033, 2569000, NULL, NULL, '2023-04-09', NULL, 158, NULL, 7);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (165, 42, 6, 180, 5, 1, 1, 9056, 12023500, NULL, NULL, '2022-12-08', NULL, 184, NULL, 9);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (166, 20, 5, 132, 3, 1, 0, 12080, 10574000, NULL, NULL, '2023-09-02', NULL, 97, NULL, 5);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (169, 38, 5, 86, 3, 0, 0, 11053, 4601000, NULL, NULL, '2023-04-12', NULL, 63, NULL, 3);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (170, 38, 3, 146, 2, 1, 0, 6040, 5934000, NULL, NULL, '2023-01-13', NULL, 5, NULL, 9);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (177, 9, 3, 141, 3, 1, 1, 6051, 8459000, NULL, NULL, '2023-10-22', NULL, 91, NULL, 7);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (180, 82, 4, 139, 2, 0, 0, 3018, 3038500, NULL, NULL, '2023-05-03', NULL, 26, NULL, 6);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (181, 27, 3, 88, 4, 1, 0, 11135, 11917000, NULL, NULL, '2022-12-09', NULL, 25, NULL, 7);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (191, 70, 4, 73, 6, 1, 0, 3054, 3978000, NULL, NULL, '2023-01-04', NULL, 50, NULL, NULL);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (193, 86, 6, 138, 3, 1, 1, 9101, 13988000, NULL, NULL, '2023-03-22', NULL, 73, NULL, NULL);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (194, 69, 2, 115, 1, 0, 0, 5063, 7299000, NULL, NULL, '2023-07-28', NULL, 144, NULL, 5);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (195, 83, 6, 115, 3, 0, 1, 10098, 13275500, NULL, NULL, '2023-09-19', NULL, 69, NULL, 5);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (162, 6, 3, 119, 1, 1, 0, 8079, 11037500, 11037500, 165563, '2022-12-29', '2023-01-23', 128, 149, 8);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (163, 65, 2, 80, 1, 0, 1, 6078, 6310000, 7391500, NULL, '2023-01-17', '2023-10-10', 129, 29, NULL);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (167, 10, 3, 127, 2, 0, 1, 3020, 2617000, 3075000, NULL, '2023-02-11', '2023-07-29', 109, 36, NULL);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (168, 34, 2, 132, 4, 0, 1, 5015, 2386500, 2386500, 35798, '2023-07-03', '2023-10-23', 90, 87, 9);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (171, 55, 3, 121, 3, 1, 0, 8065, 9305500, 9305500, NULL, '2023-06-17', '2023-09-14', 160, 110, NULL);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (172, 52, 6, 165, 3, 1, 0, 5027, 4619000, 5433000, 81495, '2022-12-22', '2023-08-19', 11, 116, 5);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (173, 81, 1, 38, 6, 1, 0, 9278, 10570000, 12371500, 185573, '2023-09-03', '2023-09-06', 45, 62, 9);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (174, 96, 2, 80, 4, 1, 0, 4069, 6514000, 6514000, 97710, '2023-02-06', '2023-03-21', 74, 152, 3);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (175, 69, 1, 29, 2, 1, 0, 7279, 9472500, 8092000, 121380, '2023-04-23', '2023-09-17', 163, 148, 4);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (176, 17, 6, 113, 1, 1, 1, 11050, 5699000, 6698000, 100470, '2023-01-23', '2023-04-11', 7, 69, 9);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (178, 82, 4, 139, 1, 0, 0, 10033, 4638000, 5445000, 81675, '2022-12-08', '2023-05-24', 173, 91, 7);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (179, 21, 4, 92, 2, 1, 1, 4146, 13515000, 15832000, NULL, '2022-12-30', '2023-11-09', 143, 48, NULL);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (182, 71, 3, 107, 4, 0, 0, 8080, 10099000, 8620000, 172400, '2023-05-12', '2023-07-16', 16, 74, 5);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (184, 97, 6, 178, 5, 1, 1, 6007, 1261000, 1504000, 22560, '2023-09-30', '2023-09-30', 138, 92, 4);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (185, 18, 6, 180, 3, 1, 0, 7066, 11910000, 13963000, 209445, '2023-02-10', '2023-04-19', 114, 119, 8);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (186, 61, 3, 171, 3, 0, 1, 4066, 13332500, 13332500, 199988, '2023-04-25', '2023-09-30', 175, 2, 2);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (187, 73, 4, 167, 4, 1, 1, 10037, 6336000, 7431000, 111465, '2023-03-30', '2023-05-16', 78, 2, 8);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (188, 47, 3, 114, 5, 0, 1, 8058, 6637000, 7779000, 116685, '2023-03-11', '2023-07-03', 59, 114, 7);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (189, 4, 5, 171, 5, 1, 1, 8049, 9884000, 9884000, 148260, '2023-03-02', '2023-08-30', 18, 48, 7);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (190, 88, 1, 45, 3, 0, 0, 7306, 13798000, 16148000, 242220, '2022-12-16', '2023-09-22', 142, 22, 10);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (192, 78, 5, 84, 4, 0, 0, 12097, 9614500, 9614500, 144218, '2023-07-26', '2023-10-26', 51, 121, 10);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (196, 83, 5, 150, 3, 0, 1, 12045, 8049000, 6859000, 102885, '2023-02-18', '2023-03-05', 30, 3, 3);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (197, 43, 5, 150, 6, 1, 1, 7013, 2048000, 2420000, 36300, '2022-12-11', '2023-06-27', 82, 102, 1);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (198, 47, 5, 143, 3, 1, 0, 13059, 9944500, 9944500, 149168, '2023-04-10', '2023-11-28', 153, 58, 8);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (199, 99, 2, 141, 5, 1, 0, 6004, 680000, 803000, 12045, '2023-03-01', '2023-05-24', 140, 106, 2);
INSERT INTO homenet.objekt (id, adress, antal_rum, storlek, vaning, hiss, balkong, manadsavgift, utgangspris, forsaljningspris, maklararvode, saljstart, avslutat, saljare, kopare, maklare) VALUES (200, 72, 2, 80, 5, 1, 1, 8098, 7858000, 9203000, 138045, '2023-05-03', '2023-06-03', 109, 63, 10);


--
-- Data for Name: personer; Type: TABLE DATA; Schema: homenet; Owner: postgres
--

INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (1, 'mwudeland0@drupal.org', 'Danièle', 'Wudeland', '1997-12-19', '3114705221', 102);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (2, 'jprayer1@wordpress.org', 'Zoé', 'Prayer', '1958-02-26', '6162426013', 104);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (3, 'hdimmick2@epa.gov', 'Thérèse', 'Dimmick', '1988-07-25', '5095529405', 106);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (4, 'scuddehay3@delicious.com', 'Noémie', 'Cuddehay', '1962-08-23', '3451506020', 108);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (5, 'ycheley4@shop-pro.jp', 'André', 'Cheley', '1976-12-26', '6175439945', 110);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (6, 'nrobbs5@discuz.net', 'Mén', 'Robbs', '1981-09-02', '4494894376', 112);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (7, 'lrebichon6@dagondesign.com', 'Lyséa', 'Rebichon', '1959-11-14', '4066031919', 114);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (8, 'hbastin7@sitemeter.com', 'Eléonore', 'Bastin', '1994-12-10', '5618415738', 116);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (9, 'ttenniswood8@umn.edu', 'Léonore', 'Tenniswood', '1968-09-10', '5243553865', 118);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (10, 'smonahan9@webnode.com', 'Lén', 'Monahan', '1961-07-11', '7885835122', 120);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (11, 'rbeardsa@istockphoto.com', 'Andréa', 'Beards', '1986-12-16', '8804067399', 122);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (12, 'acoodeb@businessweek.com', 'Maïlis', 'Coode', '1953-06-28', '7044216588', 124);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (13, 'mmcewenc@addthis.com', 'Intéressant', 'McEwen', '1981-11-17', '9827984352', 126);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (14, 'cmccrained@pbs.org', 'Athéna', 'McCraine', '1971-01-22', '1277117376', 128);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (15, 'mhadnye@amazon.com', 'Françoise', 'Hadny', '1980-05-06', '5022107931', 130);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (16, 'crummingsf@discuz.net', 'Yóu', 'Rummings', '1997-05-11', '8712897712', 132);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (17, 'jmacgebenayg@nyu.edu', 'Tán', 'MacGebenay', '1978-02-28', '4165224746', 134);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (18, 'kroggemanh@jigsy.com', 'Esbjörn', 'Roggeman', '1954-04-23', '8123485881', 136);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (19, 'mturveyi@trellian.com', 'Mårten', 'Turvey', '1960-12-15', '5172726823', 138);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (20, 'kkortj@ted.com', 'Léonie', 'Kort', '1976-03-10', '5851817117', 140);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (21, 'kmcquorkelk@squidoo.com', 'Maëlann', 'McQuorkel', '2002-02-07', '6847628378', 142);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (22, 'ebraganzal@xrea.com', 'Styrbjörn', 'Braganza', '1972-09-22', '5127265754', 144);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (23, 'oapplebeem@goo.ne.jp', 'Marylène', 'Applebee', '1989-09-30', '8577668219', 146);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (24, 'dgreggsn@goodreads.com', 'Cunégonde', 'Greggs', '1974-02-17', '1024427271', 148);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (25, 'agundersono@typepad.com', 'Félicie', 'Gunderson', '1977-04-07', '7488215719', 150);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (26, 'dcarbinep@go.com', 'Håkan', 'Carbine', '1977-06-03', '9891715383', 152);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (27, 'lwatsonbrownq@springer.com', 'Crééz', 'Watson-Brown', '1962-04-17', '7605514989', 154);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (28, 'ahuffar@ed.gov', 'Måns', 'Huffa', '1966-10-20', '8806171335', 156);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (29, 'gcromwells@cocolog-nifty.com', 'Esbjörn', 'Cromwell', '1999-08-07', '7828698968', 158);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (30, 'comonahant@loc.gov', 'Kallisté', 'O''Monahan', '1976-10-03', '8559227347', 160);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (31, 'mgummu@dailymail.co.uk', 'Edmée', 'Gumm', '1967-10-23', '4629525924', 162);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (32, 'vlowthianv@washington.edu', 'Océanne', 'Lowthian', '1997-11-29', '7619832072', 164);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (33, 'smcnyschew@over-blog.com', 'Geneviève', 'McNysche', '1972-01-26', '5542767046', 166);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (34, 'maldredx@drupal.org', 'Félicie', 'Aldred', '1961-07-21', '8391125722', 168);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (35, 'pshallcrassy@jugem.jp', 'Océanne', 'Shallcrass', '1977-12-18', '7547004892', 170);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (36, 'jdaskiewiczz@quantcast.com', 'Ophélie', 'Daskiewicz', '1987-01-07', '3076149355', 172);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (37, 'mmacsherry10@thetimes.co.uk', 'Hélène', 'MacSherry', '1996-05-17', '2644020926', 174);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (38, 'canderl11@merriam-webster.com', 'Bénédicte', 'Anderl', '1987-06-08', '3168342947', 176);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (39, 'amungin12@over-blog.com', 'Lorène', 'Mungin', '1960-04-18', '9799033641', 178);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (40, 'efaughny13@boston.com', 'Eléonore', 'Faughny', '1977-06-27', '5114494227', 180);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (41, 'bcreak14@mashable.com', 'Naëlle', 'Creak', '1993-07-01', '6457200546', 182);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (42, 'dgrosier15@wikia.com', 'Daphnée', 'Grosier', '1983-06-09', '6717371466', 184);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (43, 'jheinemann16@alexa.com', 'Océanne', 'Heinemann', '1957-03-20', '8263617054', 186);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (44, 'mcollister17@mtv.com', 'Nuó', 'Collister', '1985-04-20', '3801225383', 188);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (45, 'mbrewis18@nbcnews.com', 'Uò', 'Brewis', '1989-01-13', '6345845849', 190);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (46, 'kkeeling19@eventbrite.com', 'Naëlle', 'Keeling', '1970-12-08', '3334155654', 192);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (47, 'jwoodcroft1a@fda.gov', 'Loïs', 'Woodcroft', '1950-10-01', '1381833600', 194);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (48, 'kalderwick1b@npr.org', 'Judicaël', 'Alderwick', '1983-03-09', '2921729995', 9);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (49, 'sarguile1c@tiny.cc', 'Méghane', 'Arguile', '1961-05-09', '4462138229', 198);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (50, 'bbaker1d@hp.com', 'Sélène', 'Baker', '1951-08-16', '4018322919', 100);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (51, 'ssandal1e@drupal.org', 'Zhì', 'Sandal', '1975-08-25', '3452752508', 102);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (52, 'rbeton1f@sakura.ne.jp', 'Ruò', 'Beton', '1998-09-12', '9276694589', 104);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (53, 'rleebeter1g@shop-pro.jp', 'Jú', 'Leebeter', '1992-09-28', '5285090019', 106);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (54, 'rbrownsall1h@weebly.com', 'Gaïa', 'Brownsall', '1956-12-25', '3846767970', 69);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (55, 'gvasilik1i@wikipedia.org', 'Marie-hélène', 'Vasilik', '1988-12-01', '3675772888', 110);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (56, 'dthain1j@csmonitor.com', 'Styrbjörn', 'Thain', '1953-07-12', '5077143792', 112);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (57, 'chartil1k@apple.com', 'Noëlla', 'Hartil', '2000-10-23', '2898114960', 114);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (58, 'btrinke1l@tinypic.com', 'Méthode', 'Trinke', '1967-06-19', '1216044154', 116);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (59, 'mzywicki1m@addtoany.com', 'Lyséa', 'Zywicki', '1954-02-21', '4864618679', 118);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (60, 'cnapton1n@mayoclinic.com', 'Ophélie', 'Napton', '1956-07-21', '1216605614', 84);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (61, 'bkeble1o@wikispaces.com', 'Mégane', 'Keble', '1955-05-02', '1566494634', 122);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (62, 'jdeighan1p@webeden.co.uk', 'Liè', 'Deighan', '1993-08-31', '5094574969', 124);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (63, 'spallis1q@opensource.org', 'Gisèle', 'Pallis', '1986-01-27', '9477702761', 126);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (64, 'jkorneichuk1r@discuz.net', 'Yè', 'Korneichuk', '1993-12-02', '4311166825', 128);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (65, 'dcoleiro1s@blogs.com', 'Thérèsa', 'Coleiro', '1973-05-16', '2536996634', 130);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (66, 'wdreamer1t@abc.net.au', 'Lauréna', 'Dreamer', '1996-09-19', '8914712559', 132);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (67, 'eccomini1u@hc360.com', 'Agnès', 'Ccomini', '1984-01-01', '7888188103', 134);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (68, 'sivins1v@unesco.org', 'Léana', 'Ivins', '1950-03-29', '2936826237', 136);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (69, 'chembery1w@xinhuanet.com', 'Josée', 'Hembery', '1975-11-02', '2077361522', 138);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (70, 'ebatterbee1x@latimes.com', 'Hélène', 'Batterbee', '1955-11-17', '8932501913', 140);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (71, 'eflemmich1y@boston.com', 'Gwenaëlle', 'Flemmich', '1973-09-12', '2487989132', 142);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (72, 'kdenerley1z@microsoft.com', 'Yú', 'Denerley', '1985-11-27', '3923115732', 144);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (73, 'omohammed20@netscape.com', 'Léone', 'Mohammed', '1982-06-26', '5226982867', 146);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (74, 'bchurch21@joomla.org', 'Aloïs', 'Church', '1974-09-08', '5696576897', 148);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (75, 'smacknish22@weebly.com', 'Dafnée', 'Macknish', '1996-09-04', '9402787276', 150);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (76, 'pragg23@yahoo.co.jp', 'Naéva', 'Ragg', '1974-04-06', '4244025358', 152);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (77, 'kpeddel24@imageshack.us', 'Néhémie', 'Peddel', '1981-03-14', '1938081425', 154);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (78, 'csommerland25@fotki.com', 'Östen', 'Sommerland', '1952-03-17', '1892798297', 156);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (79, 'cplanks26@privacy.gov.au', 'Andrée', 'Planks', '1975-08-31', '8991471990', 158);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (80, 'lgwinnel27@forbes.com', 'Almérinda', 'Gwinnel', '1965-04-07', '8531338476', 160);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (81, 'ajouannisson28@jiathis.com', 'Marie-françoise', 'Jouannisson', '1967-12-17', '7341848820', 162);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (82, 'cfitchett29@mlb.com', 'Audréanne', 'Fitchett', '1956-05-03', '7081064055', 164);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (83, 'kmccreadie2a@prlog.org', 'Maïwenn', 'McCreadie', '1973-12-07', '1003522299', 166);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (84, 'tcorringham2b@last.fm', 'Marie-josée', 'Corringham', '1990-05-13', '5752736214', 168);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (85, 'rsimo2c@guardian.co.uk', 'Océane', 'Simo', '1965-09-13', '8076131600', 170);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (86, 'ddrewitt2d@goo.ne.jp', 'Zhì', 'Drewitt', '1957-11-17', '2705604822', 172);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (87, 'aomohun2e@dropbox.com', 'Vérane', 'O''Mohun', '1975-08-08', '1196961678', 55);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (88, 'mvautier2f@washington.edu', 'Léonie', 'Vautier', '1971-02-16', '1451696173', 176);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (89, 'mlievesley2g@dagondesign.com', 'Méthode', 'Lievesley', '1970-04-14', '9883825448', 178);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (90, 'zwyllt2h@discuz.net', 'Vénus', 'Wyllt', '1974-11-11', '4925380484', 180);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (91, 'echild2i@xing.com', 'Océane', 'Child', '1965-10-06', '5689697541', 182);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (92, 'hcordner2j@wired.com', 'Eliès', 'Cordner', '1969-04-09', '7639071218', 184);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (93, 'tgullan2k@mapquest.com', 'Daphnée', 'Gullan', '1975-12-12', '8847594677', 186);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (94, 'larnault2l@ihg.com', 'Gaétane', 'Arnault', '1952-03-11', '3888120287', 188);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (95, 'mmcilwraith2m@yahoo.com', 'Joséphine', 'McIlwraith', '1989-07-13', '5201237939', 190);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (96, 'gsunter2n@tamu.edu', 'Vénus', 'Sunter', '1970-11-23', '4812462210', 192);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (97, 'aolpin2o@free.fr', 'Esbjörn', 'Olpin', '1965-08-23', '7044663701', 194);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (98, 'porchard2p@cbslocal.com', 'Kù', 'Orchard', '1982-06-24', '5628349943', 196);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (99, 'mmatejic2q@mail.ru', 'Åsa', 'Matejic', '1996-12-25', '6797637342', 198);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (100, 'lhabbon2r@list-manage.com', 'Håkan', 'Habbon', '1981-05-02', '8822935581', 105);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (101, 'krouzet2s@techcrunch.com', 'Naëlle', 'Rouzet', '1992-08-01', '5736471737', 150);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (102, 'ctulloch2t@wiley.com', 'Clémentine', 'Tulloch', '1988-08-11', '9995888835', 151);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (103, 'klagneaux2u@free.fr', 'Estève', 'Lagneaux', '1952-05-06', '3988096871', 151);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (104, 'rdunthorn2v@alexa.com', 'Erwéi', 'Dunthorn', '1958-04-02', '8063500823', 152);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (105, 'pderham2w@nifty.com', 'Zoé', 'Derham', '1982-09-28', '7392069591', 152);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (106, 'bbicksteth2x@cyberchimps.com', 'Sòng', 'Bicksteth', '1970-10-30', '8187355151', 153);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (107, 'eosbaldstone2y@mlb.com', 'Marie-noël', 'Osbaldstone', '1976-05-11', '3178324649', 153);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (108, 'tshearn2z@printfriendly.com', 'Åke', 'Shearn', '1978-01-31', '7664048781', 154);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (109, 'jgregore30@goo.ne.jp', 'Geneviève', 'Gregore', '1953-02-23', '4618406556', 154);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (110, 'tturbard31@is.gd', 'Lauréna', 'Turbard', '1983-05-01', '3527835336', 155);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (111, 'bivashin32@wikipedia.org', 'Géraldine', 'Ivashin', '1961-04-16', '8744472192', 155);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (112, 'wscrannage33@marketwatch.com', 'Cléa', 'Scrannage', '1987-04-23', '2655498624', 156);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (113, 'khollyman34@cbslocal.com', 'Mélodie', 'Hollyman', '1996-10-13', '9724104871', 156);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (114, 'ccostain35@so-net.ne.jp', 'Lèi', 'Costain', '1973-08-22', '3418734531', 157);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (115, 'pgillow36@163.com', 'Pål', 'Gillow', '1966-08-29', '4138317909', 157);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (116, 'zleuchars37@blogspot.com', 'Eugénie', 'Leuchars', '1995-09-24', '3828924132', 158);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (117, 'cthirst38@hibu.com', 'Andréanne', 'Thirst', '1993-10-04', '3513734376', 158);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (118, 'bkaradzas39@gmpg.org', 'Yáo', 'Karadzas', '1976-02-07', '3084817856', 159);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (119, 'vhastwell3a@ow.ly', 'Maïlis', 'Hastwell', '1962-09-24', '7184325952', 159);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (120, 'rdinehart3b@taobao.com', 'Médiamass', 'Dine-Hart', '1959-10-24', '5448178935', 3);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (121, 'tclist3c@examiner.com', 'Judicaël', 'Clist', '1957-12-30', '4807990691', 160);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (122, 'wbasden3d@1und1.de', 'Gaëlle', 'Basden', '1975-12-30', '3283828526', 161);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (123, 'rmartino3e@mail.ru', 'Marie-françoise', 'Martino', '2001-03-13', '5204571803', 161);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (124, 'pmoro3f@meetup.com', 'Lorène', 'Moro', '1997-11-14', '1567005441', 9);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (125, 'hlebosse3g@nytimes.com', 'Sélène', 'Le Bosse', '1962-05-12', '7323922821', 162);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (126, 'cloosmore3h@ftc.gov', 'Lorène', 'Loosmore', '1995-06-10', '6352961826', 163);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (127, 'cbascombe3i@nyu.edu', 'Nadège', 'Bascombe', '1952-12-11', '5827736845', 163);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (128, 'hbater3j@pbs.org', 'Yénora', 'Bater', '1995-04-06', '7935939855', 164);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (129, 'scrossfield3k@360.cn', 'Naéva', 'Crossfield', '1983-12-29', '1588970367', 164);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (130, 'rgwatkins3l@163.com', 'Stéphanie', 'Gwatkins', '1987-04-19', '9734505823', 165);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (131, 'gmorecomb3m@epa.gov', 'Laurélie', 'Morecomb', '1961-08-16', '7883576460', 165);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (132, 'tgremain3n@blogtalkradio.com', 'Nadège', 'Gremain', '1968-10-26', '9139214331', 166);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (133, 'rseiler3o@princeton.edu', 'Edmée', 'Seiler', '1956-02-26', '9841481083', 166);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (134, 'bpallent3p@cbsnews.com', 'Andréanne', 'Pallent', '1989-07-28', '8676231368', 167);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (135, 'lstuddert3q@illinois.edu', 'Mélodie', 'Studdert', '1967-12-27', '3897652918', 167);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (136, 'vfidian3r@webs.com', 'Mà', 'Fidian', '1985-07-01', '7188476769', 168);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (137, 'bdorr3s@networksolutions.com', 'Mà', 'Dorr', '2001-05-15', '9051700085', 168);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (138, 'ethow3t@wordpress.org', 'Josée', 'Thow', '1984-12-07', '1015190569', 169);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (139, 'tposnette3u@dailymotion.com', 'Naéva', 'Posnette', '1988-10-02', '2593180720', 169);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (140, 'dsurplice3v@craigslist.org', 'Miléna', 'Surplice', '1955-05-30', '6049242147', 170);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (141, 'dmerigot3w@army.mil', 'Lài', 'Merigot', '1969-06-29', '4937160673', 170);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (142, 'pprest3x@jimdo.com', 'Andréanne', 'Prest', '1970-03-20', '1123839101', 171);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (143, 'thowey3y@hibu.com', 'Gérald', 'Howey', '1951-06-27', '4759389770', 171);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (144, 'oshurmore3z@samsung.com', 'Åslög', 'Shurmore', '1994-12-01', '4337344633', 172);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (145, 'gslainey40@forbes.com', 'Anaé', 'Slainey', '1976-02-10', '1381389136', 172);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (146, 'jdrysdale41@sohu.com', 'Gisèle', 'Drysdale', '1998-03-09', '7828194000', 173);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (147, 'ikobiela42@flavors.me', 'Mélys', 'Kobiela', '1986-12-31', '1108095238', 173);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (148, 'mcorpes43@icio.us', 'Lauréna', 'Corpes', '1964-08-23', '6121664102', 174);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (149, 'mcuvley44@cnn.com', 'Gaïa', 'Cuvley', '1998-06-06', '6596255319', 174);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (150, 'abartul45@deliciousdays.com', 'Salomé', 'Bartul', '1985-02-28', '3845344299', 175);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (151, 'nbarnet46@bloglines.com', 'Pénélope', 'Barnet', '1952-01-03', '3694885392', 93);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (152, 'mmair47@huffingtonpost.com', 'Märta', 'Mair', '1978-09-17', '5392579588', 176);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (153, 'qing48@hhs.gov', 'Marylène', 'Ing', '1995-11-22', '6534655577', 176);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (154, 'tphilp49@alibaba.com', 'Hélène', 'Philp', '1961-08-14', '6017464486', 177);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (155, 'vmccroft4a@livejournal.com', 'Annotés', 'McCroft', '1976-07-02', '6393280727', 177);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (156, 'mcollar4b@engadget.com', 'Ruò', 'Collar', '1996-11-17', '9657264789', 178);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (157, 'pstebbing4c@amazonaws.com', 'Maï', 'Stebbing', '1974-08-14', '3223484577', 178);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (158, 'lgorrie4d@answers.com', 'Edmée', 'Gorrie', '1997-01-05', '8098787998', 179);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (159, 'myeldon4e@utexas.edu', 'Loïc', 'Yeldon', '1952-10-31', '4351017157', 179);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (160, 'cschimann4f@wordpress.org', 'Cléa', 'Schimann', '1973-08-12', '2922796859', 180);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (161, 'sharder4g@edublogs.org', 'Cléa', 'Harder', '1973-12-19', '7847486437', 58);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (162, 'lwickins4h@vkontakte.ru', 'Salomé', 'Wickins', '2001-05-16', '9947257500', 181);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (163, 'sjouanot4i@forbes.com', 'Célestine', 'Jouanot', '1958-08-21', '5556366280', 181);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (164, 'dsinson4j@telegraph.co.uk', 'Desirée', 'Sinson', '1993-07-20', '8348361912', 182);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (165, 'cstrute4k@g.co', 'Marlène', 'Strute', '1952-08-23', '5668809828', 182);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (166, 'rjeanequin4l@yahoo.co.jp', 'Pélagie', 'Jeanequin', '1986-09-19', '2568187431', 183);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (167, 'sweafer4m@dot.gov', 'Torbjörn', 'Weafer', '1976-12-11', '3178763785', 183);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (168, 'ihayers4n@yahoo.com', 'Méline', 'Hayers', '1991-03-16', '1011322767', 184);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (169, 'lpatriche4o@cpanel.net', 'Naéva', 'Patriche', '1987-06-25', '7761582619', 184);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (170, 'dfrancis4p@vistaprint.com', 'Béatrice', 'Francis', '1955-08-03', '8607474006', 185);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (171, 'kbusby4q@wunderground.com', 'Eliès', 'Busby', '1987-02-07', '9414155529', 185);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (172, 'ywilderspoon4r@sourceforge.net', 'Sélène', 'Wilderspoon', '1952-07-19', '6764600118', 186);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (173, 'jbrazier4s@addthis.com', 'Gaïa', 'Brazier', '1995-09-13', '4402547779', 186);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (174, 'riggalden4t@imgur.com', 'Gösta', 'Iggalden', '1979-02-09', '9437097795', 187);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (175, 'hjaffrey4u@ning.com', 'Solène', 'Jaffrey', '1973-08-09', '9506181900', 187);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (176, 'adrinan4v@instagram.com', 'Tán', 'Drinan', '1985-06-11', '8922032485', 188);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (177, 'dgrattage4w@netvibes.com', 'Jú', 'Grattage', '1982-02-04', '1046900010', 188);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (178, 'jkissock4x@liveinternet.ru', 'Bécassine', 'Kissock', '1993-03-24', '4364806561', 189);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (179, 'bblakeslee4y@cargocollective.com', 'Lèi', 'Blakeslee', '1969-12-11', '3129716863', 189);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (180, 'ddunlop4z@blinklist.com', 'Angélique', 'Dunlop', '1961-11-08', '6092419769', 190);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (181, 'sbermingham50@tripadvisor.com', 'Frédérique', 'Bermingham', '1988-09-09', '8887995566', 190);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (182, 'ewasylkiewicz51@arstechnica.com', 'Håkan', 'Wasylkiewicz', '1986-09-17', '1065406949', 191);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (183, 'mvannuccinii52@usatoday.com', 'Nadège', 'Vannuccinii', '1983-03-21', '4162155912', 5);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (184, 'rduffet53@gnu.org', 'Laurélie', 'Duffet', '1955-07-19', '8953271697', 192);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (185, 'ebeathem54@discovery.com', 'Daphnée', 'Beathem', '1953-06-17', '3427963583', 192);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (186, 'hbeceril55@photobucket.com', 'Åke', 'Beceril', '1987-03-23', '2287731971', 12);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (187, 'bashburne56@facebook.com', 'Françoise', 'Ashburne', '1960-09-01', '2791021997', 193);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (188, 'bocorr57@europa.eu', 'Médiamass', 'O''Corr', '1991-01-14', '2632066855', 194);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (189, 'nwykey58@hostgator.com', 'Maïly', 'Wykey', '1960-06-14', '1955341624', 24);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (190, 'bellwand59@fc2.com', 'Mégane', 'Ellwand', '1956-06-26', '4465037689', 195);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (191, 'eclabburn5a@infoseek.co.jp', 'Félicie', 'Clabburn', '2000-10-11', '9465055386', 195);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (192, 'jivimey5b@accuweather.com', 'Pò', 'Ivimey', '1981-11-16', '8654907048', 196);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (193, 'wrollason5c@lycos.com', 'Maéna', 'Rollason', '1976-12-30', '7409537547', 11);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (194, 'lharniman5d@deliciousdays.com', 'Amélie', 'Harniman', '1979-07-23', '5311434827', 197);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (195, 'bloftus5e@usgs.gov', 'Mahélie', 'Loftus', '1986-05-01', '8588637730', 197);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (196, 'mcoger5f@foxnews.com', 'Faîtes', 'Coger', '1983-09-28', '3999669262', 198);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (197, 'rcoppen5g@usatoday.com', 'Cloé', 'Coppen', '1972-12-12', '8641028995', 198);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (198, 'rmiles5h@imdb.com', 'Valérie', 'Miles', '1960-03-19', '8463939461', 199);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (199, 'mbriatt5i@biglobe.ne.jp', 'Nadège', 'Briatt', '1990-01-14', '4087268998', 4);
INSERT INTO homenet.personer (id, email, fornamn, efternamn, personnr, telefonnr, adress) VALUES (200, 'nconws5j@live.com', 'Sòng', 'Conws', '1983-11-28', '7895246525', 100);


--
-- Data for Name: kokböcker; Type: TABLE DATA; Schema: kokböckernas Recept; Owner: postgres
--

INSERT INTO "kokböckernas Recept"."kokböcker" (id, title, "år", "författare") VALUES (1, 'Lindas-kokbok', 1995, 'Linda Matsson');
INSERT INTO "kokböckernas Recept"."kokböcker" (id, title, "år", "författare") VALUES (2, 'Pelles Skafferi', 2003, 'Pelle Svanslös');
INSERT INTO "kokböckernas Recept"."kokböcker" (id, title, "år", "författare") VALUES (3, 'Åbingers Bullar', 2019, 'Daniella Åbinger');


--
-- Data for Name: kokböcker_med_recept; Type: TABLE DATA; Schema: kokböckernas Recept; Owner: postgres
--

INSERT INTO "kokböckernas Recept"."kokböcker_med_recept" (id, "kokböcker_id", recept_id) VALUES (1, 1, 1);
INSERT INTO "kokböckernas Recept"."kokböcker_med_recept" (id, "kokböcker_id", recept_id) VALUES (2, 1, 2);
INSERT INTO "kokböckernas Recept"."kokböcker_med_recept" (id, "kokböcker_id", recept_id) VALUES (3, 1, 3);
INSERT INTO "kokböckernas Recept"."kokböcker_med_recept" (id, "kokböcker_id", recept_id) VALUES (4, 2, 4);
INSERT INTO "kokböckernas Recept"."kokböcker_med_recept" (id, "kokböcker_id", recept_id) VALUES (5, 2, 5);
INSERT INTO "kokböckernas Recept"."kokböcker_med_recept" (id, "kokböcker_id", recept_id) VALUES (6, 2, 6);
INSERT INTO "kokböckernas Recept"."kokböcker_med_recept" (id, "kokböcker_id", recept_id) VALUES (7, 3, 7);
INSERT INTO "kokböckernas Recept"."kokböcker_med_recept" (id, "kokböcker_id", recept_id) VALUES (8, 3, 8);


--
-- Data for Name: recept; Type: TABLE DATA; Schema: kokböckernas Recept; Owner: postgres
--

INSERT INTO "kokböckernas Recept".recept (id, "rätter_namn", tillagningstid, portioner) VALUES (1, 'Pasta-carbonara', '00:20:00', '2 port');
INSERT INTO "kokböckernas Recept".recept (id, "rätter_namn", tillagningstid, portioner) VALUES (2, 'Korv med mos', '00:10:00', '1 port');
INSERT INTO "kokböckernas Recept".recept (id, "rätter_namn", tillagningstid, portioner) VALUES (3, 'Potatis gratäng', '02:00:00', '4 port');
INSERT INTO "kokböckernas Recept".recept (id, "rätter_namn", tillagningstid, portioner) VALUES (4, 'Korv med mos', '00:15:00', '2 port');
INSERT INTO "kokböckernas Recept".recept (id, "rätter_namn", tillagningstid, portioner) VALUES (5, 'Egenbakat bröd', '00:45:00', '1 limpa');
INSERT INTO "kokböckernas Recept".recept (id, "rätter_namn", tillagningstid, portioner) VALUES (6, 'Fetaostsallad', '00:20:00', '4 port');
INSERT INTO "kokböckernas Recept".recept (id, "rätter_namn", tillagningstid, portioner) VALUES (7, 'Egenbakat bröd', '01:00:00', '2 limpor');
INSERT INTO "kokböckernas Recept".recept (id, "rätter_namn", tillagningstid, portioner) VALUES (8, 'Kanelbullar', '00:30:00', '20 bullar');


--
-- Data for Name: adress; Type: TABLE DATA; Schema: miljovanliga_milstolpar; Owner: postgres
--

INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (11, 'Björkvägen', '18', '54130', 'Veberöd', 'Sverige', 'Skövde');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (13, 'Storgatan', '22', '83130', 'Grängesberg', 'Sverige', 'Östersund');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (4, 'Östra Hamngatan', '3C', '41313', 'Älmhult', 'Sverige', 'Göteborg');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (14, 'Storgatan', '2B', '83100', 'Bjärred', 'Sverige', 'Östersund');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (8, 'Drottninggatan', '24', '70210', 'Habo', 'Sverige', 'Örebro');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (2, 'Norra Allén', '25B', '41301', 'Eslöv', 'Sverige', 'Göteborg');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (1, 'Södra Vägen', '12A', '21145', 'Arlöv', 'Sverige', 'Malmö');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (3, 'Västergatan', '8', '11129', 'Haninge', 'Sverige', 'Stockholm');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (10, 'Kanalgatan', '14', '97232', 'Åseda', 'Sverige', 'Luleå');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (7, 'Lundavägen', '45', '21218', 'Knivsta', 'Sverige', 'Malmö');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (6, 'Kungsgatan', '10', '72213', 'Gnesta', 'Sverige', 'Västerås');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (15, 'Norrgatan', '5A', '35230', 'Rimbo', 'Sverige', 'Växjö');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (12, 'Havsbadsvägen', '32', '43930', 'Rydaholm', 'Sverige', 'Varberg');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (16, 'Skogsvägen ', '12', '12345', 'Naturby', 'Danmark', 'Åhus');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (17, 'Ekogatan ', '5', '23456', 'Lilla Ekoby', 'Tyskland', 'Frankfurt');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (18, 'Havsgatan', '20', '34567', 'Kato Stalos', 'Grekland', 'Chania');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (19, 'Lyxgatan', '3', '45678', 'Grönby', 'Grönland', 'Nuuk');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (23, 'street 2', '1', '12345', 'Ort1', 'Thailand', 'Bangkok');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (24, 'street 3', '1', '12654', 'Ort1', 'Thailand', 'Bangkok');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (25, 'street 4', '2', '65821', 'Ort2', 'Thailand', 'Bangkok');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (26, 'street 5', '2', '85214', 'Ort2', 'Japan', 'Tokyo');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (27, 'street 6', '3', '96325', 'Ort3', 'Japan', 'Tokyo');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (28, 'street 7', '3', '87412', 'Ort3', 'Japan', 'Tokyo');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (29, 'street 8', '4', '55145', 'Ort4', 'Japan', 'Tokyo');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (30, 'street 9', '4', '98522', 'Ort4', 'Japan', 'Tokyo');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (31, 'street 10', '5', '22121', 'Ort5', 'Indien', 'New Delhi');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (32, 'street 11', '5', '52152', 'Ort5', 'Indien', 'New Delhi');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (33, 'street 12', '6', '24122', 'Ort6', 'Indien', 'New Delhi');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (34, 'street 13', '6', '21562', 'Ort6', 'Indien', 'New Delhi');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (35, 'street 14', '7', '52525', 'Ort7', 'Tyskland', 'Berlin');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (36, 'street 15', '7', '52452', 'Ort7', 'Tyskland', 'Berlin');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (37, 'street 16', '8', '65255', 'Ort8', 'Tyskland', 'Berlin');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (38, 'street 17', '8', '25253', 'Ort8', 'Tyskland', 'Berlin');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (39, 'street 18', '9', '25255', 'Ort9', 'Polen', 'Warszawa');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (40, 'street 19', '9', '52152', 'Ort9', 'Polen', 'Warszawa');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (41, 'street 20', '10', '54152', 'Ort10', 'Polen', 'Warszawa');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (42, 'street 21', '10', '55152', 'Ort10', 'Polen', 'Warszawa');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (43, 'street 22', '11', '65245', 'Ort11', 'Polen', 'Warszawa');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (44, 'street 23', '11', '65255', 'Ort12', 'Frankrike', 'Paris');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (45, 'street 24', '12', '52525', 'Ort12', 'Frankrike', 'Paris');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (46, 'street 25', '12', '52522', 'Ort13', 'Frankrike', 'Paris');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (47, 'street 26', '13', '52542', 'Ort13', 'Frankrike', 'Paris');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (48, 'street 27', '13', '52563', 'Ort14', 'Frankrike', 'Paris');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (49, 'street 28', '14', '51265', 'Ort14', 'Sverige', 'Stockholm');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (50, 'street 29', '14', '52145', 'Ort15', 'Sverige', 'Stockholm');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (51, 'street 30', '15', '52455', 'Ort15', 'Sverige', 'Stockholm');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (52, 'street 31', '15', '85522', 'Ort16', 'Sverige', 'Stockholm');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (54, 'street 33', '16', '52152', 'Ort17', 'Sverige', 'Stockholm');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (83, 'street 38', '65', '25444', 'Ort16', 'Sverige', 'Stockholm');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (84, 'street 22', '86', '25556', 'Ort1', 'Sverige', 'Stockholm');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (85, 'street 17', '67', '52456', 'Ort2', 'Sverige', 'Stockholm');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (86, 'street86', '86', '868686', 'Bromma', 'Sverige', 'Stockholm');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (20, 'street 34', '1', '54645', 'Ort18', 'Sverige', 'Stockholm');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (22, 'street 36', '3', '35366', 'Ort18', 'Sverige', 'Stockholm');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (9, 'Skolgatan', '6', '75220', 'Edsbro', 'Sverige', 'Stockholm');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (56, 'street 38', '45', '63256', 'Ort18', 'Sverige', 'Varberg');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (55, 'street 37', '58', '55447', 'Ort19', 'Sverige', 'Varberg');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (21, 'street 35', '2', '35636', 'Ort7', 'Sverige', 'Stockholm');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (57, 'street 39', '55', '55566', 'Ort19', 'Sverige', 'Varberg');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (59, 'street 15', '36', '23233', 'Ort10', 'Sverige', 'Skövde');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (58, 'street 15', '52', '52152', 'Ort10', 'Sverige', 'Skövde');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (60, 'street 15', '44', '45444', 'Ort13', 'Sverige', 'Stockholm');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (53, 'street 19', '16', '96325', 'Ort16', 'Sverige', 'Stockholm');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (61, 'street 19', '77', '41455', 'Ort12', 'Frankrike', 'Paris');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (62, 'street 37', '45', '26536', 'Ort12', 'Frankrike', 'Paris');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (63, 'street 37', '22', '62356', 'Ort19', 'Japan', 'Kyoto');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (64, 'street 26', '65', '56256', 'Ort6', 'Sverige', 'Stockholm');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (65, 'street 28', '54', '63253', 'Ort19', 'Tyskland', 'Berlin');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (67, 'street 38', '77', '22268', 'Ort17', 'Sverige', 'Stockholm');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (68, 'street 1', '85', '74455', 'Ort7', 'Sverige', 'Stockholm');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (69, 'street 1', '75', '99999', 'Ort12', 'Polen', 'Warszawa');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (70, 'street 38', '22', '88888', 'Ort12', 'Polen', 'Warszawa');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (71, 'street 26', '11', '77777', 'Ort19', 'Polen', 'Warszawa');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (72, 'street 19', '11', '66666', 'Ort15', 'Sverige', 'Stockholm');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (73, 'street 38', '36', '55555', 'Ort13', 'Frankrike', 'Paris');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (74, 'street 31', '22', '44444', 'Ort6', 'Sverige', 'Stockholm');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (75, 'street 1', '15', '33333', 'Ort7', 'Sverige', 'Eskilstuna');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (76, 'street 31', '12', '22222', 'Ort7', 'Thailand', 'Bangkok');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (77, 'street 25', '75', '11111', 'Ort7', 'Sverige', 'Stockholm');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (78, 'street 26', '77', '51150', 'Ort6', 'Sverige', 'Stockholm');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (79, 'street 27', '85', '53252', 'Ort12', 'Sverige', 'Stockholm');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (80, 'street 28', '75', '98565', 'Ort17', 'Sverige', 'Stockholm');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (81, 'street 38', '22', '15256', 'Ort10', 'Sverige', 'Stockholm');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (82, 'street 1', '66', '84565', 'Ort19', 'Sverige', 'Stockholm');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (5, 'Storgatan', '15', '33131', 'Lilla Ekoby', 'Tyskland', 'Växjö');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (87, 'Bokvägen', '12', '12345', 'Stockholm', 'Sverige', 'Stockholm');
INSERT INTO miljovanliga_milstolpar.adress (id, gatunamn, gatunummer, postnummer, ort, land, stad) VALUES (66, 'Nyadress123', '75', '65256', 'Ort19', 'Sverige', 'Stockholm');


--
-- Data for Name: aktivitet; Type: TABLE DATA; Schema: miljovanliga_milstolpar; Owner: postgres
--

INSERT INTO miljovanliga_milstolpar.aktivitet (id, namn, beskrivning, status, typ, "snitt_co2_utsläpp", adress_id, email_id, pris, sparas_co2) VALUES (2, 'aktivitet_2', 'tråkigt', 'inte aktiv', 'Dykning och snorkling', 100, 24, 38, 9000, 16);
INSERT INTO miljovanliga_milstolpar.aktivitet (id, namn, beskrivning, status, typ, "snitt_co2_utsläpp", adress_id, email_id, pris, sparas_co2) VALUES (13, 'aktivitet_13', 'träning i grupp', 'inte aktiv', 'Cykling', 120, 31, 39, 2500, 18);
INSERT INTO miljovanliga_milstolpar.aktivitet (id, namn, beskrivning, status, typ, "snitt_co2_utsläpp", adress_id, email_id, pris, sparas_co2) VALUES (11, 'aktivitet_11', 'relax', 'aktiv', 'Bastu och isbad', 150, 29, 39, 300, 34);
INSERT INTO miljovanliga_milstolpar.aktivitet (id, namn, beskrivning, status, typ, "snitt_co2_utsläpp", adress_id, email_id, pris, sparas_co2) VALUES (6, 'aktivitet_6', 'givande', 'aktiv', 'Matlagningskurser', 120, 18, 18, 2200, 17);
INSERT INTO miljovanliga_milstolpar.aktivitet (id, namn, beskrivning, status, typ, "snitt_co2_utsläpp", adress_id, email_id, pris, sparas_co2) VALUES (1, 'aktivitet_1', 'kul', 'aktiv', 'Fiske', 80, 25, 38, 800, 41);
INSERT INTO miljovanliga_milstolpar.aktivitet (id, namn, beskrivning, status, typ, "snitt_co2_utsläpp", adress_id, email_id, pris, sparas_co2) VALUES (5, 'aktivitet_5', 'givande', 'aktiv', 'Matlagningskurser', 150, 17, 18, 1500, 25);
INSERT INTO miljovanliga_milstolpar.aktivitet (id, namn, beskrivning, status, typ, "snitt_co2_utsläpp", adress_id, email_id, pris, sparas_co2) VALUES (3, 'aktivitet_3', 'kul', 'aktiv', 'Vandring', 100, 23, 38, 3200, 21);
INSERT INTO miljovanliga_milstolpar.aktivitet (id, namn, beskrivning, status, typ, "snitt_co2_utsläpp", adress_id, email_id, pris, sparas_co2) VALUES (17, 'aktivitet_17', 'fantastiskt', 'aktiv', 'Museum', 80, 71, 38, 200, 32);
INSERT INTO miljovanliga_milstolpar.aktivitet (id, namn, beskrivning, status, typ, "snitt_co2_utsläpp", adress_id, email_id, pris, sparas_co2) VALUES (10, 'aktivitet_10', 'fantastiskt', 'aktiv', 'Museum', 80, 28, 39, 180, 16);
INSERT INTO miljovanliga_milstolpar.aktivitet (id, namn, beskrivning, status, typ, "snitt_co2_utsläpp", adress_id, email_id, pris, sparas_co2) VALUES (8, 'aktivitet_8', 'fantastiskt', 'aktiv', 'Museum', 80, 26, 38, 250, 33);
INSERT INTO miljovanliga_milstolpar.aktivitet (id, namn, beskrivning, status, typ, "snitt_co2_utsläpp", adress_id, email_id, pris, sparas_co2) VALUES (12, 'aktivitet_12', 'relax', 'aktiv', 'Bastu och isbad', 150, 30, 39, 400, 23);
INSERT INTO miljovanliga_milstolpar.aktivitet (id, namn, beskrivning, status, typ, "snitt_co2_utsläpp", adress_id, email_id, pris, sparas_co2) VALUES (14, 'aktivitet_14', 'träning', 'inte aktiv', 'Cykling', 120, 32, 38, 8000, 15);
INSERT INTO miljovanliga_milstolpar.aktivitet (id, namn, beskrivning, status, typ, "snitt_co2_utsläpp", adress_id, email_id, pris, sparas_co2) VALUES (16, 'aktivitet_16', 'upptäckning', 'inte aktiv', 'Dykning och snorkling', 100, 34, 18, 5000, 62);
INSERT INTO miljovanliga_milstolpar.aktivitet (id, namn, beskrivning, status, typ, "snitt_co2_utsläpp", adress_id, email_id, pris, sparas_co2) VALUES (7, 'aktivitet_7', 'givande', 'aktiv', 'Matlagningskurser', 120, 19, 18, 1800, 13);
INSERT INTO miljovanliga_milstolpar.aktivitet (id, namn, beskrivning, status, typ, "snitt_co2_utsläpp", adress_id, email_id, pris, sparas_co2) VALUES (15, 'aktivitet_15', 'träning', 'inte aktiv', 'Cykling', 120, 33, 38, 2500, 21);
INSERT INTO miljovanliga_milstolpar.aktivitet (id, namn, beskrivning, status, typ, "snitt_co2_utsläpp", adress_id, email_id, pris, sparas_co2) VALUES (4, 'aktivitet_4', 'super', 'aktiv', 'Matlagningskurser', 150, 16, 18, 3000, 11);
INSERT INTO miljovanliga_milstolpar.aktivitet (id, namn, beskrivning, status, typ, "snitt_co2_utsläpp", adress_id, email_id, pris, sparas_co2) VALUES (9, 'aktivitet_9', 'fantastiskt', 'aktiv', 'Museum', 80, 27, 39, 300, 36);


--
-- Data for Name: användare_konto; Type: TABLE DATA; Schema: miljovanliga_milstolpar; Owner: postgres
--

INSERT INTO miljovanliga_milstolpar."användare_konto" (id, "lösenord", reg_datum, roll, "användareuppgifter_id", email_id) VALUES (16, 'password1', '2022-10-31 18:18:06', 'systemadmin', 15, 1);
INSERT INTO miljovanliga_milstolpar."användare_konto" (id, "lösenord", reg_datum, roll, "användareuppgifter_id", email_id) VALUES (24, 'password9', '2020-08-24 18:19:09', 'kund', 7, 9);
INSERT INTO miljovanliga_milstolpar."användare_konto" (id, "lösenord", reg_datum, roll, "användareuppgifter_id", email_id) VALUES (23, 'password8', '2022-07-31 18:19:03', 'kund', 8, 8);
INSERT INTO miljovanliga_milstolpar."användare_konto" (id, "lösenord", reg_datum, roll, "användareuppgifter_id", email_id) VALUES (29, 'password14', '2023-02-25 18:20:06', 'kund', 2, 14);
INSERT INTO miljovanliga_milstolpar."användare_konto" (id, "lösenord", reg_datum, roll, "användareuppgifter_id", email_id) VALUES (13, 'simplepass', '2023-11-05 08:30:00', 'kund', 18, 21);
INSERT INTO miljovanliga_milstolpar."användare_konto" (id, "lösenord", reg_datum, roll, "användareuppgifter_id", email_id) VALUES (7, 'user456', '2023-07-08 14:55:12', 'kund', 24, 27);
INSERT INTO miljovanliga_milstolpar."användare_konto" (id, "lösenord", reg_datum, roll, "användareuppgifter_id", email_id) VALUES (25, 'password10', '2019-10-25 18:19:18', 'kund', 6, 10);
INSERT INTO miljovanliga_milstolpar."användare_konto" (id, "lösenord", reg_datum, roll, "användareuppgifter_id", email_id) VALUES (12, 'testpass', '2023-10-18 22:45:12', 'kund', 19, 22);
INSERT INTO miljovanliga_milstolpar."användare_konto" (id, "lösenord", reg_datum, roll, "användareuppgifter_id", email_id) VALUES (8, 'mypassword', '2023-08-03 16:10:50', 'kund', 23, 26);
INSERT INTO miljovanliga_milstolpar."användare_konto" (id, "lösenord", reg_datum, roll, "användareuppgifter_id", email_id) VALUES (6, 'admin123', '2023-06-12 12:25:30', 'kund', 25, 28);
INSERT INTO miljovanliga_milstolpar."användare_konto" (id, "lösenord", reg_datum, roll, "användareuppgifter_id", email_id) VALUES (30, 'password15', '2020-12-11 18:20:14', 'kund', 1, 15);
INSERT INTO miljovanliga_milstolpar."användare_konto" (id, "lösenord", reg_datum, roll, "användareuppgifter_id", email_id) VALUES (10, '1234abcd', '2023-09-14 19:05:45', 'kund', 21, 24);
INSERT INTO miljovanliga_milstolpar."användare_konto" (id, "lösenord", reg_datum, roll, "användareuppgifter_id", email_id) VALUES (11, 'abcdefg', '2023-10-01 21:15:30', 'kund', 20, 23);
INSERT INTO miljovanliga_milstolpar."användare_konto" (id, "lösenord", reg_datum, roll, "användareuppgifter_id", email_id) VALUES (27, 'password12', '2019-11-17 18:19:47', 'kund', 4, 12);
INSERT INTO miljovanliga_milstolpar."användare_konto" (id, "lösenord", reg_datum, roll, "användareuppgifter_id", email_id) VALUES (15, 'pass5678', '2023-12-01 11:35:40', 'kund', 16, 19);
INSERT INTO miljovanliga_milstolpar."användare_konto" (id, "lösenord", reg_datum, roll, "användareuppgifter_id", email_id) VALUES (5, 'welcome1', '2023-05-01 07:50:05', 'kund', 26, 29);
INSERT INTO miljovanliga_milstolpar."användare_konto" (id, "lösenord", reg_datum, roll, "användareuppgifter_id", email_id) VALUES (26, 'password11', '2018-06-03 18:19:37', 'kund', 5, 11);
INSERT INTO miljovanliga_milstolpar."användare_konto" (id, "lösenord", reg_datum, roll, "användareuppgifter_id", email_id) VALUES (18, 'password3', '2023-08-31 18:18:21', 'kundsupport', 13, 3);
INSERT INTO miljovanliga_milstolpar."användare_konto" (id, "lösenord", reg_datum, roll, "användareuppgifter_id", email_id) VALUES (21, 'password6', '2021-12-31 18:18:48', 'kund', 10, 6);
INSERT INTO miljovanliga_milstolpar."användare_konto" (id, "lösenord", reg_datum, roll, "användareuppgifter_id", email_id) VALUES (4, 'letmein', '2023-04-10 09:15:20', 'kund', 27, 30);
INSERT INTO miljovanliga_milstolpar."användare_konto" (id, "lösenord", reg_datum, roll, "användareuppgifter_id", email_id) VALUES (22, 'password7', '2019-10-31 18:18:56', 'kund', 9, 7);
INSERT INTO miljovanliga_milstolpar."användare_konto" (id, "lösenord", reg_datum, roll, "användareuppgifter_id", email_id) VALUES (17, 'password2', '2023-10-31 18:18:16', 'kundsupport', 14, 2);
INSERT INTO miljovanliga_milstolpar."användare_konto" (id, "lösenord", reg_datum, roll, "användareuppgifter_id", email_id) VALUES (2, 'passw0rd', '2023-02-20 10:12:33', 'kundsupport', 29, 32);
INSERT INTO miljovanliga_milstolpar."användare_konto" (id, "lösenord", reg_datum, roll, "användareuppgifter_id", email_id) VALUES (14, 'mypwd789', '2023-11-20 09:20:10', 'kund', 17, 20);
INSERT INTO miljovanliga_milstolpar."användare_konto" (id, "lösenord", reg_datum, roll, "användareuppgifter_id", email_id) VALUES (19, 'password4', '2019-10-27 18:18:26', 'systemadmin', 12, 4);
INSERT INTO miljovanliga_milstolpar."användare_konto" (id, "lösenord", reg_datum, roll, "användareuppgifter_id", email_id) VALUES (28, 'password13', '2019-07-29 18:20:00', 'kund', 3, 13);
INSERT INTO miljovanliga_milstolpar."användare_konto" (id, "lösenord", reg_datum, roll, "användareuppgifter_id", email_id) VALUES (20, 'password5', '2021-08-31 18:18:34', 'kund', 11, 5);
INSERT INTO miljovanliga_milstolpar."användare_konto" (id, "lösenord", reg_datum, roll, "användareuppgifter_id", email_id) VALUES (9, 'securepass', '2023-08-20 17:30:25', 'kund', 22, 25);
INSERT INTO miljovanliga_milstolpar."användare_konto" (id, "lösenord", reg_datum, roll, "användareuppgifter_id", email_id) VALUES (3, 'qwerty123', '2023-03-05 11:45:10', 'kundsupport', 28, 31);
INSERT INTO miljovanliga_milstolpar."användare_konto" (id, "lösenord", reg_datum, roll, "användareuppgifter_id", email_id) VALUES (31, 'password16', '2023-11-04 12:08:22', 'kund', 34, 46);
INSERT INTO miljovanliga_milstolpar."användare_konto" (id, "lösenord", reg_datum, roll, "användareuppgifter_id", email_id) VALUES (32, 'Password32', '2024-11-08 12:34:02.743919', 'kund', 35, 47);
INSERT INTO miljovanliga_milstolpar."användare_konto" (id, "lösenord", reg_datum, roll, "användareuppgifter_id", email_id) VALUES (1, '1990cool', '2023-01-15 08:23:45', 'systemadmin', 30, 33);


--
-- Data for Name: användareuppgifter; Type: TABLE DATA; Schema: miljovanliga_milstolpar; Owner: postgres
--

INSERT INTO miljovanliga_milstolpar."användareuppgifter" (id, "förnamn", efternamn, passnummer, adress_id, "födelsedatum") VALUES (31, 'John', 'Gattami', 'A56955855', 67, '1990-05-15');
INSERT INTO miljovanliga_milstolpar."användareuppgifter" (id, "förnamn", efternamn, passnummer, adress_id, "födelsedatum") VALUES (32, 'Anmol', 'Wakas', 'P69985564', 68, '1987-02-18');
INSERT INTO miljovanliga_milstolpar."användareuppgifter" (id, "förnamn", efternamn, passnummer, adress_id, "födelsedatum") VALUES (33, 'Ash', 'Jansson', 'R65215258', 69, '1992-02-20');
INSERT INTO miljovanliga_milstolpar."användareuppgifter" (id, "förnamn", efternamn, passnummer, adress_id, "födelsedatum") VALUES (34, 'Moll', 'Axelsson', 'S63214526', 85, '1992-02-20');
INSERT INTO miljovanliga_milstolpar."användareuppgifter" (id, "förnamn", efternamn, passnummer, adress_id, "födelsedatum") VALUES (35, 'Tannaz', 'Larrson', 'PA1555411', 86, '1990-02-07');
INSERT INTO miljovanliga_milstolpar."användareuppgifter" (id, "förnamn", efternamn, passnummer, adress_id, "födelsedatum") VALUES (6, 'Olof', 'Bergström', 'F67890123', 6, '1993-06-12');
INSERT INTO miljovanliga_milstolpar."användareuppgifter" (id, "förnamn", efternamn, passnummer, adress_id, "födelsedatum") VALUES (26, 'Junas', 'Hellström', 'L56245212', 58, '1988-01-15');
INSERT INTO miljovanliga_milstolpar."användareuppgifter" (id, "förnamn", efternamn, passnummer, adress_id, "födelsedatum") VALUES (15, 'Sara', 'Sandberg', 'O56789012', 51, '1990-02-13');
INSERT INTO miljovanliga_milstolpar."användareuppgifter" (id, "förnamn", efternamn, passnummer, adress_id, "födelsedatum") VALUES (19, 'Jemili', 'Gustafsson', 'D51525125', 54, '1990-02-16');
INSERT INTO miljovanliga_milstolpar."användareuppgifter" (id, "förnamn", efternamn, passnummer, adress_id, "födelsedatum") VALUES (29, 'Tannaz', 'Danielsson', 'Q59658556', 49, '1990-02-11');
INSERT INTO miljovanliga_milstolpar."användareuppgifter" (id, "förnamn", efternamn, passnummer, adress_id, "födelsedatum") VALUES (11, 'Emma', 'Holm', 'K12345678', 11, '1990-02-03');
INSERT INTO miljovanliga_milstolpar."användareuppgifter" (id, "förnamn", efternamn, passnummer, adress_id, "födelsedatum") VALUES (20, 'Ash', 'Häggblom', 'E52452152', 55, '1988-01-12');
INSERT INTO miljovanliga_milstolpar."användareuppgifter" (id, "förnamn", efternamn, passnummer, adress_id, "födelsedatum") VALUES (8, 'Per', 'Axelsson', 'H89012345', 8, '1994-11-19');
INSERT INTO miljovanliga_milstolpar."användareuppgifter" (id, "förnamn", efternamn, passnummer, adress_id, "födelsedatum") VALUES (1, 'Anna', 'Svensson', 'A12345678', 1, '1994-11-13');
INSERT INTO miljovanliga_milstolpar."användareuppgifter" (id, "förnamn", efternamn, passnummer, adress_id, "födelsedatum") VALUES (24, 'Malin', 'Svensson', 'I51252222', 22, '1990-02-10');
INSERT INTO miljovanliga_milstolpar."användareuppgifter" (id, "förnamn", efternamn, passnummer, adress_id, "födelsedatum") VALUES (14, 'Peter', 'Månsson', 'N45678901', 52, '1990-02-14');
INSERT INTO miljovanliga_milstolpar."användareuppgifter" (id, "förnamn", efternamn, passnummer, adress_id, "födelsedatum") VALUES (7, 'Karin', 'Lindgren', 'G78901234', 7, '1993-06-13');
INSERT INTO miljovanliga_milstolpar."användareuppgifter" (id, "förnamn", efternamn, passnummer, adress_id, "födelsedatum") VALUES (10, 'Henrik', 'Fredriksson', 'J01234567', 10, '1990-02-02');
INSERT INTO miljovanliga_milstolpar."användareuppgifter" (id, "förnamn", efternamn, passnummer, adress_id, "födelsedatum") VALUES (28, 'Liam', 'Sjölund', 'N95641254', 50, '1990-02-12');
INSERT INTO miljovanliga_milstolpar."användareuppgifter" (id, "förnamn", efternamn, passnummer, adress_id, "födelsedatum") VALUES (5, 'Eva', 'Andersson', 'E56789012', 5, '1993-06-11');
INSERT INTO miljovanliga_milstolpar."användareuppgifter" (id, "förnamn", efternamn, passnummer, adress_id, "födelsedatum") VALUES (25, 'Moll', 'Olsson', 'K65415222', 57, '1988-01-14');
INSERT INTO miljovanliga_milstolpar."användareuppgifter" (id, "förnamn", efternamn, passnummer, adress_id, "födelsedatum") VALUES (13, 'Linda', 'Söderberg', 'M34567890', 53, '1990-02-15');
INSERT INTO miljovanliga_milstolpar."användareuppgifter" (id, "förnamn", efternamn, passnummer, adress_id, "födelsedatum") VALUES (9, 'Sofia', 'Ekström', 'I90123456', 9, '1994-11-20');
INSERT INTO miljovanliga_milstolpar."användareuppgifter" (id, "förnamn", efternamn, passnummer, adress_id, "födelsedatum") VALUES (16, 'Viktor', 'Karlsson', 'A65125251', 12, '1990-02-04');
INSERT INTO miljovanliga_milstolpar."användareuppgifter" (id, "förnamn", efternamn, passnummer, adress_id, "födelsedatum") VALUES (4, 'Lars', 'Karlsson', 'D45678901', 4, '1993-06-10');
INSERT INTO miljovanliga_milstolpar."användareuppgifter" (id, "förnamn", efternamn, passnummer, adress_id, "födelsedatum") VALUES (18, 'John', 'Eriksson', 'C52152142', 14, '1990-02-06');
INSERT INTO miljovanliga_milstolpar."användareuppgifter" (id, "förnamn", efternamn, passnummer, adress_id, "födelsedatum") VALUES (27, 'Juno', 'Jansson', 'M52525826', 59, '1988-01-16');
INSERT INTO miljovanliga_milstolpar."användareuppgifter" (id, "förnamn", efternamn, passnummer, adress_id, "födelsedatum") VALUES (2, 'Erik', 'Johansson', 'B23456789', 2, '1994-11-13');
INSERT INTO miljovanliga_milstolpar."användareuppgifter" (id, "förnamn", efternamn, passnummer, adress_id, "födelsedatum") VALUES (30, 'Hampus', 'Nordberg', 'P56565655', 15, '1990-02-07');
INSERT INTO miljovanliga_milstolpar."användareuppgifter" (id, "förnamn", efternamn, passnummer, adress_id, "födelsedatum") VALUES (23, 'Karl', 'Lindholm', 'H65125625', 21, '1990-02-09');
INSERT INTO miljovanliga_milstolpar."användareuppgifter" (id, "förnamn", efternamn, passnummer, adress_id, "födelsedatum") VALUES (3, 'Maria', 'Nilsson', 'C34567890', 3, '1994-11-14');
INSERT INTO miljovanliga_milstolpar."användareuppgifter" (id, "förnamn", efternamn, passnummer, adress_id, "födelsedatum") VALUES (12, 'Jonas', 'Blom', 'L23456789', 60, '1988-01-17');
INSERT INTO miljovanliga_milstolpar."användareuppgifter" (id, "förnamn", efternamn, passnummer, adress_id, "födelsedatum") VALUES (17, 'Adam', 'Larsson', 'B25625252', 13, '1990-02-05');
INSERT INTO miljovanliga_milstolpar."användareuppgifter" (id, "förnamn", efternamn, passnummer, adress_id, "födelsedatum") VALUES (21, 'Troy', 'Söderlund', 'F52652522', 56, '1988-01-13');
INSERT INTO miljovanliga_milstolpar."användareuppgifter" (id, "förnamn", efternamn, passnummer, adress_id, "födelsedatum") VALUES (22, 'Mila', 'Mattsson', 'G52152152', 20, '1990-02-08');


--
-- Data for Name: betalning; Type: TABLE DATA; Schema: miljovanliga_milstolpar; Owner: postgres
--

INSERT INTO miljovanliga_milstolpar.betalning (id, betalningsstatus, belopp, betalningsmetod, betalningstid) VALUES (1, 'betald', 3200, 'kort', '2024-09-30 10:35:03');
INSERT INTO miljovanliga_milstolpar.betalning (id, betalningsstatus, belopp, betalningsmetod, betalningstid) VALUES (2, 'betald', 7200, 'kort', '2024-10-30 10:35:01');
INSERT INTO miljovanliga_milstolpar.betalning (id, betalningsstatus, belopp, betalningsmetod, betalningstid) VALUES (3, 'betald', 2800, 'faktura', '2024-10-31 18:51:06');
INSERT INTO miljovanliga_milstolpar.betalning (id, betalningsstatus, belopp, betalningsmetod, betalningstid) VALUES (7, 'betald', 8480, 'kort', '2024-07-31 18:49:24');
INSERT INTO miljovanliga_milstolpar.betalning (id, betalningsstatus, belopp, betalningsmetod, betalningstid) VALUES (19, 'betald', 10400, 'kort', '2024-10-29 16:11:26');
INSERT INTO miljovanliga_milstolpar.betalning (id, betalningsstatus, belopp, betalningsmetod, betalningstid) VALUES (17, 'betald', 1200, 'kort', '2024-10-29 16:10:54');
INSERT INTO miljovanliga_milstolpar.betalning (id, betalningsstatus, belopp, betalningsmetod, betalningstid) VALUES (18, 'betald', 200, 'kort', '2024-10-30 16:12:10');
INSERT INTO miljovanliga_milstolpar.betalning (id, betalningsstatus, belopp, betalningsmetod, betalningstid) VALUES (20, 'förfallen', 25000, 'faktura', NULL);
INSERT INTO miljovanliga_milstolpar.betalning (id, betalningsstatus, belopp, betalningsmetod, betalningstid) VALUES (5, 'obetalad', 14700, 'kort', NULL);
INSERT INTO miljovanliga_milstolpar.betalning (id, betalningsstatus, belopp, betalningsmetod, betalningstid) VALUES (21, 'betald', 5800, 'kort', '2024-11-05 09:58:24.941271');
INSERT INTO miljovanliga_milstolpar.betalning (id, betalningsstatus, belopp, betalningsmetod, betalningstid) VALUES (11, 'betald', 9000, 'klarna', '2024-10-31 18:48:39');
INSERT INTO miljovanliga_milstolpar.betalning (id, betalningsstatus, belopp, betalningsmetod, betalningstid) VALUES (15, 'betald', 2500, 'faktura', '2024-10-07 18:47:49');
INSERT INTO miljovanliga_milstolpar.betalning (id, betalningsstatus, belopp, betalningsmetod, betalningstid) VALUES (8, 'betald', 2800, 'kort', '2022-12-22 18:49:08');
INSERT INTO miljovanliga_milstolpar.betalning (id, betalningsstatus, belopp, betalningsmetod, betalningstid) VALUES (14, 'betald', 8000, 'klarna', '2024-10-31 18:48:10');
INSERT INTO miljovanliga_milstolpar.betalning (id, betalningsstatus, belopp, betalningsmetod, betalningstid) VALUES (10, 'betald', 2500, 'kort', '2022-10-31 18:48:46');
INSERT INTO miljovanliga_milstolpar.betalning (id, betalningsstatus, belopp, betalningsmetod, betalningstid) VALUES (16, 'betald', 5000, 'faktura', '2024-10-31 18:47:32');
INSERT INTO miljovanliga_milstolpar.betalning (id, betalningsstatus, belopp, betalningsmetod, betalningstid) VALUES (12, 'betald', 6000, 'klarna', '2024-10-31 18:48:31');
INSERT INTO miljovanliga_milstolpar.betalning (id, betalningsstatus, belopp, betalningsmetod, betalningstid) VALUES (9, 'betald', 1500, 'klarna', '2023-08-29 18:48:56');
INSERT INTO miljovanliga_milstolpar.betalning (id, betalningsstatus, belopp, betalningsmetod, betalningstid) VALUES (13, 'betald', 7000, 'klarna', '2023-10-31 18:48:21');


--
-- Data for Name: bilder; Type: TABLE DATA; Schema: miljovanliga_milstolpar; Owner: postgres
--

INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (45, 'länk 45', 'beskriving 45', NULL, 5, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (70, 'länk 70', 'beskriving 70', NULL, 14, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (66, 'länk 66', 'beskriving 66', NULL, 10, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (42, 'länk 42', 'beskriving 42', NULL, 2, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (48, 'länk 48', 'beskriving 48', NULL, 8, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (58, 'länk 58', 'beskriving 58', NULL, 2, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (67, 'länk 67', 'beskriving 67', NULL, 11, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (50, 'länk 50', 'beskriving 50', NULL, 10, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (71, 'länk 71', 'beskriving 71', NULL, 15, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (43, 'länk 43', 'beskriving 43', NULL, 3, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (57, 'länk 57', 'beskriving 57', NULL, 1, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (55, 'länk 55', 'beskriving 55', NULL, 15, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (63, 'länk 63', 'beskriving 63', NULL, 7, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (72, 'länk 72', 'beskriving 72', NULL, 16, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (44, 'länk 44', 'beskriving 44', NULL, 4, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (54, 'länk 54', 'beskriving 54', NULL, 14, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (51, 'länk 51', 'beskriving 51', NULL, 11, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (47, 'länk 47', 'beskriving 47', NULL, 7, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (62, 'länk 62', 'beskriving 62', NULL, 6, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (60, 'länk 60', 'beskriving 60', NULL, 4, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (65, 'länk 65', 'beskriving 65', NULL, 9, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (46, 'länk 46', 'beskriving 46', NULL, 6, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (69, 'länk 69', 'beskriving 69', NULL, 13, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (41, 'länk 41', 'beskriving 41', NULL, 1, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (56, 'länk 56', 'beskriving 56', NULL, 16, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (52, 'länk 52', 'beskriving 52', NULL, 12, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (61, 'länk 61', 'beskriving 61', NULL, 5, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (68, 'länk 68', 'beskriving 68', NULL, 12, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (49, 'länk 49', 'beskriving 49', NULL, 9, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (53, 'länk 53', 'beskriving 53', NULL, 13, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (59, 'länk 59', 'beskriving 59', NULL, 3, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (64, 'länk 64', 'beskriving 64', NULL, 8, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (88, 'länk 88', 'beskriving 88', NULL, NULL, 16);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (31, 'länk 31', 'beskriving 31', 11, NULL, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (35, 'länk 35', 'beskriving 35', 15, NULL, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (16, 'länk 16', 'beskriving 16', 16, NULL, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (8, 'länk 8', 'beskriving 8', 8, NULL, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (28, 'länk 28', 'beskriving 28', 8, NULL, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (24, 'länk 24', 'beskriving 24', 4, NULL, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (14, 'länk 14', 'beskriving 14', 14, NULL, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (37, 'länk 37', 'beskriving 37', 17, NULL, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (12, 'länk 12', 'beskriving 12', 12, NULL, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (33, 'länk 33', 'beskriving 33', 13, NULL, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (4, 'länk 4', 'beskriving 4', 4, NULL, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (27, 'länk 27', 'beskriving 27', 7, NULL, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (17, 'länk 17', 'beskriving 17', 17, NULL, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (34, 'länk 34', 'beskriving 34', 14, NULL, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (9, 'länk 9', 'beskriving 9', 9, NULL, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (40, 'länk 40', 'beskriving 40', 20, NULL, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (7, 'länk 7', 'beskriving 7', 7, NULL, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (38, 'länk 38', 'beskriving 38', 18, NULL, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (36, 'länk 36', 'beskriving 36', 16, NULL, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (32, 'länk 32', 'beskriving 32', 12, NULL, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (1, 'länk 1', 'beskriving 1', 1, NULL, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (15, 'länk 15', 'beskriving 15', 15, NULL, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (10, 'länk 10', 'beskriving 10', 10, NULL, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (26, 'länk 26', 'beskriving 26', 6, NULL, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (18, 'länk 18', 'beskriving 18', 18, NULL, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (39, 'länk 39', 'beskriving 39', 19, NULL, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (6, 'länk 6', 'beskriving 6', 6, NULL, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (2, 'länk 2', 'beskriving 2', 2, NULL, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (22, 'länk 22', 'beskriving 22', 2, NULL, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (30, 'länk 30', 'beskriving 30', 10, NULL, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (20, 'länk 20', 'beskriving 20', 20, NULL, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (29, 'länk 29', 'beskriving 29', 9, NULL, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (19, 'länk 19', 'beskriving 19', 19, NULL, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (25, 'länk 25', 'beskriving 25', 5, NULL, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (13, 'länk 13', 'beskriving 13', 13, NULL, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (3, 'länk 3', 'beskriving 3', 3, NULL, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (23, 'länk 23', 'beskriving 23', 3, NULL, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (5, 'länk 5', 'beskriving 5', 5, NULL, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (11, 'länk 11', 'beskriving 11', 11, NULL, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (21, 'länk 21', 'beskriving 21', 1, NULL, NULL);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (74, 'länk 74', 'beskriving 74', NULL, NULL, 2);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (85, 'länk 85', 'beskriving 85', NULL, NULL, 13);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (99, 'länk 99', 'beskriving 99', NULL, NULL, 27);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (102, 'länk 102', 'beskriving 102', NULL, NULL, 30);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (104, 'länk 104', 'beskriving 104', NULL, NULL, 32);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (94, 'länk 94', 'beskriving 94', NULL, NULL, 22);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (79, 'länk 79', 'beskriving 79', NULL, NULL, 7);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (91, 'länk 91', 'beskriving 91', NULL, NULL, 19);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (108, 'länk 108', 'beskriving 108', NULL, NULL, 36);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (97, 'länk 97', 'beskriving 97', NULL, NULL, 25);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (93, 'länk 93', 'beskriving 93', NULL, NULL, 21);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (107, 'länk 107', 'beskriving 107', NULL, NULL, 35);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (110, 'länk 110', 'beskriving 110', NULL, NULL, 38);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (77, 'länk 77', 'beskriving 77', NULL, NULL, 5);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (105, 'länk 105', 'beskriving 105', NULL, NULL, 33);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (128, 'länk 128', 'beskriving 128', NULL, NULL, 16);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (116, 'länk 116', 'beskriving 116', NULL, NULL, 4);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (124, 'länk 124', 'beskriving 124', NULL, NULL, 12);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (129, 'länk 129', 'beskriving 129', NULL, NULL, 17);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (113, 'länk 113', 'beskriving 113', NULL, NULL, 1);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (121, 'länk 121', 'beskriving 121', NULL, NULL, 9);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (112, 'länk 112', 'beskriving 112', NULL, NULL, 40);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (119, 'länk 119', 'beskriving 119', NULL, NULL, 7);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (117, 'länk 117', 'beskriving 117', NULL, NULL, 5);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (125, 'länk 125', 'beskriving 125', NULL, NULL, 13);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (103, 'länk 103', 'beskriving 103', NULL, NULL, 31);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (96, 'länk 96', 'beskriving 96', NULL, NULL, 24);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (100, 'länk 100', 'beskriving 100', NULL, NULL, 28);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (83, 'länk 83', 'beskriving 83', NULL, NULL, 11);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (86, 'länk 86', 'beskriving 86', NULL, NULL, 14);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (135, 'länk 135', 'beskriving 135', NULL, NULL, 23);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (131, 'länk 131', 'beskriving 131', NULL, NULL, 19);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (118, 'länk 118', 'beskriving 118', NULL, NULL, 6);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (109, 'länk 109', 'beskriving 109', NULL, NULL, 37);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (123, 'länk 123', 'beskriving 123', NULL, NULL, 11);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (130, 'länk 130', 'beskriving 130', NULL, NULL, 18);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (78, 'länk 78', 'beskriving 78', NULL, NULL, 6);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (126, 'länk 126', 'beskriving 126', NULL, NULL, 14);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (106, 'länk 106', 'beskriving 106', NULL, NULL, 34);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (90, 'länk 90', 'beskriving 90', NULL, NULL, 18);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (95, 'länk 95', 'beskriving 95', NULL, NULL, 23);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (127, 'länk 127', 'beskriving 127', NULL, NULL, 15);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (98, 'länk 98', 'beskriving 98', NULL, NULL, 26);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (120, 'länk 120', 'beskriving 120', NULL, NULL, 8);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (84, 'länk 84', 'beskriving 84', NULL, NULL, 12);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (75, 'länk 75', 'beskriving 75', NULL, NULL, 3);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (133, 'länk 133', 'beskriving 133', NULL, NULL, 21);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (115, 'länk 115', 'beskriving 115', NULL, NULL, 3);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (81, 'länk 81', 'beskriving 81', NULL, NULL, 9);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (111, 'länk 111', 'beskriving 111', NULL, NULL, 39);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (80, 'länk 80', 'beskriving 80', NULL, NULL, 8);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (101, 'länk 101', 'beskriving 101', NULL, NULL, 29);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (76, 'länk 76', 'beskriving 76', NULL, NULL, 4);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (82, 'länk 82', 'beskriving 82', NULL, NULL, 10);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (87, 'länk 87', 'beskriving 87', NULL, NULL, 15);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (114, 'länk 114', 'beskriving 114', NULL, NULL, 2);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (132, 'länk 132', 'beskriving 132', NULL, NULL, 20);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (122, 'länk 122', 'beskriving 122', NULL, NULL, 10);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (92, 'länk 92', 'beskriving 92', NULL, NULL, 20);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (134, 'länk 134', 'beskriving 134', NULL, NULL, 22);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (73, 'länk 73', 'beskriving 73', NULL, NULL, 1);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (89, 'länk 89', 'beskriving 89', NULL, NULL, 17);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (136, 'länk 136', 'beskriving 136', NULL, NULL, 24);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (137, 'länk 137', 'beskriving 137', NULL, NULL, 25);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (138, 'länk 138', 'beskriving 138', NULL, NULL, 26);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (139, 'länk 139', 'beskriving 139', NULL, NULL, 27);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (140, 'länk 140', 'beskriving 140', NULL, NULL, 28);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (141, 'länk 141', 'beskriving 141', NULL, NULL, 29);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (142, 'länk 142', 'beskriving 142', NULL, NULL, 30);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (143, 'länk 143', 'beskriving 143', NULL, NULL, 31);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (144, 'länk 144', 'beskriving 144', NULL, NULL, 32);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (145, 'länk 145', 'beskriving 145', NULL, NULL, 33);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (146, 'länk 146', 'beskriving 146', NULL, NULL, 34);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (147, 'länk 147', 'beskriving 147', NULL, NULL, 35);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (148, 'länk 148', 'beskriving 148', NULL, NULL, 36);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (149, 'länk 149', 'beskriving 149', NULL, NULL, 37);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (150, 'länk 150', 'beskriving 150', NULL, NULL, 38);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (151, 'länk 151', 'beskriving 151', NULL, NULL, 39);
INSERT INTO miljovanliga_milstolpar.bilder (id, bild, beskrivning, boende_id, aktivitet_id, rum_id) VALUES (152, 'länk 152', 'beskriving 152', NULL, NULL, 40);


--
-- Data for Name: boende; Type: TABLE DATA; Schema: miljovanliga_milstolpar; Owner: postgres
--

INSERT INTO miljovanliga_milstolpar.boende (id, typ, namn, "snitt_co2_utsläpp", adress_id, email_id) VALUES (1, 'vandrarhem', 'Gröna skogen', 300, 16, 36);
INSERT INTO miljovanliga_milstolpar.boende (id, typ, namn, "snitt_co2_utsläpp", adress_id, email_id) VALUES (7, 'hotell', 'boende3', 900, 37, 37);
INSERT INTO miljovanliga_milstolpar.boende (id, typ, namn, "snitt_co2_utsläpp", adress_id, email_id) VALUES (18, 'tiny house', 'boende14', 400, 48, 44);
INSERT INTO miljovanliga_milstolpar.boende (id, typ, namn, "snitt_co2_utsläpp", adress_id, email_id) VALUES (15, 'vandrarhem', 'boende11', 700, 45, 43);
INSERT INTO miljovanliga_milstolpar.boende (id, typ, namn, "snitt_co2_utsläpp", adress_id, email_id) VALUES (20, 'tiny house', 'boende16', 600, 62, 45);
INSERT INTO miljovanliga_milstolpar.boende (id, typ, namn, "snitt_co2_utsläpp", adress_id, email_id) VALUES (16, 'vandrarhem', 'boende12', 500, 46, 43);
INSERT INTO miljovanliga_milstolpar.boende (id, typ, namn, "snitt_co2_utsläpp", adress_id, email_id) VALUES (3, 'hotell', 'Himlen', 600, 18, 36);
INSERT INTO miljovanliga_milstolpar.boende (id, typ, namn, "snitt_co2_utsläpp", adress_id, email_id) VALUES (8, 'hotell', 'boende4', 200, 38, 40);
INSERT INTO miljovanliga_milstolpar.boende (id, typ, namn, "snitt_co2_utsläpp", adress_id, email_id) VALUES (9, 'hotell', 'boende5', 600, 39, 40);
INSERT INTO miljovanliga_milstolpar.boende (id, typ, namn, "snitt_co2_utsläpp", adress_id, email_id) VALUES (17, 'tiny house', 'boende13', 200, 47, 44);
INSERT INTO miljovanliga_milstolpar.boende (id, typ, namn, "snitt_co2_utsläpp", adress_id, email_id) VALUES (6, 'hotell', 'boende2', 800, 36, 37);
INSERT INTO miljovanliga_milstolpar.boende (id, typ, namn, "snitt_co2_utsläpp", adress_id, email_id) VALUES (19, 'tiny house', 'boende15', 300, 61, 45);
INSERT INTO miljovanliga_milstolpar.boende (id, typ, namn, "snitt_co2_utsläpp", adress_id, email_id) VALUES (4, 'tiny house', 'Ekohuset', 200, 19, 36);
INSERT INTO miljovanliga_milstolpar.boende (id, typ, namn, "snitt_co2_utsläpp", adress_id, email_id) VALUES (2, 'hotell', 'Havet', 500, 17, 36);
INSERT INTO miljovanliga_milstolpar.boende (id, typ, namn, "snitt_co2_utsläpp", adress_id, email_id) VALUES (14, 'vandrarhem', 'boende10', 700, 44, 42);
INSERT INTO miljovanliga_milstolpar.boende (id, typ, namn, "snitt_co2_utsläpp", adress_id, email_id) VALUES (11, 'hotell', 'boende7', 600, 41, 41);
INSERT INTO miljovanliga_milstolpar.boende (id, typ, namn, "snitt_co2_utsläpp", adress_id, email_id) VALUES (13, 'vandrarhem', 'boende9', 300, 43, 42);
INSERT INTO miljovanliga_milstolpar.boende (id, typ, namn, "snitt_co2_utsläpp", adress_id, email_id) VALUES (12, 'vandrarhem', 'boende8', 400, 42, 42);
INSERT INTO miljovanliga_milstolpar.boende (id, typ, namn, "snitt_co2_utsläpp", adress_id, email_id) VALUES (10, 'hotell', 'boende6', 800, 40, 41);
INSERT INTO miljovanliga_milstolpar.boende (id, typ, namn, "snitt_co2_utsläpp", adress_id, email_id) VALUES (21, 'hotell', 'Nyttboende1', 100, 86, 40);
INSERT INTO miljovanliga_milstolpar.boende (id, typ, namn, "snitt_co2_utsläpp", adress_id, email_id) VALUES (5, 'hotell', 'Gröna hotellet', 500, 35, 37);


--
-- Data for Name: bokning; Type: TABLE DATA; Schema: miljovanliga_milstolpar; Owner: postgres
--

INSERT INTO miljovanliga_milstolpar.bokning (id, bokningstid, konto_id, betalning_id, status, speciella_behov, antal_person) VALUES (21, '2024-11-05 09:58:52.947225', 13, 21, 'kommande', NULL, 1);
INSERT INTO miljovanliga_milstolpar.bokning (id, bokningstid, konto_id, betalning_id, status, speciella_behov, antal_person) VALUES (3, '2024-10-31 18:37:55', 1, 14, 'pågående', 'behov 2', 1);
INSERT INTO miljovanliga_milstolpar.bokning (id, bokningstid, konto_id, betalning_id, status, speciella_behov, antal_person) VALUES (1, '2024-10-31 08:58:16', 4, 16, 'kommande', 'behov 1', 1);
INSERT INTO miljovanliga_milstolpar.bokning (id, bokningstid, konto_id, betalning_id, status, speciella_behov, antal_person) VALUES (20, '2024-01-02 11:58:21', 31, 20, 'avbokad', 'behov 6', 1);
INSERT INTO miljovanliga_milstolpar.bokning (id, bokningstid, konto_id, betalning_id, status, speciella_behov, antal_person) VALUES (14, '2024-08-31 18:41:38', 20, 3, 'kommande', 'behov 4', 1);
INSERT INTO miljovanliga_milstolpar.bokning (id, bokningstid, konto_id, betalning_id, status, speciella_behov, antal_person) VALUES (7, '2022-10-31 18:40:29', 7, 10, 'avslutad', 'rökfritt', 1);
INSERT INTO miljovanliga_milstolpar.bokning (id, bokningstid, konto_id, betalning_id, status, speciella_behov, antal_person) VALUES (17, '2024-10-29 15:09:10', 12, 19, 'pågående', 'behov 5', 1);
INSERT INTO miljovanliga_milstolpar.bokning (id, bokningstid, konto_id, betalning_id, status, speciella_behov, antal_person) VALUES (2, '2024-10-07 08:58:24', 5, 15, 'pågående', NULL, 1);
INSERT INTO miljovanliga_milstolpar.bokning (id, bokningstid, konto_id, betalning_id, status, speciella_behov, antal_person) VALUES (4, '2023-10-31 18:38:06', 2, 13, 'avslutad', NULL, 1);
INSERT INTO miljovanliga_milstolpar.bokning (id, bokningstid, konto_id, betalning_id, status, speciella_behov, antal_person) VALUES (8, '2023-08-29 18:40:38', 8, 9, 'avslutad', NULL, 1);
INSERT INTO miljovanliga_milstolpar.bokning (id, bokningstid, konto_id, betalning_id, status, speciella_behov, antal_person) VALUES (12, '2024-07-31 18:41:31', 11, 5, 'kommande', NULL, 2);
INSERT INTO miljovanliga_milstolpar.bokning (id, bokningstid, konto_id, betalning_id, status, speciella_behov, antal_person) VALUES (10, '2024-07-31 18:41:09', 10, 7, 'avslutad', NULL, 2);
INSERT INTO miljovanliga_milstolpar.bokning (id, bokningstid, konto_id, betalning_id, status, speciella_behov, antal_person) VALUES (6, '2024-10-31 18:38:21', 6, 11, 'pågående', NULL, 1);
INSERT INTO miljovanliga_milstolpar.bokning (id, bokningstid, konto_id, betalning_id, status, speciella_behov, antal_person) VALUES (15, '2024-08-05 18:41:44', 21, 2, 'kommande', NULL, 1);
INSERT INTO miljovanliga_milstolpar.bokning (id, bokningstid, konto_id, betalning_id, status, speciella_behov, antal_person) VALUES (5, '2024-09-30 18:38:12', 3, 12, 'kommande', NULL, 1);
INSERT INTO miljovanliga_milstolpar.bokning (id, bokningstid, konto_id, betalning_id, status, speciella_behov, antal_person) VALUES (18, '2024-10-29 15:09:47', 12, 17, 'kommande', NULL, 1);
INSERT INTO miljovanliga_milstolpar.bokning (id, bokningstid, konto_id, betalning_id, status, speciella_behov, antal_person) VALUES (9, '2022-12-30 18:40:50', 9, 8, 'avslutad', NULL, 1);
INSERT INTO miljovanliga_milstolpar.bokning (id, bokningstid, konto_id, betalning_id, status, speciella_behov, antal_person) VALUES (16, '2024-10-26 18:41:54', 22, 1, 'kommande', NULL, 1);
INSERT INTO miljovanliga_milstolpar.bokning (id, bokningstid, konto_id, betalning_id, status, speciella_behov, antal_person) VALUES (19, '2024-10-30 15:10:02', 12, 18, 'kommande', NULL, 1);


--
-- Data for Name: bokning_x_aktivitet; Type: TABLE DATA; Schema: miljovanliga_milstolpar; Owner: postgres
--

INSERT INTO miljovanliga_milstolpar.bokning_x_aktivitet (id, starttid, sluttid, bokning_id, aktivitet_id, pris) VALUES (2, '2024-10-31 19:42:00', '2024-11-03 19:42:03', 2, 15, 2500);
INSERT INTO miljovanliga_milstolpar.bokning_x_aktivitet (id, starttid, sluttid, bokning_id, aktivitet_id, pris) VALUES (3, '2024-10-31 19:41:51', '2024-11-04 19:42:23', 3, 14, 8000);
INSERT INTO miljovanliga_milstolpar.bokning_x_aktivitet (id, starttid, sluttid, bokning_id, aktivitet_id, pris) VALUES (1, '2024-12-31 19:15:07', '2025-01-02 19:41:21', 1, 16, 5000);
INSERT INTO miljovanliga_milstolpar.bokning_x_aktivitet (id, starttid, sluttid, bokning_id, aktivitet_id, pris) VALUES (4, '2024-12-10 23:02:00', '2024-12-12 23:02:12', 16, 13, 3200);
INSERT INTO miljovanliga_milstolpar.bokning_x_aktivitet (id, starttid, sluttid, bokning_id, aktivitet_id, pris) VALUES (5, '2024-11-25 23:20:01', '2024-11-26 23:20:19', 14, 12, 2800);
INSERT INTO miljovanliga_milstolpar.bokning_x_aktivitet (id, starttid, sluttid, bokning_id, aktivitet_id, pris) VALUES (7, '2024-01-14 14:29:47', '2024-01-14 16:30:13', 10, 10, 180);
INSERT INTO miljovanliga_milstolpar.bokning_x_aktivitet (id, starttid, sluttid, bokning_id, aktivitet_id, pris) VALUES (6, '2024-01-15 13:30:26', '2024-01-15 15:31:00', 10, 11, 300);
INSERT INTO miljovanliga_milstolpar.bokning_x_aktivitet (id, starttid, sluttid, bokning_id, aktivitet_id, pris) VALUES (8, '2024-12-02 16:41:59', '2024-12-02 20:42:26', 19, 17, 200);


--
-- Data for Name: bokning_x_boende; Type: TABLE DATA; Schema: miljovanliga_milstolpar; Owner: postgres
--

INSERT INTO miljovanliga_milstolpar.bokning_x_boende (id, incheckning, utcheckning, "antal_nätter", rum_id, bokning_id, pris) VALUES (1, '2023-11-05 14:00:00', '2023-11-10 12:00:00', 5, 1, 4, 7000);
INSERT INTO miljovanliga_milstolpar.bokning_x_boende (id, incheckning, utcheckning, "antal_nätter", rum_id, bokning_id, pris) VALUES (5, '2025-01-02 14:00:00', '2025-01-10 12:00:00', 8, 5, 12, 14000);
INSERT INTO miljovanliga_milstolpar.bokning_x_boende (id, incheckning, utcheckning, "antal_nätter", rum_id, bokning_id, pris) VALUES (4, '2024-12-01 14:00:00', '2024-12-03 12:00:00', 2, 4, 15, 7200);
INSERT INTO miljovanliga_milstolpar.bokning_x_boende (id, incheckning, utcheckning, "antal_nätter", rum_id, bokning_id, pris) VALUES (2, '2024-10-31 14:00:00', '2024-11-06 12:00:00', 6, 2, 6, 9000);
INSERT INTO miljovanliga_milstolpar.bokning_x_boende (id, incheckning, utcheckning, "antal_nätter", rum_id, bokning_id, pris) VALUES (6, '2024-12-01 14:00:00', '2024-12-05 12:00:00', 4, 6, 17, 10400);
INSERT INTO miljovanliga_milstolpar.bokning_x_boende (id, incheckning, utcheckning, "antal_nätter", rum_id, bokning_id, pris) VALUES (3, '2024-11-01 14:00:00', '2024-11-02 12:00:00', 1, 3, 5, 6000);
INSERT INTO miljovanliga_milstolpar.bokning_x_boende (id, incheckning, utcheckning, "antal_nätter", rum_id, bokning_id, pris) VALUES (7, '2024-12-01 14:00:00', '2024-12-05 12:00:00', 4, 24, 21, 5800);


--
-- Data for Name: bokning_x_resepaket; Type: TABLE DATA; Schema: miljovanliga_milstolpar; Owner: postgres
--

INSERT INTO miljovanliga_milstolpar.bokning_x_resepaket (id, bokning_id, bokning_x_boende_id, bokning_x_transport_id, bokning_x_aktivitet_id) VALUES (3, 10, NULL, NULL, 7);
INSERT INTO miljovanliga_milstolpar.bokning_x_resepaket (id, bokning_id, bokning_x_boende_id, bokning_x_transport_id, bokning_x_aktivitet_id) VALUES (2, 12, NULL, 6, NULL);
INSERT INTO miljovanliga_milstolpar.bokning_x_resepaket (id, bokning_id, bokning_x_boende_id, bokning_x_transport_id, bokning_x_aktivitet_id) VALUES (1, 12, NULL, 5, NULL);
INSERT INTO miljovanliga_milstolpar.bokning_x_resepaket (id, bokning_id, bokning_x_boende_id, bokning_x_transport_id, bokning_x_aktivitet_id) VALUES (5, 12, 5, NULL, NULL);
INSERT INTO miljovanliga_milstolpar.bokning_x_resepaket (id, bokning_id, bokning_x_boende_id, bokning_x_transport_id, bokning_x_aktivitet_id) VALUES (4, 10, NULL, 4, NULL);
INSERT INTO miljovanliga_milstolpar.bokning_x_resepaket (id, bokning_id, bokning_x_boende_id, bokning_x_transport_id, bokning_x_aktivitet_id) VALUES (6, 10, NULL, NULL, 6);


--
-- Data for Name: bokning_x_transport; Type: TABLE DATA; Schema: miljovanliga_milstolpar; Owner: postgres
--

INSERT INTO miljovanliga_milstolpar.bokning_x_transport (id, ankomsttid, "avgångstid", bokning_id, transport_id, pris) VALUES (1, '2022-11-06 14:50:06', '2022-11-06 09:50:57', 7, 1, 2500);
INSERT INTO miljovanliga_milstolpar.bokning_x_transport (id, ankomsttid, "avgångstid", bokning_id, transport_id, pris) VALUES (2, '2023-09-10 19:54:22', '2023-09-10 17:57:56', 8, 3, 1500);
INSERT INTO miljovanliga_milstolpar.bokning_x_transport (id, ankomsttid, "avgångstid", bokning_id, transport_id, pris) VALUES (3, '2023-01-02 19:55:54', '2023-01-01 21:59:19', 9, 8, 2800);
INSERT INTO miljovanliga_milstolpar.bokning_x_transport (id, ankomsttid, "avgångstid", bokning_id, transport_id, pris) VALUES (4, '2024-01-14 13:22:45', '2024-01-13 13:22:56', 10, 7, 8000);
INSERT INTO miljovanliga_milstolpar.bokning_x_transport (id, ankomsttid, "avgångstid", bokning_id, transport_id, pris) VALUES (5, '2025-01-02 13:38:37', '2025-01-01 13:38:50', 12, 5, 350);
INSERT INTO miljovanliga_milstolpar.bokning_x_transport (id, ankomsttid, "avgångstid", bokning_id, transport_id, pris) VALUES (6, '2025-01-10 13:42:14', '2025-01-09 13:42:25', 12, 6, 350);
INSERT INTO miljovanliga_milstolpar.bokning_x_transport (id, ankomsttid, "avgångstid", bokning_id, transport_id, pris) VALUES (7, '2024-12-01 15:40:34', '2024-12-01 11:40:45', 18, 11, 1200);


--
-- Data for Name: email; Type: TABLE DATA; Schema: miljovanliga_milstolpar; Owner: postgres
--

INSERT INTO miljovanliga_milstolpar.email (id, mailadress, "företagsverksamhet") VALUES (17, 'transport2@gmail.com', 'transport');
INSERT INTO miljovanliga_milstolpar.email (id, mailadress, "företagsverksamhet") VALUES (16, 'transport1@gmail.com', 'transport');
INSERT INTO miljovanliga_milstolpar.email (id, mailadress, "företagsverksamhet") VALUES (41, 'gfdgdssd@gmail.com', 'boende');
INSERT INTO miljovanliga_milstolpar.email (id, mailadress, "företagsverksamhet") VALUES (35, 'kjhdnaskfns64@gmail.com', 'transport');
INSERT INTO miljovanliga_milstolpar.email (id, mailadress, "företagsverksamhet") VALUES (45, 'vsdfddf5b25d15@gmail.com', 'boende');
INSERT INTO miljovanliga_milstolpar.email (id, mailadress, "företagsverksamhet") VALUES (44, 'dwafsds@gmail.com', 'boende');
INSERT INTO miljovanliga_milstolpar.email (id, mailadress, "företagsverksamhet") VALUES (43, 'afed9654@gmail.com', 'boende');
INSERT INTO miljovanliga_milstolpar.email (id, mailadress, "företagsverksamhet") VALUES (34, 'admkjbf216@gmail.com', 'transport');
INSERT INTO miljovanliga_milstolpar.email (id, mailadress, "företagsverksamhet") VALUES (40, 'kcnskjfvnk@gmail.com', 'boende');
INSERT INTO miljovanliga_milstolpar.email (id, mailadress, "företagsverksamhet") VALUES (42, 'fsd952@gmail.com', 'boende');
INSERT INTO miljovanliga_milstolpar.email (id, mailadress, "företagsverksamhet") VALUES (37, 'wekdhweofj@gmail.com', 'boende');
INSERT INTO miljovanliga_milstolpar.email (id, mailadress, "företagsverksamhet") VALUES (36, 'kjdhfiwndfjkn@gmail.com', 'boende');
INSERT INTO miljovanliga_milstolpar.email (id, mailadress, "företagsverksamhet") VALUES (39, 'cjakbjkbnk@gmail.com', 'aktivitet');
INSERT INTO miljovanliga_milstolpar.email (id, mailadress, "företagsverksamhet") VALUES (38, 'dfanjkwbnfjk@gmail.com', 'aktivitet');
INSERT INTO miljovanliga_milstolpar.email (id, mailadress, "företagsverksamhet") VALUES (18, 'aktivitet1@gmail.com', 'aktivitet');
INSERT INTO miljovanliga_milstolpar.email (id, mailadress, "företagsverksamhet") VALUES (46, 'jhbkhbkjnbjknjkn@gmail.com', NULL);
INSERT INTO miljovanliga_milstolpar.email (id, mailadress, "företagsverksamhet") VALUES (12, 'support@environmentaladvocates.org', 'kund');
INSERT INTO miljovanliga_milstolpar.email (id, mailadress, "företagsverksamhet") VALUES (8, 'inquiries@climateactionnetwork.org', 'kund');
INSERT INTO miljovanliga_milstolpar.email (id, mailadress, "företagsverksamhet") VALUES (20, 'abc@gmail.com', 'kund');
INSERT INTO miljovanliga_milstolpar.email (id, mailadress, "företagsverksamhet") VALUES (25, 'idnwekfn@gmail.com', 'kund');
INSERT INTO miljovanliga_milstolpar.email (id, mailadress, "företagsverksamhet") VALUES (29, 'dmfomnfko@gmail.com', 'kund');
INSERT INTO miljovanliga_milstolpar.email (id, mailadress, "företagsverksamhet") VALUES (28, 'fdv1df51@gmail.com', 'kund');
INSERT INTO miljovanliga_milstolpar.email (id, mailadress, "företagsverksamhet") VALUES (4, 'contact@ecotravelsolutions.com', 'kund');
INSERT INTO miljovanliga_milstolpar.email (id, mailadress, "företagsverksamhet") VALUES (13, 'contact@globalgreenthumb.com', 'kund');
INSERT INTO miljovanliga_milstolpar.email (id, mailadress, "företagsverksamhet") VALUES (3, 'info@cleanenergyfuture.org', 'kund');
INSERT INTO miljovanliga_milstolpar.email (id, mailadress, "företagsverksamhet") VALUES (32, 'wedfknwkenmfoim@gmail.com', 'kund');
INSERT INTO miljovanliga_milstolpar.email (id, mailadress, "företagsverksamhet") VALUES (15, 'hello@wildlifeconservation.org', 'kund');
INSERT INTO miljovanliga_milstolpar.email (id, mailadress, "företagsverksamhet") VALUES (1, 'sustainability@greenplanet.com', 'kund');
INSERT INTO miljovanliga_milstolpar.email (id, mailadress, "företagsverksamhet") VALUES (11, 'hello@renewablepathways.com', 'kund');
INSERT INTO miljovanliga_milstolpar.email (id, mailadress, "företagsverksamhet") VALUES (19, 'jninjnu@gmail.com', 'kund');
INSERT INTO miljovanliga_milstolpar.email (id, mailadress, "företagsverksamhet") VALUES (21, 'bfhasb@gmail.com', 'kund');
INSERT INTO miljovanliga_milstolpar.email (id, mailadress, "företagsverksamhet") VALUES (23, 'bsknlskdnd@gmail.com', 'kund');
INSERT INTO miljovanliga_milstolpar.email (id, mailadress, "företagsverksamhet") VALUES (9, 'team@greenbusinessalliance.com', 'kund');
INSERT INTO miljovanliga_milstolpar.email (id, mailadress, "företagsverksamhet") VALUES (10, 'info@conservationefforts.org', 'kund');
INSERT INTO miljovanliga_milstolpar.email (id, mailadress, "företagsverksamhet") VALUES (14, 'info@greeninnovationlab.com', 'kund');
INSERT INTO miljovanliga_milstolpar.email (id, mailadress, "företagsverksamhet") VALUES (33, 'klajnfkn@gmail.com', 'kund');
INSERT INTO miljovanliga_milstolpar.email (id, mailadress, "företagsverksamhet") VALUES (2, 'ecofriendly@earthwise.org', 'kund');
INSERT INTO miljovanliga_milstolpar.email (id, mailadress, "företagsverksamhet") VALUES (22, 'dsfsf@gmail.com', 'kund');
INSERT INTO miljovanliga_milstolpar.email (id, mailadress, "företagsverksamhet") VALUES (30, 'iojeoifmklwr@gmail.com', 'kund');
INSERT INTO miljovanliga_milstolpar.email (id, mailadress, "företagsverksamhet") VALUES (27, 'pdkfokwsm@gmail.com', 'kund');
INSERT INTO miljovanliga_milstolpar.email (id, mailadress, "företagsverksamhet") VALUES (6, 'support@zerowasteinitiative.com', 'kund');
INSERT INTO miljovanliga_milstolpar.email (id, mailadress, "företagsverksamhet") VALUES (5, 'hello@recyclemore.org', 'kund');
INSERT INTO miljovanliga_milstolpar.email (id, mailadress, "företagsverksamhet") VALUES (31, 'kjnmklamdolw@gmail.com', 'kund');
INSERT INTO miljovanliga_milstolpar.email (id, mailadress, "företagsverksamhet") VALUES (7, 'connect@sustainablelivinghub.com', 'kund');
INSERT INTO miljovanliga_milstolpar.email (id, mailadress, "företagsverksamhet") VALUES (26, 'joknrfo@gmail.com', 'kund');
INSERT INTO miljovanliga_milstolpar.email (id, mailadress, "företagsverksamhet") VALUES (24, 'jiamwiwmw@gmail.com', 'kund');
INSERT INTO miljovanliga_milstolpar.email (id, mailadress, "företagsverksamhet") VALUES (47, 'Tannz123@gmail.com', 'kund');


--
-- Data for Name: faciliteter_boende; Type: TABLE DATA; Schema: miljovanliga_milstolpar; Owner: postgres
--

INSERT INTO miljovanliga_milstolpar.faciliteter_boende (id, solpanel, "energisnål_uppvärmning", wifi, regnvattenuppsamling, "närodlad_mat", lokala_samarbeten, vegansk_mat, "miljöcertifierad", vegetarisk_mat, boende_id) VALUES (14, false, false, true, false, true, false, true, true, false, 7);
INSERT INTO miljovanliga_milstolpar.faciliteter_boende (id, solpanel, "energisnål_uppvärmning", wifi, regnvattenuppsamling, "närodlad_mat", lokala_samarbeten, vegansk_mat, "miljöcertifierad", vegetarisk_mat, boende_id) VALUES (1, true, false, true, false, true, true, false, true, true, 20);
INSERT INTO miljovanliga_milstolpar.faciliteter_boende (id, solpanel, "energisnål_uppvärmning", wifi, regnvattenuppsamling, "närodlad_mat", lokala_samarbeten, vegansk_mat, "miljöcertifierad", vegetarisk_mat, boende_id) VALUES (7, true, true, true, true, true, true, true, true, true, 14);
INSERT INTO miljovanliga_milstolpar.faciliteter_boende (id, solpanel, "energisnål_uppvärmning", wifi, regnvattenuppsamling, "närodlad_mat", lokala_samarbeten, vegansk_mat, "miljöcertifierad", vegetarisk_mat, boende_id) VALUES (18, true, false, true, true, true, true, true, true, true, 3);
INSERT INTO miljovanliga_milstolpar.faciliteter_boende (id, solpanel, "energisnål_uppvärmning", wifi, regnvattenuppsamling, "närodlad_mat", lokala_samarbeten, vegansk_mat, "miljöcertifierad", vegetarisk_mat, boende_id) VALUES (5, true, true, true, false, true, true, true, true, true, 16);
INSERT INTO miljovanliga_milstolpar.faciliteter_boende (id, solpanel, "energisnål_uppvärmning", wifi, regnvattenuppsamling, "närodlad_mat", lokala_samarbeten, vegansk_mat, "miljöcertifierad", vegetarisk_mat, boende_id) VALUES (11, false, true, false, true, true, true, true, true, true, 10);
INSERT INTO miljovanliga_milstolpar.faciliteter_boende (id, solpanel, "energisnål_uppvärmning", wifi, regnvattenuppsamling, "närodlad_mat", lokala_samarbeten, vegansk_mat, "miljöcertifierad", vegetarisk_mat, boende_id) VALUES (9, true, true, false, true, true, true, true, true, false, 12);
INSERT INTO miljovanliga_milstolpar.faciliteter_boende (id, solpanel, "energisnål_uppvärmning", wifi, regnvattenuppsamling, "närodlad_mat", lokala_samarbeten, vegansk_mat, "miljöcertifierad", vegetarisk_mat, boende_id) VALUES (19, true, true, true, true, true, true, true, true, true, 2);
INSERT INTO miljovanliga_milstolpar.faciliteter_boende (id, solpanel, "energisnål_uppvärmning", wifi, regnvattenuppsamling, "närodlad_mat", lokala_samarbeten, vegansk_mat, "miljöcertifierad", vegetarisk_mat, boende_id) VALUES (16, true, true, true, true, true, true, true, true, true, 5);
INSERT INTO miljovanliga_milstolpar.faciliteter_boende (id, solpanel, "energisnål_uppvärmning", wifi, regnvattenuppsamling, "närodlad_mat", lokala_samarbeten, vegansk_mat, "miljöcertifierad", vegetarisk_mat, boende_id) VALUES (15, false, false, true, false, true, true, false, true, true, 6);
INSERT INTO miljovanliga_milstolpar.faciliteter_boende (id, solpanel, "energisnål_uppvärmning", wifi, regnvattenuppsamling, "närodlad_mat", lokala_samarbeten, vegansk_mat, "miljöcertifierad", vegetarisk_mat, boende_id) VALUES (3, true, true, true, true, true, true, true, true, false, 18);
INSERT INTO miljovanliga_milstolpar.faciliteter_boende (id, solpanel, "energisnål_uppvärmning", wifi, regnvattenuppsamling, "närodlad_mat", lokala_samarbeten, vegansk_mat, "miljöcertifierad", vegetarisk_mat, boende_id) VALUES (2, true, true, true, true, true, true, true, true, true, 19);
INSERT INTO miljovanliga_milstolpar.faciliteter_boende (id, solpanel, "energisnål_uppvärmning", wifi, regnvattenuppsamling, "närodlad_mat", lokala_samarbeten, vegansk_mat, "miljöcertifierad", vegetarisk_mat, boende_id) VALUES (13, false, false, true, true, true, true, false, true, true, 8);
INSERT INTO miljovanliga_milstolpar.faciliteter_boende (id, solpanel, "energisnål_uppvärmning", wifi, regnvattenuppsamling, "närodlad_mat", lokala_samarbeten, vegansk_mat, "miljöcertifierad", vegetarisk_mat, boende_id) VALUES (8, true, true, true, true, false, false, true, true, true, 13);
INSERT INTO miljovanliga_milstolpar.faciliteter_boende (id, solpanel, "energisnål_uppvärmning", wifi, regnvattenuppsamling, "närodlad_mat", lokala_samarbeten, vegansk_mat, "miljöcertifierad", vegetarisk_mat, boende_id) VALUES (6, true, false, true, true, true, true, false, true, true, 15);
INSERT INTO miljovanliga_milstolpar.faciliteter_boende (id, solpanel, "energisnål_uppvärmning", wifi, regnvattenuppsamling, "närodlad_mat", lokala_samarbeten, vegansk_mat, "miljöcertifierad", vegetarisk_mat, boende_id) VALUES (17, true, true, true, true, true, true, true, true, false, 4);
INSERT INTO miljovanliga_milstolpar.faciliteter_boende (id, solpanel, "energisnål_uppvärmning", wifi, regnvattenuppsamling, "närodlad_mat", lokala_samarbeten, vegansk_mat, "miljöcertifierad", vegetarisk_mat, boende_id) VALUES (12, true, true, true, false, true, true, true, true, true, 9);
INSERT INTO miljovanliga_milstolpar.faciliteter_boende (id, solpanel, "energisnål_uppvärmning", wifi, regnvattenuppsamling, "närodlad_mat", lokala_samarbeten, vegansk_mat, "miljöcertifierad", vegetarisk_mat, boende_id) VALUES (10, true, true, true, true, true, false, false, true, true, 11);
INSERT INTO miljovanliga_milstolpar.faciliteter_boende (id, solpanel, "energisnål_uppvärmning", wifi, regnvattenuppsamling, "närodlad_mat", lokala_samarbeten, vegansk_mat, "miljöcertifierad", vegetarisk_mat, boende_id) VALUES (4, true, true, true, true, true, true, true, true, false, 17);
INSERT INTO miljovanliga_milstolpar.faciliteter_boende (id, solpanel, "energisnål_uppvärmning", wifi, regnvattenuppsamling, "närodlad_mat", lokala_samarbeten, vegansk_mat, "miljöcertifierad", vegetarisk_mat, boende_id) VALUES (20, true, true, true, true, true, true, true, true, true, 1);


--
-- Data for Name: faciliteter_rum; Type: TABLE DATA; Schema: miljovanliga_milstolpar; Owner: postgres
--

INSERT INTO miljovanliga_milstolpar.faciliteter_rum (id, vattensparande_funktioner, "panoramafönster", hvac, "lågenergi_elektronik", "timer_på_belysning", "tidsstyrd_uppvärmning", "miljövänliga_möbler", "kassaskåp", kyl, badkar, dusch, tv, minibar) VALUES (24, true, true, true, true, true, true, true, true, true, true, true, true, true);
INSERT INTO miljovanliga_milstolpar.faciliteter_rum (id, vattensparande_funktioner, "panoramafönster", hvac, "lågenergi_elektronik", "timer_på_belysning", "tidsstyrd_uppvärmning", "miljövänliga_möbler", "kassaskåp", kyl, badkar, dusch, tv, minibar) VALUES (28, true, true, true, true, true, true, true, true, true, true, true, true, true);
INSERT INTO miljovanliga_milstolpar.faciliteter_rum (id, vattensparande_funktioner, "panoramafönster", hvac, "lågenergi_elektronik", "timer_på_belysning", "tidsstyrd_uppvärmning", "miljövänliga_möbler", "kassaskåp", kyl, badkar, dusch, tv, minibar) VALUES (38, true, true, true, true, true, true, true, true, true, true, true, true, true);
INSERT INTO miljovanliga_milstolpar.faciliteter_rum (id, vattensparande_funktioner, "panoramafönster", hvac, "lågenergi_elektronik", "timer_på_belysning", "tidsstyrd_uppvärmning", "miljövänliga_möbler", "kassaskåp", kyl, badkar, dusch, tv, minibar) VALUES (37, true, true, true, true, true, true, true, true, false, false, true, true, true);
INSERT INTO miljovanliga_milstolpar.faciliteter_rum (id, vattensparande_funktioner, "panoramafönster", hvac, "lågenergi_elektronik", "timer_på_belysning", "tidsstyrd_uppvärmning", "miljövänliga_möbler", "kassaskåp", kyl, badkar, dusch, tv, minibar) VALUES (12, true, true, true, true, true, true, true, true, true, false, true, true, true);
INSERT INTO miljovanliga_milstolpar.faciliteter_rum (id, vattensparande_funktioner, "panoramafönster", hvac, "lågenergi_elektronik", "timer_på_belysning", "tidsstyrd_uppvärmning", "miljövänliga_möbler", "kassaskåp", kyl, badkar, dusch, tv, minibar) VALUES (26, true, true, true, true, true, false, true, false, true, true, true, true, true);
INSERT INTO miljovanliga_milstolpar.faciliteter_rum (id, vattensparande_funktioner, "panoramafönster", hvac, "lågenergi_elektronik", "timer_på_belysning", "tidsstyrd_uppvärmning", "miljövänliga_möbler", "kassaskåp", kyl, badkar, dusch, tv, minibar) VALUES (39, true, true, true, true, true, true, true, false, false, true, true, true, true);
INSERT INTO miljovanliga_milstolpar.faciliteter_rum (id, vattensparande_funktioner, "panoramafönster", hvac, "lågenergi_elektronik", "timer_på_belysning", "tidsstyrd_uppvärmning", "miljövänliga_möbler", "kassaskåp", kyl, badkar, dusch, tv, minibar) VALUES (29, true, false, true, true, true, true, true, true, false, true, true, true, false);
INSERT INTO miljovanliga_milstolpar.faciliteter_rum (id, vattensparande_funktioner, "panoramafönster", hvac, "lågenergi_elektronik", "timer_på_belysning", "tidsstyrd_uppvärmning", "miljövänliga_möbler", "kassaskåp", kyl, badkar, dusch, tv, minibar) VALUES (25, true, true, true, false, true, true, true, true, true, true, true, true, true);
INSERT INTO miljovanliga_milstolpar.faciliteter_rum (id, vattensparande_funktioner, "panoramafönster", hvac, "lågenergi_elektronik", "timer_på_belysning", "tidsstyrd_uppvärmning", "miljövänliga_möbler", "kassaskåp", kyl, badkar, dusch, tv, minibar) VALUES (34, true, false, true, true, true, true, true, true, true, true, true, true, true);
INSERT INTO miljovanliga_milstolpar.faciliteter_rum (id, vattensparande_funktioner, "panoramafönster", hvac, "lågenergi_elektronik", "timer_på_belysning", "tidsstyrd_uppvärmning", "miljövänliga_möbler", "kassaskåp", kyl, badkar, dusch, tv, minibar) VALUES (15, true, true, true, true, true, false, true, true, true, false, true, true, true);
INSERT INTO miljovanliga_milstolpar.faciliteter_rum (id, vattensparande_funktioner, "panoramafönster", hvac, "lågenergi_elektronik", "timer_på_belysning", "tidsstyrd_uppvärmning", "miljövänliga_möbler", "kassaskåp", kyl, badkar, dusch, tv, minibar) VALUES (20, true, true, true, true, true, true, true, false, false, true, true, true, true);
INSERT INTO miljovanliga_milstolpar.faciliteter_rum (id, vattensparande_funktioner, "panoramafönster", hvac, "lågenergi_elektronik", "timer_på_belysning", "tidsstyrd_uppvärmning", "miljövänliga_möbler", "kassaskåp", kyl, badkar, dusch, tv, minibar) VALUES (21, false, false, true, true, false, true, true, true, true, true, true, true, true);
INSERT INTO miljovanliga_milstolpar.faciliteter_rum (id, vattensparande_funktioner, "panoramafönster", hvac, "lågenergi_elektronik", "timer_på_belysning", "tidsstyrd_uppvärmning", "miljövänliga_möbler", "kassaskåp", kyl, badkar, dusch, tv, minibar) VALUES (40, true, true, true, true, true, true, true, true, true, false, true, true, true);
INSERT INTO miljovanliga_milstolpar.faciliteter_rum (id, vattensparande_funktioner, "panoramafönster", hvac, "lågenergi_elektronik", "timer_på_belysning", "tidsstyrd_uppvärmning", "miljövänliga_möbler", "kassaskåp", kyl, badkar, dusch, tv, minibar) VALUES (3, true, true, true, true, true, true, true, true, false, true, true, true, true);
INSERT INTO miljovanliga_milstolpar.faciliteter_rum (id, vattensparande_funktioner, "panoramafönster", hvac, "lågenergi_elektronik", "timer_på_belysning", "tidsstyrd_uppvärmning", "miljövänliga_möbler", "kassaskåp", kyl, badkar, dusch, tv, minibar) VALUES (5, true, true, true, true, true, true, true, true, false, true, true, true, true);
INSERT INTO miljovanliga_milstolpar.faciliteter_rum (id, vattensparande_funktioner, "panoramafönster", hvac, "lågenergi_elektronik", "timer_på_belysning", "tidsstyrd_uppvärmning", "miljövänliga_möbler", "kassaskåp", kyl, badkar, dusch, tv, minibar) VALUES (10, false, true, true, true, false, true, true, true, true, true, true, true, true);
INSERT INTO miljovanliga_milstolpar.faciliteter_rum (id, vattensparande_funktioner, "panoramafönster", hvac, "lågenergi_elektronik", "timer_på_belysning", "tidsstyrd_uppvärmning", "miljövänliga_möbler", "kassaskåp", kyl, badkar, dusch, tv, minibar) VALUES (31, false, true, true, true, true, true, true, true, true, true, true, true, true);
INSERT INTO miljovanliga_milstolpar.faciliteter_rum (id, vattensparande_funktioner, "panoramafönster", hvac, "lågenergi_elektronik", "timer_på_belysning", "tidsstyrd_uppvärmning", "miljövänliga_möbler", "kassaskåp", kyl, badkar, dusch, tv, minibar) VALUES (30, true, true, true, false, true, true, true, true, true, false, true, true, true);
INSERT INTO miljovanliga_milstolpar.faciliteter_rum (id, vattensparande_funktioner, "panoramafönster", hvac, "lågenergi_elektronik", "timer_på_belysning", "tidsstyrd_uppvärmning", "miljövänliga_möbler", "kassaskåp", kyl, badkar, dusch, tv, minibar) VALUES (2, true, false, false, true, true, true, true, true, true, true, false, true, true);
INSERT INTO miljovanliga_milstolpar.faciliteter_rum (id, vattensparande_funktioner, "panoramafönster", hvac, "lågenergi_elektronik", "timer_på_belysning", "tidsstyrd_uppvärmning", "miljövänliga_möbler", "kassaskåp", kyl, badkar, dusch, tv, minibar) VALUES (7, false, true, true, true, true, true, true, true, true, true, true, true, false);
INSERT INTO miljovanliga_milstolpar.faciliteter_rum (id, vattensparande_funktioner, "panoramafönster", hvac, "lågenergi_elektronik", "timer_på_belysning", "tidsstyrd_uppvärmning", "miljövänliga_möbler", "kassaskåp", kyl, badkar, dusch, tv, minibar) VALUES (22, true, true, true, true, true, true, true, true, true, true, true, true, false);
INSERT INTO miljovanliga_milstolpar.faciliteter_rum (id, vattensparande_funktioner, "panoramafönster", hvac, "lågenergi_elektronik", "timer_på_belysning", "tidsstyrd_uppvärmning", "miljövänliga_möbler", "kassaskåp", kyl, badkar, dusch, tv, minibar) VALUES (14, true, true, true, true, true, true, true, true, false, true, true, true, true);
INSERT INTO miljovanliga_milstolpar.faciliteter_rum (id, vattensparande_funktioner, "panoramafönster", hvac, "lågenergi_elektronik", "timer_på_belysning", "tidsstyrd_uppvärmning", "miljövänliga_möbler", "kassaskåp", kyl, badkar, dusch, tv, minibar) VALUES (27, false, true, true, true, true, true, true, true, true, false, true, true, true);
INSERT INTO miljovanliga_milstolpar.faciliteter_rum (id, vattensparande_funktioner, "panoramafönster", hvac, "lågenergi_elektronik", "timer_på_belysning", "tidsstyrd_uppvärmning", "miljövänliga_möbler", "kassaskåp", kyl, badkar, dusch, tv, minibar) VALUES (13, true, false, true, true, true, true, true, true, true, true, true, true, true);
INSERT INTO miljovanliga_milstolpar.faciliteter_rum (id, vattensparande_funktioner, "panoramafönster", hvac, "lågenergi_elektronik", "timer_på_belysning", "tidsstyrd_uppvärmning", "miljövänliga_möbler", "kassaskåp", kyl, badkar, dusch, tv, minibar) VALUES (35, false, true, true, true, true, true, true, true, false, true, true, true, false);
INSERT INTO miljovanliga_milstolpar.faciliteter_rum (id, vattensparande_funktioner, "panoramafönster", hvac, "lågenergi_elektronik", "timer_på_belysning", "tidsstyrd_uppvärmning", "miljövänliga_möbler", "kassaskåp", kyl, badkar, dusch, tv, minibar) VALUES (32, true, true, true, true, true, false, true, true, true, true, true, true, true);
INSERT INTO miljovanliga_milstolpar.faciliteter_rum (id, vattensparande_funktioner, "panoramafönster", hvac, "lågenergi_elektronik", "timer_på_belysning", "tidsstyrd_uppvärmning", "miljövänliga_möbler", "kassaskåp", kyl, badkar, dusch, tv, minibar) VALUES (16, true, true, true, true, true, true, true, false, true, true, true, true, true);
INSERT INTO miljovanliga_milstolpar.faciliteter_rum (id, vattensparande_funktioner, "panoramafönster", hvac, "lågenergi_elektronik", "timer_på_belysning", "tidsstyrd_uppvärmning", "miljövänliga_möbler", "kassaskåp", kyl, badkar, dusch, tv, minibar) VALUES (1, true, true, true, true, true, false, true, true, true, false, true, true, true);
INSERT INTO miljovanliga_milstolpar.faciliteter_rum (id, vattensparande_funktioner, "panoramafönster", hvac, "lågenergi_elektronik", "timer_på_belysning", "tidsstyrd_uppvärmning", "miljövänliga_möbler", "kassaskåp", kyl, badkar, dusch, tv, minibar) VALUES (11, false, true, true, true, true, true, true, false, true, true, true, true, false);
INSERT INTO miljovanliga_milstolpar.faciliteter_rum (id, vattensparande_funktioner, "panoramafönster", hvac, "lågenergi_elektronik", "timer_på_belysning", "tidsstyrd_uppvärmning", "miljövänliga_möbler", "kassaskåp", kyl, badkar, dusch, tv, minibar) VALUES (4, true, true, true, false, true, true, true, true, true, true, true, true, true);
INSERT INTO miljovanliga_milstolpar.faciliteter_rum (id, vattensparande_funktioner, "panoramafönster", hvac, "lågenergi_elektronik", "timer_på_belysning", "tidsstyrd_uppvärmning", "miljövänliga_möbler", "kassaskåp", kyl, badkar, dusch, tv, minibar) VALUES (8, true, false, true, true, true, true, true, false, true, true, true, true, true);
INSERT INTO miljovanliga_milstolpar.faciliteter_rum (id, vattensparande_funktioner, "panoramafönster", hvac, "lågenergi_elektronik", "timer_på_belysning", "tidsstyrd_uppvärmning", "miljövänliga_möbler", "kassaskåp", kyl, badkar, dusch, tv, minibar) VALUES (23, true, true, true, true, true, true, true, true, true, false, true, true, true);
INSERT INTO miljovanliga_milstolpar.faciliteter_rum (id, vattensparande_funktioner, "panoramafönster", hvac, "lågenergi_elektronik", "timer_på_belysning", "tidsstyrd_uppvärmning", "miljövänliga_möbler", "kassaskåp", kyl, badkar, dusch, tv, minibar) VALUES (17, false, true, true, false, true, true, true, true, true, true, true, true, true);
INSERT INTO miljovanliga_milstolpar.faciliteter_rum (id, vattensparande_funktioner, "panoramafönster", hvac, "lågenergi_elektronik", "timer_på_belysning", "tidsstyrd_uppvärmning", "miljövänliga_möbler", "kassaskåp", kyl, badkar, dusch, tv, minibar) VALUES (33, true, true, true, true, false, true, true, false, true, false, false, true, true);
INSERT INTO miljovanliga_milstolpar.faciliteter_rum (id, vattensparande_funktioner, "panoramafönster", hvac, "lågenergi_elektronik", "timer_på_belysning", "tidsstyrd_uppvärmning", "miljövänliga_möbler", "kassaskåp", kyl, badkar, dusch, tv, minibar) VALUES (6, true, true, true, true, false, true, true, true, true, false, true, true, true);
INSERT INTO miljovanliga_milstolpar.faciliteter_rum (id, vattensparande_funktioner, "panoramafönster", hvac, "lågenergi_elektronik", "timer_på_belysning", "tidsstyrd_uppvärmning", "miljövänliga_möbler", "kassaskåp", kyl, badkar, dusch, tv, minibar) VALUES (18, true, true, true, true, true, true, true, true, true, true, false, true, true);
INSERT INTO miljovanliga_milstolpar.faciliteter_rum (id, vattensparande_funktioner, "panoramafönster", hvac, "lågenergi_elektronik", "timer_på_belysning", "tidsstyrd_uppvärmning", "miljövänliga_möbler", "kassaskåp", kyl, badkar, dusch, tv, minibar) VALUES (36, true, true, true, false, true, true, true, false, true, true, true, true, true);
INSERT INTO miljovanliga_milstolpar.faciliteter_rum (id, vattensparande_funktioner, "panoramafönster", hvac, "lågenergi_elektronik", "timer_på_belysning", "tidsstyrd_uppvärmning", "miljövänliga_möbler", "kassaskåp", kyl, badkar, dusch, tv, minibar) VALUES (9, true, true, true, true, true, true, true, true, false, true, true, true, true);
INSERT INTO miljovanliga_milstolpar.faciliteter_rum (id, vattensparande_funktioner, "panoramafönster", hvac, "lågenergi_elektronik", "timer_på_belysning", "tidsstyrd_uppvärmning", "miljövänliga_möbler", "kassaskåp", kyl, badkar, dusch, tv, minibar) VALUES (19, true, true, true, true, true, true, true, true, true, false, true, true, true);


--
-- Data for Name: meddelanden; Type: TABLE DATA; Schema: miljovanliga_milstolpar; Owner: postgres
--

INSERT INTO miljovanliga_milstolpar.meddelanden (id, "avsändare", meddelande, mottagare, tid) VALUES (3, 3, 'Hej! Gick det bra med din bokning? Hör av dig om du har har fler funderingar', 6, '2024-10-30 09:42:49.985785');
INSERT INTO miljovanliga_milstolpar.meddelanden (id, "avsändare", meddelande, mottagare, tid) VALUES (1, 18, 'Ditt konto är nu verifierat! :)', 4, '2024-10-29 13:39:02');
INSERT INTO miljovanliga_milstolpar.meddelanden (id, "avsändare", meddelande, mottagare, tid) VALUES (2, 4, 'Tack! ', 18, '2024-10-29 13:40:29');
INSERT INTO miljovanliga_milstolpar.meddelanden (id, "avsändare", meddelande, mottagare, tid) VALUES (5, 18, 'Hej! Beklagar att du inte har fått bekräftelsen ännu. Ibland kan det ta några minuter. Har du dubbelkollat din skräppost? Om du skickar oss bokningsnumret eller mejladressen som användes kan vi snabbt kontrollera bokningsstatus och skicka en ny bekräftelse.', 11, '2023-10-26 21:34:45');
INSERT INTO miljovanliga_milstolpar.meddelanden (id, "avsändare", meddelande, mottagare, tid) VALUES (4, 11, 'Hej, jag har bokat en resa men har inte fått någon bekräftelse via e-post. Jag vill försäkra mig om att bokningen har gått igenom.', 18, '2023-10-26 21:33:36');
INSERT INTO miljovanliga_milstolpar.meddelanden (id, "avsändare", meddelande, mottagare, tid) VALUES (7, 17, 'Hej! Tack för ditt meddelande. Vi kan hjälpa dig med avbokningen.', 28, '2024-09-30 21:35:12');
INSERT INTO miljovanliga_milstolpar.meddelanden (id, "avsändare", meddelande, mottagare, tid) VALUES (6, 28, 'Hej, jag behöver avboka min resa som är planerad nästa vecka. Kan ni hjälpa mig med det?', 17, '2024-09-30 21:34:05');
INSERT INTO miljovanliga_milstolpar.meddelanden (id, "avsändare", meddelande, mottagare, tid) VALUES (8, 23, 'Hej, jag behöver ändra datumet för min resa. Är det möjligt, och vad skulle en eventuell avgift vara för detta?', 29, '2024-08-31 21:35:58');
INSERT INTO miljovanliga_milstolpar.meddelanden (id, "avsändare", meddelande, mottagare, tid) VALUES (9, 29, 'Hej! Vi kan hjälpa dig att ändra resedatum om biljettypen tillåter det. Avgiften varierar beroende på biljettyp och nya datumens tillgänglighet. Skicka oss ditt bokningsnummer, så kan vi ge dig information om vilka avgifter som kan tillkomma och de tillgängliga alternativen.', 23, '2024-08-31 21:36:04');
INSERT INTO miljovanliga_milstolpar.meddelanden (id, "avsändare", meddelande, mottagare, tid) VALUES (10, 31, 'Hej! Jag behöver hjälp med min bokning. Kan ni hjälpa mig?', 3, '2024-11-08 12:20:11.699671');


--
-- Data for Name: medresenär; Type: TABLE DATA; Schema: miljovanliga_milstolpar; Owner: postgres
--

INSERT INTO miljovanliga_milstolpar."medresenär" (id, "medresenäruppgifter_id", bokning_id) VALUES (1, 31, 10);
INSERT INTO miljovanliga_milstolpar."medresenär" (id, "medresenäruppgifter_id", bokning_id) VALUES (2, 32, 12);
INSERT INTO miljovanliga_milstolpar."medresenär" (id, "medresenäruppgifter_id", bokning_id) VALUES (3, 33, 17);


--
-- Data for Name: recension; Type: TABLE DATA; Schema: miljovanliga_milstolpar; Owner: postgres
--

INSERT INTO miljovanliga_milstolpar.recension (id, bokning_id, konto_id, betyg, beskrivning, tid) VALUES (2, 7, 7, 5, 'Jag flög med SAS från Stockholm till Paris, och allt gick smidigt! Flygplanet var rent och bekvämt, och personalen var väldigt trevlig och tillmötesgående. Vi fick till och med en måltid ombord som var överraskande god. Flyget var punktligt, och bagaget kom snabbt efter landningen. Rekommenderar verkligen detta bolag om du letar efter en bekväm och stressfri flygresa!', '2022-11-07 21:54:55');
INSERT INTO miljovanliga_milstolpar.recension (id, bokning_id, konto_id, betyg, beskrivning, tid) VALUES (5, 3, 10, 5, 'Fantastisk fiskeupplevelse! Guiden var kunnig och tog oss till de bästa platserna. Fick flera stora abborrar och en gädda! Båten var bekväm, och vi fick till och med fika på sjön. Rekommenderas varmt!', '2024-11-05 21:50:49');
INSERT INTO miljovanliga_milstolpar.recension (id, bokning_id, konto_id, betyg, beskrivning, tid) VALUES (3, 8, 8, 1, 'Tyvärr var detta en besvikelse. Tåget var över en timme försenat utan någon ordentlig information om varför. När vi väl kom ombord var det trångt', '2023-10-09 22:58:49');
INSERT INTO miljovanliga_milstolpar.recension (id, bokning_id, konto_id, betyg, beskrivning, tid) VALUES (6, 5, 11, 4, 'Hotellet var okej men inte riktigt vad jag hade förväntat mig. Rummen var rena men något små, och jag tyckte att det var lite bullrigt på natten. Personalen var vänlig och hjälpsam, men frukosten var ganska enkel och saknade variation. Läget var dock toppen och gjorde det lätt att utforska staden. Ett bra val om du inte behöver lyx och vill ha ett centralt boende.', '2024-11-02 22:57:00');
INSERT INTO miljovanliga_milstolpar.recension (id, bokning_id, konto_id, betyg, beskrivning, tid) VALUES (1, 4, 2, 5, 'Fantastiskt hotell med underbar service! Rummen var rena, rymliga och hade en vacker utsikt över staden. Personalen var alltid hjälpsam och trevlig, och frukosten var utsökt med många valmöjligheter. Läget var perfekt, nära till både sevärdheter och restauranger. Jag skulle definitivt rekommendera detta hotell till alla som besöker området!', '2023-11-11 21:51:19');
INSERT INTO miljovanliga_milstolpar.recension (id, bokning_id, konto_id, betyg, beskrivning, tid) VALUES (4, 9, 9, 4, 'Flygresan med SAS var okej. Flygplanet var inte det nyaste, men sätena var bekväma nog för en kortare resa. Vi blev försenade med ungefär 30 minuter, men personalen ombord var professionell och höll oss uppdaterade. Enligt min åsikt kunde de ha haft ett bättre utbud av snacks och drycker, men för priset var det ett helt okej val.', '2023-01-03 22:00:39');
INSERT INTO miljovanliga_milstolpar.recension (id, bokning_id, konto_id, betyg, beskrivning, tid) VALUES (7, 21, 13, 4, 'Mycket bra service och punktligt flyg', '2024-11-08 12:24:52.477277');


--
-- Data for Name: rum; Type: TABLE DATA; Schema: miljovanliga_milstolpar; Owner: postgres
--

INSERT INTO miljovanliga_milstolpar.rum (id, kvm_storlek, pris_per_natt, beskrivning, "snitt_co2_utsläpp", boende_id, sparas_co2) VALUES (29, 80, 3000, 'beskriving 29', 95, 13, 32);
INSERT INTO miljovanliga_milstolpar.rum (id, kvm_storlek, pris_per_natt, beskrivning, "snitt_co2_utsläpp", boende_id, sparas_co2) VALUES (33, 70, 2800, 'beskriving 33', 90, 11, 17);
INSERT INTO miljovanliga_milstolpar.rum (id, kvm_storlek, pris_per_natt, beskrivning, "snitt_co2_utsläpp", boende_id, sparas_co2) VALUES (13, 50, 1850, 'beskriving 13', 65, 9, 23);
INSERT INTO miljovanliga_milstolpar.rum (id, kvm_storlek, pris_per_natt, beskrivning, "snitt_co2_utsläpp", boende_id, sparas_co2) VALUES (30, 40, 1800, 'beskriving 30', 50, 17, 12);
INSERT INTO miljovanliga_milstolpar.rum (id, kvm_storlek, pris_per_natt, beskrivning, "snitt_co2_utsläpp", boende_id, sparas_co2) VALUES (38, 55, 2200, 'beskriving 38', 85, 6, 62);
INSERT INTO miljovanliga_milstolpar.rum (id, kvm_storlek, pris_per_natt, beskrivning, "snitt_co2_utsläpp", boende_id, sparas_co2) VALUES (5, 50, 2200, 'beskriving 5', 100, 5, 12);
INSERT INTO miljovanliga_milstolpar.rum (id, kvm_storlek, pris_per_natt, beskrivning, "snitt_co2_utsläpp", boende_id, sparas_co2) VALUES (36, 75, 5000, 'beskriving 36', 80, 20, 8);
INSERT INTO miljovanliga_milstolpar.rum (id, kvm_storlek, pris_per_natt, beskrivning, "snitt_co2_utsläpp", boende_id, sparas_co2) VALUES (24, 30, 1800, 'beskriving 24', 80, 14, 36);
INSERT INTO miljovanliga_milstolpar.rum (id, kvm_storlek, pris_per_natt, beskrivning, "snitt_co2_utsläpp", boende_id, sparas_co2) VALUES (7, 80, 3899, 'beskriving 7', 110, 18, 23);
INSERT INTO miljovanliga_milstolpar.rum (id, kvm_storlek, pris_per_natt, beskrivning, "snitt_co2_utsläpp", boende_id, sparas_co2) VALUES (26, 40, 2500, 'beskriving 26', 90, 12, 19);
INSERT INTO miljovanliga_milstolpar.rum (id, kvm_storlek, pris_per_natt, beskrivning, "snitt_co2_utsläpp", boende_id, sparas_co2) VALUES (31, 60, 2300, 'beskriving 31', 96, 10, 23);
INSERT INTO miljovanliga_milstolpar.rum (id, kvm_storlek, pris_per_natt, beskrivning, "snitt_co2_utsläpp", boende_id, sparas_co2) VALUES (21, 80, 2500, 'beskriving 21', 88, 2, 12);
INSERT INTO miljovanliga_milstolpar.rum (id, kvm_storlek, pris_per_natt, beskrivning, "snitt_co2_utsläpp", boende_id, sparas_co2) VALUES (10, 60, 3000, 'beskriving 10', 45, 1, 61);
INSERT INTO miljovanliga_milstolpar.rum (id, kvm_storlek, pris_per_natt, beskrivning, "snitt_co2_utsläpp", boende_id, sparas_co2) VALUES (4, 50, 1699, 'beskriving 4', 80, 4, 22);
INSERT INTO miljovanliga_milstolpar.rum (id, kvm_storlek, pris_per_natt, beskrivning, "snitt_co2_utsläpp", boende_id, sparas_co2) VALUES (22, 90, 3400, 'beskriving 22', 70, 16, 23);
INSERT INTO miljovanliga_milstolpar.rum (id, kvm_storlek, pris_per_natt, beskrivning, "snitt_co2_utsläpp", boende_id, sparas_co2) VALUES (20, 50, 2400, 'beskriving 20', 85, 4, 24);
INSERT INTO miljovanliga_milstolpar.rum (id, kvm_storlek, pris_per_natt, beskrivning, "snitt_co2_utsläpp", boende_id, sparas_co2) VALUES (39, 45, 2600, 'beskriving 39', 100, 9, 11);
INSERT INTO miljovanliga_milstolpar.rum (id, kvm_storlek, pris_per_natt, beskrivning, "snitt_co2_utsläpp", boende_id, sparas_co2) VALUES (12, 60, 2500, 'beskriving 12', 75, 19, 24);
INSERT INTO miljovanliga_milstolpar.rum (id, kvm_storlek, pris_per_natt, beskrivning, "snitt_co2_utsläpp", boende_id, sparas_co2) VALUES (28, 50, 3000, 'beskriving 28', 78, 8, 28);
INSERT INTO miljovanliga_milstolpar.rum (id, kvm_storlek, pris_per_natt, beskrivning, "snitt_co2_utsläpp", boende_id, sparas_co2) VALUES (35, 85, 4000, 'beskriving 35', 80, 15, 11);
INSERT INTO miljovanliga_milstolpar.rum (id, kvm_storlek, pris_per_natt, beskrivning, "snitt_co2_utsläpp", boende_id, sparas_co2) VALUES (19, 60, 2800, 'beskriving 19', 90, 5, 36);
INSERT INTO miljovanliga_milstolpar.rum (id, kvm_storlek, pris_per_natt, beskrivning, "snitt_co2_utsläpp", boende_id, sparas_co2) VALUES (23, 40, 2000, 'beskriving 23', 120, 11, 31);
INSERT INTO miljovanliga_milstolpar.rum (id, kvm_storlek, pris_per_natt, beskrivning, "snitt_co2_utsläpp", boende_id, sparas_co2) VALUES (37, 65, 3000, 'beskriving 37', 84, 19, 45);
INSERT INTO miljovanliga_milstolpar.rum (id, kvm_storlek, pris_per_natt, beskrivning, "snitt_co2_utsläpp", boende_id, sparas_co2) VALUES (8, 90, 3900, 'beskriving 8', 55, 14, 21);
INSERT INTO miljovanliga_milstolpar.rum (id, kvm_storlek, pris_per_natt, beskrivning, "snitt_co2_utsläpp", boende_id, sparas_co2) VALUES (32, 50, 2500, 'beskriving 32', 150, 17, 33);
INSERT INTO miljovanliga_milstolpar.rum (id, kvm_storlek, pris_per_natt, beskrivning, "snitt_co2_utsläpp", boende_id, sparas_co2) VALUES (6, 70, 2600, 'beskriving 6', 60, 13, 64);
INSERT INTO miljovanliga_milstolpar.rum (id, kvm_storlek, pris_per_natt, beskrivning, "snitt_co2_utsläpp", boende_id, sparas_co2) VALUES (25, 50, 1400, 'beskriving 25', 130, 3, 26);
INSERT INTO miljovanliga_milstolpar.rum (id, kvm_storlek, pris_per_natt, beskrivning, "snitt_co2_utsläpp", boende_id, sparas_co2) VALUES (27, 40, 1599, 'beskriving 27', 80, 12, 26);
INSERT INTO miljovanliga_milstolpar.rum (id, kvm_storlek, pris_per_natt, beskrivning, "snitt_co2_utsläpp", boende_id, sparas_co2) VALUES (16, 90, 3800, 'beskriving 16', 150, 10, 32);
INSERT INTO miljovanliga_milstolpar.rum (id, kvm_storlek, pris_per_natt, beskrivning, "snitt_co2_utsläpp", boende_id, sparas_co2) VALUES (1, 100, 2399, 'beskriving 1', 110, 1, 25);
INSERT INTO miljovanliga_milstolpar.rum (id, kvm_storlek, pris_per_natt, beskrivning, "snitt_co2_utsläpp", boende_id, sparas_co2) VALUES (18, 40, 1500, 'beskriving 18', 90, 7, 32);
INSERT INTO miljovanliga_milstolpar.rum (id, kvm_storlek, pris_per_natt, beskrivning, "snitt_co2_utsläpp", boende_id, sparas_co2) VALUES (3, 50, 1699, 'beskriving 3', 50, 3, 21);
INSERT INTO miljovanliga_milstolpar.rum (id, kvm_storlek, pris_per_natt, beskrivning, "snitt_co2_utsläpp", boende_id, sparas_co2) VALUES (2, 75, 1999, 'beskriving 2', 90, 2, 24);
INSERT INTO miljovanliga_milstolpar.rum (id, kvm_storlek, pris_per_natt, beskrivning, "snitt_co2_utsläpp", boende_id, sparas_co2) VALUES (17, 110, 6000, 'beskriving 17', 85, 6, 26);
INSERT INTO miljovanliga_milstolpar.rum (id, kvm_storlek, pris_per_natt, beskrivning, "snitt_co2_utsläpp", boende_id, sparas_co2) VALUES (15, 50, 1500, 'beskriving 15', 85, 16, 41);
INSERT INTO miljovanliga_milstolpar.rum (id, kvm_storlek, pris_per_natt, beskrivning, "snitt_co2_utsläpp", boende_id, sparas_co2) VALUES (14, 40, 3900, 'beskriving 14', 85, 7, 18);
INSERT INTO miljovanliga_milstolpar.rum (id, kvm_storlek, pris_per_natt, beskrivning, "snitt_co2_utsläpp", boende_id, sparas_co2) VALUES (34, 80, 2800, 'beskriving 34', 75, 20, 25);
INSERT INTO miljovanliga_milstolpar.rum (id, kvm_storlek, pris_per_natt, beskrivning, "snitt_co2_utsläpp", boende_id, sparas_co2) VALUES (40, 80, 3700, 'beskriving 40', 74, 8, 34);
INSERT INTO miljovanliga_milstolpar.rum (id, kvm_storlek, pris_per_natt, beskrivning, "snitt_co2_utsläpp", boende_id, sparas_co2) VALUES (9, 70, 3500, 'beskriving 9', 60, 18, 68);
INSERT INTO miljovanliga_milstolpar.rum (id, kvm_storlek, pris_per_natt, beskrivning, "snitt_co2_utsläpp", boende_id, sparas_co2) VALUES (11, 80, 3600, 'beskriving 11', 40, 15, 26);


--
-- Data for Name: rum_x_faciliteter; Type: TABLE DATA; Schema: miljovanliga_milstolpar; Owner: postgres
--

INSERT INTO miljovanliga_milstolpar.rum_x_faciliteter (id, rum_id, fac_rum_id) VALUES (24, 24, 17);
INSERT INTO miljovanliga_milstolpar.rum_x_faciliteter (id, rum_id, fac_rum_id) VALUES (30, 30, 11);
INSERT INTO miljovanliga_milstolpar.rum_x_faciliteter (id, rum_id, fac_rum_id) VALUES (9, 9, 32);
INSERT INTO miljovanliga_milstolpar.rum_x_faciliteter (id, rum_id, fac_rum_id) VALUES (20, 20, 21);
INSERT INTO miljovanliga_milstolpar.rum_x_faciliteter (id, rum_id, fac_rum_id) VALUES (36, 36, 5);
INSERT INTO miljovanliga_milstolpar.rum_x_faciliteter (id, rum_id, fac_rum_id) VALUES (25, 25, 16);
INSERT INTO miljovanliga_milstolpar.rum_x_faciliteter (id, rum_id, fac_rum_id) VALUES (38, 38, 3);
INSERT INTO miljovanliga_milstolpar.rum_x_faciliteter (id, rum_id, fac_rum_id) VALUES (29, 29, 12);
INSERT INTO miljovanliga_milstolpar.rum_x_faciliteter (id, rum_id, fac_rum_id) VALUES (13, 13, 28);
INSERT INTO miljovanliga_milstolpar.rum_x_faciliteter (id, rum_id, fac_rum_id) VALUES (21, 21, 20);
INSERT INTO miljovanliga_milstolpar.rum_x_faciliteter (id, rum_id, fac_rum_id) VALUES (16, 16, 25);
INSERT INTO miljovanliga_milstolpar.rum_x_faciliteter (id, rum_id, fac_rum_id) VALUES (14, 14, 27);
INSERT INTO miljovanliga_milstolpar.rum_x_faciliteter (id, rum_id, fac_rum_id) VALUES (23, 23, 18);
INSERT INTO miljovanliga_milstolpar.rum_x_faciliteter (id, rum_id, fac_rum_id) VALUES (33, 33, 8);
INSERT INTO miljovanliga_milstolpar.rum_x_faciliteter (id, rum_id, fac_rum_id) VALUES (27, 27, 14);
INSERT INTO miljovanliga_milstolpar.rum_x_faciliteter (id, rum_id, fac_rum_id) VALUES (7, 7, 34);
INSERT INTO miljovanliga_milstolpar.rum_x_faciliteter (id, rum_id, fac_rum_id) VALUES (17, 17, 24);
INSERT INTO miljovanliga_milstolpar.rum_x_faciliteter (id, rum_id, fac_rum_id) VALUES (31, 31, 10);
INSERT INTO miljovanliga_milstolpar.rum_x_faciliteter (id, rum_id, fac_rum_id) VALUES (26, 26, 15);
INSERT INTO miljovanliga_milstolpar.rum_x_faciliteter (id, rum_id, fac_rum_id) VALUES (28, 28, 13);
INSERT INTO miljovanliga_milstolpar.rum_x_faciliteter (id, rum_id, fac_rum_id) VALUES (22, 22, 19);
INSERT INTO miljovanliga_milstolpar.rum_x_faciliteter (id, rum_id, fac_rum_id) VALUES (6, 6, 35);
INSERT INTO miljovanliga_milstolpar.rum_x_faciliteter (id, rum_id, fac_rum_id) VALUES (40, 40, 1);
INSERT INTO miljovanliga_milstolpar.rum_x_faciliteter (id, rum_id, fac_rum_id) VALUES (8, 8, 33);
INSERT INTO miljovanliga_milstolpar.rum_x_faciliteter (id, rum_id, fac_rum_id) VALUES (10, 10, 31);
INSERT INTO miljovanliga_milstolpar.rum_x_faciliteter (id, rum_id, fac_rum_id) VALUES (39, 39, 2);
INSERT INTO miljovanliga_milstolpar.rum_x_faciliteter (id, rum_id, fac_rum_id) VALUES (32, 32, 9);
INSERT INTO miljovanliga_milstolpar.rum_x_faciliteter (id, rum_id, fac_rum_id) VALUES (1, 1, 40);
INSERT INTO miljovanliga_milstolpar.rum_x_faciliteter (id, rum_id, fac_rum_id) VALUES (3, 3, 38);
INSERT INTO miljovanliga_milstolpar.rum_x_faciliteter (id, rum_id, fac_rum_id) VALUES (37, 37, 4);
INSERT INTO miljovanliga_milstolpar.rum_x_faciliteter (id, rum_id, fac_rum_id) VALUES (11, 11, 30);
INSERT INTO miljovanliga_milstolpar.rum_x_faciliteter (id, rum_id, fac_rum_id) VALUES (35, 35, 6);
INSERT INTO miljovanliga_milstolpar.rum_x_faciliteter (id, rum_id, fac_rum_id) VALUES (12, 12, 29);
INSERT INTO miljovanliga_milstolpar.rum_x_faciliteter (id, rum_id, fac_rum_id) VALUES (4, 4, 37);
INSERT INTO miljovanliga_milstolpar.rum_x_faciliteter (id, rum_id, fac_rum_id) VALUES (15, 15, 26);
INSERT INTO miljovanliga_milstolpar.rum_x_faciliteter (id, rum_id, fac_rum_id) VALUES (18, 18, 23);
INSERT INTO miljovanliga_milstolpar.rum_x_faciliteter (id, rum_id, fac_rum_id) VALUES (19, 19, 22);
INSERT INTO miljovanliga_milstolpar.rum_x_faciliteter (id, rum_id, fac_rum_id) VALUES (5, 5, 36);
INSERT INTO miljovanliga_milstolpar.rum_x_faciliteter (id, rum_id, fac_rum_id) VALUES (34, 34, 7);
INSERT INTO miljovanliga_milstolpar.rum_x_faciliteter (id, rum_id, fac_rum_id) VALUES (2, 2, 39);


--
-- Data for Name: transport; Type: TABLE DATA; Schema: miljovanliga_milstolpar; Owner: postgres
--

INSERT INTO miljovanliga_milstolpar.transport (id, typ, pris, "snitt_co2_utsläpp", "avgångsplats", ankomstplats, email_id, restid, "avgångstid", ankomsttid, sparas_co2) VALUES (10, 'buss', 40, 300, 83, 84, 35, '0 hour 40 minutes', '2024-12-08 14:49:15', '2024-12-08 15:23:00', 19);
INSERT INTO miljovanliga_milstolpar.transport (id, typ, pris, "snitt_co2_utsläpp", "avgångsplats", ankomstplats, email_id, restid, "avgångstid", ankomsttid, sparas_co2) VALUES (11, 'flyg', 1200, 450, 64, 70, 35, '4 hours', '2024-12-01 14:32:26', '2024-12-01 18:35:12', 32);
INSERT INTO miljovanliga_milstolpar.transport (id, typ, pris, "snitt_co2_utsläpp", "avgångsplats", ankomstplats, email_id, restid, "avgångstid", ankomsttid, sparas_co2) VALUES (7, 'flyg', 8000, 900, 64, 63, 35, '23 hours', '2024-01-13 14:32:03', '2024-01-14 12:34:14', 52);
INSERT INTO miljovanliga_milstolpar.transport (id, typ, pris, "snitt_co2_utsläpp", "avgångsplats", ankomstplats, email_id, restid, "avgångstid", ankomsttid, sparas_co2) VALUES (5, 'tåg', 350, 550, 65, 66, 16, '18 hours', '2025-01-01 14:31:34', '2025-01-02 07:33:09', 28);
INSERT INTO miljovanliga_milstolpar.transport (id, typ, pris, "snitt_co2_utsläpp", "avgångsplats", ankomstplats, email_id, restid, "avgångstid", ankomsttid, sparas_co2) VALUES (2, 'buss', 799, 200, 77, 78, 34, '0 hour 25 minutes', '2024-12-05 14:47:06', '2024-12-05 15:10:44', 15);
INSERT INTO miljovanliga_milstolpar.transport (id, typ, pris, "snitt_co2_utsläpp", "avgångsplats", ankomstplats, email_id, restid, "avgångstid", ankomsttid, sparas_co2) VALUES (1, 'flyg', 2500, 800, 72, 73, 17, '5 hours', '2022-11-06 14:30:00', '2022-11-06 19:32:00', 30);
INSERT INTO miljovanliga_milstolpar.transport (id, typ, pris, "snitt_co2_utsläpp", "avgångsplats", ankomstplats, email_id, restid, "avgångstid", ankomsttid, sparas_co2) VALUES (9, 'buss', 40, 150, 81, 82, 17, '0 hour 35 minutes', '2025-01-06 14:49:06', '2025-01-06 15:15:34', 21);
INSERT INTO miljovanliga_milstolpar.transport (id, typ, pris, "snitt_co2_utsläpp", "avgångsplats", ankomstplats, email_id, restid, "avgångstid", ankomsttid, sparas_co2) VALUES (3, 'tåg', 1500, 500, 74, 75, 34, '2 hours', '2023-09-10 14:30:41', '2023-09-10 16:32:58', 20);
INSERT INTO miljovanliga_milstolpar.transport (id, typ, pris, "snitt_co2_utsläpp", "avgångsplats", ankomstplats, email_id, restid, "avgångstid", ankomsttid, sparas_co2) VALUES (8, 'flyg', 2800, 600, 64, 76, 16, '20 hours', '2023-01-01 14:32:15', '2023-01-02 09:34:42', 39);
INSERT INTO miljovanliga_milstolpar.transport (id, typ, pris, "snitt_co2_utsläpp", "avgångsplats", ankomstplats, email_id, restid, "avgångstid", ankomsttid, sparas_co2) VALUES (4, 'tåg', 200, 20, 79, 80, 34, '0 hour 35 minutes', '2024-11-30 14:47:19', '2024-11-30 16:50:14', 12);
INSERT INTO miljovanliga_milstolpar.transport (id, typ, pris, "snitt_co2_utsläpp", "avgångsplats", ankomstplats, email_id, restid, "avgångstid", ankomsttid, sparas_co2) VALUES (6, 'tåg', 350, 600, 66, 65, 35, '18 hours', '2025-01-09 14:31:47', '2025-01-10 07:33:44', 38);


--
-- Data for Name: användare; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: miljovanliga_milstolpar; Type: TABLE DATA; Schema: schema_name; Owner: postgres
--

INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- PostgreSQL database dump');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Dumped from database version 16.4');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Dumped by pg_dump version 16.4');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('SET statement_timeout = 0;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('SET lock_timeout = 0;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('SET idle_in_transaction_session_timeout = 0;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('SET client_encoding = ''UTF8'';');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('SET standard_conforming_strings = on;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('SELECT pg_catalog.set_config(''search_path'', '''', false);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('SET check_function_bodies = false;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('SET xmloption = content;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('SET client_min_messages = warning;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('SET row_security = off;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: miljovanliga_milstolpar; Type: SCHEMA; Schema: -; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('CREATE SCHEMA miljovanliga_milstolpar;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER SCHEMA miljovanliga_milstolpar OWNER TO postgres;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: betalningsstatus_typ; Type: TYPE; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('CREATE TYPE miljovanliga_milstolpar.betalningsstatus_typ AS ENUM (');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    ''betald'',');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    ''obetalad'',');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    ''förfallen''');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (');');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TYPE miljovanliga_milstolpar.betalningsstatus_typ OWNER TO postgres;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: boende_typ; Type: TYPE; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('CREATE TYPE miljovanliga_milstolpar.boende_typ AS ENUM (');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    ''vandrarhem'',');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    ''tiny house'',');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    ''hotell''');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (');');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TYPE miljovanliga_milstolpar.boende_typ OWNER TO postgres;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: bokning_status; Type: TYPE; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('CREATE TYPE miljovanliga_milstolpar.bokning_status AS ENUM (');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    ''aktiv'',');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    ''inte aktiv''');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (');');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TYPE miljovanliga_milstolpar.bokning_status OWNER TO postgres;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: roller_typ; Type: TYPE; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('CREATE TYPE miljovanliga_milstolpar.roller_typ AS ENUM (');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    ''kund'',');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    ''systemadmin'',');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    ''kundsupport''');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (');');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TYPE miljovanliga_milstolpar.roller_typ OWNER TO postgres;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: transport_typ; Type: TYPE; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('CREATE TYPE miljovanliga_milstolpar.transport_typ AS ENUM (');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    ''flyg'',');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    ''buss'',');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    ''tåg'',');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    ''cykel''');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (');');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TYPE miljovanliga_milstolpar.transport_typ OWNER TO postgres;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('SET default_tablespace = '''';');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('SET default_table_access_method = heap;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: adress; Type: TABLE; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('CREATE TABLE miljovanliga_milstolpar.adress (');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    id integer NOT NULL,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    gatuadress character varying(32),');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    gatunummer character varying(10),');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    postnummer character varying(10),');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    ort character varying(32),');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    land character varying(32),');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    stad character varying(32)');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (');');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE miljovanliga_milstolpar.adress OWNER TO postgres;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: adress_id_seq; Type: SEQUENCE; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('CREATE SEQUENCE miljovanliga_milstolpar.adress_id_seq');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    AS integer');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    START WITH 1');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    INCREMENT BY 1');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    NO MINVALUE');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    NO MAXVALUE');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    CACHE 1;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER SEQUENCE miljovanliga_milstolpar.adress_id_seq OWNER TO postgres;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: adress_id_seq; Type: SEQUENCE OWNED BY; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER SEQUENCE miljovanliga_milstolpar.adress_id_seq OWNED BY miljovanliga_milstolpar.adress.id;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: aktivitet; Type: TABLE; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('CREATE TABLE miljovanliga_milstolpar.aktivitet (');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    id integer NOT NULL,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    namn character varying(32),');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    beskrivning character varying(128),');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    plats character varying(32),');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    status character varying(32),');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    aktivitet_typ character varying(32),');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    "snitt_co2_utsläpp" integer,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    "ditt_co2_utsläpp" integer,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    adress_id integer');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (');');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE miljovanliga_milstolpar.aktivitet OWNER TO postgres;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: aktivitet_id_seq; Type: SEQUENCE; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('CREATE SEQUENCE miljovanliga_milstolpar.aktivitet_id_seq');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    AS integer');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    START WITH 1');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    INCREMENT BY 1');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    NO MINVALUE');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    NO MAXVALUE');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    CACHE 1;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER SEQUENCE miljovanliga_milstolpar.aktivitet_id_seq OWNER TO postgres;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: aktivitet_id_seq; Type: SEQUENCE OWNED BY; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER SEQUENCE miljovanliga_milstolpar.aktivitet_id_seq OWNED BY miljovanliga_milstolpar.aktivitet.id;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: användare_konto; Type: TABLE; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('CREATE TABLE miljovanliga_milstolpar."användare_konto" (');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    id integer NOT NULL,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    "lösenord" character varying,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    reg_datum timestamp without time zone,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    roll miljovanliga_milstolpar.roller_typ,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    "användareuppgifter_id" integer');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (');');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE miljovanliga_milstolpar."användare_konto" OWNER TO postgres;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: användare_konto_id_seq; Type: SEQUENCE; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('CREATE SEQUENCE miljovanliga_milstolpar."användare_konto_id_seq"');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    AS integer');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    START WITH 1');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    INCREMENT BY 1');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    NO MINVALUE');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    NO MAXVALUE');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    CACHE 1;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER SEQUENCE miljovanliga_milstolpar."användare_konto_id_seq" OWNER TO postgres;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: användare_konto_id_seq; Type: SEQUENCE OWNED BY; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER SEQUENCE miljovanliga_milstolpar."användare_konto_id_seq" OWNED BY miljovanliga_milstolpar."användare_konto".id;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: användareuppgifter; Type: TABLE; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('CREATE TABLE miljovanliga_milstolpar."användareuppgifter" (');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    id integer NOT NULL,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    "förnamn" character varying(32),');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    efternamn character varying(32),');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    passnummer character varying(32),');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    adress_id integer');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (');');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE miljovanliga_milstolpar."användareuppgifter" OWNER TO postgres;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: användareuppgifter_id_seq; Type: SEQUENCE; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('CREATE SEQUENCE miljovanliga_milstolpar."användareuppgifter_id_seq"');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    AS integer');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    START WITH 1');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    INCREMENT BY 1');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    NO MINVALUE');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    NO MAXVALUE');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    CACHE 1;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER SEQUENCE miljovanliga_milstolpar."användareuppgifter_id_seq" OWNER TO postgres;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: användareuppgifter_id_seq; Type: SEQUENCE OWNED BY; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER SEQUENCE miljovanliga_milstolpar."användareuppgifter_id_seq" OWNED BY miljovanliga_milstolpar."användareuppgifter".id;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: betalning; Type: TABLE; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('CREATE TABLE miljovanliga_milstolpar.betalning (');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    id integer NOT NULL,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    betalningsstatus miljovanliga_milstolpar.betalningsstatus_typ,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    belopp integer,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    betalningsmetod character varying(32),');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    betalningstid timestamp without time zone');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (');');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE miljovanliga_milstolpar.betalning OWNER TO postgres;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: COLUMN betalning.betalningsstatus; Type: COMMENT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('COMMENT ON COLUMN miljovanliga_milstolpar.betalning.betalningsstatus IS ''ska göras till enum'';');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: betalning_id_seq; Type: SEQUENCE; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('CREATE SEQUENCE miljovanliga_milstolpar.betalning_id_seq');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    AS integer');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    START WITH 1');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    INCREMENT BY 1');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    NO MINVALUE');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    NO MAXVALUE');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    CACHE 1;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER SEQUENCE miljovanliga_milstolpar.betalning_id_seq OWNER TO postgres;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: betalning_id_seq; Type: SEQUENCE OWNED BY; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER SEQUENCE miljovanliga_milstolpar.betalning_id_seq OWNED BY miljovanliga_milstolpar.betalning.id;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: boende; Type: TABLE; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('CREATE TABLE miljovanliga_milstolpar.boende (');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    id integer NOT NULL,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    typ miljovanliga_milstolpar.boende_typ,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    namn character varying(32),');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    "snitt_co2_utsläpp" integer,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    "ditt_co2_utsläpp" integer,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    adress_id integer');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (');');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE miljovanliga_milstolpar.boende OWNER TO postgres;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: COLUMN boende.typ; Type: COMMENT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('COMMENT ON COLUMN miljovanliga_milstolpar.boende.typ IS ''ska göras till enum'';');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: boende_id_seq; Type: SEQUENCE; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('CREATE SEQUENCE miljovanliga_milstolpar.boende_id_seq');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    AS integer');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    START WITH 1');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    INCREMENT BY 1');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    NO MINVALUE');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    NO MAXVALUE');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    CACHE 1;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER SEQUENCE miljovanliga_milstolpar.boende_id_seq OWNER TO postgres;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: boende_id_seq; Type: SEQUENCE OWNED BY; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER SEQUENCE miljovanliga_milstolpar.boende_id_seq OWNED BY miljovanliga_milstolpar.boende.id;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: boende_x_faciliteter; Type: TABLE; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('CREATE TABLE miljovanliga_milstolpar.boende_x_faciliteter (');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    id integer NOT NULL,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    boende_id integer,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    fac_boende_id integer');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (');');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE miljovanliga_milstolpar.boende_x_faciliteter OWNER TO postgres;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: boende_x_faciliteter_id_seq; Type: SEQUENCE; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('CREATE SEQUENCE miljovanliga_milstolpar.boende_x_faciliteter_id_seq');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    AS integer');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    START WITH 1');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    INCREMENT BY 1');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    NO MINVALUE');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    NO MAXVALUE');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    CACHE 1;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER SEQUENCE miljovanliga_milstolpar.boende_x_faciliteter_id_seq OWNER TO postgres;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: boende_x_faciliteter_id_seq; Type: SEQUENCE OWNED BY; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER SEQUENCE miljovanliga_milstolpar.boende_x_faciliteter_id_seq OWNED BY miljovanliga_milstolpar.boende_x_faciliteter.id;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: bokning; Type: TABLE; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('CREATE TABLE miljovanliga_milstolpar.bokning (');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    id integer NOT NULL,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    bokningstid timestamp without time zone,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    status miljovanliga_milstolpar.bokning_status,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    totalpris integer,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    antal_personer integer,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    konto_id integer,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    betalning_id integer');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (');');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE miljovanliga_milstolpar.bokning OWNER TO postgres;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: COLUMN bokning.status; Type: COMMENT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('COMMENT ON COLUMN miljovanliga_milstolpar.bokning.status IS ''ska göras till enum '';');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: COLUMN bokning.antal_personer; Type: COMMENT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('COMMENT ON COLUMN miljovanliga_milstolpar.bokning.antal_personer IS ''Är det den här som blir medressenär? '';');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: bokning_id_seq; Type: SEQUENCE; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('CREATE SEQUENCE miljovanliga_milstolpar.bokning_id_seq');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    AS integer');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    START WITH 1');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    INCREMENT BY 1');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    NO MINVALUE');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    NO MAXVALUE');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    CACHE 1;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER SEQUENCE miljovanliga_milstolpar.bokning_id_seq OWNER TO postgres;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: bokning_id_seq; Type: SEQUENCE OWNED BY; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER SEQUENCE miljovanliga_milstolpar.bokning_id_seq OWNED BY miljovanliga_milstolpar.bokning.id;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: bokning_x_aktivitet; Type: TABLE; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('CREATE TABLE miljovanliga_milstolpar.bokning_x_aktivitet (');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    id integer NOT NULL,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    starttid timestamp without time zone,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    sluttid timestamp without time zone,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    bokning_id integer,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    aktivitet_id integer');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (');');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    wifi boolean NOT NULL,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE miljovanliga_milstolpar.bokning_x_aktivitet OWNER TO postgres;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: bokning_x_aktivitet_id_seq; Type: SEQUENCE; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('CREATE SEQUENCE miljovanliga_milstolpar.bokning_x_aktivitet_id_seq');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    AS integer');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    START WITH 1');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    INCREMENT BY 1');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    NO MINVALUE');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    NO MAXVALUE');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    CACHE 1;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER SEQUENCE miljovanliga_milstolpar.bokning_x_aktivitet_id_seq OWNER TO postgres;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: bokning_x_aktivitet_id_seq; Type: SEQUENCE OWNED BY; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER SEQUENCE miljovanliga_milstolpar.bokning_x_aktivitet_id_seq OWNED BY miljovanliga_milstolpar.bokning_x_aktivitet.id;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: bokning_x_boende; Type: TABLE; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('CREATE TABLE miljovanliga_milstolpar.bokning_x_boende (');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    id integer NOT NULL,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    incheckning timestamp without time zone,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    utcheckning timestamp without time zone,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    "antal_nätter" integer,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    boende_id integer,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    bokning_id integer');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (');');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE miljovanliga_milstolpar.bokning_x_boende OWNER TO postgres;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: bokning_x_boende_id_seq; Type: SEQUENCE; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('CREATE SEQUENCE miljovanliga_milstolpar.bokning_x_boende_id_seq');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    AS integer');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    START WITH 1');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    INCREMENT BY 1');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    NO MINVALUE');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    NO MAXVALUE');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    CACHE 1;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER SEQUENCE miljovanliga_milstolpar.bokning_x_boende_id_seq OWNER TO postgres;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: bokning_x_boende_id_seq; Type: SEQUENCE OWNED BY; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER SEQUENCE miljovanliga_milstolpar.bokning_x_boende_id_seq OWNED BY miljovanliga_milstolpar.bokning_x_boende.id;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: bokning_x_transport; Type: TABLE; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('CREATE TABLE miljovanliga_milstolpar.bokning_x_transport (');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    id integer NOT NULL,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    ankomsttid timestamp without time zone,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    avresetid timestamp without time zone,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    "reslängd" integer,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    bokning_id integer,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    transport_id integer');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (');');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE miljovanliga_milstolpar.bokning_x_transport OWNER TO postgres;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: bokning_x_transport_id_seq; Type: SEQUENCE; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('CREATE SEQUENCE miljovanliga_milstolpar.bokning_x_transport_id_seq');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    AS integer');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    START WITH 1');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    INCREMENT BY 1');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    NO MINVALUE');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    NO MAXVALUE');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    CACHE 1;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER SEQUENCE miljovanliga_milstolpar.bokning_x_transport_id_seq OWNER TO postgres;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: bokning_x_transport_id_seq; Type: SEQUENCE OWNED BY; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER SEQUENCE miljovanliga_milstolpar.bokning_x_transport_id_seq OWNED BY miljovanliga_milstolpar.bokning_x_transport.id;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: email; Type: TABLE; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('CREATE TABLE miljovanliga_milstolpar.email (');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    id integer NOT NULL,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    mailadress character varying,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    konto_id integer');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (');');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE miljovanliga_milstolpar.email OWNER TO postgres;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: e_mail_id_seq; Type: SEQUENCE; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('CREATE SEQUENCE miljovanliga_milstolpar.e_mail_id_seq');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    AS integer');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    START WITH 1');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    INCREMENT BY 1');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    NO MINVALUE');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    NO MAXVALUE');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    CACHE 1;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER SEQUENCE miljovanliga_milstolpar.e_mail_id_seq OWNER TO postgres;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: e_mail_id_seq; Type: SEQUENCE OWNED BY; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER SEQUENCE miljovanliga_milstolpar.e_mail_id_seq OWNED BY miljovanliga_milstolpar.email.id;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: faciliteter_boende; Type: TABLE; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('CREATE TABLE miljovanliga_milstolpar.faciliteter_boende (');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    id integer NOT NULL,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    solpanel boolean NOT NULL,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    "energisnål_uppvärmning" boolean NOT NULL,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    regnvattenuppsamling boolean NOT NULL,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    "närproducerad_mat" boolean NOT NULL,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    lokala_samarbeten boolean NOT NULL,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    vegansk_mat boolean NOT NULL,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    "miljöcertifierad" boolean NOT NULL,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    "hållbara_aktiviteter" boolean NOT NULL,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    vegetarisk_mat boolean NOT NULL,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    boende_id integer');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (');');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE miljovanliga_milstolpar.faciliteter_boende OWNER TO postgres;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: faciliteter_boende_id_seq; Type: SEQUENCE; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('CREATE SEQUENCE miljovanliga_milstolpar.faciliteter_boende_id_seq');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    AS integer');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    START WITH 1');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    INCREMENT BY 1');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    NO MINVALUE');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    NO MAXVALUE');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    CACHE 1;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER SEQUENCE miljovanliga_milstolpar.faciliteter_boende_id_seq OWNER TO postgres;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: faciliteter_boende_id_seq; Type: SEQUENCE OWNED BY; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER SEQUENCE miljovanliga_milstolpar.faciliteter_boende_id_seq OWNED BY miljovanliga_milstolpar.faciliteter_boende.id;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: faciliteter_rum; Type: TABLE; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('CREATE TABLE miljovanliga_milstolpar.faciliteter_rum (');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    id integer NOT NULL,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    vattensparande_funktioner boolean NOT NULL,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    "panoramafönster" boolean NOT NULL,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    hvac boolean NOT NULL,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    "lågenergi_elutrustning" boolean NOT NULL,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    "timer_på_belysning" boolean NOT NULL,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    "tidsstyrd_uppvärmning" boolean NOT NULL,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    "miljövänliga_möbler" boolean NOT NULL,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    "kassaskåp" boolean NOT NULL,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    kyl boolean NOT NULL,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    badkar boolean NOT NULL,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    dusch boolean NOT NULL,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    tv boolean NOT NULL,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    minibar boolean NOT NULL');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (');');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE miljovanliga_milstolpar.faciliteter_rum OWNER TO postgres;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: faciliteter_rum_id_seq; Type: SEQUENCE; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('CREATE SEQUENCE miljovanliga_milstolpar.faciliteter_rum_id_seq');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    AS integer');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    START WITH 1');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    INCREMENT BY 1');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    NO MINVALUE');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    NO MAXVALUE');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    CACHE 1;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER SEQUENCE miljovanliga_milstolpar.faciliteter_rum_id_seq OWNER TO postgres;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: faciliteter_rum_id_seq; Type: SEQUENCE OWNED BY; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER SEQUENCE miljovanliga_milstolpar.faciliteter_rum_id_seq OWNED BY miljovanliga_milstolpar.faciliteter_rum.id;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: meddelanden; Type: TABLE; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('CREATE TABLE miljovanliga_milstolpar.meddelanden (');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    id integer NOT NULL,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    "avsändare" integer,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    meddelande character varying(128),');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    mottagare integer,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    tid timestamp without time zone,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    "skickat " boolean');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (');');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE miljovanliga_milstolpar.meddelanden OWNER TO postgres;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: meddelanden_id_seq; Type: SEQUENCE; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('CREATE SEQUENCE miljovanliga_milstolpar.meddelanden_id_seq');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    AS integer');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    START WITH 1');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    INCREMENT BY 1');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    NO MINVALUE');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    NO MAXVALUE');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    CACHE 1;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER SEQUENCE miljovanliga_milstolpar.meddelanden_id_seq OWNER TO postgres;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: meddelanden_id_seq; Type: SEQUENCE OWNED BY; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER SEQUENCE miljovanliga_milstolpar.meddelanden_id_seq OWNED BY miljovanliga_milstolpar.meddelanden.id;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: recension; Type: TABLE; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('CREATE TABLE miljovanliga_milstolpar.recension (');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    id integer NOT NULL,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    bokning_id integer,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    konto_id integer,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    betyg integer,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    beskrivning character varying(128),');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    tid timestamp without time zone');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (');');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE miljovanliga_milstolpar.recension OWNER TO postgres;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: recension_id_seq; Type: SEQUENCE; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('CREATE SEQUENCE miljovanliga_milstolpar.recension_id_seq');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    AS integer');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    START WITH 1');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    INCREMENT BY 1');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    NO MINVALUE');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    NO MAXVALUE');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    CACHE 1;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER SEQUENCE miljovanliga_milstolpar.recension_id_seq OWNER TO postgres;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: recension_id_seq; Type: SEQUENCE OWNED BY; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER SEQUENCE miljovanliga_milstolpar.recension_id_seq OWNED BY miljovanliga_milstolpar.recension.id;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: rum; Type: TABLE; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('CREATE TABLE miljovanliga_milstolpar.rum (');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    id integer NOT NULL,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    nummer integer,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    kvm_storlek integer,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    pris_per_natt integer,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    beskrivning character varying(128),');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    "snitt_co2_utsläpp" integer,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    "ditt_co2_utsläpp" integer,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    boende_id integer');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (');');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE miljovanliga_milstolpar.rum OWNER TO postgres;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: rum_id_seq; Type: SEQUENCE; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('CREATE SEQUENCE miljovanliga_milstolpar.rum_id_seq');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    AS integer');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    START WITH 1');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    INCREMENT BY 1');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    NO MINVALUE');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    NO MAXVALUE');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    CACHE 1;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER SEQUENCE miljovanliga_milstolpar.rum_id_seq OWNER TO postgres;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: rum_id_seq; Type: SEQUENCE OWNED BY; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER SEQUENCE miljovanliga_milstolpar.rum_id_seq OWNED BY miljovanliga_milstolpar.rum.id;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: rum_x_faciliteter; Type: TABLE; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('CREATE TABLE miljovanliga_milstolpar.rum_x_faciliteter (');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    id integer NOT NULL,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    rum_id integer,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    fac_rum_id integer');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (');');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE miljovanliga_milstolpar.rum_x_faciliteter OWNER TO postgres;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: rum_x_faciliteter_id_seq; Type: SEQUENCE; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('CREATE SEQUENCE miljovanliga_milstolpar.rum_x_faciliteter_id_seq');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    AS integer');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    START WITH 1');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    INCREMENT BY 1');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    NO MINVALUE');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    NO MAXVALUE');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    CACHE 1;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER SEQUENCE miljovanliga_milstolpar.rum_x_faciliteter_id_seq OWNER TO postgres;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: rum_x_faciliteter_id_seq; Type: SEQUENCE OWNED BY; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER SEQUENCE miljovanliga_milstolpar.rum_x_faciliteter_id_seq OWNED BY miljovanliga_milstolpar.rum_x_faciliteter.id;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: transport; Type: TABLE; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('CREATE TABLE miljovanliga_milstolpar.transport (');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    id integer NOT NULL,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    typ miljovanliga_milstolpar.transport_typ,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    pris integer,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    "avgångsplats" character varying(128),');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    ankomstplats character varying(128),');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    "snitt_co2_utsläpp" integer,');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    "ditt_co2_utsläpp" integer');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (');');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE miljovanliga_milstolpar.transport OWNER TO postgres;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: COLUMN transport.typ; Type: COMMENT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('COMMENT ON COLUMN miljovanliga_milstolpar.transport.typ IS ''ska göras till enum '';');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: transport_id_seq; Type: SEQUENCE; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('CREATE SEQUENCE miljovanliga_milstolpar.transport_id_seq');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    AS integer');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    START WITH 1');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    INCREMENT BY 1');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    NO MINVALUE');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    NO MAXVALUE');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    CACHE 1;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER SEQUENCE miljovanliga_milstolpar.transport_id_seq OWNER TO postgres;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: transport_id_seq; Type: SEQUENCE OWNED BY; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER SEQUENCE miljovanliga_milstolpar.transport_id_seq OWNED BY miljovanliga_milstolpar.transport.id;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: adress id; Type: DEFAULT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE ONLY miljovanliga_milstolpar.adress ALTER COLUMN id SET DEFAULT nextval(''miljovanliga_milstolpar.adress_id_seq''::regclass);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: aktivitet id; Type: DEFAULT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE ONLY miljovanliga_milstolpar.aktivitet ALTER COLUMN id SET DEFAULT nextval(''miljovanliga_milstolpar.aktivitet_id_seq''::regclass);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: användare_konto id; Type: DEFAULT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE ONLY miljovanliga_milstolpar."användare_konto" ALTER COLUMN id SET DEFAULT nextval(''miljovanliga_milstolpar."användare_konto_id_seq"''::regclass);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: användareuppgifter id; Type: DEFAULT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE ONLY miljovanliga_milstolpar."användareuppgifter" ALTER COLUMN id SET DEFAULT nextval(''miljovanliga_milstolpar."användareuppgifter_id_seq"''::regclass);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: betalning id; Type: DEFAULT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE ONLY miljovanliga_milstolpar.betalning ALTER COLUMN id SET DEFAULT nextval(''miljovanliga_milstolpar.betalning_id_seq''::regclass);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: boende id; Type: DEFAULT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE ONLY miljovanliga_milstolpar.boende ALTER COLUMN id SET DEFAULT nextval(''miljovanliga_milstolpar.boende_id_seq''::regclass);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: boende_x_faciliteter id; Type: DEFAULT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE ONLY miljovanliga_milstolpar.boende_x_faciliteter ALTER COLUMN id SET DEFAULT nextval(''miljovanliga_milstolpar.boende_x_faciliteter_id_seq''::regclass);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: bokning id; Type: DEFAULT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE ONLY miljovanliga_milstolpar.bokning ALTER COLUMN id SET DEFAULT nextval(''miljovanliga_milstolpar.bokning_id_seq''::regclass);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: bokning_x_aktivitet id; Type: DEFAULT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE ONLY miljovanliga_milstolpar.bokning_x_aktivitet ALTER COLUMN id SET DEFAULT nextval(''miljovanliga_milstolpar.bokning_x_aktivitet_id_seq''::regclass);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: bokning_x_boende id; Type: DEFAULT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE ONLY miljovanliga_milstolpar.bokning_x_boende ALTER COLUMN id SET DEFAULT nextval(''miljovanliga_milstolpar.bokning_x_boende_id_seq''::regclass);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: bokning_x_transport id; Type: DEFAULT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE ONLY miljovanliga_milstolpar.bokning_x_transport ALTER COLUMN id SET DEFAULT nextval(''miljovanliga_milstolpar.bokning_x_transport_id_seq''::regclass);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: email id; Type: DEFAULT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE ONLY miljovanliga_milstolpar.email ALTER COLUMN id SET DEFAULT nextval(''miljovanliga_milstolpar.e_mail_id_seq''::regclass);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: faciliteter_boende id; Type: DEFAULT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE ONLY miljovanliga_milstolpar.faciliteter_boende ALTER COLUMN id SET DEFAULT nextval(''miljovanliga_milstolpar.faciliteter_boende_id_seq''::regclass);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: faciliteter_rum id; Type: DEFAULT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE ONLY miljovanliga_milstolpar.faciliteter_rum ALTER COLUMN id SET DEFAULT nextval(''miljovanliga_milstolpar.faciliteter_rum_id_seq''::regclass);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: meddelanden id; Type: DEFAULT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE ONLY miljovanliga_milstolpar.meddelanden ALTER COLUMN id SET DEFAULT nextval(''miljovanliga_milstolpar.meddelanden_id_seq''::regclass);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: recension id; Type: DEFAULT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE ONLY miljovanliga_milstolpar.recension ALTER COLUMN id SET DEFAULT nextval(''miljovanliga_milstolpar.recension_id_seq''::regclass);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: rum id; Type: DEFAULT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE ONLY miljovanliga_milstolpar.rum ALTER COLUMN id SET DEFAULT nextval(''miljovanliga_milstolpar.rum_id_seq''::regclass);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: rum_x_faciliteter id; Type: DEFAULT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE ONLY miljovanliga_milstolpar.rum_x_faciliteter ALTER COLUMN id SET DEFAULT nextval(''miljovanliga_milstolpar.rum_x_faciliteter_id_seq''::regclass);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: transport id; Type: DEFAULT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE ONLY miljovanliga_milstolpar.transport ALTER COLUMN id SET DEFAULT nextval(''miljovanliga_milstolpar.transport_id_seq''::regclass);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Data for Name: adress; Type: TABLE DATA; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('COPY miljovanliga_milstolpar.adress (id, gatuadress, gatunummer, postnummer, ort, land, stad) FROM stdin;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('\.');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Data for Name: aktivitet; Type: TABLE DATA; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('COPY miljovanliga_milstolpar.aktivitet (id, namn, beskrivning, plats, status, aktivitet_typ, "snitt_co2_utsläpp", "ditt_co2_utsläpp", adress_id) FROM stdin;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('\.');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Data for Name: användare_konto; Type: TABLE DATA; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('COPY miljovanliga_milstolpar."användare_konto" (id, "lösenord", reg_datum, roll, "användareuppgifter_id") FROM stdin;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('\.');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Data for Name: användareuppgifter; Type: TABLE DATA; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('COPY miljovanliga_milstolpar."användareuppgifter" (id, "förnamn", efternamn, passnummer, adress_id) FROM stdin;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('\.');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Data for Name: betalning; Type: TABLE DATA; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('COPY miljovanliga_milstolpar.betalning (id, betalningsstatus, belopp, betalningsmetod, betalningstid) FROM stdin;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('\.');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Data for Name: boende; Type: TABLE DATA; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('COPY miljovanliga_milstolpar.boende (id, typ, namn, "snitt_co2_utsläpp", "ditt_co2_utsläpp", adress_id) FROM stdin;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('\.');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Data for Name: boende_x_faciliteter; Type: TABLE DATA; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('COPY miljovanliga_milstolpar.boende_x_faciliteter (id, boende_id, fac_boende_id) FROM stdin;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('\.');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Data for Name: bokning; Type: TABLE DATA; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('COPY miljovanliga_milstolpar.bokning (id, bokningstid, status, totalpris, antal_personer, konto_id, betalning_id) FROM stdin;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('\.');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Data for Name: bokning_x_aktivitet; Type: TABLE DATA; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('COPY miljovanliga_milstolpar.bokning_x_aktivitet (id, starttid, sluttid, bokning_id, aktivitet_id) FROM stdin;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('\.');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Data for Name: bokning_x_boende; Type: TABLE DATA; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('COPY miljovanliga_milstolpar.bokning_x_boende (id, incheckning, utcheckning, "antal_nätter", boende_id, bokning_id) FROM stdin;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('\.');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Data for Name: bokning_x_transport; Type: TABLE DATA; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('COPY miljovanliga_milstolpar.bokning_x_transport (id, ankomsttid, avresetid, "reslängd", bokning_id, transport_id) FROM stdin;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('\.');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Data for Name: email; Type: TABLE DATA; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('COPY miljovanliga_milstolpar.email (id, mailadress, konto_id) FROM stdin;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('\.');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Data for Name: faciliteter_boende; Type: TABLE DATA; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('COPY miljovanliga_milstolpar.faciliteter_boende (id, solpanel, "energisnål_uppvärmning", wifi, regnvattenuppsamling, "närproducerad_mat", lokala_samarbeten, vegansk_mat, "miljöcertifierad", "hållbara_aktiviteter", vegetarisk_mat, boende_id) FROM stdin;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('\.');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Data for Name: faciliteter_rum; Type: TABLE DATA; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('COPY miljovanliga_milstolpar.faciliteter_rum (id, vattensparande_funktioner, "panoramafönster", hvac, "lågenergi_elutrustning", "timer_på_belysning", "tidsstyrd_uppvärmning", "miljövänliga_möbler", "kassaskåp", kyl, badkar, dusch, tv, minibar) FROM stdin;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('\.');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Data for Name: meddelanden; Type: TABLE DATA; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('COPY miljovanliga_milstolpar.meddelanden (id, "avsändare", meddelande, mottagare, tid, "skickat ") FROM stdin;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('\.');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Data for Name: recension; Type: TABLE DATA; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('COPY miljovanliga_milstolpar.recension (id, bokning_id, konto_id, betyg, beskrivning, tid) FROM stdin;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('\.');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Data for Name: rum; Type: TABLE DATA; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: rum_x_faciliteter_id_seq; Type: SEQUENCE SET; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('COPY miljovanliga_milstolpar.rum (id, nummer, kvm_storlek, pris_per_natt, beskrivning, "snitt_co2_utsläpp", "ditt_co2_utsläpp", boende_id) FROM stdin;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('\.');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Data for Name: rum_x_faciliteter; Type: TABLE DATA; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('COPY miljovanliga_milstolpar.rum_x_faciliteter (id, rum_id, fac_rum_id) FROM stdin;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('\.');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Data for Name: transport; Type: TABLE DATA; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('COPY miljovanliga_milstolpar.transport (id, typ, pris, "avgångsplats", ankomstplats, "snitt_co2_utsläpp", "ditt_co2_utsläpp") FROM stdin;');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('\.');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: adress_id_seq; Type: SEQUENCE SET; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('SELECT pg_catalog.setval(''miljovanliga_milstolpar.adress_id_seq'', 2, true);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: aktivitet_id_seq; Type: SEQUENCE SET; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('SELECT pg_catalog.setval(''miljovanliga_milstolpar.aktivitet_id_seq'', 3, true);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: användare_konto_id_seq; Type: SEQUENCE SET; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('SELECT pg_catalog.setval(''miljovanliga_milstolpar."användare_konto_id_seq"'', 15, true);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: användareuppgifter_id_seq; Type: SEQUENCE SET; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('SELECT pg_catalog.setval(''miljovanliga_milstolpar."användareuppgifter_id_seq"'', 1, false);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: betalning_id_seq; Type: SEQUENCE SET; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('SELECT pg_catalog.setval(''miljovanliga_milstolpar.betalning_id_seq'', 9, true);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: boende_id_seq; Type: SEQUENCE SET; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('SELECT pg_catalog.setval(''miljovanliga_milstolpar.boende_id_seq'', 4, true);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: boende_x_faciliteter_id_seq; Type: SEQUENCE SET; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('SELECT pg_catalog.setval(''miljovanliga_milstolpar.boende_x_faciliteter_id_seq'', 3, true);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: bokning_id_seq; Type: SEQUENCE SET; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('SELECT pg_catalog.setval(''miljovanliga_milstolpar.bokning_id_seq'', 2, true);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: bokning_x_aktivitet_id_seq; Type: SEQUENCE SET; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('SELECT pg_catalog.setval(''miljovanliga_milstolpar.bokning_x_aktivitet_id_seq'', 1, false);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: bokning_x_boende_id_seq; Type: SEQUENCE SET; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('SELECT pg_catalog.setval(''miljovanliga_milstolpar.bokning_x_boende_id_seq'', 2, true);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: bokning_x_transport_id_seq; Type: SEQUENCE SET; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('SELECT pg_catalog.setval(''miljovanliga_milstolpar.bokning_x_transport_id_seq'', 1, false);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: e_mail_id_seq; Type: SEQUENCE SET; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('SELECT pg_catalog.setval(''miljovanliga_milstolpar.e_mail_id_seq'', 15, true);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: faciliteter_boende_id_seq; Type: SEQUENCE SET; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('SELECT pg_catalog.setval(''miljovanliga_milstolpar.faciliteter_boende_id_seq'', 15, true);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: faciliteter_rum_id_seq; Type: SEQUENCE SET; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('SELECT pg_catalog.setval(''miljovanliga_milstolpar.faciliteter_rum_id_seq'', 5, true);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: meddelanden_id_seq; Type: SEQUENCE SET; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('SELECT pg_catalog.setval(''miljovanliga_milstolpar.meddelanden_id_seq'', 1, true);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: recension_id_seq; Type: SEQUENCE SET; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('SELECT pg_catalog.setval(''miljovanliga_milstolpar.recension_id_seq'', 1, false);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: rum_id_seq; Type: SEQUENCE SET; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('SELECT pg_catalog.setval(''miljovanliga_milstolpar.rum_id_seq'', 4, true);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('SELECT pg_catalog.setval(''miljovanliga_milstolpar.rum_x_faciliteter_id_seq'', 4, true);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: transport_id_seq; Type: SEQUENCE SET; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('SELECT pg_catalog.setval(''miljovanliga_milstolpar.transport_id_seq'', 4, true);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: adress adress_pkey; Type: CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE ONLY miljovanliga_milstolpar.adress');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    ADD CONSTRAINT adress_pkey PRIMARY KEY (id);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: aktivitet aktivitet_pkey; Type: CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE ONLY miljovanliga_milstolpar.aktivitet');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    ADD CONSTRAINT aktivitet_pkey PRIMARY KEY (id);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: användare_konto användare_konto_pkey; Type: CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE ONLY miljovanliga_milstolpar."användare_konto"');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    ADD CONSTRAINT "användare_konto_pkey" PRIMARY KEY (id);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: användareuppgifter användareuppgifter_pkey; Type: CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE ONLY miljovanliga_milstolpar."användareuppgifter"');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    ADD CONSTRAINT "användareuppgifter_pkey" PRIMARY KEY (id);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: betalning betalning_pkey; Type: CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE ONLY miljovanliga_milstolpar.betalning');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    ADD CONSTRAINT betalning_pkey PRIMARY KEY (id);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: boende boende_pkey; Type: CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE ONLY miljovanliga_milstolpar.boende');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    ADD CONSTRAINT boende_pkey PRIMARY KEY (id);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: boende_x_faciliteter boende_x_faciliteter_pk; Type: CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE ONLY miljovanliga_milstolpar.boende_x_faciliteter');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    ADD CONSTRAINT boende_x_faciliteter_pk PRIMARY KEY (id);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: bokning bokning_pkey; Type: CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE ONLY miljovanliga_milstolpar.bokning');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    ADD CONSTRAINT bokning_pkey PRIMARY KEY (id);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: bokning_x_aktivitet bokning_x_aktivitet_pkey; Type: CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE ONLY miljovanliga_milstolpar.bokning_x_aktivitet');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    ADD CONSTRAINT bokning_x_aktivitet_pkey PRIMARY KEY (id);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: bokning_x_boende bokning_x_boende_pkey; Type: CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE ONLY miljovanliga_milstolpar.bokning_x_boende');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    ADD CONSTRAINT bokning_x_boende_pkey PRIMARY KEY (id);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: bokning_x_transport bokning_x_transport_pkey; Type: CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE ONLY miljovanliga_milstolpar.bokning_x_transport');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    ADD CONSTRAINT bokning_x_transport_pkey PRIMARY KEY (id);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: email e_mail_pkey; Type: CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE ONLY miljovanliga_milstolpar.email');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    ADD CONSTRAINT e_mail_pkey PRIMARY KEY (id);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: faciliteter_boende faciliteter_boende_pkey; Type: CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE ONLY miljovanliga_milstolpar.faciliteter_boende');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    ADD CONSTRAINT faciliteter_boende_pkey PRIMARY KEY (id);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: faciliteter_rum faciliteter_rum_pkey; Type: CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE ONLY miljovanliga_milstolpar.faciliteter_rum');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    ADD CONSTRAINT faciliteter_rum_pkey PRIMARY KEY (id);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: meddelanden meddelanden_pkey; Type: CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE ONLY miljovanliga_milstolpar.meddelanden');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    ADD CONSTRAINT meddelanden_pkey PRIMARY KEY (id);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: recension recension_pkey; Type: CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE ONLY miljovanliga_milstolpar.recension');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    ADD CONSTRAINT recension_pkey PRIMARY KEY (id);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: rum rum_pkey; Type: CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE ONLY miljovanliga_milstolpar.rum');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    ADD CONSTRAINT rum_pkey PRIMARY KEY (id);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: rum_x_faciliteter rum_x_faciliteter_pkey; Type: CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE ONLY miljovanliga_milstolpar.rum_x_faciliteter');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    ADD CONSTRAINT rum_x_faciliteter_pkey PRIMARY KEY (id);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: transport transport_pkey; Type: CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE ONLY miljovanliga_milstolpar.transport');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    ADD CONSTRAINT transport_pkey PRIMARY KEY (id);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: aktivitet aktivitet_adress_id_fk; Type: FK CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE ONLY miljovanliga_milstolpar.aktivitet');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    ADD CONSTRAINT aktivitet_adress_id_fk FOREIGN KEY (adress_id) REFERENCES miljovanliga_milstolpar.adress(id);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: användare_konto användare_konto_användareuppgifter_id_fk; Type: FK CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE ONLY miljovanliga_milstolpar."användare_konto"');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    ADD CONSTRAINT "användare_konto_användareuppgifter_id_fk" FOREIGN KEY ("användareuppgifter_id") REFERENCES miljovanliga_milstolpar."användareuppgifter"(id);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: användareuppgifter användareuppgifter_adress_id_fk; Type: FK CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE ONLY miljovanliga_milstolpar."användareuppgifter"');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    ADD CONSTRAINT "användareuppgifter_adress_id_fk" FOREIGN KEY (adress_id) REFERENCES miljovanliga_milstolpar.adress(id);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: boende boende_adress_id_fk; Type: FK CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE ONLY miljovanliga_milstolpar.boende');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    ADD CONSTRAINT boende_adress_id_fk FOREIGN KEY (adress_id) REFERENCES miljovanliga_milstolpar.adress(id);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: boende_x_faciliteter boende_x_faciliteter_boende_id_fk; Type: FK CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE ONLY miljovanliga_milstolpar.boende_x_faciliteter');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    ADD CONSTRAINT boende_x_faciliteter_boende_id_fk FOREIGN KEY (boende_id) REFERENCES miljovanliga_milstolpar.boende(id);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: boende_x_faciliteter boende_x_faciliteter_faciliteter_boende_id_fk; Type: FK CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE ONLY miljovanliga_milstolpar.boende_x_faciliteter');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    ADD CONSTRAINT boende_x_faciliteter_faciliteter_boende_id_fk FOREIGN KEY (fac_boende_id) REFERENCES miljovanliga_milstolpar.faciliteter_boende(id);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: bokning bokning_användare_konto_id_fk; Type: FK CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE ONLY miljovanliga_milstolpar.bokning');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    ADD CONSTRAINT "bokning_användare_konto_id_fk" FOREIGN KEY (konto_id) REFERENCES miljovanliga_milstolpar."användare_konto"(id);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: bokning bokning_betalning_id_fk; Type: FK CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE ONLY miljovanliga_milstolpar.bokning');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    ADD CONSTRAINT bokning_betalning_id_fk FOREIGN KEY (betalning_id) REFERENCES miljovanliga_milstolpar.betalning(id);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: bokning_x_aktivitet bokning_x_aktivitet_aktivitet_id_fk; Type: FK CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE ONLY miljovanliga_milstolpar.bokning_x_aktivitet');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    ADD CONSTRAINT bokning_x_aktivitet_aktivitet_id_fk FOREIGN KEY (aktivitet_id) REFERENCES miljovanliga_milstolpar.aktivitet(id);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: bokning_x_aktivitet bokning_x_aktivitet_bokning_id_fk; Type: FK CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE ONLY miljovanliga_milstolpar.bokning_x_aktivitet');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    ADD CONSTRAINT bokning_x_aktivitet_bokning_id_fk FOREIGN KEY (bokning_id) REFERENCES miljovanliga_milstolpar.bokning(id);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: bokning_x_boende bokning_x_boende_boende_id_fk; Type: FK CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE ONLY miljovanliga_milstolpar.bokning_x_boende');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    ADD CONSTRAINT bokning_x_boende_boende_id_fk FOREIGN KEY (boende_id) REFERENCES miljovanliga_milstolpar.boende(id);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: bokning_x_boende bokning_x_boende_bokning_id_fk; Type: FK CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE ONLY miljovanliga_milstolpar.bokning_x_boende');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    ADD CONSTRAINT bokning_x_boende_bokning_id_fk FOREIGN KEY (bokning_id) REFERENCES miljovanliga_milstolpar.bokning(id);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: bokning_x_transport bokning_x_transport_bokning_id_fk; Type: FK CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE ONLY miljovanliga_milstolpar.bokning_x_transport');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    ADD CONSTRAINT bokning_x_transport_bokning_id_fk FOREIGN KEY (bokning_id) REFERENCES miljovanliga_milstolpar.bokning(id);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: bokning_x_transport bokning_x_transport_transport_id_fk; Type: FK CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE ONLY miljovanliga_milstolpar.bokning_x_transport');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    ADD CONSTRAINT bokning_x_transport_transport_id_fk FOREIGN KEY (transport_id) REFERENCES miljovanliga_milstolpar.transport(id);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: email email_användare_konto_id_fk; Type: FK CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE ONLY miljovanliga_milstolpar.email');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    ADD CONSTRAINT "email_användare_konto_id_fk" FOREIGN KEY (konto_id) REFERENCES miljovanliga_milstolpar."användare_konto"(id);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: meddelanden meddelanden_användare_konto_id_fk; Type: FK CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE ONLY miljovanliga_milstolpar.meddelanden');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    ADD CONSTRAINT "meddelanden_användare_konto_id_fk" FOREIGN KEY ("avsändare") REFERENCES miljovanliga_milstolpar."användare_konto"(id);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: meddelanden meddelanden_användare_konto_id_fk_2; Type: FK CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE ONLY miljovanliga_milstolpar.meddelanden');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    ADD CONSTRAINT "meddelanden_användare_konto_id_fk_2" FOREIGN KEY (mottagare) REFERENCES miljovanliga_milstolpar."användare_konto"(id);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: rum rum_boende_id_fk; Type: FK CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE ONLY miljovanliga_milstolpar.rum');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    ADD CONSTRAINT rum_boende_id_fk FOREIGN KEY (boende_id) REFERENCES miljovanliga_milstolpar.boende(id);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: rum_x_faciliteter rum_x_faciliteter_faciliteter_rum_id_fk; Type: FK CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE ONLY miljovanliga_milstolpar.rum_x_faciliteter');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    ADD CONSTRAINT rum_x_faciliteter_faciliteter_rum_id_fk FOREIGN KEY (fac_rum_id) REFERENCES miljovanliga_milstolpar.faciliteter_rum(id);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- Name: rum_x_faciliteter rum_x_faciliteter_rum_id_fk; Type: FK CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('ALTER TABLE ONLY miljovanliga_milstolpar.rum_x_faciliteter');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('    ADD CONSTRAINT rum_x_faciliteter_rum_id_fk FOREIGN KEY (rum_id) REFERENCES miljovanliga_milstolpar.rum(id);');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('-- PostgreSQL database dump complete');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES ('--');
INSERT INTO schema_name.miljovanliga_milstolpar (c1) VALUES (NULL);


--
-- Name: Auktion (Annons)_auktion_id_seq; Type: SEQUENCE SET; Schema: Kzuki Databas; Owner: postgres
--

SELECT pg_catalog.setval('"Kzuki Databas"."Auktion (Annons)_auktion_id_seq"', 15, true);


--
-- Name: adresser_adress_id_seq; Type: SEQUENCE SET; Schema: Kzuki Databas; Owner: postgres
--

SELECT pg_catalog.setval('"Kzuki Databas".adresser_adress_id_seq', 83, true);


--
-- Name: anvandare_anvandare_id_seq; Type: SEQUENCE SET; Schema: Kzuki Databas; Owner: postgres
--

SELECT pg_catalog.setval('"Kzuki Databas".anvandare_anvandare_id_seq', 37, true);


--
-- Name: bilder_id_seq; Type: SEQUENCE SET; Schema: Kzuki Databas; Owner: postgres
--

SELECT pg_catalog.setval('"Kzuki Databas".bilder_id_seq', 62, true);


--
-- Name: bud_bud_id_seq; Type: SEQUENCE SET; Schema: Kzuki Databas; Owner: postgres
--

SELECT pg_catalog.setval('"Kzuki Databas".bud_bud_id_seq', 47, true);


--
-- Name: legenhet_legenhet_id_seq; Type: SEQUENCE SET; Schema: Kzuki Databas; Owner: postgres
--

SELECT pg_catalog.setval('"Kzuki Databas".legenhet_legenhet_id_seq', 17, true);


--
-- Name: objekt_objekt_id_seq; Type: SEQUENCE SET; Schema: Kzuki Databas; Owner: postgres
--

SELECT pg_catalog.setval('"Kzuki Databas".objekt_objekt_id_seq', 30, true);


--
-- Name: tomt_tomt_id_seq; Type: SEQUENCE SET; Schema: Kzuki Databas; Owner: postgres
--

SELECT pg_catalog.setval('"Kzuki Databas".tomt_tomt_id_seq', 7, true);


--
-- Name: villa_villa_id_seq; Type: SEQUENCE SET; Schema: Kzuki Databas; Owner: postgres
--

SELECT pg_catalog.setval('"Kzuki Databas".villa_villa_id_seq', 12, true);


--
-- Name: filmer_id_seq; Type: SEQUENCE SET; Schema: bio; Owner: postgres
--

SELECT pg_catalog.setval('bio.filmer_id_seq', 5, true);


--
-- Name: salonger_id_seq; Type: SEQUENCE SET; Schema: bio; Owner: postgres
--

SELECT pg_catalog.setval('bio.salonger_id_seq', 2, true);


--
-- Name: visningar_id_seq; Type: SEQUENCE SET; Schema: bio; Owner: postgres
--

SELECT pg_catalog.setval('bio.visningar_id_seq', 1, false);


--
-- Name: adresser_id_seq; Type: SEQUENCE SET; Schema: foretagsregister_databas; Owner: postgres
--

SELECT pg_catalog.setval('foretagsregister_databas.adresser_id_seq', 1, false);


--
-- Name: arbetsuppgifter_id_seq; Type: SEQUENCE SET; Schema: foretagsregister_databas; Owner: postgres
--

SELECT pg_catalog.setval('foretagsregister_databas.arbetsuppgifter_id_seq', 1, false);


--
-- Name: bransch_id_seq; Type: SEQUENCE SET; Schema: foretagsregister_databas; Owner: postgres
--

SELECT pg_catalog.setval('foretagsregister_databas.bransch_id_seq', 1, false);


--
-- Name: foretag_id_seq; Type: SEQUENCE SET; Schema: foretagsregister_databas; Owner: postgres
--

SELECT pg_catalog.setval('foretagsregister_databas.foretag_id_seq', 1, false);


--
-- Name: adresser_id_seq; Type: SEQUENCE SET; Schema: homenet; Owner: postgres
--

SELECT pg_catalog.setval('homenet.adresser_id_seq', 1, false);


--
-- Name: maklare_id_seq; Type: SEQUENCE SET; Schema: homenet; Owner: postgres
--

SELECT pg_catalog.setval('homenet.maklare_id_seq', 1, false);


--
-- Name: objekt_id_seq; Type: SEQUENCE SET; Schema: homenet; Owner: postgres
--

SELECT pg_catalog.setval('homenet.objekt_id_seq', 1, false);


--
-- Name: personer_id_seq; Type: SEQUENCE SET; Schema: homenet; Owner: postgres
--

SELECT pg_catalog.setval('homenet.personer_id_seq', 1, false);


--
-- Name: kokboköcker_id_seq; Type: SEQUENCE SET; Schema: kokböckernas Recept; Owner: postgres
--

SELECT pg_catalog.setval('"kokböckernas Recept"."kokboköcker_id_seq"', 1, false);


--
-- Name: kokböcker_med_recept_id_seq; Type: SEQUENCE SET; Schema: kokböckernas Recept; Owner: postgres
--

SELECT pg_catalog.setval('"kokböckernas Recept"."kokböcker_med_recept_id_seq"', 1, false);


--
-- Name: recept_id_seq; Type: SEQUENCE SET; Schema: kokböckernas Recept; Owner: postgres
--

SELECT pg_catalog.setval('"kokböckernas Recept".recept_id_seq', 1, false);


--
-- Name: adress_id_seq; Type: SEQUENCE SET; Schema: miljovanliga_milstolpar; Owner: postgres
--

SELECT pg_catalog.setval('miljovanliga_milstolpar.adress_id_seq', 6, true);


--
-- Name: aktivitet_id_seq; Type: SEQUENCE SET; Schema: miljovanliga_milstolpar; Owner: postgres
--

SELECT pg_catalog.setval('miljovanliga_milstolpar.aktivitet_id_seq', 4, true);


--
-- Name: användare_konto_id_seq; Type: SEQUENCE SET; Schema: miljovanliga_milstolpar; Owner: postgres
--

SELECT pg_catalog.setval('miljovanliga_milstolpar."användare_konto_id_seq"', 15, true);


--
-- Name: användareuppgifter_id_seq; Type: SEQUENCE SET; Schema: miljovanliga_milstolpar; Owner: postgres
--

SELECT pg_catalog.setval('miljovanliga_milstolpar."användareuppgifter_id_seq"', 1, true);


--
-- Name: betalning_id_seq; Type: SEQUENCE SET; Schema: miljovanliga_milstolpar; Owner: postgres
--

SELECT pg_catalog.setval('miljovanliga_milstolpar.betalning_id_seq', 10, true);


--
-- Name: bilder_id_seq; Type: SEQUENCE SET; Schema: miljovanliga_milstolpar; Owner: postgres
--

SELECT pg_catalog.setval('miljovanliga_milstolpar.bilder_id_seq', 152, true);


--
-- Name: boende_id_seq; Type: SEQUENCE SET; Schema: miljovanliga_milstolpar; Owner: postgres
--

SELECT pg_catalog.setval('miljovanliga_milstolpar.boende_id_seq', 4, true);


--
-- Name: bokning_id_seq; Type: SEQUENCE SET; Schema: miljovanliga_milstolpar; Owner: postgres
--

SELECT pg_catalog.setval('miljovanliga_milstolpar.bokning_id_seq', 16, true);


--
-- Name: bokning_x_aktivitet_id_seq; Type: SEQUENCE SET; Schema: miljovanliga_milstolpar; Owner: postgres
--

SELECT pg_catalog.setval('miljovanliga_milstolpar.bokning_x_aktivitet_id_seq', 3, true);


--
-- Name: bokning_x_boende_id_seq; Type: SEQUENCE SET; Schema: miljovanliga_milstolpar; Owner: postgres
--

SELECT pg_catalog.setval('miljovanliga_milstolpar.bokning_x_boende_id_seq', 2, true);


--
-- Name: bokning_x_transport_id_seq; Type: SEQUENCE SET; Schema: miljovanliga_milstolpar; Owner: postgres
--

SELECT pg_catalog.setval('miljovanliga_milstolpar.bokning_x_transport_id_seq', 3, true);


--
-- Name: e_mail_id_seq; Type: SEQUENCE SET; Schema: miljovanliga_milstolpar; Owner: postgres
--

SELECT pg_catalog.setval('miljovanliga_milstolpar.e_mail_id_seq', 46, true);


--
-- Name: faciliteter_boende_id_seq; Type: SEQUENCE SET; Schema: miljovanliga_milstolpar; Owner: postgres
--

SELECT pg_catalog.setval('miljovanliga_milstolpar.faciliteter_boende_id_seq', 16, true);


--
-- Name: faciliteter_rum_id_seq; Type: SEQUENCE SET; Schema: miljovanliga_milstolpar; Owner: postgres
--

SELECT pg_catalog.setval('miljovanliga_milstolpar.faciliteter_rum_id_seq', 6, true);


--
-- Name: meddelanden_id_seq; Type: SEQUENCE SET; Schema: miljovanliga_milstolpar; Owner: postgres
--

SELECT pg_catalog.setval('miljovanliga_milstolpar.meddelanden_id_seq', 2, true);


--
-- Name: medresenär_id_seq; Type: SEQUENCE SET; Schema: miljovanliga_milstolpar; Owner: postgres
--

SELECT pg_catalog.setval('miljovanliga_milstolpar."medresenär_id_seq"', 1, false);


--
-- Name: recension_id_seq; Type: SEQUENCE SET; Schema: miljovanliga_milstolpar; Owner: postgres
--

SELECT pg_catalog.setval('miljovanliga_milstolpar.recension_id_seq', 10, true);


--
-- Name: rum_id_seq; Type: SEQUENCE SET; Schema: miljovanliga_milstolpar; Owner: postgres
--

SELECT pg_catalog.setval('miljovanliga_milstolpar.rum_id_seq', 40, true);


--
-- Name: rum_x_faciliteter_id_seq; Type: SEQUENCE SET; Schema: miljovanliga_milstolpar; Owner: postgres
--

SELECT pg_catalog.setval('miljovanliga_milstolpar.rum_x_faciliteter_id_seq', 42, true);


--
-- Name: transport_id_seq; Type: SEQUENCE SET; Schema: miljovanliga_milstolpar; Owner: postgres
--

SELECT pg_catalog.setval('miljovanliga_milstolpar.transport_id_seq', 10, true);


--
-- Name: foretagsregister_databas; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.foretagsregister_databas', 1, false);


--
-- Name: auktion (Annons) Auktion (Annons)_pk; Type: CONSTRAINT; Schema: Kzuki Databas; Owner: postgres
--

ALTER TABLE ONLY "Kzuki Databas"."auktion (Annons)"
    ADD CONSTRAINT "Auktion (Annons)_pk" PRIMARY KEY (id);


--
-- Name: adresser adresser_pk; Type: CONSTRAINT; Schema: Kzuki Databas; Owner: postgres
--

ALTER TABLE ONLY "Kzuki Databas".adresser
    ADD CONSTRAINT adresser_pk PRIMARY KEY (id);


--
-- Name: anvandare anvandare_pk; Type: CONSTRAINT; Schema: Kzuki Databas; Owner: postgres
--

ALTER TABLE ONLY "Kzuki Databas".anvandare
    ADD CONSTRAINT anvandare_pk PRIMARY KEY (id);


--
-- Name: bilder bilder_pk; Type: CONSTRAINT; Schema: Kzuki Databas; Owner: postgres
--

ALTER TABLE ONLY "Kzuki Databas".bilder
    ADD CONSTRAINT bilder_pk PRIMARY KEY (id);


--
-- Name: bud bud_pk; Type: CONSTRAINT; Schema: Kzuki Databas; Owner: postgres
--

ALTER TABLE ONLY "Kzuki Databas".bud
    ADD CONSTRAINT bud_pk PRIMARY KEY (id);


--
-- Name: legenhet legenhet_pk; Type: CONSTRAINT; Schema: Kzuki Databas; Owner: postgres
--

ALTER TABLE ONLY "Kzuki Databas".legenhet
    ADD CONSTRAINT legenhet_pk PRIMARY KEY (id);


--
-- Name: objekt objekt_pk; Type: CONSTRAINT; Schema: Kzuki Databas; Owner: postgres
--

ALTER TABLE ONLY "Kzuki Databas".objekt
    ADD CONSTRAINT objekt_pk PRIMARY KEY (id);


--
-- Name: tomt tomt_pk; Type: CONSTRAINT; Schema: Kzuki Databas; Owner: postgres
--

ALTER TABLE ONLY "Kzuki Databas".tomt
    ADD CONSTRAINT tomt_pk PRIMARY KEY (id);


--
-- Name: villa villa_pk; Type: CONSTRAINT; Schema: Kzuki Databas; Owner: postgres
--

ALTER TABLE ONLY "Kzuki Databas".villa
    ADD CONSTRAINT villa_pk PRIMARY KEY (id);


--
-- Name: filmer filmer_pk; Type: CONSTRAINT; Schema: bio; Owner: postgres
--

ALTER TABLE ONLY bio.filmer
    ADD CONSTRAINT filmer_pk PRIMARY KEY (id);


--
-- Name: salonger salonger_pk; Type: CONSTRAINT; Schema: bio; Owner: postgres
--

ALTER TABLE ONLY bio.salonger
    ADD CONSTRAINT salonger_pk PRIMARY KEY (id);


--
-- Name: visningar visningar_pk; Type: CONSTRAINT; Schema: bio; Owner: postgres
--

ALTER TABLE ONLY bio.visningar
    ADD CONSTRAINT visningar_pk PRIMARY KEY (id);


--
-- Name: kontakt_info adresser_id_pk; Type: CONSTRAINT; Schema: foretagsregister_databas; Owner: postgres
--

ALTER TABLE ONLY foretagsregister_databas.kontakt_info
    ADD CONSTRAINT adresser_id_pk PRIMARY KEY (id);


--
-- Name: person agare_pk; Type: CONSTRAINT; Schema: foretagsregister_databas; Owner: postgres
--

ALTER TABLE ONLY foretagsregister_databas.person
    ADD CONSTRAINT agare_pk PRIMARY KEY (id);


--
-- Name: arbetsuppgifter arbetsuppgifter_id_pk; Type: CONSTRAINT; Schema: foretagsregister_databas; Owner: postgres
--

ALTER TABLE ONLY foretagsregister_databas.arbetsuppgifter
    ADD CONSTRAINT arbetsuppgifter_id_pk PRIMARY KEY (id);


--
-- Name: bransch bransch_id_pk; Type: CONSTRAINT; Schema: foretagsregister_databas; Owner: postgres
--

ALTER TABLE ONLY foretagsregister_databas.bransch
    ADD CONSTRAINT bransch_id_pk PRIMARY KEY (id);


--
-- Name: foretag_X_person foretag_x_person_pk; Type: CONSTRAINT; Schema: foretagsregister_databas; Owner: postgres
--

ALTER TABLE ONLY foretagsregister_databas."foretag_X_person"
    ADD CONSTRAINT foretag_x_person_pk PRIMARY KEY (person, foretag);


--
-- Name: foretag id_pk; Type: CONSTRAINT; Schema: foretagsregister_databas; Owner: postgres
--

ALTER TABLE ONLY foretagsregister_databas.foretag
    ADD CONSTRAINT id_pk PRIMARY KEY (id);


--
-- Name: adresser adresser_pk; Type: CONSTRAINT; Schema: homenet; Owner: postgres
--

ALTER TABLE ONLY homenet.adresser
    ADD CONSTRAINT adresser_pk PRIMARY KEY (id);


--
-- Name: maklare maklare_pk; Type: CONSTRAINT; Schema: homenet; Owner: postgres
--

ALTER TABLE ONLY homenet.maklare
    ADD CONSTRAINT maklare_pk PRIMARY KEY (id);


--
-- Name: objekt objekt_pk; Type: CONSTRAINT; Schema: homenet; Owner: postgres
--

ALTER TABLE ONLY homenet.objekt
    ADD CONSTRAINT objekt_pk PRIMARY KEY (id);


--
-- Name: personer personer_pk; Type: CONSTRAINT; Schema: homenet; Owner: postgres
--

ALTER TABLE ONLY homenet.personer
    ADD CONSTRAINT personer_pk PRIMARY KEY (id);


--
-- Name: recept id; Type: CONSTRAINT; Schema: kokböckernas Recept; Owner: postgres
--

ALTER TABLE ONLY "kokböckernas Recept".recept
    ADD CONSTRAINT id PRIMARY KEY (id);


--
-- Name: kokböcker kokboköcker_pk; Type: CONSTRAINT; Schema: kokböckernas Recept; Owner: postgres
--

ALTER TABLE ONLY "kokböckernas Recept"."kokböcker"
    ADD CONSTRAINT "kokboköcker_pk" PRIMARY KEY (id);


--
-- Name: kokböcker_med_recept kokböcker_med_recept_pk; Type: CONSTRAINT; Schema: kokböckernas Recept; Owner: postgres
--

ALTER TABLE ONLY "kokböckernas Recept"."kokböcker_med_recept"
    ADD CONSTRAINT "kokböcker_med_recept_pk" PRIMARY KEY (id);


--
-- Name: adress adress_pkey; Type: CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.adress
    ADD CONSTRAINT adress_pkey PRIMARY KEY (id);


--
-- Name: aktivitet aktivitet_pkey; Type: CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.aktivitet
    ADD CONSTRAINT aktivitet_pkey PRIMARY KEY (id);


--
-- Name: användare_konto användare_konto_pkey; Type: CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar."användare_konto"
    ADD CONSTRAINT "användare_konto_pkey" PRIMARY KEY (id);


--
-- Name: användareuppgifter användareuppgifter_pkey; Type: CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar."användareuppgifter"
    ADD CONSTRAINT "användareuppgifter_pkey" PRIMARY KEY (id);


--
-- Name: betalning betalning_pkey; Type: CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.betalning
    ADD CONSTRAINT betalning_pkey PRIMARY KEY (id);


--
-- Name: bilder bilder_pk; Type: CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.bilder
    ADD CONSTRAINT bilder_pk PRIMARY KEY (id);


--
-- Name: boende boende_pkey; Type: CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.boende
    ADD CONSTRAINT boende_pkey PRIMARY KEY (id);


--
-- Name: bokning bokning_pkey; Type: CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.bokning
    ADD CONSTRAINT bokning_pkey PRIMARY KEY (id);


--
-- Name: bokning_x_aktivitet bokning_x_aktivitet_pkey; Type: CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.bokning_x_aktivitet
    ADD CONSTRAINT bokning_x_aktivitet_pkey PRIMARY KEY (id);


--
-- Name: bokning_x_boende bokning_x_boende_pkey; Type: CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.bokning_x_boende
    ADD CONSTRAINT bokning_x_boende_pkey PRIMARY KEY (id);


--
-- Name: bokning_x_resepaket bokning_x_resepaket_pk; Type: CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.bokning_x_resepaket
    ADD CONSTRAINT bokning_x_resepaket_pk PRIMARY KEY (id);


--
-- Name: bokning_x_transport bokning_x_transport_pkey; Type: CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.bokning_x_transport
    ADD CONSTRAINT bokning_x_transport_pkey PRIMARY KEY (id);


--
-- Name: email e_mail_pkey; Type: CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.email
    ADD CONSTRAINT e_mail_pkey PRIMARY KEY (id);


--
-- Name: faciliteter_boende faciliteter_boende_pkey; Type: CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.faciliteter_boende
    ADD CONSTRAINT faciliteter_boende_pkey PRIMARY KEY (id);


--
-- Name: faciliteter_rum faciliteter_rum_pkey; Type: CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.faciliteter_rum
    ADD CONSTRAINT faciliteter_rum_pkey PRIMARY KEY (id);


--
-- Name: meddelanden meddelanden_pkey; Type: CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.meddelanden
    ADD CONSTRAINT meddelanden_pkey PRIMARY KEY (id);


--
-- Name: medresenär medresenär_pk; Type: CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar."medresenär"
    ADD CONSTRAINT "medresenär_pk" PRIMARY KEY (id);


--
-- Name: recension recension_pkey; Type: CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.recension
    ADD CONSTRAINT recension_pkey PRIMARY KEY (id);


--
-- Name: rum rum_pkey; Type: CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.rum
    ADD CONSTRAINT rum_pkey PRIMARY KEY (id);


--
-- Name: rum_x_faciliteter rum_x_faciliteter_pkey; Type: CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.rum_x_faciliteter
    ADD CONSTRAINT rum_x_faciliteter_pkey PRIMARY KEY (id);


--
-- Name: transport transport_pkey; Type: CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.transport
    ADD CONSTRAINT transport_pkey PRIMARY KEY (id);


--
-- Name: användare användare_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."användare"
    ADD CONSTRAINT "användare_pkey" PRIMARY KEY (personid);


--
-- Name: auktion (Annons) Auktion (Annons)_Anvandare_anvandare_id_fk; Type: FK CONSTRAINT; Schema: Kzuki Databas; Owner: postgres
--

ALTER TABLE ONLY "Kzuki Databas"."auktion (Annons)"
    ADD CONSTRAINT "Auktion (Annons)_Anvandare_anvandare_id_fk" FOREIGN KEY (vinnare_id) REFERENCES "Kzuki Databas".anvandare(id);


--
-- Name: auktion (Annons) Auktion (Annons)_Saljare_id_fk; Type: FK CONSTRAINT; Schema: Kzuki Databas; Owner: postgres
--

ALTER TABLE ONLY "Kzuki Databas"."auktion (Annons)"
    ADD CONSTRAINT "Auktion (Annons)_Saljare_id_fk" FOREIGN KEY (saljare_id) REFERENCES "Kzuki Databas".anvandare(id);


--
-- Name: anvandare anvandare_adress_fk; Type: FK CONSTRAINT; Schema: Kzuki Databas; Owner: postgres
--

ALTER TABLE ONLY "Kzuki Databas".anvandare
    ADD CONSTRAINT anvandare_adress_fk FOREIGN KEY (adress) REFERENCES "Kzuki Databas".adresser(id);


--
-- Name: bilder bilder_objekt_fk; Type: FK CONSTRAINT; Schema: Kzuki Databas; Owner: postgres
--

ALTER TABLE ONLY "Kzuki Databas".bilder
    ADD CONSTRAINT bilder_objekt_fk FOREIGN KEY (objekt_id) REFERENCES "Kzuki Databas".objekt(id);


--
-- Name: bud bud_auktion_id_fk; Type: FK CONSTRAINT; Schema: Kzuki Databas; Owner: postgres
--

ALTER TABLE ONLY "Kzuki Databas".bud
    ADD CONSTRAINT bud_auktion_id_fk FOREIGN KEY (auktion_id) REFERENCES "Kzuki Databas"."auktion (Annons)"(id);


--
-- Name: bud bud_budgivare_id_fk; Type: FK CONSTRAINT; Schema: Kzuki Databas; Owner: postgres
--

ALTER TABLE ONLY "Kzuki Databas".bud
    ADD CONSTRAINT bud_budgivare_id_fk FOREIGN KEY (budgivare_id) REFERENCES "Kzuki Databas".anvandare(id);


--
-- Name: legenhet legenhet_objekt_id_fk; Type: FK CONSTRAINT; Schema: Kzuki Databas; Owner: postgres
--

ALTER TABLE ONLY "Kzuki Databas".legenhet
    ADD CONSTRAINT legenhet_objekt_id_fk FOREIGN KEY (objekt_id) REFERENCES "Kzuki Databas".objekt(id);


--
-- Name: objekt objekt_adress_fk; Type: FK CONSTRAINT; Schema: Kzuki Databas; Owner: postgres
--

ALTER TABLE ONLY "Kzuki Databas".objekt
    ADD CONSTRAINT objekt_adress_fk FOREIGN KEY (adress_id) REFERENCES "Kzuki Databas".adresser(id);


--
-- Name: objekt objekt_auktion_id_fk; Type: FK CONSTRAINT; Schema: Kzuki Databas; Owner: postgres
--

ALTER TABLE ONLY "Kzuki Databas".objekt
    ADD CONSTRAINT objekt_auktion_id_fk FOREIGN KEY (auktion_id) REFERENCES "Kzuki Databas"."auktion (Annons)"(id);


--
-- Name: tomt tomt_objekt_id_fk; Type: FK CONSTRAINT; Schema: Kzuki Databas; Owner: postgres
--

ALTER TABLE ONLY "Kzuki Databas".tomt
    ADD CONSTRAINT tomt_objekt_id_fk FOREIGN KEY (objekt_id) REFERENCES "Kzuki Databas".objekt(id);


--
-- Name: villa villa_objekt_id_fk; Type: FK CONSTRAINT; Schema: Kzuki Databas; Owner: postgres
--

ALTER TABLE ONLY "Kzuki Databas".villa
    ADD CONSTRAINT villa_objekt_id_fk FOREIGN KEY (objekt_id) REFERENCES "Kzuki Databas".objekt(id);


--
-- Name: visningar visningar_filmer_id_fk; Type: FK CONSTRAINT; Schema: bio; Owner: postgres
--

ALTER TABLE ONLY bio.visningar
    ADD CONSTRAINT visningar_filmer_id_fk FOREIGN KEY (film_id) REFERENCES bio.filmer(id);


--
-- Name: visningar visningar_salonger_id_fk; Type: FK CONSTRAINT; Schema: bio; Owner: postgres
--

ALTER TABLE ONLY bio.visningar
    ADD CONSTRAINT visningar_salonger_id_fk FOREIGN KEY (salong_id) REFERENCES bio.salonger(id);


--
-- Name: foretag foretag_bransch_fk; Type: FK CONSTRAINT; Schema: foretagsregister_databas; Owner: postgres
--

ALTER TABLE ONLY foretagsregister_databas.foretag
    ADD CONSTRAINT foretag_bransch_fk FOREIGN KEY (bransch) REFERENCES foretagsregister_databas.bransch(id);


--
-- Name: foretag foretag_kontakt_fk; Type: FK CONSTRAINT; Schema: foretagsregister_databas; Owner: postgres
--

ALTER TABLE ONLY foretagsregister_databas.foretag
    ADD CONSTRAINT foretag_kontakt_fk FOREIGN KEY (kontakt_info) REFERENCES foretagsregister_databas.kontakt_info(id);


--
-- Name: foretag_X_person foretag_x_person_arbetsuppgift_fk; Type: FK CONSTRAINT; Schema: foretagsregister_databas; Owner: postgres
--

ALTER TABLE ONLY foretagsregister_databas."foretag_X_person"
    ADD CONSTRAINT foretag_x_person_arbetsuppgift_fk FOREIGN KEY (arbetsuppgift) REFERENCES foretagsregister_databas.arbetsuppgifter(id);


--
-- Name: foretag_X_person foretag_x_person_foretag_fk; Type: FK CONSTRAINT; Schema: foretagsregister_databas; Owner: postgres
--

ALTER TABLE ONLY foretagsregister_databas."foretag_X_person"
    ADD CONSTRAINT foretag_x_person_foretag_fk FOREIGN KEY (foretag) REFERENCES foretagsregister_databas.foretag(id);


--
-- Name: foretag_X_person foretag_x_person_person_fk; Type: FK CONSTRAINT; Schema: foretagsregister_databas; Owner: postgres
--

ALTER TABLE ONLY foretagsregister_databas."foretag_X_person"
    ADD CONSTRAINT foretag_x_person_person_fk FOREIGN KEY (person) REFERENCES foretagsregister_databas.person(id);


--
-- Name: person person_kontakt_info_fk; Type: FK CONSTRAINT; Schema: foretagsregister_databas; Owner: postgres
--

ALTER TABLE ONLY foretagsregister_databas.person
    ADD CONSTRAINT person_kontakt_info_fk FOREIGN KEY (kontakt_info) REFERENCES foretagsregister_databas.kontakt_info(id);


--
-- Name: objekt objekt_adresser_id_fk; Type: FK CONSTRAINT; Schema: homenet; Owner: postgres
--

ALTER TABLE ONLY homenet.objekt
    ADD CONSTRAINT objekt_adresser_id_fk FOREIGN KEY (adress) REFERENCES homenet.adresser(id);


--
-- Name: objekt objekt_maklare_id_fk; Type: FK CONSTRAINT; Schema: homenet; Owner: postgres
--

ALTER TABLE ONLY homenet.objekt
    ADD CONSTRAINT objekt_maklare_id_fk FOREIGN KEY (maklare) REFERENCES homenet.maklare(id);


--
-- Name: objekt objekt_personer_id_fk; Type: FK CONSTRAINT; Schema: homenet; Owner: postgres
--

ALTER TABLE ONLY homenet.objekt
    ADD CONSTRAINT objekt_personer_id_fk FOREIGN KEY (saljare) REFERENCES homenet.personer(id);


--
-- Name: objekt objekt_personer_id_fk_2; Type: FK CONSTRAINT; Schema: homenet; Owner: postgres
--

ALTER TABLE ONLY homenet.objekt
    ADD CONSTRAINT objekt_personer_id_fk_2 FOREIGN KEY (kopare) REFERENCES homenet.personer(id);


--
-- Name: personer personer_adresser_id_fk; Type: FK CONSTRAINT; Schema: homenet; Owner: postgres
--

ALTER TABLE ONLY homenet.personer
    ADD CONSTRAINT personer_adresser_id_fk FOREIGN KEY (adress) REFERENCES homenet.adresser(id);


--
-- Name: kokböcker_med_recept kokböcker_id_fk; Type: FK CONSTRAINT; Schema: kokböckernas Recept; Owner: postgres
--

ALTER TABLE ONLY "kokböckernas Recept"."kokböcker_med_recept"
    ADD CONSTRAINT "kokböcker_id_fk" FOREIGN KEY ("kokböcker_id") REFERENCES "kokböckernas Recept"."kokböcker"(id);


--
-- Name: kokböcker_med_recept recept_id_fk; Type: FK CONSTRAINT; Schema: kokböckernas Recept; Owner: postgres
--

ALTER TABLE ONLY "kokböckernas Recept"."kokböcker_med_recept"
    ADD CONSTRAINT recept_id_fk FOREIGN KEY (recept_id) REFERENCES "kokböckernas Recept".recept(id);


--
-- Name: aktivitet aktivitet_adress_id_fk; Type: FK CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.aktivitet
    ADD CONSTRAINT aktivitet_adress_id_fk FOREIGN KEY (adress_id) REFERENCES miljovanliga_milstolpar.adress(id);


--
-- Name: aktivitet aktivitet_email_fk; Type: FK CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.aktivitet
    ADD CONSTRAINT aktivitet_email_fk FOREIGN KEY (email_id) REFERENCES miljovanliga_milstolpar.email(id);


--
-- Name: användare_konto användare_konto_användareuppgifter_id_fk; Type: FK CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar."användare_konto"
    ADD CONSTRAINT "användare_konto_användareuppgifter_id_fk" FOREIGN KEY ("användareuppgifter_id") REFERENCES miljovanliga_milstolpar."användareuppgifter"(id);


--
-- Name: användare_konto användare_konto_email_id_fk; Type: FK CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar."användare_konto"
    ADD CONSTRAINT "användare_konto_email_id_fk" FOREIGN KEY (email_id) REFERENCES miljovanliga_milstolpar.email(id);


--
-- Name: användareuppgifter användareuppgifter_adress_id_fk; Type: FK CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar."användareuppgifter"
    ADD CONSTRAINT "användareuppgifter_adress_id_fk" FOREIGN KEY (adress_id) REFERENCES miljovanliga_milstolpar.adress(id);


--
-- Name: bilder bilder_aktivitet_fk; Type: FK CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.bilder
    ADD CONSTRAINT bilder_aktivitet_fk FOREIGN KEY (aktivitet_id) REFERENCES miljovanliga_milstolpar.aktivitet(id);


--
-- Name: bilder bilder_boende_fk; Type: FK CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.bilder
    ADD CONSTRAINT bilder_boende_fk FOREIGN KEY (boende_id) REFERENCES miljovanliga_milstolpar.boende(id);


--
-- Name: bilder bilder_rum_fk; Type: FK CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.bilder
    ADD CONSTRAINT bilder_rum_fk FOREIGN KEY (rum_id) REFERENCES miljovanliga_milstolpar.rum(id);


--
-- Name: boende boende_adress_id_fk; Type: FK CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.boende
    ADD CONSTRAINT boende_adress_id_fk FOREIGN KEY (adress_id) REFERENCES miljovanliga_milstolpar.adress(id);


--
-- Name: boende boende_email_fk; Type: FK CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.boende
    ADD CONSTRAINT boende_email_fk FOREIGN KEY (email_id) REFERENCES miljovanliga_milstolpar.email(id);


--
-- Name: bokning bokning_användare_konto_id_fk; Type: FK CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.bokning
    ADD CONSTRAINT "bokning_användare_konto_id_fk" FOREIGN KEY (konto_id) REFERENCES miljovanliga_milstolpar."användare_konto"(id);


--
-- Name: bokning bokning_betalning_id_fk; Type: FK CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.bokning
    ADD CONSTRAINT bokning_betalning_id_fk FOREIGN KEY (betalning_id) REFERENCES miljovanliga_milstolpar.betalning(id);


--
-- Name: bokning_x_aktivitet bokning_x_aktivitet_aktivitet_id_fk; Type: FK CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.bokning_x_aktivitet
    ADD CONSTRAINT bokning_x_aktivitet_aktivitet_id_fk FOREIGN KEY (aktivitet_id) REFERENCES miljovanliga_milstolpar.aktivitet(id);


--
-- Name: bokning_x_aktivitet bokning_x_aktivitet_bokning_id_fk; Type: FK CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.bokning_x_aktivitet
    ADD CONSTRAINT bokning_x_aktivitet_bokning_id_fk FOREIGN KEY (bokning_id) REFERENCES miljovanliga_milstolpar.bokning(id);


--
-- Name: bokning_x_boende bokning_x_boende_bokning_id_fk; Type: FK CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.bokning_x_boende
    ADD CONSTRAINT bokning_x_boende_bokning_id_fk FOREIGN KEY (bokning_id) REFERENCES miljovanliga_milstolpar.bokning(id);


--
-- Name: bokning_x_resepaket bokning_x_resepaket_bokning_fk; Type: FK CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.bokning_x_resepaket
    ADD CONSTRAINT bokning_x_resepaket_bokning_fk FOREIGN KEY (bokning_id) REFERENCES miljovanliga_milstolpar.bokning(id);


--
-- Name: bokning_x_resepaket bokning_x_resepaket_bokningxaktivitet_fk; Type: FK CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.bokning_x_resepaket
    ADD CONSTRAINT bokning_x_resepaket_bokningxaktivitet_fk FOREIGN KEY (bokning_x_aktivitet_id) REFERENCES miljovanliga_milstolpar.bokning_x_aktivitet(id);


--
-- Name: bokning_x_resepaket bokning_x_resepaket_bokningxboende_fk; Type: FK CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.bokning_x_resepaket
    ADD CONSTRAINT bokning_x_resepaket_bokningxboende_fk FOREIGN KEY (bokning_x_boende_id) REFERENCES miljovanliga_milstolpar.bokning_x_boende(id);


--
-- Name: bokning_x_resepaket bokning_x_resepaket_bokningxtransport_fk; Type: FK CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.bokning_x_resepaket
    ADD CONSTRAINT bokning_x_resepaket_bokningxtransport_fk FOREIGN KEY (bokning_x_transport_id) REFERENCES miljovanliga_milstolpar.bokning_x_transport(id);


--
-- Name: bokning_x_boende bokning_x_rum_id_fk; Type: FK CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.bokning_x_boende
    ADD CONSTRAINT bokning_x_rum_id_fk FOREIGN KEY (rum_id) REFERENCES miljovanliga_milstolpar.rum(id);


--
-- Name: bokning_x_transport bokning_x_transport_bokning_id_fk; Type: FK CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.bokning_x_transport
    ADD CONSTRAINT bokning_x_transport_bokning_id_fk FOREIGN KEY (bokning_id) REFERENCES miljovanliga_milstolpar.bokning(id);


--
-- Name: bokning_x_transport bokning_x_transport_transport_id_fk; Type: FK CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.bokning_x_transport
    ADD CONSTRAINT bokning_x_transport_transport_id_fk FOREIGN KEY (transport_id) REFERENCES miljovanliga_milstolpar.transport(id);


--
-- Name: faciliteter_boende faciliteter_boende_boende_id_fk; Type: FK CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.faciliteter_boende
    ADD CONSTRAINT faciliteter_boende_boende_id_fk FOREIGN KEY (boende_id) REFERENCES miljovanliga_milstolpar.boende(id);


--
-- Name: meddelanden meddelanden_användare_konto_id_fk; Type: FK CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.meddelanden
    ADD CONSTRAINT "meddelanden_användare_konto_id_fk" FOREIGN KEY ("avsändare") REFERENCES miljovanliga_milstolpar."användare_konto"(id);


--
-- Name: meddelanden meddelanden_användare_konto_id_fk_2; Type: FK CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.meddelanden
    ADD CONSTRAINT "meddelanden_användare_konto_id_fk_2" FOREIGN KEY (mottagare) REFERENCES miljovanliga_milstolpar."användare_konto"(id);


--
-- Name: medresenär medresenär_användareuppgifter_fk; Type: FK CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar."medresenär"
    ADD CONSTRAINT "medresenär_användareuppgifter_fk" FOREIGN KEY ("medresenäruppgifter_id") REFERENCES miljovanliga_milstolpar."användareuppgifter"(id);


--
-- Name: medresenär medresenär_bokning_fk; Type: FK CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar."medresenär"
    ADD CONSTRAINT "medresenär_bokning_fk" FOREIGN KEY (bokning_id) REFERENCES miljovanliga_milstolpar.bokning(id);


--
-- Name: recension recension_användare_konto_id_fk; Type: FK CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.recension
    ADD CONSTRAINT "recension_användare_konto_id_fk" FOREIGN KEY (konto_id) REFERENCES miljovanliga_milstolpar."användare_konto"(id);


--
-- Name: recension recension_bokning_id_fk; Type: FK CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.recension
    ADD CONSTRAINT recension_bokning_id_fk FOREIGN KEY (bokning_id) REFERENCES miljovanliga_milstolpar.bokning(id);


--
-- Name: rum rum_boende_id_fk; Type: FK CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.rum
    ADD CONSTRAINT rum_boende_id_fk FOREIGN KEY (boende_id) REFERENCES miljovanliga_milstolpar.boende(id);


--
-- Name: rum_x_faciliteter rum_x_faciliteter_faciliteter_rum_id_fk; Type: FK CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.rum_x_faciliteter
    ADD CONSTRAINT rum_x_faciliteter_faciliteter_rum_id_fk FOREIGN KEY (fac_rum_id) REFERENCES miljovanliga_milstolpar.faciliteter_rum(id);


--
-- Name: rum_x_faciliteter rum_x_faciliteter_rum_id_fk; Type: FK CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.rum_x_faciliteter
    ADD CONSTRAINT rum_x_faciliteter_rum_id_fk FOREIGN KEY (rum_id) REFERENCES miljovanliga_milstolpar.rum(id);


--
-- Name: transport transport_adress_id_fk; Type: FK CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.transport
    ADD CONSTRAINT transport_adress_id_fk FOREIGN KEY (ankomstplats) REFERENCES miljovanliga_milstolpar.adress(id);


--
-- Name: transport transport_adress_id_fk_2; Type: FK CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.transport
    ADD CONSTRAINT transport_adress_id_fk_2 FOREIGN KEY ("avgångsplats") REFERENCES miljovanliga_milstolpar.adress(id);


--
-- Name: transport transport_email_fk; Type: FK CONSTRAINT; Schema: miljovanliga_milstolpar; Owner: postgres
--

ALTER TABLE ONLY miljovanliga_milstolpar.transport
    ADD CONSTRAINT transport_email_fk FOREIGN KEY (email_id) REFERENCES miljovanliga_milstolpar.email(id);


--
-- PostgreSQL database dump complete
--

