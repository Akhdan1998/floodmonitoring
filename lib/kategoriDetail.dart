import 'package:flutter/material.dart';

import 'model.dart';

class KategoriDetail extends StatefulWidget {
  late final Kategori? kategori;

  KategoriDetail(this.kategori);

  @override
  State<KategoriDetail> createState() => _KategoriDetailState();
}

class _KategoriDetailState extends State<KategoriDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 229,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey.shade200,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            widget.kategori!.iconData,
            size: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.kategori!.title ?? '-',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Container(
                height: 50,
                child: (widget.kategori!.id == '3')
                    ? Container(
                        height: 50,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              widget.kategori!.subtitle ?? '-',
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              'Km/Jam',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      )
                    : Text(
                        widget.kategori!.subtitle ?? '-',
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
