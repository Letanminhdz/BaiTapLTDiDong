import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile UI',
      // Thêm theme background màu xám nhạt cho toàn bộ màn hình web
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFE5E7EB)),
      home: const MobileWrapper(), // Gọi lớp Wrapper mới
    );
  }
}

class MobileWrapper extends StatelessWidget {
  const MobileWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 390,
          height: 844,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
            // ĐÃ XÓA dòng border: Border.all(...) ở đây để mất 2 thanh xám
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                spreadRadius: 5,
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: const ScaffoldScreen(),
        ),
      ),
    );
  }
}

// Lớp giao diện chính của bạn (giữ nguyên, chỉ bỏ bớt padding thừa nếu cần)
class ScaffoldScreen extends StatelessWidget {
  const ScaffoldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              TopBar(),
              SizedBox(height: 32),
              ProfileHeader(),
              SizedBox(height: 24),
              StatsCard(),
              SizedBox(height: 24),
              AboutMeSection(),
              SizedBox(height: 24),
              SkillsAndExpertiseSection(),
              SizedBox(height: 24),
              FeaturedProjectsSection(),
              SizedBox(height: 24),
              ContactCard(),
              SizedBox(
                height: 24,
              ), // Thêm khoảng trống dưới cùng để cuộn không bị sát mép
            ],
          ),
        ),
      ),
    );
  }
}

// 1. TopBar (Row: MainAxisAlignment.spaceBetween)
class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // IconButton (Back: 42x42 | Radius 12 | Border #E2E8F0)
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFE2E8F0)),
          ),
          child: const Center(
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 18,
              color: Colors.black,
            ),
          ),
        ),
        // Text ('Profile' | 18px Bold | #0F172A)
        const Text(
          'Profile',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w900,
            color: Color(0xFF0F172A),
          ),
        ),
        // IconButton (Share: 42x42 | Radius 12 | Border #E2E8F0)
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFE2E8F0)),
          ),
          child: const Center(
            child: Icon(Icons.share_outlined, size: 18, color: Colors.black),
          ),
        ),
      ],
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 140,
            height: 140,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 140,
                  height: 140,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Color(0xFFFFB088), Color(0xFFFF8080)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
                Container(
                  width: 132,
                  height: 132,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
                ClipOval(
                  child: Image.asset(
                    'images/avt.jpg', // Giữ nguyên đường dẫn ảnh local của bạn
                    width: 124,
                    height: 124,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 4,
                  right: 4,
                  child: Container(
                    width: 28,
                    height: 28,
                    decoration: const BoxDecoration(
                      color: Color(0xFF0284C7),
                      shape: BoxShape.circle,
                      border: Border.fromBorderSide(
                        BorderSide(color: Colors.white, width: 2),
                      ),
                    ),
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Đã chỉnh sửa phần chữ Alex Rivers in đậm hơn
          const Text(
            'Alex Rivers',
            style: TextStyle(
              fontSize: 24,
              fontWeight:
                  FontWeight.w900, // Đổi thành w900 (Black) để đậm nhất có thể
              color: Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Lead Mobile Engineer',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Color(0xFF64748B),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFF1F5F9),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(
                  Icons.location_on_outlined,
                  size: 14,
                  color: Color(0xFF475569),
                ),
                SizedBox(width: 4),
                Text(
                  'Tokyo, Japan',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF475569),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 3. Stats Card (Container > Row: Radius 20 | BoxShadow 0 8 18)
class StatsCard extends StatelessWidget {
  const StatsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Column (148 Projects)
          _buildStatColumn('148', 'Projects', const Color(0xFF0F172A)),
          // VerticalDivider (1x28 | #E2E8F0)
          Container(height: 28, width: 1, color: const Color(0xFFE2E8F0)),
          // Column (9 Yrs Experience)
          _buildStatColumn(
            '9 Yrs',
            'Experience',
            const Color.fromARGB(255, 0, 0, 0),
          ), // Màu đỏ hồng theo thiết kế
          // VerticalDivider (1x28 | #E2E8F0)
          Container(height: 28, width: 1, color: const Color(0xFFE2E8F0)),
          // Column (4.9 ★ Rating)
          _buildStatColumn('4.9 ★', 'Rating', const Color(0xFFEAB308)),
        ],
      ),
    );
  }

  Widget _buildStatColumn(String val, String label, Color valColor) {
    return Column(
      children: [
        Text(
          val,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: valColor,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Color(0xFF64748B)),
        ),
      ],
    );
  }
}

// 4. About Me (Column)
class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        // Heading ('About Me' | 17px Bold)
        Text(
          'About Me',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w900,
            color: Color(0xFF0F172A),
          ),
        ),
        SizedBox(height: 8),
        // Body Paragraph (14px Regular | Line-height 21px)
        Text(
          'Passionate Lead Mobile Engineer specialized in Flutter, Dart, and building high-performance cross-platform applications. Focused on elegant...',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Color(0xFF475569),
            height: 21 / 14, // Line-height / font-size
          ),
        ),
      ],
    );
  }
}

// 5. Skills & Expertise (Column)
class SkillsAndExpertiseSection extends StatelessWidget {
  const SkillsAndExpertiseSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Heading ('Skills & Expertise' | 17px Bold)
        const Text(
          'Skills & Expertise',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0F172A),
          ),
        ),
        const SizedBox(height: 12),
        // Row 1 (Flutter, Dart, Clean Arch)
        Row(
          children: [
            _buildSkillChip(
              'Flutter',
              Icons.flutter_dash,
              const Color(0xFFE0F2FE),
              const Color(0xFF0284C7),
            ),
            const SizedBox(width: 8),
            _buildSkillChip(
              'Dart',
              Icons.code,
              const Color(0xFFDCFCE7),
              const Color(0xFF16A34A),
            ),
            const SizedBox(width: 8),
            _buildSkillChip(
              'Clean Arch',
              Icons.layers,
              const Color(0xFFFCE7F3),
              const Color(0xFFDB2777),
            ),
          ],
        ),
        const SizedBox(height: 8),
        // Row 2 (UI/UX, Firebase)
        Row(
          children: [
            _buildSkillChip(
              'UI/UX',
              Icons.design_services,
              const Color(0xFFF3E8FF),
              const Color(0xFF9333EA),
            ),
            const SizedBox(width: 8),
            _buildSkillChip(
              'Firebase',
              Icons.local_fire_department,
              const Color(0xFFFEF3C7),
              const Color(0xFFD97706),
            ),
          ],
        ),
      ],
    );
  }

  // Skill Chip (Mô phỏng theo cấu trúc: Frame > Vector + Text)
  Widget _buildSkillChip(
    String label,
    IconData icon,
    Color bgColor,
    Color fgColor,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: fgColor),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: fgColor,
            ),
          ),
        ],
      ),
    );
  }
}

// 6. Featured Projects (Row: 2 Expanded Cards)
class FeaturedProjectsSection extends StatelessWidget {
  const FeaturedProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Heading ('Featured Projects' | 17px Bold)
        const Text(
          'Featured Projects',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0F172A),
          ),
        ),
        const SizedBox(height: 12),
        // Row (Expanded Project Cards)
        Row(
          children: [
            // Card (E-Shop Flutter | Radius 16)
            Expanded(
              child: _buildProjectCard(
                'E-Shop Flutter',
                'Mobile App • 2026',
                'images/anh1.jpg',
              ),
            ),
            const SizedBox(width: 12),
            // Card (Crypto Vault | Radius 16)
            Expanded(
              child: _buildProjectCard(
                'Crypto Vault',
                'Finance • Clean Arch',
                'images/anh2.jpg',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildProjectCard(String title, String subtitle, String imageUrl) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image.network
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              imageUrl,
              height: 85,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          // Padding (Content: 10px)
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F172A),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF64748B),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 7. Contact Card (Container > Column: Radius 20 | Shadow 0 4 12)
// 7. Contact Card (Container > Column: Radius 20 | Shadow 0 4 12)
class ContactCard extends StatelessWidget {
  const ContactCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        // Thêm thuộc tính border này để khung viền rõ nét như ảnh 2
        border: Border.all(color: const Color(0xFFE2E8F0), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Row (Contact Information)
          _buildContactRow(
            icon: Icons.alternate_email, // Đổi thành Icon @ giống ảnh 2
            title: 'Contact Information',
            isBold: true,
          ),
          // Divider (1px | #F1F5F9)
          Container(height: 1, color: const Color(0xFFF1F5F9)),
          // Row (alex.rivers@email.com)
          _buildContactRow(
            icon: Icons.email_outlined,
            title: 'alex.rivers@email.com',
            isBold: false,
          ),
          // Divider (1px | #F1F5F9)
          Container(height: 1, color: const Color(0xFFF1F5F9)),
          // Row (+81 (90) 1234-5678)
          _buildContactRow(
            icon: Icons.phone_outlined,
            title: '+81 (90) 1234-5678',
            isBold: false,
          ),
        ],
      ),
    );
  }

  Widget _buildContactRow({
    required IconData icon,
    required String title,
    required bool isBold,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // Bỏ màu nền (color) của hộp chứa Icon để giống ảnh 2
              Container(
                width: 34,
                height: 34,
                alignment: Alignment.center,
                child: Icon(icon, size: 20, color: const Color(0xFF475569)),
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
                  color: const Color(0xFF0F172A),
                ),
              ),
            ],
          ),
          const Icon(Icons.chevron_right, color: Color(0xFF94A3B8), size: 20),
        ],
      ),
    );
  }
}
