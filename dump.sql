--
-- PostgreSQL database dump
--

-- Dumped from database version 13.11 (Ubuntu 13.11-1.pgdg20.04+1)
-- Dumped by pg_dump version 13.18 (Ubuntu 13.18-1.pgdg22.04+1)

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
-- Name: btree_gin; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS btree_gin WITH SCHEMA public;


--
-- Name: EXTENSION btree_gin; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION btree_gin IS 'support for indexing common datatypes in GIN';


--
-- Name: btree_gist; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS btree_gist WITH SCHEMA public;


--
-- Name: EXTENSION btree_gist; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION btree_gist IS 'support for indexing common datatypes in GiST';


--
-- Name: citext; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS citext WITH SCHEMA public;


--
-- Name: EXTENSION citext; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION citext IS 'data type for case-insensitive character strings';


--
-- Name: cube; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS cube WITH SCHEMA public;


--
-- Name: EXTENSION cube; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION cube IS 'data type for multidimensional cubes';


--
-- Name: dblink; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS dblink WITH SCHEMA public;


--
-- Name: EXTENSION dblink; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION dblink IS 'connect to other PostgreSQL databases from within a database';


--
-- Name: dict_int; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS dict_int WITH SCHEMA public;


--
-- Name: EXTENSION dict_int; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION dict_int IS 'text search dictionary template for integers';


--
-- Name: dict_xsyn; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS dict_xsyn WITH SCHEMA public;


--
-- Name: EXTENSION dict_xsyn; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION dict_xsyn IS 'text search dictionary template for extended synonym processing';


--
-- Name: earthdistance; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS earthdistance WITH SCHEMA public;


--
-- Name: EXTENSION earthdistance; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION earthdistance IS 'calculate great-circle distances on the surface of the Earth';


--
-- Name: fuzzystrmatch; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;


--
-- Name: EXTENSION fuzzystrmatch; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';


--
-- Name: hstore; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;


--
-- Name: EXTENSION hstore; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


--
-- Name: intarray; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS intarray WITH SCHEMA public;


--
-- Name: EXTENSION intarray; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION intarray IS 'functions, operators, and index support for 1-D arrays of integers';


--
-- Name: ltree; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS ltree WITH SCHEMA public;


--
-- Name: EXTENSION ltree; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION ltree IS 'data type for hierarchical tree-like structures';


--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA public;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


--
-- Name: pg_trgm; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;


--
-- Name: EXTENSION pg_trgm; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: pgrowlocks; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgrowlocks WITH SCHEMA public;


--
-- Name: EXTENSION pgrowlocks; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgrowlocks IS 'show row-level locking information';


--
-- Name: pgstattuple; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgstattuple WITH SCHEMA public;


--
-- Name: EXTENSION pgstattuple; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgstattuple IS 'show tuple-level statistics';


--
-- Name: tablefunc; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS tablefunc WITH SCHEMA public;


--
-- Name: EXTENSION tablefunc; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION tablefunc IS 'functions that manipulate whole tables, including crosstab';


--
-- Name: unaccent; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;


--
-- Name: EXTENSION unaccent; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: xml2; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS xml2 WITH SCHEMA public;


--
-- Name: EXTENSION xml2; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION xml2 IS 'XPath querying and XSLT';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: account_emailaddress; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_emailaddress (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    verified boolean NOT NULL,
    "primary" boolean NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.account_emailaddress OWNER TO postgres;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.account_emailaddress ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.account_emailaddress_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: account_emailconfirmation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_emailconfirmation (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    key character varying(64) NOT NULL,
    email_address_id integer NOT NULL
);


ALTER TABLE public.account_emailconfirmation OWNER TO postgres;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.account_emailconfirmation ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.account_emailconfirmation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_group ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_group_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_permission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_user_groups ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_user ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: bookings_bathroomimage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bookings_bathroomimage (
    id bigint NOT NULL,
    image character varying(255) NOT NULL
);


ALTER TABLE public.bookings_bathroomimage OWNER TO postgres;

--
-- Name: bookings_bathroomimage_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.bookings_bathroomimage ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.bookings_bathroomimage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: bookings_minibarimage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bookings_minibarimage (
    id bigint NOT NULL,
    image character varying(255) NOT NULL
);


ALTER TABLE public.bookings_minibarimage OWNER TO postgres;

--
-- Name: bookings_minibarimage_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.bookings_minibarimage ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.bookings_minibarimage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: bookings_reservation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bookings_reservation (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(254) NOT NULL,
    phone character varying(15) NOT NULL,
    checkin_date date NOT NULL,
    checkout_date date NOT NULL,
    type_of_room character varying(10) NOT NULL,
    price numeric(10,2),
    reservation_status character varying(20) NOT NULL,
    room_id bigint,
    user_id integer NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    status_changed boolean NOT NULL
);


ALTER TABLE public.bookings_reservation OWNER TO postgres;

--
-- Name: bookings_reservation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.bookings_reservation ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.bookings_reservation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: bookings_room; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bookings_room (
    id bigint NOT NULL,
    room_number character varying(20) NOT NULL,
    featured_image character varying(255) NOT NULL,
    room_type character varying(10) NOT NULL,
    description text NOT NULL,
    capacity integer NOT NULL,
    price numeric(10,2) NOT NULL,
    available boolean NOT NULL,
    CONSTRAINT bookings_room_capacity_check CHECK ((capacity >= 0))
);


ALTER TABLE public.bookings_room OWNER TO postgres;

--
-- Name: bookings_room_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.bookings_room ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.bookings_room_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: cart_cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart_cart (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.cart_cart OWNER TO postgres;

--
-- Name: cart_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.cart_cart ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.cart_cart_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: cart_cartitem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart_cartitem (
    id bigint NOT NULL,
    quantity integer NOT NULL,
    cart_id bigint NOT NULL,
    seed_id bigint NOT NULL,
    CONSTRAINT cart_cartitem_quantity_check CHECK ((quantity >= 0))
);


ALTER TABLE public.cart_cartitem OWNER TO postgres;

--
-- Name: cart_cartitem_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.cart_cartitem ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.cart_cartitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
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


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.django_admin_log ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.django_content_type ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.django_migrations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO postgres;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.django_site ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_summernote_attachment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_summernote_attachment (
    id bigint NOT NULL,
    name character varying(255),
    file character varying(100) NOT NULL,
    uploaded timestamp with time zone NOT NULL
);


ALTER TABLE public.django_summernote_attachment OWNER TO postgres;

--
-- Name: django_summernote_attachment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.django_summernote_attachment ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_summernote_attachment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: home_message; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.home_message (
    id bigint NOT NULL,
    content text NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.home_message OWNER TO postgres;

--
-- Name: home_message_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.home_message ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.home_message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: reviews_comment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_comment (
    id bigint NOT NULL,
    text text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    review_id bigint NOT NULL,
    user_id integer NOT NULL,
    status character varying(10) NOT NULL
);


ALTER TABLE public.reviews_comment OWNER TO postgres;

--
-- Name: reviews_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.reviews_comment ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.reviews_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: reviews_review; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews_review (
    id bigint NOT NULL,
    rating integer NOT NULL,
    review text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    last_edited_at timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    status integer NOT NULL,
    CONSTRAINT reviews_review_rating_check CHECK ((rating >= 0))
);


ALTER TABLE public.reviews_review OWNER TO postgres;

--
-- Name: reviews_review_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.reviews_review ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.reviews_review_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: seeds_seed; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.seeds_seed (
    id bigint NOT NULL,
    name character varying(200) NOT NULL,
    scientific_name character varying(200) NOT NULL,
    description text NOT NULL,
    planting_months_from integer NOT NULL,
    planting_months_to integer NOT NULL,
    flowering_months_from integer NOT NULL,
    flowering_months_to integer NOT NULL,
    category character varying(100) NOT NULL,
    sun_preference character varying(20) NOT NULL,
    price numeric(10,2) NOT NULL,
    discount numeric(5,2) NOT NULL,
    in_stock integer NOT NULL,
    height_from numeric(5,2) NOT NULL,
    height_to numeric(5,2) NOT NULL,
    image character varying(255),
    created_at timestamp with time zone NOT NULL,
    CONSTRAINT seeds_seed_flowering_months_from_check CHECK ((flowering_months_from >= 0)),
    CONSTRAINT seeds_seed_flowering_months_to_check CHECK ((flowering_months_to >= 0)),
    CONSTRAINT seeds_seed_in_stock_check CHECK ((in_stock >= 0)),
    CONSTRAINT seeds_seed_planting_months_from_check CHECK ((planting_months_from >= 0)),
    CONSTRAINT seeds_seed_planting_months_to_check CHECK ((planting_months_to >= 0))
);


ALTER TABLE public.seeds_seed OWNER TO postgres;

--
-- Name: seeds_seed_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.seeds_seed ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.seeds_seed_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: socialaccount_socialaccount; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.socialaccount_socialaccount (
    id integer NOT NULL,
    provider character varying(200) NOT NULL,
    uid character varying(191) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    extra_data jsonb NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialaccount OWNER TO postgres;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.socialaccount_socialaccount ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.socialaccount_socialaccount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: socialaccount_socialapp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.socialaccount_socialapp (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    name character varying(40) NOT NULL,
    client_id character varying(191) NOT NULL,
    secret character varying(191) NOT NULL,
    key character varying(191) NOT NULL,
    provider_id character varying(200) NOT NULL,
    settings jsonb NOT NULL
);


ALTER TABLE public.socialaccount_socialapp OWNER TO postgres;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.socialaccount_socialapp ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.socialaccount_socialapp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: socialaccount_socialapp_sites; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.socialaccount_socialapp_sites (
    id bigint NOT NULL,
    socialapp_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialapp_sites OWNER TO postgres;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.socialaccount_socialapp_sites ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.socialaccount_socialapp_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: socialaccount_socialtoken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.socialaccount_socialtoken (
    id integer NOT NULL,
    token text NOT NULL,
    token_secret text NOT NULL,
    expires_at timestamp with time zone,
    account_id integer NOT NULL,
    app_id integer
);


ALTER TABLE public.socialaccount_socialtoken OWNER TO postgres;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.socialaccount_socialtoken ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.socialaccount_socialtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: wantit_booking; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wantit_booking (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(254) NOT NULL,
    phone character varying(15) NOT NULL,
    checkin_date date NOT NULL,
    checkout_date date NOT NULL,
    type_of_room character varying(10) NOT NULL,
    occupied boolean NOT NULL,
    status integer NOT NULL,
    user_id integer NOT NULL,
    excerpt text NOT NULL,
    updated_on timestamp with time zone NOT NULL
);


ALTER TABLE public.wantit_booking OWNER TO postgres;

--
-- Name: wantit_booking_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.wantit_booking ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.wantit_booking_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: account_emailaddress; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_emailaddress (id, email, verified, "primary", user_id) FROM stdin;
2	sida@gmail.com	f	t	19
3	dfa@mail.com	f	t	20
4	anja@mail.com	f	t	23
5	izo@mail.com	f	t	25
6	dfsa@mail.com	f	t	27
\.


--
-- Data for Name: account_emailconfirmation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_emailconfirmation (id, created, sent, key, email_address_id) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add booking	7	add_booking
26	Can change booking	7	change_booking
27	Can delete booking	7	delete_booking
28	Can view booking	7	view_booking
29	Can add booking	8	add_booking
30	Can change booking	8	change_booking
31	Can delete booking	8	delete_booking
32	Can view booking	8	view_booking
33	Can add review	9	add_review
34	Can change review	9	change_review
35	Can delete review	9	delete_review
36	Can view review	9	view_review
37	Can add attachment	10	add_attachment
38	Can change attachment	10	change_attachment
39	Can delete attachment	10	delete_attachment
40	Can view attachment	10	view_attachment
41	Can add site	11	add_site
42	Can change site	11	change_site
43	Can delete site	11	delete_site
44	Can view site	11	view_site
45	Can add email address	12	add_emailaddress
46	Can change email address	12	change_emailaddress
47	Can delete email address	12	delete_emailaddress
48	Can view email address	12	view_emailaddress
49	Can add email confirmation	13	add_emailconfirmation
50	Can change email confirmation	13	change_emailconfirmation
51	Can delete email confirmation	13	delete_emailconfirmation
52	Can view email confirmation	13	view_emailconfirmation
53	Can add social account	14	add_socialaccount
54	Can change social account	14	change_socialaccount
55	Can delete social account	14	delete_socialaccount
56	Can view social account	14	view_socialaccount
57	Can add social application	15	add_socialapp
58	Can change social application	15	change_socialapp
59	Can delete social application	15	delete_socialapp
60	Can view social application	15	view_socialapp
61	Can add social application token	16	add_socialtoken
62	Can change social application token	16	change_socialtoken
63	Can delete social application token	16	delete_socialtoken
64	Can view social application token	16	view_socialtoken
65	Can add comment	17	add_comment
66	Can change comment	17	change_comment
67	Can delete comment	17	delete_comment
68	Can view comment	17	view_comment
69	Can add room	18	add_room
70	Can change room	18	change_room
71	Can delete room	18	delete_room
72	Can view room	18	view_room
73	Can add reservation	19	add_reservation
74	Can change reservation	19	change_reservation
75	Can delete reservation	19	delete_reservation
76	Can view reservation	19	view_reservation
77	Can add minibar image	20	add_minibarimage
78	Can change minibar image	20	change_minibarimage
79	Can delete minibar image	20	delete_minibarimage
80	Can view minibar image	20	view_minibarimage
81	Can add bathroom image	21	add_bathroomimage
82	Can change bathroom image	21	change_bathroomimage
83	Can delete bathroom image	21	delete_bathroomimage
84	Can view bathroom image	21	view_bathroomimage
85	Can add message	22	add_message
86	Can change message	22	change_message
87	Can delete message	22	delete_message
88	Can view message	22	view_message
89	Can add seed	23	add_seed
90	Can change seed	23	change_seed
91	Can delete seed	23	delete_seed
92	Can view seed	23	view_seed
93	Can add cart	24	add_cart
94	Can change cart	24	change_cart
95	Can delete cart	24	delete_cart
96	Can view cart	24	view_cart
97	Can add cart item	25	add_cartitem
98	Can change cart item	25	change_cartitem
99	Can delete cart item	25	delete_cartitem
100	Can view cart item	25	view_cartitem
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
25	pbkdf2_sha256$600000$bkUFXruoHPWo1FOK7E35MU$JAoQe4dS1MfZ0KWWVukRmk38ptK5O/Cc6QsznbVhnbs=	2024-07-03 21:42:51.870028+00	f	izet	Izet	Faza	izo@mail.com	f	t	2024-07-03 21:42:50.227737+00
19	pbkdf2_sha256$600000$EST1ehy5iIW5HHHktnbNQn$hKOyE0vm7HIirOmWfaCYefmprGgVMyd4u8F5oT8nn/4=	2024-06-28 08:23:42+00	f	niko	Niko	Misic	sida@gmail.com	f	t	2024-06-28 08:23:41+00
27	pbkdf2_sha256$600000$8V4dmoIq34p1pR6t65kaoQ$JvqCBH0lP1QZYeX9dPrvLLStZqLPUDLiZzGjzEV0Eew=	2024-07-03 22:10:08.191178+00	f	Simke	sivac	lisa	dfsa@mail.com	f	t	2024-07-03 22:10:06.556833+00
32	pbkdf2_sha256$870000$h0hCc3AR33ZbSyA66a3HvP$H91XzI8a65vED0z2s4q80cBIfJ5rAlJ98W0lROOz3KU=	2024-08-19 10:25:51.31568+00	f	brkica				f	t	2024-08-19 10:25:30.514528+00
28	pbkdf2_sha256$600000$O6QDQwnIdpxwvXVvXlCECf$js/BYhOSgaL6svMk9upBkrp6WEVQvLYWjm0ofIYyRhE=	2024-07-04 08:20:01.24632+00	f	Sila	Sila	Salic	sila@mail.com	f	t	2024-07-04 08:20:00.02164+00
20	pbkdf2_sha256$600000$1HyinKXbQIEWAIWMvGpj16$hZIgL7OCFGoAUBlEV2Rsyn/bduCl+FpHZzOhQ4TgMy4=	2024-06-28 15:21:27.681293+00	f	brko	brko	brkati	dfa@mail.com	f	t	2024-06-28 15:21:26.061683+00
29	pbkdf2_sha256$600000$k9uqLmq5QTO9nu3xHMGvlh$IBqwNTpR7XOuXckXJENbWIEGZqNeyjftWfE0XsFSazI=	2024-07-04 08:21:56.199707+00	f	Ax	Axelerator	Liftic	ax@mail.com	f	t	2024-07-04 08:21:54.997351+00
21	pbkdf2_sha256$600000$A50gIbIrVCEWB0nwjKmGV9$NoZNg7zq5kg7NpQ7v2UNi81S6ZFkBhuQyCHIucoYCws=	2024-06-30 08:51:45.84204+00	f	sdc	asxca	asa		f	t	2024-06-30 08:51:44.474024+00
22	pbkdf2_sha256$600000$eClcKDf20eSdNqLHAEXG8g$8MLZcasLr414GmNMdxe1Ydk/A/WLsO7ENImnA2So6r4=	2024-06-30 09:29:22.620883+00	f	Asham	Asham	Latic		f	t	2024-06-30 09:29:21.256788+00
30	pbkdf2_sha256$600000$n0NQmw47Z6xlU9jTIzTgrk$jhyEJXPzYfjAilusGk3VNn9iYFB+BUQiJXyz8hmtaXA=	2024-07-05 07:44:02.793314+00	f	Sladja	Sladjana	Sladjic	sladja@mail.com	f	t	2024-07-05 07:44:01.543121+00
23	pbkdf2_sha256$600000$5GVJ99YNGYL968bIKi4jZC$lptfEzq2A+t/lJLy0i3GFXzYlTHtw3TZuHMAL/yAWWM=	2024-07-02 22:35:25.487499+00	f	anja	Anja	Sanjic	anja@mail.com	f	t	2024-07-02 22:35:24.369037+00
33	pbkdf2_sha256$600000$arCVTkbeRMwn8kdwWE1nqu$dqnd+Zxy2I0X9IRvjaFkHopTH6gdxek4gMUtHLNItu0=	2024-10-18 17:32:58.813948+00	f	huse	Husi	Huse	husehadziabdic@hotmail.com	f	t	2024-10-18 17:29:18.879311+00
24	pbkdf2_sha256$600000$bAOj9t02fRLVvsmVk3UJva$fAIjxOQSlkVfOhL4sYD1eRNJs22lhDOjeFLgrJKhFHo=	2024-07-03 13:39:40.478753+00	f	test123	test	test		f	t	2024-07-03 13:39:39.347351+00
31	pbkdf2_sha256$600000$AQrCVurqGlzuuzw2CAcayL$4GMBsXyrPKxqr9xGFZHD/2F97oyRb+8dy2zC1cE3W4g=	2024-08-09 10:56:45.632368+00	f	testUser123	test	test	test@testing.com	f	t	2024-08-09 10:56:44.630942+00
34	pbkdf2_sha256$600000$zSRcuK5hg8o4MsYy5WqQVW$8lDTHCUEEAHVwp6KsEgZQeaejYsvryUhGaNxznOtPXA=	2024-12-04 18:06:28.026299+00	f	safeT	Nikola	Simic	alka@text.mail	f	t	2024-11-28 09:26:42.043581+00
1	pbkdf2_sha256$600000$K6e256HaxwqhQB2f01anBB$jbnaGTqYcpElrjKIQC/teS4aNzWh/t0vRIJ17c8SzNM=	2024-12-05 11:45:28.927016+00	t	nikola	Nikola	Simic	nlekkerman@gmail.com	t	t	2024-05-27 14:46:55+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: bookings_bathroomimage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bookings_bathroomimage (id, image) FROM stdin;
1	image/upload/v1719758439/zunlk5aeqdzz4rrbm7zj.jpg
\.


--
-- Data for Name: bookings_minibarimage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bookings_minibarimage (id, image) FROM stdin;
1	image/upload/v1719758342/pmadjuzm6vjkl616wkcg.jpg
2	image/upload/v1719758364/snw4c9978gmamk0f0gde.jpg
3	image/upload/v1719758392/kazdxfesxordsw3rvle0.jpg
4	image/upload/v1719758413/otqsdiuvhlck04qvmjit.jpg
\.


--
-- Data for Name: bookings_reservation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bookings_reservation (id, name, email, phone, checkin_date, checkout_date, type_of_room, price, reservation_status, room_id, user_id, first_name, last_name, status_changed) FROM stdin;
41	Nikola	nlekkerman@gmail.com	000555888	2024-07-02	2024-08-01		6000.00	rejected	1	1	Nikola	Simic	t
46	Anja	anja@mail.com	123456	2024-07-05	2024-07-08		600.00	rejected	2	23	Anja	Sanjic	t
47	test	test@gmail.com	098765423	2024-07-03	2024-07-04		220.00	confirmed	3	24	test	test	t
48	Nikola	nlekkerman@gmail.com	000555888	2024-07-03	2024-07-25		4840.00	rejected	3	1	Nikola	Simic	t
51	Nikola	nlekkerman@gmail.com	09888333	2024-07-04	2024-07-20		3520.00	pending	3	1	Nikola	Simic	f
52	Nikola	nlekkerman@gmail.com	09888333	2024-07-05	2024-07-06		320.00	pending	10	1	Nikola	Simic	f
53	Nikola	nlekkerman@gmail.com	09888333	2024-07-05	2024-07-12		1400.00	pending	1	1	Nikola	Simic	f
54	Nikola	nlekkerman@gmail.com	09888333	2024-07-05	2024-07-12		1400.00	pending	1	1	Nikola	Simic	f
55	Nikola	nlekkerman@gmail.com	09888333	2024-07-05	2024-07-31		5200.00	pending	5	1	Nikola	Simic	f
56	Nikola	nlekkerman@gmail.com	09888333	2024-07-05	2024-07-13		1600.00	pending	5	1	Nikola	Simic	f
57	Nikola	nlekkerman@gmail.com	09888333	2024-07-05	2024-07-13		1600.00	pending	5	1	Nikola	Simic	f
58	Nikola	nlekkerman@gmail.com	000555888	2024-07-05	2024-07-20		3000.00	pending	1	1	Nikola	Simic	f
59	Nikola	nlekkerman@gmail.com	0830945102	2024-07-07	2024-07-14		1400.00	pending	2	1	Nikola	Simic	f
49	Nikola	nlekkerman@gmail.com	000555888	2024-07-03	2024-07-28		5000.00	confirmed	2	1	Nikola	Simic	t
50	Nikola	nlekkerman@gmail.com	000555888	2024-07-03	2024-07-28		5500.00	rejected	3	1	Nikola	Simic	t
60	Nikola	nlekkerman@gmail.com	0830945102	2024-07-17	2024-07-18		200.00	pending	2	1	Nikola	Simic	f
61	test	test@testing.com	123123123	2024-08-22	2024-08-28		1200.00	pending	2	31	test	test	f
62	Nikola	nlekkerman@gmail.com	083 094 5102	2024-09-19	2024-09-27		1600.00	pending	1	1	Nikola	Simic	f
63	Husi	husehadziabdic@hotmail.com	00885484455	2024-10-19	2024-10-24		1000.00	confirmed	1	33	Husi	Huse	t
64	Nikola	nlekkerman@gmail.com	00112233445566	2024-12-01	2024-12-05		1200.00	pending	8	1	Nikola	Simic	f
42	Nikola	nlekkerman@gmail.com	09888333	2024-07-02	2024-07-03		320.00	confirmed	10	1	Nikola	Simic	t
43	Nikola	nlekkerman@gmail.com	09888333	2024-07-02	2024-07-19		2550.00	confirmed	17	1	Nikola	Simic	t
44	Nikola	nlekkerman@gmail.com	09888333	2024-07-02	2024-07-03		300.00	confirmed	11	1	Nikola	Simic	t
45	Nikola	nlekkerman@gmail.com	000555888	2024-07-02	2024-08-11		8000.00	rejected	2	1	Nikola	Simic	t
65	Nikola	nlekkerman@gmail.com	99112220202022	2024-12-23	2024-12-28		1500.00	confirmed	8	1	Nikola	Simic	t
67	Nikola	alka@text.mail	0830945102	2024-12-04	2024-12-07		900.00	confirmed	9	34	Nikola	Simic	t
66	Nikola	alka@text.mail	0830945102	2024-12-04	2024-12-14		3200.00	rejected	10	34	Nikola	Simic	t
\.


--
-- Data for Name: bookings_room; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bookings_room (id, room_number, featured_image, room_type, description, capacity, price, available) FROM stdin;
2	202	image/upload/v1719558005/aqgwqrtsl1ztpz1meyav.jpg	deluxe	Experience ultimate comfort with plush bedding, a large seating area, and a well-equipped minibar. The ensuite bathroom features a luxurious bathtub.	5	200.00	t
3	203	image/upload/v1719558125/utdzmibptye20hmh1jyi.jpg	deluxe	With elegant furnishings and a serene ambiance, this room offers a perfect retreat. Enjoy the convenience of a work desk and high-speed internet.	2	220.00	t
1	201	image/upload/v1719558061/egyen6ua7o6xecu7s2qs.jpg	deluxe	This room boasts a king-sized bed, modern decor, and a spacious balcony with breathtaking city views. Enjoy luxury amenities and complimentary breakfast.	4	200.00	t
4	204	image/upload/v1719558203/xqbe7vpu79yrd2huwbjw.jpg	deluxe	This room features a cozy lounge area, premium bedding, and stunning views of the skyline. Indulge in the complimentary toiletries and soft bathrobes.	4	250.00	t
5	205	image/upload/v1719558387/i0lsfsaajso0zsdvztso.jpg	deluxe	A sophisticated room with stylish decor, a comfortable king bed, and a private balcony. The room includes a flat-screen TV and an espresso machine.	2	200.00	t
6	206	image/upload/v1719558437/pcg3ro8dnjogjg134fns.jpg	deluxe	Relax in a spacious room with luxurious amenities, including a seating area and a well-appointed bathroom. Perfect for both business and leisure travelers.	2	200.00	t
7	207	image/upload/v1719558489/braorwpyhuea7pmclmpy.jpg	deluxe	This deluxe room offers elegant interiors, a king-sized bed, and a private balcony. Enjoy the convenience of a minibar and complimentary breakfast.	4	250.00	t
8	301	image/upload/v1719558538/t0ycyeplakuky9u5a0hu.jpg	superior	Featuring contemporary decor, a comfortable queen bed, and a spacious workspace. This room is ideal for business travelers.	2	300.00	t
9	302	image/upload/v1719558581/qzk8tpu7k5bpsiljoerh.jpg	superior	A stylish room with modern furnishings, a cozy seating area, and a large bathroom with a walk-in shower. Enjoy complimentary Wi-Fi and refreshments.	4	300.00	t
10	303	image/upload/v1719558641/uy80qughaafvuj3yeqri.jpg	superior	This room offers a serene environment with a queen bed, a work desk, and ample storage space. The room is perfect for a relaxing stay.	2	320.00	t
12	305	image/upload/v1719558762/d6vqpkwwa842y6e3bfod.jpg	superior	A bright and airy room with a queen bed, a spacious sitting area, and a large flat-screen TV. The room offers beautiful views of the cityscape.	2	300.00	t
11	304	image/upload/v1719558814/cbnqq5qdjd0gi2b0d5ug.jpg	superior	Enjoy a comfortable stay in this room with elegant decor, a plush queen bed, and a modern bathroom. The room includes complimentary toiletries and a coffee maker.	3	300.00	t
13	306	image/upload/v1719558884/mikeqth3hn3bcrngwipn.jpg	superior	This superior room features a chic interior, a comfortable queen bed, and a luxurious bathroom. Ideal for both relaxation and work.	3	330.00	t
14	307	image/upload/v1719558938/uhck34qlxnltabzttntc.jpg	superior	A well-appointed room with stylish furnishings, a queen bed, and a functional workspace. The room includes a minibar and complimentary refreshments.	2	350.00	t
15	401	image/upload/v1719559044/wytkuncbpptlemaia9lc.jpg	standard	A cozy room with a double bed, simple yet elegant decor, and all the essential amenities for a comfortable stay. Ideal for budget travelers.	2	100.00	t
16	402	image/upload/v1719559099/uaebgfcofrmqzwqzhvmq.jpg	standard	This room offers a comfortable double bed, a functional workspace, and a modern bathroom. Perfect for a short stay.	2	100.00	t
17	403	image/upload/v1719559139/qy9fex4fzh5rzxaldnsm.jpg	standard	Featuring minimalist decor, a double bed, and essential amenities, this room provides a comfortable and affordable stay.	4	150.00	t
18	404	image/upload/v1719559202/kdifgs52xzpkjgxdebva.jpg	standard	A compact room with a double bed, a small sitting area, and a clean, modern bathroom. Ideal for solo travelers or couples.	3	120.00	t
19	405	image/upload/v1719559299/bhrpmdakdljhvruibopc.jpg	standard	This room includes a comfortable double bed, a work desk, and a simple yet stylish decor. The room is perfect for a brief stay.	3	100.00	t
20	406	image/upload/v1719559345/fo2ywkmj4xii4dpdvnr5.jpg	standard	A neat and tidy room with a double bed, basic amenities, and a small workspace. Suitable for travelers on a budget.	2	120.00	t
21	407	image/upload/v1719559387/hql6nnrqplj7xrzgclvi.jpg	standard	This standard room offers a double bed, a functional workspace, and a modern bathroom. The room is designed for comfort and convenience.	2	100.00	t
\.


--
-- Data for Name: cart_cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart_cart (id, created_at, updated_at, user_id) FROM stdin;
1	2024-08-14 11:27:14.322948+00	2024-08-14 11:27:14.322964+00	1
\.


--
-- Data for Name: cart_cartitem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart_cartitem (id, quantity, cart_id, seed_id) FROM stdin;
10	4	1	3
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2024-06-27 23:25:40.746792+00	1	deluxe - 101	1	[{"added": {}}]	18	1
2	2024-06-28 07:00:06.180479+00	2	deluxe - 202	1	[{"added": {}}]	18	1
3	2024-06-28 07:01:01.578046+00	1	deluxe - 101	2	[{"changed": {"fields": ["Image", "Description", "Capacity", "Price"]}}]	18	1
4	2024-06-28 07:02:06.317532+00	3	deluxe - 203	1	[{"added": {}}]	18	1
5	2024-06-28 07:02:42.238389+00	1	deluxe - 201	2	[{"changed": {"fields": ["Room number"]}}]	18	1
6	2024-06-28 07:03:23.940105+00	4	deluxe - 204	1	[{"added": {}}]	18	1
7	2024-06-28 07:04:12.338915+00	5	deluxe - 205	1	[{"added": {}}]	18	1
8	2024-06-28 07:06:27.768777+00	5	deluxe - 205	2	[{"changed": {"fields": ["Image"]}}]	18	1
9	2024-06-28 07:07:18.010657+00	6	deluxe - 206	1	[{"added": {}}]	18	1
10	2024-06-28 07:08:10.450208+00	7	deluxe - 207	1	[{"added": {}}]	18	1
11	2024-06-28 07:08:58.457702+00	8	superior - 301	1	[{"added": {}}]	18	1
12	2024-06-28 07:09:41.994596+00	9	superior - 302	1	[{"added": {}}]	18	1
13	2024-06-28 07:10:42.290845+00	10	superior - 303	1	[{"added": {}}]	18	1
14	2024-06-28 07:11:39.141735+00	11	superior - 304	1	[{"added": {}}]	18	1
15	2024-06-28 07:12:42.729948+00	12	superior - 305	1	[{"added": {}}]	18	1
16	2024-06-28 07:13:34.966355+00	11	superior - 304	2	[{"changed": {"fields": ["Image"]}}]	18	1
17	2024-06-28 07:14:44.758896+00	13	superior - 306	1	[{"added": {}}]	18	1
18	2024-06-28 07:15:38.594653+00	14	superior - 307	1	[{"added": {}}]	18	1
19	2024-06-28 07:17:25.508912+00	15	standard - 401	1	[{"added": {}}]	18	1
20	2024-06-28 07:18:19.53858+00	16	standard - 402	1	[{"added": {}}]	18	1
21	2024-06-28 07:18:59.833251+00	17	standard - 403	1	[{"added": {}}]	18	1
22	2024-06-28 07:20:03.317508+00	18	standard - 404	1	[{"added": {}}]	18	1
23	2024-06-28 07:20:47.63856+00	19	standard - 405	1	[{"added": {}}]	18	1
24	2024-06-28 07:21:40.248427+00	19	standard - 405	2	[{"changed": {"fields": ["Image"]}}]	18	1
25	2024-06-28 07:22:26.188225+00	20	standard - 406	1	[{"added": {}}]	18	1
26	2024-06-28 07:23:07.955688+00	21	standard - 407	1	[{"added": {}}]	18	1
27	2024-06-28 08:45:23.975649+00	1	nikola	2	[{"changed": {"fields": ["First name", "Last name"]}}]	4	1
28	2024-06-28 08:45:57.439201+00	19	niko	2	[{"changed": {"fields": ["First name", "Last name"]}}]	4	1
29	2024-06-28 08:48:24.774206+00	4	Alka	3		4	1
30	2024-06-28 08:48:24.910035+00	16	baki	3		4	1
31	2024-06-28 08:48:25.041429+00	13	bjohare	3		4	1
32	2024-06-28 08:48:25.172159+00	12	brko	3		4	1
33	2024-06-28 08:48:25.302797+00	9	Cristiano	3		4	1
34	2024-06-28 08:48:25.433427+00	7	dino	3		4	1
35	2024-06-28 08:48:25.565393+00	18	fikro	3		4	1
36	2024-06-28 08:48:25.696271+00	17	george	3		4	1
37	2024-06-28 08:48:25.826749+00	5	john	3		4	1
38	2024-06-28 08:48:25.957799+00	11	Laura@yahoo.com	3		4	1
39	2024-06-28 08:48:26.089509+00	8	LeonidasMessiadis	3		4	1
40	2024-06-28 08:48:26.221568+00	2	lili	3		4	1
41	2024-06-28 08:48:26.352152+00	6	miki	3		4	1
42	2024-06-28 08:48:26.48321+00	15	sajkodog	3		4	1
43	2024-06-28 08:48:26.615333+00	3	Sanja	3		4	1
44	2024-06-28 08:48:26.759341+00	10	sanjatvoja	3		4	1
45	2024-06-28 08:48:26.89025+00	14	Simke	3		4	1
46	2024-06-28 08:56:51.791235+00	1	Reservation #1 - nikola (Nikola Simic)	2	[{"changed": {"fields": ["First name", "Last name"]}}]	19	1
47	2024-06-28 08:58:36.543997+00	2	Reservation #2 - niko (Niko Misic)	2	[{"changed": {"fields": ["User", "First name", "Last name", "Name"]}}]	19	1
48	2024-06-28 08:59:01.408309+00	1	Reservation #1 - nikola (Nikola Simic)	2	[{"changed": {"fields": ["Name"]}}]	19	1
49	2024-06-30 14:39:03.438859+00	1	Minibar Image	1	[{"added": {}}]	20	1
50	2024-06-30 14:39:25.642909+00	2	Minibar Image	1	[{"added": {}}]	20	1
51	2024-06-30 14:39:52.946187+00	3	Minibar Image	1	[{"added": {}}]	20	1
52	2024-06-30 14:40:14.617578+00	4	Minibar Image	1	[{"added": {}}]	20	1
53	2024-06-30 14:40:39.991827+00	1	Bathroom Image	1	[{"added": {}}]	21	1
54	2024-07-01 14:36:15.364716+00	35	Reservation #35 - nikola (Nikola Simic)	3		19	1
55	2024-07-01 14:36:15.501515+00	34	Reservation #34 - nikola (Nikola Simic)	3		19	1
56	2024-07-01 14:36:15.633839+00	33	Reservation #33 - nikola (Nikola Simic)	3		19	1
57	2024-07-01 14:36:15.766388+00	32	Reservation #32 - nikola (Nikola Simic)	3		19	1
58	2024-07-01 14:36:15.899042+00	31	Reservation #31 - nikola (Nikola Simic)	3		19	1
59	2024-07-01 14:36:16.032701+00	30	Reservation #30 - nikola (Nikola Simic)	3		19	1
60	2024-07-01 14:36:16.174319+00	29	Reservation #29 - nikola (Nikola Simic)	3		19	1
61	2024-07-01 14:36:16.306523+00	28	Reservation #28 - nikola (Nikola Simic)	3		19	1
62	2024-07-01 14:36:16.438835+00	27	Reservation #27 - nikola (Nikola Simic)	3		19	1
63	2024-07-01 14:36:16.570998+00	26	Reservation #26 - nikola (Nikola Simic)	3		19	1
64	2024-07-01 14:36:16.706723+00	25	Reservation #25 - nikola (Nikola Simic)	3		19	1
65	2024-07-01 14:36:16.838677+00	24	Reservation #24 - nikola (Nikola Simic)	3		19	1
66	2024-07-01 14:36:16.971102+00	23	Reservation #23 - nikola (Nikola Simic)	3		19	1
67	2024-07-01 14:36:17.10736+00	22	Reservation #22 - nikola (Nikola Simic)	3		19	1
68	2024-07-01 14:36:17.240233+00	21	Reservation #21 - nikola (Nikola Simic)	3		19	1
69	2024-07-01 14:36:17.372707+00	20	Reservation #20 - nikola (Nikola Simic)	3		19	1
70	2024-07-01 14:36:17.505116+00	18	Reservation #18 - brko (brko brkati)	3		19	1
71	2024-07-01 14:36:17.641875+00	17	Reservation #17 - nikola (Nikola Simic)	3		19	1
72	2024-07-01 14:36:17.773964+00	16	Reservation #16 - nikola (Nikola Simic)	3		19	1
73	2024-07-01 14:36:17.906338+00	15	Reservation #15 - nikola (Nikola Simic)	3		19	1
74	2024-07-01 14:36:18.038567+00	14	Reservation #14 - nikola (Nikola Simic)	3		19	1
75	2024-07-01 14:36:18.171127+00	13	Reservation #13 - nikola (Nikola Simic)	3		19	1
76	2024-07-01 14:36:18.303337+00	12	Reservation #12 - nikola (Nikola Simic)	3		19	1
77	2024-07-01 14:36:18.435697+00	11	Reservation #11 - nikola (Nikola Simic)	3		19	1
78	2024-07-01 14:36:18.56788+00	10	Reservation #10 - nikola (Nikola Simic)	3		19	1
79	2024-07-01 14:36:18.699882+00	9	Reservation #9 - nikola (Nikola Simic)	3		19	1
80	2024-07-01 14:36:18.833786+00	8	Reservation #8 - nikola ( )	3		19	1
81	2024-07-01 14:36:18.966067+00	7	Reservation #7 - nikola ( )	3		19	1
82	2024-07-01 14:36:19.10086+00	6	Reservation #6 - nikola ( )	3		19	1
83	2024-07-01 14:36:19.232838+00	5	Reservation #5 - nikola (Nikola Simic)	3		19	1
84	2024-07-01 14:36:19.365059+00	4	Reservation #4 - nikola (Nikola Simic)	3		19	1
85	2024-07-01 14:36:19.496947+00	3	Reservation #3 - nikola (Nikola Simic)	3		19	1
86	2024-07-01 14:36:19.629314+00	2	Reservation #2 - niko (Niko Misic)	3		19	1
87	2024-07-01 14:36:19.761221+00	1	Reservation #1 - nikola (Nikola Simic)	3		19	1
88	2024-07-02 08:28:18.424346+00	79	Review Pleasent stay with family. by nikola with rating 4	2	[{"changed": {"fields": ["Status"]}}]	9	1
89	2024-07-02 08:30:53.622274+00	79	Review Pleasent stay with family. by nikola with rating 4	2	[{"changed": {"fields": ["Status"]}}]	9	1
90	2024-07-02 08:32:45.038069+00	79	Review Pleasent stay with family. by nikola with rating 4	2	[{"changed": {"fields": ["Status"]}}]	9	1
91	2024-07-02 13:40:19.570692+00	40	Reservation #40 - nikola (Nikola Simic)	3		19	1
92	2024-07-02 13:40:19.713677+00	39	Reservation #39 - nikola (Nikola Simic)	3		19	1
93	2024-07-02 13:40:19.845149+00	38	Reservation #38 - nikola (Nikola Simic)	3		19	1
94	2024-07-02 13:40:19.976157+00	37	Reservation #37 - nikola (Nikola Simic)	3		19	1
95	2024-07-02 13:40:20.109597+00	36	Reservation #36 - nikola (Nikola Simic)	3		19	1
96	2024-07-02 13:40:20.241321+00	19	Reservation #19 - nikola (Nikola Simic)	3		19	1
97	2024-08-14 10:46:48.758656+00	1	Giant Lily	1	[{"added": {}}]	23	1
98	2024-08-14 10:53:49.900926+00	1	Giant Lily	2	[{"changed": {"fields": ["Image"]}}]	23	1
99	2024-08-14 12:09:42.517915+00	2	Damask rose	1	[{"added": {}}]	23	1
100	2024-08-15 09:46:43.525734+00	3	Red climbing rose	1	[{"added": {}}]	23	1
101	2024-08-17 11:09:21.682751+00	3	Red climbing rose	2	[{"changed": {"fields": ["Created at"]}}]	23	1
102	2024-08-17 11:09:43.612365+00	2	Damask rose	2	[{"changed": {"fields": ["Created at"]}}]	23	1
103	2024-08-17 11:09:59.768045+00	1	Giant Lily	2	[]	23	1
104	2024-08-17 11:27:42.532203+00	2	Damask rose	2	[{"changed": {"fields": ["Discount"]}}]	23	1
105	2024-08-17 13:29:35.743391+00	14	Lemon Tree	2	[{"changed": {"fields": ["Category", "Sun preference"]}}]	23	1
106	2024-08-17 13:30:12.064801+00	18	Currant Bush	2	[{"changed": {"fields": ["Category", "Sun preference"]}}]	23	1
107	2024-08-17 13:30:13.104769+00	18	Currant Bush	2	[]	23	1
108	2024-08-17 13:30:52.529054+00	17	Gooseberry	2	[{"changed": {"fields": ["Name", "Category", "Sun preference"]}}]	23	1
109	2024-08-17 13:32:48.004823+00	16	Raspberry Bush	2	[{"changed": {"fields": ["Category", "Sun preference"]}}]	23	1
110	2024-08-17 13:33:24.810161+00	17	Gooseberry Bush	2	[{"changed": {"fields": ["Name", "Category"]}}]	23	1
111	2024-08-17 13:34:25.010141+00	15	Blueberry Bush	2	[{"changed": {"fields": ["Category", "Sun preference"]}}]	23	1
112	2024-08-17 13:34:51.73892+00	13	Cherry Tree	2	[{"changed": {"fields": ["Category", "Sun preference"]}}]	23	1
113	2024-08-17 13:35:10.324628+00	13	Cherry Tree	2	[{"changed": {"fields": ["Category"]}}]	23	1
114	2024-08-17 13:36:00.592673+00	12	Maple Tree	2	[{"changed": {"fields": ["Category", "Sun preference", "Discount"]}}]	23	1
115	2024-08-17 13:36:29.864749+00	11	Oak Tree	2	[{"changed": {"fields": ["Category", "Sun preference"]}}]	23	1
116	2024-08-17 13:36:58.931506+00	10	Marigold	2	[{"changed": {"fields": ["Category", "Sun preference"]}}]	23	1
117	2024-08-17 13:37:23.057074+00	9	Lavender	2	[{"changed": {"fields": ["Category", "Sun preference"]}}]	23	1
118	2024-08-17 13:38:00.750692+00	8	Sunflower	2	[{"changed": {"fields": ["Category", "Sun preference"]}}]	23	1
119	2024-08-18 10:43:44.687388+00	4	Red Climbing Rose	3		23	1
120	2024-08-19 10:27:27.800769+00	23	anja	3		4	1
121	2024-08-19 10:27:27.800818+00	22	Asham	3		4	1
122	2024-08-19 10:27:27.800836+00	29	Ax	3		4	1
123	2024-08-19 10:27:27.800851+00	32	brkica	3		4	1
124	2024-08-19 10:27:27.800865+00	20	brko	3		4	1
125	2024-08-19 10:27:27.800878+00	25	izet	3		4	1
126	2024-08-19 10:27:27.800891+00	19	niko	3		4	1
127	2024-08-19 10:27:27.800905+00	21	sdc	3		4	1
128	2024-08-19 10:27:27.800917+00	28	Sila	3		4	1
129	2024-08-19 10:27:27.800929+00	27	Simke	3		4	1
130	2024-08-19 10:27:27.800942+00	30	Sladja	3		4	1
131	2024-08-19 10:27:27.800956+00	24	test123	3		4	1
132	2024-08-19 10:27:27.800969+00	31	testUser123	3		4	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	wantit	booking
8	bookings	booking
9	reviews	review
10	django_summernote	attachment
11	sites	site
12	account	emailaddress
13	account	emailconfirmation
14	socialaccount	socialaccount
15	socialaccount	socialapp
16	socialaccount	socialtoken
17	reviews	comment
18	bookings	room
19	bookings	reservation
20	bookings	minibarimage
21	bookings	bathroomimage
22	home	message
23	seeds	seed
24	cart	cart
25	cart	cartitem
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2024-05-27 14:45:01.349866+00
2	auth	0001_initial	2024-05-27 14:45:05.986428+00
6	contenttypes	0002_remove_content_type_name	2024-05-27 14:45:09.202255+00
7	auth	0002_alter_permission_name_max_length	2024-05-27 14:45:09.921468+00
8	auth	0003_alter_user_email_max_length	2024-05-27 14:45:10.641109+00
9	auth	0004_alter_user_username_opts	2024-05-27 14:45:11.220506+00
10	auth	0005_alter_user_last_login_null	2024-05-27 14:45:11.9621+00
11	auth	0006_require_contenttypes_0002	2024-05-27 14:45:12.533723+00
12	auth	0007_alter_validators_add_error_messages	2024-05-27 14:45:13.112867+00
13	auth	0008_alter_user_username_max_length	2024-05-27 14:45:13.861154+00
14	auth	0009_alter_user_last_name_max_length	2024-05-27 14:45:14.582814+00
15	auth	0010_alter_group_name_max_length	2024-05-27 14:45:15.306022+00
16	auth	0011_update_proxy_permissions	2024-05-27 14:45:15.88221+00
17	auth	0012_alter_user_first_name_max_length	2024-05-27 14:45:16.601543+00
18	sessions	0001_initial	2024-05-27 14:45:17.780715+00
19	wantit	0001_initial	2024-05-27 18:59:45.440286+00
20	wantit	0002_booking_excerpt_booking_updated_on	2024-05-27 19:21:13.808498+00
25	django_summernote	0001_initial	2024-05-27 22:13:42.650528+00
26	django_summernote	0002_update-help_text	2024-05-27 22:13:43.223786+00
27	django_summernote	0003_alter_attachment_id	2024-05-27 22:17:23.637741+00
34	sites	0001_initial	2024-06-04 16:38:49.329106+00
35	sites	0002_alter_domain_unique	2024-06-04 16:38:50.191468+00
36	socialaccount	0001_initial	2024-06-04 16:38:53.489361+00
37	socialaccount	0002_token_max_lengths	2024-06-04 16:38:54.382478+00
38	socialaccount	0003_extra_data_default_dict	2024-06-04 16:38:54.964344+00
39	socialaccount	0004_app_provider_id_settings	2024-06-04 16:38:56.286634+00
40	socialaccount	0005_socialtoken_nullable_app	2024-06-04 16:38:57.641843+00
52	account	0001_initial	2024-06-27 22:34:15.039753+00
53	account	0002_email_max_length	2024-06-27 22:34:15.579859+00
54	account	0003_alter_emailaddress_create_unique_verified_email	2024-06-27 22:34:16.385441+00
55	account	0004_alter_emailaddress_drop_unique_email	2024-06-27 22:34:17.440547+00
56	account	0005_emailaddress_idx_upper_email	2024-06-27 22:34:18.094245+00
57	admin	0001_initial	2024-06-27 22:38:22.235178+00
58	admin	0002_logentry_remove_auto_add	2024-06-27 22:38:22.625576+00
59	admin	0003_logentry_add_action_flag_choices	2024-06-27 22:38:23.143508+00
61	bookings	0001_initial	2024-06-27 22:50:49.833418+00
62	bookings	0002_reservation_first_name_reservation_last_name	2024-06-28 08:55:50.850814+00
63	bookings	0003_minibarimage_bathroomimage	2024-06-30 14:18:27.812745+00
64	bookings	0004_remove_bathroomimage_room_remove_minibarimage_room	2024-06-30 14:36:44.847241+00
65	bookings	0005_reservation_status_changed	2024-07-02 12:45:16.129549+00
66	home	0001_initial	2024-07-02 13:26:11.600232+00
67	account	0006_emailaddress_lower	2024-08-14 10:35:53.917444+00
68	account	0007_emailaddress_idx_email	2024-08-14 10:35:54.764412+00
69	account	0008_emailaddress_unique_primary_email_fixup	2024-08-14 10:35:55.292015+00
70	account	0009_emailaddress_unique_primary_email	2024-08-14 10:35:55.821654+00
71	seeds	0001_initial	2024-08-14 10:35:56.403482+00
72	seeds	0002_seed_height_from_seed_height_to	2024-08-14 10:35:57.308354+00
73	socialaccount	0006_alter_socialaccount_extra_data	2024-08-14 10:35:57.855166+00
74	seeds	0003_seed_image	2024-08-14 10:37:33.527105+00
75	cart	0001_initial	2024-08-14 11:17:25.813591+00
76	seeds	0004_seed_created_at	2024-08-17 11:08:38.857098+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
twufvbtegnyzoc5d1zsa7pi92ae2mhmz	.eJxVjDsOwjAQBe_iGlnyd9eU9JzBWq8dHECOFCdVxN1JpBTQvpl5m4i0LjWuvcxxzOIqlLj8bon4VdoB8pPaY5I8tWUekzwUedIu71Mu79vp_h1U6nWvbWDM5CCgL8kq9IhgjSblLBjPw2Adp2AwkVdeE0M2u4BYGCBoHcTnC8N9NuY:1sBbhO:vrozjS7kIYMesbTTlxsZlTr1o5IJ346pCqq469qQjyI	2024-06-10 14:51:42.585036+00
spyhp109c70emd38ynbh0oovmo7aqt4p	.eJxVjDsOwjAQBe_iGlnyd9eU9JzBWq8dHECOFCdVxN1JpBTQvpl5m4i0LjWuvcxxzOIqlLj8bon4VdoB8pPaY5I8tWUekzwUedIu71Mu79vp_h1U6nWvbWDM5CCgL8kq9IhgjSblLBjPw2Adp2AwkVdeE0M2u4BYGCBoHcTnC8N9NuY:1sBbhQ:U0FgKRj0XfL41JD4oi1qZ5L4c2g0PE7SLAG4gdpQb-w	2024-06-10 14:51:44.515182+00
t5xiei43hh0ara5pgw6f3vb5qi6wwyu7	.eJxVjkFvhCAYRP8K4WyIIAjssfeeelw35BNQ2bXQCCbdNP3vxcZDe33zZjJf2MBeFrNnv5ng8AVT3PxlI9iHj0fg7hDnRGyKZQsjORRyppm8JufXl9P9N7BAXmqba6scCKlV70dOVa-U5B0DKrjsejtNXNhRd2qEnvYMrHRdFZTyVkrNmK6jYG3aY_nd9rEEC8U7AwVfqKS6E0zQlnAqJJO6Xsg-55Ci8Z8fYXviS1vZe2Uw-1wPXa8DNuaeq3HSATeobRATDRrw225txdO-rk-Uwxy9QyEiyCiGR1qBHPaAB3y74e8fa_hpNQ:1sME87:_jHlbkJQ45u1V_lJ_Oa1sltMsnUy-NGKHgXjGpeGmn0	2024-07-09 21:55:11.584437+00
xnxmzp4i94p3t63s46qe4iitdnuvydwu	.eJxVjDsOwjAQBe_iGlnyd9eU9JzBWq8dHECOFCdVxN1JpBTQvpl5m4i0LjWuvcxxzOIqlLj8bon4VdoB8pPaY5I8tWUekzwUedIu71Mu79vp_h1U6nWvbWDM5CCgL8kq9IhgjSblLBjPw2Adp2AwkVdeE0M2u4BYGCBoHcTnC8N9NuY:1sBfmV:uzu5zPHNB-0UjlUj0ZZOWX06aPguYC-9f4zSxO5b0q4	2024-06-10 19:13:15.198014+00
niz6uoywatihqr8twlt8ccqoj0itlu8x	eyJfbWVzc2FnZXMiOiJbW1wiX19qc29uX21lc3NhZ2VcIiwgMCwgMjUsIFwiWW91IGhhdmUgc2lnbmVkIG91dC5cIiwgXCJcIl1dIn0:1sP0Hx:ZuencJXGXidWKss7nDbrGJcINFGY7EF7hVNgNS2DM6I	2024-07-17 13:44:49.681138+00
80qbobwieeq9tuvpq7e87y6raueq7xes	.eJxVj0tuxCAQRO_COkJg82m8zH7OgJqmiZlxsGTj2US5e2xpsphtvaon1Y9AovVoPT55q6VyjvyNdRFTO5blQ0Q8-hyPnbdYs5hEEG9ZQnpwu0C-Y_taJa2tbzXJqyJfdJe3NfPy-eq-CWbc53M96gAFkyIuaUTrlIJMBBSI0eVg0HprDXoctNYJsi5kCgIhBHRg7Cn9_3G5ufVK2M8z2MWkvQbjjQMlnR-8cvD7BwZ9Ujw:1sIXlY:5RG6rq3xIYHQBfAxvYRHuZ-OqbCWBbq5is-jXLlA4Ck	2024-06-29 18:04:40.674227+00
aez3c8m4sg01jijabsd84vvsta25xpd8	.eJxVjs1uhCAYRV-FsDZEEPmZZfdddTlOyCegMmOhEUw6afruxcZFuz333Jv7hQ3sZTF79psJDl8wxc1fNoJ9-HgE7g5xTsSmWLYwkkMhZ5rJa3J-fTndfwML5KW2ubbKQS-1En7kVAmlJO8Y0J7LTthp4r0ddadGEFQwsNJ1VVDKWyk1Y7qOgrVpj-V328cSLBTvDBR8oZJqqlTLNKFSMMXrg-xzDika__kRtie-tJW9Vwazz_XP9TpgY-65GicdcIPaBrG-QQN-262teNrX9YlymKN3KEQEGcXwSCuQwx7wgG83_P0DFVppCg:1sLXLB:ilgJ6dTH78wIJVHsZp-XsviiJoUvAhh3_ou6tcYkUi4	2024-07-08 00:13:49.309669+00
evrhij3z7iwiz473818l2trrkl1h9sr1	.eJxVjsFuhCAURX-FsDZEEARm2X1XXY4T8gRUZiw0gkknTf-92Lhot-eed_K-sIG9LGbPfjPB4QumuPnLRrAPH4_B3SHOidgUyxZGcijkXDN5Tc6vL6f7L7BAXuo111Y5EFKr3o-cql4pyTsGVHDZ9XaauLCj7tQIPe0ZWOm6KijlrZSaMV2jYG3aY_lt-1iCheKdgYIvVNagoJQqwjvdClY_yD7nkKLxnx9he-JLW9l7ZTD7XP-5XgdszD1X46QDblDbICYaNOC33dqKp31dnyiHOXqHQkSQUQyPtAI57AEP-HbD3z8P6Wj-:1sJHfK:6JeAKQBhi_pv-BIb2GZiu2v1wcaIkBNEXb3yP-Yj4tc	2024-07-01 19:05:18.571159+00
gf98uaeqmg1q92ikupk5i1zz37of8zv9	.eJxVjs1uhCAYRV-FsDZEfhSYZfdddTlOyCegMmOhEUw6afruxcZFuz333Jv7hQ3sZTF79psJDl8wxc1fNoJ9-HgE7g5xTsSmWLYwkkMhZ5rJa3J-fTndfwML5KW2hbbKQSe16v0oqOqVkoIzoJ2QvLfTJDo7aq5G6GnPwErHq6CUt1JqxnQdBWvTHsvvto8lWCjeGSj4QiVrKWdUM6IE7yhV9UL2OYcUjf_8CNsTX9rK3iuD2ed66HodsDH3XI2TDrhBbYNY16ABv-3WVjzt6_pEOczROxQigoxieKQVyGEPeMC3G_7-AWbTaSo:1sPUxd:AAYR5efocm19a0GSQsIxc2zjAuQvOY3u5oqnwUBB9fQ	2024-07-18 22:29:53.994862+00
agom05vaiucb7f1ys1gyekucw1zikmho	.eJxVjsFuwyAQRP-Fc4SKF7PgY-_5BrQsm5i2gshgKVXVf69T5dBeZ948zZeKtI817l22WLJalFGnv1kifpf6KPIb1WvT3OrYStIPRD_brs8ty8frk_0nWKmvx9oG9plmDN5JssY779HCRGa2CI4vFztzCuATOeMmYsxwAN4LI4ZpCoeUmNtex69b6ihMQ3KkoRaDBmdAsKBtAAghHBe69F5ajXK_le1TLS_fP8QRTGU:1sEbvD:Dpy-3C6rZPyTON-VCyUaqJCqQeLjSeILBWfjVYR7t7U	2024-06-18 21:42:23.496446+00
36qbdzbmxch29j0bk94zxco8m809zst5	.eJxVjstOBCEQRf-FtSHyLnrp3m8gRVFjowYmDZ1ojP8uY2ahd1n31Mn9EgnPuadz8JFqEZtQ4uHvLSO9cbsV5RXbS5fU2zxqljdE3tshn3vh96c7-0-w49jXt40EBV2I4DlbBR4gWKNRORuMp8vFOsrRQEavvEYKxSwAgCmEqHVcUiTqZ5u_bm6zEk4uCafYVFDBwYqRziiwoNeEwWPU3hJ_XOvxKbbH7x_Ekkxl:1sEpKV:ZM3K81jxCaHEQgD92sUJrjbFo-eCTnE5XbZfxDhtPf8	2024-06-19 12:01:23.533566+00
1kcq475t6ey17qt1li5m583psp2cal3d	.eJxVkLFuhDAQRH_F2hohGzAYqih1UqU8TtZiL-ALGAnjSKco_x4j3RXXvpmd3dlfQGO26A_9Q7sbHVlNK7oFOh-XJQON8Zh1DLRrZ6EDIeAFDmi-yZ-KvaGfttxs_tjdkJ-W_KGG_HOztLw_vC8BM4Y5TauhlY2qSlFKUkJaURaWj4pswRNFya1Vomp5XcpK0WhqTjXnQ2WFbYeBVAp9FjmzyR_O4JHa4AGdaIRSgheqznlbNW1TpRNWCgEnCmn55dKD1rew-SftIWM8Y4XMWA9f0ZiEx_SQOwtu8mSZ8wwD-8C449sd5-0svubnWA89XK_w9w_bTXEN:1sJx4Y:b2SZvrF-oY3kywhW161h1ipaoscyAY3Hu1rUlqin_18	2024-07-03 15:18:06.096909+00
wtaazmya5eles48c4s91evu5alo6uw53	.eJxVjktuAyEQRO_C2kLm2zDL7H0G1DRtD0kE1sBIiaLcPePIi2Rb9eqpvkTCfa5pH7ylWsQilDj9zTLSG7dHUV6x3bqk3uZWs3wg8tkOeemF31-e7D_BimM91jZSKOggBs_ZquBDAGs0KmfBeLperaMcTcjolddIUMwBhMAEELWOhxSJ-t7mr5vbrISTS8IpFgUKfHDgtTwb6xQcDwaPUXtL_HGv26dYzt8_ejhMJA:1sFEX4:6R33UF8UW2EYo4mFEGVB5ybASWie_HrbYFlmzCZrB8s	2024-06-20 14:56:02.204412+00
x8led2r0vor49258ms5t4pq2ld21heoe	eyJfbWVzc2FnZXMiOiJbW1wiX19qc29uX21lc3NhZ2VcIiwgMCwgMjUsIFwiWW91IGhhdmUgc2lnbmVkIG91dC5cIiwgXCJcIl1dIn0:1sKCo9:x0iq2dj4zGwoN54GTw2Wwy4ayagz3x_qDL6cQLcxDeI	2024-07-04 08:06:13.319884+00
5ptshgsj26k5mogcgqole8bjvqtwobtr	.eJxVjsFuwyAQRP-Fc4SCweziY-_5BrQsm5i2gshgqVXVf69T5dBeZ948zZeKtI817l22WLJalFGnv1kifpP6KPIr1VvT3OrYStIPRD_bri8ty_vLk_0nWKmvx9oFxkwzBPSSnEGPCM5OZGYH1vP16mZOwWIib_xEDNkeAKIwQJimcEiJue11_LqljsI0JEcaajFgAJ0J7qydnRE8Hhe69F5ajfJxL9unWs7fP8PATGE:1sFtA4:ETNQXBo9O-mtguI00UtjZZPdApZMsefXfZBXzZK7MWI	2024-06-22 10:19:00.58253+00
kc5f963tashbis0kj25u2qcp9jklv3wa	.eJxVjktuAyEQRO_COkLugeEzS-9zBtQ07Qy2BdHASIks393Y8iJZVtfrp7qJgHtfw954CzmJRYD4-HuLSBcuzyKdsXxVSbX0LUf5ROS7bfKzJr4e3-w_wYptHd_ak0s4W-8MRw3OOGe1mhBmbZWh00nPFL1yEQ2YCckmNQDnmKz10-SHFInqXvrLzaVnws4pYBcLWBiQ917JA4wAMCY0bi3XEvjnO2-_YjncH8LYTFM:1sGG4H:SYBsdXOWLVFdpDsN3JShLGd3ePdP3CvzgjztDsSnCI4	2024-06-23 10:46:33.156224+00
ip6yfigut98v4otgg5z3zmg4sxkcb8m3	.eJx9kLtuwyAYhV8FMVsoYBuwx-6dOlVxhH4DtklcqAxUjaq-e3GVqMrS9Vw-HZ0vrN5sjDDbiHt8PA5YqXMM_q4OuEKHCrG2QgN-DRkt8GFRdLO3BoWcyB4Y8IBPFfq__JK1LvKU1_V6BziPICLvLmGFP9IJV1hBTovK0W7KmbKMPmoj6Iv1u2HO4OdAdPBpcyPZI-TmRvIcjF2fbtkHwAJxKe2m09JAKzrJ7dhQyaUUTc2Ato2ouZ6mptVjV8sROOUMtDB1CUhptRAdY12BgtYh-_TLtj45DckaBQn3VNCCozWnhHPZcibKhFg-cOUi-_nutivuD98_MCx7_w:1sKCxd:5FqndZxbwroxuq6tE6-jpqhChvH8JxDeQlJJOuzV22A	2024-07-04 08:16:01.801186+00
1tsftnf5fbfow3a7lw3d1exsmb15i0ae	.eJxVjktOxDAQRO_iNbLifztL9pzBard7iAHZKHYk0GjuTgbNArZVr57qKhIec0vH4D3VIlahxNPfLCO9c7sX5Q3ba5fU29xrlndEPtohX3rhj-cH-0-w4djOtY0EBV2I4DlbBR4gWKNRORuMp8vFOsrRQEavvEYKxZwAAFMIUet4SpGoH23-urnNSji5JJxiVUHBYpzTizRm0VrZ88LgMWpvib8-6_4t1uX2A7_5TD0:1sGhWK:cJh07w076rAfwsCEQkgpawluWLfD-zlWlo83_O-qA5E	2024-06-24 16:05:20.480569+00
zq3bk4lgohlp60oy90v72pokwuluur2g	.eJxVjsFOBCEQRP-FsyHbwEAzR-9-A2maXgc1YAYm0Rj_3VmzB71WvXqpL5XomFs6huypFrUqUA9_s0z8Ku1WlBdqz11zb3OvWd8QfW-HfupF3h7v7D_BRmM71y4yFlpCRC_ZAXrE4KwhWFywnq9Xt3COFjN58IY4FHsCiMIhRGPiKSXmfrT565Y2K9OUkmiqFQIgXFzwXiMYY-F8MGSM2luSj_e6f6r18v0DeNFMGA:1sGzXC:nD104j4Qw6t7tW3qogLBEh0Gw1K3pJRFomt8iB8q4cI	2024-06-25 11:19:26.953281+00
ftgkuk7ze2k5hg1lxaduq0f0is3s3fko	.eJxVjksOAiEQRO_C2hD5DJ9ZuvcMpGlaBzVgBibRGO_uaFzoturVSz1YgKVPYWk0h5zYyATb_GYR8EzlXaQTlGPlWEufc-RvhH_bxvc10WX3Zf8EE7RpXWuPLsFgvTMUtXDGOauVBDFoqwweDnrA6JWLYISRgDapFXCO0FovpV-lgFiX0j9uKj0jdEoBOhuFFV4oLY3mg9VeivVBo9ZyLYFu1zzf2bh9vgB5kEwg:1sLJpU:_M7xXjfKU83_qP1T6qFfTWdx4odaKoZGP2EyI_bSU3Q	2024-07-07 09:48:12.808541+00
i5lajvixlbp93sc3k130snmsoql91spq	.eJxVjMsOwiAQRf-FtSGFymNcuu83kIEZpGogKe3K-O_apAvd3nPOfYmA21rC1nkJM4mLUOL0u0VMD647oDvWW5Op1XWZo9wVedAup0b8vB7u30HBXr41ep3PkCPbnAkZTGKvPCoEcN6MFnRi5eMQjcOBwIEGGhWOzpJ2ho14fwD_vjf3:1sfzaa:Dh-6e1L7Nyo3OHzng7-wMXURk_LbU1gFS7rT8NSfA1o	2024-09-02 10:26:16.918618+00
xcf1bbszs02rtkqzmjx96lviks7x7on6	.eJxVjs1uwyAQhN-Fc4XMj2Hxsfc8A1qWTU1bQWSw1CrKu9epckiuM998mquIuI817p23WLJYhBJvz1lC-uJ6L_In1o8mqdWxlSTviHy0XZ5a5u_3B_siWLGvx9oGgoyzD-A4WQUOwFujUc3WG0fns50pBQMJnXIayWdzAABM3getwyFForbX8e_mOgrh4BxxiEV5FRTAZJS0blLB6-NC595Lq5F_LmX7Fct0-wPCRExS:1sLXQT:DVogUKbenjVFBYj-pigw_8pHMHwednXdyInK4JyNXHw	2024-07-08 00:19:17.686235+00
broqycodt2gf3zlv38g6w5nf2pmke7af	.eJxVjstuwyAURH8FsbYQ2OTGzrL7rrqMI8TjYpO4UBksNar678WVF-32zJnRfFGltzKrLeOqgqMXKmjzlxltHxj3wN11nBKzKZY1GLYr7Egze00Ol5fD_Tcw6zzXNufGdyA0oOfopHP92YF1JzN0rela0J7bAQENiFYO0gzceeAgfWdQWL-PamvTFsvvNsYSrC7olC70Is4tCADBgUnR9z3IeiFjziFFhZ8fYX3SC6_svTI9Ya6HrteRKnXP1TjoSBvCG9KeGjLSt83aiv22LE-SwxTRkRCJziSGR1o02-2RjvR2o98_xGVrDw:1sooep:szaP0NrN3ERtdETAZ7enmiKPcYRPj7yooKEOypDCD4Y	2024-09-26 18:35:07.643029+00
z2qjekscl6wzil1bscoi0tdgxpgs9e8p	.eJxVjrtuhDAURH_FujWyjAETKLdPlXJZWX5cg3eJHWEjZRXl32MiiqQ9c2Y0XyDVnhe5J9yktzBCDdVfppV5YDgCe1dhjtTEkDev6aHQM030NVpcL6f7b2BRaSltxrRrRK0EOoa2tfalt8LYTg8N1w0XyjEzoEAtat4OrR6YdYKJ1jUaa-OOUWVM3EP-3caQvVEZrVQZxrpvOGeC8YF2om-7rjxImJKPQeLnh9-eMLLC3gtTM6by53qdQMp7KsZJJ6gIqwjvKjLB225MwW5f1ydJfg5oiQ9EJRL8I66KHvYEE9xu8P0DZFxq1A:1tE9uw:nEQoyAOqdwhM2Wmp6L13yGT7MSBZOoA0VRuKBaL3oh8	2024-12-05 16:20:30.741099+00
0k8bwc8nu6zo0026zmx9wz73qsia576l	.eJytkLtOwzAUhl_FeI6i3Bw7GbuzwISayjpxThO3qY1iu1Ah3h0HtRJdEAPrf_l0_vNB5QmdgxEdbel221EpD86am9rRhGQJKVhCOvpiA5ngjMTp0eBAbPDpGuhoR3cJ-b38HJSK8j7M8-UG0IaAI0Yf7Qx_Jz3hWeMbcaE_ae8jxv1AP_w3ZkcTKiH4SQaHi9RD_FN-r_WgjmhWYziAGW2qrPGL7tM1kl5dlz7aAefNNXsHmMBNsV01SgzAeCNq7Ktc1ELwqiwgZxUva7XfV0z1TSl6qPO6AMWHMgaEQMV5UxRNhIJSNhj_zUbjtYK4TIKnbc7zJjJFxlJWi7JkLJ7g4l4d_4Pvr3q50Db7_ALqPKqD:1sOIK4:Gm0btz5n8g4sZpIjraL_V78egb1yB3IzIYvtnK2Ss5Q	2024-07-15 14:48:04.324177+00
v24jfteskbe09kcchrd5eqd11svt1aig	.eJxVjMsOwiAQRf-FtSGFymNcuu83kIEZpGogKe3K-O_apAvd3nPOfYmA21rC1nkJM4mLUOL0u0VMD647oDvWW5Op1XWZo9wVedAup0b8vB7u30HBXr41ep3PkCPbnAkZTGKvPCoEcN6MFnRi5eMQjcOBwIEGGhWOzpJ2ho14fwD_vjf3:1sfzVP:C2TjA6LvqWEkF-_bmBsGKL1HQmBiMyrqFGkZkdM-78M	2024-09-02 10:20:55.69309+00
g4xess6s0mg4bcs48lc6jazo737dko51	.eJxVjsFuhCAURX-FvLUhgigwy-676nKckCegMmOhEU06afrvxcZFuz333Jv7BQb3bTZ79qsJDi7AoPrLBrQPH4_A3TFOidoUtzUM9FDomWb6mpxfXk7338CMeS5toa1y2EqtOj8IpjqlpGg4slbIprPjKFo76EYN2LGOo5WuKYJS3kqpOddlFK1Ne9x-t33cgsXNO4MbXJhkWohaMU4bzrRWrFzIPueQovGfH2F9wqUu7L0wnHwuh67XHoy552KctIeK1BXhbUV6eNutLXjcl-VJcpiidyREgpnE8EgL0sPuoYfbDb5_AGyEaTY:1sMb6L:DO7sW1oQgmijBj-CJqivs7hSNrkQmsGkeJa3MxD_o-U	2024-07-10 22:26:53.499784+00
dyzluiibiitsw8vsi8v4q7xjmh8o7pgy	.eJzNkL1OwzAUhV_FeI6iOIljp2N3FphQU1k3zm3jNrVRbBcqxLvjoFaiC2JkPT-f7rkfVJ3Qe9ijpyu62XRUqYN39qZ2NCNFRkqekY6-uEhGOCPxZm9xIC6GfAl0tKPbjPxefo5aJ3kXp-lyAxhLwBNrjm6Cv5Oe8GzwjfjYn0wICeN_oB_-KWZLM6oghlFFj7MyQ3o3u9d60Ee0izEcwO5drp0Ns-nzJZJfXZ8_ugGn9TV7BxjBj6ldt1oOwEUrG-xrJhspRV2VwHgtqkbvdjXXfVvJHhrWlKDFUKWAlKiFaMuyTVDQ2kUbvtlog9GQlikIdMVEWbCqEFWRCya54Dyd4NNek_6D769mvtBV8fkF83jBtg:1sPUlT:vMHv6cDm-9mzNJsuDewrSo4BX-zxKhGDBx5CAadoCfc	2024-07-18 22:17:19.629237+00
7gp0wiyi690z2oogyf112lwc0g9kbsvq	.eJxVjstuwyAQRX8FzdpCYGxSssy-qy7jCPEYbBIXKmNLjar-e3HlRSvN6txzr-YLtNnWSW8FFx09nIFD85dZ4x6Y9sDfTRozdTmtS7R0V-iRFvqaPc6Xw_03MJky1TZjNgjJjcTA0Hfev5y8dL63SrRWtNIE5hRKtJK3neqsYj5IJrsgLHIX9lHjXN7S-ruNaY3OrOi1WeHMT0IIpXiraK3U6-sLBUuJOWn8_IjLE86ssvfKzIilPnS9DqD1vVTjoAM0hDWk7RsywNvmXMVhm-cnKXFM6ElMxBSS4iPPhu72AAPcbvD9A8NZaww:1tJAIU:nxwfW5HJOAjds368twqTII6BzG1tqJhqds-AYWDqMEM	2024-12-19 11:45:30.263146+00
82f8krku0mznphx50pq3pezx2pabeabh	.eJxVjkFuAyEQBP_C2UKBBQb2mLvfgIZh7CWJwFpYyVGUvwdHPiTX7upSf4mIx9ji0XmPJYtVKHH6myWkd66PIr9hvTZJrY69JPlA5LPt8twyf7w-2X-CDfs21yaQz2gheMfJKO-8B7NoVNbA4uhyMZZSWHxCp5xGgrxMwHsmgKB1mFIkakcdv26uoxAOzhGHWBWoYHUwNkiAuVfzQefeS6uR77eyf4r15fsHe0xMLg:1sMyUq:XtveU1VUD3_W1qSlupNYg0sCO9pCetQs38zjFT2OAWc	2024-07-11 23:25:44.336381+00
mmozre29nmurpv2snh8jr180oytl1bq0	eyJfbWVzc2FnZXMiOiJbW1wiX19qc29uX21lc3NhZ2VcIiwgMCwgMjUsIFwiWW91IGhhdmUgc2lnbmVkIG91dC5cIiwgXCJcIl1dIn0:1sPdyP:WCave1uHWpdAhgA7RfVF6-t2Hv0uK38YDfU__TdZgDI	2024-07-19 08:07:17.769622+00
ef31j9j3uewfnehmf1wrirksal5h97hj	.eJxVjs1uhCAYRV-FsDZEQPmZZfdddTlOyCegMmOhEUw6afruxcZFuz333Jv7hQ3sZTF79psJDl8wxc1fNoJ9-HgE7g5xTsSmWLYwkkMhZ5rJa3J-fTndfwML5KW2O22Vg15qJfzYUSWUkh1nQPtOcmGnqevtqLkaQVDBwErHq6CUt1JqxnQdBWvTHsvvto8lWCjeGSj4QiWjjGslBdFty1rO6oXscw4pGv_5EbYnvrSVvVcGs8_10PU6YGPuuRonHXCD2gaxvkEDftutrXja1_WJcpijdyhEBBnF8EgrkMMe8IBvN_z9A2koaS4:1sU97W:qz5L3pXh0fQQBikQM5hGeCkahI_z8jYQPpczZTauea8	2024-07-31 18:11:18.065237+00
p8noxeds4l6sp2d6d8xgfocxer0fxksg	.eJxVjs1uhCAYRV-FsDZEEPmZZfdddTlOyCegMmOhEUw6afruxcZFuz333Jv7hQ3sZTF79psJDl8wxc1fNoJ9-HgE7g5xTsSmWLYwkkMhZ5rJa3J-fTndfwML5KW2ubbKQS-1En7kVAmlJO8Y0J7LTthp4r0ddadGEFQwsNJ1VVDKWyk1Y7qOgrVpj-V328cSLBTvDBR8oZJRRXmrOOGi10ypeiH7nEOKxn9-hO2JL21l75XB7HM9dL0O2Jh7rsZJB9ygtkGsb9CA33ZrK572dX2iHOboHQoRQUYxPNIK5LAHPODbDX__AG_yaT4:1sWYUv:rcHIm_8WpTs3acr_MPDTfqty64ULIa8iNZP63RIsPIA	2024-08-07 09:41:25.654074+00
4qm0c2dqq2xq16hawz0lipl18bh9hik4	.eJxVjrtuxCAURH8F3dpCBj-ALdOnSrleoWvANrsORAZLWUX59-DIRdKeOTOaL9C450XvyW3aW7gAg-ovG9E8XDgCe8cwR2piyJsf6aHQM030NVq3vpzuv4EF01LarTLSYieU7N3YMtlLKdqGI-ta0fRmmtrOjKqRI_as52iEbYogpTNCKM5VGUVj4h7y77YL2RvMzmrMcGGCc9lJrhpaC65YLcuF5FLyMWj3-eG3J1zqwt4Lw9mlcuh6HUDreyrGSQeoSF0R3lVkgLfdmIKnfV2fJPk5OEt8IJhI8I-4Ij3sAQa43eD7B26MaTo:1saw90:uYZZf4sopcChFUxsfe-ZiwzJiEUDeMA1l4STT2JBi0U	2024-08-19 11:44:54.222787+00
p9ljjapej3k43w43fuh9pgwtd4xzolp5	eyJfbWVzc2FnZXMiOiJbW1wiX19qc29uX21lc3NhZ2VcIiwgMCwgMjUsIFwiWW91IGhhdmUgc2lnbmVkIG91dC5cIiwgXCJcIl1dIn0:1sP7fG:1bmIutSSnHVeIUHyZ3egLw5PDBQ3qSBcWIzweoFAdvU	2024-07-17 21:37:22.979051+00
ju924fyzr2l46ot9k5011qf5ja61aabi	.eJyNkMtuwjAQRX_F9TqKEifxgyX7btpVRZA1cQZiCHaFbVpU9d9rKqjKpur2Po7mzgfVBwwBthjogq5WPdV6F7y7qT0tSFUQ1hWkpy8-kQlOSILdOhyJT7G8BHra03VB_i4_J2OyvEnzfL4BrCMQiLN7P8P_SU94svhGQhoONsaMCb_QDz-YNS2ohhQnnQIetR3zwPpeG8Ds0V2McQdu60vjXTzaobxEyqsbykc_4ry8Zu8AE4Qpt1tl5AidUJLj0NaSSynahkHdtaLhZrNpOzOoRg7Aa87AiLHJASnRCKEYUxkKxvjk4jcbXbQG8jINkS5qUSvWMlnxsuJKCtnkE0Lea_N_8P3VHs90UX1-AVLfk0E:1sLmA5:ug1zC3-IoUpGDaOdc9nBpBzu40TW0NA3aotxCcKUsuo	2024-07-08 16:03:21.860518+00
nx0f22oeof4277mm2fo7amfrn7qmon52	.eJyNkL1OwzAUhV_FeI6ixE7ipCM7C0yoqaxr-zZxaW0U24UK8e64qEV0Qazn59M994PKA4YAEwa6ouv1SKXcBe-u6kgLUhWEtQUZ6bNPZIYjkmAnh4b4FMtzYKQj3RTk7_JT0jrL27Tfn64A6wgEMqeA_-c84tHiGwlJHWyMGRJ-ge9-MBtaUAkpzjLTF2lNnsf5rahAv6A7O2YHbvKl9i4uVpXnSHlxQ_ngDe7vL9kbwAxhzm1seCMEmKbljFWm7s0gOm5wa9TQqQpNA4qJukeBxvRD3fUtqsZUdVVzBa3KUNDaJxe_2eii1ZCnSYh0VQs2MMGE6Muh4bmbLwh5r83_wfdXu5zoqvr8Ak1Ek5c:1t1qrT:Dm4AtcZDlCCcxsHPA8D0-L2RiMBjGjFIffHYp0t6o54	2024-11-01 17:34:03.330755+00
f92gbcxgmen5e722foojs740mb1m787g	.eJx9kM1uwyAQhF8FcbYs_IdjH3vvqacqjtACi03iQmWgalT13YurRFUuva1mZz6N5ouKNwwBZgx0pMfjRIU4B-_u6kQLwgpSdwWZ6KtPZIEPJMHODjXxKZa7YaITPRXk__BLUirLJq3r9Q6wjkAgzl78Cn-kEy2ogBQXkQJuwurcrHrUJKgLuv2hz-BmXyrv4mZluVvK2zeUz17j-nTzPgAWCEtOMyZNwyvgaBjqVutDr7nSnRyaWjY1B8PUgBwlr-p2aOXAtOGMt6aRWCmzQ0Epn1z8ZaOLVkFELSDSseqbuj90rO7LfDVd1eUKIW9g80T4-W63Kx3Z9w_hj33E:1tGaXc:ZD9wUIxHZu1JKm1PH7evtTx-LUmKhMyz1dbcC-7otkc	2024-12-12 09:10:28.910394+00
fyl0dku6coyirvb12m5kdaz79y4x9v21	.eJxVjDsOwjAQBe_iGlnyd9eU9JzBWq8dHECOFCdVxN1JpBTQvpl5m4i0LjWuvcxxzOIqlLj8bon4VdoB8pPaY5I8tWUekzwUedIu71Mu79vp_h1U6nWvbWDM5CCgL8kq9IhgjSblLBjPw2Adp2AwkVdeE0M2u4BYGCBoHcTnC8N9NuY:1scNMh:VpmwbnKBeDo675wemO6ye-MS2XxvbI8L-GpUykPfs-Y	2024-08-23 11:00:59.716727+00
7yqrvdfzezqvrinqbiekpv3ao0lny5jn	.eJyNkM1OwzAQhF_F-BxFcfyTpMfeuQAX1FTWxtk0Lq2NartQId4dF7WIXhB7nJ35tLMfVO8xBNhgoAu6WvVU623w7qr2tCBVQWpZkJ4--0RmOCIJduNwJD7F8mzoaU_XBfk7_JiMyfKUdrvTFWAdgUACTPj0f9ADHi2-kZCGvY0xU8Iv8t0PZk0LqiHFWaeAB23H3I-LW3EA84LuvBm34Da-NN7Fgx3Ks6W8bEN570fcLS_eG8AMYc7pphrMCNAJpQxKUXE1ITaiG9AwLqFjzBg1TYKNtWKjEl0lZY0dcMM7VUOboWCMTy5-s9FFayBX0xDpgjU8j5RtWzLZNkzwfELIhW1-EL6_2sOJLqrPL18Ik9Q:1tItmS:Diasj2jYk89NO7MQX9YkMfZ7-1tmpkUN_Am_wUvh6Wc	2024-12-18 18:07:20.268681+00
cbne36uqnccmpnwn1ffghvnquh9m0o12	.eJx9kLtuwyAYhV8FMVvIxjaXjN07dariCP0GbJO4UBmoGlV99-IqUZWl67l8OjpfWL3ZGGG2ER_w8Thgpc4x-Ls64ArVFaJ9hQb8GjJa4MOi6GZvDQo5kT0w4AGfKvR_-SVrXeQpr-v1DnAeQUTeXcIKf6QTrrCCnBaVo92UM2VZ86iNoC_W74Y5g58D0cGnzY1kj5CbG8lzMHZ9umUfAAvEpbQ7qYWBnkvB7Ng1ggnBu5ZC03e8ZXqaul6PshUjsIZR0Ny0JSCE1ZxLSmWBgtYh-_TLtj45DckaBQkfGt5IymvZUyJE23HWlgmxfODKRfbz3W1XfKi_fwAwC3v-:1sLsuf:Rmmfquk7ZqH5qYF6vAF57ycn-XQGrhHGZ7efZH71Vf0	2024-07-08 23:15:53.017985+00
k041s83x9rresntajm7xcc3sp7690w2n	.eJztlj9vwyAQxb8KZbYs_wdn7N6lnao4ss6YOCQ2WAbSRlW_ey9VIiVLlaFDo3o93v3eO0CCD1oP0lropKULulxWtK631uhztaIBiQKS5AGp6KvxZAN7SazqtGyJ8S48Cipa0VVAfm5-8UJgee37_nAGKE3AEq12pofbSRhjIsIMg9QO81jSSKmJ9c2gnEMqaCRbMkrdKt0RGMfJ7KG_3eBZ7pV8uyDai-wPfyfnbDAbzAazwWxwFwa_9Kz8Z8yKBrQG7za1t3KqVYuflvi61oDY4RHhQrsF3ZlQGO0m1YRHSXhateGTaWX_eNJeAfDoN9idlYK3kLOSF7LJYl5wzrI0gTjPWFqI9TrLRVOmvIEiLhIQrE1RwLkUjJVJUiIUhDBeu282XiolACerwdFFzOIyTVHGQxZHUZHmGMHivAr3R76PajrQRfT5BS1BLK8:1sMDRR:EI3LEo5wPFejNeONNNqpGnyQKoo_lf1eNESSV3JtOJQ	2024-07-09 21:11:05.030314+00
k5jb3kobocg7gxifmvj761erzcpnrsw5	.eJx9kLtuwyAYhV8FMVvI2NhAxu6dOlVxhH4DtklcqAxUjaq-e3GVqMrS9Vw-HZ0vrN5sjDDbiA_4eBywUucY_F0dcIXqCjVdhQb8GjJa4MOi6GZvDQo5kT0w4AGfKvR_-SVrXeQpr-v1DnAeQUTeXcIKf6QTrrCCnBaVo92UM2UZfdRG0Bfrd8Ocwc-B6ODT5kayR8jNjeQ5GLs-3bIPgAXiUtpMamGg41L0dmRU9EJw1jZAO8bbXk8T6_QoWzFCT_sGNDdtCQhhNeeyaWSBgtYh-_TLtj45DckaBQkfKKeSMcrqmrSi7oWUZUIsH7hykf18d9sVH-rvHy7Oe_Y:1sMbFp:FWBj4TJK_exVnW-DjByTee_xlrAnPqmU2MCZ831p9Yg	2024-07-10 22:36:41.552566+00
8buo24gpcjh2ac4gzraqu118275jnkxp	.eJx9jstuwyAQRX-FsrZQjG0wWXbfTbuMIzTAOMZxsBSgVVX134ur9LXpbnQfZ-4b1ZDTpHPEq_aO7ilvaPVbNGDPGDbHzRBOK7NrSFdv2BZhNzeyh9Xhcn_L_gFMEKfSRmuatgeBVrWct52SoOwoQI0orHQIgu9GWddc9KobZSuaxhgOpjcNmh5FgYK1aw7pk40heQsJnYZE97WslSpI3jFRS6lkXSZcMEY4YSzPD4eBaj3HNXypA63IriK8q8hAn7K1RR7zsryS6E8BHfGBQCQQZmBbdqADPVbkf84jPnt8ITGbi09lW7l-wHffmCN9_wBHxXoH:1sOm8l:ObXMkvz6ZFBZEnP-4w-SrEiOgkl6jQGsr7SK1JqWDeE	2024-07-16 22:38:23.414473+00
4cykzikj4jn76qpy6k9klho3r5hf4hgx	.eJx9kLFuwyAURX8FMVsWYBtwxu6dOlVxhJ4B2yQuVAaqRlX_vbhKVGXpet95R1f3C6s3GyPMNuIDPh4HrNQ5Bn9PB1whUiHWVWjAryGjBT4sim721qCQU70DAx7wqUL_P79krUs85XW93gXOI4jIu0tY4c90whVWkNOicrSbcqY0o4_ZCPpi_X4wZ_BzqHXwaXNjvSP17Rrr52Ds-nRjHwQLxKV8t72WBjrRS27HlkoupWgbBrRrRcP1NLWdHvtGjsApZ6CFaQogpdVC9Iz1RQpah-zTr9v65DQkaxQkfKCCEUJoR0UtJWOcd6VCLBu4MpH9fHfbtUCM9JyQ7x8XW30b:1sOwxz:ywnTAKAYsQZzBaPX16Ym6TMVpy19bZiJk7QwMX7sr20	2024-07-17 10:11:59.048963+00
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Data for Name: django_summernote_attachment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_summernote_attachment (id, name, file, uploaded) FROM stdin;
\.


--
-- Data for Name: home_message; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.home_message (id, content, "timestamp", user_id) FROM stdin;
23	Your reservation from July 03, 2024 to July 04, 2024 has been approved.	2024-07-03 16:00:56.703872+00	24
31	Your reservation from October 19, 2024 to October 24, 2024 has been approved.	2024-10-18 17:32:22.995923+00	33
33	Your reservation from December 04, 2024 to December 07, 2024 has been approved.	2024-12-05 11:48:30.142286+00	34
34	Your reservation from 2024-12-04 to 2024-12-14 has been rejected.	2024-12-05 11:48:35.796596+00	34
\.


--
-- Data for Name: reviews_comment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_comment (id, text, created_at, review_id, user_id, status) FROM stdin;
93	Fine it was, right?	2024-07-01 14:50:51.095887+00	76	1	approved
94	Let's try this.	2024-07-02 08:36:30.042573+00	78	1	rejected
57	penfindddsd	2024-06-25 15:23:45.853396+00	59	1	approved
95	Akaskas	2024-07-02 14:36:40.652693+00	78	1	rejected
96	Have nice day.	2024-07-02 15:51:17.066109+00	78	1	approved
13	What happened in here?	2024-06-06 11:51:56.227502+00	19	1	approved
14	akjnsdksajncsakjncs	2024-06-06 11:55:14.529751+00	19	1	approved
97	My recent stay at Wantit Hotel was nothing short of exceptional. From the moment I arrived, I was greeted with warmth and professionalism. The check-in process was swift, and the front desk staff was attentive, providing me with all the necessary information about the hotel amenities and local attractions.\r\n\r\nThe room at Wantit Hotel was a sanctuary of comfort and style. It was elegantly furnished with modern decor and equipped with all the conveniences a traveler could desire. The bed was plush and inviting, ensuring a restful sleep every night. The panoramic view from the room was breathtaking, overlooking the city skyline and offering a glimpse of the nearby mountains.\r\n\r\nThe bathroom was spacious and well-appointed, featuring luxurious toiletries and a rain shower that was perfect for unwinding after a day of meetings. The room also had a work desk with ergonomic chair, high-speed internet access, and ample charging outlets, making it ideal for business travelers like myself.\r\n\r\nOne of the highlights of my stay was dining at Wantit Hotel's restaurant. The menu featured a delightful array of dishes that celebrated local flavors and international cuisine. I savored every bite of the chef's specialties, accompanied by a fine selection of wines recommended by the attentive waitstaff.\r\n\r\nThe hotel's facilities were impressive. I took advantage of the well-equipped fitness center, which offered state-of-the-art exercise machines and free weights. After my workout, I indulged in a relaxing session at the spa, where skilled therapists provided rejuvenating treatments that left me feeling refreshed and revitalized.\r\n\r\nWantit Hotel's location was ideal for both business and leisure travelers. It was centrally located, with easy access to corporate offices, shopping districts, and cultural attractions. I appreciated the convenience of being able to explore the city's landmarks and trendy neighborhoods within walking distance or a short drive from the hotel.\r\n\r\nThroughout my stay, the service at Wantit Hotel was impeccable. Every staff member I encountered was friendly, knowledgeable, and eager to assist with any request I had, whether it was arranging transportation, recommending local restaurants, or providing tips for sightseeing.\r\n\r\nOverall, my experience at Wantit Hotel exceeded my expectations in every way. It was a perfect blend of luxury, comfort, and convenience, making it an ideal choice for both short-term stays and extended visits. I highly recommend Wantit Hotel to anyone looking for a memorable and enjoyable stay in this vibrant city. I look forward to returning to Wantit Hotel on my next visit.	2024-07-04 22:32:29.531981+00	79	1	approved
98	It was really nice stay.	2024-11-28 08:57:41.97337+00	70	1	pending
99	You to sir.	2024-12-04 18:08:08.293564+00	78	34	pending
34	We are championes	2024-06-16 14:49:53.247654+00	24	1	approved
36	This is a pending comment	2024-06-17 08:32:44.434941+00	30	1	approved
54	How ia that possible	2024-06-24 21:14:47.785386+00	59	1	rejected
44	Fight was mad.	2024-06-20 08:50:58.99668+00	31	1	rejected
58	Mixology.	2024-06-25 17:25:57.780137+00	61	1	approved
15	asjdcnskdjcnskdvncs	2024-06-06 12:33:51.962994+00	19	1	approved
61	Likable	2024-06-25 18:27:50.388597+00	63	1	approved
62	Akosa	2024-06-25 18:36:22.647854+00	61	1	approved
63	KAJDSNKAJNSC	2024-06-25 18:37:44.515476+00	61	1	approved
59	It shoul b e.	2024-06-25 17:36:40.622512+00	57	1	rejected
64	WHAT IO STHIS	2024-06-25 18:40:47.638079+00	61	1	approved
80	ksancas	2024-06-25 19:25:57.87753+00	59	1	rejected
69	kaka	2024-06-25 18:58:50.772055+00	62	1	rejected
81	I realy like this.	2024-06-25 21:11:50.866248+00	67	1	approved
84	Akisa	2024-06-26 09:19:28.228939+00	70	1	rejected
83	Akisa	2024-06-26 09:18:40.102792+00	70	1	approved
\.


--
-- Data for Name: reviews_review; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews_review (id, rating, review, created_at, last_edited_at, user_id, status) FROM stdin;
77	5	Fine dinning place.	2024-06-30 11:14:14.001405+00	2024-07-02 08:22:04.825407+00	1	1
31	3	sdkvnjsdkvjsdkjvn ksvnskvjnskdvnsdkvnskvjnskdvnsdkvaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa	2024-06-17 15:11:51.145035+00	2024-06-21 00:39:28.938743+00	1	2
52	3	I had time of my life there.	2024-06-20 16:48:32.466172+00	2024-06-21 00:39:37.161541+00	1	2
51	5	crazy good	2024-06-20 14:49:25.967468+00	2024-06-21 00:39:45.04029+00	1	2
50	5	Alabala	2024-06-19 13:05:09.086516+00	2024-06-21 00:39:52.319816+00	1	2
49	5	Bitno je dip	2024-06-18 16:39:04.881161+00	2024-06-21 00:40:01.936562+00	1	2
47	5	FIne was all	2024-06-18 13:19:22.708117+00	2024-06-21 00:40:09.146984+00	1	2
70	5	Fantasy	2024-06-25 20:12:13.411518+00	2024-06-28 09:00:33.128434+00	1	1
46	2	sdkmfslkvmcsd aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa	2024-06-18 13:18:12.385313+00	2024-06-21 10:56:22.971278+00	1	2
39	2	dddddddddddddd	2024-06-17 15:45:07.055147+00	2024-06-21 10:56:56.144875+00	1	2
66	3	Marvelous.	2024-06-25 19:49:22.991557+00	2024-06-26 08:41:53.963392+00	1	2
24	3	Dinner was cold as luka modric. All night. TOO HOOOTtttt	2024-06-15 11:54:16.926417+00	2024-06-16 22:29:50.085515+00	1	2
57	5	Nice to be here.	2024-06-24 16:03:21.715768+00	2024-06-25 10:17:15.876094+00	1	1
37	4	lkszdmclzkscmsaklmc	2024-06-17 15:41:12.647895+00	2024-06-21 23:01:18.122428+00	1	2
59	3	Pleasenat stay. now.	2024-06-24 16:36:24.593267+00	2024-06-25 15:03:29.141981+00	1	1
60	4	Fashionable.	2024-06-24 21:14:01.839585+00	2024-06-25 15:03:35.989767+00	1	2
19	5	ROof top	2024-06-06 10:39:03.88353+00	2024-06-06 11:09:33.755648+00	1	1
36	3	aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa	2024-06-17 15:37:38.591619+00	2024-06-22 14:29:11.306502+00	1	2
35	3	zkdhjcbskcbksbcksbcksdbcksdcbskdcbskdcbskdcbksbcksd	2024-06-17 15:35:21.268132+00	2024-06-22 14:29:23.122434+00	1	2
34	1	d,mn csdmc s,dmc s,m c,smd	2024-06-17 15:34:55.049715+00	2024-06-22 14:30:03.905461+00	1	2
33	4	hahahahahahaa	2024-06-17 15:21:21.783542+00	2024-06-22 14:30:09.609796+00	1	2
30	4	Review Reviewed review is home.	2024-06-17 08:32:44.290305+00	2024-06-22 14:30:16.000018+00	1	2
22	1	I think this is really awsome app.	2024-06-14 22:42:30.411942+00	2024-06-22 14:30:21.714849+00	1	1
42	3	Nice cool	2024-06-17 15:58:28.190493+00	2024-06-18 11:00:37.362165+00	1	2
41	2	ffffffffffffffffffffffffffffffff	2024-06-17 15:52:10.914914+00	2024-06-18 11:00:38.107966+00	1	2
40	2	yeeeeeeeeeeeeeeeeeeeeeeeee	2024-06-17 15:48:00.766245+00	2024-06-18 11:00:38.853902+00	1	2
56	5	Lijepoooo	2024-06-22 23:10:35.064127+00	2024-06-23 09:37:57.203497+00	1	2
38	3	Nice for a price.	2024-06-17 15:42:56.805859+00	2024-06-23 09:38:19.865626+00	1	2
58	5	Fine dinning.	2024-06-24 16:28:51.404738+00	2024-06-24 16:29:12.847772+00	1	1
89	0	jsnacjkackjasnca	2024-07-03 08:42:17.83804+00	2024-07-03 10:29:48.581785+00	1	2
64	0	Lovabl;e	2024-06-25 17:28:53.776637+00	2024-06-25 19:34:35.88171+00	1	2
63	4	HAd a lot of dirnks	2024-06-25 16:05:41.847895+00	2024-06-25 19:36:24.496105+00	1	1
88	0	hjb	2024-07-03 08:40:43.68348+00	2024-07-03 10:29:54.155063+00	1	2
62	0	Lovely hotel.	2024-06-25 15:29:19.651452+00	2024-06-25 19:40:42.896157+00	1	1
61	5	Nice and fun	2024-06-25 09:49:08.22719+00	2024-06-25 19:40:54.349661+00	1	1
78	5	My stay at the hotel was exceptional. The room was immaculate and tastefully decorated, offering breathtaking views of the city skyline. The staff were incredibly friendly and accommodating, ensuring every need was met promptly. The hotel amenities, including the spa and dining options, were top-notch and added to the overall luxury experience. The location was ideal, with easy access to local attractions and transportation. I thoroughly enjoyed my stay and would highly recommend this hotel to anyone looking for a memorable and comfortable stay in the heart of the city.	2024-06-30 12:33:51.90042+00	2024-07-02 14:41:29.50479+00	1	1
68	5	Aasssss	2024-06-25 19:51:11.246423+00	2024-06-25 19:51:47.094818+00	1	2
87	0	,mnkjn	2024-07-03 08:38:16.889202+00	2024-07-03 10:29:59.591363+00	1	2
86	0	xdv	2024-07-03 08:34:15.990109+00	2024-07-03 10:30:05.611832+00	1	2
69	4	kxmndknm	2024-06-25 20:08:24.781956+00	2024-06-25 20:12:34.934484+00	1	2
71	1	Hideous	2024-06-25 20:14:08.682425+00	2024-06-25 20:14:27.049862+00	1	2
85	0	xdv	2024-07-03 08:34:13.756232+00	2024-07-03 10:30:10.627948+00	1	2
79	4	Pleasent stay with family.	2024-07-01 14:48:04.180999+00	2024-07-02 15:52:21.472017+00	1	1
80	0	Very clean room, lovely staff	2024-07-02 22:38:23.279107+00	2024-07-02 22:39:17.449361+00	23	1
67	3	Nsnxnx	2024-06-25 19:50:25.927428+00	2024-06-26 09:11:15.385008+00	1	1
84	0	sdklvnms	2024-07-03 08:24:54.488431+00	2024-07-03 10:30:15.883003+00	1	2
83	0	jnjjnkj	2024-07-03 07:52:08.372682+00	2024-07-03 10:30:21.167138+00	1	2
82	0	jnkjnjknjk	2024-07-03 07:51:26.595224+00	2024-07-03 10:30:26.536236+00	1	2
72	5	Fantastic.	2024-06-25 21:11:04.888586+00	2024-06-26 09:45:08.300069+00	1	2
90	3	lovely room	2024-07-03 13:40:18.498198+00	2024-07-03 13:40:18.498211+00	24	0
76	5	Want it.	2024-06-28 21:49:14.229155+00	2024-07-04 18:41:07.55814+00	1	0
91	5	Wonderful experience.	2024-07-04 22:06:32.125231+00	2024-07-04 22:06:32.125244+00	1	0
74	3	Dalicious	2024-06-26 08:43:16.464763+00	2024-06-26 11:46:55.96896+00	1	2
81	0	TOTALLY :)	2024-07-03 07:27:18.456852+00	2024-07-04 22:12:07.563907+00	1	0
94	3	teyseryertwy	2024-08-09 10:58:07.580884+00	2024-08-09 10:58:07.580897+00	31	0
95	5	It is awesome place.	2024-10-18 17:34:03.189446+00	2024-10-18 17:34:03.189464+00	33	0
96	5	We love it!!	2024-12-04 18:07:20.108856+00	2024-12-04 18:07:20.108869+00	34	0
93	0	My recent stay at Wantit Hotel was nothing short of exceptional. From the moment I arrived, I was greeted with warmth and professionalism. The check-in pro cess was swift, and the front desk staff was attentive, providing me with all the necessary information about the hotel amenities and local attractions.\r\n\r\nThe room at Wantit Hotel was a sanctuary of comfort and style. It was elegantly furnished with modern decor and equipped with all the conveniences a traveler could desire. The bed was plush and inviting, ensuring a restful sleep every night. The panoramic view from the room was breathtaking, overlooking the city skyline and offering a glimpse of the nearby mountains.\r\n\r\nThe bathroom was spacious and well-appointed, featuring luxurious toiletries and a rain shower that was perfect for unwinding after a day of meetings. The room also had a work desk with ergonomic chair, high-speed internet access, and ample charging outlets, making it ideal for business travelers like myself.\r\n\r\nOne of the highlights of my stay was dining at Wantit Hotel's restaurant. The menu featured a delightful array of dishes that celebrated local flavors and international cuisine. I savored every bite of the chef's specialties, accompanied by a fine selection of wines recommended by the attentive waitstaff.\r\n\r\nThe hotel's facilities were impressive. I took advantage of the well-equipped fitness center, which offered state-of-the-art exercise machines and free weights. After my workout, I indulged in a relaxing session at the spa, where skilled therapists provided rejuvenating treatments that left me feeling refreshed and revitalized.\r\n\r\nWantit Hotel's location was ideal for both business and leisure travelers. It was centrally located, with easy access to corporate offices, shopping districts, and cultural attractions. I appreciated the convenience of being able to explore the city's landmarks and trendy neighborhoods within walking distance or a short drive from the hotel.\r\n\r\nThroughout my stay, the service at Wantit Hotel was impeccable. Every staff member I encountered was friendly, knowledgeable, and eager to assist with any request I had, whether it was arranging transportation, recommending local restaurants, or providing tips for sightseeing.\r\n\r\nOverall, my experience at Wantit Hotel exceeded my expectations in every way. It was a perfect blend of luxury, comfort, and convenience, making it an ideal choice for both short-term stays and extended visits. I highly recommend Wantit Hotel to anyone looking for a memorable and enjoyable stay in this vibrant city. I look forward to returning to Wantit Hotel on my next visit.	2024-07-04 22:17:19.490542+00	2024-08-09 11:03:50.064889+00	1	0
\.


--
-- Data for Name: seeds_seed; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.seeds_seed (id, name, scientific_name, description, planting_months_from, planting_months_to, flowering_months_from, flowering_months_to, category, sun_preference, price, discount, in_stock, height_from, height_to, image, created_at) FROM stdin;
3	Red climbing rose	Rosa Santana	The Red Climbing Rose is a vigorous and versatile plant known for its beautiful red blooms. Ideal for trellises, arbors, and walls, it adds a striking vertical element to gardens. Its blooms are not only visually appealing but also fragrant, making it a favorite among gardeners.	10	5	5	7	rose	full_sun	10.95	0.00	5	2.50	3.50	image/upload/v1723715202/nazfffiruvlbkka2dlt3.webp	2024-08-15 11:08:38+00
14	Lemon Tree	Citrus limon	A tropical tree known for its tangy lemons, great for home gardens and indoor growing.	5	7	6	8	tree	full_sun	60.00	5.00	20	1.50	2.50	\N	2024-08-18 11:00:00+00
1	Giant Lily	Crinum Asiaticum	The Asiatic Lily is known for its vibrant, colorful blooms and is a popular choice for garden decoration. These lilies are hardy and relatively easy to grow.	3	5	7	8	flower	full_sun	2.25	0.00	10	0.60	1.20	image/upload/v1723632829/giq4lfew73r6ekv2rse3.webp	2024-08-17 11:08:38+00
2	Damask rose	Rosa × damascena	The Damask rose is a deciduous shrub growing to 2.2 metres (7 ft 3 in) tall, the stems densely armed with stout, curved prickles and stiff bristles. The leaves are pinnate, with five (rarely seven) leaflets. The roses are a light to moderate pink to light red	1	12	5	12	rose	partly	5.00	1.00	8	0.50	2.50	image/upload/v1723637381/ncksigk6becwf9rfb5to.webp	2024-08-11 11:08:38+00
11	Oak Tree	Quercus robur	A majestic tree known for its strength and longevity.	3	6	5	6	tree	full_sun	150.00	10.00	15	10.00	20.00	\N	2024-08-15 14:00:00+00
10	Marigold	Tagetes erecta	Bright and hardy flowers known for their vibrant colors and pest-repellent properties.	5	7	7	10	flower	partly	4.95	0.00	25	0.30	0.60	\N	2024-08-17 13:00:00+00
5	White Climbing Rose	Rosa Alba	A classic rose with pure white blooms, perfect for elegant gardens.	9	4	6	8	Rose	Full Sun	12.95	0.00	8	2.00	3.00	\N	2024-08-16 11:08:38+00
6	Yellow Rose	Rosa xanthina	Bright and cheerful, this rose variety is known for its sunny yellow blooms.	8	4	6	9	Rose	Full Sun	15.00	10.00	10	1.80	2.50	\N	2024-08-17 10:00:00+00
7	Pink Rose	Rosa damascena	A beautiful rose with delicate pink flowers, ideal for gardens and bouquets.	7	5	5	8	Rose	Full Sun	14.95	0.00	6	1.50	2.00	\N	2024-08-18 12:00:00+00
9	Lavender	Lavandula angustifolia	A fragrant herb with beautiful purple flowers, ideal for gardens and aromatic uses.	3	5	6	8	flower	full_sun	7.95	0.00	15	0.60	0.90	\N	2024-08-16 14:00:00+00
18	Currant Bush	Ribes rubrum	Produces clusters of red or black currants, perfect for making jellies and sauces.	4	6	5	7	bush	full_sun	20.00	0.00	22	1.00	1.80	\N	2024-08-18 14:00:00+00
8	Sunflower	Helianthus annuus	Bright and cheerful, sunflowers are a staple in summer gardens.	4	7	7	9	flower	full_sun	5.95	0.00	20	1.50	3.00	\N	2024-08-15 12:00:00+00
16	Raspberry Bush	Rubus idaeus	A bush that produces delicious raspberries, great for gardens and culinary uses.	4	6	6	8	bush	full_sun	22.00	5.00	25	1.00	1.80	\N	2024-08-16 12:00:00+00
17	Gooseberry Bush	Ribes uva-crispa	A hardy bush that produces tart gooseberries, ideal for jams and desserts.	3	5	5	7	bush	full_sun	18.00	0.00	18	0.80	1.50	\N	2024-08-17 13:00:00+00
15	Blueberry Bush	Vaccinium corymbosum	A fruitful bush that provides delicious blueberries in summer.	3	5	4	6	bush	full_sun	25.00	0.00	30	1.00	2.00	\N	2024-08-15 15:00:00+00
13	Cherry Tree	Prunus avium	A beautiful tree that produces sweet cherries, ideal for orchards and gardens.	3	5	4	5	tree	partly	200.00	20.00	8	8.00	15.00	\N	2024-08-17 16:00:00+00
12	Maple Tree	Acer saccharum	Known for its beautiful fall foliage and strong wood, the Maple Tree is a garden favorite.	4	7	5	6	tree	full_sun	175.00	0.00	10	12.00	25.00	\N	2024-08-16 15:00:00+00
\.


--
-- Data for Name: socialaccount_socialaccount; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.socialaccount_socialaccount (id, provider, uid, last_login, date_joined, extra_data, user_id) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialapp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.socialaccount_socialapp (id, provider, name, client_id, secret, key, provider_id, settings) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialapp_sites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.socialaccount_socialapp_sites (id, socialapp_id, site_id) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialtoken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.socialaccount_socialtoken (id, token, token_secret, expires_at, account_id, app_id) FROM stdin;
\.


--
-- Data for Name: wantit_booking; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wantit_booking (id, name, email, phone, checkin_date, checkout_date, type_of_room, occupied, status, user_id, excerpt, updated_on) FROM stdin;
1	nik	sajkodog@gmail.com	0830945102	2024-05-28	2024-05-29	deluxe	f	1	1		2024-05-27 19:21:13.382497+00
\.


--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_emailaddress_id_seq', 6, true);


--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_emailconfirmation_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 100, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 34, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: bookings_bathroomimage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bookings_bathroomimage_id_seq', 1, true);


--
-- Name: bookings_minibarimage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bookings_minibarimage_id_seq', 4, true);


--
-- Name: bookings_reservation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bookings_reservation_id_seq', 67, true);


--
-- Name: bookings_room_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bookings_room_id_seq', 21, true);


--
-- Name: cart_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_cart_id_seq', 1, true);


--
-- Name: cart_cartitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_cartitem_id_seq', 11, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 132, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 25, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 76, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- Name: django_summernote_attachment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_summernote_attachment_id_seq', 1, false);


--
-- Name: home_message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.home_message_id_seq', 34, true);


--
-- Name: reviews_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_comment_id_seq', 99, true);


--
-- Name: reviews_review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_review_id_seq', 96, true);


--
-- Name: seeds_seed_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seeds_seed_id_seq', 18, true);


--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.socialaccount_socialaccount_id_seq', 1, false);


--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_id_seq', 1, false);


--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_sites_id_seq', 1, false);


--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.socialaccount_socialtoken_id_seq', 1, false);


--
-- Name: wantit_booking_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wantit_booking_id_seq', 1, true);


--
-- Name: account_emailaddress account_emailaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_pkey PRIMARY KEY (id);


--
-- Name: account_emailaddress account_emailaddress_user_id_email_987c8728_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_email_987c8728_uniq UNIQUE (user_id, email);


--
-- Name: account_emailconfirmation account_emailconfirmation_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_key_key UNIQUE (key);


--
-- Name: account_emailconfirmation account_emailconfirmation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: bookings_bathroomimage bookings_bathroomimage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings_bathroomimage
    ADD CONSTRAINT bookings_bathroomimage_pkey PRIMARY KEY (id);


--
-- Name: bookings_minibarimage bookings_minibarimage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings_minibarimage
    ADD CONSTRAINT bookings_minibarimage_pkey PRIMARY KEY (id);


--
-- Name: bookings_reservation bookings_reservation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings_reservation
    ADD CONSTRAINT bookings_reservation_pkey PRIMARY KEY (id);


--
-- Name: bookings_room bookings_room_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings_room
    ADD CONSTRAINT bookings_room_pkey PRIMARY KEY (id);


--
-- Name: bookings_room bookings_room_room_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings_room
    ADD CONSTRAINT bookings_room_room_number_key UNIQUE (room_number);


--
-- Name: cart_cart cart_cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_cart
    ADD CONSTRAINT cart_cart_pkey PRIMARY KEY (id);


--
-- Name: cart_cart cart_cart_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_cart
    ADD CONSTRAINT cart_cart_user_id_key UNIQUE (user_id);


--
-- Name: cart_cartitem cart_cartitem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_cartitem
    ADD CONSTRAINT cart_cartitem_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: django_summernote_attachment django_summernote_attachment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_summernote_attachment
    ADD CONSTRAINT django_summernote_attachment_pkey PRIMARY KEY (id);


--
-- Name: home_message home_message_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_message
    ADD CONSTRAINT home_message_pkey PRIMARY KEY (id);


--
-- Name: reviews_comment reviews_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_comment
    ADD CONSTRAINT reviews_comment_pkey PRIMARY KEY (id);


--
-- Name: reviews_review reviews_review_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_review
    ADD CONSTRAINT reviews_review_pkey PRIMARY KEY (id);


--
-- Name: seeds_seed seeds_seed_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seeds_seed
    ADD CONSTRAINT seeds_seed_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_provider_uid_fc810c6e_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_provider_uid_fc810c6e_uniq UNIQUE (provider, uid);


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq UNIQUE (socialapp_id, site_id);


--
-- Name: socialaccount_socialapp socialaccount_socialapp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialapp
    ADD CONSTRAINT socialaccount_socialapp_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp_sites_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq UNIQUE (app_id, account_id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_pkey PRIMARY KEY (id);


--
-- Name: wantit_booking wantit_booking_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wantit_booking
    ADD CONSTRAINT wantit_booking_pkey PRIMARY KEY (id);


--
-- Name: account_emailaddress_email_03be32b2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailaddress_email_03be32b2 ON public.account_emailaddress USING btree (email);


--
-- Name: account_emailaddress_email_03be32b2_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailaddress_email_03be32b2_like ON public.account_emailaddress USING btree (email varchar_pattern_ops);


--
-- Name: account_emailaddress_user_id_2c513194; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailaddress_user_id_2c513194 ON public.account_emailaddress USING btree (user_id);


--
-- Name: account_emailconfirmation_email_address_id_5b7f8c58; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailconfirmation_email_address_id_5b7f8c58 ON public.account_emailconfirmation USING btree (email_address_id);


--
-- Name: account_emailconfirmation_key_f43612bd_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailconfirmation_key_f43612bd_like ON public.account_emailconfirmation USING btree (key varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: bookings_reservation_room_id_de336418; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bookings_reservation_room_id_de336418 ON public.bookings_reservation USING btree (room_id);


--
-- Name: bookings_reservation_user_id_98650a96; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bookings_reservation_user_id_98650a96 ON public.bookings_reservation USING btree (user_id);


--
-- Name: bookings_room_room_number_ec4c1850_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bookings_room_room_number_ec4c1850_like ON public.bookings_room USING btree (room_number varchar_pattern_ops);


--
-- Name: cart_cartitem_cart_id_370ad265; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cart_cartitem_cart_id_370ad265 ON public.cart_cartitem USING btree (cart_id);


--
-- Name: cart_cartitem_seed_id_8342c57c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cart_cartitem_seed_id_8342c57c ON public.cart_cartitem USING btree (seed_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: home_message_user_id_b72c812a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX home_message_user_id_b72c812a ON public.home_message USING btree (user_id);


--
-- Name: reviews_comment_review_id_43f1c708; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_comment_review_id_43f1c708 ON public.reviews_comment USING btree (review_id);


--
-- Name: reviews_comment_user_id_1d319c7d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_comment_user_id_1d319c7d ON public.reviews_comment USING btree (user_id);


--
-- Name: reviews_review_user_id_875caff2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reviews_review_user_id_875caff2 ON public.reviews_review USING btree (user_id);


--
-- Name: socialaccount_socialaccount_user_id_8146e70c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX socialaccount_socialaccount_user_id_8146e70c ON public.socialaccount_socialaccount USING btree (user_id);


--
-- Name: socialaccount_socialapp_sites_site_id_2579dee5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX socialaccount_socialapp_sites_site_id_2579dee5 ON public.socialaccount_socialapp_sites USING btree (site_id);


--
-- Name: socialaccount_socialapp_sites_socialapp_id_97fb6e7d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX socialaccount_socialapp_sites_socialapp_id_97fb6e7d ON public.socialaccount_socialapp_sites USING btree (socialapp_id);


--
-- Name: socialaccount_socialtoken_account_id_951f210e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX socialaccount_socialtoken_account_id_951f210e ON public.socialaccount_socialtoken USING btree (account_id);


--
-- Name: socialaccount_socialtoken_app_id_636a42d7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX socialaccount_socialtoken_app_id_636a42d7 ON public.socialaccount_socialtoken USING btree (app_id);


--
-- Name: unique_primary_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX unique_primary_email ON public.account_emailaddress USING btree (user_id, "primary") WHERE "primary";


--
-- Name: unique_verified_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX unique_verified_email ON public.account_emailaddress USING btree (email) WHERE verified;


--
-- Name: wantit_booking_user_id_053eb192; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX wantit_booking_user_id_053eb192 ON public.wantit_booking USING btree (user_id);


--
-- Name: account_emailaddress account_emailaddress_user_id_2c513194_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_2c513194_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_emailconfirmation account_emailconfirm_email_address_id_5b7f8c58_fk_account_e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirm_email_address_id_5b7f8c58_fk_account_e FOREIGN KEY (email_address_id) REFERENCES public.account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bookings_reservation bookings_reservation_room_id_de336418_fk_bookings_room_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings_reservation
    ADD CONSTRAINT bookings_reservation_room_id_de336418_fk_bookings_room_id FOREIGN KEY (room_id) REFERENCES public.bookings_room(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bookings_reservation bookings_reservation_user_id_98650a96_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings_reservation
    ADD CONSTRAINT bookings_reservation_user_id_98650a96_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cart_cart cart_cart_user_id_9b4220b9_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_cart
    ADD CONSTRAINT cart_cart_user_id_9b4220b9_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cart_cartitem cart_cartitem_cart_id_370ad265_fk_cart_cart_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_cartitem
    ADD CONSTRAINT cart_cartitem_cart_id_370ad265_fk_cart_cart_id FOREIGN KEY (cart_id) REFERENCES public.cart_cart(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cart_cartitem cart_cartitem_seed_id_8342c57c_fk_seeds_seed_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_cartitem
    ADD CONSTRAINT cart_cartitem_seed_id_8342c57c_fk_seeds_seed_id FOREIGN KEY (seed_id) REFERENCES public.seeds_seed(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_message home_message_user_id_b72c812a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_message
    ADD CONSTRAINT home_message_user_id_b72c812a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_comment reviews_comment_review_id_43f1c708_fk_reviews_review_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_comment
    ADD CONSTRAINT reviews_comment_review_id_43f1c708_fk_reviews_review_id FOREIGN KEY (review_id) REFERENCES public.reviews_review(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_comment reviews_comment_user_id_1d319c7d_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_comment
    ADD CONSTRAINT reviews_comment_user_id_1d319c7d_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_review reviews_review_user_id_875caff2_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews_review
    ADD CONSTRAINT reviews_review_user_id_875caff2_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialaccount_social_account_id_951f210e_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_social_account_id_951f210e_fk_socialacc FOREIGN KEY (account_id) REFERENCES public.socialaccount_socialaccount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialaccount_social_app_id_636a42d7_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_social_app_id_636a42d7_fk_socialacc FOREIGN KEY (app_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialapp_sites socialaccount_social_site_id_2579dee5_fk_django_si; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_site_id_2579dee5_fk_django_si FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialapp_sites socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc FOREIGN KEY (socialapp_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wantit_booking wantit_booking_user_id_053eb192_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wantit_booking
    ADD CONSTRAINT wantit_booking_user_id_053eb192_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

