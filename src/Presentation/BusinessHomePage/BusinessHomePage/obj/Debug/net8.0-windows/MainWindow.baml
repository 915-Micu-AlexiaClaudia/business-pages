   M S B A M L   `   `   `  ����K  GBusinessHomePage, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null3clr-namespace:BusinessHomePageBusinessHomePage  5   	   !    BusinessHomePage.MainWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   0localclr-namespace:BusinessHomePage     5   	     � Title$  
MainWindow��5   	   $	��550��6   $	��900��6)    � 
ResizeMode$ NoResize=�65   .��5	      �  � RowDefinitions 5
      �� 5      $
��Auto �6   $��49��6$   �� 5      $
��Auto �6   .+�5      �� $��42��6   
���   �$	��Top=�6+   
���   �$��-4,0,0,0q�6P   �� 5      $
��Left=�6   $��	435,8,0,0q�6)    �� TextWrapping$
 Wrap=�6<   $��search��6P   $	��Top=�6^   $	��147��6v   $��Candara Light)�6�   $��14(�6�    �� TextAlignment$ Center=�6�   $��20��6�   .��6�    J� Effect 5      3  -System.Windows.Media.Effects.DropShadowEffect  5   
   .��5       � 	Resources 5       �� 
TargetType �� Property	 �� Value��%_   '��       �� 5   
   " ��6   .�5      ��  �@��CornerRadius$	 10��6+   5      5   	   .��6   5      �� 5      $
��Left=�6   $��33��6'   $��26,1,0,0q�63   $	��Top=�6E   $��66��6]   $��/LogoNavBar.png��6h   �� 5      $
��Left=�6   $��13��6'   $��
593,12,0,0q�63   $	��Top=�6G   $��12��6_   $��/search-icon.png��6j   
 J� RenderTransformOrigin$
 
0.51,0.491&�6�   z�5      V� 5   
   .~�5      �� �� 5      �� 5        �� Angle$ 0Q�6   T� 5!      5"      5$      o� 5%      $��750,10,110,14q�6   .@�5&      m� $��
��6   $��40��6%   $��28��60   $��Candara Light)�6<   ��5'   
   �� 5(       �� ImageSource$ /catOne.png��6   .@�5*   
   m� $��See Managed businesses��6   m� 5+   
   $��Log Out��6   5,   	   5-      5.      5/      