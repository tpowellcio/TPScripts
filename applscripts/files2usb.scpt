FasdUAS 1.101.10   ��   ��    k             l     ��  ��    1 +When a item is added to this folder do this     � 	 	 V W h e n   a   i t e m   i s   a d d e d   t o   t h i s   f o l d e r   d o   t h i s   
  
 l     ��  ��    G Aon adding folder items to this_folder after receiving added_items     �   � o n   a d d i n g   f o l d e r   i t e m s   t o   t h i s _ f o l d e r   a f t e r   r e c e i v i n g   a d d e d _ i t e m s      l     ��  ��     Finder Tell Block     �   " F i n d e r   T e l l   B l o c k      l   � ����  t    �    k   �       O   �    k   �        l   �� ! "��   !  Set mac source variables    " � # # 0 S e t   m a c   s o u r c e   v a r i a b l e s    $ % $ l   �� & '��   & &  Setup for invisible file removal    ' � ( ( @ S e t u p   f o r   i n v i s i b l e   f i l e   r e m o v a l %  ) * ) r     + , + m    	 - - � . .  / V o l u m e s / , o      ���� 0 rootdir rootDir *  / 0 / r     1 2 1 m     3 3 � 4 4 
 / . ? ? * 2 o      ���� 0 fileselector fileSelector 0  5 6 5 l   �� 7 8��   7 * $Set nameing structure for usb sticks    8 � 9 9 H S e t   n a m e i n g   s t r u c t u r e   f o r   u s b   s t i c k s 6  : ; : r     < = < m     > > � ? ?  N O   N A M E = o      ���� 0 usb_name   ;  @ A @ r     B C B m     D D � E E  C O N T I N U U M C o      ���� 0 new_usb_name   A  F G F l   �� H I��   H T NSet source folder for source files and list the files in to a string file_list    I � J J � S e t   s o u r c e   f o l d e r   f o r   s o u r c e   f i l e s   a n d   l i s t   t h e   f i l e s   i n   t o   a   s t r i n g   f i l e _ l i s t G  K L K l    M N O M r     P Q P m     R R � S S B H D : U s e r s : t p o w e l l : D e s k t o p : u s b f i l e s Q o      ���� 0 source_fold   N  Source of Files    O � T T  S o u r c e   o f   F i l e s L  U V U r    * W X W I   &�� Y Z
�� .earslfdrutxt  @    file Y 4     �� [
�� 
alis [ o    ���� 0 source_fold   Z �� \��
�� 
lfiv \ m   ! "��
�� boovfals��   X o      ���� 0 	file_list   V  ] ^ ] l  + +�� _ `��   _ ? 9Check if Files on USB are older than 30 days if so delete    ` � a a r C h e c k   i f   F i l e s   o n   U S B   a r e   o l d e r   t h a n   3 0   d a y s   i f   s o   d e l e t e ^  b c b r   + 0 d e d l  + , f���� f m   + ,���� ��  ��   e o      ���� 0 moddate modDate c  g h g l  1 1�� i j��   i G ACreate a list of all usb disks that start with the name "No Name"    j � k k � C r e a t e   a   l i s t   o f   a l l   u s b   d i s k s   t h a t   s t a r t   w i t h   t h e   n a m e   " N o   N a m e " h  l m l r   1 o n o n c   1 k p q p l  1 g r���� r 6  1 g s t s 2   1 6��
�� 
cdis t G   9 f u v u F   : [ w x w F   ; P y z y =  < E { | { 1   = A��
�� 
isej | m   B D��
�� boovtrue z =  F O } ~ } 1   G K��
�� 
isrv ~ m   L N��
�� boovtrue x C   Q Z  �  1   R V��
�� 
pnam � o   W Y���� 0 usb_name   v C   \ e � � � 1   ] a��
�� 
pnam � o   b d���� 0 new_usb_name  ��  ��   q m   g j��
�� 
alst o o      ���� 0 usbdisk   m  � � � l  p p�� � ���   � ' !Start iterating through USB disks    � � � � B S t a r t   i t e r a t i n g   t h r o u g h   U S B   d i s k s �  � � � X   p� ��� � � k   �~ � �  � � � l  � ��� � ���   � ! Clear Contents of USB drive    � � � � 6 C l e a r   C o n t e n t s   o f   U S B   d r i v e �  � � � Q   � � � ��� � k   � � � �  � � � I  � ��� ���
�� .coredeloobj        obj  � l  � � ����� � 6  � � � � � n   � � � � � 2   � ���
�� 
cobj � 4   � ��� �
�� 
cdis � o   � ����� 0 n   � A  � � � � � 1   � ���
�� 
asmo � \   � � � � � l  � � ����� � l  � � ����� � I  � �������
�� .misccurdldt    ��� null��  ��  ��  ��  ��  ��   � ]   � � � � � o   � ����� 0 moddate modDate � 1   � ���
�� 
days��  ��  ��   �  � � � I  � ��� ���
�� .sysodelanull��� ��� nmbr � m   � ����� ��   �  ��� � Z   � � � ����� � ?   � � � � � I  � ��� ���
�� .corecnte****       **** � n   � � � � � 2  � ���
�� 
cobj � 1   � ���
�� 
trsh��   � m   � �����   � I  � ��� ���
�� .fndremptnull��� ��� obj  � 1   � ���
�� 
trsh��  ��  ��  ��   � R      ������
�� .ascrerr ****      � ****��  ��  ��   �  � � � l  � ��� � ���   �   Get list of files from USB    � � � � 4 G e t   l i s t   o f   f i l e s   f r o m   U S B �  � � � r   � � � � � I  � ��� ���
�� .earslfdrutxt  @    file � o   � ����� 0 n  ��   � o      ���� 0 usblist   �  � � � r   � � � � � n   � � � � � 1   � ���
�� 
pnam � 4   � ��� �
�� 
cdis � o   � ����� 0 n   � o      ���� 0 usblabel   �  � � � l  � ��� � ���   � % Do stuff with files on USB disk    � � � � > D o   s t u f f   w i t h   f i l e s   o n   U S B   d i s k �  � � � X   �E ��� � � k  @ � �  � � � l �� � ���   � - 'Check to see if the files already exist    � � � � N C h e c k   t o   s e e   i f   t h e   f i l e s   a l r e a d y   e x i s t �  ��� � Z  @ � ��� � � H   � � E   � � � o  ���� 0 usblist   � o  ���� 0 	file_item   � k  * � �  � � � l �� � ���   �  Copy files to usb    � � � � " C o p y   f i l e s   t o   u s b �  ��� � s  * � � � n  # � � � 4  #�� �
�� 
cobj � o  !"���� 0 	file_item   � 4  �� �
�� 
cfol � o  ���� 0 source_fold   � 4  #)�� �
�� 
cdis � o  '(���� 0 n  ��  ��   � k  -@ � �  � � � l --�� � ���   � % Delete Invisible Files from USB    � � � � > D e l e t e   I n v i s i b l e   F i l e s   f r o m   U S B �  ��� � I -@�� ���
�� .sysoexecTEXT���     TEXT � b  -< � � � b  -: � � � b  -2 � � � m  -0 � � � � �  r m   - r f     � o  01���� 0 rootdir rootDir � n  29 � � � 1  59��
�� 
strq � o  25���� 0 usblabel   � o  :;���� 0 fileselector fileSelector��  ��  ��  �� 0 	file_item   � o   � ����� 0 	file_list   �  � � � l FF�� � ���   �  Rename disk    � � � �  R e n a m e   d i s k �  ��  Z  F~�� > FR n  FP 1  LP��
�� 
pnam 4  FL��
�� 
cdis o  JK���� 0 n   o  PQ���� 0 new_usb_name   k  Ul		 

 r  Ua o  UV���� 0 new_usb_name   n       1  \`��
�� 
pnam 4  V\��
�� 
cdis o  Z[���� 0 n   �� O bl I fk����
�� .fndrejctnull��� ��� obj  o  fg���� 0 new_usb_name  ��   m  bc�                                                                                  MACS  alis    V  HD                         �h^H+   �
Finder.app                                                      	���B        ����  	                CoreServices    �h_�      �͒     � � �  ,HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    H D  &System/Library/CoreServices/Finder.app  / ��  ��  ��   k  o~  l oo����    Eject USB disk n    �   E j e c t   U S B   d i s k   n � O o~ I s}�~�}
�~ .fndrejctnull��� ��� obj  4  sy�| 
�| 
cdis  o  wx�{�{ 0 n  �}   m  op!!�                                                                                  MACS  alis    V  HD                         �h^H+   �
Finder.app                                                      	���B        ����  	                CoreServices    �h_�      �͒     � � �  ,HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    H D  &System/Library/CoreServices/Finder.app  / ��  �  ��  �� 0 n   � o   s v�z�z 0 usbdisk   � "�y" I ���x#�w
�x .sysodelanull��� ��� nmbr# m  ���v�v �w  �y    m    $$�                                                                                  MACS  alis    V  HD                         �h^H+   �
Finder.app                                                      	���B        ����  	                CoreServices    �h_�      �͒     � � �  ,HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    H D  &System/Library/CoreServices/Finder.app  / ��    %�u% I ���t&�s
�t .sysodlogaskr        TEXT& m  ��'' �(( V F i l e s   h a v e   b e e n   c o p p i e d   t o   U S B   s u c c e s s f u l l y�s  �u    l    )�r�q) ]     *+* m     �p�p + m    �o�o <�r  �q  ��  ��    ,-, l     �n./�n  .   end adding folder items to   / �00 4 e n d   a d d i n g   f o l d e r   i t e m s   t o- 1�m1 l     �l�k�j�l  �k  �j  �m       �i23 - 3 > D R4�h567�g�f�e�d�c�i  2 �b�a�`�_�^�]�\�[�Z�Y�X�W�V�U�T�S
�b .aevtoappnull  �   � ****�a 0 rootdir rootDir�` 0 fileselector fileSelector�_ 0 usb_name  �^ 0 new_usb_name  �] 0 source_fold  �\ 0 	file_list  �[ 0 moddate modDate�Z 0 usbdisk  �Y 0 usblist  �X 0 usblabel  �W  �V  �U  �T  �S  3 �R8�Q�P9:�O
�R .aevtoappnull  �   � ****8 k    �;;  �N�N  �Q  �P  9 �M�L�M 0 n  �L 0 	file_item  : .�K�J$ -�I 3�H >�G D�F R�E�D�C�B�A�@�?<�>�=�<�;�:�9�8�7�6�5�4�3�2�1�0�/�.�-�,�+ ��*�)�('�'�K �J <�I 0 rootdir rootDir�H 0 fileselector fileSelector�G 0 usb_name  �F 0 new_usb_name  �E 0 source_fold  
�D 
alis
�C 
lfiv
�B .earslfdrutxt  @    file�A 0 	file_list  �@ 0 moddate modDate
�? 
cdis<  
�> 
isej
�= 
isrv
�< 
pnam
�; 
alst�: 0 usbdisk  
�9 
kocl
�8 
cobj
�7 .corecnte****       ****
�6 
asmo
�5 .misccurdldt    ��� null
�4 
days
�3 .coredeloobj        obj 
�2 .sysodelanull��� ��� nmbr
�1 
trsh
�0 .fndremptnull��� ��� obj �/  �.  �- 0 usblist  �, 0 usblabel  
�+ 
cfol
�* 
strq
�) .sysoexecTEXT���     TEXT
�( .fndrejctnull��� ��� obj 
�' .sysodlogaskr        TEXT�O��� n���E�O�E�O�E�O�E�O�E�O*��/�fl E` O�E` O*a -a [[[[a ,\Ze8\[a ,\Ze8A\[a ,\Z�>A\[a ,\Z�>B1a &E` O_ [a a l kh   R*a �/a -a [a ,\Z*j _ _  <1j Okj  O*a !,a -j j *a !,j "Y hW X # $hO�j E` %O*a �/a ,E` &O K_ [a a l kh _ %� *a '�/a �/*a �/GY a (�%_ &a ),%�%j *[OY��O*a �/a ,� �*a �/a ,FO� �j +UY � *a �/j +U[OY�Okj  UOa ,j -o4 �&=�& =  >?@AB> �CC 0 A n a c o n d a P r o - 1 . 1 - l i n u x . s h? �DD 2 A n a c o n d a P r o - 1 . 1 - m a c o s x . s h@ �EE > A n a c o n d a P r o - 1 . 1 - w i n d o w s - x 8 6 . e x eA �FF D A n a c o n d a P r o - 1 . 1 - w i n d o w s - x 8 6 _ 6 4 . e x eB �GG  A n a c o n d a P r o . p d f�h 5 �%H�% H  IJKLMNOPQRSTUVWXYZ[\Ialis       	CONTINUUM                      BD ����	CONTINUUM                                                      ����            ����  
IS            /:Volumes:CONTINUUM/   	 C O N T I N U U M   	 C O N T I N U U M     /Volumes/CONTINUUM��      Jalis      	CONTINUUM                      BD ����	CONTINUUM                                                      ����            ����  
IS            /:Volumes:CONTINUUM 1/   	 C O N T I N U U M   	 C O N T I N U U M     /Volumes/CONTINUUM 1��      Kalis      	CONTINUUM                      BD ����	CONTINUUM                                                      ����            ����  
IS            /:Volumes:CONTINUUM 10/    	 C O N T I N U U M   	 C O N T I N U U M     /Volumes/CONTINUUM 10 ��      Lalis      	CONTINUUM                      BD ����	CONTINUUM                                                      ����            ����  
IS            /:Volumes:CONTINUUM 11/    	 C O N T I N U U M   	 C O N T I N U U M     /Volumes/CONTINUUM 11 ��      Malis      	CONTINUUM                      BD ����	CONTINUUM                                                      ����            ����  
IS            /:Volumes:CONTINUUM 12/    	 C O N T I N U U M   	 C O N T I N U U M     /Volumes/CONTINUUM 12 ��      Nalis      	CONTINUUM                      BD ����	CONTINUUM                                                      ����            ����  
IS            /:Volumes:CONTINUUM 13/    	 C O N T I N U U M   	 C O N T I N U U M     /Volumes/CONTINUUM 13 ��      Oalis      	CONTINUUM                      BD ����	CONTINUUM                                                      ����            ����  
IS            /:Volumes:CONTINUUM 14/    	 C O N T I N U U M   	 C O N T I N U U M     /Volumes/CONTINUUM 14 ��      Palis      	CONTINUUM                      BD ����	CONTINUUM                                                      ����            ����  
IS            /:Volumes:CONTINUUM 15/    	 C O N T I N U U M   	 C O N T I N U U M     /Volumes/CONTINUUM 15 ��      Qalis      	CONTINUUM                      BD ����	CONTINUUM                                                      ����            ����  
IS            /:Volumes:CONTINUUM 16/    	 C O N T I N U U M   	 C O N T I N U U M     /Volumes/CONTINUUM 16 ��      Ralis      	CONTINUUM                      BD ����	CONTINUUM                                                      ����            ����  
IS            /:Volumes:CONTINUUM 17/    	 C O N T I N U U M   	 C O N T I N U U M     /Volumes/CONTINUUM 17 ��      Salis      	CONTINUUM                      BD ����	CONTINUUM                                                      ����            ����  
IS            /:Volumes:CONTINUUM 18/    	 C O N T I N U U M   	 C O N T I N U U M     /Volumes/CONTINUUM 18 ��      Talis      	CONTINUUM                      BD ����	CONTINUUM                                                      ����            ����  
IS            /:Volumes:CONTINUUM 19/    	 C O N T I N U U M   	 C O N T I N U U M     /Volumes/CONTINUUM 19 ��      Ualis      	CONTINUUM                      BD ����	CONTINUUM                                                      ����            ����  
IS            /:Volumes:CONTINUUM 2/   	 C O N T I N U U M   	 C O N T I N U U M     /Volumes/CONTINUUM 2��      Valis      	CONTINUUM                      BD ����	CONTINUUM                                                      ����            ����  
IS            /:Volumes:CONTINUUM 3/   	 C O N T I N U U M   	 C O N T I N U U M     /Volumes/CONTINUUM 3��      Walis      	CONTINUUM                      BD ����	CONTINUUM                                                      ����            ����  
IS            /:Volumes:CONTINUUM 4/   	 C O N T I N U U M   	 C O N T I N U U M     /Volumes/CONTINUUM 4��      Xalis      	CONTINUUM                      BD ����	CONTINUUM                                                      ����            ����  
IS            /:Volumes:CONTINUUM 5/   	 C O N T I N U U M   	 C O N T I N U U M     /Volumes/CONTINUUM 5��      Yalis      	CONTINUUM                      BD ����	CONTINUUM                                                      ����            ����  
IS            /:Volumes:CONTINUUM 6/   	 C O N T I N U U M   	 C O N T I N U U M     /Volumes/CONTINUUM 6��      Zalis      	CONTINUUM                      BD ����	CONTINUUM                                                      ����            ����  
IS            /:Volumes:CONTINUUM 7/   	 C O N T I N U U M   	 C O N T I N U U M     /Volumes/CONTINUUM 7��      [alis      	CONTINUUM                      BD ����	CONTINUUM                                                      ����            ����  
IS            /:Volumes:CONTINUUM 8/   	 C O N T I N U U M   	 C O N T I N U U M     /Volumes/CONTINUUM 8��      \alis      	CONTINUUM                      BD ����	CONTINUUM                                                      ����            ����  
IS            /:Volumes:CONTINUUM 9/   	 C O N T I N U U M   	 C O N T I N U U M     /Volumes/CONTINUUM 9��      6 �$]�$ ]  ^_`ab^ �cc 0 A n a c o n d a P r o - 1 . 1 - l i n u x . s h_ �dd 2 A n a c o n d a P r o - 1 . 1 - m a c o s x . s h` �ee > A n a c o n d a P r o - 1 . 1 - w i n d o w s - x 8 6 . e x ea �ff D A n a c o n d a P r o - 1 . 1 - w i n d o w s - x 8 6 _ 6 4 . e x eb �gg  A n a c o n d a P r o . p d f7 �hh  C O N T I N U U M   9�g  �f  �e  �d  �c  ascr  ��ޭ