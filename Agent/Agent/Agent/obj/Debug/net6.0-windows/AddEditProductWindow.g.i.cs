﻿#pragma checksum "..\..\..\AddEditProductWindow.xaml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "7C7AAE1C2E67409FD1EABA760ECD4D87D79A46FB"
//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан программой.
//     Исполняемая версия:4.0.30319.42000
//
//     Изменения в этом файле могут привести к неправильной работе и будут потеряны в случае
//     повторной генерации кода.
// </auto-generated>
//------------------------------------------------------------------------------

using Agent;
using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Controls.Ribbon;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;


namespace Agent {
    
    
    /// <summary>
    /// AddEditProductWindow
    /// </summary>
    public partial class AddEditProductWindow : System.Windows.Window, System.Windows.Markup.IComponentConnector {
        
        
        #line 46 "..\..\..\AddEditProductWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox ProductTypeCBox;
        
        #line default
        #line hidden
        
        
        #line 66 "..\..\..\AddEditProductWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.DataGrid MaterialsDGrid;
        
        #line default
        #line hidden
        
        
        #line 71 "..\..\..\AddEditProductWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.MenuItem IncreaseCountMnItem;
        
        #line default
        #line hidden
        
        
        #line 72 "..\..\..\AddEditProductWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.MenuItem DecreaseCountMnItem;
        
        #line default
        #line hidden
        
        
        #line 73 "..\..\..\AddEditProductWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.MenuItem DeleteMaterialMnItem;
        
        #line default
        #line hidden
        
        
        #line 84 "..\..\..\AddEditProductWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.DataGrid AvailableMaterialsDGrid;
        
        #line default
        #line hidden
        
        
        #line 90 "..\..\..\AddEditProductWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.MenuItem AddMnItem;
        
        #line default
        #line hidden
        
        
        #line 102 "..\..\..\AddEditProductWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button CloseWindowBtn;
        
        #line default
        #line hidden
        
        
        #line 103 "..\..\..\AddEditProductWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button SubmitChangesBtn;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "6.0.4.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/Agent;component/addeditproductwindow.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\..\AddEditProductWindow.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "6.0.4.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            
            #line 14 "..\..\..\AddEditProductWindow.xaml"
            ((Agent.AddEditProductWindow)(target)).Closed += new System.EventHandler(this.Window_Closed);
            
            #line default
            #line hidden
            return;
            case 2:
            this.ProductTypeCBox = ((System.Windows.Controls.ComboBox)(target));
            return;
            case 3:
            this.MaterialsDGrid = ((System.Windows.Controls.DataGrid)(target));
            return;
            case 4:
            this.IncreaseCountMnItem = ((System.Windows.Controls.MenuItem)(target));
            
            #line 71 "..\..\..\AddEditProductWindow.xaml"
            this.IncreaseCountMnItem.Click += new System.Windows.RoutedEventHandler(this.IncreaseCountMnItem_Click);
            
            #line default
            #line hidden
            return;
            case 5:
            this.DecreaseCountMnItem = ((System.Windows.Controls.MenuItem)(target));
            
            #line 72 "..\..\..\AddEditProductWindow.xaml"
            this.DecreaseCountMnItem.Click += new System.Windows.RoutedEventHandler(this.DecreaseCountMnItem_Click);
            
            #line default
            #line hidden
            return;
            case 6:
            this.DeleteMaterialMnItem = ((System.Windows.Controls.MenuItem)(target));
            
            #line 73 "..\..\..\AddEditProductWindow.xaml"
            this.DeleteMaterialMnItem.Click += new System.Windows.RoutedEventHandler(this.DeleteMaterialMnItem_Click);
            
            #line default
            #line hidden
            return;
            case 7:
            this.AvailableMaterialsDGrid = ((System.Windows.Controls.DataGrid)(target));
            
            #line 87 "..\..\..\AddEditProductWindow.xaml"
            this.AvailableMaterialsDGrid.MouseDoubleClick += new System.Windows.Input.MouseButtonEventHandler(this.AvailableMaterialsDGrid_MouseDoubleClick);
            
            #line default
            #line hidden
            return;
            case 8:
            this.AddMnItem = ((System.Windows.Controls.MenuItem)(target));
            
            #line 90 "..\..\..\AddEditProductWindow.xaml"
            this.AddMnItem.Click += new System.Windows.RoutedEventHandler(this.AddMnItem_Click);
            
            #line default
            #line hidden
            return;
            case 9:
            this.CloseWindowBtn = ((System.Windows.Controls.Button)(target));
            
            #line 102 "..\..\..\AddEditProductWindow.xaml"
            this.CloseWindowBtn.Click += new System.Windows.RoutedEventHandler(this.CloseWindowBtn_Click);
            
            #line default
            #line hidden
            return;
            case 10:
            this.SubmitChangesBtn = ((System.Windows.Controls.Button)(target));
            
            #line 103 "..\..\..\AddEditProductWindow.xaml"
            this.SubmitChangesBtn.Click += new System.Windows.RoutedEventHandler(this.SubmitChangesBtn_Click);
            
            #line default
            #line hidden
            return;
            }
            this._contentLoaded = true;
        }
    }
}

