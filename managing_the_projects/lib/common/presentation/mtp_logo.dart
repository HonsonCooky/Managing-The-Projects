import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:managing_the_projects/common/service/mtp_alias.dart';

class MtpLogo extends StatelessWidget with MtpAliases {
  const MtpLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return NeumorphicIcon(
      Icons.backup_table,
      size: 200,
      style: const NeumorphicStyle(depth: 3),
    );
  }
}
