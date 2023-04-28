import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import './comic.dart';

enum ListComics { catalog, favorite, reading }

class Comics with ChangeNotifier {
  final List<Comic> _items = [
    Comic(
        id: '1',
        name: 'Ветролом',
        description:
            'Ветролом — драма о юных уличных гонщиках, мечтающих о свободе.',
        imageUrl:
            'https://cover.imglib.info/uploads/cover/wind-breaker/cover/RWDstYRkXMxO_250x350.jpg',
        rusChapters: [
          Chapter(images: [
            'https://img33.imgslib.link//manga/wind-breaker/chapters/74281/WindBreaker_gl0_1.jpg',
          ]),
          Chapter(images: [
            'https://img33.imgslib.link//manga/wind-breaker/chapters/74283/WindBreaker_gl1_1.png',
            'https://img33.imgslib.link//manga/wind-breaker/chapters/74283/WindBreaker_gl1_2.png',
            'https://img33.imgslib.link//manga/wind-breaker/chapters/74283/WindBreaker_gl1_3.png',
            'https://img33.imgslib.link//manga/wind-breaker/chapters/74283/WindBreaker_gl1_4.png'
          ]),
        ],
        engChapters: [
          Chapter(images: [
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-0-prologue/1.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-0-prologue/2.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-0-prologue/3.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-0-prologue/4.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-0-prologue/5.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-0-prologue/6.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-0-prologue/7.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-0-prologue/8.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-0-prologue/9.jpg'
          ]),
          Chapter(images: [
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/1.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/2.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/3.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/4.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/5.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/6.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/7.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/8.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/9.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/10.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/11.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/12.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/13.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/14.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/15.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/16.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/17.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/18.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/19.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/20.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/21.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/22.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/23.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/24.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/25.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/26.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/27.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/28.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/29.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/30.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/31.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/32.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/33.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/34.jpg'
          ])
        ]),
    Comic(
        id: '2',
        name: 'Однажды я стала принцессой',
        description:
            'Когда я открыла глаза, то стала принцессой из романа, который я читала.',
        imageUrl:
            'https://cover.imglib.info/uploads/cover/suddenly-became-a-princess-one-day-/cover/vhfCFony5DTj_250x350.jpg',
        rusChapters: [
          Chapter(images: [
            'https://img33.imgslib.link//manga/suddenly-became-a-princess-one-day-/chapters/615996/001_TT2x.png',
            'https://img33.imgslib.link//manga/suddenly-became-a-princess-one-day-/chapters/615996/002_BDPC.png',
            'https://img33.imgslib.link//manga/suddenly-became-a-princess-one-day-/chapters/615996/003_RWZJ.png',
            'https://img33.imgslib.link//manga/suddenly-became-a-princess-one-day-/chapters/615996/004_yM27.png'
          ]),
          Chapter(images: [
            'https://img33.imgslib.link//manga/suddenly-became-a-princess-one-day-/chapters/615998/001_tjse.png',
            'https://img33.imgslib.link//manga/suddenly-became-a-princess-one-day-/chapters/615998/002_gbVg.png',
            'https://img33.imgslib.link//manga/suddenly-became-a-princess-one-day-/chapters/615998/003_jkeT.png',
            'https://img33.imgslib.link//manga/suddenly-became-a-princess-one-day-/chapters/615998/004_g2uZ.png',
            'https://img33.imgslib.link//manga/suddenly-became-a-princess-one-day-/chapters/615998/005_10rJ.png',
            'https://img33.imgslib.link//manga/suddenly-became-a-princess-one-day-/chapters/615998/006_QLnV.png'
          ]),
        ],
        engChapters: [
          Chapter(images: [
            'https://www.imagemanga.online/aHR0cHM6Ly9pbWctMS5oYXJpbWFuZ2EuY29tL21hbmdhXzYxNDZhYWE2MDU3ODkvY2hhcHRlci0xLzIuanBn/aHR0cHM6Ly9oYXJpbWFuZ2EuY29tL21hbmdhL3doby1tYWRlLW1lLWEtcHJpbmNlc3Mv',
            'https://www.imagemanga.online/aHR0cHM6Ly9pbWctMS5oYXJpbWFuZ2EuY29tL21hbmdhXzYxNDZhYWE2MDU3ODkvY2hhcHRlci0xLzMuanBn/aHR0cHM6Ly9oYXJpbWFuZ2EuY29tL21hbmdhL3doby1tYWRlLW1lLWEtcHJpbmNlc3Mv',
            'https://www.imagemanga.online/aHR0cHM6Ly9pbWctMS5oYXJpbWFuZ2EuY29tL21hbmdhXzYxNDZhYWE2MDU3ODkvY2hhcHRlci0xLzQuanBn/aHR0cHM6Ly9oYXJpbWFuZ2EuY29tL21hbmdhL3doby1tYWRlLW1lLWEtcHJpbmNlc3Mv',
            'https://www.imagemanga.online/aHR0cHM6Ly9pbWctMS5oYXJpbWFuZ2EuY29tL21hbmdhXzYxNDZhYWE2MDU3ODkvY2hhcHRlci0xLzUuanBn/aHR0cHM6Ly9oYXJpbWFuZ2EuY29tL21hbmdhL3doby1tYWRlLW1lLWEtcHJpbmNlc3Mv',
            'https://www.imagemanga.online/aHR0cHM6Ly9pbWctMS5oYXJpbWFuZ2EuY29tL21hbmdhXzYxNDZhYWE2MDU3ODkvY2hhcHRlci0xLzYuanBn/aHR0cHM6Ly9oYXJpbWFuZ2EuY29tL21hbmdhL3doby1tYWRlLW1lLWEtcHJpbmNlc3Mv',
            'https://www.imagemanga.online/aHR0cHM6Ly9pbWctMS5oYXJpbWFuZ2EuY29tL21hbmdhXzYxNDZhYWE2MDU3ODkvY2hhcHRlci0xLzcuanBn/aHR0cHM6Ly9oYXJpbWFuZ2EuY29tL21hbmdhL3doby1tYWRlLW1lLWEtcHJpbmNlc3Mv',
            'https://www.imagemanga.online/aHR0cHM6Ly9pbWctMS5oYXJpbWFuZ2EuY29tL21hbmdhXzYxNDZhYWE2MDU3ODkvY2hhcHRlci0xLzguanBn/aHR0cHM6Ly9oYXJpbWFuZ2EuY29tL21hbmdhL3doby1tYWRlLW1lLWEtcHJpbmNlc3Mv',
            'https://www.imagemanga.online/aHR0cHM6Ly9pbWctMS5oYXJpbWFuZ2EuY29tL21hbmdhXzYxNDZhYWE2MDU3ODkvY2hhcHRlci0xLzkuanBn/aHR0cHM6Ly9oYXJpbWFuZ2EuY29tL21hbmdhL3doby1tYWRlLW1lLWEtcHJpbmNlc3Mv',
            'https://www.imagemanga.online/aHR0cHM6Ly9pbWctMS5oYXJpbWFuZ2EuY29tL21hbmdhXzYxNDZhYWE2MDU3ODkvY2hhcHRlci0xLzEwLmpwZw%3D%3D/aHR0cHM6Ly9oYXJpbWFuZ2EuY29tL21hbmdhL3doby1tYWRlLW1lLWEtcHJpbmNlc3Mv',
            'https://www.imagemanga.online/aHR0cHM6Ly9pbWctMS5oYXJpbWFuZ2EuY29tL21hbmdhXzYxNDZhYWE2MDU3ODkvY2hhcHRlci0xLzExLmpwZw%3D%3D/aHR0cHM6Ly9oYXJpbWFuZ2EuY29tL21hbmdhL3doby1tYWRlLW1lLWEtcHJpbmNlc3Mv'
          ]),
          Chapter(images: [
            'https://www.imagemanga.online/aHR0cHM6Ly9pbWctMS5oYXJpbWFuZ2EuY29tL21hbmdhXzYxNDZhYWE2MDU3ODkvY2hhcHRlci0yLzIuanBn/aHR0cHM6Ly9oYXJpbWFuZ2EuY29tL21hbmdhL3doby1tYWRlLW1lLWEtcHJpbmNlc3Mv',
            'https://www.imagemanga.online/aHR0cHM6Ly9pbWctMS5oYXJpbWFuZ2EuY29tL21hbmdhXzYxNDZhYWE2MDU3ODkvY2hhcHRlci0yLzMuanBn/aHR0cHM6Ly9oYXJpbWFuZ2EuY29tL21hbmdhL3doby1tYWRlLW1lLWEtcHJpbmNlc3Mv',
            'https://www.imagemanga.online/aHR0cHM6Ly9pbWctMS5oYXJpbWFuZ2EuY29tL21hbmdhXzYxNDZhYWE2MDU3ODkvY2hhcHRlci0yLzQuanBn/aHR0cHM6Ly9oYXJpbWFuZ2EuY29tL21hbmdhL3doby1tYWRlLW1lLWEtcHJpbmNlc3Mv',
            'https://www.imagemanga.online/aHR0cHM6Ly9pbWctMS5oYXJpbWFuZ2EuY29tL21hbmdhXzYxNDZhYWE2MDU3ODkvY2hhcHRlci0yLzUuanBn/aHR0cHM6Ly9oYXJpbWFuZ2EuY29tL21hbmdhL3doby1tYWRlLW1lLWEtcHJpbmNlc3Mv',
            'https://www.imagemanga.online/aHR0cHM6Ly9pbWctMS5oYXJpbWFuZ2EuY29tL21hbmdhXzYxNDZhYWE2MDU3ODkvY2hhcHRlci0yLzYuanBn/aHR0cHM6Ly9oYXJpbWFuZ2EuY29tL21hbmdhL3doby1tYWRlLW1lLWEtcHJpbmNlc3Mv',
            'https://www.imagemanga.online/aHR0cHM6Ly9pbWctMS5oYXJpbWFuZ2EuY29tL21hbmdhXzYxNDZhYWE2MDU3ODkvY2hhcHRlci0yLzcuanBn/aHR0cHM6Ly9oYXJpbWFuZ2EuY29tL21hbmdhL3doby1tYWRlLW1lLWEtcHJpbmNlc3Mv',
            'https://www.imagemanga.online/aHR0cHM6Ly9pbWctMS5oYXJpbWFuZ2EuY29tL21hbmdhXzYxNDZhYWE2MDU3ODkvY2hhcHRlci0yLzguanBn/aHR0cHM6Ly9oYXJpbWFuZ2EuY29tL21hbmdhL3doby1tYWRlLW1lLWEtcHJpbmNlc3Mv',
            'https://www.imagemanga.online/aHR0cHM6Ly9pbWctMS5oYXJpbWFuZ2EuY29tL21hbmdhXzYxNDZhYWE2MDU3ODkvY2hhcHRlci0yLzkuanBn/aHR0cHM6Ly9oYXJpbWFuZ2EuY29tL21hbmdhL3doby1tYWRlLW1lLWEtcHJpbmNlc3Mv',
            'https://www.imagemanga.online/aHR0cHM6Ly9pbWctMS5oYXJpbWFuZ2EuY29tL21hbmdhXzYxNDZhYWE2MDU3ODkvY2hhcHRlci0yLzEwLmpwZw%3D%3D/aHR0cHM6Ly9oYXJpbWFuZ2EuY29tL21hbmdhL3doby1tYWRlLW1lLWEtcHJpbmNlc3Mv',
            'https://www.imagemanga.online/aHR0cHM6Ly9pbWctMS5oYXJpbWFuZ2EuY29tL21hbmdhXzYxNDZhYWE2MDU3ODkvY2hhcHRlci0yLzExLmpwZw%3D%3D/aHR0cHM6Ly9oYXJpbWFuZ2EuY29tL21hbmdhL3doby1tYWRlLW1lLWEtcHJpbmNlc3Mv',
            'https://www.imagemanga.online/aHR0cHM6Ly9pbWctMS5oYXJpbWFuZ2EuY29tL21hbmdhXzYxNDZhYWE2MDU3ODkvY2hhcHRlci0yLzEyLmpwZw%3D%3D/aHR0cHM6Ly9oYXJpbWFuZ2EuY29tL21hbmdhL3doby1tYWRlLW1lLWEtcHJpbmNlc3Mv',
            'https://www.imagemanga.online/aHR0cHM6Ly9pbWctMS5oYXJpbWFuZ2EuY29tL21hbmdhXzYxNDZhYWE2MDU3ODkvY2hhcHRlci0yLzEzLmpwZw%3D%3D/aHR0cHM6Ly9oYXJpbWFuZ2EuY29tL21hbmdhL3doby1tYWRlLW1lLWEtcHJpbmNlc3Mv',
            'https://www.imagemanga.online/aHR0cHM6Ly9pbWctMS5oYXJpbWFuZ2EuY29tL21hbmdhXzYxNDZhYWE2MDU3ODkvY2hhcHRlci0yLzE0LmpwZw%3D%3D/aHR0cHM6Ly9oYXJpbWFuZ2EuY29tL21hbmdhL3doby1tYWRlLW1lLWEtcHJpbmNlc3Mv',
            'https://www.imagemanga.online/aHR0cHM6Ly9pbWctMS5oYXJpbWFuZ2EuY29tL21hbmdhXzYxNDZhYWE2MDU3ODkvY2hhcHRlci0yLzE1LmpwZw%3D%3D/aHR0cHM6Ly9oYXJpbWFuZ2EuY29tL21hbmdhL3doby1tYWRlLW1lLWEtcHJpbmNlc3Mv',
            'https://www.imagemanga.online/aHR0cHM6Ly9pbWctMS5oYXJpbWFuZ2EuY29tL21hbmdhXzYxNDZhYWE2MDU3ODkvY2hhcHRlci0yLzE2LmpwZw%3D%3D/aHR0cHM6Ly9oYXJpbWFuZ2EuY29tL21hbmdhL3doby1tYWRlLW1lLWEtcHJpbmNlc3Mv',
            'https://www.imagemanga.online/aHR0cHM6Ly9pbWctMS5oYXJpbWFuZ2EuY29tL21hbmdhXzYxNDZhYWE2MDU3ODkvY2hhcHRlci0yLzE3LmpwZw%3D%3D/aHR0cHM6Ly9oYXJpbWFuZ2EuY29tL21hbmdhL3doby1tYWRlLW1lLWEtcHJpbmNlc3Mv',
          ])
        ]),
    Comic(
        id: '3',
        name: 'Ветролом',
        description:
            'Ветролом — драма о юных уличных гонщиках, мечтающих о свободе.',
        imageUrl:
            'https://cover.imglib.info/uploads/cover/wind-breaker/cover/RWDstYRkXMxO_250x350.jpg',
        rusChapters: [
          Chapter(images: [
            'https://img33.imgslib.link//manga/wind-breaker/chapters/74281/WindBreaker_gl0_1.jpg',
          ]),
          Chapter(images: [
            'https://img33.imgslib.link//manga/wind-breaker/chapters/74283/WindBreaker_gl1_1.png',
            'https://img33.imgslib.link//manga/wind-breaker/chapters/74283/WindBreaker_gl1_2.png',
            'https://img33.imgslib.link//manga/wind-breaker/chapters/74283/WindBreaker_gl1_3.png',
            'https://img33.imgslib.link//manga/wind-breaker/chapters/74283/WindBreaker_gl1_4.png'
          ]),
        ],
        engChapters: [
          Chapter(images: [
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-0-prologue/1.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-0-prologue/2.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-0-prologue/3.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-0-prologue/4.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-0-prologue/5.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-0-prologue/6.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-0-prologue/7.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-0-prologue/8.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-0-prologue/9.jpg'
          ]),
          Chapter(images: [
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/1.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/2.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/3.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/4.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/5.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/6.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/7.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/8.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/9.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/10.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/11.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/12.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/13.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/14.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/15.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/16.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/17.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/18.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/19.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/20.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/21.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/22.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/23.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/24.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/25.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/26.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/27.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/28.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/29.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/30.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/31.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/32.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/33.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/34.jpg'
          ])
        ]),
    Comic(
        id: '4',
        name: 'Однажды я стала принцессой',
        description:
            'Когда я открыла глаза, то стала принцессой из романа, который я читала.',
        imageUrl:
            'https://cover.imglib.info/uploads/cover/suddenly-became-a-princess-one-day-/cover/vhfCFony5DTj_250x350.jpg',
        rusChapters: [
          Chapter(images: [
            'https://img33.imgslib.link//manga/suddenly-became-a-princess-one-day-/chapters/615996/001_TT2x.png',
            'https://img33.imgslib.link//manga/suddenly-became-a-princess-one-day-/chapters/615996/002_BDPC.png',
            'https://img33.imgslib.link//manga/suddenly-became-a-princess-one-day-/chapters/615996/003_RWZJ.png',
            'https://img33.imgslib.link//manga/suddenly-became-a-princess-one-day-/chapters/615996/004_yM27.png'
          ]),
          Chapter(images: [
            'https://img33.imgslib.link//manga/suddenly-became-a-princess-one-day-/chapters/615998/001_tjse.png',
            'https://img33.imgslib.link//manga/suddenly-became-a-princess-one-day-/chapters/615998/002_gbVg.png',
            'https://img33.imgslib.link//manga/suddenly-became-a-princess-one-day-/chapters/615998/003_jkeT.png',
            'https://img33.imgslib.link//manga/suddenly-became-a-princess-one-day-/chapters/615998/004_g2uZ.png',
            'https://img33.imgslib.link//manga/suddenly-became-a-princess-one-day-/chapters/615998/005_10rJ.png',
            'https://img33.imgslib.link//manga/suddenly-became-a-princess-one-day-/chapters/615998/006_QLnV.png'
          ]),
        ],
        engChapters: [
          Chapter(images: [
            'https://www.imagemanga.online/aHR0cHM6Ly9pbWctMS5oYXJpbWFuZ2EuY29tL21hbmdhXzYxNDZhYWE2MDU3ODkvY2hhcHRlci0xLzIuanBn/aHR0cHM6Ly9oYXJpbWFuZ2EuY29tL21hbmdhL3doby1tYWRlLW1lLWEtcHJpbmNlc3Mv',
            'https://www.imagemanga.online/aHR0cHM6Ly9pbWctMS5oYXJpbWFuZ2EuY29tL21hbmdhXzYxNDZhYWE2MDU3ODkvY2hhcHRlci0xLzMuanBn/aHR0cHM6Ly9oYXJpbWFuZ2EuY29tL21hbmdhL3doby1tYWRlLW1lLWEtcHJpbmNlc3Mv',
            'https://www.imagemanga.online/aHR0cHM6Ly9pbWctMS5oYXJpbWFuZ2EuY29tL21hbmdhXzYxNDZhYWE2MDU3ODkvY2hhcHRlci0xLzQuanBn/aHR0cHM6Ly9oYXJpbWFuZ2EuY29tL21hbmdhL3doby1tYWRlLW1lLWEtcHJpbmNlc3Mv',
            'https://www.imagemanga.online/aHR0cHM6Ly9pbWctMS5oYXJpbWFuZ2EuY29tL21hbmdhXzYxNDZhYWE2MDU3ODkvY2hhcHRlci0xLzUuanBn/aHR0cHM6Ly9oYXJpbWFuZ2EuY29tL21hbmdhL3doby1tYWRlLW1lLWEtcHJpbmNlc3Mv',
            'https://www.imagemanga.online/aHR0cHM6Ly9pbWctMS5oYXJpbWFuZ2EuY29tL21hbmdhXzYxNDZhYWE2MDU3ODkvY2hhcHRlci0xLzYuanBn/aHR0cHM6Ly9oYXJpbWFuZ2EuY29tL21hbmdhL3doby1tYWRlLW1lLWEtcHJpbmNlc3Mv',
            'https://www.imagemanga.online/aHR0cHM6Ly9pbWctMS5oYXJpbWFuZ2EuY29tL21hbmdhXzYxNDZhYWE2MDU3ODkvY2hhcHRlci0xLzcuanBn/aHR0cHM6Ly9oYXJpbWFuZ2EuY29tL21hbmdhL3doby1tYWRlLW1lLWEtcHJpbmNlc3Mv',
            'https://www.imagemanga.online/aHR0cHM6Ly9pbWctMS5oYXJpbWFuZ2EuY29tL21hbmdhXzYxNDZhYWE2MDU3ODkvY2hhcHRlci0xLzguanBn/aHR0cHM6Ly9oYXJpbWFuZ2EuY29tL21hbmdhL3doby1tYWRlLW1lLWEtcHJpbmNlc3Mv',
            'https://www.imagemanga.online/aHR0cHM6Ly9pbWctMS5oYXJpbWFuZ2EuY29tL21hbmdhXzYxNDZhYWE2MDU3ODkvY2hhcHRlci0xLzkuanBn/aHR0cHM6Ly9oYXJpbWFuZ2EuY29tL21hbmdhL3doby1tYWRlLW1lLWEtcHJpbmNlc3Mv',
            'https://www.imagemanga.online/aHR0cHM6Ly9pbWctMS5oYXJpbWFuZ2EuY29tL21hbmdhXzYxNDZhYWE2MDU3ODkvY2hhcHRlci0xLzEwLmpwZw%3D%3D/aHR0cHM6Ly9oYXJpbWFuZ2EuY29tL21hbmdhL3doby1tYWRlLW1lLWEtcHJpbmNlc3Mv',
            'https://www.imagemanga.online/aHR0cHM6Ly9pbWctMS5oYXJpbWFuZ2EuY29tL21hbmdhXzYxNDZhYWE2MDU3ODkvY2hhcHRlci0xLzExLmpwZw%3D%3D/aHR0cHM6Ly9oYXJpbWFuZ2EuY29tL21hbmdhL3doby1tYWRlLW1lLWEtcHJpbmNlc3Mv'
          ]),
          Chapter(images: [
            'https://www.imagemanga.online/aHR0cHM6Ly9pbWctMS5oYXJpbWFuZ2EuY29tL21hbmdhXzYxNDZhYWE2MDU3ODkvY2hhcHRlci0yLzIuanBn/aHR0cHM6Ly9oYXJpbWFuZ2EuY29tL21hbmdhL3doby1tYWRlLW1lLWEtcHJpbmNlc3Mv',
            'https://www.imagemanga.online/aHR0cHM6Ly9pbWctMS5oYXJpbWFuZ2EuY29tL21hbmdhXzYxNDZhYWE2MDU3ODkvY2hhcHRlci0yLzMuanBn/aHR0cHM6Ly9oYXJpbWFuZ2EuY29tL21hbmdhL3doby1tYWRlLW1lLWEtcHJpbmNlc3Mv',
            'https://www.imagemanga.online/aHR0cHM6Ly9pbWctMS5oYXJpbWFuZ2EuY29tL21hbmdhXzYxNDZhYWE2MDU3ODkvY2hhcHRlci0yLzQuanBn/aHR0cHM6Ly9oYXJpbWFuZ2EuY29tL21hbmdhL3doby1tYWRlLW1lLWEtcHJpbmNlc3Mv',
            'https://www.imagemanga.online/aHR0cHM6Ly9pbWctMS5oYXJpbWFuZ2EuY29tL21hbmdhXzYxNDZhYWE2MDU3ODkvY2hhcHRlci0yLzUuanBn/aHR0cHM6Ly9oYXJpbWFuZ2EuY29tL21hbmdhL3doby1tYWRlLW1lLWEtcHJpbmNlc3Mv',
            'https://www.imagemanga.online/aHR0cHM6Ly9pbWctMS5oYXJpbWFuZ2EuY29tL21hbmdhXzYxNDZhYWE2MDU3ODkvY2hhcHRlci0yLzYuanBn/aHR0cHM6Ly9oYXJpbWFuZ2EuY29tL21hbmdhL3doby1tYWRlLW1lLWEtcHJpbmNlc3Mv',
            'https://www.imagemanga.online/aHR0cHM6Ly9pbWctMS5oYXJpbWFuZ2EuY29tL21hbmdhXzYxNDZhYWE2MDU3ODkvY2hhcHRlci0yLzcuanBn/aHR0cHM6Ly9oYXJpbWFuZ2EuY29tL21hbmdhL3doby1tYWRlLW1lLWEtcHJpbmNlc3Mv',
            'https://www.imagemanga.online/aHR0cHM6Ly9pbWctMS5oYXJpbWFuZ2EuY29tL21hbmdhXzYxNDZhYWE2MDU3ODkvY2hhcHRlci0yLzguanBn/aHR0cHM6Ly9oYXJpbWFuZ2EuY29tL21hbmdhL3doby1tYWRlLW1lLWEtcHJpbmNlc3Mv',
            'https://www.imagemanga.online/aHR0cHM6Ly9pbWctMS5oYXJpbWFuZ2EuY29tL21hbmdhXzYxNDZhYWE2MDU3ODkvY2hhcHRlci0yLzkuanBn/aHR0cHM6Ly9oYXJpbWFuZ2EuY29tL21hbmdhL3doby1tYWRlLW1lLWEtcHJpbmNlc3Mv',
            'https://www.imagemanga.online/aHR0cHM6Ly9pbWctMS5oYXJpbWFuZ2EuY29tL21hbmdhXzYxNDZhYWE2MDU3ODkvY2hhcHRlci0yLzEwLmpwZw%3D%3D/aHR0cHM6Ly9oYXJpbWFuZ2EuY29tL21hbmdhL3doby1tYWRlLW1lLWEtcHJpbmNlc3Mv',
            'https://www.imagemanga.online/aHR0cHM6Ly9pbWctMS5oYXJpbWFuZ2EuY29tL21hbmdhXzYxNDZhYWE2MDU3ODkvY2hhcHRlci0yLzExLmpwZw%3D%3D/aHR0cHM6Ly9oYXJpbWFuZ2EuY29tL21hbmdhL3doby1tYWRlLW1lLWEtcHJpbmNlc3Mv',
            'https://www.imagemanga.online/aHR0cHM6Ly9pbWctMS5oYXJpbWFuZ2EuY29tL21hbmdhXzYxNDZhYWE2MDU3ODkvY2hhcHRlci0yLzEyLmpwZw%3D%3D/aHR0cHM6Ly9oYXJpbWFuZ2EuY29tL21hbmdhL3doby1tYWRlLW1lLWEtcHJpbmNlc3Mv',
            'https://www.imagemanga.online/aHR0cHM6Ly9pbWctMS5oYXJpbWFuZ2EuY29tL21hbmdhXzYxNDZhYWE2MDU3ODkvY2hhcHRlci0yLzEzLmpwZw%3D%3D/aHR0cHM6Ly9oYXJpbWFuZ2EuY29tL21hbmdhL3doby1tYWRlLW1lLWEtcHJpbmNlc3Mv',
            'https://www.imagemanga.online/aHR0cHM6Ly9pbWctMS5oYXJpbWFuZ2EuY29tL21hbmdhXzYxNDZhYWE2MDU3ODkvY2hhcHRlci0yLzE0LmpwZw%3D%3D/aHR0cHM6Ly9oYXJpbWFuZ2EuY29tL21hbmdhL3doby1tYWRlLW1lLWEtcHJpbmNlc3Mv',
            'https://www.imagemanga.online/aHR0cHM6Ly9pbWctMS5oYXJpbWFuZ2EuY29tL21hbmdhXzYxNDZhYWE2MDU3ODkvY2hhcHRlci0yLzE1LmpwZw%3D%3D/aHR0cHM6Ly9oYXJpbWFuZ2EuY29tL21hbmdhL3doby1tYWRlLW1lLWEtcHJpbmNlc3Mv',
            'https://www.imagemanga.online/aHR0cHM6Ly9pbWctMS5oYXJpbWFuZ2EuY29tL21hbmdhXzYxNDZhYWE2MDU3ODkvY2hhcHRlci0yLzE2LmpwZw%3D%3D/aHR0cHM6Ly9oYXJpbWFuZ2EuY29tL21hbmdhL3doby1tYWRlLW1lLWEtcHJpbmNlc3Mv',
            'https://www.imagemanga.online/aHR0cHM6Ly9pbWctMS5oYXJpbWFuZ2EuY29tL21hbmdhXzYxNDZhYWE2MDU3ODkvY2hhcHRlci0yLzE3LmpwZw%3D%3D/aHR0cHM6Ly9oYXJpbWFuZ2EuY29tL21hbmdhL3doby1tYWRlLW1lLWEtcHJpbmNlc3Mv',
          ])
        ]),
    Comic(
        id: '5',
        name: 'Ветролом',
        description:
            'Ветролом — драма о юных уличных гонщиках, мечтающих о свободе.',
        imageUrl:
            'https://cover.imglib.info/uploads/cover/wind-breaker/cover/RWDstYRkXMxO_250x350.jpg',
        rusChapters: [
          Chapter(images: [
            'https://img33.imgslib.link//manga/wind-breaker/chapters/74281/WindBreaker_gl0_1.jpg',
          ]),
          Chapter(images: [
            'https://img33.imgslib.link//manga/wind-breaker/chapters/74283/WindBreaker_gl1_1.png',
            'https://img33.imgslib.link//manga/wind-breaker/chapters/74283/WindBreaker_gl1_2.png',
            'https://img33.imgslib.link//manga/wind-breaker/chapters/74283/WindBreaker_gl1_3.png',
            'https://img33.imgslib.link//manga/wind-breaker/chapters/74283/WindBreaker_gl1_4.png'
          ]),
        ],
        engChapters: [
          Chapter(images: [
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-0-prologue/1.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-0-prologue/2.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-0-prologue/3.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-0-prologue/4.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-0-prologue/5.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-0-prologue/6.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-0-prologue/7.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-0-prologue/8.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-0-prologue/9.jpg'
          ]),
          Chapter(images: [
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/1.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/2.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/3.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/4.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/5.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/6.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/7.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/8.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/9.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/10.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/11.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/12.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/13.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/14.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/15.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/16.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/17.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/18.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/19.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/20.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/21.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/22.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/23.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/24.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/25.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/26.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/27.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/28.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/29.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/30.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/31.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/32.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/33.jpg',
            'https://cdn.hxmanga.com/file/majekayoo/wind-breaker/chapter-1/34.jpg'
          ])
        ])
  ];

  List<Comic> get items {
    return [..._items];
  }

  Future<void> getComics() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('comics').get();
    final allData = querySnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();

    allData.forEach((com) {
      List<Chapter> rusChapters = [];
      List<Chapter> engChapters = [];
      com['chapters']['rus'].values.forEach((ch) {
        rusChapters.add(Chapter(images: List<String>.from(ch)));
      });
      com['chapters']['eng'].values.forEach((ch) {
        engChapters.add(Chapter(images: List<String>.from(ch)));
      });

      _items.add(Comic(
          id: 'g34gg',
          name: com['name'],
          description: com['description'],
          imageUrl: com['imageUrl'],
          rusChapters: rusChapters,
          engChapters: engChapters));
    });
    notifyListeners();
  }

  List<Comic> get favoriteItems {
    return _items.where((comItem) => comItem.isFavorite).toList();
  }

  List<Comic> get readingItems {
    return _items.where((comItem) => comItem.isReading).toList();
  }

  void toggleFav(String id) {
    Comic oldCom = _items.firstWhere((com) => com.id == id);
    final ind = _items.indexWhere((com) => com.id == id);
    Comic newCom = Comic(
        id: oldCom.id,
        name: oldCom.name,
        description: oldCom.description,
        imageUrl: oldCom.imageUrl,
        rusChapters: oldCom.rusChapters,
        engChapters: oldCom.engChapters,
        isFavorite: !oldCom.isFavorite,
        isReading: oldCom.isReading);
    _items[ind] = newCom;
    notifyListeners();
  }

  void startReading(String id) {
    Comic oldCom = _items.firstWhere((com) => com.id == id);
    final ind = _items.indexWhere((com) => com.id == id);
    Comic newCom = Comic(
        id: oldCom.id,
        name: oldCom.name,
        description: oldCom.description,
        imageUrl: oldCom.imageUrl,
        rusChapters: oldCom.rusChapters,
        engChapters: oldCom.engChapters,
        isFavorite: oldCom.isFavorite,
        isReading: true);
    _items[ind] = newCom;
    notifyListeners();
  }

  Comic findById(String id) {
    return _items.firstWhere((com) => com.id == id);
  }
}
