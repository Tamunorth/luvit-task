import 'package:flutter/material.dart';
import 'package:luvit_task/generated/assets.dart';
import 'package:luvit_task/widgets/draggable_card.dart';
import 'package:svg_flutter/svg.dart';

import '../widgets/gap.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController pageCtrl;
  @override
  void initState() {
    super.initState();
    pageCtrl = PageController(
      viewportFraction: 0.9,
      initialPage: 1,
    );
  }

  @override
  void dispose() {
    pageCtrl.dispose();
    super.dispose();
  }

  List items = <(List, Widget)>[
    (
      [
        Assets.assetsMain01,
        Assets.assetsMain02,
        Assets.assetsMain03,
      ],
      const Text('서울 · 2km 거리에 있음'),
    ),
    (
      [
        Assets.assetsMain01,
        Assets.assetsMain02,
        Assets.assetsMain03,
      ],
      const Text(
        '서로 아껴주고 힘이 되어줄 사람 찾아요 선릉으로 직장 다니고 있고 여행 좋아해요 이상한 이야기하시는 분 바로 차단입니다',
        style: TextStyle(fontSize: 15),
      ),
    ),
    (
      [
        Assets.assetsMain01,
        Assets.assetsMain02,
        Assets.assetsMain03,
      ],
      const ChipsList(),
    ),
  ];

  bool showDragTarget = false;

  // List<Items> cards = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              const Gap.h(kToolbarHeight + 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          SvgPicture.asset(Assets.assetsLocation),
                          const Gap.w(10),
                          const Expanded(
                            child: Text(
                              '목이길어슬픈기린님의 새로운 스팟',
                              style: TextStyle(fontSize: 14),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color: Theme.of(context).colorScheme.outline,
                            ),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(Assets.assetsStarIcon),
                              const Gap.w(5),
                              Text(
                                '323,233',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        SvgPicture.asset(Assets.assetsBellIcon),
                      ],
                    ),
                  ],
                ),
              ),
              const Gap.h(20),
              Expanded(
                child: items.isEmpty
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '추천 드릴 친구들을 준비 중이에요',
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                          ),
                          const Text(
                            '매일 새로운 친구들을 소개시켜드려요',
                            style: TextStyle(color: Color(0xffADADAD)),
                          ),
                        ],
                      )
                    : PageView.builder(
                        controller: pageCtrl,
                        itemCount: items.length,
                        itemBuilder: (BuildContext context, int index) {
                          return DragableCard(
                            images: items[index],
                            bottomWidget: items[index].$2,
                            onDragCompleted: (details) {
                              setState(() {
                                showDragTarget = false;
                              });
                            },
                            onDragStarted: () {
                              setState(() {
                                showDragTarget = true;
                              });
                            },
                          );
                        },
                      ),
              ),
              const Gap.h(44),
            ],
          ),
          if (showDragTarget)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: DragTarget(onAcceptWithDetails: (details) {
                setState(() {
                  items.removeWhere((element) => element == details.data);
                });
              }, builder: (
                BuildContext context,
                List<dynamic> accepted,
                List<dynamic> rejected,
              ) {
                return Container(
                  width: 200,
                  height: MediaQuery.sizeOf(context).height * 0.4,
                  color: Colors.transparent,
                  child: const Center(
                    child: Text(''),
                  ),
                );
              }),
            ),
        ],
      ),
    );
  }
}
