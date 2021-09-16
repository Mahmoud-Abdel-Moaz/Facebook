import 'package:facebook/models/post_model.dart';
import 'package:facebook/shared/cubit/cubit.dart';
import 'package:facebook/shared/cubit/states.dart';
import 'package:facebook/shared/data/data.dart';
import 'package:facebook/widgets/post_container.dart';
import 'package:facebook/widgets/show_stories.dart';
import 'package:facebook/widgets/write_post_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenDesktop extends StatelessWidget {

  const HomeScreenDesktop({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {
        Future.delayed(const Duration(seconds: 2), () {
          AppCubit.get(context).fetchData();
        });
      },
      builder: (context, state) {
        AppCubit.get(context).updateData();
        List<Post> fetchedPosts=AppCubit.get(context).facePosts;
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: WritePostContainer(currantUser: currentUser,),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height:5.0),
            ),
            SliverToBoxAdapter(
              child:ShowStories(currentUser:currentUser,stories: stories,),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context,index){
                    return PostContainer(post: fetchedPosts[index]);
                  },
                  childCount: fetchedPosts.length,
                )
            ),
          ],
        );
      },
    );
  }
}