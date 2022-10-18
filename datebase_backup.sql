PGDMP     !                	    z            testdb    14.5    14.5     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16394    testdb    DATABASE     c   CREATE DATABASE testdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Russian_Russia.1251';
    DROP DATABASE testdb;
                postgres    false            �            1259    16459    adresses    TABLE     Q   CREATE TABLE public.adresses (
    id_fk integer NOT NULL,
    adress_fk text
);
    DROP TABLE public.adresses;
       public         heap    postgres    false            �            1259    16466    authors    TABLE     X   CREATE TABLE public.authors (
    id_fk_author integer NOT NULL,
    fk_authors text
);
    DROP TABLE public.authors;
       public         heap    postgres    false            �            1259    16452    maintab    TABLE     �   CREATE TABLE public.maintab (
    id integer NOT NULL,
    name text,
    fk_author integer,
    price integer,
    description text,
    fk_adress integer,
    is_published boolean
);
    DROP TABLE public.maintab;
       public         heap    postgres    false            �          0    16459    adresses 
   TABLE DATA           4   COPY public.adresses (id_fk, adress_fk) FROM stdin;
    public          postgres    false    210          �          0    16466    authors 
   TABLE DATA           ;   COPY public.authors (id_fk_author, fk_authors) FROM stdin;
    public          postgres    false    211   �       �          0    16452    maintab 
   TABLE DATA           c   COPY public.maintab (id, name, fk_author, price, description, fk_adress, is_published) FROM stdin;
    public          postgres    false    209   P       f           2606    16465    adresses adresses_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.adresses
    ADD CONSTRAINT adresses_pkey PRIMARY KEY (id_fk);
 @   ALTER TABLE ONLY public.adresses DROP CONSTRAINT adresses_pkey;
       public            postgres    false    210            h           2606    16472    authors authors_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (id_fk_author);
 >   ALTER TABLE ONLY public.authors DROP CONSTRAINT authors_pkey;
       public            postgres    false    211            d           2606    16458    maintab maintab_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.maintab
    ADD CONSTRAINT maintab_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.maintab DROP CONSTRAINT maintab_pkey;
       public            postgres    false    209            i           2606    16474 	   maintab 1    FK CONSTRAINT     �   ALTER TABLE ONLY public.maintab
    ADD CONSTRAINT "1" FOREIGN KEY (fk_author) REFERENCES public.authors(id_fk_author) NOT VALID;
 5   ALTER TABLE ONLY public.maintab DROP CONSTRAINT "1";
       public          postgres    false    209    211    3176            j           2606    16479 	   maintab 2    FK CONSTRAINT     |   ALTER TABLE ONLY public.maintab
    ADD CONSTRAINT "2" FOREIGN KEY (fk_adress) REFERENCES public.adresses(id_fk) NOT VALID;
 5   ALTER TABLE ONLY public.maintab DROP CONSTRAINT "2";
       public          postgres    false    3174    209    210            �   �   x�m�M�@���)� ���x~�hbܪ	a�Љ��z#��b�I_������I*G4�a
Thѣ���F��KLit�xȉY4�,9a$aD(��E���x�jVN7�[!zx8?�
�߸�c�/���o�������.u�v�+����PM�1��5�C�(�n� �DR�&n�o��J�/��.      �   W   x���	�0���n1��j,&��,��@0��t��q�c�VJu��h'l$
�X}���Na'�%���E$�$��v��FU_�j4      �     x��Y�n�]S_Q�� �)ˏ���I�^M�`���EYc�M�cO���+A�%�b[�W��!_�sν�Z��,d����<������_EZ��X�"�_G��fE��iR��Ť��P~W$�P�E�����'xzֹ��v:�;<���%�I�e(.�a����8��I��8��S[�}s$1�S,���"��l�	��Ey����m�{������I��N��8�Ľx�_puV���N��p���)���Ch�k�r�h\����O)u9��{{;?�	�s�xK}��I������k�O6�"����!�G}Ou,F�ഫ=���|&ua�yy /�p�<@���V=ӧS|���B�9����c��v�H����t�:���cN���h���]}� A 9���Ƒ�����T����d��S���s*O;?Ñ
�b-�P�kj�k�
�����j�S���eA��'�Cf�y�K�+)��X�,DEq�x*Op��W�K�Gx����� �<:HH� ��|��>���c|�CH=��k0�P�*Zǖ/r摀���U�ݹ��`,~T!aR��eͤ����2�XY�F��������	���1��%m	��,8<�*D>�R/��)sz��:��`?)}/�a�.1��:��X���VB	<r�:�����:ƥ�˧T���#��u����2��OE�#��97�1��4;19��C��KmH���	�:�2J�<�hbL�J�}�~/�D�*fAؑ(�(��?׿+K�Ƒ�V�H����=�s&����]>���|���yZ!a�+�N��䕳.���Z�2c6�:v��{�����<��{����wý�{�����"�f�W
��r� �(�/]�am�7��$˟S�O��#���b��ܙ�L�t��#����yv��!�2��`��W���^�e�ͽ�.�q��s�����8���B<xep�\�ڛItf$q �wQ����XG�*:���@�#ڌ�%��ߦJ�P,����EK\�j���7�L��O�w�x����W�"�V�x#�a�ҋ�����`*q �h�jQG8�a�SPu�L��
^�ټ �����n]k/|B�R?��g%V���i��K��8������)���LQ��S�_"S*�ND\�,�=y�k!����
̱"�JۅBըKcn\��M�3��S������P!�3%��T�U�R
��!�Hܴ�V��e߷�05���FZ�����nnQ\- xld�7�좤�d���2�Ot��f�G3�p�]�|�_G�'Ļ�sd~EB�w ��L�­ʦ�:��q�!b�2.��y��I�>�y�ts���r�j �e�&�I-Zf�h�A�yGp[�N���Z6�5'Y�j�8:���pYg�g/T?���y�b17B���&���ѻ����~�������k3��}ؼy�#�d��@���ņѝ 'A�G��)���J�[����z=����P`�/kB⇋�O�~I�#��'�5*|�����3"蔇x���؋pf� c+�
�IQ4�sʃuU/E��T,���n��ܨ� <:�����2-lӏ��/T<��c��V�"
��T>�)����ٯ�v"���v���[���C���)�V��TW��NNZ�g��c�����;�F3�4�Dh�ev!���Sj��=ج�J�#s*��ٚALeg�}m�F�В/�|9D���rkŘ�5@tX�(�ZZ�*���+������O�k}q��rkgX�*�ST��R�������!���Xɤ�"HB�ĐoLN&���V�	&�����͏��H��߾fF
ա�t�������{뙯EN��7�2߾��z3Zqj���i=�)��n��L�ZK����=�N.�muA�.�(��_�*��{�O�c��6M{!o���(g�ڰAX�3�n$�ӽ��J1�>ƛ�`J�s��6Mp(t�	�S�/��%Eի�����M��Ww-O)����@l��4%��a�U�'�����[���1՗5K��B|I~ۑ�	�Mk�1uGb϶��nX��GYw��a{�Z?S<p���9��������ξu�1zc��1m�;/�TS��%\���I�J՟ƪ���8|v��T��0�J���<p��5�T�Ǳ�M�n�Fn[��G���AV$۾f��y՝�@���ʹkT+{*	>l���<�U w�]%6Q�FJqIm��j��m��dlz@����[�OcߙZ�9Ф.�m��L=?�v0�)�
�4�T��.�2�������5�$�pu_�����_J>z�a�6����1il�L�����
��=����$X�`��#U�Y�٤���LaSD�Qֆ���"'���˴;�A.pV\M��+���"9_�,���S+�p��Օ�f"��8�0Ls�P�#��Z��RY�n6 �^����W!�~�^JJ�qv��m$ xڭO#�>�	g�(h��߽�\m�1y$����ȍ�=q^�5�N�ԕx�eK���⟅^,�k�� vv����eβ�x�md�wT������=m֌��m�ևUK�%��@�"�7��w�{�Id��'u���c�VY5�G�k@ݿݰ�Z�vY��D_�#����n}���N�vĊ4(eM�� ��z��MϊzȶTI|��;�)N��X 8�U�U96��rt?��ޓ��C���W7wjCu���k7Н4>��e3�[mGO��n�b24�RA��7��[��x�_�BN5�c�Xy�nxY��3�SJi�{����\�C�%y��ڨN@#�k��i�>���YL\cb�9.�a�m��*��N�b#1S}c����l�X�Mj����U��5
��l�'�8�B�IhY���:\k~�M�W?*Nq"���r���S����XWC�Ec�����������m+���k�غ�����ƀ���f�� ߪC����e�B���
��A����F�8��U9Z����w\�Cs�Ȓ�i��A���zޱԫ�b��I�B�P֧�qbҨ�u����wz[[[�
���     