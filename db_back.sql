--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

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
-- Name: public; Type: SCHEMA; Schema: -; Owner: netbox
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO netbox;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO netbox;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO netbox;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO netbox;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO netbox;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO netbox;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO netbox;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: netbox
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


ALTER TABLE public.auth_user OWNER TO netbox;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO netbox;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO netbox;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO netbox;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO netbox;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO netbox;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: circuits_circuit; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.circuits_circuit (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    cid character varying(100) NOT NULL,
    status character varying(50) NOT NULL,
    install_date date,
    commit_rate integer,
    description character varying(200) NOT NULL,
    comments text NOT NULL,
    provider_id bigint NOT NULL,
    tenant_id bigint,
    termination_a_id bigint,
    termination_z_id bigint,
    type_id bigint NOT NULL,
    termination_date date,
    CONSTRAINT circuits_circuit_commit_rate_check CHECK ((commit_rate >= 0))
);


ALTER TABLE public.circuits_circuit OWNER TO netbox;

--
-- Name: circuits_circuit_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.circuits_circuit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.circuits_circuit_id_seq OWNER TO netbox;

--
-- Name: circuits_circuit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.circuits_circuit_id_seq OWNED BY public.circuits_circuit.id;


--
-- Name: circuits_circuittermination; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.circuits_circuittermination (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    mark_connected boolean NOT NULL,
    term_side character varying(1) NOT NULL,
    port_speed integer,
    upstream_speed integer,
    xconnect_id character varying(50) NOT NULL,
    pp_info character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    cable_id bigint,
    circuit_id bigint NOT NULL,
    provider_network_id bigint,
    site_id bigint,
    custom_field_data jsonb NOT NULL,
    cable_end character varying(1) NOT NULL,
    CONSTRAINT circuits_circuittermination_port_speed_check CHECK ((port_speed >= 0)),
    CONSTRAINT circuits_circuittermination_upstream_speed_check CHECK ((upstream_speed >= 0))
);


ALTER TABLE public.circuits_circuittermination OWNER TO netbox;

--
-- Name: circuits_circuittermination_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.circuits_circuittermination_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.circuits_circuittermination_id_seq OWNER TO netbox;

--
-- Name: circuits_circuittermination_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.circuits_circuittermination_id_seq OWNED BY public.circuits_circuittermination.id;


--
-- Name: circuits_circuittype; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.circuits_circuittype (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.circuits_circuittype OWNER TO netbox;

--
-- Name: circuits_circuittype_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.circuits_circuittype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.circuits_circuittype_id_seq OWNER TO netbox;

--
-- Name: circuits_circuittype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.circuits_circuittype_id_seq OWNED BY public.circuits_circuittype.id;


--
-- Name: circuits_provider; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.circuits_provider (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    account character varying(30) NOT NULL,
    comments text NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.circuits_provider OWNER TO netbox;

--
-- Name: circuits_provider_asns; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.circuits_provider_asns (
    id bigint NOT NULL,
    provider_id bigint NOT NULL,
    asn_id bigint NOT NULL
);


ALTER TABLE public.circuits_provider_asns OWNER TO netbox;

--
-- Name: circuits_provider_asns_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.circuits_provider_asns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.circuits_provider_asns_id_seq OWNER TO netbox;

--
-- Name: circuits_provider_asns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.circuits_provider_asns_id_seq OWNED BY public.circuits_provider_asns.id;


--
-- Name: circuits_provider_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.circuits_provider_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.circuits_provider_id_seq OWNER TO netbox;

--
-- Name: circuits_provider_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.circuits_provider_id_seq OWNED BY public.circuits_provider.id;


--
-- Name: circuits_providernetwork; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.circuits_providernetwork (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    comments text NOT NULL,
    provider_id bigint NOT NULL,
    service_id character varying(100) NOT NULL
);


ALTER TABLE public.circuits_providernetwork OWNER TO netbox;

--
-- Name: circuits_providernetwork_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.circuits_providernetwork_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.circuits_providernetwork_id_seq OWNER TO netbox;

--
-- Name: circuits_providernetwork_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.circuits_providernetwork_id_seq OWNED BY public.circuits_providernetwork.id;


--
-- Name: dcim_cable; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_cable (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    type character varying(50) NOT NULL,
    status character varying(50) NOT NULL,
    label character varying(100) NOT NULL,
    color character varying(6) NOT NULL,
    length numeric(8,2),
    length_unit character varying(50) NOT NULL,
    _abs_length numeric(10,4),
    tenant_id bigint,
    comments text NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.dcim_cable OWNER TO netbox;

--
-- Name: dcim_cable_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_cable_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_cable_id_seq OWNER TO netbox;

--
-- Name: dcim_cable_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_cable_id_seq OWNED BY public.dcim_cable.id;


--
-- Name: dcim_cablepath; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_cablepath (
    id bigint NOT NULL,
    _nodes character varying(40)[] NOT NULL,
    is_active boolean NOT NULL,
    is_split boolean NOT NULL,
    path jsonb NOT NULL,
    is_complete boolean NOT NULL
);


ALTER TABLE public.dcim_cablepath OWNER TO netbox;

--
-- Name: dcim_cablepath_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_cablepath_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_cablepath_id_seq OWNER TO netbox;

--
-- Name: dcim_cablepath_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_cablepath_id_seq OWNED BY public.dcim_cablepath.id;


--
-- Name: dcim_cabletermination; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_cabletermination (
    id bigint NOT NULL,
    cable_end character varying(1) NOT NULL,
    termination_id bigint NOT NULL,
    cable_id bigint NOT NULL,
    termination_type_id integer NOT NULL,
    _device_id bigint,
    _rack_id bigint,
    _location_id bigint,
    _site_id bigint,
    CONSTRAINT dcim_cabletermination_termination_id_check CHECK ((termination_id >= 0))
);


ALTER TABLE public.dcim_cabletermination OWNER TO netbox;

--
-- Name: dcim_cabletermination_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

ALTER TABLE public.dcim_cabletermination ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.dcim_cabletermination_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: dcim_consoleport; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_consoleport (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    mark_connected boolean NOT NULL,
    type character varying(50) NOT NULL,
    speed integer,
    _path_id bigint,
    cable_id bigint,
    device_id bigint NOT NULL,
    module_id bigint,
    cable_end character varying(1) NOT NULL,
    CONSTRAINT dcim_consoleport_speed_check CHECK ((speed >= 0))
);


ALTER TABLE public.dcim_consoleport OWNER TO netbox;

--
-- Name: dcim_consoleport_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_consoleport_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_consoleport_id_seq OWNER TO netbox;

--
-- Name: dcim_consoleport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_consoleport_id_seq OWNED BY public.dcim_consoleport.id;


--
-- Name: dcim_consoleporttemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_consoleporttemplate (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    type character varying(50) NOT NULL,
    device_type_id bigint,
    module_type_id bigint
);


ALTER TABLE public.dcim_consoleporttemplate OWNER TO netbox;

--
-- Name: dcim_consoleporttemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_consoleporttemplate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_consoleporttemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_consoleporttemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_consoleporttemplate_id_seq OWNED BY public.dcim_consoleporttemplate.id;


--
-- Name: dcim_consoleserverport; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_consoleserverport (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    mark_connected boolean NOT NULL,
    type character varying(50) NOT NULL,
    speed integer,
    _path_id bigint,
    cable_id bigint,
    device_id bigint NOT NULL,
    module_id bigint,
    cable_end character varying(1) NOT NULL,
    CONSTRAINT dcim_consoleserverport_speed_check CHECK ((speed >= 0))
);


ALTER TABLE public.dcim_consoleserverport OWNER TO netbox;

--
-- Name: dcim_consoleserverport_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_consoleserverport_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_consoleserverport_id_seq OWNER TO netbox;

--
-- Name: dcim_consoleserverport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_consoleserverport_id_seq OWNED BY public.dcim_consoleserverport.id;


--
-- Name: dcim_consoleserverporttemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_consoleserverporttemplate (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    type character varying(50) NOT NULL,
    device_type_id bigint,
    module_type_id bigint
);


ALTER TABLE public.dcim_consoleserverporttemplate OWNER TO netbox;

--
-- Name: dcim_consoleserverporttemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_consoleserverporttemplate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_consoleserverporttemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_consoleserverporttemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_consoleserverporttemplate_id_seq OWNED BY public.dcim_consoleserverporttemplate.id;


--
-- Name: dcim_device; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_device (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    local_context_data jsonb,
    name character varying(64),
    _name character varying(100),
    serial character varying(50) NOT NULL,
    asset_tag character varying(50),
    "position" numeric(4,1),
    face character varying(50) NOT NULL,
    status character varying(50) NOT NULL,
    vc_position smallint,
    vc_priority smallint,
    comments text NOT NULL,
    cluster_id bigint,
    device_role_id bigint NOT NULL,
    device_type_id bigint NOT NULL,
    location_id bigint,
    platform_id bigint,
    primary_ip4_id bigint,
    primary_ip6_id bigint,
    rack_id bigint,
    site_id bigint NOT NULL,
    tenant_id bigint,
    virtual_chassis_id bigint,
    airflow character varying(50) NOT NULL,
    description character varying(200) NOT NULL,
    CONSTRAINT dcim_device_vc_position_check CHECK ((vc_position >= 0)),
    CONSTRAINT dcim_device_vc_priority_check CHECK ((vc_priority >= 0))
);


ALTER TABLE public.dcim_device OWNER TO netbox;

--
-- Name: dcim_device_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_device_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_device_id_seq OWNER TO netbox;

--
-- Name: dcim_device_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_device_id_seq OWNED BY public.dcim_device.id;


--
-- Name: dcim_devicebay; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_devicebay (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    device_id bigint NOT NULL,
    installed_device_id bigint
);


ALTER TABLE public.dcim_devicebay OWNER TO netbox;

--
-- Name: dcim_devicebay_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_devicebay_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_devicebay_id_seq OWNER TO netbox;

--
-- Name: dcim_devicebay_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_devicebay_id_seq OWNED BY public.dcim_devicebay.id;


--
-- Name: dcim_devicebaytemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_devicebaytemplate (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    device_type_id bigint NOT NULL
);


ALTER TABLE public.dcim_devicebaytemplate OWNER TO netbox;

--
-- Name: dcim_devicebaytemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_devicebaytemplate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_devicebaytemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_devicebaytemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_devicebaytemplate_id_seq OWNED BY public.dcim_devicebaytemplate.id;


--
-- Name: dcim_devicerole; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_devicerole (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    color character varying(6) NOT NULL,
    vm_role boolean NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.dcim_devicerole OWNER TO netbox;

--
-- Name: dcim_devicerole_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_devicerole_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_devicerole_id_seq OWNER TO netbox;

--
-- Name: dcim_devicerole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_devicerole_id_seq OWNED BY public.dcim_devicerole.id;


--
-- Name: dcim_devicetype; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_devicetype (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    model character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    part_number character varying(50) NOT NULL,
    u_height numeric(4,1) NOT NULL,
    is_full_depth boolean NOT NULL,
    subdevice_role character varying(50) NOT NULL,
    front_image character varying(100) NOT NULL,
    rear_image character varying(100) NOT NULL,
    comments text NOT NULL,
    manufacturer_id bigint NOT NULL,
    airflow character varying(50) NOT NULL,
    weight numeric(8,2),
    weight_unit character varying(50) NOT NULL,
    _abs_weight bigint,
    description character varying(200) NOT NULL,
    CONSTRAINT dcim_devicetype__abs_weight_check CHECK ((_abs_weight >= 0))
);


ALTER TABLE public.dcim_devicetype OWNER TO netbox;

--
-- Name: dcim_devicetype_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_devicetype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_devicetype_id_seq OWNER TO netbox;

--
-- Name: dcim_devicetype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_devicetype_id_seq OWNED BY public.dcim_devicetype.id;


--
-- Name: dcim_frontport; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_frontport (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    mark_connected boolean NOT NULL,
    type character varying(50) NOT NULL,
    rear_port_position smallint NOT NULL,
    cable_id bigint,
    device_id bigint NOT NULL,
    rear_port_id bigint NOT NULL,
    color character varying(6) NOT NULL,
    module_id bigint,
    cable_end character varying(1) NOT NULL,
    CONSTRAINT dcim_frontport_rear_port_position_check CHECK ((rear_port_position >= 0))
);


ALTER TABLE public.dcim_frontport OWNER TO netbox;

--
-- Name: dcim_frontport_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_frontport_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_frontport_id_seq OWNER TO netbox;

--
-- Name: dcim_frontport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_frontport_id_seq OWNED BY public.dcim_frontport.id;


--
-- Name: dcim_frontporttemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_frontporttemplate (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    type character varying(50) NOT NULL,
    rear_port_position smallint NOT NULL,
    device_type_id bigint,
    rear_port_id bigint NOT NULL,
    color character varying(6) NOT NULL,
    module_type_id bigint,
    CONSTRAINT dcim_frontporttemplate_rear_port_position_check CHECK ((rear_port_position >= 0))
);


ALTER TABLE public.dcim_frontporttemplate OWNER TO netbox;

--
-- Name: dcim_frontporttemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_frontporttemplate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_frontporttemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_frontporttemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_frontporttemplate_id_seq OWNED BY public.dcim_frontporttemplate.id;


--
-- Name: dcim_interface; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_interface (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    mark_connected boolean NOT NULL,
    enabled boolean NOT NULL,
    mac_address macaddr,
    mtu integer,
    mode character varying(50) NOT NULL,
    _name character varying(100) NOT NULL,
    type character varying(50) NOT NULL,
    mgmt_only boolean NOT NULL,
    _path_id bigint,
    cable_id bigint,
    device_id bigint NOT NULL,
    lag_id bigint,
    parent_id bigint,
    untagged_vlan_id bigint,
    wwn macaddr8,
    bridge_id bigint,
    rf_role character varying(30) NOT NULL,
    rf_channel character varying(50) NOT NULL,
    rf_channel_frequency numeric(7,2),
    rf_channel_width numeric(7,3),
    tx_power smallint,
    wireless_link_id bigint,
    module_id bigint,
    vrf_id bigint,
    duplex character varying(50),
    speed integer,
    poe_mode character varying(50) NOT NULL,
    poe_type character varying(50) NOT NULL,
    cable_end character varying(1) NOT NULL,
    CONSTRAINT dcim_interface_mtu_check CHECK ((mtu >= 0)),
    CONSTRAINT dcim_interface_speed_check CHECK ((speed >= 0)),
    CONSTRAINT dcim_interface_tx_power_check CHECK ((tx_power >= 0))
);


ALTER TABLE public.dcim_interface OWNER TO netbox;

--
-- Name: dcim_interface_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_interface_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_interface_id_seq OWNER TO netbox;

--
-- Name: dcim_interface_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_interface_id_seq OWNED BY public.dcim_interface.id;


--
-- Name: dcim_interface_tagged_vlans; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_interface_tagged_vlans (
    id bigint NOT NULL,
    interface_id bigint NOT NULL,
    vlan_id bigint NOT NULL
);


ALTER TABLE public.dcim_interface_tagged_vlans OWNER TO netbox;

--
-- Name: dcim_interface_tagged_vlans_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_interface_tagged_vlans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_interface_tagged_vlans_id_seq OWNER TO netbox;

--
-- Name: dcim_interface_tagged_vlans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_interface_tagged_vlans_id_seq OWNED BY public.dcim_interface_tagged_vlans.id;


--
-- Name: dcim_interface_vdcs; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_interface_vdcs (
    id bigint NOT NULL,
    interface_id bigint NOT NULL,
    virtualdevicecontext_id bigint NOT NULL
);


ALTER TABLE public.dcim_interface_vdcs OWNER TO netbox;

--
-- Name: dcim_interface_vdcs_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

ALTER TABLE public.dcim_interface_vdcs ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.dcim_interface_vdcs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: dcim_interface_wireless_lans; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_interface_wireless_lans (
    id bigint NOT NULL,
    interface_id bigint NOT NULL,
    wirelesslan_id bigint NOT NULL
);


ALTER TABLE public.dcim_interface_wireless_lans OWNER TO netbox;

--
-- Name: dcim_interface_wireless_lans_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_interface_wireless_lans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_interface_wireless_lans_id_seq OWNER TO netbox;

--
-- Name: dcim_interface_wireless_lans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_interface_wireless_lans_id_seq OWNED BY public.dcim_interface_wireless_lans.id;


--
-- Name: dcim_interfacetemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_interfacetemplate (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    _name character varying(100) NOT NULL,
    type character varying(50) NOT NULL,
    mgmt_only boolean NOT NULL,
    device_type_id bigint,
    module_type_id bigint,
    poe_mode character varying(50) NOT NULL,
    poe_type character varying(50) NOT NULL
);


ALTER TABLE public.dcim_interfacetemplate OWNER TO netbox;

--
-- Name: dcim_interfacetemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_interfacetemplate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_interfacetemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_interfacetemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_interfacetemplate_id_seq OWNED BY public.dcim_interfacetemplate.id;


--
-- Name: dcim_inventoryitem; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_inventoryitem (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    part_id character varying(50) NOT NULL,
    serial character varying(50) NOT NULL,
    asset_tag character varying(50),
    discovered boolean NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    device_id bigint NOT NULL,
    manufacturer_id bigint,
    parent_id bigint,
    role_id bigint,
    component_id bigint,
    component_type_id integer,
    CONSTRAINT dcim_inventoryitem_component_id_check CHECK ((component_id >= 0)),
    CONSTRAINT dcim_inventoryitem_level_check CHECK ((level >= 0)),
    CONSTRAINT dcim_inventoryitem_lft_check CHECK ((lft >= 0)),
    CONSTRAINT dcim_inventoryitem_rght_check CHECK ((rght >= 0)),
    CONSTRAINT dcim_inventoryitem_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.dcim_inventoryitem OWNER TO netbox;

--
-- Name: dcim_inventoryitem_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_inventoryitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_inventoryitem_id_seq OWNER TO netbox;

--
-- Name: dcim_inventoryitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_inventoryitem_id_seq OWNED BY public.dcim_inventoryitem.id;


--
-- Name: dcim_inventoryitemrole; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_inventoryitemrole (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    color character varying(6) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.dcim_inventoryitemrole OWNER TO netbox;

--
-- Name: dcim_inventoryitemrole_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_inventoryitemrole_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_inventoryitemrole_id_seq OWNER TO netbox;

--
-- Name: dcim_inventoryitemrole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_inventoryitemrole_id_seq OWNED BY public.dcim_inventoryitemrole.id;


--
-- Name: dcim_inventoryitemtemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_inventoryitemtemplate (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    component_id bigint,
    part_id character varying(50) NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    component_type_id integer,
    device_type_id bigint NOT NULL,
    manufacturer_id bigint,
    parent_id bigint,
    role_id bigint,
    CONSTRAINT dcim_inventoryitemtemplate_component_id_check CHECK ((component_id >= 0)),
    CONSTRAINT dcim_inventoryitemtemplate_level_check CHECK ((level >= 0)),
    CONSTRAINT dcim_inventoryitemtemplate_lft_check CHECK ((lft >= 0)),
    CONSTRAINT dcim_inventoryitemtemplate_rght_check CHECK ((rght >= 0)),
    CONSTRAINT dcim_inventoryitemtemplate_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.dcim_inventoryitemtemplate OWNER TO netbox;

--
-- Name: dcim_inventoryitemtemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_inventoryitemtemplate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_inventoryitemtemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_inventoryitemtemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_inventoryitemtemplate_id_seq OWNED BY public.dcim_inventoryitemtemplate.id;


--
-- Name: dcim_location; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_location (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    parent_id bigint,
    site_id bigint NOT NULL,
    tenant_id bigint,
    status character varying(50) NOT NULL,
    CONSTRAINT dcim_location_level_check CHECK ((level >= 0)),
    CONSTRAINT dcim_location_lft_check CHECK ((lft >= 0)),
    CONSTRAINT dcim_location_rght_check CHECK ((rght >= 0)),
    CONSTRAINT dcim_location_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.dcim_location OWNER TO netbox;

--
-- Name: dcim_location_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_location_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_location_id_seq OWNER TO netbox;

--
-- Name: dcim_location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_location_id_seq OWNED BY public.dcim_location.id;


--
-- Name: dcim_manufacturer; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_manufacturer (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.dcim_manufacturer OWNER TO netbox;

--
-- Name: dcim_manufacturer_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_manufacturer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_manufacturer_id_seq OWNER TO netbox;

--
-- Name: dcim_manufacturer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_manufacturer_id_seq OWNED BY public.dcim_manufacturer.id;


--
-- Name: dcim_module; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_module (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    local_context_data jsonb,
    serial character varying(50) NOT NULL,
    asset_tag character varying(50),
    comments text NOT NULL,
    device_id bigint NOT NULL,
    module_bay_id bigint NOT NULL,
    module_type_id bigint NOT NULL,
    description character varying(200) NOT NULL,
    status character varying(50) NOT NULL
);


ALTER TABLE public.dcim_module OWNER TO netbox;

--
-- Name: dcim_module_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_module_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_module_id_seq OWNER TO netbox;

--
-- Name: dcim_module_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_module_id_seq OWNED BY public.dcim_module.id;


--
-- Name: dcim_modulebay; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_modulebay (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    "position" character varying(30) NOT NULL,
    description character varying(200) NOT NULL,
    device_id bigint NOT NULL
);


ALTER TABLE public.dcim_modulebay OWNER TO netbox;

--
-- Name: dcim_modulebay_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_modulebay_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_modulebay_id_seq OWNER TO netbox;

--
-- Name: dcim_modulebay_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_modulebay_id_seq OWNED BY public.dcim_modulebay.id;


--
-- Name: dcim_modulebaytemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_modulebaytemplate (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    "position" character varying(30) NOT NULL,
    description character varying(200) NOT NULL,
    device_type_id bigint NOT NULL
);


ALTER TABLE public.dcim_modulebaytemplate OWNER TO netbox;

--
-- Name: dcim_modulebaytemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_modulebaytemplate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_modulebaytemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_modulebaytemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_modulebaytemplate_id_seq OWNED BY public.dcim_modulebaytemplate.id;


--
-- Name: dcim_moduletype; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_moduletype (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    model character varying(100) NOT NULL,
    part_number character varying(50) NOT NULL,
    comments text NOT NULL,
    manufacturer_id bigint NOT NULL,
    weight numeric(8,2),
    weight_unit character varying(50) NOT NULL,
    _abs_weight bigint,
    description character varying(200) NOT NULL,
    CONSTRAINT dcim_moduletype__abs_weight_check CHECK ((_abs_weight >= 0))
);


ALTER TABLE public.dcim_moduletype OWNER TO netbox;

--
-- Name: dcim_moduletype_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_moduletype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_moduletype_id_seq OWNER TO netbox;

--
-- Name: dcim_moduletype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_moduletype_id_seq OWNED BY public.dcim_moduletype.id;


--
-- Name: dcim_platform; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_platform (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    napalm_driver character varying(50) NOT NULL,
    napalm_args jsonb,
    description character varying(200) NOT NULL,
    manufacturer_id bigint
);


ALTER TABLE public.dcim_platform OWNER TO netbox;

--
-- Name: dcim_platform_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_platform_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_platform_id_seq OWNER TO netbox;

--
-- Name: dcim_platform_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_platform_id_seq OWNED BY public.dcim_platform.id;


--
-- Name: dcim_powerfeed; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_powerfeed (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    mark_connected boolean NOT NULL,
    name character varying(100) NOT NULL,
    status character varying(50) NOT NULL,
    type character varying(50) NOT NULL,
    supply character varying(50) NOT NULL,
    phase character varying(50) NOT NULL,
    voltage smallint NOT NULL,
    amperage smallint NOT NULL,
    max_utilization smallint NOT NULL,
    available_power integer NOT NULL,
    comments text NOT NULL,
    _path_id bigint,
    cable_id bigint,
    power_panel_id bigint NOT NULL,
    rack_id bigint,
    cable_end character varying(1) NOT NULL,
    description character varying(200) NOT NULL,
    CONSTRAINT dcim_powerfeed_amperage_check CHECK ((amperage >= 0)),
    CONSTRAINT dcim_powerfeed_available_power_check CHECK ((available_power >= 0)),
    CONSTRAINT dcim_powerfeed_max_utilization_check CHECK ((max_utilization >= 0))
);


ALTER TABLE public.dcim_powerfeed OWNER TO netbox;

--
-- Name: dcim_powerfeed_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_powerfeed_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_powerfeed_id_seq OWNER TO netbox;

--
-- Name: dcim_powerfeed_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_powerfeed_id_seq OWNED BY public.dcim_powerfeed.id;


--
-- Name: dcim_poweroutlet; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_poweroutlet (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    mark_connected boolean NOT NULL,
    type character varying(50) NOT NULL,
    feed_leg character varying(50) NOT NULL,
    _path_id bigint,
    cable_id bigint,
    device_id bigint NOT NULL,
    power_port_id bigint,
    module_id bigint,
    cable_end character varying(1) NOT NULL
);


ALTER TABLE public.dcim_poweroutlet OWNER TO netbox;

--
-- Name: dcim_poweroutlet_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_poweroutlet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_poweroutlet_id_seq OWNER TO netbox;

--
-- Name: dcim_poweroutlet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_poweroutlet_id_seq OWNED BY public.dcim_poweroutlet.id;


--
-- Name: dcim_poweroutlettemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_poweroutlettemplate (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    type character varying(50) NOT NULL,
    feed_leg character varying(50) NOT NULL,
    device_type_id bigint,
    power_port_id bigint,
    module_type_id bigint
);


ALTER TABLE public.dcim_poweroutlettemplate OWNER TO netbox;

--
-- Name: dcim_poweroutlettemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_poweroutlettemplate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_poweroutlettemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_poweroutlettemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_poweroutlettemplate_id_seq OWNED BY public.dcim_poweroutlettemplate.id;


--
-- Name: dcim_powerpanel; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_powerpanel (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    location_id bigint,
    site_id bigint NOT NULL,
    comments text NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.dcim_powerpanel OWNER TO netbox;

--
-- Name: dcim_powerpanel_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_powerpanel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_powerpanel_id_seq OWNER TO netbox;

--
-- Name: dcim_powerpanel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_powerpanel_id_seq OWNED BY public.dcim_powerpanel.id;


--
-- Name: dcim_powerport; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_powerport (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    mark_connected boolean NOT NULL,
    type character varying(50) NOT NULL,
    maximum_draw smallint,
    allocated_draw smallint,
    _path_id bigint,
    cable_id bigint,
    device_id bigint NOT NULL,
    module_id bigint,
    cable_end character varying(1) NOT NULL,
    CONSTRAINT dcim_powerport_allocated_draw_check CHECK ((allocated_draw >= 0)),
    CONSTRAINT dcim_powerport_maximum_draw_check CHECK ((maximum_draw >= 0))
);


ALTER TABLE public.dcim_powerport OWNER TO netbox;

--
-- Name: dcim_powerport_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_powerport_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_powerport_id_seq OWNER TO netbox;

--
-- Name: dcim_powerport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_powerport_id_seq OWNED BY public.dcim_powerport.id;


--
-- Name: dcim_powerporttemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_powerporttemplate (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    type character varying(50) NOT NULL,
    maximum_draw smallint,
    allocated_draw smallint,
    device_type_id bigint,
    module_type_id bigint,
    CONSTRAINT dcim_powerporttemplate_allocated_draw_check CHECK ((allocated_draw >= 0)),
    CONSTRAINT dcim_powerporttemplate_maximum_draw_check CHECK ((maximum_draw >= 0))
);


ALTER TABLE public.dcim_powerporttemplate OWNER TO netbox;

--
-- Name: dcim_powerporttemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_powerporttemplate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_powerporttemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_powerporttemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_powerporttemplate_id_seq OWNED BY public.dcim_powerporttemplate.id;


--
-- Name: dcim_rack; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_rack (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    _name character varying(100) NOT NULL,
    facility_id character varying(50),
    status character varying(50) NOT NULL,
    serial character varying(50) NOT NULL,
    asset_tag character varying(50),
    type character varying(50) NOT NULL,
    width smallint NOT NULL,
    u_height smallint NOT NULL,
    desc_units boolean NOT NULL,
    outer_width smallint,
    outer_depth smallint,
    outer_unit character varying(50) NOT NULL,
    comments text NOT NULL,
    location_id bigint,
    role_id bigint,
    site_id bigint NOT NULL,
    tenant_id bigint,
    weight numeric(8,2),
    max_weight integer,
    weight_unit character varying(50) NOT NULL,
    _abs_weight bigint,
    _abs_max_weight bigint,
    mounting_depth smallint,
    description character varying(200) NOT NULL,
    CONSTRAINT dcim_rack__abs_max_weight_check CHECK ((_abs_max_weight >= 0)),
    CONSTRAINT dcim_rack__abs_weight_check CHECK ((_abs_weight >= 0)),
    CONSTRAINT dcim_rack_max_weight_check CHECK ((max_weight >= 0)),
    CONSTRAINT dcim_rack_mounting_depth_check CHECK ((mounting_depth >= 0)),
    CONSTRAINT dcim_rack_outer_depth_check CHECK ((outer_depth >= 0)),
    CONSTRAINT dcim_rack_outer_width_check CHECK ((outer_width >= 0)),
    CONSTRAINT dcim_rack_u_height_check CHECK ((u_height >= 0)),
    CONSTRAINT dcim_rack_width_check CHECK ((width >= 0))
);


ALTER TABLE public.dcim_rack OWNER TO netbox;

--
-- Name: dcim_rack_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_rack_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_rack_id_seq OWNER TO netbox;

--
-- Name: dcim_rack_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_rack_id_seq OWNED BY public.dcim_rack.id;


--
-- Name: dcim_rackreservation; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_rackreservation (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    units smallint[] NOT NULL,
    description character varying(200) NOT NULL,
    rack_id bigint NOT NULL,
    tenant_id bigint,
    user_id integer NOT NULL,
    comments text NOT NULL
);


ALTER TABLE public.dcim_rackreservation OWNER TO netbox;

--
-- Name: dcim_rackreservation_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_rackreservation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_rackreservation_id_seq OWNER TO netbox;

--
-- Name: dcim_rackreservation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_rackreservation_id_seq OWNED BY public.dcim_rackreservation.id;


--
-- Name: dcim_rackrole; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_rackrole (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    color character varying(6) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.dcim_rackrole OWNER TO netbox;

--
-- Name: dcim_rackrole_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_rackrole_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_rackrole_id_seq OWNER TO netbox;

--
-- Name: dcim_rackrole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_rackrole_id_seq OWNED BY public.dcim_rackrole.id;


--
-- Name: dcim_rearport; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_rearport (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    mark_connected boolean NOT NULL,
    type character varying(50) NOT NULL,
    positions smallint NOT NULL,
    cable_id bigint,
    device_id bigint NOT NULL,
    color character varying(6) NOT NULL,
    module_id bigint,
    cable_end character varying(1) NOT NULL,
    CONSTRAINT dcim_rearport_positions_check CHECK ((positions >= 0))
);


ALTER TABLE public.dcim_rearport OWNER TO netbox;

--
-- Name: dcim_rearport_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_rearport_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_rearport_id_seq OWNER TO netbox;

--
-- Name: dcim_rearport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_rearport_id_seq OWNED BY public.dcim_rearport.id;


--
-- Name: dcim_rearporttemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_rearporttemplate (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    type character varying(50) NOT NULL,
    positions smallint NOT NULL,
    device_type_id bigint,
    color character varying(6) NOT NULL,
    module_type_id bigint,
    CONSTRAINT dcim_rearporttemplate_positions_check CHECK ((positions >= 0))
);


ALTER TABLE public.dcim_rearporttemplate OWNER TO netbox;

--
-- Name: dcim_rearporttemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_rearporttemplate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_rearporttemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_rearporttemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_rearporttemplate_id_seq OWNED BY public.dcim_rearporttemplate.id;


--
-- Name: dcim_region; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_region (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    parent_id bigint,
    CONSTRAINT dcim_region_level_check CHECK ((level >= 0)),
    CONSTRAINT dcim_region_lft_check CHECK ((lft >= 0)),
    CONSTRAINT dcim_region_rght_check CHECK ((rght >= 0)),
    CONSTRAINT dcim_region_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.dcim_region OWNER TO netbox;

--
-- Name: dcim_region_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_region_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_region_id_seq OWNER TO netbox;

--
-- Name: dcim_region_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_region_id_seq OWNED BY public.dcim_region.id;


--
-- Name: dcim_site; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_site (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    _name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    status character varying(50) NOT NULL,
    facility character varying(50) NOT NULL,
    time_zone character varying(63) NOT NULL,
    description character varying(200) NOT NULL,
    physical_address character varying(200) NOT NULL,
    shipping_address character varying(200) NOT NULL,
    latitude numeric(8,6),
    longitude numeric(9,6),
    comments text NOT NULL,
    group_id bigint,
    region_id bigint,
    tenant_id bigint
);


ALTER TABLE public.dcim_site OWNER TO netbox;

--
-- Name: dcim_site_asns; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_site_asns (
    id bigint NOT NULL,
    site_id bigint NOT NULL,
    asn_id bigint NOT NULL
);


ALTER TABLE public.dcim_site_asns OWNER TO netbox;

--
-- Name: dcim_site_asns_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_site_asns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_site_asns_id_seq OWNER TO netbox;

--
-- Name: dcim_site_asns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_site_asns_id_seq OWNED BY public.dcim_site_asns.id;


--
-- Name: dcim_site_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_site_id_seq OWNER TO netbox;

--
-- Name: dcim_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_site_id_seq OWNED BY public.dcim_site.id;


--
-- Name: dcim_sitegroup; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_sitegroup (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    parent_id bigint,
    CONSTRAINT dcim_sitegroup_level_check CHECK ((level >= 0)),
    CONSTRAINT dcim_sitegroup_lft_check CHECK ((lft >= 0)),
    CONSTRAINT dcim_sitegroup_rght_check CHECK ((rght >= 0)),
    CONSTRAINT dcim_sitegroup_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.dcim_sitegroup OWNER TO netbox;

--
-- Name: dcim_sitegroup_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_sitegroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_sitegroup_id_seq OWNER TO netbox;

--
-- Name: dcim_sitegroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_sitegroup_id_seq OWNED BY public.dcim_sitegroup.id;


--
-- Name: dcim_virtualchassis; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_virtualchassis (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    domain character varying(30) NOT NULL,
    master_id bigint,
    comments text NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.dcim_virtualchassis OWNER TO netbox;

--
-- Name: dcim_virtualchassis_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_virtualchassis_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_virtualchassis_id_seq OWNER TO netbox;

--
-- Name: dcim_virtualchassis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_virtualchassis_id_seq OWNED BY public.dcim_virtualchassis.id;


--
-- Name: dcim_virtualdevicecontext; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_virtualdevicecontext (
    id bigint NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    description character varying(200) NOT NULL,
    name character varying(64) NOT NULL,
    status character varying(50) NOT NULL,
    identifier smallint,
    comments text NOT NULL,
    device_id bigint,
    primary_ip4_id bigint,
    primary_ip6_id bigint,
    tenant_id bigint,
    CONSTRAINT dcim_virtualdevicecontext_identifier_check CHECK ((identifier >= 0))
);


ALTER TABLE public.dcim_virtualdevicecontext OWNER TO netbox;

--
-- Name: dcim_virtualdevicecontext_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

ALTER TABLE public.dcim_virtualdevicecontext ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.dcim_virtualdevicecontext_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: netbox
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


ALTER TABLE public.django_admin_log OWNER TO netbox;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO netbox;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO netbox;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO netbox;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO netbox;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO netbox;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO netbox;

--
-- Name: extras_branch; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_branch (
    id bigint NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    name character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    user_id integer
);


ALTER TABLE public.extras_branch OWNER TO netbox;

--
-- Name: extras_branch_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

ALTER TABLE public.extras_branch ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.extras_branch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: extras_cachedvalue; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_cachedvalue (
    id uuid NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    object_id bigint NOT NULL,
    field character varying(200) NOT NULL,
    type character varying(30) NOT NULL,
    value text NOT NULL,
    weight smallint NOT NULL,
    object_type_id integer NOT NULL,
    CONSTRAINT extras_cachedvalue_object_id_check CHECK ((object_id >= 0)),
    CONSTRAINT extras_cachedvalue_weight_check CHECK ((weight >= 0))
);


ALTER TABLE public.extras_cachedvalue OWNER TO netbox;

--
-- Name: extras_configcontext; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    weight smallint NOT NULL,
    description character varying(200) NOT NULL,
    is_active boolean NOT NULL,
    data jsonb NOT NULL,
    CONSTRAINT extras_configcontext_weight_check CHECK ((weight >= 0))
);


ALTER TABLE public.extras_configcontext OWNER TO netbox;

--
-- Name: extras_configcontext_cluster_groups; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_cluster_groups (
    id bigint NOT NULL,
    configcontext_id bigint NOT NULL,
    clustergroup_id bigint NOT NULL
);


ALTER TABLE public.extras_configcontext_cluster_groups OWNER TO netbox;

--
-- Name: extras_configcontext_cluster_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_cluster_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_cluster_groups_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_cluster_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_cluster_groups_id_seq OWNED BY public.extras_configcontext_cluster_groups.id;


--
-- Name: extras_configcontext_cluster_types; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_cluster_types (
    id bigint NOT NULL,
    configcontext_id bigint NOT NULL,
    clustertype_id bigint NOT NULL
);


ALTER TABLE public.extras_configcontext_cluster_types OWNER TO netbox;

--
-- Name: extras_configcontext_cluster_types_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_cluster_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_cluster_types_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_cluster_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_cluster_types_id_seq OWNED BY public.extras_configcontext_cluster_types.id;


--
-- Name: extras_configcontext_clusters; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_clusters (
    id bigint NOT NULL,
    configcontext_id bigint NOT NULL,
    cluster_id bigint NOT NULL
);


ALTER TABLE public.extras_configcontext_clusters OWNER TO netbox;

--
-- Name: extras_configcontext_clusters_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_clusters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_clusters_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_clusters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_clusters_id_seq OWNED BY public.extras_configcontext_clusters.id;


--
-- Name: extras_configcontext_device_types; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_device_types (
    id bigint NOT NULL,
    configcontext_id bigint NOT NULL,
    devicetype_id bigint NOT NULL
);


ALTER TABLE public.extras_configcontext_device_types OWNER TO netbox;

--
-- Name: extras_configcontext_device_types_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_device_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_device_types_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_device_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_device_types_id_seq OWNED BY public.extras_configcontext_device_types.id;


--
-- Name: extras_configcontext_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_id_seq OWNED BY public.extras_configcontext.id;


--
-- Name: extras_configcontext_locations; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_locations (
    id bigint NOT NULL,
    configcontext_id bigint NOT NULL,
    location_id bigint NOT NULL
);


ALTER TABLE public.extras_configcontext_locations OWNER TO netbox;

--
-- Name: extras_configcontext_locations_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

ALTER TABLE public.extras_configcontext_locations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.extras_configcontext_locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: extras_configcontext_platforms; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_platforms (
    id bigint NOT NULL,
    configcontext_id bigint NOT NULL,
    platform_id bigint NOT NULL
);


ALTER TABLE public.extras_configcontext_platforms OWNER TO netbox;

--
-- Name: extras_configcontext_platforms_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_platforms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_platforms_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_platforms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_platforms_id_seq OWNED BY public.extras_configcontext_platforms.id;


--
-- Name: extras_configcontext_regions; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_regions (
    id bigint NOT NULL,
    configcontext_id bigint NOT NULL,
    region_id bigint NOT NULL
);


ALTER TABLE public.extras_configcontext_regions OWNER TO netbox;

--
-- Name: extras_configcontext_regions_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_regions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_regions_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_regions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_regions_id_seq OWNED BY public.extras_configcontext_regions.id;


--
-- Name: extras_configcontext_roles; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_roles (
    id bigint NOT NULL,
    configcontext_id bigint NOT NULL,
    devicerole_id bigint NOT NULL
);


ALTER TABLE public.extras_configcontext_roles OWNER TO netbox;

--
-- Name: extras_configcontext_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_roles_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_roles_id_seq OWNED BY public.extras_configcontext_roles.id;


--
-- Name: extras_configcontext_site_groups; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_site_groups (
    id bigint NOT NULL,
    configcontext_id bigint NOT NULL,
    sitegroup_id bigint NOT NULL
);


ALTER TABLE public.extras_configcontext_site_groups OWNER TO netbox;

--
-- Name: extras_configcontext_site_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_site_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_site_groups_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_site_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_site_groups_id_seq OWNED BY public.extras_configcontext_site_groups.id;


--
-- Name: extras_configcontext_sites; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_sites (
    id bigint NOT NULL,
    configcontext_id bigint NOT NULL,
    site_id bigint NOT NULL
);


ALTER TABLE public.extras_configcontext_sites OWNER TO netbox;

--
-- Name: extras_configcontext_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_sites_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_sites_id_seq OWNED BY public.extras_configcontext_sites.id;


--
-- Name: extras_configcontext_tags; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_tags (
    id bigint NOT NULL,
    configcontext_id bigint NOT NULL,
    tag_id bigint NOT NULL
);


ALTER TABLE public.extras_configcontext_tags OWNER TO netbox;

--
-- Name: extras_configcontext_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_tags_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_tags_id_seq OWNED BY public.extras_configcontext_tags.id;


--
-- Name: extras_configcontext_tenant_groups; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_tenant_groups (
    id bigint NOT NULL,
    configcontext_id bigint NOT NULL,
    tenantgroup_id bigint NOT NULL
);


ALTER TABLE public.extras_configcontext_tenant_groups OWNER TO netbox;

--
-- Name: extras_configcontext_tenant_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_tenant_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_tenant_groups_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_tenant_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_tenant_groups_id_seq OWNED BY public.extras_configcontext_tenant_groups.id;


--
-- Name: extras_configcontext_tenants; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_tenants (
    id bigint NOT NULL,
    configcontext_id bigint NOT NULL,
    tenant_id bigint NOT NULL
);


ALTER TABLE public.extras_configcontext_tenants OWNER TO netbox;

--
-- Name: extras_configcontext_tenants_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_tenants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_tenants_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_tenants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_tenants_id_seq OWNED BY public.extras_configcontext_tenants.id;


--
-- Name: extras_configrevision; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configrevision (
    id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    comment character varying(200) NOT NULL,
    data jsonb
);


ALTER TABLE public.extras_configrevision OWNER TO netbox;

--
-- Name: extras_configrevision_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configrevision_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configrevision_id_seq OWNER TO netbox;

--
-- Name: extras_configrevision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configrevision_id_seq OWNED BY public.extras_configrevision.id;


--
-- Name: extras_customfield; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_customfield (
    id bigint NOT NULL,
    type character varying(50) NOT NULL,
    name character varying(50) NOT NULL,
    label character varying(50) NOT NULL,
    description character varying(200) NOT NULL,
    required boolean NOT NULL,
    filter_logic character varying(50) NOT NULL,
    "default" jsonb,
    weight smallint NOT NULL,
    validation_minimum integer,
    validation_maximum integer,
    validation_regex character varying(500) NOT NULL,
    choices character varying(100)[],
    created timestamp with time zone,
    last_updated timestamp with time zone,
    object_type_id integer,
    group_name character varying(50) NOT NULL,
    ui_visibility character varying(50) NOT NULL,
    search_weight smallint NOT NULL,
    CONSTRAINT extras_customfield_search_weight_check CHECK ((search_weight >= 0)),
    CONSTRAINT extras_customfield_weight_check CHECK ((weight >= 0))
);


ALTER TABLE public.extras_customfield OWNER TO netbox;

--
-- Name: extras_customfield_content_types; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_customfield_content_types (
    id bigint NOT NULL,
    customfield_id bigint NOT NULL,
    contenttype_id integer NOT NULL
);


ALTER TABLE public.extras_customfield_content_types OWNER TO netbox;

--
-- Name: extras_customfield_content_types_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_customfield_content_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_customfield_content_types_id_seq OWNER TO netbox;

--
-- Name: extras_customfield_content_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_customfield_content_types_id_seq OWNED BY public.extras_customfield_content_types.id;


--
-- Name: extras_customfield_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_customfield_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_customfield_id_seq OWNER TO netbox;

--
-- Name: extras_customfield_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_customfield_id_seq OWNED BY public.extras_customfield.id;


--
-- Name: extras_customlink; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_customlink (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    link_text text NOT NULL,
    link_url text NOT NULL,
    weight smallint NOT NULL,
    group_name character varying(50) NOT NULL,
    button_class character varying(30) NOT NULL,
    new_window boolean NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    enabled boolean NOT NULL,
    CONSTRAINT extras_customlink_weight_check CHECK ((weight >= 0))
);


ALTER TABLE public.extras_customlink OWNER TO netbox;

--
-- Name: extras_customlink_content_types; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_customlink_content_types (
    id bigint NOT NULL,
    customlink_id bigint NOT NULL,
    contenttype_id integer NOT NULL
);


ALTER TABLE public.extras_customlink_content_types OWNER TO netbox;

--
-- Name: extras_customlink_content_types_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

ALTER TABLE public.extras_customlink_content_types ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.extras_customlink_content_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: extras_customlink_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_customlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_customlink_id_seq OWNER TO netbox;

--
-- Name: extras_customlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_customlink_id_seq OWNED BY public.extras_customlink.id;


--
-- Name: extras_exporttemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_exporttemplate (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    template_code text NOT NULL,
    mime_type character varying(50) NOT NULL,
    file_extension character varying(15) NOT NULL,
    as_attachment boolean NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone
);


ALTER TABLE public.extras_exporttemplate OWNER TO netbox;

--
-- Name: extras_exporttemplate_content_types; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_exporttemplate_content_types (
    id bigint NOT NULL,
    exporttemplate_id bigint NOT NULL,
    contenttype_id integer NOT NULL
);


ALTER TABLE public.extras_exporttemplate_content_types OWNER TO netbox;

--
-- Name: extras_exporttemplate_content_types_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

ALTER TABLE public.extras_exporttemplate_content_types ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.extras_exporttemplate_content_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: extras_exporttemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_exporttemplate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_exporttemplate_id_seq OWNER TO netbox;

--
-- Name: extras_exporttemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_exporttemplate_id_seq OWNED BY public.extras_exporttemplate.id;


--
-- Name: extras_imageattachment; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_imageattachment (
    id bigint NOT NULL,
    object_id bigint NOT NULL,
    image character varying(100) NOT NULL,
    image_height smallint NOT NULL,
    image_width smallint NOT NULL,
    name character varying(50) NOT NULL,
    created timestamp with time zone,
    content_type_id integer NOT NULL,
    last_updated timestamp with time zone,
    CONSTRAINT extras_imageattachment_image_height_check CHECK ((image_height >= 0)),
    CONSTRAINT extras_imageattachment_image_width_check CHECK ((image_width >= 0)),
    CONSTRAINT extras_imageattachment_object_id_check CHECK ((object_id >= 0))
);


ALTER TABLE public.extras_imageattachment OWNER TO netbox;

--
-- Name: extras_imageattachment_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_imageattachment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_imageattachment_id_seq OWNER TO netbox;

--
-- Name: extras_imageattachment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_imageattachment_id_seq OWNED BY public.extras_imageattachment.id;


--
-- Name: extras_jobresult; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_jobresult (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    created timestamp with time zone NOT NULL,
    completed timestamp with time zone,
    status character varying(30) NOT NULL,
    data jsonb,
    job_id uuid NOT NULL,
    obj_type_id integer NOT NULL,
    user_id integer,
    scheduled timestamp with time zone,
    "interval" integer,
    started timestamp with time zone,
    CONSTRAINT extras_jobresult_interval_check CHECK (("interval" >= 0))
);


ALTER TABLE public.extras_jobresult OWNER TO netbox;

--
-- Name: extras_jobresult_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_jobresult_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_jobresult_id_seq OWNER TO netbox;

--
-- Name: extras_jobresult_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_jobresult_id_seq OWNED BY public.extras_jobresult.id;


--
-- Name: extras_journalentry; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_journalentry (
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    assigned_object_id bigint NOT NULL,
    created timestamp with time zone,
    kind character varying(30) NOT NULL,
    comments text NOT NULL,
    assigned_object_type_id integer NOT NULL,
    created_by_id integer,
    custom_field_data jsonb NOT NULL,
    CONSTRAINT extras_journalentry_assigned_object_id_check CHECK ((assigned_object_id >= 0))
);


ALTER TABLE public.extras_journalentry OWNER TO netbox;

--
-- Name: extras_journalentry_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_journalentry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_journalentry_id_seq OWNER TO netbox;

--
-- Name: extras_journalentry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_journalentry_id_seq OWNED BY public.extras_journalentry.id;


--
-- Name: extras_objectchange; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_objectchange (
    id bigint NOT NULL,
    "time" timestamp with time zone NOT NULL,
    user_name character varying(150) NOT NULL,
    request_id uuid NOT NULL,
    action character varying(50) NOT NULL,
    changed_object_id bigint NOT NULL,
    related_object_id bigint,
    object_repr character varying(200) NOT NULL,
    prechange_data jsonb,
    postchange_data jsonb,
    changed_object_type_id integer NOT NULL,
    related_object_type_id integer,
    user_id integer,
    CONSTRAINT extras_objectchange_changed_object_id_check CHECK ((changed_object_id >= 0)),
    CONSTRAINT extras_objectchange_related_object_id_check CHECK ((related_object_id >= 0))
);


ALTER TABLE public.extras_objectchange OWNER TO netbox;

--
-- Name: extras_objectchange_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_objectchange_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_objectchange_id_seq OWNER TO netbox;

--
-- Name: extras_objectchange_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_objectchange_id_seq OWNED BY public.extras_objectchange.id;


--
-- Name: extras_savedfilter; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_savedfilter (
    id bigint NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    weight smallint NOT NULL,
    enabled boolean NOT NULL,
    shared boolean NOT NULL,
    parameters jsonb NOT NULL,
    user_id integer,
    CONSTRAINT extras_savedfilter_weight_check CHECK ((weight >= 0))
);


ALTER TABLE public.extras_savedfilter OWNER TO netbox;

--
-- Name: extras_savedfilter_content_types; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_savedfilter_content_types (
    id bigint NOT NULL,
    savedfilter_id bigint NOT NULL,
    contenttype_id integer NOT NULL
);


ALTER TABLE public.extras_savedfilter_content_types OWNER TO netbox;

--
-- Name: extras_savedfilter_content_types_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

ALTER TABLE public.extras_savedfilter_content_types ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.extras_savedfilter_content_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: extras_savedfilter_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

ALTER TABLE public.extras_savedfilter ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.extras_savedfilter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: extras_stagedchange; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_stagedchange (
    id bigint NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    action character varying(20) NOT NULL,
    object_id bigint,
    data jsonb,
    branch_id bigint NOT NULL,
    object_type_id integer NOT NULL,
    CONSTRAINT extras_stagedchange_object_id_check CHECK ((object_id >= 0))
);


ALTER TABLE public.extras_stagedchange OWNER TO netbox;

--
-- Name: extras_stagedchange_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

ALTER TABLE public.extras_stagedchange ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.extras_stagedchange_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: extras_tag; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_tag (
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    color character varying(6) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.extras_tag OWNER TO netbox;

--
-- Name: extras_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_tag_id_seq OWNER TO netbox;

--
-- Name: extras_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_tag_id_seq OWNED BY public.extras_tag.id;


--
-- Name: extras_taggeditem; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_taggeditem (
    object_id integer NOT NULL,
    id bigint NOT NULL,
    content_type_id integer NOT NULL,
    tag_id bigint NOT NULL
);


ALTER TABLE public.extras_taggeditem OWNER TO netbox;

--
-- Name: extras_taggeditem_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_taggeditem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_taggeditem_id_seq OWNER TO netbox;

--
-- Name: extras_taggeditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_taggeditem_id_seq OWNED BY public.extras_taggeditem.id;


--
-- Name: extras_webhook; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_webhook (
    id bigint NOT NULL,
    name character varying(150) NOT NULL,
    type_create boolean NOT NULL,
    type_update boolean NOT NULL,
    type_delete boolean NOT NULL,
    payload_url character varying(500) NOT NULL,
    enabled boolean NOT NULL,
    http_method character varying(30) NOT NULL,
    http_content_type character varying(100) NOT NULL,
    additional_headers text NOT NULL,
    body_template text NOT NULL,
    secret character varying(255) NOT NULL,
    ssl_verification boolean NOT NULL,
    ca_file_path character varying(4096),
    created timestamp with time zone,
    last_updated timestamp with time zone,
    conditions jsonb
);


ALTER TABLE public.extras_webhook OWNER TO netbox;

--
-- Name: extras_webhook_content_types; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_webhook_content_types (
    id bigint NOT NULL,
    webhook_id bigint NOT NULL,
    contenttype_id integer NOT NULL
);


ALTER TABLE public.extras_webhook_content_types OWNER TO netbox;

--
-- Name: extras_webhook_content_types_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_webhook_content_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_webhook_content_types_id_seq OWNER TO netbox;

--
-- Name: extras_webhook_content_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_webhook_content_types_id_seq OWNED BY public.extras_webhook_content_types.id;


--
-- Name: extras_webhook_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_webhook_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_webhook_id_seq OWNER TO netbox;

--
-- Name: extras_webhook_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_webhook_id_seq OWNED BY public.extras_webhook.id;


--
-- Name: ipam_aggregate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_aggregate (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    prefix cidr NOT NULL,
    date_added date,
    description character varying(200) NOT NULL,
    rir_id bigint NOT NULL,
    tenant_id bigint,
    comments text NOT NULL
);


ALTER TABLE public.ipam_aggregate OWNER TO netbox;

--
-- Name: ipam_aggregate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_aggregate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_aggregate_id_seq OWNER TO netbox;

--
-- Name: ipam_aggregate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_aggregate_id_seq OWNED BY public.ipam_aggregate.id;


--
-- Name: ipam_asn; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_asn (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    asn bigint NOT NULL,
    description character varying(200) NOT NULL,
    rir_id bigint NOT NULL,
    tenant_id bigint,
    comments text NOT NULL
);


ALTER TABLE public.ipam_asn OWNER TO netbox;

--
-- Name: ipam_asn_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_asn_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_asn_id_seq OWNER TO netbox;

--
-- Name: ipam_asn_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_asn_id_seq OWNED BY public.ipam_asn.id;


--
-- Name: ipam_fhrpgroup; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_fhrpgroup (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    group_id smallint NOT NULL,
    protocol character varying(50) NOT NULL,
    auth_type character varying(50) NOT NULL,
    auth_key character varying(255) NOT NULL,
    description character varying(200) NOT NULL,
    name character varying(100) NOT NULL,
    comments text NOT NULL,
    CONSTRAINT ipam_fhrpgroup_group_id_check CHECK ((group_id >= 0))
);


ALTER TABLE public.ipam_fhrpgroup OWNER TO netbox;

--
-- Name: ipam_fhrpgroup_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_fhrpgroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_fhrpgroup_id_seq OWNER TO netbox;

--
-- Name: ipam_fhrpgroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_fhrpgroup_id_seq OWNED BY public.ipam_fhrpgroup.id;


--
-- Name: ipam_fhrpgroupassignment; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_fhrpgroupassignment (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    interface_id bigint NOT NULL,
    priority smallint NOT NULL,
    group_id bigint NOT NULL,
    interface_type_id integer NOT NULL,
    CONSTRAINT ipam_fhrpgroupassignment_interface_id_check CHECK ((interface_id >= 0)),
    CONSTRAINT ipam_fhrpgroupassignment_priority_check CHECK ((priority >= 0))
);


ALTER TABLE public.ipam_fhrpgroupassignment OWNER TO netbox;

--
-- Name: ipam_fhrpgroupassignment_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_fhrpgroupassignment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_fhrpgroupassignment_id_seq OWNER TO netbox;

--
-- Name: ipam_fhrpgroupassignment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_fhrpgroupassignment_id_seq OWNED BY public.ipam_fhrpgroupassignment.id;


--
-- Name: ipam_ipaddress; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_ipaddress (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    address inet NOT NULL,
    status character varying(50) NOT NULL,
    role character varying(50) NOT NULL,
    assigned_object_id bigint,
    dns_name character varying(255) NOT NULL,
    description character varying(200) NOT NULL,
    assigned_object_type_id integer,
    nat_inside_id bigint,
    tenant_id bigint,
    vrf_id bigint,
    comments text NOT NULL,
    CONSTRAINT ipam_ipaddress_assigned_object_id_check CHECK ((assigned_object_id >= 0))
);


ALTER TABLE public.ipam_ipaddress OWNER TO netbox;

--
-- Name: ipam_ipaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_ipaddress_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_ipaddress_id_seq OWNER TO netbox;

--
-- Name: ipam_ipaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_ipaddress_id_seq OWNED BY public.ipam_ipaddress.id;


--
-- Name: ipam_iprange; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_iprange (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    start_address inet NOT NULL,
    end_address inet NOT NULL,
    size integer NOT NULL,
    status character varying(50) NOT NULL,
    description character varying(200) NOT NULL,
    role_id bigint,
    tenant_id bigint,
    vrf_id bigint,
    comments text NOT NULL,
    CONSTRAINT ipam_iprange_size_check CHECK ((size >= 0))
);


ALTER TABLE public.ipam_iprange OWNER TO netbox;

--
-- Name: ipam_iprange_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_iprange_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_iprange_id_seq OWNER TO netbox;

--
-- Name: ipam_iprange_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_iprange_id_seq OWNED BY public.ipam_iprange.id;


--
-- Name: ipam_l2vpn; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_l2vpn (
    id bigint NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    type character varying(50) NOT NULL,
    identifier bigint,
    description character varying(200) NOT NULL,
    tenant_id bigint,
    comments text NOT NULL
);


ALTER TABLE public.ipam_l2vpn OWNER TO netbox;

--
-- Name: ipam_l2vpn_export_targets; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_l2vpn_export_targets (
    id bigint NOT NULL,
    l2vpn_id bigint NOT NULL,
    routetarget_id bigint NOT NULL
);


ALTER TABLE public.ipam_l2vpn_export_targets OWNER TO netbox;

--
-- Name: ipam_l2vpn_export_targets_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

ALTER TABLE public.ipam_l2vpn_export_targets ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.ipam_l2vpn_export_targets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: ipam_l2vpn_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

ALTER TABLE public.ipam_l2vpn ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.ipam_l2vpn_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: ipam_l2vpn_import_targets; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_l2vpn_import_targets (
    id bigint NOT NULL,
    l2vpn_id bigint NOT NULL,
    routetarget_id bigint NOT NULL
);


ALTER TABLE public.ipam_l2vpn_import_targets OWNER TO netbox;

--
-- Name: ipam_l2vpn_import_targets_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

ALTER TABLE public.ipam_l2vpn_import_targets ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.ipam_l2vpn_import_targets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: ipam_l2vpntermination; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_l2vpntermination (
    id bigint NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    assigned_object_id bigint NOT NULL,
    assigned_object_type_id integer NOT NULL,
    l2vpn_id bigint NOT NULL,
    CONSTRAINT ipam_l2vpntermination_assigned_object_id_check CHECK ((assigned_object_id >= 0))
);


ALTER TABLE public.ipam_l2vpntermination OWNER TO netbox;

--
-- Name: ipam_l2vpntermination_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

ALTER TABLE public.ipam_l2vpntermination ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.ipam_l2vpntermination_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: ipam_prefix; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_prefix (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    prefix cidr NOT NULL,
    status character varying(50) NOT NULL,
    is_pool boolean NOT NULL,
    description character varying(200) NOT NULL,
    role_id bigint,
    site_id bigint,
    tenant_id bigint,
    vlan_id bigint,
    vrf_id bigint,
    _children bigint NOT NULL,
    _depth smallint NOT NULL,
    mark_utilized boolean NOT NULL,
    comments text NOT NULL,
    CONSTRAINT ipam_prefix__children_check CHECK ((_children >= 0)),
    CONSTRAINT ipam_prefix__depth_check CHECK ((_depth >= 0))
);


ALTER TABLE public.ipam_prefix OWNER TO netbox;

--
-- Name: ipam_prefix_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_prefix_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_prefix_id_seq OWNER TO netbox;

--
-- Name: ipam_prefix_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_prefix_id_seq OWNED BY public.ipam_prefix.id;


--
-- Name: ipam_rir; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_rir (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    is_private boolean NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.ipam_rir OWNER TO netbox;

--
-- Name: ipam_rir_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_rir_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_rir_id_seq OWNER TO netbox;

--
-- Name: ipam_rir_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_rir_id_seq OWNED BY public.ipam_rir.id;


--
-- Name: ipam_role; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_role (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    weight smallint NOT NULL,
    description character varying(200) NOT NULL,
    CONSTRAINT ipam_role_weight_check CHECK ((weight >= 0))
);


ALTER TABLE public.ipam_role OWNER TO netbox;

--
-- Name: ipam_role_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_role_id_seq OWNER TO netbox;

--
-- Name: ipam_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_role_id_seq OWNED BY public.ipam_role.id;


--
-- Name: ipam_routetarget; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_routetarget (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(21) NOT NULL,
    description character varying(200) NOT NULL,
    tenant_id bigint,
    comments text NOT NULL
);


ALTER TABLE public.ipam_routetarget OWNER TO netbox;

--
-- Name: ipam_routetarget_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_routetarget_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_routetarget_id_seq OWNER TO netbox;

--
-- Name: ipam_routetarget_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_routetarget_id_seq OWNED BY public.ipam_routetarget.id;


--
-- Name: ipam_service; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_service (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    protocol character varying(50) NOT NULL,
    ports integer[] NOT NULL,
    description character varying(200) NOT NULL,
    device_id bigint,
    virtual_machine_id bigint,
    comments text NOT NULL
);


ALTER TABLE public.ipam_service OWNER TO netbox;

--
-- Name: ipam_service_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_service_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_service_id_seq OWNER TO netbox;

--
-- Name: ipam_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_service_id_seq OWNED BY public.ipam_service.id;


--
-- Name: ipam_service_ipaddresses; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_service_ipaddresses (
    id bigint NOT NULL,
    service_id bigint NOT NULL,
    ipaddress_id bigint NOT NULL
);


ALTER TABLE public.ipam_service_ipaddresses OWNER TO netbox;

--
-- Name: ipam_service_ipaddresses_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_service_ipaddresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_service_ipaddresses_id_seq OWNER TO netbox;

--
-- Name: ipam_service_ipaddresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_service_ipaddresses_id_seq OWNED BY public.ipam_service_ipaddresses.id;


--
-- Name: ipam_servicetemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_servicetemplate (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    protocol character varying(50) NOT NULL,
    ports integer[] NOT NULL,
    description character varying(200) NOT NULL,
    name character varying(100) NOT NULL,
    comments text NOT NULL
);


ALTER TABLE public.ipam_servicetemplate OWNER TO netbox;

--
-- Name: ipam_servicetemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_servicetemplate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_servicetemplate_id_seq OWNER TO netbox;

--
-- Name: ipam_servicetemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_servicetemplate_id_seq OWNED BY public.ipam_servicetemplate.id;


--
-- Name: ipam_vlan; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_vlan (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    vid smallint NOT NULL,
    name character varying(64) NOT NULL,
    status character varying(50) NOT NULL,
    description character varying(200) NOT NULL,
    group_id bigint,
    role_id bigint,
    site_id bigint,
    tenant_id bigint,
    comments text NOT NULL,
    CONSTRAINT ipam_vlan_vid_check CHECK ((vid >= 0))
);


ALTER TABLE public.ipam_vlan OWNER TO netbox;

--
-- Name: ipam_vlan_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_vlan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_vlan_id_seq OWNER TO netbox;

--
-- Name: ipam_vlan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_vlan_id_seq OWNED BY public.ipam_vlan.id;


--
-- Name: ipam_vlangroup; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_vlangroup (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    scope_id bigint,
    description character varying(200) NOT NULL,
    scope_type_id integer,
    max_vid smallint NOT NULL,
    min_vid smallint NOT NULL,
    CONSTRAINT ipam_vlangroup_max_vid_check CHECK ((max_vid >= 0)),
    CONSTRAINT ipam_vlangroup_min_vid_check CHECK ((min_vid >= 0)),
    CONSTRAINT ipam_vlangroup_scope_id_check CHECK ((scope_id >= 0))
);


ALTER TABLE public.ipam_vlangroup OWNER TO netbox;

--
-- Name: ipam_vlangroup_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_vlangroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_vlangroup_id_seq OWNER TO netbox;

--
-- Name: ipam_vlangroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_vlangroup_id_seq OWNED BY public.ipam_vlangroup.id;


--
-- Name: ipam_vrf; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_vrf (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    rd character varying(21),
    enforce_unique boolean NOT NULL,
    description character varying(200) NOT NULL,
    tenant_id bigint,
    comments text NOT NULL
);


ALTER TABLE public.ipam_vrf OWNER TO netbox;

--
-- Name: ipam_vrf_export_targets; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_vrf_export_targets (
    id bigint NOT NULL,
    vrf_id bigint NOT NULL,
    routetarget_id bigint NOT NULL
);


ALTER TABLE public.ipam_vrf_export_targets OWNER TO netbox;

--
-- Name: ipam_vrf_export_targets_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_vrf_export_targets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_vrf_export_targets_id_seq OWNER TO netbox;

--
-- Name: ipam_vrf_export_targets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_vrf_export_targets_id_seq OWNED BY public.ipam_vrf_export_targets.id;


--
-- Name: ipam_vrf_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_vrf_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_vrf_id_seq OWNER TO netbox;

--
-- Name: ipam_vrf_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_vrf_id_seq OWNED BY public.ipam_vrf.id;


--
-- Name: ipam_vrf_import_targets; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_vrf_import_targets (
    id bigint NOT NULL,
    vrf_id bigint NOT NULL,
    routetarget_id bigint NOT NULL
);


ALTER TABLE public.ipam_vrf_import_targets OWNER TO netbox;

--
-- Name: ipam_vrf_import_targets_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_vrf_import_targets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_vrf_import_targets_id_seq OWNER TO netbox;

--
-- Name: ipam_vrf_import_targets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_vrf_import_targets_id_seq OWNED BY public.ipam_vrf_import_targets.id;


--
-- Name: social_auth_association; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.social_auth_association (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    handle character varying(255) NOT NULL,
    secret character varying(255) NOT NULL,
    issued integer NOT NULL,
    lifetime integer NOT NULL,
    assoc_type character varying(64) NOT NULL
);


ALTER TABLE public.social_auth_association OWNER TO netbox;

--
-- Name: social_auth_association_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.social_auth_association_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_association_id_seq OWNER TO netbox;

--
-- Name: social_auth_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.social_auth_association_id_seq OWNED BY public.social_auth_association.id;


--
-- Name: social_auth_code; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.social_auth_code (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    code character varying(32) NOT NULL,
    verified boolean NOT NULL,
    "timestamp" timestamp with time zone NOT NULL
);


ALTER TABLE public.social_auth_code OWNER TO netbox;

--
-- Name: social_auth_code_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.social_auth_code_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_code_id_seq OWNER TO netbox;

--
-- Name: social_auth_code_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.social_auth_code_id_seq OWNED BY public.social_auth_code.id;


--
-- Name: social_auth_nonce; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.social_auth_nonce (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    "timestamp" integer NOT NULL,
    salt character varying(65) NOT NULL
);


ALTER TABLE public.social_auth_nonce OWNER TO netbox;

--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.social_auth_nonce_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_nonce_id_seq OWNER TO netbox;

--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.social_auth_nonce_id_seq OWNED BY public.social_auth_nonce.id;


--
-- Name: social_auth_partial; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.social_auth_partial (
    id integer NOT NULL,
    token character varying(32) NOT NULL,
    next_step smallint NOT NULL,
    backend character varying(32) NOT NULL,
    data jsonb NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    CONSTRAINT social_auth_partial_next_step_check CHECK ((next_step >= 0))
);


ALTER TABLE public.social_auth_partial OWNER TO netbox;

--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.social_auth_partial_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_partial_id_seq OWNER TO netbox;

--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.social_auth_partial_id_seq OWNED BY public.social_auth_partial.id;


--
-- Name: social_auth_usersocialauth; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.social_auth_usersocialauth (
    id integer NOT NULL,
    provider character varying(32) NOT NULL,
    uid character varying(255) NOT NULL,
    extra_data jsonb NOT NULL,
    user_id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL
);


ALTER TABLE public.social_auth_usersocialauth OWNER TO netbox;

--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.social_auth_usersocialauth_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_usersocialauth_id_seq OWNER TO netbox;

--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.social_auth_usersocialauth_id_seq OWNED BY public.social_auth_usersocialauth.id;


--
-- Name: taggit_tag; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.taggit_tag (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL
);


ALTER TABLE public.taggit_tag OWNER TO netbox;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.taggit_tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taggit_tag_id_seq OWNER TO netbox;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.taggit_tag_id_seq OWNED BY public.taggit_tag.id;


--
-- Name: taggit_taggeditem; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.taggit_taggeditem (
    id integer NOT NULL,
    object_id integer NOT NULL,
    content_type_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.taggit_taggeditem OWNER TO netbox;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.taggit_taggeditem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taggit_taggeditem_id_seq OWNER TO netbox;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.taggit_taggeditem_id_seq OWNED BY public.taggit_taggeditem.id;


--
-- Name: tenancy_contact; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.tenancy_contact (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    title character varying(100) NOT NULL,
    phone character varying(50) NOT NULL,
    email character varying(254) NOT NULL,
    address character varying(200) NOT NULL,
    comments text NOT NULL,
    group_id bigint,
    link character varying(200) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.tenancy_contact OWNER TO netbox;

--
-- Name: tenancy_contact_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.tenancy_contact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tenancy_contact_id_seq OWNER TO netbox;

--
-- Name: tenancy_contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.tenancy_contact_id_seq OWNED BY public.tenancy_contact.id;


--
-- Name: tenancy_contactassignment; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.tenancy_contactassignment (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    object_id bigint NOT NULL,
    priority character varying(50) NOT NULL,
    contact_id bigint NOT NULL,
    content_type_id integer NOT NULL,
    role_id bigint NOT NULL,
    CONSTRAINT tenancy_contactassignment_object_id_check CHECK ((object_id >= 0))
);


ALTER TABLE public.tenancy_contactassignment OWNER TO netbox;

--
-- Name: tenancy_contactassignment_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.tenancy_contactassignment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tenancy_contactassignment_id_seq OWNER TO netbox;

--
-- Name: tenancy_contactassignment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.tenancy_contactassignment_id_seq OWNED BY public.tenancy_contactassignment.id;


--
-- Name: tenancy_contactgroup; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.tenancy_contactgroup (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    parent_id bigint,
    CONSTRAINT tenancy_contactgroup_level_check CHECK ((level >= 0)),
    CONSTRAINT tenancy_contactgroup_lft_check CHECK ((lft >= 0)),
    CONSTRAINT tenancy_contactgroup_rght_check CHECK ((rght >= 0)),
    CONSTRAINT tenancy_contactgroup_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.tenancy_contactgroup OWNER TO netbox;

--
-- Name: tenancy_contactgroup_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.tenancy_contactgroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tenancy_contactgroup_id_seq OWNER TO netbox;

--
-- Name: tenancy_contactgroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.tenancy_contactgroup_id_seq OWNED BY public.tenancy_contactgroup.id;


--
-- Name: tenancy_contactrole; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.tenancy_contactrole (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.tenancy_contactrole OWNER TO netbox;

--
-- Name: tenancy_contactrole_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.tenancy_contactrole_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tenancy_contactrole_id_seq OWNER TO netbox;

--
-- Name: tenancy_contactrole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.tenancy_contactrole_id_seq OWNED BY public.tenancy_contactrole.id;


--
-- Name: tenancy_tenant; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.tenancy_tenant (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    comments text NOT NULL,
    group_id bigint
);


ALTER TABLE public.tenancy_tenant OWNER TO netbox;

--
-- Name: tenancy_tenant_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.tenancy_tenant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tenancy_tenant_id_seq OWNER TO netbox;

--
-- Name: tenancy_tenant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.tenancy_tenant_id_seq OWNED BY public.tenancy_tenant.id;


--
-- Name: tenancy_tenantgroup; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.tenancy_tenantgroup (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    parent_id bigint,
    CONSTRAINT tenancy_tenantgroup_level_check CHECK ((level >= 0)),
    CONSTRAINT tenancy_tenantgroup_lft_check CHECK ((lft >= 0)),
    CONSTRAINT tenancy_tenantgroup_rght_check CHECK ((rght >= 0)),
    CONSTRAINT tenancy_tenantgroup_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.tenancy_tenantgroup OWNER TO netbox;

--
-- Name: tenancy_tenantgroup_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.tenancy_tenantgroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tenancy_tenantgroup_id_seq OWNER TO netbox;

--
-- Name: tenancy_tenantgroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.tenancy_tenantgroup_id_seq OWNED BY public.tenancy_tenantgroup.id;


--
-- Name: users_objectpermission; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.users_objectpermission (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    enabled boolean NOT NULL,
    actions character varying(30)[] NOT NULL,
    constraints jsonb
);


ALTER TABLE public.users_objectpermission OWNER TO netbox;

--
-- Name: users_objectpermission_groups; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.users_objectpermission_groups (
    id bigint NOT NULL,
    objectpermission_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.users_objectpermission_groups OWNER TO netbox;

--
-- Name: users_objectpermission_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.users_objectpermission_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_objectpermission_groups_id_seq OWNER TO netbox;

--
-- Name: users_objectpermission_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.users_objectpermission_groups_id_seq OWNED BY public.users_objectpermission_groups.id;


--
-- Name: users_objectpermission_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.users_objectpermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_objectpermission_id_seq OWNER TO netbox;

--
-- Name: users_objectpermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.users_objectpermission_id_seq OWNED BY public.users_objectpermission.id;


--
-- Name: users_objectpermission_object_types; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.users_objectpermission_object_types (
    id bigint NOT NULL,
    objectpermission_id bigint NOT NULL,
    contenttype_id integer NOT NULL
);


ALTER TABLE public.users_objectpermission_object_types OWNER TO netbox;

--
-- Name: users_objectpermission_object_types_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.users_objectpermission_object_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_objectpermission_object_types_id_seq OWNER TO netbox;

--
-- Name: users_objectpermission_object_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.users_objectpermission_object_types_id_seq OWNED BY public.users_objectpermission_object_types.id;


--
-- Name: users_objectpermission_users; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.users_objectpermission_users (
    id bigint NOT NULL,
    objectpermission_id bigint NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.users_objectpermission_users OWNER TO netbox;

--
-- Name: users_objectpermission_users_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.users_objectpermission_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_objectpermission_users_id_seq OWNER TO netbox;

--
-- Name: users_objectpermission_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.users_objectpermission_users_id_seq OWNED BY public.users_objectpermission_users.id;


--
-- Name: users_token; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.users_token (
    id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    expires timestamp with time zone,
    key character varying(40) NOT NULL,
    write_enabled boolean NOT NULL,
    description character varying(200) NOT NULL,
    user_id integer NOT NULL,
    allowed_ips cidr[],
    last_used timestamp with time zone
);


ALTER TABLE public.users_token OWNER TO netbox;

--
-- Name: users_token_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.users_token_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_token_id_seq OWNER TO netbox;

--
-- Name: users_token_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.users_token_id_seq OWNED BY public.users_token.id;


--
-- Name: users_userconfig; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.users_userconfig (
    id bigint NOT NULL,
    data jsonb NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.users_userconfig OWNER TO netbox;

--
-- Name: users_userconfig_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.users_userconfig_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_userconfig_id_seq OWNER TO netbox;

--
-- Name: users_userconfig_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.users_userconfig_id_seq OWNED BY public.users_userconfig.id;


--
-- Name: virtualization_cluster; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.virtualization_cluster (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    comments text NOT NULL,
    group_id bigint,
    site_id bigint,
    tenant_id bigint,
    type_id bigint NOT NULL,
    status character varying(50) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.virtualization_cluster OWNER TO netbox;

--
-- Name: virtualization_cluster_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.virtualization_cluster_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.virtualization_cluster_id_seq OWNER TO netbox;

--
-- Name: virtualization_cluster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.virtualization_cluster_id_seq OWNED BY public.virtualization_cluster.id;


--
-- Name: virtualization_clustergroup; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.virtualization_clustergroup (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.virtualization_clustergroup OWNER TO netbox;

--
-- Name: virtualization_clustergroup_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.virtualization_clustergroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.virtualization_clustergroup_id_seq OWNER TO netbox;

--
-- Name: virtualization_clustergroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.virtualization_clustergroup_id_seq OWNED BY public.virtualization_clustergroup.id;


--
-- Name: virtualization_clustertype; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.virtualization_clustertype (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.virtualization_clustertype OWNER TO netbox;

--
-- Name: virtualization_clustertype_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.virtualization_clustertype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.virtualization_clustertype_id_seq OWNER TO netbox;

--
-- Name: virtualization_clustertype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.virtualization_clustertype_id_seq OWNED BY public.virtualization_clustertype.id;


--
-- Name: virtualization_virtualmachine; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.virtualization_virtualmachine (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    local_context_data jsonb,
    name character varying(64) NOT NULL,
    status character varying(50) NOT NULL,
    vcpus numeric(6,2),
    memory integer,
    disk integer,
    comments text NOT NULL,
    cluster_id bigint,
    platform_id bigint,
    primary_ip4_id bigint,
    primary_ip6_id bigint,
    role_id bigint,
    tenant_id bigint,
    _name character varying(100) NOT NULL,
    site_id bigint,
    device_id bigint,
    description character varying(200) NOT NULL,
    CONSTRAINT virtualization_virtualmachine_disk_check CHECK ((disk >= 0)),
    CONSTRAINT virtualization_virtualmachine_memory_check CHECK ((memory >= 0))
);


ALTER TABLE public.virtualization_virtualmachine OWNER TO netbox;

--
-- Name: virtualization_virtualmachine_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.virtualization_virtualmachine_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.virtualization_virtualmachine_id_seq OWNER TO netbox;

--
-- Name: virtualization_virtualmachine_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.virtualization_virtualmachine_id_seq OWNED BY public.virtualization_virtualmachine.id;


--
-- Name: virtualization_vminterface; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.virtualization_vminterface (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    enabled boolean NOT NULL,
    mac_address macaddr,
    mtu integer,
    mode character varying(50) NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    parent_id bigint,
    untagged_vlan_id bigint,
    virtual_machine_id bigint NOT NULL,
    bridge_id bigint,
    vrf_id bigint,
    CONSTRAINT virtualization_vminterface_mtu_check CHECK ((mtu >= 0))
);


ALTER TABLE public.virtualization_vminterface OWNER TO netbox;

--
-- Name: virtualization_vminterface_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.virtualization_vminterface_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.virtualization_vminterface_id_seq OWNER TO netbox;

--
-- Name: virtualization_vminterface_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.virtualization_vminterface_id_seq OWNED BY public.virtualization_vminterface.id;


--
-- Name: virtualization_vminterface_tagged_vlans; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.virtualization_vminterface_tagged_vlans (
    id bigint NOT NULL,
    vminterface_id bigint NOT NULL,
    vlan_id bigint NOT NULL
);


ALTER TABLE public.virtualization_vminterface_tagged_vlans OWNER TO netbox;

--
-- Name: virtualization_vminterface_tagged_vlans_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.virtualization_vminterface_tagged_vlans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.virtualization_vminterface_tagged_vlans_id_seq OWNER TO netbox;

--
-- Name: virtualization_vminterface_tagged_vlans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.virtualization_vminterface_tagged_vlans_id_seq OWNED BY public.virtualization_vminterface_tagged_vlans.id;


--
-- Name: wireless_wirelesslan; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.wireless_wirelesslan (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    ssid character varying(32) NOT NULL,
    group_id bigint,
    description character varying(200) NOT NULL,
    auth_cipher character varying(50) NOT NULL,
    auth_psk character varying(64) NOT NULL,
    auth_type character varying(50) NOT NULL,
    vlan_id bigint,
    tenant_id bigint,
    comments text NOT NULL,
    status character varying(50) NOT NULL
);


ALTER TABLE public.wireless_wirelesslan OWNER TO netbox;

--
-- Name: wireless_wirelesslan_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.wireless_wirelesslan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wireless_wirelesslan_id_seq OWNER TO netbox;

--
-- Name: wireless_wirelesslan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.wireless_wirelesslan_id_seq OWNED BY public.wireless_wirelesslan.id;


--
-- Name: wireless_wirelesslangroup; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.wireless_wirelesslangroup (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    parent_id bigint,
    CONSTRAINT wireless_wirelesslangroup_level_check CHECK ((level >= 0)),
    CONSTRAINT wireless_wirelesslangroup_lft_check CHECK ((lft >= 0)),
    CONSTRAINT wireless_wirelesslangroup_rght_check CHECK ((rght >= 0)),
    CONSTRAINT wireless_wirelesslangroup_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.wireless_wirelesslangroup OWNER TO netbox;

--
-- Name: wireless_wirelesslangroup_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.wireless_wirelesslangroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wireless_wirelesslangroup_id_seq OWNER TO netbox;

--
-- Name: wireless_wirelesslangroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.wireless_wirelesslangroup_id_seq OWNED BY public.wireless_wirelesslangroup.id;


--
-- Name: wireless_wirelesslink; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.wireless_wirelesslink (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    ssid character varying(32) NOT NULL,
    status character varying(50) NOT NULL,
    description character varying(200) NOT NULL,
    auth_cipher character varying(50) NOT NULL,
    auth_psk character varying(64) NOT NULL,
    auth_type character varying(50) NOT NULL,
    _interface_a_device_id bigint,
    _interface_b_device_id bigint,
    interface_a_id bigint NOT NULL,
    interface_b_id bigint NOT NULL,
    tenant_id bigint,
    comments text NOT NULL
);


ALTER TABLE public.wireless_wirelesslink OWNER TO netbox;

--
-- Name: wireless_wirelesslink_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.wireless_wirelesslink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wireless_wirelesslink_id_seq OWNER TO netbox;

--
-- Name: wireless_wirelesslink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.wireless_wirelesslink_id_seq OWNED BY public.wireless_wirelesslink.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: circuits_circuit id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuit ALTER COLUMN id SET DEFAULT nextval('public.circuits_circuit_id_seq'::regclass);


--
-- Name: circuits_circuittermination id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination ALTER COLUMN id SET DEFAULT nextval('public.circuits_circuittermination_id_seq'::regclass);


--
-- Name: circuits_circuittype id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittype ALTER COLUMN id SET DEFAULT nextval('public.circuits_circuittype_id_seq'::regclass);


--
-- Name: circuits_provider id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_provider ALTER COLUMN id SET DEFAULT nextval('public.circuits_provider_id_seq'::regclass);


--
-- Name: circuits_provider_asns id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_provider_asns ALTER COLUMN id SET DEFAULT nextval('public.circuits_provider_asns_id_seq'::regclass);


--
-- Name: circuits_providernetwork id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_providernetwork ALTER COLUMN id SET DEFAULT nextval('public.circuits_providernetwork_id_seq'::regclass);


--
-- Name: dcim_cable id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cable ALTER COLUMN id SET DEFAULT nextval('public.dcim_cable_id_seq'::regclass);


--
-- Name: dcim_cablepath id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cablepath ALTER COLUMN id SET DEFAULT nextval('public.dcim_cablepath_id_seq'::regclass);


--
-- Name: dcim_consoleport id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleport ALTER COLUMN id SET DEFAULT nextval('public.dcim_consoleport_id_seq'::regclass);


--
-- Name: dcim_consoleporttemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleporttemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_consoleporttemplate_id_seq'::regclass);


--
-- Name: dcim_consoleserverport id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverport ALTER COLUMN id SET DEFAULT nextval('public.dcim_consoleserverport_id_seq'::regclass);


--
-- Name: dcim_consoleserverporttemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverporttemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_consoleserverporttemplate_id_seq'::regclass);


--
-- Name: dcim_device id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device ALTER COLUMN id SET DEFAULT nextval('public.dcim_device_id_seq'::regclass);


--
-- Name: dcim_devicebay id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebay ALTER COLUMN id SET DEFAULT nextval('public.dcim_devicebay_id_seq'::regclass);


--
-- Name: dcim_devicebaytemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebaytemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_devicebaytemplate_id_seq'::regclass);


--
-- Name: dcim_devicerole id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicerole ALTER COLUMN id SET DEFAULT nextval('public.dcim_devicerole_id_seq'::regclass);


--
-- Name: dcim_devicetype id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicetype ALTER COLUMN id SET DEFAULT nextval('public.dcim_devicetype_id_seq'::regclass);


--
-- Name: dcim_frontport id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontport ALTER COLUMN id SET DEFAULT nextval('public.dcim_frontport_id_seq'::regclass);


--
-- Name: dcim_frontporttemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontporttemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_frontporttemplate_id_seq'::regclass);


--
-- Name: dcim_interface id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface ALTER COLUMN id SET DEFAULT nextval('public.dcim_interface_id_seq'::regclass);


--
-- Name: dcim_interface_tagged_vlans id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface_tagged_vlans ALTER COLUMN id SET DEFAULT nextval('public.dcim_interface_tagged_vlans_id_seq'::regclass);


--
-- Name: dcim_interface_wireless_lans id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface_wireless_lans ALTER COLUMN id SET DEFAULT nextval('public.dcim_interface_wireless_lans_id_seq'::regclass);


--
-- Name: dcim_interfacetemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interfacetemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_interfacetemplate_id_seq'::regclass);


--
-- Name: dcim_inventoryitem id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem ALTER COLUMN id SET DEFAULT nextval('public.dcim_inventoryitem_id_seq'::regclass);


--
-- Name: dcim_inventoryitemrole id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitemrole ALTER COLUMN id SET DEFAULT nextval('public.dcim_inventoryitemrole_id_seq'::regclass);


--
-- Name: dcim_inventoryitemtemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitemtemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_inventoryitemtemplate_id_seq'::regclass);


--
-- Name: dcim_location id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_location ALTER COLUMN id SET DEFAULT nextval('public.dcim_location_id_seq'::regclass);


--
-- Name: dcim_manufacturer id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_manufacturer ALTER COLUMN id SET DEFAULT nextval('public.dcim_manufacturer_id_seq'::regclass);


--
-- Name: dcim_module id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_module ALTER COLUMN id SET DEFAULT nextval('public.dcim_module_id_seq'::regclass);


--
-- Name: dcim_modulebay id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_modulebay ALTER COLUMN id SET DEFAULT nextval('public.dcim_modulebay_id_seq'::regclass);


--
-- Name: dcim_modulebaytemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_modulebaytemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_modulebaytemplate_id_seq'::regclass);


--
-- Name: dcim_moduletype id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_moduletype ALTER COLUMN id SET DEFAULT nextval('public.dcim_moduletype_id_seq'::regclass);


--
-- Name: dcim_platform id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_platform ALTER COLUMN id SET DEFAULT nextval('public.dcim_platform_id_seq'::regclass);


--
-- Name: dcim_powerfeed id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerfeed ALTER COLUMN id SET DEFAULT nextval('public.dcim_powerfeed_id_seq'::regclass);


--
-- Name: dcim_poweroutlet id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlet ALTER COLUMN id SET DEFAULT nextval('public.dcim_poweroutlet_id_seq'::regclass);


--
-- Name: dcim_poweroutlettemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlettemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_poweroutlettemplate_id_seq'::regclass);


--
-- Name: dcim_powerpanel id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerpanel ALTER COLUMN id SET DEFAULT nextval('public.dcim_powerpanel_id_seq'::regclass);


--
-- Name: dcim_powerport id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerport ALTER COLUMN id SET DEFAULT nextval('public.dcim_powerport_id_seq'::regclass);


--
-- Name: dcim_powerporttemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerporttemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_powerporttemplate_id_seq'::regclass);


--
-- Name: dcim_rack id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack ALTER COLUMN id SET DEFAULT nextval('public.dcim_rack_id_seq'::regclass);


--
-- Name: dcim_rackreservation id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackreservation ALTER COLUMN id SET DEFAULT nextval('public.dcim_rackreservation_id_seq'::regclass);


--
-- Name: dcim_rackrole id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackrole ALTER COLUMN id SET DEFAULT nextval('public.dcim_rackrole_id_seq'::regclass);


--
-- Name: dcim_rearport id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearport ALTER COLUMN id SET DEFAULT nextval('public.dcim_rearport_id_seq'::regclass);


--
-- Name: dcim_rearporttemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearporttemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_rearporttemplate_id_seq'::regclass);


--
-- Name: dcim_region id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_region ALTER COLUMN id SET DEFAULT nextval('public.dcim_region_id_seq'::regclass);


--
-- Name: dcim_site id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site ALTER COLUMN id SET DEFAULT nextval('public.dcim_site_id_seq'::regclass);


--
-- Name: dcim_site_asns id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site_asns ALTER COLUMN id SET DEFAULT nextval('public.dcim_site_asns_id_seq'::regclass);


--
-- Name: dcim_sitegroup id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_sitegroup ALTER COLUMN id SET DEFAULT nextval('public.dcim_sitegroup_id_seq'::regclass);


--
-- Name: dcim_virtualchassis id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_virtualchassis ALTER COLUMN id SET DEFAULT nextval('public.dcim_virtualchassis_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: extras_configcontext id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_id_seq'::regclass);


--
-- Name: extras_configcontext_cluster_groups id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_cluster_groups ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_cluster_groups_id_seq'::regclass);


--
-- Name: extras_configcontext_cluster_types id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_cluster_types ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_cluster_types_id_seq'::regclass);


--
-- Name: extras_configcontext_clusters id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_clusters ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_clusters_id_seq'::regclass);


--
-- Name: extras_configcontext_device_types id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_device_types ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_device_types_id_seq'::regclass);


--
-- Name: extras_configcontext_platforms id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_platforms ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_platforms_id_seq'::regclass);


--
-- Name: extras_configcontext_regions id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_regions ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_regions_id_seq'::regclass);


--
-- Name: extras_configcontext_roles id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_roles ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_roles_id_seq'::regclass);


--
-- Name: extras_configcontext_site_groups id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_site_groups ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_site_groups_id_seq'::regclass);


--
-- Name: extras_configcontext_sites id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_sites ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_sites_id_seq'::regclass);


--
-- Name: extras_configcontext_tags id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tags ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_tags_id_seq'::regclass);


--
-- Name: extras_configcontext_tenant_groups id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenant_groups ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_tenant_groups_id_seq'::regclass);


--
-- Name: extras_configcontext_tenants id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenants ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_tenants_id_seq'::regclass);


--
-- Name: extras_configrevision id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configrevision ALTER COLUMN id SET DEFAULT nextval('public.extras_configrevision_id_seq'::regclass);


--
-- Name: extras_customfield id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield ALTER COLUMN id SET DEFAULT nextval('public.extras_customfield_id_seq'::regclass);


--
-- Name: extras_customfield_content_types id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield_content_types ALTER COLUMN id SET DEFAULT nextval('public.extras_customfield_content_types_id_seq'::regclass);


--
-- Name: extras_customlink id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customlink ALTER COLUMN id SET DEFAULT nextval('public.extras_customlink_id_seq'::regclass);


--
-- Name: extras_exporttemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_exporttemplate ALTER COLUMN id SET DEFAULT nextval('public.extras_exporttemplate_id_seq'::regclass);


--
-- Name: extras_imageattachment id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_imageattachment ALTER COLUMN id SET DEFAULT nextval('public.extras_imageattachment_id_seq'::regclass);


--
-- Name: extras_jobresult id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_jobresult ALTER COLUMN id SET DEFAULT nextval('public.extras_jobresult_id_seq'::regclass);


--
-- Name: extras_journalentry id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_journalentry ALTER COLUMN id SET DEFAULT nextval('public.extras_journalentry_id_seq'::regclass);


--
-- Name: extras_objectchange id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_objectchange ALTER COLUMN id SET DEFAULT nextval('public.extras_objectchange_id_seq'::regclass);


--
-- Name: extras_tag id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_tag ALTER COLUMN id SET DEFAULT nextval('public.extras_tag_id_seq'::regclass);


--
-- Name: extras_taggeditem id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_taggeditem ALTER COLUMN id SET DEFAULT nextval('public.extras_taggeditem_id_seq'::regclass);


--
-- Name: extras_webhook id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook ALTER COLUMN id SET DEFAULT nextval('public.extras_webhook_id_seq'::regclass);


--
-- Name: extras_webhook_content_types id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook_content_types ALTER COLUMN id SET DEFAULT nextval('public.extras_webhook_content_types_id_seq'::regclass);


--
-- Name: ipam_aggregate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_aggregate ALTER COLUMN id SET DEFAULT nextval('public.ipam_aggregate_id_seq'::regclass);


--
-- Name: ipam_asn id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_asn ALTER COLUMN id SET DEFAULT nextval('public.ipam_asn_id_seq'::regclass);


--
-- Name: ipam_fhrpgroup id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_fhrpgroup ALTER COLUMN id SET DEFAULT nextval('public.ipam_fhrpgroup_id_seq'::regclass);


--
-- Name: ipam_fhrpgroupassignment id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_fhrpgroupassignment ALTER COLUMN id SET DEFAULT nextval('public.ipam_fhrpgroupassignment_id_seq'::regclass);


--
-- Name: ipam_ipaddress id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_ipaddress ALTER COLUMN id SET DEFAULT nextval('public.ipam_ipaddress_id_seq'::regclass);


--
-- Name: ipam_iprange id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_iprange ALTER COLUMN id SET DEFAULT nextval('public.ipam_iprange_id_seq'::regclass);


--
-- Name: ipam_prefix id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_prefix ALTER COLUMN id SET DEFAULT nextval('public.ipam_prefix_id_seq'::regclass);


--
-- Name: ipam_rir id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_rir ALTER COLUMN id SET DEFAULT nextval('public.ipam_rir_id_seq'::regclass);


--
-- Name: ipam_role id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_role ALTER COLUMN id SET DEFAULT nextval('public.ipam_role_id_seq'::regclass);


--
-- Name: ipam_routetarget id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_routetarget ALTER COLUMN id SET DEFAULT nextval('public.ipam_routetarget_id_seq'::regclass);


--
-- Name: ipam_service id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service ALTER COLUMN id SET DEFAULT nextval('public.ipam_service_id_seq'::regclass);


--
-- Name: ipam_service_ipaddresses id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service_ipaddresses ALTER COLUMN id SET DEFAULT nextval('public.ipam_service_ipaddresses_id_seq'::regclass);


--
-- Name: ipam_servicetemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_servicetemplate ALTER COLUMN id SET DEFAULT nextval('public.ipam_servicetemplate_id_seq'::regclass);


--
-- Name: ipam_vlan id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan ALTER COLUMN id SET DEFAULT nextval('public.ipam_vlan_id_seq'::regclass);


--
-- Name: ipam_vlangroup id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlangroup ALTER COLUMN id SET DEFAULT nextval('public.ipam_vlangroup_id_seq'::regclass);


--
-- Name: ipam_vrf id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf ALTER COLUMN id SET DEFAULT nextval('public.ipam_vrf_id_seq'::regclass);


--
-- Name: ipam_vrf_export_targets id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf_export_targets ALTER COLUMN id SET DEFAULT nextval('public.ipam_vrf_export_targets_id_seq'::regclass);


--
-- Name: ipam_vrf_import_targets id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf_import_targets ALTER COLUMN id SET DEFAULT nextval('public.ipam_vrf_import_targets_id_seq'::regclass);


--
-- Name: social_auth_association id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.social_auth_association ALTER COLUMN id SET DEFAULT nextval('public.social_auth_association_id_seq'::regclass);


--
-- Name: social_auth_code id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.social_auth_code ALTER COLUMN id SET DEFAULT nextval('public.social_auth_code_id_seq'::regclass);


--
-- Name: social_auth_nonce id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.social_auth_nonce ALTER COLUMN id SET DEFAULT nextval('public.social_auth_nonce_id_seq'::regclass);


--
-- Name: social_auth_partial id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.social_auth_partial ALTER COLUMN id SET DEFAULT nextval('public.social_auth_partial_id_seq'::regclass);


--
-- Name: social_auth_usersocialauth id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.social_auth_usersocialauth ALTER COLUMN id SET DEFAULT nextval('public.social_auth_usersocialauth_id_seq'::regclass);


--
-- Name: taggit_tag id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_tag ALTER COLUMN id SET DEFAULT nextval('public.taggit_tag_id_seq'::regclass);


--
-- Name: taggit_taggeditem id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_taggeditem ALTER COLUMN id SET DEFAULT nextval('public.taggit_taggeditem_id_seq'::regclass);


--
-- Name: tenancy_contact id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_contact ALTER COLUMN id SET DEFAULT nextval('public.tenancy_contact_id_seq'::regclass);


--
-- Name: tenancy_contactassignment id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_contactassignment ALTER COLUMN id SET DEFAULT nextval('public.tenancy_contactassignment_id_seq'::regclass);


--
-- Name: tenancy_contactgroup id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_contactgroup ALTER COLUMN id SET DEFAULT nextval('public.tenancy_contactgroup_id_seq'::regclass);


--
-- Name: tenancy_contactrole id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_contactrole ALTER COLUMN id SET DEFAULT nextval('public.tenancy_contactrole_id_seq'::regclass);


--
-- Name: tenancy_tenant id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenant ALTER COLUMN id SET DEFAULT nextval('public.tenancy_tenant_id_seq'::regclass);


--
-- Name: tenancy_tenantgroup id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenantgroup ALTER COLUMN id SET DEFAULT nextval('public.tenancy_tenantgroup_id_seq'::regclass);


--
-- Name: users_objectpermission id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission ALTER COLUMN id SET DEFAULT nextval('public.users_objectpermission_id_seq'::regclass);


--
-- Name: users_objectpermission_groups id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_groups ALTER COLUMN id SET DEFAULT nextval('public.users_objectpermission_groups_id_seq'::regclass);


--
-- Name: users_objectpermission_object_types id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_object_types ALTER COLUMN id SET DEFAULT nextval('public.users_objectpermission_object_types_id_seq'::regclass);


--
-- Name: users_objectpermission_users id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_users ALTER COLUMN id SET DEFAULT nextval('public.users_objectpermission_users_id_seq'::regclass);


--
-- Name: users_token id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_token ALTER COLUMN id SET DEFAULT nextval('public.users_token_id_seq'::regclass);


--
-- Name: users_userconfig id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_userconfig ALTER COLUMN id SET DEFAULT nextval('public.users_userconfig_id_seq'::regclass);


--
-- Name: virtualization_cluster id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_cluster ALTER COLUMN id SET DEFAULT nextval('public.virtualization_cluster_id_seq'::regclass);


--
-- Name: virtualization_clustergroup id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustergroup ALTER COLUMN id SET DEFAULT nextval('public.virtualization_clustergroup_id_seq'::regclass);


--
-- Name: virtualization_clustertype id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustertype ALTER COLUMN id SET DEFAULT nextval('public.virtualization_clustertype_id_seq'::regclass);


--
-- Name: virtualization_virtualmachine id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine ALTER COLUMN id SET DEFAULT nextval('public.virtualization_virtualmachine_id_seq'::regclass);


--
-- Name: virtualization_vminterface id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface ALTER COLUMN id SET DEFAULT nextval('public.virtualization_vminterface_id_seq'::regclass);


--
-- Name: virtualization_vminterface_tagged_vlans id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface_tagged_vlans ALTER COLUMN id SET DEFAULT nextval('public.virtualization_vminterface_tagged_vlans_id_seq'::regclass);


--
-- Name: wireless_wirelesslan id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.wireless_wirelesslan ALTER COLUMN id SET DEFAULT nextval('public.wireless_wirelesslan_id_seq'::regclass);


--
-- Name: wireless_wirelesslangroup id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.wireless_wirelesslangroup ALTER COLUMN id SET DEFAULT nextval('public.wireless_wirelesslangroup_id_seq'::regclass);


--
-- Name: wireless_wirelesslink id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.wireless_wirelesslink ALTER COLUMN id SET DEFAULT nextval('public.wireless_wirelesslink_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: netbox
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
25	Can add association	7	add_association
26	Can change association	7	change_association
27	Can delete association	7	delete_association
28	Can view association	7	view_association
29	Can add code	8	add_code
30	Can change code	8	change_code
31	Can delete code	8	delete_code
32	Can view code	8	view_code
33	Can add nonce	9	add_nonce
34	Can change nonce	9	change_nonce
35	Can delete nonce	9	delete_nonce
36	Can view nonce	9	view_nonce
37	Can add user social auth	10	add_usersocialauth
38	Can change user social auth	10	change_usersocialauth
39	Can delete user social auth	10	delete_usersocialauth
40	Can view user social auth	10	view_usersocialauth
41	Can add partial	11	add_partial
42	Can change partial	11	change_partial
43	Can delete partial	11	delete_partial
44	Can view partial	11	view_partial
45	Can add tag	12	add_tag
46	Can change tag	12	change_tag
47	Can delete tag	12	delete_tag
48	Can view tag	12	view_tag
49	Can add tagged item	13	add_taggeditem
50	Can change tagged item	13	change_taggeditem
51	Can delete tagged item	13	delete_taggeditem
52	Can view tagged item	13	view_taggeditem
53	Can add circuit	14	add_circuit
54	Can change circuit	14	change_circuit
55	Can delete circuit	14	delete_circuit
56	Can view circuit	14	view_circuit
57	Can add circuit termination	15	add_circuittermination
58	Can change circuit termination	15	change_circuittermination
59	Can delete circuit termination	15	delete_circuittermination
60	Can view circuit termination	15	view_circuittermination
61	Can add circuit type	16	add_circuittype
62	Can change circuit type	16	change_circuittype
63	Can delete circuit type	16	delete_circuittype
64	Can view circuit type	16	view_circuittype
65	Can add provider	17	add_provider
66	Can change provider	17	change_provider
67	Can delete provider	17	delete_provider
68	Can view provider	17	view_provider
69	Can add provider network	18	add_providernetwork
70	Can change provider network	18	change_providernetwork
71	Can delete provider network	18	delete_providernetwork
72	Can view provider network	18	view_providernetwork
73	Can add cable	19	add_cable
74	Can change cable	19	change_cable
75	Can delete cable	19	delete_cable
76	Can view cable	19	view_cable
77	Can add cable path	20	add_cablepath
78	Can change cable path	20	change_cablepath
79	Can delete cable path	20	delete_cablepath
80	Can view cable path	20	view_cablepath
81	Can add console port	21	add_consoleport
82	Can change console port	21	change_consoleport
83	Can delete console port	21	delete_consoleport
84	Can view console port	21	view_consoleport
85	Can add console port template	22	add_consoleporttemplate
86	Can change console port template	22	change_consoleporttemplate
87	Can delete console port template	22	delete_consoleporttemplate
88	Can view console port template	22	view_consoleporttemplate
89	Can add console server port	23	add_consoleserverport
90	Can change console server port	23	change_consoleserverport
91	Can delete console server port	23	delete_consoleserverport
92	Can view console server port	23	view_consoleserverport
93	Can add console server port template	24	add_consoleserverporttemplate
94	Can change console server port template	24	change_consoleserverporttemplate
95	Can delete console server port template	24	delete_consoleserverporttemplate
96	Can view console server port template	24	view_consoleserverporttemplate
97	Can add device	25	add_device
98	Can change device	25	change_device
99	Can delete device	25	delete_device
100	Can view device	25	view_device
101	Can add device bay	26	add_devicebay
102	Can change device bay	26	change_devicebay
103	Can delete device bay	26	delete_devicebay
104	Can view device bay	26	view_devicebay
105	Can add device bay template	27	add_devicebaytemplate
106	Can change device bay template	27	change_devicebaytemplate
107	Can delete device bay template	27	delete_devicebaytemplate
108	Can view device bay template	27	view_devicebaytemplate
109	Can add device role	28	add_devicerole
110	Can change device role	28	change_devicerole
111	Can delete device role	28	delete_devicerole
112	Can view device role	28	view_devicerole
113	Can add device type	29	add_devicetype
114	Can change device type	29	change_devicetype
115	Can delete device type	29	delete_devicetype
116	Can view device type	29	view_devicetype
117	Can add front port	30	add_frontport
118	Can change front port	30	change_frontport
119	Can delete front port	30	delete_frontport
120	Can view front port	30	view_frontport
121	Can add front port template	31	add_frontporttemplate
122	Can change front port template	31	change_frontporttemplate
123	Can delete front port template	31	delete_frontporttemplate
124	Can view front port template	31	view_frontporttemplate
125	Can add interface	32	add_interface
126	Can change interface	32	change_interface
127	Can delete interface	32	delete_interface
128	Can view interface	32	view_interface
129	Can add interface template	33	add_interfacetemplate
130	Can change interface template	33	change_interfacetemplate
131	Can delete interface template	33	delete_interfacetemplate
132	Can view interface template	33	view_interfacetemplate
133	Can add inventory item	34	add_inventoryitem
134	Can change inventory item	34	change_inventoryitem
135	Can delete inventory item	34	delete_inventoryitem
136	Can view inventory item	34	view_inventoryitem
137	Can add location	35	add_location
138	Can change location	35	change_location
139	Can delete location	35	delete_location
140	Can view location	35	view_location
141	Can add manufacturer	36	add_manufacturer
142	Can change manufacturer	36	change_manufacturer
143	Can delete manufacturer	36	delete_manufacturer
144	Can view manufacturer	36	view_manufacturer
145	Can add platform	37	add_platform
146	Can change platform	37	change_platform
147	Can delete platform	37	delete_platform
148	Can view platform	37	view_platform
149	Can add power feed	38	add_powerfeed
150	Can change power feed	38	change_powerfeed
151	Can delete power feed	38	delete_powerfeed
152	Can view power feed	38	view_powerfeed
153	Can add power outlet	39	add_poweroutlet
154	Can change power outlet	39	change_poweroutlet
155	Can delete power outlet	39	delete_poweroutlet
156	Can view power outlet	39	view_poweroutlet
157	Can add power outlet template	40	add_poweroutlettemplate
158	Can change power outlet template	40	change_poweroutlettemplate
159	Can delete power outlet template	40	delete_poweroutlettemplate
160	Can view power outlet template	40	view_poweroutlettemplate
161	Can add power panel	41	add_powerpanel
162	Can change power panel	41	change_powerpanel
163	Can delete power panel	41	delete_powerpanel
164	Can view power panel	41	view_powerpanel
165	Can add power port	42	add_powerport
166	Can change power port	42	change_powerport
167	Can delete power port	42	delete_powerport
168	Can view power port	42	view_powerport
169	Can add power port template	43	add_powerporttemplate
170	Can change power port template	43	change_powerporttemplate
171	Can delete power port template	43	delete_powerporttemplate
172	Can view power port template	43	view_powerporttemplate
173	Can add rack	44	add_rack
174	Can change rack	44	change_rack
175	Can delete rack	44	delete_rack
176	Can view rack	44	view_rack
177	Can add rack reservation	45	add_rackreservation
178	Can change rack reservation	45	change_rackreservation
179	Can delete rack reservation	45	delete_rackreservation
180	Can view rack reservation	45	view_rackreservation
181	Can add rack role	46	add_rackrole
182	Can change rack role	46	change_rackrole
183	Can delete rack role	46	delete_rackrole
184	Can view rack role	46	view_rackrole
185	Can add rear port	47	add_rearport
186	Can change rear port	47	change_rearport
187	Can delete rear port	47	delete_rearport
188	Can view rear port	47	view_rearport
189	Can add rear port template	48	add_rearporttemplate
190	Can change rear port template	48	change_rearporttemplate
191	Can delete rear port template	48	delete_rearporttemplate
192	Can view rear port template	48	view_rearporttemplate
193	Can add region	49	add_region
194	Can change region	49	change_region
195	Can delete region	49	delete_region
196	Can view region	49	view_region
197	Can add site	50	add_site
198	Can change site	50	change_site
199	Can delete site	50	delete_site
200	Can view site	50	view_site
201	Can add site group	51	add_sitegroup
202	Can change site group	51	change_sitegroup
203	Can delete site group	51	delete_sitegroup
204	Can view site group	51	view_sitegroup
205	Can add virtual chassis	52	add_virtualchassis
206	Can change virtual chassis	52	change_virtualchassis
207	Can delete virtual chassis	52	delete_virtualchassis
208	Can view virtual chassis	52	view_virtualchassis
209	Can add module type	53	add_moduletype
210	Can change module type	53	change_moduletype
211	Can delete module type	53	delete_moduletype
212	Can view module type	53	view_moduletype
213	Can add module bay	54	add_modulebay
214	Can change module bay	54	change_modulebay
215	Can delete module bay	54	delete_modulebay
216	Can view module bay	54	view_modulebay
217	Can add module	55	add_module
218	Can change module	55	change_module
219	Can delete module	55	delete_module
220	Can view module	55	view_module
221	Can add module bay template	56	add_modulebaytemplate
222	Can change module bay template	56	change_modulebaytemplate
223	Can delete module bay template	56	delete_modulebaytemplate
224	Can view module bay template	56	view_modulebaytemplate
225	Can add inventory item role	57	add_inventoryitemrole
226	Can change inventory item role	57	change_inventoryitemrole
227	Can delete inventory item role	57	delete_inventoryitemrole
228	Can view inventory item role	57	view_inventoryitemrole
229	Can add inventory item template	58	add_inventoryitemtemplate
230	Can change inventory item template	58	change_inventoryitemtemplate
231	Can delete inventory item template	58	delete_inventoryitemtemplate
232	Can view inventory item template	58	view_inventoryitemtemplate
233	Can add aggregate	59	add_aggregate
234	Can change aggregate	59	change_aggregate
235	Can delete aggregate	59	delete_aggregate
236	Can view aggregate	59	view_aggregate
237	Can add IP address	60	add_ipaddress
238	Can change IP address	60	change_ipaddress
239	Can delete IP address	60	delete_ipaddress
240	Can view IP address	60	view_ipaddress
241	Can add prefix	61	add_prefix
242	Can change prefix	61	change_prefix
243	Can delete prefix	61	delete_prefix
244	Can view prefix	61	view_prefix
245	Can add RIR	62	add_rir
246	Can change RIR	62	change_rir
247	Can delete RIR	62	delete_rir
248	Can view RIR	62	view_rir
249	Can add role	63	add_role
250	Can change role	63	change_role
251	Can delete role	63	delete_role
252	Can view role	63	view_role
253	Can add route target	64	add_routetarget
254	Can change route target	64	change_routetarget
255	Can delete route target	64	delete_routetarget
256	Can view route target	64	view_routetarget
257	Can add VRF	65	add_vrf
258	Can change VRF	65	change_vrf
259	Can delete VRF	65	delete_vrf
260	Can view VRF	65	view_vrf
261	Can add VLAN group	66	add_vlangroup
262	Can change VLAN group	66	change_vlangroup
263	Can delete VLAN group	66	delete_vlangroup
264	Can view VLAN group	66	view_vlangroup
265	Can add VLAN	67	add_vlan
266	Can change VLAN	67	change_vlan
267	Can delete VLAN	67	delete_vlan
268	Can view VLAN	67	view_vlan
269	Can add service	68	add_service
270	Can change service	68	change_service
271	Can delete service	68	delete_service
272	Can view service	68	view_service
273	Can add IP range	69	add_iprange
274	Can change IP range	69	change_iprange
275	Can delete IP range	69	delete_iprange
276	Can view IP range	69	view_iprange
277	Can add FHRP group	70	add_fhrpgroup
278	Can change FHRP group	70	change_fhrpgroup
279	Can delete FHRP group	70	delete_fhrpgroup
280	Can view FHRP group	70	view_fhrpgroup
281	Can add FHRP group assignment	71	add_fhrpgroupassignment
282	Can change FHRP group assignment	71	change_fhrpgroupassignment
283	Can delete FHRP group assignment	71	delete_fhrpgroupassignment
284	Can view FHRP group assignment	71	view_fhrpgroupassignment
285	Can add ASN	72	add_asn
286	Can change ASN	72	change_asn
287	Can delete ASN	72	delete_asn
288	Can view ASN	72	view_asn
289	Can add service template	73	add_servicetemplate
290	Can change service template	73	change_servicetemplate
291	Can delete service template	73	delete_servicetemplate
292	Can view service template	73	view_servicetemplate
293	Can add report	74	add_report
294	Can change report	74	change_report
295	Can delete report	74	delete_report
296	Can view report	74	view_report
297	Can add script	75	add_script
298	Can change script	75	change_script
299	Can delete script	75	delete_script
300	Can view script	75	view_script
301	Can add config context	76	add_configcontext
302	Can change config context	76	change_configcontext
303	Can delete config context	76	delete_configcontext
304	Can view config context	76	view_configcontext
305	Can add tag	77	add_tag
306	Can change tag	77	change_tag
307	Can delete tag	77	delete_tag
308	Can view tag	77	view_tag
309	Can add webhook	78	add_webhook
310	Can change webhook	78	change_webhook
311	Can delete webhook	78	delete_webhook
312	Can view webhook	78	view_webhook
313	Can add tagged item	79	add_taggeditem
314	Can change tagged item	79	change_taggeditem
315	Can delete tagged item	79	delete_taggeditem
316	Can view tagged item	79	view_taggeditem
317	Can add object change	80	add_objectchange
318	Can change object change	80	change_objectchange
319	Can delete object change	80	delete_objectchange
320	Can view object change	80	view_objectchange
321	Can add journal entry	81	add_journalentry
322	Can change journal entry	81	change_journalentry
323	Can delete journal entry	81	delete_journalentry
324	Can view journal entry	81	view_journalentry
325	Can add job result	82	add_jobresult
326	Can change job result	82	change_jobresult
327	Can delete job result	82	delete_jobresult
328	Can view job result	82	view_jobresult
329	Can add image attachment	83	add_imageattachment
330	Can change image attachment	83	change_imageattachment
331	Can delete image attachment	83	delete_imageattachment
332	Can view image attachment	83	view_imageattachment
333	Can add export template	84	add_exporttemplate
334	Can change export template	84	change_exporttemplate
335	Can delete export template	84	delete_exporttemplate
336	Can view export template	84	view_exporttemplate
337	Can add custom link	85	add_customlink
338	Can change custom link	85	change_customlink
339	Can delete custom link	85	delete_customlink
340	Can view custom link	85	view_customlink
341	Can add custom field	86	add_customfield
342	Can change custom field	86	change_customfield
343	Can delete custom field	86	delete_customfield
344	Can view custom field	86	view_customfield
345	Can add config revision	87	add_configrevision
346	Can change config revision	87	change_configrevision
347	Can delete config revision	87	delete_configrevision
348	Can view config revision	87	view_configrevision
349	Can add tenant group	88	add_tenantgroup
350	Can change tenant group	88	change_tenantgroup
351	Can delete tenant group	88	delete_tenantgroup
352	Can view tenant group	88	view_tenantgroup
353	Can add tenant	89	add_tenant
354	Can change tenant	89	change_tenant
355	Can delete tenant	89	delete_tenant
356	Can view tenant	89	view_tenant
357	Can add contact role	90	add_contactrole
358	Can change contact role	90	change_contactrole
359	Can delete contact role	90	delete_contactrole
360	Can view contact role	90	view_contactrole
361	Can add contact group	91	add_contactgroup
362	Can change contact group	91	change_contactgroup
363	Can delete contact group	91	delete_contactgroup
364	Can view contact group	91	view_contactgroup
365	Can add contact	92	add_contact
366	Can change contact	92	change_contact
367	Can delete contact	92	delete_contact
368	Can view contact	92	view_contact
369	Can add contact assignment	93	add_contactassignment
370	Can change contact assignment	93	change_contactassignment
371	Can delete contact assignment	93	delete_contactassignment
372	Can view contact assignment	93	view_contactassignment
373	Can add Group	94	add_admingroup
374	Can change Group	94	change_admingroup
375	Can delete Group	94	delete_admingroup
376	Can view Group	94	view_admingroup
377	Can add User	95	add_adminuser
378	Can change User	95	change_adminuser
379	Can delete User	95	delete_adminuser
380	Can view User	95	view_adminuser
381	Can add User Preferences	96	add_userconfig
382	Can change User Preferences	96	change_userconfig
383	Can delete User Preferences	96	delete_userconfig
384	Can view User Preferences	96	view_userconfig
385	Can add token	97	add_token
386	Can change token	97	change_token
387	Can delete token	97	delete_token
388	Can view token	97	view_token
389	Can add permission	98	add_objectpermission
390	Can change permission	98	change_objectpermission
391	Can delete permission	98	delete_objectpermission
392	Can view permission	98	view_objectpermission
393	Can add cluster	99	add_cluster
394	Can change cluster	99	change_cluster
395	Can delete cluster	99	delete_cluster
396	Can view cluster	99	view_cluster
397	Can add cluster group	100	add_clustergroup
398	Can change cluster group	100	change_clustergroup
399	Can delete cluster group	100	delete_clustergroup
400	Can view cluster group	100	view_clustergroup
401	Can add cluster type	101	add_clustertype
402	Can change cluster type	101	change_clustertype
403	Can delete cluster type	101	delete_clustertype
404	Can view cluster type	101	view_clustertype
405	Can add virtual machine	102	add_virtualmachine
406	Can change virtual machine	102	change_virtualmachine
407	Can delete virtual machine	102	delete_virtualmachine
408	Can view virtual machine	102	view_virtualmachine
409	Can add interface	103	add_vminterface
410	Can change interface	103	change_vminterface
411	Can delete interface	103	delete_vminterface
412	Can view interface	103	view_vminterface
413	Can add Wireless LAN Group	104	add_wirelesslangroup
414	Can change Wireless LAN Group	104	change_wirelesslangroup
415	Can delete Wireless LAN Group	104	delete_wirelesslangroup
416	Can view Wireless LAN Group	104	view_wirelesslangroup
417	Can add Wireless LAN	105	add_wirelesslan
418	Can change Wireless LAN	105	change_wirelesslan
419	Can delete Wireless LAN	105	delete_wirelesslan
420	Can view Wireless LAN	105	view_wirelesslan
421	Can add wireless link	106	add_wirelesslink
422	Can change wireless link	106	change_wirelesslink
423	Can delete wireless link	106	delete_wirelesslink
424	Can view wireless link	106	view_wirelesslink
425	Access admin page	107	view
426	Can add cable termination	110	add_cabletermination
427	Can change cable termination	110	change_cabletermination
428	Can delete cable termination	110	delete_cabletermination
429	Can view cable termination	110	view_cabletermination
430	Can add virtual device context	108	add_virtualdevicecontext
431	Can change virtual device context	108	change_virtualdevicecontext
432	Can delete virtual device context	108	delete_virtualdevicecontext
433	Can view virtual device context	108	view_virtualdevicecontext
434	Can add L2VPN	109	add_l2vpn
435	Can change L2VPN	109	change_l2vpn
436	Can delete L2VPN	109	delete_l2vpn
437	Can view L2VPN	109	view_l2vpn
438	Can add L2VPN termination	111	add_l2vpntermination
439	Can change L2VPN termination	111	change_l2vpntermination
440	Can delete L2VPN termination	111	delete_l2vpntermination
441	Can view L2VPN termination	111	view_l2vpntermination
442	Can add saved filter	112	add_savedfilter
443	Can change saved filter	112	change_savedfilter
444	Can delete saved filter	112	delete_savedfilter
445	Can view saved filter	112	view_savedfilter
446	Can add cached value	113	add_cachedvalue
447	Can change cached value	113	change_cachedvalue
448	Can delete cached value	113	delete_cachedvalue
449	Can view cached value	113	view_cachedvalue
450	Can add branch	114	add_branch
451	Can change branch	114	change_branch
452	Can delete branch	114	delete_branch
453	Can view branch	114	view_branch
454	Can add staged change	115	add_stagedchange
455	Can change staged change	115	change_stagedchange
456	Can delete staged change	115	delete_stagedchange
457	Can view staged change	115	view_stagedchange
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$390000$ILfA4rzh6DiSdLWAVgoaKV$XEyXo1l3/oQPayfzEB1tFSAMAfI1mmA4AfE33bk4DPc=	2022-12-23 10:11:15.669371+00	t	admin			admin@example.com	t	t	2022-12-23 05:57:19.797568+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: circuits_circuit; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.circuits_circuit (created, last_updated, custom_field_data, id, cid, status, install_date, commit_rate, description, comments, provider_id, tenant_id, termination_a_id, termination_z_id, type_id, termination_date) FROM stdin;
\.


--
-- Data for Name: circuits_circuittermination; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.circuits_circuittermination (created, last_updated, id, mark_connected, term_side, port_speed, upstream_speed, xconnect_id, pp_info, description, cable_id, circuit_id, provider_network_id, site_id, custom_field_data, cable_end) FROM stdin;
\.


--
-- Data for Name: circuits_circuittype; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.circuits_circuittype (created, last_updated, custom_field_data, id, name, slug, description) FROM stdin;
\.


--
-- Data for Name: circuits_provider; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.circuits_provider (created, last_updated, custom_field_data, id, name, slug, account, comments, description) FROM stdin;
\.


--
-- Data for Name: circuits_provider_asns; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.circuits_provider_asns (id, provider_id, asn_id) FROM stdin;
\.


--
-- Data for Name: circuits_providernetwork; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.circuits_providernetwork (created, last_updated, custom_field_data, id, name, description, comments, provider_id, service_id) FROM stdin;
\.


--
-- Data for Name: dcim_cable; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_cable (created, last_updated, custom_field_data, id, type, status, label, color, length, length_unit, _abs_length, tenant_id, comments, description) FROM stdin;
\.


--
-- Data for Name: dcim_cablepath; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_cablepath (id, _nodes, is_active, is_split, path, is_complete) FROM stdin;
\.


--
-- Data for Name: dcim_cabletermination; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_cabletermination (id, cable_end, termination_id, cable_id, termination_type_id, _device_id, _rack_id, _location_id, _site_id) FROM stdin;
\.


--
-- Data for Name: dcim_consoleport; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_consoleport (created, last_updated, custom_field_data, id, name, _name, label, description, mark_connected, type, speed, _path_id, cable_id, device_id, module_id, cable_end) FROM stdin;
\.


--
-- Data for Name: dcim_consoleporttemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_consoleporttemplate (created, last_updated, id, name, _name, label, description, type, device_type_id, module_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_consoleserverport; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_consoleserverport (created, last_updated, custom_field_data, id, name, _name, label, description, mark_connected, type, speed, _path_id, cable_id, device_id, module_id, cable_end) FROM stdin;
\.


--
-- Data for Name: dcim_consoleserverporttemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_consoleserverporttemplate (created, last_updated, id, name, _name, label, description, type, device_type_id, module_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_device; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_device (created, last_updated, custom_field_data, id, local_context_data, name, _name, serial, asset_tag, "position", face, status, vc_position, vc_priority, comments, cluster_id, device_role_id, device_type_id, location_id, platform_id, primary_ip4_id, primary_ip6_id, rack_id, site_id, tenant_id, virtual_chassis_id, airflow, description) FROM stdin;
\.


--
-- Data for Name: dcim_devicebay; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_devicebay (created, last_updated, custom_field_data, id, name, _name, label, description, device_id, installed_device_id) FROM stdin;
\.


--
-- Data for Name: dcim_devicebaytemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_devicebaytemplate (created, last_updated, id, name, _name, label, description, device_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_devicerole; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_devicerole (created, last_updated, custom_field_data, id, name, slug, color, vm_role, description) FROM stdin;
\.


--
-- Data for Name: dcim_devicetype; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_devicetype (created, last_updated, custom_field_data, id, model, slug, part_number, u_height, is_full_depth, subdevice_role, front_image, rear_image, comments, manufacturer_id, airflow, weight, weight_unit, _abs_weight, description) FROM stdin;
\.


--
-- Data for Name: dcim_frontport; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_frontport (created, last_updated, custom_field_data, id, name, _name, label, description, mark_connected, type, rear_port_position, cable_id, device_id, rear_port_id, color, module_id, cable_end) FROM stdin;
\.


--
-- Data for Name: dcim_frontporttemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_frontporttemplate (created, last_updated, id, name, _name, label, description, type, rear_port_position, device_type_id, rear_port_id, color, module_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_interface; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_interface (created, last_updated, custom_field_data, id, name, label, description, mark_connected, enabled, mac_address, mtu, mode, _name, type, mgmt_only, _path_id, cable_id, device_id, lag_id, parent_id, untagged_vlan_id, wwn, bridge_id, rf_role, rf_channel, rf_channel_frequency, rf_channel_width, tx_power, wireless_link_id, module_id, vrf_id, duplex, speed, poe_mode, poe_type, cable_end) FROM stdin;
\.


--
-- Data for Name: dcim_interface_tagged_vlans; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_interface_tagged_vlans (id, interface_id, vlan_id) FROM stdin;
\.


--
-- Data for Name: dcim_interface_vdcs; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_interface_vdcs (id, interface_id, virtualdevicecontext_id) FROM stdin;
\.


--
-- Data for Name: dcim_interface_wireless_lans; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_interface_wireless_lans (id, interface_id, wirelesslan_id) FROM stdin;
\.


--
-- Data for Name: dcim_interfacetemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_interfacetemplate (created, last_updated, id, name, label, description, _name, type, mgmt_only, device_type_id, module_type_id, poe_mode, poe_type) FROM stdin;
\.


--
-- Data for Name: dcim_inventoryitem; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_inventoryitem (created, last_updated, custom_field_data, id, name, _name, label, description, part_id, serial, asset_tag, discovered, lft, rght, tree_id, level, device_id, manufacturer_id, parent_id, role_id, component_id, component_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_inventoryitemrole; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_inventoryitemrole (created, last_updated, custom_field_data, id, name, slug, color, description) FROM stdin;
\.


--
-- Data for Name: dcim_inventoryitemtemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_inventoryitemtemplate (created, last_updated, id, name, _name, label, description, component_id, part_id, lft, rght, tree_id, level, component_type_id, device_type_id, manufacturer_id, parent_id, role_id) FROM stdin;
\.


--
-- Data for Name: dcim_location; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_location (created, last_updated, custom_field_data, id, name, slug, description, lft, rght, tree_id, level, parent_id, site_id, tenant_id, status) FROM stdin;
\.


--
-- Data for Name: dcim_manufacturer; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_manufacturer (created, last_updated, custom_field_data, id, name, slug, description) FROM stdin;
2022-12-23 10:15:09.862628+00	2022-12-23 10:15:09.862666+00	{}	1	APC	apc	
2022-12-23 10:15:09.916306+00	2022-12-23 10:15:09.916347+00	{}	2	Arista	arista	
2022-12-23 10:15:09.936482+00	2022-12-23 10:15:09.936495+00	{}	3	Chatsworth	chatsworth	
2022-12-23 10:15:09.966645+00	2022-12-23 10:15:09.966675+00	{}	4	Dell	dell	
2022-12-23 10:15:10.000676+00	2022-12-23 10:15:10.000702+00	{}	5	Fiberstore	Fiberstore	
2022-12-23 10:15:10.023176+00	2022-12-23 10:15:10.023188+00	{}	6	generic	generic	generic type
2022-12-23 10:15:10.03943+00	2022-12-23 10:15:10.039465+00	{}	7	Juniper	juniper	
2022-12-23 10:15:10.068296+00	2022-12-23 10:15:10.06836+00	{}	8	Lenovo	lenovo	
2022-12-23 10:15:10.093329+00	2022-12-23 10:15:10.093345+00	{}	9	Telect	telect	
2022-12-23 10:15:10.110607+00	2022-12-23 10:15:10.110619+00	{}	10	ZPE	zpe	
\.


--
-- Data for Name: dcim_module; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_module (created, last_updated, custom_field_data, id, local_context_data, serial, asset_tag, comments, device_id, module_bay_id, module_type_id, description, status) FROM stdin;
\.


--
-- Data for Name: dcim_modulebay; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_modulebay (created, last_updated, custom_field_data, id, name, _name, label, "position", description, device_id) FROM stdin;
\.


--
-- Data for Name: dcim_modulebaytemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_modulebaytemplate (created, last_updated, id, name, _name, label, "position", description, device_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_moduletype; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_moduletype (created, last_updated, custom_field_data, id, model, part_number, comments, manufacturer_id, weight, weight_unit, _abs_weight, description) FROM stdin;
\.


--
-- Data for Name: dcim_platform; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_platform (created, last_updated, custom_field_data, id, name, slug, napalm_driver, napalm_args, description, manufacturer_id) FROM stdin;
\.


--
-- Data for Name: dcim_powerfeed; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_powerfeed (created, last_updated, custom_field_data, id, mark_connected, name, status, type, supply, phase, voltage, amperage, max_utilization, available_power, comments, _path_id, cable_id, power_panel_id, rack_id, cable_end, description) FROM stdin;
\.


--
-- Data for Name: dcim_poweroutlet; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_poweroutlet (created, last_updated, custom_field_data, id, name, _name, label, description, mark_connected, type, feed_leg, _path_id, cable_id, device_id, power_port_id, module_id, cable_end) FROM stdin;
\.


--
-- Data for Name: dcim_poweroutlettemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_poweroutlettemplate (created, last_updated, id, name, _name, label, description, type, feed_leg, device_type_id, power_port_id, module_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_powerpanel; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_powerpanel (created, last_updated, custom_field_data, id, name, location_id, site_id, comments, description) FROM stdin;
\.


--
-- Data for Name: dcim_powerport; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_powerport (created, last_updated, custom_field_data, id, name, _name, label, description, mark_connected, type, maximum_draw, allocated_draw, _path_id, cable_id, device_id, module_id, cable_end) FROM stdin;
\.


--
-- Data for Name: dcim_powerporttemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_powerporttemplate (created, last_updated, id, name, _name, label, description, type, maximum_draw, allocated_draw, device_type_id, module_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_rack; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_rack (created, last_updated, custom_field_data, id, name, _name, facility_id, status, serial, asset_tag, type, width, u_height, desc_units, outer_width, outer_depth, outer_unit, comments, location_id, role_id, site_id, tenant_id, weight, max_weight, weight_unit, _abs_weight, _abs_max_weight, mounting_depth, description) FROM stdin;
\.


--
-- Data for Name: dcim_rackreservation; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_rackreservation (created, last_updated, custom_field_data, id, units, description, rack_id, tenant_id, user_id, comments) FROM stdin;
\.


--
-- Data for Name: dcim_rackrole; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_rackrole (created, last_updated, custom_field_data, id, name, slug, color, description) FROM stdin;
\.


--
-- Data for Name: dcim_rearport; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_rearport (created, last_updated, custom_field_data, id, name, _name, label, description, mark_connected, type, positions, cable_id, device_id, color, module_id, cable_end) FROM stdin;
\.


--
-- Data for Name: dcim_rearporttemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_rearporttemplate (created, last_updated, id, name, _name, label, description, type, positions, device_type_id, color, module_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_region; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_region (created, last_updated, custom_field_data, id, name, slug, description, lft, rght, tree_id, level, parent_id) FROM stdin;
\.


--
-- Data for Name: dcim_site; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_site (created, last_updated, custom_field_data, id, name, _name, slug, status, facility, time_zone, description, physical_address, shipping_address, latitude, longitude, comments, group_id, region_id, tenant_id) FROM stdin;
\.


--
-- Data for Name: dcim_site_asns; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_site_asns (id, site_id, asn_id) FROM stdin;
\.


--
-- Data for Name: dcim_sitegroup; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_sitegroup (created, last_updated, custom_field_data, id, name, slug, description, lft, rght, tree_id, level, parent_id) FROM stdin;
\.


--
-- Data for Name: dcim_virtualchassis; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_virtualchassis (created, last_updated, custom_field_data, id, name, domain, master_id, comments, description) FROM stdin;
\.


--
-- Data for Name: dcim_virtualdevicecontext; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_virtualdevicecontext (id, created, last_updated, custom_field_data, description, name, status, identifier, comments, device_id, primary_ip4_id, primary_ip6_id, tenant_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	social_django	association
8	social_django	code
9	social_django	nonce
10	social_django	usersocialauth
11	social_django	partial
12	taggit	tag
13	taggit	taggeditem
14	circuits	circuit
15	circuits	circuittermination
16	circuits	circuittype
17	circuits	provider
18	circuits	providernetwork
19	dcim	cable
20	dcim	cablepath
21	dcim	consoleport
22	dcim	consoleporttemplate
23	dcim	consoleserverport
24	dcim	consoleserverporttemplate
25	dcim	device
26	dcim	devicebay
27	dcim	devicebaytemplate
28	dcim	devicerole
29	dcim	devicetype
30	dcim	frontport
31	dcim	frontporttemplate
32	dcim	interface
33	dcim	interfacetemplate
34	dcim	inventoryitem
35	dcim	location
36	dcim	manufacturer
37	dcim	platform
38	dcim	powerfeed
39	dcim	poweroutlet
40	dcim	poweroutlettemplate
41	dcim	powerpanel
42	dcim	powerport
43	dcim	powerporttemplate
44	dcim	rack
45	dcim	rackreservation
46	dcim	rackrole
47	dcim	rearport
48	dcim	rearporttemplate
49	dcim	region
50	dcim	site
51	dcim	sitegroup
52	dcim	virtualchassis
53	dcim	moduletype
54	dcim	modulebay
55	dcim	module
56	dcim	modulebaytemplate
57	dcim	inventoryitemrole
58	dcim	inventoryitemtemplate
59	ipam	aggregate
60	ipam	ipaddress
61	ipam	prefix
62	ipam	rir
63	ipam	role
64	ipam	routetarget
65	ipam	vrf
66	ipam	vlangroup
67	ipam	vlan
68	ipam	service
69	ipam	iprange
70	ipam	fhrpgroup
71	ipam	fhrpgroupassignment
72	ipam	asn
73	ipam	servicetemplate
74	extras	report
75	extras	script
76	extras	configcontext
77	extras	tag
78	extras	webhook
79	extras	taggeditem
80	extras	objectchange
81	extras	journalentry
82	extras	jobresult
83	extras	imageattachment
84	extras	exporttemplate
85	extras	customlink
86	extras	customfield
87	extras	configrevision
88	tenancy	tenantgroup
89	tenancy	tenant
90	tenancy	contactrole
91	tenancy	contactgroup
92	tenancy	contact
93	tenancy	contactassignment
94	users	admingroup
95	users	adminuser
96	users	userconfig
97	users	token
98	users	objectpermission
99	virtualization	cluster
100	virtualization	clustergroup
101	virtualization	clustertype
102	virtualization	virtualmachine
103	virtualization	vminterface
104	wireless	wirelesslangroup
105	wireless	wirelesslan
106	wireless	wirelesslink
107	django_rq	queue
108	dcim	virtualdevicecontext
109	ipam	l2vpn
110	dcim	cabletermination
111	ipam	l2vpntermination
112	extras	savedfilter
113	extras	cachedvalue
114	extras	branch
115	extras	stagedchange
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-12-23 05:55:57.542187+00
2	auth	0001_initial	2022-12-23 05:55:57.897566+00
3	admin	0001_initial	2022-12-23 05:55:57.977038+00
4	admin	0002_logentry_remove_auto_add	2022-12-23 05:55:57.993486+00
5	admin	0003_logentry_add_action_flag_choices	2022-12-23 05:55:58.009144+00
6	contenttypes	0002_remove_content_type_name	2022-12-23 05:55:58.033284+00
7	auth	0002_alter_permission_name_max_length	2022-12-23 05:55:58.049842+00
8	auth	0003_alter_user_email_max_length	2022-12-23 05:55:58.064989+00
9	auth	0004_alter_user_username_opts	2022-12-23 05:55:58.074453+00
10	auth	0005_alter_user_last_login_null	2022-12-23 05:55:58.084218+00
11	auth	0006_require_contenttypes_0002	2022-12-23 05:55:58.091266+00
12	auth	0007_alter_validators_add_error_messages	2022-12-23 05:55:58.108891+00
13	auth	0008_alter_user_username_max_length	2022-12-23 05:55:58.136389+00
14	auth	0009_alter_user_last_name_max_length	2022-12-23 05:55:58.154429+00
15	auth	0010_alter_group_name_max_length	2022-12-23 05:55:58.180982+00
16	auth	0011_update_proxy_permissions	2022-12-23 05:55:58.198498+00
17	auth	0012_alter_user_first_name_max_length	2022-12-23 05:55:58.216469+00
18	extras	0001_initial	2022-12-23 05:55:59.345325+00
19	tenancy	0001_initial	2022-12-23 05:55:59.591671+00
20	tenancy	0002_tenant_group_optional	2022-12-23 05:55:59.598054+00
21	tenancy	0003_unicode_literals	2022-12-23 05:55:59.603712+00
22	tenancy	0004_tags	2022-12-23 05:55:59.609293+00
23	tenancy	0005_change_logging	2022-12-23 05:55:59.614332+00
24	tenancy	0006_custom_tag_models	2022-12-23 05:55:59.620532+00
25	tenancy	0007_nested_tenantgroups	2022-12-23 05:55:59.626438+00
26	tenancy	0008_nested_tenantgroups_rebuild	2022-12-23 05:55:59.632463+00
27	tenancy	0009_standardize_description	2022-12-23 05:55:59.638488+00
28	tenancy	0010_custom_field_data	2022-12-23 05:55:59.643887+00
29	tenancy	0011_standardize_name_length	2022-12-23 05:55:59.649863+00
30	tenancy	0012_standardize_models	2022-12-23 05:55:59.656012+00
31	tenancy	0002_tenant_ordering	2022-12-23 05:55:59.669479+00
32	dcim	0001_initial	2022-12-23 05:56:01.313638+00
33	dcim	0002_auto_20160622_1821	2022-12-23 05:56:03.726138+00
34	ipam	0001_initial	2022-12-23 05:56:04.840003+00
35	virtualization	0001_virtualization	2022-12-23 05:56:05.781256+00
36	virtualization	0002_virtualmachine_add_status	2022-12-23 05:56:05.787092+00
37	virtualization	0003_cluster_add_site	2022-12-23 05:56:05.794292+00
38	virtualization	0004_virtualmachine_add_role	2022-12-23 05:56:05.802161+00
39	virtualization	0005_django2	2022-12-23 05:56:05.808481+00
40	virtualization	0006_tags	2022-12-23 05:56:05.814941+00
41	virtualization	0007_change_logging	2022-12-23 05:56:05.821025+00
42	virtualization	0008_virtualmachine_local_context_data	2022-12-23 05:56:05.827665+00
43	virtualization	0009_custom_tag_models	2022-12-23 05:56:05.833476+00
44	virtualization	0010_cluster_add_tenant	2022-12-23 05:56:05.840424+00
45	virtualization	0011_3569_virtualmachine_fields	2022-12-23 05:56:05.859174+00
46	virtualization	0012_vm_name_nonunique	2022-12-23 05:56:05.86631+00
47	virtualization	0013_deterministic_ordering	2022-12-23 05:56:05.871586+00
48	virtualization	0014_standardize_description	2022-12-23 05:56:05.8768+00
49	virtualization	0015_vminterface	2022-12-23 05:56:05.883874+00
50	virtualization	0016_replicate_interfaces	2022-12-23 05:56:05.890877+00
51	virtualization	0017_update_jsonfield	2022-12-23 05:56:05.896605+00
52	virtualization	0018_custom_field_data	2022-12-23 05:56:05.905214+00
53	virtualization	0019_standardize_name_length	2022-12-23 05:56:05.911514+00
54	virtualization	0020_standardize_models	2022-12-23 05:56:05.916874+00
55	virtualization	0021_virtualmachine_vcpus_decimal	2022-12-23 05:56:05.921358+00
56	virtualization	0022_vminterface_parent	2022-12-23 05:56:05.925788+00
57	extras	0002_custom_fields	2022-12-23 05:56:07.768194+00
58	extras	0003_exporttemplate_add_description	2022-12-23 05:56:07.77486+00
59	extras	0004_topologymap_change_comma_to_semicolon	2022-12-23 05:56:07.782623+00
60	extras	0005_useraction_add_bulk_create	2022-12-23 05:56:07.789116+00
61	extras	0006_add_imageattachments	2022-12-23 05:56:07.79479+00
62	extras	0007_unicode_literals	2022-12-23 05:56:07.800163+00
63	extras	0008_reports	2022-12-23 05:56:07.805801+00
64	extras	0009_topologymap_type	2022-12-23 05:56:07.810358+00
65	extras	0010_customfield_filter_logic	2022-12-23 05:56:07.81511+00
66	extras	0011_django2	2022-12-23 05:56:07.820577+00
67	extras	0012_webhooks	2022-12-23 05:56:07.826112+00
68	extras	0013_objectchange	2022-12-23 05:56:07.831653+00
69	extras	0014_configcontexts	2022-12-23 05:56:07.837439+00
70	extras	0015_remove_useraction	2022-12-23 05:56:07.842956+00
71	extras	0016_exporttemplate_add_cable	2022-12-23 05:56:07.849121+00
72	extras	0017_exporttemplate_mime_type_length	2022-12-23 05:56:07.855105+00
73	extras	0018_exporttemplate_add_jinja2	2022-12-23 05:56:07.860418+00
74	extras	0019_tag_taggeditem	2022-12-23 05:56:07.865607+00
75	extras	0020_tag_data	2022-12-23 05:56:07.871745+00
76	extras	0021_add_color_comments_changelog_to_tag	2022-12-23 05:56:07.877423+00
77	extras	0022_custom_links	2022-12-23 05:56:07.882216+00
78	extras	0023_fix_tag_sequences	2022-12-23 05:56:07.888268+00
79	extras	0024_scripts	2022-12-23 05:56:07.893611+00
80	extras	0025_objectchange_time_index	2022-12-23 05:56:07.899881+00
81	extras	0026_webhook_ca_file_path	2022-12-23 05:56:07.906757+00
82	extras	0027_webhook_additional_headers	2022-12-23 05:56:07.912744+00
83	extras	0028_remove_topology_maps	2022-12-23 05:56:07.919159+00
84	extras	0029_3569_customfield_fields	2022-12-23 05:56:07.924691+00
85	extras	0030_3569_objectchange_fields	2022-12-23 05:56:07.931649+00
86	extras	0031_3569_exporttemplate_fields	2022-12-23 05:56:07.937005+00
87	extras	0032_3569_webhook_fields	2022-12-23 05:56:07.942628+00
88	extras	0033_graph_type_template_language	2022-12-23 05:56:07.949274+00
89	extras	0034_configcontext_tags	2022-12-23 05:56:07.954893+00
90	extras	0035_deterministic_ordering	2022-12-23 05:56:07.965862+00
91	extras	0036_contenttype_filters_to_q_objects	2022-12-23 05:56:07.973981+00
92	extras	0037_configcontexts_clusters	2022-12-23 05:56:07.980968+00
93	extras	0038_webhook_template_support	2022-12-23 05:56:07.987531+00
94	extras	0039_update_features_content_types	2022-12-23 05:56:07.994113+00
95	extras	0040_standardize_description	2022-12-23 05:56:08.000103+00
96	extras	0041_tag_description	2022-12-23 05:56:08.007588+00
97	extras	0042_customfield_manager	2022-12-23 05:56:08.01335+00
98	extras	0043_report	2022-12-23 05:56:08.018457+00
99	extras	0044_jobresult	2022-12-23 05:56:08.022755+00
100	extras	0045_configcontext_changelog	2022-12-23 05:56:08.027089+00
101	extras	0046_update_jsonfield	2022-12-23 05:56:08.032843+00
102	extras	0047_tag_ordering	2022-12-23 05:56:08.038677+00
103	extras	0048_exporttemplate_remove_template_language	2022-12-23 05:56:08.044258+00
104	extras	0049_remove_graph	2022-12-23 05:56:08.050825+00
105	extras	0050_customfield_changes	2022-12-23 05:56:08.05748+00
106	extras	0051_migrate_customfields	2022-12-23 05:56:08.063672+00
107	extras	0052_customfield_cleanup	2022-12-23 05:56:08.069764+00
108	extras	0053_rename_webhook_obj_type	2022-12-23 05:56:08.075862+00
109	extras	0054_standardize_models	2022-12-23 05:56:08.081625+00
110	extras	0055_objectchange_data	2022-12-23 05:56:08.086769+00
111	extras	0056_extend_configcontext	2022-12-23 05:56:08.100287+00
112	extras	0057_customlink_rename_fields	2022-12-23 05:56:08.106365+00
113	extras	0058_journalentry	2022-12-23 05:56:08.112801+00
114	extras	0059_exporttemplate_as_attachment	2022-12-23 05:56:08.118292+00
115	extras	0060_customlink_button_class	2022-12-23 05:56:08.145228+00
116	extras	0061_extras_change_logging	2022-12-23 05:56:08.303311+00
117	extras	0062_clear_secrets_changelog	2022-12-23 05:56:08.374987+00
118	tenancy	0003_contacts	2022-12-23 05:56:08.875362+00
119	tenancy	0004_extend_tag_support	2022-12-23 05:56:09.198361+00
120	dcim	0003_auto_20160628_1721	2022-12-23 05:56:15.559337+00
121	dcim	0004_auto_20160701_2049	2022-12-23 05:56:15.564875+00
122	dcim	0005_auto_20160706_1722	2022-12-23 05:56:15.569543+00
123	dcim	0006_add_device_primary_ip4_ip6	2022-12-23 05:56:15.574121+00
124	dcim	0007_device_copy_primary_ip	2022-12-23 05:56:15.577911+00
125	dcim	0008_device_remove_primary_ip	2022-12-23 05:56:15.5817+00
126	dcim	0009_site_32bit_asn_support	2022-12-23 05:56:15.58608+00
127	dcim	0010_devicebay_installed_device_set_null	2022-12-23 05:56:15.589659+00
128	dcim	0011_devicetype_part_number	2022-12-23 05:56:15.59317+00
129	dcim	0012_site_rack_device_add_tenant	2022-12-23 05:56:15.596963+00
130	dcim	0013_add_interface_form_factors	2022-12-23 05:56:15.601282+00
131	dcim	0014_rack_add_type_width	2022-12-23 05:56:15.605254+00
132	dcim	0015_rack_add_u_height_validator	2022-12-23 05:56:15.609601+00
133	dcim	0016_module_add_manufacturer	2022-12-23 05:56:15.613774+00
134	dcim	0017_rack_add_role	2022-12-23 05:56:15.617385+00
135	dcim	0018_device_add_asset_tag	2022-12-23 05:56:15.621122+00
136	dcim	0019_new_iface_form_factors	2022-12-23 05:56:15.624551+00
137	dcim	0020_rack_desc_units	2022-12-23 05:56:15.628138+00
138	dcim	0021_add_ff_flexstack	2022-12-23 05:56:15.631257+00
139	dcim	0022_color_names_to_rgb	2022-12-23 05:56:15.635619+00
140	dcim	0023_devicetype_comments	2022-12-23 05:56:15.640567+00
141	dcim	0024_site_add_contact_fields	2022-12-23 05:56:15.645414+00
142	dcim	0025_devicetype_add_interface_ordering	2022-12-23 05:56:15.653678+00
143	dcim	0026_add_rack_reservations	2022-12-23 05:56:15.657545+00
144	dcim	0027_device_add_site	2022-12-23 05:56:15.662179+00
145	dcim	0028_device_copy_rack_to_site	2022-12-23 05:56:15.667162+00
146	dcim	0029_allow_rackless_devices	2022-12-23 05:56:15.671763+00
147	dcim	0030_interface_add_lag	2022-12-23 05:56:15.677108+00
148	dcim	0031_regions	2022-12-23 05:56:15.681522+00
149	dcim	0032_device_increase_name_length	2022-12-23 05:56:15.68537+00
150	dcim	0033_rackreservation_rack_editable	2022-12-23 05:56:15.689645+00
151	dcim	0034_rename_module_to_inventoryitem	2022-12-23 05:56:15.694524+00
152	dcim	0035_device_expand_status_choices	2022-12-23 05:56:15.699137+00
153	dcim	0036_add_ff_juniper_vcp	2022-12-23 05:56:15.703738+00
154	dcim	0037_unicode_literals	2022-12-23 05:56:15.708722+00
155	dcim	0038_wireless_interfaces	2022-12-23 05:56:15.713344+00
156	dcim	0039_interface_add_enabled_mtu	2022-12-23 05:56:15.717752+00
157	dcim	0040_inventoryitem_add_asset_tag_description	2022-12-23 05:56:15.722051+00
158	dcim	0041_napalm_integration	2022-12-23 05:56:15.725917+00
159	dcim	0042_interface_ff_10ge_cx4	2022-12-23 05:56:15.729459+00
160	dcim	0043_device_component_name_lengths	2022-12-23 05:56:15.733737+00
161	dcim	0044_virtualization	2022-12-23 05:56:15.738561+00
162	dcim	0045_devicerole_vm_role	2022-12-23 05:56:15.743512+00
163	dcim	0046_rack_lengthen_facility_id	2022-12-23 05:56:15.748849+00
164	dcim	0047_more_100ge_form_factors	2022-12-23 05:56:15.754207+00
165	dcim	0048_rack_serial	2022-12-23 05:56:15.759447+00
166	dcim	0049_rackreservation_change_user	2022-12-23 05:56:15.763733+00
167	dcim	0050_interface_vlan_tagging	2022-12-23 05:56:15.769674+00
168	dcim	0051_rackreservation_tenant	2022-12-23 05:56:15.774953+00
169	dcim	0052_virtual_chassis	2022-12-23 05:56:15.781037+00
170	dcim	0053_platform_manufacturer	2022-12-23 05:56:15.799858+00
171	dcim	0054_site_status_timezone_description	2022-12-23 05:56:15.809021+00
172	dcim	0055_virtualchassis_ordering	2022-12-23 05:56:15.815113+00
173	dcim	0056_django2	2022-12-23 05:56:15.827692+00
174	dcim	0057_tags	2022-12-23 05:56:15.841711+00
175	dcim	0058_relax_rack_naming_constraints	2022-12-23 05:56:15.847455+00
176	dcim	0059_site_latitude_longitude	2022-12-23 05:56:15.851517+00
177	dcim	0060_change_logging	2022-12-23 05:56:15.855693+00
178	dcim	0061_platform_napalm_args	2022-12-23 05:56:15.860913+00
179	dcim	0062_interface_mtu	2022-12-23 05:56:15.867528+00
180	dcim	0063_device_local_context_data	2022-12-23 05:56:15.874848+00
181	dcim	0064_remove_platform_rpc_client	2022-12-23 05:56:15.881821+00
182	dcim	0065_front_rear_ports	2022-12-23 05:56:15.88746+00
183	dcim	0066_cables	2022-12-23 05:56:15.89206+00
184	dcim	0067_device_type_remove_qualifiers	2022-12-23 05:56:15.895756+00
185	dcim	0068_rack_new_fields	2022-12-23 05:56:15.899303+00
186	dcim	0069_deprecate_nullablecharfield	2022-12-23 05:56:15.903622+00
187	dcim	0070_custom_tag_models	2022-12-23 05:56:15.907583+00
188	dcim	0071_device_components_add_description	2022-12-23 05:56:15.910808+00
189	dcim	0072_powerfeeds	2022-12-23 05:56:15.914629+00
190	dcim	0073_interface_form_factor_to_type	2022-12-23 05:56:15.918425+00
191	dcim	0074_increase_field_length_platform_name_slug	2022-12-23 05:56:15.921828+00
192	dcim	0075_cable_devices	2022-12-23 05:56:15.925535+00
193	dcim	0076_console_port_types	2022-12-23 05:56:15.928774+00
194	dcim	0077_power_types	2022-12-23 05:56:15.932058+00
195	dcim	0078_3569_site_fields	2022-12-23 05:56:15.93514+00
196	dcim	0079_3569_rack_fields	2022-12-23 05:56:15.938538+00
197	dcim	0080_3569_devicetype_fields	2022-12-23 05:56:15.942047+00
198	dcim	0081_3569_device_fields	2022-12-23 05:56:15.946833+00
199	dcim	0082_3569_interface_fields	2022-12-23 05:56:15.951083+00
200	dcim	0082_3569_port_fields	2022-12-23 05:56:15.954709+00
201	dcim	0083_3569_cable_fields	2022-12-23 05:56:15.959074+00
202	dcim	0084_3569_powerfeed_fields	2022-12-23 05:56:15.963373+00
203	dcim	0085_3569_poweroutlet_fields	2022-12-23 05:56:15.967091+00
204	dcim	0086_device_name_nonunique	2022-12-23 05:56:15.971164+00
205	dcim	0087_role_descriptions	2022-12-23 05:56:15.974723+00
206	dcim	0088_powerfeed_available_power	2022-12-23 05:56:15.978539+00
207	dcim	0089_deterministic_ordering	2022-12-23 05:56:15.9823+00
208	dcim	0090_cable_termination_models	2022-12-23 05:56:15.986833+00
209	dcim	0091_interface_type_other	2022-12-23 05:56:15.991466+00
210	dcim	0092_fix_rack_outer_unit	2022-12-23 05:56:15.996274+00
211	dcim	0093_device_component_ordering	2022-12-23 05:56:16.0011+00
212	dcim	0094_device_component_template_ordering	2022-12-23 05:56:16.00497+00
213	dcim	0095_primary_model_ordering	2022-12-23 05:56:16.009497+00
214	dcim	0096_interface_ordering	2022-12-23 05:56:16.014357+00
215	dcim	0097_interfacetemplate_type_other	2022-12-23 05:56:16.018487+00
216	dcim	0098_devicetype_images	2022-12-23 05:56:16.023177+00
217	dcim	0099_powerfeed_negative_voltage	2022-12-23 05:56:16.027586+00
218	dcim	0100_mptt_remove_indexes	2022-12-23 05:56:16.031639+00
219	dcim	0101_nested_rackgroups	2022-12-23 05:56:16.035596+00
220	dcim	0102_nested_rackgroups_rebuild	2022-12-23 05:56:16.041416+00
221	dcim	0103_standardize_description	2022-12-23 05:56:16.046722+00
222	dcim	0104_correct_infiniband_types	2022-12-23 05:56:16.051986+00
223	dcim	0105_interface_name_collation	2022-12-23 05:56:16.057563+00
224	dcim	0106_role_default_color	2022-12-23 05:56:16.063172+00
225	dcim	0107_component_labels	2022-12-23 05:56:16.067838+00
226	dcim	0108_add_tags	2022-12-23 05:56:16.072783+00
227	dcim	0109_interface_remove_vm	2022-12-23 05:56:16.077675+00
228	dcim	0110_virtualchassis_name	2022-12-23 05:56:16.082275+00
229	dcim	0111_component_template_description	2022-12-23 05:56:16.08698+00
230	dcim	0112_standardize_components	2022-12-23 05:56:16.091531+00
231	dcim	0113_nullbooleanfield_to_booleanfield	2022-12-23 05:56:16.095183+00
232	dcim	0114_update_jsonfield	2022-12-23 05:56:16.099363+00
233	dcim	0115_rackreservation_order	2022-12-23 05:56:16.102945+00
234	dcim	0116_rearport_max_positions	2022-12-23 05:56:16.107708+00
235	dcim	0117_custom_field_data	2022-12-23 05:56:16.112167+00
236	dcim	0118_inventoryitem_mptt	2022-12-23 05:56:16.117188+00
237	dcim	0119_inventoryitem_mptt_rebuild	2022-12-23 05:56:16.124064+00
238	dcim	0120_cache_cable_peer	2022-12-23 05:56:16.12945+00
239	dcim	0121_cablepath	2022-12-23 05:56:16.137083+00
240	dcim	0122_standardize_name_length	2022-12-23 05:56:16.149127+00
241	dcim	0123_standardize_models	2022-12-23 05:56:16.158676+00
242	dcim	0124_mark_connected	2022-12-23 05:56:16.165677+00
243	dcim	0125_console_port_speed	2022-12-23 05:56:16.171756+00
244	dcim	0126_rename_rackgroup_location	2022-12-23 05:56:16.179586+00
245	dcim	0127_device_location	2022-12-23 05:56:16.188241+00
246	dcim	0128_device_location_populate	2022-12-23 05:56:16.194251+00
247	dcim	0129_interface_parent	2022-12-23 05:56:16.199741+00
248	dcim	0130_sitegroup	2022-12-23 05:56:16.206303+00
249	ipam	0002_vrf_add_enforce_unique	2022-12-23 05:56:18.008275+00
250	ipam	0003_ipam_add_vlangroups	2022-12-23 05:56:18.01216+00
251	ipam	0004_ipam_vlangroup_uniqueness	2022-12-23 05:56:18.017004+00
252	ipam	0005_auto_20160725_1842	2022-12-23 05:56:18.022617+00
253	ipam	0006_vrf_vlan_add_tenant	2022-12-23 05:56:18.029025+00
254	ipam	0007_prefix_ipaddress_add_tenant	2022-12-23 05:56:18.033185+00
255	ipam	0008_prefix_change_order	2022-12-23 05:56:18.037334+00
256	ipam	0009_ipaddress_add_status	2022-12-23 05:56:18.041349+00
257	ipam	0010_ipaddress_help_texts	2022-12-23 05:56:18.045462+00
258	ipam	0011_rir_add_is_private	2022-12-23 05:56:18.049436+00
259	ipam	0012_services	2022-12-23 05:56:18.053048+00
260	ipam	0013_prefix_add_is_pool	2022-12-23 05:56:18.057145+00
261	ipam	0014_ipaddress_status_add_deprecated	2022-12-23 05:56:18.062046+00
262	ipam	0015_global_vlans	2022-12-23 05:56:18.067426+00
263	ipam	0016_unicode_literals	2022-12-23 05:56:18.072846+00
264	ipam	0017_ipaddress_roles	2022-12-23 05:56:18.078551+00
265	ipam	0018_remove_service_uniqueness_constraint	2022-12-23 05:56:18.083763+00
266	ipam	0019_virtualization	2022-12-23 05:56:18.088319+00
267	ipam	0020_ipaddress_add_role_carp	2022-12-23 05:56:18.094002+00
268	ipam	0021_vrf_ordering	2022-12-23 05:56:18.099455+00
269	ipam	0022_tags	2022-12-23 05:56:18.10496+00
270	ipam	0023_change_logging	2022-12-23 05:56:18.110234+00
271	ipam	0024_vrf_allow_null_rd	2022-12-23 05:56:18.115483+00
272	ipam	0025_custom_tag_models	2022-12-23 05:56:18.12128+00
273	ipam	0026_prefix_ordering_vrf_nulls_first	2022-12-23 05:56:18.126385+00
274	ipam	0027_ipaddress_add_dns_name	2022-12-23 05:56:18.130658+00
275	ipam	0028_3569_prefix_fields	2022-12-23 05:56:18.135512+00
276	ipam	0029_3569_ipaddress_fields	2022-12-23 05:56:18.1438+00
277	ipam	0030_3569_vlan_fields	2022-12-23 05:56:18.150871+00
278	ipam	0031_3569_service_fields	2022-12-23 05:56:18.156926+00
279	ipam	0032_role_description	2022-12-23 05:56:18.162362+00
280	ipam	0033_deterministic_ordering	2022-12-23 05:56:18.169223+00
281	ipam	0034_fix_ipaddress_status_dhcp	2022-12-23 05:56:18.174587+00
282	ipam	0035_drop_ip_family	2022-12-23 05:56:18.182746+00
283	ipam	0036_standardize_description	2022-12-23 05:56:18.187958+00
284	ipam	0037_ipaddress_assignment	2022-12-23 05:56:18.196322+00
285	ipam	0038_custom_field_data	2022-12-23 05:56:18.206204+00
286	ipam	0039_service_ports_array	2022-12-23 05:56:18.214802+00
287	ipam	0040_service_drop_port	2022-12-23 05:56:18.221777+00
288	ipam	0041_routetarget	2022-12-23 05:56:18.227918+00
289	ipam	0042_standardize_name_length	2022-12-23 05:56:18.23377+00
290	ipam	0043_add_tenancy_to_aggregates	2022-12-23 05:56:18.239325+00
291	ipam	0044_standardize_models	2022-12-23 05:56:18.244832+00
292	ipam	0045_vlangroup_scope	2022-12-23 05:56:18.24983+00
293	ipam	0046_set_vlangroup_scope_types	2022-12-23 05:56:18.254859+00
294	ipam	0047_prefix_depth_children	2022-12-23 05:56:18.53157+00
295	ipam	0048_prefix_populate_depth_children	2022-12-23 05:56:18.609931+00
296	ipam	0049_prefix_mark_utilized	2022-12-23 05:56:18.666354+00
297	ipam	0050_iprange	2022-12-23 05:56:18.851643+00
298	ipam	0051_extend_tag_support	2022-12-23 05:56:19.049449+00
299	extras	0063_webhook_conditions	2022-12-23 05:56:19.08845+00
300	extras	0064_configrevision	2022-12-23 05:56:19.308873+00
301	ipam	0052_fhrpgroup	2022-12-23 05:56:19.651359+00
302	ipam	0053_asn_model	2022-12-23 05:56:19.817978+00
303	dcim	0131_consoleport_speed	2022-12-23 05:56:20.179475+00
304	dcim	0132_cable_length	2022-12-23 05:56:20.37007+00
305	dcim	0133_port_colors	2022-12-23 05:56:20.726369+00
306	dcim	0134_interface_wwn_bridge	2022-12-23 05:56:20.907443+00
307	dcim	0135_tenancy_extensions	2022-12-23 05:56:21.102651+00
308	dcim	0136_device_airflow	2022-12-23 05:56:21.406781+00
309	dcim	0137_relax_uniqueness_constraints	2022-12-23 05:56:22.417329+00
310	dcim	0138_extend_tag_support	2022-12-23 05:56:23.067507+00
311	dcim	0139_rename_cable_peer	2022-12-23 05:56:24.521821+00
312	wireless	0001_wireless	2022-12-23 05:56:25.103478+00
313	dcim	0140_wireless	2022-12-23 05:56:25.865162+00
314	dcim	0141_asn_model	2022-12-23 05:56:26.033007+00
315	dcim	0142_rename_128gfc_qsfp28	2022-12-23 05:56:26.115975+00
316	dcim	0143_remove_primary_for_related_name	2022-12-23 05:56:26.494754+00
317	dcim	0144_fix_cable_abs_length	2022-12-23 05:56:26.571998+00
318	dcim	0145_site_remove_deprecated_fields	2022-12-23 05:56:27.014654+00
319	ipam	0054_vlangroup_min_max_vids	2022-12-23 05:56:27.166343+00
320	virtualization	0023_virtualmachine_natural_ordering	2022-12-23 05:56:27.358196+00
321	virtualization	0024_cluster_relax_uniqueness	2022-12-23 05:56:27.752189+00
322	virtualization	0025_extend_tag_support	2022-12-23 05:56:27.913004+00
323	virtualization	0026_vminterface_bridge	2022-12-23 05:56:28.028869+00
324	extras	0065_imageattachment_change_logging	2022-12-23 05:56:28.069757+00
325	extras	0066_customfield_name_validation	2022-12-23 05:56:28.110203+00
326	extras	0067_customfield_min_max_values	2022-12-23 05:56:28.192833+00
327	extras	0068_configcontext_cluster_types	2022-12-23 05:56:28.371667+00
328	extras	0069_custom_object_field	2022-12-23 05:56:28.650032+00
329	extras	0070_customlink_enabled	2022-12-23 05:56:28.692205+00
330	ipam	0055_servicetemplate	2022-12-23 05:56:28.857093+00
331	ipam	0056_standardize_id_fields	2022-12-23 05:56:30.466135+00
332	ipam	0057_created_datetimefield	2022-12-23 05:56:33.200816+00
333	circuits	0001_initial	2022-12-23 05:56:33.523309+00
334	circuits	0002_auto_20160622_1821	2022-12-23 05:56:35.442875+00
335	circuits	0003_provider_32bit_asn_support	2022-12-23 05:56:35.450729+00
336	circuits	0004_circuit_add_tenant	2022-12-23 05:56:35.457731+00
337	circuits	0005_circuit_add_upstream_speed	2022-12-23 05:56:35.465101+00
338	circuits	0006_terminations	2022-12-23 05:56:35.472954+00
339	circuits	0007_circuit_add_description	2022-12-23 05:56:35.480628+00
340	circuits	0008_circuittermination_interface_protect_on_delete	2022-12-23 05:56:35.487707+00
341	circuits	0009_unicode_literals	2022-12-23 05:56:35.494638+00
342	circuits	0010_circuit_status	2022-12-23 05:56:35.501776+00
343	circuits	0011_tags	2022-12-23 05:56:35.508211+00
344	circuits	0012_change_logging	2022-12-23 05:56:35.515255+00
345	circuits	0013_cables	2022-12-23 05:56:35.522213+00
346	circuits	0014_circuittermination_description	2022-12-23 05:56:35.529947+00
347	circuits	0015_custom_tag_models	2022-12-23 05:56:35.537283+00
348	circuits	0016_3569_circuit_fields	2022-12-23 05:56:35.544471+00
349	circuits	0017_circuittype_description	2022-12-23 05:56:35.551552+00
350	circuits	0018_standardize_description	2022-12-23 05:56:35.558797+00
351	circuits	0019_nullbooleanfield_to_booleanfield	2022-12-23 05:56:35.566359+00
352	circuits	0020_custom_field_data	2022-12-23 05:56:35.573528+00
353	circuits	0021_cache_cable_peer	2022-12-23 05:56:35.580544+00
354	circuits	0022_cablepath	2022-12-23 05:56:35.587009+00
355	circuits	0023_circuittermination_port_speed_optional	2022-12-23 05:56:35.594266+00
356	circuits	0024_standardize_name_length	2022-12-23 05:56:35.600842+00
357	circuits	0025_standardize_models	2022-12-23 05:56:35.608125+00
358	circuits	0026_mark_connected	2022-12-23 05:56:35.614773+00
359	circuits	0027_providernetwork	2022-12-23 05:56:35.621335+00
360	circuits	0028_cache_circuit_terminations	2022-12-23 05:56:35.627955+00
361	circuits	0029_circuit_tracing	2022-12-23 05:56:35.635055+00
362	circuits	0003_extend_tag_support	2022-12-23 05:56:35.907766+00
363	circuits	0004_rename_cable_peer	2022-12-23 05:56:36.028002+00
364	circuits	0032_provider_service_id	2022-12-23 05:56:36.10145+00
365	circuits	0033_standardize_id_fields	2022-12-23 05:56:36.835564+00
366	circuits	0034_created_datetimefield	2022-12-23 05:56:37.688528+00
367	circuits	0035_provider_asns	2022-12-23 05:56:38.033286+00
368	dcim	0146_modules	2022-12-23 05:56:41.990442+00
369	dcim	0147_inventoryitemrole	2022-12-23 05:56:42.474406+00
370	dcim	0148_inventoryitem_component	2022-12-23 05:56:42.659588+00
371	dcim	0149_inventoryitem_templates	2022-12-23 05:56:42.989446+00
372	dcim	0150_interface_vrf	2022-12-23 05:56:43.169645+00
373	dcim	0151_interface_speed_duplex	2022-12-23 05:56:43.492859+00
374	dcim	0152_standardize_id_fields	2022-12-23 05:56:50.036999+00
375	dcim	0153_created_datetimefield	2022-12-23 05:56:57.874209+00
376	django_rq	0001_initial	2022-12-23 05:56:57.907537+00
377	extras	0071_standardize_id_fields	2022-12-23 05:56:59.005681+00
378	extras	0072_created_datetimefield	2022-12-23 05:57:00.016078+00
379	extras	0073_journalentry_tags_custom_fields	2022-12-23 05:57:00.163338+00
380	sessions	0001_initial	2022-12-23 05:57:00.249964+00
381	default	0001_initial	2022-12-23 05:57:00.61653+00
382	social_auth	0001_initial	2022-12-23 05:57:00.625169+00
383	default	0002_add_related_name	2022-12-23 05:57:00.721114+00
384	social_auth	0002_add_related_name	2022-12-23 05:57:00.723622+00
385	default	0003_alter_email_max_length	2022-12-23 05:57:00.736435+00
386	social_auth	0003_alter_email_max_length	2022-12-23 05:57:00.737568+00
387	default	0004_auto_20160423_0400	2022-12-23 05:57:00.762438+00
388	social_auth	0004_auto_20160423_0400	2022-12-23 05:57:00.765318+00
389	social_auth	0005_auto_20160727_2333	2022-12-23 05:57:00.79666+00
390	social_django	0006_partial	2022-12-23 05:57:00.879389+00
391	social_django	0007_code_timestamp	2022-12-23 05:57:00.924268+00
392	social_django	0008_partial_timestamp	2022-12-23 05:57:00.963803+00
393	social_django	0009_auto_20191118_0520	2022-12-23 05:57:00.995846+00
394	social_django	0010_uid_db_index	2022-12-23 05:57:01.050385+00
395	taggit	0001_initial	2022-12-23 05:57:01.310979+00
396	taggit	0002_auto_20150616_2121	2022-12-23 05:57:01.580169+00
397	taggit	0003_taggeditem_add_unique_index	2022-12-23 05:57:01.645598+00
398	taggit	0004_alter_taggeditem_content_type_alter_taggeditem_tag	2022-12-23 05:57:01.828053+00
399	tenancy	0005_standardize_id_fields	2022-12-23 05:57:02.605977+00
400	tenancy	0006_created_datetimefield	2022-12-23 05:57:03.844022+00
401	tenancy	0007_contact_link	2022-12-23 05:57:03.925073+00
402	users	0001_api_tokens	2022-12-23 05:57:04.753426+00
403	users	0002_unicode_literals	2022-12-23 05:57:04.760932+00
404	users	0003_token_permissions	2022-12-23 05:57:04.769652+00
405	users	0004_standardize_description	2022-12-23 05:57:04.77739+00
406	users	0005_userconfig	2022-12-23 05:57:04.784818+00
407	users	0006_create_userconfigs	2022-12-23 05:57:04.791822+00
408	users	0007_proxy_group_user	2022-12-23 05:57:04.799323+00
409	users	0008_objectpermission	2022-12-23 05:57:04.808007+00
410	users	0009_replicate_permissions	2022-12-23 05:57:04.813924+00
411	users	0010_update_jsonfield	2022-12-23 05:57:04.820735+00
412	users	0011_standardize_models	2022-12-23 05:57:04.828933+00
413	users	0002_standardize_id_fields	2022-12-23 05:57:04.964592+00
414	virtualization	0027_standardize_id_fields	2022-12-23 05:57:05.594594+00
415	virtualization	0028_vminterface_vrf	2022-12-23 05:57:05.737121+00
416	virtualization	0029_created_datetimefield	2022-12-23 05:57:06.960278+00
417	wireless	0002_standardize_id_fields	2022-12-23 05:57:07.240054+00
418	wireless	0003_created_datetimefield	2022-12-23 05:57:07.99089+00
419	social_django	0005_auto_20160727_2333	2022-12-23 05:57:08.009251+00
420	social_django	0001_initial	2022-12-23 05:57:08.015253+00
421	social_django	0004_auto_20160423_0400	2022-12-23 05:57:08.021745+00
422	social_django	0003_alter_email_max_length	2022-12-23 05:57:08.028619+00
423	social_django	0002_add_related_name	2022-12-23 05:57:08.036058+00
424	circuits	0001_squashed	2022-12-23 05:57:08.043739+00
425	circuits	0002_squashed_0029	2022-12-23 05:57:08.051216+00
426	dcim	0002_squashed	2022-12-23 05:57:08.05913+00
427	dcim	0003_squashed_0130	2022-12-23 05:57:08.067275+00
428	dcim	0001_squashed	2022-12-23 05:57:08.074821+00
429	ipam	0002_squashed_0046	2022-12-23 05:57:08.082063+00
430	ipam	0001_squashed	2022-12-23 05:57:08.089104+00
431	extras	0001_squashed	2022-12-23 05:57:08.09621+00
432	extras	0002_squashed_0059	2022-12-23 05:57:08.102778+00
433	tenancy	0001_squashed_0012	2022-12-23 05:57:08.108906+00
434	users	0001_squashed_0011	2022-12-23 05:57:08.114195+00
435	virtualization	0001_squashed_0022	2022-12-23 05:57:08.120002+00
436	dcim	0154_half_height_rack_units	2022-12-23 10:07:17.738548+00
437	dcim	0155_interface_poe_mode_type	2022-12-23 10:07:17.975897+00
438	dcim	0156_location_status	2022-12-23 10:07:18.052943+00
439	dcim	0157_new_cabling_models	2022-12-23 10:07:19.572592+00
440	dcim	0158_populate_cable_terminations	2022-12-23 10:07:19.668045+00
441	dcim	0159_populate_cable_paths	2022-12-23 10:07:19.759346+00
442	circuits	0036_circuit_termination_date_tags_custom_fields	2022-12-23 10:07:20.031974+00
443	circuits	0037_new_cabling_models	2022-12-23 10:07:20.119078+00
444	dcim	0160_populate_cable_ends	2022-12-23 10:07:20.229282+00
445	circuits	0038_cabling_cleanup	2022-12-23 10:07:20.637297+00
446	circuits	0039_unique_constraints	2022-12-23 10:07:21.190356+00
447	circuits	0040_provider_remove_deprecated_fields	2022-12-23 10:07:21.73542+00
448	circuits	0041_standardize_description_comments	2022-12-23 10:07:21.832264+00
449	tenancy	0008_unique_constraints	2022-12-23 10:07:22.476037+00
450	tenancy	0009_standardize_description_comments	2022-12-23 10:07:22.555277+00
451	ipam	0058_ipaddress_nat_inside_nonunique	2022-12-23 10:07:22.686965+00
452	extras	0074_customfield_extensions	2022-12-23 10:07:22.796557+00
453	extras	0075_configcontext_locations	2022-12-23 10:07:22.976315+00
454	ipam	0059_l2vpn	2022-12-23 10:07:23.623308+00
455	ipam	0060_alter_l2vpn_slug	2022-12-23 10:07:24.012927+00
456	ipam	0061_fhrpgroup_name	2022-12-23 10:07:24.095296+00
457	ipam	0062_unique_constraints	2022-12-23 10:07:24.714855+00
458	ipam	0063_standardize_description_comments	2022-12-23 10:07:25.995995+00
459	extras	0076_tag_slug_unicode	2022-12-23 10:07:26.091812+00
460	extras	0077_customlink_extend_text_and_url	2022-12-23 10:07:26.17019+00
461	extras	0078_unique_constraints	2022-12-23 10:07:26.373592+00
462	extras	0079_scheduled_jobs	2022-12-23 10:07:26.535991+00
463	extras	0080_customlink_content_types	2022-12-23 10:07:27.327966+00
464	extras	0081_exporttemplate_content_types	2022-12-23 10:07:27.786971+00
465	extras	0082_savedfilter	2022-12-23 10:07:28.072424+00
466	dcim	0161_cabling_cleanup	2022-12-23 10:07:31.499113+00
467	dcim	0162_unique_constraints	2022-12-23 10:07:38.364246+00
468	dcim	0163_weight_fields	2022-12-23 10:07:39.153883+00
469	dcim	0164_rack_mounting_depth	2022-12-23 10:07:39.245139+00
470	dcim	0165_standardize_description_comments	2022-12-23 10:07:40.633123+00
471	dcim	0166_virtualdevicecontext	2022-12-23 10:07:41.241799+00
472	dcim	0167_module_status	2022-12-23 10:07:42.052081+00
473	wireless	0004_wireless_tenancy	2022-12-23 10:07:42.323438+00
474	wireless	0005_wirelesslink_interface_types	2022-12-23 10:07:42.523699+00
475	wireless	0006_unique_constraints	2022-12-23 10:07:43.105644+00
476	wireless	0007_standardize_description_comments	2022-12-23 10:07:43.265715+00
477	wireless	0008_wirelesslan_status	2022-12-23 10:07:43.347506+00
478	virtualization	0030_cluster_status	2022-12-23 10:07:43.432165+00
479	virtualization	0031_virtualmachine_site_device	2022-12-23 10:07:43.82538+00
480	virtualization	0032_virtualmachine_update_sites	2022-12-23 10:07:43.935915+00
481	virtualization	0033_unique_constraints	2022-12-23 10:07:44.917837+00
482	virtualization	0034_standardize_description_comments	2022-12-23 10:07:45.306974+00
483	extras	0083_search	2022-12-23 10:07:45.787383+00
484	extras	0084_staging	2022-12-23 10:07:46.140166+00
485	taggit	0005_auto_20220424_2025	2022-12-23 10:07:46.157387+00
486	users	0003_token_allowed_ips_last_used	2022-12-23 10:07:46.220982+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: extras_branch; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_branch (id, created, last_updated, name, description, user_id) FROM stdin;
\.


--
-- Data for Name: extras_cachedvalue; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_cachedvalue (id, "timestamp", object_id, field, type, value, weight, object_type_id) FROM stdin;
b7e7568a-95dc-4cfa-9108-981c687da218	2022-12-23 10:15:09.866723+00	1	name	str	APC	100	36
c031eb9d-2810-47ba-9cef-60d5f958d3cf	2022-12-23 10:15:09.866798+00	1	slug	str	apc	110	36
4b724663-c8fe-43eb-8b25-e1974e43a778	2022-12-23 10:15:09.919035+00	2	name	str	Arista	100	36
831bbea3-08ae-42fe-ad88-120ca5a2350b	2022-12-23 10:15:09.919257+00	2	slug	str	arista	110	36
461a7f24-a83d-49e6-860d-9199a9e3abb6	2022-12-23 10:15:09.93788+00	3	name	str	Chatsworth	100	36
7fa1812c-2c1e-4fc7-9971-d14ad4631fb4	2022-12-23 10:15:09.937917+00	3	slug	str	chatsworth	110	36
2cdd4fdf-a2a3-46b3-af8e-531b8a45c2cf	2022-12-23 10:15:09.969769+00	4	name	str	Dell	100	36
d4779417-2e42-408d-866b-4914636db7e5	2022-12-23 10:15:09.969848+00	4	slug	str	dell	110	36
5d47714d-08d0-4377-a50c-de46a301cc2d	2022-12-23 10:15:10.003708+00	5	name	str	Fiberstore	100	36
da410ab4-b126-4467-ae80-1fabade412c8	2022-12-23 10:15:10.003777+00	5	slug	str	Fiberstore	110	36
d95fd041-c090-4b85-878e-70455a71bc7b	2022-12-23 10:15:10.024504+00	6	name	str	generic	100	36
3790b27a-868b-4ecd-aa21-aa10a7b69519	2022-12-23 10:15:10.024538+00	6	slug	str	generic	110	36
7000a8b7-737a-4cd5-a331-b76c91a43bc5	2022-12-23 10:15:10.024562+00	6	description	str	generic type	500	36
d678e0e0-4693-4d79-8ca3-df7bbdeb7d41	2022-12-23 10:15:10.04265+00	7	name	str	Juniper	100	36
3c3de5e9-1113-4c66-9587-15f15c628a20	2022-12-23 10:15:10.042727+00	7	slug	str	juniper	110	36
7baf3606-8d92-4c73-b1b3-97021159eb35	2022-12-23 10:15:10.07246+00	8	name	str	Lenovo	100	36
ee697872-6bcc-4600-9346-e89bb4be9e27	2022-12-23 10:15:10.072606+00	8	slug	str	lenovo	110	36
73b69a1c-3957-44cb-b49f-39a70517967a	2022-12-23 10:15:10.094723+00	9	name	str	Telect	100	36
1c32f028-9d4c-45f1-896f-6efc1614eeca	2022-12-23 10:15:10.094761+00	9	slug	str	telect	110	36
f181836e-ad72-420e-bcac-29144d2ed068	2022-12-23 10:15:10.111958+00	10	name	str	ZPE	100	36
29279ac2-1bda-4c09-b9a8-4afbe7ccac9c	2022-12-23 10:15:10.11199+00	10	slug	str	zpe	110	36
\.


--
-- Data for Name: extras_configcontext; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext (created, last_updated, id, name, weight, description, is_active, data) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_cluster_groups; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_cluster_groups (id, configcontext_id, clustergroup_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_cluster_types; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_cluster_types (id, configcontext_id, clustertype_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_clusters; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_clusters (id, configcontext_id, cluster_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_device_types; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_device_types (id, configcontext_id, devicetype_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_locations; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_locations (id, configcontext_id, location_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_platforms; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_platforms (id, configcontext_id, platform_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_regions; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_regions (id, configcontext_id, region_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_roles; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_roles (id, configcontext_id, devicerole_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_site_groups; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_site_groups (id, configcontext_id, sitegroup_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_sites; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_sites (id, configcontext_id, site_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_tags; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_tags (id, configcontext_id, tag_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_tenant_groups; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_tenant_groups (id, configcontext_id, tenantgroup_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_tenants; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_tenants (id, configcontext_id, tenant_id) FROM stdin;
\.


--
-- Data for Name: extras_configrevision; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configrevision (id, created, comment, data) FROM stdin;
\.


--
-- Data for Name: extras_customfield; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_customfield (id, type, name, label, description, required, filter_logic, "default", weight, validation_minimum, validation_maximum, validation_regex, choices, created, last_updated, object_type_id, group_name, ui_visibility, search_weight) FROM stdin;
\.


--
-- Data for Name: extras_customfield_content_types; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_customfield_content_types (id, customfield_id, contenttype_id) FROM stdin;
\.


--
-- Data for Name: extras_customlink; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_customlink (id, name, link_text, link_url, weight, group_name, button_class, new_window, created, last_updated, enabled) FROM stdin;
\.


--
-- Data for Name: extras_customlink_content_types; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_customlink_content_types (id, customlink_id, contenttype_id) FROM stdin;
\.


--
-- Data for Name: extras_exporttemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_exporttemplate (id, name, description, template_code, mime_type, file_extension, as_attachment, created, last_updated) FROM stdin;
\.


--
-- Data for Name: extras_exporttemplate_content_types; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_exporttemplate_content_types (id, exporttemplate_id, contenttype_id) FROM stdin;
\.


--
-- Data for Name: extras_imageattachment; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_imageattachment (id, object_id, image, image_height, image_width, name, created, content_type_id, last_updated) FROM stdin;
\.


--
-- Data for Name: extras_jobresult; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_jobresult (id, name, created, completed, status, data, job_id, obj_type_id, user_id, scheduled, "interval", started) FROM stdin;
\.


--
-- Data for Name: extras_journalentry; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_journalentry (last_updated, id, assigned_object_id, created, kind, comments, assigned_object_type_id, created_by_id, custom_field_data) FROM stdin;
\.


--
-- Data for Name: extras_objectchange; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_objectchange (id, "time", user_name, request_id, action, changed_object_id, related_object_id, object_repr, prechange_data, postchange_data, changed_object_type_id, related_object_type_id, user_id) FROM stdin;
1	2022-12-23 10:15:09.873738+00	admin	f7bcf1d0-d300-451e-843c-c54f363618f7	create	1	\N	APC	\N	{"name": "APC", "slug": "apc", "tags": [], "created": "2022-12-23T10:15:09.862Z", "description": "", "last_updated": "2022-12-23T10:15:09.862Z", "custom_fields": {}}	36	\N	1
2	2022-12-23 10:15:09.922336+00	admin	f7bcf1d0-d300-451e-843c-c54f363618f7	create	2	\N	Arista	\N	{"name": "Arista", "slug": "arista", "tags": [], "created": "2022-12-23T10:15:09.916Z", "description": "", "last_updated": "2022-12-23T10:15:09.916Z", "custom_fields": {}}	36	\N	1
3	2022-12-23 10:15:09.941077+00	admin	f7bcf1d0-d300-451e-843c-c54f363618f7	create	3	\N	Chatsworth	\N	{"name": "Chatsworth", "slug": "chatsworth", "tags": [], "created": "2022-12-23T10:15:09.936Z", "description": "", "last_updated": "2022-12-23T10:15:09.936Z", "custom_fields": {}}	36	\N	1
4	2022-12-23 10:15:09.973739+00	admin	f7bcf1d0-d300-451e-843c-c54f363618f7	create	4	\N	Dell	\N	{"name": "Dell", "slug": "dell", "tags": [], "created": "2022-12-23T10:15:09.966Z", "description": "", "last_updated": "2022-12-23T10:15:09.966Z", "custom_fields": {}}	36	\N	1
5	2022-12-23 10:15:10.007314+00	admin	f7bcf1d0-d300-451e-843c-c54f363618f7	create	5	\N	Fiberstore	\N	{"name": "Fiberstore", "slug": "Fiberstore", "tags": [], "created": "2022-12-23T10:15:10.000Z", "description": "", "last_updated": "2022-12-23T10:15:10.000Z", "custom_fields": {}}	36	\N	1
6	2022-12-23 10:15:10.026278+00	admin	f7bcf1d0-d300-451e-843c-c54f363618f7	create	6	\N	generic	\N	{"name": "generic", "slug": "generic", "tags": [], "created": "2022-12-23T10:15:10.023Z", "description": "generic type", "last_updated": "2022-12-23T10:15:10.023Z", "custom_fields": {}}	36	\N	1
7	2022-12-23 10:15:10.046735+00	admin	f7bcf1d0-d300-451e-843c-c54f363618f7	create	7	\N	Juniper	\N	{"name": "Juniper", "slug": "juniper", "tags": [], "created": "2022-12-23T10:15:10.039Z", "description": "", "last_updated": "2022-12-23T10:15:10.039Z", "custom_fields": {}}	36	\N	1
8	2022-12-23 10:15:10.077002+00	admin	f7bcf1d0-d300-451e-843c-c54f363618f7	create	8	\N	Lenovo	\N	{"name": "Lenovo", "slug": "lenovo", "tags": [], "created": "2022-12-23T10:15:10.068Z", "description": "", "last_updated": "2022-12-23T10:15:10.068Z", "custom_fields": {}}	36	\N	1
9	2022-12-23 10:15:10.098039+00	admin	f7bcf1d0-d300-451e-843c-c54f363618f7	create	9	\N	Telect	\N	{"name": "Telect", "slug": "telect", "tags": [], "created": "2022-12-23T10:15:10.093Z", "description": "", "last_updated": "2022-12-23T10:15:10.093Z", "custom_fields": {}}	36	\N	1
10	2022-12-23 10:15:10.113694+00	admin	f7bcf1d0-d300-451e-843c-c54f363618f7	create	10	\N	ZPE	\N	{"name": "ZPE", "slug": "zpe", "tags": [], "created": "2022-12-23T10:15:10.110Z", "description": "", "last_updated": "2022-12-23T10:15:10.110Z", "custom_fields": {}}	36	\N	1
\.


--
-- Data for Name: extras_savedfilter; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_savedfilter (id, created, last_updated, name, slug, description, weight, enabled, shared, parameters, user_id) FROM stdin;
\.


--
-- Data for Name: extras_savedfilter_content_types; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_savedfilter_content_types (id, savedfilter_id, contenttype_id) FROM stdin;
\.


--
-- Data for Name: extras_stagedchange; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_stagedchange (id, created, last_updated, action, object_id, data, branch_id, object_type_id) FROM stdin;
\.


--
-- Data for Name: extras_tag; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_tag (name, slug, created, last_updated, id, color, description) FROM stdin;
\.


--
-- Data for Name: extras_taggeditem; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_taggeditem (object_id, id, content_type_id, tag_id) FROM stdin;
\.


--
-- Data for Name: extras_webhook; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_webhook (id, name, type_create, type_update, type_delete, payload_url, enabled, http_method, http_content_type, additional_headers, body_template, secret, ssl_verification, ca_file_path, created, last_updated, conditions) FROM stdin;
\.


--
-- Data for Name: extras_webhook_content_types; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_webhook_content_types (id, webhook_id, contenttype_id) FROM stdin;
\.


--
-- Data for Name: ipam_aggregate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_aggregate (created, last_updated, custom_field_data, id, prefix, date_added, description, rir_id, tenant_id, comments) FROM stdin;
\.


--
-- Data for Name: ipam_asn; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_asn (created, last_updated, custom_field_data, id, asn, description, rir_id, tenant_id, comments) FROM stdin;
\.


--
-- Data for Name: ipam_fhrpgroup; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_fhrpgroup (created, last_updated, custom_field_data, id, group_id, protocol, auth_type, auth_key, description, name, comments) FROM stdin;
\.


--
-- Data for Name: ipam_fhrpgroupassignment; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_fhrpgroupassignment (created, last_updated, id, interface_id, priority, group_id, interface_type_id) FROM stdin;
\.


--
-- Data for Name: ipam_ipaddress; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_ipaddress (created, last_updated, custom_field_data, id, address, status, role, assigned_object_id, dns_name, description, assigned_object_type_id, nat_inside_id, tenant_id, vrf_id, comments) FROM stdin;
\.


--
-- Data for Name: ipam_iprange; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_iprange (created, last_updated, custom_field_data, id, start_address, end_address, size, status, description, role_id, tenant_id, vrf_id, comments) FROM stdin;
\.


--
-- Data for Name: ipam_l2vpn; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_l2vpn (id, created, last_updated, custom_field_data, name, slug, type, identifier, description, tenant_id, comments) FROM stdin;
\.


--
-- Data for Name: ipam_l2vpn_export_targets; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_l2vpn_export_targets (id, l2vpn_id, routetarget_id) FROM stdin;
\.


--
-- Data for Name: ipam_l2vpn_import_targets; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_l2vpn_import_targets (id, l2vpn_id, routetarget_id) FROM stdin;
\.


--
-- Data for Name: ipam_l2vpntermination; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_l2vpntermination (id, created, last_updated, custom_field_data, assigned_object_id, assigned_object_type_id, l2vpn_id) FROM stdin;
\.


--
-- Data for Name: ipam_prefix; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_prefix (created, last_updated, custom_field_data, id, prefix, status, is_pool, description, role_id, site_id, tenant_id, vlan_id, vrf_id, _children, _depth, mark_utilized, comments) FROM stdin;
\.


--
-- Data for Name: ipam_rir; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_rir (created, last_updated, custom_field_data, id, name, slug, is_private, description) FROM stdin;
\.


--
-- Data for Name: ipam_role; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_role (created, last_updated, custom_field_data, id, name, slug, weight, description) FROM stdin;
\.


--
-- Data for Name: ipam_routetarget; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_routetarget (created, last_updated, custom_field_data, id, name, description, tenant_id, comments) FROM stdin;
\.


--
-- Data for Name: ipam_service; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_service (created, last_updated, custom_field_data, id, name, protocol, ports, description, device_id, virtual_machine_id, comments) FROM stdin;
\.


--
-- Data for Name: ipam_service_ipaddresses; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_service_ipaddresses (id, service_id, ipaddress_id) FROM stdin;
\.


--
-- Data for Name: ipam_servicetemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_servicetemplate (created, last_updated, custom_field_data, id, protocol, ports, description, name, comments) FROM stdin;
\.


--
-- Data for Name: ipam_vlan; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_vlan (created, last_updated, custom_field_data, id, vid, name, status, description, group_id, role_id, site_id, tenant_id, comments) FROM stdin;
\.


--
-- Data for Name: ipam_vlangroup; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_vlangroup (created, last_updated, custom_field_data, id, name, slug, scope_id, description, scope_type_id, max_vid, min_vid) FROM stdin;
\.


--
-- Data for Name: ipam_vrf; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_vrf (created, last_updated, custom_field_data, id, name, rd, enforce_unique, description, tenant_id, comments) FROM stdin;
\.


--
-- Data for Name: ipam_vrf_export_targets; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_vrf_export_targets (id, vrf_id, routetarget_id) FROM stdin;
\.


--
-- Data for Name: ipam_vrf_import_targets; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_vrf_import_targets (id, vrf_id, routetarget_id) FROM stdin;
\.


--
-- Data for Name: social_auth_association; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.social_auth_association (id, server_url, handle, secret, issued, lifetime, assoc_type) FROM stdin;
\.


--
-- Data for Name: social_auth_code; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.social_auth_code (id, email, code, verified, "timestamp") FROM stdin;
\.


--
-- Data for Name: social_auth_nonce; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.social_auth_nonce (id, server_url, "timestamp", salt) FROM stdin;
\.


--
-- Data for Name: social_auth_partial; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.social_auth_partial (id, token, next_step, backend, data, "timestamp") FROM stdin;
\.


--
-- Data for Name: social_auth_usersocialauth; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.social_auth_usersocialauth (id, provider, uid, extra_data, user_id, created, modified) FROM stdin;
\.


--
-- Data for Name: taggit_tag; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.taggit_tag (id, name, slug) FROM stdin;
\.


--
-- Data for Name: taggit_taggeditem; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.taggit_taggeditem (id, object_id, content_type_id, tag_id) FROM stdin;
\.


--
-- Data for Name: tenancy_contact; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.tenancy_contact (created, last_updated, custom_field_data, id, name, title, phone, email, address, comments, group_id, link, description) FROM stdin;
\.


--
-- Data for Name: tenancy_contactassignment; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.tenancy_contactassignment (created, last_updated, id, object_id, priority, contact_id, content_type_id, role_id) FROM stdin;
\.


--
-- Data for Name: tenancy_contactgroup; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.tenancy_contactgroup (created, last_updated, custom_field_data, id, name, slug, description, lft, rght, tree_id, level, parent_id) FROM stdin;
\.


--
-- Data for Name: tenancy_contactrole; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.tenancy_contactrole (created, last_updated, custom_field_data, id, name, slug, description) FROM stdin;
\.


--
-- Data for Name: tenancy_tenant; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.tenancy_tenant (created, last_updated, custom_field_data, id, name, slug, description, comments, group_id) FROM stdin;
\.


--
-- Data for Name: tenancy_tenantgroup; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.tenancy_tenantgroup (created, last_updated, custom_field_data, id, name, slug, description, lft, rght, tree_id, level, parent_id) FROM stdin;
\.


--
-- Data for Name: users_objectpermission; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.users_objectpermission (id, name, description, enabled, actions, constraints) FROM stdin;
\.


--
-- Data for Name: users_objectpermission_groups; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.users_objectpermission_groups (id, objectpermission_id, group_id) FROM stdin;
\.


--
-- Data for Name: users_objectpermission_object_types; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.users_objectpermission_object_types (id, objectpermission_id, contenttype_id) FROM stdin;
\.


--
-- Data for Name: users_objectpermission_users; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.users_objectpermission_users (id, objectpermission_id, user_id) FROM stdin;
\.


--
-- Data for Name: users_token; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.users_token (id, created, expires, key, write_enabled, description, user_id, allowed_ips, last_used) FROM stdin;
1	2022-12-23 05:57:19.947823+00	\N	0123456789abcdef0123456789abcdef01234567	t		1	\N	\N
\.


--
-- Data for Name: users_userconfig; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.users_userconfig (id, data, user_id) FROM stdin;
1	{}	1
\.


--
-- Data for Name: virtualization_cluster; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.virtualization_cluster (created, last_updated, custom_field_data, id, name, comments, group_id, site_id, tenant_id, type_id, status, description) FROM stdin;
\.


--
-- Data for Name: virtualization_clustergroup; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.virtualization_clustergroup (created, last_updated, custom_field_data, id, name, slug, description) FROM stdin;
\.


--
-- Data for Name: virtualization_clustertype; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.virtualization_clustertype (created, last_updated, custom_field_data, id, name, slug, description) FROM stdin;
\.


--
-- Data for Name: virtualization_virtualmachine; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.virtualization_virtualmachine (created, last_updated, custom_field_data, id, local_context_data, name, status, vcpus, memory, disk, comments, cluster_id, platform_id, primary_ip4_id, primary_ip6_id, role_id, tenant_id, _name, site_id, device_id, description) FROM stdin;
\.


--
-- Data for Name: virtualization_vminterface; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.virtualization_vminterface (created, last_updated, custom_field_data, id, enabled, mac_address, mtu, mode, name, _name, description, parent_id, untagged_vlan_id, virtual_machine_id, bridge_id, vrf_id) FROM stdin;
\.


--
-- Data for Name: virtualization_vminterface_tagged_vlans; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.virtualization_vminterface_tagged_vlans (id, vminterface_id, vlan_id) FROM stdin;
\.


--
-- Data for Name: wireless_wirelesslan; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.wireless_wirelesslan (created, last_updated, custom_field_data, id, ssid, group_id, description, auth_cipher, auth_psk, auth_type, vlan_id, tenant_id, comments, status) FROM stdin;
\.


--
-- Data for Name: wireless_wirelesslangroup; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.wireless_wirelesslangroup (created, last_updated, custom_field_data, id, name, slug, description, lft, rght, tree_id, level, parent_id) FROM stdin;
\.


--
-- Data for Name: wireless_wirelesslink; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.wireless_wirelesslink (created, last_updated, custom_field_data, id, ssid, status, description, auth_cipher, auth_psk, auth_type, _interface_a_device_id, _interface_b_device_id, interface_a_id, interface_b_id, tenant_id, comments) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 457, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: circuits_circuit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.circuits_circuit_id_seq', 1, false);


--
-- Name: circuits_circuittermination_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.circuits_circuittermination_id_seq', 1, false);


--
-- Name: circuits_circuittype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.circuits_circuittype_id_seq', 1, false);


--
-- Name: circuits_provider_asns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.circuits_provider_asns_id_seq', 1, false);


--
-- Name: circuits_provider_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.circuits_provider_id_seq', 1, false);


--
-- Name: circuits_providernetwork_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.circuits_providernetwork_id_seq', 1, false);


--
-- Name: dcim_cable_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_cable_id_seq', 1, false);


--
-- Name: dcim_cablepath_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_cablepath_id_seq', 1, false);


--
-- Name: dcim_cabletermination_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_cabletermination_id_seq', 1, false);


--
-- Name: dcim_consoleport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_consoleport_id_seq', 1, false);


--
-- Name: dcim_consoleporttemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_consoleporttemplate_id_seq', 1, false);


--
-- Name: dcim_consoleserverport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_consoleserverport_id_seq', 1, false);


--
-- Name: dcim_consoleserverporttemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_consoleserverporttemplate_id_seq', 1, false);


--
-- Name: dcim_device_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_device_id_seq', 1, false);


--
-- Name: dcim_devicebay_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_devicebay_id_seq', 1, false);


--
-- Name: dcim_devicebaytemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_devicebaytemplate_id_seq', 1, false);


--
-- Name: dcim_devicerole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_devicerole_id_seq', 1, false);


--
-- Name: dcim_devicetype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_devicetype_id_seq', 1, false);


--
-- Name: dcim_frontport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_frontport_id_seq', 1, false);


--
-- Name: dcim_frontporttemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_frontporttemplate_id_seq', 1, false);


--
-- Name: dcim_interface_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_interface_id_seq', 1, false);


--
-- Name: dcim_interface_tagged_vlans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_interface_tagged_vlans_id_seq', 1, false);


--
-- Name: dcim_interface_vdcs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_interface_vdcs_id_seq', 1, false);


--
-- Name: dcim_interface_wireless_lans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_interface_wireless_lans_id_seq', 1, false);


--
-- Name: dcim_interfacetemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_interfacetemplate_id_seq', 1, false);


--
-- Name: dcim_inventoryitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_inventoryitem_id_seq', 1, false);


--
-- Name: dcim_inventoryitemrole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_inventoryitemrole_id_seq', 1, false);


--
-- Name: dcim_inventoryitemtemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_inventoryitemtemplate_id_seq', 1, false);


--
-- Name: dcim_location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_location_id_seq', 1, false);


--
-- Name: dcim_manufacturer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_manufacturer_id_seq', 10, true);


--
-- Name: dcim_module_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_module_id_seq', 1, false);


--
-- Name: dcim_modulebay_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_modulebay_id_seq', 1, false);


--
-- Name: dcim_modulebaytemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_modulebaytemplate_id_seq', 1, false);


--
-- Name: dcim_moduletype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_moduletype_id_seq', 1, false);


--
-- Name: dcim_platform_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_platform_id_seq', 1, false);


--
-- Name: dcim_powerfeed_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_powerfeed_id_seq', 1, false);


--
-- Name: dcim_poweroutlet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_poweroutlet_id_seq', 1, false);


--
-- Name: dcim_poweroutlettemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_poweroutlettemplate_id_seq', 1, false);


--
-- Name: dcim_powerpanel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_powerpanel_id_seq', 1, false);


--
-- Name: dcim_powerport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_powerport_id_seq', 1, false);


--
-- Name: dcim_powerporttemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_powerporttemplate_id_seq', 1, false);


--
-- Name: dcim_rack_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_rack_id_seq', 1, false);


--
-- Name: dcim_rackreservation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_rackreservation_id_seq', 1, false);


--
-- Name: dcim_rackrole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_rackrole_id_seq', 1, false);


--
-- Name: dcim_rearport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_rearport_id_seq', 1, false);


--
-- Name: dcim_rearporttemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_rearporttemplate_id_seq', 1, false);


--
-- Name: dcim_region_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_region_id_seq', 1, false);


--
-- Name: dcim_site_asns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_site_asns_id_seq', 1, false);


--
-- Name: dcim_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_site_id_seq', 1, false);


--
-- Name: dcim_sitegroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_sitegroup_id_seq', 1, false);


--
-- Name: dcim_virtualchassis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_virtualchassis_id_seq', 1, false);


--
-- Name: dcim_virtualdevicecontext_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_virtualdevicecontext_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 115, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 486, true);


--
-- Name: extras_branch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_branch_id_seq', 1, false);


--
-- Name: extras_configcontext_cluster_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_cluster_groups_id_seq', 1, false);


--
-- Name: extras_configcontext_cluster_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_cluster_types_id_seq', 1, false);


--
-- Name: extras_configcontext_clusters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_clusters_id_seq', 1, false);


--
-- Name: extras_configcontext_device_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_device_types_id_seq', 1, false);


--
-- Name: extras_configcontext_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_id_seq', 1, false);


--
-- Name: extras_configcontext_locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_locations_id_seq', 1, false);


--
-- Name: extras_configcontext_platforms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_platforms_id_seq', 1, false);


--
-- Name: extras_configcontext_regions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_regions_id_seq', 1, false);


--
-- Name: extras_configcontext_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_roles_id_seq', 1, false);


--
-- Name: extras_configcontext_site_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_site_groups_id_seq', 1, false);


--
-- Name: extras_configcontext_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_sites_id_seq', 1, false);


--
-- Name: extras_configcontext_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_tags_id_seq', 1, false);


--
-- Name: extras_configcontext_tenant_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_tenant_groups_id_seq', 1, false);


--
-- Name: extras_configcontext_tenants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_tenants_id_seq', 1, false);


--
-- Name: extras_configrevision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configrevision_id_seq', 1, false);


--
-- Name: extras_customfield_content_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_customfield_content_types_id_seq', 1, false);


--
-- Name: extras_customfield_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_customfield_id_seq', 1, false);


--
-- Name: extras_customlink_content_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_customlink_content_types_id_seq', 1, false);


--
-- Name: extras_customlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_customlink_id_seq', 1, false);


--
-- Name: extras_exporttemplate_content_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_exporttemplate_content_types_id_seq', 1, false);


--
-- Name: extras_exporttemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_exporttemplate_id_seq', 1, false);


--
-- Name: extras_imageattachment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_imageattachment_id_seq', 1, false);


--
-- Name: extras_jobresult_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_jobresult_id_seq', 1, false);


--
-- Name: extras_journalentry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_journalentry_id_seq', 1, false);


--
-- Name: extras_objectchange_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_objectchange_id_seq', 10, true);


--
-- Name: extras_savedfilter_content_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_savedfilter_content_types_id_seq', 1, false);


--
-- Name: extras_savedfilter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_savedfilter_id_seq', 1, false);


--
-- Name: extras_stagedchange_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_stagedchange_id_seq', 1, false);


--
-- Name: extras_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_tag_id_seq', 1, false);


--
-- Name: extras_taggeditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_taggeditem_id_seq', 1, false);


--
-- Name: extras_webhook_content_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_webhook_content_types_id_seq', 1, false);


--
-- Name: extras_webhook_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_webhook_id_seq', 1, false);


--
-- Name: ipam_aggregate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_aggregate_id_seq', 1, false);


--
-- Name: ipam_asn_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_asn_id_seq', 1, false);


--
-- Name: ipam_fhrpgroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_fhrpgroup_id_seq', 1, false);


--
-- Name: ipam_fhrpgroupassignment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_fhrpgroupassignment_id_seq', 1, false);


--
-- Name: ipam_ipaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_ipaddress_id_seq', 1, false);


--
-- Name: ipam_iprange_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_iprange_id_seq', 1, false);


--
-- Name: ipam_l2vpn_export_targets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_l2vpn_export_targets_id_seq', 1, false);


--
-- Name: ipam_l2vpn_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_l2vpn_id_seq', 1, false);


--
-- Name: ipam_l2vpn_import_targets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_l2vpn_import_targets_id_seq', 1, false);


--
-- Name: ipam_l2vpntermination_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_l2vpntermination_id_seq', 1, false);


--
-- Name: ipam_prefix_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_prefix_id_seq', 1, false);


--
-- Name: ipam_rir_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_rir_id_seq', 1, false);


--
-- Name: ipam_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_role_id_seq', 1, false);


--
-- Name: ipam_routetarget_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_routetarget_id_seq', 1, false);


--
-- Name: ipam_service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_service_id_seq', 1, false);


--
-- Name: ipam_service_ipaddresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_service_ipaddresses_id_seq', 1, false);


--
-- Name: ipam_servicetemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_servicetemplate_id_seq', 1, false);


--
-- Name: ipam_vlan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_vlan_id_seq', 1, false);


--
-- Name: ipam_vlangroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_vlangroup_id_seq', 1, false);


--
-- Name: ipam_vrf_export_targets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_vrf_export_targets_id_seq', 1, false);


--
-- Name: ipam_vrf_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_vrf_id_seq', 1, false);


--
-- Name: ipam_vrf_import_targets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_vrf_import_targets_id_seq', 1, false);


--
-- Name: social_auth_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.social_auth_association_id_seq', 1, false);


--
-- Name: social_auth_code_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.social_auth_code_id_seq', 1, false);


--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.social_auth_nonce_id_seq', 1, false);


--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.social_auth_partial_id_seq', 1, false);


--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.social_auth_usersocialauth_id_seq', 1, false);


--
-- Name: taggit_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.taggit_tag_id_seq', 1, false);


--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.taggit_taggeditem_id_seq', 1, false);


--
-- Name: tenancy_contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.tenancy_contact_id_seq', 1, false);


--
-- Name: tenancy_contactassignment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.tenancy_contactassignment_id_seq', 1, false);


--
-- Name: tenancy_contactgroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.tenancy_contactgroup_id_seq', 1, false);


--
-- Name: tenancy_contactrole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.tenancy_contactrole_id_seq', 1, false);


--
-- Name: tenancy_tenant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.tenancy_tenant_id_seq', 1, false);


--
-- Name: tenancy_tenantgroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.tenancy_tenantgroup_id_seq', 1, false);


--
-- Name: users_objectpermission_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.users_objectpermission_groups_id_seq', 1, false);


--
-- Name: users_objectpermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.users_objectpermission_id_seq', 1, false);


--
-- Name: users_objectpermission_object_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.users_objectpermission_object_types_id_seq', 1, false);


--
-- Name: users_objectpermission_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.users_objectpermission_users_id_seq', 1, false);


--
-- Name: users_token_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.users_token_id_seq', 1, true);


--
-- Name: users_userconfig_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.users_userconfig_id_seq', 1, true);


--
-- Name: virtualization_cluster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.virtualization_cluster_id_seq', 1, false);


--
-- Name: virtualization_clustergroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.virtualization_clustergroup_id_seq', 1, false);


--
-- Name: virtualization_clustertype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.virtualization_clustertype_id_seq', 1, false);


--
-- Name: virtualization_virtualmachine_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.virtualization_virtualmachine_id_seq', 1, false);


--
-- Name: virtualization_vminterface_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.virtualization_vminterface_id_seq', 1, false);


--
-- Name: virtualization_vminterface_tagged_vlans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.virtualization_vminterface_tagged_vlans_id_seq', 1, false);


--
-- Name: wireless_wirelesslan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.wireless_wirelesslan_id_seq', 1, false);


--
-- Name: wireless_wirelesslangroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.wireless_wirelesslangroup_id_seq', 1, false);


--
-- Name: wireless_wirelesslink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.wireless_wirelesslink_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: circuits_circuit circuits_circuit_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_pkey PRIMARY KEY (id);


--
-- Name: circuits_circuit circuits_circuit_unique_provider_cid; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_unique_provider_cid UNIQUE (provider_id, cid);


--
-- Name: circuits_circuittermination circuits_circuittermination_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuittermination_pkey PRIMARY KEY (id);


--
-- Name: circuits_circuittermination circuits_circuittermination_unique_circuit_term_side; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuittermination_unique_circuit_term_side UNIQUE (circuit_id, term_side);


--
-- Name: circuits_circuittype circuits_circuittype_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittype
    ADD CONSTRAINT circuits_circuittype_name_key UNIQUE (name);


--
-- Name: circuits_circuittype circuits_circuittype_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittype
    ADD CONSTRAINT circuits_circuittype_pkey PRIMARY KEY (id);


--
-- Name: circuits_circuittype circuits_circuittype_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittype
    ADD CONSTRAINT circuits_circuittype_slug_key UNIQUE (slug);


--
-- Name: circuits_provider_asns circuits_provider_asns_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_provider_asns
    ADD CONSTRAINT circuits_provider_asns_pkey PRIMARY KEY (id);


--
-- Name: circuits_provider_asns circuits_provider_asns_provider_id_asn_id_6e573798_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_provider_asns
    ADD CONSTRAINT circuits_provider_asns_provider_id_asn_id_6e573798_uniq UNIQUE (provider_id, asn_id);


--
-- Name: circuits_provider circuits_provider_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_provider
    ADD CONSTRAINT circuits_provider_name_key UNIQUE (name);


--
-- Name: circuits_provider circuits_provider_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_provider
    ADD CONSTRAINT circuits_provider_pkey PRIMARY KEY (id);


--
-- Name: circuits_provider circuits_provider_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_provider
    ADD CONSTRAINT circuits_provider_slug_key UNIQUE (slug);


--
-- Name: circuits_providernetwork circuits_providernetwork_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_providernetwork
    ADD CONSTRAINT circuits_providernetwork_pkey PRIMARY KEY (id);


--
-- Name: circuits_providernetwork circuits_providernetwork_unique_provider_name; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_providernetwork
    ADD CONSTRAINT circuits_providernetwork_unique_provider_name UNIQUE (provider_id, name);


--
-- Name: dcim_cable dcim_cable_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable_pkey PRIMARY KEY (id);


--
-- Name: dcim_cablepath dcim_cablepath_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cablepath
    ADD CONSTRAINT dcim_cablepath_pkey PRIMARY KEY (id);


--
-- Name: dcim_cabletermination dcim_cabletermination_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cabletermination
    ADD CONSTRAINT dcim_cabletermination_pkey PRIMARY KEY (id);


--
-- Name: dcim_cabletermination dcim_cabletermination_unique_termination; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cabletermination
    ADD CONSTRAINT dcim_cabletermination_unique_termination UNIQUE (termination_type_id, termination_id);


--
-- Name: dcim_consoleport dcim_consoleport_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport_pkey PRIMARY KEY (id);


--
-- Name: dcim_consoleport dcim_consoleport_unique_device_name; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport_unique_device_name UNIQUE (device_id, name);


--
-- Name: dcim_consoleporttemplate dcim_consoleporttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleporttemplate
    ADD CONSTRAINT dcim_consoleporttemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_consoleporttemplate dcim_consoleporttemplate_unique_device_type_name; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleporttemplate
    ADD CONSTRAINT dcim_consoleporttemplate_unique_device_type_name UNIQUE (device_type_id, name);


--
-- Name: dcim_consoleporttemplate dcim_consoleporttemplate_unique_module_type_name; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleporttemplate
    ADD CONSTRAINT dcim_consoleporttemplate_unique_module_type_name UNIQUE (module_type_id, name);


--
-- Name: dcim_consoleserverport dcim_consoleserverport_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverport
    ADD CONSTRAINT dcim_consoleserverport_pkey PRIMARY KEY (id);


--
-- Name: dcim_consoleserverport dcim_consoleserverport_unique_device_name; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverport
    ADD CONSTRAINT dcim_consoleserverport_unique_device_name UNIQUE (device_id, name);


--
-- Name: dcim_consoleserverporttemplate dcim_consoleserverporttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverporttemplate
    ADD CONSTRAINT dcim_consoleserverporttemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_consoleserverporttemplate dcim_consoleserverporttemplate_unique_device_type_name; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverporttemplate
    ADD CONSTRAINT dcim_consoleserverporttemplate_unique_device_type_name UNIQUE (device_type_id, name);


--
-- Name: dcim_consoleserverporttemplate dcim_consoleserverporttemplate_unique_module_type_name; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverporttemplate
    ADD CONSTRAINT dcim_consoleserverporttemplate_unique_module_type_name UNIQUE (module_type_id, name);


--
-- Name: dcim_device dcim_device_asset_tag_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_asset_tag_key UNIQUE (asset_tag);


--
-- Name: dcim_device dcim_device_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_pkey PRIMARY KEY (id);


--
-- Name: dcim_device dcim_device_primary_ip4_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_primary_ip4_id_key UNIQUE (primary_ip4_id);


--
-- Name: dcim_device dcim_device_primary_ip6_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_primary_ip6_id_key UNIQUE (primary_ip6_id);


--
-- Name: dcim_device dcim_device_unique_rack_position_face; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_unique_rack_position_face UNIQUE (rack_id, "position", face);


--
-- Name: dcim_device dcim_device_unique_virtual_chassis_vc_position; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_unique_virtual_chassis_vc_position UNIQUE (virtual_chassis_id, vc_position);


--
-- Name: dcim_devicebay dcim_devicebay_installed_device_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebay
    ADD CONSTRAINT dcim_devicebay_installed_device_id_key UNIQUE (installed_device_id);


--
-- Name: dcim_devicebay dcim_devicebay_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebay
    ADD CONSTRAINT dcim_devicebay_pkey PRIMARY KEY (id);


--
-- Name: dcim_devicebay dcim_devicebay_unique_device_name; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebay
    ADD CONSTRAINT dcim_devicebay_unique_device_name UNIQUE (device_id, name);


--
-- Name: dcim_devicebaytemplate dcim_devicebaytemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebaytemplate
    ADD CONSTRAINT dcim_devicebaytemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_devicebaytemplate dcim_devicebaytemplate_unique_device_type_name; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebaytemplate
    ADD CONSTRAINT dcim_devicebaytemplate_unique_device_type_name UNIQUE (device_type_id, name);


--
-- Name: dcim_devicerole dcim_devicerole_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicerole
    ADD CONSTRAINT dcim_devicerole_name_key UNIQUE (name);


--
-- Name: dcim_devicerole dcim_devicerole_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicerole
    ADD CONSTRAINT dcim_devicerole_pkey PRIMARY KEY (id);


--
-- Name: dcim_devicerole dcim_devicerole_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicerole
    ADD CONSTRAINT dcim_devicerole_slug_key UNIQUE (slug);


--
-- Name: dcim_devicetype dcim_devicetype_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicetype
    ADD CONSTRAINT dcim_devicetype_pkey PRIMARY KEY (id);


--
-- Name: dcim_devicetype dcim_devicetype_unique_manufacturer_model; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicetype
    ADD CONSTRAINT dcim_devicetype_unique_manufacturer_model UNIQUE (manufacturer_id, model);


--
-- Name: dcim_devicetype dcim_devicetype_unique_manufacturer_slug; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicetype
    ADD CONSTRAINT dcim_devicetype_unique_manufacturer_slug UNIQUE (manufacturer_id, slug);


--
-- Name: dcim_frontport dcim_frontport_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport_pkey PRIMARY KEY (id);


--
-- Name: dcim_frontport dcim_frontport_unique_device_name; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport_unique_device_name UNIQUE (device_id, name);


--
-- Name: dcim_frontport dcim_frontport_unique_rear_port_position; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport_unique_rear_port_position UNIQUE (rear_port_id, rear_port_position);


--
-- Name: dcim_frontporttemplate dcim_frontporttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontporttemplate
    ADD CONSTRAINT dcim_frontporttemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_frontporttemplate dcim_frontporttemplate_unique_device_type_name; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontporttemplate
    ADD CONSTRAINT dcim_frontporttemplate_unique_device_type_name UNIQUE (device_type_id, name);


--
-- Name: dcim_frontporttemplate dcim_frontporttemplate_unique_module_type_name; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontporttemplate
    ADD CONSTRAINT dcim_frontporttemplate_unique_module_type_name UNIQUE (module_type_id, name);


--
-- Name: dcim_frontporttemplate dcim_frontporttemplate_unique_rear_port_position; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontporttemplate
    ADD CONSTRAINT dcim_frontporttemplate_unique_rear_port_position UNIQUE (rear_port_id, rear_port_position);


--
-- Name: dcim_interface dcim_interface_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_pkey PRIMARY KEY (id);


--
-- Name: dcim_interface_tagged_vlans dcim_interface_tagged_vlans_interface_id_vlan_id_0d55c576_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface_tagged_vlans
    ADD CONSTRAINT dcim_interface_tagged_vlans_interface_id_vlan_id_0d55c576_uniq UNIQUE (interface_id, vlan_id);


--
-- Name: dcim_interface_tagged_vlans dcim_interface_tagged_vlans_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface_tagged_vlans
    ADD CONSTRAINT dcim_interface_tagged_vlans_pkey PRIMARY KEY (id);


--
-- Name: dcim_interface dcim_interface_unique_device_name; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_unique_device_name UNIQUE (device_id, name);


--
-- Name: dcim_interface_vdcs dcim_interface_vdcs_interface_id_virtualdevi_cca9c2a6_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface_vdcs
    ADD CONSTRAINT dcim_interface_vdcs_interface_id_virtualdevi_cca9c2a6_uniq UNIQUE (interface_id, virtualdevicecontext_id);


--
-- Name: dcim_interface_vdcs dcim_interface_vdcs_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface_vdcs
    ADD CONSTRAINT dcim_interface_vdcs_pkey PRIMARY KEY (id);


--
-- Name: dcim_interface_wireless_lans dcim_interface_wireless__interface_id_wirelesslan_b52fb3d8_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface_wireless_lans
    ADD CONSTRAINT dcim_interface_wireless__interface_id_wirelesslan_b52fb3d8_uniq UNIQUE (interface_id, wirelesslan_id);


--
-- Name: dcim_interface_wireless_lans dcim_interface_wireless_lans_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface_wireless_lans
    ADD CONSTRAINT dcim_interface_wireless_lans_pkey PRIMARY KEY (id);


--
-- Name: dcim_interfacetemplate dcim_interfacetemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interfacetemplate
    ADD CONSTRAINT dcim_interfacetemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_interfacetemplate dcim_interfacetemplate_unique_device_type_name; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interfacetemplate
    ADD CONSTRAINT dcim_interfacetemplate_unique_device_type_name UNIQUE (device_type_id, name);


--
-- Name: dcim_interfacetemplate dcim_interfacetemplate_unique_module_type_name; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interfacetemplate
    ADD CONSTRAINT dcim_interfacetemplate_unique_module_type_name UNIQUE (module_type_id, name);


--
-- Name: dcim_inventoryitem dcim_inventoryitem_asset_tag_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_asset_tag_key UNIQUE (asset_tag);


--
-- Name: dcim_inventoryitem dcim_inventoryitem_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_pkey PRIMARY KEY (id);


--
-- Name: dcim_inventoryitem dcim_inventoryitem_unique_device_parent_name; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_unique_device_parent_name UNIQUE (device_id, parent_id, name);


--
-- Name: dcim_inventoryitemrole dcim_inventoryitemrole_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitemrole
    ADD CONSTRAINT dcim_inventoryitemrole_name_key UNIQUE (name);


--
-- Name: dcim_inventoryitemrole dcim_inventoryitemrole_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitemrole
    ADD CONSTRAINT dcim_inventoryitemrole_pkey PRIMARY KEY (id);


--
-- Name: dcim_inventoryitemrole dcim_inventoryitemrole_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitemrole
    ADD CONSTRAINT dcim_inventoryitemrole_slug_key UNIQUE (slug);


--
-- Name: dcim_inventoryitemtemplate dcim_inventoryitemtemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitemtemplate
    ADD CONSTRAINT dcim_inventoryitemtemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_inventoryitemtemplate dcim_inventoryitemtemplate_unique_device_type_parent_name; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitemtemplate
    ADD CONSTRAINT dcim_inventoryitemtemplate_unique_device_type_parent_name UNIQUE (device_type_id, parent_id, name);


--
-- Name: dcim_location dcim_location_parent_name; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_location
    ADD CONSTRAINT dcim_location_parent_name UNIQUE (site_id, parent_id, name);


--
-- Name: dcim_location dcim_location_parent_slug; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_location
    ADD CONSTRAINT dcim_location_parent_slug UNIQUE (site_id, parent_id, slug);


--
-- Name: dcim_location dcim_location_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_location
    ADD CONSTRAINT dcim_location_pkey PRIMARY KEY (id);


--
-- Name: dcim_manufacturer dcim_manufacturer_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_manufacturer
    ADD CONSTRAINT dcim_manufacturer_name_key UNIQUE (name);


--
-- Name: dcim_manufacturer dcim_manufacturer_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_manufacturer
    ADD CONSTRAINT dcim_manufacturer_pkey PRIMARY KEY (id);


--
-- Name: dcim_manufacturer dcim_manufacturer_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_manufacturer
    ADD CONSTRAINT dcim_manufacturer_slug_key UNIQUE (slug);


--
-- Name: dcim_module dcim_module_asset_tag_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_module
    ADD CONSTRAINT dcim_module_asset_tag_key UNIQUE (asset_tag);


--
-- Name: dcim_module dcim_module_module_bay_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_module
    ADD CONSTRAINT dcim_module_module_bay_id_key UNIQUE (module_bay_id);


--
-- Name: dcim_module dcim_module_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_module
    ADD CONSTRAINT dcim_module_pkey PRIMARY KEY (id);


--
-- Name: dcim_modulebay dcim_modulebay_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_modulebay
    ADD CONSTRAINT dcim_modulebay_pkey PRIMARY KEY (id);


--
-- Name: dcim_modulebay dcim_modulebay_unique_device_name; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_modulebay
    ADD CONSTRAINT dcim_modulebay_unique_device_name UNIQUE (device_id, name);


--
-- Name: dcim_modulebaytemplate dcim_modulebaytemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_modulebaytemplate
    ADD CONSTRAINT dcim_modulebaytemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_modulebaytemplate dcim_modulebaytemplate_unique_device_type_name; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_modulebaytemplate
    ADD CONSTRAINT dcim_modulebaytemplate_unique_device_type_name UNIQUE (device_type_id, name);


--
-- Name: dcim_moduletype dcim_moduletype_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_moduletype
    ADD CONSTRAINT dcim_moduletype_pkey PRIMARY KEY (id);


--
-- Name: dcim_moduletype dcim_moduletype_unique_manufacturer_model; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_moduletype
    ADD CONSTRAINT dcim_moduletype_unique_manufacturer_model UNIQUE (manufacturer_id, model);


--
-- Name: dcim_platform dcim_platform_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_platform
    ADD CONSTRAINT dcim_platform_name_key UNIQUE (name);


--
-- Name: dcim_platform dcim_platform_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_platform
    ADD CONSTRAINT dcim_platform_pkey PRIMARY KEY (id);


--
-- Name: dcim_platform dcim_platform_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_platform
    ADD CONSTRAINT dcim_platform_slug_key UNIQUE (slug);


--
-- Name: dcim_powerfeed dcim_powerfeed_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed_pkey PRIMARY KEY (id);


--
-- Name: dcim_powerfeed dcim_powerfeed_unique_power_panel_name; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed_unique_power_panel_name UNIQUE (power_panel_id, name);


--
-- Name: dcim_poweroutlet dcim_poweroutlet_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet_pkey PRIMARY KEY (id);


--
-- Name: dcim_poweroutlet dcim_poweroutlet_unique_device_name; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet_unique_device_name UNIQUE (device_id, name);


--
-- Name: dcim_poweroutlettemplate dcim_poweroutlettemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlettemplate
    ADD CONSTRAINT dcim_poweroutlettemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_poweroutlettemplate dcim_poweroutlettemplate_unique_device_type_name; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlettemplate
    ADD CONSTRAINT dcim_poweroutlettemplate_unique_device_type_name UNIQUE (device_type_id, name);


--
-- Name: dcim_poweroutlettemplate dcim_poweroutlettemplate_unique_module_type_name; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlettemplate
    ADD CONSTRAINT dcim_poweroutlettemplate_unique_module_type_name UNIQUE (module_type_id, name);


--
-- Name: dcim_powerpanel dcim_powerpanel_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerpanel
    ADD CONSTRAINT dcim_powerpanel_pkey PRIMARY KEY (id);


--
-- Name: dcim_powerpanel dcim_powerpanel_unique_site_name; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerpanel
    ADD CONSTRAINT dcim_powerpanel_unique_site_name UNIQUE (site_id, name);


--
-- Name: dcim_powerport dcim_powerport_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport_pkey PRIMARY KEY (id);


--
-- Name: dcim_powerport dcim_powerport_unique_device_name; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport_unique_device_name UNIQUE (device_id, name);


--
-- Name: dcim_powerporttemplate dcim_powerporttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerporttemplate
    ADD CONSTRAINT dcim_powerporttemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_powerporttemplate dcim_powerporttemplate_unique_device_type_name; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerporttemplate
    ADD CONSTRAINT dcim_powerporttemplate_unique_device_type_name UNIQUE (device_type_id, name);


--
-- Name: dcim_powerporttemplate dcim_powerporttemplate_unique_module_type_name; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerporttemplate
    ADD CONSTRAINT dcim_powerporttemplate_unique_module_type_name UNIQUE (module_type_id, name);


--
-- Name: dcim_rack dcim_rack_asset_tag_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_asset_tag_key UNIQUE (asset_tag);


--
-- Name: dcim_rack dcim_rack_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_pkey PRIMARY KEY (id);


--
-- Name: dcim_rack dcim_rack_unique_location_facility_id; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_unique_location_facility_id UNIQUE (location_id, facility_id);


--
-- Name: dcim_rack dcim_rack_unique_location_name; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_unique_location_name UNIQUE (location_id, name);


--
-- Name: dcim_rackreservation dcim_rackreservation_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackreservation
    ADD CONSTRAINT dcim_rackreservation_pkey PRIMARY KEY (id);


--
-- Name: dcim_rackrole dcim_rackrole_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackrole
    ADD CONSTRAINT dcim_rackrole_name_key UNIQUE (name);


--
-- Name: dcim_rackrole dcim_rackrole_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackrole
    ADD CONSTRAINT dcim_rackrole_pkey PRIMARY KEY (id);


--
-- Name: dcim_rackrole dcim_rackrole_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackrole
    ADD CONSTRAINT dcim_rackrole_slug_key UNIQUE (slug);


--
-- Name: dcim_rearport dcim_rearport_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearport
    ADD CONSTRAINT dcim_rearport_pkey PRIMARY KEY (id);


--
-- Name: dcim_rearport dcim_rearport_unique_device_name; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearport
    ADD CONSTRAINT dcim_rearport_unique_device_name UNIQUE (device_id, name);


--
-- Name: dcim_rearporttemplate dcim_rearporttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearporttemplate
    ADD CONSTRAINT dcim_rearporttemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_rearporttemplate dcim_rearporttemplate_unique_device_type_name; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearporttemplate
    ADD CONSTRAINT dcim_rearporttemplate_unique_device_type_name UNIQUE (device_type_id, name);


--
-- Name: dcim_rearporttemplate dcim_rearporttemplate_unique_module_type_name; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearporttemplate
    ADD CONSTRAINT dcim_rearporttemplate_unique_module_type_name UNIQUE (module_type_id, name);


--
-- Name: dcim_region dcim_region_parent_name; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_region
    ADD CONSTRAINT dcim_region_parent_name UNIQUE (parent_id, name);


--
-- Name: dcim_region dcim_region_parent_slug; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_region
    ADD CONSTRAINT dcim_region_parent_slug UNIQUE (parent_id, slug);


--
-- Name: dcim_region dcim_region_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_region
    ADD CONSTRAINT dcim_region_pkey PRIMARY KEY (id);


--
-- Name: dcim_site_asns dcim_site_asns_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site_asns
    ADD CONSTRAINT dcim_site_asns_pkey PRIMARY KEY (id);


--
-- Name: dcim_site_asns dcim_site_asns_site_id_asn_id_1a5a6f23_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site_asns
    ADD CONSTRAINT dcim_site_asns_site_id_asn_id_1a5a6f23_uniq UNIQUE (site_id, asn_id);


--
-- Name: dcim_site dcim_site_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site
    ADD CONSTRAINT dcim_site_name_key UNIQUE (name);


--
-- Name: dcim_site dcim_site_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site
    ADD CONSTRAINT dcim_site_pkey PRIMARY KEY (id);


--
-- Name: dcim_site dcim_site_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site
    ADD CONSTRAINT dcim_site_slug_key UNIQUE (slug);


--
-- Name: dcim_sitegroup dcim_sitegroup_parent_name; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_sitegroup
    ADD CONSTRAINT dcim_sitegroup_parent_name UNIQUE (parent_id, name);


--
-- Name: dcim_sitegroup dcim_sitegroup_parent_slug; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_sitegroup
    ADD CONSTRAINT dcim_sitegroup_parent_slug UNIQUE (parent_id, slug);


--
-- Name: dcim_sitegroup dcim_sitegroup_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_sitegroup
    ADD CONSTRAINT dcim_sitegroup_pkey PRIMARY KEY (id);


--
-- Name: dcim_virtualchassis dcim_virtualchassis_master_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_virtualchassis
    ADD CONSTRAINT dcim_virtualchassis_master_id_key UNIQUE (master_id);


--
-- Name: dcim_virtualchassis dcim_virtualchassis_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_virtualchassis
    ADD CONSTRAINT dcim_virtualchassis_pkey PRIMARY KEY (id);


--
-- Name: dcim_virtualdevicecontext dcim_virtualdevicecontext_device_identifier; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_virtualdevicecontext
    ADD CONSTRAINT dcim_virtualdevicecontext_device_identifier UNIQUE (device_id, identifier);


--
-- Name: dcim_virtualdevicecontext dcim_virtualdevicecontext_device_name; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_virtualdevicecontext
    ADD CONSTRAINT dcim_virtualdevicecontext_device_name UNIQUE (device_id, name);


--
-- Name: dcim_virtualdevicecontext dcim_virtualdevicecontext_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_virtualdevicecontext
    ADD CONSTRAINT dcim_virtualdevicecontext_pkey PRIMARY KEY (id);


--
-- Name: dcim_virtualdevicecontext dcim_virtualdevicecontext_primary_ip4_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_virtualdevicecontext
    ADD CONSTRAINT dcim_virtualdevicecontext_primary_ip4_id_key UNIQUE (primary_ip4_id);


--
-- Name: dcim_virtualdevicecontext dcim_virtualdevicecontext_primary_ip6_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_virtualdevicecontext
    ADD CONSTRAINT dcim_virtualdevicecontext_primary_ip6_id_key UNIQUE (primary_ip6_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: extras_branch extras_branch_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_branch
    ADD CONSTRAINT extras_branch_name_key UNIQUE (name);


--
-- Name: extras_branch extras_branch_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_branch
    ADD CONSTRAINT extras_branch_pkey PRIMARY KEY (id);


--
-- Name: extras_cachedvalue extras_cachedvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_cachedvalue
    ADD CONSTRAINT extras_cachedvalue_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_clusters extras_configcontext_clu_configcontext_id_cluster_0c7e5d20_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_clusters
    ADD CONSTRAINT extras_configcontext_clu_configcontext_id_cluster_0c7e5d20_uniq UNIQUE (configcontext_id, cluster_id);


--
-- Name: extras_configcontext_cluster_types extras_configcontext_clu_configcontext_id_cluster_4a2d5e56_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_cluster_types
    ADD CONSTRAINT extras_configcontext_clu_configcontext_id_cluster_4a2d5e56_uniq UNIQUE (configcontext_id, clustertype_id);


--
-- Name: extras_configcontext_cluster_groups extras_configcontext_clu_configcontext_id_cluster_bc530192_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_cluster_groups
    ADD CONSTRAINT extras_configcontext_clu_configcontext_id_cluster_bc530192_uniq UNIQUE (configcontext_id, clustergroup_id);


--
-- Name: extras_configcontext_cluster_groups extras_configcontext_cluster_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_cluster_groups
    ADD CONSTRAINT extras_configcontext_cluster_groups_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_cluster_types extras_configcontext_cluster_types_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_cluster_types
    ADD CONSTRAINT extras_configcontext_cluster_types_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_clusters extras_configcontext_clusters_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_clusters
    ADD CONSTRAINT extras_configcontext_clusters_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_device_types extras_configcontext_dev_configcontext_id_devicet_a0aaba6f_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_device_types
    ADD CONSTRAINT extras_configcontext_dev_configcontext_id_devicet_a0aaba6f_uniq UNIQUE (configcontext_id, devicetype_id);


--
-- Name: extras_configcontext_device_types extras_configcontext_device_types_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_device_types
    ADD CONSTRAINT extras_configcontext_device_types_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_locations extras_configcontext_loc_configcontext_id_locatio_15d9b342_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_locations
    ADD CONSTRAINT extras_configcontext_loc_configcontext_id_locatio_15d9b342_uniq UNIQUE (configcontext_id, location_id);


--
-- Name: extras_configcontext_locations extras_configcontext_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_locations
    ADD CONSTRAINT extras_configcontext_locations_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext extras_configcontext_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext
    ADD CONSTRAINT extras_configcontext_name_key UNIQUE (name);


--
-- Name: extras_configcontext extras_configcontext_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext
    ADD CONSTRAINT extras_configcontext_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_platforms extras_configcontext_pla_configcontext_id_platfor_3c67c104_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_platforms
    ADD CONSTRAINT extras_configcontext_pla_configcontext_id_platfor_3c67c104_uniq UNIQUE (configcontext_id, platform_id);


--
-- Name: extras_configcontext_platforms extras_configcontext_platforms_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_platforms
    ADD CONSTRAINT extras_configcontext_platforms_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_regions extras_configcontext_reg_configcontext_id_region__d4a1d77f_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_regions
    ADD CONSTRAINT extras_configcontext_reg_configcontext_id_region__d4a1d77f_uniq UNIQUE (configcontext_id, region_id);


--
-- Name: extras_configcontext_regions extras_configcontext_regions_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_regions
    ADD CONSTRAINT extras_configcontext_regions_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_roles extras_configcontext_rol_configcontext_id_devicer_4d8dbb50_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_roles
    ADD CONSTRAINT extras_configcontext_rol_configcontext_id_devicer_4d8dbb50_uniq UNIQUE (configcontext_id, devicerole_id);


--
-- Name: extras_configcontext_roles extras_configcontext_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_roles
    ADD CONSTRAINT extras_configcontext_roles_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_sites extras_configcontext_sit_configcontext_id_site_id_a4fe5f4f_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_sites
    ADD CONSTRAINT extras_configcontext_sit_configcontext_id_site_id_a4fe5f4f_uniq UNIQUE (configcontext_id, site_id);


--
-- Name: extras_configcontext_site_groups extras_configcontext_sit_configcontext_id_sitegro_4caa52ec_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_site_groups
    ADD CONSTRAINT extras_configcontext_sit_configcontext_id_sitegro_4caa52ec_uniq UNIQUE (configcontext_id, sitegroup_id);


--
-- Name: extras_configcontext_site_groups extras_configcontext_site_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_site_groups
    ADD CONSTRAINT extras_configcontext_site_groups_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_sites extras_configcontext_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_sites
    ADD CONSTRAINT extras_configcontext_sites_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_tags extras_configcontext_tags_configcontext_id_tag_id_f6c53016_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tags
    ADD CONSTRAINT extras_configcontext_tags_configcontext_id_tag_id_f6c53016_uniq UNIQUE (configcontext_id, tag_id);


--
-- Name: extras_configcontext_tags extras_configcontext_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tags
    ADD CONSTRAINT extras_configcontext_tags_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_tenants extras_configcontext_ten_configcontext_id_tenant__aefb257d_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenants
    ADD CONSTRAINT extras_configcontext_ten_configcontext_id_tenant__aefb257d_uniq UNIQUE (configcontext_id, tenant_id);


--
-- Name: extras_configcontext_tenant_groups extras_configcontext_ten_configcontext_id_tenantg_d6afc6f5_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenant_groups
    ADD CONSTRAINT extras_configcontext_ten_configcontext_id_tenantg_d6afc6f5_uniq UNIQUE (configcontext_id, tenantgroup_id);


--
-- Name: extras_configcontext_tenant_groups extras_configcontext_tenant_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenant_groups
    ADD CONSTRAINT extras_configcontext_tenant_groups_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_tenants extras_configcontext_tenants_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenants
    ADD CONSTRAINT extras_configcontext_tenants_pkey PRIMARY KEY (id);


--
-- Name: extras_configrevision extras_configrevision_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configrevision
    ADD CONSTRAINT extras_configrevision_pkey PRIMARY KEY (id);


--
-- Name: extras_customfield_content_types extras_customfield_conte_customfield_id_contentty_51136c2b_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield_content_types
    ADD CONSTRAINT extras_customfield_conte_customfield_id_contentty_51136c2b_uniq UNIQUE (customfield_id, contenttype_id);


--
-- Name: extras_customfield_content_types extras_customfield_content_types_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield_content_types
    ADD CONSTRAINT extras_customfield_content_types_pkey PRIMARY KEY (id);


--
-- Name: extras_customfield extras_customfield_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield
    ADD CONSTRAINT extras_customfield_name_key UNIQUE (name);


--
-- Name: extras_customfield extras_customfield_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield
    ADD CONSTRAINT extras_customfield_pkey PRIMARY KEY (id);


--
-- Name: extras_customlink_content_types extras_customlink_conten_customlink_id_contenttyp_518ef1b8_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customlink_content_types
    ADD CONSTRAINT extras_customlink_conten_customlink_id_contenttyp_518ef1b8_uniq UNIQUE (customlink_id, contenttype_id);


--
-- Name: extras_customlink_content_types extras_customlink_content_types_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customlink_content_types
    ADD CONSTRAINT extras_customlink_content_types_pkey PRIMARY KEY (id);


--
-- Name: extras_customlink extras_customlink_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customlink
    ADD CONSTRAINT extras_customlink_name_key UNIQUE (name);


--
-- Name: extras_customlink extras_customlink_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customlink
    ADD CONSTRAINT extras_customlink_pkey PRIMARY KEY (id);


--
-- Name: extras_exporttemplate_content_types extras_exporttemplate_co_exporttemplate_id_conten_b4645653_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_exporttemplate_content_types
    ADD CONSTRAINT extras_exporttemplate_co_exporttemplate_id_conten_b4645653_uniq UNIQUE (exporttemplate_id, contenttype_id);


--
-- Name: extras_exporttemplate_content_types extras_exporttemplate_content_types_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_exporttemplate_content_types
    ADD CONSTRAINT extras_exporttemplate_content_types_pkey PRIMARY KEY (id);


--
-- Name: extras_exporttemplate extras_exporttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_exporttemplate
    ADD CONSTRAINT extras_exporttemplate_pkey PRIMARY KEY (id);


--
-- Name: extras_imageattachment extras_imageattachment_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_imageattachment
    ADD CONSTRAINT extras_imageattachment_pkey PRIMARY KEY (id);


--
-- Name: extras_jobresult extras_jobresult_job_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_jobresult
    ADD CONSTRAINT extras_jobresult_job_id_key UNIQUE (job_id);


--
-- Name: extras_jobresult extras_jobresult_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_jobresult
    ADD CONSTRAINT extras_jobresult_pkey PRIMARY KEY (id);


--
-- Name: extras_journalentry extras_journalentry_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_journalentry
    ADD CONSTRAINT extras_journalentry_pkey PRIMARY KEY (id);


--
-- Name: extras_objectchange extras_objectchange_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_objectchange
    ADD CONSTRAINT extras_objectchange_pkey PRIMARY KEY (id);


--
-- Name: extras_savedfilter_content_types extras_savedfilter_conte_savedfilter_id_contentty_133ba781_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_savedfilter_content_types
    ADD CONSTRAINT extras_savedfilter_conte_savedfilter_id_contentty_133ba781_uniq UNIQUE (savedfilter_id, contenttype_id);


--
-- Name: extras_savedfilter_content_types extras_savedfilter_content_types_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_savedfilter_content_types
    ADD CONSTRAINT extras_savedfilter_content_types_pkey PRIMARY KEY (id);


--
-- Name: extras_savedfilter extras_savedfilter_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_savedfilter
    ADD CONSTRAINT extras_savedfilter_name_key UNIQUE (name);


--
-- Name: extras_savedfilter extras_savedfilter_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_savedfilter
    ADD CONSTRAINT extras_savedfilter_pkey PRIMARY KEY (id);


--
-- Name: extras_savedfilter extras_savedfilter_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_savedfilter
    ADD CONSTRAINT extras_savedfilter_slug_key UNIQUE (slug);


--
-- Name: extras_stagedchange extras_stagedchange_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_stagedchange
    ADD CONSTRAINT extras_stagedchange_pkey PRIMARY KEY (id);


--
-- Name: extras_tag extras_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_tag
    ADD CONSTRAINT extras_tag_name_key UNIQUE (name);


--
-- Name: extras_tag extras_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_tag
    ADD CONSTRAINT extras_tag_pkey PRIMARY KEY (id);


--
-- Name: extras_tag extras_tag_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_tag
    ADD CONSTRAINT extras_tag_slug_key UNIQUE (slug);


--
-- Name: extras_taggeditem extras_taggeditem_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_taggeditem
    ADD CONSTRAINT extras_taggeditem_pkey PRIMARY KEY (id);


--
-- Name: extras_webhook_content_types extras_webhook_content_t_webhook_id_contenttype_i_485b9e93_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook_content_types
    ADD CONSTRAINT extras_webhook_content_t_webhook_id_contenttype_i_485b9e93_uniq UNIQUE (webhook_id, contenttype_id);


--
-- Name: extras_webhook_content_types extras_webhook_content_types_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook_content_types
    ADD CONSTRAINT extras_webhook_content_types_pkey PRIMARY KEY (id);


--
-- Name: extras_webhook extras_webhook_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook
    ADD CONSTRAINT extras_webhook_name_key UNIQUE (name);


--
-- Name: extras_webhook extras_webhook_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook
    ADD CONSTRAINT extras_webhook_pkey PRIMARY KEY (id);


--
-- Name: extras_webhook extras_webhook_unique_payload_url_types; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook
    ADD CONSTRAINT extras_webhook_unique_payload_url_types UNIQUE (payload_url, type_create, type_update, type_delete);


--
-- Name: ipam_aggregate ipam_aggregate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_aggregate
    ADD CONSTRAINT ipam_aggregate_pkey PRIMARY KEY (id);


--
-- Name: ipam_asn ipam_asn_asn_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_asn
    ADD CONSTRAINT ipam_asn_asn_key UNIQUE (asn);


--
-- Name: ipam_asn ipam_asn_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_asn
    ADD CONSTRAINT ipam_asn_pkey PRIMARY KEY (id);


--
-- Name: ipam_fhrpgroup ipam_fhrpgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_fhrpgroup
    ADD CONSTRAINT ipam_fhrpgroup_pkey PRIMARY KEY (id);


--
-- Name: ipam_fhrpgroupassignment ipam_fhrpgroupassignment_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_fhrpgroupassignment
    ADD CONSTRAINT ipam_fhrpgroupassignment_pkey PRIMARY KEY (id);


--
-- Name: ipam_fhrpgroupassignment ipam_fhrpgroupassignment_unique_interface_group; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_fhrpgroupassignment
    ADD CONSTRAINT ipam_fhrpgroupassignment_unique_interface_group UNIQUE (interface_type_id, interface_id, group_id);


--
-- Name: ipam_ipaddress ipam_ipaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_pkey PRIMARY KEY (id);


--
-- Name: ipam_iprange ipam_iprange_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_iprange
    ADD CONSTRAINT ipam_iprange_pkey PRIMARY KEY (id);


--
-- Name: ipam_l2vpn_export_targets ipam_l2vpn_export_targets_l2vpn_id_routetarget_id_eea90661_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_l2vpn_export_targets
    ADD CONSTRAINT ipam_l2vpn_export_targets_l2vpn_id_routetarget_id_eea90661_uniq UNIQUE (l2vpn_id, routetarget_id);


--
-- Name: ipam_l2vpn_export_targets ipam_l2vpn_export_targets_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_l2vpn_export_targets
    ADD CONSTRAINT ipam_l2vpn_export_targets_pkey PRIMARY KEY (id);


--
-- Name: ipam_l2vpn_import_targets ipam_l2vpn_import_targets_l2vpn_id_routetarget_id_96af344c_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_l2vpn_import_targets
    ADD CONSTRAINT ipam_l2vpn_import_targets_l2vpn_id_routetarget_id_96af344c_uniq UNIQUE (l2vpn_id, routetarget_id);


--
-- Name: ipam_l2vpn_import_targets ipam_l2vpn_import_targets_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_l2vpn_import_targets
    ADD CONSTRAINT ipam_l2vpn_import_targets_pkey PRIMARY KEY (id);


--
-- Name: ipam_l2vpn ipam_l2vpn_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_l2vpn
    ADD CONSTRAINT ipam_l2vpn_name_key UNIQUE (name);


--
-- Name: ipam_l2vpn ipam_l2vpn_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_l2vpn
    ADD CONSTRAINT ipam_l2vpn_pkey PRIMARY KEY (id);


--
-- Name: ipam_l2vpn ipam_l2vpn_slug_24008406_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_l2vpn
    ADD CONSTRAINT ipam_l2vpn_slug_24008406_uniq UNIQUE (slug);


--
-- Name: ipam_l2vpntermination ipam_l2vpntermination_assigned_object; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_l2vpntermination
    ADD CONSTRAINT ipam_l2vpntermination_assigned_object UNIQUE (assigned_object_type_id, assigned_object_id);


--
-- Name: ipam_l2vpntermination ipam_l2vpntermination_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_l2vpntermination
    ADD CONSTRAINT ipam_l2vpntermination_pkey PRIMARY KEY (id);


--
-- Name: ipam_prefix ipam_prefix_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_pkey PRIMARY KEY (id);


--
-- Name: ipam_rir ipam_rir_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_rir
    ADD CONSTRAINT ipam_rir_name_key UNIQUE (name);


--
-- Name: ipam_rir ipam_rir_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_rir
    ADD CONSTRAINT ipam_rir_pkey PRIMARY KEY (id);


--
-- Name: ipam_rir ipam_rir_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_rir
    ADD CONSTRAINT ipam_rir_slug_key UNIQUE (slug);


--
-- Name: ipam_role ipam_role_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_role
    ADD CONSTRAINT ipam_role_name_key UNIQUE (name);


--
-- Name: ipam_role ipam_role_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_role
    ADD CONSTRAINT ipam_role_pkey PRIMARY KEY (id);


--
-- Name: ipam_role ipam_role_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_role
    ADD CONSTRAINT ipam_role_slug_key UNIQUE (slug);


--
-- Name: ipam_routetarget ipam_routetarget_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_routetarget
    ADD CONSTRAINT ipam_routetarget_name_key UNIQUE (name);


--
-- Name: ipam_routetarget ipam_routetarget_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_routetarget
    ADD CONSTRAINT ipam_routetarget_pkey PRIMARY KEY (id);


--
-- Name: ipam_service_ipaddresses ipam_service_ipaddresses_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service_ipaddresses
    ADD CONSTRAINT ipam_service_ipaddresses_pkey PRIMARY KEY (id);


--
-- Name: ipam_service_ipaddresses ipam_service_ipaddresses_service_id_ipaddress_id_d019a805_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service_ipaddresses
    ADD CONSTRAINT ipam_service_ipaddresses_service_id_ipaddress_id_d019a805_uniq UNIQUE (service_id, ipaddress_id);


--
-- Name: ipam_service ipam_service_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service
    ADD CONSTRAINT ipam_service_pkey PRIMARY KEY (id);


--
-- Name: ipam_servicetemplate ipam_servicetemplate_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_servicetemplate
    ADD CONSTRAINT ipam_servicetemplate_name_key UNIQUE (name);


--
-- Name: ipam_servicetemplate ipam_servicetemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_servicetemplate
    ADD CONSTRAINT ipam_servicetemplate_pkey PRIMARY KEY (id);


--
-- Name: ipam_vlan ipam_vlan_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_pkey PRIMARY KEY (id);


--
-- Name: ipam_vlan ipam_vlan_unique_group_name; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_unique_group_name UNIQUE (group_id, name);


--
-- Name: ipam_vlan ipam_vlan_unique_group_vid; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_unique_group_vid UNIQUE (group_id, vid);


--
-- Name: ipam_vlangroup ipam_vlangroup_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlangroup
    ADD CONSTRAINT ipam_vlangroup_pkey PRIMARY KEY (id);


--
-- Name: ipam_vlangroup ipam_vlangroup_unique_scope_name; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlangroup
    ADD CONSTRAINT ipam_vlangroup_unique_scope_name UNIQUE (scope_type_id, scope_id, name);


--
-- Name: ipam_vlangroup ipam_vlangroup_unique_scope_slug; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlangroup
    ADD CONSTRAINT ipam_vlangroup_unique_scope_slug UNIQUE (scope_type_id, scope_id, slug);


--
-- Name: ipam_vrf_export_targets ipam_vrf_export_targets_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf_export_targets
    ADD CONSTRAINT ipam_vrf_export_targets_pkey PRIMARY KEY (id);


--
-- Name: ipam_vrf_export_targets ipam_vrf_export_targets_vrf_id_routetarget_id_63ba8c62_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf_export_targets
    ADD CONSTRAINT ipam_vrf_export_targets_vrf_id_routetarget_id_63ba8c62_uniq UNIQUE (vrf_id, routetarget_id);


--
-- Name: ipam_vrf_import_targets ipam_vrf_import_targets_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf_import_targets
    ADD CONSTRAINT ipam_vrf_import_targets_pkey PRIMARY KEY (id);


--
-- Name: ipam_vrf_import_targets ipam_vrf_import_targets_vrf_id_routetarget_id_399b155f_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf_import_targets
    ADD CONSTRAINT ipam_vrf_import_targets_vrf_id_routetarget_id_399b155f_uniq UNIQUE (vrf_id, routetarget_id);


--
-- Name: ipam_vrf ipam_vrf_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf
    ADD CONSTRAINT ipam_vrf_pkey PRIMARY KEY (id);


--
-- Name: ipam_vrf ipam_vrf_rd_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf
    ADD CONSTRAINT ipam_vrf_rd_key UNIQUE (rd);


--
-- Name: social_auth_association social_auth_association_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.social_auth_association
    ADD CONSTRAINT social_auth_association_pkey PRIMARY KEY (id);


--
-- Name: social_auth_association social_auth_association_server_url_handle_078befa2_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.social_auth_association
    ADD CONSTRAINT social_auth_association_server_url_handle_078befa2_uniq UNIQUE (server_url, handle);


--
-- Name: social_auth_code social_auth_code_email_code_801b2d02_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.social_auth_code
    ADD CONSTRAINT social_auth_code_email_code_801b2d02_uniq UNIQUE (email, code);


--
-- Name: social_auth_code social_auth_code_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.social_auth_code
    ADD CONSTRAINT social_auth_code_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce social_auth_nonce_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce social_auth_nonce_server_url_timestamp_salt_f6284463_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_server_url_timestamp_salt_f6284463_uniq UNIQUE (server_url, "timestamp", salt);


--
-- Name: social_auth_partial social_auth_partial_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.social_auth_partial
    ADD CONSTRAINT social_auth_partial_pkey PRIMARY KEY (id);


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_pkey PRIMARY KEY (id);


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_provider_uid_e6b5e668_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_provider_uid_e6b5e668_uniq UNIQUE (provider, uid);


--
-- Name: taggit_tag taggit_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_name_key UNIQUE (name);


--
-- Name: taggit_tag taggit_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_pkey PRIMARY KEY (id);


--
-- Name: taggit_tag taggit_tag_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_slug_key UNIQUE (slug);


--
-- Name: taggit_taggeditem taggit_taggeditem_content_type_id_object_i_4bb97a8e_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_content_type_id_object_i_4bb97a8e_uniq UNIQUE (content_type_id, object_id, tag_id);


--
-- Name: taggit_taggeditem taggit_taggeditem_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_pkey PRIMARY KEY (id);


--
-- Name: tenancy_contact tenancy_contact_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_contact
    ADD CONSTRAINT tenancy_contact_pkey PRIMARY KEY (id);


--
-- Name: tenancy_contact tenancy_contact_unique_group_name; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_contact
    ADD CONSTRAINT tenancy_contact_unique_group_name UNIQUE (group_id, name);


--
-- Name: tenancy_contactassignment tenancy_contactassignment_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_contactassignment
    ADD CONSTRAINT tenancy_contactassignment_pkey PRIMARY KEY (id);


--
-- Name: tenancy_contactassignment tenancy_contactassignment_unique_object_contact_role; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_contactassignment
    ADD CONSTRAINT tenancy_contactassignment_unique_object_contact_role UNIQUE (content_type_id, object_id, contact_id, role_id);


--
-- Name: tenancy_contactgroup tenancy_contactgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_contactgroup
    ADD CONSTRAINT tenancy_contactgroup_pkey PRIMARY KEY (id);


--
-- Name: tenancy_contactgroup tenancy_contactgroup_unique_parent_name; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_contactgroup
    ADD CONSTRAINT tenancy_contactgroup_unique_parent_name UNIQUE (parent_id, name);


--
-- Name: tenancy_contactrole tenancy_contactrole_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_contactrole
    ADD CONSTRAINT tenancy_contactrole_name_key UNIQUE (name);


--
-- Name: tenancy_contactrole tenancy_contactrole_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_contactrole
    ADD CONSTRAINT tenancy_contactrole_pkey PRIMARY KEY (id);


--
-- Name: tenancy_contactrole tenancy_contactrole_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_contactrole
    ADD CONSTRAINT tenancy_contactrole_slug_key UNIQUE (slug);


--
-- Name: tenancy_tenant tenancy_tenant_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenant
    ADD CONSTRAINT tenancy_tenant_name_key UNIQUE (name);


--
-- Name: tenancy_tenant tenancy_tenant_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenant
    ADD CONSTRAINT tenancy_tenant_pkey PRIMARY KEY (id);


--
-- Name: tenancy_tenant tenancy_tenant_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenant
    ADD CONSTRAINT tenancy_tenant_slug_key UNIQUE (slug);


--
-- Name: tenancy_tenantgroup tenancy_tenantgroup_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenantgroup
    ADD CONSTRAINT tenancy_tenantgroup_name_key UNIQUE (name);


--
-- Name: tenancy_tenantgroup tenancy_tenantgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenantgroup
    ADD CONSTRAINT tenancy_tenantgroup_pkey PRIMARY KEY (id);


--
-- Name: tenancy_tenantgroup tenancy_tenantgroup_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenantgroup
    ADD CONSTRAINT tenancy_tenantgroup_slug_key UNIQUE (slug);


--
-- Name: users_objectpermission_groups users_objectpermission_g_objectpermission_id_grou_3b62a39c_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_groups
    ADD CONSTRAINT users_objectpermission_g_objectpermission_id_grou_3b62a39c_uniq UNIQUE (objectpermission_id, group_id);


--
-- Name: users_objectpermission_groups users_objectpermission_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_groups
    ADD CONSTRAINT users_objectpermission_groups_pkey PRIMARY KEY (id);


--
-- Name: users_objectpermission_object_types users_objectpermission_o_objectpermission_id_cont_7c40d31a_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_object_types
    ADD CONSTRAINT users_objectpermission_o_objectpermission_id_cont_7c40d31a_uniq UNIQUE (objectpermission_id, contenttype_id);


--
-- Name: users_objectpermission_object_types users_objectpermission_object_types_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_object_types
    ADD CONSTRAINT users_objectpermission_object_types_pkey PRIMARY KEY (id);


--
-- Name: users_objectpermission users_objectpermission_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission
    ADD CONSTRAINT users_objectpermission_pkey PRIMARY KEY (id);


--
-- Name: users_objectpermission_users users_objectpermission_u_objectpermission_id_user_3a7db108_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_users
    ADD CONSTRAINT users_objectpermission_u_objectpermission_id_user_3a7db108_uniq UNIQUE (objectpermission_id, user_id);


--
-- Name: users_objectpermission_users users_objectpermission_users_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_users
    ADD CONSTRAINT users_objectpermission_users_pkey PRIMARY KEY (id);


--
-- Name: users_token users_token_key_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_token
    ADD CONSTRAINT users_token_key_key UNIQUE (key);


--
-- Name: users_token users_token_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_token
    ADD CONSTRAINT users_token_pkey PRIMARY KEY (id);


--
-- Name: users_userconfig users_userconfig_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_userconfig
    ADD CONSTRAINT users_userconfig_pkey PRIMARY KEY (id);


--
-- Name: users_userconfig users_userconfig_user_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_userconfig
    ADD CONSTRAINT users_userconfig_user_id_key UNIQUE (user_id);


--
-- Name: virtualization_cluster virtualization_cluster_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_cluster_pkey PRIMARY KEY (id);


--
-- Name: virtualization_cluster virtualization_cluster_unique_group_name; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_cluster_unique_group_name UNIQUE (group_id, name);


--
-- Name: virtualization_cluster virtualization_cluster_unique_site_name; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_cluster_unique_site_name UNIQUE (site_id, name);


--
-- Name: virtualization_clustergroup virtualization_clustergroup_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustergroup
    ADD CONSTRAINT virtualization_clustergroup_name_key UNIQUE (name);


--
-- Name: virtualization_clustergroup virtualization_clustergroup_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustergroup
    ADD CONSTRAINT virtualization_clustergroup_pkey PRIMARY KEY (id);


--
-- Name: virtualization_clustergroup virtualization_clustergroup_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustergroup
    ADD CONSTRAINT virtualization_clustergroup_slug_key UNIQUE (slug);


--
-- Name: virtualization_clustertype virtualization_clustertype_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustertype
    ADD CONSTRAINT virtualization_clustertype_name_key UNIQUE (name);


--
-- Name: virtualization_clustertype virtualization_clustertype_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustertype
    ADD CONSTRAINT virtualization_clustertype_pkey PRIMARY KEY (id);


--
-- Name: virtualization_clustertype virtualization_clustertype_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustertype
    ADD CONSTRAINT virtualization_clustertype_slug_key UNIQUE (slug);


--
-- Name: virtualization_virtualmachine virtualization_virtualmachine_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtualmachine_pkey PRIMARY KEY (id);


--
-- Name: virtualization_virtualmachine virtualization_virtualmachine_primary_ip4_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtualmachine_primary_ip4_id_key UNIQUE (primary_ip4_id);


--
-- Name: virtualization_virtualmachine virtualization_virtualmachine_primary_ip6_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtualmachine_primary_ip6_id_key UNIQUE (primary_ip6_id);


--
-- Name: virtualization_vminterface_tagged_vlans virtualization_vminterfa_vminterface_id_vlan_id_27e907db_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface_tagged_vlans
    ADD CONSTRAINT virtualization_vminterfa_vminterface_id_vlan_id_27e907db_uniq UNIQUE (vminterface_id, vlan_id);


--
-- Name: virtualization_vminterface virtualization_vminterface_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface
    ADD CONSTRAINT virtualization_vminterface_pkey PRIMARY KEY (id);


--
-- Name: virtualization_vminterface_tagged_vlans virtualization_vminterface_tagged_vlans_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface_tagged_vlans
    ADD CONSTRAINT virtualization_vminterface_tagged_vlans_pkey PRIMARY KEY (id);


--
-- Name: virtualization_vminterface virtualization_vminterface_unique_virtual_machine_name; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface
    ADD CONSTRAINT virtualization_vminterface_unique_virtual_machine_name UNIQUE (virtual_machine_id, name);


--
-- Name: wireless_wirelesslan wireless_wirelesslan_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.wireless_wirelesslan
    ADD CONSTRAINT wireless_wirelesslan_pkey PRIMARY KEY (id);


--
-- Name: wireless_wirelesslangroup wireless_wirelesslangroup_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.wireless_wirelesslangroup
    ADD CONSTRAINT wireless_wirelesslangroup_name_key UNIQUE (name);


--
-- Name: wireless_wirelesslangroup wireless_wirelesslangroup_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.wireless_wirelesslangroup
    ADD CONSTRAINT wireless_wirelesslangroup_pkey PRIMARY KEY (id);


--
-- Name: wireless_wirelesslangroup wireless_wirelesslangroup_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.wireless_wirelesslangroup
    ADD CONSTRAINT wireless_wirelesslangroup_slug_key UNIQUE (slug);


--
-- Name: wireless_wirelesslangroup wireless_wirelesslangroup_unique_parent_name; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.wireless_wirelesslangroup
    ADD CONSTRAINT wireless_wirelesslangroup_unique_parent_name UNIQUE (parent_id, name);


--
-- Name: wireless_wirelesslink wireless_wirelesslink_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.wireless_wirelesslink
    ADD CONSTRAINT wireless_wirelesslink_pkey PRIMARY KEY (id);


--
-- Name: wireless_wirelesslink wireless_wirelesslink_unique_interfaces; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.wireless_wirelesslink
    ADD CONSTRAINT wireless_wirelesslink_unique_interfaces UNIQUE (interface_a_id, interface_b_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: circuits_circuit_provider_id_d9195418; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuit_provider_id_d9195418 ON public.circuits_circuit USING btree (provider_id);


--
-- Name: circuits_circuit_tenant_id_812508a5; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuit_tenant_id_812508a5 ON public.circuits_circuit USING btree (tenant_id);


--
-- Name: circuits_circuit_termination_a_id_f891adac; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuit_termination_a_id_f891adac ON public.circuits_circuit USING btree (termination_a_id);


--
-- Name: circuits_circuit_termination_z_id_377b8551; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuit_termination_z_id_377b8551 ON public.circuits_circuit USING btree (termination_z_id);


--
-- Name: circuits_circuit_type_id_1b9f485a; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuit_type_id_1b9f485a ON public.circuits_circuit USING btree (type_id);


--
-- Name: circuits_circuittermination_cable_id_35e9f703; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuittermination_cable_id_35e9f703 ON public.circuits_circuittermination USING btree (cable_id);


--
-- Name: circuits_circuittermination_circuit_id_257e87e7; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuittermination_circuit_id_257e87e7 ON public.circuits_circuittermination USING btree (circuit_id);


--
-- Name: circuits_circuittermination_provider_network_id_b0c660f1; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuittermination_provider_network_id_b0c660f1 ON public.circuits_circuittermination USING btree (provider_network_id);


--
-- Name: circuits_circuittermination_site_id_e6fe5652; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuittermination_site_id_e6fe5652 ON public.circuits_circuittermination USING btree (site_id);


--
-- Name: circuits_circuittype_name_8256ea9a_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuittype_name_8256ea9a_like ON public.circuits_circuittype USING btree (name varchar_pattern_ops);


--
-- Name: circuits_circuittype_slug_9b4b3cf9_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuittype_slug_9b4b3cf9_like ON public.circuits_circuittype USING btree (slug varchar_pattern_ops);


--
-- Name: circuits_provider_asns_asn_id_0a6c53b3; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_provider_asns_asn_id_0a6c53b3 ON public.circuits_provider_asns USING btree (asn_id);


--
-- Name: circuits_provider_asns_provider_id_becc3f7e; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_provider_asns_provider_id_becc3f7e ON public.circuits_provider_asns USING btree (provider_id);


--
-- Name: circuits_provider_name_8f2514f5_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_provider_name_8f2514f5_like ON public.circuits_provider USING btree (name varchar_pattern_ops);


--
-- Name: circuits_provider_slug_c3c0aa10_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_provider_slug_c3c0aa10_like ON public.circuits_provider USING btree (slug varchar_pattern_ops);


--
-- Name: circuits_providernetwork_provider_id_7992236c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_providernetwork_provider_id_7992236c ON public.circuits_providernetwork USING btree (provider_id);


--
-- Name: dcim_cable_tenant_id_3a7fdbb8; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_cable_tenant_id_3a7fdbb8 ON public.dcim_cable USING btree (tenant_id);


--
-- Name: dcim_cabletermination__device_id_f5884934; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_cabletermination__device_id_f5884934 ON public.dcim_cabletermination USING btree (_device_id);


--
-- Name: dcim_cabletermination__location_id_ff4be503; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_cabletermination__location_id_ff4be503 ON public.dcim_cabletermination USING btree (_location_id);


--
-- Name: dcim_cabletermination__rack_id_83a548e1; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_cabletermination__rack_id_83a548e1 ON public.dcim_cabletermination USING btree (_rack_id);


--
-- Name: dcim_cabletermination__site_id_616962fa; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_cabletermination__site_id_616962fa ON public.dcim_cabletermination USING btree (_site_id);


--
-- Name: dcim_cabletermination_cable_id_b50010d1; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_cabletermination_cable_id_b50010d1 ON public.dcim_cabletermination USING btree (cable_id);


--
-- Name: dcim_cabletermination_termination_type_id_20da439e; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_cabletermination_termination_type_id_20da439e ON public.dcim_cabletermination USING btree (termination_type_id);


--
-- Name: dcim_consoleport__path_id_e40a4436; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleport__path_id_e40a4436 ON public.dcim_consoleport USING btree (_path_id);


--
-- Name: dcim_consoleport_cable_id_a9ae5465; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleport_cable_id_a9ae5465 ON public.dcim_consoleport USING btree (cable_id);


--
-- Name: dcim_consoleport_device_id_f2d90d3c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleport_device_id_f2d90d3c ON public.dcim_consoleport USING btree (device_id);


--
-- Name: dcim_consoleport_module_id_d17b2519; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleport_module_id_d17b2519 ON public.dcim_consoleport USING btree (module_id);


--
-- Name: dcim_consoleporttemplate_device_type_id_075d4015; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleporttemplate_device_type_id_075d4015 ON public.dcim_consoleporttemplate USING btree (device_type_id);


--
-- Name: dcim_consoleporttemplate_module_type_id_c0f35d97; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleporttemplate_module_type_id_c0f35d97 ON public.dcim_consoleporttemplate USING btree (module_type_id);


--
-- Name: dcim_consoleserverport__path_id_dc5abe09; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleserverport__path_id_dc5abe09 ON public.dcim_consoleserverport USING btree (_path_id);


--
-- Name: dcim_consoleserverport_cable_id_f2940dfd; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleserverport_cable_id_f2940dfd ON public.dcim_consoleserverport USING btree (cable_id);


--
-- Name: dcim_consoleserverport_device_id_d9866581; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleserverport_device_id_d9866581 ON public.dcim_consoleserverport USING btree (device_id);


--
-- Name: dcim_consoleserverport_module_id_d060cfc8; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleserverport_module_id_d060cfc8 ON public.dcim_consoleserverport USING btree (module_id);


--
-- Name: dcim_consoleserverporttemplate_device_type_id_579bdc86; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleserverporttemplate_device_type_id_579bdc86 ON public.dcim_consoleserverporttemplate USING btree (device_type_id);


--
-- Name: dcim_consoleserverporttemplate_module_type_id_4abf751a; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleserverporttemplate_module_type_id_4abf751a ON public.dcim_consoleserverporttemplate USING btree (module_type_id);


--
-- Name: dcim_device_asset_tag_8dac1079_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_asset_tag_8dac1079_like ON public.dcim_device USING btree (asset_tag varchar_pattern_ops);


--
-- Name: dcim_device_cluster_id_cf852f78; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_cluster_id_cf852f78 ON public.dcim_device USING btree (cluster_id);


--
-- Name: dcim_device_device_role_id_682e8188; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_device_role_id_682e8188 ON public.dcim_device USING btree (device_role_id);


--
-- Name: dcim_device_device_type_id_d61b4086; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_device_type_id_d61b4086 ON public.dcim_device USING btree (device_type_id);


--
-- Name: dcim_device_location_id_11a7bedb; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_location_id_11a7bedb ON public.dcim_device USING btree (location_id);


--
-- Name: dcim_device_platform_id_468138f1; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_platform_id_468138f1 ON public.dcim_device USING btree (platform_id);


--
-- Name: dcim_device_rack_id_23bde71f; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_rack_id_23bde71f ON public.dcim_device USING btree (rack_id);


--
-- Name: dcim_device_site_id_ff897cf6; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_site_id_ff897cf6 ON public.dcim_device USING btree (site_id);


--
-- Name: dcim_device_tenant_id_dcea7969; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_tenant_id_dcea7969 ON public.dcim_device USING btree (tenant_id);


--
-- Name: dcim_device_unique_name_site; Type: INDEX; Schema: public; Owner: netbox
--

CREATE UNIQUE INDEX dcim_device_unique_name_site ON public.dcim_device USING btree (lower((name)::text), site_id) WHERE (tenant_id IS NULL);


--
-- Name: dcim_device_unique_name_site_tenant; Type: INDEX; Schema: public; Owner: netbox
--

CREATE UNIQUE INDEX dcim_device_unique_name_site_tenant ON public.dcim_device USING btree (lower((name)::text), site_id, tenant_id);


--
-- Name: dcim_device_virtual_chassis_id_aed51693; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_virtual_chassis_id_aed51693 ON public.dcim_device USING btree (virtual_chassis_id);


--
-- Name: dcim_devicebay_device_id_0c8a1218; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_devicebay_device_id_0c8a1218 ON public.dcim_devicebay USING btree (device_id);


--
-- Name: dcim_devicebaytemplate_device_type_id_f4b24a29; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_devicebaytemplate_device_type_id_f4b24a29 ON public.dcim_devicebaytemplate USING btree (device_type_id);


--
-- Name: dcim_devicerole_name_1c813306_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_devicerole_name_1c813306_like ON public.dcim_devicerole USING btree (name varchar_pattern_ops);


--
-- Name: dcim_devicerole_slug_7952643b_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_devicerole_slug_7952643b_like ON public.dcim_devicerole USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_devicetype_manufacturer_id_a3e8029e; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_devicetype_manufacturer_id_a3e8029e ON public.dcim_devicetype USING btree (manufacturer_id);


--
-- Name: dcim_devicetype_slug_448745bd; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_devicetype_slug_448745bd ON public.dcim_devicetype USING btree (slug);


--
-- Name: dcim_devicetype_slug_448745bd_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_devicetype_slug_448745bd_like ON public.dcim_devicetype USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_frontport_cable_id_04ff8aab; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_frontport_cable_id_04ff8aab ON public.dcim_frontport USING btree (cable_id);


--
-- Name: dcim_frontport_device_id_950557b5; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_frontport_device_id_950557b5 ON public.dcim_frontport USING btree (device_id);


--
-- Name: dcim_frontport_module_id_952c3f9a; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_frontport_module_id_952c3f9a ON public.dcim_frontport USING btree (module_id);


--
-- Name: dcim_frontport_rear_port_id_78df2532; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_frontport_rear_port_id_78df2532 ON public.dcim_frontport USING btree (rear_port_id);


--
-- Name: dcim_frontporttemplate_device_type_id_f088b952; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_frontporttemplate_device_type_id_f088b952 ON public.dcim_frontporttemplate USING btree (device_type_id);


--
-- Name: dcim_frontporttemplate_module_type_id_66851ff9; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_frontporttemplate_module_type_id_66851ff9 ON public.dcim_frontporttemplate USING btree (module_type_id);


--
-- Name: dcim_frontporttemplate_rear_port_id_9775411b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_frontporttemplate_rear_port_id_9775411b ON public.dcim_frontporttemplate USING btree (rear_port_id);


--
-- Name: dcim_interface__path_id_f8f4f7f0; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface__path_id_f8f4f7f0 ON public.dcim_interface USING btree (_path_id);


--
-- Name: dcim_interface_bridge_id_f2a8df85; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_bridge_id_f2a8df85 ON public.dcim_interface USING btree (bridge_id);


--
-- Name: dcim_interface_cable_id_1b264edb; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_cable_id_1b264edb ON public.dcim_interface USING btree (cable_id);


--
-- Name: dcim_interface_device_id_359c6115; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_device_id_359c6115 ON public.dcim_interface USING btree (device_id);


--
-- Name: dcim_interface_lag_id_ea1a1d12; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_lag_id_ea1a1d12 ON public.dcim_interface USING btree (lag_id);


--
-- Name: dcim_interface_module_id_05ca2da5; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_module_id_05ca2da5 ON public.dcim_interface USING btree (module_id);


--
-- Name: dcim_interface_parent_id_3e2b159b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_parent_id_3e2b159b ON public.dcim_interface USING btree (parent_id);


--
-- Name: dcim_interface_tagged_vlans_interface_id_5870c9e9; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_tagged_vlans_interface_id_5870c9e9 ON public.dcim_interface_tagged_vlans USING btree (interface_id);


--
-- Name: dcim_interface_tagged_vlans_vlan_id_e027005c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_tagged_vlans_vlan_id_e027005c ON public.dcim_interface_tagged_vlans USING btree (vlan_id);


--
-- Name: dcim_interface_untagged_vlan_id_838dc7be; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_untagged_vlan_id_838dc7be ON public.dcim_interface USING btree (untagged_vlan_id);


--
-- Name: dcim_interface_vdcs_interface_id_6d58dbaf; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_vdcs_interface_id_6d58dbaf ON public.dcim_interface_vdcs USING btree (interface_id);


--
-- Name: dcim_interface_vdcs_virtualdevicecontext_id_af0bfd4b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_vdcs_virtualdevicecontext_id_af0bfd4b ON public.dcim_interface_vdcs USING btree (virtualdevicecontext_id);


--
-- Name: dcim_interface_vrf_id_a92e59b2; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_vrf_id_a92e59b2 ON public.dcim_interface USING btree (vrf_id);


--
-- Name: dcim_interface_wireless_lans_interface_id_80df3785; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_wireless_lans_interface_id_80df3785 ON public.dcim_interface_wireless_lans USING btree (interface_id);


--
-- Name: dcim_interface_wireless_lans_wirelesslan_id_f081e278; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_wireless_lans_wirelesslan_id_f081e278 ON public.dcim_interface_wireless_lans USING btree (wirelesslan_id);


--
-- Name: dcim_interface_wireless_link_id_bc91108f; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_wireless_link_id_bc91108f ON public.dcim_interface USING btree (wireless_link_id);


--
-- Name: dcim_interfacetemplate_device_type_id_4bfcbfab; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interfacetemplate_device_type_id_4bfcbfab ON public.dcim_interfacetemplate USING btree (device_type_id);


--
-- Name: dcim_interfacetemplate_module_type_id_f941f180; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interfacetemplate_module_type_id_f941f180 ON public.dcim_interfacetemplate USING btree (module_type_id);


--
-- Name: dcim_inventoryitem_asset_tag_d3289273_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_inventoryitem_asset_tag_d3289273_like ON public.dcim_inventoryitem USING btree (asset_tag varchar_pattern_ops);


--
-- Name: dcim_inventoryitem_component_type_id_f0e4d83a; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_inventoryitem_component_type_id_f0e4d83a ON public.dcim_inventoryitem USING btree (component_type_id);


--
-- Name: dcim_inventoryitem_device_id_033d83f8; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_inventoryitem_device_id_033d83f8 ON public.dcim_inventoryitem USING btree (device_id);


--
-- Name: dcim_inventoryitem_manufacturer_id_dcd1b78a; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_inventoryitem_manufacturer_id_dcd1b78a ON public.dcim_inventoryitem USING btree (manufacturer_id);


--
-- Name: dcim_inventoryitem_parent_id_7ebcd457; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_inventoryitem_parent_id_7ebcd457 ON public.dcim_inventoryitem USING btree (parent_id);


--
-- Name: dcim_inventoryitem_role_id_2bcfcb04; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_inventoryitem_role_id_2bcfcb04 ON public.dcim_inventoryitem USING btree (role_id);


--
-- Name: dcim_inventoryitem_tree_id_4676ade2; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_inventoryitem_tree_id_4676ade2 ON public.dcim_inventoryitem USING btree (tree_id);


--
-- Name: dcim_inventoryitemrole_name_4c8cfe6d_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_inventoryitemrole_name_4c8cfe6d_like ON public.dcim_inventoryitemrole USING btree (name varchar_pattern_ops);


--
-- Name: dcim_inventoryitemrole_slug_3556c227_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_inventoryitemrole_slug_3556c227_like ON public.dcim_inventoryitemrole USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_inventoryitemtemplate_component_type_id_161623a2; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_inventoryitemtemplate_component_type_id_161623a2 ON public.dcim_inventoryitemtemplate USING btree (component_type_id);


--
-- Name: dcim_inventoryitemtemplate_device_type_id_6a1be904; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_inventoryitemtemplate_device_type_id_6a1be904 ON public.dcim_inventoryitemtemplate USING btree (device_type_id);


--
-- Name: dcim_inventoryitemtemplate_manufacturer_id_b388c5d9; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_inventoryitemtemplate_manufacturer_id_b388c5d9 ON public.dcim_inventoryitemtemplate USING btree (manufacturer_id);


--
-- Name: dcim_inventoryitemtemplate_parent_id_0dac73bb; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_inventoryitemtemplate_parent_id_0dac73bb ON public.dcim_inventoryitemtemplate USING btree (parent_id);


--
-- Name: dcim_inventoryitemtemplate_role_id_292676e6; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_inventoryitemtemplate_role_id_292676e6 ON public.dcim_inventoryitemtemplate USING btree (role_id);


--
-- Name: dcim_inventoryitemtemplate_tree_id_75ebcb8e; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_inventoryitemtemplate_tree_id_75ebcb8e ON public.dcim_inventoryitemtemplate USING btree (tree_id);


--
-- Name: dcim_location_name; Type: INDEX; Schema: public; Owner: netbox
--

CREATE UNIQUE INDEX dcim_location_name ON public.dcim_location USING btree (site_id, name) WHERE (parent_id IS NULL);


--
-- Name: dcim_location_parent_id_d77f3318; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_location_parent_id_d77f3318 ON public.dcim_location USING btree (parent_id);


--
-- Name: dcim_location_site_id_b55e975f; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_location_site_id_b55e975f ON public.dcim_location USING btree (site_id);


--
-- Name: dcim_location_slug; Type: INDEX; Schema: public; Owner: netbox
--

CREATE UNIQUE INDEX dcim_location_slug ON public.dcim_location USING btree (site_id, slug) WHERE (parent_id IS NULL);


--
-- Name: dcim_location_slug_352c5472; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_location_slug_352c5472 ON public.dcim_location USING btree (slug);


--
-- Name: dcim_location_slug_352c5472_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_location_slug_352c5472_like ON public.dcim_location USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_location_tenant_id_2c4df974; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_location_tenant_id_2c4df974 ON public.dcim_location USING btree (tenant_id);


--
-- Name: dcim_location_tree_id_5089ef14; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_location_tree_id_5089ef14 ON public.dcim_location USING btree (tree_id);


--
-- Name: dcim_manufacturer_name_841fcd92_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_manufacturer_name_841fcd92_like ON public.dcim_manufacturer USING btree (name varchar_pattern_ops);


--
-- Name: dcim_manufacturer_slug_00430749_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_manufacturer_slug_00430749_like ON public.dcim_manufacturer USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_module_asset_tag_2fd91eed_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_module_asset_tag_2fd91eed_like ON public.dcim_module USING btree (asset_tag varchar_pattern_ops);


--
-- Name: dcim_module_device_id_53cfd5be; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_module_device_id_53cfd5be ON public.dcim_module USING btree (device_id);


--
-- Name: dcim_module_module_type_id_a50b39fc; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_module_module_type_id_a50b39fc ON public.dcim_module USING btree (module_type_id);


--
-- Name: dcim_modulebay_device_id_3526abc2; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_modulebay_device_id_3526abc2 ON public.dcim_modulebay USING btree (device_id);


--
-- Name: dcim_modulebaytemplate_device_type_id_9eaf9bd3; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_modulebaytemplate_device_type_id_9eaf9bd3 ON public.dcim_modulebaytemplate USING btree (device_type_id);


--
-- Name: dcim_moduletype_manufacturer_id_7347392e; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_moduletype_manufacturer_id_7347392e ON public.dcim_moduletype USING btree (manufacturer_id);


--
-- Name: dcim_platform_manufacturer_id_83f72d3d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_platform_manufacturer_id_83f72d3d ON public.dcim_platform USING btree (manufacturer_id);


--
-- Name: dcim_platform_name_c2f04255_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_platform_name_c2f04255_like ON public.dcim_platform USING btree (name varchar_pattern_ops);


--
-- Name: dcim_platform_slug_b0908ae4_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_platform_slug_b0908ae4_like ON public.dcim_platform USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_powerfeed__path_id_a1ea1f28; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerfeed__path_id_a1ea1f28 ON public.dcim_powerfeed USING btree (_path_id);


--
-- Name: dcim_powerfeed_cable_id_ec44c4f8; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerfeed_cable_id_ec44c4f8 ON public.dcim_powerfeed USING btree (cable_id);


--
-- Name: dcim_powerfeed_power_panel_id_32bde3be; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerfeed_power_panel_id_32bde3be ON public.dcim_powerfeed USING btree (power_panel_id);


--
-- Name: dcim_powerfeed_rack_id_7abba090; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerfeed_rack_id_7abba090 ON public.dcim_powerfeed USING btree (rack_id);


--
-- Name: dcim_poweroutlet__path_id_cbb47bb9; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_poweroutlet__path_id_cbb47bb9 ON public.dcim_poweroutlet USING btree (_path_id);


--
-- Name: dcim_poweroutlet_cable_id_8dbea1ec; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_poweroutlet_cable_id_8dbea1ec ON public.dcim_poweroutlet USING btree (cable_id);


--
-- Name: dcim_poweroutlet_device_id_286351d7; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_poweroutlet_device_id_286351d7 ON public.dcim_poweroutlet USING btree (device_id);


--
-- Name: dcim_poweroutlet_module_id_032f5af2; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_poweroutlet_module_id_032f5af2 ON public.dcim_poweroutlet USING btree (module_id);


--
-- Name: dcim_poweroutlet_power_port_id_9bdf4163; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_poweroutlet_power_port_id_9bdf4163 ON public.dcim_poweroutlet USING btree (power_port_id);


--
-- Name: dcim_poweroutlettemplate_device_type_id_26b2316c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_poweroutlettemplate_device_type_id_26b2316c ON public.dcim_poweroutlettemplate USING btree (device_type_id);


--
-- Name: dcim_poweroutlettemplate_module_type_id_6142b416; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_poweroutlettemplate_module_type_id_6142b416 ON public.dcim_poweroutlettemplate USING btree (module_type_id);


--
-- Name: dcim_poweroutlettemplate_power_port_id_c0fb0c42; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_poweroutlettemplate_power_port_id_c0fb0c42 ON public.dcim_poweroutlettemplate USING btree (power_port_id);


--
-- Name: dcim_powerpanel_location_id_474b60f8; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerpanel_location_id_474b60f8 ON public.dcim_powerpanel USING btree (location_id);


--
-- Name: dcim_powerpanel_site_id_c430bc89; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerpanel_site_id_c430bc89 ON public.dcim_powerpanel USING btree (site_id);


--
-- Name: dcim_powerport__path_id_9fe4af8f; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerport__path_id_9fe4af8f ON public.dcim_powerport USING btree (_path_id);


--
-- Name: dcim_powerport_cable_id_c9682ba2; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerport_cable_id_c9682ba2 ON public.dcim_powerport USING btree (cable_id);


--
-- Name: dcim_powerport_device_id_ef7185ae; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerport_device_id_ef7185ae ON public.dcim_powerport USING btree (device_id);


--
-- Name: dcim_powerport_module_id_d0c27534; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerport_module_id_d0c27534 ON public.dcim_powerport USING btree (module_id);


--
-- Name: dcim_powerporttemplate_device_type_id_1ddfbfcc; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerporttemplate_device_type_id_1ddfbfcc ON public.dcim_powerporttemplate USING btree (device_type_id);


--
-- Name: dcim_powerporttemplate_module_type_id_93e26849; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerporttemplate_module_type_id_93e26849 ON public.dcim_powerporttemplate USING btree (module_type_id);


--
-- Name: dcim_rack_asset_tag_f88408e5_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rack_asset_tag_f88408e5_like ON public.dcim_rack USING btree (asset_tag varchar_pattern_ops);


--
-- Name: dcim_rack_location_id_5f63ec31; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rack_location_id_5f63ec31 ON public.dcim_rack USING btree (location_id);


--
-- Name: dcim_rack_role_id_62d6919e; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rack_role_id_62d6919e ON public.dcim_rack USING btree (role_id);


--
-- Name: dcim_rack_site_id_403c7b3a; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rack_site_id_403c7b3a ON public.dcim_rack USING btree (site_id);


--
-- Name: dcim_rack_tenant_id_7cdf3725; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rack_tenant_id_7cdf3725 ON public.dcim_rack USING btree (tenant_id);


--
-- Name: dcim_rackreservation_rack_id_1ebbaa9b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rackreservation_rack_id_1ebbaa9b ON public.dcim_rackreservation USING btree (rack_id);


--
-- Name: dcim_rackreservation_tenant_id_eb5e045f; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rackreservation_tenant_id_eb5e045f ON public.dcim_rackreservation USING btree (tenant_id);


--
-- Name: dcim_rackreservation_user_id_0785a527; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rackreservation_user_id_0785a527 ON public.dcim_rackreservation USING btree (user_id);


--
-- Name: dcim_rackrole_name_9077cfcc_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rackrole_name_9077cfcc_like ON public.dcim_rackrole USING btree (name varchar_pattern_ops);


--
-- Name: dcim_rackrole_slug_40bbcd3a_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rackrole_slug_40bbcd3a_like ON public.dcim_rackrole USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_rearport_cable_id_42c0e4e7; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rearport_cable_id_42c0e4e7 ON public.dcim_rearport USING btree (cable_id);


--
-- Name: dcim_rearport_device_id_0bdfe9c0; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rearport_device_id_0bdfe9c0 ON public.dcim_rearport USING btree (device_id);


--
-- Name: dcim_rearport_module_id_9a7b7e91; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rearport_module_id_9a7b7e91 ON public.dcim_rearport USING btree (module_id);


--
-- Name: dcim_rearporttemplate_device_type_id_6a02fd01; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rearporttemplate_device_type_id_6a02fd01 ON public.dcim_rearporttemplate USING btree (device_type_id);


--
-- Name: dcim_rearporttemplate_module_type_id_4d970e5b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rearporttemplate_module_type_id_4d970e5b ON public.dcim_rearporttemplate USING btree (module_type_id);


--
-- Name: dcim_region_name; Type: INDEX; Schema: public; Owner: netbox
--

CREATE UNIQUE INDEX dcim_region_name ON public.dcim_region USING btree (name) WHERE (parent_id IS NULL);


--
-- Name: dcim_region_parent_id_2486f5d4; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_region_parent_id_2486f5d4 ON public.dcim_region USING btree (parent_id);


--
-- Name: dcim_region_slug; Type: INDEX; Schema: public; Owner: netbox
--

CREATE UNIQUE INDEX dcim_region_slug ON public.dcim_region USING btree (slug) WHERE (parent_id IS NULL);


--
-- Name: dcim_region_slug_ff078a66; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_region_slug_ff078a66 ON public.dcim_region USING btree (slug);


--
-- Name: dcim_region_slug_ff078a66_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_region_slug_ff078a66_like ON public.dcim_region USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_region_tree_id_a09ea9a7; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_region_tree_id_a09ea9a7 ON public.dcim_region USING btree (tree_id);


--
-- Name: dcim_site_asns_asn_id_3cfd0f00; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_site_asns_asn_id_3cfd0f00 ON public.dcim_site_asns USING btree (asn_id);


--
-- Name: dcim_site_asns_site_id_112ccacf; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_site_asns_site_id_112ccacf ON public.dcim_site_asns USING btree (site_id);


--
-- Name: dcim_site_group_id_3910c975; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_site_group_id_3910c975 ON public.dcim_site USING btree (group_id);


--
-- Name: dcim_site_name_8fe66c76_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_site_name_8fe66c76_like ON public.dcim_site USING btree (name varchar_pattern_ops);


--
-- Name: dcim_site_region_id_45210932; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_site_region_id_45210932 ON public.dcim_site USING btree (region_id);


--
-- Name: dcim_site_slug_4412c762_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_site_slug_4412c762_like ON public.dcim_site USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_site_tenant_id_15e7df63; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_site_tenant_id_15e7df63 ON public.dcim_site USING btree (tenant_id);


--
-- Name: dcim_sitegroup_name; Type: INDEX; Schema: public; Owner: netbox
--

CREATE UNIQUE INDEX dcim_sitegroup_name ON public.dcim_sitegroup USING btree (name) WHERE (parent_id IS NULL);


--
-- Name: dcim_sitegroup_parent_id_533a5e44; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_sitegroup_parent_id_533a5e44 ON public.dcim_sitegroup USING btree (parent_id);


--
-- Name: dcim_sitegroup_slug; Type: INDEX; Schema: public; Owner: netbox
--

CREATE UNIQUE INDEX dcim_sitegroup_slug ON public.dcim_sitegroup USING btree (slug) WHERE (parent_id IS NULL);


--
-- Name: dcim_sitegroup_slug_a11d2b04; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_sitegroup_slug_a11d2b04 ON public.dcim_sitegroup USING btree (slug);


--
-- Name: dcim_sitegroup_slug_a11d2b04_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_sitegroup_slug_a11d2b04_like ON public.dcim_sitegroup USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_sitegroup_tree_id_e76dc999; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_sitegroup_tree_id_e76dc999 ON public.dcim_sitegroup USING btree (tree_id);


--
-- Name: dcim_virtualdevicecontext_device_id_4f39274b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_virtualdevicecontext_device_id_4f39274b ON public.dcim_virtualdevicecontext USING btree (device_id);


--
-- Name: dcim_virtualdevicecontext_tenant_id_b6a21753; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_virtualdevicecontext_tenant_id_b6a21753 ON public.dcim_virtualdevicecontext USING btree (tenant_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: extras_branch_name_1d13739f_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_branch_name_1d13739f_like ON public.extras_branch USING btree (name varchar_pattern_ops);


--
-- Name: extras_branch_user_id_a6cfd338; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_branch_user_id_a6cfd338 ON public.extras_branch USING btree (user_id);


--
-- Name: extras_cachedvalue_object_type_id_6f47d444; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_cachedvalue_object_type_id_6f47d444 ON public.extras_cachedvalue USING btree (object_type_id);


--
-- Name: extras_configcontext_cluster_groups_clustergroup_id_f4322ce8; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_cluster_groups_clustergroup_id_f4322ce8 ON public.extras_configcontext_cluster_groups USING btree (clustergroup_id);


--
-- Name: extras_configcontext_cluster_groups_configcontext_id_8f50b794; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_cluster_groups_configcontext_id_8f50b794 ON public.extras_configcontext_cluster_groups USING btree (configcontext_id);


--
-- Name: extras_configcontext_cluster_types_clustertype_id_fa493b64; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_cluster_types_clustertype_id_fa493b64 ON public.extras_configcontext_cluster_types USING btree (clustertype_id);


--
-- Name: extras_configcontext_cluster_types_configcontext_id_d549b6f2; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_cluster_types_configcontext_id_d549b6f2 ON public.extras_configcontext_cluster_types USING btree (configcontext_id);


--
-- Name: extras_configcontext_clusters_cluster_id_6abd47a1; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_clusters_cluster_id_6abd47a1 ON public.extras_configcontext_clusters USING btree (cluster_id);


--
-- Name: extras_configcontext_clusters_configcontext_id_ed579a40; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_clusters_configcontext_id_ed579a40 ON public.extras_configcontext_clusters USING btree (configcontext_id);


--
-- Name: extras_configcontext_device_types_configcontext_id_55632923; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_device_types_configcontext_id_55632923 ON public.extras_configcontext_device_types USING btree (configcontext_id);


--
-- Name: extras_configcontext_device_types_devicetype_id_b8788c2d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_device_types_devicetype_id_b8788c2d ON public.extras_configcontext_device_types USING btree (devicetype_id);


--
-- Name: extras_configcontext_locations_configcontext_id_cc629ec1; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_locations_configcontext_id_cc629ec1 ON public.extras_configcontext_locations USING btree (configcontext_id);


--
-- Name: extras_configcontext_locations_location_id_9e19eac9; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_locations_location_id_9e19eac9 ON public.extras_configcontext_locations USING btree (location_id);


--
-- Name: extras_configcontext_name_4bbfe25d_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_name_4bbfe25d_like ON public.extras_configcontext USING btree (name varchar_pattern_ops);


--
-- Name: extras_configcontext_platforms_configcontext_id_2a516699; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_platforms_configcontext_id_2a516699 ON public.extras_configcontext_platforms USING btree (configcontext_id);


--
-- Name: extras_configcontext_platforms_platform_id_3fdfedc0; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_platforms_platform_id_3fdfedc0 ON public.extras_configcontext_platforms USING btree (platform_id);


--
-- Name: extras_configcontext_regions_configcontext_id_73003dbc; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_regions_configcontext_id_73003dbc ON public.extras_configcontext_regions USING btree (configcontext_id);


--
-- Name: extras_configcontext_regions_region_id_35c6ba9d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_regions_region_id_35c6ba9d ON public.extras_configcontext_regions USING btree (region_id);


--
-- Name: extras_configcontext_roles_configcontext_id_59b67386; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_roles_configcontext_id_59b67386 ON public.extras_configcontext_roles USING btree (configcontext_id);


--
-- Name: extras_configcontext_roles_devicerole_id_d3a84813; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_roles_devicerole_id_d3a84813 ON public.extras_configcontext_roles USING btree (devicerole_id);


--
-- Name: extras_configcontext_site_groups_configcontext_id_2e0f43cb; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_site_groups_configcontext_id_2e0f43cb ON public.extras_configcontext_site_groups USING btree (configcontext_id);


--
-- Name: extras_configcontext_site_groups_sitegroup_id_3287c9e7; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_site_groups_sitegroup_id_3287c9e7 ON public.extras_configcontext_site_groups USING btree (sitegroup_id);


--
-- Name: extras_configcontext_sites_configcontext_id_8c54feb9; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_sites_configcontext_id_8c54feb9 ON public.extras_configcontext_sites USING btree (configcontext_id);


--
-- Name: extras_configcontext_sites_site_id_cbb76c96; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_sites_site_id_cbb76c96 ON public.extras_configcontext_sites USING btree (site_id);


--
-- Name: extras_configcontext_tags_configcontext_id_64a392b1; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_tags_configcontext_id_64a392b1 ON public.extras_configcontext_tags USING btree (configcontext_id);


--
-- Name: extras_configcontext_tags_tag_id_129a5d87; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_tags_tag_id_129a5d87 ON public.extras_configcontext_tags USING btree (tag_id);


--
-- Name: extras_configcontext_tenant_groups_configcontext_id_92f68345; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_tenant_groups_configcontext_id_92f68345 ON public.extras_configcontext_tenant_groups USING btree (configcontext_id);


--
-- Name: extras_configcontext_tenant_groups_tenantgroup_id_0909688d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_tenant_groups_tenantgroup_id_0909688d ON public.extras_configcontext_tenant_groups USING btree (tenantgroup_id);


--
-- Name: extras_configcontext_tenants_configcontext_id_b53552a6; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_tenants_configcontext_id_b53552a6 ON public.extras_configcontext_tenants USING btree (configcontext_id);


--
-- Name: extras_configcontext_tenants_tenant_id_8d0aa28e; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_tenants_tenant_id_8d0aa28e ON public.extras_configcontext_tenants USING btree (tenant_id);


--
-- Name: extras_customfield_content_types_contenttype_id_2997ba90; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_customfield_content_types_contenttype_id_2997ba90 ON public.extras_customfield_content_types USING btree (contenttype_id);


--
-- Name: extras_customfield_content_types_customfield_id_3842aaf3; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_customfield_content_types_customfield_id_3842aaf3 ON public.extras_customfield_content_types USING btree (customfield_id);


--
-- Name: extras_customfield_name_2fe72707_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_customfield_name_2fe72707_like ON public.extras_customfield USING btree (name varchar_pattern_ops);


--
-- Name: extras_customfield_object_type_id_489f2239; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_customfield_object_type_id_489f2239 ON public.extras_customfield USING btree (object_type_id);


--
-- Name: extras_customlink_content_types_contenttype_id_df5f34c2; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_customlink_content_types_contenttype_id_df5f34c2 ON public.extras_customlink_content_types USING btree (contenttype_id);


--
-- Name: extras_customlink_content_types_customlink_id_229ba2bc; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_customlink_content_types_customlink_id_229ba2bc ON public.extras_customlink_content_types USING btree (customlink_id);


--
-- Name: extras_customlink_name_daed2d18_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_customlink_name_daed2d18_like ON public.extras_customlink USING btree (name varchar_pattern_ops);


--
-- Name: extras_exporttemplate_content_types_contenttype_id_d80a5164; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_exporttemplate_content_types_contenttype_id_d80a5164 ON public.extras_exporttemplate_content_types USING btree (contenttype_id);


--
-- Name: extras_exporttemplate_content_types_exporttemplate_id_7645f081; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_exporttemplate_content_types_exporttemplate_id_7645f081 ON public.extras_exporttemplate_content_types USING btree (exporttemplate_id);


--
-- Name: extras_imageattachment_content_type_id_90e0643d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_imageattachment_content_type_id_90e0643d ON public.extras_imageattachment USING btree (content_type_id);


--
-- Name: extras_jobresult_obj_type_id_475e80aa; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_jobresult_obj_type_id_475e80aa ON public.extras_jobresult USING btree (obj_type_id);


--
-- Name: extras_jobresult_user_id_d35285ab; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_jobresult_user_id_d35285ab ON public.extras_jobresult USING btree (user_id);


--
-- Name: extras_journalentry_assigned_object_type_id_1bba9f68; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_journalentry_assigned_object_type_id_1bba9f68 ON public.extras_journalentry USING btree (assigned_object_type_id);


--
-- Name: extras_journalentry_created_by_id_8d4e4329; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_journalentry_created_by_id_8d4e4329 ON public.extras_journalentry USING btree (created_by_id);


--
-- Name: extras_objectchange_changed_object_type_id_b755bb60; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_objectchange_changed_object_type_id_b755bb60 ON public.extras_objectchange USING btree (changed_object_type_id);


--
-- Name: extras_objectchange_related_object_type_id_fe6e521f; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_objectchange_related_object_type_id_fe6e521f ON public.extras_objectchange USING btree (related_object_type_id);


--
-- Name: extras_objectchange_time_224380ea; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_objectchange_time_224380ea ON public.extras_objectchange USING btree ("time");


--
-- Name: extras_objectchange_user_id_7fdf8186; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_objectchange_user_id_7fdf8186 ON public.extras_objectchange USING btree (user_id);


--
-- Name: extras_savedfilter_content_types_contenttype_id_929cea22; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_savedfilter_content_types_contenttype_id_929cea22 ON public.extras_savedfilter_content_types USING btree (contenttype_id);


--
-- Name: extras_savedfilter_content_types_savedfilter_id_1631b88b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_savedfilter_content_types_savedfilter_id_1631b88b ON public.extras_savedfilter_content_types USING btree (savedfilter_id);


--
-- Name: extras_savedfilter_name_8a4bbd09_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_savedfilter_name_8a4bbd09_like ON public.extras_savedfilter USING btree (name varchar_pattern_ops);


--
-- Name: extras_savedfilter_slug_4f93a959_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_savedfilter_slug_4f93a959_like ON public.extras_savedfilter USING btree (slug varchar_pattern_ops);


--
-- Name: extras_savedfilter_user_id_10502e81; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_savedfilter_user_id_10502e81 ON public.extras_savedfilter USING btree (user_id);


--
-- Name: extras_stagedchange_branch_id_44893052; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_stagedchange_branch_id_44893052 ON public.extras_stagedchange USING btree (branch_id);


--
-- Name: extras_stagedchange_object_type_id_de76b05b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_stagedchange_object_type_id_de76b05b ON public.extras_stagedchange USING btree (object_type_id);


--
-- Name: extras_tag_name_9550b3d9_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_tag_name_9550b3d9_like ON public.extras_tag USING btree (name varchar_pattern_ops);


--
-- Name: extras_tag_slug_aaa5b7e9_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_tag_slug_aaa5b7e9_like ON public.extras_tag USING btree (slug varchar_pattern_ops);


--
-- Name: extras_taggeditem_content_type_id_ba5562ed; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_taggeditem_content_type_id_ba5562ed ON public.extras_taggeditem USING btree (content_type_id);


--
-- Name: extras_taggeditem_content_type_id_object_id_80e28e23_idx; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_taggeditem_content_type_id_object_id_80e28e23_idx ON public.extras_taggeditem USING btree (content_type_id, object_id);


--
-- Name: extras_taggeditem_object_id_31b2aa77; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_taggeditem_object_id_31b2aa77 ON public.extras_taggeditem USING btree (object_id);


--
-- Name: extras_taggeditem_tag_id_d48af7c7; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_taggeditem_tag_id_d48af7c7 ON public.extras_taggeditem USING btree (tag_id);


--
-- Name: extras_webhook_content_types_contenttype_id_3fc2c4d3; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_webhook_content_types_contenttype_id_3fc2c4d3 ON public.extras_webhook_content_types USING btree (contenttype_id);


--
-- Name: extras_webhook_content_types_webhook_id_0c169800; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_webhook_content_types_webhook_id_0c169800 ON public.extras_webhook_content_types USING btree (webhook_id);


--
-- Name: extras_webhook_name_82cf60b5_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_webhook_name_82cf60b5_like ON public.extras_webhook USING btree (name varchar_pattern_ops);


--
-- Name: ipam_aggregate_rir_id_ef7a27bd; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_aggregate_rir_id_ef7a27bd ON public.ipam_aggregate USING btree (rir_id);


--
-- Name: ipam_aggregate_tenant_id_637dd1a1; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_aggregate_tenant_id_637dd1a1 ON public.ipam_aggregate USING btree (tenant_id);


--
-- Name: ipam_asn_rir_id_f5ad3cff; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_asn_rir_id_f5ad3cff ON public.ipam_asn USING btree (rir_id);


--
-- Name: ipam_asn_tenant_id_07e8188e; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_asn_tenant_id_07e8188e ON public.ipam_asn USING btree (tenant_id);


--
-- Name: ipam_fhrpgroupassignment_group_id_19f15ca4; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_fhrpgroupassignment_group_id_19f15ca4 ON public.ipam_fhrpgroupassignment USING btree (group_id);


--
-- Name: ipam_fhrpgroupassignment_interface_type_id_f3bcb487; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_fhrpgroupassignment_interface_type_id_f3bcb487 ON public.ipam_fhrpgroupassignment USING btree (interface_type_id);


--
-- Name: ipam_ipaddress_assigned_object_type_id_02354370; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_ipaddress_assigned_object_type_id_02354370 ON public.ipam_ipaddress USING btree (assigned_object_type_id);


--
-- Name: ipam_ipaddress_nat_inside_id_a45fb7c5; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_ipaddress_nat_inside_id_a45fb7c5 ON public.ipam_ipaddress USING btree (nat_inside_id);


--
-- Name: ipam_ipaddress_tenant_id_ac55acfd; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_ipaddress_tenant_id_ac55acfd ON public.ipam_ipaddress USING btree (tenant_id);


--
-- Name: ipam_ipaddress_vrf_id_51fcc59b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_ipaddress_vrf_id_51fcc59b ON public.ipam_ipaddress USING btree (vrf_id);


--
-- Name: ipam_iprange_role_id_2782e864; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_iprange_role_id_2782e864 ON public.ipam_iprange USING btree (role_id);


--
-- Name: ipam_iprange_tenant_id_856027ea; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_iprange_tenant_id_856027ea ON public.ipam_iprange USING btree (tenant_id);


--
-- Name: ipam_iprange_vrf_id_613e9dd2; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_iprange_vrf_id_613e9dd2 ON public.ipam_iprange USING btree (vrf_id);


--
-- Name: ipam_l2vpn_export_targets_l2vpn_id_8749bbe8; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_l2vpn_export_targets_l2vpn_id_8749bbe8 ON public.ipam_l2vpn_export_targets USING btree (l2vpn_id);


--
-- Name: ipam_l2vpn_export_targets_routetarget_id_5ccb758b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_l2vpn_export_targets_routetarget_id_5ccb758b ON public.ipam_l2vpn_export_targets USING btree (routetarget_id);


--
-- Name: ipam_l2vpn_import_targets_l2vpn_id_731f5bb4; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_l2vpn_import_targets_l2vpn_id_731f5bb4 ON public.ipam_l2vpn_import_targets USING btree (l2vpn_id);


--
-- Name: ipam_l2vpn_import_targets_routetarget_id_58a188b2; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_l2vpn_import_targets_routetarget_id_58a188b2 ON public.ipam_l2vpn_import_targets USING btree (routetarget_id);


--
-- Name: ipam_l2vpn_name_5e1c080f_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_l2vpn_name_5e1c080f_like ON public.ipam_l2vpn USING btree (name varchar_pattern_ops);


--
-- Name: ipam_l2vpn_slug_24008406_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_l2vpn_slug_24008406_like ON public.ipam_l2vpn USING btree (slug varchar_pattern_ops);


--
-- Name: ipam_l2vpn_tenant_id_bb2564a6; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_l2vpn_tenant_id_bb2564a6 ON public.ipam_l2vpn USING btree (tenant_id);


--
-- Name: ipam_l2vpntermination_assigned_object_type_id_3923c124; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_l2vpntermination_assigned_object_type_id_3923c124 ON public.ipam_l2vpntermination USING btree (assigned_object_type_id);


--
-- Name: ipam_l2vpntermination_l2vpn_id_9e570aa1; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_l2vpntermination_l2vpn_id_9e570aa1 ON public.ipam_l2vpntermination USING btree (l2vpn_id);


--
-- Name: ipam_prefix_role_id_0a98d415; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_prefix_role_id_0a98d415 ON public.ipam_prefix USING btree (role_id);


--
-- Name: ipam_prefix_site_id_0b20df05; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_prefix_site_id_0b20df05 ON public.ipam_prefix USING btree (site_id);


--
-- Name: ipam_prefix_tenant_id_7ba1fcc4; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_prefix_tenant_id_7ba1fcc4 ON public.ipam_prefix USING btree (tenant_id);


--
-- Name: ipam_prefix_vlan_id_1db91bff; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_prefix_vlan_id_1db91bff ON public.ipam_prefix USING btree (vlan_id);


--
-- Name: ipam_prefix_vrf_id_34f78ed0; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_prefix_vrf_id_34f78ed0 ON public.ipam_prefix USING btree (vrf_id);


--
-- Name: ipam_rir_name_64a71982_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_rir_name_64a71982_like ON public.ipam_rir USING btree (name varchar_pattern_ops);


--
-- Name: ipam_rir_slug_ff1a369a_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_rir_slug_ff1a369a_like ON public.ipam_rir USING btree (slug varchar_pattern_ops);


--
-- Name: ipam_role_name_13784849_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_role_name_13784849_like ON public.ipam_role USING btree (name varchar_pattern_ops);


--
-- Name: ipam_role_slug_309ca14c_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_role_slug_309ca14c_like ON public.ipam_role USING btree (slug varchar_pattern_ops);


--
-- Name: ipam_routetarget_name_212be79f_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_routetarget_name_212be79f_like ON public.ipam_routetarget USING btree (name varchar_pattern_ops);


--
-- Name: ipam_routetarget_tenant_id_5a0b35e8; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_routetarget_tenant_id_5a0b35e8 ON public.ipam_routetarget USING btree (tenant_id);


--
-- Name: ipam_service_device_id_b4d2bb9c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_service_device_id_b4d2bb9c ON public.ipam_service USING btree (device_id);


--
-- Name: ipam_service_ipaddresses_ipaddress_id_b4138c6d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_service_ipaddresses_ipaddress_id_b4138c6d ON public.ipam_service_ipaddresses USING btree (ipaddress_id);


--
-- Name: ipam_service_ipaddresses_service_id_ae26b9ab; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_service_ipaddresses_service_id_ae26b9ab ON public.ipam_service_ipaddresses USING btree (service_id);


--
-- Name: ipam_service_virtual_machine_id_e8b53562; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_service_virtual_machine_id_e8b53562 ON public.ipam_service USING btree (virtual_machine_id);


--
-- Name: ipam_servicetemplate_name_1a2f3410_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_servicetemplate_name_1a2f3410_like ON public.ipam_servicetemplate USING btree (name varchar_pattern_ops);


--
-- Name: ipam_vlan_group_id_88cbfa62; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vlan_group_id_88cbfa62 ON public.ipam_vlan USING btree (group_id);


--
-- Name: ipam_vlan_role_id_f5015962; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vlan_role_id_f5015962 ON public.ipam_vlan USING btree (role_id);


--
-- Name: ipam_vlan_site_id_a59334e3; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vlan_site_id_a59334e3 ON public.ipam_vlan USING btree (site_id);


--
-- Name: ipam_vlan_tenant_id_71a8290d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vlan_tenant_id_71a8290d ON public.ipam_vlan USING btree (tenant_id);


--
-- Name: ipam_vlangroup_scope_type_id_6606a755; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vlangroup_scope_type_id_6606a755 ON public.ipam_vlangroup USING btree (scope_type_id);


--
-- Name: ipam_vlangroup_slug_40abcf6b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vlangroup_slug_40abcf6b ON public.ipam_vlangroup USING btree (slug);


--
-- Name: ipam_vlangroup_slug_40abcf6b_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vlangroup_slug_40abcf6b_like ON public.ipam_vlangroup USING btree (slug varchar_pattern_ops);


--
-- Name: ipam_vrf_export_targets_routetarget_id_8d9319f7; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vrf_export_targets_routetarget_id_8d9319f7 ON public.ipam_vrf_export_targets USING btree (routetarget_id);


--
-- Name: ipam_vrf_export_targets_vrf_id_6f4875c4; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vrf_export_targets_vrf_id_6f4875c4 ON public.ipam_vrf_export_targets USING btree (vrf_id);


--
-- Name: ipam_vrf_import_targets_routetarget_id_0e05b144; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vrf_import_targets_routetarget_id_0e05b144 ON public.ipam_vrf_import_targets USING btree (routetarget_id);


--
-- Name: ipam_vrf_import_targets_vrf_id_ed491b19; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vrf_import_targets_vrf_id_ed491b19 ON public.ipam_vrf_import_targets USING btree (vrf_id);


--
-- Name: ipam_vrf_rd_0ac1bde1_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vrf_rd_0ac1bde1_like ON public.ipam_vrf USING btree (rd varchar_pattern_ops);


--
-- Name: ipam_vrf_tenant_id_498b0051; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vrf_tenant_id_498b0051 ON public.ipam_vrf USING btree (tenant_id);


--
-- Name: social_auth_code_code_a2393167; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX social_auth_code_code_a2393167 ON public.social_auth_code USING btree (code);


--
-- Name: social_auth_code_code_a2393167_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX social_auth_code_code_a2393167_like ON public.social_auth_code USING btree (code varchar_pattern_ops);


--
-- Name: social_auth_code_timestamp_176b341f; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX social_auth_code_timestamp_176b341f ON public.social_auth_code USING btree ("timestamp");


--
-- Name: social_auth_partial_timestamp_50f2119f; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX social_auth_partial_timestamp_50f2119f ON public.social_auth_partial USING btree ("timestamp");


--
-- Name: social_auth_partial_token_3017fea3; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX social_auth_partial_token_3017fea3 ON public.social_auth_partial USING btree (token);


--
-- Name: social_auth_partial_token_3017fea3_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX social_auth_partial_token_3017fea3_like ON public.social_auth_partial USING btree (token varchar_pattern_ops);


--
-- Name: social_auth_usersocialauth_uid_796e51dc; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX social_auth_usersocialauth_uid_796e51dc ON public.social_auth_usersocialauth USING btree (uid);


--
-- Name: social_auth_usersocialauth_uid_796e51dc_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX social_auth_usersocialauth_uid_796e51dc_like ON public.social_auth_usersocialauth USING btree (uid varchar_pattern_ops);


--
-- Name: social_auth_usersocialauth_user_id_17d28448; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX social_auth_usersocialauth_user_id_17d28448 ON public.social_auth_usersocialauth USING btree (user_id);


--
-- Name: taggit_tag_name_58eb2ed9_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX taggit_tag_name_58eb2ed9_like ON public.taggit_tag USING btree (name varchar_pattern_ops);


--
-- Name: taggit_tag_slug_6be58b2c_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX taggit_tag_slug_6be58b2c_like ON public.taggit_tag USING btree (slug varchar_pattern_ops);


--
-- Name: taggit_taggeditem_content_type_id_9957a03c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX taggit_taggeditem_content_type_id_9957a03c ON public.taggit_taggeditem USING btree (content_type_id);


--
-- Name: taggit_taggeditem_content_type_id_object_id_196cc965_idx; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX taggit_taggeditem_content_type_id_object_id_196cc965_idx ON public.taggit_taggeditem USING btree (content_type_id, object_id);


--
-- Name: taggit_taggeditem_object_id_e2d7d1df; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX taggit_taggeditem_object_id_e2d7d1df ON public.taggit_taggeditem USING btree (object_id);


--
-- Name: taggit_taggeditem_tag_id_f4f5b767; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX taggit_taggeditem_tag_id_f4f5b767 ON public.taggit_taggeditem USING btree (tag_id);


--
-- Name: tenancy_contact_group_id_76e0267c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_contact_group_id_76e0267c ON public.tenancy_contact USING btree (group_id);


--
-- Name: tenancy_contactassignment_contact_id_5302baf0; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_contactassignment_contact_id_5302baf0 ON public.tenancy_contactassignment USING btree (contact_id);


--
-- Name: tenancy_contactassignment_content_type_id_0c3f0c67; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_contactassignment_content_type_id_0c3f0c67 ON public.tenancy_contactassignment USING btree (content_type_id);


--
-- Name: tenancy_contactassignment_role_id_fc08bfb5; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_contactassignment_role_id_fc08bfb5 ON public.tenancy_contactassignment USING btree (role_id);


--
-- Name: tenancy_contactgroup_parent_id_c087d69f; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_contactgroup_parent_id_c087d69f ON public.tenancy_contactgroup USING btree (parent_id);


--
-- Name: tenancy_contactgroup_slug_5b0f3e75; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_contactgroup_slug_5b0f3e75 ON public.tenancy_contactgroup USING btree (slug);


--
-- Name: tenancy_contactgroup_slug_5b0f3e75_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_contactgroup_slug_5b0f3e75_like ON public.tenancy_contactgroup USING btree (slug varchar_pattern_ops);


--
-- Name: tenancy_contactgroup_tree_id_57456c98; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_contactgroup_tree_id_57456c98 ON public.tenancy_contactgroup USING btree (tree_id);


--
-- Name: tenancy_contactrole_name_44b01a1f_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_contactrole_name_44b01a1f_like ON public.tenancy_contactrole USING btree (name varchar_pattern_ops);


--
-- Name: tenancy_contactrole_slug_c5837d7d_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_contactrole_slug_c5837d7d_like ON public.tenancy_contactrole USING btree (slug varchar_pattern_ops);


--
-- Name: tenancy_tenant_group_id_7daef6f4; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_tenant_group_id_7daef6f4 ON public.tenancy_tenant USING btree (group_id);


--
-- Name: tenancy_tenant_name_f6e5b2f5_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_tenant_name_f6e5b2f5_like ON public.tenancy_tenant USING btree (name varchar_pattern_ops);


--
-- Name: tenancy_tenant_slug_0716575e_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_tenant_slug_0716575e_like ON public.tenancy_tenant USING btree (slug varchar_pattern_ops);


--
-- Name: tenancy_tenantgroup_name_53363199_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_tenantgroup_name_53363199_like ON public.tenancy_tenantgroup USING btree (name varchar_pattern_ops);


--
-- Name: tenancy_tenantgroup_parent_id_2542fc18; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_tenantgroup_parent_id_2542fc18 ON public.tenancy_tenantgroup USING btree (parent_id);


--
-- Name: tenancy_tenantgroup_slug_e2af1cb6_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_tenantgroup_slug_e2af1cb6_like ON public.tenancy_tenantgroup USING btree (slug varchar_pattern_ops);


--
-- Name: tenancy_tenantgroup_tree_id_769a98bf; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_tenantgroup_tree_id_769a98bf ON public.tenancy_tenantgroup USING btree (tree_id);


--
-- Name: users_objectpermission_groups_group_id_fb7ba6e0; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX users_objectpermission_groups_group_id_fb7ba6e0 ON public.users_objectpermission_groups USING btree (group_id);


--
-- Name: users_objectpermission_groups_objectpermission_id_2f7cc117; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX users_objectpermission_groups_objectpermission_id_2f7cc117 ON public.users_objectpermission_groups USING btree (objectpermission_id);


--
-- Name: users_objectpermission_obj_objectpermission_id_38c7d8f5; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX users_objectpermission_obj_objectpermission_id_38c7d8f5 ON public.users_objectpermission_object_types USING btree (objectpermission_id);


--
-- Name: users_objectpermission_object_types_contenttype_id_594b1cc7; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX users_objectpermission_object_types_contenttype_id_594b1cc7 ON public.users_objectpermission_object_types USING btree (contenttype_id);


--
-- Name: users_objectpermission_users_objectpermission_id_78a9c2e6; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX users_objectpermission_users_objectpermission_id_78a9c2e6 ON public.users_objectpermission_users USING btree (objectpermission_id);


--
-- Name: users_objectpermission_users_user_id_16c0905d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX users_objectpermission_users_user_id_16c0905d ON public.users_objectpermission_users USING btree (user_id);


--
-- Name: users_token_key_820deccd_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX users_token_key_820deccd_like ON public.users_token USING btree (key varchar_pattern_ops);


--
-- Name: users_token_user_id_af964690; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX users_token_user_id_af964690 ON public.users_token USING btree (user_id);


--
-- Name: virtualization_cluster_group_id_de379828; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_cluster_group_id_de379828 ON public.virtualization_cluster USING btree (group_id);


--
-- Name: virtualization_cluster_site_id_4d5af282; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_cluster_site_id_4d5af282 ON public.virtualization_cluster USING btree (site_id);


--
-- Name: virtualization_cluster_tenant_id_bc2868d0; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_cluster_tenant_id_bc2868d0 ON public.virtualization_cluster USING btree (tenant_id);


--
-- Name: virtualization_cluster_type_id_4efafb0a; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_cluster_type_id_4efafb0a ON public.virtualization_cluster USING btree (type_id);


--
-- Name: virtualization_clustergroup_name_4fcd26b4_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_clustergroup_name_4fcd26b4_like ON public.virtualization_clustergroup USING btree (name varchar_pattern_ops);


--
-- Name: virtualization_clustergroup_slug_57ca1d23_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_clustergroup_slug_57ca1d23_like ON public.virtualization_clustergroup USING btree (slug varchar_pattern_ops);


--
-- Name: virtualization_clustertype_name_ea854d3d_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_clustertype_name_ea854d3d_like ON public.virtualization_clustertype USING btree (name varchar_pattern_ops);


--
-- Name: virtualization_clustertype_slug_8ee4d0e0_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_clustertype_slug_8ee4d0e0_like ON public.virtualization_clustertype USING btree (slug varchar_pattern_ops);


--
-- Name: virtualization_virtualmachine_cluster_id_6c9f9047; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_virtualmachine_cluster_id_6c9f9047 ON public.virtualization_virtualmachine USING btree (cluster_id);


--
-- Name: virtualization_virtualmachine_device_id_5a49ed18; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_virtualmachine_device_id_5a49ed18 ON public.virtualization_virtualmachine USING btree (device_id);


--
-- Name: virtualization_virtualmachine_platform_id_a6c5ccb2; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_virtualmachine_platform_id_a6c5ccb2 ON public.virtualization_virtualmachine USING btree (platform_id);


--
-- Name: virtualization_virtualmachine_role_id_0cc898f9; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_virtualmachine_role_id_0cc898f9 ON public.virtualization_virtualmachine USING btree (role_id);


--
-- Name: virtualization_virtualmachine_site_id_54475a27; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_virtualmachine_site_id_54475a27 ON public.virtualization_virtualmachine USING btree (site_id);


--
-- Name: virtualization_virtualmachine_tenant_id_d00d1d77; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_virtualmachine_tenant_id_d00d1d77 ON public.virtualization_virtualmachine USING btree (tenant_id);


--
-- Name: virtualization_virtualmachine_unique_name_cluster; Type: INDEX; Schema: public; Owner: netbox
--

CREATE UNIQUE INDEX virtualization_virtualmachine_unique_name_cluster ON public.virtualization_virtualmachine USING btree (lower((name)::text), cluster_id) WHERE (tenant_id IS NULL);


--
-- Name: virtualization_virtualmachine_unique_name_cluster_tenant; Type: INDEX; Schema: public; Owner: netbox
--

CREATE UNIQUE INDEX virtualization_virtualmachine_unique_name_cluster_tenant ON public.virtualization_virtualmachine USING btree (lower((name)::text), cluster_id, tenant_id);


--
-- Name: virtualization_vminterface_bridge_id_7462b91e; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_vminterface_bridge_id_7462b91e ON public.virtualization_vminterface USING btree (bridge_id);


--
-- Name: virtualization_vminterface_parent_id_f86958e1; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_vminterface_parent_id_f86958e1 ON public.virtualization_vminterface USING btree (parent_id);


--
-- Name: virtualization_vminterface_tagged_vlans_vlan_id_4e77411e; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_vminterface_tagged_vlans_vlan_id_4e77411e ON public.virtualization_vminterface_tagged_vlans USING btree (vlan_id);


--
-- Name: virtualization_vminterface_tagged_vlans_vminterface_id_904b12de; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_vminterface_tagged_vlans_vminterface_id_904b12de ON public.virtualization_vminterface_tagged_vlans USING btree (vminterface_id);


--
-- Name: virtualization_vminterface_untagged_vlan_id_aea4fc69; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_vminterface_untagged_vlan_id_aea4fc69 ON public.virtualization_vminterface USING btree (untagged_vlan_id);


--
-- Name: virtualization_vminterface_virtual_machine_id_e9f89829; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_vminterface_virtual_machine_id_e9f89829 ON public.virtualization_vminterface USING btree (virtual_machine_id);


--
-- Name: virtualization_vminterface_vrf_id_4b570a8c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_vminterface_vrf_id_4b570a8c ON public.virtualization_vminterface USING btree (vrf_id);


--
-- Name: wireless_wirelesslan_group_id_d9e3d67f; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX wireless_wirelesslan_group_id_d9e3d67f ON public.wireless_wirelesslan USING btree (group_id);


--
-- Name: wireless_wirelesslan_tenant_id_5dfee941; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX wireless_wirelesslan_tenant_id_5dfee941 ON public.wireless_wirelesslan USING btree (tenant_id);


--
-- Name: wireless_wirelesslan_vlan_id_d7fa6ccc; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX wireless_wirelesslan_vlan_id_d7fa6ccc ON public.wireless_wirelesslan USING btree (vlan_id);


--
-- Name: wireless_wirelesslangroup_name_2ffd60c8_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX wireless_wirelesslangroup_name_2ffd60c8_like ON public.wireless_wirelesslangroup USING btree (name varchar_pattern_ops);


--
-- Name: wireless_wirelesslangroup_parent_id_37ca8b87; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX wireless_wirelesslangroup_parent_id_37ca8b87 ON public.wireless_wirelesslangroup USING btree (parent_id);


--
-- Name: wireless_wirelesslangroup_slug_f5d59831_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX wireless_wirelesslangroup_slug_f5d59831_like ON public.wireless_wirelesslangroup USING btree (slug varchar_pattern_ops);


--
-- Name: wireless_wirelesslangroup_tree_id_eb99115d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX wireless_wirelesslangroup_tree_id_eb99115d ON public.wireless_wirelesslangroup USING btree (tree_id);


--
-- Name: wireless_wirelesslink__interface_a_device_id_6c8e042e; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX wireless_wirelesslink__interface_a_device_id_6c8e042e ON public.wireless_wirelesslink USING btree (_interface_a_device_id);


--
-- Name: wireless_wirelesslink__interface_b_device_id_43d5101a; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX wireless_wirelesslink__interface_b_device_id_43d5101a ON public.wireless_wirelesslink USING btree (_interface_b_device_id);


--
-- Name: wireless_wirelesslink_interface_a_id_bc9e37fd; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX wireless_wirelesslink_interface_a_id_bc9e37fd ON public.wireless_wirelesslink USING btree (interface_a_id);


--
-- Name: wireless_wirelesslink_interface_b_id_a82fb2ee; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX wireless_wirelesslink_interface_b_id_a82fb2ee ON public.wireless_wirelesslink USING btree (interface_b_id);


--
-- Name: wireless_wirelesslink_tenant_id_4c0638ee; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX wireless_wirelesslink_tenant_id_4c0638ee ON public.wireless_wirelesslink USING btree (tenant_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuit circuits_circuit_provider_id_d9195418_fk_circuits_provider_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_provider_id_d9195418_fk_circuits_provider_id FOREIGN KEY (provider_id) REFERENCES public.circuits_provider(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuit circuits_circuit_tenant_id_812508a5_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_tenant_id_812508a5_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuit circuits_circuit_termination_a_id_f891adac_fk_circuits_; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_termination_a_id_f891adac_fk_circuits_ FOREIGN KEY (termination_a_id) REFERENCES public.circuits_circuittermination(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuit circuits_circuit_termination_z_id_377b8551_fk_circuits_; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_termination_z_id_377b8551_fk_circuits_ FOREIGN KEY (termination_z_id) REFERENCES public.circuits_circuittermination(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuit circuits_circuit_type_id_1b9f485a_fk_circuits_circuittype_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_type_id_1b9f485a_fk_circuits_circuittype_id FOREIGN KEY (type_id) REFERENCES public.circuits_circuittype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuittermination circuits_circuitterm_circuit_id_257e87e7_fk_circuits_; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuitterm_circuit_id_257e87e7_fk_circuits_ FOREIGN KEY (circuit_id) REFERENCES public.circuits_circuit(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuittermination circuits_circuitterm_provider_network_id_b0c660f1_fk_circuits_; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuitterm_provider_network_id_b0c660f1_fk_circuits_ FOREIGN KEY (provider_network_id) REFERENCES public.circuits_providernetwork(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuittermination circuits_circuittermination_cable_id_35e9f703_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuittermination_cable_id_35e9f703_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuittermination circuits_circuittermination_site_id_e6fe5652_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuittermination_site_id_e6fe5652_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_provider_asns circuits_provider_as_provider_id_becc3f7e_fk_circuits_; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_provider_asns
    ADD CONSTRAINT circuits_provider_as_provider_id_becc3f7e_fk_circuits_ FOREIGN KEY (provider_id) REFERENCES public.circuits_provider(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_provider_asns circuits_provider_asns_asn_id_0a6c53b3_fk_ipam_asn_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_provider_asns
    ADD CONSTRAINT circuits_provider_asns_asn_id_0a6c53b3_fk_ipam_asn_id FOREIGN KEY (asn_id) REFERENCES public.ipam_asn(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_providernetwork circuits_providernet_provider_id_7992236c_fk_circuits_; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_providernetwork
    ADD CONSTRAINT circuits_providernet_provider_id_7992236c_fk_circuits_ FOREIGN KEY (provider_id) REFERENCES public.circuits_provider(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_cable dcim_cable_tenant_id_3a7fdbb8_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable_tenant_id_3a7fdbb8_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_cabletermination dcim_cableterminatio_termination_type_id_20da439e_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cabletermination
    ADD CONSTRAINT dcim_cableterminatio_termination_type_id_20da439e_fk_django_co FOREIGN KEY (termination_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_cabletermination dcim_cabletermination__device_id_f5884934_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cabletermination
    ADD CONSTRAINT dcim_cabletermination__device_id_f5884934_fk_dcim_device_id FOREIGN KEY (_device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_cabletermination dcim_cabletermination__location_id_ff4be503_fk_dcim_location_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cabletermination
    ADD CONSTRAINT dcim_cabletermination__location_id_ff4be503_fk_dcim_location_id FOREIGN KEY (_location_id) REFERENCES public.dcim_location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_cabletermination dcim_cabletermination__rack_id_83a548e1_fk_dcim_rack_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cabletermination
    ADD CONSTRAINT dcim_cabletermination__rack_id_83a548e1_fk_dcim_rack_id FOREIGN KEY (_rack_id) REFERENCES public.dcim_rack(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_cabletermination dcim_cabletermination__site_id_616962fa_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cabletermination
    ADD CONSTRAINT dcim_cabletermination__site_id_616962fa_fk_dcim_site_id FOREIGN KEY (_site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_cabletermination dcim_cabletermination_cable_id_b50010d1_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cabletermination
    ADD CONSTRAINT dcim_cabletermination_cable_id_b50010d1_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleport dcim_consoleport__path_id_e40a4436_fk_dcim_cablepath_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport__path_id_e40a4436_fk_dcim_cablepath_id FOREIGN KEY (_path_id) REFERENCES public.dcim_cablepath(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleport dcim_consoleport_cable_id_a9ae5465_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport_cable_id_a9ae5465_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleport dcim_consoleport_device_id_f2d90d3c_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport_device_id_f2d90d3c_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleport dcim_consoleport_module_id_d17b2519_fk_dcim_module_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport_module_id_d17b2519_fk_dcim_module_id FOREIGN KEY (module_id) REFERENCES public.dcim_module(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleporttemplate dcim_consoleporttemp_device_type_id_075d4015_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleporttemplate
    ADD CONSTRAINT dcim_consoleporttemp_device_type_id_075d4015_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleporttemplate dcim_consoleporttemp_module_type_id_c0f35d97_fk_dcim_modu; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleporttemplate
    ADD CONSTRAINT dcim_consoleporttemp_module_type_id_c0f35d97_fk_dcim_modu FOREIGN KEY (module_type_id) REFERENCES public.dcim_moduletype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleserverporttemplate dcim_consoleserverpo_device_type_id_579bdc86_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverporttemplate
    ADD CONSTRAINT dcim_consoleserverpo_device_type_id_579bdc86_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleserverporttemplate dcim_consoleserverpo_module_type_id_4abf751a_fk_dcim_modu; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverporttemplate
    ADD CONSTRAINT dcim_consoleserverpo_module_type_id_4abf751a_fk_dcim_modu FOREIGN KEY (module_type_id) REFERENCES public.dcim_moduletype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleserverport dcim_consoleserverport__path_id_dc5abe09_fk_dcim_cablepath_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverport
    ADD CONSTRAINT dcim_consoleserverport__path_id_dc5abe09_fk_dcim_cablepath_id FOREIGN KEY (_path_id) REFERENCES public.dcim_cablepath(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleserverport dcim_consoleserverport_cable_id_f2940dfd_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverport
    ADD CONSTRAINT dcim_consoleserverport_cable_id_f2940dfd_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleserverport dcim_consoleserverport_device_id_d9866581_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverport
    ADD CONSTRAINT dcim_consoleserverport_device_id_d9866581_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleserverport dcim_consoleserverport_module_id_d060cfc8_fk_dcim_module_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverport
    ADD CONSTRAINT dcim_consoleserverport_module_id_d060cfc8_fk_dcim_module_id FOREIGN KEY (module_id) REFERENCES public.dcim_module(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_cluster_id_cf852f78_fk_virtualization_cluster_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_cluster_id_cf852f78_fk_virtualization_cluster_id FOREIGN KEY (cluster_id) REFERENCES public.virtualization_cluster(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_device_role_id_682e8188_fk_dcim_devicerole_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_device_role_id_682e8188_fk_dcim_devicerole_id FOREIGN KEY (device_role_id) REFERENCES public.dcim_devicerole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_device_type_id_d61b4086_fk_dcim_devicetype_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_device_type_id_d61b4086_fk_dcim_devicetype_id FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_location_id_11a7bedb_fk_dcim_location_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_location_id_11a7bedb_fk_dcim_location_id FOREIGN KEY (location_id) REFERENCES public.dcim_location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_platform_id_468138f1_fk_dcim_platform_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_platform_id_468138f1_fk_dcim_platform_id FOREIGN KEY (platform_id) REFERENCES public.dcim_platform(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_primary_ip4_id_2ccd943a_fk_ipam_ipaddress_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_primary_ip4_id_2ccd943a_fk_ipam_ipaddress_id FOREIGN KEY (primary_ip4_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_primary_ip6_id_d180fe91_fk_ipam_ipaddress_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_primary_ip6_id_d180fe91_fk_ipam_ipaddress_id FOREIGN KEY (primary_ip6_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_rack_id_23bde71f_fk_dcim_rack_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_rack_id_23bde71f_fk_dcim_rack_id FOREIGN KEY (rack_id) REFERENCES public.dcim_rack(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_site_id_ff897cf6_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_site_id_ff897cf6_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_tenant_id_dcea7969_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_tenant_id_dcea7969_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_virtual_chassis_id_aed51693_fk_dcim_virt; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_virtual_chassis_id_aed51693_fk_dcim_virt FOREIGN KEY (virtual_chassis_id) REFERENCES public.dcim_virtualchassis(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_devicebay dcim_devicebay_device_id_0c8a1218_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebay
    ADD CONSTRAINT dcim_devicebay_device_id_0c8a1218_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_devicebay dcim_devicebay_installed_device_id_04618112_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebay
    ADD CONSTRAINT dcim_devicebay_installed_device_id_04618112_fk_dcim_device_id FOREIGN KEY (installed_device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_devicebaytemplate dcim_devicebaytempla_device_type_id_f4b24a29_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebaytemplate
    ADD CONSTRAINT dcim_devicebaytempla_device_type_id_f4b24a29_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_devicetype dcim_devicetype_manufacturer_id_a3e8029e_fk_dcim_manu; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicetype
    ADD CONSTRAINT dcim_devicetype_manufacturer_id_a3e8029e_fk_dcim_manu FOREIGN KEY (manufacturer_id) REFERENCES public.dcim_manufacturer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_frontport dcim_frontport_cable_id_04ff8aab_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport_cable_id_04ff8aab_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_frontport dcim_frontport_device_id_950557b5_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport_device_id_950557b5_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_frontport dcim_frontport_module_id_952c3f9a_fk_dcim_module_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport_module_id_952c3f9a_fk_dcim_module_id FOREIGN KEY (module_id) REFERENCES public.dcim_module(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_frontport dcim_frontport_rear_port_id_78df2532_fk_dcim_rearport_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport_rear_port_id_78df2532_fk_dcim_rearport_id FOREIGN KEY (rear_port_id) REFERENCES public.dcim_rearport(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_frontporttemplate dcim_frontporttempla_device_type_id_f088b952_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontporttemplate
    ADD CONSTRAINT dcim_frontporttempla_device_type_id_f088b952_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_frontporttemplate dcim_frontporttempla_module_type_id_66851ff9_fk_dcim_modu; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontporttemplate
    ADD CONSTRAINT dcim_frontporttempla_module_type_id_66851ff9_fk_dcim_modu FOREIGN KEY (module_type_id) REFERENCES public.dcim_moduletype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_frontporttemplate dcim_frontporttempla_rear_port_id_9775411b_fk_dcim_rear; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontporttemplate
    ADD CONSTRAINT dcim_frontporttempla_rear_port_id_9775411b_fk_dcim_rear FOREIGN KEY (rear_port_id) REFERENCES public.dcim_rearporttemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface__path_id_f8f4f7f0_fk_dcim_cablepath_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface__path_id_f8f4f7f0_fk_dcim_cablepath_id FOREIGN KEY (_path_id) REFERENCES public.dcim_cablepath(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_bridge_id_f2a8df85_fk_dcim_interface_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_bridge_id_f2a8df85_fk_dcim_interface_id FOREIGN KEY (bridge_id) REFERENCES public.dcim_interface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_cable_id_1b264edb_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_cable_id_1b264edb_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_device_id_359c6115_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_device_id_359c6115_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_lag_id_ea1a1d12_fk_dcim_interface_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_lag_id_ea1a1d12_fk_dcim_interface_id FOREIGN KEY (lag_id) REFERENCES public.dcim_interface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_module_id_05ca2da5_fk_dcim_module_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_module_id_05ca2da5_fk_dcim_module_id FOREIGN KEY (module_id) REFERENCES public.dcim_module(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_parent_id_3e2b159b_fk_dcim_interface_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_parent_id_3e2b159b_fk_dcim_interface_id FOREIGN KEY (parent_id) REFERENCES public.dcim_interface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface_tagged_vlans dcim_interface_tagge_interface_id_5870c9e9_fk_dcim_inte; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface_tagged_vlans
    ADD CONSTRAINT dcim_interface_tagge_interface_id_5870c9e9_fk_dcim_inte FOREIGN KEY (interface_id) REFERENCES public.dcim_interface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface_tagged_vlans dcim_interface_tagged_vlans_vlan_id_e027005c_fk_ipam_vlan_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface_tagged_vlans
    ADD CONSTRAINT dcim_interface_tagged_vlans_vlan_id_e027005c_fk_ipam_vlan_id FOREIGN KEY (vlan_id) REFERENCES public.ipam_vlan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_untagged_vlan_id_838dc7be_fk_ipam_vlan_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_untagged_vlan_id_838dc7be_fk_ipam_vlan_id FOREIGN KEY (untagged_vlan_id) REFERENCES public.ipam_vlan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface_vdcs dcim_interface_vdcs_interface_id_6d58dbaf_fk_dcim_interface_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface_vdcs
    ADD CONSTRAINT dcim_interface_vdcs_interface_id_6d58dbaf_fk_dcim_interface_id FOREIGN KEY (interface_id) REFERENCES public.dcim_interface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface_vdcs dcim_interface_vdcs_virtualdevicecontext_af0bfd4b_fk_dcim_virt; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface_vdcs
    ADD CONSTRAINT dcim_interface_vdcs_virtualdevicecontext_af0bfd4b_fk_dcim_virt FOREIGN KEY (virtualdevicecontext_id) REFERENCES public.dcim_virtualdevicecontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_vrf_id_a92e59b2_fk_ipam_vrf_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_vrf_id_a92e59b2_fk_ipam_vrf_id FOREIGN KEY (vrf_id) REFERENCES public.ipam_vrf(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface_wireless_lans dcim_interface_wirel_interface_id_80df3785_fk_dcim_inte; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface_wireless_lans
    ADD CONSTRAINT dcim_interface_wirel_interface_id_80df3785_fk_dcim_inte FOREIGN KEY (interface_id) REFERENCES public.dcim_interface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface_wireless_lans dcim_interface_wirel_wirelesslan_id_f081e278_fk_wireless_; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface_wireless_lans
    ADD CONSTRAINT dcim_interface_wirel_wirelesslan_id_f081e278_fk_wireless_ FOREIGN KEY (wirelesslan_id) REFERENCES public.wireless_wirelesslan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_wireless_link_id_bc91108f_fk_wireless_; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_wireless_link_id_bc91108f_fk_wireless_ FOREIGN KEY (wireless_link_id) REFERENCES public.wireless_wirelesslink(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interfacetemplate dcim_interfacetempla_device_type_id_4bfcbfab_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interfacetemplate
    ADD CONSTRAINT dcim_interfacetempla_device_type_id_4bfcbfab_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interfacetemplate dcim_interfacetempla_module_type_id_f941f180_fk_dcim_modu; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interfacetemplate
    ADD CONSTRAINT dcim_interfacetempla_module_type_id_f941f180_fk_dcim_modu FOREIGN KEY (module_type_id) REFERENCES public.dcim_moduletype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_inventoryitem dcim_inventoryitem_component_type_id_f0e4d83a_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_component_type_id_f0e4d83a_fk_django_co FOREIGN KEY (component_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_inventoryitem dcim_inventoryitem_device_id_033d83f8_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_device_id_033d83f8_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_inventoryitem dcim_inventoryitem_manufacturer_id_dcd1b78a_fk_dcim_manu; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_manufacturer_id_dcd1b78a_fk_dcim_manu FOREIGN KEY (manufacturer_id) REFERENCES public.dcim_manufacturer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_inventoryitem dcim_inventoryitem_parent_id_7ebcd457_fk_dcim_inventoryitem_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_parent_id_7ebcd457_fk_dcim_inventoryitem_id FOREIGN KEY (parent_id) REFERENCES public.dcim_inventoryitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_inventoryitem dcim_inventoryitem_role_id_2bcfcb04_fk_dcim_inve; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_role_id_2bcfcb04_fk_dcim_inve FOREIGN KEY (role_id) REFERENCES public.dcim_inventoryitemrole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_inventoryitemtemplate dcim_inventoryitemte_component_type_id_161623a2_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitemtemplate
    ADD CONSTRAINT dcim_inventoryitemte_component_type_id_161623a2_fk_django_co FOREIGN KEY (component_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_inventoryitemtemplate dcim_inventoryitemte_device_type_id_6a1be904_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitemtemplate
    ADD CONSTRAINT dcim_inventoryitemte_device_type_id_6a1be904_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_inventoryitemtemplate dcim_inventoryitemte_manufacturer_id_b388c5d9_fk_dcim_manu; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitemtemplate
    ADD CONSTRAINT dcim_inventoryitemte_manufacturer_id_b388c5d9_fk_dcim_manu FOREIGN KEY (manufacturer_id) REFERENCES public.dcim_manufacturer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_inventoryitemtemplate dcim_inventoryitemte_parent_id_0dac73bb_fk_dcim_inve; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitemtemplate
    ADD CONSTRAINT dcim_inventoryitemte_parent_id_0dac73bb_fk_dcim_inve FOREIGN KEY (parent_id) REFERENCES public.dcim_inventoryitemtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_inventoryitemtemplate dcim_inventoryitemte_role_id_292676e6_fk_dcim_inve; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitemtemplate
    ADD CONSTRAINT dcim_inventoryitemte_role_id_292676e6_fk_dcim_inve FOREIGN KEY (role_id) REFERENCES public.dcim_inventoryitemrole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_location dcim_location_parent_id_d77f3318_fk_dcim_location_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_location
    ADD CONSTRAINT dcim_location_parent_id_d77f3318_fk_dcim_location_id FOREIGN KEY (parent_id) REFERENCES public.dcim_location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_location dcim_location_site_id_b55e975f_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_location
    ADD CONSTRAINT dcim_location_site_id_b55e975f_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_location dcim_location_tenant_id_2c4df974_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_location
    ADD CONSTRAINT dcim_location_tenant_id_2c4df974_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_module dcim_module_device_id_53cfd5be_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_module
    ADD CONSTRAINT dcim_module_device_id_53cfd5be_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_module dcim_module_module_bay_id_8a1bf3e2_fk_dcim_modulebay_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_module
    ADD CONSTRAINT dcim_module_module_bay_id_8a1bf3e2_fk_dcim_modulebay_id FOREIGN KEY (module_bay_id) REFERENCES public.dcim_modulebay(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_module dcim_module_module_type_id_a50b39fc_fk_dcim_moduletype_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_module
    ADD CONSTRAINT dcim_module_module_type_id_a50b39fc_fk_dcim_moduletype_id FOREIGN KEY (module_type_id) REFERENCES public.dcim_moduletype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_modulebay dcim_modulebay_device_id_3526abc2_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_modulebay
    ADD CONSTRAINT dcim_modulebay_device_id_3526abc2_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_modulebaytemplate dcim_modulebaytempla_device_type_id_9eaf9bd3_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_modulebaytemplate
    ADD CONSTRAINT dcim_modulebaytempla_device_type_id_9eaf9bd3_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_moduletype dcim_moduletype_manufacturer_id_7347392e_fk_dcim_manu; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_moduletype
    ADD CONSTRAINT dcim_moduletype_manufacturer_id_7347392e_fk_dcim_manu FOREIGN KEY (manufacturer_id) REFERENCES public.dcim_manufacturer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_platform dcim_platform_manufacturer_id_83f72d3d_fk_dcim_manufacturer_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_platform
    ADD CONSTRAINT dcim_platform_manufacturer_id_83f72d3d_fk_dcim_manufacturer_id FOREIGN KEY (manufacturer_id) REFERENCES public.dcim_manufacturer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerfeed dcim_powerfeed__path_id_a1ea1f28_fk_dcim_cablepath_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed__path_id_a1ea1f28_fk_dcim_cablepath_id FOREIGN KEY (_path_id) REFERENCES public.dcim_cablepath(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerfeed dcim_powerfeed_cable_id_ec44c4f8_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed_cable_id_ec44c4f8_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerfeed dcim_powerfeed_power_panel_id_32bde3be_fk_dcim_powerpanel_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed_power_panel_id_32bde3be_fk_dcim_powerpanel_id FOREIGN KEY (power_panel_id) REFERENCES public.dcim_powerpanel(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerfeed dcim_powerfeed_rack_id_7abba090_fk_dcim_rack_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed_rack_id_7abba090_fk_dcim_rack_id FOREIGN KEY (rack_id) REFERENCES public.dcim_rack(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlet dcim_poweroutlet__path_id_cbb47bb9_fk_dcim_cablepath_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet__path_id_cbb47bb9_fk_dcim_cablepath_id FOREIGN KEY (_path_id) REFERENCES public.dcim_cablepath(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlet dcim_poweroutlet_cable_id_8dbea1ec_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet_cable_id_8dbea1ec_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlet dcim_poweroutlet_device_id_286351d7_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet_device_id_286351d7_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlet dcim_poweroutlet_module_id_032f5af2_fk_dcim_module_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet_module_id_032f5af2_fk_dcim_module_id FOREIGN KEY (module_id) REFERENCES public.dcim_module(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlet dcim_poweroutlet_power_port_id_9bdf4163_fk_dcim_powerport_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet_power_port_id_9bdf4163_fk_dcim_powerport_id FOREIGN KEY (power_port_id) REFERENCES public.dcim_powerport(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlettemplate dcim_poweroutlettemp_device_type_id_26b2316c_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlettemplate
    ADD CONSTRAINT dcim_poweroutlettemp_device_type_id_26b2316c_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlettemplate dcim_poweroutlettemp_module_type_id_6142b416_fk_dcim_modu; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlettemplate
    ADD CONSTRAINT dcim_poweroutlettemp_module_type_id_6142b416_fk_dcim_modu FOREIGN KEY (module_type_id) REFERENCES public.dcim_moduletype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlettemplate dcim_poweroutlettemp_power_port_id_c0fb0c42_fk_dcim_powe; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlettemplate
    ADD CONSTRAINT dcim_poweroutlettemp_power_port_id_c0fb0c42_fk_dcim_powe FOREIGN KEY (power_port_id) REFERENCES public.dcim_powerporttemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerpanel dcim_powerpanel_location_id_474b60f8_fk_dcim_location_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerpanel
    ADD CONSTRAINT dcim_powerpanel_location_id_474b60f8_fk_dcim_location_id FOREIGN KEY (location_id) REFERENCES public.dcim_location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerpanel dcim_powerpanel_site_id_c430bc89_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerpanel
    ADD CONSTRAINT dcim_powerpanel_site_id_c430bc89_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerport dcim_powerport__path_id_9fe4af8f_fk_dcim_cablepath_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport__path_id_9fe4af8f_fk_dcim_cablepath_id FOREIGN KEY (_path_id) REFERENCES public.dcim_cablepath(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerport dcim_powerport_cable_id_c9682ba2_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport_cable_id_c9682ba2_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerport dcim_powerport_device_id_ef7185ae_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport_device_id_ef7185ae_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerport dcim_powerport_module_id_d0c27534_fk_dcim_module_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport_module_id_d0c27534_fk_dcim_module_id FOREIGN KEY (module_id) REFERENCES public.dcim_module(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerporttemplate dcim_powerporttempla_device_type_id_1ddfbfcc_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerporttemplate
    ADD CONSTRAINT dcim_powerporttempla_device_type_id_1ddfbfcc_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerporttemplate dcim_powerporttempla_module_type_id_93e26849_fk_dcim_modu; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerporttemplate
    ADD CONSTRAINT dcim_powerporttempla_module_type_id_93e26849_fk_dcim_modu FOREIGN KEY (module_type_id) REFERENCES public.dcim_moduletype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rack dcim_rack_location_id_5f63ec31_fk_dcim_location_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_location_id_5f63ec31_fk_dcim_location_id FOREIGN KEY (location_id) REFERENCES public.dcim_location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rack dcim_rack_role_id_62d6919e_fk_dcim_rackrole_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_role_id_62d6919e_fk_dcim_rackrole_id FOREIGN KEY (role_id) REFERENCES public.dcim_rackrole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rack dcim_rack_site_id_403c7b3a_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_site_id_403c7b3a_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rack dcim_rack_tenant_id_7cdf3725_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_tenant_id_7cdf3725_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rackreservation dcim_rackreservation_rack_id_1ebbaa9b_fk_dcim_rack_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackreservation
    ADD CONSTRAINT dcim_rackreservation_rack_id_1ebbaa9b_fk_dcim_rack_id FOREIGN KEY (rack_id) REFERENCES public.dcim_rack(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rackreservation dcim_rackreservation_tenant_id_eb5e045f_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackreservation
    ADD CONSTRAINT dcim_rackreservation_tenant_id_eb5e045f_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rackreservation dcim_rackreservation_user_id_0785a527_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackreservation
    ADD CONSTRAINT dcim_rackreservation_user_id_0785a527_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rearport dcim_rearport_cable_id_42c0e4e7_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearport
    ADD CONSTRAINT dcim_rearport_cable_id_42c0e4e7_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rearport dcim_rearport_device_id_0bdfe9c0_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearport
    ADD CONSTRAINT dcim_rearport_device_id_0bdfe9c0_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rearport dcim_rearport_module_id_9a7b7e91_fk_dcim_module_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearport
    ADD CONSTRAINT dcim_rearport_module_id_9a7b7e91_fk_dcim_module_id FOREIGN KEY (module_id) REFERENCES public.dcim_module(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rearporttemplate dcim_rearporttemplat_device_type_id_6a02fd01_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearporttemplate
    ADD CONSTRAINT dcim_rearporttemplat_device_type_id_6a02fd01_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rearporttemplate dcim_rearporttemplat_module_type_id_4d970e5b_fk_dcim_modu; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearporttemplate
    ADD CONSTRAINT dcim_rearporttemplat_module_type_id_4d970e5b_fk_dcim_modu FOREIGN KEY (module_type_id) REFERENCES public.dcim_moduletype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_region dcim_region_parent_id_2486f5d4_fk_dcim_region_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_region
    ADD CONSTRAINT dcim_region_parent_id_2486f5d4_fk_dcim_region_id FOREIGN KEY (parent_id) REFERENCES public.dcim_region(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_site_asns dcim_site_asns_asn_id_3cfd0f00_fk_ipam_asn_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site_asns
    ADD CONSTRAINT dcim_site_asns_asn_id_3cfd0f00_fk_ipam_asn_id FOREIGN KEY (asn_id) REFERENCES public.ipam_asn(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_site_asns dcim_site_asns_site_id_112ccacf_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site_asns
    ADD CONSTRAINT dcim_site_asns_site_id_112ccacf_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_site dcim_site_group_id_3910c975_fk_dcim_sitegroup_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site
    ADD CONSTRAINT dcim_site_group_id_3910c975_fk_dcim_sitegroup_id FOREIGN KEY (group_id) REFERENCES public.dcim_sitegroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_site dcim_site_region_id_45210932_fk_dcim_region_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site
    ADD CONSTRAINT dcim_site_region_id_45210932_fk_dcim_region_id FOREIGN KEY (region_id) REFERENCES public.dcim_region(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_site dcim_site_tenant_id_15e7df63_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site
    ADD CONSTRAINT dcim_site_tenant_id_15e7df63_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_sitegroup dcim_sitegroup_parent_id_533a5e44_fk_dcim_sitegroup_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_sitegroup
    ADD CONSTRAINT dcim_sitegroup_parent_id_533a5e44_fk_dcim_sitegroup_id FOREIGN KEY (parent_id) REFERENCES public.dcim_sitegroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_virtualchassis dcim_virtualchassis_master_id_ab54cfc6_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_virtualchassis
    ADD CONSTRAINT dcim_virtualchassis_master_id_ab54cfc6_fk_dcim_device_id FOREIGN KEY (master_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_virtualdevicecontext dcim_virtualdeviceco_primary_ip4_id_6bd0605b_fk_ipam_ipad; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_virtualdevicecontext
    ADD CONSTRAINT dcim_virtualdeviceco_primary_ip4_id_6bd0605b_fk_ipam_ipad FOREIGN KEY (primary_ip4_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_virtualdevicecontext dcim_virtualdeviceco_primary_ip6_id_ed3b81bd_fk_ipam_ipad; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_virtualdevicecontext
    ADD CONSTRAINT dcim_virtualdeviceco_primary_ip6_id_ed3b81bd_fk_ipam_ipad FOREIGN KEY (primary_ip6_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_virtualdevicecontext dcim_virtualdeviceco_tenant_id_b6a21753_fk_tenancy_t; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_virtualdevicecontext
    ADD CONSTRAINT dcim_virtualdeviceco_tenant_id_b6a21753_fk_tenancy_t FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_virtualdevicecontext dcim_virtualdevicecontext_device_id_4f39274b_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_virtualdevicecontext
    ADD CONSTRAINT dcim_virtualdevicecontext_device_id_4f39274b_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_branch extras_branch_user_id_a6cfd338_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_branch
    ADD CONSTRAINT extras_branch_user_id_a6cfd338_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_cachedvalue extras_cachedvalue_object_type_id_6f47d444_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_cachedvalue
    ADD CONSTRAINT extras_cachedvalue_object_type_id_6f47d444_fk_django_co FOREIGN KEY (object_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_clusters extras_configcontext_cluster_id_6abd47a1_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_clusters
    ADD CONSTRAINT extras_configcontext_cluster_id_6abd47a1_fk_virtualiz FOREIGN KEY (cluster_id) REFERENCES public.virtualization_cluster(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_cluster_groups extras_configcontext_clustergroup_id_f4322ce8_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_cluster_groups
    ADD CONSTRAINT extras_configcontext_clustergroup_id_f4322ce8_fk_virtualiz FOREIGN KEY (clustergroup_id) REFERENCES public.virtualization_clustergroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_cluster_types extras_configcontext_clustertype_id_fa493b64_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_cluster_types
    ADD CONSTRAINT extras_configcontext_clustertype_id_fa493b64_fk_virtualiz FOREIGN KEY (clustertype_id) REFERENCES public.virtualization_clustertype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_platforms extras_configcontext_configcontext_id_2a516699_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_platforms
    ADD CONSTRAINT extras_configcontext_configcontext_id_2a516699_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_site_groups extras_configcontext_configcontext_id_2e0f43cb_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_site_groups
    ADD CONSTRAINT extras_configcontext_configcontext_id_2e0f43cb_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_device_types extras_configcontext_configcontext_id_55632923_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_device_types
    ADD CONSTRAINT extras_configcontext_configcontext_id_55632923_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_roles extras_configcontext_configcontext_id_59b67386_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_roles
    ADD CONSTRAINT extras_configcontext_configcontext_id_59b67386_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_tags extras_configcontext_configcontext_id_64a392b1_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tags
    ADD CONSTRAINT extras_configcontext_configcontext_id_64a392b1_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_regions extras_configcontext_configcontext_id_73003dbc_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_regions
    ADD CONSTRAINT extras_configcontext_configcontext_id_73003dbc_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_sites extras_configcontext_configcontext_id_8c54feb9_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_sites
    ADD CONSTRAINT extras_configcontext_configcontext_id_8c54feb9_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_cluster_groups extras_configcontext_configcontext_id_8f50b794_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_cluster_groups
    ADD CONSTRAINT extras_configcontext_configcontext_id_8f50b794_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_tenant_groups extras_configcontext_configcontext_id_92f68345_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenant_groups
    ADD CONSTRAINT extras_configcontext_configcontext_id_92f68345_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_tenants extras_configcontext_configcontext_id_b53552a6_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenants
    ADD CONSTRAINT extras_configcontext_configcontext_id_b53552a6_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_locations extras_configcontext_configcontext_id_cc629ec1_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_locations
    ADD CONSTRAINT extras_configcontext_configcontext_id_cc629ec1_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_cluster_types extras_configcontext_configcontext_id_d549b6f2_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_cluster_types
    ADD CONSTRAINT extras_configcontext_configcontext_id_d549b6f2_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_clusters extras_configcontext_configcontext_id_ed579a40_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_clusters
    ADD CONSTRAINT extras_configcontext_configcontext_id_ed579a40_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_roles extras_configcontext_devicerole_id_d3a84813_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_roles
    ADD CONSTRAINT extras_configcontext_devicerole_id_d3a84813_fk_dcim_devi FOREIGN KEY (devicerole_id) REFERENCES public.dcim_devicerole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_device_types extras_configcontext_devicetype_id_b8788c2d_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_device_types
    ADD CONSTRAINT extras_configcontext_devicetype_id_b8788c2d_fk_dcim_devi FOREIGN KEY (devicetype_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_locations extras_configcontext_location_id_9e19eac9_fk_dcim_loca; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_locations
    ADD CONSTRAINT extras_configcontext_location_id_9e19eac9_fk_dcim_loca FOREIGN KEY (location_id) REFERENCES public.dcim_location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_platforms extras_configcontext_platform_id_3fdfedc0_fk_dcim_plat; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_platforms
    ADD CONSTRAINT extras_configcontext_platform_id_3fdfedc0_fk_dcim_plat FOREIGN KEY (platform_id) REFERENCES public.dcim_platform(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_regions extras_configcontext_region_id_35c6ba9d_fk_dcim_regi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_regions
    ADD CONSTRAINT extras_configcontext_region_id_35c6ba9d_fk_dcim_regi FOREIGN KEY (region_id) REFERENCES public.dcim_region(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_site_groups extras_configcontext_sitegroup_id_3287c9e7_fk_dcim_site; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_site_groups
    ADD CONSTRAINT extras_configcontext_sitegroup_id_3287c9e7_fk_dcim_site FOREIGN KEY (sitegroup_id) REFERENCES public.dcim_sitegroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_sites extras_configcontext_sites_site_id_cbb76c96_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_sites
    ADD CONSTRAINT extras_configcontext_sites_site_id_cbb76c96_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_tags extras_configcontext_tags_tag_id_129a5d87_fk_extras_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tags
    ADD CONSTRAINT extras_configcontext_tags_tag_id_129a5d87_fk_extras_tag_id FOREIGN KEY (tag_id) REFERENCES public.extras_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_tenants extras_configcontext_tenant_id_8d0aa28e_fk_tenancy_t; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenants
    ADD CONSTRAINT extras_configcontext_tenant_id_8d0aa28e_fk_tenancy_t FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_tenant_groups extras_configcontext_tenantgroup_id_0909688d_fk_tenancy_t; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenant_groups
    ADD CONSTRAINT extras_configcontext_tenantgroup_id_0909688d_fk_tenancy_t FOREIGN KEY (tenantgroup_id) REFERENCES public.tenancy_tenantgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_customfield_content_types extras_customfield_c_contenttype_id_2997ba90_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield_content_types
    ADD CONSTRAINT extras_customfield_c_contenttype_id_2997ba90_fk_django_co FOREIGN KEY (contenttype_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_customfield_content_types extras_customfield_c_customfield_id_3842aaf3_fk_extras_cu; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield_content_types
    ADD CONSTRAINT extras_customfield_c_customfield_id_3842aaf3_fk_extras_cu FOREIGN KEY (customfield_id) REFERENCES public.extras_customfield(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_customfield extras_customfield_object_type_id_489f2239_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield
    ADD CONSTRAINT extras_customfield_object_type_id_489f2239_fk_django_co FOREIGN KEY (object_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_customlink_content_types extras_customlink_co_contenttype_id_df5f34c2_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customlink_content_types
    ADD CONSTRAINT extras_customlink_co_contenttype_id_df5f34c2_fk_django_co FOREIGN KEY (contenttype_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_customlink_content_types extras_customlink_co_customlink_id_229ba2bc_fk_extras_cu; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customlink_content_types
    ADD CONSTRAINT extras_customlink_co_customlink_id_229ba2bc_fk_extras_cu FOREIGN KEY (customlink_id) REFERENCES public.extras_customlink(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_exporttemplate_content_types extras_exporttemplat_contenttype_id_d80a5164_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_exporttemplate_content_types
    ADD CONSTRAINT extras_exporttemplat_contenttype_id_d80a5164_fk_django_co FOREIGN KEY (contenttype_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_exporttemplate_content_types extras_exporttemplat_exporttemplate_id_7645f081_fk_extras_ex; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_exporttemplate_content_types
    ADD CONSTRAINT extras_exporttemplat_exporttemplate_id_7645f081_fk_extras_ex FOREIGN KEY (exporttemplate_id) REFERENCES public.extras_exporttemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_imageattachment extras_imageattachme_content_type_id_90e0643d_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_imageattachment
    ADD CONSTRAINT extras_imageattachme_content_type_id_90e0643d_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_jobresult extras_jobresult_obj_type_id_475e80aa_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_jobresult
    ADD CONSTRAINT extras_jobresult_obj_type_id_475e80aa_fk_django_content_type_id FOREIGN KEY (obj_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_jobresult extras_jobresult_user_id_d35285ab_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_jobresult
    ADD CONSTRAINT extras_jobresult_user_id_d35285ab_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_journalentry extras_journalentry_assigned_object_type_1bba9f68_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_journalentry
    ADD CONSTRAINT extras_journalentry_assigned_object_type_1bba9f68_fk_django_co FOREIGN KEY (assigned_object_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_journalentry extras_journalentry_created_by_id_8d4e4329_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_journalentry
    ADD CONSTRAINT extras_journalentry_created_by_id_8d4e4329_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_objectchange extras_objectchange_changed_object_type__b755bb60_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_objectchange
    ADD CONSTRAINT extras_objectchange_changed_object_type__b755bb60_fk_django_co FOREIGN KEY (changed_object_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_objectchange extras_objectchange_related_object_type__fe6e521f_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_objectchange
    ADD CONSTRAINT extras_objectchange_related_object_type__fe6e521f_fk_django_co FOREIGN KEY (related_object_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_objectchange extras_objectchange_user_id_7fdf8186_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_objectchange
    ADD CONSTRAINT extras_objectchange_user_id_7fdf8186_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_savedfilter_content_types extras_savedfilter_c_contenttype_id_929cea22_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_savedfilter_content_types
    ADD CONSTRAINT extras_savedfilter_c_contenttype_id_929cea22_fk_django_co FOREIGN KEY (contenttype_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_savedfilter_content_types extras_savedfilter_c_savedfilter_id_1631b88b_fk_extras_sa; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_savedfilter_content_types
    ADD CONSTRAINT extras_savedfilter_c_savedfilter_id_1631b88b_fk_extras_sa FOREIGN KEY (savedfilter_id) REFERENCES public.extras_savedfilter(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_savedfilter extras_savedfilter_user_id_10502e81_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_savedfilter
    ADD CONSTRAINT extras_savedfilter_user_id_10502e81_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_stagedchange extras_stagedchange_branch_id_44893052_fk_extras_branch_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_stagedchange
    ADD CONSTRAINT extras_stagedchange_branch_id_44893052_fk_extras_branch_id FOREIGN KEY (branch_id) REFERENCES public.extras_branch(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_stagedchange extras_stagedchange_object_type_id_de76b05b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_stagedchange
    ADD CONSTRAINT extras_stagedchange_object_type_id_de76b05b_fk_django_co FOREIGN KEY (object_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_taggeditem extras_taggeditem_content_type_id_ba5562ed_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_taggeditem
    ADD CONSTRAINT extras_taggeditem_content_type_id_ba5562ed_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_taggeditem extras_taggeditem_tag_id_d48af7c7_fk_extras_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_taggeditem
    ADD CONSTRAINT extras_taggeditem_tag_id_d48af7c7_fk_extras_tag_id FOREIGN KEY (tag_id) REFERENCES public.extras_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_webhook_content_types extras_webhook_conte_contenttype_id_3fc2c4d3_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook_content_types
    ADD CONSTRAINT extras_webhook_conte_contenttype_id_3fc2c4d3_fk_django_co FOREIGN KEY (contenttype_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_webhook_content_types extras_webhook_conte_webhook_id_0c169800_fk_extras_we; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook_content_types
    ADD CONSTRAINT extras_webhook_conte_webhook_id_0c169800_fk_extras_we FOREIGN KEY (webhook_id) REFERENCES public.extras_webhook(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_aggregate ipam_aggregate_rir_id_ef7a27bd_fk_ipam_rir_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_aggregate
    ADD CONSTRAINT ipam_aggregate_rir_id_ef7a27bd_fk_ipam_rir_id FOREIGN KEY (rir_id) REFERENCES public.ipam_rir(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_aggregate ipam_aggregate_tenant_id_637dd1a1_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_aggregate
    ADD CONSTRAINT ipam_aggregate_tenant_id_637dd1a1_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_asn ipam_asn_rir_id_f5ad3cff_fk_ipam_rir_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_asn
    ADD CONSTRAINT ipam_asn_rir_id_f5ad3cff_fk_ipam_rir_id FOREIGN KEY (rir_id) REFERENCES public.ipam_rir(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_asn ipam_asn_tenant_id_07e8188e_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_asn
    ADD CONSTRAINT ipam_asn_tenant_id_07e8188e_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_fhrpgroupassignment ipam_fhrpgroupassign_interface_type_id_f3bcb487_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_fhrpgroupassignment
    ADD CONSTRAINT ipam_fhrpgroupassign_interface_type_id_f3bcb487_fk_django_co FOREIGN KEY (interface_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_fhrpgroupassignment ipam_fhrpgroupassignment_group_id_19f15ca4_fk_ipam_fhrpgroup_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_fhrpgroupassignment
    ADD CONSTRAINT ipam_fhrpgroupassignment_group_id_19f15ca4_fk_ipam_fhrpgroup_id FOREIGN KEY (group_id) REFERENCES public.ipam_fhrpgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_ipaddress ipam_ipaddress_assigned_object_type_02354370_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_assigned_object_type_02354370_fk_django_co FOREIGN KEY (assigned_object_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_ipaddress ipam_ipaddress_nat_inside_id_a45fb7c5_fk_ipam_ipaddress_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_nat_inside_id_a45fb7c5_fk_ipam_ipaddress_id FOREIGN KEY (nat_inside_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_ipaddress ipam_ipaddress_tenant_id_ac55acfd_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_tenant_id_ac55acfd_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_ipaddress ipam_ipaddress_vrf_id_51fcc59b_fk_ipam_vrf_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_vrf_id_51fcc59b_fk_ipam_vrf_id FOREIGN KEY (vrf_id) REFERENCES public.ipam_vrf(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_iprange ipam_iprange_role_id_2782e864_fk_ipam_role_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_iprange
    ADD CONSTRAINT ipam_iprange_role_id_2782e864_fk_ipam_role_id FOREIGN KEY (role_id) REFERENCES public.ipam_role(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_iprange ipam_iprange_tenant_id_856027ea_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_iprange
    ADD CONSTRAINT ipam_iprange_tenant_id_856027ea_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_iprange ipam_iprange_vrf_id_613e9dd2_fk_ipam_vrf_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_iprange
    ADD CONSTRAINT ipam_iprange_vrf_id_613e9dd2_fk_ipam_vrf_id FOREIGN KEY (vrf_id) REFERENCES public.ipam_vrf(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_l2vpn_export_targets ipam_l2vpn_export_ta_routetarget_id_5ccb758b_fk_ipam_rout; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_l2vpn_export_targets
    ADD CONSTRAINT ipam_l2vpn_export_ta_routetarget_id_5ccb758b_fk_ipam_rout FOREIGN KEY (routetarget_id) REFERENCES public.ipam_routetarget(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_l2vpn_export_targets ipam_l2vpn_export_targets_l2vpn_id_8749bbe8_fk_ipam_l2vpn_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_l2vpn_export_targets
    ADD CONSTRAINT ipam_l2vpn_export_targets_l2vpn_id_8749bbe8_fk_ipam_l2vpn_id FOREIGN KEY (l2vpn_id) REFERENCES public.ipam_l2vpn(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_l2vpn_import_targets ipam_l2vpn_import_ta_routetarget_id_58a188b2_fk_ipam_rout; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_l2vpn_import_targets
    ADD CONSTRAINT ipam_l2vpn_import_ta_routetarget_id_58a188b2_fk_ipam_rout FOREIGN KEY (routetarget_id) REFERENCES public.ipam_routetarget(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_l2vpn_import_targets ipam_l2vpn_import_targets_l2vpn_id_731f5bb4_fk_ipam_l2vpn_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_l2vpn_import_targets
    ADD CONSTRAINT ipam_l2vpn_import_targets_l2vpn_id_731f5bb4_fk_ipam_l2vpn_id FOREIGN KEY (l2vpn_id) REFERENCES public.ipam_l2vpn(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_l2vpn ipam_l2vpn_tenant_id_bb2564a6_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_l2vpn
    ADD CONSTRAINT ipam_l2vpn_tenant_id_bb2564a6_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_l2vpntermination ipam_l2vpnterminatio_assigned_object_type_3923c124_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_l2vpntermination
    ADD CONSTRAINT ipam_l2vpnterminatio_assigned_object_type_3923c124_fk_django_co FOREIGN KEY (assigned_object_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_l2vpntermination ipam_l2vpntermination_l2vpn_id_9e570aa1_fk_ipam_l2vpn_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_l2vpntermination
    ADD CONSTRAINT ipam_l2vpntermination_l2vpn_id_9e570aa1_fk_ipam_l2vpn_id FOREIGN KEY (l2vpn_id) REFERENCES public.ipam_l2vpn(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_prefix ipam_prefix_role_id_0a98d415_fk_ipam_role_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_role_id_0a98d415_fk_ipam_role_id FOREIGN KEY (role_id) REFERENCES public.ipam_role(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_prefix ipam_prefix_site_id_0b20df05_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_site_id_0b20df05_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_prefix ipam_prefix_tenant_id_7ba1fcc4_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_tenant_id_7ba1fcc4_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_prefix ipam_prefix_vlan_id_1db91bff_fk_ipam_vlan_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_vlan_id_1db91bff_fk_ipam_vlan_id FOREIGN KEY (vlan_id) REFERENCES public.ipam_vlan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_prefix ipam_prefix_vrf_id_34f78ed0_fk_ipam_vrf_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_vrf_id_34f78ed0_fk_ipam_vrf_id FOREIGN KEY (vrf_id) REFERENCES public.ipam_vrf(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_routetarget ipam_routetarget_tenant_id_5a0b35e8_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_routetarget
    ADD CONSTRAINT ipam_routetarget_tenant_id_5a0b35e8_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_service ipam_service_device_id_b4d2bb9c_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service
    ADD CONSTRAINT ipam_service_device_id_b4d2bb9c_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_service_ipaddresses ipam_service_ipaddre_ipaddress_id_b4138c6d_fk_ipam_ipad; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service_ipaddresses
    ADD CONSTRAINT ipam_service_ipaddre_ipaddress_id_b4138c6d_fk_ipam_ipad FOREIGN KEY (ipaddress_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_service_ipaddresses ipam_service_ipaddresses_service_id_ae26b9ab_fk_ipam_service_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service_ipaddresses
    ADD CONSTRAINT ipam_service_ipaddresses_service_id_ae26b9ab_fk_ipam_service_id FOREIGN KEY (service_id) REFERENCES public.ipam_service(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_service ipam_service_virtual_machine_id_e8b53562_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service
    ADD CONSTRAINT ipam_service_virtual_machine_id_e8b53562_fk_virtualiz FOREIGN KEY (virtual_machine_id) REFERENCES public.virtualization_virtualmachine(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vlan ipam_vlan_group_id_88cbfa62_fk_ipam_vlangroup_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_group_id_88cbfa62_fk_ipam_vlangroup_id FOREIGN KEY (group_id) REFERENCES public.ipam_vlangroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vlan ipam_vlan_role_id_f5015962_fk_ipam_role_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_role_id_f5015962_fk_ipam_role_id FOREIGN KEY (role_id) REFERENCES public.ipam_role(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vlan ipam_vlan_site_id_a59334e3_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_site_id_a59334e3_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vlan ipam_vlan_tenant_id_71a8290d_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_tenant_id_71a8290d_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vlangroup ipam_vlangroup_scope_type_id_6606a755_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlangroup
    ADD CONSTRAINT ipam_vlangroup_scope_type_id_6606a755_fk_django_content_type_id FOREIGN KEY (scope_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vrf_export_targets ipam_vrf_export_targ_routetarget_id_8d9319f7_fk_ipam_rout; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf_export_targets
    ADD CONSTRAINT ipam_vrf_export_targ_routetarget_id_8d9319f7_fk_ipam_rout FOREIGN KEY (routetarget_id) REFERENCES public.ipam_routetarget(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vrf_export_targets ipam_vrf_export_targets_vrf_id_6f4875c4_fk_ipam_vrf_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf_export_targets
    ADD CONSTRAINT ipam_vrf_export_targets_vrf_id_6f4875c4_fk_ipam_vrf_id FOREIGN KEY (vrf_id) REFERENCES public.ipam_vrf(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vrf_import_targets ipam_vrf_import_targ_routetarget_id_0e05b144_fk_ipam_rout; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf_import_targets
    ADD CONSTRAINT ipam_vrf_import_targ_routetarget_id_0e05b144_fk_ipam_rout FOREIGN KEY (routetarget_id) REFERENCES public.ipam_routetarget(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vrf_import_targets ipam_vrf_import_targets_vrf_id_ed491b19_fk_ipam_vrf_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf_import_targets
    ADD CONSTRAINT ipam_vrf_import_targets_vrf_id_ed491b19_fk_ipam_vrf_id FOREIGN KEY (vrf_id) REFERENCES public.ipam_vrf(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vrf ipam_vrf_tenant_id_498b0051_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf
    ADD CONSTRAINT ipam_vrf_tenant_id_498b0051_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem taggit_taggeditem_content_type_id_9957a03c_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_content_type_id_9957a03c_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id FOREIGN KEY (tag_id) REFERENCES public.taggit_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tenancy_contact tenancy_contact_group_id_76e0267c_fk_tenancy_contactgroup_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_contact
    ADD CONSTRAINT tenancy_contact_group_id_76e0267c_fk_tenancy_contactgroup_id FOREIGN KEY (group_id) REFERENCES public.tenancy_contactgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tenancy_contactassignment tenancy_contactassig_contact_id_5302baf0_fk_tenancy_c; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_contactassignment
    ADD CONSTRAINT tenancy_contactassig_contact_id_5302baf0_fk_tenancy_c FOREIGN KEY (contact_id) REFERENCES public.tenancy_contact(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tenancy_contactassignment tenancy_contactassig_content_type_id_0c3f0c67_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_contactassignment
    ADD CONSTRAINT tenancy_contactassig_content_type_id_0c3f0c67_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tenancy_contactassignment tenancy_contactassig_role_id_fc08bfb5_fk_tenancy_c; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_contactassignment
    ADD CONSTRAINT tenancy_contactassig_role_id_fc08bfb5_fk_tenancy_c FOREIGN KEY (role_id) REFERENCES public.tenancy_contactrole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tenancy_contactgroup tenancy_contactgroup_parent_id_c087d69f_fk_tenancy_c; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_contactgroup
    ADD CONSTRAINT tenancy_contactgroup_parent_id_c087d69f_fk_tenancy_c FOREIGN KEY (parent_id) REFERENCES public.tenancy_contactgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tenancy_tenant tenancy_tenant_group_id_7daef6f4_fk_tenancy_tenantgroup_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenant
    ADD CONSTRAINT tenancy_tenant_group_id_7daef6f4_fk_tenancy_tenantgroup_id FOREIGN KEY (group_id) REFERENCES public.tenancy_tenantgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tenancy_tenantgroup tenancy_tenantgroup_parent_id_2542fc18_fk_tenancy_t; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenantgroup
    ADD CONSTRAINT tenancy_tenantgroup_parent_id_2542fc18_fk_tenancy_t FOREIGN KEY (parent_id) REFERENCES public.tenancy_tenantgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_objectpermission_object_types users_objectpermissi_contenttype_id_594b1cc7_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_object_types
    ADD CONSTRAINT users_objectpermissi_contenttype_id_594b1cc7_fk_django_co FOREIGN KEY (contenttype_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_objectpermission_groups users_objectpermissi_group_id_fb7ba6e0_fk_auth_grou; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_groups
    ADD CONSTRAINT users_objectpermissi_group_id_fb7ba6e0_fk_auth_grou FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_objectpermission_groups users_objectpermissi_objectpermission_id_2f7cc117_fk_users_obj; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_groups
    ADD CONSTRAINT users_objectpermissi_objectpermission_id_2f7cc117_fk_users_obj FOREIGN KEY (objectpermission_id) REFERENCES public.users_objectpermission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_objectpermission_object_types users_objectpermissi_objectpermission_id_38c7d8f5_fk_users_obj; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_object_types
    ADD CONSTRAINT users_objectpermissi_objectpermission_id_38c7d8f5_fk_users_obj FOREIGN KEY (objectpermission_id) REFERENCES public.users_objectpermission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_objectpermission_users users_objectpermissi_objectpermission_id_78a9c2e6_fk_users_obj; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_users
    ADD CONSTRAINT users_objectpermissi_objectpermission_id_78a9c2e6_fk_users_obj FOREIGN KEY (objectpermission_id) REFERENCES public.users_objectpermission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_objectpermission_users users_objectpermission_users_user_id_16c0905d_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_users
    ADD CONSTRAINT users_objectpermission_users_user_id_16c0905d_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_token users_token_user_id_af964690_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_token
    ADD CONSTRAINT users_token_user_id_af964690_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_userconfig users_userconfig_user_id_afd44184_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_userconfig
    ADD CONSTRAINT users_userconfig_user_id_afd44184_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_cluster virtualization_clust_group_id_de379828_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_clust_group_id_de379828_fk_virtualiz FOREIGN KEY (group_id) REFERENCES public.virtualization_clustergroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_cluster virtualization_clust_type_id_4efafb0a_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_clust_type_id_4efafb0a_fk_virtualiz FOREIGN KEY (type_id) REFERENCES public.virtualization_clustertype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_cluster virtualization_cluster_site_id_4d5af282_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_cluster_site_id_4d5af282_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_cluster virtualization_cluster_tenant_id_bc2868d0_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_cluster_tenant_id_bc2868d0_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_cluster_id_6c9f9047_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_cluster_id_6c9f9047_fk_virtualiz FOREIGN KEY (cluster_id) REFERENCES public.virtualization_cluster(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_device_id_5a49ed18_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_device_id_5a49ed18_fk_dcim_devi FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_platform_id_a6c5ccb2_fk_dcim_plat; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_platform_id_a6c5ccb2_fk_dcim_plat FOREIGN KEY (platform_id) REFERENCES public.dcim_platform(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_primary_ip4_id_942e42ae_fk_ipam_ipad; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_primary_ip4_id_942e42ae_fk_ipam_ipad FOREIGN KEY (primary_ip4_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_primary_ip6_id_b7904e73_fk_ipam_ipad; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_primary_ip6_id_b7904e73_fk_ipam_ipad FOREIGN KEY (primary_ip6_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_role_id_0cc898f9_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_role_id_0cc898f9_fk_dcim_devi FOREIGN KEY (role_id) REFERENCES public.dcim_devicerole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_tenant_id_d00d1d77_fk_tenancy_t; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_tenant_id_d00d1d77_fk_tenancy_t FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtualmachine_site_id_54475a27_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtualmachine_site_id_54475a27_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_vminterface virtualization_vmint_bridge_id_7462b91e_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface
    ADD CONSTRAINT virtualization_vmint_bridge_id_7462b91e_fk_virtualiz FOREIGN KEY (bridge_id) REFERENCES public.virtualization_vminterface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_vminterface virtualization_vmint_parent_id_f86958e1_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface
    ADD CONSTRAINT virtualization_vmint_parent_id_f86958e1_fk_virtualiz FOREIGN KEY (parent_id) REFERENCES public.virtualization_vminterface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_vminterface virtualization_vmint_untagged_vlan_id_aea4fc69_fk_ipam_vlan; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface
    ADD CONSTRAINT virtualization_vmint_untagged_vlan_id_aea4fc69_fk_ipam_vlan FOREIGN KEY (untagged_vlan_id) REFERENCES public.ipam_vlan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_vminterface virtualization_vmint_virtual_machine_id_e9f89829_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface
    ADD CONSTRAINT virtualization_vmint_virtual_machine_id_e9f89829_fk_virtualiz FOREIGN KEY (virtual_machine_id) REFERENCES public.virtualization_virtualmachine(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_vminterface_tagged_vlans virtualization_vmint_vlan_id_4e77411e_fk_ipam_vlan; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface_tagged_vlans
    ADD CONSTRAINT virtualization_vmint_vlan_id_4e77411e_fk_ipam_vlan FOREIGN KEY (vlan_id) REFERENCES public.ipam_vlan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_vminterface_tagged_vlans virtualization_vmint_vminterface_id_904b12de_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface_tagged_vlans
    ADD CONSTRAINT virtualization_vmint_vminterface_id_904b12de_fk_virtualiz FOREIGN KEY (vminterface_id) REFERENCES public.virtualization_vminterface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_vminterface virtualization_vminterface_vrf_id_4b570a8c_fk_ipam_vrf_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface
    ADD CONSTRAINT virtualization_vminterface_vrf_id_4b570a8c_fk_ipam_vrf_id FOREIGN KEY (vrf_id) REFERENCES public.ipam_vrf(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wireless_wirelesslan wireless_wirelesslan_group_id_d9e3d67f_fk_wireless_; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.wireless_wirelesslan
    ADD CONSTRAINT wireless_wirelesslan_group_id_d9e3d67f_fk_wireless_ FOREIGN KEY (group_id) REFERENCES public.wireless_wirelesslangroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wireless_wirelesslangroup wireless_wirelesslan_parent_id_37ca8b87_fk_wireless_; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.wireless_wirelesslangroup
    ADD CONSTRAINT wireless_wirelesslan_parent_id_37ca8b87_fk_wireless_ FOREIGN KEY (parent_id) REFERENCES public.wireless_wirelesslangroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wireless_wirelesslan wireless_wirelesslan_tenant_id_5dfee941_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.wireless_wirelesslan
    ADD CONSTRAINT wireless_wirelesslan_tenant_id_5dfee941_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wireless_wirelesslan wireless_wirelesslan_vlan_id_d7fa6ccc_fk_ipam_vlan_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.wireless_wirelesslan
    ADD CONSTRAINT wireless_wirelesslan_vlan_id_d7fa6ccc_fk_ipam_vlan_id FOREIGN KEY (vlan_id) REFERENCES public.ipam_vlan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wireless_wirelesslink wireless_wirelesslin__interface_a_device__6c8e042e_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.wireless_wirelesslink
    ADD CONSTRAINT wireless_wirelesslin__interface_a_device__6c8e042e_fk_dcim_devi FOREIGN KEY (_interface_a_device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wireless_wirelesslink wireless_wirelesslin__interface_b_device__43d5101a_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.wireless_wirelesslink
    ADD CONSTRAINT wireless_wirelesslin__interface_b_device__43d5101a_fk_dcim_devi FOREIGN KEY (_interface_b_device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wireless_wirelesslink wireless_wirelesslin_interface_a_id_bc9e37fd_fk_dcim_inte; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.wireless_wirelesslink
    ADD CONSTRAINT wireless_wirelesslin_interface_a_id_bc9e37fd_fk_dcim_inte FOREIGN KEY (interface_a_id) REFERENCES public.dcim_interface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wireless_wirelesslink wireless_wirelesslin_interface_b_id_a82fb2ee_fk_dcim_inte; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.wireless_wirelesslink
    ADD CONSTRAINT wireless_wirelesslin_interface_b_id_a82fb2ee_fk_dcim_inte FOREIGN KEY (interface_b_id) REFERENCES public.dcim_interface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wireless_wirelesslink wireless_wirelesslink_tenant_id_4c0638ee_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.wireless_wirelesslink
    ADD CONSTRAINT wireless_wirelesslink_tenant_id_4c0638ee_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

