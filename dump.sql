--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: club; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.club (
    city character varying(50),
    numtophywon integer,
    clubestablishedyear integer,
    clubname character varying(50),
    c_id integer NOT NULL
);


--
-- Name: clubmembers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.clubmembers (
    firstname character varying(50),
    lastname character varying(50),
    clubname character varying(50),
    age integer,
    nation character varying(50),
    id integer NOT NULL,
    n_id integer
);


--
-- Name: clubmemberssalary; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.clubmemberssalary (
    salary integer,
    id integer,
    c_id integer
);


--
-- Name: manager; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.manager (
    id integer
)
INHERITS (public.clubmembers);


--
-- Name: nationalteam; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nationalteam (
    n_id integer NOT NULL,
    countryname character varying(50),
    award integer
);


--
-- Name: players; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.players (
    id integer,
    "position" character varying(50)
)
INHERITS (public.clubmembers);


--
-- Data for Name: club; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.club (city, numtophywon, clubestablishedyear, clubname, c_id) FROM stdin;
London	6	1930	Manchester United	200
Paris	14	1880	PSG	201
Barcelona	15	1850	FC Barcelona	202
Munich	2	1970	Bayern	203
\.


--
-- Data for Name: clubmembers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.clubmembers (firstname, lastname, clubname, age, nation, id, n_id) FROM stdin;
\.


--
-- Data for Name: clubmemberssalary; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.clubmemberssalary (salary, id, c_id) FROM stdin;
\.


--
-- Data for Name: manager; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.manager (firstname, lastname, clubname, age, nation, id, n_id) FROM stdin;
Ralf	Rangnick	Manchester United	50	UK	5	103
Mauricio	Pochettino	Paris	52	Paris	6	100
Bob	Dumar	Bayern	25	Germany	4	103
Amit	Anand	Liverpool	51	UK	10	104
Roberto	Machino	FC Barcelona	60	Spain	11	105
John	Doe	Arsenal	65	UK	12	106
\.


--
-- Data for Name: nationalteam; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nationalteam (n_id, countryname, award) FROM stdin;
100	Germany	12
101	Argentina	8
102	India	50
103	Netherlands	3
104	Portugal	14
105	Spain	25
106	Italy	20
\.


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.players (firstname, lastname, clubname, age, nation, id, "position", n_id) FROM stdin;
Cristiano	Ronaldo	Manchester United	33	UK	1	Striker	100
Lionel	Messi	PSG	30	UK	2	Striker	101
Jai	Gujral	Arsenal	18	UK	7	Defensive Back	101
Andy	Gujral	FC Barcelona	21	Barcelona	3	Defensive Back	102
Archie	Manning	Bayern	20	Munich	74	Defensive Back	104
Joe	Steimer	Bayern	29	Munich	75	Striker	102
Mohamed	Salah	Liverpool	27	UK	8	Striker	104
Robert	Lewandowski	Bayern	28	Germany	9	midfielder	104
Johnson	Ernie	Bayern	33	Munich	76	Striker	103
Mason	Smith	Manchester United	34	UK	13	Striker	106
Fred	Erentz	Manchester United	54	Paris	14	Striker	103
Joe	Cassidy	Manchester United	22	UK	15	Defensive Back	101
Billy	Zak	Manchester United	19	UK	16	midfielder	100
Frank	Barrett	Manchester United	43	UK	17	midfielder	102
Harry	Moger	Manchester United	44	UK	18	Defensive Back	101
Charlie	Lager	Manchester United	48	UK	19	Striker	103
Vincent	Burchell	Manchester United	25	UK	20	Striker	100
Yuki	Zulu	Manchester United	38	UK	21	midfielder	105
Noel	Flowers	Manchester United	39	UK	22	midfielder	104
Martin	Leach	Manchester United	42	UK	23	midfielder	100
Vettori	Marvin	PSG	23	Paris	24	Striker	101
Chet	Cantona	PSG	24	Paris	39	Striker	104
Jorge	Valen	PSG	25	Paris	41	Striker	100
Esteban	Gravito	PSG	26	Paris	44	Striker	103
Phoenix	Sullivan	PSG	27	Paris	32	Striker	101
George	Routon	PSG	28	Paris	28	Striker	106
James	Brown	PSG	29	Paris	38	Striker	105
Ricky	McKay	PSG	30	Paris	29	Striker	100
Jacob	Ragav	PSG	44	Paris	30	midfielder	102
Lal	Silock	PSG	47	Paris	31	midfielder	103
Charlie	Spencer	PSG	26	Paris	33	midfielder	106
Louis	Page	PSG	21	Paris	34	midfielder	105
Bourdouis	Wilson	PSG	38	Paris	35	midfielder	101
Hamilton	Peddie	PSG	38	Paris	36	midfielder	106
Nuno	Mendes	PSG	45	Paris	37	Defensive Back	102
Jack	Crujente	PSG	45	Paris	40	Defensive Back	100
Dani	Franchi	PSG	45	Paris	42	Defensive Back	100
Archie	Cross	Arsenal	23	UK	43	Striker	106
Jimmy	Dick	Arsenal	27	UK	45	Striker	102
Tim	Coleman	Arsenal	27	UK	46	Striker	103
Manning	Cooks	Arsenal	47	UK	47	Striker	105
Percy	Sands	Arsenal	33	UK	48	Defensive Back	101
Mike	Thorton	Arsenal	33	UK	49	Defensive Back	101
David	Neave	Arsenal	22	UK	50	Defensive Back	101
Jones	Ducat	Arsenal	28	UK	51	Defensive Back	101
David	Greenaway	FC Barcelona	30	Barcelona	52	Defensive Back	106
Charles	Lewis	FC Barcelona	36	Barcelona	53	Striker	102
Alex	Graham	FC Barcelona	38	Barcelona	54	Striker	100
Max	Flannigan	FC Barcelona	39	Barcelona	55	Striker	100
Joe	Shaw	FC Barcelona	46	Barcelona	56	midfielder	103
Kobe	James	FC Barcelona	53	Barcelona	57	midfielder	104
Ja	Morant	FC Barcelona	53	Barcelona	58	midfielder	102
Naz	Hayes	FC Barcelona	53	Barcelona	59	Defensive Back	102
Patrick	Bayne	FC Barcelona	34	Barcelona	60	Defensive Back	105
Dillon	Desmond	FC Barcelona	40	Barcelona	61	Defensive Back	106
Wayne	Rooney	Liverpool	30	UK	62	Strker	102
Beasley	Dylan	Liverpool	32	UK	63	Strker	102
Jared	McDaniels	Liverpool	47	UK	64	Strker	102
Anthony	Cooks	Liverpool	47	UK	65	Strker	106
Tyus	Jones	Liverpool	19	UK	66	midfielder	106
Jared	Allen	Liverpool	20	UK	67	midfielder	106
Marcus	Smart	Liverpool	20	UK	68	Defensive Back	105
Jayson	Tatum	Liverpool	31	UK	69	Defensive Back	105
Jordan	Poole	Liverpool	31	UK	70	Defensive Back	100
Klay	Curry	Bayern	31	Munich	71	Defensive Back	100
Billy	Blythe	Bayern	18	Munich	72	Defensive Back	101
Henry	White	Bayern	20	Munich	73	Defensive Back	102
Robert	Horry	Bayern	41	Munich	77	Striker	106
Bogan	Bogdonovic	Bayern	45	Munich	78	midfielder	106
Trae	Butler	Bayern	45	Munich	79	midfielder	100
Booker	Devin	Bayern	47	Munich	80	midfielder	100
\.


--
-- Name: club club_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.club
    ADD CONSTRAINT club_pkey PRIMARY KEY (c_id);


--
-- Name: clubmembers clubmembers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clubmembers
    ADD CONSTRAINT clubmembers_pkey PRIMARY KEY (id);


--
-- Name: manager manager_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.manager
    ADD CONSTRAINT manager_pkey PRIMARY KEY (id);


--
-- Name: nationalteam nationalteam_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nationalteam
    ADD CONSTRAINT nationalteam_pkey PRIMARY KEY (n_id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);


--
-- Name: clubmembers clubmembers_n_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clubmembers
    ADD CONSTRAINT clubmembers_n_id_fkey FOREIGN KEY (n_id) REFERENCES public.nationalteam(n_id);


--
-- Name: clubmemberssalary clubmemberssalary_c_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clubmemberssalary
    ADD CONSTRAINT clubmemberssalary_c_id_fkey FOREIGN KEY (c_id) REFERENCES public.club(c_id);


--
-- Name: clubmemberssalary clubmemberssalary_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clubmemberssalary
    ADD CONSTRAINT clubmemberssalary_id_fkey FOREIGN KEY (id) REFERENCES public.clubmembers(id);


--
-- PostgreSQL database dump complete
--

