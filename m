Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 565C9138C0B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Jan 2020 07:51:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iqtZ6-0003m0-Pg; Mon, 13 Jan 2020 06:51:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <xp1982.06.06@gmail.com>) id 1iqtZ4-0003lr-VT
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 13 Jan 2020 06:51:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=izEhH9HSmiLxAr4IDjSCnuhC/tVMB63siLHqysQgjU4=; b=ggokwMa5TNiz4DCV1xlWNmoPMr
 khTINTnwgrC+A0nhIAp4DBAbjcmZ+OsRuOnLXV0Cki1jvSkYR/xsOLCdjZ9Dx5Nk8kY1CvydtJx22
 oSzFOVBp6T7IGCwrit1zMvupRO94wmBO1z5kYkX/KrApr/1Q/rg1J/dIZyomfeSVI/7o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=izEhH9HSmiLxAr4IDjSCnuhC/tVMB63siLHqysQgjU4=; b=DZ6+QNFblt96hirP/PcAc53YSd
 oygOdHvD8UOA52GTAnudfUNS2v5bNhWEav8CTWsSqP6XlRTzaKoL0bNY1wZnOgWWkvwZtP/f/qu5m
 s+/QROWeotThCjpM/ni/mYrcA1D6zZk1jRGnHuGPr7pFxJaz9pUY4TURv2EIyjqUe2ao=;
Received: from mail-io1-f68.google.com ([209.85.166.68])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iqtZ3-002n88-0K
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 13 Jan 2020 06:51:06 +0000
Received: by mail-io1-f68.google.com with SMTP id b10so8620235iof.11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 12 Jan 2020 22:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=izEhH9HSmiLxAr4IDjSCnuhC/tVMB63siLHqysQgjU4=;
 b=suTZW0kZz9LR30MAoGdnYthCnDHcflnGaNg1OXJ8T0M6fU9tmwtgS+mRS2PAk46iqk
 B77IDSDpghqrgMyhasRb74pFUUgV7gCAsxnh4PqJerW3I2QDHuCSPxYyH7mUTP/84Vdf
 CPbas7z6/zXpSGweXLTl9uym1wDOS2Pz+uOt5P7vf6cHOhTDgrVyPseFdXJouNoZHLPo
 gTbHYWEwmbelTYouBn3UDrhnsMtJse7OiRFIy2kt4tCapME5HvTpS0a+3XN6CzDNeW24
 sMaqyuJnUL3ra0NMusA8lZoXERWe05ZopbdCVbb7/8+4hwxM3xb3NbaavaZwc/m9gJGZ
 SeJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=izEhH9HSmiLxAr4IDjSCnuhC/tVMB63siLHqysQgjU4=;
 b=gy2D8ZqIZPgq4HS5LVG3wUnQXpKNd8KKxY3XOG+SejLq52sBYcX4xCnYKa5BhIahdp
 S/EwrNjXMknoy/hJQ9yQmpCkKjUqTTskWI3BgT+5aN9LIql453aHrlO4T3EZAydfj2fM
 2BjlhUOFGmrQ+qyZ6O+6P7l4dvpyXDbnufUGJIxkOzS5SqUKf6f81/mVK5hWiwgIe4Hv
 C4Bv3nNunaDBXt5G9I3kznS+YF2gy9mrAjAyt0zVt2EWa4qB22Sqcd1Z8opjcE0CSc+z
 KktgwZ6GMqgUd9KwmVngsuqIyz2O/8ryYSGhJw8Fa10HVmEnqd4NbrGyS16yaYkq72ke
 NQzQ==
X-Gm-Message-State: APjAAAXXFBi5Amhl+AbCrY8EM5ZKIKNEDA6+smgtIBzXXMKUjHO/heue
 XgTo6S4wOFrjUxWm/pupqwKFU1hFcocWu/jozQg=
X-Google-Smtp-Source: APXvYqySYDaSXrci4yM2CGDg4aoAINapiCFbhwOe1NBswYXCw3KGe+1VEWD6lHbPZTxQDC0Dk8Om959i1l5Rsy30dG8=
X-Received: by 2002:a5e:9307:: with SMTP id k7mr11056327iom.305.1578898259011; 
 Sun, 12 Jan 2020 22:50:59 -0800 (PST)
MIME-Version: 1.0
References: <1578482416650.67283@xiaomi.com>
 <d48d8d65-1308-278c-db86-0806a0c3637a@huawei.com>
 <CAOqdbhdyaNg3RoGF0+gJ=6wX4YDrgpfuVDsuAg05BSp3dmZKww@mail.gmail.com>
 <cd24098e-5c26-39de-6024-1bbb71375556@huawei.com>
In-Reply-To: <cd24098e-5c26-39de-6024-1bbb71375556@huawei.com>
From: xiong ping <xp1982.06.06@gmail.com>
Date: Mon, 13 Jan 2020 14:50:48 +0800
Message-ID: <CAOqdbhdTR4fMy3PAxtMJKQL8hEdtGOufRJSv6efKduw-fZ1T=g@mail.gmail.com>
To: Chao Yu <yuchao0@huawei.com>
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (xp1982.06.06[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (xp1982.06.06[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iqtZ3-002n88-0K
Subject: Re: [f2fs-dev] [PATCH] resize.f2fs: add option for large_nat_bitmap
 feature
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
Cc: =?UTF-8?B?UGluZzEgWGlvbmcg54aK5bmz?= <xiongping1@xiaomi.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Q2hhbyBZdSA8eXVjaGFvMEBodWF3ZWkuY29tPiDkuo4yMDIw5bm0MeaciDEx5pel5ZGo5YWtIOS4
i+WNiDU6NDPlhpnpgZPvvJoKPgo+IE9uIDIwMjAvMS8xMCAxNzo1OCwgeGlvbmcgcGluZyB3cm90
ZToKPiA+IENoYW8gWXUgPHl1Y2hhbzBAaHVhd2VpLmNvbT4g5LqOMjAyMOW5tDHmnIg55pel5ZGo
5ZubIOS4i+WNiDM6MTblhpnpgZPvvJoKPiA+Pgo+ID4+IE9uIDIwMjAvMS84IDE5OjIwLCBQaW5n
MSBYaW9uZyDnhorlubMgd3JvdGU6Cj4gPj4+IEZyb20gZDViODQxMWRiYWUzNzE4MGMzN2Q5NmJm
MTY0ZmFiMTYxMzhmYzIxYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiA+Pj4KPiA+Pj4gRnJv
bTogeGlvbmdwaW5nMSA8eGlvbmdwaW5nMUB4aWFvbWkuY29tPgo+ID4+PiBEYXRlOiBXZWQsIDgg
SmFuIDIwMjAgMTc6MjA6NTUgKzA4MDAKPiA+Pj4gU3ViamVjdDogW1BBVENIXSByZXNpemUuZjJm
czogYWRkIG9wdGlvbiBmb3IgbGFyZ2VfbmF0X2JpdG1hcCBmZWF0dXJlCj4gPj4KPiA+PiBUaGFu
a3MgZm9yIHlvdXIgY29udHJpYnV0aW9uLgo+ID4+Cj4gPj4gVGhlIHBhdGNoIGZvcm1hdCBpcyBp
bmNvcnJlY3QsIEkgZ3Vlc3MgaXQgd2FzIGNoYW5nZWQgYnkgZW1haWwgY2xpZW50IG9yIHdoZW4K
PiA+PiB5b3UgcGFzdGUgcGF0Y2gncyBjb250ZW50LCBjb3VsZCB5b3UgY2hlY2sgaXQ/Cj4gPj4K
PiA+IEkgaGF2ZSByZXNlbmQgdGhlIHBhdGNoIHdpdGggdGhpcyBlbWFpbCBhY2NvdW50IHllc3Rl
cmRheSwgY2FuIHlvdSBjaGVjayBpdD8KPiA+Pj4KPiA+Pj4gcmVzaXplLmYyZnMgaGFzIGFscmVh
ZHkgc3VwcG9ydGVkIGxhcmdlX25hdF9iaXRtYXAgZmVhdHVyZSwgYnV0IGhhcyBubwo+ID4+PiBv
cHRpb24gdG8gdHVybiBvbiBpdC4KPiA+Pj4KPiA+Pj4gVGhpcyBjaGFuZ2UgYWRkIGEgbmV3ICct
aScgb3B0aW9uIHRvIGNvbnRyb2wgdHVybmluZyBvbi9vZmYgaXQuCj4gPj4KPiA+PiBXZSBvbmx5
IGFkZCBhIG9wdGlvbiB0byB0dXJuIG9uIHRoaXMgZmVhdHVyZSwgcmlnaHQ/IHJhdGhlciB0aGFu
IHR1cm5pbmcKPiA+PiBvbiBvciBvZmYgaXQ/Cj4gPj4KPiA+IHllcywgdGhlIGZlYXR1cmUgaXMg
b2ZmIGJ5IGRlZmF1bHQsIHNvIHdlIG5lZWQgYW4gb3B0aW9uIHRvIGVuYWJsZSBpdC4KPgo+IFNv
LCBJIG1lYW50IGl0IG5lZWRzIHRvIGFkanVzdCBjb21taXQgbWVzc2FnZSBmcm9tICJ0dXJuaW5n
IG9uL29mZiBpdCIgdG8KPiAidHVybmluZyBvbiBpdCIuCj4KCm9rLCB3aWxsIGZpeCBpdCBpbiBw
YXRjaCB2Mi4KCj4gPj4gVGhhbmtzLAo+ID4+Cj4gPj4+Cj4gPj4+IFNpZ25lZC1vZmYtYnk6IHhp
b25ncGluZzEgPHhpb25ncGluZzFAeGlhb21pLmNvbT4KPiA+Pj4gLS0tCj4gPj4+ICBmc2NrL21h
aW4uYyAgIHwgNiArKysrKy0KPiA+Pj4gIGZzY2svcmVzaXplLmMgfCA1ICsrKysrCj4gPj4+ICAy
IGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+Pj4KPiA+
Pj4gZGlmZiAtLWdpdCBhL2ZzY2svbWFpbi5jIGIvZnNjay9tYWluLmMKPiA+Pj4gaW5kZXggOWE3
ZDQ5OS4uZTdlM2RmYyAxMDA2NDQKPiA+Pj4gLS0tIGEvZnNjay9tYWluLmMKPiA+Pj4gKysrIGIv
ZnNjay9tYWluLmMKPiA+Pj4gQEAgLTEwNCw2ICsxMDQsNyBAQCB2b2lkIHJlc2l6ZV91c2FnZSgp
Cj4gPj4+ICAgICAgICAgIE1TRygwLCAiXG5Vc2FnZTogcmVzaXplLmYyZnMgW29wdGlvbnNdIGRl
dmljZVxuIik7Cj4gPj4+ICAgICAgICAgIE1TRygwLCAiW29wdGlvbnNdOlxuIik7Cj4gPj4+ICAg
ICAgICAgIE1TRygwLCAiICAtZCBkZWJ1ZyBsZXZlbCBbZGVmYXVsdDowXVxuIik7Cj4gPj4+ICsg
ICAgICAgTVNHKDAsICIgIC1pIGV4dGVuZGVkIG5vZGUgYml0bWFwLCBub2RlIHJhdGlvIGlzIDIw
JSUgYnkgZGVmYXVsdFxuIik7Cj4gPj4+ICAgICAgICAgIE1TRygwLCAiICAtcyBzYWZlIHJlc2l6
ZSAoRG9lcyBub3QgcmVzaXplIG1ldGFkYXRhKSIpOwo+ID4+PiAgICAgICAgICBNU0coMCwgIiAg
LXQgdGFyZ2V0IHNlY3RvcnMgW2RlZmF1bHQ6IGRldmljZSBzaXplXVxuIik7Cj4gPj4+ICAgICAg
ICAgIE1TRygwLCAiICAtViBwcmludCB0aGUgdmVyc2lvbiBudW1iZXIgYW5kIGV4aXRcbiIpOwo+
ID4+PiBAQCAtNDQ5LDcgKzQ1MCw3IEBAIHZvaWQgZjJmc19wYXJzZV9vcHRpb25zKGludCBhcmdj
LCBjaGFyICphcmd2W10pCj4gPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJy
ZWFrOwo+ID4+PiAgICAgICAgICAgICAgICAgIH0KPiA+Pj4gICAgICAgICAgfSBlbHNlIGlmICgh
c3RyY21wKCJyZXNpemUuZjJmcyIsIHByb2cpKSB7Cj4gPj4+IC0gICAgICAgICAgICAgICBjb25z
dCBjaGFyICpvcHRpb25fc3RyaW5nID0gImQ6c3Q6ViI7Cj4gPj4+ICsgICAgICAgICAgICAgICBj
b25zdCBjaGFyICpvcHRpb25fc3RyaW5nID0gImQ6c3Q6aVYiOwo+ID4+Pgo+ID4+PiAgICAgICAg
ICAgICAgICAgIGMuZnVuYyA9IFJFU0laRTsKPiA+Pj4gICAgICAgICAgICAgICAgICB3aGlsZSAo
KG9wdGlvbiA9IGdldG9wdChhcmdjLCBhcmd2LCBvcHRpb25fc3RyaW5nKSkgIT0gRU9GKSB7Cj4g
Pj4+IEBAIC00NzYsNiArNDc3LDkgQEAgdm9pZCBmMmZzX3BhcnNlX29wdGlvbnMoaW50IGFyZ2Ms
IGNoYXIgKmFyZ3ZbXSkKPiA+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICByZXQgPSBzc2NhbmYob3B0YXJnLCAiJSJQUkl4NjQiIiwKPiA+Pj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmMudGFyZ2V0X3Nl
Y3RvcnMpOwo+ID4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiA+
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgY2FzZSAnaSc6Cj4gPj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgYy5sYXJnZV9uYXRfYml0bWFwID0gMTsKPiA+Pj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiA+Pj4gICAgICAgICAgICAgICAgICAgICAg
ICAgIGNhc2UgJ1YnOgo+ID4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzaG93
X3ZlcnNpb24ocHJvZyk7Cj4gPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGV4
aXQoMCk7Cj4gPj4+IGRpZmYgLS1naXQgYS9mc2NrL3Jlc2l6ZS5jIGIvZnNjay9yZXNpemUuYwo+
ID4+PiBpbmRleCBmYzU2M2YyLi44OGUwNjNlIDEwMDY0NAo+ID4+PiAtLS0gYS9mc2NrL3Jlc2l6
ZS5jCj4gPj4+ICsrKyBiL2ZzY2svcmVzaXplLmMKPiA+Pj4gQEAgLTUxOSw2ICs1MTksMTEgQEAg
c3RhdGljIHZvaWQgcmVidWlsZF9jaGVja3BvaW50KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwK
PiA+Pj4gICAgICAgICAgZWxzZQo+ID4+PiAgICAgICAgICAgICAgICAgIHNldF9jcChjaGVja3N1
bV9vZmZzZXQsIENQX0NIS1NVTV9PRkZTRVQpOwo+ID4+Pgo+ID4+PiArICAgICAgIGlmIChjLmxh
cmdlX25hdF9iaXRtYXApIHsKPiA+Pj4gKyAgICAgICAgICAgICAgIHNldF9jcChjaGVja3N1bV9v
ZmZzZXQsIENQX01JTl9DSEtTVU1fT0ZGU0VUKTsKPiA+Pj4gKyAgICAgICAgICAgICAgIGZsYWdz
IHw9IENQX0xBUkdFX05BVF9CSVRNQVBfRkxBRzsKPiA+Pj4gKyAgICAgICB9Cj4KPiBIb3cgYWJv
dXQgcmVsb2NhdGluZyBhYm92ZSBjb2RlcyB0byBiZWxvdyBwb3NpdGlvbjoKPgo+ICAgICAgICAg
ZmxhZ3MgPSB1cGRhdGVfbmF0X2JpdHNfZmxhZ3MobmV3X3NiLCBjcCwgZ2V0X2NwKGNrcHRfZmxh
Z3MpKTsKPgo+ICsgICAgICAgaWYgKGMubGFyZ2VfbmF0X2JpdG1hcCkKPiArICAgICAgICAgICAg
ICAgZmxhZ3MgfD0gQ1BfTEFSR0VfTkFUX0JJVE1BUF9GTEFHOwo+Cgpvaywgd2lsbCBmaXggaXQg
aW4gcGF0Y2ggdjIuCgo+ICAgICAgICAgaWYgKGZsYWdzICYgQ1BfQ09NUEFDVF9TVU1fRkxBRykK
PiAgICAgICAgICAgICAgICAgZmxhZ3MgJj0gfkNQX0NPTVBBQ1RfU1VNX0ZMQUc7Cj4KPiBUaGFu
a3MsCj4KPiA+Pj4gKwo+ID4+PiAgICAgICAgICBzZXRfY3AoY2twdF9mbGFncywgZmxhZ3MpOwo+
ID4+Pgo+ID4+PiAgICAgICAgICBtZW1jcHkobmV3X2NwLCBjcCwgKHVuc2lnbmVkIGNoYXIgKilj
cC0+c2l0X25hdF92ZXJzaW9uX2JpdG1hcCAtCj4gPj4+IC0tCj4gPj4+IDIuNy40Cj4gPj4+Cj4g
Pj4+Cj4gPj4+Cj4gPj4+Cj4gPj4+ICMvKioqKioq5pys6YKu5Lu25Y+K5YW26ZmE5Lu25ZCr5pyJ
5bCP57Gz5YWs5Y+455qE5L+d5a+G5L+h5oGv77yM5LuF6ZmQ5LqO5Y+R6YCB57uZ5LiK6Z2i5Zyw
5Z2A5Lit5YiX5Ye655qE5Liq5Lq65oiW576k57uE44CC56aB5q2i5Lu75L2V5YW25LuW5Lq65Lul
5Lu75L2V5b2i5byP5L2/55So77yI5YyF5ous5L2G5LiN6ZmQ5LqO5YWo6YOo5oiW6YOo5YiG5Zyw
5rOE6Zyy44CB5aSN5Yi244CB5oiW5pWj5Y+R77yJ5pys6YKu5Lu25Lit55qE5L+h5oGv44CC5aaC
5p6c5oKo6ZSZ5pS25LqG5pys6YKu5Lu277yM6K+35oKo56uL5Y2z55S16K+d5oiW6YKu5Lu26YCa
55+l5Y+R5Lu25Lq65bm25Yig6Zmk5pys6YKu5Lu277yBIFRoaXMgZS1tYWlsIGFuZCBpdHMgYXR0
YWNobWVudHMgY29udGFpbiBjb25maWRlbnRpYWwgaW5mb3JtYXRpb24gZnJvbSBYSUFPTUksIHdo
aWNoIGlzIGludGVuZGVkIG9ubHkgZm9yIHRoZSBwZXJzb24gb3IgZW50aXR5IHdob3NlIGFkZHJl
c3MgaXMgbGlzdGVkIGFib3ZlLiBBbnkgdXNlIG9mIHRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQg
aGVyZWluIGluIGFueSB3YXkgKGluY2x1ZGluZywgYnV0IG5vdCBsaW1pdGVkIHRvLCB0b3RhbCBv
ciBwYXJ0aWFsIGRpc2Nsb3N1cmUsIHJlcHJvZHVjdGlvbiwgb3IgZGlzc2VtaW5hdGlvbikgYnkg
cGVyc29ucyBvdGhlciB0aGFuIHRoZSBpbnRlbmRlZCByZWNpcGllbnQocykgaXMgcHJvaGliaXRl
ZC4gSWYgeW91IHJlY2VpdmUgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhl
IHNlbmRlciBieSBwaG9uZSBvciBlbWFpbCBpbW1lZGlhdGVseSBhbmQgZGVsZXRlIGl0ISoqKioq
Ki8jCj4gPj4KPiA+Pgo+ID4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gPj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiA+PiBMaW51eC1m
MmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+ID4+IGh0dHBzOi8vbGlzdHMuc291cmNl
Zm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKPiA+IC4KPiA+CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1k
ZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQK
aHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1k
ZXZlbAo=
