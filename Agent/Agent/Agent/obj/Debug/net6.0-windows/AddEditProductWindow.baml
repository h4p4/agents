   M S B A M L   `   `   `  ����@  <Agent, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullclr-namespace:AgentAgent  5   	        Agent.AddEditProductWindow   5   	   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   %localclr-namespace:Agent     5   	   -   5          � Title$  AddEditProductWindow��5   	   $	��550��6&   $	��500��63    � WindowStartupLocation$ CenterScreen=�5	   	    � 
ResizeMode$ CanResizeWithGrip=�5
   	   $	��500��5   	   $	��500��5   	   $	��550��5   	   .��5      �  � ColumnDefinitions 5   
   �� 5      $
��1.7* �6   �� 5       � RowDefinitions 5   
   �� 5      $	��220 �6   �� 5      �� 5      $��30 �6   .+�5   
   �� $��1��6   $��10q�6&   ._�5      �  5      �� 5      �� 5      .+�5      �� $��0��6   .+�5       �� $��Название:��6    $��	0 0 0 7.5q�61   �� 5!      $��Артикул:��6    $��	0 0 0 7.5q�60   �� 5"      $Q��KКоличество производственного персонала:��6    $
��Wrap=�6O   $��	0 0 0 7.5q�6c   �� 5#      $��Номер цеха:��6    $��	0 0 0 7.5q�63   �� 5$      $D��>Минимальная стоимость для агента:��6    $
��Wrap=�6I   $��	0 0 0 7.5q�6]   �� 5%      $��Тип продукта:��6    $��	0 0 0 7.5q�65   5&      �� 5'      $��1��6   .+�5(      �� -   5        $��	TitleTBox��5(      $��0 0 0 5q�6F   $
��Left=�6W   $	��140��6r   ��6/   �� *Title+6r   �� 5)      -   5        $��ArticleTBox��5)      $��
0 0 0 39.5q�6P   $
��Left=�6d   $��65��6   $	��145��6�   ��61   �� *ArticleNumber+6�   �� 5*      -   5        $��PersonCountTBox��5*      $��0 0 0 5q�6\   $
��Left=�6n   $��25��6�   ��65   �� *ProductionPersonCount+6�   �� 5+      -   5        $��WorkshopNumberTBox��5+      $��0 0 0 23q�6b   $
��Left=�6t   $��25��6�   ��68   �� *ProductionWorkshopNumber+6�   �� 5,      -   5        $��MinCostTBox��5,      $��0 0 0 5q�6R   $
��Left=�6d   $��65��6   ��61   �� *MinCostForAgent+6   �� 5-      -   5        $��ProductTypeCBox��5.      $��0 0 0 5q�5-      $
��Left=�61   $��95��6L    �� SelectedValuePath$ Id��5/       �� DisplayMemberPath$ Title��50      51      52      53      54      �� 55   
   $��1��6   $��10q�6!   ._�56      �� .+�57      �� $��Описание:��6   $��0 0 0 7q�6-   �� 58      -   5        $��DescriptionTBox��58      $	��144��6N    �� TextWrapping$
 Wrap=�6^   ��61   �� *Description+6t   59      5:      �� 5;   
   $��1��6   $��2��6   $��10q�62   ._�5<      �  5=      �� 5>      $
��Auto �6$   �� 5?      $
��Auto �6$   �� 5@      .+�5B      &   System.Windows.Controls.DataGrid  -	   5          Name$ MaterialsDGrid��5B   I   $��0��6   $��90��6(   	   
IsReadOnly$
	 True��67   "
   VerticalScrollBarVisibility$
 Visible=�6b      AutoGenerateColumns$ False��5C         ColumnWidth5  /System.Windows.Controls.DataGridLengthConverter$ * 63      CanUserResizeColumns$ False��6C      CanUserResizeRows$ False��6`      CanUserReorderColumns$ False��6z   $   HorizontalScrollBarVisibility$ Disabled=�6�      HeadersVisibility$ Column=�5D         HorizontalGridLinesBrush �#F5F5F5   VerticalGridLinesBrush �#F5F5F5 � ContextMenu 5E      �� 5F      .@�5G      m� -
   5        $��IncreaseCountMnItem��5G   3   $��+1��6'   6N   m� 5H      -   5        $��DecreaseCountMnItem��5H   3   $��-1��6'   6N   m� 5I      -   5        $��DeleteMaterialMnItem��5I   A   $%��Удалить материал��6'   6]   5J         Columns 5L      0  *System.Windows.Controls.DataGridTextColumn  5M      ,  &System.Windows.Controls.DataGridColumn   Width$
 1.5* 6-      Header$ Название��6:   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6L   �� *Material.Title+  5N      $ Тип��6-    6:   �� *Material.MaterialType.Title+  5O      $ Кол-во��6-    6=   �� *Count+  5P      $ Цена��6-    6;   �� *Material.Cost+5R      �� 5S      $��1��6   
�������$��0 0 0 1q�6=     5T      -   5        $ AvailableMaterialsDGrid��5T   :   $��2��6   $
	 True��6(   $ False��5U      $ * 63   $ False��6C   $ False��6`   $ False��6z   $ Disabled=�6�    �#F5F5F5 �#F5F5F5$
 None=�5W       5X      �� 5Y      .@�5Z      m� -   5        $��	AddMnItem��5Z   B   $'��!Добавить материал��6'   6T   5[       5]        5^      $
 1.5* 6-    6:   �� *Title+  5_       6-   �� *MaterialType.Title+  5`        5a       6-   �� *Cost+5c      5d      5e      �� 5f   
   -   5        $��CloseWindowBtn��5f   K    �� IsCancel$
 True��6   $��3��6!   $��3��61   $
��Auto��6>   $��Отмена��6a   6r   �� 5g   
   -   5        $��SubmitChangesBtn��5g   L    �� 	IsDefault$
 True��6   $��0��6"   $��3��62   $
��Auto��6?   $��Подтвердить��6d   6z   5h      5i      