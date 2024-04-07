using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace BusinessHomePage
{
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void MenuItem_Click(object sender, RoutedEventArgs e)
        {
            
        }
        private void Image_MouseRightButtonUp(object sender, MouseButtonEventArgs e)
        {
            // Open the context menu
            var image = sender as Image;
            image.ContextMenu.IsOpen = true;
        }

        private void MenuItem_Click_1(object sender, RoutedEventArgs e)
        {

        }
    }
}
