--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guessing;
--
-- Name: number_guessing; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guessing WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guessing OWNER TO freecodecamp;

\connect number_guessing

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
-- Name: gamedata; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.gamedata (
    username character varying(22) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.gamedata OWNER TO freecodecamp;

--
-- Data for Name: gamedata; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.gamedata VALUES ('user_1722703487378', 2, 7);
INSERT INTO public.gamedata VALUES ('user_1722706212979', 5, 425);
INSERT INTO public.gamedata VALUES ('user_1722703487379', 5, 4);
INSERT INTO public.gamedata VALUES ('user_1722703661323', 2, 6);
INSERT INTO public.gamedata VALUES ('user_1722703661324', 5, 2);
INSERT INTO public.gamedata VALUES ('user_1722704319620', 2, 3);
INSERT INTO public.gamedata VALUES ('user_1722703554854', 2, 4);
INSERT INTO public.gamedata VALUES ('user_1722704980638', NULL, NULL);
INSERT INTO public.gamedata VALUES ('user_1722704684045', 2, 158);
INSERT INTO public.gamedata VALUES ('user_1722703554855', 5, 1);
INSERT INTO public.gamedata VALUES ('user_1722704319621', 5, 6);
INSERT INTO public.gamedata VALUES ('user_1722706024199', 5, 130);
INSERT INTO public.gamedata VALUES ('user_1722703664062', 2, 3);
INSERT INTO public.gamedata VALUES ('user_1722704980639', NULL, NULL);
INSERT INTO public.gamedata VALUES ('user_1722703605526', 2, 5);
INSERT INTO public.gamedata VALUES ('user_1722703664063', 5, 4);
INSERT INTO public.gamedata VALUES ('user_1722703605527', 5, 2);
INSERT INTO public.gamedata VALUES ('user_1722704684046', 5, 113);
INSERT INTO public.gamedata VALUES ('user_1722704321847', 2, 8);
INSERT INTO public.gamedata VALUES ('user_1722703607371', 2, 2);
INSERT INTO public.gamedata VALUES ('user_1722705751410', 5, 104);
INSERT INTO public.gamedata VALUES ('user_1722703745113', 2, 3);
INSERT INTO public.gamedata VALUES ('user_1722703607372', 5, 3);
INSERT INTO public.gamedata VALUES ('user_1722705736391', 2, 66);
INSERT INTO public.gamedata VALUES ('user_1722704321848', 5, 4);
INSERT INTO public.gamedata VALUES ('user_1722703745114', 5, 3);
INSERT INTO public.gamedata VALUES ('user_1722703609449', 2, 4);
INSERT INTO public.gamedata VALUES ('user_1722703609450', 5, 4);
INSERT INTO public.gamedata VALUES ('user_1722705590716', 2, 324);
INSERT INTO public.gamedata VALUES ('user_1722704689516', 2, 168);
INSERT INTO public.gamedata VALUES ('user_1722703747041', 2, 5);
INSERT INTO public.gamedata VALUES ('user_1722705349633', 2, 328);
INSERT INTO public.gamedata VALUES ('user_1722703611963', 2, 2);
INSERT INTO public.gamedata VALUES ('user_1722703747042', 5, 6);
INSERT INTO public.gamedata VALUES ('user_17227033837253456', NULL, NULL);
INSERT INTO public.gamedata VALUES ('user_1722703611964', 5, 6);
INSERT INTO public.gamedata VALUES ('user_1722703487377', 1, 3);
INSERT INTO public.gamedata VALUES ('user_1722704382582', 2, 10);
INSERT INTO public.gamedata VALUES ('user_1722705773410', 2, 51);
INSERT INTO public.gamedata VALUES ('user_1722705736392', 5, 44);
INSERT INTO public.gamedata VALUES ('user_1722704689517', 5, 13);
INSERT INTO public.gamedata VALUES ('user_1722704382583', 5, 2);
INSERT INTO public.gamedata VALUES ('user_1722704314799', 2, 2);
INSERT INTO public.gamedata VALUES ('user_1722705349634', 5, 21);
INSERT INTO public.gamedata VALUES ('user_1722705590717', 5, 15);
INSERT INTO public.gamedata VALUES ('user_1722704314800', 5, 2);
INSERT INTO public.gamedata VALUES ('user_1722704385439', 2, 4);
INSERT INTO public.gamedata VALUES ('user_1722704317448', 2, 7);
INSERT INTO public.gamedata VALUES ('user_1722704694146', 2, 135);
INSERT INTO public.gamedata VALUES ('user_1722704317449', 5, 6);
INSERT INTO public.gamedata VALUES ('user_1722704385440', 5, 2);
INSERT INTO public.gamedata VALUES ('user_1722704694147', 5, 288);
INSERT INTO public.gamedata VALUES ('user_1722706350110', 2, 539);
INSERT INTO public.gamedata VALUES ('user_1722705372468', 2, 137);
INSERT INTO public.gamedata VALUES ('user_1722704453290', 2, 10);
INSERT INTO public.gamedata VALUES ('user_1722705372469', 5, 26);
INSERT INTO public.gamedata VALUES ('user_1722704453291', 5, 1);
INSERT INTO public.gamedata VALUES ('aksi123', 1, 0);
INSERT INTO public.gamedata VALUES ('aks901212wdwq23', 1, 0);
INSERT INTO public.gamedata VALUES ('user_1722704811220', 2, 306);
INSERT INTO public.gamedata VALUES ('user_1722704811221', 5, 199);
INSERT INTO public.gamedata VALUES ('user_1722705716562', 2, 740);
INSERT INTO public.gamedata VALUES ('user_1722704609556', 2, 590);
INSERT INTO public.gamedata VALUES ('user_1722705773411', 5, 270);
INSERT INTO public.gamedata VALUES ('user_1722704609557', 5, 59);
INSERT INTO public.gamedata VALUES ('user_1722704963931', NULL, NULL);
INSERT INTO public.gamedata VALUES ('user_1722705741410', 2, 621);
INSERT INTO public.gamedata VALUES ('user_1722705716563', 5, 89);
INSERT INTO public.gamedata VALUES ('user_1722704963932', NULL, NULL);
INSERT INTO public.gamedata VALUES ('user_1722705381438', 2, 550);
INSERT INTO public.gamedata VALUES ('user_1722704968974', NULL, NULL);
INSERT INTO public.gamedata VALUES ('user_1722705381439', 5, 2);
INSERT INTO public.gamedata VALUES ('user_1722704968975', NULL, NULL);
INSERT INTO public.gamedata VALUES ('user_1722705755233', 2, 547);
INSERT INTO public.gamedata VALUES ('user_1722706447159', 5, 219);
INSERT INTO public.gamedata VALUES ('user_1722705741411', 5, 281);
INSERT INTO public.gamedata VALUES ('user_1722704972725', NULL, NULL);
INSERT INTO public.gamedata VALUES ('user_1722704972726', NULL, NULL);
INSERT INTO public.gamedata VALUES ('user_1722705384158', 2, 562);
INSERT INTO public.gamedata VALUES ('user_1722706350111', 5, 146);
INSERT INTO public.gamedata VALUES ('user_1722705722819', 2, 292);
INSERT INTO public.gamedata VALUES ('user_1722705384159', 5, 191);
INSERT INTO public.gamedata VALUES ('user_1722705755234', 5, 236);
INSERT INTO public.gamedata VALUES ('user_1722705722820', 5, 164);
INSERT INTO public.gamedata VALUES ('user_1722705386960', 2, 170);
INSERT INTO public.gamedata VALUES ('user_1722705747030', 2, 944);
INSERT INTO public.gamedata VALUES ('user_1722705386961', 5, 740);
INSERT INTO public.gamedata VALUES ('user_1722706029622', 2, 396);
INSERT INTO public.gamedata VALUES ('user_1722705731325', 2, 201);
INSERT INTO public.gamedata VALUES ('user_1722705747031', 5, 122);
INSERT INTO public.gamedata VALUES ('user_1722705731326', 5, 193);
INSERT INTO public.gamedata VALUES ('user_1722705775825', 2, 494);
INSERT INTO public.gamedata VALUES ('user_1722706293171', 2, 221);
INSERT INTO public.gamedata VALUES ('user_1722705764323', 2, 121);
INSERT INTO public.gamedata VALUES ('user_1722705775826', 5, 281);
INSERT INTO public.gamedata VALUES ('user_1722706029623', 5, 14);
INSERT INTO public.gamedata VALUES ('user_1722705751409', 2, 64);
INSERT INTO public.gamedata VALUES ('user_1722705764324', 5, 56);
INSERT INTO public.gamedata VALUES ('user_1722706412081', 2, 168);
INSERT INTO public.gamedata VALUES ('user_1722706404868', 2, 550);
INSERT INTO public.gamedata VALUES ('user_1722706366397', 2, 535);
INSERT INTO public.gamedata VALUES ('user_1722706293172', 5, 297);
INSERT INTO public.gamedata VALUES ('user_1722706024198', 2, 806);
INSERT INTO public.gamedata VALUES ('user_1722706212978', 2, 153);
INSERT INTO public.gamedata VALUES ('user_1722706352924', 2, 358);
INSERT INTO public.gamedata VALUES ('user_1722706404869', 5, 51);
INSERT INTO public.gamedata VALUES ('user_1722706366398', 5, 6);
INSERT INTO public.gamedata VALUES ('user_1722706352925', 5, 204);
INSERT INTO public.gamedata VALUES ('user_1722706412082', 5, 57);
INSERT INTO public.gamedata VALUES ('user_1722706447158', 2, 523);


--
-- Name: gamedata gamedata_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.gamedata
    ADD CONSTRAINT gamedata_pkey PRIMARY KEY (username);


--
-- PostgreSQL database dump complete
--

