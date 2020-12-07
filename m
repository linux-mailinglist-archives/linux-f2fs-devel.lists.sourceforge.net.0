Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA6E2D1E91
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Dec 2020 00:52:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kmQIm-0002rI-Pe; Mon, 07 Dec 2020 23:52:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1kmQIl-0002r8-Tc
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Dec 2020 23:52:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fnG2AFxrvUAG48qSs+ORV96koVoU7dohtORWA8eYiDk=; b=F1OErydo7E+8WwUMJYoe6S90is
 +uav/EIvPk6EicpT1N0+83agjxG0jB+ljDwGSc7xqQiJH/I9k8OLyuaVnyOzCzm5wC56afYYIV6MM
 qHaVv3QRrh3urt2VS6egvQkSC4NCBSPsZNxLkrG7R4OBVrs4WLkoVaYuaHHClEftaNOo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fnG2AFxrvUAG48qSs+ORV96koVoU7dohtORWA8eYiDk=; b=Si2gWbg9lNJKG+8TeTt1Vs/myH
 esCqBJDhzBWq0m2zrPmYxy4W9pVHSonK5jP9oBFkwBkbD1zw31NcXT5xsCkgJskkvuEqQZ65Ef6+5
 qp2kKue9ldrtEXSw83BhLkpo3NUD+Uk79mhwB6BSjGg9OqGNECX7lpnSeXVjf8iPIWQk=;
Received: from mail-il1-f194.google.com ([209.85.166.194])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kmQIb-005vnx-RB
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Dec 2020 23:52:19 +0000
Received: by mail-il1-f194.google.com with SMTP id p5so13925886iln.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 07 Dec 2020 15:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fnG2AFxrvUAG48qSs+ORV96koVoU7dohtORWA8eYiDk=;
 b=Ughv+eTB+6CuVvlGH79ocSVBjB4gPWmssmuyaKpJ2qfgkMtfAyPaLMqTSAFN9yOGdu
 dpzgZ5o7p+SrOaS3Mj/2MUgsAxUwKJFZOgyCUFR6eygIh5bJIIbnD8VqQJjL8PyeHDMV
 qrRLMHMp/STAYg/6V5od7l4+4bnnOEHkmQS16adp/WHbcubTjfg8Gtbwr90Wj1eCcSXf
 L47NOmdJDzFS8VsjbUNPrMyh96Nup7wl04myoem01BhADl3oC1g86Lcu3j+SRpbfWdiW
 JfUQvXZrH3Ei4YL/ldcUH/cIi9Ay0X+9DXireg8VEAovzgYhgvtUEXzcbcJ8JwZpGe0s
 6B7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fnG2AFxrvUAG48qSs+ORV96koVoU7dohtORWA8eYiDk=;
 b=TtX0P0NinHScw0jRQ78LyDAIGq4rmMDZhjf7bPfKgBwRAHyj2e/5OzfpSr+8B8k7dF
 jMTgtrEpf3d1zebeCQmPYTx4NQzu2dSpkvPJiHiQ5KAQCDhQTPVkJr1ZR+0+Rw8JLebI
 HBQg5h8CMFMgNunf+DixHfoEd4/fTX4m6D/EeOD67EaTubka2T15UkWYJZfGgviXhmtn
 +AAZnVMiqAXuh+dYpX/Ck2AU2YxLpTWE/pTTKSx/DHkdzSWJjqb/gmmxx8mxBogIGZc+
 9onZozGdcp/HG0WdRM1XbtW+SabgPJnFOrLxhc50Z+kOOGepT9OSVmEjV+Fmzqcl1O/E
 N+BA==
X-Gm-Message-State: AOAM531YNNqejwzTHNcVoRezBbRyh0BKB8A+NUTFblMG9/pdLz42vpjZ
 3qWPvKAaYTvU7HTQk9rR0Ey2itpstTO8zFSd7rI=
X-Google-Smtp-Source: ABdhPJzkjLxuK1omK8MXQpuuZDcqC9/kUdhw8LI+0WymyLmBnla/1il257Ygorq7EJCqBj9Bzbt8/V5eqyjY0oFgr7A=
X-Received: by 2002:a92:d9cd:: with SMTP id n13mr22632494ilq.96.1607385117001; 
 Mon, 07 Dec 2020 15:51:57 -0800 (PST)
MIME-Version: 1.0
References: <20201205042626.1113600-1-daeho43@gmail.com>
 <X86RJdLhOVRm28Eu@gmail.com>
In-Reply-To: <X86RJdLhOVRm28Eu@gmail.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Tue, 8 Dec 2020 08:51:45 +0900
Message-ID: <CACOAw_yp0LU-vcT2+NTF3ipibF6GvqfaQ4V=957CDPQLbes92Q@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.194 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.194 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kmQIb-005vnx-RB
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: fix race of pending_pages in
 decompression
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Daeho Jeong <daehojeong@google.com>,
 kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Q2hhbywgSmFlZ2V1aywKClRoYW5rcy4gSSdsbCB1cGRhdGUgaXQgYXMgeW91ciBjb21tZW50cy4g
OikKCkVyaWMsCgpEZWNvbXByZXNzaW9uIGFuZCB2ZXJpdHkgY2FuIGJlIGV4ZWN1dGVkIGluIGRp
ZmZlcmVudCB0aHJlYWQgY29udGV4dHMKaW4gZGlmZmVyZW50IHRpbWluZywgc28gd2UgbmVlZCBz
ZXBhcmF0ZSBjb3VudHMgZm9yIGVhY2guCgpXZSBhbHJlYWR5IHVzZSBTVEVQX1ZFUklUWSBmb3Ig
bm9uLWNvbXByZXNzaW9uIGNhc2UsIHNvIEkgdGhpbmsgdXNpbmcKdGhpcyBmbGFnIGluIGhlcmUg
bG9va3MgbW9yZSBtYWtpbmcgc2Vuc2UuCgpUaGFua3MsCgoyMDIw64WEIDEy7JuUIDjsnbwgKO2Z
lCkg7Jik7KCEIDU6MzEsIEVyaWMgQmlnZ2VycyA8ZWJpZ2dlcnNAa2VybmVsLm9yZz7ri5jsnbQg
7J6R7ISxOgo+Cj4gT24gU2F0LCBEZWMgMDUsIDIwMjAgYXQgMDE6MjY6MjZQTSArMDkwMCwgRGFl
aG8gSmVvbmcgd3JvdGU6Cj4gPiBGcm9tOiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9uZ0Bnb29nbGUu
Y29tPgo+ID4KPiA+IEkgZm91bmQgb3V0IGYyZnNfZnJlZV9kaWMoKSBpcyBpbnZva2VkIGluIGEg
d3JvbmcgdGltaW5nLCBidXQKPiA+IGYyZnNfdmVyaWZ5X2JpbygpIHN0aWxsIG5lZWRlZCB0aGUg
ZGljIGluZm8gYW5kIGl0IHRyaWdnZXJlZCB0aGUKPiA+IGJlbG93IGtlcm5lbCBwYW5pYy4gSXQg
aGFzIGJlZW4gY2F1c2VkIGJ5IHRoZSByYWNlIGNvbmRpdGlvbiBvZgo+ID4gcGVuZGluZ19wYWdl
cyB2YWx1ZSBiZXR3ZWVuIGRlY29tcHJlc3Npb24gYW5kIHZlcml0eSBsb2dpYywgd2hlbgo+ID4g
dGhlIHNhbWUgY29tcHJlc3Npb24gY2x1c3RlciBoYWQgYmVlbiBzcGxpdCBpbiBkaWZmZXJlbnQg
Ymlvcy4KPiA+IEJ5IHNwbGl0IGJpb3MsIGYyZnNfdmVyaWZ5X2JpbygpIGVuZGVkIHVwIHdpdGgg
ZGVjcmVhc2luZwo+ID4gcGVuZGluZ19wYWdlcyB2YWx1ZSBiZWZvcmUgaXQgaXMgcmVzZXQgdG8g
bnJfY3BhZ2VzIGJ5Cj4gPiBmMmZzX2RlY29tcHJlc3NfcGFnZXMoKSBhbmQgY2F1c2VkIHRoZSBr
ZXJuZWwgcGFuaWMuCj4gPgo+ID4gWyA0NDE2LjU2NDc2M10gVW5hYmxlIHRvIGhhbmRsZSBrZXJu
ZWwgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlCj4gPiAgICAgICAgICAgICAgICBhdCB2aXJ0dWFs
IGFkZHJlc3MgMDAwMDAwMDAwMDAwMDAwMAo+ID4gLi4uCj4gPiBbIDQ0MTYuODk2MDE2XSBXb3Jr
cXVldWU6IGZzdmVyaXR5X3JlYWRfcXVldWUgZjJmc192ZXJpdHlfd29yawo+ID4gWyA0NDE2Ljkw
ODUxNV0gcGMgOiBmc3Zlcml0eV92ZXJpZnlfcGFnZSsweDIwLzB4NzgKPiA+IFsgNDQxNi45MTM3
MjFdIGxyIDogZjJmc192ZXJpZnlfYmlvKzB4MTFjLzB4MjljCj4gPiBbIDQ0MTYuOTEzNzIyXSBz
cCA6IGZmZmZmZmMwMTk1MzNjZDAKPiA+IFsgNDQxNi45MTM3MjNdIHgyOTogZmZmZmZmYzAxOTUz
M2NkMCB4Mjg6IDAwMDAwMDAwMDAwMDA0MDIKPiA+IFsgNDQxNi45MTM3MjRdIHgyNzogMDAwMDAw
MDAwMDAwMDAwMSB4MjY6IDAwMDAwMDAwMDAwMDAxMDAKPiA+IFsgNDQxNi45MTM3MjZdIHgyNTog
MDAwMDAwMDAwMDAwMDAwMSB4MjQ6IDAwMDAwMDAwMDAwMDAwMDQKPiA+IFsgNDQxNi45MTM3Mjdd
IHgyMzogMDAwMDAwMDAwMDAwMTAwMCB4MjI6IDAwMDAwMDAwMDAwMDAwMDAKPiA+IFsgNDQxNi45
MTM3MjhdIHgyMTogMDAwMDAwMDAwMDAwMDAwMCB4MjA6IGZmZmZmZmZmMjA3NmY5YzAKPiA+IFsg
NDQxNi45MTM3MjldIHgxOTogZmZmZmZmZmYyMDc2ZjljMCB4MTg6IGZmZmZmZjhhMzIzODBjMzAK
PiA+IFsgNDQxNi45MTM3MzFdIHgxNzogZmZmZmZmYzAxZjk2NmQ5NyB4MTY6IDAwMDAwMDAwMDAw
MDAyOTgKPiA+IFsgNDQxNi45MTM3MzJdIHgxNTogMDAwMDAwMDAwMDAwMDAwMCB4MTQ6IDAwMDAw
MDAwMDAwMDAwMDAKPiA+IFsgNDQxNi45MTM3MzNdIHgxMzogZjA3NGZhZWM4OWZmZmZmZiB4MTI6
IDAwMDAwMDAwMDAwMDAwMDAKPiA+IFsgNDQxNi45MTM3MzRdIHgxMTogMDAwMDAwMDAwMDAwMTAw
MCB4MTA6IDAwMDAwMDAwMDAwMDEwMDAKPiA+IFsgNDQxNi45MjkxNzZdIHg5IDogZmZmZmZmZmYy
MGQxZjVjNyB4OCA6IDAwMDAwMDAwMDAwMDAwMDAKPiA+IFsgNDQxNi45MjkxNzhdIHg3IDogNjI2
ZDc0NjRmZjI4NmI2YiB4NiA6IGZmZmZmZmMwMTk1MzNhZGUKPiA+IFsgNDQxNi45MjkxNzldIHg1
IDogMDAwMDAwMDA4MDQ5MDAwZSB4NCA6IGZmZmZmZmZmMjc5M2U5ZTAKPiA+IFsgNDQxNi45Mjkx
ODBdIHgzIDogMDAwMDAwMDA4MDQ5MDAwZSB4MiA6IGZmZmZmZjg5ZWNmYTc0ZDAKPiA+IFsgNDQx
Ni45MjkxODFdIHgxIDogMDAwMDAwMDAwMDAwMGM0MCB4MCA6IGZmZmZmZmZmMjA3NmY5YzAKPiA+
IFsgNDQxNi45MjkxODRdIENhbGwgdHJhY2U6Cj4gPiBbIDQ0MTYuOTI5MTg3XSAgZnN2ZXJpdHlf
dmVyaWZ5X3BhZ2UrMHgyMC8weDc4Cj4gPiBbIDQ0MTYuOTI5MTg5XSAgZjJmc192ZXJpZnlfYmlv
KzB4MTFjLzB4MjljCj4gPiBbIDQ0MTYuOTI5MTkyXSAgZjJmc192ZXJpdHlfd29yaysweDU4LzB4
ODQKPiA+IFsgNDQxNy4wNTA2NjddICBwcm9jZXNzX29uZV93b3JrKzB4MjcwLzB4NDdjCj4gPiBb
IDQ0MTcuMDU1MzU0XSAgd29ya2VyX3RocmVhZCsweDI3Yy8weDRkOAo+ID4gWyA0NDE3LjA1OTc4
NF0gIGt0aHJlYWQrMHgxM2MvMHgzMjAKPiA+IFsgNDQxNy4wNjM2OTNdICByZXRfZnJvbV9mb3Jr
KzB4MTAvMHgxOAo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IERhZWhvIEplb25nIDxkYWVob2plb25n
QGdvb2dsZS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKYWVnZXVrIEtpbSA8amFlZ2V1a0BrZXJu
ZWwub3JnPgo+ID4gLS0tCj4gPiB2MzogYmFjayB0byB2MSBhbmQgZW5hYmxlZCB2ZXJpdHkgaW4g
YSB1bml0IG9mIGNsdXN0ZXIKPiA+IHYyOiBtZXJnZWQgdmVyaXR5X3BhZ2VzIHdpdGggcGVuZGlu
Z19wYWdlcywgYW5kIGluY3JlYXNlZCB0aGUKPiA+ICAgICBwZW5kaW5nX3BhZ2VzIGNvdW50IG9u
bHkgaWYgU1RFUF9WRVJJVFkgaXMgc2V0IG9uIGJpbwo+Cj4gSSBhbSB0cnlpbmcgdG8gcmV2aWV3
IHRoaXMgYnV0IGl0IGlzIHZlcnkgaGFyZCwgYXMgdGhlIGYyZnMgY29tcHJlc3Npb24gY29kZSBp
cwo+IHZlcnkgaGFyZCB0byB1bmRlcnN0YW5kLgo+Cj4gSXQgbG9va3MgbGlrZSBhICdzdHJ1Y3Qg
ZGVjb21wcmVzc19pb19jdHgnIHJlcHJlc2VudHMgdGhlIHdvcmsgdG8gZGVjb21wcmVzcyBhCj4g
cGFydGljdWxhciBjbHVzdGVyLiAgU2luY2UgdGhlIGNvbXByZXNzZWQgZGF0YSBvZiB0aGUgY2x1
c3RlciBjYW4gYmUgcmVhZCB1c2luZwo+IG11bHRpcGxlIGJpb3MsIHRoZXJlIGlzIGEgcmVmZXJl
bmNlIGNvdW50IG9mIGhvdyBtYW55IHBhZ2VzIGFyZSByZW1haW5pbmcgdG8gYmUKPiByZWFkIGJl
Zm9yZSBhbGwgdGhlIGNsdXN0ZXIncyBwYWdlcyBoYXZlIGJlZW4gcmVhZCBhbmQgZGVjb21wcmVz
c2lvbiBjYW4gc3RhcnQuCj4KPiBXaGF0IEkgZG9uJ3QgdW5kZXJzdGFuZCBpcyB3aHkgdGhhdCBy
ZWZlcmVuY2UgY291bnRpbmcgbmVlZHMgdG8gd29yayBkaWZmZXJlbnRseQo+IGRlcGVuZGluZyBv
biB3aGV0aGVyIHZlcml0eSBpcyBlbmFibGVkIG9yIG5vdC4gIFNob3VsZG4ndCBpdCBiZSBleGFj
dGx5IHRoZQo+IHNhbWU/Cj4KPiBUaGVyZSBhbHNvIHNlZW1zIHRvIGJlIHNvbWUgY29uZnVzaW9u
IGFib3V0IHRoZSBzY29wZSBvZiBTVEVQX1ZFUklUWS4gIEJlZm9yZQo+IGYyZnMgY29tcHJlc3Np
b24gd2FzIGFkZGVkLCBpdCB3YXMgYSBwZXItYmlvIHRoaW5nLiAgQnV0IG5vdyBpbiBhIGNvbXBy
ZXNzZWQKPiBmaWxlLCBpdCdzIHJlYWxseSBhIHBlci1jbHVzdGVyIHRoaW5nLCBzaW5jZSBhbGwg
ZGVjb21wcmVzc2VkIHBhZ2VzIGluIGEKPiBjb21wcmVzc2VkIGNsdXN0ZXIgYXJlIHZlcmlmaWVk
IChvciBub3QgdmVyaWZpZWQpIGF0IG9uY2UuCj4KPiBXb3VsZG4ndCBpdCBtYWtlIGEgbG90IG1v
cmUgc2Vuc2UgdG8sIHdoZW4gYSBjbHVzdGVyIG5lZWRzIGJvdGggY29tcHJlc3Npb24gYW5kCj4g
dmVyaXR5LCAqbm90KiBzZXQgU1RFUF9WRVJJVFkgb24gdGhlIGJpb3MsIGJ1dCByYXRoZXIgc2V0
IGEgc2ltaWxhciBmbGFnIGluIHRoZQo+IGRlY29tcHJlc3NfaW9fY3R4Pwo+Cj4gLSBFcmljCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJm
cy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5u
ZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJm
cy1kZXZlbAo=
