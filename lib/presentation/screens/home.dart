import 'package:flutter/material.dart';
import 'package:messhubapp/presentation/widgets/utilities.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const Color _background = Color(0xFF0D1524);
  static const Color _card = Color(0xFF192235);
  static const Color _primary = Color(0xFF1688BC);
  static const Color _primaryDark = Color(0xFF126D98);

  static const Color _white = Color(0xFFF5F7FA);
  static const Color _rating = Color(0xFF2B9BC9);

  final List<String> _mealTypes = ['Tiffin', 'Lunch', 'Dinner'];

  final List<bool> _mealSelected = [false, true, false];

  final List<String> _preferences = ['Veg', 'Non-Veg', 'Diet'];

  String _selectedPreference = 'Veg';

  final List<String> _navLabels = ['Home', 'Saved', 'History', 'Profile'];

  final List<IconData> _navIcons = [
    Icons.home_rounded,
    Icons.bookmark_rounded,
    Icons.history_rounded,
    Icons.person_rounded,
  ];

  final List<Map<String, dynamic>> _messList = [
    {
      'name': 'Green Bowl Mess',
      'rating': 4.8,
      'distance': '1.2 km',
      'type': 'Veg',
      'price': '₹180 / meal',
      'time': 'Open till 10:30 PM',
      'color': Color(0xFF18A76C),
    },
    {
      'name': 'Royal Spice',
      'rating': 4.6,
      'distance': '2.4 km',
      'type': 'Non-Veg',
      'price': '₹220 / meal',
      'time': 'Open till 11:00 PM',
      'color': Color(0xFFE84B2B),
    },
    {
      'name': 'Lite Diet Hub',
      'rating': 4.9,
      'distance': '0.9 km',
      'type': 'Diet',
      'price': '₹160 / meal',
      'time': 'Open till 9:30 PM',
      'color': Color(0xFF5368C9),
    },
    {
      'name': 'Curry Corner',
      'rating': 4.5,
      'distance': '3.1 km',
      'type': 'Veg',
      'price': '₹200 / meal',
      'time': 'Open till 10:00 PM',
      'color': Color(0xFF3E9088),
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screens = [
      _buildHomeTab(size),
      _buildPlaceholderTab('Saved Mess Details'),
      _buildPlaceholderTab('Current History'),
      _buildPlaceholderTab('Profile'),
    ];

    return Scaffold(
      backgroundColor: _background,

      bottomNavigationBar: _buildBottomNavigation(),

      body: IndexedStack(index: _selectedIndex, children: screens),
    );
  }

  Widget _buildBottomNavigation() {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        color: Color(0xFF0D1524),
        border: Border(top: BorderSide(color: Color(0xFF26334A), width: 1)),
      ),
      child: Row(
        children: List.generate(_navLabels.length, (index) {
          final selected = _selectedIndex == index;

          return Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Divider(color: selected ? _primary : Colors.transparent),
                  Spacer(),
                  Icon(
                    _navIcons[index],
                    size: 25,
                    color: selected ? _primary : Colors.white.withOpacity(0.35),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    _navLabels[index],
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                      color: selected
                          ? _primary
                          : Colors.white.withOpacity(0.35),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildHomeTab(Size size) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            height10,

            const Text(
              'Discover your favorite meal',
              style: TextStyle(
                fontSize: 27,
                height: 1.15,
                fontWeight: FontWeight.w800,
                color: _white,
              ),
            ),
            height35,
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
              decoration: BoxDecoration(
                color: const Color(0xFF20364A),
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: const Color(0xFF4384B4), width: 1.3),
              ),
              child: Row(
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.04),
                      borderRadius: BorderRadius.circular(21),
                    ),
                    child: const Icon(
                      Icons.location_on_rounded,
                      color: Colors.white,
                      size: 27,
                    ),
                  ),

                  width15,

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Current location',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.55),
                            fontSize: 14,
                          ),
                        ),

                        height5,

                        const Text(
                          'Triprayar, Valapad',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Colors.white.withValues(alpha: 0.75),
                    size: 28,
                  ),
                ],
              ),
            ),

            height25,

            Container(
              height: 55,
              decoration: BoxDecoration(
                color: const Color(0xFF111A2A),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFF36445B), width: 1.2),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 16),

                  const Icon(
                    Icons.search_rounded,
                    color: Color(0xFF778398),
                    size: 31,
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: TextField(
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                      decoration: InputDecoration(
                        hintText: 'Search mess, cuisine, or location',
                        hintStyle: TextStyle(
                          color: Colors.white.withOpacity(0.40),
                          fontSize: 16,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),

                  width15,
                ],
              ),
            ),
            height25,
            const Text(
              'Meal type',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),

            height10,

            Row(
              children: List.generate(_mealTypes.length, (index) {
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: index == _mealTypes.length - 1 ? 0 : 15,
                    ),
                    child: _buildMealButton(index, size.width / 3.2),
                  ),
                );
              }),
            ),

            height25,

            const Text(
              'Preferences',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),

            height10,

            Row(
              children: _preferences.map((preference) {
                final selected = _selectedPreference == preference;

                return Padding(
                  padding: const EdgeInsets.only(right: 14),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedPreference = preference;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 180),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: selected
                            ? _primaryDark
                            : const Color(0xFF222C3D),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: selected ? _primary : const Color(0xFF39465A),
                          width: 1.2,
                        ),
                      ),
                      child: Text(
                        preference,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: selected
                              ? Colors.white
                              : Colors.white.withOpacity(0.75),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            height25,
            const Text(
              'Popular near you',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
            height10,

            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _messList.length,
              separatorBuilder: (_, __) => const SizedBox(height: 22),
              itemBuilder: (context, index) {
                return _buildMessCard(_messList[index]);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMealButton(int index, double width) {
    final selected = _mealSelected[index];
    final meal = _mealTypes[index];

    return GestureDetector(
      onTap: () {
        setState(() {
          _mealSelected[index] = !_mealSelected[index];
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        height: 40,
        width: width,
        decoration: BoxDecoration(
          color: selected ? _primary : const Color(0xFF283348),
          borderRadius: BorderRadius.circular(17),
          border: Border.all(
            color: selected ? const Color(0xFF2698CD) : const Color(0xFF435069),
            width: 1.2,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (selected && meal == 'Lunch')
              const Icon(Icons.wb_sunny_rounded, color: Colors.white, size: 18)
            else if (selected && meal == 'Tiffin')
              const Icon(
                Icons.wb_twilight_rounded,
                color: Colors.white,
                size: 18,
              )
            else if (selected && meal == 'Dinner')
              const Icon(Icons.nightlight_round, color: Colors.white, size: 18)
            else
              Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.75),
                    width: 2,
                  ),
                ),
              ),

            const SizedBox(width: 10),

            Flexible(
              child: Text(
                meal,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: selected
                      ? Colors.white
                      : Colors.white.withOpacity(0.75),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessCard(Map<String, dynamic> mess) {
    final bg = mess['color'] as Color;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: _card,
        borderRadius: BorderRadius.circular(23),
        border: Border.all(color: const Color(0xFF37445A), width: 1.2),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final imageSize = constraints.maxWidth > 550 ? 150.0 : 100.0;

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: imageSize,
                height: imageSize,
                decoration: BoxDecoration(
                  color: bg,
                  borderRadius: BorderRadius.circular(21),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [bg, bg.withValues(alpha: 0.75)],
                  ),
                ),
              ),
              width15,
              Expanded(
                child: SizedBox(
                  height: imageSize,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              mess['name'],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                              ),
                            ),
                          ),

                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 7,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF164361),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: const Color(0xFF287DA8),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.star_rounded,
                                  color: _rating,
                                  size: 17,
                                ),
                                const SizedBox(width: 3),
                                Text(
                                  mess['rating'].toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      Text(
                        mess['type'],
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white.withValues(alpha: 0.65),
                        ),
                      ),

                      // PRICE + MENU BUTTON
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              mess['price'],
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                              ),
                            ),
                          ),

                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _primary,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              minimumSize: const Size(100, 30),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: const Text(
                              'View menu',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  // ============================================================
  // PLACEHOLDER TABS
  // ============================================================

  Widget _buildPlaceholderTab(String title) {
    return Container(
      color: _background,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.construction_rounded, size: 54, color: _primary),

            const SizedBox(height: 16),

            Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Screen content will be added soon.',
              style: TextStyle(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}
