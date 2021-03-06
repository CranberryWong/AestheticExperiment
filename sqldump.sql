PGDMP         ;                x            postgres    12.3    12.3 G    ^           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            _           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            `           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            a           1262    13318    postgres    DATABASE     �   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE postgres;
                postgres    false            b           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    2913                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                postgres    false            c           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   postgres    false    4            �            1259    16395    account    TABLE     '  CREATE TABLE public.account (
    user_id integer NOT NULL,
    username character varying(100) NOT NULL,
    password character varying(50) NOT NULL,
    email character varying(100),
    phone_number character varying(20),
    line_id character varying(50),
    wechat_id character varying(50),
    skype_id character varying(50),
    created_on timestamp without time zone NOT NULL,
    last_login timestamp without time zone,
    last_login_ip character varying(100),
    degree integer,
    exp integer,
    nationality character varying(100)
);
    DROP TABLE public.account;
       public         heap    postgres    false    4            �            1259    16393    account_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.account_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.account_user_id_seq;
       public          postgres    false    4    204            d           0    0    account_user_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.account_user_id_seq OWNED BY public.account.user_id;
          public          postgres    false    203            �            1259    16485    activity    TABLE     c  CREATE TABLE public.activity (
    activity_id integer NOT NULL,
    project_id integer NOT NULL,
    user_id integer NOT NULL,
    weekly_report_id integer NOT NULL,
    activity_name text NOT NULL,
    priority integer,
    progress_percentage integer,
    created_on timestamp without time zone NOT NULL,
    last_modify timestamp without time zone
);
    DROP TABLE public.activity;
       public         heap    postgres    false    4            �            1259    16483    activity_activity_id_seq    SEQUENCE     �   CREATE SEQUENCE public.activity_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.activity_activity_id_seq;
       public          postgres    false    4    218            e           0    0    activity_activity_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.activity_activity_id_seq OWNED BY public.activity.activity_id;
          public          postgres    false    217            �            1259    16425    project    TABLE     �   CREATE TABLE public.project (
    project_id integer NOT NULL,
    project_name character varying(200) NOT NULL,
    created_on timestamp without time zone,
    project_group_id integer
);
    DROP TABLE public.project;
       public         heap    postgres    false    4            �            1259    16414    project_group    TABLE     s   CREATE TABLE public.project_group (
    project_group_id integer NOT NULL,
    project_group_name text NOT NULL
);
 !   DROP TABLE public.project_group;
       public         heap    postgres    false    4            �            1259    16412 "   project_group_project_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.project_group_project_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.project_group_project_group_id_seq;
       public          postgres    false    4    208            f           0    0 "   project_group_project_group_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.project_group_project_group_id_seq OWNED BY public.project_group.project_group_id;
          public          postgres    false    207            �            1259    16438    project_member    TABLE     �   CREATE TABLE public.project_member (
    project_member_id integer NOT NULL,
    user_id integer NOT NULL,
    project_id integer NOT NULL
);
 "   DROP TABLE public.project_member;
       public         heap    postgres    false    4            �            1259    16436 $   project_member_project_member_id_seq    SEQUENCE     �   CREATE SEQUENCE public.project_member_project_member_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.project_member_project_member_id_seq;
       public          postgres    false    212    4            g           0    0 $   project_member_project_member_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.project_member_project_member_id_seq OWNED BY public.project_member.project_member_id;
          public          postgres    false    211            �            1259    16423    project_project_id_seq    SEQUENCE     �   CREATE SEQUENCE public.project_project_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.project_project_id_seq;
       public          postgres    false    4    210            h           0    0    project_project_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.project_project_id_seq OWNED BY public.project.project_id;
          public          postgres    false    209            �            1259    16464 
   reflection    TABLE     �   CREATE TABLE public.reflection (
    reflection_id integer NOT NULL,
    reflection_rate integer NOT NULL,
    reflection_text text NOT NULL,
    weekly_report_id integer,
    user_id integer,
    created_on time without time zone
);
    DROP TABLE public.reflection;
       public         heap    postgres    false    4            �            1259    16462    reflection_reflection_id_seq    SEQUENCE     �   CREATE SEQUENCE public.reflection_reflection_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.reflection_reflection_id_seq;
       public          postgres    false    4    216            i           0    0    reflection_reflection_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.reflection_reflection_id_seq OWNED BY public.reflection.reflection_id;
          public          postgres    false    215            �            1259    16456    weekly_report    TABLE     �   CREATE TABLE public.weekly_report (
    weekly_report_id integer NOT NULL,
    date_range_start timestamp without time zone NOT NULL,
    date_range_end timestamp without time zone NOT NULL
);
 !   DROP TABLE public.weekly_report;
       public         heap    postgres    false    4            �            1259    16454 "   weekly_report_weekly_report_id_seq    SEQUENCE     �   CREATE SEQUENCE public.weekly_report_weekly_report_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.weekly_report_weekly_report_id_seq;
       public          postgres    false    4    214            j           0    0 "   weekly_report_weekly_report_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.weekly_report_weekly_report_id_seq OWNED BY public.weekly_report.weekly_report_id;
          public          postgres    false    213            �            1259    16406 	   xp_events    TABLE     t   CREATE TABLE public.xp_events (
    xp_events_id integer NOT NULL,
    level integer NOT NULL,
    min_xp bigint
);
    DROP TABLE public.xp_events;
       public         heap    postgres    false    4            �            1259    16404    xp_events_xp_events_id_seq    SEQUENCE     �   CREATE SEQUENCE public.xp_events_xp_events_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.xp_events_xp_events_id_seq;
       public          postgres    false    206    4            k           0    0    xp_events_xp_events_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.xp_events_xp_events_id_seq OWNED BY public.xp_events.xp_events_id;
          public          postgres    false    205            �
           2604    16398    account user_id    DEFAULT     r   ALTER TABLE ONLY public.account ALTER COLUMN user_id SET DEFAULT nextval('public.account_user_id_seq'::regclass);
 >   ALTER TABLE public.account ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    203    204    204            �
           2604    16488    activity activity_id    DEFAULT     |   ALTER TABLE ONLY public.activity ALTER COLUMN activity_id SET DEFAULT nextval('public.activity_activity_id_seq'::regclass);
 C   ALTER TABLE public.activity ALTER COLUMN activity_id DROP DEFAULT;
       public          postgres    false    217    218    218            �
           2604    16428    project project_id    DEFAULT     x   ALTER TABLE ONLY public.project ALTER COLUMN project_id SET DEFAULT nextval('public.project_project_id_seq'::regclass);
 A   ALTER TABLE public.project ALTER COLUMN project_id DROP DEFAULT;
       public          postgres    false    209    210    210            �
           2604    16417    project_group project_group_id    DEFAULT     �   ALTER TABLE ONLY public.project_group ALTER COLUMN project_group_id SET DEFAULT nextval('public.project_group_project_group_id_seq'::regclass);
 M   ALTER TABLE public.project_group ALTER COLUMN project_group_id DROP DEFAULT;
       public          postgres    false    207    208    208            �
           2604    16441     project_member project_member_id    DEFAULT     �   ALTER TABLE ONLY public.project_member ALTER COLUMN project_member_id SET DEFAULT nextval('public.project_member_project_member_id_seq'::regclass);
 O   ALTER TABLE public.project_member ALTER COLUMN project_member_id DROP DEFAULT;
       public          postgres    false    211    212    212            �
           2604    16467    reflection reflection_id    DEFAULT     �   ALTER TABLE ONLY public.reflection ALTER COLUMN reflection_id SET DEFAULT nextval('public.reflection_reflection_id_seq'::regclass);
 G   ALTER TABLE public.reflection ALTER COLUMN reflection_id DROP DEFAULT;
       public          postgres    false    216    215    216            �
           2604    16459    weekly_report weekly_report_id    DEFAULT     �   ALTER TABLE ONLY public.weekly_report ALTER COLUMN weekly_report_id SET DEFAULT nextval('public.weekly_report_weekly_report_id_seq'::regclass);
 M   ALTER TABLE public.weekly_report ALTER COLUMN weekly_report_id DROP DEFAULT;
       public          postgres    false    214    213    214            �
           2604    16409    xp_events xp_events_id    DEFAULT     �   ALTER TABLE ONLY public.xp_events ALTER COLUMN xp_events_id SET DEFAULT nextval('public.xp_events_xp_events_id_seq'::regclass);
 E   ALTER TABLE public.xp_events ALTER COLUMN xp_events_id DROP DEFAULT;
       public          postgres    false    205    206    206            M          0    16395    account 
   TABLE DATA           �   COPY public.account (user_id, username, password, email, phone_number, line_id, wechat_id, skype_id, created_on, last_login, last_login_ip, degree, exp, nationality) FROM stdin;
    public          postgres    false    204   #X       [          0    16485    activity 
   TABLE DATA           �   COPY public.activity (activity_id, project_id, user_id, weekly_report_id, activity_name, priority, progress_percentage, created_on, last_modify) FROM stdin;
    public          postgres    false    218   4Y       S          0    16425    project 
   TABLE DATA           Y   COPY public.project (project_id, project_name, created_on, project_group_id) FROM stdin;
    public          postgres    false    210   �Z       Q          0    16414    project_group 
   TABLE DATA           M   COPY public.project_group (project_group_id, project_group_name) FROM stdin;
    public          postgres    false    208   �[       U          0    16438    project_member 
   TABLE DATA           P   COPY public.project_member (project_member_id, user_id, project_id) FROM stdin;
    public          postgres    false    212   O\       Y          0    16464 
   reflection 
   TABLE DATA           |   COPY public.reflection (reflection_id, reflection_rate, reflection_text, weekly_report_id, user_id, created_on) FROM stdin;
    public          postgres    false    216   �\       W          0    16456    weekly_report 
   TABLE DATA           [   COPY public.weekly_report (weekly_report_id, date_range_start, date_range_end) FROM stdin;
    public          postgres    false    214   A]       O          0    16406 	   xp_events 
   TABLE DATA           @   COPY public.xp_events (xp_events_id, level, min_xp) FROM stdin;
    public          postgres    false    206   �]       l           0    0    account_user_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.account_user_id_seq', 1, false);
          public          postgres    false    203            m           0    0    activity_activity_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.activity_activity_id_seq', 24, true);
          public          postgres    false    217            n           0    0 "   project_group_project_group_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.project_group_project_group_id_seq', 1, false);
          public          postgres    false    207            o           0    0 $   project_member_project_member_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.project_member_project_member_id_seq', 11, true);
          public          postgres    false    211            p           0    0    project_project_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.project_project_id_seq', 12, true);
          public          postgres    false    209            q           0    0    reflection_reflection_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.reflection_reflection_id_seq', 2, true);
          public          postgres    false    215            r           0    0 "   weekly_report_weekly_report_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.weekly_report_weekly_report_id_seq', 17, true);
          public          postgres    false    213            s           0    0    xp_events_xp_events_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.xp_events_xp_events_id_seq', 1, false);
          public          postgres    false    205            �
           2606    16403    account account_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_pkey PRIMARY KEY (user_id);
 >   ALTER TABLE ONLY public.account DROP CONSTRAINT account_pkey;
       public            postgres    false    204            �
           2606    16493    activity activity_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.activity
    ADD CONSTRAINT activity_pkey PRIMARY KEY (activity_id);
 @   ALTER TABLE ONLY public.activity DROP CONSTRAINT activity_pkey;
       public            postgres    false    218            �
           2606    16422     project_group project_group_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.project_group
    ADD CONSTRAINT project_group_pkey PRIMARY KEY (project_group_id);
 J   ALTER TABLE ONLY public.project_group DROP CONSTRAINT project_group_pkey;
       public            postgres    false    208            �
           2606    16443 "   project_member project_member_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.project_member
    ADD CONSTRAINT project_member_pkey PRIMARY KEY (project_member_id);
 L   ALTER TABLE ONLY public.project_member DROP CONSTRAINT project_member_pkey;
       public            postgres    false    212            �
           2606    16430    project project_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.project
    ADD CONSTRAINT project_pkey PRIMARY KEY (project_id);
 >   ALTER TABLE ONLY public.project DROP CONSTRAINT project_pkey;
       public            postgres    false    210            �
           2606    16472    reflection reflection_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.reflection
    ADD CONSTRAINT reflection_pkey PRIMARY KEY (reflection_id);
 D   ALTER TABLE ONLY public.reflection DROP CONSTRAINT reflection_pkey;
       public            postgres    false    216            �
           2606    16461     weekly_report weekly_report_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.weekly_report
    ADD CONSTRAINT weekly_report_pkey PRIMARY KEY (weekly_report_id);
 J   ALTER TABLE ONLY public.weekly_report DROP CONSTRAINT weekly_report_pkey;
       public            postgres    false    214            �
           2606    16411    xp_events xp_events_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.xp_events
    ADD CONSTRAINT xp_events_pkey PRIMARY KEY (xp_events_id);
 B   ALTER TABLE ONLY public.xp_events DROP CONSTRAINT xp_events_pkey;
       public            postgres    false    206            �
           2606    16494 !   activity activity_project_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.activity
    ADD CONSTRAINT activity_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.project(project_id) NOT VALID;
 K   ALTER TABLE ONLY public.activity DROP CONSTRAINT activity_project_id_fkey;
       public          postgres    false    2749    210    218            �
           2606    16499    activity activity_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.activity
    ADD CONSTRAINT activity_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.account(user_id) NOT VALID;
 H   ALTER TABLE ONLY public.activity DROP CONSTRAINT activity_user_id_fkey;
       public          postgres    false    204    2743    218            �
           2606    16504 '   activity activity_weekly_report_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.activity
    ADD CONSTRAINT activity_weekly_report_id_fkey FOREIGN KEY (weekly_report_id) REFERENCES public.weekly_report(weekly_report_id) NOT VALID;
 Q   ALTER TABLE ONLY public.activity DROP CONSTRAINT activity_weekly_report_id_fkey;
       public          postgres    false    214    2753    218            �
           2606    16449 -   project_member project_member_project_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.project_member
    ADD CONSTRAINT project_member_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.project(project_id);
 W   ALTER TABLE ONLY public.project_member DROP CONSTRAINT project_member_project_id_fkey;
       public          postgres    false    210    212    2749            �
           2606    16444 *   project_member project_member_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.project_member
    ADD CONSTRAINT project_member_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.account(user_id);
 T   ALTER TABLE ONLY public.project_member DROP CONSTRAINT project_member_user_id_fkey;
       public          postgres    false    204    2743    212            �
           2606    16431 %   project project_project_group_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.project
    ADD CONSTRAINT project_project_group_id_fkey FOREIGN KEY (project_group_id) REFERENCES public.project_group(project_group_id);
 O   ALTER TABLE ONLY public.project DROP CONSTRAINT project_project_group_id_fkey;
       public          postgres    false    2747    210    208            �
           2606    16478 "   reflection reflection_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reflection
    ADD CONSTRAINT reflection_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.account(user_id);
 L   ALTER TABLE ONLY public.reflection DROP CONSTRAINT reflection_user_id_fkey;
       public          postgres    false    2743    204    216            �
           2606    16473 +   reflection reflection_weekly_report_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reflection
    ADD CONSTRAINT reflection_weekly_report_id_fkey FOREIGN KEY (weekly_report_id) REFERENCES public.weekly_report(weekly_report_id);
 U   ALTER TABLE ONLY public.reflection DROP CONSTRAINT reflection_weekly_report_id_fkey;
       public          postgres    false    216    2753    214            M     x���MK�0�ϓ_��X�IL�=)��Y/
{�m�&�M��z���ŏ���{���ρ�a�o]�J�n�'(P\
�å��D�M�Ke-�H!�ևHL�]8�ķ��>�É�����x}(�E��0�*m��6J~���?�_BUrU��?/D,���H@���m�n
�jr��K�G��+��N�#��e�BL��ߧ|Ƙ�Kx�7��d��4O��z�?�u�oB7�������cf+7-5�۵��vO�>��
��'_�J      [   �  x�}�MO�0�����?P�3�J|[*�'�V��ťnI���I��~h#�����z<V�����d�t����Е�~��:-H�^�@���Z��Fgg�D;ّĕ qj�ȟ�J���fIt�Ka^h(�J��]h��D?i���].,Ns��Ρ?�#������T��A{?�$�I�f�N"U4�&��B���U~I�qZl�JOϋܮ�tے^_�v;E��V/���m'��I�����D�R��r��n���w�Q�a�I�~(�i�U���o/�����R� C��m��v��vq���8��dg�����.�����Q���5t�Olr^�x@|�<ֆH^���?�\�0��q��%����pȡ��~�q�F�*�U=�䣒R~a�z      S   �   x����j!���S�]�ոz�%�C�l��z�u�]*i�O_�C��%00|�?���	�*�JH��H_GL�'�[Q.�bV�:iz�p��1y�C<Ӻ^[��%�.���o���{r�?�Tpp����n�;8���'����x�R���)��tZK��x��X�;)�b4Ѱ�K�[�<Ǌ������n��P#�B��>.��xO����~�Ʉ0 �[G���g      Q   �   x�-�M
�0@�u�s��J(�Etэ�Ў�`3S��x{-d��xcU�$�U܀�=b�5�Ҕ�>4��NxXH�!����LUX��b�)qa�S�À�P�MN'j9�iۜ���	kO
v�J������y؛C�Y�>�C6w      U   >   x����0��PLƬ�^�a?�!� F8q�̎0O���0�n�]g���!�~�	�      Y   �   x��A� �p�w��V�.���|�G�"0�ۗݛ�$O�R|x�32z̔Y�Z�+ˮhTm�ջ�&�Ǚ@�|��`k}�k�@�����#�)�s�>!�K�ż>@[���k��ʱ�ACL�ƤD�?Mѕ�3�2���F~���>51      W   �   x�m���0C��Y��H�x��?G����8�N���R�ZҶ����\-��GR=̛����c2i�RW��M�Җw�b�fw�W�M`brUكJ�PT�W�']�_,�G�o*�jqT�c侗�fq��D�]D��@R�      O   R   x����0þ�a��&�.��S`~P�1��qi0��$UzxX�Ŋ+m6����ч�HwE3cl�J�y��{�ss��3~?I�R     