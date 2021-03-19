--
-- PostgreSQL database dump
--

-- Dumped from database version 12.5 (Debian 12.5-1.pgdg100+1)
-- Dumped by pg_dump version 13.0

-- Started on 2021-03-19 22:53:10 +04

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
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: cuba
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO cuba;

--
-- TOC entry 3490 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: cuba
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 256 (class 1255 OID 26155)
-- Name: newid(); Type: FUNCTION; Schema: public; Owner: cuba
--

CREATE FUNCTION public.newid() RETURNS uuid
    LANGUAGE sql
    AS $$select md5(random()::text || clock_timestamp()::text)::uuid$$;


ALTER FUNCTION public.newid() OWNER TO cuba;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 242 (class 1259 OID 26156)
-- Name: ratlab_certificate; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.ratlab_certificate (
    id uuid NOT NULL,
    version integer NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    title character varying(255),
    aquired timestamp without time zone NOT NULL,
    code character varying(255) NOT NULL,
    description text,
    owner_id uuid
);


ALTER TABLE public.ratlab_certificate OWNER TO cuba;

--
-- TOC entry 243 (class 1259 OID 26164)
-- Name: ratlab_employee; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.ratlab_employee (
    id uuid NOT NULL,
    version integer NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    home_address_country character varying(255),
    home_address_town character varying(255),
    home_address_field1 character varying(255),
    home_address_latitude double precision,
    home_address_longitude double precision,
    home_address_field2 character varying(255),
    home_address_field3 character varying(255),
    home_address_field4 character varying(255),
    home_address_field5 character varying(255),
    name character varying(255),
    position_ character varying(50) NOT NULL,
    experience integer NOT NULL,
    since timestamp without time zone NOT NULL,
    laboratory_id uuid,
    supervisor_id uuid
);


ALTER TABLE public.ratlab_employee OWNER TO cuba;

--
-- TOC entry 244 (class 1259 OID 26172)
-- Name: ratlab_employee_research_link; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.ratlab_employee_research_link (
    employee_id uuid NOT NULL,
    research_id uuid NOT NULL
);


ALTER TABLE public.ratlab_employee_research_link OWNER TO cuba;

--
-- TOC entry 245 (class 1259 OID 26177)
-- Name: ratlab_laboratory; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.ratlab_laboratory (
    id uuid NOT NULL,
    version integer NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    address_country character varying(255),
    address_town character varying(255),
    address_field1 character varying(255),
    address_latitude double precision,
    address_longitude double precision,
    address_field2 character varying(255),
    address_field3 character varying(255),
    address_field4 character varying(255),
    address_field5 character varying(255),
    title character varying(255) NOT NULL,
    description character varying(255),
    day_start time without time zone NOT NULL,
    day_end time without time zone,
    code character varying(255) NOT NULL
);


ALTER TABLE public.ratlab_laboratory OWNER TO cuba;

--
-- TOC entry 246 (class 1259 OID 26185)
-- Name: ratlab_misc_resource; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.ratlab_misc_resource (
    id uuid NOT NULL,
    version integer NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    name character varying(255),
    amount numeric(19,2),
    type_ character varying(50) NOT NULL,
    consumable boolean DEFAULT true NOT NULL
);


ALTER TABLE public.ratlab_misc_resource OWNER TO cuba;

--
-- TOC entry 247 (class 1259 OID 26190)
-- Name: ratlab_rat; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.ratlab_rat (
    id uuid NOT NULL,
    version integer NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    name character varying(255),
    color character varying(255),
    checked boolean
);


ALTER TABLE public.ratlab_rat OWNER TO cuba;

--
-- TOC entry 248 (class 1259 OID 26198)
-- Name: ratlab_research; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.ratlab_research (
    id uuid NOT NULL,
    version integer NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    title character varying(255) NOT NULL,
    start_time timestamp with time zone NOT NULL,
    description text,
    state integer
);


ALTER TABLE public.ratlab_research OWNER TO cuba;

--
-- TOC entry 253 (class 1259 OID 26971)
-- Name: ratlab_research_requirement; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.ratlab_research_requirement (
    id uuid NOT NULL,
    version integer NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    research_id uuid NOT NULL,
    mandatory boolean NOT NULL
);


ALTER TABLE public.ratlab_research_requirement OWNER TO cuba;

--
-- TOC entry 254 (class 1259 OID 26995)
-- Name: ratlab_resource_requirement; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.ratlab_resource_requirement (
    id uuid NOT NULL,
    version integer NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    research_id uuid NOT NULL,
    mandatory boolean NOT NULL,
    resource_id uuid NOT NULL,
    provided integer NOT NULL,
    amount integer NOT NULL,
    consume boolean DEFAULT false
);


ALTER TABLE public.ratlab_resource_requirement OWNER TO cuba;

--
-- TOC entry 255 (class 1259 OID 27001)
-- Name: ratlab_subject_requirement; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.ratlab_subject_requirement (
    id uuid NOT NULL,
    version integer NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    research_id uuid NOT NULL,
    mandatory boolean NOT NULL,
    subject_id uuid NOT NULL
);


ALTER TABLE public.ratlab_subject_requirement OWNER TO cuba;

--
-- TOC entry 252 (class 1259 OID 26919)
-- Name: report_execution; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.report_execution (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    report_id uuid,
    report_name character varying(255) NOT NULL,
    report_code character varying(255),
    user_id uuid NOT NULL,
    start_time timestamp without time zone NOT NULL,
    finish_time timestamp without time zone,
    is_success boolean DEFAULT false,
    cancelled boolean DEFAULT false,
    params text,
    error_message text,
    server_id character varying(50),
    output_document_id uuid
);


ALTER TABLE public.report_execution OWNER TO cuba;

--
-- TOC entry 249 (class 1259 OID 26870)
-- Name: report_group; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.report_group (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer DEFAULT 1 NOT NULL,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    title character varying(255) NOT NULL,
    code character varying(255),
    locale_names text,
    sys_tenant_id character varying(255)
);


ALTER TABLE public.report_group OWNER TO cuba;

--
-- TOC entry 250 (class 1259 OID 26881)
-- Name: report_report; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.report_report (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer DEFAULT 1 NOT NULL,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    name character varying(255) NOT NULL,
    code character varying(255),
    description character varying(500),
    locale_names text,
    group_id uuid NOT NULL,
    report_type integer,
    default_template_id uuid,
    xml text,
    roles_idx character varying(1000),
    screens_idx character varying(1000),
    input_entity_types_idx character varying(1000),
    rest_access boolean DEFAULT false,
    is_system boolean DEFAULT false,
    sys_tenant_id character varying(255)
);


ALTER TABLE public.report_report OWNER TO cuba;

--
-- TOC entry 251 (class 1259 OID 26899)
-- Name: report_template; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.report_template (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer DEFAULT 1 NOT NULL,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    report_id uuid NOT NULL,
    code character varying(50),
    output_type integer DEFAULT 0 NOT NULL,
    is_default boolean DEFAULT false,
    is_custom boolean DEFAULT false,
    is_alterable_output boolean DEFAULT false,
    is_groovy boolean DEFAULT false,
    custom_defined_by integer DEFAULT 100,
    custom_class character varying,
    output_name_pattern character varying(255),
    name character varying(500),
    content bytea
);


ALTER TABLE public.report_template OWNER TO cuba;

--
-- TOC entry 216 (class 1259 OID 25769)
-- Name: sec_constraint; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sec_constraint (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer DEFAULT 1 NOT NULL,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    sys_tenant_id character varying(255),
    code character varying(255),
    check_type character varying(50) DEFAULT 'db'::character varying,
    operation_type character varying(50) DEFAULT 'read'::character varying,
    entity_name character varying(255) NOT NULL,
    join_clause character varying(500),
    where_clause character varying(1000),
    groovy_script text,
    filter_xml text,
    is_active boolean DEFAULT true,
    group_id uuid
);


ALTER TABLE public.sec_constraint OWNER TO cuba;

--
-- TOC entry 223 (class 1259 OID 25864)
-- Name: sec_entity_log; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sec_entity_log (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    sys_tenant_id character varying(255),
    event_ts timestamp without time zone,
    user_id uuid,
    change_type character(1),
    entity character varying(100),
    entity_instance_name character varying(1000),
    entity_id uuid,
    string_entity_id character varying(255),
    int_entity_id integer,
    long_entity_id bigint,
    changes text
);


ALTER TABLE public.sec_entity_log OWNER TO cuba;

--
-- TOC entry 224 (class 1259 OID 25881)
-- Name: sec_filter; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sec_filter (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer DEFAULT 1 NOT NULL,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    sys_tenant_id character varying(255),
    component character varying(200),
    name character varying(255),
    code character varying(200),
    xml text,
    user_id uuid,
    global_default boolean
);


ALTER TABLE public.sec_filter OWNER TO cuba;

--
-- TOC entry 211 (class 1259 OID 25693)
-- Name: sec_group; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sec_group (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer DEFAULT 1 NOT NULL,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    sys_tenant_id character varying(255),
    name character varying(255) NOT NULL,
    parent_id uuid
);


ALTER TABLE public.sec_group OWNER TO cuba;

--
-- TOC entry 212 (class 1259 OID 25709)
-- Name: sec_group_hierarchy; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sec_group_hierarchy (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    sys_tenant_id character varying(255),
    group_id uuid,
    parent_id uuid,
    hierarchy_level integer
);


ALTER TABLE public.sec_group_hierarchy OWNER TO cuba;

--
-- TOC entry 217 (class 1259 OID 25787)
-- Name: sec_localized_constraint_msg; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sec_localized_constraint_msg (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer DEFAULT 1 NOT NULL,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    entity_name character varying(255) NOT NULL,
    operation_type character varying(50) NOT NULL,
    values_ text
);


ALTER TABLE public.sec_localized_constraint_msg OWNER TO cuba;

--
-- TOC entry 222 (class 1259 OID 25851)
-- Name: sec_logged_attr; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sec_logged_attr (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    entity_id uuid,
    name character varying(255)
);


ALTER TABLE public.sec_logged_attr OWNER TO cuba;

--
-- TOC entry 221 (class 1259 OID 25844)
-- Name: sec_logged_entity; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sec_logged_entity (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    name character varying(100),
    auto boolean,
    manual boolean
);


ALTER TABLE public.sec_logged_entity OWNER TO cuba;

--
-- TOC entry 215 (class 1259 OID 25757)
-- Name: sec_permission; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sec_permission (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer DEFAULT 1 NOT NULL,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    permission_type integer,
    target character varying(100),
    value_ integer,
    role_id uuid
);


ALTER TABLE public.sec_permission OWNER TO cuba;

--
-- TOC entry 227 (class 1259 OID 25923)
-- Name: sec_presentation; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sec_presentation (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    sys_tenant_id character varying(255),
    component character varying(200),
    name character varying(255),
    xml character varying(7000),
    user_id uuid,
    is_auto_save boolean
);


ALTER TABLE public.sec_presentation OWNER TO cuba;

--
-- TOC entry 240 (class 1259 OID 26119)
-- Name: sec_remember_me; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sec_remember_me (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer DEFAULT 1 NOT NULL,
    user_id uuid NOT NULL,
    token character varying(32) NOT NULL
);


ALTER TABLE public.sec_remember_me OWNER TO cuba;

--
-- TOC entry 210 (class 1259 OID 25682)
-- Name: sec_role; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sec_role (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer DEFAULT 1 NOT NULL,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    sys_tenant_id character varying(255),
    name character varying(255) NOT NULL,
    loc_name character varying(255),
    description character varying(1000),
    is_default_role boolean,
    role_type integer,
    security_scope character varying(255)
);


ALTER TABLE public.sec_role OWNER TO cuba;

--
-- TOC entry 230 (class 1259 OID 25970)
-- Name: sec_screen_history; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sec_screen_history (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    sys_tenant_id character varying(255),
    user_id uuid,
    caption character varying(255),
    url text,
    entity_id uuid,
    string_entity_id character varying(255),
    int_entity_id integer,
    long_entity_id bigint,
    substituted_user_id uuid
);


ALTER TABLE public.sec_screen_history OWNER TO cuba;

--
-- TOC entry 228 (class 1259 OID 25937)
-- Name: sec_search_folder; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sec_search_folder (
    folder_id uuid NOT NULL,
    filter_component character varying(200),
    filter_xml character varying(7000),
    user_id uuid,
    presentation_id uuid,
    apply_default boolean,
    is_set boolean,
    entity_type character varying(50)
);


ALTER TABLE public.sec_search_folder OWNER TO cuba;

--
-- TOC entry 218 (class 1259 OID 25797)
-- Name: sec_session_attr; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sec_session_attr (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer DEFAULT 1 NOT NULL,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    sys_tenant_id character varying(255),
    name character varying(50),
    str_value character varying(1000),
    datatype character varying(20),
    group_id uuid
);


ALTER TABLE public.sec_session_attr OWNER TO cuba;

--
-- TOC entry 241 (class 1259 OID 26132)
-- Name: sec_session_log; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sec_session_log (
    id uuid NOT NULL,
    version integer DEFAULT 1 NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    sys_tenant_id character varying(255),
    session_id uuid NOT NULL,
    user_id uuid NOT NULL,
    substituted_user_id uuid,
    user_data text,
    last_action integer NOT NULL,
    client_info character varying(512),
    client_type character varying(10),
    address character varying(255),
    started_ts timestamp without time zone,
    finished_ts timestamp without time zone,
    server_id character varying(128)
);


ALTER TABLE public.sec_session_log OWNER TO cuba;

--
-- TOC entry 213 (class 1259 OID 25724)
-- Name: sec_user; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sec_user (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer DEFAULT 1 NOT NULL,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    sys_tenant_id character varying(255),
    login character varying(50) NOT NULL,
    login_lc character varying(50) NOT NULL,
    password character varying(255),
    password_encryption character varying(50),
    name character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    middle_name character varying(255),
    position_ character varying(255),
    email character varying(100),
    language_ character varying(20),
    time_zone character varying(50),
    time_zone_auto boolean,
    active boolean,
    group_id uuid,
    group_names character varying(255),
    ip_mask character varying(200),
    change_password_at_logon boolean
);


ALTER TABLE public.sec_user OWNER TO cuba;

--
-- TOC entry 214 (class 1259 OID 25740)
-- Name: sec_user_role; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sec_user_role (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer DEFAULT 1 NOT NULL,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    user_id uuid,
    role_id uuid,
    role_name character varying(50)
);


ALTER TABLE public.sec_user_role OWNER TO cuba;

--
-- TOC entry 219 (class 1259 OID 25812)
-- Name: sec_user_setting; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sec_user_setting (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    user_id uuid,
    client_type character(1),
    name character varying(255),
    value_ text
);


ALTER TABLE public.sec_user_setting OWNER TO cuba;

--
-- TOC entry 220 (class 1259 OID 25827)
-- Name: sec_user_substitution; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sec_user_substitution (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer DEFAULT 1 NOT NULL,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    sys_tenant_id character varying(255),
    user_id uuid NOT NULL,
    substituted_user_id uuid NOT NULL,
    start_date timestamp without time zone,
    end_date timestamp without time zone
);


ALTER TABLE public.sec_user_substitution OWNER TO cuba;

--
-- TOC entry 226 (class 1259 OID 25910)
-- Name: sys_app_folder; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sys_app_folder (
    folder_id uuid NOT NULL,
    filter_component character varying(200),
    filter_xml character varying(7000),
    visibility_script text,
    quantity_script text,
    apply_default boolean
);


ALTER TABLE public.sys_app_folder OWNER TO cuba;

--
-- TOC entry 236 (class 1259 OID 26074)
-- Name: sys_attr_value; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sys_attr_value (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer DEFAULT 1 NOT NULL,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    category_attr_id uuid NOT NULL,
    code character varying(255) NOT NULL,
    entity_id uuid,
    string_entity_id character varying(255),
    int_entity_id integer,
    long_entity_id bigint,
    string_value character varying,
    integer_value integer,
    double_value numeric(36,6),
    decimal_value numeric(36,10),
    date_value timestamp without time zone,
    date_wo_time_value date,
    boolean_value boolean,
    entity_value uuid,
    string_entity_value character varying(255),
    int_entity_value integer,
    long_entity_value bigint,
    parent_id uuid
);


ALTER TABLE public.sys_attr_value OWNER TO cuba;

--
-- TOC entry 234 (class 1259 OID 26048)
-- Name: sys_category; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sys_category (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer DEFAULT 1 NOT NULL,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    name character varying(255) NOT NULL,
    special character varying(50),
    entity_type character varying(100) NOT NULL,
    is_default boolean,
    discriminator integer,
    locale_names character varying(1000)
);


ALTER TABLE public.sys_category OWNER TO cuba;

--
-- TOC entry 235 (class 1259 OID 26058)
-- Name: sys_category_attr; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sys_category_attr (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer DEFAULT 1 NOT NULL,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    category_entity_type character varying(4000),
    name character varying(255),
    code character varying(255) NOT NULL,
    description character varying(1000),
    category_id uuid NOT NULL,
    entity_class character varying(500),
    data_type character varying(200),
    default_string character varying,
    default_int integer,
    default_double numeric(36,6),
    default_decimal numeric(36,10),
    default_date timestamp without time zone,
    default_date_wo_time date,
    default_date_is_current boolean,
    default_boolean boolean,
    default_entity_value uuid,
    default_str_entity_value character varying(255),
    default_int_entity_value integer,
    default_long_entity_value bigint,
    enumeration character varying(500),
    order_no integer,
    screen character varying(255),
    required boolean,
    lookup boolean,
    target_screens character varying(4000),
    width character varying(20),
    rows_count integer,
    is_collection boolean,
    join_clause character varying(4000),
    where_clause character varying(4000),
    filter_xml text,
    locale_names character varying(1000),
    locale_descriptions character varying(4000),
    enumeration_locales character varying(5000),
    attribute_configuration_json text
);


ALTER TABLE public.sys_category_attr OWNER TO cuba;

--
-- TOC entry 204 (class 1259 OID 25627)
-- Name: sys_config; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sys_config (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer DEFAULT 1 NOT NULL,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    name character varying(255) NOT NULL,
    value_ text NOT NULL
);


ALTER TABLE public.sys_config OWNER TO cuba;

--
-- TOC entry 202 (class 1259 OID 25611)
-- Name: sys_db_changelog; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sys_db_changelog (
    script_name character varying(300) NOT NULL,
    create_ts timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    is_init integer DEFAULT 0
);


ALTER TABLE public.sys_db_changelog OWNER TO cuba;

--
-- TOC entry 233 (class 1259 OID 26031)
-- Name: sys_entity_snapshot; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sys_entity_snapshot (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    sys_tenant_id character varying(255),
    entity_meta_class character varying(50) NOT NULL,
    entity_id uuid,
    string_entity_id character varying(255),
    int_entity_id integer,
    long_entity_id bigint,
    author_id uuid NOT NULL,
    view_xml text NOT NULL,
    snapshot_xml text NOT NULL,
    snapshot_date timestamp without time zone NOT NULL
);


ALTER TABLE public.sys_entity_snapshot OWNER TO cuba;

--
-- TOC entry 207 (class 1259 OID 25651)
-- Name: sys_entity_statistics; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sys_entity_statistics (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    name character varying(50),
    instance_count bigint,
    fetch_ui integer,
    max_fetch_ui integer,
    lazy_collection_threshold integer,
    lookup_screen_threshold integer
);


ALTER TABLE public.sys_entity_statistics OWNER TO cuba;

--
-- TOC entry 205 (class 1259 OID 25637)
-- Name: sys_file; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sys_file (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer DEFAULT 1 NOT NULL,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    sys_tenant_id character varying(255),
    name character varying(500) NOT NULL,
    ext character varying(20),
    file_size bigint,
    create_date timestamp without time zone
);


ALTER TABLE public.sys_file OWNER TO cuba;

--
-- TOC entry 225 (class 1259 OID 25896)
-- Name: sys_folder; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sys_folder (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer DEFAULT 1 NOT NULL,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    sys_tenant_id character varying(255),
    folder_type character(1),
    parent_id uuid,
    name character varying(100),
    tab_name character varying(100),
    sort_order integer
);


ALTER TABLE public.sys_folder OWNER TO cuba;

--
-- TOC entry 229 (class 1259 OID 25961)
-- Name: sys_fts_queue; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sys_fts_queue (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    entity_id uuid,
    string_entity_id character varying(255),
    int_entity_id integer,
    long_entity_id bigint,
    entity_name character varying(200),
    change_type character(1),
    source_host character varying(255),
    indexing_host character varying(255),
    fake boolean
);


ALTER TABLE public.sys_fts_queue OWNER TO cuba;

--
-- TOC entry 237 (class 1259 OID 26097)
-- Name: sys_jmx_instance; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sys_jmx_instance (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer DEFAULT 1 NOT NULL,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    node_name character varying(255),
    address character varying(500) NOT NULL,
    login character varying(50) NOT NULL,
    password character varying(255) NOT NULL
);


ALTER TABLE public.sys_jmx_instance OWNER TO cuba;

--
-- TOC entry 206 (class 1259 OID 25646)
-- Name: sys_lock_config; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sys_lock_config (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    name character varying(100),
    timeout_sec integer
);


ALTER TABLE public.sys_lock_config OWNER TO cuba;

--
-- TOC entry 238 (class 1259 OID 26106)
-- Name: sys_query_result_seq; Type: SEQUENCE; Schema: public; Owner: cuba
--

CREATE SEQUENCE public.sys_query_result_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sys_query_result_seq OWNER TO cuba;

--
-- TOC entry 239 (class 1259 OID 26108)
-- Name: sys_query_result; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sys_query_result (
    id bigint DEFAULT nextval('public.sys_query_result_seq'::regclass) NOT NULL,
    session_id uuid NOT NULL,
    query_key integer NOT NULL,
    entity_id uuid,
    string_entity_id character varying(255),
    int_entity_id integer,
    long_entity_id bigint
);


ALTER TABLE public.sys_query_result OWNER TO cuba;

--
-- TOC entry 209 (class 1259 OID 25667)
-- Name: sys_scheduled_execution; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sys_scheduled_execution (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    sys_tenant_id character varying(255),
    task_id uuid,
    server character varying(512),
    start_time timestamp with time zone,
    finish_time timestamp with time zone,
    result text
);


ALTER TABLE public.sys_scheduled_execution OWNER TO cuba;

--
-- TOC entry 208 (class 1259 OID 25657)
-- Name: sys_scheduled_task; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sys_scheduled_task (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    sys_tenant_id character varying(255),
    defined_by character varying(1) DEFAULT 'B'::character varying,
    class_name character varying(500),
    script_name character varying(500),
    bean_name character varying(50),
    method_name character varying(50),
    method_params character varying(4000),
    user_name character varying(50),
    is_singleton boolean,
    is_active boolean,
    period_ integer,
    timeout integer,
    start_date timestamp without time zone,
    time_frame integer,
    start_delay integer,
    permitted_servers character varying(4096),
    log_start boolean,
    log_finish boolean,
    last_start_time timestamp with time zone,
    last_start_server character varying(512),
    description character varying(1000),
    cron character varying(100),
    scheduling_type character varying(1) DEFAULT 'P'::character varying
);


ALTER TABLE public.sys_scheduled_task OWNER TO cuba;

--
-- TOC entry 232 (class 1259 OID 26011)
-- Name: sys_sending_attachment; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sys_sending_attachment (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer DEFAULT 1 NOT NULL,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    sys_tenant_id character varying(255),
    message_id uuid,
    content bytea,
    content_file_id uuid,
    content_id character varying(50),
    name character varying(500),
    disposition character varying(50),
    text_encoding character varying(50)
);


ALTER TABLE public.sys_sending_attachment OWNER TO cuba;

--
-- TOC entry 231 (class 1259 OID 25994)
-- Name: sys_sending_message; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sys_sending_message (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer DEFAULT 1 NOT NULL,
    update_ts timestamp with time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    sys_tenant_id character varying(255),
    address_to text,
    address_cc text,
    address_bcc text,
    address_from character varying(100),
    caption character varying(500),
    email_headers character varying(500),
    content_text text,
    content_text_file_id uuid,
    deadline timestamp with time zone,
    status integer,
    date_sent timestamp without time zone,
    attempts_count integer,
    attempts_made integer,
    attachments_name text,
    body_content_type character varying(50)
);


ALTER TABLE public.sys_sending_message OWNER TO cuba;

--
-- TOC entry 203 (class 1259 OID 25618)
-- Name: sys_server; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sys_server (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    name character varying(255),
    is_running boolean,
    data text
);


ALTER TABLE public.sys_server OWNER TO cuba;

--
-- TOC entry 3471 (class 0 OID 26156)
-- Dependencies: 242
-- Data for Name: ratlab_certificate; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.ratlab_certificate (id, version, create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, title, aquired, code, description, owner_id) FROM stdin;
f406329f-556e-310c-2ea1-ec04f505826e	2	2021-03-02 17:01:52.982	admin	2021-03-03 21:16:39.594	admin	\N	\N	General 2	2021-03-10 15:56:00	C_G2	\N	bdb01fff-a8f4-37ac-e93c-eaca2fbc86cc
d587293e-2028-fff6-c85b-3edbff426118	2	2021-03-15 16:14:18.572	admin	2021-03-15 16:14:18.572	\N	2021-03-15 16:17:11.534	admin	Logos expert	2020-12-08 00:00:00	S_LOGOS	... .. . .. ... |	bea50b1e-d99d-1fbe-3d9b-c066a1674c1d
8829a13d-bfe9-b310-ce1b-c4e2651625eb	4	2021-03-03 21:52:57.484	admin	2021-03-15 16:19:19.409	admin	\N	admin	Drakkar master	2020-12-14 00:00:00	F_DM	d a	7be1ca03-1905-e711-87c1-9f1ad812ba20
a08df8e9-6c5a-41c1-2279-20e5cb2e4c2c	3	2021-03-03 21:16:22.508	admin	2021-03-15 16:19:19.409	admin	\N	admin	Greater security certificate	2019-03-05 00:00:00	S_GSC_10	Yet another certificate	7be1ca03-1905-e711-87c1-9f1ad812ba20
6805915f-eb67-99d9-26a4-3e43219fbf63	4	2021-03-02 17:01:33.293	admin	2021-03-15 16:19:24.343	admin	\N	admin	General 1	2021-03-09 01:23:00	C_G1	aaa	0630c942-5a35-c576-b7d3-135976e781f4
\.


--
-- TOC entry 3472 (class 0 OID 26164)
-- Dependencies: 243
-- Data for Name: ratlab_employee; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.ratlab_employee (id, version, create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, home_address_country, home_address_town, home_address_field1, home_address_latitude, home_address_longitude, home_address_field2, home_address_field3, home_address_field4, home_address_field5, name, position_, experience, since, laboratory_id, supervisor_id) FROM stdin;
9e79e75c-d264-16ca-c605-87e569dc55ee	5	2021-03-02 17:19:11.966	admin	2021-03-03 17:35:22.325	admin	\N	\N	Russia	Moscow	Solncevskaya st.	0.34	-2.34	1	23	E	123548	Semen	intern	2	2021-02-10 00:00:00	33f18727-5529-5468-c4e7-9bfaed245e23	bdb01fff-a8f4-37ac-e93c-eaca2fbc86cc
bdb01fff-a8f4-37ac-e93c-eaca2fbc86cc	6	2021-03-02 18:02:20.923	admin	2021-03-05 11:47:45.088	admin	\N	\N	dd	ff	d	\N	\N	4	5	6	7	Vasiliy	researcher	3	2020-12-15 00:00:00	0f9a39ea-1e5f-eefc-46f2-c13b695827f4	0630c942-5a35-c576-b7d3-135976e781f4
bea50b1e-d99d-1fbe-3d9b-c066a1674c1d	4	2021-03-15 16:14:18.58	admin	2021-03-15 16:15:54.615	admin	2021-03-15 16:17:11.507	admin	9	8	7	8	9	6	5	6	7	Innokenty	leadingResearcher	4	2020-02-05 00:00:00	\N	0630c942-5a35-c576-b7d3-135976e781f4
7be1ca03-1905-e711-87c1-9f1ad812ba20	9	2021-03-02 17:23:24.287	admin	2021-03-15 16:19:19.409	admin	\N	admin	[DELETED]	[DELETED]	[DELETED]	0	0	[DELETED]	[DELETED]	[DELETED]	[DELETED]	X	chiefExecutiveOfficer	30	2019-03-08 00:00:00	\N	\N
0630c942-5a35-c576-b7d3-135976e781f4	6	2021-03-02 17:21:45.389	admin	2021-03-15 16:19:24.343	admin	\N	admin	Russia	Moscow	Sharikoposhipnikoskaya street	\N	\N	52	11	A	123321	Iogann	director	20	2020-03-10 00:00:00	\N	7be1ca03-1905-e711-87c1-9f1ad812ba20
\.


--
-- TOC entry 3473 (class 0 OID 26172)
-- Dependencies: 244
-- Data for Name: ratlab_employee_research_link; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.ratlab_employee_research_link (employee_id, research_id) FROM stdin;
9e79e75c-d264-16ca-c605-87e569dc55ee	3723814f-bdde-20c8-934d-f0dadfa8efd7
\.


--
-- TOC entry 3474 (class 0 OID 26177)
-- Dependencies: 245
-- Data for Name: ratlab_laboratory; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.ratlab_laboratory (id, version, create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, address_country, address_town, address_field1, address_latitude, address_longitude, address_field2, address_field3, address_field4, address_field5, title, description, day_start, day_end, code) FROM stdin;
0f9a39ea-1e5f-eefc-46f2-c13b695827f4	2	2021-03-02 17:00:15.805	admin	2021-03-03 15:48:45.869	admin	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Behaviour	cba	07:00:00	18:00:00	BEH
33f18727-5529-5468-c4e7-9bfaed245e23	2	2021-03-02 16:59:45.453	admin	2021-03-03 15:48:59.079	admin	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Physical 1	abc	08:00:00	20:00:00	PHY_1
\.


--
-- TOC entry 3475 (class 0 OID 26185)
-- Dependencies: 246
-- Data for Name: ratlab_misc_resource; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.ratlab_misc_resource (id, version, create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, name, amount, type_, consumable) FROM stdin;
75e46da3-cbbf-9e0c-c5a3-8627732efb2c	2	2021-03-02 18:05:57.661	admin	2021-03-04 21:16:54.947	admin	\N	\N	Unit 1	1.00	device	f
e5d26710-cb48-22c3-f112-dfdfa45300f3	4	2021-03-02 18:05:04.453	admin	2021-03-05 18:07:07.554	admin	\N	\N	forceps	11.00	tool	f
01ddd34d-71ec-d343-2ee3-27c8a2c2c2f2	462	2021-03-02 18:04:21.049	admin	2021-03-19 22:52:55.665	admin	\N	\N	Tape	12291.00	consumable	t
366565fa-8a19-557e-12b6-d1fcf0129def	462	2021-03-02 18:03:35.948	admin	2021-03-19 22:52:55.665	admin	\N	\N	R2	413.00	chemical	t
a615a714-4309-4190-edd1-2d14f357538d	4	2021-03-02 18:05:20.748	admin	2021-03-05 18:46:08.338	admin	\N	\N	Large container	11.00	container	f
6bc3d139-c6f4-328e-3487-7437199a4b56	462	2021-03-02 18:03:27.29	admin	2021-03-19 22:52:55.665	admin	\N	\N	R1	440.00	chemical	t
\.


--
-- TOC entry 3476 (class 0 OID 26190)
-- Dependencies: 247
-- Data for Name: ratlab_rat; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.ratlab_rat (id, version, create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, name, color, checked) FROM stdin;
cb3dd096-1570-efb0-f53c-ec937317658c	1	2021-03-02 16:57:49.236	admin	2021-03-02 16:57:49.236	\N	\N	\N	Pinky	White	t
db7718e0-82d1-a0e2-72f6-52a04d66f6db	1	2021-03-02 16:58:55.908	admin	2021-03-02 16:58:55.908	\N	\N	\N	Pumpkin	Ginger	\N
bf5fa95b-4dee-7fc1-03e8-ae6a2328bbd8	1	2021-03-03 14:48:52.43	admin	2021-03-03 14:48:52.43	\N	\N	\N	Earl	Gray	t
f4d11f6d-bac0-fe6e-b54f-144162744088	2	2021-03-02 16:58:03.283	admin	2021-03-15 16:10:01.733	admin	\N	\N	Brain	White	f
294ff084-f962-f8f6-568f-10967499875a	2	2021-03-15 16:10:14.777	admin	2021-03-15 16:10:21.559	admin	\N	\N	Severus	Gray	t
6dc254ce-a29b-684e-3c8f-c29c443bbe2f	2	2021-03-02 16:58:37.684	admin	2021-03-02 16:58:37.684	\N	2021-03-15 16:17:27.903	admin	John	Black	\N
\.


--
-- TOC entry 3477 (class 0 OID 26198)
-- Dependencies: 248
-- Data for Name: ratlab_research; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.ratlab_research (id, version, create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, title, start_time, description, state) FROM stdin;
2c9c2fe9-913b-aea0-2e05-7be78c0f9ff3	26	2021-03-02 17:01:06.64	admin	2021-03-05 18:46:08.338	admin	\N	\N	Lack of resources	2021-03-09 20:00:00+00	\N	40
3723814f-bdde-20c8-934d-f0dadfa8efd7	5	2021-03-02 17:00:48.111	admin	2021-03-15 16:17:11.565	admin	\N	\N	Base behaviour	2021-03-16 20:00:00+00	\N	10
\.


--
-- TOC entry 3482 (class 0 OID 26971)
-- Dependencies: 253
-- Data for Name: ratlab_research_requirement; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.ratlab_research_requirement (id, version, create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, research_id, mandatory) FROM stdin;
f1c7f8dd-2cd5-9902-13c9-9e714cafafee	3	2021-03-05 17:45:47.521	admin	2021-03-05 18:07:07.554	admin	\N	\N	2c9c2fe9-913b-aea0-2e05-7be78c0f9ff3	f
4d1a9ae7-b3af-fac0-c2c0-c52e7b327a26	3	2021-03-05 17:45:47.531	admin	2021-03-05 18:07:07.554	admin	\N	\N	2c9c2fe9-913b-aea0-2e05-7be78c0f9ff3	f
\.


--
-- TOC entry 3483 (class 0 OID 26995)
-- Dependencies: 254
-- Data for Name: ratlab_resource_requirement; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.ratlab_resource_requirement (id, version, create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, research_id, mandatory, resource_id, provided, amount, consume) FROM stdin;
ef16209f-60be-6766-640c-e4d63f0fac09	3	2021-03-05 18:45:50.078	admin	2021-03-05 18:46:08.338	admin	\N	\N	2c9c2fe9-913b-aea0-2e05-7be78c0f9ff3	f	366565fa-8a19-557e-12b6-d1fcf0129def	0	35	f
77eb7728-cf2b-0da7-89e1-90892b6bc2c2	3	2021-03-05 18:45:50.085	admin	2021-03-05 18:46:08.338	admin	\N	\N	2c9c2fe9-913b-aea0-2e05-7be78c0f9ff3	f	a615a714-4309-4190-edd1-2d14f357538d	0	2	f
\.


--
-- TOC entry 3484 (class 0 OID 27001)
-- Dependencies: 255
-- Data for Name: ratlab_subject_requirement; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.ratlab_subject_requirement (id, version, create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, research_id, mandatory, subject_id) FROM stdin;
541b56f4-8f4d-758d-c1cd-557c5da609ac	1	2021-03-05 18:45:50.059	admin	2021-03-05 18:45:50.059	\N	\N	\N	2c9c2fe9-913b-aea0-2e05-7be78c0f9ff3	f	db7718e0-82d1-a0e2-72f6-52a04d66f6db
\.


--
-- TOC entry 3481 (class 0 OID 26919)
-- Dependencies: 252
-- Data for Name: report_execution; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.report_execution (id, create_ts, created_by, report_id, report_name, report_code, user_id, start_time, finish_time, is_success, cancelled, params, error_message, server_id, output_document_id) FROM stdin;
\.


--
-- TOC entry 3478 (class 0 OID 26870)
-- Dependencies: 249
-- Data for Name: report_group; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.report_group (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, title, code, locale_names, sys_tenant_id) FROM stdin;
4e083530-0b9c-11e1-9b41-6bdaa41bff94	2021-03-04 11:32:35.37737	admin	0	\N	\N	\N	\N	General	ReportGroup.default	en=General\nru=Общие	\N
361e3e49-3a9f-5896-240b-075b5457fe66	2021-03-04 11:45:19.613	admin	1	2021-03-04 11:45:19.613	\N	\N	\N	Rats	RATS	\N	\N
\.


--
-- TOC entry 3479 (class 0 OID 26881)
-- Dependencies: 250
-- Data for Name: report_report; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.report_report (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, name, code, description, locale_names, group_id, report_type, default_template_id, xml, roles_idx, screens_idx, input_entity_types_idx, rest_access, is_system, sys_tenant_id) FROM stdin;
aaeea142-c520-6936-4488-aa0cceaaa504	2021-03-04 11:42:57.799	admin	6	2021-03-04 11:45:39.967	admin	\N	\N	Rat list	\N	\N	\N	361e3e49-3a9f-5896-240b-075b5457fe66	10	87252193-f0e3-d4ca-e288-d38072ca94f1	{"metaClass":"report$Report","id":"aaeea142-c520-6936-4488-aa0cceaaa504","roles":[],"defaultTemplate":{"metaClass":"report$ReportTemplate","id":"87252193-f0e3-d4ca-e288-d38072ca94f1","code":"DEFAULT","customDefinedBy":"100","custom":"false","version":"1","outputNamePattern":"Rat list.xlsx","reportOutputType":"50","groovy":"false","report":{"metaClass":"report$Report","id":"aaeea142-c520-6936-4488-aa0cceaaa504"},"name":"Template for report \\"Rat list\\".xlsx","alterable":"false"},"bands":[{"metaClass":"report$BandDefinition","id":"35a5e634-33ea-e90b-6f9c-68108ad5ee48","orientation":"","childrenBandDefinitions":[{"metaClass":"report$BandDefinition","id":"2fa7ecb8-45ff-d7d5-d50e-66a53041f1d7","orientation":"0","childrenBandDefinitions":[],"name":"headerRats","parentBandDefinition":{"metaClass":"report$BandDefinition","id":"35a5e634-33ea-e90b-6f9c-68108ad5ee48"},"report":{"metaClass":"report$Report","id":"aaeea142-c520-6936-4488-aa0cceaaa504"},"dataSets":[],"position":"0"},{"metaClass":"report$BandDefinition","id":"86f8125f-e1cc-bf29-33f2-d39a706fb917","orientation":"0","childrenBandDefinitions":[],"name":"Rats","parentBandDefinition":{"metaClass":"report$BandDefinition","id":"35a5e634-33ea-e90b-6f9c-68108ad5ee48"},"report":{"metaClass":"report$Report","id":"aaeea142-c520-6936-4488-aa0cceaaa504"},"dataSets":[{"metaClass":"report$DataSet","id":"a6bb49c1-b254-86a0-996a-aab41103e196","type":"50","jsonSourceType":"10","name":"Dataset","listEntitiesParamName":"entities","useExistingView":"false","bandDefinition":{"metaClass":"report$BandDefinition","id":"86f8125f-e1cc-bf29-33f2-d39a706fb917"},"text":"return [[:]]","view":"{\\"entityClass\\":\\"ratlab_Rat\\",\\"name\\":\\"\\",\\"properties\\":{\\"name\\":{\\"name\\":\\"name\\",\\"fetchMode\\":\\"AUTO\\"},\\"color\\":{\\"name\\":\\"color\\",\\"fetchMode\\":\\"AUTO\\"},\\"checked\\":{\\"name\\":\\"checked\\",\\"fetchMode\\":\\"AUTO\\"},\\"id\\":{\\"name\\":\\"id\\",\\"fetchMode\\":\\"AUTO\\"}},\\"loadPartialEntities\\":false}"}],"position":"1"}],"name":"Root","report":{"metaClass":"report$Report","id":"aaeea142-c520-6936-4488-aa0cceaaa504"},"dataSets":[],"position":"0"},{"metaClass":"report$BandDefinition","id":"2fa7ecb8-45ff-d7d5-d50e-66a53041f1d7"},{"metaClass":"report$BandDefinition","id":"86f8125f-e1cc-bf29-33f2-d39a706fb917"}],"inputParameters":[{"metaClass":"report$ReportInputParameter","id":"4f791e0e-a2c4-cfb7-afeb-81a2dcaf52fd","lookup":"false","entityMetaClass":"ratlab_Rat","predefinedTransformation":"","type":"60","required":"true","validationOn":"false","defaultDateIsCurrent":"false","report":{"metaClass":"report$Report","id":"aaeea142-c520-6936-4488-aa0cceaaa504"},"name":"Rat","alias":"entities","position":"1"}],"validationOn":"false","reportType":"10","reportScreens":[],"group":{"metaClass":"report$ReportGroup","id":"361e3e49-3a9f-5896-240b-075b5457fe66","code":"RATS","title":"Rats","version":"1"},"inputEntityTypesIdx":",ratlab_Rat,","valuesFormats":[],"templates":[{"metaClass":"report$ReportTemplate","id":"87252193-f0e3-d4ca-e288-d38072ca94f1"}],"version":"4","system":"false","name":"Rat list"}	\N	\N	,ratlab_Rat,	\N	f	\N
a57d1d4b-8a62-9738-866a-ad8ac84477bd	2021-03-04 11:44:27.12	admin	8	2021-03-04 14:28:56.022	admin	\N	\N	Проверенные особи	\N	\N	\N	361e3e49-3a9f-5896-240b-075b5457fe66	10	6d33b9e3-89ed-6a43-52e9-4f46dba9f40a	{"metaClass":"report$Report","id":"a57d1d4b-8a62-9738-866a-ad8ac84477bd","roles":[],"defaultTemplate":{"metaClass":"report$ReportTemplate","id":"6d33b9e3-89ed-6a43-52e9-4f46dba9f40a","code":"DEFAULT","customDefinedBy":"100","custom":"false","version":"1","outputNamePattern":"Report for entity \\"Rat\\".docx","reportOutputType":"40","groovy":"false","report":{"metaClass":"report$Report","id":"a57d1d4b-8a62-9738-866a-ad8ac84477bd"},"name":"Template for report \\"Report for entity \\"Rat\\"\\".docx","alterable":"false"},"bands":[{"metaClass":"report$BandDefinition","id":"072fc8cd-5bf1-753c-6100-595a1819330c","orientation":"","childrenBandDefinitions":[{"metaClass":"report$BandDefinition","id":"d822c686-e346-de70-8c5d-a43210aaa9a8","orientation":"0","childrenBandDefinitions":[],"name":"Rats","parentBandDefinition":{"metaClass":"report$BandDefinition","id":"072fc8cd-5bf1-753c-6100-595a1819330c"},"report":{"metaClass":"report$Report","id":"a57d1d4b-8a62-9738-866a-ad8ac84477bd"},"dataSets":[{"metaClass":"report$DataSet","id":"02060946-45cc-ca27-55ff-1bbf1429f628","type":"20","jsonSourceType":"10","name":"Dataset","useExistingView":"false","bandDefinition":{"metaClass":"report$BandDefinition","id":"d822c686-e346-de70-8c5d-a43210aaa9a8"},"text":"select\\ne.name as \\"name\\",\\ne.color as \\"color\\",\\ne.id as \\"id\\"\\nfrom ratlab_Rat e where e.checked \\u003d ${checked1}","view":"null"}],"position":"0"}],"name":"Root","report":{"metaClass":"report$Report","id":"a57d1d4b-8a62-9738-866a-ad8ac84477bd"},"dataSets":[],"position":"0"},{"metaClass":"report$BandDefinition","id":"d822c686-e346-de70-8c5d-a43210aaa9a8"}],"inputParameters":[{"metaClass":"report$ReportInputParameter","id":"8cb86c67-b57a-dbf9-122c-dbce9862fe1e","lookup":"false","hidden":"false","defaultValue":"true","parameterClassName":"java.lang.Boolean","predefinedTransformation":"","type":"40","required":"true","validationOn":"false","defaultDateIsCurrent":"false","report":{"metaClass":"report$Report","id":"a57d1d4b-8a62-9738-866a-ad8ac84477bd"},"name":"Checked1","alias":"checked1","position":"1"}],"validationOn":"false","reportType":"10","reportScreens":[],"group":{"metaClass":"report$ReportGroup","id":"361e3e49-3a9f-5896-240b-075b5457fe66","code":"RATS","title":"Rats","version":"1"},"valuesFormats":[],"templates":[{"metaClass":"report$ReportTemplate","id":"6d33b9e3-89ed-6a43-52e9-4f46dba9f40a"}],"version":"6","system":"false","name":"Проверенные особи"}	\N	\N	\N	\N	f	\N
\.


--
-- TOC entry 3480 (class 0 OID 26899)
-- Dependencies: 251
-- Data for Name: report_template; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.report_template (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, report_id, code, output_type, is_default, is_custom, is_alterable_output, is_groovy, custom_defined_by, custom_class, output_name_pattern, name, content) FROM stdin;
87252193-f0e3-d4ca-e288-d38072ca94f1	2021-03-04 11:42:57.805	admin	1	2021-03-04 11:42:57.805	\N	\N	\N	aaeea142-c520-6936-4488-aa0cceaaa504	DEFAULT	50	f	f	f	f	100	\N	Rat list.xlsx	Template for report "Rat list".xlsx	\\x504b03041400080808005c5d6452000000000000000000000000130000005b436f6e74656e745f54797065735d2e786d6cb5923d4ec4301085af62b945b1b31408a1245b2c500212cb0106679258f19f3cde25b93d4e020d828262abb1e7bd79df5872b59fac61678ca4bdabf94e949ca153bed5aeaff9dbf1b1b8e58c12b8168c7758f31989ef9bea38072496671dd57c4829dc49496a400b247c409795ce470b295f632f03a8117a94d76579239577095d2ad292c19bea1e3b3899c41ea6dcdef6886888b3c3665c583587108c5690b22ecfaefd4129be08224fae1e1a74a0ab6ce0b2a99ef303a36ef15f89beebb4c2d6ab93cd238242446869404cd6084ab3c12d9fbd404c4f6073a29c8cdc147139f2528505ed7ea37ff838be7b3f5e8ebf10d6f35ff85524f9ba94ddf71e72fd30cd27504b0708817a964b020100006f020000504b03041400080808005c5d64520000000000000000000000000b0000005f72656c732f2e72656c738d8fcd0e82301084ef3c45b377297830c650b81813ae061fa096e527946ed35685b7b747311edcdb6467bec914d5326bf644e7473202f234038646513b9a5ec0adb9ec8ec07c90a6959a0c0a58d1435526c515b50c31e387d17a1621c60b1842b027cebd1a70963e258b267e3a72b30c51ba9e5ba926d923df67d981bb4f0694098bb701b346ba1e838045f317b9e94e34a59108ac592dfed3475d372a3c937acc68c28fda2f07b0ba15e0ea36071e57f2cdcc327903504b0708bf1ab902b60000002f010000504b03041400080808005c5d64520000000000000000000000000f000000786c2f776f726b626f6f6b2e786d6c9d935d4fc3201486eff72b2ae9ed46db19339bb68bc962b20b8df1eb9ec1e94a56a001e6e6bf977e993acdd2d91be0c0fbf43d8743b23c8ad2fb006db892290a6701f24052c5b8dca6e8edf57eba409eb14432522a0929fa048396d9243928bddb28b5f39c5e9a1415d65631c68616208899a90aa4dbc99516c4baa5de62536920cc14005694380a821b2c0897a825c4828e8108a277fb6a4a95a888e51b5e72fbd9b07a8c1e435179ce29ac14dd0b90b6f5a2a17444254dc12bd3d38e6c148f69727005ebd31a64ba6a777a1ef9076d5824e727bcfec5109c6a65546e67ae2e5d72188e146a42189cf33396d6796a794347d22c2ef373929134b717ea17386a09d9c4735f5277e13b878369d74dacefce3a8ebb73f8e460d21464a86a029e24c2f5f94b3d0f5defd7e39ab9a7813c1d7337d16b16a26fe8109230c8b904f6e80843ee20dcd10b771fa09fdd8da3acfdd3957fe747b1bff2a3040fce9fa59ceae7b57efe87fe47a8374b49499fb4570f0f8a391cd95b552796e0be7cd9e40b504b07085a5a43187f01000020040000504b03041400080808005c5d64520000000000000000000000001a000000786c2f5f72656c732f776f726b626f6f6b2e786d6c2e72656c73ad904d6bc3300c86eff91546f746490fa58c38bd8c41af6df6038ca37cd0c43696fa917f3f974259618c1da68b1042cffba06a779b2775a1c8a3771acabc0045cefa7674bd86cfe663b505c5625c6b26ef48c3420cbb3aab0e341949373c8c81558238d63088843744b603cd86731fc8a54de7e36c248db1c760ecc9f484eba2d860fcce803a53a95ec0aa31b127d170f5f1c40391301eefadcc131754b304fa4baaefbad1d2bbb7e7999cfc108ecf0050fb5643dcb725e06f462ccb44fcdf1a0fead3617d77a8f0e5d775f605504b07080d79d181cd000000b4010000504b03041400080808005c5d645200000000000000000000000018000000786c2f776f726b7368656574732f5368656574312e786d6cad95cb6ea3301440f7f90a6475db988474945690aa0daa349b59cd68d6aeb92956b08d7c9d4755cdbf8fc1d0a2b4aa9c0836e007e7dc8711e9fd5156d11e0c0aad32329bc62402c57521d44b46fefc7eba5e92082d5305abb4828cbc0292fbd5243d68b3c512c0460ea03023a5b5f51da5c84b900ca7ba06e55636da4866ddd0bc50ac0db0a27d4956741ec73fa86442114fb8933c042299d9eeea6bae65cdac781695b0af2dabc798108ade6c04875cf39d04657d2c062a47d40a4b51634f3b1641bcc2b083ab589fd620d3dcaff43c76016d582417cf6cf1892105371af5c64e5d5dbae4281c39348459fc5d3ca1b42e26cf1b46a470795e3c271929bc3df3fd259d7bc26a12b92be5ba42ffd80f23299ac34c22c98eedfd200a5b6624899bf3fd0c689f84cd88353b2011dfa1d5f2afdfd14ed1af68f38e361f859674b46414daa2a32d46a1dd74b49b0b6929fde848ea0f1db36c6032fa1099a6921f733e8266f6c11518dba639135a73b2a9ddb85ffd621252ba3f01503eb050a709953e0649d7bad26644eb3acc5a02df4231a2370ff2fecc2f52265f773509515ebd29d7d77f237a1f03bdbc69ed98e275a8d877774c751ea8166758533af89053fafef75f4dfe03504b0708e489b03bc501000042080000504b03041400080808005c5d645200000000000000000000000023000000786c2f776f726b7368656574732f5f72656c732f5368656574312e786d6c2e72656c738dcfb10ac2301006e0bd4f116e37691d44a4691711ba4a7d80905cd3629b845c14fbf66670b0e0e06dc771dfcf5fb7af65664f8c347927a1e2253074da9bc95909b7feb23b02a3a49c51b37728614582b629ea2bce2ae51f1aa7402c238e248c29859310a4475c14711fd0e5cbe0e3a2525ea31541e9bbb228f6657910f1db80a660793630eb55b49824702e28ad3312cf1eb07e0df84f9a1f8649e3d9ebc7822efd08fda8c03a232176a60291bb894db9a67803504b07088347e8e9b400000025010000504b03041400080808005c5d64520000000000000000000000000d000000786c2f7374796c65732e786d6cbd964d6fe2301086effc0acbf7624055c556844a5555692f7bd8b2d25e8d3321def547649b92f4d7ef244e200458c1aa5a4ef64cfccc3b1f4e583c955a9177705e5a93d0e9784209186153693609fdb17abd9b53e203372957d640422bf0f469395af8502978cb01024182f109cd43281e19f32207cdfdd81660d09359a779c0addb305f38e0a9af0f69c56693c903d35c1a1a098f5a5c03d1dcfdde1677c2ea8207b9964a86aa617518770dc5669914f062c5568309518b0385446b7c2e0bdfd1caf42a5eeaf80e4bd6a5d5cbf4257a3a1eff075abf48a8677a7fc2d05238eb6d16c65897363906a5809a309dfc4dcfb5b45653e4f515193fbf4dcf2023e3bfdc787ece6691b01c11fc2d326b8227c26e4dc0116ead7bcf61db98fc0779e70a9f9be1acb3815358651d0928026ad2d06db886787a253578f20d76e4bbd5dcf49f5cb043d4b8f69d4ea9d4059de819c4c2e90ee0cc2b7a48bb5e5505ca32780f07f1f6a7e3ba8bb7b62ec59bdd459cf52346df20a6822c0c737672939f18832d86a6b50d017bd5d7358c713928695e27090df9beab67fa224d0a25a4097db83f690dab31e7a47f02bae19c56e013c848395bc64f4047d0a57674bb6e54f066a9b73ae6cfecfc849619a947f92b46c34f443d65ed3272e28675f03eae17a1079fdd0c27651617834cb9921b53bfc5496e9dfc404e7d417f6d7d905945eb6f5b90e2c8b473bc5841892a82db0eee5299dda66b7ad0457851a8eab971b5e8ff223596fbb8d24df1cf7772ef26f5eb2ca1ba6a76bd3cd65ba98234ed4ea016ab9fa3ed5847afd1187cc10e7f0a96a33f504b0708e891b54b4e0200005a080000504b010214001400080808005c5d6452817a964b020100006f0200001300000000000000000000000000000000005b436f6e74656e745f54797065735d2e786d6c504b010214001400080808005c5d6452bf1ab902b60000002f0100000b00000000000000000000000000430100005f72656c732f2e72656c73504b010214001400080808005c5d64525a5a43187f010000200400000f0000000000000000000000000032020000786c2f776f726b626f6f6b2e786d6c504b010214001400080808005c5d64520d79d181cd000000b40100001a00000000000000000000000000ee030000786c2f5f72656c732f776f726b626f6f6b2e786d6c2e72656c73504b010214001400080808005c5d6452e489b03bc501000042080000180000000000000000000000000003050000786c2f776f726b7368656574732f5368656574312e786d6c504b010214001400080808005c5d64528347e8e9b40000002501000023000000000000000000000000000e070000786c2f776f726b7368656574732f5f72656c732f5368656574312e786d6c2e72656c73504b010214001400080808005c5d6452e891b54b4e0200005a0800000d0000000000000000000000000013080000786c2f7374796c65732e786d6c504b05060000000007000700d10100009c0a00000000
6d33b9e3-89ed-6a43-52e9-4f46dba9f40a	2021-03-04 11:44:27.124	admin	1	2021-03-04 11:44:27.124	\N	\N	\N	a57d1d4b-8a62-9738-866a-ad8ac84477bd	DEFAULT	40	f	f	f	f	100	\N	Report for entity "Rat".docx	Template for report "Report for entity "Rat"".docx	\\x504b03041400080808008d5d6452000000000000000000000000130000005b436f6e74656e745f54797065735d2e786d6cb593cd4ec33010845fc5f215252e1c1042497ae0e7083d9407b0ec4d6be13f79b7a57d7b3609eda1e500aa7a4b32b3f3cd3a4933df052fb650d0a5d8cadb7a26054493ac8bab567e2c5fab07299074b4daa708addc03ca79d72cf71950f06cc456ae89f2a35268d61034d6294364a54f2568e2dbb252599b4fbd0275379bdd2b932241a48a860cd935cfd0eb8d27f1b2e3c7538f021ea5789a8c03ab953a67ef8c26d6d536da134af543a87972f4e0da65bc6183545df3ce0b1667e15f89a9ef9d019bcc26f0480d433b0bb6ca858d851c4cf162a10bbde9c0818acd0b565171747d09fbb08d4905fe041c8c17114fb6fd4ac532d700227f09c1d747256817cf7a0c7675b45cb30702115f9d1fc558e1a05eb702edfd2fef622a306a07bc1a7f93ee1b504b070816e55e422301000065030000504b03041400080808008d5d64520000000000000000000000000b0000005f72656c732f2e72656c73ad92414bc4301085effd1561eedb74571091a67b11616f22f5070cc9b40db699908cbafbef8da2e0ca2a2b38b730f3defb78a4ddee97593d53ca9e838175dd80a260d9f9301a78e86f5757a0b260703873200307cab0edaaf69e6694a2c9938f591593900d4c22f15aeb6c275a30d71c2994cdc0694129cf34ea88f61147d29ba6b9d4e9ab0774952a7364ac7a4c238981174e4e3bb64f0b05a98b27a8fe10e99c441e066fe9e6437b22f8db05a89d3390766e0dfa37a4427397b8c82d27fa1bd2cf25e885041d0abebbae6209a024be74fe49b539930a63fcef9e682f141cb95358176f58ad3efa155df50a504b07086ddead65ec0000005e020000504b03041400080808008d5d645200000000000000000000000011000000776f72642f646f63756d656e742e786d6ced594b73db3610befb57a04a0fed410269c9b2acb194516dc7896b271e3b6d72eb80202cb22609068044a99dfef72e49f14d2624dbc925f1412288c587dd0ffb827cfe72e73a68cb84b4b9b718e8236d809847b9697bebc5e0b7f7af86b301928a782671b8c716833d938397cba3f3606e72ba7199a7102078721e2c069652fe1c63492de61239e23ef360ee890b9728188a350eb8307dc129931236701d7cac6953ec12db1b2430fa4905c8b5a9e0923fa911e52ee64f4f366511142cd78fa327d7c90026dd00b412806863488c7179a0203643308728a0515ab62f1334d206cd142468e083b435e780115b944770fbda039356caaadfc38ee2695fc6931962bf836a0474691b155d229e37fe10e07d382cc3766cb58fb44d60a4d306269ebab50d41c4bec68bc350e960db81accc095bd952a29b5a44a814c06ce5c77510255e69770fd44ef10c1f171532d7ad1cb1a4906993b5206e02e2db7d8881556a235802b2eb458df40523a6b4182b1364ca6a707c89a059d9b2ed62b011defcb07e98ae0f3d75becd1c837f4e2edee7f0959a0bab5b2c623bca7249546bb12474d9f464daede2f380099fdb5ee6a8be5f3d8e5afa620fe550aceec99add0b9e65596eee528cf0284df8880e7107516ee5c468bd18e59e6947b93b13fd542ffa69c3644992d44b124f82b13939bb6973d787daeaa99c682e580ab28f90bfd44a287c4914796d33483fd4da27eb8cbea9deb00dc7e6e08f7e06e6428e7dfec2c98044b5e040eae955b4ea934fcb762087544a3c54f64578547b270d234f8e6729501004a3601cd1a99f9dcdf01d7859f471779b933fab9307bec7f88df79c49127d4c5db3b392e388f4d07b5c68cf526b779d8126b1b56c97913eed0b92cbf6fa54d73bc34cb1ae975323d54fc79d814e31d05c5089b8e3ee249f62979bcc19a7fc124f9f754699412eb0dda839cc707ae993432a6b6613aadae16549383e3988e215cd2ba72cb76ddc299863518d84a829b4407ecbb86b6aef1e2de2b30cad5af83ba15d106f4b6406b7fe6f70d7826ffcac5a4e65b77e4f3f39f47b58eedd2cf00088da2d9d22414a3a470c2b531ca65ab6240133d84e312fbcfe49ac887cf689c7646cb2ae67807de0f2a3326258f4fa34a8f9be3dc172fa34850ea7cfcc2cba4598b5fa54ae52c222bd8a563e78a063eda548a9d385444e5ac64d359563423383fa1484e235b67735c8c3c465e5b80fd071f594a672db320d14a01e7fbf2eda66b2ee249f6258c505f8f296651acdacee48336ced7d261cc8e2943b5ce42ed8bd7e4aa95eb0974708fece83b9c1cdfdf2fc87e1105dc065483113197b6472ba9bfc8966237d34453fad7c025b2107703dc9cc9fd12644420f57afae1eaede5e5ca19bd5c75f90eda115f4b4ea1d84e9cde5afe8866c09d247b391f6c7f1f404710fdd118ade3da28f68388cb73fa8e067a3c31b517c7378ab96e738fc2c4ae3827838f40be8ca702af8f0eebe610fc3895a4414ccb7046e3fef89e1b06b01791837c97f00d96031d006f0ade0d81603b251bc59fe96f3e7045e9bacb4b264646455c17871a84a2df01a262eb813eb32d6b4b30605fe37b9839a558542451bc8a5d5d7e954dd8114043ee47449a93677a4ce8054c146d8aadf95663fa34ea2d2f2c50b03faf4c503d423f496b8acc63fcb1a35a9836bf5896df836c8bc0833dd77061b66db30f8e6f2abd017bdabc94edf48d0fff837dcf3d83fdf3db561b61d87515ff39dc4a60ddb91689b5f87c172c41f6a7fa1cf928caa9a9ec55f3ffe1553a7eb67da69c89d05cfd3d938e291721378ac3617e1c23b2242a6395c2af5c924eaaf84bdb6543634b852dccdc60e7b4a667151dbbc76e1386a7b8fc2a7e47f9ecba37f01504b070848ac59bb44050000391d0000504b03041400080808008d5d64520000000000000000000000001c000000776f72642f5f72656c732f646f63756d656e742e786d6c2e72656c73ad90cb0ac2301045f7fd8a307b9bea42449a7623825ba91f10d2e903db246446b17f6f4411051117ce6e18e6dcc3cdcbcb38883306ea9d55304f3310688dab7bdb2a3854dbd90a04b1b6b51e9c45051312944592ef71d01c7fa8eb3d8908b1a4a063f66b29c974386a4a9d471b2f8d0ba3e6b886567a6d8eba45b9c8b2a50caf0c281211e70d2c2a1d5a6405c4d380944618886af2f84b946b9adee0c699d388963f24ca3b15c4ae561076f51ce45707648eadfcdfe2c17d7a2c6e1eb97c6bb848ae504b0708cef3638ac2000000aa010000504b03041400080808008d5d64520000000000000000000000000f000000776f72642f7374796c65732e786d6ced5b5957e338167eef5f919377cab11db2702add87a528ea9caa1e6642f53c2bb6c01a6ccb252904fad7f79577cb72629b24d54cc303245a3e5d5d7d7793cdc7df9e037ff0841927345c0ccd0fa3e100870e7549f8b0187ebfbb3e990d075ca0d0453e0df162f882f9f0b75f7ff9b839e3e2c5c77c00f3437eb6590c3d21a233c3e08e8703c43fd00887d0774f5980047c650fc686323762d4c19c037ce01bd66834310244c26106639ed68002e230cae9bdf8e0d0c0a0f7f7c4c131144c37adf853e01700e36e00230580b5d9488271459d758043916c83611f095022f748c43334d406cd6568d3a00fd4763b2946b2a33242d0773fd0e9e55a8d7aeca37ada57496781d8efa01a0103a78d8801628febe804e02338ac15f1897889a5cd60b8df0626e9fa4a560cb1170d8ba5a174d85baaac8284adf6a2a8dbf110133980db8ac73a0845af4e77068ea6c6ccb0aa02b90fad88a808e412f4c050908144a48f62609658339c813cf7520d8f18462ef7305615e4f2ba71ec52d04cddd9d362b866e1593aff249f2f997af65410836e1b97ac93fec9b70bb35b4cc2cf0e2e39d1518b2992b2f9c9b45b25a21bcc224ac282a851543f0eadfa1286520855b7e801df325a7859ea3ee718f2285df8151fe23358b9571ae6e88739347449ecbb8ba13ff4437fac31574622fd481472d86c691c695a3c8820b286a234b4642c95b14bf05fe29c09e30a09744330b81fc77bc9e6adfabafa1559f984021fa3022c001ffbb8e36460443de080ebe915b4f4cea7653a5042521c8fc3fb222c657e93c184dc9ee5409bcde6c3c68ed569cee733e31bb02cfef5ed6b69fc5c371ef46d1b5fc2c76224326d27703b0b69c74a97ec092039cb77fbdc19689cec163f174a9ff40529797b73629a9d61268669aaaed131a77667a0a9016aae888402bbbb92a746405decdbb97e5168ce3aa3ccc01790204e0e0b9c5ef2949054c90872443bbcc209272707567cee9485135ed0d6ee04f4e1384682d55452a0a8a5dd35a5774b0f45b840ab07fe4e6897287c42bc807b781ddc6746d751112d27bc5bbe679ea6f99ec15f82c2f000c8212d4991216599a30133731c2c5aa6241bbcc2cf0287b2f8e38640fc314221e6c9964db300ec0357fea622caa0d727412de7ed1996df2729f4a9f388dd2a2da4d7ea13b91487857a05adb2f140c6da4b1025d305478e5ada4ddd951bc82936d4272054cbd8ded1a00c938415ab0f90553fa5097f6ae9062a50cb3f3e57f7e6e2ee4a9e1a308b32e0f2132e249a79dd916686f71261e6831777a84f59a9c0ee7595522fb07ffd65003f1f37672e75aef03d5afb82276d693bbb65697bd15c7455dbb2f66b0a09ef607386b843c89d8c228b614042ca6ecec1610ca1c7931fb43d187171ce09d2763a5c949a2f884b86865604fe278c7e4250b65856e3904bbe73908fc2876c100e4fbe2fcb22969a56445600889d2ccf55a48f86a2a9b4a1a655582e6a5676d4a06c1e2187c442a27b81a1dc020f282502ce809eace924fbf29fb50f0d682da84ec24895501545b6d538126b08a240924e4b75baf8fe6bec7d97023a16c37be4733c4c3abe7fb9658432f0ee8be17c9e362e71406e88ebe27031146c9d8f0d3de2e2ff7a38fcceb15be9faf775ecf94bd80e5d87f0dd9a4c871575fadcfd04a56f24f31f1806691948f4bb9cedcb696b52c813eb8c9764c9c1d78a2479c78f4c8e583663f7ca1e46f2e67560aa8bcf8fb8b8a55dbc379cbd5fb8f17ee0ee88f0b10a651ee38c53fb18dc2286e29a7b209d614d943650cbf54a68f7611e611f9f82c8439c707571eb184abc432b1f0f3e3399f556973fed6a2a46e1bdca9e2a775ff1730e982d20ce2e8651766af12ab2eb8b5bf6186e72bae94e2a1b91926791229d50dd69aa856a23e3c4cd668d46e373db9a4ecb32c7327412f626b124b359bac20d55655921d0dbbfc2ad9b0821e9df3a40a62ad9804c944b48399561c5996683e7ddd5351b9b9757eabc5a9c84b6478ca3df417235ee253d5f89ac8a6a5d45605d61a83540e1e3d9a8163a3767742d6478fdfae4e7925544aa05574de2d49834a1ff35254d951e3569929d9fd2b66ade247b7479933c7f4dd3a5463171269aedd59e9c5ecf638714af7029fb20cb701c30b5a219ea7d1756bfb8d62c5b4ad566daee529a3653359b6bf255c662ed3616eb48c662f53296aaeffbdb1b924c51db1892f90f32a4f1f5ccbcb86a32a4ad6633d9653693c3988dbddb6cec23998dfd6e3685d958ef6653379bfdd17ebc9bf6e323d17efc4efb82f6f6ff37ed89a6e9279987bc43468ec0ac621e69e99b57be59e1dbb2686aa89c77915bad628adab005e9fbfb01d8fb562f8055b36ce302540bc7ac9d7d7731f09eb62cd08a571b8b8e0c4e922ae1444439706f52af97ea931879f0443e676e4feac66ea8cb578cbb1f594bea9586bae68206f1d5c02e9a2613079a83514e586b0ebbcebbfb596f3bcffeaac9cbf6eeca89af160ea39ff85ea36bb46b41f8b71d18de643dbe957ad62ba8671d8c7aea15c03bf5de4205bb9568f62b88661f8c686ad1fc4eb49f97d4560aad7e44191f8c286a99f94e94bf5395b4ed61d297100a14b1eb09d2201dd6bd92f839450209e52c1fdf43b137b59a1f83f4d35cfe3cb4516bf98803dfbe64ebb4aace4c3565dde7154bb80e1ade0b217ec33d7a76009aa9ca11ce6a51f76ddca81cd607a4938b7baa44c5a7db339cb1b6bb94e18cf71cb82a1ced16b8b2a9fb8f5b0d06dac268de6ce0fa879151efbaefb6fbedbb6338edbbf61e7b74408f1d5db87a87bda2020c344394ef68fae9cb6df1e16fa78454f69fe0b1e30f4006f9b682cee9d757afb0277d85d0d6deb83b604aa0f035f297c98437191c2a76664eedc9694da9729756bbbb92aadde9ccee11b39cc40d172af9f4da5ba88a5d9ed69eecbd3248dcf58c107787090f3a3fd0c23cdf6c6c78e762898bf91b878daccb47bc9673754e593d5cfe9569cea7572d88b63305d8c73d45f67f025bee23f221fbd75fb7ea52a3a38a298ce0e7fa5a35054f277fb69c1237fb2a57c8374fab2e52b6c4afa2367bc3e275d5ad9a8dc7b52cd74fdbe412b5c05d7ef37f9c7fd1bff9af0bd962e5eb9efdade47d05806dd215125db9cf48731230f8823217b386c785346a4c7146f18fce03e609ceb894e0343d5c94c5eba1d7d891aced6995f8d9e8a1172110d15c7c739c65fe38d832f153e206ee25b4bcc4beff0de993ef84963bf95d65d846e622b3361372bab45d213bf9164ba41bafed2e6d7fa5e7ebf9eefb209edc3d6c747a7b23edd386eafd78b277ca74aff52f51fccf1ccd0c71d20107a8f7eb0cb34f0fc5b06a32383547f34b3589dc1eb35f11a77519d4919fd99abb5e0e305bbd1c907f0497fd17504b0708d40b2c9f7e090000af4c0000504b03041400080808008d5d645200000000000000000000000011000000776f72642f73657474696e67732e786d6ca5985b73da3a1080dff32b18bf27c2d00261423a99667a9b76a633b47d17b2823558974a02c3f9f5676d63cb36a495d53c10c0bb9f77577b330fef8e3c1b1da8364c8a5514df8da3111544264c6c57d1cf1f1f6e17d1c8582c129c494157d1899ae8dde3cd43be34d45a9032232008b3cc57516aad5a2264484a393677525101d75ea4e6d8c247bd45b9d489d292506340956768321ecf10c74c4435267e7b01e28c6869e48bbd239223f9f2c2082d51a01e4fca773c738037c300e31e40fb3852319e25d9732a6ce586a619b610469332656a1af6a1251ae7afc403fbba7366541eb5093cd41fb898365155017e744ffbb9bae8886107f52a90131f1339d6bbbdba05bc82c3dab08cd953696d8d31990fa6baf4956d34d6a72b595c94ca00dfcec17249e8e54b2fdc24c5da3680c42b8faf217a7125c333703c470b34e91a946cbd12b16750c2f056635e43140b090c68d9bda635e418141aa334c5894929ed07283197c5f1b7002dfa9e1d56d15e8be559ffb6d12f327579708921ff2457dde7fcaf7117b43d94e891d056131d7ba81429db9c8cdf5d94cca956920997a84a5d1ec7d5f055192a61587dc75bfa5d4bd76565726c18c55126f0521ee211aa3c6d8991eb62448a8495bddb89febe2efa7b4f4d4f125f97c4c280b32d39f6dacdb982d92a6c4bb4552c1dd935f42ffba42d7ac6167f6214da0f494fb5de26b4d56fd8266312f2513918871ebbfbcbc980c4e5c081d61334b4ae371fcf75a045ea351e6242096b7bca9a321266ba6840799edfe5d3329cf1fdfd027d832c2b5fbe7d6dc9df5f9387784fd167b17392389e129e0c36725a06bdc81e0eeb59e3ed7130e84de52d3dbaa0cf4221ad6e1fcfe278306686e2b8df1a493c9f0e06cd1184b96312e6d3e1419e232e139a4d9bf862112f065316d00b182f9743c709b2a745ea5bc630b17e3cd784ab93832a7e226de36cca7debcec2355ace48a89ace0aa43cebeeb5f56e9d62451ded72f00fa2bdc7e2808dc36dff0df751cbbd72d3726686ed7bf1dbf3be87cc89bbc20310619e495193eacd118166c3a1d67325c9e9861e2d15c5e39f41169b9dc2829acae53876c0105cfb539f580cbd9005b5bdb7d7ac2c6429cc24d9d1a49b1645d70a995cbd8685838656bb7860630d32a4b7e94223c79e7573d9ca1126cea19081d07d8c0d9e066d4c35562621a0c9e529cdccc1b30d7450eb5f1fbbbe25747890e708b4a4865c3e5067d1221d4e5aa0f4a4a8cea08b139949dd7ac00efa29e5ca033627cbcf5b01d66e326804d1e3cd08fe1ef265558dd5c7ce57ebeab7a151be8431072ac5d2ae59427f148472adfa20855db3ffe89348beec61a10643cef3315fee35f337bc50386078f6882374360c39cb8af7f50f558f37ff03504b0708a6d298bde8030000ee120000504b03041400080808008d5d645200000000000000000000000011000000646f6350726f70732f636f72652e786d6c6dccbb0e82401085e19ea720d3c380853144a4b3b6d00798ec8e40642fd9198dbebd480c369627e7cfb7ef9e6eca1f9c640cbe85baac20676f821d7ddfc2e57c2c76908b92b73405cf2dbc58a03b647b131b13129f52889c7464c967c84b63620b836a6c10c50cec48cab9f0f3790dc991ce33f518c9dca867dc54d5161d2b5952c20f58c455842f698d7272b2baf19ea645b10697077fe5df882776ec55b02e6b043c646f504b0708d8e67048a5000000f6000000504b03041400080808008d5d645200000000000000000000000010000000646f6350726f70732f6170702e786d6c9dcd310f82301005e0dd5fd17487a2833184c2629c1dd0bd690f6842ef9ab612f8f7d6c4c8eef62eeff2bda65bddcc1608d1124a7e2c2bce0035198ba3e48ffe565c388b49a151332148be41e45d7b687c200f215988f5fd1759c630d64b927c4ac9d742443d8153b1cc1f98cb818253299f6114340c56c395f4cb012671aaaab330a43f5a7cf69bcf435f6fdffad78535011a30c54e71d11ede504b0708d005600e9a000000fe000000504b010214001400080808008d5d645216e55e4223010000650300001300000000000000000000000000000000005b436f6e74656e745f54797065735d2e786d6c504b010214001400080808008d5d64526ddead65ec0000005e0200000b00000000000000000000000000640100005f72656c732f2e72656c73504b010214001400080808008d5d645248ac59bb44050000391d0000110000000000000000000000000089020000776f72642f646f63756d656e742e786d6c504b010214001400080808008d5d6452cef3638ac2000000aa0100001c000000000000000000000000000c080000776f72642f5f72656c732f646f63756d656e742e786d6c2e72656c73504b010214001400080808008d5d6452d40b2c9f7e090000af4c00000f0000000000000000000000000018090000776f72642f7374796c65732e786d6c504b010214001400080808008d5d6452a6d298bde8030000ee1200001100000000000000000000000000d3120000776f72642f73657474696e67732e786d6c504b010214001400080808008d5d6452d8e67048a5000000f60000001100000000000000000000000000fa160000646f6350726f70732f636f72652e786d6c504b010214001400080808008d5d6452d005600e9a000000fe0000001000000000000000000000000000de170000646f6350726f70732f6170702e786d6c504b05060000000008000800fc010000b61800000000
\.


--
-- TOC entry 3445 (class 0 OID 25769)
-- Dependencies: 216
-- Data for Name: sec_constraint; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sec_constraint (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, code, check_type, operation_type, entity_name, join_clause, where_clause, groovy_script, filter_xml, is_active, group_id) FROM stdin;
\.


--
-- TOC entry 3452 (class 0 OID 25864)
-- Dependencies: 223
-- Data for Name: sec_entity_log; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sec_entity_log (id, create_ts, created_by, sys_tenant_id, event_ts, user_id, change_type, entity, entity_instance_name, entity_id, string_entity_id, int_entity_id, long_entity_id, changes) FROM stdin;
b0fadaa4-b5ef-bc50-4196-b7d0a75f1005	2021-03-15 16:10:01.73	admin	\N	2021-03-15 16:10:01.711	60885987-1b61-4247-94c7-dff348347f93	M	ratlab_Rat	Brain	f4d11f6d-bac0-fe6e-b54f-144162744088	\N	\N	\N	checked-oldVl=true\nchecked=false\n
9e0cba7a-1d20-9718-7888-3ca4cdb8b60d	2021-03-15 16:10:14.778	admin	\N	2021-03-15 16:10:14.777	60885987-1b61-4247-94c7-dff348347f93	C	ratlab_Rat	Severus	294ff084-f962-f8f6-568f-10967499875a	\N	\N	\N	color=Gray\nname=Severus\nchecked=false\n
ea3cba94-c0bd-736d-3898-2d6890e499f4	2021-03-15 16:10:21.559	admin	\N	2021-03-15 16:10:21.559	60885987-1b61-4247-94c7-dff348347f93	M	ratlab_Rat	Severus	294ff084-f962-f8f6-568f-10967499875a	\N	\N	\N	checked-oldVl=false\nchecked=true\n
14f3f500-a002-65ad-4eac-9fc4e2ccbbc7	2021-03-15 16:14:18.603	admin	\N	2021-03-15 16:14:18.596	60885987-1b61-4247-94c7-dff348347f93	C	ratlab_Employee	Innokenty	bea50b1e-d99d-1fbe-3d9b-c066a1674c1d	\N	\N	\N	laboratory-id=33f18727-5529-5468-c4e7-9bfaed245e23\nname=Innokenty\nhomeAddress.country=9\n+note_main=black eyes\nsupervisor=\nhomeAddress.field5=7\nposition=leadingResearcher\nlaboratory=Physical 1\nhomeAddress.field4=6\nexperience=4\nhomeAddress.field3=5\nhomeAddress.field2=6\nhomeAddress.latitude=8.0\nhomeAddress.field1=7\nsince=2020-02-05 00\\:00\\:00.000\nhomeAddress.longitude=9.0\nhomeAddress.town=8\n
e2485b0a-a3fc-6b97-3039-5469e1c48307	2021-03-15 16:15:02.283	admin	\N	2021-03-15 16:15:02.282	60885987-1b61-4247-94c7-dff348347f93	M	ratlab_Employee	Innokenty	bea50b1e-d99d-1fbe-3d9b-c066a1674c1d	\N	\N	\N	supervisor-id=0630c942-5a35-c576-b7d3-135976e781f4\nsupervisor-oldVl=\nsupervisor=Iogann\n
887a1515-a559-7d54-5a49-fb64b86ba3a1	2021-03-15 16:15:54.615	admin	\N	2021-03-15 16:15:54.614	60885987-1b61-4247-94c7-dff348347f93	M	ratlab_Employee	Innokenty	bea50b1e-d99d-1fbe-3d9b-c066a1674c1d	\N	\N	\N	+note_main=black eyes. both.\n+note_main-oldVl=black eyes\n
970f6ebd-9c2c-fb62-c3c1-5dcc7c680ecb	2021-03-15 16:17:11.565	admin	\N	2021-03-15 16:17:11.539	60885987-1b61-4247-94c7-dff348347f93	D	ratlab_Employee	Iogann	0630c942-5a35-c576-b7d3-135976e781f4	\N	\N	\N	laboratory-id=33f18727-5529-5468-c4e7-9bfaed245e23\nname=Iogann\nhomeAddress.country=Russia\nsupervisor=X\nhomeAddress.field5=123321\nposition=director\nlaboratory=Physical 1\nhomeAddress.field4=A\nexperience=20\nhomeAddress.field3=11\nhomeAddress.field2=52\nhomeAddress.field1=Sharikoposhipnikoskaya street\nhomeAddress.latitude=\nsupervisor-id=7be1ca03-1905-e711-87c1-9f1ad812ba20\nsince=2020-03-10 00\\:00\\:00.000\nhomeAddress.longitude=\nhomeAddress.town=Moscow\n
55b48fab-8c37-5003-8932-13d948025a0a	2021-03-15 16:17:11.565	admin	\N	2021-03-15 16:17:11.558	60885987-1b61-4247-94c7-dff348347f93	D	ratlab_Employee	X	7be1ca03-1905-e711-87c1-9f1ad812ba20	\N	\N	\N	name=X\nhomeAddress.country=[DELETED]\nsupervisor=\nhomeAddress.field5=[DELETED]\nlaboratory=\nposition=chiefExecutiveOfficer\nhomeAddress.field4=[DELETED]\nexperience=30\nhomeAddress.field3=[DELETED]\nhomeAddress.field2=[DELETED]\nhomeAddress.field1=[DELETED]\nhomeAddress.latitude=0.0\nsince=2019-03-08 00\\:00\\:00.000\nhomeAddress.longitude=0.0\nhomeAddress.town=[DELETED]\n
865ee5d4-3cb9-669f-6677-3f0b843402bb	2021-03-15 16:17:11.564	admin	\N	2021-03-15 16:17:11.511	60885987-1b61-4247-94c7-dff348347f93	D	ratlab_Employee	Innokenty	bea50b1e-d99d-1fbe-3d9b-c066a1674c1d	\N	\N	\N	laboratory-id=33f18727-5529-5468-c4e7-9bfaed245e23\nname=Innokenty\nhomeAddress.country=9\nsupervisor=Iogann\nlaboratory=Physical 1\nhomeAddress.field5=7\nposition=leadingResearcher\nhomeAddress.field4=6\nhomeAddress.field3=5\nexperience=4\nhomeAddress.field2=6\nsupervisor-id=0630c942-5a35-c576-b7d3-135976e781f4\nhomeAddress.latitude=8.0\nhomeAddress.field1=7\nsince=2020-02-05 00\\:00\\:00.000\nhomeAddress.longitude=9.0\nhomeAddress.town=8\n
b352f1fb-f8a9-3174-ebc6-a16a9f9c1947	2021-03-15 16:17:27.904	admin	\N	2021-03-15 16:17:27.903	60885987-1b61-4247-94c7-dff348347f93	D	ratlab_Rat	John	6dc254ce-a29b-684e-3c8f-c29c443bbe2f	\N	\N	\N	color=Black\nname=John\nchecked=\n
02ab0e51-8cd4-a198-cb81-94f041897537	2021-03-15 16:19:19.409	admin	\N	2021-03-15 16:19:19.407	60885987-1b61-4247-94c7-dff348347f93	R	ratlab_Employee	X	7be1ca03-1905-e711-87c1-9f1ad812ba20	\N	\N	\N	experience-oldVl=\nhomeAddress.field2-oldVl=\nhomeAddress.field5-oldVl=\nlaboratory-oldVl=\nhomeAddress.field4-oldVl=\nsince-oldVl=\nhomeAddress.country=[DELETED]\nhomeAddress.country-oldVl=\nhomeAddress.field5=[DELETED]\nhomeAddress.longitude-oldVl=\nhomeAddress.field4=[DELETED]\nhomeAddress.field3=[DELETED]\nhomeAddress.latitude-oldVl=\nhomeAddress.field1-oldVl=\nhomeAddress.field2=[DELETED]\nsupervisor=\nhomeAddress.field1=[DELETED]\nname-oldVl=\nhomeAddress.town=[DELETED]\nexperience=30\nposition-oldVl=\nsupervisor-oldVl=\nhomeAddress.town-oldVl=\nhomeAddress.latitude=0.0\nhomeAddress.longitude=0.0\nlaboratory=\nposition=chiefExecutiveOfficer\nhomeAddress.field3-oldVl=\nsince=2019-03-08 00\\:00\\:00.000\nname=X\n
d8b0244a-f0c7-fe6e-f0b3-d544fe5f76f1	2021-03-15 16:19:24.343	admin	\N	2021-03-15 16:19:24.341	60885987-1b61-4247-94c7-dff348347f93	R	ratlab_Employee	Iogann	0630c942-5a35-c576-b7d3-135976e781f4	\N	\N	\N	experience-oldVl=\nhomeAddress.field2-oldVl=\nhomeAddress.field5-oldVl=\nhomeAddress.field4-oldVl=\nlaboratory-oldVl=\nsince-oldVl=\nhomeAddress.country=Russia\nhomeAddress.country-oldVl=\nhomeAddress.field5=123321\nhomeAddress.longitude-oldVl=\nhomeAddress.field4=A\nhomeAddress.field3=11\nhomeAddress.field2=52\nhomeAddress.field1-oldVl=\nhomeAddress.latitude-oldVl=\nsupervisor=X\nhomeAddress.field1=Sharikoposhipnikoskaya street\nname-oldVl=\nhomeAddress.town=Moscow\nexperience=20\nsupervisor-oldVl=\nposition-oldVl=\nhomeAddress.town-oldVl=\nhomeAddress.longitude=\nhomeAddress.latitude=\nsupervisor-id=7be1ca03-1905-e711-87c1-9f1ad812ba20\nlaboratory=\nposition=director\nsince=2020-03-10 00\\:00\\:00.000\nname=Iogann\nhomeAddress.field3-oldVl=\n
\.


--
-- TOC entry 3453 (class 0 OID 25881)
-- Dependencies: 224
-- Data for Name: sec_filter; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sec_filter (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, component, name, code, xml, user_id, global_default) FROM stdin;
b61d18cb-e79a-46f3-b16d-eaf4aebb10dd	2021-03-02 16:39:03.417392	admin	0	\N	\N	\N	\N	\N	[sec$User.browse].genericFilter	Search by role	\N	<?xml version="1.0" encoding="UTF-8"?><filter><and><c name="UrMxpkfMGn" class="com.haulmont.cuba.security.entity.Role" type="CUSTOM" locCaption="Role" entityAlias="u" join="join u.userRoles ur">ur.role.id = :component$genericFilter.UrMxpkfMGn32565<param name="component$genericFilter.UrMxpkfMGn32565">NULL</param></c></and></filter>	60885987-1b61-4247-94c7-dff348347f93	f
\.


--
-- TOC entry 3440 (class 0 OID 25693)
-- Dependencies: 211
-- Data for Name: sec_group; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sec_group (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, name, parent_id) FROM stdin;
0fa2b1a5-1d68-4d69-9fbd-dff348347f93	2021-03-02 16:39:03.408901	\N	0	\N	\N	\N	\N	\N	Company	\N
\.


--
-- TOC entry 3441 (class 0 OID 25709)
-- Dependencies: 212
-- Data for Name: sec_group_hierarchy; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sec_group_hierarchy (id, create_ts, created_by, sys_tenant_id, group_id, parent_id, hierarchy_level) FROM stdin;
\.


--
-- TOC entry 3446 (class 0 OID 25787)
-- Dependencies: 217
-- Data for Name: sec_localized_constraint_msg; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sec_localized_constraint_msg (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, entity_name, operation_type, values_) FROM stdin;
\.


--
-- TOC entry 3451 (class 0 OID 25851)
-- Dependencies: 222
-- Data for Name: sec_logged_attr; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sec_logged_attr (id, create_ts, created_by, entity_id, name) FROM stdin;
99275954-ae28-d949-cd4d-d6e4b03b7daa	2021-03-15 16:01:58.36	admin	22ee1027-3f96-a9eb-f3fd-2fbf03f96071	description
41f33fc5-ecc1-c9cc-451e-8927db630997	2021-03-15 16:01:58.36	admin	22ee1027-3f96-a9eb-f3fd-2fbf03f96071	state
002bfd32-2b28-ac17-8dfd-0df307ce64f3	2021-03-15 16:01:58.36	admin	22ee1027-3f96-a9eb-f3fd-2fbf03f96071	startTime
d1e3a8a6-81d6-782a-a81b-2d49ef4c76bc	2021-03-15 16:01:58.36	admin	22ee1027-3f96-a9eb-f3fd-2fbf03f96071	title
c9de4a15-3d40-fb8a-1e65-449386923635	2021-03-15 16:06:39.845	admin	38cc6f61-faec-6e6e-8aa9-2dc9e829ce24	name
33f0d145-d38a-d392-cef5-604b80647278	2021-03-15 16:06:39.845	admin	38cc6f61-faec-6e6e-8aa9-2dc9e829ce24	color
e575ced5-e10a-3cb4-28f3-169ded0a024b	2021-03-15 16:06:39.845	admin	38cc6f61-faec-6e6e-8aa9-2dc9e829ce24	checked
f504274e-5173-910b-13ad-eefa415c6e85	2021-03-15 16:07:11.943	admin	318a5c8a-20a5-e715-284f-5e18221e6924	homeAddress.longitude
a11c15aa-e64b-3dd0-5145-261c6843410b	2021-03-15 16:07:11.943	admin	318a5c8a-20a5-e715-284f-5e18221e6924	homeAddress.country
cd470899-15ff-83b0-7195-6b8473022be4	2021-03-15 16:07:11.942	admin	318a5c8a-20a5-e715-284f-5e18221e6924	laboratory
1a7a32ad-2243-bf53-b4a9-987445088c66	2021-03-15 16:07:11.943	admin	318a5c8a-20a5-e715-284f-5e18221e6924	since
8f67a22c-b256-eaff-a97e-da2ff68aa152	2021-03-15 16:07:11.942	admin	318a5c8a-20a5-e715-284f-5e18221e6924	homeAddress.field4
a94e1bb7-644c-057f-1141-66b1ddf22467	2021-03-15 16:07:11.943	admin	318a5c8a-20a5-e715-284f-5e18221e6924	+note_main
6aea0f36-922b-0a65-0c3b-fe57194daf34	2021-03-15 16:07:11.942	admin	318a5c8a-20a5-e715-284f-5e18221e6924	supervisor
5778b079-7f5c-0612-927c-1ad0a4f5afb2	2021-03-15 16:07:11.942	admin	318a5c8a-20a5-e715-284f-5e18221e6924	homeAddress.town
a28c5175-2f27-637b-35db-fc39a522b09e	2021-03-15 16:07:11.943	admin	318a5c8a-20a5-e715-284f-5e18221e6924	homeAddress.field1
c2292530-29f9-0ee6-26fe-a01c8959fd0b	2021-03-15 16:07:11.943	admin	318a5c8a-20a5-e715-284f-5e18221e6924	homeAddress.latitude
b5012f6b-e59b-51b6-2e6b-4508b446aab3	2021-03-15 16:07:11.943	admin	318a5c8a-20a5-e715-284f-5e18221e6924	homeAddress.field5
e4fcc9bb-7e15-7435-870c-802512dddf09	2021-03-15 16:07:11.943	admin	318a5c8a-20a5-e715-284f-5e18221e6924	experience
87c87985-af90-5040-2c13-151a82fbff11	2021-03-15 16:07:11.943	admin	318a5c8a-20a5-e715-284f-5e18221e6924	name
e01e4bb9-b23b-e8d7-a26b-93cadc9ec21a	2021-03-15 16:07:11.943	admin	318a5c8a-20a5-e715-284f-5e18221e6924	homeAddress.field3
f472f791-dada-000f-eb51-4e7cd589abf5	2021-03-15 16:07:11.942	admin	318a5c8a-20a5-e715-284f-5e18221e6924	homeAddress.field2
9197e819-bb81-2ef3-2e2d-084d6a0f7bfd	2021-03-15 16:07:11.943	admin	318a5c8a-20a5-e715-284f-5e18221e6924	position
\.


--
-- TOC entry 3450 (class 0 OID 25844)
-- Dependencies: 221
-- Data for Name: sec_logged_entity; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sec_logged_entity (id, create_ts, created_by, name, auto, manual) FROM stdin;
38cc6f61-faec-6e6e-8aa9-2dc9e829ce24	2021-03-15 16:06:39.845	admin	ratlab_Rat	t	f
22ee1027-3f96-a9eb-f3fd-2fbf03f96071	2021-03-15 16:01:58.357	admin	ratlab_Research	t	f
318a5c8a-20a5-e715-284f-5e18221e6924	2021-03-15 16:07:11.942	admin	ratlab_Employee	t	f
\.


--
-- TOC entry 3444 (class 0 OID 25757)
-- Dependencies: 215
-- Data for Name: sec_permission; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, permission_type, target, value_, role_id) FROM stdin;
4dba46b3-ad71-e119-6b7c-a894034ba134	2021-03-16 12:04:14.03	admin	1	2021-03-16 12:04:14.03	\N	\N	\N	20	*:read	1	e20f0d53-e348-d5be-cf76-e498c8da0770
0eda7a78-8cdb-1dc2-619f-03f6edc3d6e6	2021-03-16 12:04:14.03	admin	1	2021-03-16 12:04:14.03	\N	\N	\N	40	*	1	e20f0d53-e348-d5be-cf76-e498c8da0770
d12254b7-28c3-0ded-9837-a7f417e108d2	2021-03-16 12:04:14.03	admin	1	2021-03-16 12:04:14.03	\N	\N	\N	20	*:update	1	e20f0d53-e348-d5be-cf76-e498c8da0770
0d5ff678-5fac-c494-8103-91b4809b473c	2021-03-16 12:04:14.03	admin	1	2021-03-16 12:04:14.03	\N	\N	\N	20	*:create	1	e20f0d53-e348-d5be-cf76-e498c8da0770
603e3877-0f3e-e155-5d1e-8b338a52a052	2021-03-16 12:04:14.03	admin	1	2021-03-16 12:04:14.03	\N	\N	\N	20	*:delete	1	e20f0d53-e348-d5be-cf76-e498c8da0770
60746d76-e55c-9bd9-84ab-2b3b3e75a336	2021-03-16 12:04:14.03	admin	1	2021-03-16 12:04:14.03	\N	\N	\N	10	*	1	e20f0d53-e348-d5be-cf76-e498c8da0770
b42033b3-473a-d6f7-f9d9-877b58c21f63	2021-03-16 12:04:14.03	admin	1	2021-03-16 12:04:14.03	\N	\N	\N	30	*:*	2	e20f0d53-e348-d5be-cf76-e498c8da0770
\.


--
-- TOC entry 3456 (class 0 OID 25923)
-- Dependencies: 227
-- Data for Name: sec_presentation; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sec_presentation (id, create_ts, created_by, update_ts, updated_by, sys_tenant_id, component, name, xml, user_id, is_auto_save) FROM stdin;
\.


--
-- TOC entry 3469 (class 0 OID 26119)
-- Dependencies: 240
-- Data for Name: sec_remember_me; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sec_remember_me (id, create_ts, created_by, version, user_id, token) FROM stdin;
\.


--
-- TOC entry 3439 (class 0 OID 25682)
-- Dependencies: 210
-- Data for Name: sec_role; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sec_role (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, name, loc_name, description, is_default_role, role_type, security_scope) FROM stdin;
e20f0d53-e348-d5be-cf76-e498c8da0770	2021-03-16 12:04:14.03	admin	2	2021-03-16 12:04:47.584	admin	\N	\N	\N	system-full-access_rest	Full access		f	\N	REST
\.


--
-- TOC entry 3459 (class 0 OID 25970)
-- Dependencies: 230
-- Data for Name: sec_screen_history; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sec_screen_history (id, create_ts, created_by, sys_tenant_id, user_id, caption, url, entity_id, string_entity_id, int_entity_id, long_entity_id, substituted_user_id) FROM stdin;
78910d4d-d8b5-ccbf-ef22-14993c00e615	2021-03-05 11:59:05.657	admin	\N	60885987-1b61-4247-94c7-dff348347f93	New User	http://localhost:8080/app/open?screen=sec$User.edit&item=sec$User-67f5b06c-5259-6a89-b0bc-16c09e8b1dc3&params=item:sec$User-67f5b06c-5259-6a89-b0bc-16c09e8b1dc3	67f5b06c-5259-6a89-b0bc-16c09e8b1dc3	\N	\N	\N	\N
fbf67c15-ee02-06e9-2174-5bab37203a29	2021-03-16 11:21:01.091	admin	\N	60885987-1b61-4247-94c7-dff348347f93	User 'admin'	http://localhost:8080/app/open?screen=sec$User.edit&item=sec$User-60885987-1b61-4247-94c7-dff348347f93&params=item:sec$User-60885987-1b61-4247-94c7-dff348347f93	60885987-1b61-4247-94c7-dff348347f93	\N	\N	\N	\N
01a669e3-5978-db10-c600-8b3ce90e6aad	2021-03-16 12:03:10.671	admin	\N	60885987-1b61-4247-94c7-dff348347f93	User 'admin'	http://localhost:8080/app/open?screen=sec$User.edit&item=sec$User-60885987-1b61-4247-94c7-dff348347f93&params=item:sec$User-60885987-1b61-4247-94c7-dff348347f93	60885987-1b61-4247-94c7-dff348347f93	\N	\N	\N	\N
9f64dc89-768c-a70c-97ac-90a269bcac4c	2021-03-16 12:04:47.642	admin	\N	60885987-1b61-4247-94c7-dff348347f93	Role 'system-full-access (1)'	http://localhost:8080/app/open?screen=sec$Role.edit&item=sec$Role-e20f0d53-e348-d5be-cf76-e498c8da0770&params=item:sec$Role-e20f0d53-e348-d5be-cf76-e498c8da0770	e20f0d53-e348-d5be-cf76-e498c8da0770	\N	\N	\N	\N
dbcc224b-49d4-c0a4-7222-8d204666c19f	2021-03-16 12:05:11.879	admin	\N	60885987-1b61-4247-94c7-dff348347f93	New User	http://localhost:8080/app/open?screen=sec$User.edit&item=sec$User-6cbd5e18-a13a-5d9c-8ede-86184689e456&params=item:sec$User-6cbd5e18-a13a-5d9c-8ede-86184689e456	6cbd5e18-a13a-5d9c-8ede-86184689e456	\N	\N	\N	\N
\.


--
-- TOC entry 3457 (class 0 OID 25937)
-- Dependencies: 228
-- Data for Name: sec_search_folder; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sec_search_folder (folder_id, filter_component, filter_xml, user_id, presentation_id, apply_default, is_set, entity_type) FROM stdin;
\.


--
-- TOC entry 3447 (class 0 OID 25797)
-- Dependencies: 218
-- Data for Name: sec_session_attr; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sec_session_attr (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, name, str_value, datatype, group_id) FROM stdin;
\.


--
-- TOC entry 3470 (class 0 OID 26132)
-- Dependencies: 241
-- Data for Name: sec_session_log; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sec_session_log (id, version, create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, session_id, user_id, substituted_user_id, user_data, last_action, client_info, client_type, address, started_ts, finished_ts, server_id) FROM stdin;
\.


--
-- TOC entry 3442 (class 0 OID 25724)
-- Dependencies: 213
-- Data for Name: sec_user; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sec_user (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, login, login_lc, password, password_encryption, name, first_name, last_name, middle_name, position_, email, language_, time_zone, time_zone_auto, active, group_id, group_names, ip_mask, change_password_at_logon) FROM stdin;
a405db59-e674-4f63-8afe-269dda788fe8	2021-03-02 16:39:03.413685	\N	0	\N	\N	\N	\N	\N	anonymous	anonymous	\N	\N	Anonymous	\N	\N	\N	\N	\N	\N	\N	\N	t	0fa2b1a5-1d68-4d69-9fbd-dff348347f93	\N	\N	\N
67f5b06c-5259-6a89-b0bc-16c09e8b1dc3	2021-03-05 11:59:05.607	admin	1	2021-03-05 11:59:05.607	\N	\N	\N	\N	resource-scheduler	resource-scheduler	$2a$10$QiO21JiD/xKWgEa.Dt2IXOb8n2NUK7ztYf.D0sipQ5Jhy0Ov81VSO	bcrypt	\N	\N	\N	\N	\N	\N	en	\N	\N	t	0fa2b1a5-1d68-4d69-9fbd-dff348347f93	\N	\N	f
60885987-1b61-4247-94c7-dff348347f93	2021-03-02 16:39:03.411659	\N	2	2021-03-16 11:21:01.069	admin	\N	\N	\N	admin	admin	$2a$10$vQx8b8B7jzZ0rQmtuK4YDOKp7nkmUCFjPx6DMT.voPtetNHFOsaOu	bcrypt	Administrator	\N	\N	\N	\N	\N	\N	\N	f	t	0fa2b1a5-1d68-4d69-9fbd-dff348347f93	\N	\N	\N
6cbd5e18-a13a-5d9c-8ede-86184689e456	2021-03-16 12:05:11.862	admin	1	2021-03-16 12:05:11.862	\N	\N	\N	\N	test	test	$2a$10$lXZgOq0id6X1C38aAayXRus4grosy5fjBM3p9gkfTiDaNjLCdFy5m	bcrypt	t t	t	t	t	\N	\N	en	\N	\N	t	0fa2b1a5-1d68-4d69-9fbd-dff348347f93	\N	\N	f
\.


--
-- TOC entry 3443 (class 0 OID 25740)
-- Dependencies: 214
-- Data for Name: sec_user_role; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sec_user_role (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, user_id, role_id, role_name) FROM stdin;
6736effb-9dfc-4430-973a-69868606b09c	2021-03-02 16:39:03.415372	\N	0	\N	\N	\N	\N	60885987-1b61-4247-94c7-dff348347f93	\N	system-full-access
ae39ff41-1ba4-ee12-2356-03b517abe94a	2021-03-05 11:59:05.614	admin	1	2021-03-05 11:59:05.614	\N	\N	\N	67f5b06c-5259-6a89-b0bc-16c09e8b1dc3	\N	system-full-access
ba07ae63-3970-ea15-db24-cde144f5306f	2021-03-05 11:59:05.614	admin	1	2021-03-05 11:59:05.614	\N	\N	\N	67f5b06c-5259-6a89-b0bc-16c09e8b1dc3	\N	system-minimal
b8f50ef7-85f6-4e36-e1ac-c7e634be00fc	2021-03-16 11:21:01.053	admin	1	2021-03-16 11:21:01.053	\N	\N	\N	60885987-1b61-4247-94c7-dff348347f93	\N	rest-api-access
fdcc4f45-6831-a377-89b8-b2dfab6a700f	2021-03-16 12:05:11.862	admin	1	2021-03-16 12:05:11.862	\N	\N	\N	6cbd5e18-a13a-5d9c-8ede-86184689e456	\N	rest-api-access
c42fab2e-7a1f-67ab-ef5f-14871cbd1e74	2021-03-16 12:05:11.862	admin	1	2021-03-16 12:05:11.862	\N	\N	\N	6cbd5e18-a13a-5d9c-8ede-86184689e456	e20f0d53-e348-d5be-cf76-e498c8da0770	\N
\.


--
-- TOC entry 3448 (class 0 OID 25812)
-- Dependencies: 219
-- Data for Name: sec_user_setting; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sec_user_setting (id, create_ts, created_by, user_id, client_type, name, value_) FROM stdin;
a3370525-3fca-2a1b-a1d4-65f3fa28aedf	2021-03-02 16:57:26.82	admin	60885987-1b61-4247-94c7-dff348347f93	W	ratlab_Laboratory.browse	<?xml version="1.0" encoding="UTF-8"?>\n\n<settings>\n  <components>\n    <component name="split"/>\n    <component name="filter">\n      <defaultFilter/>\n    </component>\n    <component name="table"/>\n  </components>\n</settings>\n
55d57ab5-acd8-67b2-3093-a6bfb838bcee	2021-03-02 16:57:39.178	admin	60885987-1b61-4247-94c7-dff348347f93	W	ratlab_Rat.browse	<?xml version="1.0" encoding="UTF-8"?>\n\n<settings>\n  <components>\n    <component name="filter">\n      <defaultFilter/>\n    </component>\n    <component name="ratsTable"/>\n  </components>\n</settings>\n
da4097da-89c6-21be-2f05-cf467697e0f7	2021-03-02 17:01:09.874	admin	60885987-1b61-4247-94c7-dff348347f93	W	ratlab_Certificate.browse	<?xml version="1.0" encoding="UTF-8"?>\n\n<settings>\n  <components>\n    <component name="filter">\n      <defaultFilter/>\n    </component>\n    <component name="certificatesTable"/>\n  </components>\n</settings>\n
55d8f59d-454d-5076-430f-a747653d7433	2021-03-02 17:01:58.02	admin	60885987-1b61-4247-94c7-dff348347f93	W	ratlab_Employee.browse	<?xml version="1.0" encoding="UTF-8"?>\n\n<settings>\n  <components>\n    <component name="filter">\n      <defaultFilter/>\n    </component>\n    <component name="employeesTable"/>\n  </components>\n</settings>\n
4ca632e1-69d1-9507-4117-718f58f40a05	2021-03-02 17:02:03.075	admin	60885987-1b61-4247-94c7-dff348347f93	W	ratlab_MiscResource.browse	<?xml version="1.0" encoding="UTF-8"?>\n\n<settings>\n  <components>\n    <component name="split"/>\n    <component name="filter">\n      <defaultFilter/>\n    </component>\n    <component name="table"/>\n  </components>\n</settings>\n
a0a343af-f751-6de3-0df2-f3c130c9173e	2021-03-05 13:11:09.776	admin	60885987-1b61-4247-94c7-dff348347f93	W	sec$User.browse	<?xml version="1.0" encoding="UTF-8"?>\n\n<settings>\n  <components>\n    <component name="genericFilter">\n      <defaultFilter/>\n    </component>\n    <component name="usersTable" textSelection="false" presentation=""/>\n  </components>\n</settings>\n
763e178d-ea1c-6be0-1cfc-877babb1be0b	2021-03-03 21:51:04.051	admin	60885987-1b61-4247-94c7-dff348347f93	W	ratlab_Employee.edit	<?xml version="1.0" encoding="UTF-8"?>\n\n<settings> \n  <components> \n    <component name="certificatesTable" textSelection="false" presentation=""/> \n  </components> \n</settings>\n
47b72763-35b5-c532-7404-29c3275e640a	2021-03-04 11:40:25.612	admin	60885987-1b61-4247-94c7-dff348347f93	W	commonLookup	<?xml version="1.0" encoding="UTF-8"?>\n\n<settings>\n  <components>\n    <component name="filter">\n      <defaultFilter/>\n      <maxResults>100</maxResults>\n    </component>\n    <component name="table"/>\n  </components>\n</settings>\n
4a0ff298-315a-9911-302a-a56ae2bbf669	2021-03-04 11:45:24.519	admin	60885987-1b61-4247-94c7-dff348347f93	W	report$ReportGroup.browse	<?xml version="1.0" encoding="UTF-8"?>\n\n<settings>\n  <components>\n    <component name="filterWithoutId">\n      <defaultFilter/>\n    </component>\n    <component name="reportGroupsTable"/>\n  </components>\n</settings>\n
c5f485ad-a431-2a05-1118-81068365f513	2021-03-04 11:45:27.436	admin	60885987-1b61-4247-94c7-dff348347f93	W	report$Report.browse	<?xml version="1.0" encoding="UTF-8"?>\n\n<settings>\n  <components>\n    <component name="genericFilter">\n      <defaultFilter/>\n    </component>\n    <component name="table">\n      <columns sortProperty="group" sortAscending="true">\n        <columns id="group" width="200" visible="true"/>\n        <columns id="locName" visible="true"/>\n        <columns id="description" visible="true"/>\n        <columns id="code" visible="true"/>\n      </columns>\n    </component>\n  </components>\n</settings>\n
69cae5fa-954d-2e7e-918c-7c1810103d5d	2021-03-04 11:51:52.983	admin	60885987-1b61-4247-94c7-dff348347f93	W	sys$Category.browse	<?xml version="1.0" encoding="UTF-8"?>\n\n<settings>\n  <components>\n    <component name="categoriesFilter">\n      <defaultFilter/>\n    </component>\n    <component name="split"/>\n    <component name="categoryTable"/>\n    <component name="attributesTable"/>\n  </components>\n</settings>\n
a1e3aebd-f47a-7c99-26fb-c177bbda547f	2021-03-04 11:51:50.529	admin	60885987-1b61-4247-94c7-dff348347f93	W	sys$Category.edit	<?xml version="1.0" encoding="UTF-8"?>\n\n<settings> \n  <components> \n    <component name="localizedGroupBox"/>  \n    <component name="categoryAttrsFrame.categoryAttrsTable" textSelection="false" presentation=""/>  \n    <component name="attributesLocationFrame.sourceDataGrid"/> \n  </components> \n</settings>\n
63d7db02-f69e-b3ad-9244-9318183e2cec	2021-03-04 13:43:18.927	admin	60885987-1b61-4247-94c7-dff348347f93	W	appWindowMode	TABBED
304a63cb-aeff-3ef9-a9e5-2e44163f170f	2021-03-04 13:43:18.952	admin	60885987-1b61-4247-94c7-dff348347f93	W	userDefaultScreen	\N
f70dd9e3-66cd-bace-6080-e8c1833ea9df	2021-03-15 16:19:26.605	admin	60885987-1b61-4247-94c7-dff348347f93	W	entityRestore	<?xml version="1.0" encoding="UTF-8"?>\n\n<settings>\n  <components>\n    <component name="ratlab_EmployeeGenericFilter">\n      <defaultFilter/>\n    </component>\n  </components>\n</settings>\n
279dff30-bc39-7abd-a9fe-b5d6a95ecdb0	2021-03-04 13:43:18.916	admin	60885987-1b61-4247-94c7-dff348347f93	W	appWindowTheme	hover
d1fb19a7-0f6c-8040-8f2a-eebb5d0c5a44	2021-03-02 19:27:22.25	admin	60885987-1b61-4247-94c7-dff348347f93	W	ratlab_Research.browse	<?xml version="1.0" encoding="UTF-8"?>\n\n<settings> \n  <components> \n    <component name="split"> \n      <position value="41.017487" unit="%"/> \n    </component>  \n    <component name="filter"> \n      <defaultFilter/> \n    </component>  \n    <component name="table"/>  \n    <component name="employeesTable"/>  \n    <component name="resourceRequirementsTable" textSelection="false" presentation=""/>  \n    <component name="subjectRequirementsTable"/> \n  </components> \n</settings>\n
72374c21-963f-abec-390c-9f73a6ce6af1	2021-03-16 12:04:47.636	admin	60885987-1b61-4247-94c7-dff348347f93	W	sec$Role.edit	<?xml version="1.0" encoding="UTF-8"?>\n\n<settings>\n  <components>\n    <component name="screensTabFrame.screenPermissionsTree"/>\n    <component name="screensTabFrame.screensEditPane"/>\n    <component name="entitiesTabFrame.entityWildcardGroupBox"/>\n    <component name="entitiesTabFrame.contentSplit"/>\n    <component name="entitiesTabFrame.entityPermissionsTable"/>\n    <component name="entitiesTabFrame.editPane"/>\n    <component name="attributesTabFrame.attributeWildcardGroupBox"/>\n    <component name="attributesTabFrame.contentSplit"/>\n    <component name="attributesTabFrame.propertyPermissionsTable"/>\n    <component name="attributesTabFrame.editPane"/>\n    <component name="specificTabFrame.contentSplit"/>\n    <component name="specificTabFrame.specificPermissionsTree"/>\n    <component name="specificTabFrame.specificEditPane"/>\n    <component name="uiTabFrame.contentSplit"/>\n    <component name="uiTabFrame.uiPermissionsTable">\n      <columns>\n        <columns id="screen" visible="true"/>\n        <columns id="component" visible="true"/>\n        <columns id="permissionVariant" visible="true"/>\n      </columns>\n      <groupProperties>\n        <property id="screen"/>\n      </groupProperties>\n    </component>\n    <component name="uiTabFrame.editPane"/>\n  </components>\n</settings>\n
23449359-aeae-8b27-b9ae-359292d534af	2021-03-05 11:59:08.276	admin	60885987-1b61-4247-94c7-dff348347f93	W	sec$User.lookup	<?xml version="1.0" encoding="UTF-8"?>\n\n<settings>\n  <components>\n    <component name="genericFilter">\n      <defaultFilter/>\n    </component>\n    <component name="usersTable"/>\n  </components>\n</settings>\n
0bb9f98d-096c-a73b-1990-fe42ba180234	2021-03-05 12:02:41.905	admin	60885987-1b61-4247-94c7-dff348347f93	W	sys$ScheduledRunningTasksScreen	<?xml version="1.0" encoding="UTF-8"?>\n\n<settings>\n  <components>\n    <component name="tasksFilter">\n      <defaultFilter/>\n    </component>\n    <component name="scheduledTasksTable"/>\n  </components>\n</settings>\n
cac7a49f-f09b-406c-40d0-926304f37d52	2021-03-15 16:08:09.142	admin	60885987-1b61-4247-94c7-dff348347f93	W	entityLog	<?xml version="1.0" encoding="UTF-8"?>\n\n<settings>\n  <components>\n    <component name="split1"/>\n    <component name="filterWithoutId">\n      <defaultFilter/>\n    </component>\n    <component name="entityLogTable"/>\n    <component name="entityLogAttrTable"/>\n    <component name="split2"/>\n    <component name="loggedEntityTable"/>\n    <component name="attributesBox"/>\n  </components>\n</settings>\n
\.


--
-- TOC entry 3449 (class 0 OID 25827)
-- Dependencies: 220
-- Data for Name: sec_user_substitution; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sec_user_substitution (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, user_id, substituted_user_id, start_date, end_date) FROM stdin;
\.


--
-- TOC entry 3455 (class 0 OID 25910)
-- Dependencies: 226
-- Data for Name: sys_app_folder; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sys_app_folder (folder_id, filter_component, filter_xml, visibility_script, quantity_script, apply_default) FROM stdin;
\.


--
-- TOC entry 3465 (class 0 OID 26074)
-- Dependencies: 236
-- Data for Name: sys_attr_value; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sys_attr_value (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, category_attr_id, code, entity_id, string_entity_id, int_entity_id, long_entity_id, string_value, integer_value, double_value, decimal_value, date_value, date_wo_time_value, boolean_value, entity_value, string_entity_value, int_entity_value, long_entity_value, parent_id) FROM stdin;
0fc1ce6f-7f3a-0dd9-c0ad-4b6316901d25	2021-03-04 13:42:57.79	admin	1	2021-03-04 13:42:57.79	\N	\N	\N	460c3ff2-41a4-4a3b-da3f-c91a25e89cd9	note_main	0630c942-5a35-c576-b7d3-135976e781f4	\N	\N	\N	Owes 2 reports	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
93ef0ec0-549e-4e2c-6b87-907f21bc53d8	2021-03-05 11:43:34.072	admin	1	2021-03-05 11:43:34.072	\N	\N	\N	460c3ff2-41a4-4a3b-da3f-c91a25e89cd9	note_main	9e79e75c-d264-16ca-c605-87e569dc55ee	\N	\N	\N	ddd	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
b4f3369d-a7cc-d5a2-51ae-d38a1b475c74	2021-03-05 11:47:45.064	admin	1	2021-03-05 11:47:45.064	\N	\N	\N	460c3ff2-41a4-4a3b-da3f-c91a25e89cd9	note_main	bdb01fff-a8f4-37ac-e93c-eaca2fbc86cc	\N	\N	\N	test vasiliy!!	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
e4d96ceb-dcdf-2f72-d3be-274ab8dda4ea	2021-03-05 14:11:15.568	admin	1	2021-03-05 14:11:15.568	\N	\N	\N	460c3ff2-41a4-4a3b-da3f-c91a25e89cd9	note_main	7be1ca03-1905-e711-87c1-9f1ad812ba20	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
25aee366-cc21-276c-3720-253f5950e978	2021-03-15 16:14:18.583	admin	4	2021-03-15 16:15:54.615	admin	2021-03-15 16:17:11.511	admin	460c3ff2-41a4-4a3b-da3f-c91a25e89cd9	note_main	bea50b1e-d99d-1fbe-3d9b-c066a1674c1d	\N	\N	\N	black eyes. both.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3463 (class 0 OID 26048)
-- Dependencies: 234
-- Data for Name: sys_category; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sys_category (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, name, special, entity_type, is_default, discriminator, locale_names) FROM stdin;
7d857b18-15bb-423b-ab88-4faa21b3a216	2021-03-04 11:51:50.495	admin	1	2021-03-04 11:51:50.495	\N	\N	\N	Заметка	\N	ratlab_Employee	t	0	\N
\.


--
-- TOC entry 3464 (class 0 OID 26058)
-- Dependencies: 235
-- Data for Name: sys_category_attr; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sys_category_attr (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, category_entity_type, name, code, description, category_id, entity_class, data_type, default_string, default_int, default_double, default_decimal, default_date, default_date_wo_time, default_date_is_current, default_boolean, default_entity_value, default_str_entity_value, default_int_entity_value, default_long_entity_value, enumeration, order_no, screen, required, lookup, target_screens, width, rows_count, is_collection, join_clause, where_clause, filter_xml, locale_names, locale_descriptions, enumeration_locales, attribute_configuration_json) FROM stdin;
460c3ff2-41a4-4a3b-da3f-c91a25e89cd9	2021-03-04 11:51:50.482	admin	1	2021-03-04 11:51:50.482	\N	\N	\N	ratlab_Employee	Основное	note_main	Основная заметка	7d857b18-15bb-423b-ab88-4faa21b3a216	\N	STRING	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	f	f	ratlab_Employee.edit#form,ratlab_Employee.browse#employeesTable	\N	\N	f	\N	\N	\N	\N	\N	\N	{"id":"460c3ff2-41a4-4a3b-da3f-c91a25e89cd9-Configuration","__state":1}
\.


--
-- TOC entry 3433 (class 0 OID 25627)
-- Dependencies: 204
-- Data for Name: sys_config; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sys_config (id, create_ts, created_by, version, update_ts, updated_by, name, value_) FROM stdin;
a48b200a-fb61-1af5-b3a0-a0fca3ac0ada	2021-03-05 13:07:44.071	admin	1	2021-03-05 13:07:44.071	\N	cuba.schedulingActive	true
\.


--
-- TOC entry 3431 (class 0 OID 25611)
-- Dependencies: 202
-- Data for Name: sys_db_changelog; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sys_db_changelog (script_name, create_ts, is_init) FROM stdin;
10-cuba/init/postgres/create-db.sql	2021-03-02 16:39:03.427875	1
10-cuba/update/postgres/01/01-010-addValueIdToEntityLog.sql	2021-03-02 16:39:03.443774	1
10-cuba/update/postgres/01/01-020-dropDbUpdatePKey.sql	2021-03-02 16:39:03.448158	1
10-cuba/update/postgres/01/01-030-add_EntityLogAttr_messagesPack.sql	2021-03-02 16:39:03.45217	1
10-cuba/update/postgres/01/01-040-renameUserPosition.sql	2021-03-02 16:39:03.456926	1
10-cuba/update/postgres/01/01-050-addUserLanguage.sql	2021-03-02 16:39:03.460492	1
10-cuba/update/postgres/01/01-050-sysFtsQueue.sql	2021-03-02 16:39:03.46375	1
10-cuba/update/postgres/01/01-055-createReportTables.sql	2021-03-02 16:39:03.466909	1
10-cuba/update/postgres/01/01-060-addReportParameterPosition.sql	2021-03-02 16:39:03.470139	1
10-cuba/update/postgres/01/01-070-addCodeInFolder.sql	2021-03-02 16:39:03.473253	1
10-cuba/update/postgres/01/01-080-SessionAttributes.sql	2021-03-02 16:39:03.476071	1
10-cuba/update/postgres/01/01-090-ChangeReportKeys.sql	2021-03-02 16:39:03.479064	1
10-cuba/update/postgres/01/01-100-EntityStatistics.sql	2021-03-02 16:39:03.481869	1
10-cuba/update/postgres/01/01-100-addPresentations.sql	2021-03-02 16:39:03.484736	1
10-cuba/update/postgres/01/01-110-AddFieldInSysFolder.sql	2021-03-02 16:39:03.487699	1
10-cuba/update/postgres/01/01-120-AddCodeFieldInSecFilter.sql	2021-03-02 16:39:03.490244	1
10-cuba/update/postgres/01/01-130-createReportValueFormatTable.sql	2021-03-02 16:39:03.493024	1
10-cuba/update/postgres/01/01-140-AddTabHistory.sql	2021-03-02 16:39:03.495709	1
10-cuba/update/postgres/01/01-150-CreateIndexes.sql	2021-03-02 16:39:03.498347	1
10-cuba/update/postgres/01/01-160-screenHistory.sql	2021-03-02 16:39:03.501328	1
10-cuba/update/postgres/01/01-170-entityStatisticsFetchUI.sql	2021-03-02 16:39:03.504245	1
10-cuba/update/postgres/01/01-180-changeAppFoldersScriptsLength.sql	2021-03-02 16:39:03.507162	1
10-cuba/update/postgres/01/01-190-renameDoubleNameInSysFolder.sql	2021-03-02 16:39:03.50987	1
10-cuba/update/postgres/01/01-200-deleteCodeInSysFolders.sql	2021-03-02 16:39:03.512399	1
10-cuba/update/postgres/01/01-210-updateTabNameInSysFolder.sql	2021-03-02 16:39:03.515026	1
10-cuba/update/postgres/01/01-220-reportTablesChangeColumns.sql	2021-03-02 16:39:03.517577	1
10-cuba/update/postgres/01/01-230-reportParameterAddEnumClass.sql	2021-03-02 16:39:03.519969	1
10-cuba/update/postgres/01/01-240-userIpMask.sql	2021-03-02 16:39:03.522422	1
10-cuba/update/postgres/01/01-250-entityStatLookupScreenThreshold.sql	2021-03-02 16:39:03.52492	1
10-cuba/update/postgres/01/01-260-reportTemplatesTable.sql	2021-03-02 16:39:03.527473	1
10-cuba/update/postgres/01/01-270-sendingMessagesHistory.sql	2021-03-02 16:39:03.529944	1
10-cuba/update/postgres/01/01-280-addApplyDefault.sql	2021-03-02 16:39:03.532598	1
10-cuba/update/postgres/01/01-290-addIsSetToSearchFolder.sql	2021-03-02 16:39:03.535031	1
10-cuba/update/postgres/01/01-300-addEntitySnapshotTable.sql	2021-03-02 16:39:03.537702	1
10-cuba/update/postgres/01/01-310-RuntimePropertiesTables.sql	2021-03-02 16:39:03.540563	1
10-cuba/update/postgres/01/01-320-RuntimePropertiesRework.sql	2021-03-02 16:39:03.543421	1
10-cuba/update/postgres/01/01-330-CategoryAttrAlterType.sql	2021-03-02 16:39:03.546101	1
10-cuba/update/postgres/01/01-340-CategoryDiscriminator.sql	2021-03-02 16:39:03.549036	1
10-cuba/update/postgres/01/01-350-categoryAttrOrderNo.sql	2021-03-02 16:39:03.551565	1
10-cuba/update/postgres/01/01-360-CategoryAttrScreen.sql	2021-03-02 16:39:03.554146	1
10-cuba/update/postgres/01/01-370-CategoryAttrRequired.sql	2021-03-02 16:39:03.557306	1
10-cuba/update/postgres/01/01-380-AlterTypeColumnUrlInScreenHistory.sql	2021-03-02 16:39:03.559878	1
10-cuba/update/postgres/01/01-390-AlterTableSysCategoryAttr.sql	2021-03-02 16:39:03.562589	1
10-cuba/update/postgres/01/01-400-AlterTableSysAttrValue.sql	2021-03-02 16:39:03.565145	1
10-cuba/update/postgres/01/01-410-addDataSetParams.sql	2021-03-02 16:39:03.567705	1
10-cuba/update/postgres/01/01-410-addStartDateToUserSubstitution.sql	2021-03-02 16:39:03.570228	1
10-cuba/update/postgres/01/01-420-addEntityIdToScreenHistory.sql	2021-03-02 16:39:03.57285	1
10-cuba/update/postgres/01/01-440-addDropdownToCategoryAttribute.sql	2021-03-02 16:39:03.575651	1
10-cuba/update/postgres/01/01-450-alterSecConstraint.sql	2021-03-02 16:39:03.578134	1
10-cuba/update/postgres/02/02-010-addScheduledTasks.sql	2021-03-02 16:39:03.580741	1
10-cuba/update/postgres/02/02-020-alterDoubleValueColumnInSysAttrValueTable.sql	2021-03-02 16:39:03.58384	1
10-cuba/update/postgres/02/02-030-addReportGroup.sql	2021-03-02 16:39:03.586548	1
10-cuba/update/postgres/02/02-040-addReportRefToBand.sql	2021-03-02 16:39:03.589208	1
10-cuba/update/postgres/02/02-050-reportLocales.sql	2021-03-02 16:39:03.592101	1
10-cuba/update/postgres/02/02-060-reportCode.sql	2021-03-02 16:39:03.594581	1
10-cuba/update/postgres/02/02-070-addRoleType.sql	2021-03-02 16:39:03.597112	1
10-cuba/update/postgres/02/02-080-addSnapshotDate.sql	2021-03-02 16:39:03.599782	1
10-cuba/update/postgres/02/02-090-schedulingDaylightSaving.sql	2021-03-02 16:39:03.602464	1
10-cuba/update/postgres/02/02-100-entitySnapshotAuthor.sql	2021-03-02 16:39:03.604961	1
10-cuba/update/postgres/02/02-110-addDefaultDateIsCurrent.sql	2021-03-02 16:39:03.607588	1
10-cuba/update/postgres/02/02-120-addUserDescriminator.sql	2021-03-02 16:39:03.609929	1
10-cuba/update/postgres/02/02-130-alterSecConstraint.sql	2021-03-02 16:39:03.612363	1
10-cuba/update/postgres/02/02-130-queryResults.sql	2021-03-02 16:39:03.614795	1
10-cuba/update/postgres/02/02-140-entityLogChanges.sql	2021-03-02 16:39:03.617187	1
10-cuba/update/postgres/02/02-150-alterSysScheduledTask.sql	2021-03-02 16:39:03.619946	1
10-cuba/update/postgres/12/121002-updateScreenPermissions.sql	2021-03-02 16:39:03.622762	1
10-cuba/update/postgres/12/121003-addCodeToCategoryAttribute.sql	2021-03-02 16:39:03.625999	1
10-cuba/update/postgres/12/121004-addFieldsToScheduledTasks.sql	2021-03-02 16:39:03.629112	1
10-cuba/update/postgres/12/121020-addLoginConstraintsForUser.sql	2021-03-02 16:39:03.631817	1
10-cuba/update/postgres/12/121024-addEncryptionParamsToUser.sql	2021-03-02 16:39:03.634319	1
10-cuba/update/postgres/12/121031-dropPasswordColumnFromScheduledTask.sql	2021-03-02 16:39:03.636875	1
10-cuba/update/postgres/12/121102-dropSaltColumn.sql	2021-03-02 16:39:03.639474	1
10-cuba/update/postgres/12/121114-addDescriptionToScheduledTask.sql	2021-03-02 16:39:03.642408	1
10-cuba/update/postgres/12/121228-addJmxInstance.sql	2021-03-02 16:39:03.644891	1
10-cuba/update/postgres/13/130110-removeJmxInstanceDescription.sql	2021-03-02 16:39:03.647692	1
10-cuba/update/postgres/13/130311-renameColumnsForOracle.sql	2021-03-02 16:39:03.650323	1
10-cuba/update/postgres/13/130731-changeServerEntity.sql	2021-03-02 16:39:03.652679	1
10-cuba/update/postgres/13/130918-email-attachment-options.sql	2021-03-02 16:39:03.655167	1
10-cuba/update/postgres/13/130920-email-file-storage.sql	2021-03-02 16:39:03.65779	1
10-cuba/update/postgres/13/130923-permissionsToRenamedScreens.sql	2021-03-02 16:39:03.660079	1
10-cuba/update/postgres/13/131108-sending-message-timeshift.sql	2021-03-02 16:39:03.662568	1
10-cuba/update/postgres/13/131112-scheduled-task-cron.sql	2021-03-02 16:39:03.664815	1
10-cuba/update/postgres/14/140313-ftsQueueIndexingHost.sql	2021-03-02 16:39:03.667077	1
10-cuba/update/postgres/14/140405-changeTypeForSysConfigValue.sql	2021-03-02 16:39:03.669334	1
10-cuba/update/postgres/14/140708-addRememberMeTable.sql	2021-03-02 16:39:03.67178	1
10-cuba/update/postgres/14/140716-changeSysFileSizeType.sql	2021-03-02 16:39:03.674094	1
10-cuba/update/postgres/14/141203-setNotNullSysFileName.sql	2021-03-02 16:39:03.676536	1
10-cuba/update/postgres/15/150203-sendingMessageEmailHeaders.sql	2021-03-02 16:39:03.678874	1
10-cuba/update/postgres/15/150203-userTimeZone.sql	2021-03-02 16:39:03.681218	1
10-cuba/update/postgres/15/150205-addSubstituteUserInScreenHistory.sql	2021-03-02 16:39:03.683677	1
10-cuba/update/postgres/15/150226-addIndexInScreenHistory.sql	2021-03-02 16:39:03.686	1
10-cuba/update/postgres/15/150310-alterFilterXml.sql	2021-03-02 16:39:03.688496	1
10-cuba/update/postgres/15/150417-runtimePropertiesChanges.sql	2021-03-02 16:39:03.690751	1
10-cuba/update/postgres/15/150514-categoryEntityTypeInAttribute.sql	2021-03-02 16:39:03.693191	1
10-cuba/update/postgres/15/150630-entityClassToCategoryAttribute.sql	2021-03-02 16:39:03.69552	1
10-cuba/update/postgres/15/150805-fakeFtsQueue.sql	2021-03-02 16:39:03.697861	1
10-cuba/update/postgres/15/151106-extendScheduledTaskFields.sql	2021-03-02 16:39:03.700387	1
10-cuba/update/postgres/15/151116-rowLevelSecurity.sql	2021-03-02 16:39:03.702706	1
10-cuba/update/postgres/15/151228-sendingMessagesExtendFields.sql	2021-03-02 16:39:03.705058	1
10-cuba/update/postgres/15/1512282-addIsActiveToConstraint.sql	2021-03-02 16:39:03.707356	1
10-cuba/update/postgres/16/160322-dropUniqSysScheduledTaskBeanMethodConstraint.sql	2021-03-02 16:39:03.709717	1
10-cuba/update/postgres/16/160405-createUniqSysCategory.sql	2021-03-02 16:39:03.712112	1
10-cuba/update/postgres/16/160420-createUpdateTsIndexOnSysSendingMessage.sql	2021-03-02 16:39:03.714321	1
10-cuba/update/postgres/16/160616-addSizeCategoryAttribute.sql	2021-03-02 16:39:03.716797	1
10-cuba/update/postgres/16/160626-createIndexOnFinishTimeScheduledExecution.sql	2021-03-02 16:39:03.719078	1
10-cuba/update/postgres/16/160725-anonymousLogin.sql	2021-03-02 16:39:03.721554	1
10-cuba/update/postgres/16/160916-addEntityIdToFtsQueue.sql	2021-03-02 16:39:03.72373	1
10-cuba/update/postgres/16/161024-collectionDynamicAttributes.sql	2021-03-02 16:39:03.726094	1
10-cuba/update/postgres/16/161025-sysAttrValueParentConstraint.sql	2021-03-02 16:39:03.728717	1
10-cuba/update/postgres/16/161102-setIsCollectionForExistingCategoryAttrs.sql	2021-03-02 16:39:03.731272	1
10-cuba/update/postgres/16/161124-FilterXmlInCategoryAttr.sql	2021-03-02 16:39:03.733846	1
10-cuba/update/postgres/16/161124-joinAndWhereInCategoryAttr.sql	2021-03-02 16:39:03.736557	1
10-cuba/update/postgres/16/270916-addEntityIdToQueryResult.sql	2021-03-02 16:39:03.739175	1
10-cuba/update/postgres/17/170214-addEntityIdToSnapshot.sql	2021-03-02 16:39:03.741792	1
10-cuba/update/postgres/17/170215-addEntityIdToEntityLog.sql	2021-03-02 16:39:03.745198	1
10-cuba/update/postgres/17/170221-addEntityIdToAttributeValue.sql	2021-03-02 16:39:03.748289	1
10-cuba/update/postgres/17/170228-createRestApiTokenTable.sql	2021-03-02 16:39:03.750813	1
10-cuba/update/postgres/17/170502-createSessionHistoryTable.sql	2021-03-02 16:39:03.753386	1
10-cuba/update/postgres/17/170620-alterConstraints.sql	2021-03-02 16:39:03.756513	1
10-cuba/update/postgres/17/170712-createLocalizedConstraintMessageTable.sql	2021-03-02 16:39:03.759128	1
10-cuba/update/postgres/17/170829-addLocaleNameColumnToCategory.sql	2021-03-02 16:39:03.762266	1
10-cuba/update/postgres/17/171002-addUserLoginToRestApiToken.sql	2021-03-02 16:39:03.765009	1
10-cuba/update/postgres/17/171116-addGlobalDefaultToFilterEntity.sql	2021-03-02 16:39:03.76877	1
10-cuba/update/postgres/17/171121-addLocaleToRestApiToken.sql	2021-03-02 16:39:03.771303	1
10-cuba/update/postgres/17/1712011000-createRestApiRefreshTokenTable.sql	2021-03-02 16:39:03.77387	1
10-cuba/update/postgres/17/1712011010-renameRestApiTokenColumns.sql	2021-03-02 16:39:03.776635	1
10-cuba/update/postgres/17/1712011010-renameRestApiTokenTable.sql	2021-03-02 16:39:03.779043	1
10-cuba/update/postgres/17/171227-createIndexStartedTsDescToSessionLog.sql	2021-03-02 16:39:03.781748	1
10-cuba/update/postgres/17/171229-addRefreshTokenColumnToAccessTokenTable.sql	2021-03-02 16:39:03.784552	1
10-cuba/update/postgres/18/180112-alterDynamicAttributeDoubleType.sql	2021-03-02 16:39:03.787694	1
10-cuba/update/postgres/18/180312-renameColumns.sql	2021-03-02 16:39:03.790524	1
10-cuba/update/postgres/18/180321-addContentBodyTypeColumnToSendingMessage.sql	2021-03-02 16:39:03.793186	1
10-cuba/update/postgres/18/180331-truncateQueryResultTable.sql	2021-03-02 16:39:03.795842	1
10-cuba/update/postgres/18/180704-addNotNullForConfig.sql	2021-03-02 16:39:03.79833	1
10-cuba/update/postgres/18/181024-addCcAndBccToSendingMessage.sql	2021-03-02 16:39:03.801002	1
10-cuba/update/postgres/18/181210-addUserPasswordEncryption.sql	2021-03-02 16:39:03.80373	1
10-cuba/update/postgres/18/181227-addScreenHistorySupportedIdTypes.sql	2021-03-02 16:39:03.806358	1
10-cuba/update/postgres/19/190321-addEntityLogInstanceName.sql	2021-03-02 16:39:03.809533	1
10-cuba/update/postgres/19/190326-renameScheduledTaskColumns.sql	2021-03-02 16:39:03.812057	1
10-cuba/update/postgres/19/190408-addNewDynamicAttrType.sql	2021-03-02 16:39:03.814639	1
10-cuba/update/postgres/19/190410-addDescriptionFieldForDynamicAttributes.sql	2021-03-02 16:39:03.817504	1
10-cuba/update/postgres/19/190614-addRoleNameFieldForDesignTimeRoles.sql	2021-03-02 16:39:03.820646	1
10-cuba/update/postgres/19/190627-dynamicAttributesImprovements.sql	2021-03-02 16:39:03.823197	1
10-cuba/update/postgres/19/191030-addGroupNamesForDesignGroups.sql	2021-03-02 16:39:03.825869	1
10-cuba/update/postgres/19/191223-addSysTenantIdForCubaEntities.sql	2021-03-02 16:39:03.828362	1
10-cuba/update/postgres/19/191225-addRoleSecurityScope.sql	2021-03-02 16:39:03.830797	1
10-cuba/update/postgres/19/191226-setDefaultSecurityScope.sql	2021-03-02 16:39:03.833215	1
10-cuba/update/postgres/20/200608-alterScheduledTaskMethodParams.sql	2021-03-02 16:39:03.835837	1
10-cuba/update/postgres/20/201007-fixAttributeName.sql	2021-03-02 16:39:03.838739	1
50-ratlab/update/postgres/21/03/210302-1-createCertificate.sql	2021-03-02 16:39:43.381642	0
50-ratlab/update/postgres/21/03/210302-1-createEmployee.sql	2021-03-02 16:39:43.39753	0
50-ratlab/update/postgres/21/03/210302-1-createEmployeeResearchLink.sql	2021-03-02 16:39:43.409334	0
50-ratlab/update/postgres/21/03/210302-1-createLaboratory.sql	2021-03-02 16:39:43.424392	0
50-ratlab/update/postgres/21/03/210302-1-createMiscResource.sql	2021-03-02 16:39:43.43729	0
50-ratlab/update/postgres/21/03/210302-1-createRat.sql	2021-03-02 16:39:43.455932	0
50-ratlab/update/postgres/21/03/210302-1-createResearch.sql	2021-03-02 16:39:43.470783	0
50-ratlab/update/postgres/21/03/210302-2-createCertificate.sql	2021-03-02 16:39:43.487838	0
50-ratlab/update/postgres/21/03/210302-2-createEmployee.sql	2021-03-02 16:39:43.503154	0
50-ratlab/update/postgres/21/03/210302-2-createEmployeeResearchLink.sql	2021-03-02 16:39:43.513957	0
50-ratlab/update/postgres/21/03/210302-2-createLaboratory.sql	2021-03-02 16:39:43.530124	0
20-reports/init/postgres/create-db.sql	2021-03-04 11:32:35.392097	1
20-reports/update/postgres/02-150-removeReportRootDefinitionId.sql	2021-03-04 11:32:35.406345	1
20-reports/update/postgres/02-170-reportingNotNullConstraints.sql	2021-03-04 11:32:35.410266	1
20-reports/update/postgres/13/130311-renameColumnsForOracle.sql	2021-03-04 11:32:35.414355	1
20-reports/update/postgres/13/130606-addOutputNamePattern.sql	2021-03-04 11:32:35.418314	1
20-reports/update/postgres/13/130828-addDefaultTemplate.sql	2021-03-04 11:32:35.422266	1
20-reports/update/postgres/13/130830-newStructure.sql	2021-03-04 11:32:35.425921	1
20-reports/update/postgres/13/130903-migrateReports.groovy	2021-03-04 11:32:35.42927	1
20-reports/update/postgres/13/130912-reportConstraints.sql	2021-03-04 11:32:35.432942	1
20-reports/update/postgres/14/141105-customDefinedByField.sql	2021-03-04 11:32:35.437378	1
20-reports/update/postgres/16/160427-reportDescriptionField.sql	2021-03-04 11:32:35.441084	1
20-reports/update/postgres/17/170131-addFieldsForAvailableReports.sql	2021-03-04 11:32:35.444864	1
20-reports/update/postgres/17/170201-migrateSecurityIndex.upgrade.groovy	2021-03-04 11:32:35.448436	1
20-reports/update/postgres/17/170825-addSoftDeleteColumns.sql	2021-03-04 11:32:35.452497	1
20-reports/update/postgres/17/170927-addAlterableOutputType.sql	2021-03-04 11:32:35.456121	1
20-reports/update/postgres/17/171102-setDefaultValueForAlterableOutput.sql	2021-03-04 11:32:35.460074	1
20-reports/update/postgres/18/180718-addRestAccessToReport.sql	2021-03-04 11:32:35.465965	1
20-reports/update/postgres/18/180730-addSystemToReport.sql	2021-03-04 11:32:35.469811	1
20-reports/update/postgres/18/181031-addGroovyToReportTemplate.sql	2021-03-04 11:32:35.473736	1
20-reports/update/postgres/19/190717-add-report-execution.sql	2021-03-04 11:32:35.477545	1
20-reports/update/postgres/19/190730-add-execution-output-document.sql	2021-03-04 11:32:35.481679	1
20-reports/update/postgres/19/191223-addSysTenantIdForReportEntities.sql	2021-03-04 11:32:35.485842	1
50-ratlab/update/postgres/21/03/210304-1-createResourceRequirement.sql	2021-03-04 19:55:53.539832	0
50-ratlab/update/postgres/21/03/210304-2-createResourceRequirement.sql	2021-03-04 19:55:53.551821	0
50-ratlab/update/postgres/21/03/210304-2-updateMiscResource.sql	2021-03-04 21:13:21.124971	0
50-ratlab/update/postgres/21/03/210304-2-updateResearch.sql	2021-03-04 22:06:13.042313	0
50-ratlab/update/postgres/21/03/210304-2-updateResourceRequirement.sql	2021-03-04 22:44:30.681389	0
50-ratlab/update/postgres/21/03/210304-2-updateResourceRequirement01.sql	2021-03-04 22:44:30.688959	0
50-ratlab/update/postgres/21/03/210305-0-dropResourceRequirement.sql	2021-03-05 17:38:55.857423	0
50-ratlab/update/postgres/21/03/210305-0-dropResourceRequirement_DropScript.sql	2021-03-05 17:38:55.879733	0
50-ratlab/update/postgres/21/03/210305-1-createResearchRequirement.sql	2021-03-05 17:38:55.90395	0
50-ratlab/update/postgres/21/03/210305-2-createResearchRequirement.sql	2021-03-05 17:38:55.924281	0
50-ratlab/update/postgres/21/03/210305-2-updateResearchRequirement.sql	2021-03-05 17:42:01.829371	0
50-ratlab/update/postgres/21/03/210305-2-updateResearchRequirement01.sql	2021-03-05 17:52:27.688912	0
50-ratlab/update/postgres/21/03/210305-2-updateResearchRequirement02.sql	2021-03-05 18:24:58.113488	0
50-ratlab/update/postgres/21/03/210305-1-createResourceRequirement.sql	2021-03-05 18:44:25.117832	0
50-ratlab/update/postgres/21/03/210305-1-createSubjectRequirement.sql	2021-03-05 18:44:25.125541	0
50-ratlab/update/postgres/21/03/210305-2-createResourceRequirement.sql	2021-03-05 18:44:25.137435	0
50-ratlab/update/postgres/21/03/210305-2-createSubjectRequirement.sql	2021-03-05 18:44:25.149782	0
50-ratlab/update/postgres/21/03/210305-2-updateResearchRequirement03.sql	2021-03-05 18:44:25.158113	0
50-ratlab/update/postgres/21/03/210305-2-updateResearchRequirement03_DropScript.sql	2021-03-05 18:44:25.165673	0
\.


--
-- TOC entry 3462 (class 0 OID 26031)
-- Dependencies: 233
-- Data for Name: sys_entity_snapshot; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sys_entity_snapshot (id, create_ts, created_by, sys_tenant_id, entity_meta_class, entity_id, string_entity_id, int_entity_id, long_entity_id, author_id, view_xml, snapshot_xml, snapshot_date) FROM stdin;
\.


--
-- TOC entry 3436 (class 0 OID 25651)
-- Dependencies: 207
-- Data for Name: sys_entity_statistics; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sys_entity_statistics (id, create_ts, created_by, update_ts, updated_by, name, instance_count, fetch_ui, max_fetch_ui, lazy_collection_threshold, lookup_screen_threshold) FROM stdin;
\.


--
-- TOC entry 3434 (class 0 OID 25637)
-- Dependencies: 205
-- Data for Name: sys_file; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sys_file (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, name, ext, file_size, create_date) FROM stdin;
\.


--
-- TOC entry 3454 (class 0 OID 25896)
-- Dependencies: 225
-- Data for Name: sys_folder; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sys_folder (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, folder_type, parent_id, name, tab_name, sort_order) FROM stdin;
\.


--
-- TOC entry 3458 (class 0 OID 25961)
-- Dependencies: 229
-- Data for Name: sys_fts_queue; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sys_fts_queue (id, create_ts, created_by, entity_id, string_entity_id, int_entity_id, long_entity_id, entity_name, change_type, source_host, indexing_host, fake) FROM stdin;
\.


--
-- TOC entry 3466 (class 0 OID 26097)
-- Dependencies: 237
-- Data for Name: sys_jmx_instance; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sys_jmx_instance (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, node_name, address, login, password) FROM stdin;
\.


--
-- TOC entry 3435 (class 0 OID 25646)
-- Dependencies: 206
-- Data for Name: sys_lock_config; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sys_lock_config (id, create_ts, created_by, name, timeout_sec) FROM stdin;
\.


--
-- TOC entry 3468 (class 0 OID 26108)
-- Dependencies: 239
-- Data for Name: sys_query_result; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sys_query_result (id, session_id, query_key, entity_id, string_entity_id, int_entity_id, long_entity_id) FROM stdin;
\.


--
-- TOC entry 3438 (class 0 OID 25667)
-- Dependencies: 209
-- Data for Name: sys_scheduled_execution; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sys_scheduled_execution (id, create_ts, created_by, sys_tenant_id, task_id, server, start_time, finish_time, result) FROM stdin;
2cb1938e-c677-0e77-8d8c-acf2bb13e2d6	2021-03-05 13:03:05.251	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 09:03:05.211+00	2021-03-05 09:03:05.295+00	\n{Executed manually}
fa273ff7-1501-1f1b-26d7-f782b302ede2	2021-03-05 13:03:07.411	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 09:03:07.41+00	2021-03-05 09:03:07.445+00	\n{Executed manually}
d29bfc04-9d5e-6267-f9bd-77cf9c005126	2021-03-05 13:07:44.772	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 09:07:44.771+00	2021-03-05 09:07:44.805+00	
692db1b6-8898-646b-00c9-24655c91253d	2021-03-05 13:08:45.767	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 09:08:45.766+00	2021-03-05 09:08:45.798+00	
1a3881f4-ee96-d79e-b7b6-101d161a8e85	2021-03-05 13:10:46.766	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 09:10:46.765+00	2021-03-05 09:10:46.795+00	
16336b25-571c-dcec-97a7-bde7d9666e96	2021-03-05 13:12:46.8	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 09:12:46.799+00	2021-03-05 09:12:46.829+00	
510ae352-582e-d2cd-f809-67609b3a39b8	2021-03-05 13:14:46.8	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 09:14:46.799+00	2021-03-05 09:14:46.827+00	
c858ade6-5d08-f695-2e5e-31be3cca20e5	2021-03-05 13:16:47.799	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 09:16:47.797+00	2021-03-05 09:16:47.825+00	
b2d76c73-25ea-e109-1cdf-a62ab73b29ec	2021-03-05 13:18:48.798	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 09:18:48.797+00	2021-03-05 09:18:48.825+00	
eeecb863-f8b9-37ef-de59-fe2bee03324d	2021-03-05 13:24:07.067	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 09:24:07.001+00	2021-03-05 09:24:07.121+00	java.lang.RuntimeException: java.lang.NoSuchMethodException: com.sun.proxy.$Proxy272.addConsumables()
9e6c8e4c-325d-d255-a2fa-f5d57aca5c44	2021-03-05 13:26:07.532	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 09:26:07.531+00	2021-03-05 09:26:07.58+00	Tape:12012.00->12013.00|R2:24.00->25.00|R1:18.00->19.00|
4963705e-ef1b-3313-72c2-6525762a4b78	2021-03-05 13:28:07.566	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 09:28:07.564+00	2021-03-05 09:28:07.598+00	Tape:12013.00->12014.00|R2:25.00->26.00|R1:19.00->20.00|
7c0a9d16-d80f-6b03-9545-29f225f1df30	2021-03-05 13:30:08.564	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 09:30:08.563+00	2021-03-05 09:30:08.593+00	Tape:12014.00->12015.00|R2:26.00->27.00|R1:20.00->21.00|
ebe4ef1e-d204-6592-a8c7-a55bac10339f	2021-03-05 13:32:09.562	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 09:32:09.561+00	2021-03-05 09:32:09.589+00	Tape:12015.00->12016.00|R2:27.00->28.00|R1:21.00->22.00|
dbd388b0-d2fb-21f8-92a7-6d3ef2f7ab5d	2021-03-05 13:34:10.562	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 09:34:10.561+00	2021-03-05 09:34:10.587+00	Tape:12016.00->12017.00|R2:28.00->29.00|R1:22.00->23.00|
2054550f-19a6-56be-595a-9bc573be2680	2021-03-05 13:36:10.563	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 09:36:10.562+00	2021-03-05 09:36:10.59+00	Tape:12017.00->12018.00|R2:29.00->30.00|R1:23.00->24.00|
bff73590-a6bb-71da-2cbf-3aa73ee7ca9c	2021-03-05 13:38:10.564	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 09:38:10.563+00	2021-03-05 09:38:10.59+00	Tape:12018.00->12019.00|R2:30.00->31.00|R1:24.00->25.00|
3b44b8da-0e81-4b51-cf83-da4c628152ec	2021-03-05 13:40:10.567	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 09:40:10.566+00	2021-03-05 09:40:10.595+00	Tape:12019.00->12020.00|R2:31.00->32.00|R1:25.00->26.00|
2508a3d1-f0c1-cbb6-c377-13fc44c15fca	2021-03-05 13:58:38.948	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 09:58:38.946+00	2021-03-05 09:58:39.305+00	Tape:12020.00->12021.00|R2:32.00->33.00|R1:26.00->27.00|
05b1c478-e676-33ef-c93f-9a8e0fcba8b3	2021-03-05 14:00:39.207	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 10:00:39.206+00	2021-03-05 10:00:39.238+00	Tape:12021.00->12022.00|R2:33.00->34.00|R1:27.00->28.00|
4ae03621-4a97-1648-a93e-f43b1a6fc02d	2021-03-05 14:02:39.212	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 10:02:39.211+00	2021-03-05 10:02:39.24+00	Tape:12022.00->12023.00|R2:34.00->35.00|R1:28.00->29.00|
65f65506-d549-64c9-fb10-980a1cb08f5e	2021-03-05 14:04:39.213	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 10:04:39.213+00	2021-03-05 10:04:39.246+00	Tape:12023.00->12024.00|R2:35.00->36.00|R1:29.00->30.00|
dcd86173-3cf4-2f84-5875-00312d453506	2021-03-05 14:06:39.221	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 10:06:39.22+00	2021-03-05 10:06:39.251+00	Tape:12024.00->12025.00|R2:36.00->37.00|R1:30.00->31.00|
abac01b7-bfd0-4141-fc46-22e43b0798f3	2021-03-05 14:08:40.223	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 10:08:40.221+00	2021-03-05 10:08:40.253+00	Tape:12025.00->12026.00|R2:37.00->38.00|R1:31.00->32.00|
33890484-1069-0d7c-4628-7c37ad6e2ecf	2021-03-05 14:10:14.368	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 10:10:14.292+00	2021-03-05 10:10:14.557+00	Tape:12026->12027|R2:38->39|R1:32->33|
983d75b6-36c4-ae06-2a4a-cc5c814b81a7	2021-03-05 14:12:14.62	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 10:12:14.619+00	2021-03-05 10:12:14.662+00	Tape:12027->12028|R2:39->40|R1:33->34|
97cf1013-7fb7-0376-dd45-d850e5157fad	2021-03-05 14:14:14.622	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 10:14:14.621+00	2021-03-05 10:14:14.658+00	Tape:12028->12029|R2:40->41|R1:34->35|
debbd12e-f08d-72e1-ce76-993c6266274d	2021-03-05 14:16:14.624	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 10:16:14.623+00	2021-03-05 10:16:14.657+00	Tape:12029->12030|R2:41->42|R1:35->36|
d9b8c248-8951-5c76-298d-159ac7e553c1	2021-03-05 14:18:14.634	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 10:18:14.633+00	2021-03-05 10:18:14.666+00	Tape:12030->12031|R2:42->43|R1:36->37|
06341f79-6bc2-a706-7e86-262c98ecc6b8	2021-03-05 14:20:15.631	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 10:20:15.63+00	2021-03-05 10:20:15.661+00	Tape:12031->12032|R2:43->44|R1:37->38|
14f4782c-855f-7bf8-169c-00333d211627	2021-03-05 14:22:15.638	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 10:22:15.637+00	2021-03-05 10:22:15.67+00	Tape:12032->12033|R2:44->45|R1:38->39|
5ac91e2c-91a0-4412-4d6a-cf2757e9a95b	2021-03-05 14:47:16.786	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 10:47:16.785+00	2021-03-05 10:47:17.192+00	Tape:12033->12034|R2:45->46|R1:39->40|
d3b18823-53e8-2efe-49cb-111dcd37d043	2021-03-05 15:13:20.907	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 11:13:20.906+00	2021-03-05 11:13:21.302+00	Tape:12034->12035|R2:46->47|R1:40->41|
7d23cc11-41e0-8a2b-794a-095eba02e357	2021-03-05 15:15:21.51	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 11:15:21.509+00	2021-03-05 11:15:21.54+00	Tape:12035->12036|R2:47->48|R1:41->42|
9928ac6a-f4d6-f491-37e7-2722063f5f67	2021-03-05 15:17:21.511	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 11:17:21.51+00	2021-03-05 11:17:21.538+00	Tape:12036->12037|R2:48->49|R1:42->43|
035f1d4f-00d8-0b10-a2c1-bfeb20605e81	2021-03-05 15:19:21.512	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 11:19:21.512+00	2021-03-05 11:19:21.539+00	Tape:12037->12038|R2:49->50|R1:43->44|
ce2a79dc-d0a7-799c-7af1-5577886c3218	2021-03-05 15:21:22.506	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 11:21:22.505+00	2021-03-05 11:21:22.535+00	Tape:12038->12039|R2:50->51|R1:44->45|
8d595286-91aa-dd88-5193-fda50d51170f	2021-03-05 15:23:22.511	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 11:23:22.51+00	2021-03-05 11:23:22.543+00	Tape:12039->12040|R2:51->52|R1:45->46|
34c4a671-2296-0e00-3a11-607cc39d2667	2021-03-05 15:25:23.51	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 11:25:23.509+00	2021-03-05 11:25:23.538+00	Tape:12040->12041|R2:52->53|R1:46->47|
057349f2-e95d-82c8-678d-41e9a6ea9caa	2021-03-05 17:39:13.625	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 13:39:13.558+00	2021-03-05 13:39:13.85+00	Tape:12041->12042|R2:53->54|R1:47->48|
824b1737-c597-b713-66f2-58e28db222c5	2021-03-05 17:41:14.082	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 13:41:14.081+00	2021-03-05 13:41:14.118+00	Tape:12042->12043|R2:54->55|R1:48->49|
2fbcb11c-4b90-9f24-e26e-9e3fef83f4c4	2021-03-05 17:42:19.029	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 13:42:18.937+00	2021-03-05 13:42:19.198+00	Tape:12043->12044|R2:55->56|R1:49->50|
781c6cc6-46da-60d7-9977-1d8ebcc7f0ec	2021-03-05 17:44:19.457	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 13:44:19.456+00	2021-03-05 13:44:19.495+00	Tape:12044->12045|R2:56->57|R1:50->51|
dcb6fd9b-ab44-cbba-e261-d6602fa445a4	2021-03-05 17:46:19.457	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 13:46:19.456+00	2021-03-05 13:46:19.49+00	Tape:12045->12046|R2:57->58|R1:51->52|
9098150c-979c-bd69-2b48-9bcb033abd1a	2021-03-05 17:48:19.459	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 13:48:19.458+00	2021-03-05 13:48:19.499+00	Tape:12046->12047|R2:58->59|R1:52->53|
39859f58-e2bd-f915-a0a7-9bafa6ad765b	2021-03-05 17:49:40.686	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 13:49:40.605+00	2021-03-05 13:49:40.916+00	Tape:12047->12048|R2:59->60|R1:53->54|
d36d6226-f22e-5c7c-a7bf-b4aafb8c2657	2021-03-05 17:51:40.762	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 13:51:40.761+00	2021-03-05 13:51:40.796+00	Tape:12048->12049|R2:60->61|R1:54->55|
3c763805-1501-bb30-167d-7bee733b1d70	2021-03-05 17:52:45.515	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 13:52:45.427+00	2021-03-05 13:52:45.717+00	Tape:12049->12050|R2:61->62|R1:55->56|
d87cfe6e-d78b-e597-0069-c3e82b097f28	2021-03-05 18:20:32.729	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 14:20:32.638+00	2021-03-05 14:20:32.934+00	Tape:11921->11922|R2:76->77|R1:70->71|
2a724993-47d4-b400-33e9-f2f7222275bb	2021-03-05 17:54:45.946	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 13:54:45.945+00	2021-03-05 13:54:45.983+00	Tape:12050->12051|R2:62->63|R1:56->57|
80d75a7f-c8a4-b6f7-6c53-565ccc06c638	2021-03-05 17:56:46.943	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 13:56:46.942+00	2021-03-05 13:56:46.971+00	R2:63->64|R1:57->58|Tape:11908->11909|
447b66d0-5d69-92ae-c8ba-2982bd270e66	2021-03-05 18:22:55.103	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 14:22:55.035+00	2021-03-05 14:22:55.304+00	Tape:11922->11923|R2:77->78|R1:71->72|
e75bc54c-a75e-4ada-6217-e28456aa549b	2021-03-05 17:58:46.943	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 13:58:46.942+00	2021-03-05 13:58:46.974+00	Tape:11909->11910|R2:64->65|R1:58->59|
57f33031-7f7a-14b8-8584-a2a649bc014e	2021-03-05 17:59:35.748	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 13:59:35.683+00	2021-03-05 13:59:35.947+00	Tape:11910->11911|R2:65->66|R1:59->60|
2cc1ff9a-6168-2375-ada2-0ee400f66df2	2021-03-05 18:25:15.646	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 14:25:15.577+00	2021-03-05 14:25:15.847+00	Tape:11923->11924|R2:78->79|R1:72->73|
3a9b8346-a382-7b71-e9d8-9154cc23a321	2021-03-05 18:01:36.215	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 14:01:36.213+00	2021-03-05 14:01:36.253+00	Tape:11911->11912|R2:66->67|R1:60->61|
e5b2509c-e116-7a93-a816-dcb2280c8188	2021-03-05 18:03:37.211	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 14:03:37.21+00	2021-03-05 14:03:37.242+00	Tape:11912->11913|R2:67->68|R1:61->62|
aa2eb4c5-6d50-9f71-65e3-2d4383b14dc7	2021-03-05 18:26:19.904	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 14:26:19.843+00	2021-03-05 14:26:20.115+00	Tape:11924->11925|R2:79->80|R1:73->74|
aea9d21e-e2f3-123c-0516-bd21dace04b6	2021-03-05 18:05:37.211	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 14:05:37.21+00	2021-03-05 14:05:37.244+00	Tape:11913->11914|R2:68->69|R1:62->63|
e3988f1f-0c01-8e19-618e-d40c12c2a42d	2021-03-05 18:07:38.208	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 14:07:38.207+00	2021-03-05 14:07:38.24+00	Tape:11914->11915|R2:69->70|R1:63->64|
094b33a1-7721-aa7b-c859-30b1130ff4f6	2021-03-05 18:28:20.378	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 14:28:20.377+00	2021-03-05 14:28:20.415+00	Tape:11925->11926|R2:80->81|R1:74->75|
5886a883-d033-c21b-2d4a-00c3c964deb1	2021-03-05 18:09:39.206	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 14:09:39.205+00	2021-03-05 14:09:39.234+00	Tape:11915->11916|R2:70->71|R1:64->65|
7d234feb-8450-09df-e277-5c81d4c644af	2021-03-05 18:11:40.205	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 14:11:40.204+00	2021-03-05 14:11:40.24+00	Tape:11916->11917|R2:71->72|R1:65->66|
b0e98049-e47f-30ce-2a2f-2e447fd6aca8	2021-03-05 18:30:20.38	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 14:30:20.378+00	2021-03-05 14:30:20.416+00	Tape:11926->11927|R2:81->82|R1:75->76|
0185be7b-f123-91a9-ee1e-45446f48a41f	2021-03-05 18:13:40.212	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 14:13:40.211+00	2021-03-05 14:13:40.249+00	Tape:11917->11918|R2:72->73|R1:66->67|
c5a37854-113e-013f-ad95-34d0021e8cfe	2021-03-05 18:15:41.212	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 14:15:41.211+00	2021-03-05 14:15:41.244+00	Tape:11918->11919|R2:73->74|R1:67->68|
65b89996-9c2e-85f4-dae0-aacb633f0410	2021-03-05 18:32:21.38	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 14:32:21.379+00	2021-03-05 14:32:21.417+00	Tape:11927->11928|R2:82->83|R1:76->77|
aed19282-4de1-1d46-dda0-d83f4a33b757	2021-03-05 18:16:07.145	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 14:16:07.07+00	2021-03-05 14:16:07.339+00	Tape:11919->11920|R2:74->75|R1:68->69|
29348ef1-6eff-517b-4758-b9121f1470c1	2021-03-05 18:18:07.392	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 14:18:07.391+00	2021-03-05 14:18:07.43+00	Tape:11920->11921|R2:75->76|R1:69->70|
fd203bca-22c3-0893-776b-cb154dafe81d	2021-03-05 18:34:21.389	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 14:34:21.388+00	2021-03-05 14:34:21.421+00	Tape:11928->11929|R2:83->84|R1:77->78|
8b27c0e5-9846-6e97-957a-8b52d2ae0d27	2021-03-05 18:36:22.38	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 14:36:22.378+00	2021-03-05 14:36:22.409+00	Tape:11929->11930|R2:84->85|R1:78->79|
d54baecc-3382-30ea-8883-63e6fbf75ea0	2021-03-05 18:38:23.376	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 14:38:23.375+00	2021-03-05 14:38:23.409+00	Tape:11930->11931|R2:85->86|R1:79->80|
8f14e821-611b-4d35-04e8-ccc1037b58fc	2021-03-05 18:40:24.372	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 14:40:24.371+00	2021-03-05 14:40:24.403+00	Tape:11931->11932|R2:86->87|R1:80->81|
03e7caec-41d4-6887-95f3-462e3098ac32	2021-03-05 18:42:24.424	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 14:42:24.422+00	2021-03-05 14:42:24.451+00	Tape:11932->11933|R2:87->88|R1:81->82|
736ab45b-e54f-dbc0-2841-d400920c8f1e	2021-03-05 18:44:44.045	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 14:44:43.984+00	2021-03-05 14:44:44.214+00	Tape:11933->11934|R2:88->89|R1:82->83|
51fa42a1-b371-00ad-c128-441cfe75a95c	2021-03-05 18:46:44.504	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 14:46:44.503+00	2021-03-05 14:46:44.541+00	Tape:11934->11935|R1:83->84|R2:56->57|
2633029b-cc59-09e0-4ecb-0afa352d6d76	2021-03-05 18:48:45.502	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 14:48:45.5+00	2021-03-05 14:48:45.541+00	Tape:11935->11936|R2:57->58|R1:84->85|
3bba58f2-ea46-6c5a-cc28-c4d27c305b23	2021-03-05 18:50:45.501	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 14:50:45.5+00	2021-03-05 14:50:45.534+00	Tape:11936->11937|R2:58->59|R1:85->86|
87bbb9dd-1182-f310-4929-6915cda6a218	2021-03-05 18:52:45.508	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 14:52:45.506+00	2021-03-05 14:52:45.539+00	Tape:11937->11938|R2:59->60|R1:86->87|
320faee5-5ea7-bf85-7e07-e2e15a9c57fb	2021-03-05 18:54:45.508	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 14:54:45.507+00	2021-03-05 14:54:45.537+00	Tape:11938->11939|R2:60->61|R1:87->88|
6d4b9586-87fd-657d-ad1e-56a81ce05352	2021-03-05 18:56:46.506	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 14:56:46.505+00	2021-03-05 14:56:46.537+00	Tape:11939->11940|R2:61->62|R1:88->89|
ad500c69-4196-2976-0279-41f1f323cd69	2021-03-05 18:58:47.479	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 14:58:47.478+00	2021-03-05 14:58:47.508+00	Tape:11940->11941|R2:62->63|R1:89->90|
01f4e81f-8afc-a13c-aba0-445d98f83dbb	2021-03-15 15:54:55.07	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-15 11:54:54.999+00	2021-03-15 11:54:55.273+00	Tape:11941->11942|R2:63->64|R1:90->91|
93c1d374-6dd2-7cae-b5eb-51b4079c030b	2021-03-15 15:56:55.104	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-15 11:56:55.103+00	2021-03-15 11:56:55.139+00	Tape:11942->11943|R2:64->65|R1:91->92|
ba9aa06f-57ef-aacc-feee-c53edb472bfb	2021-03-15 15:58:55.105	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-15 11:58:55.103+00	2021-03-15 11:58:55.139+00	Tape:11943->11944|R2:65->66|R1:92->93|
58224be0-4918-aa7c-7835-5af7f48bd5b9	2021-03-15 16:00:55.104	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-15 12:00:55.103+00	2021-03-15 12:00:55.136+00	Tape:11944->11945|R2:66->67|R1:93->94|
b57205fd-b425-d820-b60e-cb9398282024	2021-03-15 16:02:55.107	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-15 12:02:55.106+00	2021-03-15 12:02:55.146+00	Tape:11945->11946|R2:67->68|R1:94->95|
b44098a2-0380-eeff-aba7-5ec00a259c97	2021-03-15 16:04:55.111	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-15 12:04:55.11+00	2021-03-15 12:04:55.142+00	R2:68->69|R1:95->96|Tape:11946->11947|
b7ea44f4-fa6d-43cc-2321-40a35fd7a300	2021-03-15 16:06:56.111	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-15 12:06:56.11+00	2021-03-15 12:06:56.143+00	Tape:11947->11948|R2:69->70|R1:96->97|
be9881d4-71fd-3ba3-0c4d-71056379d30c	2021-03-15 16:08:56.111	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-15 12:08:56.11+00	2021-03-15 12:08:56.146+00	Tape:11948->11949|R2:70->71|R1:97->98|
56de9423-542f-2a18-aa4c-6a8b2c94bac2	2021-03-15 16:10:57.109	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-15 12:10:57.108+00	2021-03-15 12:10:57.144+00	Tape:11949->11950|R2:71->72|R1:98->99|
8bb9dc1d-18cc-ae59-425b-1c210ab54d8c	2021-03-15 16:12:57.113	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-15 12:12:57.112+00	2021-03-15 12:12:57.14+00	Tape:11950->11951|R2:72->73|R1:99->100|
c707f092-fe7e-599e-a454-3abb9f5da5d0	2021-03-15 16:14:57.114	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-15 12:14:57.113+00	2021-03-15 12:14:57.138+00	Tape:11951->11952|R2:73->74|R1:100->101|
76c8846b-2b72-062f-ba8f-73442ddd2ce1	2021-03-15 16:16:57.114	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-15 12:16:57.114+00	2021-03-15 12:16:57.147+00	Tape:11952->11953|R2:74->75|R1:101->102|
ff629f01-ebfe-f6b9-80b4-ab581a9b01dd	2021-03-15 16:18:57.117	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-15 12:18:57.117+00	2021-03-15 12:18:57.149+00	Tape:11953->11954|R2:75->76|R1:102->103|
cf93ab1c-4e7e-c65d-65fb-f5be997bc5c1	2021-03-16 11:20:19.063	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 07:20:18.971+00	2021-03-16 07:20:19.28+00	Tape:11954->11955|R2:76->77|R1:103->104|
f2bf3b98-11cb-883e-fd18-fb7835ae48e4	2021-03-16 13:22:52.286	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 09:22:52.285+00	2021-03-16 09:22:52.318+00	Tape:11994->11995|R2:116->117|R1:143->144|
a607936f-6426-23e1-30a3-08b88283c926	2021-03-16 11:22:19.293	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 07:22:19.292+00	2021-03-16 07:22:19.326+00	Tape:11955->11956|R2:77->78|R1:104->105|
0434a426-1901-77fc-1ad1-b68f2c879c0e	2021-03-16 11:24:20.291	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 07:24:20.29+00	2021-03-16 07:24:20.327+00	Tape:11956->11957|R2:78->79|R1:105->106|
dc5eea8f-a803-31e5-2f2f-5539ac6581c1	2021-03-16 13:24:52.288	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 09:24:52.286+00	2021-03-16 09:24:52.319+00	Tape:11995->11996|R2:117->118|R1:144->145|
d383b4f5-2231-8d50-b535-d13f5ab18cb7	2021-03-16 11:26:21.289	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 07:26:21.288+00	2021-03-16 07:26:21.322+00	Tape:11957->11958|R2:79->80|R1:106->107|
db730b14-f5c6-74b3-679b-3ff7d17995b2	2021-03-16 11:28:08.192	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 07:28:08.116+00	2021-03-16 07:28:08.395+00	Tape:11958->11959|R2:80->81|R1:107->108|
42620802-1620-46e3-f111-494432541ddc	2021-03-16 13:26:52.29	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 09:26:52.289+00	2021-03-16 09:26:52.323+00	Tape:11996->11997|R2:118->119|R1:145->146|
80aa984e-8b71-eb0b-8922-70d6ab7bbf96	2021-03-16 11:30:08.645	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 07:30:08.644+00	2021-03-16 07:30:08.681+00	Tape:11959->11960|R2:81->82|R1:108->109|
1b593820-0d6d-15a9-5f57-026744df9e16	2021-03-16 11:32:08.654	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 07:32:08.653+00	2021-03-16 07:32:08.683+00	Tape:11960->11961|R2:82->83|R1:109->110|
bda8d4e6-aeec-0c8c-74d5-ca1abd42dda8	2021-03-16 13:28:52.291	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 09:28:52.29+00	2021-03-16 09:28:52.328+00	Tape:11997->11998|R2:119->120|R1:146->147|
a43bb848-ca1e-27d6-8a20-56435918ba28	2021-03-16 11:34:09.651	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 07:34:09.65+00	2021-03-16 07:34:09.688+00	Tape:11961->11962|R2:83->84|R1:110->111|
7582dfcb-0ccc-cdb6-7514-445cf0528f5d	2021-03-16 11:36:10.647	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 07:36:10.646+00	2021-03-16 07:36:10.681+00	Tape:11962->11963|R2:84->85|R1:111->112|
6c6835b4-0788-fd4b-d510-f9d6ebbf59fb	2021-03-16 13:30:53.287	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 09:30:53.286+00	2021-03-16 09:30:53.316+00	Tape:11998->11999|R2:120->121|R1:147->148|
57837d72-6ae5-2605-7234-012dc830c2de	2021-03-16 11:38:10.65	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 07:38:10.649+00	2021-03-16 07:38:10.68+00	Tape:11963->11964|R2:85->86|R1:112->113|
f1845652-42a8-7914-d742-e0e2fb7da957	2021-03-16 11:40:11.64	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 07:40:11.639+00	2021-03-16 07:40:11.667+00	Tape:11964->11965|R2:86->87|R1:113->114|
be1e5794-7b94-5e9c-f369-d321010ee9b3	2021-03-16 13:32:54.285	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 09:32:54.284+00	2021-03-16 09:32:54.314+00	Tape:11999->12000|R2:121->122|R1:148->149|
39031093-8dae-fa15-4ed4-39c17222cd14	2021-03-16 11:42:12.637	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 07:42:12.636+00	2021-03-16 07:42:12.666+00	Tape:11965->11966|R2:87->88|R1:114->115|
e552dd2c-2766-e744-42e2-104933073ae5	2021-03-16 11:44:13.635	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 07:44:13.634+00	2021-03-16 07:44:13.666+00	Tape:11966->11967|R2:88->89|R1:115->116|
f2c48082-1d07-bcef-ce31-ec85908cfdd3	2021-03-16 11:46:14.614	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 07:46:14.613+00	2021-03-16 07:46:14.64+00	Tape:11967->11968|R2:89->90|R1:116->117|
f0bafb94-4f36-a62c-1fff-e2ca84463ca8	2021-03-16 11:48:15.609	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 07:48:15.608+00	2021-03-16 07:48:15.633+00	Tape:11968->11969|R2:90->91|R1:117->118|
23a03a11-ed60-39db-9f7c-67c2aed618f2	2021-03-16 11:50:16.603	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 07:50:16.603+00	2021-03-16 07:50:16.627+00	Tape:11969->11970|R2:91->92|R1:118->119|
2e8e5aab-0f70-27a1-9c26-63e783f40808	2021-03-16 11:52:17.601	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 07:52:17.6+00	2021-03-16 07:52:17.627+00	Tape:11970->11971|R2:92->93|R1:119->120|
88daff90-9fff-13a2-3faf-e01c2a88e4cb	2021-03-16 11:54:18.596	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 07:54:18.595+00	2021-03-16 07:54:18.62+00	Tape:11971->11972|R2:93->94|R1:120->121|
15e3efc0-2f30-9a61-e9ae-2daffdd68880	2021-03-16 11:56:19.585	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 07:56:19.583+00	2021-03-16 07:56:19.608+00	Tape:11972->11973|R2:94->95|R1:121->122|
389351a2-b632-0da1-6468-200d211e4226	2021-03-16 11:58:20.58	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 07:58:20.579+00	2021-03-16 07:58:20.613+00	Tape:11973->11974|R2:95->96|R1:122->123|
60935003-f40a-81c7-24a1-1b949cddc9b4	2021-03-16 12:00:21.581	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 08:00:21.58+00	2021-03-16 08:00:21.61+00	Tape:11974->11975|R2:96->97|R1:123->124|
ae82c7b6-2ed4-bb64-61ea-a4bdc58ae338	2021-03-16 12:02:21.608	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 08:02:21.608+00	2021-03-16 08:02:21.636+00	Tape:11975->11976|R2:97->98|R1:124->125|
5eff71c0-e067-5b7c-d20a-f918da455ce4	2021-03-16 12:04:22.604	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 08:04:22.603+00	2021-03-16 08:04:22.631+00	Tape:11976->11977|R2:98->99|R1:125->126|
04b0b42e-09b7-6ee4-6d33-8979327bf596	2021-03-16 12:06:23.601	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 08:06:23.6+00	2021-03-16 08:06:23.63+00	Tape:11977->11978|R2:99->100|R1:126->127|
cca4af73-8748-1e1f-5091-55448ff4c601	2021-03-16 12:08:24.595	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 08:08:24.594+00	2021-03-16 08:08:24.619+00	Tape:11978->11979|R2:100->101|R1:127->128|
74b5e0ca-4ed7-02e3-85ed-6f2ff59cffd6	2021-03-16 12:09:58.399	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 08:09:58.328+00	2021-03-16 08:09:58.626+00	Tape:11979->11980|R2:101->102|R1:128->129|
457c0fef-ba66-6535-5a9c-2ae13cdffe44	2021-03-16 12:11:58.626	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 08:11:58.624+00	2021-03-16 08:11:58.66+00	Tape:11980->11981|R2:102->103|R1:129->130|
8c4f89fd-2dc4-490e-a1d4-8145af0b068b	2021-03-16 12:13:29.472	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 08:13:29.392+00	2021-03-16 08:13:29.7+00	Tape:11981->11982|R2:103->104|R1:130->131|
34c04c34-7075-cebf-1716-c0b5dbf1e875	2021-03-16 12:15:29.699	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 08:15:29.698+00	2021-03-16 08:15:29.733+00	Tape:11982->11983|R2:104->105|R1:131->132|
445e3f24-7f34-a958-01a0-8be6e08cb2b1	2021-03-16 12:17:29.704	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 08:17:29.703+00	2021-03-16 08:17:29.74+00	Tape:11983->11984|R2:105->106|R1:132->133|
8ba186f8-91f0-94c8-2cb2-dc6f55ba8611	2021-03-16 12:19:30.703	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 08:19:30.701+00	2021-03-16 08:19:30.734+00	Tape:11984->11985|R2:106->107|R1:133->134|
8b6bd99a-8460-d03a-6e1d-41b3512f8729	2021-03-16 12:21:31.699	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 08:21:31.698+00	2021-03-16 08:21:31.727+00	Tape:11985->11986|R2:107->108|R1:134->135|
ab209238-1708-428c-e0c8-24c5230aa341	2021-03-16 12:23:32.695	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 08:23:32.694+00	2021-03-16 08:23:32.722+00	Tape:11986->11987|R2:108->109|R1:135->136|
9d249c01-e81e-92b2-6ec2-c7f978399212	2021-03-16 12:25:33.692	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 08:25:33.69+00	2021-03-16 08:25:33.719+00	Tape:11987->11988|R2:109->110|R1:136->137|
26b3afd6-c19a-a6c7-26f8-1a2e9175496a	2021-03-16 12:27:34.691	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 08:27:34.689+00	2021-03-16 08:27:34.721+00	Tape:11988->11989|R2:110->111|R1:137->138|
d9700547-28a8-1ffd-5c37-a968e13ff325	2021-03-16 12:29:35.687	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 08:29:35.686+00	2021-03-16 08:29:35.714+00	Tape:11989->11990|R2:111->112|R1:138->139|
4fc0e8ff-ad69-e425-10c6-9be27e9a18d8	2021-03-16 13:01:17.332	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 09:01:17.32+00	2021-03-16 09:01:17.714+00	Tape:11990->11991|R2:112->113|R1:139->140|
35b7b88f-9d03-e0d8-b50b-9aba6f3d7db9	2021-03-16 13:16:51.266	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 09:16:51.264+00	2021-03-16 09:16:51.665+00	Tape:11991->11992|R2:113->114|R1:140->141|
77774dfb-25b1-5649-c36a-ec731afe97c5	2021-03-16 13:18:51.28	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 09:18:51.279+00	2021-03-16 09:18:51.313+00	Tape:11992->11993|R2:114->115|R1:141->142|
aef4320e-e06c-2c87-0921-b195466cae07	2021-03-16 13:20:51.281	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 09:20:51.28+00	2021-03-16 09:20:51.313+00	Tape:11993->11994|R2:115->116|R1:142->143|
61f6578a-4dd5-e85a-47e8-7ef9574e3099	2021-03-16 17:06:28.256	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 13:06:28.255+00	2021-03-16 13:06:28.287+00	Tape:12087->12088|R2:209->210|R1:236->237|
96b3e9c8-10da-3812-0a5b-f2cda504929f	2021-03-16 13:34:54.293	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 09:34:54.293+00	2021-03-16 09:34:54.324+00	Tape:12000->12001|R2:122->123|R1:149->150|
e06e5936-b2f3-b794-1996-7c091cd9ff2a	2021-03-16 13:36:55.289	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 09:36:55.289+00	2021-03-16 09:36:55.324+00	Tape:12001->12002|R2:123->124|R1:150->151|
6070c883-1dcc-ba7c-0e78-0f801226f4f1	2021-03-16 13:38:55.296	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 09:38:55.295+00	2021-03-16 09:38:55.323+00	Tape:12002->12003|R2:124->125|R1:151->152|
cda1d400-94c9-233c-21ba-db55e04e41ef	2021-03-16 13:40:56.29	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 09:40:56.29+00	2021-03-16 09:40:56.321+00	Tape:12003->12004|R2:125->126|R1:152->153|
744cb874-f1d4-c6c8-5973-563813779c1d	2021-03-16 13:42:57.293	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 09:42:57.288+00	2021-03-16 09:42:57.32+00	Tape:12004->12005|R2:126->127|R1:153->154|
9e66a430-b6b4-38e4-51ab-356bf919b690	2021-03-16 13:44:57.297	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 09:44:57.296+00	2021-03-16 09:44:57.331+00	Tape:12005->12006|R2:127->128|R1:154->155|
7299cf89-3d0f-f31a-e8e6-2a7d9bd520af	2021-03-16 13:46:58.292	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 09:46:58.291+00	2021-03-16 09:46:58.325+00	Tape:12006->12007|R2:128->129|R1:155->156|
5dcce02f-fb72-9fb7-d2d4-35195bcb06ee	2021-03-16 13:47:33.016	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 09:47:32.944+00	2021-03-16 09:47:33.215+00	Tape:12007->12008|R2:129->130|R1:156->157|
bd22361f-2527-8cfc-2357-a7f7d7e6059e	2021-03-16 13:49:33.461	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 09:49:33.459+00	2021-03-16 09:49:33.498+00	Tape:12008->12009|R2:130->131|R1:157->158|
90c59b8a-44d1-2d8f-92cd-1892cf919a19	2021-03-16 13:51:33.463	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 09:51:33.462+00	2021-03-16 09:51:33.5+00	Tape:12009->12010|R2:131->132|R1:158->159|
e0d717e8-96f1-f7e4-6469-d9312cff3f40	2021-03-16 13:53:34.46	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 09:53:34.459+00	2021-03-16 09:53:34.5+00	Tape:12010->12011|R2:132->133|R1:159->160|
194c988a-493a-898e-46ff-9b80de48b198	2021-03-16 13:55:35.458	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 09:55:35.456+00	2021-03-16 09:55:35.494+00	Tape:12011->12012|R2:133->134|R1:160->161|
3d6db76a-fe31-bad2-5a92-3652a01a9218	2021-03-16 13:57:35.466	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 09:57:35.465+00	2021-03-16 09:57:35.497+00	Tape:12012->12013|R2:134->135|R1:161->162|
5cc43b3f-f709-4040-b2a3-2688ac5dd9a7	2021-03-16 13:59:36.465	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 09:59:36.464+00	2021-03-16 09:59:36.496+00	Tape:12013->12014|R2:135->136|R1:162->163|
ac8afa20-53ca-7574-f976-80245cc1d3dd	2021-03-16 14:01:37.464	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 10:01:37.463+00	2021-03-16 10:01:37.494+00	Tape:12014->12015|R2:136->137|R1:163->164|
fde607ca-9d66-ee27-187b-41bdde434f8d	2021-03-16 14:04:58.166	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 10:04:58.165+00	2021-03-16 10:04:58.565+00	Tape:12015->12016|R2:137->138|R1:164->165|
804d4637-751a-92bc-7b21-20b5d54f1ebf	2021-03-16 14:06:58.282	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 10:06:58.281+00	2021-03-16 10:06:58.312+00	Tape:12016->12017|R2:138->139|R1:165->166|
5dbf2784-facc-a44c-3e4c-c0eb87aa41e4	2021-03-16 14:08:58.282	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 10:08:58.281+00	2021-03-16 10:08:58.309+00	Tape:12017->12018|R2:139->140|R1:166->167|
e917a0ae-175e-f395-0cd1-3e607e31fa46	2021-03-16 14:10:59.28	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 10:10:59.28+00	2021-03-16 10:10:59.309+00	Tape:12018->12019|R2:140->141|R1:167->168|
96ebc500-2a7b-ce9c-4d71-ce26e5604368	2021-03-16 14:13:00.279	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 10:13:00.278+00	2021-03-16 10:13:00.317+00	Tape:12019->12020|R2:141->142|R1:168->169|
43c8ed5d-78dc-4759-ddd2-68b897c3590a	2021-03-16 14:15:01.278	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 10:15:01.277+00	2021-03-16 10:15:01.312+00	Tape:12020->12021|R2:142->143|R1:169->170|
bf3c3bb4-86f7-19aa-53f3-6c930af1d7cd	2021-03-16 14:17:02.277	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 10:17:02.275+00	2021-03-16 10:17:02.307+00	Tape:12021->12022|R2:143->144|R1:170->171|
d86a9716-17d7-4bff-1d1d-796afe1aa6d6	2021-03-16 14:19:02.277	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 10:19:02.276+00	2021-03-16 10:19:02.311+00	Tape:12022->12023|R2:144->145|R1:171->172|
f25a1b25-b003-3b99-e5f3-6373625ecf5a	2021-03-16 14:21:02.278	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 10:21:02.277+00	2021-03-16 10:21:02.307+00	Tape:12023->12024|R2:145->146|R1:172->173|
d4f8b784-21e0-546a-0669-6d5f91b68be8	2021-03-16 14:23:03.275	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 10:23:03.275+00	2021-03-16 10:23:03.304+00	Tape:12024->12025|R2:146->147|R1:173->174|
572eabd0-f0bb-1d13-e9c6-a5ac9bdb7818	2021-03-16 14:25:04.275	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 10:25:04.274+00	2021-03-16 10:25:04.306+00	Tape:12025->12026|R2:147->148|R1:174->175|
4797c420-98ca-d2aa-9db3-c47ad55e2a68	2021-03-16 14:27:04.274	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 10:27:04.274+00	2021-03-16 10:27:04.304+00	Tape:12026->12027|R2:148->149|R1:175->176|
68e08422-de22-8776-d72b-1a2d3b4859e6	2021-03-16 14:29:04.274	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 10:29:04.274+00	2021-03-16 10:29:04.305+00	Tape:12027->12028|R2:149->150|R1:176->177|
8ab980c2-58d6-7f7b-03bb-368864e428a2	2021-03-16 14:31:04.277	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 10:31:04.276+00	2021-03-16 10:31:04.308+00	Tape:12028->12029|R2:150->151|R1:177->178|
1e62f030-0903-1825-eeab-b30802f6cb3b	2021-03-16 14:33:04.277	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 10:33:04.276+00	2021-03-16 10:33:04.309+00	Tape:12029->12030|R2:151->152|R1:178->179|
67ab9742-c862-6ff6-e7c5-c91140f4e72d	2021-03-16 14:35:04.279	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 10:35:04.279+00	2021-03-16 10:35:04.312+00	Tape:12030->12031|R2:152->153|R1:179->180|
04b85fe7-6ec4-d539-dfb0-682c43f32e3e	2021-03-16 14:37:05.277	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 10:37:05.277+00	2021-03-16 10:37:05.304+00	Tape:12031->12032|R2:153->154|R1:180->181|
b539c346-e012-5120-3019-636249fe06a6	2021-03-16 14:39:06.277	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 10:39:06.277+00	2021-03-16 10:39:06.309+00	Tape:12032->12033|R2:154->155|R1:181->182|
56c5a717-d984-0cee-2977-ff3a9d01f564	2021-03-16 14:41:07.276	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 10:41:07.276+00	2021-03-16 10:41:07.306+00	Tape:12033->12034|R2:155->156|R1:182->183|
1d4857d3-26c4-19e7-76a1-db6c3ea76529	2021-03-16 14:43:08.279	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 10:43:08.278+00	2021-03-16 10:43:08.309+00	Tape:12034->12035|R2:156->157|R1:183->184|
2969bd23-0d55-9785-d9a6-21c540d1bf9e	2021-03-16 14:45:08.283	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 10:45:08.282+00	2021-03-16 10:45:08.311+00	Tape:12035->12036|R2:157->158|R1:184->185|
44f59cc4-ec49-6407-4f41-d9ad65b6fa4a	2021-03-16 14:47:09.275	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 10:47:09.274+00	2021-03-16 10:47:09.3+00	Tape:12036->12037|R2:158->159|R1:185->186|
ecd27538-b6b8-30c2-124d-51d4e3c2f90a	2021-03-16 14:49:09.28	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 10:49:09.279+00	2021-03-16 10:49:09.314+00	Tape:12037->12038|R2:159->160|R1:186->187|
c0a13b34-9cc6-7fb6-50e6-ddaf61ab2d46	2021-03-16 14:51:10.276	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 10:51:10.276+00	2021-03-16 10:51:10.305+00	Tape:12038->12039|R2:160->161|R1:187->188|
9d9bd5d4-4608-5baa-81f7-831b4161c47c	2021-03-16 14:53:11.275	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 10:53:11.275+00	2021-03-16 10:53:11.304+00	Tape:12039->12040|R2:161->162|R1:188->189|
063a4cdb-a275-37c4-90d5-4eca369925aa	2021-03-16 14:55:11.278	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 10:55:11.277+00	2021-03-16 10:55:11.307+00	Tape:12040->12041|R2:162->163|R1:189->190|
39da9801-1ea5-5cde-041d-c5c90d3ab8ba	2021-03-16 14:57:12.271	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 10:57:12.271+00	2021-03-16 10:57:12.297+00	Tape:12041->12042|R2:163->164|R1:190->191|
78c662ef-3303-8021-6385-e576936b4fcb	2021-03-16 14:59:12.271	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 10:59:12.271+00	2021-03-16 10:59:12.296+00	Tape:12042->12043|R2:164->165|R1:191->192|
9aacf812-c58f-6751-d163-e522b9669e12	2021-03-16 15:01:13.271	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 11:01:13.27+00	2021-03-16 11:01:13.299+00	Tape:12043->12044|R2:165->166|R1:192->193|
c4210b0b-0270-89e8-2300-0309746ed538	2021-03-16 15:03:14.268	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 11:03:14.268+00	2021-03-16 11:03:14.3+00	Tape:12044->12045|R2:166->167|R1:193->194|
de5fdd21-62e4-df06-39d9-6c9754c61358	2021-03-16 15:05:15.268	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 11:05:15.267+00	2021-03-16 11:05:15.297+00	Tape:12045->12046|R2:167->168|R1:194->195|
48823a06-fae5-cdae-ff4e-08a3325d164f	2021-03-19 13:28:13.089	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 09:28:13.088+00	2021-03-19 09:28:13.126+00	Tape:12175->12176|R2:297->298|R1:324->325|
86df2ca5-953d-fa37-fd30-4fcd2ae1e135	2021-03-16 15:07:16.267	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 11:07:16.267+00	2021-03-16 11:07:16.295+00	Tape:12046->12047|R2:168->169|R1:195->196|
9f0b296b-7713-95b9-aaa4-0981aef589d9	2021-03-16 17:08:28.257	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 13:08:28.256+00	2021-03-16 13:08:28.286+00	Tape:12088->12089|R2:210->211|R1:237->238|
43f64701-5c23-dff5-85dd-d66335048e83	2021-03-16 15:09:17.263	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 11:09:17.262+00	2021-03-16 11:09:17.295+00	Tape:12047->12048|R2:169->170|R1:196->197|
84e80a64-5dbb-9887-0069-bf0297feac09	2021-03-16 15:11:17.305	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 11:11:17.304+00	2021-03-16 11:11:17.335+00	Tape:12048->12049|R2:170->171|R1:197->198|
b2827744-9739-c55f-efdb-1a0b6c4eb2aa	2021-03-16 17:10:28.259	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 13:10:28.257+00	2021-03-16 13:10:28.3+00	Tape:12089->12090|R2:211->212|R1:238->239|
7e4b7719-3002-7b9a-a30b-9a9261ba9928	2021-03-16 15:13:18.303	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 11:13:18.303+00	2021-03-16 11:13:18.335+00	Tape:12049->12050|R2:171->172|R1:198->199|
860ad4b7-7581-4821-a59a-5ca4bf727054	2021-03-16 15:15:19.302	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 11:15:19.301+00	2021-03-16 11:15:19.333+00	Tape:12050->12051|R2:172->173|R1:199->200|
c5ea8e70-bd8e-dcc2-3336-a14624b73753	2021-03-16 17:12:28.26	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 13:12:28.259+00	2021-03-16 13:12:28.294+00	Tape:12090->12091|R2:212->213|R1:239->240|
d1dffa41-aca2-b4c0-0303-dcb70e39d2e5	2021-03-16 15:17:20.304	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 11:17:20.303+00	2021-03-16 11:17:20.335+00	Tape:12051->12052|R2:173->174|R1:200->201|
103d3ecd-b989-9d7c-dc9a-0adf797b9d61	2021-03-16 15:19:20.305	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 11:19:20.305+00	2021-03-16 11:19:20.336+00	Tape:12052->12053|R2:174->175|R1:201->202|
665720cd-0b3c-70eb-4c1d-70e9e01ca550	2021-03-16 15:21:21.302	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 11:21:21.301+00	2021-03-16 11:21:21.332+00	Tape:12053->12054|R2:175->176|R1:202->203|
73da1483-a450-e3c1-bd5e-38d397b30393	2021-03-16 15:23:22.299	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 11:23:22.299+00	2021-03-16 11:23:22.325+00	Tape:12054->12055|R2:176->177|R1:203->204|
a5a3c34f-e82b-b5ef-6978-9991b065d1ac	2021-03-16 15:25:22.301	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 11:25:22.3+00	2021-03-16 11:25:22.328+00	Tape:12055->12056|R2:177->178|R1:204->205|
f5da0032-995d-4a1f-073f-63079105cd10	2021-03-16 15:27:23.307	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 11:27:23.306+00	2021-03-16 11:27:23.334+00	Tape:12056->12057|R2:178->179|R1:205->206|
270deb01-c4dd-9307-fa68-27aa6adb5c86	2021-03-16 15:29:24.3	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 11:29:24.3+00	2021-03-16 11:29:24.328+00	Tape:12057->12058|R2:179->180|R1:206->207|
0efce956-4898-1986-5b7d-48580352e582	2021-03-16 15:31:25.298	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 11:31:25.298+00	2021-03-16 11:31:25.329+00	Tape:12058->12059|R2:180->181|R1:207->208|
f04f20e6-17c9-5c67-4125-ef414a41208a	2021-03-16 15:33:26.298	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 11:33:26.297+00	2021-03-16 11:33:26.328+00	Tape:12059->12060|R2:181->182|R1:208->209|
a80e1118-ea63-218c-e4c6-d30ece286ba8	2021-03-16 15:35:26.303	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 11:35:26.303+00	2021-03-16 11:35:26.332+00	Tape:12060->12061|R2:182->183|R1:209->210|
b8dbb85f-5652-c652-ddb7-680926e5c0c6	2021-03-16 15:37:27.304	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 11:37:27.303+00	2021-03-16 11:37:27.33+00	Tape:12061->12062|R2:183->184|R1:210->211|
1c884e2e-0ca7-f77b-c6c0-93e5a7f10dcf	2021-03-16 15:39:28.297	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 11:39:28.296+00	2021-03-16 11:39:28.326+00	Tape:12062->12063|R2:184->185|R1:211->212|
0a2cc8f3-cc4d-68c2-3e23-3a3bf7b1544c	2021-03-16 15:41:28.337	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 11:41:28.336+00	2021-03-16 11:41:28.363+00	Tape:12063->12064|R2:185->186|R1:212->213|
adb61fea-ff5f-7451-6539-c02dc123209e	2021-03-16 15:43:28.338	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 11:43:28.338+00	2021-03-16 11:43:28.368+00	Tape:12064->12065|R2:186->187|R1:213->214|
079caa7a-661e-7938-b0d9-7c2cd7d8fbc5	2021-03-16 15:45:28.344	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 11:45:28.343+00	2021-03-16 11:45:28.367+00	Tape:12065->12066|R2:187->188|R1:214->215|
34a1f730-0a70-2067-d049-86cf8b38bb1d	2021-03-16 15:47:29.339	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 11:47:29.339+00	2021-03-16 11:47:29.37+00	Tape:12066->12067|R2:188->189|R1:215->216|
cc040b73-6d6a-7325-fec6-179275314cef	2021-03-16 15:49:29.342	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 11:49:29.341+00	2021-03-16 11:49:29.371+00	Tape:12067->12068|R2:189->190|R1:216->217|
e827b3e8-26e6-52f6-2eaa-0c030d6abb06	2021-03-16 16:19:36.386	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 12:19:36.386+00	2021-03-16 12:19:36.779+00	Tape:12068->12069|R2:190->191|R1:217->218|
9817fe88-5e5e-2da2-fa5d-3541246188a7	2021-03-16 16:31:44.871	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 12:31:44.87+00	2021-03-16 12:31:45.376+00	Tape:12069->12070|R2:191->192|R1:218->219|
e158feae-6268-e054-7de1-c14cb1fb84e4	2021-03-16 16:33:45.179	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 12:33:45.178+00	2021-03-16 12:33:45.215+00	Tape:12070->12071|R2:192->193|R1:219->220|
dc10c5c9-6187-b227-b75f-c55dd1a86d49	2021-03-16 16:35:45.179	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 12:35:45.178+00	2021-03-16 12:35:45.208+00	Tape:12071->12072|R2:193->194|R1:220->221|
53e6cb30-4f78-dc65-fc77-ad2525cff568	2021-03-16 16:37:45.18	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 12:37:45.18+00	2021-03-16 12:37:45.204+00	Tape:12072->12073|R2:194->195|R1:221->222|
1512a19e-332d-bcfe-be4d-0c621d848052	2021-03-16 16:39:45.183	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 12:39:45.182+00	2021-03-16 12:39:45.216+00	Tape:12073->12074|R2:195->196|R1:222->223|
b786925f-185c-d5be-9d87-b0720096d3b6	2021-03-16 16:40:23.775	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 12:40:23.705+00	2021-03-16 12:40:23.974+00	Tape:12074->12075|R2:196->197|R1:223->224|
2fd54c20-6a22-ad81-091c-0121c510f3df	2021-03-16 16:42:24.221	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 12:42:24.22+00	2021-03-16 12:42:24.253+00	Tape:12075->12076|R2:197->198|R1:224->225|
90abd301-9997-897f-1e7c-bea67b641b31	2021-03-16 16:44:24.228	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 12:44:24.226+00	2021-03-16 12:44:24.264+00	Tape:12076->12077|R2:198->199|R1:225->226|
a2ebc4fc-50cd-3110-a335-48636ab9aea8	2021-03-16 16:46:25.224	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 12:46:25.223+00	2021-03-16 12:46:25.257+00	Tape:12077->12078|R2:199->200|R1:226->227|
568fc492-8288-33cd-f1d3-179e28027e1e	2021-03-16 16:48:25.227	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 12:48:25.226+00	2021-03-16 12:48:25.258+00	Tape:12078->12079|R2:200->201|R1:227->228|
8889cc59-87a5-b3da-7b36-eae05d5bdd80	2021-03-16 16:50:25.227	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 12:50:25.226+00	2021-03-16 12:50:25.255+00	Tape:12079->12080|R2:201->202|R1:228->229|
bcf0dfe5-4d52-308c-0952-a5824b56f7ec	2021-03-16 16:52:25.232	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 12:52:25.231+00	2021-03-16 12:52:25.263+00	Tape:12080->12081|R2:202->203|R1:229->230|
b23db1c5-5d5c-a839-b61b-46b47e1950d1	2021-03-16 16:54:26.23	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 12:54:26.229+00	2021-03-16 12:54:26.265+00	Tape:12081->12082|R2:203->204|R1:230->231|
c341647d-7815-9482-9d62-642b640633b4	2021-03-16 16:56:27.232	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 12:56:27.231+00	2021-03-16 12:56:27.264+00	Tape:12082->12083|R2:204->205|R1:231->232|
bdea1c1d-39e5-df37-02f8-2cf1419397b1	2021-03-16 16:58:28.231	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 12:58:28.23+00	2021-03-16 12:58:28.264+00	Tape:12083->12084|R2:205->206|R1:232->233|
ce7866ef-7132-84fe-4a5e-9d8c040cb836	2021-03-16 17:00:28.231	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 13:00:28.23+00	2021-03-16 13:00:28.257+00	Tape:12084->12085|R2:206->207|R1:233->234|
84572547-02ee-7911-83ba-8c9725c8ddf3	2021-03-16 17:02:28.252	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 13:02:28.251+00	2021-03-16 13:02:28.282+00	Tape:12085->12086|R2:207->208|R1:234->235|
a876c6b6-c40d-06f1-b5d3-d7bd26a86a58	2021-03-16 17:04:28.256	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 13:04:28.255+00	2021-03-16 13:04:28.282+00	Tape:12086->12087|R2:208->209|R1:235->236|
b5547071-ed5f-1908-b9c9-a138d79d10e2	2021-03-16 17:14:28.26	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 13:14:28.259+00	2021-03-16 13:14:28.29+00	Tape:12091->12092|R2:213->214|R1:240->241|
e06ddfa8-a16d-36ca-32ef-79c2a8b824c7	2021-03-16 17:16:28.262	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 13:16:28.262+00	2021-03-16 13:16:28.293+00	Tape:12092->12093|R2:214->215|R1:241->242|
562bd599-f670-7237-bf1d-351f7dd8a553	2021-03-19 13:30:13.092	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 09:30:13.091+00	2021-03-19 09:30:13.12+00	Tape:12176->12177|R2:298->299|R1:325->326|
081e8c46-4592-4147-f077-0a625bf9f288	2021-03-16 17:18:28.265	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 13:18:28.264+00	2021-03-16 13:18:28.292+00	Tape:12093->12094|R2:215->216|R1:242->243|
a43d25df-046d-5bff-b9a9-df5ad70e1d7f	2021-03-16 17:20:28.268	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 13:20:28.268+00	2021-03-16 13:20:28.298+00	Tape:12094->12095|R2:216->217|R1:243->244|
816c7bd9-92fa-c4cb-88d4-1143df799e80	2021-03-19 13:34:14.087	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 09:34:14.086+00	2021-03-19 09:34:14.15+00	Tape:12178->12179|R2:300->301|R1:327->328|
7ebd1949-c1e6-9888-a36a-6c6e39163bfd	2021-03-16 17:22:29.272	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 13:22:29.272+00	2021-03-16 13:22:29.302+00	Tape:12095->12096|R2:217->218|R1:244->245|
17fe5de7-419f-591f-c7ed-bb8e5bd8a8c1	2021-03-16 17:24:30.241	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 13:24:30.241+00	2021-03-16 13:24:30.27+00	Tape:12096->12097|R2:218->219|R1:245->246|
c999049f-278b-f805-22a4-60fef2fc72a1	2021-03-19 13:36:14.086	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 09:36:14.086+00	2021-03-19 09:36:14.122+00	Tape:12179->12180|R2:301->302|R1:328->329|
60ecb4c0-ce1d-99d1-91df-4b899a8701a8	2021-03-16 17:26:31.232	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 13:26:31.231+00	2021-03-16 13:26:31.258+00	Tape:12097->12098|R2:219->220|R1:246->247|
e1f03978-ed59-318d-1dc0-b41e3f02754f	2021-03-16 17:28:32.231	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 13:28:32.23+00	2021-03-16 13:28:32.259+00	Tape:12098->12099|R2:220->221|R1:247->248|
7d38ade3-cdf7-0925-d597-a3cae5f0c444	2021-03-19 13:38:14.087	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 09:38:14.086+00	2021-03-19 09:38:14.117+00	Tape:12180->12181|R2:302->303|R1:329->330|
0f179d63-87db-aabf-553e-42e54ccc416a	2021-03-16 17:32:33.239	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 13:32:33.238+00	2021-03-16 13:32:33.267+00	Tape:12100->12101|R2:222->223|R1:249->250|
a59dec89-a865-6360-f68a-da0894df7b8e	2021-03-16 17:34:34.238	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 13:34:34.238+00	2021-03-16 13:34:34.267+00	Tape:12101->12102|R2:223->224|R1:250->251|
74ebb81a-7606-9241-2175-2f6ed0efb7a5	2021-03-19 13:40:14.089	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 09:40:14.089+00	2021-03-19 09:40:14.123+00	Tape:12181->12182|R2:303->304|R1:330->331|
e27ddcf1-b834-e7ed-6051-84f3c8bd21eb	2021-03-16 17:36:35.231	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 13:36:35.231+00	2021-03-16 13:36:35.257+00	Tape:12102->12103|R2:224->225|R1:251->252|
ce29a109-3c4d-5542-9ecc-badde17390dc	2021-03-16 17:38:36.231	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 13:38:36.231+00	2021-03-16 13:38:36.259+00	Tape:12103->12104|R2:225->226|R1:252->253|
3d6a1935-100e-9d50-83e3-33c4ab7fa618	2021-03-19 13:42:14.093	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 09:42:14.093+00	2021-03-19 09:42:14.12+00	Tape:12182->12183|R2:304->305|R1:331->332|
7d5edd76-fbb6-8809-5c7d-635763bc4ac4	2021-03-19 13:46:16.097	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 09:46:16.096+00	2021-03-19 09:46:16.123+00	Tape:12184->12185|R2:306->307|R1:333->334|
8b65e23d-deca-9aea-35d5-757cfc29b8fe	2021-03-19 14:16:46.767	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 10:16:46.765+00	2021-03-19 10:16:47.144+00	Tape:12185->12186|R2:307->308|R1:334->335|
e156260c-f629-fdb1-90ad-1c7de99cc115	2021-03-19 14:24:58.84	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 10:24:58.835+00	2021-03-19 10:24:59.246+00	Tape:12186->12187|R2:308->309|R1:335->336|
72ca8cb2-45ee-3ed1-4163-2317efc74560	2021-03-19 14:57:42.75	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 10:57:42.749+00	2021-03-19 10:57:43.124+00	Tape:12188->12189|R2:310->311|R1:337->338|
def08cf5-a07d-c52a-4611-1b1a6bb10393	2021-03-19 15:16:23.731	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 11:16:23.73+00	2021-03-19 11:16:24.103+00	Tape:12189->12190|R2:311->312|R1:338->339|
925c3861-0bf8-be09-74e5-00ff515fbfa3	2021-03-16 17:30:32.238	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 13:30:32.238+00	2021-03-16 13:30:32.268+00	Tape:12099->12100|R2:221->222|R1:248->249|
34868928-61b8-d434-6583-165d3186d854	2021-03-19 13:32:13.091	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 09:32:13.091+00	2021-03-19 09:32:13.126+00	Tape:12177->12178|R2:299->300|R1:326->327|
3957b442-18d2-9ab6-8432-d0f1e0a64b6a	2021-03-19 13:44:15.093	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 09:44:15.092+00	2021-03-19 09:44:15.127+00	Tape:12183->12184|R2:305->306|R1:332->333|
49b9134d-4f70-b298-bb01-1c607e72b9b2	2021-03-19 14:26:59.192	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 10:26:59.191+00	2021-03-19 10:26:59.227+00	Tape:12187->12188|R2:309->310|R1:336->337|
d3c0972b-eb28-c1e1-88b1-f4f042708712	2021-03-16 17:40:37.243	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 13:40:37.234+00	2021-03-16 13:40:37.276+00	Tape:12104->12105|R2:226->227|R1:253->254|
4932d417-09c8-dc7d-8b73-1e2989ca9cb1	2021-03-16 17:44:39.228	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 13:44:39.227+00	2021-03-16 13:44:39.258+00	Tape:12106->12107|R2:228->229|R1:255->256|
b70ac680-c208-67b1-0ff7-1fc2add2aa83	2021-03-19 16:55:24.696	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 12:55:24.696+00	2021-03-19 12:55:25.065+00	Tape:12190->12191|R2:312->313|R1:339->340|
be9b0177-1336-c2e7-9833-264183dfb09b	2021-03-19 18:29:58.589	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 14:29:58.588+00	2021-03-19 14:29:58.964+00	Tape:12191->12192|R2:313->314|R1:340->341|
65fd468a-f87e-4aee-3f73-bb9bed0961b8	2021-03-19 18:31:59.271	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 14:31:59.27+00	2021-03-19 14:31:59.298+00	Tape:12192->12193|R2:314->315|R1:341->342|
c258241e-6ebc-b035-f664-6c09aa285f94	2021-03-16 17:42:38.227	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 13:42:38.226+00	2021-03-16 13:42:38.257+00	Tape:12105->12106|R2:227->228|R1:254->255|
6f36efc2-b57b-a2bd-0f78-ab85e7204f6f	2021-03-19 18:34:00.272	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 14:34:00.271+00	2021-03-19 14:34:00.306+00	Tape:12193->12194|R2:315->316|R1:342->343|
528fd9b2-8be2-6ed2-ba79-4a9670239294	2021-03-19 18:36:01.266	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 14:36:01.266+00	2021-03-19 14:36:01.296+00	Tape:12194->12195|R2:316->317|R1:343->344|
5a29a50a-75a3-14bb-c02a-0887ae50eaf0	2021-03-19 18:38:02.264	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 14:38:02.263+00	2021-03-19 14:38:02.295+00	Tape:12195->12196|R2:317->318|R1:344->345|
1254c4b3-0c5d-8104-2658-74f51f793860	2021-03-19 18:40:02.264	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 14:40:02.263+00	2021-03-19 14:40:02.29+00	Tape:12196->12197|R2:318->319|R1:345->346|
dc0a5227-4789-cac2-f8ae-b48ecf58a2b8	2021-03-19 18:42:03.26	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 14:42:03.26+00	2021-03-19 14:42:03.29+00	Tape:12197->12198|R2:319->320|R1:346->347|
097d9b74-334e-c2cd-561b-a82b7f87ad38	2021-03-19 18:44:04.259	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 14:44:04.258+00	2021-03-19 14:44:04.288+00	Tape:12198->12199|R2:320->321|R1:347->348|
fcb5d722-401a-1b68-ce6a-aa8a1ad0ea88	2021-03-19 18:48:06.255	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 14:48:06.255+00	2021-03-19 14:48:06.284+00	Tape:12200->12201|R2:322->323|R1:349->350|
37f1d974-8edb-69a1-10a1-41436ff5d790	2021-03-19 18:50:06.262	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 14:50:06.262+00	2021-03-19 14:50:06.29+00	Tape:12201->12202|R2:323->324|R1:350->351|
cf511bb2-5810-dd0a-4ac2-508402b2307b	2021-03-19 18:52:07.255	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 14:52:07.254+00	2021-03-19 14:52:07.284+00	Tape:12202->12203|R2:324->325|R1:351->352|
d60144d1-fd4a-23ad-d8b4-cc6f427b86ee	2021-03-19 18:54:07.255	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 14:54:07.254+00	2021-03-19 14:54:07.285+00	Tape:12203->12204|R2:325->326|R1:352->353|
267cb555-3daa-cc2f-fae0-3c713ced21f4	2021-03-19 18:56:08.255	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 14:56:08.254+00	2021-03-19 14:56:08.281+00	Tape:12204->12205|R2:326->327|R1:353->354|
ccbb0fa7-cee0-b941-c1b8-96f2c2fa4a0b	2021-03-19 18:58:08.254	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 14:58:08.254+00	2021-03-19 14:58:08.283+00	Tape:12205->12206|R2:327->328|R1:354->355|
d7e84f36-af27-f447-300f-fc5195dae5fd	2021-03-19 19:00:08.285	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 15:00:08.284+00	2021-03-19 15:00:08.315+00	Tape:12206->12207|R2:328->329|R1:355->356|
6cfa286b-0cf4-3f79-3181-ced94d3b6cb0	2021-03-16 17:46:40.225	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 13:46:40.225+00	2021-03-16 13:46:40.256+00	Tape:12107->12108|R2:229->230|R1:256->257|
615b3a17-af04-a500-087a-2ad3a65a815d	2021-03-16 17:50:42.221	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 13:50:42.22+00	2021-03-16 13:50:42.249+00	Tape:12109->12110|R2:231->232|R1:258->259|
cdb1fcde-b5ef-b81d-1b47-abb85006d84e	2021-03-19 18:46:05.258	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 14:46:05.258+00	2021-03-19 14:46:05.288+00	Tape:12199->12200|R2:321->322|R1:348->349|
bd929509-48ec-c6b0-837b-7aa3739d9a68	2021-03-16 17:52:42.22	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 13:52:42.22+00	2021-03-16 13:52:42.248+00	Tape:12110->12111|R2:232->233|R1:259->260|
d4ef47a1-3bca-fbee-a569-2f1efa5abdf4	2021-03-16 17:54:43.222	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 13:54:43.222+00	2021-03-16 13:54:43.247+00	Tape:12111->12112|R2:233->234|R1:260->261|
ba326394-34f0-69a0-71ca-aa357b9d4231	2021-03-16 17:56:44.22	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 13:56:44.219+00	2021-03-16 13:56:44.251+00	Tape:12112->12113|R2:234->235|R1:261->262|
53cc539c-82ec-e50b-8d21-8bf4d343a7e1	2021-03-16 17:58:45.182	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 13:58:45.181+00	2021-03-16 13:58:45.211+00	Tape:12113->12114|R2:235->236|R1:262->263|
eab21033-cb96-fc62-9c59-0dc0a1a238c4	2021-03-16 18:00:46.177	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 14:00:46.176+00	2021-03-16 14:00:46.204+00	Tape:12114->12115|R2:236->237|R1:263->264|
84f51749-198f-a770-6e72-ae87557ae800	2021-03-16 18:02:46.18	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 14:02:46.18+00	2021-03-16 14:02:46.211+00	Tape:12115->12116|R2:237->238|R1:264->265|
94b74b4c-435b-43bc-063b-80f4b7f8426d	2021-03-16 18:04:47.171	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 14:04:47.17+00	2021-03-16 14:04:47.203+00	Tape:12116->12117|R2:238->239|R1:265->266|
7c0e9a25-3ef3-9c92-6660-632d5b3b4b94	2021-03-16 18:06:48.169	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 14:06:48.168+00	2021-03-16 14:06:48.199+00	Tape:12117->12118|R2:239->240|R1:266->267|
8c9c7fd8-845a-f362-1af3-63f9c4389537	2021-03-16 18:08:49.17	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 14:08:49.169+00	2021-03-16 14:08:49.202+00	Tape:12118->12119|R2:240->241|R1:267->268|
aeadf2ee-597b-ecf1-1661-ef5237987e85	2021-03-16 17:48:41.221	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 13:48:41.221+00	2021-03-16 13:48:41.251+00	Tape:12108->12109|R2:230->231|R1:257->258|
a0a8c2d2-bc4c-9382-7ba7-cacccdebffae	2021-03-19 19:02:09.281	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 15:02:09.28+00	2021-03-19 15:02:09.313+00	Tape:12207->12208|R2:329->330|R1:356->357|
8ac3b5c0-9669-a63a-f58b-01a448aa1933	2021-03-16 18:10:50.167	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 14:10:50.167+00	2021-03-16 14:10:50.2+00	Tape:12119->12120|R2:241->242|R1:268->269|
05a0e519-c283-6e4c-9def-f7ccebe49129	2021-03-16 18:12:50.21	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 14:12:50.209+00	2021-03-16 14:12:50.238+00	Tape:12120->12121|R2:242->243|R1:269->270|
962b30de-4385-18b0-f07d-fb3ac2a18875	2021-03-19 19:22:58.788	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 15:22:58.786+00	2021-03-19 15:22:59.179+00	Tape:12208->12209|R2:330->331|R1:357->358|
96e89bcb-7892-f446-aa41-b4a72009420b	2021-03-16 18:14:50.212	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 14:14:50.211+00	2021-03-16 14:14:50.242+00	Tape:12121->12122|R2:243->244|R1:270->271|
9bee202d-18d9-0b43-67ac-ff73299e4d5e	2021-03-16 18:16:50.214	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 14:16:50.213+00	2021-03-16 14:16:50.243+00	Tape:12122->12123|R2:244->245|R1:271->272|
73601fe2-0a15-508b-03cc-f7145c448f91	2021-03-19 19:27:00.437	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 15:27:00.437+00	2021-03-19 15:27:00.465+00	Tape:12210->12211|R2:332->333|R1:359->360|
bc870a42-2a16-7857-33e6-24a5fa09a5be	2021-03-19 19:39:04.431	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 15:39:04.43+00	2021-03-19 15:39:04.46+00	Tape:12216->12217|R2:338->339|R1:365->366|
526b4f60-788b-2230-2448-59054ed2f548	2021-03-19 19:45:07.415	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 15:45:07.415+00	2021-03-19 15:45:07.444+00	Tape:12219->12220|R2:341->342|R1:368->369|
6361aebd-9d7b-5c10-919b-19858af76a00	2021-03-16 18:17:25.269	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 14:17:25.173+00	2021-03-16 14:17:25.475+00	Tape:12123->12124|R2:245->246|R1:272->273|
45c6ba64-5298-8cc9-a134-93eef0775d0f	2021-03-16 18:19:25.666	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 14:19:25.664+00	2021-03-16 14:19:25.704+00	Tape:12124->12125|R2:246->247|R1:273->274|
85034118-050d-de16-f425-4215b318aed6	2021-03-19 19:24:59.445	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 15:24:59.444+00	2021-03-19 15:24:59.474+00	Tape:12209->12210|R2:331->332|R1:358->359|
5cba6d96-61b0-f51b-4983-35cef0c4fa66	2021-03-16 18:21:26.667	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 14:21:26.666+00	2021-03-16 14:21:26.699+00	Tape:12125->12126|R2:247->248|R1:274->275|
b29900da-fac8-2d62-f121-bdb1ac727860	2021-03-16 18:23:27.665	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 14:23:27.664+00	2021-03-16 14:23:27.698+00	Tape:12126->12127|R2:248->249|R1:275->276|
c1162d1a-81d7-6a7c-5862-7f7cc95c6f5a	2021-03-19 19:29:01.44	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 15:29:01.44+00	2021-03-19 15:29:01.47+00	Tape:12211->12212|R2:333->334|R1:360->361|
8cc11f89-7c5c-4490-54e7-eb93ee49af65	2021-03-16 18:25:28.661	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 14:25:28.66+00	2021-03-16 14:25:28.694+00	Tape:12127->12128|R2:249->250|R1:276->277|
1fd6e4f1-e847-7134-37e0-37643b1b9279	2021-03-16 18:27:28.663	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 14:27:28.662+00	2021-03-16 14:27:28.695+00	Tape:12128->12129|R2:250->251|R1:277->278|
5b0f427d-493f-452e-9af8-c62e8bf1aead	2021-03-19 19:31:01.441	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 15:31:01.441+00	2021-03-19 15:31:01.47+00	Tape:12212->12213|R2:334->335|R1:361->362|
8893a77e-ba4f-4c98-c26b-ccc36df9676c	2021-03-16 18:29:28.664	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 14:29:28.663+00	2021-03-16 14:29:28.694+00	Tape:12129->12130|R2:251->252|R1:278->279|
fad4ea14-96e5-3542-6aa0-30bd3ac334bb	2021-03-16 18:31:29.662	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 14:31:29.661+00	2021-03-16 14:31:29.693+00	Tape:12105->12106|R2:227->228|R1:254->255|
55511ccf-d462-c6a3-a455-af7c29cecb96	2021-03-19 19:33:02.43	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 15:33:02.43+00	2021-03-19 15:33:02.459+00	Tape:12213->12214|R2:335->336|R1:362->363|
369a125b-709d-eef5-59dd-574a5a4dc047	2021-03-16 18:33:30.658	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 14:33:30.658+00	2021-03-16 14:33:30.685+00	Tape:12106->12107|R2:228->229|R1:255->256|
5e166806-6a84-b046-b49c-d29ef0e765e3	2021-03-16 18:35:30.659	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-16 14:35:30.658+00	2021-03-16 14:35:30.687+00	Tape:12107->12108|R2:229->230|R1:256->257|
d870dbf7-bdd7-5d47-2153-55925b3f36ee	2021-03-19 19:35:03.429	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 15:35:03.429+00	2021-03-19 15:35:03.457+00	Tape:12214->12215|R2:336->337|R1:363->364|
6878d80b-53f1-0936-e93f-eb1c64bbc67e	2021-03-19 19:37:04.429	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 15:37:04.428+00	2021-03-19 15:37:04.459+00	Tape:12215->12216|R2:337->338|R1:364->365|
8a2bb1f0-0bb9-52b1-abbc-bc2af424eaa9	2021-03-19 19:41:05.427	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 15:41:05.426+00	2021-03-19 15:41:05.454+00	Tape:12217->12218|R2:339->340|R1:366->367|
f327be39-066f-8b23-8f79-e45c2061d9e4	2021-03-19 19:43:06.418	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 15:43:06.418+00	2021-03-19 15:43:06.446+00	Tape:12218->12219|R2:340->341|R1:367->368|
074883d0-02b4-e993-6d47-0b81ef918013	2021-03-19 19:47:07.417	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 15:47:07.417+00	2021-03-19 15:47:07.445+00	Tape:12220->12221|R2:342->343|R1:369->370|
afd9cad4-3234-445a-5df3-4fc962f55a52	2021-03-19 19:49:08.417	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 15:49:08.417+00	2021-03-19 15:49:08.444+00	Tape:12221->12222|R2:343->344|R1:370->371|
86b654d0-795d-0e87-4678-8604ddccc1e0	2021-03-19 19:51:09.414	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 15:51:09.413+00	2021-03-19 15:51:09.441+00	Tape:12222->12223|R2:344->345|R1:371->372|
49d890c6-e4ef-db4b-c332-f3d81e279675	2021-03-19 11:07:45.221	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 07:07:45.15+00	2021-03-19 07:07:45.426+00	Tape:12108->12109|R2:230->231|R1:257->258|
48ba5baf-9f16-007a-63b8-d7e4a6b3a8c5	2021-03-19 11:09:45.465	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 07:09:45.464+00	2021-03-19 07:09:45.498+00	Tape:12109->12110|R2:231->232|R1:258->259|
86a8702f-f2c2-579c-e084-d04ba0dff19c	2021-03-19 19:53:10.401	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 15:53:10.4+00	2021-03-19 15:53:10.435+00	Tape:12223->12224|R2:345->346|R1:372->373|
5c19bcb8-e487-c6b9-873b-67e831cefe55	2021-03-19 11:13:46.462	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 07:13:46.46+00	2021-03-19 07:13:46.49+00	Tape:12111->12112|R2:233->234|R1:260->261|
42971c75-f479-ef7b-3516-697956c94d60	2021-03-19 11:15:47.456	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 07:15:47.455+00	2021-03-19 07:15:47.489+00	Tape:12112->12113|R2:234->235|R1:261->262|
c540c99b-67e9-a3b1-1770-bd66f2da3150	2021-03-19 19:55:10.4	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 15:55:10.4+00	2021-03-19 15:55:10.427+00	Tape:12224->12225|R2:346->347|R1:373->374|
6315a5c4-b81f-7c86-4153-a642c38139c1	2021-03-19 11:19:49.427	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 07:19:49.426+00	2021-03-19 07:19:49.459+00	Tape:12114->12115|R2:236->237|R1:263->264|
721cc863-917e-e66e-b59f-0ac8025bfd29	2021-03-19 11:21:50.421	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 07:21:50.42+00	2021-03-19 07:21:50.449+00	Tape:12115->12116|R2:237->238|R1:264->265|
e11a6d03-259b-f205-cdba-2ceef4dddb4e	2021-03-19 19:57:11.399	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 15:57:11.399+00	2021-03-19 15:57:11.427+00	Tape:12225->12226|R2:347->348|R1:374->375|
5b585462-783c-af23-4364-e718956ea4f7	2021-03-19 11:23:51.413	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 07:23:51.412+00	2021-03-19 07:23:51.441+00	Tape:12116->12117|R2:238->239|R1:265->266|
9d92020f-2335-0d7e-671f-594d3f0e839a	2021-03-19 11:25:52.408	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 07:25:52.407+00	2021-03-19 07:25:52.433+00	Tape:12117->12118|R2:239->240|R1:266->267|
c9bc8656-bf5d-8567-bc6d-a116e375315e	2021-03-19 19:59:12.399	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 15:59:12.399+00	2021-03-19 15:59:12.43+00	Tape:12226->12227|R2:348->349|R1:375->376|
ddedab07-0164-79ed-e478-5c894519c5df	2021-03-19 11:29:54.4	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 07:29:54.399+00	2021-03-19 07:29:54.424+00	Tape:12119->12120|R2:241->242|R1:268->269|
5158e061-d623-91b6-5d11-f31c9bb4e3c8	2021-03-19 11:31:55.394	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 07:31:55.394+00	2021-03-19 07:31:55.421+00	Tape:12120->12121|R2:242->243|R1:269->270|
e3c6403d-fec6-db56-2adb-f94cc701a299	2021-03-19 20:01:13.398	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 16:01:13.397+00	2021-03-19 16:01:13.425+00	Tape:12227->12228|R2:349->350|R1:376->377|
b5dcb5fe-1770-3ac4-5d9d-e6c1d9c32af5	2021-03-19 11:35:56.43	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 07:35:56.429+00	2021-03-19 07:35:56.457+00	Tape:12122->12123|R2:244->245|R1:271->272|
4726e917-54e5-2678-7f96-801f02db43ed	2021-03-19 20:03:14.39	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 16:03:14.389+00	2021-03-19 16:03:14.413+00	Tape:12228->12229|R2:350->351|R1:377->378|
a36dfdfe-99e3-5d29-7777-2755f139e5fb	2021-03-19 20:05:14.399	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 16:05:14.398+00	2021-03-19 16:05:14.428+00	Tape:12229->12230|R2:351->352|R1:378->379|
62fd4f0a-4724-9e6e-de59-f337ee599561	2021-03-19 20:07:15.395	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 16:07:15.395+00	2021-03-19 16:07:15.423+00	Tape:12230->12231|R2:352->353|R1:379->380|
f3a66cc1-c12b-da7f-b0d6-746936311118	2021-03-19 20:09:16.392	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 16:09:16.391+00	2021-03-19 16:09:16.418+00	Tape:12231->12232|R2:353->354|R1:380->381|
3beeab32-261a-a5a4-7c28-d6a6120c6f97	2021-03-19 11:11:46.461	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 07:11:46.459+00	2021-03-19 07:11:46.502+00	Tape:12110->12111|R2:232->233|R1:259->260|
38fe19f6-0237-9db0-846e-8f05fb845106	2021-03-19 11:17:48.454	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 07:17:48.452+00	2021-03-19 07:17:48.483+00	Tape:12113->12114|R2:235->236|R1:262->263|
8ce8b82c-187b-f88b-40ac-90cd447c793f	2021-03-19 20:11:16.392	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 16:11:16.391+00	2021-03-19 16:11:16.42+00	Tape:12232->12233|R2:354->355|R1:381->382|
a65dd578-cf1b-1efb-43b9-37ee396dc055	2021-03-19 11:27:53.403	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 07:27:53.402+00	2021-03-19 07:27:53.429+00	Tape:12118->12119|R2:240->241|R1:267->268|
d0abb543-d635-1329-cfd6-facadd5148d5	2021-03-19 11:33:56.39	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 07:33:56.389+00	2021-03-19 07:33:56.417+00	Tape:12121->12122|R2:243->244|R1:270->271|
6e3b2910-497a-8f07-ed30-978454149010	2021-03-19 20:13:17.383	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 16:13:17.383+00	2021-03-19 16:13:17.41+00	Tape:12233->12234|R2:355->356|R1:382->383|
216f2e7e-de19-f4dd-6617-4fb07bd4da22	2021-03-19 20:15:17.384	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 16:15:17.384+00	2021-03-19 16:15:17.412+00	Tape:12234->12235|R2:356->357|R1:383->384|
187912b8-1dd6-ce32-5168-ed92699bfd47	2021-03-19 20:17:18.383	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 16:17:18.383+00	2021-03-19 16:17:18.41+00	Tape:12235->12236|R2:357->358|R1:384->385|
58d38912-9720-4a1a-ca48-d26a97bcc675	2021-03-19 20:19:18.433	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 16:19:18.432+00	2021-03-19 16:19:18.458+00	Tape:12236->12237|R2:358->359|R1:385->386|
e51fd3e3-5dbc-54dc-594d-f5e287015176	2021-03-19 11:37:57.422	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 07:37:57.421+00	2021-03-19 07:37:57.454+00	Tape:12123->12124|R2:245->246|R1:272->273|
95365dcc-abd7-72cd-73ab-70c84b8d030b	2021-03-19 11:39:58.42	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 07:39:58.419+00	2021-03-19 07:39:58.445+00	Tape:12124->12125|R2:246->247|R1:273->274|
1c00fdc5-4789-c6fd-f145-b952ba3aa36c	2021-03-19 20:21:19.427	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 16:21:19.426+00	2021-03-19 16:21:19.461+00	Tape:12237->12238|R2:359->360|R1:386->387|
a7e56d4a-5a21-f2ed-82f9-ae0e58872cc4	2021-03-19 11:51:19.642	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 07:51:19.641+00	2021-03-19 07:51:19.681+00	Tape:12126->12127|R2:248->249|R1:275->276|
a01c3cbb-e080-53d6-719c-3643adc9e848	2021-03-19 11:53:20.64	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 07:53:20.639+00	2021-03-19 07:53:20.678+00	Tape:12127->12128|R2:249->250|R1:276->277|
cf19099b-1335-dcef-7071-d9f2511eb6fb	2021-03-19 11:55:20.642	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 07:55:20.641+00	2021-03-19 07:55:20.671+00	Tape:12128->12129|R2:250->251|R1:277->278|
21bd3429-08e0-1225-2e63-e508c6f4b16a	2021-03-19 11:57:21.639	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 07:57:21.639+00	2021-03-19 07:57:21.67+00	Tape:12129->12130|R2:251->252|R1:278->279|
a11b427e-4840-1d2b-2e5c-8b9e39491a7c	2021-03-19 11:59:22.639	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 07:59:22.638+00	2021-03-19 07:59:22.665+00	Tape:12130->12131|R2:252->253|R1:279->280|
7409b555-22d8-870b-2ba3-44c749d1880e	2021-03-19 12:01:22.639	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 08:01:22.639+00	2021-03-19 08:01:22.686+00	Tape:12131->12132|R2:253->254|R1:280->281|
31b552dd-28db-1f81-77ff-6cf2f2f994e0	2021-03-19 12:03:23.64	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 08:03:23.639+00	2021-03-19 08:03:23.67+00	Tape:12132->12133|R2:254->255|R1:281->282|
ab58ed11-8b72-7dcb-67c8-e8b0cfd2635c	2021-03-19 12:05:24.639	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 08:05:24.639+00	2021-03-19 08:05:24.668+00	Tape:12133->12134|R2:255->256|R1:282->283|
002c5bcb-e715-5e60-161d-7d58e2aef548	2021-03-19 12:07:24.64	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 08:07:24.639+00	2021-03-19 08:07:24.667+00	Tape:12134->12135|R2:256->257|R1:283->284|
1f26fdb5-aa5e-ee52-b8bf-8a2e6d5b5363	2021-03-19 12:09:25.639	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 08:09:25.638+00	2021-03-19 08:09:25.671+00	Tape:12135->12136|R2:257->258|R1:284->285|
d5bff1e5-7c43-2be0-312d-7bb5b4a66d72	2021-03-19 12:11:26.637	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 08:11:26.637+00	2021-03-19 08:11:26.665+00	Tape:12136->12137|R2:258->259|R1:285->286|
8778a68c-992b-688f-5b1b-3a8d6ee4b7bf	2021-03-19 12:13:27.634	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 08:13:27.634+00	2021-03-19 08:13:27.664+00	Tape:12137->12138|R2:259->260|R1:286->287|
84b4204e-3529-0374-dcb6-ea4f9a6ad67f	2021-03-19 11:49:18.692	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 07:49:18.689+00	2021-03-19 07:49:18.745+00	Tape:12125->12126|R2:247->248|R1:274->275|
2410e18f-7595-689c-32d4-99c5a2802338	2021-03-19 20:23:20.424	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 16:23:20.423+00	2021-03-19 16:23:20.457+00	Tape:12238->12239|R2:360->361|R1:387->388|
af8be298-adfd-2d6c-04a7-59ed2b010e15	2021-03-19 20:25:21.419	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 16:25:21.419+00	2021-03-19 16:25:21.447+00	Tape:12239->12240|R2:361->362|R1:388->389|
17070952-acd7-3a4e-5d9d-4a0164cc5165	2021-03-19 20:27:21.425	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 16:27:21.424+00	2021-03-19 16:27:21.454+00	Tape:12240->12241|R2:362->363|R1:389->390|
f15589f2-05c1-1a94-cd01-726fefe53d7a	2021-03-19 20:29:22.416	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 16:29:22.415+00	2021-03-19 16:29:22.441+00	Tape:12241->12242|R2:363->364|R1:390->391|
dfff1a20-7eb7-6eb6-5f19-6f419404734f	2021-03-19 20:31:22.417	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 16:31:22.417+00	2021-03-19 16:31:22.445+00	Tape:12242->12243|R2:364->365|R1:391->392|
bee322db-42e8-ef23-7b8f-63b7501be79f	2021-03-19 20:33:23.411	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 16:33:23.41+00	2021-03-19 16:33:23.437+00	Tape:12243->12244|R2:365->366|R1:392->393|
b911eb1d-11ab-eef2-3c6a-4df5b686ba9a	2021-03-19 20:35:23.427	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 16:35:23.427+00	2021-03-19 16:35:23.454+00	Tape:12244->12245|R2:366->367|R1:393->394|
d8e2b4e1-607d-5bc8-5cdb-fa82a34da011	2021-03-19 20:37:23.429	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 16:37:23.429+00	2021-03-19 16:37:23.457+00	Tape:12245->12246|R2:367->368|R1:394->395|
b05b8f40-e604-1231-e4ce-40ccedb8e1e0	2021-03-19 20:39:24.428	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 16:39:24.428+00	2021-03-19 16:39:24.454+00	Tape:12246->12247|R2:368->369|R1:395->396|
d26db138-0ec8-c691-f8f6-fd7c5c8e7373	2021-03-19 20:41:25.425	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 16:41:25.425+00	2021-03-19 16:41:25.453+00	Tape:12247->12248|R2:369->370|R1:396->397|
19082e84-aec4-564f-b181-9ea03960620e	2021-03-19 20:43:26.42	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 16:43:26.42+00	2021-03-19 16:43:26.447+00	Tape:12248->12249|R2:370->371|R1:397->398|
6726de11-4dbf-0bd8-6ac9-35f9298c63f1	2021-03-19 20:45:27.418	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 16:45:27.418+00	2021-03-19 16:45:27.452+00	Tape:12249->12250|R2:371->372|R1:398->399|
fe825da5-ccc2-43f7-9ee9-86fa9291d0a0	2021-03-19 20:47:27.419	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 16:47:27.418+00	2021-03-19 16:47:27.444+00	Tape:12250->12251|R2:372->373|R1:399->400|
5dfe7a51-187b-bcce-9aa7-df2bf6bfc8c3	2021-03-19 20:49:27.429	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 16:49:27.428+00	2021-03-19 16:49:27.451+00	Tape:12251->12252|R2:373->374|R1:400->401|
78d3b0b5-78ab-a8ca-717b-0a74acedb714	2021-03-19 12:15:27.635	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 08:15:27.635+00	2021-03-19 08:15:27.67+00	Tape:12138->12139|R2:260->261|R1:287->288|
87e657e2-c50a-2c1b-d6e4-6c12cf4d3f70	2021-03-19 12:17:28.629	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 08:17:28.628+00	2021-03-19 08:17:28.66+00	Tape:12139->12140|R2:261->262|R1:288->289|
a56fed6f-da3a-af86-bf70-c1e3e7c53296	2021-03-19 20:51:27.432	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 16:51:27.432+00	2021-03-19 16:51:27.463+00	Tape:12252->12253|R2:374->375|R1:401->402|
262d6631-fd8b-f2ba-a90e-2f6d2f353db3	2021-03-19 12:19:28.629	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 08:19:28.628+00	2021-03-19 08:19:28.659+00	Tape:12140->12141|R2:262->263|R1:289->290|
67392437-e6ce-6998-bbe4-5f2b0fbdd2f7	2021-03-19 12:21:28.629	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 08:21:28.628+00	2021-03-19 08:21:28.656+00	Tape:12141->12142|R2:263->264|R1:290->291|
b292063e-8835-2444-7fe6-7d1b4261f2bc	2021-03-19 12:23:28.629	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 08:23:28.628+00	2021-03-19 08:23:28.659+00	Tape:12142->12143|R2:264->265|R1:291->292|
4a35ca08-3a70-5829-0ede-066a855e5bc6	2021-03-19 12:29:30.622	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 08:29:30.621+00	2021-03-19 08:29:30.651+00	Tape:12145->12146|R2:267->268|R1:294->295|
825e0e7e-16a0-c481-378b-45f22a580213	2021-03-19 12:25:29.625	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 08:25:29.625+00	2021-03-19 08:25:29.657+00	Tape:12143->12144|R2:265->266|R1:292->293|
1a7ac3cf-99ea-1974-1071-2986afad395b	2021-03-19 12:27:30.621	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 08:27:30.62+00	2021-03-19 08:27:30.651+00	Tape:12144->12145|R2:266->267|R1:293->294|
ccd97b48-f702-4c8c-48c2-de9b452f8c82	2021-03-19 21:06:59.292	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 17:06:59.292+00	2021-03-19 17:06:59.666+00	Tape:12253->12254|R2:375->376|R1:402->403|
cfe26582-0714-76e8-9646-bb6499dac34c	2021-03-19 21:08:59.302	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 17:08:59.302+00	2021-03-19 17:08:59.326+00	Tape:12254->12255|R2:376->377|R1:403->404|
3f20e779-163e-233f-422e-9d1946fd6c0c	2021-03-19 21:10:59.306	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 17:10:59.305+00	2021-03-19 17:10:59.335+00	Tape:12255->12256|R2:377->378|R1:404->405|
cca9a2c7-ee7a-afb0-9afc-76286008434e	2021-03-19 21:13:00.301	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 17:13:00.301+00	2021-03-19 17:13:00.326+00	Tape:12256->12257|R2:378->379|R1:405->406|
5df97d32-28a9-74cd-2682-c8805dc8ce9e	2021-03-19 21:15:00.304	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 17:15:00.303+00	2021-03-19 17:15:00.329+00	Tape:12257->12258|R2:379->380|R1:406->407|
4d4deb79-daa5-b7e5-5bd8-9b12602925cf	2021-03-19 21:17:01.302	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 17:17:01.302+00	2021-03-19 17:17:01.33+00	Tape:12258->12259|R2:380->381|R1:407->408|
6de4837d-616c-1b41-3eb3-647c9bef3b8f	2021-03-19 21:21:02.304	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 17:21:02.303+00	2021-03-19 17:21:02.33+00	Tape:12260->12261|R2:382->383|R1:409->410|
eafdf33f-f6f9-1e5e-bc63-86a49e0b790e	2021-03-19 21:23:02.309	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 17:23:02.308+00	2021-03-19 17:23:02.339+00	Tape:12261->12262|R2:383->384|R1:410->411|
8229b0c9-089a-d531-8b8a-dc3e9efcf9ba	2021-03-19 21:25:02.31	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 17:25:02.309+00	2021-03-19 17:25:02.338+00	Tape:12262->12263|R2:384->385|R1:411->412|
6c549fdb-16e0-6539-152f-51ba97fc6dc3	2021-03-19 21:27:03.306	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 17:27:03.305+00	2021-03-19 17:27:03.332+00	Tape:12263->12264|R2:385->386|R1:412->413|
1d0a4826-f3ce-9822-3526-e17b643e1b1a	2021-03-19 21:29:03.306	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 17:29:03.306+00	2021-03-19 17:29:03.333+00	Tape:12264->12265|R2:386->387|R1:413->414|
98c71a23-9cc8-b6c8-e6fd-6dcafed26a40	2021-03-19 21:33:03.312	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 17:33:03.312+00	2021-03-19 17:33:03.339+00	Tape:12266->12267|R2:388->389|R1:415->416|
c073de88-447c-7feb-cbec-fb1641d66030	2021-03-19 12:31:31.62	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 08:31:31.619+00	2021-03-19 08:31:31.651+00	Tape:12146->12147|R2:268->269|R1:295->296|
61533f6b-b7de-a266-5bef-e2de474d16e3	2021-03-19 12:41:34.651	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 08:41:34.651+00	2021-03-19 08:41:34.684+00	Tape:12151->12152|R2:273->274|R1:300->301|
948667af-abda-3c0d-4834-9baddd154bee	2021-03-19 21:19:01.303	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 17:19:01.302+00	2021-03-19 17:19:01.333+00	Tape:12259->12260|R2:381->382|R1:408->409|
542b2389-4191-d705-be69-58040550b208	2021-03-19 21:31:03.308	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 17:31:03.307+00	2021-03-19 17:31:03.336+00	Tape:12265->12266|R2:387->388|R1:414->415|
e1bbf211-ebbe-dc08-1209-37b97a3d666a	2021-03-19 12:33:32.617	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 08:33:32.616+00	2021-03-19 08:33:32.646+00	Tape:12147->12148|R2:269->270|R1:296->297|
1dbaf56f-7890-3ca6-ab5e-3ba443288ca0	2021-03-19 12:35:33.615	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 08:35:33.615+00	2021-03-19 08:35:33.643+00	Tape:12148->12149|R2:270->271|R1:297->298|
2d0c709e-e665-dc29-3c2a-b9adfe611084	2021-03-19 21:35:04.31	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 17:35:04.309+00	2021-03-19 17:35:04.34+00	Tape:12267->12268|R2:389->390|R1:416->417|
c62088c2-4591-0b5c-602e-8a183dbc858d	2021-03-19 12:37:33.65	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 08:37:33.649+00	2021-03-19 08:37:33.685+00	Tape:12149->12150|R2:271->272|R1:298->299|
186a59db-0180-6628-437a-f93f6c1418d9	2021-03-19 12:39:33.651	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 08:39:33.651+00	2021-03-19 08:39:33.683+00	Tape:12150->12151|R2:272->273|R1:299->300|
34eb4b1c-616a-7e87-b8e2-0a5c99cc16bc	2021-03-19 12:43:35.654	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 08:43:35.653+00	2021-03-19 08:43:35.69+00	Tape:12152->12153|R2:274->275|R1:301->302|
5d4f9cc2-ef80-9a5c-9eef-962579d2adf3	2021-03-19 21:37:05.306	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 17:37:05.306+00	2021-03-19 17:37:05.336+00	Tape:12268->12269|R2:390->391|R1:417->418|
eb4a654d-96cb-0dee-c384-17d6f1e175e7	2021-03-19 21:39:06.308	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 17:39:06.308+00	2021-03-19 17:39:06.333+00	Tape:12269->12270|R2:391->392|R1:418->419|
84225502-0387-bb24-0c77-5ddda47c7125	2021-03-19 21:41:07.306	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 17:41:07.305+00	2021-03-19 17:41:07.335+00	Tape:12270->12271|R2:392->393|R1:419->420|
90619b34-6e95-a320-5403-604d8870167f	2021-03-19 21:43:07.31	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 17:43:07.31+00	2021-03-19 17:43:07.338+00	Tape:12271->12272|R2:393->394|R1:420->421|
c139a8bd-c6e3-2a16-ba43-9f0e7bcb54c6	2021-03-19 21:45:07.313	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 17:45:07.313+00	2021-03-19 17:45:07.34+00	Tape:12272->12273|R2:394->395|R1:421->422|
6d3eea0a-478e-0e2a-5e38-ec4bf2fe3c3f	2021-03-19 21:47:08.311	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 17:47:08.31+00	2021-03-19 17:47:08.336+00	Tape:12273->12274|R2:395->396|R1:422->423|
734edd36-18c1-07eb-030c-b6572efb8f6f	2021-03-19 21:49:09.307	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 17:49:09.306+00	2021-03-19 17:49:09.331+00	Tape:12274->12275|R2:396->397|R1:423->424|
f4eb46f4-0f33-e20e-6f64-9118da5b227b	2021-03-19 21:51:10.304	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 17:51:10.303+00	2021-03-19 17:51:10.332+00	Tape:12275->12276|R2:397->398|R1:424->425|
f336adbf-b716-559f-206f-51b8f2b6d62b	2021-03-19 21:53:10.329	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 17:53:10.328+00	2021-03-19 17:53:10.356+00	Tape:12276->12277|R2:398->399|R1:425->426|
999984b7-4bd5-d54a-f658-fb7005669577	2021-03-19 12:45:36.649	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 08:45:36.648+00	2021-03-19 08:45:36.676+00	Tape:12153->12154|R2:275->276|R1:302->303|
b2e81e52-3f28-d9db-093e-1ae102bbb84b	2021-03-19 12:55:37.68	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 08:55:37.68+00	2021-03-19 08:55:37.711+00	Tape:12158->12159|R2:280->281|R1:307->308|
3a76c43e-2e31-0a77-e0e1-75c7626f4357	2021-03-19 21:55:10.329	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 17:55:10.328+00	2021-03-19 17:55:10.357+00	Tape:12277->12278|R2:399->400|R1:426->427|
a48ad616-f07e-f1e3-6de7-d212c81295af	2021-03-19 21:59:11.325	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 17:59:11.325+00	2021-03-19 17:59:11.353+00	Tape:12279->12280|R2:401->402|R1:428->429|
36ee62cc-f86b-73e2-d01a-3390f459b5ac	2021-03-19 22:01:12.325	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 18:01:12.325+00	2021-03-19 18:01:12.354+00	Tape:12280->12281|R2:402->403|R1:429->430|
465bd8a8-c71f-3a0c-802e-6c286488cc09	2021-03-19 22:03:13.323	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 18:03:13.322+00	2021-03-19 18:03:13.348+00	Tape:12281->12282|R2:403->404|R1:430->431|
3c494a62-b910-2a51-11c4-8136c021cc2b	2021-03-19 12:47:36.653	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 08:47:36.652+00	2021-03-19 08:47:36.685+00	Tape:12154->12155|R2:276->277|R1:303->304|
f3d9a008-802d-98fe-0bf9-2adda4ffc5dc	2021-03-19 12:49:36.656	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 08:49:36.655+00	2021-03-19 08:49:36.682+00	Tape:12155->12156|R2:277->278|R1:304->305|
b309a9eb-7bea-502f-1297-ef2b83a565e9	2021-03-19 21:57:10.328	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 17:57:10.328+00	2021-03-19 17:57:10.358+00	Tape:12278->12279|R2:400->401|R1:427->428|
d694cdbd-e8b1-17ba-2c17-91d99a758151	2021-03-19 12:51:37.648	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 08:51:37.648+00	2021-03-19 08:51:37.679+00	Tape:12156->12157|R2:278->279|R1:305->306|
aa514eff-4408-4d80-0f1a-a613fbcd1fc5	2021-03-19 12:53:37.679	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 08:53:37.679+00	2021-03-19 08:53:37.709+00	Tape:12157->12158|R2:279->280|R1:306->307|
cb46d25b-5a9b-6292-9292-fd68a2eadb94	2021-03-19 12:57:38.684	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 08:57:38.684+00	2021-03-19 08:57:38.718+00	Tape:12159->12160|R2:281->282|R1:308->309|
addde052-8eec-127e-ab87-8200f3a648b6	2021-03-19 12:58:05.625	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 08:58:05.552+00	2021-03-19 08:58:05.802+00	Tape:12160->12161|R2:282->283|R1:309->310|
83dc9774-72a2-141e-317d-9f23b38f272d	2021-03-19 13:00:06.08	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 09:00:06.078+00	2021-03-19 09:00:06.114+00	Tape:12161->12162|R2:283->284|R1:310->311|
4e1ccc15-8a3a-2c5d-a55a-6410179e035a	2021-03-19 22:05:13.328	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 18:05:13.328+00	2021-03-19 18:05:13.361+00	Tape:12282->12283|R2:404->405|R1:431->432|
577f8d18-b595-13ab-a0bd-e0a0f309a9ce	2021-03-19 13:02:07.08	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 09:02:07.079+00	2021-03-19 09:02:07.116+00	Tape:12162->12163|R2:284->285|R1:311->312|
856eaf37-3e52-c6e5-662c-faf8a2844118	2021-03-19 13:04:07.082	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 09:04:07.081+00	2021-03-19 09:04:07.116+00	Tape:12163->12164|R2:285->286|R1:312->313|
4e624168-3eab-30a2-5dc2-dabc97b5242c	2021-03-19 22:07:13.333	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 18:07:13.332+00	2021-03-19 18:07:13.362+00	Tape:12283->12284|R2:405->406|R1:432->433|
8051a069-450d-abd5-0b8a-b4351c5188a3	2021-03-19 13:06:08.081	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 09:06:08.08+00	2021-03-19 09:06:08.112+00	Tape:12164->12165|R2:286->287|R1:313->314|
30166b0d-1d98-3f95-f116-69da3941528b	2021-03-19 13:10:10.046	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 09:10:10.045+00	2021-03-19 09:10:10.075+00	Tape:12166->12167|R2:288->289|R1:315->316|
3c45bc82-b48b-cfa0-c575-7f749387c648	2021-03-19 22:09:13.34	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 18:09:13.34+00	2021-03-19 18:09:13.363+00	Tape:12284->12285|R2:406->407|R1:433->434|
51dda5d3-af61-ff05-c7ee-5b6ceb9f2c5a	2021-03-19 13:12:10.05	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 09:12:10.048+00	2021-03-19 09:12:10.082+00	Tape:12167->12168|R2:289->290|R1:316->317|
6b9713eb-e90d-a02b-1272-3087e06f6027	2021-03-19 13:14:10.049	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 09:14:10.048+00	2021-03-19 09:14:10.082+00	Tape:12168->12169|R2:290->291|R1:317->318|
5c895852-a9be-595e-8b38-cfdf1d965c43	2021-03-19 22:44:55.642	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 18:44:55.642+00	2021-03-19 18:44:55.67+00	Tape:12286->12287|R2:408->409|R1:435->436|
c2ad3d80-539d-bf53-84c1-5a98d820627b	2021-03-19 13:16:11.044	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 09:16:11.043+00	2021-03-19 09:16:11.074+00	Tape:12169->12170|R2:291->292|R1:318->319|
85e169fe-7f0b-92b2-a837-f036691633f2	2021-03-19 13:18:12.044	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 09:18:12.044+00	2021-03-19 09:18:12.076+00	Tape:12170->12171|R2:292->293|R1:319->320|
4cdff4e6-5d75-284d-a413-3881a4b78d07	2021-03-19 22:50:55.646	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 18:50:55.646+00	2021-03-19 18:50:55.672+00	Tape:12289->12290|R2:411->412|R1:438->439|
ed690515-98de-d64b-f981-11fd59c7449a	2021-03-19 13:20:12.051	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 09:20:12.051+00	2021-03-19 09:20:12.08+00	Tape:12171->12172|R2:293->294|R1:320->321|
de112294-d701-d277-1375-70bcebe33850	2021-03-19 13:22:13.042	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 09:22:13.041+00	2021-03-19 09:22:13.071+00	Tape:12172->12173|R2:294->295|R1:321->322|
707c78f3-7984-7916-1587-e53c8bfeeba8	2021-03-19 22:52:55.648	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 18:52:55.647+00	2021-03-19 18:52:55.674+00	Tape:12290->12291|R2:412->413|R1:439->440|
4221630e-c25b-2750-b120-5c80744c4120	2021-03-19 13:08:09.059	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 09:08:09.058+00	2021-03-19 09:08:09.098+00	Tape:12165->12166|R2:287->288|R1:314->315|
0ee52df0-c1ba-fe91-86c8-3638026e9c65	2021-03-19 13:24:13.086	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 09:24:13.086+00	2021-03-19 09:24:13.118+00	Tape:12173->12174|R2:295->296|R1:322->323|
61465484-298a-54a5-ae80-fb642357044b	2021-03-19 22:42:55.122	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 18:42:55.121+00	2021-03-19 18:42:55.499+00	Tape:12285->12286|R2:407->408|R1:434->435|
aa75865b-964f-910c-d9c4-dbac972d4dbf	2021-03-19 13:26:13.089	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 09:26:13.087+00	2021-03-19 09:26:13.12+00	Tape:12174->12175|R2:296->297|R1:323->324|
fc8b7b1f-eaaf-1abf-cb14-e1444afbcc2e	2021-03-19 22:46:55.644	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 18:46:55.644+00	2021-03-19 18:46:55.673+00	Tape:12287->12288|R2:409->410|R1:436->437|
43b07b75-fff9-4b0f-11ad-927dd76bb102	2021-03-19 22:48:55.645	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-19 18:48:55.644+00	2021-03-19 18:48:55.675+00	Tape:12288->12289|R2:410->411|R1:437->438|
\.


--
-- TOC entry 3437 (class 0 OID 25657)
-- Dependencies: 208
-- Data for Name: sys_scheduled_task; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sys_scheduled_task (id, create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, defined_by, class_name, script_name, bean_name, method_name, method_params, user_name, is_singleton, is_active, period_, timeout, start_date, time_frame, start_delay, permitted_servers, log_start, log_finish, last_start_time, last_start_server, description, cron, scheduling_type) FROM stdin;
e3957b47-c1ed-f35e-e2c9-52d175ea4b69	2021-03-05 11:59:25.165	admin	2021-03-05 13:24:41.124	admin	\N	\N	\N	B	\N	\N	ratlab_Resources	addConsumables	<?xml version="1.0" encoding="UTF-8"?>\n\n<params>\n  <param type="java.lang.String" name="count">1</param>\n</params>\n	admin	f	t	120	\N	\N	\N	\N	\N	t	t	\N	\N	\N	\N	P
\.


--
-- TOC entry 3461 (class 0 OID 26011)
-- Dependencies: 232
-- Data for Name: sys_sending_attachment; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sys_sending_attachment (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, message_id, content, content_file_id, content_id, name, disposition, text_encoding) FROM stdin;
\.


--
-- TOC entry 3460 (class 0 OID 25994)
-- Dependencies: 231
-- Data for Name: sys_sending_message; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sys_sending_message (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, address_to, address_cc, address_bcc, address_from, caption, email_headers, content_text, content_text_file_id, deadline, status, date_sent, attempts_count, attempts_made, attachments_name, body_content_type) FROM stdin;
b2ef2064-9545-1b3a-2c1b-b2753179565d	2021-03-19 13:05:50.838	admin	2	2021-03-19 09:05:56.318+00	admin	\N	\N	\N	d.taimanov@haulmont.com	\N	\N	DoNotReply@localhost	Email subject	\N	Some email body	\N	\N	300	\N	\N	1	\N	text/plain; charset=UTF-8
1f1d1e09-e572-16b0-5a06-dbd39fbd3a9b	2021-03-19 18:31:40.098	admin	2	2021-03-19 14:31:45.198+00	admin	\N	\N	\N	d.taimanov@haulmont.com	\N	\N	DoNotReply@localhost	Email subject	\N	Some email body	\N	\N	300	\N	\N	1	\N	text/plain; charset=UTF-8
5d737200-0c18-61fa-d09e-b6aa5de9fe2d	2021-03-19 18:31:47.673	admin	2	2021-03-19 14:31:52.693+00	admin	\N	\N	\N	d.taimanov@haulmont.com	\N	\N	DoNotReply@localhost	Email subject	\N	Some email body	\N	\N	300	\N	\N	1	\N	text/plain; charset=UTF-8
\.


--
-- TOC entry 3432 (class 0 OID 25618)
-- Dependencies: 203
-- Data for Name: sys_server; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sys_server (id, create_ts, created_by, update_ts, updated_by, name, is_running, data) FROM stdin;
57c74db2-a994-2073-2440-f431127555af	2021-03-02 16:56:25.517	\N	2021-03-19 22:52:21.105	\N	localhost:8080/app-core	t	\N
\.


--
-- TOC entry 3491 (class 0 OID 0)
-- Dependencies: 238
-- Name: sys_query_result_seq; Type: SEQUENCE SET; Schema: public; Owner: cuba
--

SELECT pg_catalog.setval('public.sys_query_result_seq', 1, false);


--
-- TOC entry 3212 (class 2606 OID 26163)
-- Name: ratlab_certificate ratlab_certificate_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.ratlab_certificate
    ADD CONSTRAINT ratlab_certificate_pkey PRIMARY KEY (id);


--
-- TOC entry 3216 (class 2606 OID 26171)
-- Name: ratlab_employee ratlab_employee_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.ratlab_employee
    ADD CONSTRAINT ratlab_employee_pkey PRIMARY KEY (id);


--
-- TOC entry 3218 (class 2606 OID 26176)
-- Name: ratlab_employee_research_link ratlab_employee_research_link_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.ratlab_employee_research_link
    ADD CONSTRAINT ratlab_employee_research_link_pkey PRIMARY KEY (employee_id, research_id);


--
-- TOC entry 3223 (class 2606 OID 26184)
-- Name: ratlab_laboratory ratlab_laboratory_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.ratlab_laboratory
    ADD CONSTRAINT ratlab_laboratory_pkey PRIMARY KEY (id);


--
-- TOC entry 3225 (class 2606 OID 26189)
-- Name: ratlab_misc_resource ratlab_misc_resource_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.ratlab_misc_resource
    ADD CONSTRAINT ratlab_misc_resource_pkey PRIMARY KEY (id);


--
-- TOC entry 3227 (class 2606 OID 26197)
-- Name: ratlab_rat ratlab_rat_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.ratlab_rat
    ADD CONSTRAINT ratlab_rat_pkey PRIMARY KEY (id);


--
-- TOC entry 3229 (class 2606 OID 26205)
-- Name: ratlab_research ratlab_research_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.ratlab_research
    ADD CONSTRAINT ratlab_research_pkey PRIMARY KEY (id);


--
-- TOC entry 3246 (class 2606 OID 26976)
-- Name: ratlab_research_requirement ratlab_research_requirement_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.ratlab_research_requirement
    ADD CONSTRAINT ratlab_research_requirement_pkey PRIMARY KEY (id);


--
-- TOC entry 3250 (class 2606 OID 27000)
-- Name: ratlab_resource_requirement ratlab_resource_requirement_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.ratlab_resource_requirement
    ADD CONSTRAINT ratlab_resource_requirement_pkey PRIMARY KEY (id);


--
-- TOC entry 3254 (class 2606 OID 27005)
-- Name: ratlab_subject_requirement ratlab_subject_requirement_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.ratlab_subject_requirement
    ADD CONSTRAINT ratlab_subject_requirement_pkey PRIMARY KEY (id);


--
-- TOC entry 3243 (class 2606 OID 26928)
-- Name: report_execution report_execution_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.report_execution
    ADD CONSTRAINT report_execution_pkey PRIMARY KEY (id);


--
-- TOC entry 3233 (class 2606 OID 26878)
-- Name: report_group report_group_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.report_group
    ADD CONSTRAINT report_group_pkey PRIMARY KEY (id);


--
-- TOC entry 3237 (class 2606 OID 26891)
-- Name: report_report report_report_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.report_report
    ADD CONSTRAINT report_report_pkey PRIMARY KEY (id);


--
-- TOC entry 3239 (class 2606 OID 26913)
-- Name: report_template report_template_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.report_template
    ADD CONSTRAINT report_template_pkey PRIMARY KEY (id);


--
-- TOC entry 3110 (class 2606 OID 25780)
-- Name: sec_constraint sec_constraint_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_constraint
    ADD CONSTRAINT sec_constraint_pkey PRIMARY KEY (id);


--
-- TOC entry 3138 (class 2606 OID 25871)
-- Name: sec_entity_log sec_entity_log_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_entity_log
    ADD CONSTRAINT sec_entity_log_pkey PRIMARY KEY (id);


--
-- TOC entry 3141 (class 2606 OID 25889)
-- Name: sec_filter sec_filter_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_filter
    ADD CONSTRAINT sec_filter_pkey PRIMARY KEY (id);


--
-- TOC entry 3097 (class 2606 OID 25713)
-- Name: sec_group_hierarchy sec_group_hierarchy_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_group_hierarchy
    ADD CONSTRAINT sec_group_hierarchy_pkey PRIMARY KEY (id);


--
-- TOC entry 3095 (class 2606 OID 25701)
-- Name: sec_group sec_group_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_group
    ADD CONSTRAINT sec_group_pkey PRIMARY KEY (id);


--
-- TOC entry 3113 (class 2606 OID 25795)
-- Name: sec_localized_constraint_msg sec_localized_constraint_msg_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_localized_constraint_msg
    ADD CONSTRAINT sec_localized_constraint_msg_pkey PRIMARY KEY (id);


--
-- TOC entry 3130 (class 2606 OID 25855)
-- Name: sec_logged_attr sec_logged_attr_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_logged_attr
    ADD CONSTRAINT sec_logged_attr_pkey PRIMARY KEY (id);


--
-- TOC entry 3132 (class 2606 OID 25857)
-- Name: sec_logged_attr sec_logged_attr_uniq_name; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_logged_attr
    ADD CONSTRAINT sec_logged_attr_uniq_name UNIQUE (entity_id, name);


--
-- TOC entry 3125 (class 2606 OID 25848)
-- Name: sec_logged_entity sec_logged_entity_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_logged_entity
    ADD CONSTRAINT sec_logged_entity_pkey PRIMARY KEY (id);


--
-- TOC entry 3127 (class 2606 OID 25850)
-- Name: sec_logged_entity sec_logged_entity_uniq_name; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_logged_entity
    ADD CONSTRAINT sec_logged_entity_uniq_name UNIQUE (name);


--
-- TOC entry 3107 (class 2606 OID 25762)
-- Name: sec_permission sec_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_permission
    ADD CONSTRAINT sec_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 3148 (class 2606 OID 25930)
-- Name: sec_presentation sec_presentation_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_presentation
    ADD CONSTRAINT sec_presentation_pkey PRIMARY KEY (id);


--
-- TOC entry 3202 (class 2606 OID 26124)
-- Name: sec_remember_me sec_remember_me_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_remember_me
    ADD CONSTRAINT sec_remember_me_pkey PRIMARY KEY (id);


--
-- TOC entry 3091 (class 2606 OID 25690)
-- Name: sec_role sec_role_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_role
    ADD CONSTRAINT sec_role_pkey PRIMARY KEY (id);


--
-- TOC entry 3162 (class 2606 OID 25977)
-- Name: sec_screen_history sec_screen_history_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_screen_history
    ADD CONSTRAINT sec_screen_history_pkey PRIMARY KEY (id);


--
-- TOC entry 3151 (class 2606 OID 25944)
-- Name: sec_search_folder sec_search_folder_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_search_folder
    ADD CONSTRAINT sec_search_folder_pkey PRIMARY KEY (folder_id);


--
-- TOC entry 3116 (class 2606 OID 25805)
-- Name: sec_session_attr sec_session_attr_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_session_attr
    ADD CONSTRAINT sec_session_attr_pkey PRIMARY KEY (id);


--
-- TOC entry 3208 (class 2606 OID 26140)
-- Name: sec_session_log sec_session_log_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_session_log
    ADD CONSTRAINT sec_session_log_pkey PRIMARY KEY (id);


--
-- TOC entry 3101 (class 2606 OID 25732)
-- Name: sec_user sec_user_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_user
    ADD CONSTRAINT sec_user_pkey PRIMARY KEY (id);


--
-- TOC entry 3104 (class 2606 OID 25745)
-- Name: sec_user_role sec_user_role_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_user_role
    ADD CONSTRAINT sec_user_role_pkey PRIMARY KEY (id);


--
-- TOC entry 3118 (class 2606 OID 25819)
-- Name: sec_user_setting sec_user_setting_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_user_setting
    ADD CONSTRAINT sec_user_setting_pkey PRIMARY KEY (id);


--
-- TOC entry 3120 (class 2606 OID 25821)
-- Name: sec_user_setting sec_user_setting_uniq; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_user_setting
    ADD CONSTRAINT sec_user_setting_uniq UNIQUE (user_id, name, client_type);


--
-- TOC entry 3123 (class 2606 OID 25832)
-- Name: sec_user_substitution sec_user_substitution_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_user_substitution
    ADD CONSTRAINT sec_user_substitution_pkey PRIMARY KEY (id);


--
-- TOC entry 3145 (class 2606 OID 25917)
-- Name: sys_app_folder sys_app_folder_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sys_app_folder
    ADD CONSTRAINT sys_app_folder_pkey PRIMARY KEY (folder_id);


--
-- TOC entry 3189 (class 2606 OID 26082)
-- Name: sys_attr_value sys_attr_value_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sys_attr_value
    ADD CONSTRAINT sys_attr_value_pkey PRIMARY KEY (id);


--
-- TOC entry 3183 (class 2606 OID 26066)
-- Name: sys_category_attr sys_category_attr_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sys_category_attr
    ADD CONSTRAINT sys_category_attr_pkey PRIMARY KEY (id);


--
-- TOC entry 3179 (class 2606 OID 26056)
-- Name: sys_category sys_category_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sys_category
    ADD CONSTRAINT sys_category_pkey PRIMARY KEY (id);


--
-- TOC entry 3074 (class 2606 OID 25635)
-- Name: sys_config sys_config_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sys_config
    ADD CONSTRAINT sys_config_pkey PRIMARY KEY (id);


--
-- TOC entry 3068 (class 2606 OID 25617)
-- Name: sys_db_changelog sys_db_changelog_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sys_db_changelog
    ADD CONSTRAINT sys_db_changelog_pkey PRIMARY KEY (script_name);


--
-- TOC entry 3176 (class 2606 OID 26038)
-- Name: sys_entity_snapshot sys_entity_snapshot_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sys_entity_snapshot
    ADD CONSTRAINT sys_entity_snapshot_pkey PRIMARY KEY (id);


--
-- TOC entry 3081 (class 2606 OID 25655)
-- Name: sys_entity_statistics sys_entity_statistics_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sys_entity_statistics
    ADD CONSTRAINT sys_entity_statistics_pkey PRIMARY KEY (id);


--
-- TOC entry 3076 (class 2606 OID 25645)
-- Name: sys_file sys_file_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sys_file
    ADD CONSTRAINT sys_file_pkey PRIMARY KEY (id);


--
-- TOC entry 3143 (class 2606 OID 25904)
-- Name: sys_folder sys_folder_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sys_folder
    ADD CONSTRAINT sys_folder_pkey PRIMARY KEY (id);


--
-- TOC entry 3154 (class 2606 OID 25968)
-- Name: sys_fts_queue sys_fts_queue_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sys_fts_queue
    ADD CONSTRAINT sys_fts_queue_pkey PRIMARY KEY (id);


--
-- TOC entry 3191 (class 2606 OID 26105)
-- Name: sys_jmx_instance sys_jmx_instance_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sys_jmx_instance
    ADD CONSTRAINT sys_jmx_instance_pkey PRIMARY KEY (id);


--
-- TOC entry 3078 (class 2606 OID 25650)
-- Name: sys_lock_config sys_lock_config_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sys_lock_config
    ADD CONSTRAINT sys_lock_config_pkey PRIMARY KEY (id);


--
-- TOC entry 3198 (class 2606 OID 26113)
-- Name: sys_query_result sys_query_result_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sys_query_result
    ADD CONSTRAINT sys_query_result_pkey PRIMARY KEY (id);


--
-- TOC entry 3087 (class 2606 OID 25674)
-- Name: sys_scheduled_execution sys_scheduled_execution_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sys_scheduled_execution
    ADD CONSTRAINT sys_scheduled_execution_pkey PRIMARY KEY (id);


--
-- TOC entry 3083 (class 2606 OID 25666)
-- Name: sys_scheduled_task sys_scheduled_task_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sys_scheduled_task
    ADD CONSTRAINT sys_scheduled_task_pkey PRIMARY KEY (id);


--
-- TOC entry 3170 (class 2606 OID 26019)
-- Name: sys_sending_attachment sys_sending_attachment_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sys_sending_attachment
    ADD CONSTRAINT sys_sending_attachment_pkey PRIMARY KEY (id);


--
-- TOC entry 3167 (class 2606 OID 26002)
-- Name: sys_sending_message sys_sending_message_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sys_sending_message
    ADD CONSTRAINT sys_sending_message_pkey PRIMARY KEY (id);


--
-- TOC entry 3071 (class 2606 OID 25625)
-- Name: sys_server sys_server_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sys_server
    ADD CONSTRAINT sys_server_pkey PRIMARY KEY (id);


--
-- TOC entry 3180 (class 1259 OID 26073)
-- Name: idx_cat_attr_ent_type_and_code; Type: INDEX; Schema: public; Owner: cuba
--

CREATE UNIQUE INDEX idx_cat_attr_ent_type_and_code ON public.sys_category_attr USING btree (category_entity_type, code) WHERE (delete_ts IS NULL);


--
-- TOC entry 3209 (class 1259 OID 26212)
-- Name: idx_ratlab_certificate_on_owner; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_ratlab_certificate_on_owner ON public.ratlab_certificate USING btree (owner_id);


--
-- TOC entry 3210 (class 1259 OID 26211)
-- Name: idx_ratlab_certificate_uk_code; Type: INDEX; Schema: public; Owner: cuba
--

CREATE UNIQUE INDEX idx_ratlab_certificate_uk_code ON public.ratlab_certificate USING btree (code) WHERE (delete_ts IS NULL);


--
-- TOC entry 3213 (class 1259 OID 26223)
-- Name: idx_ratlab_employee_on_laboratory; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_ratlab_employee_on_laboratory ON public.ratlab_employee USING btree (laboratory_id);


--
-- TOC entry 3214 (class 1259 OID 26224)
-- Name: idx_ratlab_employee_on_supervisor; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_ratlab_employee_on_supervisor ON public.ratlab_employee USING btree (supervisor_id);


--
-- TOC entry 3219 (class 1259 OID 26235)
-- Name: idx_ratlab_laboratory_uk_code; Type: INDEX; Schema: public; Owner: cuba
--

CREATE UNIQUE INDEX idx_ratlab_laboratory_uk_code ON public.ratlab_laboratory USING btree (code) WHERE (delete_ts IS NULL);


--
-- TOC entry 3220 (class 1259 OID 26237)
-- Name: idx_ratlab_laboratory_uk_day_end; Type: INDEX; Schema: public; Owner: cuba
--

CREATE UNIQUE INDEX idx_ratlab_laboratory_uk_day_end ON public.ratlab_laboratory USING btree (day_end) WHERE (delete_ts IS NULL);


--
-- TOC entry 3221 (class 1259 OID 26236)
-- Name: idx_ratlab_laboratory_uk_title; Type: INDEX; Schema: public; Owner: cuba
--

CREATE UNIQUE INDEX idx_ratlab_laboratory_uk_title ON public.ratlab_laboratory USING btree (title) WHERE (delete_ts IS NULL);


--
-- TOC entry 3244 (class 1259 OID 26992)
-- Name: idx_ratlab_research_requirement_on_research; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_ratlab_research_requirement_on_research ON public.ratlab_research_requirement USING btree (research_id);


--
-- TOC entry 3247 (class 1259 OID 27016)
-- Name: idx_ratlab_resource_requirement_on_research; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_ratlab_resource_requirement_on_research ON public.ratlab_resource_requirement USING btree (research_id);


--
-- TOC entry 3248 (class 1259 OID 27017)
-- Name: idx_ratlab_resource_requirement_on_resource; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_ratlab_resource_requirement_on_resource ON public.ratlab_resource_requirement USING btree (resource_id);


--
-- TOC entry 3251 (class 1259 OID 27028)
-- Name: idx_ratlab_subject_requirement_on_research; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_ratlab_subject_requirement_on_research ON public.ratlab_subject_requirement USING btree (research_id);


--
-- TOC entry 3252 (class 1259 OID 27029)
-- Name: idx_ratlab_subject_requirement_on_subject; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_ratlab_subject_requirement_on_subject ON public.ratlab_subject_requirement USING btree (subject_id);


--
-- TOC entry 3240 (class 1259 OID 26944)
-- Name: idx_report_execution_report_id; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_report_execution_report_id ON public.report_execution USING btree (report_id);


--
-- TOC entry 3241 (class 1259 OID 26945)
-- Name: idx_report_execution_start_time; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_report_execution_start_time ON public.report_execution USING btree (start_time);


--
-- TOC entry 3230 (class 1259 OID 26879)
-- Name: idx_report_group_uniq_title; Type: INDEX; Schema: public; Owner: cuba
--

CREATE UNIQUE INDEX idx_report_group_uniq_title ON public.report_group USING btree (title) WHERE ((delete_ts IS NULL) AND (sys_tenant_id IS NULL));


--
-- TOC entry 3231 (class 1259 OID 26880)
-- Name: idx_report_group_uniq_title_sys_tenant_id_nn; Type: INDEX; Schema: public; Owner: cuba
--

CREATE UNIQUE INDEX idx_report_group_uniq_title_sys_tenant_id_nn ON public.report_group USING btree (title, sys_tenant_id) WHERE ((delete_ts IS NULL) AND (sys_tenant_id IS NOT NULL));


--
-- TOC entry 3234 (class 1259 OID 26897)
-- Name: idx_report_report_uniq_name; Type: INDEX; Schema: public; Owner: cuba
--

CREATE UNIQUE INDEX idx_report_report_uniq_name ON public.report_report USING btree (name) WHERE ((delete_ts IS NULL) AND (sys_tenant_id IS NULL));


--
-- TOC entry 3235 (class 1259 OID 26898)
-- Name: idx_report_report_uniq_name_sys_tenant_id_nn; Type: INDEX; Schema: public; Owner: cuba
--

CREATE UNIQUE INDEX idx_report_report_uniq_name_sys_tenant_id_nn ON public.report_report USING btree (name, sys_tenant_id) WHERE ((delete_ts IS NULL) AND (sys_tenant_id IS NOT NULL));


--
-- TOC entry 3108 (class 1259 OID 25786)
-- Name: idx_sec_constraint_group; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sec_constraint_group ON public.sec_constraint USING btree (group_id);


--
-- TOC entry 3133 (class 1259 OID 25877)
-- Name: idx_sec_entity_log_entity_id; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sec_entity_log_entity_id ON public.sec_entity_log USING btree (entity_id);


--
-- TOC entry 3134 (class 1259 OID 25879)
-- Name: idx_sec_entity_log_ientity_id; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sec_entity_log_ientity_id ON public.sec_entity_log USING btree (int_entity_id);


--
-- TOC entry 3135 (class 1259 OID 25880)
-- Name: idx_sec_entity_log_lentity_id; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sec_entity_log_lentity_id ON public.sec_entity_log USING btree (long_entity_id);


--
-- TOC entry 3136 (class 1259 OID 25878)
-- Name: idx_sec_entity_log_sentity_id; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sec_entity_log_sentity_id ON public.sec_entity_log USING btree (string_entity_id);


--
-- TOC entry 3139 (class 1259 OID 25895)
-- Name: idx_sec_filter_component_user; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sec_filter_component_user ON public.sec_filter USING btree (component, user_id);


--
-- TOC entry 3092 (class 1259 OID 25707)
-- Name: idx_sec_group_uniq_name; Type: INDEX; Schema: public; Owner: cuba
--

CREATE UNIQUE INDEX idx_sec_group_uniq_name ON public.sec_group USING btree (name) WHERE ((delete_ts IS NULL) AND (sys_tenant_id IS NULL));


--
-- TOC entry 3093 (class 1259 OID 25708)
-- Name: idx_sec_group_uniq_name_sys_tenant_id_nn; Type: INDEX; Schema: public; Owner: cuba
--

CREATE UNIQUE INDEX idx_sec_group_uniq_name_sys_tenant_id_nn ON public.sec_group USING btree (name, sys_tenant_id) WHERE ((delete_ts IS NULL) AND (sys_tenant_id IS NOT NULL));


--
-- TOC entry 3111 (class 1259 OID 25796)
-- Name: idx_sec_loc_cnstrnt_msg_unique; Type: INDEX; Schema: public; Owner: cuba
--

CREATE UNIQUE INDEX idx_sec_loc_cnstrnt_msg_unique ON public.sec_localized_constraint_msg USING btree (entity_name, operation_type) WHERE (delete_ts IS NULL);


--
-- TOC entry 3128 (class 1259 OID 25863)
-- Name: idx_sec_logged_attr_entity; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sec_logged_attr_entity ON public.sec_logged_attr USING btree (entity_id);


--
-- TOC entry 3105 (class 1259 OID 25768)
-- Name: idx_sec_permission_unique; Type: INDEX; Schema: public; Owner: cuba
--

CREATE UNIQUE INDEX idx_sec_permission_unique ON public.sec_permission USING btree (role_id, permission_type, target) WHERE (delete_ts IS NULL);


--
-- TOC entry 3146 (class 1259 OID 25936)
-- Name: idx_sec_presentation_component_user; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sec_presentation_component_user ON public.sec_presentation USING btree (component, user_id);


--
-- TOC entry 3199 (class 1259 OID 26131)
-- Name: idx_sec_remember_me_token; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sec_remember_me_token ON public.sec_remember_me USING btree (token);


--
-- TOC entry 3200 (class 1259 OID 26130)
-- Name: idx_sec_remember_me_user; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sec_remember_me_user ON public.sec_remember_me USING btree (user_id);


--
-- TOC entry 3088 (class 1259 OID 25691)
-- Name: idx_sec_role_uniq_name; Type: INDEX; Schema: public; Owner: cuba
--

CREATE UNIQUE INDEX idx_sec_role_uniq_name ON public.sec_role USING btree (name) WHERE ((delete_ts IS NULL) AND (sys_tenant_id IS NULL));


--
-- TOC entry 3089 (class 1259 OID 25692)
-- Name: idx_sec_role_uniq_name_sys_tenant_id_nn; Type: INDEX; Schema: public; Owner: cuba
--

CREATE UNIQUE INDEX idx_sec_role_uniq_name_sys_tenant_id_nn ON public.sec_role USING btree (name, sys_tenant_id) WHERE ((delete_ts IS NULL) AND (sys_tenant_id IS NOT NULL));


--
-- TOC entry 3155 (class 1259 OID 25989)
-- Name: idx_sec_screen_hist_sub_user; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sec_screen_hist_sub_user ON public.sec_screen_history USING btree (substituted_user_id);


--
-- TOC entry 3156 (class 1259 OID 25990)
-- Name: idx_sec_screen_history_entity_id; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sec_screen_history_entity_id ON public.sec_screen_history USING btree (entity_id);


--
-- TOC entry 3157 (class 1259 OID 25992)
-- Name: idx_sec_screen_history_ientity_id; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sec_screen_history_ientity_id ON public.sec_screen_history USING btree (int_entity_id);


--
-- TOC entry 3158 (class 1259 OID 25993)
-- Name: idx_sec_screen_history_lentity_id; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sec_screen_history_lentity_id ON public.sec_screen_history USING btree (long_entity_id);


--
-- TOC entry 3159 (class 1259 OID 25991)
-- Name: idx_sec_screen_history_sentity_id; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sec_screen_history_sentity_id ON public.sec_screen_history USING btree (string_entity_id);


--
-- TOC entry 3160 (class 1259 OID 25988)
-- Name: idx_sec_screen_history_user; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sec_screen_history_user ON public.sec_screen_history USING btree (user_id);


--
-- TOC entry 3149 (class 1259 OID 25960)
-- Name: idx_sec_search_folder_user; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sec_search_folder_user ON public.sec_search_folder USING btree (user_id);


--
-- TOC entry 3114 (class 1259 OID 25811)
-- Name: idx_sec_session_attr_group; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sec_session_attr_group ON public.sec_session_attr USING btree (group_id);


--
-- TOC entry 3203 (class 1259 OID 26153)
-- Name: idx_sec_session_log_session; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sec_session_log_session ON public.sec_session_log USING btree (session_id);


--
-- TOC entry 3204 (class 1259 OID 26152)
-- Name: idx_sec_session_log_subuser; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sec_session_log_subuser ON public.sec_session_log USING btree (substituted_user_id);


--
-- TOC entry 3205 (class 1259 OID 26146)
-- Name: idx_sec_session_log_user; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sec_session_log_user ON public.sec_session_log USING btree (user_id);


--
-- TOC entry 3102 (class 1259 OID 25756)
-- Name: idx_sec_user_role_uniq_role; Type: INDEX; Schema: public; Owner: cuba
--

CREATE UNIQUE INDEX idx_sec_user_role_uniq_role ON public.sec_user_role USING btree (user_id, role_id) WHERE (delete_ts IS NULL);


--
-- TOC entry 3121 (class 1259 OID 25843)
-- Name: idx_sec_user_substitution_user; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sec_user_substitution_user ON public.sec_user_substitution USING btree (user_id);


--
-- TOC entry 3098 (class 1259 OID 25738)
-- Name: idx_sec_user_uniq_login; Type: INDEX; Schema: public; Owner: cuba
--

CREATE UNIQUE INDEX idx_sec_user_uniq_login ON public.sec_user USING btree (login_lc) WHERE ((delete_ts IS NULL) AND (sys_tenant_id IS NULL));


--
-- TOC entry 3099 (class 1259 OID 25739)
-- Name: idx_sec_user_uniq_login_sys_tenant_id_nn; Type: INDEX; Schema: public; Owner: cuba
--

CREATE UNIQUE INDEX idx_sec_user_uniq_login_sys_tenant_id_nn ON public.sec_user USING btree (login_lc, sys_tenant_id) WHERE ((delete_ts IS NULL) AND (sys_tenant_id IS NOT NULL));


--
-- TOC entry 3206 (class 1259 OID 26154)
-- Name: idx_session_log_started_ts; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_session_log_started_ts ON public.sec_session_log USING btree (started_ts DESC);


--
-- TOC entry 3184 (class 1259 OID 26093)
-- Name: idx_sys_attr_value_entity; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sys_attr_value_entity ON public.sys_attr_value USING btree (entity_id);


--
-- TOC entry 3185 (class 1259 OID 26095)
-- Name: idx_sys_attr_value_ientity; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sys_attr_value_ientity ON public.sys_attr_value USING btree (int_entity_id);


--
-- TOC entry 3186 (class 1259 OID 26096)
-- Name: idx_sys_attr_value_lentity; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sys_attr_value_lentity ON public.sys_attr_value USING btree (long_entity_id);


--
-- TOC entry 3187 (class 1259 OID 26094)
-- Name: idx_sys_attr_value_sentity; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sys_attr_value_sentity ON public.sys_attr_value USING btree (string_entity_id);


--
-- TOC entry 3181 (class 1259 OID 26072)
-- Name: idx_sys_category_attr_category; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sys_category_attr_category ON public.sys_category_attr USING btree (category_id);


--
-- TOC entry 3177 (class 1259 OID 26057)
-- Name: idx_sys_category_uniq_name_entity_type; Type: INDEX; Schema: public; Owner: cuba
--

CREATE UNIQUE INDEX idx_sys_category_uniq_name_entity_type ON public.sys_category USING btree (name, entity_type) WHERE (delete_ts IS NULL);


--
-- TOC entry 3072 (class 1259 OID 25636)
-- Name: idx_sys_config_uniq_name; Type: INDEX; Schema: public; Owner: cuba
--

CREATE UNIQUE INDEX idx_sys_config_uniq_name ON public.sys_config USING btree (name);


--
-- TOC entry 3171 (class 1259 OID 26044)
-- Name: idx_sys_entity_snapshot_entity_id; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sys_entity_snapshot_entity_id ON public.sys_entity_snapshot USING btree (entity_id);


--
-- TOC entry 3172 (class 1259 OID 26046)
-- Name: idx_sys_entity_snapshot_ientity_id; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sys_entity_snapshot_ientity_id ON public.sys_entity_snapshot USING btree (int_entity_id);


--
-- TOC entry 3173 (class 1259 OID 26047)
-- Name: idx_sys_entity_snapshot_lentity_id; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sys_entity_snapshot_lentity_id ON public.sys_entity_snapshot USING btree (long_entity_id);


--
-- TOC entry 3174 (class 1259 OID 26045)
-- Name: idx_sys_entity_snapshot_sentity_id; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sys_entity_snapshot_sentity_id ON public.sys_entity_snapshot USING btree (string_entity_id);


--
-- TOC entry 3079 (class 1259 OID 25656)
-- Name: idx_sys_entity_statistics_uniq_name; Type: INDEX; Schema: public; Owner: cuba
--

CREATE UNIQUE INDEX idx_sys_entity_statistics_uniq_name ON public.sys_entity_statistics USING btree (name);


--
-- TOC entry 3152 (class 1259 OID 25969)
-- Name: idx_sys_fts_queue_idxhost_crts; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sys_fts_queue_idxhost_crts ON public.sys_fts_queue USING btree (indexing_host, create_ts);


--
-- TOC entry 3192 (class 1259 OID 26114)
-- Name: idx_sys_query_result_entity_session_key; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sys_query_result_entity_session_key ON public.sys_query_result USING btree (entity_id, session_id, query_key);


--
-- TOC entry 3193 (class 1259 OID 26116)
-- Name: idx_sys_query_result_ientity_session_key; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sys_query_result_ientity_session_key ON public.sys_query_result USING btree (int_entity_id, session_id, query_key);


--
-- TOC entry 3194 (class 1259 OID 26117)
-- Name: idx_sys_query_result_lentity_session_key; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sys_query_result_lentity_session_key ON public.sys_query_result USING btree (long_entity_id, session_id, query_key);


--
-- TOC entry 3195 (class 1259 OID 26115)
-- Name: idx_sys_query_result_sentity_session_key; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sys_query_result_sentity_session_key ON public.sys_query_result USING btree (string_entity_id, session_id, query_key);


--
-- TOC entry 3196 (class 1259 OID 26118)
-- Name: idx_sys_query_result_session_key; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sys_query_result_session_key ON public.sys_query_result USING btree (session_id, query_key);


--
-- TOC entry 3084 (class 1259 OID 25681)
-- Name: idx_sys_scheduled_execution_task_finish_time; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sys_scheduled_execution_task_finish_time ON public.sys_scheduled_execution USING btree (task_id, finish_time);


--
-- TOC entry 3085 (class 1259 OID 25680)
-- Name: idx_sys_scheduled_execution_task_start_time; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sys_scheduled_execution_task_start_time ON public.sys_scheduled_execution USING btree (task_id, start_time);


--
-- TOC entry 3163 (class 1259 OID 26009)
-- Name: idx_sys_sending_message_date_sent; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sys_sending_message_date_sent ON public.sys_sending_message USING btree (date_sent);


--
-- TOC entry 3164 (class 1259 OID 26008)
-- Name: idx_sys_sending_message_status; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sys_sending_message_status ON public.sys_sending_message USING btree (status);


--
-- TOC entry 3165 (class 1259 OID 26010)
-- Name: idx_sys_sending_message_update_ts; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sys_sending_message_update_ts ON public.sys_sending_message USING btree (update_ts);


--
-- TOC entry 3069 (class 1259 OID 25626)
-- Name: idx_sys_server_uniq_name; Type: INDEX; Schema: public; Owner: cuba
--

CREATE UNIQUE INDEX idx_sys_server_uniq_name ON public.sys_server USING btree (name);


--
-- TOC entry 3168 (class 1259 OID 26030)
-- Name: sys_sending_attachment_message_idx; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX sys_sending_attachment_message_idx ON public.sys_sending_attachment USING btree (message_id);


--
-- TOC entry 3292 (class 2606 OID 26225)
-- Name: ratlab_employee_research_link fk_empres_on_employee; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.ratlab_employee_research_link
    ADD CONSTRAINT fk_empres_on_employee FOREIGN KEY (employee_id) REFERENCES public.ratlab_employee(id);


--
-- TOC entry 3293 (class 2606 OID 26230)
-- Name: ratlab_employee_research_link fk_empres_on_research; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.ratlab_employee_research_link
    ADD CONSTRAINT fk_empres_on_research FOREIGN KEY (research_id) REFERENCES public.ratlab_research(id);


--
-- TOC entry 3289 (class 2606 OID 26206)
-- Name: ratlab_certificate fk_ratlab_certificate_on_owner; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.ratlab_certificate
    ADD CONSTRAINT fk_ratlab_certificate_on_owner FOREIGN KEY (owner_id) REFERENCES public.ratlab_employee(id);


--
-- TOC entry 3290 (class 2606 OID 26213)
-- Name: ratlab_employee fk_ratlab_employee_on_laboratory; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.ratlab_employee
    ADD CONSTRAINT fk_ratlab_employee_on_laboratory FOREIGN KEY (laboratory_id) REFERENCES public.ratlab_laboratory(id);


--
-- TOC entry 3291 (class 2606 OID 26218)
-- Name: ratlab_employee fk_ratlab_employee_on_supervisor; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.ratlab_employee
    ADD CONSTRAINT fk_ratlab_employee_on_supervisor FOREIGN KEY (supervisor_id) REFERENCES public.ratlab_employee(id);


--
-- TOC entry 3300 (class 2606 OID 26977)
-- Name: ratlab_research_requirement fk_ratlab_research_requirement_on_research; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.ratlab_research_requirement
    ADD CONSTRAINT fk_ratlab_research_requirement_on_research FOREIGN KEY (research_id) REFERENCES public.ratlab_research(id);


--
-- TOC entry 3301 (class 2606 OID 27006)
-- Name: ratlab_resource_requirement fk_ratlab_resource_requirement_on_research; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.ratlab_resource_requirement
    ADD CONSTRAINT fk_ratlab_resource_requirement_on_research FOREIGN KEY (research_id) REFERENCES public.ratlab_research(id);


--
-- TOC entry 3302 (class 2606 OID 27011)
-- Name: ratlab_resource_requirement fk_ratlab_resource_requirement_on_resource; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.ratlab_resource_requirement
    ADD CONSTRAINT fk_ratlab_resource_requirement_on_resource FOREIGN KEY (resource_id) REFERENCES public.ratlab_misc_resource(id);


--
-- TOC entry 3303 (class 2606 OID 27018)
-- Name: ratlab_subject_requirement fk_ratlab_subject_requirement_on_research; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.ratlab_subject_requirement
    ADD CONSTRAINT fk_ratlab_subject_requirement_on_research FOREIGN KEY (research_id) REFERENCES public.ratlab_research(id);


--
-- TOC entry 3304 (class 2606 OID 27023)
-- Name: ratlab_subject_requirement fk_ratlab_subject_requirement_on_subject; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.ratlab_subject_requirement
    ADD CONSTRAINT fk_ratlab_subject_requirement_on_subject FOREIGN KEY (subject_id) REFERENCES public.ratlab_rat(id);


--
-- TOC entry 3299 (class 2606 OID 26939)
-- Name: report_execution fk_report_execution_to_document; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.report_execution
    ADD CONSTRAINT fk_report_execution_to_document FOREIGN KEY (output_document_id) REFERENCES public.sys_file(id);


--
-- TOC entry 3297 (class 2606 OID 26929)
-- Name: report_execution fk_report_execution_to_report; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.report_execution
    ADD CONSTRAINT fk_report_execution_to_report FOREIGN KEY (report_id) REFERENCES public.report_report(id) ON DELETE SET NULL;


--
-- TOC entry 3298 (class 2606 OID 26934)
-- Name: report_execution fk_report_execution_to_user; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.report_execution
    ADD CONSTRAINT fk_report_execution_to_user FOREIGN KEY (user_id) REFERENCES public.sec_user(id);


--
-- TOC entry 3295 (class 2606 OID 26946)
-- Name: report_report fk_report_report_to_def_template; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.report_report
    ADD CONSTRAINT fk_report_report_to_def_template FOREIGN KEY (default_template_id) REFERENCES public.report_template(id);


--
-- TOC entry 3294 (class 2606 OID 26892)
-- Name: report_report fk_report_report_to_report_group; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.report_report
    ADD CONSTRAINT fk_report_report_to_report_group FOREIGN KEY (group_id) REFERENCES public.report_group(id);


--
-- TOC entry 3296 (class 2606 OID 26914)
-- Name: report_template fk_report_template_to_report; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.report_template
    ADD CONSTRAINT fk_report_template_to_report FOREIGN KEY (report_id) REFERENCES public.report_report(id) ON DELETE CASCADE;


--
-- TOC entry 3269 (class 2606 OID 25872)
-- Name: sec_entity_log fk_sec_entity_log_user; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_entity_log
    ADD CONSTRAINT fk_sec_entity_log_user FOREIGN KEY (user_id) REFERENCES public.sec_user(id);


--
-- TOC entry 3270 (class 2606 OID 25890)
-- Name: sec_filter fk_sec_filter_user; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_filter
    ADD CONSTRAINT fk_sec_filter_user FOREIGN KEY (user_id) REFERENCES public.sec_user(id);


--
-- TOC entry 3278 (class 2606 OID 25983)
-- Name: sec_screen_history fk_sec_history_substituted_user; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_screen_history
    ADD CONSTRAINT fk_sec_history_substituted_user FOREIGN KEY (substituted_user_id) REFERENCES public.sec_user(id);


--
-- TOC entry 3277 (class 2606 OID 25978)
-- Name: sec_screen_history fk_sec_history_user; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_screen_history
    ADD CONSTRAINT fk_sec_history_user FOREIGN KEY (user_id) REFERENCES public.sec_user(id);


--
-- TOC entry 3268 (class 2606 OID 25858)
-- Name: sec_logged_attr fk_sec_logged_attr_entity; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_logged_attr
    ADD CONSTRAINT fk_sec_logged_attr_entity FOREIGN KEY (entity_id) REFERENCES public.sec_logged_entity(id);


--
-- TOC entry 3286 (class 2606 OID 26125)
-- Name: sec_remember_me fk_sec_remember_me_user; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_remember_me
    ADD CONSTRAINT fk_sec_remember_me_user FOREIGN KEY (user_id) REFERENCES public.sec_user(id);


--
-- TOC entry 3274 (class 2606 OID 25945)
-- Name: sec_search_folder fk_sec_search_folder_folder; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_search_folder
    ADD CONSTRAINT fk_sec_search_folder_folder FOREIGN KEY (folder_id) REFERENCES public.sys_folder(id);


--
-- TOC entry 3276 (class 2606 OID 25955)
-- Name: sec_search_folder fk_sec_search_folder_presentation; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_search_folder
    ADD CONSTRAINT fk_sec_search_folder_presentation FOREIGN KEY (presentation_id) REFERENCES public.sec_presentation(id) ON DELETE SET NULL;


--
-- TOC entry 3275 (class 2606 OID 25950)
-- Name: sec_search_folder fk_sec_search_folder_user; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_search_folder
    ADD CONSTRAINT fk_sec_search_folder_user FOREIGN KEY (user_id) REFERENCES public.sec_user(id);


--
-- TOC entry 3288 (class 2606 OID 26147)
-- Name: sec_session_log fk_sec_session_log_subuser; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_session_log
    ADD CONSTRAINT fk_sec_session_log_subuser FOREIGN KEY (substituted_user_id) REFERENCES public.sec_user(id);


--
-- TOC entry 3287 (class 2606 OID 26141)
-- Name: sec_session_log fk_sec_session_log_user; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_session_log
    ADD CONSTRAINT fk_sec_session_log_user FOREIGN KEY (user_id) REFERENCES public.sec_user(id);


--
-- TOC entry 3267 (class 2606 OID 25838)
-- Name: sec_user_substitution fk_sec_user_substitution_substituted_user; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_user_substitution
    ADD CONSTRAINT fk_sec_user_substitution_substituted_user FOREIGN KEY (substituted_user_id) REFERENCES public.sec_user(id);


--
-- TOC entry 3266 (class 2606 OID 25833)
-- Name: sec_user_substitution fk_sec_user_substitution_user; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_user_substitution
    ADD CONSTRAINT fk_sec_user_substitution_user FOREIGN KEY (user_id) REFERENCES public.sec_user(id);


--
-- TOC entry 3272 (class 2606 OID 25918)
-- Name: sys_app_folder fk_sys_app_folder_folder; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sys_app_folder
    ADD CONSTRAINT fk_sys_app_folder_folder FOREIGN KEY (folder_id) REFERENCES public.sys_folder(id);


--
-- TOC entry 3282 (class 2606 OID 26039)
-- Name: sys_entity_snapshot fk_sys_entity_snapshot_author_id; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sys_entity_snapshot
    ADD CONSTRAINT fk_sys_entity_snapshot_author_id FOREIGN KEY (author_id) REFERENCES public.sec_user(id);


--
-- TOC entry 3271 (class 2606 OID 25905)
-- Name: sys_folder fk_sys_folder_parent; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sys_folder
    ADD CONSTRAINT fk_sys_folder_parent FOREIGN KEY (parent_id) REFERENCES public.sys_folder(id);


--
-- TOC entry 3281 (class 2606 OID 26025)
-- Name: sys_sending_attachment fk_sys_sending_attachment_content_file; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sys_sending_attachment
    ADD CONSTRAINT fk_sys_sending_attachment_content_file FOREIGN KEY (content_file_id) REFERENCES public.sys_file(id);


--
-- TOC entry 3280 (class 2606 OID 26020)
-- Name: sys_sending_attachment fk_sys_sending_attachment_sending_message; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sys_sending_attachment
    ADD CONSTRAINT fk_sys_sending_attachment_sending_message FOREIGN KEY (message_id) REFERENCES public.sys_sending_message(id);


--
-- TOC entry 3279 (class 2606 OID 26003)
-- Name: sys_sending_message fk_sys_sending_message_content_file; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sys_sending_message
    ADD CONSTRAINT fk_sys_sending_message_content_file FOREIGN KEY (content_text_file_id) REFERENCES public.sys_file(id);


--
-- TOC entry 3263 (class 2606 OID 25781)
-- Name: sec_constraint sec_constraint_group; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_constraint
    ADD CONSTRAINT sec_constraint_group FOREIGN KEY (group_id) REFERENCES public.sec_group(id);


--
-- TOC entry 3257 (class 2606 OID 25714)
-- Name: sec_group_hierarchy sec_group_hierarchy_group; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_group_hierarchy
    ADD CONSTRAINT sec_group_hierarchy_group FOREIGN KEY (group_id) REFERENCES public.sec_group(id);


--
-- TOC entry 3258 (class 2606 OID 25719)
-- Name: sec_group_hierarchy sec_group_hierarchy_parent; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_group_hierarchy
    ADD CONSTRAINT sec_group_hierarchy_parent FOREIGN KEY (parent_id) REFERENCES public.sec_group(id);


--
-- TOC entry 3256 (class 2606 OID 25702)
-- Name: sec_group sec_group_parent; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_group
    ADD CONSTRAINT sec_group_parent FOREIGN KEY (parent_id) REFERENCES public.sec_group(id);


--
-- TOC entry 3262 (class 2606 OID 25763)
-- Name: sec_permission sec_permission_role; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_permission
    ADD CONSTRAINT sec_permission_role FOREIGN KEY (role_id) REFERENCES public.sec_role(id);


--
-- TOC entry 3273 (class 2606 OID 25931)
-- Name: sec_presentation sec_presentation_user; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_presentation
    ADD CONSTRAINT sec_presentation_user FOREIGN KEY (user_id) REFERENCES public.sec_user(id);


--
-- TOC entry 3264 (class 2606 OID 25806)
-- Name: sec_session_attr sec_session_attr_group; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_session_attr
    ADD CONSTRAINT sec_session_attr_group FOREIGN KEY (group_id) REFERENCES public.sec_group(id);


--
-- TOC entry 3259 (class 2606 OID 25733)
-- Name: sec_user sec_user_group; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_user
    ADD CONSTRAINT sec_user_group FOREIGN KEY (group_id) REFERENCES public.sec_group(id);


--
-- TOC entry 3260 (class 2606 OID 25746)
-- Name: sec_user_role sec_user_role_profile; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_user_role
    ADD CONSTRAINT sec_user_role_profile FOREIGN KEY (user_id) REFERENCES public.sec_user(id);


--
-- TOC entry 3261 (class 2606 OID 25751)
-- Name: sec_user_role sec_user_role_role; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_user_role
    ADD CONSTRAINT sec_user_role_role FOREIGN KEY (role_id) REFERENCES public.sec_role(id);


--
-- TOC entry 3265 (class 2606 OID 25822)
-- Name: sec_user_setting sec_user_setting_user; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_user_setting
    ADD CONSTRAINT sec_user_setting_user FOREIGN KEY (user_id) REFERENCES public.sec_user(id);


--
-- TOC entry 3285 (class 2606 OID 26088)
-- Name: sys_attr_value sys_attr_value_attr_value_parent_id; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sys_attr_value
    ADD CONSTRAINT sys_attr_value_attr_value_parent_id FOREIGN KEY (parent_id) REFERENCES public.sys_attr_value(id);


--
-- TOC entry 3284 (class 2606 OID 26083)
-- Name: sys_attr_value sys_attr_value_category_attr_id; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sys_attr_value
    ADD CONSTRAINT sys_attr_value_category_attr_id FOREIGN KEY (category_attr_id) REFERENCES public.sys_category_attr(id);


--
-- TOC entry 3283 (class 2606 OID 26067)
-- Name: sys_category_attr sys_category_attr_category_id; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sys_category_attr
    ADD CONSTRAINT sys_category_attr_category_id FOREIGN KEY (category_id) REFERENCES public.sys_category(id);


--
-- TOC entry 3255 (class 2606 OID 25675)
-- Name: sys_scheduled_execution sys_scheduled_execution_task; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sys_scheduled_execution
    ADD CONSTRAINT sys_scheduled_execution_task FOREIGN KEY (task_id) REFERENCES public.sys_scheduled_task(id);


-- Completed on 2021-03-19 22:53:11 +04

--
-- PostgreSQL database dump complete
--

