--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.7
-- Dumped by pg_dump version 9.6.7

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public.system_systemuser_user_permissions DROP CONSTRAINT system_systemuser_us_systemuser_id_1ff05170_fk_system_sy;
ALTER TABLE ONLY public.system_systemuser_user_permissions DROP CONSTRAINT system_systemuser_us_permission_id_e5fd2ed6_fk_auth_perm;
ALTER TABLE ONLY public.system_systemuser_groups DROP CONSTRAINT system_systemuser_groups_group_id_a58c4c00_fk_auth_group_id;
ALTER TABLE ONLY public.system_systemuser_groups DROP CONSTRAINT system_systemuser_gr_systemuser_id_df6b4a06_fk_system_sy;
ALTER TABLE ONLY public.round_groupteam DROP CONSTRAINT round_groupteam_team_id_d4b796e1_fk_team_team_id;
ALTER TABLE ONLY public.round_groupteam DROP CONSTRAINT round_groupteam_group_id_a7007837_fk_round_group_id;
ALTER TABLE ONLY public.prediction_userpoints DROP CONSTRAINT prediction_userpoints_user_id_c6c2f76c_fk_system_systemuser_id;
ALTER TABLE ONLY public.prediction_prediction DROP CONSTRAINT prediction_prediction_user_id_fa8fd0d0_fk_system_systemuser_id;
ALTER TABLE ONLY public.prediction_prediction DROP CONSTRAINT prediction_prediction_match_id_5ee2b5e0_fk_match_match_id;
ALTER TABLE ONLY public.prediction_extraquestions DROP CONSTRAINT prediction_extraquestions_group_id_3bfc3948_fk_round_group_id;
ALTER TABLE ONLY public.prediction_extraquestionsuseranswers DROP CONSTRAINT prediction_extraques_user_id_6bbea3d6_fk_system_sy;
ALTER TABLE ONLY public.prediction_extraquestionsuseranswers DROP CONSTRAINT prediction_extraques_question_id_d6e56804_fk_predictio;
ALTER TABLE ONLY public.match_match DROP CONSTRAINT "match_match_teamHome_id_04ed0769_fk_team_team_id";
ALTER TABLE ONLY public.match_match DROP CONSTRAINT "match_match_teamAway_id_fd68cd9e_fk_team_team_id";
ALTER TABLE ONLY public.match_match DROP CONSTRAINT match_match_stadium_id_014e2990_fk_places_stadium_id;
ALTER TABLE ONLY public.match_match DROP CONSTRAINT match_match_score_id_03c69dab_fk_match_score_id;
ALTER TABLE ONLY public.match_match DROP CONSTRAINT match_match_round_id_a86f8e09_fk_round_round_id;
ALTER TABLE ONLY public.match_match DROP CONSTRAINT match_match_group_id_0dbb27e7_fk_round_group_id;
ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_system_systemuser_id;
ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
ALTER TABLE ONLY public.authtoken_token DROP CONSTRAINT authtoken_token_user_id_35299eff_fk_system_systemuser_id;
ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
ALTER TABLE ONLY public.account_emailconfirmation DROP CONSTRAINT account_emailconfirm_email_address_id_5b7f8c58_fk_account_e;
ALTER TABLE ONLY public.account_emailaddress DROP CONSTRAINT account_emailaddress_user_id_2c513194_fk_system_systemuser_id;
DROP INDEX public.system_systemuser_username_8d24e4e0_like;
DROP INDEX public.system_systemuser_user_permissions_systemuser_id_1ff05170;
DROP INDEX public.system_systemuser_user_permissions_permission_id_e5fd2ed6;
DROP INDEX public.system_systemuser_groups_systemuser_id_df6b4a06;
DROP INDEX public.system_systemuser_groups_group_id_a58c4c00;
DROP INDEX public.round_groupteam_team_id_d4b796e1;
DROP INDEX public.round_groupteam_group_id_a7007837;
DROP INDEX public.prediction_userpoints_user_id_c6c2f76c;
DROP INDEX public.prediction_prediction_user_id_fa8fd0d0;
DROP INDEX public.prediction_prediction_match_id_5ee2b5e0;
DROP INDEX public.prediction_extraquestionsuseranswers_user_id_6bbea3d6;
DROP INDEX public.prediction_extraquestionsuseranswers_question_id_d6e56804;
DROP INDEX public.prediction_extraquestions_group_id_3bfc3948;
DROP INDEX public."match_match_teamHome_id_04ed0769";
DROP INDEX public."match_match_teamAway_id_fd68cd9e";
DROP INDEX public.match_match_stadium_id_014e2990;
DROP INDEX public.match_match_round_id_a86f8e09;
DROP INDEX public.match_match_group_id_0dbb27e7;
DROP INDEX public.django_site_domain_a2e37b91_like;
DROP INDEX public.django_session_session_key_c0390e0f_like;
DROP INDEX public.django_session_expire_date_a5c62663;
DROP INDEX public.django_admin_log_user_id_c564eba6;
DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
DROP INDEX public.captcha_captchastore_hashkey_cbe8d15a_like;
DROP INDEX public.authtoken_token_key_10f0b77e_like;
DROP INDEX public.auth_permission_content_type_id_2f476e4b;
DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
DROP INDEX public.auth_group_name_a6ea08ec_like;
DROP INDEX public.account_emailconfirmation_key_f43612bd_like;
DROP INDEX public.account_emailconfirmation_email_address_id_5b7f8c58;
DROP INDEX public.account_emailaddress_user_id_2c513194;
DROP INDEX public.account_emailaddress_email_03be32b2_like;
ALTER TABLE ONLY public.team_team DROP CONSTRAINT team_team_pkey;
ALTER TABLE ONLY public.system_systemuser DROP CONSTRAINT system_systemuser_username_key;
ALTER TABLE ONLY public.system_systemuser_user_permissions DROP CONSTRAINT system_systemuser_user_permissions_pkey;
ALTER TABLE ONLY public.system_systemuser_user_permissions DROP CONSTRAINT system_systemuser_user_p_systemuser_id_permission_c7bab9d9_uniq;
ALTER TABLE ONLY public.system_systemuser DROP CONSTRAINT system_systemuser_pkey;
ALTER TABLE ONLY public.system_systemuser_groups DROP CONSTRAINT system_systemuser_groups_systemuser_id_group_id_77fbc464_uniq;
ALTER TABLE ONLY public.system_systemuser_groups DROP CONSTRAINT system_systemuser_groups_pkey;
ALTER TABLE ONLY public.staticpages_rules DROP CONSTRAINT staticpages_rules_pkey;
ALTER TABLE ONLY public.round_round DROP CONSTRAINT round_round_pkey;
ALTER TABLE ONLY public.round_groupteam DROP CONSTRAINT round_groupteam_pkey;
ALTER TABLE ONLY public.round_group DROP CONSTRAINT round_group_pkey;
ALTER TABLE ONLY public.prediction_userpoints DROP CONSTRAINT prediction_userpoints_pkey;
ALTER TABLE ONLY public.prediction_prediction DROP CONSTRAINT prediction_prediction_user_id_match_id_d813c948_uniq;
ALTER TABLE ONLY public.prediction_prediction DROP CONSTRAINT prediction_prediction_pkey;
ALTER TABLE ONLY public.prediction_points DROP CONSTRAINT prediction_points_pkey;
ALTER TABLE ONLY public.prediction_extraquestionsuseranswers DROP CONSTRAINT prediction_extraquestionsuseranswers_pkey;
ALTER TABLE ONLY public.prediction_extraquestions DROP CONSTRAINT prediction_extraquestions_pkey;
ALTER TABLE ONLY public.places_stadium DROP CONSTRAINT places_stadium_pkey;
ALTER TABLE ONLY public.match_score DROP CONSTRAINT match_score_pkey;
ALTER TABLE ONLY public.match_match DROP CONSTRAINT match_match_score_id_key;
ALTER TABLE ONLY public.match_match DROP CONSTRAINT match_match_pkey;
ALTER TABLE ONLY public.django_site DROP CONSTRAINT django_site_pkey;
ALTER TABLE ONLY public.django_site DROP CONSTRAINT django_site_domain_a2e37b91_uniq;
ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
ALTER TABLE ONLY public.captcha_captchastore DROP CONSTRAINT captcha_captchastore_pkey;
ALTER TABLE ONLY public.captcha_captchastore DROP CONSTRAINT captcha_captchastore_hashkey_key;
ALTER TABLE ONLY public.authtoken_token DROP CONSTRAINT authtoken_token_user_id_key;
ALTER TABLE ONLY public.authtoken_token DROP CONSTRAINT authtoken_token_pkey;
ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
ALTER TABLE ONLY public.account_emailconfirmation DROP CONSTRAINT account_emailconfirmation_pkey;
ALTER TABLE ONLY public.account_emailconfirmation DROP CONSTRAINT account_emailconfirmation_key_key;
ALTER TABLE ONLY public.account_emailaddress DROP CONSTRAINT account_emailaddress_pkey;
ALTER TABLE ONLY public.account_emailaddress DROP CONSTRAINT account_emailaddress_email_key;
ALTER TABLE public.team_team ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.system_systemuser_user_permissions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.system_systemuser_groups ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.system_systemuser ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.staticpages_rules ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.round_round ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.round_groupteam ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.round_group ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.prediction_userpoints ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.prediction_prediction ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.prediction_points ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.prediction_extraquestionsuseranswers ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.prediction_extraquestions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.places_stadium ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.match_score ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.match_match ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.django_site ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.captcha_captchastore ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.account_emailconfirmation ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.account_emailaddress ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.team_team_id_seq;
DROP TABLE public.team_team;
DROP SEQUENCE public.system_systemuser_user_permissions_id_seq;
DROP TABLE public.system_systemuser_user_permissions;
DROP SEQUENCE public.system_systemuser_id_seq;
DROP SEQUENCE public.system_systemuser_groups_id_seq;
DROP TABLE public.system_systemuser_groups;
DROP TABLE public.system_systemuser;
DROP SEQUENCE public.staticpages_rules_id_seq;
DROP TABLE public.staticpages_rules;
DROP SEQUENCE public.round_round_id_seq;
DROP TABLE public.round_round;
DROP SEQUENCE public.round_groupteam_id_seq;
DROP TABLE public.round_groupteam;
DROP SEQUENCE public.round_group_id_seq;
DROP TABLE public.round_group;
DROP SEQUENCE public.prediction_userpoints_id_seq;
DROP TABLE public.prediction_userpoints;
DROP SEQUENCE public.prediction_prediction_id_seq;
DROP TABLE public.prediction_prediction;
DROP SEQUENCE public.prediction_points_id_seq;
DROP TABLE public.prediction_points;
DROP SEQUENCE public.prediction_extraquestionsuseranswers_id_seq;
DROP TABLE public.prediction_extraquestionsuseranswers;
DROP SEQUENCE public.prediction_extraquestions_id_seq;
DROP TABLE public.prediction_extraquestions;
DROP SEQUENCE public.places_stadium_id_seq;
DROP TABLE public.places_stadium;
DROP SEQUENCE public.match_score_id_seq;
DROP TABLE public.match_score;
DROP SEQUENCE public.match_match_id_seq;
DROP TABLE public.match_match;
DROP SEQUENCE public.django_site_id_seq;
DROP TABLE public.django_site;
DROP TABLE public.django_session;
DROP SEQUENCE public.django_migrations_id_seq;
DROP TABLE public.django_migrations;
DROP SEQUENCE public.django_content_type_id_seq;
DROP TABLE public.django_content_type;
DROP SEQUENCE public.django_admin_log_id_seq;
DROP TABLE public.django_admin_log;
DROP SEQUENCE public.captcha_captchastore_id_seq;
DROP TABLE public.captcha_captchastore;
DROP TABLE public.authtoken_token;
DROP SEQUENCE public.auth_permission_id_seq;
DROP TABLE public.auth_permission;
DROP SEQUENCE public.auth_group_permissions_id_seq;
DROP TABLE public.auth_group_permissions;
DROP SEQUENCE public.auth_group_id_seq;
DROP TABLE public.auth_group;
DROP SEQUENCE public.account_emailconfirmation_id_seq;
DROP TABLE public.account_emailconfirmation;
DROP SEQUENCE public.account_emailaddress_id_seq;
DROP TABLE public.account_emailaddress;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: account_emailaddress; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE account_emailaddress (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    verified boolean NOT NULL,
    "primary" boolean NOT NULL,
    user_id integer NOT NULL
);


--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE account_emailaddress_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE account_emailaddress_id_seq OWNED BY account_emailaddress.id;


--
-- Name: account_emailconfirmation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE account_emailconfirmation (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    key character varying(64) NOT NULL,
    email_address_id integer NOT NULL
);


--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE account_emailconfirmation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE account_emailconfirmation_id_seq OWNED BY account_emailconfirmation.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


--
-- Name: captcha_captchastore; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE captcha_captchastore (
    id integer NOT NULL,
    challenge character varying(32) NOT NULL,
    response character varying(32) NOT NULL,
    hashkey character varying(40) NOT NULL,
    expiration timestamp with time zone NOT NULL
);


--
-- Name: captcha_captchastore_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE captcha_captchastore_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: captcha_captchastore_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE captcha_captchastore_id_seq OWNED BY captcha_captchastore.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


--
-- Name: django_site; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- Name: match_match; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE match_match (
    id integer NOT NULL,
    datetime timestamp with time zone NOT NULL,
    score_id integer,
    stadium_id integer NOT NULL,
    "teamAway_id" integer NOT NULL,
    "teamHome_id" integer NOT NULL,
    group_id integer,
    round_id integer NOT NULL,
    prediction_enabled boolean NOT NULL
);


--
-- Name: match_match_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE match_match_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: match_match_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE match_match_id_seq OWNED BY match_match.id;


--
-- Name: match_score; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE match_score (
    id integer NOT NULL,
    regular character varying(5) NOT NULL,
    et character varying(5),
    penalty character varying(5),
    regular_home smallint NOT NULL,
    regular_away smallint NOT NULL,
    et_home smallint,
    et_away smallint,
    penalty_home smallint,
    penalty_away smallint,
    winner smallint
);


--
-- Name: match_score_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE match_score_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: match_score_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE match_score_id_seq OWNED BY match_score.id;


--
-- Name: places_stadium; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE places_stadium (
    id integer NOT NULL,
    name character varying(512) NOT NULL,
    city character varying(512) NOT NULL
);


--
-- Name: places_stadium_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE places_stadium_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: places_stadium_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE places_stadium_id_seq OWNED BY places_stadium.id;


--
-- Name: prediction_extraquestions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prediction_extraquestions (
    id integer NOT NULL,
    text text NOT NULL,
    answer_type smallint NOT NULL,
    points smallint NOT NULL,
    correct_answer character varying(64),
    answer_enabled boolean NOT NULL,
    close_datetime timestamp with time zone,
    half_points smallint NOT NULL,
    group_id integer
);


--
-- Name: prediction_extraquestions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE prediction_extraquestions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: prediction_extraquestions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE prediction_extraquestions_id_seq OWNED BY prediction_extraquestions.id;


--
-- Name: prediction_extraquestionsuseranswers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prediction_extraquestionsuseranswers (
    id integer NOT NULL,
    answer_text text NOT NULL,
    answer_integer text NOT NULL,
    editable boolean NOT NULL,
    question_id integer NOT NULL,
    points smallint,
    user_id integer NOT NULL
);


--
-- Name: prediction_extraquestionsuseranswers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE prediction_extraquestionsuseranswers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: prediction_extraquestionsuseranswers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE prediction_extraquestionsuseranswers_id_seq OWNED BY prediction_extraquestionsuseranswers.id;


--
-- Name: prediction_points; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prediction_points (
    id integer NOT NULL,
    rule smallint NOT NULL,
    points smallint NOT NULL
);


--
-- Name: prediction_points_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE prediction_points_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: prediction_points_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE prediction_points_id_seq OWNED BY prediction_points.id;


--
-- Name: prediction_prediction; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prediction_prediction (
    id integer NOT NULL,
    goals_home smallint NOT NULL,
    goals_away smallint NOT NULL,
    points smallint,
    match_id integer NOT NULL,
    user_id integer NOT NULL,
    editable boolean NOT NULL
);


--
-- Name: prediction_prediction_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE prediction_prediction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: prediction_prediction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE prediction_prediction_id_seq OWNED BY prediction_prediction.id;


--
-- Name: prediction_userpoints; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prediction_userpoints (
    id integer NOT NULL,
    points smallint NOT NULL,
    user_id integer NOT NULL,
    n_exact_scores smallint NOT NULL,
    n_results smallint NOT NULL,
    n_extra_questions smallint NOT NULL,
    n_yellow_cards smallint NOT NULL
);


--
-- Name: prediction_userpoints_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE prediction_userpoints_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: prediction_userpoints_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE prediction_userpoints_id_seq OWNED BY prediction_userpoints.id;


--
-- Name: round_group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE round_group (
    id integer NOT NULL,
    name character varying(128) NOT NULL
);


--
-- Name: round_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE round_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: round_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE round_group_id_seq OWNED BY round_group.id;


--
-- Name: round_groupteam; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE round_groupteam (
    id integer NOT NULL,
    points smallint,
    goals_scored smallint,
    goals_conceded smallint,
    matches smallint,
    group_id integer NOT NULL,
    team_id integer NOT NULL,
    "position" smallint
);


--
-- Name: round_groupteam_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE round_groupteam_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: round_groupteam_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE round_groupteam_id_seq OWNED BY round_groupteam.id;


--
-- Name: round_round; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE round_round (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    "roundType" smallint NOT NULL,
    shortname character varying(16) NOT NULL
);


--
-- Name: round_round_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE round_round_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: round_round_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE round_round_id_seq OWNED BY round_round.id;


--
-- Name: staticpages_rules; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE staticpages_rules (
    id integer NOT NULL,
    content text NOT NULL
);


--
-- Name: staticpages_rules_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE staticpages_rules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: staticpages_rules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE staticpages_rules_id_seq OWNED BY staticpages_rules.id;


--
-- Name: system_systemuser; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE system_systemuser (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    avatar character varying(100),
    nickname character varying(128) NOT NULL
);


--
-- Name: system_systemuser_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE system_systemuser_groups (
    id integer NOT NULL,
    systemuser_id integer NOT NULL,
    group_id integer NOT NULL
);


--
-- Name: system_systemuser_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE system_systemuser_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: system_systemuser_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE system_systemuser_groups_id_seq OWNED BY system_systemuser_groups.id;


--
-- Name: system_systemuser_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE system_systemuser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: system_systemuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE system_systemuser_id_seq OWNED BY system_systemuser.id;


--
-- Name: system_systemuser_user_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE system_systemuser_user_permissions (
    id integer NOT NULL,
    systemuser_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: system_systemuser_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE system_systemuser_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: system_systemuser_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE system_systemuser_user_permissions_id_seq OWNED BY system_systemuser_user_permissions.id;


--
-- Name: team_team; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE team_team (
    id integer NOT NULL,
    name character varying(512) NOT NULL,
    shortname character varying(3) NOT NULL,
    logo character varying(100) NOT NULL,
    vertical_logo boolean NOT NULL
);


--
-- Name: team_team_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE team_team_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE team_team_id_seq OWNED BY team_team.id;


--
-- Name: account_emailaddress id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY account_emailaddress ALTER COLUMN id SET DEFAULT nextval('account_emailaddress_id_seq'::regclass);


--
-- Name: account_emailconfirmation id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY account_emailconfirmation ALTER COLUMN id SET DEFAULT nextval('account_emailconfirmation_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: captcha_captchastore id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY captcha_captchastore ALTER COLUMN id SET DEFAULT nextval('captcha_captchastore_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- Name: match_match id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY match_match ALTER COLUMN id SET DEFAULT nextval('match_match_id_seq'::regclass);


--
-- Name: match_score id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY match_score ALTER COLUMN id SET DEFAULT nextval('match_score_id_seq'::regclass);


--
-- Name: places_stadium id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY places_stadium ALTER COLUMN id SET DEFAULT nextval('places_stadium_id_seq'::regclass);


--
-- Name: prediction_extraquestions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY prediction_extraquestions ALTER COLUMN id SET DEFAULT nextval('prediction_extraquestions_id_seq'::regclass);


--
-- Name: prediction_extraquestionsuseranswers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY prediction_extraquestionsuseranswers ALTER COLUMN id SET DEFAULT nextval('prediction_extraquestionsuseranswers_id_seq'::regclass);


--
-- Name: prediction_points id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY prediction_points ALTER COLUMN id SET DEFAULT nextval('prediction_points_id_seq'::regclass);


--
-- Name: prediction_prediction id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY prediction_prediction ALTER COLUMN id SET DEFAULT nextval('prediction_prediction_id_seq'::regclass);


--
-- Name: prediction_userpoints id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY prediction_userpoints ALTER COLUMN id SET DEFAULT nextval('prediction_userpoints_id_seq'::regclass);


--
-- Name: round_group id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY round_group ALTER COLUMN id SET DEFAULT nextval('round_group_id_seq'::regclass);


--
-- Name: round_groupteam id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY round_groupteam ALTER COLUMN id SET DEFAULT nextval('round_groupteam_id_seq'::regclass);


--
-- Name: round_round id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY round_round ALTER COLUMN id SET DEFAULT nextval('round_round_id_seq'::regclass);


--
-- Name: staticpages_rules id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY staticpages_rules ALTER COLUMN id SET DEFAULT nextval('staticpages_rules_id_seq'::regclass);


--
-- Name: system_systemuser id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY system_systemuser ALTER COLUMN id SET DEFAULT nextval('system_systemuser_id_seq'::regclass);


--
-- Name: system_systemuser_groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY system_systemuser_groups ALTER COLUMN id SET DEFAULT nextval('system_systemuser_groups_id_seq'::regclass);


--
-- Name: system_systemuser_user_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY system_systemuser_user_permissions ALTER COLUMN id SET DEFAULT nextval('system_systemuser_user_permissions_id_seq'::regclass);


--
-- Name: team_team id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY team_team ALTER COLUMN id SET DEFAULT nextval('team_team_id_seq'::regclass);


--
-- Data for Name: account_emailaddress; Type: TABLE DATA; Schema: public; Owner: -
--

COPY account_emailaddress (id, email, verified, "primary", user_id) FROM stdin;
1	ubukrool@mat.uni.torun.pl	f	t	2
2	mateusz_inc@gazeta.pl	f	t	3
3	zielapio@op.pl	f	t	4
4	nowak.maria88@gmail.com	f	t	5
5	mrlikson@gmail.com	f	t	6
6	agnusdune@gmail.com	f	t	7
7	a@gmail.com	f	t	8
8	marcin3880@gmail.com	f	t	9
9	patryk.dziemianowski@gmail.com	f	t	10
10	oskarbalcerowicz@interia.pl	f	t	11
11	iza10378@interia.pl	f	t	12
12	aska33@wp.pl	f	t	13
13	iwan127+1@gmail.com	f	t	14
14	iwan127+2@gmail.com	f	t	15
15	iwan127+4@gmail.com	f	t	16
16	iwan127+5@gmail.com	f	t	17
17	natalia.stelmaszuk@aitsolutions.pl	f	t	18
18	finger.pointing.objection@gmail.com	f	t	19
19	wojciech.beling@aitsolutions.pl	f	t	20
20	monika.siemian@gmail.com	f	t	21
21	krystianladniak87@gmail.com	f	t	22
22	p.gzubicki@gmail.com	f	t	23
23	macko1983@poczta.onet.pl	f	t	24
24	mateusz.zalewski@aitsolutions.pl	f	t	25
25	p.grabowski@aitsolutions.pl	f	t	26
\.


--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('account_emailaddress_id_seq', 25, true);


--
-- Data for Name: account_emailconfirmation; Type: TABLE DATA; Schema: public; Owner: -
--

COPY account_emailconfirmation (id, created, sent, key, email_address_id) FROM stdin;
\.


--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('account_emailconfirmation_id_seq', 1, false);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add content type	4	add_contenttype
11	Can change content type	4	change_contenttype
12	Can delete content type	4	delete_contenttype
13	Can add session	5	add_session
14	Can change session	5	change_session
15	Can delete session	5	delete_session
16	Can add site	6	add_site
17	Can change site	6	change_site
18	Can delete site	6	delete_site
19	Can add Token	7	add_token
20	Can change Token	7	change_token
21	Can delete Token	7	delete_token
22	Can add social application	8	add_socialapp
23	Can change social application	8	change_socialapp
24	Can delete social application	8	delete_socialapp
25	Can add social account	9	add_socialaccount
26	Can change social account	9	change_socialaccount
27	Can delete social account	9	delete_socialaccount
28	Can add social application token	10	add_socialtoken
29	Can change social application token	10	change_socialtoken
30	Can delete social application token	10	delete_socialtoken
31	Can add email address	11	add_emailaddress
32	Can change email address	11	change_emailaddress
33	Can delete email address	11	delete_emailaddress
34	Can add email confirmation	12	add_emailconfirmation
35	Can change email confirmation	12	change_emailconfirmation
36	Can delete email confirmation	12	delete_emailconfirmation
37	Can add Użytkownik systemu	13	add_systemuser
38	Can change Użytkownik systemu	13	change_systemuser
39	Can delete Użytkownik systemu	13	delete_systemuser
40	Can view Użytkownik systemu	13	view_systemuser
41	Can add Drużyna	14	add_team
42	Can change Drużyna	14	change_team
43	Can delete Drużyna	14	delete_team
44	Can view Drużyna	14	view_team
45	Can add Stadion	15	add_stadium
46	Can change Stadion	15	change_stadium
47	Can delete Stadion	15	delete_stadium
48	Can view Stadion	15	view_stadium
49	Can add Grupa	16	add_group
50	Can change Grupa	16	change_group
51	Can delete Grupa	16	delete_group
52	Can view Grupa	16	view_group
53	Can add Drużyna w grupie	17	add_groupteam
54	Can change Drużyna w grupie	17	change_groupteam
55	Can delete Drużyna w grupie	17	delete_groupteam
56	Can view Drużyna w grupie	17	view_groupteam
57	Can add Runda	18	add_round
58	Can change Runda	18	change_round
59	Can delete Runda	18	delete_round
60	Can view Runda	18	view_round
61	Can add Typ	19	add_prediction
62	Can change Typ	19	change_prediction
63	Can delete Typ	19	delete_prediction
64	Can view Typ	19	view_prediction
65	Can add Punkty	20	add_points
66	Can change Punkty	20	change_points
67	Can delete Punkty	20	delete_points
68	Can view Punkty	20	view_points
69	Can add Punkty użytkownika	21	add_userpoints
70	Can change Punkty użytkownika	21	change_userpoints
71	Can delete Punkty użytkownika	21	delete_userpoints
72	Can view Punkty użytkownika	21	view_userpoints
73	Can add Mecz	22	add_match
74	Can change Mecz	22	change_match
75	Can delete Mecz	22	delete_match
76	Can view Mecz	22	view_match
77	Can add Wynik	23	add_score
78	Can change Wynik	23	change_score
79	Can delete Wynik	23	delete_score
80	Can view Wynik	23	view_score
81	Can v Zasady	24	v_rules
82	Can i Zasady	24	i_rules
83	Can e Zasady	24	e_rules
84	Can w Zasady	24	w_rules
85	Can add captcha store	25	add_captchastore
86	Can change captcha store	25	change_captchastore
87	Can delete captcha store	25	delete_captchastore
88	Can add Pytanie dodatkowe	26	add_extraquestions
89	Can change Pytanie dodatkowe	26	change_extraquestions
90	Can delete Pytanie dodatkowe	26	delete_extraquestions
91	Can view Pytanie dodatkowe	26	view_extraquestions
92	Can add Odpowiedź użytkowników	27	add_extraquestionsuseranswers
93	Can change Odpowiedź użytkowników	27	change_extraquestionsuseranswers
94	Can delete Odpowiedź użytkowników	27	delete_extraquestionsuseranswers
95	Can view Odpowiedź użytkowników	27	view_extraquestionsuseranswers
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_permission_id_seq', 95, true);


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authtoken_token (key, created, user_id) FROM stdin;
6c6ca38ab86f0ebec3b5ea8d2c8dfa6f1ecf6ad8	2018-06-14 11:07:34.285468+00	4
d965690fcbe9fa3889d04d7a30317dd8722a0f32	2018-06-14 11:34:16.18183+00	6
5a5eba7d3d539d893f6516d46903d2e0fed86c66	2018-06-14 12:03:16.142569+00	7
213956593818dd0bf09af9badf41107b125833ef	2018-06-14 14:46:08.656039+00	10
c00681f144437b988441f57a81fdc15ea43a40c5	2018-06-14 15:54:43.226002+00	11
988ea5825d6118ca28c066ca72fcd1155048eee3	2018-06-14 15:56:08.800241+00	12
eba280987ad64a4e2e8f961a5a57855d7efc509a	2018-06-25 18:55:23.565321+00	21
e85553abbbf543e8ae5716795a8984bd62a58c38	2018-07-06 20:29:37.704557+00	1
de419247b99e4e4fc006716d84664ddd5147e03a	2018-06-14 21:04:05.548829+00	14
f86efeae2de321aaeecc4b68e4e1cbe4aa4ebc85	2018-06-14 21:09:36.064639+00	15
c90e9138a64776bfcf4c1b36b930e4b1e16bcd4b	2018-06-14 21:27:51.121388+00	16
7c551a39c0e1f91f423dfca112eda296e78defb2	2018-06-15 07:13:07.69743+00	18
d41d2180d803cb52983afe3d41b0dac78547c3d9	2018-07-07 20:54:54.964358+00	9
52e2ca2aa043f5df98f84ded72a9aecaa26e51c8	2018-06-15 07:59:38.730696+00	20
97f478a560e4aed2457b0cb4870d975e1e9eeb26	2018-06-15 11:32:50.233048+00	22
0d0734ec87f9e2867892e82d7ea3e6c698a9d11f	2018-06-15 13:43:07.213546+00	23
2686aa1ba81202ae7d223fff07c731e537974441	2018-06-15 17:04:33.813143+00	19
4b574e58945631dd90021011f0ed01f2b10407ae	2018-06-18 07:03:38.174529+00	25
2c00ae2c0e80c3088cea9c9d378a4723009ce469	2018-06-18 07:06:48.450403+00	26
\.


--
-- Data for Name: captcha_captchastore; Type: TABLE DATA; Schema: public; Owner: -
--

COPY captcha_captchastore (id, challenge, response, hashkey, expiration) FROM stdin;
\.


--
-- Name: captcha_captchastore_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('captcha_captchastore_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: -
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2018-06-14 09:39:09.030383+00	1	Ważna informacja\r\nZe..	2	[{"changed": {"fields": ["content"]}}]	24	1
2	2018-06-14 09:51:21.113159+00	1	Ważna informacja\r\nZe..	2	[]	24	1
3	2018-06-14 13:59:04.068813+00	1	Ważna informacja\r\nZe..	2	[{"changed": {"fields": ["content"]}}]	24	1
4	2018-06-14 13:59:20.263518+00	1	Ważna informacja\r\nZe..	2	[{"changed": {"fields": ["content"]}}]	24	1
5	2018-06-14 21:34:50.948743+00	26	Rosja - Arabia Saudyjska, 2018-06-14 15:00:00+00:00 (Faza grupowa | Grupa A) | 	1	[{"added": {}}]	19	1
6	2018-06-14 21:35:21.979514+00	22	Egipt	2	[{"changed": {"fields": ["name"]}}]	14	1
7	2018-06-14 21:44:37.573459+00	1	5-0	1	[{"added": {}}]	23	1
8	2018-06-14 21:44:44.578503+00	1	Rosja - Arabia Saudyjska, 2018-06-14 17:00:00+02:00 (Faza grupowa | Grupa A)	2	[{"changed": {"fields": ["score"]}}]	22	1
9	2018-06-15 07:18:18.064691+00	30	Rosja - Arabia Saudyjska, 2018-06-14 15:00:00+00:00 (Faza grupowa | Grupa A) | 	1	[{"added": {}}]	19	1
10	2018-06-15 07:19:11.866113+00	11		1	[{"added": {}}]	21	1
11	2018-06-15 13:55:21.0846+00	2	0-1	1	[{"added": {}}]	23	1
12	2018-06-15 13:55:23.522053+00	2	Egipt - Urugwaj, 2018-06-15 14:00:00+02:00 (Faza grupowa | Grupa A)	2	[{"changed": {"fields": ["score"]}}]	22	1
13	2018-06-15 14:02:50.483408+00	192	Rosja - Arabia Saudyjska, 2018-06-14 15:00:00+00:00 (Faza grupowa | Grupa A) | 	1	[{"added": {}}]	19	1
14	2018-06-15 14:03:19.602736+00	16		1	[{"added": {}}]	21	1
15	2018-06-15 14:05:05.875114+00	16		2	[{"changed": {"fields": ["points", "n_results"]}}]	21	1
16	2018-06-15 19:19:50.530221+00	197	Maroko - Iran, 2018-06-15 15:00:00+00:00 (Faza grupowa | Grupa B) | 	1	[{"added": {}}]	19	1
17	2018-06-15 19:20:38.376891+00	198	Egipt - Urugwaj, 2018-06-15 12:00:00+00:00 (Faza grupowa | Grupa A) | 	1	[{"added": {}}]	19	1
18	2018-06-15 19:21:03.670468+00	199	Portugalia - Hiszpania, 2018-06-15 18:00:00+00:00 (Faza grupowa | Grupa B) | 	1	[{"added": {}}]	19	1
19	2018-06-15 19:22:47.719192+00	10		2	[{"changed": {"fields": ["points", "n_results"]}}]	21	1
20	2018-06-15 19:23:34.806357+00	3	0-1	1	[{"added": {}}]	23	1
21	2018-06-16 08:59:37.134497+00	14	JuveFan - 5 pkt	3		21	1
22	2018-06-16 09:00:14.941412+00	7	Maroko - Iran, 2018-06-15 17:00:00+02:00 (Faza grupowa | Grupa B)	2	[{"changed": {"fields": ["score"]}}]	22	1
23	2018-06-16 09:00:37.859034+00	4	3-3	1	[{"added": {}}]	23	1
24	2018-06-16 09:00:42.424914+00	8	Portugalia - Hiszpania, 2018-06-15 20:00:00+02:00 (Faza grupowa | Grupa B)	2	[{"changed": {"fields": ["score"]}}]	22	1
25	2018-06-16 09:44:11.607358+00	213	Francja - Australia, 2018-06-16 10:00:00+00:00 (Faza grupowa | Grupa C) | 	1	[{"added": {}}]	19	1
26	2018-06-16 12:58:02.617794+00	224	Argentyna - Islandia, 2018-06-16 13:00:00+00:00 (Faza grupowa | Grupa D) | 	1	[{"added": {}}]	19	1
27	2018-06-16 14:06:38.152714+00	5	2-1	1	[{"added": {}}]	23	1
28	2018-06-16 14:06:50.789502+00	13	Francja - Australia, 2018-06-16 12:00:00+02:00 (Faza grupowa | Grupa C)	2	[{"changed": {"fields": ["score"]}}]	22	1
29	2018-06-16 14:54:23.316695+00	6	1-1	1	[{"added": {}}]	23	1
30	2018-06-16 14:54:27.394417+00	19	Argentyna - Islandia, 2018-06-16 15:00:00+02:00 (Faza grupowa | Grupa D)	2	[{"changed": {"fields": ["score"]}}]	22	1
31	2018-06-16 14:57:56.058736+00	225	Argentyna - Islandia, 2018-06-16 13:00:00+00:00 (Faza grupowa | Grupa D) | 	1	[{"added": {}}]	19	1
32	2018-06-16 15:01:06.440389+00	226	Peru - Dania, 2018-06-16 16:00:00+00:00 (Faza grupowa | Grupa C) | 	1	[{"added": {}}]	19	1
33	2018-06-16 15:01:59.465943+00	228	Chorwacja - Nigeria, 2018-06-16 19:00:00+00:00 (Faza grupowa | Grupa D) | 	1	[{"added": {}}]	19	1
34	2018-06-16 19:18:40.794912+00	7	0-1	1	[{"added": {}}]	23	1
35	2018-06-16 19:18:44.111798+00	14	Peru - Dania, 2018-06-16 18:00:00+02:00 (Faza grupowa | Grupa C)	2	[{"changed": {"fields": ["score"]}}]	22	1
36	2018-06-16 20:54:39.659935+00	8	2-0	1	[{"added": {}}]	23	1
37	2018-06-16 20:54:44.691158+00	20	Chorwacja - Nigeria, 2018-06-16 21:00:00+02:00 (Faza grupowa | Grupa D)	2	[{"changed": {"fields": ["score"]}}]	22	1
38	2018-06-17 15:58:04.444621+00	1	Ważna informacja\r\nZe..	2	[{"changed": {"fields": ["content"]}}]	24	1
39	2018-06-17 19:01:50.319883+00	9	0-1	1	[{"added": {}}]	23	1
40	2018-06-17 19:01:54.578267+00	24	Kostaryka - Serbia, 2018-06-17 14:00:00+02:00 (Faza grupowa | Grupa E)	2	[{"changed": {"fields": ["score"]}}]	22	1
41	2018-06-17 19:54:57.780775+00	10	1-1	1	[{"added": {}}]	23	1
42	2018-06-17 19:55:01.166109+00	25	Brazylia - Szwajcaria, 2018-06-17 20:00:00+02:00 (Faza grupowa | Grupa E)	2	[{"changed": {"fields": ["score"]}}]	22	1
43	2018-06-17 21:13:31.833064+00	11	0-1	1	[{"added": {}}]	23	1
44	2018-06-17 21:13:37.914739+00	30	Niemcy - Meksyk, 2018-06-17 17:00:00+02:00 (Faza grupowa | Grupa F)	2	[{"changed": {"fields": ["score"]}}]	22	1
45	2018-06-18 13:43:03.259353+00	1	Która drużyna drużyn..	1	[{"added": {}}]	26	1
46	2018-06-18 13:43:49.546267+00	2	Które drużyny zagraj..	1	[{"added": {}}]	26	1
47	2018-06-18 13:44:53.780531+00	3	Jak daleko zajdzie r..	1	[{"added": {}}]	26	1
48	2018-06-18 13:52:10.962785+00	4	Które drużyny wyjdą ..	1	[{"added": {}}]	26	1
49	2018-06-18 13:57:06.448926+00	5	Które drużyny wyjdą ..	1	[{"added": {}}]	26	1
50	2018-06-18 13:57:31.475438+00	6	Które drużyny wyjdą ..	1	[{"added": {}}]	26	1
51	2018-06-18 13:57:53.788228+00	7	Które drużyny wyjdą ..	1	[{"added": {}}]	26	1
52	2018-06-18 13:58:14.66722+00	8	Które drużyny wyjdą ..	1	[{"added": {}}]	26	1
53	2018-06-18 13:58:35.880834+00	9	Które drużyny wyjdą ..	1	[{"added": {}}]	26	1
54	2018-06-18 13:58:59.09805+00	10	Które drużyny wyjdą ..	1	[{"added": {}}]	26	1
55	2018-06-18 13:59:57.377931+00	10	Które drużyny wyjdą ..	2	[{"changed": {"fields": ["text", "group"]}}]	26	1
56	2018-06-18 14:00:20.206805+00	11	Które drużyny wyjdą ..	1	[{"added": {}}]	26	1
57	2018-06-18 14:00:44.074434+00	1	Ważna informacja\r\nZe..	2	[{"changed": {"fields": ["content"]}}]	24	1
58	2018-06-18 14:10:50.592759+00	1	https://typer.aitsolutions.pl	2	[{"changed": {"fields": ["domain", "name"]}}]	6	1
59	2018-06-18 19:53:29.119696+00	12	1-2	1	[{"added": {}}]	23	1
60	2018-06-18 19:53:35.09907+00	37	Tunezja - Anglia, 2018-06-18 20:00:00+02:00 (Faza grupowa | Grupa G)	2	[{"changed": {"fields": ["score"]}}]	22	1
61	2018-06-18 20:04:52.146607+00	13	3-9	1	[{"added": {}}]	23	1
62	2018-06-18 20:06:05.536899+00	36	Belgia - Panama, 2018-06-18 17:00:00+02:00 (Faza grupowa | Grupa G)	2	[{"changed": {"fields": ["score"]}}]	22	1
63	2018-06-18 20:19:04.797353+00	14	1-0	1	[{"added": {}}]	23	1
64	2018-06-18 20:19:08.777476+00	31	Szwecja - Korea Południowa, 2018-06-18 14:00:00+02:00 (Faza grupowa | Grupa F)	2	[{"changed": {"fields": ["score"]}}]	22	1
65	2018-06-18 20:26:15.709944+00	13	3-0	2	[{"changed": {"fields": ["regular"]}}]	23	1
66	2018-06-19 07:07:54.889982+00	1	Która drużyna drużyn..	2	[{"changed": {"fields": ["text"]}}]	26	1
67	2018-06-19 07:08:23.680718+00	1	Która drużyna wygra ..	2	[{"changed": {"fields": ["text"]}}]	26	1
68	2018-06-19 13:53:12.271267+00	15	1-2	1	[{"added": {}}]	23	1
69	2018-06-19 13:53:25.080342+00	42	Kolumbia - Japonia, 2018-06-19 14:00:00+02:00 (Faza grupowa | Grupa H)	2	[{"changed": {"fields": ["score"]}}]	22	1
70	2018-06-19 16:56:02.662222+00	16	1-2	1	[{"added": {}}]	23	1
71	2018-06-19 16:56:06.834925+00	43	Polska - Senegal, 2018-06-19 17:00:00+02:00 (Faza grupowa | Grupa H)	2	[{"changed": {"fields": ["score"]}}]	22	1
72	2018-06-19 18:06:59.643989+00	137		1	[{"added": {}}]	27	1
73	2018-06-19 19:03:58.720039+00	377	Rosja - Egipt, 2018-06-19 18:00:00+00:00 (Faza grupowa | Grupa A) | 	1	[{"added": {}}]	19	1
74	2018-06-19 19:04:29.74839+00	378	Rosja - Egipt, 2018-06-19 18:00:00+00:00 (Faza grupowa | Grupa A) | 	1	[{"added": {}}]	19	1
75	2018-06-19 19:55:07.336303+00	17	3-1	1	[{"added": {}}]	23	1
76	2018-06-19 19:55:10.929451+00	3	Rosja - Egipt, 2018-06-19 20:00:00+02:00 (Faza grupowa | Grupa A)	2	[{"changed": {"fields": ["score"]}}]	22	1
77	2018-06-20 13:55:37.932238+00	18	1-0	1	[{"added": {}}]	23	1
78	2018-06-20 13:55:40.858086+00	9	Portugalia - Maroko, 2018-06-20 14:00:00+02:00 (Faza grupowa | Grupa B)	2	[{"changed": {"fields": ["score"]}}]	22	1
79	2018-06-20 17:10:05.752226+00	416	Portugalia - Maroko, 2018-06-20 12:00:00+00:00 (Faza grupowa | Grupa B) | 	1	[{"added": {}}]	19	1
80	2018-06-20 17:10:43.95295+00	417	Urugwaj - Arabia Saudyjska, 2018-06-20 15:00:00+00:00 (Faza grupowa | Grupa A) | 	1	[{"added": {}}]	19	1
81	2018-06-20 17:11:20.86859+00	418	Iran - Hiszpania, 2018-06-20 18:00:00+00:00 (Faza grupowa | Grupa B) | 	1	[{"added": {}}]	19	1
82	2018-06-20 17:12:04.719748+00	416	Portugalia - Maroko, 2018-06-20 12:00:00+00:00 (Faza grupowa | Grupa B) | 	2	[{"changed": {"fields": ["points"]}}]	19	1
83	2018-06-20 17:13:30.228683+00	10	Asia - 45 pkt	2	[{"changed": {"fields": ["points", "n_results"]}}]	21	1
84	2018-06-20 20:20:40.21864+00	19	1-0	1	[{"added": {}}]	23	1
85	2018-06-20 20:20:50.045736+00	4	Urugwaj - Arabia Saudyjska, 2018-06-20 17:00:00+02:00 (Faza grupowa | Grupa A)	2	[{"changed": {"fields": ["score"]}}]	22	1
86	2018-06-20 20:32:41.14492+00	20	0-1	1	[{"added": {}}]	23	1
87	2018-06-20 20:33:21.712761+00	10	Iran - Hiszpania, 2018-06-20 20:00:00+02:00 (Faza grupowa | Grupa B)	2	[{"changed": {"fields": ["score"]}}]	22	1
88	2018-06-21 12:12:36.605178+00	16	Dania - Australia, 2018-06-21 14:00:00+02:00 (Faza grupowa | Grupa C)	2	[{"changed": {"fields": ["datetime"]}}]	22	1
89	2018-06-21 12:13:25.461761+00	15	Francja - Peru, 2018-06-21 17:00:00+02:00 (Faza grupowa | Grupa C)	2	[{"changed": {"fields": ["datetime", "prediction_enabled"]}}]	22	1
90	2018-06-21 13:51:12.318731+00	21	1-1	1	[{"added": {}}]	23	1
91	2018-06-21 13:51:14.025511+00	16	Dania - Australia, 2018-06-21 14:00:00+02:00 (Faza grupowa | Grupa C)	2	[{"changed": {"fields": ["score"]}}]	22	1
92	2018-06-21 19:51:44.631672+00	22	0-3	1	[{"added": {}}]	23	1
93	2018-06-21 19:51:50.346293+00	48	Argentyna - Chorwacja, 2018-06-21 20:00:00+02:00 (Faza grupowa | Grupa D)	2	[{"changed": {"fields": ["score"]}}]	22	1
94	2018-06-21 20:10:42.044315+00	23	1-0	1	[{"added": {}}]	23	1
95	2018-06-21 20:10:46.030242+00	15	Francja - Peru, 2018-06-21 17:00:00+02:00 (Faza grupowa | Grupa C)	2	[{"changed": {"fields": ["score"]}}]	22	1
96	2018-06-22 12:45:19.945555+00	506	Brazylia - Kostaryka, 2018-06-22 12:00:00+00:00 (Faza grupowa | Grupa E) | 	1	[{"added": {}}]	19	1
97	2018-06-22 13:53:55.132507+00	24	2-0	1	[{"added": {}}]	23	1
98	2018-06-22 13:54:49.740444+00	26	Brazylia - Kostaryka, 2018-06-22 14:00:00+02:00 (Faza grupowa | Grupa E)	2	[{"changed": {"fields": ["score"]}}]	22	1
99	2018-06-22 20:10:30.259776+00	25	2-0	1	[{"added": {}}]	23	1
100	2018-06-22 20:10:38.02276+00	21	Nigeria - Islandia, 2018-06-22 17:00:00+02:00 (Faza grupowa | Grupa D)	2	[{"changed": {"fields": ["score"]}}]	22	1
101	2018-06-22 20:25:24.055885+00	26	1-2	1	[{"added": {}}]	23	1
102	2018-06-22 20:26:14.906155+00	27	Serbia - Szwajcaria, 2018-06-22 20:00:00+02:00 (Faza grupowa | Grupa E)	2	[{"changed": {"fields": ["score"]}}]	22	1
103	2018-06-23 13:55:13.467155+00	27	5-2	1	[{"added": {}}]	23	1
104	2018-06-23 13:55:18.036522+00	38	Belgia - Tunezja, 2018-06-23 14:00:00+02:00 (Faza grupowa | Grupa G)	2	[{"changed": {"fields": ["score"]}}]	22	1
105	2018-06-23 20:27:01.891849+00	28	1-2	1	[{"added": {}}]	23	1
106	2018-06-23 20:27:05.36666+00	33	Korea Południowa - Meksyk, 2018-06-23 17:00:00+02:00 (Faza grupowa | Grupa F)	2	[{"changed": {"fields": ["score"]}}]	22	1
107	2018-06-23 21:10:09.294236+00	29	2-1	1	[{"added": {}}]	23	1
108	2018-06-23 21:10:18.186157+00	32	Niemcy - Szwecja, 2018-06-23 20:00:00+02:00 (Faza grupowa | Grupa F)	2	[{"changed": {"fields": ["score"]}}]	22	1
109	2018-06-24 19:03:04.1969+00	30	2-2	1	[{"added": {}}]	23	1
110	2018-06-24 19:03:18.407562+00	44	Japonia - Senegal, 2018-06-24 17:00:00+02:00 (Faza grupowa | Grupa H)	2	[{"changed": {"fields": ["score"]}}]	22	1
111	2018-06-24 19:03:52.626216+00	31	6-1	1	[{"added": {}}]	23	1
112	2018-06-24 19:03:55.741163+00	39	Anglia - Panama, 2018-06-24 14:00:00+02:00 (Faza grupowa | Grupa G)	2	[{"changed": {"fields": ["score"]}}]	22	1
113	2018-06-24 19:54:50.459777+00	32	0-3	1	[{"added": {}}]	23	1
114	2018-06-24 19:54:52.878816+00	45	Polska - Kolumbia, 2018-06-24 20:00:00+02:00 (Faza grupowa | Grupa H)	2	[{"changed": {"fields": ["score"]}}]	22	1
115	2018-06-25 19:56:45.760691+00	33	2-2	1	[{"added": {}}]	23	1
116	2018-06-25 19:56:49.253056+00	12	Hiszpania - Maroko, 2018-06-25 20:00:00+02:00 (Faza grupowa | Grupa B)	2	[{"changed": {"fields": ["score"]}}]	22	1
117	2018-06-25 19:57:43.374173+00	34	1-1	1	[{"added": {}}]	23	1
118	2018-06-25 19:57:50.367098+00	11	Iran - Portugalia, 2018-06-25 20:00:00+02:00 (Faza grupowa | Grupa B)	2	[{"changed": {"fields": ["score"]}}]	22	1
119	2018-06-25 20:03:49.702059+00	35	2-0	1	[{"added": {}}]	23	1
120	2018-06-25 20:03:58.507078+00	5	Urugwaj - Rosja, 2018-06-25 16:00:00+02:00 (Faza grupowa | Grupa A)	2	[{"changed": {"fields": ["score"]}}]	22	1
121	2018-06-25 20:05:01.464981+00	36	2-1	1	[{"added": {}}]	23	1
122	2018-06-25 20:05:05.888676+00	6	Arabia Saudyjska - Egipt, 2018-06-25 16:00:00+02:00 (Faza grupowa | Grupa A)	2	[{"changed": {"fields": ["score"]}}]	22	1
123	2018-06-25 20:07:44.468766+00	35	3-0	2	[{"changed": {"fields": ["regular"]}}]	23	1
124	2018-06-25 20:07:48.409454+00	5	Urugwaj - Rosja, 2018-06-25 16:00:00+02:00 (Faza grupowa | Grupa A)	2	[]	22	1
125	2018-06-26 20:04:51.101601+00	37	0-2	1	[{"added": {}}]	23	1
126	2018-06-26 20:04:53.748813+00	18	Australia - Peru, 2018-06-26 16:00:00+02:00 (Faza grupowa | Grupa C)	2	[{"changed": {"fields": ["score"]}}]	22	1
127	2018-06-26 20:05:55.260977+00	38	0-0	1	[{"added": {}}]	23	1
128	2018-06-26 20:06:24.302076+00	17	Dania - Francja, 2018-06-26 16:00:00+02:00 (Faza grupowa | Grupa C)	2	[{"changed": {"fields": ["score"]}}]	22	1
129	2018-06-26 20:06:50.561541+00	39	1-2	1	[{"added": {}}]	23	1
130	2018-06-26 20:06:53.631571+00	23	Islandia - Chorwacja, 2018-06-26 20:00:00+02:00 (Faza grupowa | Grupa D)	2	[{"changed": {"fields": ["score"]}}]	22	1
131	2018-06-26 20:07:19.297966+00	40	1-2	1	[{"added": {}}]	23	1
132	2018-06-26 20:07:21.776512+00	22	Nigeria - Argentyna, 2018-06-26 20:00:00+02:00 (Faza grupowa | Grupa D)	2	[{"changed": {"fields": ["score"]}}]	22	1
133	2018-06-27 19:53:22.765786+00	41	0-2	1	[{"added": {}}]	23	1
134	2018-06-27 19:53:35.908436+00	28	Serbia - Brazylia, 2018-06-27 20:00:00+02:00 (Faza grupowa | Grupa E)	2	[{"changed": {"fields": ["score"]}}]	22	1
135	2018-06-27 19:54:16.367313+00	42	2-2	1	[{"added": {}}]	23	1
136	2018-06-27 19:54:18.855413+00	29	Szwajcaria - Kostaryka, 2018-06-27 20:00:00+02:00 (Faza grupowa | Grupa E)	2	[{"changed": {"fields": ["score"]}}]	22	1
137	2018-06-27 20:14:59.685096+00	43	0-3	1	[{"added": {}}]	23	1
138	2018-06-27 20:15:02.16266+00	35	Meksyk - Szwecja, 2018-06-27 16:00:00+02:00 (Faza grupowa | Grupa F)	2	[{"changed": {"fields": ["score"]}}]	22	1
139	2018-06-27 20:17:50.957527+00	44	2-0	1	[{"added": {}}]	23	1
140	2018-06-27 20:17:54.309036+00	34	Korea Południowa - Niemcy, 2018-06-27 16:00:00+02:00 (Faza grupowa | Grupa F)	2	[{"changed": {"fields": ["score"]}}]	22	1
141	2018-06-28 16:40:02.235137+00	45	0-1	1	[{"added": {}}]	23	1
142	2018-06-28 16:40:07.534341+00	47	Senegal - Kolumbia, 2018-06-28 16:00:00+02:00 (Faza grupowa | Grupa H)	2	[{"changed": {"fields": ["score"]}}]	22	1
143	2018-06-28 16:40:33.776651+00	46	0-1	1	[{"added": {}}]	23	1
144	2018-06-28 16:40:36.695501+00	46	Japonia - Polska, 2018-06-28 16:00:00+02:00 (Faza grupowa | Grupa H)	2	[{"changed": {"fields": ["score"]}}]	22	1
145	2018-06-28 19:50:08.301809+00	47	0-1	1	[{"added": {}}]	23	1
146	2018-06-28 19:50:12.083171+00	40	Anglia - Belgia, 2018-06-28 20:00:00+02:00 (Faza grupowa | Grupa G)	2	[{"changed": {"fields": ["score"]}}]	22	1
147	2018-06-28 19:55:53.422784+00	48	1-2	1	[{"added": {}}]	23	1
148	2018-06-28 19:55:56.069658+00	41	Panama - Tunezja, 2018-06-28 20:00:00+02:00 (Faza grupowa | Grupa G)	2	[{"changed": {"fields": ["score"]}}]	22	1
149	2018-06-28 20:51:23.703337+00	5	Mecz o 3. miejsce	2	[{"changed": {"fields": ["name"]}}]	18	1
150	2018-06-28 20:51:30.400244+00	6	Finał	1	[{"added": {}}]	18	1
151	2018-06-28 20:52:50.610489+00	49	Francja - Argentyna, 2018-06-30 16:00:00+02:00 (1/8 finału)	1	[{"added": {}}]	22	1
152	2018-06-28 20:54:49.373221+00	50	Urugwaj - Portugalia, 2018-06-30 20:00:00+02:00 (1/8 finału)	1	[{"added": {}}]	22	1
153	2018-06-28 20:55:50.045995+00	51	Hiszpania - Rosja, 2018-07-01 16:00:00+02:00 (1/8 finału)	1	[{"added": {}}]	22	1
154	2018-06-28 20:56:42.993421+00	52	Chorwacja - Dania, 2018-07-01 20:00:00+02:00 (1/8 finału)	1	[{"added": {}}]	22	1
155	2018-06-28 20:57:33.077428+00	53	Brazylia - Meksyk, 2018-07-02 16:00:00+02:00 (1/8 finału)	1	[{"added": {}}]	22	1
156	2018-06-28 20:58:41.494063+00	54	Belgia - Japonia, 2018-07-02 20:00:00+02:00 (1/8 finału)	1	[{"added": {}}]	22	1
157	2018-06-28 20:59:54.320722+00	55	Szwecja - Szwajcaria, 2018-07-03 16:00:00+02:00 (1/8 finału)	1	[{"added": {}}]	22	1
158	2018-06-28 21:01:05.010429+00	56	Kolumbia - Anglia, 2018-07-03 20:00:00+02:00 (1/8 finału)	1	[{"added": {}}]	22	1
159	2018-06-29 06:49:16.006152+00	2	1/8 finału	2	[{"changed": {"fields": ["shortname"]}}]	18	1
160	2018-06-29 06:49:22.309035+00	1	Faza grupowa	2	[{"changed": {"fields": ["shortname"]}}]	18	1
161	2018-06-29 06:49:27.942838+00	3	Ćwierćfinał	2	[{"changed": {"fields": ["shortname"]}}]	18	1
162	2018-06-29 06:49:33.176955+00	4	Półfinał	2	[{"changed": {"fields": ["shortname"]}}]	18	1
163	2018-06-29 06:49:40.82022+00	6	Finał	2	[{"changed": {"fields": ["shortname"]}}]	18	1
164	2018-06-29 06:49:48.255547+00	5	Mecz o 3. miejsce	2	[{"changed": {"fields": ["shortname"]}}]	18	1
165	2018-06-30 17:10:35.174353+00	49	4-3	1	[{"added": {}}]	23	1
166	2018-06-30 17:10:39.790591+00	49	Francja - Argentyna, 2018-06-30 16:00:00+02:00 (1/8 finału)	2	[{"changed": {"fields": ["score"]}}]	22	1
167	2018-06-30 17:12:38.370955+00	49	4-3	3		23	1
168	2018-06-30 17:12:42.280629+00	49	Francja - Argentyna, 2018-06-30 16:00:00+02:00 (1/8 finału)	2	[]	22	1
169	2018-06-30 18:40:37.043458+00	50	4-3	1	[{"added": {}}]	23	1
170	2018-06-30 18:40:39.275823+00	49	Francja - Argentyna, 2018-06-30 16:00:00+02:00 (1/8 finału)	2	[{"changed": {"fields": ["score"]}}]	22	1
171	2018-06-30 18:41:34.423122+00	50	4-3	3		23	1
172	2018-06-30 18:41:36.919231+00	49	Francja - Argentyna, 2018-06-30 16:00:00+02:00 (1/8 finału)	2	[]	22	1
173	2018-06-30 18:52:58.341607+00	51	4-3	1	[{"added": {}}]	23	1
174	2018-06-30 18:53:00.92235+00	49	Francja - Argentyna, 2018-06-30 16:00:00+02:00 (1/8 finału)	2	[{"changed": {"fields": ["score"]}}]	22	1
175	2018-06-30 19:55:21.617097+00	52	2-1	1	[{"added": {}}]	23	1
176	2018-06-30 19:55:25.944029+00	50	Urugwaj - Portugalia, 2018-06-30 20:00:00+02:00 (1/8 finału)	2	[{"changed": {"fields": ["score"]}}]	22	1
177	2018-07-01 16:31:08.792014+00	53	1-1	1	[{"added": {}}]	23	1
178	2018-07-01 16:31:12.144087+00	51	Hiszpania - Rosja, 2018-07-01 16:00:00+02:00 (1/8 finału)	2	[{"changed": {"fields": ["score"]}}]	22	1
179	2018-07-01 20:31:57.664076+00	54	1-1	1	[{"added": {}}]	23	1
180	2018-07-01 20:32:00.548066+00	52	Chorwacja - Dania, 2018-07-01 20:00:00+02:00 (1/8 finału)	2	[{"changed": {"fields": ["score"]}}]	22	1
181	2018-07-02 20:47:01.240333+00	55	2-0	1	[{"added": {}}]	23	1
182	2018-07-02 20:47:06.476354+00	53	Brazylia - Meksyk, 2018-07-02 16:00:00+02:00 (1/8 finału)	2	[{"changed": {"fields": ["score"]}}]	22	1
183	2018-07-02 20:47:20.21486+00	56	3-2	1	[{"added": {}}]	23	1
184	2018-07-02 20:47:25.336194+00	54	Belgia - Japonia, 2018-07-02 20:00:00+02:00 (1/8 finału)	2	[{"changed": {"fields": ["score"]}}]	22	1
185	2018-07-03 18:23:21.93021+00	57	1-0	1	[{"added": {}}]	23	1
186	2018-07-03 18:23:24.374422+00	55	Szwecja - Szwajcaria, 2018-07-03 16:00:00+02:00 (1/8 finału)	2	[{"changed": {"fields": ["score"]}}]	22	1
187	2018-07-03 19:12:46.54044+00	57	Urugwaj - Francja, 2018-07-06 16:00:00+02:00 (Ćwierćfinał)	1	[{"added": {}}]	22	1
188	2018-07-03 19:13:54.927293+00	58	Brazylia - Belgia, 2018-07-06 20:00:00+02:00 (Ćwierćfinał)	1	[{"added": {}}]	22	1
189	2018-07-03 20:43:24.927221+00	58	1-1	1	[{"added": {}}]	23	1
190	2018-07-03 20:43:31.536784+00	56	Kolumbia - Anglia, 2018-07-03 20:00:00+02:00 (1/8 finału)	2	[{"changed": {"fields": ["score"]}}]	22	1
191	2018-07-03 20:44:07.124167+00	59	Rosja - Chorwacja, 2018-07-07 20:00:00+02:00 (Ćwierćfinał)	1	[{"added": {}}]	22	1
192	2018-07-03 20:52:18.160011+00	60	Szwecja - Anglia, 2018-07-07 16:00:00+02:00 (Ćwierćfinał)	1	[{"added": {}}]	22	1
193	2018-07-06 20:14:24.782377+00	872	Urugwaj - Francja, 2018-07-06 14:00:00+00:00 (Ćwierćfinał) | Asia	1	[{"added": {}}]	19	1
194	2018-07-06 20:16:41.104291+00	873	Brazylia - Belgia, 2018-07-06 18:00:00+00:00 (Ćwierćfinał) | Asia	1	[{"added": {}}]	19	1
195	2018-07-06 20:17:49.237742+00	59	0-2	1	[{"added": {}}]	23	1
196	2018-07-06 20:18:47.729103+00	57	Urugwaj - Francja, 2018-07-06 16:00:00+02:00 (Ćwierćfinał)	2	[{"changed": {"fields": ["score"]}}]	22	1
197	2018-07-06 20:19:26.502945+00	60	1-2	1	[{"added": {}}]	23	1
198	2018-07-06 20:19:31.397044+00	58	Brazylia - Belgia, 2018-07-06 20:00:00+02:00 (Ćwierćfinał)	2	[{"changed": {"fields": ["score"]}}]	22	1
199	2018-07-06 20:32:54.778744+00	61	Francja - Belgia, 2018-07-10 20:00:00+02:00 (Półfinał)	1	[{"added": {}}]	22	1
200	2018-07-07 20:15:59.154702+00	61	0-2	1	[{"added": {}}]	23	1
201	2018-07-07 20:16:04.042084+00	60	Szwecja - Anglia, 2018-07-07 16:00:00+02:00 (Ćwierćfinał)	2	[{"changed": {"fields": ["score"]}}]	22	1
202	2018-07-07 20:36:57.886027+00	62	2-2	1	[{"added": {}}]	23	1
203	2018-07-07 20:37:00.95286+00	59	Rosja - Chorwacja, 2018-07-07 20:00:00+02:00 (Ćwierćfinał)	2	[{"changed": {"fields": ["score"]}}]	22	1
204	2018-07-07 20:50:35.104389+00	62	Chorwacja - Anglia, 2018-07-11 20:00:00+02:00 (Półfinał)	1	[{"added": {}}]	22	1
205	2018-07-10 19:47:06.467855+00	903	Francja - Belgia, 2018-07-10 18:00:00+00:00 (Półfinał) | Asia	1	[{"added": {}}]	19	1
206	2018-07-10 19:53:58.676573+00	63	1-0	1	[{"added": {}}]	23	1
207	2018-07-10 19:54:01.145345+00	61	Francja - Belgia, 2018-07-10 20:00:00+02:00 (Półfinał)	2	[{"changed": {"fields": ["score"]}}]	22	1
208	2018-07-11 18:14:23.66004+00	906	Chorwacja - Anglia, 2018-07-11 18:00:00+00:00 (Półfinał) | Asia	1	[{"added": {}}]	19	1
209	2018-07-11 20:37:16.554037+00	64	2-1	1	[{"added": {}}]	23	1
210	2018-07-11 20:37:19.975181+00	62	Chorwacja - Anglia, 2018-07-11 20:00:00+02:00 (Półfinał)	2	[{"changed": {"fields": ["score"]}}]	22	1
211	2018-07-11 20:38:40.09517+00	63	Belgia - Anglia, 2018-07-14 16:00:00+02:00 (Mecz o 3. miejsce)	1	[{"added": {}}]	22	1
212	2018-07-11 20:39:15.727703+00	64	Francja - Chorwacja, 2018-07-15 17:00:00+02:00 (Finał)	1	[{"added": {}}]	22	1
213	2018-07-14 19:55:57.746916+00	65	2-0	1	[{"added": {}}]	23	1
214	2018-07-14 19:56:01.737072+00	63	Belgia - Anglia, 2018-07-14 16:00:00+02:00 (Mecz o 3. miejsce)	2	[{"changed": {"fields": ["score"]}}]	22	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 214, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: -
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	sites	site
7	authtoken	token
8	allauth	socialapp
9	allauth	socialaccount
10	allauth	socialtoken
11	account	emailaddress
12	account	emailconfirmation
13	system	systemuser
14	team	team
15	places	stadium
16	round	group
17	round	groupteam
18	round	round
19	prediction	prediction
20	prediction	points
21	prediction	userpoints
22	match	match
23	match	score
24	staticpages	rules
25	captcha	captchastore
26	prediction	extraquestions
27	prediction	extraquestionsuseranswers
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('django_content_type_id_seq', 27, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2018-06-13 19:40:34.081078+00
2	contenttypes	0002_remove_content_type_name	2018-06-13 19:40:34.101539+00
3	auth	0001_initial	2018-06-13 19:40:34.138668+00
4	auth	0002_alter_permission_name_max_length	2018-06-13 19:40:34.147015+00
5	auth	0003_alter_user_email_max_length	2018-06-13 19:40:34.155742+00
6	auth	0004_alter_user_username_opts	2018-06-13 19:40:34.166134+00
7	auth	0005_alter_user_last_login_null	2018-06-13 19:40:34.174535+00
8	auth	0006_require_contenttypes_0002	2018-06-13 19:40:34.17646+00
9	auth	0007_alter_validators_add_error_messages	2018-06-13 19:40:34.184809+00
10	auth	0008_alter_user_username_max_length	2018-06-13 19:40:34.193201+00
11	auth	0009_alter_user_last_name_max_length	2018-06-13 19:40:34.201686+00
12	system	0001_initial	2018-06-13 19:40:34.235529+00
13	account	0001_initial	2018-06-13 19:40:34.273977+00
14	account	0002_email_max_length	2018-06-13 19:40:34.290638+00
15	admin	0001_initial	2018-06-13 19:40:34.31331+00
16	admin	0002_logentry_remove_auto_add	2018-06-13 19:40:34.32691+00
17	authtoken	0001_initial	2018-06-13 19:40:34.345643+00
18	authtoken	0002_auto_20160226_1747	2018-06-13 19:40:34.406984+00
19	captcha	0001_initial	2018-06-13 19:40:34.416734+00
20	team	0001_initial	2018-06-13 19:40:34.426102+00
21	places	0001_initial	2018-06-13 19:40:34.43528+00
22	match	0001_initial	2018-06-13 19:40:34.485084+00
23	round	0001_initial	2018-06-13 19:40:34.541867+00
24	round	0002_remove_round_matches	2018-06-13 19:40:34.593545+00
25	match	0002_auto_20180501_2341	2018-06-13 19:40:34.610725+00
26	match	0003_auto_20180501_2349	2018-06-13 19:40:34.642594+00
27	match	0004_match_prediction_enabled	2018-06-13 19:40:34.666918+00
28	match	0005_auto_20180611_1000	2018-06-13 19:40:34.686245+00
29	prediction	0001_initial	2018-06-13 19:40:34.750991+00
30	prediction	0002_auto_20180503_2302	2018-06-13 19:40:34.774242+00
31	prediction	0003_prediction_editable	2018-06-13 19:40:34.801961+00
32	prediction	0004_auto_20180522_0155	2018-06-13 19:40:34.825647+00
33	prediction	0005_auto_20180605_2145	2018-06-13 19:40:34.832523+00
34	prediction	0006_auto_20180605_2358	2018-06-13 19:40:34.839743+00
35	prediction	0007_auto_20180607_1631	2018-06-13 19:40:34.877863+00
36	round	0003_auto_20180610_2341	2018-06-13 19:40:34.905412+00
37	round	0004_auto_20180611_0010	2018-06-13 19:40:34.931729+00
38	round	0005_auto_20180611_0011	2018-06-13 19:40:34.942198+00
39	round	0006_groupteam_position	2018-06-13 19:40:34.953045+00
40	sessions	0001_initial	2018-06-13 19:40:34.963802+00
41	sites	0001_initial	2018-06-13 19:40:34.972353+00
42	sites	0002_alter_domain_unique	2018-06-13 19:40:34.981006+00
43	staticpages	0001_initial	2018-06-13 19:40:34.990095+00
44	system	0002_auto_20180528_1517	2018-06-13 19:40:35.008571+00
45	system	0003_auto_20180602_2343	2018-06-13 19:40:35.050065+00
46	team	0002_auto_20180611_1633	2018-06-13 19:40:35.073457+00
47	prediction	0008_auto_20180616_2158	2018-06-18 13:23:23.606867+00
48	prediction	0009_auto_20180616_2253	2018-06-18 13:23:23.732209+00
49	prediction	0010_auto_20180617_2223	2018-06-18 13:23:23.774553+00
50	prediction	0011_auto_20180618_0039	2018-06-18 13:23:23.812319+00
51	prediction	0012_auto_20180618_0053	2018-06-18 13:23:23.833935+00
52	round	0007_auto_20180628_2237	2018-06-28 20:50:02.169544+00
53	round	0008_round_shortname	2018-06-28 22:02:49.105103+00
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('django_migrations_id_seq', 53, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: -
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
nvlg41zmx0qf67whki0n99tb4etds654	NzY5NDdlZDhjMDNhMzU5MTE1NDBhZTA1NTAyYTllNmI4Yjc4MjYzYzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiYWNjb3VudF92ZXJpZmllZF9lbWFpbCI6bnVsbCwiX2F1dGhfdXNlcl9pZCI6IjIyIiwiYWNjb3VudF91c2VyIjoibSIsIl9hdXRoX3VzZXJfaGFzaCI6IjliZmE1NzU1NjE5OTk4ZWM2ZDE1OGRmNDkyZjNmNzhhMzFiYjc1MmEifQ==	2018-06-29 11:32:50.373589+00
2ktuou5jxgozpwom19vdcpjvd7pxr7r4	ZTUwNThhNDg4NDFkYTFmMDNjZWVhZjFmZTA1OGFkOWIwYTcwYjRlYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjIyM2RhMjgxMGIyYWUyMjRhNWU3YTAwNzRhOWUyOWNhYzg5ZjRmZjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyNSJ9	2018-07-02 15:05:59.716776+00
w8fksa04vjo1szhf1tlv9w7liuip0umw	NmY5MTM4ZWVhNzFkZTc4NWYyYzdmZjhhMjAwNTA1OGQxN2U3YmM5ODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiYWNjb3VudF92ZXJpZmllZF9lbWFpbCI6bnVsbCwiYWNjb3VudF91c2VyIjoibiIsIl9hdXRoX3VzZXJfaWQiOiIyMyIsIl9hdXRoX3VzZXJfaGFzaCI6ImIwYTNiODQ4MDc3MzViNTI4YzcxMGZlZDAwYzdlMDY5ZWNmYmNkMWUifQ==	2018-06-29 13:43:07.415001+00
7tppb81f568o2hzpj5c49yaxwlmki1o2	ZTQxZWVmNjBkNGI0MDA3Yzk5MDRkMjg0ZDU4ZDg4ZDk1NTdhOTdjNjp7ImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9oYXNoIjoiZDUwZjMzOWE2MjNkOThkYmU0MTgzZmEyNDU2ZWI5Mjk4MDE5ZDI4OCIsImFjY291bnRfdXNlciI6IjQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9	2018-06-28 11:07:34.302878+00
6hrviv9er4y9ht670msk70x5rksvzx4y	ODIyZjM2YjQzMmFhOWI0OGE5Njg1ZjAyNWMyZjIwYmMxMDQzN2M1ZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjIwIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzVlNjRmZmRhMmNlYzVmZjMzYTYzZTA2YzY4YWUxYzA0ZDFkY2QxMyJ9	2018-06-29 13:55:13.478808+00
28qnpd0ht0s2hfxdfjwpshgemqbra4uc	NzlhMGI5ZjQyZDBiODc4NzM4MjhlNWQ5MTYxNWU5MzgyNjg0MGNjMDp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMDc0ZTU5MGZmMDgyNDEzYmQ1OTQyMjIyNWQ0NzMxMjY0ZDNlNjYyIn0=	2018-06-28 11:26:02.903156+00
6569ujaz8iuj4jhoqyocryfrvdx2o8yx	NjY0ZWJjZTZkOWYxMjEwYTFjMTJmN2M3ZDA4NWMzN2Y1ZWJlM2I4ZTp7ImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9oYXNoIjoiODMzM2FmZjI1NmVhOWJiYzk5NmNjNDZkOTRlNzAyZTczYWVlZmUyNyIsImFjY291bnRfdXNlciI6IjUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9	2018-06-28 11:32:56.025035+00
9p8jmdfi9cdphd35xhqkw6319jub7xax	ODIyZjM2YjQzMmFhOWI0OGE5Njg1ZjAyNWMyZjIwYmMxMDQzN2M1ZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjIwIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzVlNjRmZmRhMmNlYzVmZjMzYTYzZTA2YzY4YWUxYzA0ZDFkY2QxMyJ9	2018-06-29 13:59:50.170035+00
qlnql2a2k5vec7rub3lw6wvq2e748mwo	YjQwNzk4MzBhODBmZDg1MWUyOGQxMjkzYzE3NzUwODIyYzU2NzFhZDp7ImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaWQiOiI2IiwiX2F1dGhfdXNlcl9oYXNoIjoiYWNkY2I2OTM4YzJhNTM2ZjNmZDAwOTZmMTc4MmMzYzhhMDY5ZTY0MCIsImFjY291bnRfdXNlciI6IjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9	2018-06-28 11:34:16.197988+00
iycgl2povduih0y8mb9fef1wvsqcxvq0	YWFkMTJlMjAzNWMzZDA5ZGM4NTNhNDY3OGM1NjlkZTAzZWRhM2E3ODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjE4IiwiX2F1dGhfdXNlcl9oYXNoIjoiNDAzMjEzNTBjODk4NzQ2MjZjZjA2MWNlN2M2MTQ5NDM3YTQ5NzMxZSJ9	2018-06-29 16:44:31.730257+00
qpu63mr0imnn2hsy610h7jfl69bpons9	YWVkZDI3YTc1NDcxODcxZGRlNWFmZjkwZTA1MTgzNTgxMzYwZmUwZDp7ImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaWQiOiI3IiwiX2F1dGhfdXNlcl9oYXNoIjoiZjY3ZmEwMTMwYzMzOWU4NWYxNTZkNzQwMzQxMjQ0NDE5MzA3MjU2NSIsImFjY291bnRfdXNlciI6IjciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9	2018-06-28 12:03:16.413398+00
613yrpaqqy55hebc459d00ceily1gh66	YjZjNzI5ZGM5MWM1YTEzMTE2ZWE5MzBmZWUyNTVlZjYwMTA2Nzc5NDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjE5IiwiX2F1dGhfdXNlcl9oYXNoIjoiNjM0NWE0YjdkM2Y3ZDAzZTNiZTllNTRmMDAwYzc3M2NhOGFlZGIyMCJ9	2018-06-29 17:04:33.820829+00
gim3dnohvzoag9l3fo3jsaizw74fml08	YWZkNTllYmJkN2ExNDNlZWVhOThkNDIxMGRmMjY3YTFiMjI2ZDA1Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiOTIxN2IxYzVmYjBiNjA4ZmQwNjA3YTMyMWZjNDY1NGRlYjE4MTBmMSJ9	2018-06-29 18:28:55.114992+00
wel8osjie5pikkx9ft5fsrvfisypzvxn	YzIzZWRlYmNmYTQ4Y2ZjODMyOTU5ZDEyMmVlOGYxYzhkNTc4YzQwMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEwIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDRmMDViNDFiNWY1YjM4YjA4YmZhYmU0MmVkZWU0M2M4ZDQ4ZmIzOCJ9	2018-06-28 14:46:28.302706+00
p5uava2csbpz7snxdjqt8wa8d641qxym	Mzc0ZDNlZDBjNzZlNWJmMDExZTliM2E4MzAyZWIzZjM4MjE5NDlmMTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjQiLCJfYXV0aF91c2VyX2hhc2giOiJkNTBmMzM5YTYyM2Q5OGRiZTQxODNmYTI0NTZlYjkyOTgwMTlkMjg4In0=	2018-06-29 22:03:14.099743+00
lauy68wlidbxvoldr48fyl7e6vx339bs	NzU1MTJmZDc4ZjRjYzg3N2ViYTdiMjczMGY5NWQ3OTFkYjYwYzQ3MTp7Il9hdXRoX3VzZXJfaGFzaCI6IjliMWYwNDFkN2E5YmQyNzAxYjJjYzAwNzNjYzdkNGM5MjQ1MjJjZGQiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-06-28 21:10:42.446917+00
yq337oiyxk56ewhh8j0cliussv4z0kz4	MDIxNjE3NGJlY2I4MmU4NmM2YTU1NTY0MGVlZTM5MTcyYTQ5MTU2Yzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiYWNjb3VudF91c2VyIjoiaSIsIl9hdXRoX3VzZXJfaGFzaCI6IjQwMzIxMzUwYzg5ODc0NjI2Y2YwNjFjZTdjNjE0OTQzN2E0OTczMWUiLCJfYXV0aF91c2VyX2lkIjoiMTgiLCJhY2NvdW50X3ZlcmlmaWVkX2VtYWlsIjpudWxsfQ==	2018-06-29 07:13:08.463419+00
samf2rbiwdtkvajnwop9wu1kipdrkv14	ZTE4MjQzYjM4YjA5MDNmNTQ5ODNjNTFhNzZiYTg4YWM1M2Y0MTc1ZTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiYWNjb3VudF91c2VyIjoiaiIsIl9hdXRoX3VzZXJfaGFzaCI6IjYzNDVhNGI3ZDNmN2QwM2UzYmU5ZTU0ZjAwMGM3NzNjYThhZWRiMjAiLCJfYXV0aF91c2VyX2lkIjoiMTkiLCJhY2NvdW50X3ZlcmlmaWVkX2VtYWlsIjpudWxsfQ==	2018-06-29 07:22:05.277487+00
xxrrg50ntcvbjalzlsifxh938r56z1qg	OTdiZTE5YmU2ZTA0ZDU5NDgzZmY4NjgxN2NjYzk4ZDRhMjczMzViNDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiYWNjb3VudF91c2VyIjoiayIsIl9hdXRoX3VzZXJfaGFzaCI6IjM1ZTY0ZmZkYTJjZWM1ZmYzM2E2M2UwNmM2OGFlMWMwNGQxZGNkMTMiLCJfYXV0aF91c2VyX2lkIjoiMjAiLCJhY2NvdW50X3ZlcmlmaWVkX2VtYWlsIjpudWxsfQ==	2018-06-29 07:59:38.750017+00
xf7k1zthegkfin7o7ba59qm0chyw3673	OGI5MzllNTQxNWY1YTAwMDcyZjM0NTEyZDBlMDBiMzcwMDE1ZWM3Mzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiYWNjb3VudF92ZXJpZmllZF9lbWFpbCI6bnVsbCwiX2F1dGhfdXNlcl9pZCI6IjIxIiwiYWNjb3VudF91c2VyIjoibCIsIl9hdXRoX3VzZXJfaGFzaCI6IjkyMTdiMWM1ZmIwYjYwOGZkMDYwN2EzMjFmYzQ2NTRkZWIxODEwZjEifQ==	2018-06-29 09:36:03.766449+00
ocwqlahpuv433iwe67b89ygyw7cjutl5	NzU1MTJmZDc4ZjRjYzg3N2ViYTdiMjczMGY5NWQ3OTFkYjYwYzQ3MTp7Il9hdXRoX3VzZXJfaGFzaCI6IjliMWYwNDFkN2E5YmQyNzAxYjJjYzAwNzNjYzdkNGM5MjQ1MjJjZGQiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-06-29 10:00:31.529595+00
6yc9lcbxxmtpa39v6kksfchdlep1s9xo	ODIyZjM2YjQzMmFhOWI0OGE5Njg1ZjAyNWMyZjIwYmMxMDQzN2M1ZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjIwIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzVlNjRmZmRhMmNlYzVmZjMzYTYzZTA2YzY4YWUxYzA0ZDFkY2QxMyJ9	2018-06-30 06:36:34.932141+00
nvlgd3iaff8tov95joesoqxycodg7eri	NTAxYmU1NmY3NGQ3OWRkMzE4ZTlmOWIyYmY1M2FmZjUzNGFiNTE0Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjYzNDVhNGI3ZDNmN2QwM2UzYmU5ZTU0ZjAwMGM3NzNjYThhZWRiMjAiLCJfYXV0aF91c2VyX2lkIjoiMTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9	2018-07-03 06:41:24.932874+00
vsb1gnnctebmu5hnrcqhj9byk81ohvmc	NTAxYmU1NmY3NGQ3OWRkMzE4ZTlmOWIyYmY1M2FmZjUzNGFiNTE0Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjYzNDVhNGI3ZDNmN2QwM2UzYmU5ZTU0ZjAwMGM3NzNjYThhZWRiMjAiLCJfYXV0aF91c2VyX2lkIjoiMTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9	2018-07-09 07:16:08.740385+00
g5eux0kufng7k29nwz0o919vsiy56nj5	MjIxNGU2NTRlMDg0OTFmYTM5ZmUyMTNhMWIyNDMwY2UyNGIwOGRhMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjIwNzRlNTkwZmYwODI0MTNiZDU5NDIyMjI1ZDQ3MzEyNjRkM2U2NjIiLCJfYXV0aF91c2VyX2lkIjoiMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-07-02 07:41:06.853113+00
yy6f5al8zoc71u9nw4sf6fu41n6mjiox	NTAxYmU1NmY3NGQ3OWRkMzE4ZTlmOWIyYmY1M2FmZjUzNGFiNTE0Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjYzNDVhNGI3ZDNmN2QwM2UzYmU5ZTU0ZjAwMGM3NzNjYThhZWRiMjAiLCJfYXV0aF91c2VyX2lkIjoiMTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9	2018-07-10 08:11:53.422819+00
547m3w9yf7ao0bswct1fj2htafgov3ud	YzgzZTcwNjRkYjcwNTdhYTE2Njg5MGRjYzkxM2RkNTk0N2RkZTliNjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjI1IiwiX2F1dGhfdXNlcl9oYXNoIjoiMjIzZGEyODEwYjJhZTIyNGE1ZTdhMDA3NGE5ZTI5Y2FjODlmNGZmMyJ9	2018-07-16 11:19:16.812199+00
vahebbkpphhabdgkliklntxk3pssnkr5	NDdmM2IwZjljMDM3ZWNjNWNmM2Y2NGE5NGI4ZDgyNWJjYTY1YmRhYjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjUiLCJfYXV0aF91c2VyX2hhc2giOiI4MzMzYWZmMjU2ZWE5YmJjOTk2Y2M0NmQ5NGU3MDJlNzNhZWVmZTI3In0=	2018-07-17 09:19:58.387874+00
820joia0jk84numdkkq8ji13dfcf52kc	Y2ViNjBhZmRkMTNiN2YzNjgyNjBkYjE1NjdlODMwODViNjAzNDVmMzp7Il9hdXRoX3VzZXJfaWQiOiI5IiwiX2F1dGhfdXNlcl9oYXNoIjoiZjFmMDE1N2MwMGRiZDI2ZjA5ZjIyYTY2YmUwZTdkMzY4MTNiMzI2NiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-07-21 20:54:54.972067+00
2f3ya63n6cgd8rcjljvieddrt2ocr8m6	Yjk5Yzg3Y2U3ZWMyYjNjNTJjNjBmNWU1ODMyZTVlOWQ1NzFlMjNmMzp7Il9hdXRoX3VzZXJfaWQiOiIxOCIsIl9hdXRoX3VzZXJfaGFzaCI6IjQwMzIxMzUwYzg5ODc0NjI2Y2YwNjFjZTdjNjE0OTQzN2E0OTczMWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9	2018-07-28 13:27:06.429038+00
n19zqb6konmb8qla0pwqt892itddw09s	NWI3ZjllOTVlM2QxMDZkYmIwNDQwY2RhZTc3ZmNhOWFiYmYxYjA5MTp7Il9hdXRoX3VzZXJfaGFzaCI6IjQwMzIxMzUwYzg5ODc0NjI2Y2YwNjFjZTdjNjE0OTQzN2E0OTczMWUiLCJfYXV0aF91c2VyX2lkIjoiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9	2018-07-03 07:05:03.959346+00
rcydfh9zyvvz703mo3ufbzitvd11y79q	MjIxNGU2NTRlMDg0OTFmYTM5ZmUyMTNhMWIyNDMwY2UyNGIwOGRhMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjIwNzRlNTkwZmYwODI0MTNiZDU5NDIyMjI1ZDQ3MzEyNjRkM2U2NjIiLCJfYXV0aF91c2VyX2lkIjoiMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-07-06 06:26:59.610983+00
n5i3w9xg365ywgi15s2miz1pdqmhrbja	NTAxYmU1NmY3NGQ3OWRkMzE4ZTlmOWIyYmY1M2FmZjUzNGFiNTE0Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjYzNDVhNGI3ZDNmN2QwM2UzYmU5ZTU0ZjAwMGM3NzNjYThhZWRiMjAiLCJfYXV0aF91c2VyX2lkIjoiMTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9	2018-07-03 17:11:22.875532+00
dd2aqn1blmsjvu2s9cruoi0k14l2zxme	OWYwM2QyMjVlNWVlMjE3NTk2MmU4YTQ5MGY3MjhiNGYyYWEwODU0ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjIyM2RhMjgxMGIyYWUyMjRhNWU3YTAwNzRhOWUyOWNhYzg5ZjRmZjMiLCJfYXV0aF91c2VyX2lkIjoiMjUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9	2018-07-02 17:04:35.413527+00
0uekowyr9p2yp9ki7i0lfr98gjptr0zb	YTI1ZDk0MzZhNTVjMDYwYzI2ZTlkMTMxZTk5NDkwMDRmMDA1YzM3Zjp7Il9hdXRoX3VzZXJfaGFzaCI6ImIwYTNiODQ4MDc3MzViNTI4YzcxMGZlZDAwYzdlMDY5ZWNmYmNkMWUiLCJfYXV0aF91c2VyX2lkIjoiMjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9	2018-07-10 09:38:06.961248+00
imerne6slnodwrdw3ek4rfjptgiin23t	MjU5YTNjNDFkMTg4NjljN2E5ZjBiZjMxNWE2MmU1ZGZiNDY0NmExNzp7Il9hdXRoX3VzZXJfaWQiOiIyMSIsIl9hdXRoX3VzZXJfaGFzaCI6IjkyMTdiMWM1ZmIwYjYwOGZkMDYwN2EzMjFmYzQ2NTRkZWIxODEwZjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9	2018-07-21 20:56:48.012584+00
ce5as77k1pv0krux37ncmq08no5xy9ls	MjEwZGFlOTU4YTA0Nzg5YTdlMTI1ZGY2Njg3ZTJhZjYyZWRkODEyZDp7Il9hdXRoX3VzZXJfaWQiOiI3IiwiX2F1dGhfdXNlcl9oYXNoIjoiZjY3ZmEwMTMwYzMzOWU4NWYxNTZkNzQwMzQxMjQ0NDE5MzA3MjU2NSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-07-12 22:41:22.24181+00
kzmlxo1k1gc70kthmi1mx9thzdexpdz9	ZDM4NWE4ZjVkZTE2NzUyYzczMTZiNzExYTA1NjAxMDc1MWYzYmNkNjp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9oYXNoIjoiZDUwZjMzOWE2MjNkOThkYmU0MTgzZmEyNDU2ZWI5Mjk4MDE5ZDI4OCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-07-14 08:42:22.003076+00
ezifkfbdkx2knoktfrrsvchtbp2ssc0q	MzEwMTEzZmMwZTY5ODlkNDVkNWVjZWEwMWNkOTM1ZWRkMDE5MzQwYzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjkiLCJfYXV0aF91c2VyX2hhc2giOiJmMWYwMTU3YzAwZGJkMjZmMDlmMjJhNjZiZTBlN2QzNjgxM2IzMjY2In0=	2018-07-17 13:47:48.544448+00
rtot0cth17n4cmatugcld8zx9btwqsbf	NjE1ZGVkNWNjODVjNmE4ZWU0YWIzOWRkNjFmZTM2MzE1ZTdiY2YxZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImYxZjAxNTdjMDBkYmQyNmYwOWYyMmE2NmJlMGU3ZDM2ODEzYjMyNjYiLCJfYXV0aF91c2VyX2lkIjoiOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-06-30 09:28:34.218869+00
ea0mmy3ezzn6a1tzwiqr42wh7v5y2zg5	NTAxYmU1NmY3NGQ3OWRkMzE4ZTlmOWIyYmY1M2FmZjUzNGFiNTE0Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjYzNDVhNGI3ZDNmN2QwM2UzYmU5ZTU0ZjAwMGM3NzNjYThhZWRiMjAiLCJfYXV0aF91c2VyX2lkIjoiMTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9	2018-07-03 07:07:59.638534+00
q8oxz6xpjl9x3i940d63m343d7af4ia2	MzIyNTY2ZjNiYTMzZTZjZDM4NzU4ODFiMjhkNjI5N2U0ZWQ1Y2VmZTp7Il9hdXRoX3VzZXJfaWQiOiIyMyIsIl9hdXRoX3VzZXJfaGFzaCI6ImIwYTNiODQ4MDc3MzViNTI4YzcxMGZlZDAwYzdlMDY5ZWNmYmNkMWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9	2018-07-28 17:57:02.167739+00
l2u3k3l41sdhs37mywbf1tspl9ysatqn	NjE1ZGVkNWNjODVjNmE4ZWU0YWIzOWRkNjFmZTM2MzE1ZTdiY2YxZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImYxZjAxNTdjMDBkYmQyNmYwOWYyMmE2NmJlMGU3ZDM2ODEzYjMyNjYiLCJfYXV0aF91c2VyX2lkIjoiOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-07-02 09:38:59.395407+00
3r8kwi3ig268q6vafe00igjxd34btca8	MzhhNGE4ZDljMzQ0ZjM3ODRlMmI0ZGQ5MDFkZjc5MTQzZjRlODkyZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjkyMTdiMWM1ZmIwYjYwOGZkMDYwN2EzMjFmYzQ2NTRkZWIxODEwZjEiLCJfYXV0aF91c2VyX2lkIjoiMjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9	2018-07-10 13:21:48.906324+00
fb52zkxjkdc0rdfajdilonhewcj31csi	YjZjNzI5ZGM5MWM1YTEzMTE2ZWE5MzBmZWUyNTVlZjYwMTA2Nzc5NDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjE5IiwiX2F1dGhfdXNlcl9oYXNoIjoiNjM0NWE0YjdkM2Y3ZDAzZTNiZTllNTRmMDAwYzc3M2NhOGFlZGIyMCJ9	2018-07-15 17:01:01.778599+00
3nfda8ipt4ciosot0zbzjb1ua48ejw7a	NGZlMGU1NTliNmE4MTI3ZTE4YzdmYmNjNzdlM2JjYzNhMGNlNWMzNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiOWIxZjA0MWQ3YTliZDI3MDFiMmNjMDA3M2NjN2Q0YzkyNDUyMmNkZCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-07-20 20:29:37.712258+00
7olky7mtgl83vw0fecna6ywnzjo68qrg	Yjk5Yzg3Y2U3ZWMyYjNjNTJjNjBmNWU1ODMyZTVlOWQ1NzFlMjNmMzp7Il9hdXRoX3VzZXJfaWQiOiIxOCIsIl9hdXRoX3VzZXJfaGFzaCI6IjQwMzIxMzUwYzg5ODc0NjI2Y2YwNjFjZTdjNjE0OTQzN2E0OTczMWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9	2018-07-14 08:52:55.770941+00
c46v1n6nh6nxw3x6fnk6xo2727nv6plc	YTI1ZDk0MzZhNTVjMDYwYzI2ZTlkMTMxZTk5NDkwMDRmMDA1YzM3Zjp7Il9hdXRoX3VzZXJfaGFzaCI6ImIwYTNiODQ4MDc3MzViNTI4YzcxMGZlZDAwYzdlMDY5ZWNmYmNkMWUiLCJfYXV0aF91c2VyX2lkIjoiMjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9	2018-06-30 10:26:36.16531+00
crusmcecjok7gd2sgwhks3wdiqazlau3	OWYwM2QyMjVlNWVlMjE3NTk2MmU4YTQ5MGY3MjhiNGYyYWEwODU0ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjIyM2RhMjgxMGIyYWUyMjRhNWU3YTAwNzRhOWUyOWNhYzg5ZjRmZjMiLCJfYXV0aF91c2VyX2lkIjoiMjUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9	2018-07-03 12:13:24.039691+00
svoq44avostjdpnbt1vxnfk7ducdm9wq	MzhhNGE4ZDljMzQ0ZjM3ODRlMmI0ZGQ5MDFkZjc5MTQzZjRlODkyZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjkyMTdiMWM1ZmIwYjYwOGZkMDYwN2EzMjFmYzQ2NTRkZWIxODEwZjEiLCJfYXV0aF91c2VyX2lkIjoiMjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9	2018-07-03 20:07:55.963108+00
kxg62uzjhler75tijp97jv22r8ej2vue	MzEwMTEzZmMwZTY5ODlkNDVkNWVjZWEwMWNkOTM1ZWRkMDE5MzQwYzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjkiLCJfYXV0aF91c2VyX2hhc2giOiJmMWYwMTU3YzAwZGJkMjZmMDlmMjJhNjZiZTBlN2QzNjgxM2IzMjY2In0=	2018-07-17 17:29:29.955949+00
j1x54dggbdg4xvmlhzt7kohv2ol3dzk5	N2JlM2IyZTkzOGE5ZjBlOThhZDhhMzc0NGQ2ZGVlOTIyMTllM2RiNjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgzMzNhZmYyNTZlYTliYmM5OTZjYzQ2ZDk0ZTcwMmU3M2FlZWZlMjciLCJfYXV0aF91c2VyX2lkIjoiNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-06-30 12:05:52.619231+00
7k9lmmxilm16sv4x0o8cye919413c0xe	MzhhNGE4ZDljMzQ0ZjM3ODRlMmI0ZGQ5MDFkZjc5MTQzZjRlODkyZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjkyMTdiMWM1ZmIwYjYwOGZkMDYwN2EzMjFmYzQ2NTRkZWIxODEwZjEiLCJfYXV0aF91c2VyX2lkIjoiMjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9	2018-07-09 18:55:23.572731+00
ns4jd9dm0v4wms1n7wdg0ewlrp5q5kbg	MzIyNTY2ZjNiYTMzZTZjZDM4NzU4ODFiMjhkNjI5N2U0ZWQ1Y2VmZTp7Il9hdXRoX3VzZXJfaWQiOiIyMyIsIl9hdXRoX3VzZXJfaGFzaCI6ImIwYTNiODQ4MDc3MzViNTI4YzcxMGZlZDAwYzdlMDY5ZWNmYmNkMWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9	2018-07-14 15:23:59.942505+00
vxmex8gcod39qqdq4ytsxvf1yzs41aid	YTI1ZDk0MzZhNTVjMDYwYzI2ZTlkMTMxZTk5NDkwMDRmMDA1YzM3Zjp7Il9hdXRoX3VzZXJfaGFzaCI6ImIwYTNiODQ4MDc3MzViNTI4YzcxMGZlZDAwYzdlMDY5ZWNmYmNkMWUiLCJfYXV0aF91c2VyX2lkIjoiMjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9	2018-07-02 10:36:30.96277+00
zzpr0n11im6adpk5eecb0pom71f3rxjp	MjIxNGU2NTRlMDg0OTFmYTM5ZmUyMTNhMWIyNDMwY2UyNGIwOGRhMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjIwNzRlNTkwZmYwODI0MTNiZDU5NDIyMjI1ZDQ3MzEyNjRkM2U2NjIiLCJfYXV0aF91c2VyX2lkIjoiMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-07-03 20:29:52.634405+00
dw7ucuoqn0zudv035eppy3y0psnn3dgk	MjIxNGU2NTRlMDg0OTFmYTM5ZmUyMTNhMWIyNDMwY2UyNGIwOGRhMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjIwNzRlNTkwZmYwODI0MTNiZDU5NDIyMjI1ZDQ3MzEyNjRkM2U2NjIiLCJfYXV0aF91c2VyX2lkIjoiMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-07-07 14:20:17.175913+00
c3orpc75n42o5154j7mswwqhuhz5gaa0	NDdmM2IwZjljMDM3ZWNjNWNmM2Y2NGE5NGI4ZDgyNWJjYTY1YmRhYjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjUiLCJfYXV0aF91c2VyX2hhc2giOiI4MzMzYWZmMjU2ZWE5YmJjOTk2Y2M0NmQ5NGU3MDJlNzNhZWVmZTI3In0=	2018-07-20 13:19:57.110107+00
qo8cob6mzfao3q1tqx5du4l1y2lohxt7	MzhhNGE4ZDljMzQ0ZjM3ODRlMmI0ZGQ5MDFkZjc5MTQzZjRlODkyZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjkyMTdiMWM1ZmIwYjYwOGZkMDYwN2EzMjFmYzQ2NTRkZWIxODEwZjEiLCJfYXV0aF91c2VyX2lkIjoiMjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9	2018-07-12 15:36:10.556782+00
wrr0x9ro4y1c2tlq6kmkzny9j5ubg2c8	NTAxYmU1NmY3NGQ3OWRkMzE4ZTlmOWIyYmY1M2FmZjUzNGFiNTE0Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjYzNDVhNGI3ZDNmN2QwM2UzYmU5ZTU0ZjAwMGM3NzNjYThhZWRiMjAiLCJfYXV0aF91c2VyX2lkIjoiMTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9	2018-07-09 07:06:02.700915+00
ibeaqiyl7hx1foiac2sz0e40rtoae3q5	MmUzMWQ2ZTliMDc1NzE4Yzc2NjE0N2JiZGZjYWFhMzVjMTMwZGUxMDp7Il9hdXRoX3VzZXJfaWQiOiIxOSIsIl9hdXRoX3VzZXJfaGFzaCI6IjYzNDVhNGI3ZDNmN2QwM2UzYmU5ZTU0ZjAwMGM3NzNjYThhZWRiMjAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9	2018-07-13 10:54:40.543333+00
wd99iop4ruclnlv7vgzqe5n4d5o5q3g2	Y2ViNjBhZmRkMTNiN2YzNjgyNjBkYjE1NjdlODMwODViNjAzNDVmMzp7Il9hdXRoX3VzZXJfaWQiOiI5IiwiX2F1dGhfdXNlcl9oYXNoIjoiZjFmMDE1N2MwMGRiZDI2ZjA5ZjIyYTY2YmUwZTdkMzY4MTNiMzI2NiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-07-25 21:46:40.160983+00
8c68x8u96ceq5daognh5qtzb5wo1fa53	NWI3ZjllOTVlM2QxMDZkYmIwNDQwY2RhZTc3ZmNhOWFiYmYxYjA5MTp7Il9hdXRoX3VzZXJfaGFzaCI6IjQwMzIxMzUwYzg5ODc0NjI2Y2YwNjFjZTdjNjE0OTQzN2E0OTczMWUiLCJfYXV0aF91c2VyX2lkIjoiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9	2018-07-03 13:31:27.699256+00
gym82kjz3ofy4x80q8qlkjw25j4e6hv7	MGZkYjMyNDk2NmMzNWU5Y2ZlYzg4N2VhN2ZkNzUwMWM3NWM0OGQwNDp7Il9hdXRoX3VzZXJfaWQiOiIyMCIsIl9hdXRoX3VzZXJfaGFzaCI6IjM1ZTY0ZmZkYTJjZWM1ZmYzM2E2M2UwNmM2OGFlMWMwNGQxZGNkMTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9	2018-07-14 16:41:57.772162+00
dd212xzpjs7jaafbwsu27fj6vlyn0o8r	NGZlMGU1NTliNmE4MTI3ZTE4YzdmYmNjNzdlM2JjYzNhMGNlNWMzNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiOWIxZjA0MWQ3YTliZDI3MDFiMmNjMDA3M2NjN2Q0YzkyNDUyMmNkZCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-07-28 19:47:13.342374+00
jydcfraqhqhgjz2hpwktbgqh9xvf8i60	YzgzZTcwNjRkYjcwNTdhYTE2Njg5MGRjYzkxM2RkNTk0N2RkZTliNjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjI1IiwiX2F1dGhfdXNlcl9oYXNoIjoiMjIzZGEyODEwYjJhZTIyNGE1ZTdhMDA3NGE5ZTI5Y2FjODlmNGZmMyJ9	2018-07-16 20:02:23.697629+00
mdn8g6wyv2bph4efx2hdr8s5wp6wr9r7	ZDM4NWE4ZjVkZTE2NzUyYzczMTZiNzExYTA1NjAxMDc1MWYzYmNkNjp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9oYXNoIjoiZDUwZjMzOWE2MjNkOThkYmU0MTgzZmEyNDU2ZWI5Mjk4MDE5ZDI4OCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-07-23 07:01:44.500635+00
vdpegsdrlk2ajofvkrdcfsfae4ouxl7u	NTAxYmU1NmY3NGQ3OWRkMzE4ZTlmOWIyYmY1M2FmZjUzNGFiNTE0Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjYzNDVhNGI3ZDNmN2QwM2UzYmU5ZTU0ZjAwMGM3NzNjYThhZWRiMjAiLCJfYXV0aF91c2VyX2lkIjoiMTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9	2018-07-02 07:03:20.874113+00
ctja9faj0d71m6sm0bgkbfm67n02cxpo	NTAxYmU1NmY3NGQ3OWRkMzE4ZTlmOWIyYmY1M2FmZjUzNGFiNTE0Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjYzNDVhNGI3ZDNmN2QwM2UzYmU5ZTU0ZjAwMGM3NzNjYThhZWRiMjAiLCJfYXV0aF91c2VyX2lkIjoiMTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9	2018-07-11 07:22:52.434016+00
8vohmzux9ybph7qt4cwqzbkory7ep66n	NzU1MTJmZDc4ZjRjYzg3N2ViYTdiMjczMGY5NWQ3OTFkYjYwYzQ3MTp7Il9hdXRoX3VzZXJfaGFzaCI6IjliMWYwNDFkN2E5YmQyNzAxYjJjYzAwNzNjYzdkNGM5MjQ1MjJjZGQiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-07-12 16:38:45.934725+00
9ushu13i7t8h4uxcd6to3xodtmps66fh	MjIxNGU2NTRlMDg0OTFmYTM5ZmUyMTNhMWIyNDMwY2UyNGIwOGRhMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjIwNzRlNTkwZmYwODI0MTNiZDU5NDIyMjI1ZDQ3MzEyNjRkM2U2NjIiLCJfYXV0aF91c2VyX2lkIjoiMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-07-06 06:09:09.620835+00
xy8v9pig8rdqvvug9krpt85hg49p1f3w	MjU5YTNjNDFkMTg4NjljN2E5ZjBiZjMxNWE2MmU1ZGZiNDY0NmExNzp7Il9hdXRoX3VzZXJfaWQiOiIyMSIsIl9hdXRoX3VzZXJfaGFzaCI6IjkyMTdiMWM1ZmIwYjYwOGZkMDYwN2EzMjFmYzQ2NTRkZWIxODEwZjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9	2018-07-13 14:02:03.841897+00
btzbbb7ejptx0pum9yxwrsv3iqjrpuq3	NGRkM2FkOGEzZTBiZDJkNDI5ZGZlMjZlNjk1MTZhMGMxMjkzNTQyNDp7ImFjY291bnRfdXNlciI6InAiLCJfYXV0aF91c2VyX2hhc2giOiIyMjNkYTI4MTBiMmFlMjI0YTVlN2EwMDc0YTllMjljYWM4OWY0ZmYzIiwiX2F1dGhfdXNlcl9pZCI6IjI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJhY2NvdW50X3ZlcmlmaWVkX2VtYWlsIjpudWxsfQ==	2018-07-02 07:03:38.382862+00
wkvkynsbguwabcv164ua7qskeiklipeo	MjIxNGU2NTRlMDg0OTFmYTM5ZmUyMTNhMWIyNDMwY2UyNGIwOGRhMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjIwNzRlNTkwZmYwODI0MTNiZDU5NDIyMjI1ZDQ3MzEyNjRkM2U2NjIiLCJfYXV0aF91c2VyX2lkIjoiMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-07-11 08:06:33.276231+00
1haqazakko3q5wcvutjq4mfx8t9jnjgy	NDAyYzk3YzA1YmU2YjgwODBmMzNmNjAxYjU0MWMwYTllZDA5ZTg3YTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjMiLCJfYXV0aF91c2VyX2hhc2giOiIyMDc0ZTU5MGZmMDgyNDEzYmQ1OTQyMjIyNWQ0NzMxMjY0ZDNlNjYyIn0=	2018-07-17 07:52:31.471832+00
6ch4fx20vqixyqrdct0zhkq7u0vc5pm3	MzIyNTY2ZjNiYTMzZTZjZDM4NzU4ODFiMjhkNjI5N2U0ZWQ1Y2VmZTp7Il9hdXRoX3VzZXJfaWQiOiIyMyIsIl9hdXRoX3VzZXJfaGFzaCI6ImIwYTNiODQ4MDc3MzViNTI4YzcxMGZlZDAwYzdlMDY5ZWNmYmNkMWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9	2018-07-13 15:07:59.311249+00
p3nh7pmgv2nyvwxbuzw982ql01nfhp4s	MzNkY2I2Nzc5YTlmYWY4ZTZhMzQ1Y2IxZmM0MDYzYzZkODczNDBhYzp7Il9hdXRoX3VzZXJfaWQiOiIyNSIsIl9hdXRoX3VzZXJfaGFzaCI6IjIyM2RhMjgxMGIyYWUyMjRhNWU3YTAwNzRhOWUyOWNhYzg5ZjRmZjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9	2018-07-24 19:58:45.962995+00
5d1ccbqyz5ytfa5igpvdrwqppx3qzk7x	YTExMWVmYjRmNzJlZjYzNjY4NTY3ODk5ZjhkZDU2ZjAyOWM1OTdjOTp7ImFjY291bnRfdXNlciI6InEiLCJfYXV0aF91c2VyX2hhc2giOiI1YTkxNDVlNTdmNWQ4NDFjOWRhZTAzNjc1NmQ4Zjg3NmM3Y2ZiNjE2IiwiX2F1dGhfdXNlcl9pZCI6IjI2IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJhY2NvdW50X3ZlcmlmaWVkX2VtYWlsIjpudWxsfQ==	2018-07-02 07:06:48.551655+00
qjrd2xr24a3symq3zfr7g88fcu4nci1a	NjE1ZGVkNWNjODVjNmE4ZWU0YWIzOWRkNjFmZTM2MzE1ZTdiY2YxZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImYxZjAxNTdjMDBkYmQyNmYwOWYyMmE2NmJlMGU3ZDM2ODEzYjMyNjYiLCJfYXV0aF91c2VyX2lkIjoiOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-07-03 16:56:12.338771+00
3q2r120f81i39j4e8jqnzt1kr8ntwek4	NzU1MTJmZDc4ZjRjYzg3N2ViYTdiMjczMGY5NWQ3OTFkYjYwYzQ3MTp7Il9hdXRoX3VzZXJfaGFzaCI6IjliMWYwNDFkN2E5YmQyNzAxYjJjYzAwNzNjYzdkNGM5MjQ1MjJjZGQiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-07-02 14:13:39.711629+00
v56tqkzj1d9234guaz3r6wwexktfm152	YWFkMTJlMjAzNWMzZDA5ZGM4NTNhNDY3OGM1NjlkZTAzZWRhM2E3ODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjE4IiwiX2F1dGhfdXNlcl9oYXNoIjoiNDAzMjEzNTBjODk4NzQ2MjZjZjA2MWNlN2M2MTQ5NDM3YTQ5NzMxZSJ9	2018-07-16 11:11:21.123167+00
ag55j2pecw81hxql86wg99nc2dzbqj8i	MGZkYjMyNDk2NmMzNWU5Y2ZlYzg4N2VhN2ZkNzUwMWM3NWM0OGQwNDp7Il9hdXRoX3VzZXJfaWQiOiIyMCIsIl9hdXRoX3VzZXJfaGFzaCI6IjM1ZTY0ZmZkYTJjZWM1ZmYzM2E2M2UwNmM2OGFlMWMwNGQxZGNkMTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9	2018-07-13 15:08:33.150202+00
c3af4s88yzhdfiusokr0yhpa2j43tsa5	ODIyZjM2YjQzMmFhOWI0OGE5Njg1ZjAyNWMyZjIwYmMxMDQzN2M1ZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjIwIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzVlNjRmZmRhMmNlYzVmZjMzYTYzZTA2YzY4YWUxYzA0ZDFkY2QxMyJ9	2018-07-18 09:29:46.093145+00
yni13op1f0sganzaw3taaqf7v8hucfcv	MjEwZGFlOTU4YTA0Nzg5YTdlMTI1ZGY2Njg3ZTJhZjYyZWRkODEyZDp7Il9hdXRoX3VzZXJfaWQiOiI3IiwiX2F1dGhfdXNlcl9oYXNoIjoiZjY3ZmEwMTMwYzMzOWU4NWYxNTZkNzQwMzQxMjQ0NDE5MzA3MjU2NSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-07-28 11:51:32.814963+00
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: -
--

COPY django_site (id, domain, name) FROM stdin;
1	https://typer.aitsolutions.pl	Typer Rosja 2018
\.


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('django_site_id_seq', 1, true);


--
-- Data for Name: match_match; Type: TABLE DATA; Schema: public; Owner: -
--

COPY match_match (id, datetime, score_id, stadium_id, "teamAway_id", "teamHome_id", group_id, round_id, prediction_enabled) FROM stdin;
28	2018-06-27 18:00:00+00	41	2	3	25	5	1	f
29	2018-06-27 18:00:00+00	42	6	19	11	5	1	f
35	2018-06-27 14:00:00+00	43	12	20	14	6	1	f
34	2018-06-27 14:00:00+00	44	5	2	31	6	1	f
57	2018-07-06 14:00:00+00	59	6	8	15	\N	3	f
58	2018-07-06 18:00:00+00	60	5	6	3	\N	3	f
47	2018-06-28 14:00:00+00	45	7	13	23	8	1	f
46	2018-06-28 14:00:00+00	46	8	7	28	8	1	f
40	2018-06-28 18:00:00+00	47	4	6	12	7	1	f
41	2018-06-28 18:00:00+00	48	9	21	30	7	1	f
60	2018-07-07 14:00:00+00	61	7	12	20	\N	3	f
59	2018-07-07 18:00:00+00	62	11	16	1	\N	3	f
49	2018-06-30 14:00:00+00	51	5	5	8	\N	2	f
50	2018-06-30 18:00:00+00	52	11	4	15	\N	2	f
51	2018-07-01 14:00:00+00	53	1	1	9	\N	2	f
61	2018-07-10 18:00:00+00	63	3	6	8	\N	4	f
52	2018-07-01 18:00:00+00	54	6	17	16	\N	2	f
62	2018-07-11 18:00:00+00	64	1	12	16	\N	4	f
53	2018-07-02 14:00:00+00	55	7	14	3	\N	2	f
54	2018-07-02 18:00:00+00	56	10	28	6	\N	2	f
15	2018-06-21 15:00:00+00	23	12	10	8	3	1	f
1	2018-06-14 15:00:00+00	1	1	32	1	1	1	f
2	2018-06-15 12:00:00+00	2	12	15	22	1	1	f
26	2018-06-22 12:00:00+00	24	3	19	3	5	1	f
64	2018-07-15 15:00:00+00	\N	1	16	8	\N	6	t
55	2018-07-03 14:00:00+00	57	3	11	20	\N	2	f
7	2018-06-15 15:00:00+00	3	3	24	29	2	1	f
8	2018-06-15 18:00:00+00	4	11	9	4	2	1	f
21	2018-06-22 15:00:00+00	25	8	18	26	4	1	f
13	2018-06-16 10:00:00+00	5	5	27	8	3	1	f
19	2018-06-16 13:00:00+00	6	2	18	5	4	1	f
27	2018-06-22 18:00:00+00	26	4	11	25	5	1	f
14	2018-06-16 16:00:00+00	7	9	17	10	3	1	f
20	2018-06-16 19:00:00+00	8	6	26	16	4	1	f
38	2018-06-23 12:00:00+00	27	2	21	6	7	1	f
56	2018-07-03 18:00:00+00	58	2	12	13	\N	2	f
24	2018-06-17 12:00:00+00	9	7	25	19	5	1	f
25	2018-06-17 18:00:00+00	10	10	11	3	5	1	f
30	2018-06-17 15:00:00+00	11	1	14	2	6	1	f
33	2018-06-23 15:00:00+00	28	10	14	31	6	1	f
32	2018-06-23 18:00:00+00	29	11	20	2	6	1	f
37	2018-06-18 18:00:00+00	12	8	12	21	7	1	f
36	2018-06-18 15:00:00+00	13	11	30	6	7	1	f
31	2018-06-18 12:00:00+00	14	6	31	20	6	1	f
42	2018-06-19 12:00:00+00	15	9	28	13	8	1	f
63	2018-07-14 14:00:00+00	65	3	12	6	\N	5	f
43	2018-06-19 15:00:00+00	16	2	23	7	8	1	f
44	2018-06-24 15:00:00+00	30	12	23	28	8	1	f
3	2018-06-19 18:00:00+00	17	3	22	1	1	1	f
39	2018-06-24 12:00:00+00	31	6	30	12	7	1	f
9	2018-06-20 12:00:00+00	18	1	29	4	2	1	f
45	2018-06-24 18:00:00+00	32	5	13	7	8	1	f
4	2018-06-20 15:00:00+00	19	10	32	15	1	1	f
10	2018-06-20 18:00:00+00	20	5	9	24	2	1	f
12	2018-06-25 18:00:00+00	33	4	29	9	2	1	f
16	2018-06-21 12:00:00+00	21	7	27	17	3	1	f
48	2018-06-21 18:00:00+00	22	6	16	5	4	1	f
11	2018-06-25 18:00:00+00	34	9	4	24	2	1	f
6	2018-06-25 14:00:00+00	36	8	22	32	1	1	f
5	2018-06-25 14:00:00+00	35	7	1	15	1	1	f
18	2018-06-26 14:00:00+00	37	11	10	27	3	1	f
17	2018-06-26 14:00:00+00	38	1	8	17	3	1	f
23	2018-06-26 18:00:00+00	39	10	16	18	4	1	f
22	2018-06-26 18:00:00+00	40	3	5	26	4	1	f
\.


--
-- Name: match_match_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('match_match_id_seq', 64, true);


--
-- Data for Name: match_score; Type: TABLE DATA; Schema: public; Owner: -
--

COPY match_score (id, regular, et, penalty, regular_home, regular_away, et_home, et_away, penalty_home, penalty_away, winner) FROM stdin;
1	5-0	\N	\N	5	0	\N	\N	\N	\N	\N
2	0-1	\N	\N	0	1	\N	\N	\N	\N	\N
3	0-1	\N	\N	0	1	\N	\N	\N	\N	\N
4	3-3	\N	\N	3	3	\N	\N	\N	\N	\N
5	2-1	\N	\N	2	1	\N	\N	\N	\N	\N
6	1-1	\N	\N	1	1	\N	\N	\N	\N	\N
7	0-1	\N	\N	0	1	\N	\N	\N	\N	\N
8	2-0	\N	\N	2	0	\N	\N	\N	\N	\N
9	0-1	\N	\N	0	1	\N	\N	\N	\N	\N
10	1-1	\N	\N	1	1	\N	\N	\N	\N	\N
11	0-1	\N	\N	0	1	\N	\N	\N	\N	\N
12	1-2	\N	\N	1	2	\N	\N	\N	\N	\N
14	1-0	\N	\N	1	0	\N	\N	\N	\N	\N
13	3-0	\N	\N	3	0	\N	\N	\N	\N	\N
15	1-2	\N	\N	1	2	\N	\N	\N	\N	\N
16	1-2	\N	\N	1	2	\N	\N	\N	\N	\N
17	3-1	\N	\N	3	1	\N	\N	\N	\N	\N
18	1-0	\N	\N	1	0	\N	\N	\N	\N	\N
19	1-0	\N	\N	1	0	\N	\N	\N	\N	\N
20	0-1	\N	\N	0	1	\N	\N	\N	\N	\N
21	1-1	\N	\N	1	1	\N	\N	\N	\N	\N
22	0-3	\N	\N	0	3	\N	\N	\N	\N	\N
23	1-0	\N	\N	1	0	\N	\N	\N	\N	\N
24	2-0	\N	\N	2	0	\N	\N	\N	\N	\N
25	2-0	\N	\N	2	0	\N	\N	\N	\N	\N
26	1-2	\N	\N	1	2	\N	\N	\N	\N	\N
27	5-2	\N	\N	5	2	\N	\N	\N	\N	\N
28	1-2	\N	\N	1	2	\N	\N	\N	\N	\N
29	2-1	\N	\N	2	1	\N	\N	\N	\N	\N
30	2-2	\N	\N	2	2	\N	\N	\N	\N	\N
31	6-1	\N	\N	6	1	\N	\N	\N	\N	\N
32	0-3	\N	\N	0	3	\N	\N	\N	\N	\N
33	2-2	\N	\N	2	2	\N	\N	\N	\N	\N
34	1-1	\N	\N	1	1	\N	\N	\N	\N	\N
36	2-1	\N	\N	2	1	\N	\N	\N	\N	\N
35	3-0	\N	\N	3	0	\N	\N	\N	\N	\N
37	0-2	\N	\N	0	2	\N	\N	\N	\N	\N
38	0-0	\N	\N	0	0	\N	\N	\N	\N	\N
39	1-2	\N	\N	1	2	\N	\N	\N	\N	\N
40	1-2	\N	\N	1	2	\N	\N	\N	\N	\N
41	0-2	\N	\N	0	2	\N	\N	\N	\N	\N
42	2-2	\N	\N	2	2	\N	\N	\N	\N	\N
43	0-3	\N	\N	0	3	\N	\N	\N	\N	\N
44	2-0	\N	\N	2	0	\N	\N	\N	\N	\N
45	0-1	\N	\N	0	1	\N	\N	\N	\N	\N
46	0-1	\N	\N	0	1	\N	\N	\N	\N	\N
47	0-1	\N	\N	0	1	\N	\N	\N	\N	\N
48	1-2	\N	\N	1	2	\N	\N	\N	\N	\N
51	4-3	\N	\N	4	3	\N	\N	\N	\N	\N
52	2-1	\N	\N	2	1	\N	\N	\N	\N	\N
53	1-1	\N	\N	1	1	\N	\N	\N	\N	\N
54	1-1	\N	\N	1	1	\N	\N	\N	\N	\N
55	2-0	\N	\N	2	0	\N	\N	\N	\N	\N
56	3-2	\N	\N	3	2	\N	\N	\N	\N	\N
57	1-0	\N	\N	1	0	\N	\N	\N	\N	\N
58	1-1	\N	\N	1	1	\N	\N	\N	\N	\N
59	0-2	\N	\N	0	2	\N	\N	\N	\N	\N
60	1-2	\N	\N	1	2	\N	\N	\N	\N	\N
61	0-2	\N	\N	0	2	\N	\N	\N	\N	\N
62	2-2	\N	\N	2	2	\N	\N	\N	\N	\N
63	1-0	\N	\N	1	0	\N	\N	\N	\N	\N
64	2-1	\N	\N	2	1	\N	\N	\N	\N	\N
65	2-0	\N	\N	2	0	\N	\N	\N	\N	\N
\.


--
-- Name: match_score_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('match_score_id_seq', 65, true);


--
-- Data for Name: places_stadium; Type: TABLE DATA; Schema: public; Owner: -
--

COPY places_stadium (id, name, city) FROM stdin;
1	Stadion Łużniki	Moskwa
2	Otkrytije Arena	Moskwa
3	Stadion Kriestowskij	Petersburg
4	Stadion Kaliningrad	Kaliningrad
5	Kazań Arena	Kazań
6	Niżny Nowogród	Stadion Striełka
7	Samara Arena	Samara
8	Wołgograd Arena	Wołgograd
9	Mordowija Arena	Sarańsk
10	Rostow Arena	Rostów nad Donem
11	Stadion Olimpijski	Soczi
12	Stadion Centralny	Jekaterynburg
\.


--
-- Name: places_stadium_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('places_stadium_id_seq', 12, true);


--
-- Data for Name: prediction_extraquestions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prediction_extraquestions (id, text, answer_type, points, correct_answer, answer_enabled, close_datetime, half_points, group_id) FROM stdin;
3	Jak daleko zajdzie reprezentacja Polski?	5	7	\N	f	2018-06-19 11:55:00+00	0	\N
2	Które drużyny zagrają w finale?	3	14	\N	f	2018-06-19 17:55:00+00	8	\N
4	Które drużyny wyjdą z grupy A?	4	5	\N	f	2018-06-19 17:55:00+00	2	1
5	Które drużyny wyjdą z grupy B?	4	5	\N	f	2018-06-19 17:55:00+00	2	2
6	Które drużyny wyjdą z grupy C?	4	5	\N	f	2018-06-19 17:55:00+00	2	3
7	Które drużyny wyjdą z grupy D?	4	5	\N	f	2018-06-19 17:55:00+00	2	4
8	Które drużyny wyjdą z grupy E?	4	5	\N	f	2018-06-19 17:55:00+00	2	5
9	Które drużyny wyjdą z grupy F?	4	5	\N	f	2018-06-19 17:55:00+00	2	6
10	Które drużyny wyjdą z grupy G?	4	5	\N	f	2018-06-19 17:55:00+00	2	7
11	Które drużyny wyjdą z grupy H?	4	5	\N	f	2018-06-19 17:55:00+00	2	8
1	Która drużyna wygra Mistrzostwa Świata 2018?	2	20	\N	f	2018-06-19 17:55:00+00	0	\N
\.


--
-- Name: prediction_extraquestions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('prediction_extraquestions_id_seq', 11, true);


--
-- Data for Name: prediction_extraquestionsuseranswers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prediction_extraquestionsuseranswers (id, answer_text, answer_integer, editable, question_id, points, user_id) FROM stdin;
9		21,22	f	9	\N	25
10		28,25	f	10	\N	25
137	-	15,22	f	4	\N	1
38		22,21	f	9	\N	3
4		1,3	f	4	\N	25
33		3,1	f	4	\N	3
129		23,22	f	9	\N	20
39		25,28	f	10	\N	3
11		29,32	f	11	\N	25
1		7	f	1	\N	25
130		28,25	f	10	\N	20
40		30,29	f	11	\N	3
90		1,3	f	4	\N	19
20		22,21	f	9	\N	24
30		3	f	1	\N	3
21		25,28	f	10	\N	24
8		19,20	f	8	\N	25
131		29,30	f	11	\N	20
5		7,8	f	5	\N	25
2		7,4	f	2	\N	25
41		1,3	f	4	\N	9
22		32,31	f	11	\N	24
77		3,2	f	4	\N	4
34		8,7	f	5	\N	3
91		8,7	f	5	\N	19
6		9,12	f	6	\N	25
7		13,14	f	7	\N	25
37		19,18	f	8	\N	3
56		21,23	f	9	\N	9
57		25,28	f	10	\N	9
61		31,32	f	11	\N	9
104		6	f	1	\N	18
35		9,12	f	6	\N	3
78		7,8	f	5	\N	4
107		1,3	f	4	\N	18
36		15,13	f	7	\N	3
67		8,7	f	5	\N	7
92		12,9	f	6	\N	19
93		15,13	f	7	\N	19
128		19,20	f	8	\N	20
79		9,12	f	6	\N	4
55		15,13	f	7	\N	9
27		20,19	f	8	\N	1
98		12	f	1	\N	20
59		25,28	f	10	\N	9
108		7,8	f	5	\N	18
68		9,12	f	6	\N	7
80		15,14	f	7	\N	4
95		21,23	f	9	\N	19
83		25,28	f	10	\N	4
19		19,20	f	8	\N	24
136		32,30	f	11	\N	23
62		9	f	1	\N	9
96		25,28	f	10	\N	19
84		29,30	f	11	\N	4
60		19,20	f	8	\N	9
87		9	f	1	\N	19
109		9,11	f	6	\N	18
69		15,13	f	7	\N	7
94		19,18	f	8	\N	19
66		3,1	f	4	\N	7
101		1,3	f	4	\N	20
3		5	f	3	\N	25
32		2	f	3	\N	3
44		2	f	3	\N	2
103		2	f	3	\N	1
14		5	f	3	\N	24
89		3	f	3	\N	19
64		2	f	3	\N	9
76		3	f	3	\N	4
65		2	f	3	\N	7
100		3	f	3	\N	20
117		2	f	3	\N	21
106		3	f	3	\N	18
58		21,23	f	9	\N	9
82		21,22	f	9	\N	4
28		25,28	f	10	\N	1
97		29,32	f	11	\N	19
134		2	f	1	\N	23
119		7,8	f	5	\N	21
120		9,11	f	6	\N	21
121		15,13	f	7	\N	21
81		18,19	f	8	\N	4
118		1,3	f	4	\N	21
127		13,15	f	7	\N	20
126		11,9	f	6	\N	20
31		3,5	f	2	\N	3
99		12,18	f	2	\N	20
105		1,6	f	2	\N	18
63		9,3	f	2	\N	9
88		2,9	f	2	\N	19
135		2,5	f	2	\N	23
75		2,9	f	2	\N	4
85		2,9	f	2	\N	7
116		1,8	f	2	\N	21
133		2,16	f	2	\N	1
43		9,6	f	2	\N	2
13		8,2	f	2	\N	24
45		3,1	f	4	\N	2
15		1,3	f	4	\N	24
102		7,8	f	5	\N	20
46		8,7	f	5	\N	2
24		7,8	f	5	\N	1
16		7,8	f	5	\N	24
53		7,8	f	5	\N	9
47		9,12	f	6	\N	2
25		9,12	f	6	\N	1
17		9,12	f	6	\N	24
54		9,12	f	6	\N	9
48		15,14	f	7	\N	2
110		15,13	f	7	\N	18
26		15,14	f	7	\N	1
18		13,14	f	7	\N	24
70		19,20	f	8	\N	7
122		19,20	f	8	\N	21
111		19,20	f	8	\N	18
49		19,20	f	8	\N	2
71		22,21	f	9	\N	7
132		22,21	f	9	\N	1
123		21,23	f	9	\N	21
112		22,21	f	9	\N	18
50		22,21	f	9	\N	2
72		25,28	f	10	\N	7
124		25,28	f	10	\N	21
113		25,28	f	10	\N	18
51		25,28	f	10	\N	2
73		30,29	f	11	\N	7
29		29,31	f	11	\N	1
125		29,30	f	11	\N	21
114		29,31	f	11	\N	18
52		29,31	f	11	\N	2
74		2	f	1	\N	4
86		9	f	1	\N	7
115		8	f	1	\N	21
23		2	f	1	\N	1
42		9	f	1	\N	2
12		8	f	1	\N	24
\.


--
-- Name: prediction_extraquestionsuseranswers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('prediction_extraquestionsuseranswers_id_seq', 137, true);


--
-- Data for Name: prediction_points; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prediction_points (id, rule, points) FROM stdin;
3	1	7
4	2	4
5	3	1
6	4	1
\.


--
-- Name: prediction_points_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('prediction_points_id_seq', 6, true);


--
-- Data for Name: prediction_prediction; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prediction_prediction (id, goals_home, goals_away, points, match_id, user_id, editable) FROM stdin;
55	3	1	0	43	19	f
123	3	1	1	30	20	f
9	2	1	2	7	4	f
125	2	1	5	31	20	f
120	2	2	0	14	20	f
72	1	0	1	7	22	f
126	2	0	5	36	20	f
84	2	0	0	42	22	f
21	0	0	1	14	2	f
36	1	1	1	14	18	f
1	2	0	5	1	1	f
7	1	1	0	1	4	f
18	1	1	0	1	10	f
15	1	0	5	1	7	f
2	2	0	5	1	2	f
17	2	0	5	1	5	f
16	2	0	5	1	9	f
14	1	1	0	1	6	f
6	3	0	5	1	3	f
26	2	0	5	1	13	f
30	5	0	7	1	18	f
23	2	1	2	24	2	f
86	2	0	5	3	22	f
89	0	4	5	10	22	f
35	1	1	7	19	18	f
4	0	1	7	7	2	f
76	1	1	1	14	22	f
79	2	1	2	30	22	f
44	2	1	1	43	1	f
24	1	0	1	30	2	f
78	0	2	5	24	22	f
119	2	0	0	19	20	f
20	0	0	5	19	2	f
124	2	0	0	25	20	f
85	2	1	1	43	22	f
43	0	0	5	19	1	f
28	1	1	1	7	1	f
87	2	0	5	9	22	f
91	1	1	7	16	22	f
88	4	0	5	4	22	f
50	1	0	1	14	19	f
39	3	0	0	30	18	f
38	2	1	2	24	18	f
81	0	0	1	31	22	f
32	0	0	1	7	18	f
10	1	1	5	8	4	f
61	1	1	5	8	21	f
5	1	0	0	8	2	f
73	1	2	0	8	22	f
75	3	1	1	19	22	f
60	2	0	0	7	21	f
122	0	1	7	24	20	f
29	0	1	0	8	1	f
65	1	2	0	8	9	f
47	2	3	1	8	19	f
95	2	1	1	27	22	f
90	3	0	5	15	22	f
92	2	1	0	48	22	f
33	2	2	5	8	18	f
13	0	1	0	8	3	f
49	2	0	0	19	19	f
93	3	0	5	26	22	f
98	2	0	5	32	22	f
94	1	2	0	21	22	f
96	3	0	5	38	22	f
101	1	1	0	45	22	f
67	2	1	1	19	3	f
97	0	3	4	33	22	f
99	2	0	4	39	22	f
106	0	2	1	17	22	f
100	2	2	7	44	22	f
104	0	4	0	11	22	f
102	0	2	0	6	22	f
105	3	0	0	12	22	f
103	2	0	5	5	22	f
127	0	2	5	37	20	f
82	2	0	5	36	22	f
80	2	0	0	25	22	f
40	2	1	1	25	18	f
54	2	2	5	25	19	f
34	1	0	5	13	18	f
25	1	0	1	25	2	f
42	2	0	5	13	1	f
19	2	0	5	13	2	f
74	2	0	5	13	22	f
48	1	1	1	13	19	f
66	3	0	4	13	3	f
121	5	0	5	20	20	f
69	1	1	0	20	3	f
22	2	0	7	20	2	f
77	2	0	7	20	22	f
37	3	0	5	20	18	f
51	1	2	0	20	19	f
133	0	1	7	10	20	f
45	1	3	4	2	19	f
118	2	0	5	13	20	f
64	2	1	2	7	9	f
46	2	0	0	7	19	f
12	1	1	1	7	3	f
58	1	2	5	7	20	f
68	0	2	5	14	3	f
128	2	1	1	42	20	f
130	3	0	5	3	20	f
83	0	2	5	37	22	f
53	3	1	1	30	19	f
52	1	1	1	24	19	f
62	1	1	1	31	19	f
41	1	0	7	31	18	f
131	3	0	5	9	20	f
129	3	1	0	43	20	f
135	0	1	1	16	20	f
132	1	0	7	4	20	f
139	0	2	5	27	20	f
134	2	0	5	15	20	f
136	2	2	0	48	20	f
137	2	0	7	26	20	f
142	3	1	5	32	20	f
138	0	2	1	21	20	f
140	1	0	4	38	20	f
145	1	0	0	45	20	f
141	0	3	4	33	20	f
143	2	0	4	39	20	f
109	1	2	7	23	22	f
144	1	0	0	44	20	f
147	0	3	0	6	20	f
148	0	3	0	11	20	f
146	0	1	0	5	20	f
149	3	0	0	12	20	f
108	0	3	4	22	22	f
110	0	2	1	34	22	f
107	1	1	0	18	22	f
114	1	2	5	46	22	f
112	1	1	5	29	22	f
111	2	0	0	35	22	f
113	1	2	5	28	22	f
115	1	3	4	47	22	f
117	2	1	1	41	22	f
116	1	1	1	40	22	f
161	2	3	5	40	20	f
212	3	0	4	13	9	t
184	0	1	5	37	23	f
260	2	0	5	32	24	f
165	3	1	5	13	21	f
168	2	0	5	13	7	f
175	3	0	4	13	23	f
195	2	0	5	13	5	f
200	3	0	4	13	4	f
213	2	0	5	13	13	f
190	1	1	1	10	23	f
166	1	1	7	19	21	f
217	4	0	0	19	5	f
169	2	1	1	19	7	f
59	0	1	7	2	21	f
63	1	3	4	2	9	f
31	1	3	4	2	18	f
71	0	2	5	2	22	f
70	2	3	5	2	5	f
57	1	3	4	2	20	f
27	1	2	5	2	1	f
11	0	2	5	2	3	f
8	0	2	5	2	4	f
3	0	2	5	2	2	f
201	1	1	7	19	4	f
214	2	0	0	19	9	f
176	2	1	1	19	23	f
192	3	0	5	1	22	f
153	0	2	5	22	20	f
171	3	1	5	20	7	f
224	2	1	1	19	24	f
225	2	0	\N	19	13	f
198	1	3	4	2	13	f
162	1	1	1	7	7	f
164	0	1	7	7	23	f
193	0	1	7	7	5	f
197	2	2	0	7	13	f
56	2	2	5	8	20	f
163	1	2	0	8	7	f
174	2	1	0	8	23	f
194	1	2	0	8	5	f
199	2	3	1	8	13	f
159	2	0	0	46	20	f
150	0	1	5	18	20	f
158	0	3	5	47	20	f
156	1	0	0	29	20	f
157	0	2	7	28	20	f
154	0	2	5	35	20	f
160	0	1	5	41	20	f
167	3	2	1	14	21	f
170	0	1	7	14	7	f
203	2	1	5	20	4	f
172	2	0	5	36	18	f
220	2	0	0	30	7	f
240	0	2	5	24	24	f
182	1	1	1	31	23	f
183	2	1	4	36	23	f
152	0	2	5	23	20	f
185	2	1	1	42	23	f
188	4	0	5	9	23	f
257	1	1	1	27	24	f
249	3	0	5	9	24	f
253	1	1	7	16	24	f
189	3	0	5	4	23	f
255	4	1	4	26	24	f
202	0	2	5	14	4	f
227	2	1	5	20	5	f
218	1	2	5	14	5	f
216	3	1	5	20	9	f
234	1	3	5	37	13	f
205	2	0	0	30	4	f
219	1	1	1	24	7	f
215	1	0	1	14	9	f
177	1	2	5	14	23	f
226	1	2	5	14	13	f
207	0	1	7	14	1	f
222	1	3	4	14	24	f
178	2	1	5	20	23	f
228	2	2	1	20	13	f
208	3	1	5	20	1	f
223	2	1	5	20	24	f
180	1	0	1	30	23	f
204	0	3	5	24	4	f
232	1	1	1	31	13	f
233	2	0	5	36	13	f
173	0	2	5	37	18	f
235	1	1	1	42	13	f
250	4	0	5	4	24	f
191	3	2	5	15	23	f
254	2	2	0	48	24	f
252	3	1	4	15	24	f
155	0	3	0	34	20	f
258	3	0	5	38	24	f
251	0	3	5	10	24	f
230	2	1	2	30	13	f
179	1	1	1	24	23	f
263	3	2	0	45	24	f
259	1	1	1	33	24	f
261	3	0	4	39	24	f
151	0	1	1	17	20	f
262	2	1	1	44	24	f
266	1	1	7	11	24	f
265	0	3	0	6	24	f
270	1	2	7	22	24	f
264	1	1	0	5	24	f
268	2	2	1	18	24	f
273	0	3	0	34	24	f
272	1	1	0	35	24	f
267	2	0	1	12	24	f
271	1	0	2	23	24	f
256	1	2	0	21	24	f
269	1	3	0	17	24	f
187	3	1	7	3	23	f
248	2	1	5	3	24	f
186	0	1	5	43	23	f
236	2	0	0	43	13	f
221	3	1	1	25	7	f
206	2	0	0	25	4	f
181	2	0	0	25	23	f
231	3	0	0	25	13	f
211	1	1	7	25	1	f
242	2	1	1	25	24	f
239	3	0	0	25	3	f
243	2	0	5	31	24	f
246	2	1	1	42	24	f
244	3	1	5	36	24	f
245	0	3	4	37	24	f
210	2	0	0	30	1	f
241	1	1	1	30	24	f
238	2	0	0	30	3	f
229	2	0	0	24	13	f
209	1	1	1	24	1	f
237	1	1	1	24	3	f
247	4	1	0	43	24	f
337	2	2	1	43	26	f
352	2	1	1	43	4	f
370	1	0	2	43	3	f
371	3	0	0	43	18	f
375	2	1	1	43	21	f
309	2	0	5	31	5	f
322	2	0	5	31	1	f
315	1	0	7	31	7	f
333	3	1	4	31	26	f
348	2	1	5	31	4	f
303	1	0	7	31	9	f
326	1	0	7	31	21	f
280	0	1	7	24	5	f
290	0	2	5	24	9	f
293	1	2	5	24	21	f
282	3	1	1	25	5	f
292	2	0	0	25	9	f
295	3	1	1	25	21	f
285	2	0	0	42	19	f
287	3	0	5	9	19	f
281	2	1	2	30	5	f
291	3	0	0	30	9	f
294	2	0	0	30	21	f
378	2	0	5	3	13	f
299	2	0	0	42	2	f
286	3	1	7	3	19	f
301	1	1	1	3	2	f
362	1	0	4	3	9	f
314	1	2	0	3	5	f
357	3	0	5	9	25	f
288	2	1	5	4	19	f
319	1	0	7	15	19	f
302	1	0	2	42	18	f
321	3	0	5	3	25	f
360	1	0	2	42	9	f
312	2	1	1	42	5	f
320	2	0	0	42	25	f
325	1	0	2	42	1	f
327	2	0	0	42	7	f
336	4	3	1	42	26	f
351	2	0	0	42	4	f
369	2	1	1	42	3	f
374	2	0	0	42	21	f
329	2	1	5	3	7	f
338	3	1	7	3	26	f
353	1	2	0	3	4	f
358	3	0	5	4	25	f
372	3	0	5	3	18	f
343	3	0	0	16	26	f
373	2	2	0	3	3	f
376	2	0	5	3	21	f
377	0	1	1	3	1	f
298	0	1	5	37	2	f
308	0	2	5	37	3	f
311	1	1	1	37	5	f
356	0	3	4	37	25	f
284	0	2	5	37	19	f
324	0	1	5	37	1	f
317	0	2	5	37	7	f
335	2	3	5	37	26	f
350	0	2	5	37	4	f
305	0	3	4	37	9	f
355	0	1	5	37	21	f
297	3	0	7	36	2	f
307	2	0	5	36	3	f
310	2	1	4	36	5	f
283	2	0	5	36	19	f
323	2	0	5	36	1	f
316	2	0	5	36	7	f
334	4	1	5	36	26	f
349	3	0	7	36	4	f
304	2	0	5	36	9	f
354	3	0	7	36	21	f
296	1	0	7	31	2	f
306	1	1	1	31	3	f
278	2	2	0	40	24	f
363	1	0	7	9	2	f
344	1	2	4	48	26	f
330	2	0	5	9	7	f
347	2	1	1	27	26	f
364	3	0	5	4	2	f
300	1	0	2	43	2	f
361	2	1	1	43	9	f
313	2	1	1	43	5	f
318	2	1	1	43	25	f
328	1	0	2	43	7	f
279	1	1	1	41	24	f
274	2	1	1	29	24	f
275	1	1	0	28	24	f
346	1	1	0	21	26	f
339	4	1	4	9	26	f
403	1	2	7	27	2	f
331	3	0	5	4	7	f
340	2	2	0	4	26	f
345	3	1	5	26	26	f
366	2	1	5	15	2	f
368	1	1	0	48	2	f
389	2	0	5	9	1	f
367	0	0	5	16	2	f
390	3	0	5	4	1	f
289	1	3	4	10	19	f
365	0	1	7	10	2	f
332	0	3	5	10	7	f
341	1	4	4	10	26	f
359	0	4	5	10	25	f
391	0	3	5	10	1	f
397	0	3	5	10	4	f
381	1	3	4	10	3	f
395	3	0	5	9	4	f
379	3	1	4	9	3	f
384	0	3	5	10	9	f
388	1	3	4	10	5	f
414	0	2	5	10	18	f
393	2	1	1	16	1	f
399	0	0	5	16	4	f
401	2	1	5	26	2	f
404	3	1	4	38	2	f
342	3	1	4	15	26	f
392	1	0	7	15	1	f
394	1	2	4	48	1	f
396	4	0	5	4	4	f
380	5	0	5	4	3	f
383	3	0	5	4	9	f
387	1	0	7	4	5	f
411	2	0	5	4	21	f
400	2	3	5	48	4	f
398	1	1	1	15	4	f
407	2	0	4	39	2	f
277	1	3	4	47	24	f
402	0	1	0	21	2	f
405	0	2	5	33	2	f
408	1	0	0	44	2	f
276	1	3	4	46	24	f
409	2	1	0	45	2	f
406	1	0	5	32	2	f
382	2	0	5	9	9	f
386	3	0	5	9	5	f
410	2	1	5	9	21	f
412	3	0	5	9	18	f
416	3	0	5	9	13	f
413	2	1	5	4	18	f
417	1	0	7	4	13	f
418	0	5	5	10	13	f
419	0	2	5	10	21	f
426	2	0	7	26	1	f
436	1	0	5	26	7	f
498	3	0	5	38	21	f
441	1	1	0	26	19	f
447	2	0	7	26	18	f
457	2	1	5	26	23	f
489	2	0	7	26	4	f
509	2	0	4	38	25	f
461	1	2	7	33	23	f
513	0	2	5	33	13	f
421	1	0	1	16	3	f
424	1	0	1	16	5	f
430	1	0	1	16	13	f
434	1	1	7	16	7	f
439	2	0	0	16	19	f
445	1	0	1	16	18	f
453	2	1	1	16	9	f
455	1	0	1	16	23	f
495	3	0	5	26	21	f
525	2	0	4	38	7	f
471	2	0	7	26	9	f
474	2	0	7	26	3	f
475	2	1	5	26	13	f
506	2	0	7	26	5	f
422	1	2	4	48	3	f
425	2	1	0	48	5	f
431	1	3	5	48	13	f
435	1	2	4	48	7	f
440	2	1	0	48	19	f
446	1	2	4	48	18	f
454	1	2	4	48	9	f
456	2	2	0	48	23	f
470	1	1	0	48	21	f
420	2	1	5	15	3	f
423	2	0	5	15	5	f
429	2	1	5	15	13	f
432	1	0	7	15	21	f
433	2	1	5	15	7	f
444	1	1	1	15	18	f
452	1	0	7	15	9	f
507	0	3	0	21	25	f
478	1	2	0	21	3	f
427	0	1	0	21	1	f
503	3	1	4	38	5	f
437	0	1	0	21	7	f
442	1	0	5	21	19	f
448	0	1	0	21	18	f
458	1	1	0	21	23	f
490	0	1	0	21	4	f
496	2	2	1	21	21	f
472	0	1	0	21	9	f
476	0	2	1	21	13	f
501	1	2	0	21	5	f
508	1	3	5	27	25	f
481	1	1	1	33	19	f
463	1	0	4	39	23	f
469	2	1	1	12	23	f
467	1	2	0	5	23	f
512	2	0	4	38	13	f
480	0	0	0	38	19	f
451	2	1	4	38	18	f
460	2	0	4	38	23	f
486	2	1	4	38	1	f
492	3	0	5	38	4	f
518	3	0	5	38	9	f
479	1	0	2	27	3	f
428	0	1	5	27	1	f
438	0	1	5	27	7	f
443	2	0	0	27	19	f
449	1	1	1	27	18	f
459	1	1	1	27	23	f
491	1	1	1	27	4	f
497	1	2	7	27	21	f
473	0	2	5	27	9	f
477	2	1	1	27	13	f
502	1	1	1	27	5	f
482	2	1	7	32	19	f
488	1	0	5	32	1	f
532	1	1	1	32	18	f
514	3	2	5	32	13	f
494	3	0	4	32	4	f
511	4	2	4	32	25	f
527	1	0	5	32	7	f
500	1	0	5	32	21	f
505	2	1	7	32	5	f
520	2	0	5	32	9	f
521	1	1	0	5	2	f
487	1	1	1	33	1	f
493	0	2	5	33	4	f
499	1	2	7	33	21	f
510	1	3	5	33	25	f
526	0	1	5	33	7	f
504	1	3	5	33	5	f
519	0	2	5	33	9	f
531	0	1	5	33	3	f
462	3	1	5	32	23	f
483	1	0	4	39	19	f
515	2	0	4	39	13	f
465	0	2	5	45	23	f
485	2	0	0	45	19	f
517	2	0	0	45	13	f
530	1	2	4	45	7	f
537	2	1	0	45	5	f
533	1	0	4	39	18	f
528	2	0	4	39	7	f
534	2	0	4	39	9	f
535	2	1	5	39	5	f
546	3	0	4	39	3	f
464	1	0	0	44	23	f
466	1	1	1	6	23	f
522	0	1	2	6	2	f
554	1	1	1	6	18	f
523	2	1	1	12	2	f
468	0	2	0	11	23	f
524	1	0	1	11	2	f
557	1	2	1	11	18	f
555	1	2	0	5	18	f
484	1	1	5	44	19	f
516	1	2	1	44	13	f
529	1	1	5	44	7	f
536	1	0	0	44	5	f
544	1	2	1	44	9	f
547	1	1	5	44	3	f
550	2	1	1	44	1	f
549	2	0	4	39	1	f
545	1	2	4	45	9	f
556	3	0	0	12	18	f
548	2	1	0	45	3	f
552	1	2	4	45	18	f
551	2	1	0	45	1	f
553	1	0	0	45	21	f
643	0	0	7	17	3	f
693	0	2	7	28	21	f
647	1	2	0	17	21	f
649	1	2	0	17	7	f
604	1	1	5	17	23	f
615	1	2	0	17	5	f
572	1	1	1	23	2	f
561	1	0	0	12	9	f
565	2	0	1	12	7	f
569	1	0	0	12	1	f
577	2	0	1	12	3	f
581	2	1	1	12	5	f
586	2	1	1	12	21	f
590	2	0	1	12	13	f
560	0	2	0	11	9	f
564	1	2	1	11	7	f
568	0	1	1	11	1	f
576	0	2	0	11	3	f
580	1	4	1	11	5	f
585	0	2	0	11	21	f
589	1	2	1	11	13	f
558	1	0	5	5	9	f
562	2	1	4	5	7	f
566	1	1	0	5	1	f
574	1	1	0	5	3	f
578	2	0	5	5	5	f
583	1	3	0	5	21	f
587	1	4	1	5	13	f
559	0	2	0	6	9	f
563	0	1	2	6	7	f
567	1	2	1	6	1	f
575	0	2	0	6	3	f
579	0	1	2	6	5	f
584	0	1	2	6	21	f
588	0	2	0	6	13	f
630	1	3	5	23	9	f
593	0	4	4	23	13	f
638	0	2	5	23	1	f
642	0	2	5	23	19	f
646	2	0	0	23	3	f
652	0	1	5	23	7	f
606	0	2	5	23	23	f
617	2	2	1	22	5	f
654	2	2	1	22	21	f
600	2	2	0	47	13	f
683	2	0	0	35	3	f
633	1	2	5	28	2	f
631	1	1	0	35	2	f
570	2	1	0	18	2	f
628	0	1	5	18	9	f
591	2	0	1	18	13	f
636	2	1	0	18	1	f
640	1	0	0	18	19	f
644	2	3	4	18	3	f
648	1	0	0	18	21	f
650	1	1	0	18	7	f
603	0	1	5	18	23	f
616	1	1	0	18	5	f
571	1	1	5	17	2	f
627	1	1	5	17	9	f
592	1	2	0	17	13	f
635	1	1	5	17	1	f
639	1	2	0	17	19	f
618	3	2	2	23	5	f
653	1	2	7	23	21	f
573	0	1	5	22	2	f
629	1	2	7	22	9	f
594	2	0	0	22	13	f
637	1	2	7	22	1	f
641	1	3	5	22	19	f
645	1	2	7	22	3	f
651	0	2	5	22	7	f
605	1	2	7	22	23	f
684	0	4	0	34	3	f
632	0	1	0	34	2	f
595	0	2	1	34	13	f
691	0	2	1	34	21	f
688	0	3	0	34	1	f
656	0	3	0	34	18	f
607	0	1	0	34	23	f
620	1	2	0	34	5	f
664	0	3	0	34	9	f
668	0	2	1	34	7	f
676	1	3	1	34	19	f
602	0	1	5	41	13	f
601	3	3	0	40	13	f
611	1	1	1	47	23	f
613	1	1	1	41	23	f
614	0	1	7	40	23	f
599	2	0	0	46	13	f
612	1	2	5	46	23	f
624	2	0	0	46	5	f
634	2	1	1	29	2	f
598	2	0	1	29	13	f
685	2	1	1	29	3	f
610	1	1	5	29	23	f
622	1	0	0	29	5	f
665	2	0	1	29	9	f
669	1	0	0	29	7	f
677	2	0	1	29	19	f
657	2	0	1	29	18	f
596	3	1	0	35	13	f
687	1	1	0	35	1	f
655	3	2	0	35	18	f
608	2	1	0	35	23	f
619	3	1	0	35	5	f
663	1	1	0	35	9	f
667	2	0	0	35	7	f
675	1	1	0	35	19	f
692	1	0	0	35	21	f
597	1	2	5	28	13	f
686	0	3	5	28	3	f
609	0	1	5	28	23	f
621	0	3	5	28	5	f
666	0	1	5	28	9	f
670	1	2	5	28	7	f
678	1	2	5	28	19	f
689	1	0	0	29	1	f
672	2	0	0	46	7	f
680	1	2	5	46	19	f
660	2	1	2	46	18	f
623	2	2	0	47	5	f
671	1	2	5	47	7	f
679	1	2	5	47	19	f
659	1	1	1	47	18	f
625	1	1	1	41	5	f
673	1	1	1	41	7	f
661	1	1	1	41	18	f
681	2	0	0	41	19	f
626	1	2	5	40	5	f
674	1	1	1	40	7	f
662	2	3	5	40	18	f
682	1	1	1	40	19	f
658	2	2	1	28	18	f
690	1	1	0	28	1	f
694	2	1	1	29	21	f
717	1	1	7	51	24	f
727	1	0	1	51	2	f
735	3	0	0	51	25	f
743	2	1	1	51	20	f
753	2	0	0	51	4	f
761	2	0	0	51	18	f
767	2	2	5	51	13	f
776	1	0	1	51	23	f
755	2	0	7	53	4	f
769	2	0	7	53	13	f
778	2	1	5	53	23	f
720	4	0	4	54	24	f
730	1	0	5	54	2	f
738	2	1	5	54	25	f
746	2	0	4	54	20	f
756	3	0	5	54	4	f
695	0	1	7	47	2	f
699	0	2	5	47	3	f
703	0	1	7	47	1	f
707	0	2	5	47	9	f
711	2	1	2	47	21	f
696	1	0	1	46	2	f
700	1	2	5	46	3	f
704	2	1	2	46	1	f
708	2	1	2	46	9	f
712	1	0	1	46	21	f
770	3	0	5	54	13	f
718	3	0	0	52	24	f
773	2	1	5	49	7	f
765	1	2	1	49	13	f
763	2	1	5	49	1	f
759	2	1	5	49	18	f
751	1	0	5	49	4	f
749	2	1	5	49	9	f
741	1	2	1	49	20	f
733	3	0	4	49	25	f
698	1	2	5	40	2	f
702	0	0	1	40	3	f
706	1	2	5	40	1	f
710	1	1	1	40	9	f
714	2	1	2	40	21	f
697	1	2	7	41	2	f
701	1	3	5	41	3	f
705	1	2	7	41	1	f
709	0	3	4	41	9	f
713	1	1	1	41	21	f
725	0	0	0	49	2	f
723	1	0	5	49	3	f
728	1	0	1	52	2	f
736	4	1	1	52	25	f
779	2	0	4	54	23	f
744	1	0	1	52	20	f
754	2	0	0	52	4	f
762	2	1	1	52	18	f
768	2	0	0	52	13	f
777	1	1	7	52	23	f
715	1	1	0	49	24	f
775	1	2	1	50	23	f
774	0	1	2	50	7	f
766	2	3	2	50	13	f
764	1	2	1	50	1	f
760	2	2	1	50	18	f
752	1	1	1	50	4	f
750	1	2	1	50	9	f
742	0	1	2	50	20	f
734	0	3	0	50	25	f
726	1	0	5	50	2	f
724	1	1	1	50	3	f
716	1	2	1	50	24	f
719	2	0	7	53	24	f
729	2	1	5	53	2	f
737	3	2	4	53	25	f
745	1	0	5	53	20	f
721	1	1	1	55	24	f
731	1	1	1	55	2	f
739	3	4	1	55	25	f
747	1	1	1	55	20	f
757	1	1	1	55	4	f
771	1	2	2	55	13	f
780	0	1	1	55	23	f
722	1	1	7	56	24	f
732	0	1	1	56	2	f
740	3	4	0	56	25	f
748	0	1	1	56	20	f
758	1	1	7	56	4	f
772	1	2	1	56	13	f
782	3	1	1	51	9	f
784	1	0	1	51	1	f
786	2	1	1	51	7	f
783	2	0	0	52	9	f
785	2	0	0	52	1	f
787	2	0	0	52	7	f
788	1	1	7	52	19	f
830	2	3	4	57	20	f
834	2	2	1	57	18	f
862	2	1	1	59	21	f
789	3	1	5	53	19	f
793	2	1	5	53	3	f
797	2	1	5	53	9	f
799	1	0	5	53	7	f
803	1	1	0	53	18	f
805	2	0	7	53	21	f
807	2	1	5	53	1	f
790	2	0	4	54	19	f
794	3	0	5	54	3	f
798	2	1	5	54	9	f
800	2	0	4	54	7	f
804	2	1	5	54	18	f
806	3	1	5	54	21	f
808	2	0	4	54	1	f
838	0	1	5	57	19	f
842	1	2	5	57	25	f
846	0	0	1	57	4	f
850	1	2	5	57	9	f
852	0	1	5	57	7	f
856	1	1	0	57	1	f
903	1	2	2	61	13	f
823	1	2	1	59	2	f
860	1	2	5	57	21	f
818	1	2	5	57	24	f
820	1	1	0	57	2	f
791	0	1	1	55	19	f
795	1	1	1	55	3	f
801	1	1	1	55	7	f
809	1	1	1	55	18	f
811	3	2	5	55	9	f
813	1	1	1	55	1	f
815	1	2	2	55	5	f
817	1	0	7	55	21	f
781	1	1	7	56	23	f
792	1	1	7	56	19	f
796	1	2	1	56	3	f
802	1	0	1	56	7	f
810	2	2	5	56	18	f
812	1	2	1	56	9	f
814	2	2	5	56	1	f
816	1	3	1	56	5	f
826	1	1	0	57	3	f
864	1	2	5	57	5	f
872	2	0	1	57	13	f
873	2	2	1	58	13	f
831	3	2	2	58	20	f
835	1	1	1	58	18	f
825	1	1	5	59	24	f
906	2	1	7	62	13	f
908	0	1	\N	64	20	t
910	3	0	\N	64	24	t
912	0	1	\N	64	7	t
832	1	3	5	60	20	f
836	0	1	5	60	18	f
840	1	1	0	60	19	f
844	2	3	4	60	25	f
848	0	0	1	60	4	f
854	0	1	5	60	7	f
858	0	1	5	60	1	f
822	1	1	0	60	2	f
824	1	2	5	60	24	f
863	0	1	5	60	21	f
828	0	1	5	60	3	f
866	2	1	0	60	5	f
869	0	1	5	60	23	f
874	2	2	1	60	13	f
877	1	2	5	60	9	f
839	2	0	0	58	19	f
843	3	2	2	58	25	f
847	1	1	1	58	4	f
851	1	1	1	58	9	f
853	1	0	2	58	7	f
857	1	2	7	58	1	f
861	2	2	1	58	21	f
819	2	3	5	58	24	f
821	1	1	1	58	2	f
827	2	3	5	58	3	f
865	3	2	2	58	5	f
868	1	2	7	58	23	f
833	1	2	1	59	20	f
829	0	3	0	59	3	f
837	1	2	1	59	18	f
867	1	3	0	59	5	f
870	2	1	1	59	23	f
875	2	3	1	59	13	f
878	1	3	0	59	9	f
901	2	1	5	61	21	f
902	2	2	0	61	5	f
905	1	1	1	62	21	f
841	2	1	1	59	19	f
845	2	1	1	59	25	f
849	0	1	0	59	4	f
855	0	1	0	59	7	f
859	0	2	1	59	1	f
916	1	2	\N	64	2	t
876	3	2	5	61	24	f
879	2	2	0	61	3	f
880	1	2	2	61	2	f
883	2	3	1	61	20	f
885	2	1	5	61	7	f
887	1	0	7	61	4	f
889	2	1	5	61	19	f
891	1	2	2	61	9	f
892	1	2	2	61	23	f
894	1	2	2	61	1	f
896	1	2	2	61	25	f
898	2	2	0	61	18	f
919	2	1	\N	64	23	t
904	0	1	2	62	9	f
900	1	2	1	62	3	f
899	1	2	1	62	18	f
897	1	2	1	62	25	f
895	2	1	7	62	1	f
893	2	1	7	62	23	f
890	1	1	1	62	19	f
888	0	1	2	62	4	f
886	1	0	5	62	7	f
884	2	1	7	62	20	f
882	1	2	1	62	24	f
881	0	1	2	62	2	f
920	1	0	5	63	1	f
914	2	1	\N	64	18	t
921	1	1	\N	64	1	t
918	2	1	5	63	23	f
917	2	1	5	63	9	f
915	2	0	7	63	2	f
913	2	1	5	63	18	f
911	2	1	5	63	7	f
909	3	1	5	63	24	f
907	2	0	7	63	20	f
922	2	0	\N	64	9	t
\.


--
-- Name: prediction_prediction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('prediction_prediction_id_seq', 922, true);


--
-- Data for Name: prediction_userpoints; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prediction_userpoints (id, points, user_id, n_exact_scores, n_results, n_extra_questions, n_yellow_cards) FROM stdin;
3	0	10	0	0	0	0
8	0	6	0	0	0	0
16	146	22	4	22	0	0
6	138	5	5	17	0	0
10	150	13	3	21	0	0
13	171	21	11	15	0	0
9	152	3	3	24	0	0
19	73	25	0	14	0	0
20	45	26	1	8	0	0
12	139	19	5	19	0	0
2	142	4	6	18	0	0
15	194	20	7	27	0	0
1	203	1	9	25	0	0
17	196	23	9	24	0	0
7	200	9	4	32	0	0
5	193	2	10	20	0	0
11	149	18	4	20	0	0
4	195	7	3	32	0	0
18	170	24	6	24	0	0
\.


--
-- Name: prediction_userpoints_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('prediction_userpoints_id_seq', 20, true);


--
-- Data for Name: round_group; Type: TABLE DATA; Schema: public; Owner: -
--

COPY round_group (id, name) FROM stdin;
1	Grupa A
2	Grupa B
3	Grupa C
4	Grupa D
5	Grupa E
6	Grupa F
7	Grupa G
8	Grupa H
\.


--
-- Name: round_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('round_group_id_seq', 8, true);


--
-- Data for Name: round_groupteam; Type: TABLE DATA; Schema: public; Owner: -
--

COPY round_groupteam (id, points, goals_scored, goals_conceded, matches, group_id, team_id, "position") FROM stdin;
9	7	3	1	3	3	8	1
12	5	2	1	3	3	17	2
10	3	2	2	3	3	10	3
11	1	2	5	3	3	27	4
25	9	9	2	3	7	6	1
28	6	8	3	3	7	12	2
27	3	5	8	3	7	21	3
26	0	2	11	3	7	30	4
15	9	7	1	3	4	16	1
13	4	3	5	3	4	5	2
16	3	3	4	3	4	26	3
14	1	2	5	3	4	18	4
8	5	6	5	3	2	9	1
7	5	5	4	3	2	4	2
6	4	2	2	3	2	24	3
5	1	2	4	3	2	29	4
19	7	5	1	3	5	3	1
20	5	5	4	3	5	11	2
18	3	2	4	3	5	25	3
17	1	2	5	3	5	19	4
3	9	5	0	3	1	15	1
1	6	8	4	3	1	1	2
4	3	2	7	3	1	32	3
2	0	2	6	3	1	22	4
23	6	5	2	3	6	20	1
22	6	3	4	3	6	14	2
24	3	3	3	3	6	31	3
21	3	2	4	3	6	2	4
30	6	5	2	3	8	13	1
31	4	4	4	3	8	28	2
32	4	4	4	3	8	23	3
29	3	2	5	3	8	7	4
\.


--
-- Name: round_groupteam_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('round_groupteam_id_seq', 32, true);


--
-- Data for Name: round_round; Type: TABLE DATA; Schema: public; Owner: -
--

COPY round_round (id, name, "roundType", shortname) FROM stdin;
2	1/8 finału	2	1/8
1	Faza grupowa	1	Grupy
3	Ćwierćfinał	3	1/4
4	Półfinał	4	1/2
6	Finał	6	Finał
5	Mecz o 3. miejsce	5	3. miejsce
\.


--
-- Name: round_round_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('round_round_id_seq', 6, true);


--
-- Data for Name: staticpages_rules; Type: TABLE DATA; Schema: public; Owner: -
--

COPY staticpages_rules (id, content) FROM stdin;
1	<h3>Ważna informacja</h3>\r\n<p><span id="result_box" class="" lang="pl"><span class="">Ze względu na ograniczony czas, w jakim tworzony był system typowania, nie udało się przeprowadzić poważniejszych test&oacute;w. Jeśli okaże się, że coś nie działa, proszę o informację na maila (iwan127@gmail.com). Jeśli okaże się, że typy się nie zapisały, można je przesłąć do mnie r&oacute;wnież mailowo - wprowadzę je ręcznie do systemu.</span></span></p>\r\n<h3>Typowanie wynik&oacute;w mecz&oacute;w</h3>\r\n<p><span id="result_box" class="" lang="pl"><span class="">Typowanie polega na podaniu dokładnego wyniku meczu.</span> Typowanie zostaje zamknięte 5 minut przed rozpoczęciem meczu. Do tego czasu można dowolnie zmieniać swoje typy.</span> Mecze kolejnych rund pojawią się po zakończeniu obecnie trwającej fazy turnieju.</p>\r\n<h3>Punktacja</h3>\r\n<p><span id="result_box" class="" lang="pl">W fazie grupowej liczba zdobytych punkt&oacute;w zależy od końcowego wyniku meczu. W fazie play-off podstawą obliczenia liczby zdobytych punkt&oacute;w jest wynik po dogrywce. Bramki strzelone w serii rzut&oacute;w karnych nie są brane pod uwagę.</span> Punkty można zdobyć na kilka sposob&oacute;w.</p>\r\n<ol>\r\n<li>Dokładny wynik. meczu Punkty za dokładny wynik meczu zdobywa się tylko, gdy wynik obstawianego meczu będzie dokładnie taki sam, jak w typie. Przykład: obstawiasz wynik meczu Polska - Senegal na 1-0. Punkty za dokładny wynik meczu zdobywasz tylko, gdy padnie taki wynik. W przypadku wynik&oacute;w 2-0, 2-1, 0-1, 0-0, itd., nie dostajesz punkt&oacute;w.</li>\r\n<li>Poprawny rezultat. Punkty za poprawny rezultat można zdobyć, jeśli poprawnie wytypuje się zwycięzcę meczu lub w przypadku, gdy obstawiając remis, ten remis padnie. Przykład 1: obstawiasz wynik meczu Polska - Senegal na 1-0. Punkty za poprawny rezultat zdobywasz, gdy wygra Polska, tzn. padnie wynik: 1-0, 2-0, 2-1, itd. Przykład 2: obstawiasz wynik meczu Polska - Senegal na 1-1. Punkty za poprawny rezultat zdobywasz, gdy padnie jakikolwiek remis, tzn. 1-1, 0-0, 2-2, itd. Punkty te nie kumulują się z punktami za dokładny wynik.</li>\r\n<li>R&oacute;żnica bramek. Punkty za r&oacute;żnicę bramek można zdobyć, jeśli poprawnie wytypuje się zwycięzcę meczu oraz r&oacute;żnicę liczby bramek między zwycięzcą a przegranym. Remisy nie są brane pod uwagę. Przykład 1: obstawiasz wynik meczu Polska - Senegal na 1-0. Punkty zdobywasz, gdy Polska wygra r&oacute;żnicą dokładnie 1 gola, tzn. padnie wynik: 1-0, 2-1, 3-2, itd. Jeśli padnie wynik 0-1, 1-2, itd., nie dostajesz punkt&oacute;w. Przykład 2: obstawiasz wynik meczu Polska - Senegal na 1-1, w&oacute;wczas nie zdobywasz punkt&oacute;w. Punkty te nie kumulują się z punktami za dokładny wynik, natomiast kumulują się z punktami za poprawny rezultat.</li>\r\n<li>Bonus bramkowy. Punkty za bonus bramkowy można zdobyć, jeśli poprawnie wytypuje się dokładną liczbę strzelonych goli przez jedną z drużyn. W dobrego przypadku wytypowania liczby strzelonych bramek przez każdą z drużyn, punkty przyznawane są podw&oacute;jnie (tzn. za każdą drużynę). Przykład 1: obstawiasz wynik meczu Polska - Senegal na 1-0. Pojedyncze punkty zdobywasz, gdy Polska strzeli dokładnie 1 gola albo Senegal nie strzeli ani jednej bramki, tzn. padnie wynik: 2-0, 1-1, 0-0, 1-2, itd. Podw&oacute;jne punkty zdobywasz, gdy Polska strzeli dokładnie 1 gola oraz Senegal nie strzeli żadnej bramki (czyli wytypujesz dokładny wynik)., tzn. padnie wynik 1-0. Punkty te nie kumulują się z punktami za dokładny wynik, ale kumulują się z tymi za poprawny rezultat.</li>\r\n</ol>\r\n<p>Punkty przyznawane za poprawne typy, przedstawia poniższa tabelka:</p>\r\n<table>\r\n<thead>\r\n<tr>\r\n<th>&nbsp;</th>\r\n<th>punkty</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr>\r\n<td>dokładny wynik meczu</td>\r\n<td style="text-align: center;">7</td>\r\n</tr>\r\n<tr>\r\n<td>poprawny rezultat</td>\r\n<td style="text-align: center;">4</td>\r\n</tr>\r\n<tr>\r\n<td>r&oacute;żnica bramek</td>\r\n<td style="text-align: center;">1</td>\r\n</tr>\r\n<tr>\r\n<td>bonus bramkowy</td>\r\n<td style="text-align: center;">1</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h3><br />Pytania dodatkowe</h3>\r\n<p><span id="result_box" class="" lang="pl">Możesz zdobyć dodatkowe punkty dzięki odpowiedziom na pytania dodatkowe. Na te pytania należy odpowiedzieć przed określoną datą i godziną. Przy każdym z pytań widoczna jest liczba punkt&oacute;w, kt&oacute;re można zdobyć udzielając poprawnej odpowiedzi. W tym momencie udostępnione są 4 pytania odnoszące się do całego turnieju: </span></p>\r\n<ul>\r\n<li>Kt&oacute;ra drużyna wygra Mistrzostwa Świata 2018? (20 pkt, typowanie do 19.06.2018, godz. 19:55)</li>\r\n<li>Kt&oacute;re drużyny zagrają w finale?? (14 pkt, typowanie do 19.06.2016, godz. 19:55)</li>\r\n<li>Jak daleko zajdzie reprezentacja Polski? (7 pkt, typowanie do 19.06.2016, godz. 13:55)</li>\r\n<li>Kt&oacute;re drużyny wyjdą z 2 pierwszych miejsc z każdej grup? (5 pkt za każdą z grup, typowanie do 19.06.2016, godz. 19:55)</li>\r\n</ul>\r\n<p>W czasie trwania MŚ mogą się pojawiać dodatkowe pytania dotyczące zar&oacute;wno całego turnieju, jak i pojedynczych mecz&oacute;w.</p>\r\n<h3>Ż&oacute;łte kartki</h3>\r\n<p>Typer ma polegać na zabawie, a nie na zwycięstwie za wszelką cenę. W związku z tym wprowadzone zostają ż&oacute;łte kartki dla użytkownik&oacute;w. Ż&oacute;łta kartka zostanie przyznana, gdy zostanie stwierdzone naruszenie zasad dobrej zabawy - np. gdy ktoś typuje większość mecz&oacute;w podobnymi wynikami (np. 0-0 lub 1-0). Otrzymanie z&oacute;łtej kartki skutkuje każdorazowo odjęciem 5 punkt&oacute;w. Liczba z&oacute;łtych kartek, kt&oacute;re można otrzymać jest nieograniczona. Dodatkowo na rankingu będą widoczne ż&oacute;łte kartki, kt&oacute;re użytkownik otrzymał.</p>\r\n<h3>Ranking</h3>\r\n<p>Na <a href="[fp-link slug='ranking']">stronie rankingu</a> można sprawdzić swoją pozycję w klasyfikacji uczestnik&oacute;w Dzwonkowego Typera. W przypadku takiej samej liczby punkt&oacute;w o miejscu decyduje kolejno:</p>\r\n<ol>\r\n<li>liczba poprawnie wytypowanych dokładnych wynik&oacute;w</li>\r\n<li>liczba poprawnie wytypowanych rezultat&oacute;w</li>\r\n<li>liczba poprawnych odpowiedzi na pytania dodatkowe</li>\r\n<li>liczba ż&oacute;łtych kartek (im mniej, tym lepiej)</li>\r\n</ol>\r\n<h3>Nagroda</h3>\r\n<p>Nie wiadomo na razie, czy dla zwycięzcy jest przewidziana nagroda ;)</p>\r\n<h3>Błędy systemu</h3>\r\n<p>Zakazane jest wykorzystywanie błęd&oacute;w systemu przy dodawaniu typ&oacute;w, punkt&oacute;w, czy w jakimkolwiek innym celu mającym przynieść korzyści lub straty kt&oacute;remuś z użytkownik&oacute;w systemu.</p>\r\n<h3>Zmiany w zasadach</h3>\r\n<p>Zastrzegam sobie prawo do zmiany zasad w trakcie trwania turnieju.</p>\r\n<p>&nbsp;</p>\r\n<p>Miłej zabawy!</p>
\.


--
-- Name: staticpages_rules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('staticpages_rules_id_seq', 1, true);


--
-- Data for Name: system_systemuser; Type: TABLE DATA; Schema: public; Owner: -
--

COPY system_systemuser (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, avatar, nickname) FROM stdin;
21	pbkdf2_sha256$100000$ZqZfvXdyjWXw$cZDPI2I4k3mb9dJYx9C5kWrEe/5MFKSe2LnID61ey4k=	2018-07-07 20:56:48.009011+00	f	monika			monika.siemian@gmail.com	f	t	2018-06-15 09:36:03.178627+00		monika
5	pbkdf2_sha256$100000$vSfUtjNtINro$80SPEQvs7HipNcoBRyF+aZTsjoslsVOw4wbsOT/fvTo=	2018-07-06 13:25:46.853192+00	f	mery			nowak.maria88@gmail.com	f	t	2018-06-14 11:32:55.87849+00		mery
6	pbkdf2_sha256$100000$6u2VkVGh7jSW$1VmjVk++GAr/bjMYi96zGqTooqqjRQdqpagOUEqJF9o=	2018-06-14 11:34:16.19406+00	f	majkel			mrlikson@gmail.com	f	t	2018-06-14 11:34:16.051788+00		majkel
8	pbkdf2_sha256$100000$0GDgFGdaIAG0$66gPfvjX5PHOHD+VBbXkEyK9jh5yzi1oByVbUBMb6E8=	2018-06-14 12:51:47.425614+00	f	a			a@gmail.com	f	t	2018-06-14 12:51:46.918175+00		a
7	pbkdf2_sha256$100000$K8PkADr7Ehwe$55SrfC7sG1UMvp5ZjAgXcvEdq+el3PDyspq1tZYDop8=	2018-07-14 11:51:32.811958+00	f	claudio			agnusdune@gmail.com	f	t	2018-06-14 12:03:16.00333+00		claudio
18	pbkdf2_sha256$100000$U0poqb1Ozmcq$4S5z4QdgjtrcetaxOCb092YMhy9kMjhvOPwqUpUuMo0=	2018-07-14 13:27:06.426143+00	f	natalia.s			natalia.stelmaszuk@aitsolutions.pl	f	t	2018-06-15 07:13:07.544341+00		natalia.s
10	pbkdf2_sha256$100000$jJxY5QmGlKX8$hPy660VEgHqdWYKj+4ObVUS9jrHaoQbWY5hLW7kBgu0=	2018-06-14 14:46:28.299897+00	f	Dziemian			patryk.dziemianowski@gmail.com	f	t	2018-06-14 14:46:08.52278+00		Dziemian
11	pbkdf2_sha256$100000$ROSeRFoal7XU$blaOqir5GlWKOZWaPgzlm/dGCHfSl95m6AdGDKlncoI=	\N	f	Ozzy			oskarbalcerowicz@interia.pl	f	t	2018-06-14 15:54:43.091991+00		Ozzy
12	pbkdf2_sha256$100000$OqdDZkxlpcal$lLEoWx0ubcnLW5syc4naEsGTTVBn+MmH8uMtVLnnAj0=	\N	f	Ozzy22			iza10378@interia.pl	f	t	2018-06-14 15:56:08.670472+00		Ozzy22
4	pbkdf2_sha256$100000$JkUONGU3iFjf$AxS8hcl0spnbsvZsIJNoh//5D087zjzekYG1GTg06Kc=	2018-07-09 07:01:44.496302+00	f	zielin			zielapio@op.pl	f	t	2018-06-14 11:07:34.150495+00		zielin
13	pbkdf2_sha256$100000$V3r9KSXkXyfp$SQUzughOeWHH45Iot0Ox+XLqABg/Fh9BbJDhLNMPyAc=	2018-07-06 20:26:34.068789+00	f	Asia			aska33@wp.pl	f	t	2018-06-14 20:10:55.421294+00		Asia
20	pbkdf2_sha256$100000$uPy8sPHvJzCt$moi9qX83Av+2kz6J8qhJpIGVTP/SnXqxRsZM7I09uc8=	2018-07-04 09:29:46.089812+00	f	wojtas			wojciech.beling@aitsolutions.pl	f	t	2018-06-15 07:59:38.599029+00	MjAtYXZhdGFyLnBuZw	wojtas
14	pbkdf2_sha256$100000$A8LHR6ZQzgXC$9GzjTzM0m+k6WcBQ4DZDLlpIuEYJ3QwSpqfzobqIyPo=	\N	f	iwan2			iwan127+1@gmail.com	f	t	2018-06-14 21:04:05.411826+00		iwan2
25	pbkdf2_sha256$100000$Kfjh4D7AGSh0$JCtHo40NS1lo/l/2BojJnejS3ZSqUvVhehYDY1RIRK0=	2018-07-10 19:58:45.960186+00	f	matzal			mateusz.zalewski@aitsolutions.pl	f	t	2018-06-18 07:03:38.040799+00		matzal
15	pbkdf2_sha256$100000$cFmFgS3cO5Jg$n1V5BFS7+tQ0rQvqQDdJnapikPXuYLMbjbnQ9JFa7e0=	\N	f	iwan3			iwan127+2@gmail.com	f	t	2018-06-14 21:09:35.928481+00		iwan3
16	pbkdf2_sha256$100000$u7STT6UQUzkP$nCJ8c91hIMzg4i5Mj171SaxyFEEv/IWgTW1Mx0KumGo=	\N	f	iwan4			iwan127+4@gmail.com	f	t	2018-06-14 21:27:50.990312+00		iwan4
17	pbkdf2_sha256$100000$fsgUnEtyHsJn$IrNx/SilQ7t7l7XmzbShrpEJOC0diQprFdxfxmLGl9Y=	2018-06-14 21:32:00.399257+00	f	test5			iwan127+5@gmail.com	f	t	2018-06-14 21:32:00.167726+00		test5
22	pbkdf2_sha256$100000$RUHC8585FYeP$x9qhsBi9w2lk4JH5uo+9aCD28ZduFSwppXns3xOxons=	2018-06-15 11:32:50.36906+00	f	JuveFan			krystianladniak87@gmail.com	f	t	2018-06-15 11:32:50.098336+00		JuveFan
3	pbkdf2_sha256$100000$7d10YHeDUHIM$h2WeOEmMLbkaLPcZBtk8uaHO3qLbr66ltlKhs2V7REE=	2018-07-07 10:56:52.434348+00	f	Mati17			mateusz_inc@gazeta.pl	f	t	2018-06-14 10:50:17.815247+00		Mati17
26	pbkdf2_sha256$100000$hgwgCdmyqx1y$y7bGxXxqi+QSNtDQqFDshMbKBf/4IQTKA04G+TAPQQw=	2018-06-18 07:06:48.547416+00	f	pgrabowski			p.grabowski@aitsolutions.pl	f	t	2018-06-18 07:06:48.318086+00		pgrabowski
23	pbkdf2_sha256$100000$lAVUSuIHkDjp$om1zF30OwiQkKe8ATGWzsXxooBNo2ngxtCJ79qI0w9I=	2018-07-14 17:57:02.16462+00	f	p.gzubicki@gmail.com			p.gzubicki@gmail.com	f	t	2018-06-15 13:43:07.081991+00	MjMtYXZhdGFyLnBuZw	zupa
24	pbkdf2_sha256$100000$Fm4JEOJRozWV$5kniSCVNq6BoIsOrR30nyK/mQ1/yCEgn2vhmWjrTweA=	2018-07-14 18:53:48.044655+00	f	macko1983			macko1983@poczta.onet.pl	f	t	2018-06-16 12:55:49.665578+00		macko1983
19	pbkdf2_sha256$100000$2tr97iUkuM3J$7Oh0R+DGdj/nHb7iLGPYLX6F6OIIUVzvMPn///du0C0=	2018-07-01 17:01:01.775289+00	f	Krystek			finger.pointing.objection@gmail.com	f	t	2018-06-15 07:22:04.871317+00	MTktYXZhdGFyLmpwZw	Krystek
1	pbkdf2_sha256$100000$5xU4AIQ4cMqn$b/DpBE5mPm1k0UUVT+ywbX+fHOYgrWh7Tt6PE/EzzSs=	2018-07-14 19:47:13.339998+00	t	iwan			iwan127@gmail.com	t	t	2018-06-13 19:41:16.260055+00	MS1hdmF0YXIucG5n	iwan
2	pbkdf2_sha256$100000$OQemiztkwAsH$oYoZ5vcB1W4k0Z2twKkzCO+yig7EfSs1y0nWfXxs6b8=	2018-07-14 20:07:43.277489+00	f	ubu			ubukrool@mat.uni.torun.pl	f	t	2018-06-14 10:23:21.193226+00		ubu
9	pbkdf2_sha256$100000$oCevIhWTIPYA$99+cV/2NNI73XJkklvv4YNyXvzO3Fg3KCzopLaaYaHU=	2018-07-11 21:46:40.15814+00	f	marcin			marcin3880@gmail.com	f	t	2018-06-14 13:53:55.471336+00		marcin
\.


--
-- Data for Name: system_systemuser_groups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY system_systemuser_groups (id, systemuser_id, group_id) FROM stdin;
\.


--
-- Name: system_systemuser_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('system_systemuser_groups_id_seq', 1, false);


--
-- Name: system_systemuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('system_systemuser_id_seq', 26, true);


--
-- Data for Name: system_systemuser_user_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY system_systemuser_user_permissions (id, systemuser_id, permission_id) FROM stdin;
\.


--
-- Name: system_systemuser_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('system_systemuser_user_permissions_id_seq', 1, false);


--
-- Data for Name: team_team; Type: TABLE DATA; Schema: public; Owner: -
--

COPY team_team (id, name, shortname, logo, vertical_logo) FROM stdin;
1	Rosja	RUS	teams/rus.svg	f
2	Niemcy	GER	teams/ger.svg	f
3	Brazylia	BRA	teams/bra.svg	f
4	Portugalia	POR	teams/por.svg	f
5	Argentyna	ARG	teams/arg.svg	f
6	Belgia	BEL	teams/bel.svg	t
7	Polska	POL	teams/pol.svg	f
8	Francja	FRA	teams/fra.svg	t
9	Hiszpania	SPA	teams/spa.svg	f
10	Peru	PER	teams/per.svg	t
11	Szwajcaria	SWI	teams/swi.svg	f
12	Anglia	ENG	teams/eng.svg	f
13	Kolumbia	COL	teams/col.svg	f
14	Meksyk	MEX	teams/mex.svg	f
15	Urugwaj	URU	teams/uru.svg	f
16	Chorwacja	CRO	teams/cro.svg	f
17	Dania	DEN	teams/den.svg	f
18	Islandia	ICE	teams/ice.svg	f
19	Kostaryka	COS	teams/cos.svg	f
20	Szwecja	SWE	teams/swe.svg	f
21	Tunezja	TUN	teams/tun.svg	f
23	Senegal	SEN	teams/sen.svg	f
24	Iran	IRA	teams/ira.svg	f
25	Serbia	SER	teams/ser.svg	f
26	Nigeria	NIG	teams/nig.svg	t
27	Australia	AUT	teams/aut.svg	f
28	Japonia	JAP	teams/jap.svg	f
29	Maroko	MOR	teams/mor.svg	f
30	Panama	PAN	teams/pan.svg	f
31	Korea Południowa	SKO	teams/sko.svg	f
32	Arabia Saudyjska	SAR	teams/sar.svg	f
22	Egipt	EGY	teams/egy.svg	f
\.


--
-- Name: team_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('team_team_id_seq', 32, true);


--
-- Name: account_emailaddress account_emailaddress_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY account_emailaddress
    ADD CONSTRAINT account_emailaddress_email_key UNIQUE (email);


--
-- Name: account_emailaddress account_emailaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY account_emailaddress
    ADD CONSTRAINT account_emailaddress_pkey PRIMARY KEY (id);


--
-- Name: account_emailconfirmation account_emailconfirmation_key_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_key_key UNIQUE (key);


--
-- Name: account_emailconfirmation account_emailconfirmation_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: captcha_captchastore captcha_captchastore_hashkey_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY captcha_captchastore
    ADD CONSTRAINT captcha_captchastore_hashkey_key UNIQUE (hashkey);


--
-- Name: captcha_captchastore captcha_captchastore_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY captcha_captchastore
    ADD CONSTRAINT captcha_captchastore_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: match_match match_match_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY match_match
    ADD CONSTRAINT match_match_pkey PRIMARY KEY (id);


--
-- Name: match_match match_match_score_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY match_match
    ADD CONSTRAINT match_match_score_id_key UNIQUE (score_id);


--
-- Name: match_score match_score_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY match_score
    ADD CONSTRAINT match_score_pkey PRIMARY KEY (id);


--
-- Name: places_stadium places_stadium_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY places_stadium
    ADD CONSTRAINT places_stadium_pkey PRIMARY KEY (id);


--
-- Name: prediction_extraquestions prediction_extraquestions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prediction_extraquestions
    ADD CONSTRAINT prediction_extraquestions_pkey PRIMARY KEY (id);


--
-- Name: prediction_extraquestionsuseranswers prediction_extraquestionsuseranswers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prediction_extraquestionsuseranswers
    ADD CONSTRAINT prediction_extraquestionsuseranswers_pkey PRIMARY KEY (id);


--
-- Name: prediction_points prediction_points_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prediction_points
    ADD CONSTRAINT prediction_points_pkey PRIMARY KEY (id);


--
-- Name: prediction_prediction prediction_prediction_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prediction_prediction
    ADD CONSTRAINT prediction_prediction_pkey PRIMARY KEY (id);


--
-- Name: prediction_prediction prediction_prediction_user_id_match_id_d813c948_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prediction_prediction
    ADD CONSTRAINT prediction_prediction_user_id_match_id_d813c948_uniq UNIQUE (user_id, match_id);


--
-- Name: prediction_userpoints prediction_userpoints_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prediction_userpoints
    ADD CONSTRAINT prediction_userpoints_pkey PRIMARY KEY (id);


--
-- Name: round_group round_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY round_group
    ADD CONSTRAINT round_group_pkey PRIMARY KEY (id);


--
-- Name: round_groupteam round_groupteam_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY round_groupteam
    ADD CONSTRAINT round_groupteam_pkey PRIMARY KEY (id);


--
-- Name: round_round round_round_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY round_round
    ADD CONSTRAINT round_round_pkey PRIMARY KEY (id);


--
-- Name: staticpages_rules staticpages_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY staticpages_rules
    ADD CONSTRAINT staticpages_rules_pkey PRIMARY KEY (id);


--
-- Name: system_systemuser_groups system_systemuser_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY system_systemuser_groups
    ADD CONSTRAINT system_systemuser_groups_pkey PRIMARY KEY (id);


--
-- Name: system_systemuser_groups system_systemuser_groups_systemuser_id_group_id_77fbc464_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY system_systemuser_groups
    ADD CONSTRAINT system_systemuser_groups_systemuser_id_group_id_77fbc464_uniq UNIQUE (systemuser_id, group_id);


--
-- Name: system_systemuser system_systemuser_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY system_systemuser
    ADD CONSTRAINT system_systemuser_pkey PRIMARY KEY (id);


--
-- Name: system_systemuser_user_permissions system_systemuser_user_p_systemuser_id_permission_c7bab9d9_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY system_systemuser_user_permissions
    ADD CONSTRAINT system_systemuser_user_p_systemuser_id_permission_c7bab9d9_uniq UNIQUE (systemuser_id, permission_id);


--
-- Name: system_systemuser_user_permissions system_systemuser_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY system_systemuser_user_permissions
    ADD CONSTRAINT system_systemuser_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: system_systemuser system_systemuser_username_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY system_systemuser
    ADD CONSTRAINT system_systemuser_username_key UNIQUE (username);


--
-- Name: team_team team_team_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY team_team
    ADD CONSTRAINT team_team_pkey PRIMARY KEY (id);


--
-- Name: account_emailaddress_email_03be32b2_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX account_emailaddress_email_03be32b2_like ON account_emailaddress USING btree (email varchar_pattern_ops);


--
-- Name: account_emailaddress_user_id_2c513194; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX account_emailaddress_user_id_2c513194 ON account_emailaddress USING btree (user_id);


--
-- Name: account_emailconfirmation_email_address_id_5b7f8c58; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX account_emailconfirmation_email_address_id_5b7f8c58 ON account_emailconfirmation USING btree (email_address_id);


--
-- Name: account_emailconfirmation_key_f43612bd_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX account_emailconfirmation_key_f43612bd_like ON account_emailconfirmation USING btree (key varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON auth_permission USING btree (content_type_id);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: captcha_captchastore_hashkey_cbe8d15a_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX captcha_captchastore_hashkey_cbe8d15a_like ON captcha_captchastore USING btree (hashkey varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_expire_date_a5c62663 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_site_domain_a2e37b91_like ON django_site USING btree (domain varchar_pattern_ops);


--
-- Name: match_match_group_id_0dbb27e7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX match_match_group_id_0dbb27e7 ON match_match USING btree (group_id);


--
-- Name: match_match_round_id_a86f8e09; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX match_match_round_id_a86f8e09 ON match_match USING btree (round_id);


--
-- Name: match_match_stadium_id_014e2990; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX match_match_stadium_id_014e2990 ON match_match USING btree (stadium_id);


--
-- Name: match_match_teamAway_id_fd68cd9e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "match_match_teamAway_id_fd68cd9e" ON match_match USING btree ("teamAway_id");


--
-- Name: match_match_teamHome_id_04ed0769; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "match_match_teamHome_id_04ed0769" ON match_match USING btree ("teamHome_id");


--
-- Name: prediction_extraquestions_group_id_3bfc3948; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX prediction_extraquestions_group_id_3bfc3948 ON prediction_extraquestions USING btree (group_id);


--
-- Name: prediction_extraquestionsuseranswers_question_id_d6e56804; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX prediction_extraquestionsuseranswers_question_id_d6e56804 ON prediction_extraquestionsuseranswers USING btree (question_id);


--
-- Name: prediction_extraquestionsuseranswers_user_id_6bbea3d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX prediction_extraquestionsuseranswers_user_id_6bbea3d6 ON prediction_extraquestionsuseranswers USING btree (user_id);


--
-- Name: prediction_prediction_match_id_5ee2b5e0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX prediction_prediction_match_id_5ee2b5e0 ON prediction_prediction USING btree (match_id);


--
-- Name: prediction_prediction_user_id_fa8fd0d0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX prediction_prediction_user_id_fa8fd0d0 ON prediction_prediction USING btree (user_id);


--
-- Name: prediction_userpoints_user_id_c6c2f76c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX prediction_userpoints_user_id_c6c2f76c ON prediction_userpoints USING btree (user_id);


--
-- Name: round_groupteam_group_id_a7007837; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX round_groupteam_group_id_a7007837 ON round_groupteam USING btree (group_id);


--
-- Name: round_groupteam_team_id_d4b796e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX round_groupteam_team_id_d4b796e1 ON round_groupteam USING btree (team_id);


--
-- Name: system_systemuser_groups_group_id_a58c4c00; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX system_systemuser_groups_group_id_a58c4c00 ON system_systemuser_groups USING btree (group_id);


--
-- Name: system_systemuser_groups_systemuser_id_df6b4a06; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX system_systemuser_groups_systemuser_id_df6b4a06 ON system_systemuser_groups USING btree (systemuser_id);


--
-- Name: system_systemuser_user_permissions_permission_id_e5fd2ed6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX system_systemuser_user_permissions_permission_id_e5fd2ed6 ON system_systemuser_user_permissions USING btree (permission_id);


--
-- Name: system_systemuser_user_permissions_systemuser_id_1ff05170; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX system_systemuser_user_permissions_systemuser_id_1ff05170 ON system_systemuser_user_permissions USING btree (systemuser_id);


--
-- Name: system_systemuser_username_8d24e4e0_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX system_systemuser_username_8d24e4e0_like ON system_systemuser USING btree (username varchar_pattern_ops);


--
-- Name: account_emailaddress account_emailaddress_user_id_2c513194_fk_system_systemuser_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_2c513194_fk_system_systemuser_id FOREIGN KEY (user_id) REFERENCES system_systemuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_emailconfirmation account_emailconfirm_email_address_id_5b7f8c58_fk_account_e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY account_emailconfirmation
    ADD CONSTRAINT account_emailconfirm_email_address_id_5b7f8c58_fk_account_e FOREIGN KEY (email_address_id) REFERENCES account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_system_systemuser_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_system_systemuser_id FOREIGN KEY (user_id) REFERENCES system_systemuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_system_systemuser_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_system_systemuser_id FOREIGN KEY (user_id) REFERENCES system_systemuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: match_match match_match_group_id_0dbb27e7_fk_round_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY match_match
    ADD CONSTRAINT match_match_group_id_0dbb27e7_fk_round_group_id FOREIGN KEY (group_id) REFERENCES round_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: match_match match_match_round_id_a86f8e09_fk_round_round_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY match_match
    ADD CONSTRAINT match_match_round_id_a86f8e09_fk_round_round_id FOREIGN KEY (round_id) REFERENCES round_round(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: match_match match_match_score_id_03c69dab_fk_match_score_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY match_match
    ADD CONSTRAINT match_match_score_id_03c69dab_fk_match_score_id FOREIGN KEY (score_id) REFERENCES match_score(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: match_match match_match_stadium_id_014e2990_fk_places_stadium_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY match_match
    ADD CONSTRAINT match_match_stadium_id_014e2990_fk_places_stadium_id FOREIGN KEY (stadium_id) REFERENCES places_stadium(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: match_match match_match_teamAway_id_fd68cd9e_fk_team_team_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY match_match
    ADD CONSTRAINT "match_match_teamAway_id_fd68cd9e_fk_team_team_id" FOREIGN KEY ("teamAway_id") REFERENCES team_team(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: match_match match_match_teamHome_id_04ed0769_fk_team_team_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY match_match
    ADD CONSTRAINT "match_match_teamHome_id_04ed0769_fk_team_team_id" FOREIGN KEY ("teamHome_id") REFERENCES team_team(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prediction_extraquestionsuseranswers prediction_extraques_question_id_d6e56804_fk_predictio; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prediction_extraquestionsuseranswers
    ADD CONSTRAINT prediction_extraques_question_id_d6e56804_fk_predictio FOREIGN KEY (question_id) REFERENCES prediction_extraquestions(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prediction_extraquestionsuseranswers prediction_extraques_user_id_6bbea3d6_fk_system_sy; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prediction_extraquestionsuseranswers
    ADD CONSTRAINT prediction_extraques_user_id_6bbea3d6_fk_system_sy FOREIGN KEY (user_id) REFERENCES system_systemuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prediction_extraquestions prediction_extraquestions_group_id_3bfc3948_fk_round_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prediction_extraquestions
    ADD CONSTRAINT prediction_extraquestions_group_id_3bfc3948_fk_round_group_id FOREIGN KEY (group_id) REFERENCES round_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prediction_prediction prediction_prediction_match_id_5ee2b5e0_fk_match_match_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prediction_prediction
    ADD CONSTRAINT prediction_prediction_match_id_5ee2b5e0_fk_match_match_id FOREIGN KEY (match_id) REFERENCES match_match(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prediction_prediction prediction_prediction_user_id_fa8fd0d0_fk_system_systemuser_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prediction_prediction
    ADD CONSTRAINT prediction_prediction_user_id_fa8fd0d0_fk_system_systemuser_id FOREIGN KEY (user_id) REFERENCES system_systemuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: prediction_userpoints prediction_userpoints_user_id_c6c2f76c_fk_system_systemuser_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prediction_userpoints
    ADD CONSTRAINT prediction_userpoints_user_id_c6c2f76c_fk_system_systemuser_id FOREIGN KEY (user_id) REFERENCES system_systemuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: round_groupteam round_groupteam_group_id_a7007837_fk_round_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY round_groupteam
    ADD CONSTRAINT round_groupteam_group_id_a7007837_fk_round_group_id FOREIGN KEY (group_id) REFERENCES round_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: round_groupteam round_groupteam_team_id_d4b796e1_fk_team_team_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY round_groupteam
    ADD CONSTRAINT round_groupteam_team_id_d4b796e1_fk_team_team_id FOREIGN KEY (team_id) REFERENCES team_team(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: system_systemuser_groups system_systemuser_gr_systemuser_id_df6b4a06_fk_system_sy; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY system_systemuser_groups
    ADD CONSTRAINT system_systemuser_gr_systemuser_id_df6b4a06_fk_system_sy FOREIGN KEY (systemuser_id) REFERENCES system_systemuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: system_systemuser_groups system_systemuser_groups_group_id_a58c4c00_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY system_systemuser_groups
    ADD CONSTRAINT system_systemuser_groups_group_id_a58c4c00_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: system_systemuser_user_permissions system_systemuser_us_permission_id_e5fd2ed6_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY system_systemuser_user_permissions
    ADD CONSTRAINT system_systemuser_us_permission_id_e5fd2ed6_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: system_systemuser_user_permissions system_systemuser_us_systemuser_id_1ff05170_fk_system_sy; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY system_systemuser_user_permissions
    ADD CONSTRAINT system_systemuser_us_systemuser_id_1ff05170_fk_system_sy FOREIGN KEY (systemuser_id) REFERENCES system_systemuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: -
--

GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

