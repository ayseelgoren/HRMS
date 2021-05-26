--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3
-- Dumped by pg_dump version 13.3

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
-- Name: email_verification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.email_verification (
    id integer NOT NULL,
    user_id integer NOT NULL,
    token character varying NOT NULL,
    state boolean NOT NULL
);


ALTER TABLE public.email_verification OWNER TO postgres;

--
-- Name: employers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employers (
    id integer NOT NULL,
    company_name character varying(100) NOT NULL,
    company_email character varying(100) NOT NULL,
    website_address character varying(100) NOT NULL,
    phone_number character varying(100) NOT NULL
);


ALTER TABLE public.employers OWNER TO postgres;

--
-- Name: job_positions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_positions (
    id integer NOT NULL,
    position_name character varying NOT NULL
);


ALTER TABLE public.job_positions OWNER TO postgres;

--
-- Name: job_seekers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_seekers (
    id integer NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    identity_number integer NOT NULL,
    birth_date date NOT NULL
);


ALTER TABLE public.job_seekers OWNER TO postgres;

--
-- Name: mernis_verification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mernis_verification (
    id integer NOT NULL,
    user_id integer NOT NULL,
    state boolean NOT NULL
);


ALTER TABLE public.mernis_verification OWNER TO postgres;

--
-- Name: system_personnel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_personnel (
    id integer NOT NULL,
    position_name character varying NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL
);


ALTER TABLE public.system_personnel OWNER TO postgres;

--
-- Name: system_personnel_verification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_personnel_verification (
    id integer NOT NULL,
    employer_id integer NOT NULL,
    system_personnel_id integer NOT NULL,
    state boolean NOT NULL
);


ALTER TABLE public.system_personnel_verification OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(50) NOT NULL,
    password character varying(100) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: email_verification email_verification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email_verification
    ADD CONSTRAINT email_verification_pkey PRIMARY KEY (id);


--
-- Name: employers employers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employers
    ADD CONSTRAINT employers_pkey PRIMARY KEY (id) INCLUDE (id);


--
-- Name: job_positions job_positions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_positions
    ADD CONSTRAINT job_positions_pkey PRIMARY KEY (id);


--
-- Name: job_seekers job_seekers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_seekers
    ADD CONSTRAINT job_seekers_pkey PRIMARY KEY (id);


--
-- Name: mernis_verification mernis_verification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mernis_verification
    ADD CONSTRAINT mernis_verification_pkey PRIMARY KEY (id);


--
-- Name: system_personnel system_personnel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_personnel
    ADD CONSTRAINT system_personnel_pkey PRIMARY KEY (id);


--
-- Name: system_personnel_verification system_personnel_verification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_personnel_verification
    ADD CONSTRAINT system_personnel_verification_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: fki_email_user_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_email_user_fkey ON public.email_verification USING btree (user_id);


--
-- Name: fki_employer_personel_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_employer_personel_fkey ON public.system_personnel_verification USING btree (employer_id);


--
-- Name: fki_mernis_user_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_mernis_user_fkey ON public.mernis_verification USING btree (user_id);


--
-- Name: fki_peronel_systempersonel_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_peronel_systempersonel_fkey ON public.system_personnel_verification USING btree (system_personnel_id);


--
-- Name: email_verification email_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email_verification
    ADD CONSTRAINT email_user_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) NOT VALID;


--
-- Name: users employer_key; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT employer_key FOREIGN KEY (id) REFERENCES public.employers(id) NOT VALID;


--
-- Name: system_personnel_verification employer_personel_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_personnel_verification
    ADD CONSTRAINT employer_personel_fkey FOREIGN KEY (employer_id) REFERENCES public.employers(id) NOT VALID;


--
-- Name: users job_seeker_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT job_seeker_fkey FOREIGN KEY (id) REFERENCES public.job_seekers(id) NOT VALID;


--
-- Name: mernis_verification mernis_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mernis_verification
    ADD CONSTRAINT mernis_user_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) NOT VALID;


--
-- Name: system_personnel_verification peronel_systempersonel_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_personnel_verification
    ADD CONSTRAINT peronel_systempersonel_fkey FOREIGN KEY (system_personnel_id) REFERENCES public.system_personnel(id) NOT VALID;


--
-- Name: users system_personnel_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT system_personnel_fkey FOREIGN KEY (id) REFERENCES public.system_personnel(id) NOT VALID;


--
-- PostgreSQL database dump complete
--

