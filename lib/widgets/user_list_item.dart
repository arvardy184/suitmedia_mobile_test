import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:suitmedia_mobile_test/config/app_themes.dart';
import 'package:suitmedia_mobile_test/data/models/user_model.dart';

class UserListItem extends StatelessWidget {
 final User user;
 final bool isSelected; 
 final VoidCallback onTap;

 const UserListItem({
   super.key,
   required this.user,
   required this.isSelected,
   required this.onTap,
 });

 @override
 Widget build(BuildContext context) {
   return Column(
     children: [
       ListTile(
         leading: CircleAvatar(
           radius: 48.0,
           backgroundImage: CachedNetworkImageProvider(user.avatar),
         ),
         title: Text(
           '${user.firstName} ${user.lastName}',
         ),
         titleTextStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
           fontWeight: FontWeight.w700,
           color: AppThemes.listName,
         ),
         subtitle: Text(
           user.email.toUpperCase(),
           style: Theme.of(context).textTheme.bodySmall!.copyWith(
             color: AppThemes.subListName,
             fontWeight: FontWeight.w500,
           ),
         ),
         contentPadding: EdgeInsets.zero,
         onTap: onTap,
         selected: isSelected,
       ),
       const Divider(thickness: 0.5),
     ],
   );
 }
}