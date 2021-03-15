--
-- PostgreSQL database dump
--

-- Dumped from database version 12.5 (Debian 12.5-1.pgdg100+1)
-- Dumped by pg_dump version 13.0

-- Started on 2021-03-15 16:21:43 +04

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
01ddd34d-71ec-d343-2ee3-27c8a2c2c2f2	99	2021-03-02 18:04:21.049	admin	2021-03-15 16:18:57.138	admin	\N	\N	Tape	11954.00	consumable	t
366565fa-8a19-557e-12b6-d1fcf0129def	99	2021-03-02 18:03:35.948	admin	2021-03-15 16:18:57.138	admin	\N	\N	R2	76.00	chemical	t
6bc3d139-c6f4-328e-3487-7437199a4b56	99	2021-03-02 18:03:27.29	admin	2021-03-15 16:18:57.138	admin	\N	\N	R1	103.00	chemical	t
a615a714-4309-4190-edd1-2d14f357538d	4	2021-03-02 18:05:20.748	admin	2021-03-05 18:46:08.338	admin	\N	\N	Large container	11.00	container	f
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
\.


--
-- TOC entry 3459 (class 0 OID 25970)
-- Dependencies: 230
-- Data for Name: sec_screen_history; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sec_screen_history (id, create_ts, created_by, sys_tenant_id, user_id, caption, url, entity_id, string_entity_id, int_entity_id, long_entity_id, substituted_user_id) FROM stdin;
78910d4d-d8b5-ccbf-ef22-14993c00e615	2021-03-05 11:59:05.657	admin	\N	60885987-1b61-4247-94c7-dff348347f93	New User	http://localhost:8080/app/open?screen=sec$User.edit&item=sec$User-67f5b06c-5259-6a89-b0bc-16c09e8b1dc3&params=item:sec$User-67f5b06c-5259-6a89-b0bc-16c09e8b1dc3	67f5b06c-5259-6a89-b0bc-16c09e8b1dc3	\N	\N	\N	\N
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
60885987-1b61-4247-94c7-dff348347f93	2021-03-02 16:39:03.411659	\N	1	2021-03-04 13:43:18.94	admin	\N	\N	\N	admin	admin	$2a$10$vQx8b8B7jzZ0rQmtuK4YDOKp7nkmUCFjPx6DMT.voPtetNHFOsaOu	bcrypt	Administrator	\N	\N	\N	\N	\N	\N	\N	f	t	0fa2b1a5-1d68-4d69-9fbd-dff348347f93	\N	\N	\N
67f5b06c-5259-6a89-b0bc-16c09e8b1dc3	2021-03-05 11:59:05.607	admin	1	2021-03-05 11:59:05.607	\N	\N	\N	\N	resource-scheduler	resource-scheduler	$2a$10$QiO21JiD/xKWgEa.Dt2IXOb8n2NUK7ztYf.D0sipQ5Jhy0Ov81VSO	bcrypt	\N	\N	\N	\N	\N	\N	en	\N	\N	t	0fa2b1a5-1d68-4d69-9fbd-dff348347f93	\N	\N	f
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
\.


--
-- TOC entry 3432 (class 0 OID 25618)
-- Dependencies: 203
-- Data for Name: sys_server; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sys_server (id, create_ts, created_by, update_ts, updated_by, name, is_running, data) FROM stdin;
57c74db2-a994-2073-2440-f431127555af	2021-03-02 16:56:25.517	\N	2021-03-15 16:19:23.789	\N	localhost:8080/app-core	t	\N
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


-- Completed on 2021-03-15 16:21:44 +04

--
-- PostgreSQL database dump complete
--

