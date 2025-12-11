import 'package:flutter/material.dart';

class Baitap2 extends StatelessWidget {
  const Baitap2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: mybody());
  }

  Widget mybody() {
    return SingleChildScrollView(
      child: Column(
        children: [block1(), block2(), block3(), block4(), block5(), block3()],
      ),
    );
  }

  Widget block1() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://img.pikbest.com/back_our/bg/20190617/d57f484103838ae914b5372eb8d76aa1.png!w700wp',
            ),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'XML và ứng dụng - Nhóm 1',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          '2025-2026.1.TIN4583.001',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    Text(
                      '58 học viên',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_horiz, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget block2() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://img.pikbest.com/back_our/bg/20190617/d57f484103838ae914b5372eb8d76aa1.png!w700wp',
            ),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lập trình Web - Nhóm 3',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          '2025-2026.1.TIN4583.002',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    Text(
                      '50 học viên',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_horiz, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget block3() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://img.pikbest.com/back_our/bg/20190617/d57f484103838ae914b5372eb8d76aa1.png!w700wp',
            ),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lập trình cho các thiết bị di động - Nhóm 3',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          '2025-2026.1.TIN4503.003',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    Text(
                      '53 học viên',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_horiz, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget block4() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://img.pikbest.com/back_our/bg/20190617/d57f484103838ae914b5372eb8d76aa1.png!w700wp',
            ),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lập trình ứng dụng cho Desktop - Nhóm 2',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          '2025-2026.1.TIN4502.002',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    Text(
                      '47 học viên',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_horiz, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget block5() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://img.pikbest.com/back_our/bg/20190617/d57f484103838ae914b5372eb8d76aa1.png!w700wp',
            ),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'XML và ứng dụng - Nhóm 4',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          '2025-2026.1.TIN4583.004',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    Text(
                      '55 học viên',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_horiz, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
