

import '../../Screens/Category_screens/Fertilizers/fertilizers_category_screen.dart';
import '../../Screens/Category_screens/Fungicides/fungicides_category_screen.dart';
import '../../Screens/Category_screens/Herbicides/herbicides_category_screen.dart';
import '../../Screens/Category_screens/Pesticides/pesticides_category_screen.dart';

final List<Map<String, dynamic>> products = [
  {
    'image': 'assets/Images/Catagory  Thumbnail (4).png',
    'category': const FertilizersCategoryScreen(),
    'sub-category' : [
      {
        'name': 'Organic Fertilizers',
        'image': 'assets/Images/Catagory  Thumbnail (1).png',
        'id' : 452259086632,
      },
      {
        'name': 'NPK Fertilizers',
        'image': 'assets/Images/Catagory  Thumbnail (4).png',
      'id' : 452267147560,
      },
      {
        'name': 'PlantGrowth',
        'image': 'assets/Images/Catagory  Thumbnail (4).png',
        'id' : 456490844456,
      },
      {
        'name': 'Bio Fertilizers',
        'image': 'assets/Images/Catagory  Thumbnail (4).png',
        'id' : 456491073832,
      },
      {
        'name': 'Hydroponics',
        'image': 'assets/Images/Catagory  Thumbnail (4).png',
        'id' : 456491401512,
      },
      {
        'name': 'Other Fertilizers',
        'image': 'assets/Images/Catagory  Thumbnail (4).png',
        'id' : 452259086632,
      }
    ]
  },
  {
    'image': 'assets/Images/Catagory  Thumbnail (8).png',
    'category':  const PesticidesCategoryScreen(),
    'sub-category' : [
      {
        'name': 'Chemical Pesticides',
        'image': 'assets/Images/Catagory  Thumbnail (4).png',
        'id' : 466308530472,
      },
      {
        'name': 'Organic Pesticides',
        'image': 'assets/Images/Catagory  Thumbnail (4).png',
        'id' : 456493007144,
      },
      {
        'name': 'Bio Pesticides',
        'image': 'assets/Images/Catagory  Thumbnail (4).png',
        'id' : 456493302056,
      },
      {
        'name': 'Traps & Lurs',
        'image': 'assets/Images/Catagory  Thumbnail (4).png',
        'id' : 456493826344,
      },
    ]
  },
  {
    'image': 'assets/Images/Catagory  Thumbnail (6).png',
    'category': const FungicidesCategoryScreen(),
    'sub-category' : [
      {
        'name': 'Chemical Fungicides',
        'image': 'assets/Images/Catagory  Thumbnail (4).png',
        'id' : 468300955944,
      },
      {
        'name': 'Organic Fungicides',
        'image': 'assets/Images/Catagory  Thumbnail (4).png',
        'id' : 456494186792,
      },
      {
        'name': 'Bio Fungicides',
        'image': 'assets/Images/Catagory  Thumbnail (4).png',
        'id' : 452268949800,
      },
    ]
  },

  {
    'image': 'assets/Images/1-3.png',
    'category': const InsecticidesCategoryScreen(),// Replace with your asset image path
  },
  {
    'image': 'assets/Images/1-2.png',
    //'category': FertilizerScreen(),// Replace with your asset image path
  },
  {
    'image':
    'assets/Images/view-all-button-.png',
    //'category': FertilizerScreen(),// Replace with your asset image path
  },
  // ... Add more products here
];