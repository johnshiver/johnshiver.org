--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.4
-- Dumped by pg_dump version 9.5.7

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: john
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO john;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: john
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO john;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: john
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: john
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO john;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: john
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO john;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: john
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: john
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO john;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: john
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO john;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: john
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: john
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO john;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: john
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO john;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: john
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO john;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: john
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: john
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO john;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: john
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: john
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO john;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: john
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO john;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: john
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: blog_post; Type: TABLE; Schema: public; Owner: john
--

CREATE TABLE blog_post (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    title character varying(200) NOT NULL,
    body text NOT NULL,
    body_html text,
    slug character varying(500) NOT NULL,
    views integer NOT NULL
);


ALTER TABLE blog_post OWNER TO john;

--
-- Name: blog_post_id_seq; Type: SEQUENCE; Schema: public; Owner: john
--

CREATE SEQUENCE blog_post_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE blog_post_id_seq OWNER TO john;

--
-- Name: blog_post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: john
--

ALTER SEQUENCE blog_post_id_seq OWNED BY blog_post.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: john
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


ALTER TABLE django_admin_log OWNER TO john;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: john
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO john;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: john
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: john
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO john;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: john
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO john;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: john
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: john
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO john;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: john
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO john;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: john
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: john
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO john;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: john
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: john
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: john
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: john
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: john
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: john
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: john
--

ALTER TABLE ONLY blog_post ALTER COLUMN id SET DEFAULT nextval('blog_post_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: john
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: john
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: john
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: john
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: john
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: john
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: john
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: john
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
4	Can add group	2	add_group
5	Can change group	2	change_group
6	Can delete group	2	delete_group
7	Can add user	3	add_user
8	Can change user	3	change_user
9	Can delete user	3	delete_user
10	Can add log entry	4	add_logentry
11	Can change log entry	4	change_logentry
12	Can delete log entry	4	delete_logentry
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add post	7	add_post
20	Can change post	7	change_post
21	Can delete post	7	delete_post
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: john
--

SELECT pg_catalog.setval('auth_permission_id_seq', 21, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: john
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$24000$qwWthP0pxMyd$Wj3Z6hovwFbzarMBJQiXtHE0uxT14W0U8SQ/Nxog0N0=	2017-07-17 15:46:45.275757+00	t	johnshiver			johneshiver@gmail.com	t	t	2017-01-04 03:40:07.053772+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: john
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: john
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: john
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: john
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: john
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: blog_post; Type: TABLE DATA; Schema: public; Owner: john
--

COPY blog_post (id, created, modified, title, body, body_html, slug, views) FROM stdin;
4	2017-03-01 19:22:00.470439+00	2017-07-18 17:07:15.094504+00	Algorithm Fundamentals: Merge Sort	Imagine having a phone book without the last names sorted alphabetically. Or a dictionary with words unorganized. Ever tried to find a web page on the internet without the help of a search engine to rank results by relevance?\r\n\r\nAll of these tools derive their usefulness primarily from presenting information that has been sorted.\r\nSorting algorithms are one of the key areas of research within computer science. After all, data is mostly useless without some sort of structure. Some algorithms (like binary search) even require the input data to be sorted. While sorting data in your language of choice may be as easy as calling a built-in sort function, it’s essential for software engineers to understand the cost of sorting data (known as Big O notation for time and space complexity) and even better to understand the mechanics of the fundamental sorting algorithms: merge sort and quicksort.\r\n\r\nIn this blog post, I’m going to explain merge sort. My Python implementation will sort a list of integers, but you can use merge sort with any data that can be compared.\r\nA note before we begin: if you are not already familiar with recursion, I recommend reading up on that topic first, before tackling merge sort.\r\n\r\n##Merge Sort##\r\nMerge sort is comprised of two key insights:\r\na list of size one (i.e. a list with only one element) is always considered sorted\r\ncreating a sorted list from two lists that are already sorted can be done in linear time, expressed in Big O notation as: O(n)\r\nCombined, these two innocuous insights are quite powerful:\r\n\r\n    x = [5]\r\n    y = [8]\r\n\r\nBoth x and y are size one and are therefore sorted. Combining xand y into a new sorted list, z, is simple and fast:\r\n\r\n    z = []\r\n    if x[0] < y[0]:\r\n        z.append(x[0])\r\n        z.append(y[0])\r\n    else:\r\n        z.append(y[0])\r\n        z.append(x[0])\r\n\r\nEasy enough!\r\nNow, think: how can these two concepts extend to a list of any size?\r\nThis is where recursion comes into play. Recursion is all about breaking big problems into smaller problems that are easy to manage. Say we have an array with 100 random integers and we need to sort them. Given the two insights we learned above, you might think, “I don’t know how to sort an array with 100 integers. But, I do know how to handle an array of size one.”\r\nWith this in mind, the first step of merge sort is to divide the input list into smaller lists, until we are working with lists that contain a single element. To divide the input list, we’ll use recursion: each time the function recurses, the input list is divided in half until the input list is of size one. When the input list is of size one (holding only one element), recursion ends and we can work with that list. Therefore, our base case is when the list contains fewer than 2 elements:\r\n\r\n    def merge_sort(array):\r\n        if len(array) < 2:\r\n            return array\r\n\r\nIf the base case does not trigger (meaning we have a list with more than one element in it), we divide the list into two halves, then recursively call the same merge_sort function on each half. How many recursions will it take until the list only has one element? Since every recursive step only processes “half” the data, it’s the inverse of exponential growth, meaning log(n) steps.\r\n\r\n    mid = len(array) / 2\r\n    left = array[:mid]\r\n    right = array[mid:]\r\n    left = merge_sort(left)\r\n    right = merge_sort(right)\r\n    #then we simply merge the two halves together (more on this later)\r\n    return merge(array, left, right)\r\n\r\nAgain, if you are not comfortable with recursion, it might take a few reads to wrap your head around the concept. In the above code, the first time merge_sort returns a value to left and right (when the base case is finally triggered), it will be either an empty list or a list with one element in it. Recalling insight number one, we know we have two sorted lists! Recalling insight number two, two sorted lists can be merged into one sorted list in linear time, so we simply need to write a function to merge two sorted lists of any size. We’re nearly done!\r\nLet’s look at the merge function line by line:\r\n\r\n    def merge(array, left, right):\r\n        #index pointers for array, left, and right\r\n        m = l = r = 0\r\n        while l < len(left) and r < len(right):\r\n            if left[l] <= right[r]:\r\n                array[m] = left[l]\r\n                l += 1\r\n            else:\r\n                array[m] = right[r]\r\n                r += 1\r\n            m += 1\r\n\r\nThe merge function takes the original list (unsorted) and its two sorted halves: the left list and the right list. Here we are reusing the original list to create a sorted list, but you could also create a new list altogether and add your arrays to that.\r\nThe basic idea is to compare elements from the left list to elements of the right list, copying the smaller of the two values onto the original array, incrementing index pointers as you move along. You’ll notice these steps take place in a while loop that checks that the left and right index are both within the bounds of their respective lists. This means that when the first while loop executes, one list will have some elements left over. This intuitively makes sense — while comparing elements from the left and right lists, one list (left or right) is going to have more smaller values and will run out of elements first, killing the while loop. Since we have a list with some leftover, sorted elements, the next step is simply to add the remainder to the final sorted list and return it.\r\n\r\n    while l < len(left):\r\n        array[m] = left[l]\r\n        l += 1\r\n        m += 1\r\n    while r < len(right):\r\n        array[m] = right[r]\r\n        r += 1\r\n        m += 1\r\n    return array\r\n\r\nThat’s all there is to the merge sort! The left and right list that emerge from recursion will be sorted, and your algorithm will happily merge these increasingly large sorted lists until you are a left with your initial array, sorted.\r\n\r\n    #left and right will always be sorted\r\n    left = merge_sort(left)\r\n    right = merge_sort(right)\r\n    return merge(array, left, right)\r\n\r\n##Time Complexity##\r\nFinally, what is the time complexity of this algorithm? The goal of the recursive function was to reduce the size of the input list recursively until we reached a list of size one or smaller. This should ring a bell! Cutting an input’s size in half during each recursive iteration is a O(log n) operation. That is, it will take log(n) recursive calls until the base case is reached.\r\nThe other half of our merge sort algorithm is combining the two sorted lists into one list. Taking a look at the merge function, you are basically just comparing elements and sticking them in the final list one at a time. As the number of elements in each list grows, the number of comparisons grows at the same rate as the size of the list. That is, two lists of size 5 would need 5 comparisons for each merge, two lists of size 100 would require 100 comparisons and so on. This is very clearly a linear function, or O(n).\r\nPutting it together, the merge sort algorithm performs an O(n) merge O(log n) times, which is expressed as an O(n*log(n)) algorithm. That’s very speedy compared to traditional O(n2) algorithms!\r\n\r\nThat concludes our basic introduction to merge sort. Other considerations I’d encourage as an exercise for the reader are memory as a function of n and whether the sort is “stable,” and so on.\r\nWhat is important to take away is that there is no sorting algorithm on earth that beats O(nlog(n)). All the best sorting algorithms reach this same value. The reason there are so many different sorting algorithms lies in the details—choosing one over another often depends on the nature of the data you are sorting and other considerations. In the vast majority of cases, the built-in sort method will perform far better than any sorting implementation you write, but now you know the cost for each call is at least O(nlog(n)). Happy sorting!	<p>Imagine having a phone book without the last names sorted alphabetically. Or a dictionary with words unorganized. Ever tried to find a web page on the internet without the help of a search engine to rank results by relevance?</p>\n<p>All of these tools derive their usefulness primarily from presenting information that has been sorted.\nSorting algorithms are one of the key areas of research within computer science. After all, data is mostly useless without some sort of structure. Some algorithms (like binary search) even require the input data to be sorted. While sorting data in your language of choice may be as easy as calling a built-in sort function, it’s essential for software engineers to understand the cost of sorting data (known as Big O notation for time and space complexity) and even better to understand the mechanics of the fundamental sorting algorithms: merge sort and quicksort.</p>\n<p>In this blog post, I’m going to explain merge sort. My Python implementation will sort a list of integers, but you can use merge sort with any data that can be compared.\nA note before we begin: if you are not already familiar with recursion, I recommend reading up on that topic first, before tackling merge sort.</p>\n<h2>Merge Sort</h2>\n<p>Merge sort is comprised of two key insights:\na list of size one (i.e. a list with only one element) is always considered sorted\ncreating a sorted list from two lists that are already sorted can be done in linear time, expressed in Big O notation as: O(n)\nCombined, these two innocuous insights are quite powerful:</p>\n<div class="codehilite"><pre><span></span>x = [5]\ny = [8]\n</pre></div>\n\n\n<p>Both x and y are size one and are therefore sorted. Combining xand y into a new sorted list, z, is simple and fast:</p>\n<div class="codehilite"><pre><span></span>z = []\nif x[0] &lt; y[0]:\n    z.append(x[0])\n    z.append(y[0])\nelse:\n    z.append(y[0])\n    z.append(x[0])\n</pre></div>\n\n\n<p>Easy enough!\nNow, think: how can these two concepts extend to a list of any size?\nThis is where recursion comes into play. Recursion is all about breaking big problems into smaller problems that are easy to manage. Say we have an array with 100 random integers and we need to sort them. Given the two insights we learned above, you might think, “I don’t know how to sort an array with 100 integers. But, I do know how to handle an array of size one.”\nWith this in mind, the first step of merge sort is to divide the input list into smaller lists, until we are working with lists that contain a single element. To divide the input list, we’ll use recursion: each time the function recurses, the input list is divided in half until the input list is of size one. When the input list is of size one (holding only one element), recursion ends and we can work with that list. Therefore, our base case is when the list contains fewer than 2 elements:</p>\n<div class="codehilite"><pre><span></span>def merge_sort(array):\n    if len(array) &lt; 2:\n        return array\n</pre></div>\n\n\n<p>If the base case does not trigger (meaning we have a list with more than one element in it), we divide the list into two halves, then recursively call the same merge_sort function on each half. How many recursions will it take until the list only has one element? Since every recursive step only processes “half” the data, it’s the inverse of exponential growth, meaning log(n) steps.</p>\n<div class="codehilite"><pre><span></span>mid = len(array) / 2\nleft = array[:mid]\nright = array[mid:]\nleft = merge_sort(left)\nright = merge_sort(right)\n#then we simply merge the two halves together (more on this later)\nreturn merge(array, left, right)\n</pre></div>\n\n\n<p>Again, if you are not comfortable with recursion, it might take a few reads to wrap your head around the concept. In the above code, the first time merge_sort returns a value to left and right (when the base case is finally triggered), it will be either an empty list or a list with one element in it. Recalling insight number one, we know we have two sorted lists! Recalling insight number two, two sorted lists can be merged into one sorted list in linear time, so we simply need to write a function to merge two sorted lists of any size. We’re nearly done!\nLet’s look at the merge function line by line:</p>\n<div class="codehilite"><pre><span></span>def merge(array, left, right):\n    #index pointers for array, left, and right\n    m = l = r = 0\n    while l &lt; len(left) and r &lt; len(right):\n        if left[l] &lt;= right[r]:\n            array[m] = left[l]\n            l += 1\n        else:\n            array[m] = right[r]\n            r += 1\n        m += 1\n</pre></div>\n\n\n<p>The merge function takes the original list (unsorted) and its two sorted halves: the left list and the right list. Here we are reusing the original list to create a sorted list, but you could also create a new list altogether and add your arrays to that.\nThe basic idea is to compare elements from the left list to elements of the right list, copying the smaller of the two values onto the original array, incrementing index pointers as you move along. You’ll notice these steps take place in a while loop that checks that the left and right index are both within the bounds of their respective lists. This means that when the first while loop executes, one list will have some elements left over. This intuitively makes sense — while comparing elements from the left and right lists, one list (left or right) is going to have more smaller values and will run out of elements first, killing the while loop. Since we have a list with some leftover, sorted elements, the next step is simply to add the remainder to the final sorted list and return it.</p>\n<div class="codehilite"><pre><span></span>while l &lt; len(left):\n    array[m] = left[l]\n    l += 1\n    m += 1\nwhile r &lt; len(right):\n    array[m] = right[r]\n    r += 1\n    m += 1\nreturn array\n</pre></div>\n\n\n<p>That’s all there is to the merge sort! The left and right list that emerge from recursion will be sorted, and your algorithm will happily merge these increasingly large sorted lists until you are a left with your initial array, sorted.</p>\n<div class="codehilite"><pre><span></span>#left and right will always be sorted\nleft = merge_sort(left)\nright = merge_sort(right)\nreturn merge(array, left, right)\n</pre></div>\n\n\n<h2>Time Complexity</h2>\n<p>Finally, what is the time complexity of this algorithm? The goal of the recursive function was to reduce the size of the input list recursively until we reached a list of size one or smaller. This should ring a bell! Cutting an input’s size in half during each recursive iteration is a O(log n) operation. That is, it will take log(n) recursive calls until the base case is reached.\nThe other half of our merge sort algorithm is combining the two sorted lists into one list. Taking a look at the merge function, you are basically just comparing elements and sticking them in the final list one at a time. As the number of elements in each list grows, the number of comparisons grows at the same rate as the size of the list. That is, two lists of size 5 would need 5 comparisons for each merge, two lists of size 100 would require 100 comparisons and so on. This is very clearly a linear function, or O(n).\nPutting it together, the merge sort algorithm performs an O(n) merge O(log n) times, which is expressed as an O(n*log(n)) algorithm. That’s very speedy compared to traditional O(n2) algorithms!</p>\n<p>That concludes our basic introduction to merge sort. Other considerations I’d encourage as an exercise for the reader are memory as a function of n and whether the sort is “stable,” and so on.\nWhat is important to take away is that there is no sorting algorithm on earth that beats O(nlog(n)). All the best sorting algorithms reach this same value. The reason there are so many different sorting algorithms lies in the details—choosing one over another often depends on the nature of the data you are sorting and other considerations. In the vast majority of cases, the built-in sort method will perform far better than any sorting implementation you write, but now you know the cost for each call is at least O(nlog(n)). Happy sorting!</p>	algorithm-fundamentals-merge-sort	187
5	2017-07-14 03:59:37.736562+00	2017-07-18 17:45:31.480243+00	My Favorite Tools	# Languages I Love #\r\n**Python**\r\n\r\n> I dont know how, but one day Python will save the world.\r\n\r\n\r\nPython is the first language I learned and is still my go-to language.  To me the best features of Python are:\r\n\r\n - **The Standard Library**: The standard lib modules are battle tested and well documented, and it's amazing how much you can build only using the built in libraries.  \r\n - **Interpreter**: I cant count the number of times I fixed a bug / solved a hard problem by messing around with the objects in question in the interpreter.  The instant feedback makes it easy for debugging as well as learning new libraries, it's hard to oversell this feature :) \r\n - **Syntax**: A lot of programmers scoff at this, but I truly believe Python's clean syntax is a huge advantage for development! Python's syntax lends itself to beautiful expression of complex ideas, which leads to a reduction in cognitive overhead when reading new code. \r\n - **Community**:  The Python community is special.  I attended PyCon 2017 and was blown away by the strength and diversity of the Python community.  Interested in DevOps? There is a package for that.  Want to get into NLTK or machine learning? There is a package for that.  Web Development? You get the idea.\r\n\r\n**Golang**\r\n\r\nIn my opinion Golang pairs quite nicely with Python.  I turn to Go when I dont think Python can effectively do the job.  These problems generally fall into one of two categories:\r\n\r\n - **Stupidly parallel problems**: As many Pythonistas know, the GIL forces all Python threads to execute serially, meaning that even though a Python process can spin up threads, they cannot execute in parallel.  In practice this often doesn't matter, but when you have a CPU bound operation and could save hours or days by spreading the work across CPU cores, with Python you are mostly out of luck (there is the multi-processing library, but in practice I have found it to be very limiting / more trouble than it's worth).  Go on the other hand was built to excel at concurrency, so it is an obvious choice for this class of problems.\r\n - **Speed of execution:** The other time I choose Golang is when I need to achieve faster code execution. Golang will never beat C / C++ (Golang is roughly comparable to Java), but its execution times are still an order of magnitude faster than Python, and you dont have to worry about memory management / other development hurdles presented by C/C++.\r\n\r\nOther nice things about Go:\r\n\r\n - **Simple Standard Syntax**: Though not as beautiful as Python, Golang benefits greatly from its small vocabulary. This makes reading a new code base much more straight forward, and paired with the standard go-format tools, Golang somehow looks the same no matter who wrote the code! If you have read Python code bases that abuse object dunder methods or metaclasses, you know exactly what Im talking about. \r\n - **Binaries are awesome**: Deploying a Python application is actually a huge pain, installing the right Python environment never goes right on the first try, and if you have a web app that isnt a toy you'll need a WSGI server too (docker has made this easier, but it is not an insignificant learning curve).  Go on the other hand is a breeze.  Simply go build <your app.go> and you have a binary that will run just fine! \r\n\r\n# Text Editor #\r\n\r\nVim. I prefer bare bones text editing with fast key bindings, and Vim runs on virtually every Unix distro so it is easy to be productive on any machine. And NEVER having to wait minutes for your IDE to perform some background process is a huge win for impatient people like myself ;P \r\n\r\n# My Lean Clean Machine #\r\n\r\nI develop mostly on an old Macbook Air connected to a home Linux/GNU server, \r\naka the borg-3:\r\n\r\n![the borg-3][1]\r\n## OS\r\n    [$] > cat /etc/lsb-release\r\n\r\n    DISTRIB_ID=Ubuntu\r\n    DISTRIB_RELEASE=16.04\r\n    DISTRIB_CODENAME=xenial\r\n    DISTRIB_DESCRIPTION="Ubuntu 16.04.2 LTS"\r\n\r\n## CPU\r\n\r\n      Hardware Class: cpu\r\n      Arch: X86-64\r\n      Vendor: "GenuineIntel"\r\n      Model: 6.60.3 "Intel(R) Core(TM) i5-4440 CPU @ 3.10GHz"\r\n      Clock: 3219 MHz\r\n      BogoMips: 6196.33\r\n      Cache: 6144 kb\r\n      Units/Processor: 16\r\n## Memory\r\n\r\n     *-bank:0\r\n              description: DIMM DDR3 Synchronous 1600 MHz (0.6 ns)\r\n              product: F3-12800CL10-8GBXL\r\n              vendor: Fujitsu\r\n              physical id: 0\r\n              serial: 00000000\r\n              slot: ChannelA-DIMM1\r\n              size: 8GiB\r\n              width: 64 bits\r\n              clock: 1600MHz (0.6ns)\r\n     *-bank:2\r\n              description: DIMM DDR3 Synchronous 1600 MHz (0.6 ns)\r\n              product: F3-12800CL10-8GBXL\r\n              vendor: Fujitsu\r\n              physical id: 2\r\n              serial: 00000000\r\n              slot: ChannelB-DIMM1\r\n              size: 8GiB\r\n              width: 64 bits\r\n              clock: 1600MHz (0.6ns)\r\n\r\n## Disk\r\n\r\n    *-disk\r\n           description: ATA Disk\r\n           product: INTEL SSDSC2BW12\r\n           logical name: /dev/sda\r\n           version: DC32\r\n           size: 111GiB (120GB)\r\n      *-disk\r\n           description: ATA Disk\r\n           product: KINGSTON SUV300S\r\n           logical name: /dev/sdb\r\n           version: 12.G\r\n           size: 223GiB (240GB)\r\n      *-disk\r\n           description: ATA Disk\r\n           product: WDC WD10EZEX-60M\r\n           vendor: Western Digital\r\n           logical name: /dev/sdc\r\n           version: 1A01\r\n           size: 931GiB (1TB)\r\n\r\n\r\n\r\n\r\n\r\n## My Favorite Giants to Stand On ##\r\n\r\n    PostgreSQL \r\n    Redis\r\n    Django \r\n    Docker\r\n\r\n\r\n  [1]: http://www.johnshiver.org/images/blog/pc_tower.jpg	<h1>Languages I Love</h1>\n<p><strong>Python</strong></p>\n<blockquote>\n<p>I dont know how, but one day Python will save the world.</p>\n</blockquote>\n<p>Python is the first language I learned and is still my go-to language.  To me the best features of Python are:</p>\n<ul>\n<li><strong>The Standard Library</strong>: The standard lib modules are battle tested and well documented, and it's amazing how much you can build only using the built in libraries.  </li>\n<li><strong>Interpreter</strong>: I cant count the number of times I fixed a bug / solved a hard problem by messing around with the objects in question in the interpreter.  The instant feedback makes it easy for debugging as well as learning new libraries, it's hard to oversell this feature :) </li>\n<li><strong>Syntax</strong>: A lot of programmers scoff at this, but I truly believe Python's clean syntax is a huge advantage for development! Python's syntax lends itself to beautiful expression of complex ideas, which leads to a reduction in cognitive overhead when reading new code. </li>\n<li><strong>Community</strong>:  The Python community is special.  I attended PyCon 2017 and was blown away by the strength and diversity of the Python community.  Interested in DevOps? There is a package for that.  Want to get into NLTK or machine learning? There is a package for that.  Web Development? You get the idea.</li>\n</ul>\n<p><strong>Golang</strong></p>\n<p>In my opinion Golang pairs quite nicely with Python.  I turn to Go when I dont think Python can effectively do the job.  These problems generally fall into one of two categories:</p>\n<ul>\n<li><strong>Stupidly parallel problems</strong>: As many Pythonistas know, the GIL forces all Python threads to execute serially, meaning that even though a Python process can spin up threads, they cannot execute in parallel.  In practice this often doesn't matter, but when you have a CPU bound operation and could save hours or days by spreading the work across CPU cores, with Python you are mostly out of luck (there is the multi-processing library, but in practice I have found it to be very limiting / more trouble than it's worth).  Go on the other hand was built to excel at concurrency, so it is an obvious choice for this class of problems.</li>\n<li><strong>Speed of execution:</strong> The other time I choose Golang is when I need to achieve faster code execution. Golang will never beat C / C++ (Golang is roughly comparable to Java), but its execution times are still an order of magnitude faster than Python, and you dont have to worry about memory management / other development hurdles presented by C/C++.</li>\n</ul>\n<p>Other nice things about Go:</p>\n<ul>\n<li><strong>Simple Standard Syntax</strong>: Though not as beautiful as Python, Golang benefits greatly from its small vocabulary. This makes reading a new code base much more straight forward, and paired with the standard go-format tools, Golang somehow looks the same no matter who wrote the code! If you have read Python code bases that abuse object dunder methods or metaclasses, you know exactly what Im talking about. </li>\n<li><strong>Binaries are awesome</strong>: Deploying a Python application is actually a huge pain, installing the right Python environment never goes right on the first try, and if you have a web app that isnt a toy you'll need a WSGI server too (docker has made this easier, but it is not an insignificant learning curve).  Go on the other hand is a breeze.  Simply go build <your app.go> and you have a binary that will run just fine! </li>\n</ul>\n<h1>Text Editor</h1>\n<p>Vim. I prefer bare bones text editing with fast key bindings, and Vim runs on virtually every Unix distro so it is easy to be productive on any machine. And NEVER having to wait minutes for your IDE to perform some background process is a huge win for impatient people like myself ;P </p>\n<h1>My Lean Clean Machine</h1>\n<p>I develop mostly on an old Macbook Air connected to a home Linux/GNU server, \naka the borg-3:</p>\n<p><img alt="the borg-3" src="http://www.johnshiver.org/images/blog/pc_tower.jpg" /></p>\n<h2>OS</h2>\n<div class="codehilite"><pre><span></span>[$] &gt; cat /etc/lsb-release\n\nDISTRIB_ID=Ubuntu\nDISTRIB_RELEASE=16.04\nDISTRIB_CODENAME=xenial\nDISTRIB_DESCRIPTION=&quot;Ubuntu 16.04.2 LTS&quot;\n</pre></div>\n\n\n<h2>CPU</h2>\n<div class="codehilite"><pre><span></span>  Hardware Class: cpu\n  Arch: X86-64\n  Vendor: &quot;GenuineIntel&quot;\n  Model: 6.60.3 &quot;Intel(R) Core(TM) i5-4440 CPU @ 3.10GHz&quot;\n  Clock: 3219 MHz\n  BogoMips: 6196.33\n  Cache: 6144 kb\n  Units/Processor: 16\n</pre></div>\n\n\n<h2>Memory</h2>\n<div class="codehilite"><pre><span></span> *-bank:0\n          description: DIMM DDR3 Synchronous 1600 MHz (0.6 ns)\n          product: F3-12800CL10-8GBXL\n          vendor: Fujitsu\n          physical id: 0\n          serial: 00000000\n          slot: ChannelA-DIMM1\n          size: 8GiB\n          width: 64 bits\n          clock: 1600MHz (0.6ns)\n *-bank:2\n          description: DIMM DDR3 Synchronous 1600 MHz (0.6 ns)\n          product: F3-12800CL10-8GBXL\n          vendor: Fujitsu\n          physical id: 2\n          serial: 00000000\n          slot: ChannelB-DIMM1\n          size: 8GiB\n          width: 64 bits\n          clock: 1600MHz (0.6ns)\n</pre></div>\n\n\n<h2>Disk</h2>\n<div class="codehilite"><pre><span></span>*-disk\n       description: ATA Disk\n       product: INTEL SSDSC2BW12\n       logical name: /dev/sda\n       version: DC32\n       size: 111GiB (120GB)\n  *-disk\n       description: ATA Disk\n       product: KINGSTON SUV300S\n       logical name: /dev/sdb\n       version: 12.G\n       size: 223GiB (240GB)\n  *-disk\n       description: ATA Disk\n       product: WDC WD10EZEX-60M\n       vendor: Western Digital\n       logical name: /dev/sdc\n       version: 1A01\n       size: 931GiB (1TB)\n</pre></div>\n\n\n<h2>My Favorite Giants to Stand On</h2>\n<div class="codehilite"><pre><span></span>PostgreSQL \nRedis\nDjango \nDocker\n</pre></div>	my-favorite-tools	26
1	2017-01-04 04:20:25.659991+00	2017-07-17 16:44:36.923694+00	Implementing a Singly Linked List in Python	A lot of self-taught programmers don’t realize the importance of these concepts until they already have an interview lined up, and by then it’s already too late! I was fortunate enough to attend the Code Fellows Python Development Accelerator, where a section of the curriculum was dedicated to basic data structures and algorithms. But eight whirlwind weeks were not enough to solidify these concepts, so I thought it’d be beneficial, both for my own edification and for other budding Pythonistas, to write a series on basic data structures, starting with the linked list.\r\n\r\nIn its most basic form, a linked list is a string of nodes, sort of like a string of pearls, with each node containing both data and a reference to the next node in the list (Note: This is a singly linked list. The nodes in a doubly linked list will contain references to both the next node and the previous node). The main advantage of using a linked list over a similar data structure, like the static array, is the linked list’s dynamic memory allocation: if you don’t know the amount of data you want to store before hand, the linked list can adjust on the fly.* Of course this advantage comes at a price: dynamic memory allocation requires more space and commands slower look up times.\r\n\r\n*In practice this means certain insertions are more expensive. For example, if the list initially allocates enough space for eight nodes, on the ninth insertion the list will have to double its allocated space to 16 and copy over the original 8 nodes, a more expensive operation than a normal insertion.\r\n\r\n##The Node\r\n\r\nThe node is where data is stored in the linked list (they remind me of those plastic Easter eggs that hold treats). Along with the data each node also holds a pointer, which is a reference to the next node in the list. Below is a simple implementation.\r\n\r\n    class Node(object):\r\n    \r\n        def __init__(self, data=None, next_node=None):\r\n            self.data = data\r\n            self.next_node = next_node\r\n    \r\n        def get_data(self):\r\n            return self.data\r\n    \r\n        def get_next(self):\r\n            return self.next_node\r\n    \r\n        def set_next(self, new_next):\r\n            self.next_node = new_next\r\n\r\nThe node initializes with a single datum and its pointer is set to None by default (this is because the first node inserted into the list will have nothing to point at!). We also add a few convenience methods: one that returns the stored data, another that returns the next node (the node to which the object node points), and finally a method to reset the pointer to a new node. These will come in handy when we implement the Linked List.\r\n\r\n##The Linked List\r\n\r\nMy simple implementation of a linked list includes the following methods:\r\n\r\n    Insert: inserts a new node into the list\r\n    Size: returns size of list\r\n    Search: search list for node throw error if none exists\r\n    Delete: search list for node and, if exists, remove it \r\n\r\n##The Head of the List\r\n\r\nThe first architectural piece of the linked list is the ‘head node’, which is simply the top node in the list. When the list is first initialized it has no nodes, so the head is set to None. (Note: the linked list doesn’t necessarily require a node to initialize. The head argument will default to None if a node is not provided.)\r\n\r\n    class LinkedList(object):\r\n        def __init__(self, head=None):\r\n            self.head = head\r\n\r\n##Insert\r\n\r\nThis insert method takes data, initializes a new node with the given data, and adds it to the list. Technically you can insert a node anywhere in the list, but the simplest way to do it is to place it at the head of the list and point the new node at the old head (sort of pushing the other nodes down the line).\r\n\r\nAs for time complexity, this implementation of insert is constant O(1) (efficient!). This is because the insert method, no matter what, will always take the same amount of time: it can only take one data point, it can only ever create one node, and the new node doesn’t need to interact with all the other nodes in the list, the inserted node will only ever interact with the head.\r\n\r\n   def insert(self, data):\r\n        new_node = Node(data)\r\n        new_node.set_next(self.head)\r\n       self.head = new_node\r\n\r\n##Size\r\n\r\nThe size method is very simple, it basically counts nodes until it can’t find any more, and returns how many nodes it found. The method starts at the head node, travels down the line of nodes until it reaches the end (the current will be None when it reaches the end) while keeping track of how many nodes it has seen.\r\n\r\nThe time complexity of size is O(n) because each time the method is called it will always visit every node in the list but only interact with them once, so n * 1 operations.\r\n\r\n    def size(self):\r\n        current = self.head\r\n        count = 0\r\n        while current:\r\n            count += 1\r\n            current = current.get_next()\r\n        return count\r\n\r\n##Search\r\n\r\nSearch is actually very similar to size, but instead of traversing the whole list of nodes it checks at each stop to see whether the current node has the requested data and if so, returns the node holding that data. If the method goes through the entire list but still hasn’t found the data, it raises a value error and notifies the user that the data is not in the list.\r\n\r\nThe time complexity of search is O(n) in the worst case (you often hear about best case / average case / worst case for Big O analysis. For this purpose of this blog post, we’ll assume worst case is the one we care about it, because it often is!)\r\n\r\n    def search(self, data):\r\n        current = self.head\r\n        found = False\r\n        while current and found is False:\r\n            if current.get_data() == data:\r\n                found = True\r\n            else:\r\n                current = current.get_next()\r\n        if current is None:\r\n            raise ValueError("Data not in list")\r\n\r\n        return current\r\n\r\n##Delete\r\n\r\nYou’ll be happy to know that delete is very similar to search! The delete method traverses the list in the same way that search does, but in addition to keeping track of the current node, the delete method also remembers the last node it visited. When delete finally arrives at the node it wants to delete, it simply removes that node from the chain by “leap frogging” it. By this I mean that when the delete method reaches the node it wants to delete, it looks at the last node it visited (the ‘previous’ node), and resets that previous node’s pointer so that, rather than pointing to the soon-to-be-deleted node, it will point to the next node in line. Since no nodes are pointing to the poor node that is being deleted, it is effectively removed from the list!\r\n\r\nThe time complexity for delete is also O(n), because in the worst case it will visit every node, interacting with each node a fixed number of times.\r\n\r\n    def delete(self, data):\r\n        current = self.head\r\n        previous = None\r\n        found = False\r\n        while current and found is False:\r\n            if current.get_data() == data:\r\n                found = True\r\n            else:\r\n                previous = current\r\n                current = current.get_next()\r\n        if current is None:\r\n            raise ValueError("Data not in list")\r\n        if previous is None:\r\n            self.head = current.get_next()\r\n        else:\r\n            previous.set_next(current.get_next())\r\n\r\nThat wraps up the linked list implementation! If I made a mistake please shoot me an email. At the bottom I’ve provided a link to the source code and have also added a test suite that tests all the functionality described in this blog post. Happy coding!	<p>A lot of self-taught programmers don’t realize the importance of these concepts until they already have an interview lined up, and by then it’s already too late! I was fortunate enough to attend the Code Fellows Python Development Accelerator, where a section of the curriculum was dedicated to basic data structures and algorithms. But eight whirlwind weeks were not enough to solidify these concepts, so I thought it’d be beneficial, both for my own edification and for other budding Pythonistas, to write a series on basic data structures, starting with the linked list.</p>\n<p>In its most basic form, a linked list is a string of nodes, sort of like a string of pearls, with each node containing both data and a reference to the next node in the list (Note: This is a singly linked list. The nodes in a doubly linked list will contain references to both the next node and the previous node). The main advantage of using a linked list over a similar data structure, like the static array, is the linked list’s dynamic memory allocation: if you don’t know the amount of data you want to store before hand, the linked list can adjust on the fly.* Of course this advantage comes at a price: dynamic memory allocation requires more space and commands slower look up times.</p>\n<p>*In practice this means certain insertions are more expensive. For example, if the list initially allocates enough space for eight nodes, on the ninth insertion the list will have to double its allocated space to 16 and copy over the original 8 nodes, a more expensive operation than a normal insertion.</p>\n<h2>The Node</h2>\n<p>The node is where data is stored in the linked list (they remind me of those plastic Easter eggs that hold treats). Along with the data each node also holds a pointer, which is a reference to the next node in the list. Below is a simple implementation.</p>\n<div class="codehilite"><pre><span></span><span class="k">class</span> <span class="n">Node</span>(<span class="n">object</span>):\n\n    <span class="n">def</span> <span class="n">__init__</span>(<span class="k">self</span>, <span class="n">data</span>=<span class="n">None</span>, <span class="n">next_node</span>=<span class="n">None</span>):\n        <span class="k">self</span>.<span class="n">data</span> = <span class="n">data</span>\n        <span class="k">self</span>.<span class="n">next_node</span> = <span class="n">next_node</span>\n\n    <span class="n">def</span> <span class="n">get_data</span>(<span class="k">self</span>):\n        <span class="k">return</span> <span class="k">self</span>.<span class="n">data</span>\n\n    <span class="n">def</span> <span class="n">get_next</span>(<span class="k">self</span>):\n        <span class="k">return</span> <span class="k">self</span>.<span class="n">next_node</span>\n\n    <span class="n">def</span> <span class="n">set_next</span>(<span class="k">self</span>, <span class="n">new_next</span>):\n        <span class="k">self</span>.<span class="n">next_node</span> = <span class="n">new_next</span>\n</pre></div>\n\n\n<p>The node initializes with a single datum and its pointer is set to None by default (this is because the first node inserted into the list will have nothing to point at!). We also add a few convenience methods: one that returns the stored data, another that returns the next node (the node to which the object node points), and finally a method to reset the pointer to a new node. These will come in handy when we implement the Linked List.</p>\n<h2>The Linked List</h2>\n<p>My simple implementation of a linked list includes the following methods:</p>\n<div class="codehilite"><pre><span></span><span class="n">Insert</span><span class="o">:</span> <span class="n">inserts</span> <span class="n">a</span> <span class="k">new</span> <span class="n">node</span> <span class="n">into</span> <span class="n">the</span> <span class="n">list</span>\n<span class="n">Size</span><span class="o">:</span> <span class="n">returns</span> <span class="n">size</span> <span class="n">of</span> <span class="n">list</span>\n<span class="n">Search</span><span class="o">:</span> <span class="n">search</span> <span class="n">list</span> <span class="k">for</span> <span class="n">node</span> <span class="k">throw</span> <span class="n">error</span> <span class="k">if</span> <span class="n">none</span> <span class="n">exists</span>\n<span class="n">Delete</span><span class="o">:</span> <span class="n">search</span> <span class="n">list</span> <span class="k">for</span> <span class="n">node</span> <span class="n">and</span><span class="o">,</span> <span class="k">if</span> <span class="n">exists</span><span class="o">,</span> <span class="n">remove</span> <span class="n">it</span>\n</pre></div>\n\n\n<h2>The Head of the List</h2>\n<p>The first architectural piece of the linked list is the ‘head node’, which is simply the top node in the list. When the list is first initialized it has no nodes, so the head is set to None. (Note: the linked list doesn’t necessarily require a node to initialize. The head argument will default to None if a node is not provided.)</p>\n<div class="codehilite"><pre><span></span><span class="k">class</span> <span class="n">LinkedList</span>(<span class="n">object</span>):\n    <span class="n">def</span> <span class="n">__init__</span>(<span class="k">self</span>, <span class="n">head</span>=<span class="n">None</span>):\n        <span class="k">self</span>.<span class="n">head</span> = <span class="n">head</span>\n</pre></div>\n\n\n<h2>Insert</h2>\n<p>This insert method takes data, initializes a new node with the given data, and adds it to the list. Technically you can insert a node anywhere in the list, but the simplest way to do it is to place it at the head of the list and point the new node at the old head (sort of pushing the other nodes down the line).</p>\n<p>As for time complexity, this implementation of insert is constant O(1) (efficient!). This is because the insert method, no matter what, will always take the same amount of time: it can only take one data point, it can only ever create one node, and the new node doesn’t need to interact with all the other nodes in the list, the inserted node will only ever interact with the head.</p>\n<p>def insert(self, data):\n        new_node = Node(data)\n        new_node.set_next(self.head)\n       self.head = new_node</p>\n<h2>Size</h2>\n<p>The size method is very simple, it basically counts nodes until it can’t find any more, and returns how many nodes it found. The method starts at the head node, travels down the line of nodes until it reaches the end (the current will be None when it reaches the end) while keeping track of how many nodes it has seen.</p>\n<p>The time complexity of size is O(n) because each time the method is called it will always visit every node in the list but only interact with them once, so n * 1 operations.</p>\n<div class="codehilite"><pre><span></span>def size(self):\n    current = self.head\n    count = 0\n    while current:\n        count += 1\n        current = current.get_next()\n    return count\n</pre></div>\n\n\n<h2>Search</h2>\n<p>Search is actually very similar to size, but instead of traversing the whole list of nodes it checks at each stop to see whether the current node has the requested data and if so, returns the node holding that data. If the method goes through the entire list but still hasn’t found the data, it raises a value error and notifies the user that the data is not in the list.</p>\n<p>The time complexity of search is O(n) in the worst case (you often hear about best case / average case / worst case for Big O analysis. For this purpose of this blog post, we’ll assume worst case is the one we care about it, because it often is!)</p>\n<div class="codehilite"><pre><span></span>def search(self, data):\n    current = self.head\n    found = False\n    while current and found is False:\n        if current.get_data() == data:\n            found = True\n        else:\n            current = current.get_next()\n    if current is None:\n        raise ValueError(&quot;Data not in list&quot;)\n\n    return current\n</pre></div>\n\n\n<h2>Delete</h2>\n<p>You’ll be happy to know that delete is very similar to search! The delete method traverses the list in the same way that search does, but in addition to keeping track of the current node, the delete method also remembers the last node it visited. When delete finally arrives at the node it wants to delete, it simply removes that node from the chain by “leap frogging” it. By this I mean that when the delete method reaches the node it wants to delete, it looks at the last node it visited (the ‘previous’ node), and resets that previous node’s pointer so that, rather than pointing to the soon-to-be-deleted node, it will point to the next node in line. Since no nodes are pointing to the poor node that is being deleted, it is effectively removed from the list!</p>\n<p>The time complexity for delete is also O(n), because in the worst case it will visit every node, interacting with each node a fixed number of times.</p>\n<div class="codehilite"><pre><span></span>def delete(self, data):\n    current = self.head\n    previous = None\n    found = False\n    while current and found is False:\n        if current.get_data() == data:\n            found = True\n        else:\n            previous = current\n            current = current.get_next()\n    if current is None:\n        raise ValueError(&quot;Data not in list&quot;)\n    if previous is None:\n        self.head = current.get_next()\n    else:\n        previous.set_next(current.get_next())\n</pre></div>\n\n\n<p>That wraps up the linked list implementation! If I made a mistake please shoot me an email. At the bottom I’ve provided a link to the source code and have also added a test suite that tests all the functionality described in this blog post. Happy coding!</p>	implementing-a-singly-linked-list-in-python	273
6	2017-07-18 01:58:50.712894+00	2017-07-18 01:58:50.719617+00	My Favorite Technical Books	(roughly in order read) \r\n\r\n 1. Introduction to Computation and Programming Using Python \r\n 2. Learning SQL\r\n 3. Algorithm Design Manual \r\n 4. Fluent Python \r\n 5. Effective Python\r\n 6. Python in Practice \r\n 7.  High-Performance Django \r\n 8. How Linux Works \r\n 9. Go Web Programming\r\n 10. Concurrency in Go	<p>(roughly in order read) </p>\n<ol>\n<li>Introduction to Computation and Programming Using Python </li>\n<li>Learning SQL</li>\n<li>Algorithm Design Manual </li>\n<li>Fluent Python </li>\n<li>Effective Python</li>\n<li>Python in Practice </li>\n<li>High-Performance Django </li>\n<li>How Linux Works </li>\n<li>Go Web Programming</li>\n<li>Concurrency in Go</li>\n</ol>	my-favorite-technical-books	0
2	2017-01-26 23:53:22.648438+00	2017-07-18 04:49:28.528484+00	Cracking the Coding Boot Camp: How to succeed after the hurricane	Now that I’ve been in the tech industry for a few years since completing the Code Fellows program, I’m often asked for advice by others who want to take a similar path. Many people said my ideas were helpful, so I wanted to share them with a wider audience.\r\n\r\nThis article specifically covers looking for a job after completing an advanced-level bootcamp.\r\n\r\n##A Bit About Me##\r\n\r\nBefore starting Code Fellows’ Python course, I had no prior professional coding experience, but had taken a few Python classes online where I built some basic web apps. I moved to Seattle from Philadelphia just a day before the class was set to begin, so I came in without any knowledge of the Seattle job market. A lot of successful alumni I know have a similar story, so I can say with confidence that if you made it through a bootcamp, and you’re willing to put in a similar amount of time and effort afterwards, you’ll find success in this tech market.\r\n\r\n##Arrange Your Priorities##\r\n\r\nOnce you’ve finished the bootcamp, it’s time to start looking for a job. But you may feel uncomfortable putting Software Developer at the top of your resume (note: you shouldn’t). Not only did you just learn an ocean of information, but now you have some solid projects on your GitHub and know the latest technology and best practices of your stack.\r\n\r\nTo successfully land a job, there are many tasks ahead:\r\n\r\nThe dreaded technical interview\r\nMastering the skills you just learned in class\r\nShoring up your fledgling professional network\r\nContinuing to learn and grow as a software developer\r\nThe number of must-do priorities can quickly feel overwhelming. The most important thing is to make sure you are making progress every day in at least one of these areas. The worst thing you can do is to try everything at once, but accomplish nothing. With that said, I found it helpful to limit myself to three areas of focus. Here are the three tasks I focused on and how I prioritized them:\r\n\r\n1. Figure out what kind of job you want and practice the skills you need to get it.\r\n\r\nIn my experience, this is the most important thing to get right. Consider the type of job your education prepared you for, and at minimum be fluent in the skills that job requires. This sounds simple, but I’ve seen a ton of people miss it!\r\n\r\nFor me, the Python course at Code Fellows aimed at fluency in the art of building web applications with Python. The curriculum included other subjects, like machine learning and data science, but I found companies were much more keen to hire junior developers with web app skills, so that is where I put my focus.\r\n\r\nHow do you become fluent? A portfolio filled with web apps written from scratch is a must, and you should feel comfortable explaining how each line of code works. Now that I administer tech interviews, one of my biggest pet peeves is an engineer who can’t explain their code. You probably made a few apps during your bootcamp, and that’s a great start. Consider spending a week honing your skills by writing a new app from scratch. If you’re switching careers like I did, keep in mind that when a hiring manager looks at your resume, they’re looking for a solid junior engineer who can grow. It doesn’t matter if your portfolio apps are new or unique. What matters is your execution and your understanding of the code and the architecture.\r\n\r\nAlso important: use coding best practices, even if they slow you down. Take the time to work through new concepts until you understand them completely. In an interview, being able to explain a handful of very technical topics is much better than half knowing everything. Keep your GitHub up to date and, if possible, keep your projects deployed, functioning, and publicly accessible. Heroku is fine, but if you have an interest in DevOps, try to understand how to deploy a web app using tools like Ansible, Docker, or another tool you want to learn.\r\n\r\n2. Improve your whiteboard skills.\r\n\r\nThis is probably the thing that stresses bootcamp grads out the most. I hadn’t seen algorithms or data structures at all before Code Fellows, and I hardly felt confident in those skills afterwards (and my teachers were fantastic—it’s simply hard stuff!). Some people spend their entire career focusing on algorithms, but as a recent grad, your priority is getting up to speed fast.\r\n\r\nI found that you should spend, at minimum, one hour per day working through whiteboard problems. Since it generally takes at least a few weeks to get your first interview, those hours will add up. A good way to practice is to choose an online code judge that offers hundreds of problems, and work through a couple each day.\r\n\r\nI recommend Codewars (free) and LeetCode (paid), both of which have great communities. Completing a few hundred of these practice problems made me a much better coder, and you’ll get even better after reading through other user solutions (I still learn something new every time I sign on).\r\n\r\nIn addition to using an online judge, you should pick up a copy of Cracking the Coding Interview and at least familiarize yourself with most of the chapters. Everyone in the tech world knows this book, and a lot of interview questions either come from it directly or are variations of the questions inside. The book’s examples are in Java, but the author maintains a GitHub repo with implementations in many languages.\r\n\r\nOnce you have secured an interview, prioritize whiteboarding for a few days (and I mean physically writing solutions on a whiteboard). If possible, getting help from a practice partner or mock interviewer is even better! Your bootcamp may offer this as a service to alumni, but there are also online mock interviewers you can try.\r\n\r\nIf you really can’t fit whiteboarding in, at minimum make sure you understand the commonly used data structures in your language of choice—specifically, when to use one data structure over another and the Big(O) space and time consequences of those decisions.\r\n\r\n3. Expand your professional network.\r\n\r\nFinally, you need to actively expand and maintain your professional network. I’d recommend spending 2-3 hours on this per day. Here are a few strategies I employed:\r\n\r\nAttend hackathons. I found this to be incredibly useful. As someone who fails at meetups, hackathons were a much more effective networking tool. Why? Because you closely work with a small team for two days. After that, your network will suddenly gain three to four people who can directly vouch for your skills. And you may even make a few friends!\r\nCheck out the monthly Hacker News hiring thread. You’ll see the exact skills companies are looking for, and I found that directly emailing people in the thread yielded a reply more often than not.\r\nCold message people on LinkedIn. This may feel uncomfortable at first, but this is how I got the lead for my first job. LinkedIn has a paid option that lets you message a finite number of out-of-network members each month. Take advantage of this! Search for the job you want and you’ll likely find a few recruiters looking for people like you.\r\nKeep up with bootcamp alumni. This is one of the most important things you can do. At my first job at OfferUp, we hired a number of Code Fellows graduates, most of whom were referred by another graduate. This isn’t uncommon at all. I found it helps to continue working at your bootcamp’s space if possible, and organize ways to keep in touch with your fellow alumni.\r\nTalk to recruiters. I was lucky enough to get coffee with a number of great recruiters in Seattle, and their help was invaluable. Even if they don’t have any directly useful leads, it is a recruiter’s job to have a great network, so they can likely point you to a senior engineer in your field, or other professional contacts who can expand your network. I found that people generally want to help junior engineers, and it never hurts to ask.\r\n\r\n##Final Thoughts##\r\n\r\nThat is how I spent my post-grad time before starting at OfferUp, and these techniques led to a number of interviews before I was hired. And that is what I want to end with: interviewing is a numbers game. No matter how awesome your engineering skills are, there are many factors out of your control. The only thing you can do is trust the process and recognize that you’re getting better. The more you interview, the better you will get at interviewing. If you keep at it, the odds eventually will fall in your favor. :D	<p>Now that I’ve been in the tech industry for a few years since completing the Code Fellows program, I’m often asked for advice by others who want to take a similar path. Many people said my ideas were helpful, so I wanted to share them with a wider audience.</p>\n<p>This article specifically covers looking for a job after completing an advanced-level bootcamp.</p>\n<h2>A Bit About Me</h2>\n<p>Before starting Code Fellows’ Python course, I had no prior professional coding experience, but had taken a few Python classes online where I built some basic web apps. I moved to Seattle from Philadelphia just a day before the class was set to begin, so I came in without any knowledge of the Seattle job market. A lot of successful alumni I know have a similar story, so I can say with confidence that if you made it through a bootcamp, and you’re willing to put in a similar amount of time and effort afterwards, you’ll find success in this tech market.</p>\n<h2>Arrange Your Priorities</h2>\n<p>Once you’ve finished the bootcamp, it’s time to start looking for a job. But you may feel uncomfortable putting Software Developer at the top of your resume (note: you shouldn’t). Not only did you just learn an ocean of information, but now you have some solid projects on your GitHub and know the latest technology and best practices of your stack.</p>\n<p>To successfully land a job, there are many tasks ahead:</p>\n<p>The dreaded technical interview\nMastering the skills you just learned in class\nShoring up your fledgling professional network\nContinuing to learn and grow as a software developer\nThe number of must-do priorities can quickly feel overwhelming. The most important thing is to make sure you are making progress every day in at least one of these areas. The worst thing you can do is to try everything at once, but accomplish nothing. With that said, I found it helpful to limit myself to three areas of focus. Here are the three tasks I focused on and how I prioritized them:</p>\n<ol>\n<li>Figure out what kind of job you want and practice the skills you need to get it.</li>\n</ol>\n<p>In my experience, this is the most important thing to get right. Consider the type of job your education prepared you for, and at minimum be fluent in the skills that job requires. This sounds simple, but I’ve seen a ton of people miss it!</p>\n<p>For me, the Python course at Code Fellows aimed at fluency in the art of building web applications with Python. The curriculum included other subjects, like machine learning and data science, but I found companies were much more keen to hire junior developers with web app skills, so that is where I put my focus.</p>\n<p>How do you become fluent? A portfolio filled with web apps written from scratch is a must, and you should feel comfortable explaining how each line of code works. Now that I administer tech interviews, one of my biggest pet peeves is an engineer who can’t explain their code. You probably made a few apps during your bootcamp, and that’s a great start. Consider spending a week honing your skills by writing a new app from scratch. If you’re switching careers like I did, keep in mind that when a hiring manager looks at your resume, they’re looking for a solid junior engineer who can grow. It doesn’t matter if your portfolio apps are new or unique. What matters is your execution and your understanding of the code and the architecture.</p>\n<p>Also important: use coding best practices, even if they slow you down. Take the time to work through new concepts until you understand them completely. In an interview, being able to explain a handful of very technical topics is much better than half knowing everything. Keep your GitHub up to date and, if possible, keep your projects deployed, functioning, and publicly accessible. Heroku is fine, but if you have an interest in DevOps, try to understand how to deploy a web app using tools like Ansible, Docker, or another tool you want to learn.</p>\n<ol>\n<li>Improve your whiteboard skills.</li>\n</ol>\n<p>This is probably the thing that stresses bootcamp grads out the most. I hadn’t seen algorithms or data structures at all before Code Fellows, and I hardly felt confident in those skills afterwards (and my teachers were fantastic—it’s simply hard stuff!). Some people spend their entire career focusing on algorithms, but as a recent grad, your priority is getting up to speed fast.</p>\n<p>I found that you should spend, at minimum, one hour per day working through whiteboard problems. Since it generally takes at least a few weeks to get your first interview, those hours will add up. A good way to practice is to choose an online code judge that offers hundreds of problems, and work through a couple each day.</p>\n<p>I recommend Codewars (free) and LeetCode (paid), both of which have great communities. Completing a few hundred of these practice problems made me a much better coder, and you’ll get even better after reading through other user solutions (I still learn something new every time I sign on).</p>\n<p>In addition to using an online judge, you should pick up a copy of Cracking the Coding Interview and at least familiarize yourself with most of the chapters. Everyone in the tech world knows this book, and a lot of interview questions either come from it directly or are variations of the questions inside. The book’s examples are in Java, but the author maintains a GitHub repo with implementations in many languages.</p>\n<p>Once you have secured an interview, prioritize whiteboarding for a few days (and I mean physically writing solutions on a whiteboard). If possible, getting help from a practice partner or mock interviewer is even better! Your bootcamp may offer this as a service to alumni, but there are also online mock interviewers you can try.</p>\n<p>If you really can’t fit whiteboarding in, at minimum make sure you understand the commonly used data structures in your language of choice—specifically, when to use one data structure over another and the Big(O) space and time consequences of those decisions.</p>\n<ol>\n<li>Expand your professional network.</li>\n</ol>\n<p>Finally, you need to actively expand and maintain your professional network. I’d recommend spending 2-3 hours on this per day. Here are a few strategies I employed:</p>\n<p>Attend hackathons. I found this to be incredibly useful. As someone who fails at meetups, hackathons were a much more effective networking tool. Why? Because you closely work with a small team for two days. After that, your network will suddenly gain three to four people who can directly vouch for your skills. And you may even make a few friends!\nCheck out the monthly Hacker News hiring thread. You’ll see the exact skills companies are looking for, and I found that directly emailing people in the thread yielded a reply more often than not.\nCold message people on LinkedIn. This may feel uncomfortable at first, but this is how I got the lead for my first job. LinkedIn has a paid option that lets you message a finite number of out-of-network members each month. Take advantage of this! Search for the job you want and you’ll likely find a few recruiters looking for people like you.\nKeep up with bootcamp alumni. This is one of the most important things you can do. At my first job at OfferUp, we hired a number of Code Fellows graduates, most of whom were referred by another graduate. This isn’t uncommon at all. I found it helps to continue working at your bootcamp’s space if possible, and organize ways to keep in touch with your fellow alumni.\nTalk to recruiters. I was lucky enough to get coffee with a number of great recruiters in Seattle, and their help was invaluable. Even if they don’t have any directly useful leads, it is a recruiter’s job to have a great network, so they can likely point you to a senior engineer in your field, or other professional contacts who can expand your network. I found that people generally want to help junior engineers, and it never hurts to ask.</p>\n<h2>Final Thoughts</h2>\n<p>That is how I spent my post-grad time before starting at OfferUp, and these techniques led to a number of interviews before I was hired. And that is what I want to end with: interviewing is a numbers game. No matter how awesome your engineering skills are, there are many factors out of your control. The only thing you can do is trust the process and recognize that you’re getting better. The more you interview, the better you will get at interviewing. If you keep at it, the odds eventually will fall in your favor. :D</p>	cracking-the-coding-boot-camp-how-to-succeed-after-the-hurricane	223
\.


--
-- Name: blog_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: john
--

SELECT pg_catalog.setval('blog_post_id_seq', 6, true);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: john
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2017-01-04 04:20:26.321086+00	1	Post object	1	Added.	7	1
2	2017-01-26 23:53:23.020254+00	2	Post object	1	Added.	7	1
3	2017-01-27 00:34:10.543754+00	2	Post object	2	Changed body.	7	1
4	2017-03-01 19:20:22.618035+00	3	Post object	1	Added.	7	1
5	2017-03-01 19:21:10.846384+00	3	Post object	2	Changed body and views.	7	1
6	2017-03-01 19:21:28.563207+00	3	Post object	3		7	1
7	2017-03-01 19:22:00.665461+00	4	Post object	1	Added.	7	1
8	2017-03-01 19:22:23.097255+00	4	Post object	2	Changed title.	7	1
9	2017-03-01 19:23:14.070254+00	4	Post object	2	Changed title and body.	7	1
10	2017-03-01 23:08:32.783396+00	4	Post object	2	Changed title and body.	7	1
11	2017-07-14 03:37:05.596775+00	2	Post object	2	Changed body.	7	1
12	2017-07-14 03:41:39.38743+00	4	Post object	2	Changed body.	7	1
13	2017-07-14 03:44:07.559292+00	4	Post object	2	No fields changed.	7	1
14	2017-07-14 03:59:37.946572+00	5	Post object	1	Added.	7	1
15	2017-07-17 04:42:13.69842+00	5	Post object	2	Changed body and views.	7	1
16	2017-07-17 04:43:59.770291+00	5	Post object	2	Changed body.	7	1
17	2017-07-17 04:47:04.26455+00	5	Post object	2	Changed body.	7	1
18	2017-07-17 04:48:23.074688+00	5	Post object	2	Changed body.	7	1
19	2017-07-17 04:49:26.813213+00	4	Post object	2	Changed body.	7	1
20	2017-07-17 04:51:15.325088+00	4	Post object	2	Changed body.	7	1
21	2017-07-17 15:58:07.819479+00	5	Post object	2	Changed body.	7	1
22	2017-07-17 16:07:33.265701+00	5	Post object	2	Changed body.	7	1
23	2017-07-17 16:10:08.08487+00	5	Post object	2	Changed body.	7	1
24	2017-07-18 01:58:50.957532+00	6	my-favorite-technical-books	1	Added.	7	1
25	2017-07-18 02:18:08.085974+00	5	my-favorite-tools	2	Changed body.	7	1
26	2017-07-18 02:19:48.519777+00	5	my-favorite-tools	2	Changed body.	7	1
27	2017-07-18 02:35:10.365049+00	5	my-favorite-tools	2	Changed body.	7	1
28	2017-07-18 17:45:20.399926+00	5	my-favorite-tools	2	Changed body.	7	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: john
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 28, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: john
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	auth	permission
2	auth	group
3	auth	user
4	admin	logentry
5	contenttypes	contenttype
6	sessions	session
7	blog	post
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: john
--

SELECT pg_catalog.setval('django_content_type_id_seq', 7, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: john
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2017-01-04 03:38:20.168397+00
2	auth	0001_initial	2017-01-04 03:38:23.777624+00
3	admin	0001_initial	2017-01-04 03:38:25.00335+00
4	admin	0002_logentry_remove_auto_add	2017-01-04 03:38:25.891854+00
5	contenttypes	0002_remove_content_type_name	2017-01-04 03:38:26.841278+00
6	auth	0002_alter_permission_name_max_length	2017-01-04 03:38:27.6257+00
7	auth	0003_alter_user_email_max_length	2017-01-04 03:38:28.414779+00
8	auth	0004_alter_user_username_opts	2017-01-04 03:38:28.871385+00
9	auth	0005_alter_user_last_login_null	2017-01-04 03:38:29.667278+00
10	auth	0006_require_contenttypes_0002	2017-01-04 03:38:30.106135+00
11	auth	0007_alter_validators_add_error_messages	2017-01-04 03:38:30.548427+00
12	blog	0001_initial	2017-01-04 03:38:31.555853+00
13	sessions	0001_initial	2017-01-04 03:38:32.585953+00
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: john
--

SELECT pg_catalog.setval('django_migrations_id_seq', 13, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: john
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
d1022srtk7clgxqp4sq49a4yhkl1du9r	ZDA2NjNkMTUyOTZhZDhkZTE2ZWNhZmQxOWZkMjQzM2QxNGJkY2QxNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzA1ZjI0OTNkOTE5MGRmNzQxZDhjMWJmZjM4M2I3YWU3MmUxODg5NCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-01-18 03:40:21.75191+00
kyk1tgrwa4orutd8zmc0k6o7ia9rp5mx	ZDA2NjNkMTUyOTZhZDhkZTE2ZWNhZmQxOWZkMjQzM2QxNGJkY2QxNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzA1ZjI0OTNkOTE5MGRmNzQxZDhjMWJmZjM4M2I3YWU3MmUxODg5NCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-01-18 04:15:39.100492+00
16i8dds1a9lzg4y7d3gdgrcqcr2rho2t	NmY2MDljMmY5OTU5YmU5NjNmOTU1YWFjMTk3YTUzMjI5NzQ1ZGFlODp7Il9hdXRoX3VzZXJfaGFzaCI6IjMwNWYyNDkzZDkxOTBkZjc0MWQ4YzFiZmYzODNiN2FlNzJlMTg4OTQiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-01-28 17:57:49.634603+00
0bo4fvy6gygh3nm7jml20toop3bkft3v	NmY2MDljMmY5OTU5YmU5NjNmOTU1YWFjMTk3YTUzMjI5NzQ1ZGFlODp7Il9hdXRoX3VzZXJfaGFzaCI6IjMwNWYyNDkzZDkxOTBkZjc0MWQ4YzFiZmYzODNiN2FlNzJlMTg4OTQiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-02-18 16:02:27.415797+00
f166ps9mxtt80pnhvg1v70od34wmjn23	ODIzYjI4MTE2YzRmYzZjODAwOGI2MmQzYjc2NGRiZGM0NDU2NTI1ZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiIzMDVmMjQ5M2Q5MTkwZGY3NDFkOGMxYmZmMzgzYjdhZTcyZTE4ODk0In0=	2017-03-15 19:11:33.187656+00
59gjutldjhhxlfb1yeci6ew6si010t6k	ODIzYjI4MTE2YzRmYzZjODAwOGI2MmQzYjc2NGRiZGM0NDU2NTI1ZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiIzMDVmMjQ5M2Q5MTkwZGY3NDFkOGMxYmZmMzgzYjdhZTcyZTE4ODk0In0=	2017-03-21 03:39:46.945449+00
1hv93dhpikynjkjahsy9n9dgm1v028wz	Y2JjOTczMDc3MzMwMTQzZTM0MGUyMmVlMGY2NDM0ZmYzNmFlYmU2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzA1ZjI0OTNkOTE5MGRmNzQxZDhjMWJmZjM4M2I3YWU3MmUxODg5NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-03-29 03:52:42.175181+00
eksju34err3ob9nxwzrqhemr27cd3zo3	ZDA2NjNkMTUyOTZhZDhkZTE2ZWNhZmQxOWZkMjQzM2QxNGJkY2QxNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzA1ZjI0OTNkOTE5MGRmNzQxZDhjMWJmZjM4M2I3YWU3MmUxODg5NCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-07-28 03:34:41.099019+00
zeewb00iakkur033kuc0loo9upuh5d1k	NjVhMTNmNTg1ZjYyNjkwMTM4NDQ4ZjBkMWNmYzQzNGU2NWE2NDNhMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjMwNWYyNDkzZDkxOTBkZjc0MWQ4YzFiZmYzODNiN2FlNzJlMTg4OTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-07-31 03:44:44.623744+00
ju1kcw5baj7vwn7qz41rbk6wvfv8bbga	NjVhMTNmNTg1ZjYyNjkwMTM4NDQ4ZjBkMWNmYzQzNGU2NWE2NDNhMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjMwNWYyNDkzZDkxOTBkZjc0MWQ4YzFiZmYzODNiN2FlNzJlMTg4OTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-07-31 15:46:45.607732+00
\.


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: john
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: john
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: john
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: john
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: john
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: john
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: john
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: john
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: john
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: john
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: john
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: john
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: blog_post_pkey; Type: CONSTRAINT; Schema: public; Owner: john
--

ALTER TABLE ONLY blog_post
    ADD CONSTRAINT blog_post_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: john
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: john
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: john
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: john
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: john
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: john
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: john
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: john
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: john
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: john
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: john
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: john
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: john
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: john
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: blog_post_2dbcba41; Type: INDEX; Schema: public; Owner: john
--

CREATE INDEX blog_post_2dbcba41 ON blog_post USING btree (slug);


--
-- Name: blog_post_slug_b95473f2_like; Type: INDEX; Schema: public; Owner: john
--

CREATE INDEX blog_post_slug_b95473f2_like ON blog_post USING btree (slug varchar_pattern_ops);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: john
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: john
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: john
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: john
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: john
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: john
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: john
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: john
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: john
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: john
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: john
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_content_type_id_c4bce8eb_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: john
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_c4bce8eb_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: john
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: john
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM john;
GRANT ALL ON SCHEMA public TO john;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

