import 'package:bai_tap_12_loginapi/Login.dart';
import 'package:bai_tap_12_loginapi/model/infor.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final Infor infor;
  const ProfileScreen({super.key, required this.infor});

  @override
  Widget build(BuildContext context) {
    final fullName = '${infor.firstName} ${infor.lastName}';
    return Scaffold(
      appBar: AppBar(
        title: Text(fullName),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const Login()),
                (route) => false, // xóa stack, quay về login
              );
            }, 
            tooltip: 'Đăng xuất',
          ),
        ],
      ),

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0f172a), Color(0xFF1e293b)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 110,
                          height: 110,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: const LinearGradient(
                              colors: [Color(0xFF22d3ee), Color(0xFF3b82f6)],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.35),
                                blurRadius: 16,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                        ),
                        CircleAvatar(
                          radius: 48,
                          backgroundImage: NetworkImage(infor.image),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Text(
                      fullName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      infor.email,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 10,
                      runSpacing: 8,
                      alignment: WrapAlignment.center,
                      children: [
                        _buildChip(Icons.phone, infor.phone),
                        _buildChip(Icons.cake, '${infor.age} tuổi'),
                        _buildChip(Icons.person, infor.gender),
                        _buildChip(Icons.school, infor.university),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              _infoCard(
                title: 'Địa chỉ',
                lines: [
                  infor.address.address,
                  '${infor.address.city}, ${infor.address.stateCode}',
                  infor.address.country,
                ],
              ),
              const SizedBox(height: 12),
              _infoCard(
                title: 'Tài khoản',
                lines: [
                  'Username: ${infor.username}',
                  'Email: ${infor.email}',
                  'IP: ${infor.ip}',
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoCard({required String title, required List<String> lines}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.06),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withOpacity(0.12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          ...lines.map(
            (line) => Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                line,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.85),
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChip(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: Colors.white),
          const SizedBox(width: 6),
          Text(text, style: const TextStyle(color: Colors.white, fontSize: 13)),
        ],
      ),
    );
  }
}
