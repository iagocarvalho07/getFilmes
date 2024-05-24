import 'package:flutter/material.dart';

class MoviesCard extends StatelessWidget {
  const MoviesCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      width: 158,
      height: 280,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  clipBehavior: Clip.antiAlias,
                  child: Image.network(
                    "https://cinemacomrapadura.com.br/imagens/2018/06/20180609-ant-man-and-the-wasp-408x615.jpeg",
                    width: 148,
                    height: 184,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                "Home Formiga",
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                "2020",
                style:
                    const TextStyle(fontSize: 11, fontWeight: FontWeight.w300),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              )
            ],
          ),
          Positioned(
            bottom: 70,
            right: -3,
            child: Material(
              elevation: 5,
              shape: CircleBorder(),
              clipBehavior: Clip.antiAlias,
              child: SizedBox(
                height: 30,
                child: IconButton(
                  iconSize: 15,
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
