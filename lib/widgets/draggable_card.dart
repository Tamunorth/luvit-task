import 'package:flutter/material.dart';
import 'package:luvit_task/generated/assets.dart';
import 'package:luvit_task/widgets/custom_chip.dart';
import 'package:svg_flutter/svg.dart';

import 'gap.dart';

class DragableCard extends StatefulWidget {
  const DragableCard({
    super.key,
    required this.images,
    this.onDragStarted,
    this.onDragCompleted,
    required this.bottomWidget,
  });

  final (List, Widget) images;

  final Widget bottomWidget;
  final VoidCallback? onDragStarted;
  final Function(DraggableDetails)? onDragCompleted;

  @override
  State<DragableCard> createState() => _DragableCardState();
}

class _DragableCardState extends State<DragableCard> {
  int _currentIndex = 1;

  List images = [];

  @override
  Widget build(BuildContext context) {
    images = [
      ...widget.images.$1,
      widget.images.$1.last,
      widget.images.$1.last
    ];

    return Draggable(
      data: widget.images,
      onDragStarted: widget.onDragStarted,
      onDragEnd: widget.onDragCompleted,
      affinity: Axis.vertical,
      childWhenDragging: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              images[_currentIndex],
            ),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Theme.of(context).colorScheme.outline,
          ),
        ),
      ),
      feedback: Container(
        width: MediaQuery.sizeOf(context).width * 0.9,
        height: MediaQuery.sizeOf(context).height * 0.7,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              images[_currentIndex],
            ),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              images[_currentIndex],
            ),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Theme.of(context).hintColor, width: 1),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(15),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      const Color(0xff000000).withOpacity(0.9),
                      Colors.transparent,
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: List.generate(
                      images.length,
                      (index) => Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _currentIndex = index;
                            });
                          },
                          child: SizedBox(
                            height: 10,
                            child: Center(
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 500),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 2),
                                height: 4,
                                decoration: BoxDecoration(
                                  color: _currentIndex == index
                                      ? Theme.of(context).primaryColor
                                      : Theme.of(context).colorScheme.tertiary,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 5,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        border: Border.all(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .outline,
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                              Assets.assetsStarIconGrey),
                                          const Gap.w(5),
                                          Text(
                                            '29,930',
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
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '잭과분홍콩나물',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 28,
                                          ),
                                    ),
                                    const Gap.w(10),
                                    const Text(
                                      '25',
                                      style: TextStyle(
                                        fontSize: 24,
                                      ),
                                    )
                                  ],
                                ),
                                if (_currentIndex == 0)
                                  const Text('서울 · 2km 거리에 있음')
                                else if (_currentIndex == 1)
                                  const Text(
                                    '서로 아껴주고 힘이 되어줄 사람 찾아요 선릉으로 직장 다니고 있고 여행 좋아해요 이상한 이야기하시는 분 바로 차단입니다',
                                    style: TextStyle(fontSize: 15),
                                  )
                                else
                                  const ChipsList(),
                              ],
                            ),
                          ),
                          SvgPicture.asset(Assets.assetsLoveIcon),
                        ],
                      ),
                      const Gap.h(24),
                      const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChipsList extends StatefulWidget {
  const ChipsList({super.key});

  @override
  State<ChipsList> createState() => _ChipsListState();
}

class _ChipsListState extends State<ChipsList> {
  List<String> availableChips = [
    '💖 진지한 연애를 찾는 중',
    '🍸 전혀 안 함',
    '🚬 비흡연',
    '💪🏻 매일 1시간 이상',
    '🤝 만나는 걸 좋아함',
    'INFP'
  ];
  List<String> selectedHastagChips = [
    '💖 진지한 연애를 찾는 중',
  ];
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(
        availableChips.length,
        (index) => CustomChip(
          title: availableChips[index],
          selected: selectedHastagChips.contains(availableChips[index]),
          onTap: () {
            if (selectedHastagChips.contains(availableChips[index])) {
              setState(() {
                selectedHastagChips.remove(availableChips[index]);
              });
              return;
            }
            setState(() {
              selectedHastagChips.add(availableChips[index]);
            });
          },
        ),
      ),
    );
  }
}
