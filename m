Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7709F2CEB79
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Dec 2020 10:55:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kl7o1-0000cQ-FO; Fri, 04 Dec 2020 09:55:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1kl7nw-0000aq-4f
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Dec 2020 09:55:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W8F7nIfHFD15zJgSTuCi/95RE+49mBFthLKoPhgIDHs=; b=SuksQNQHFN/+NMouyzxHTw1Yyt
 k9Q8va+psEVc434Uq04GtqtM1uLiNZvva6mDggV7Gj3gqODhaCnc62gHNXq19/6FoGaeVvSEaqvtC
 lXLMQhCBYgl1nFzrBPY/D6pIwz177szjoe1Vq3QajH2DhU8ji4dcTZ0J6GCm2Fl2ZMt4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=W8F7nIfHFD15zJgSTuCi/95RE+49mBFthLKoPhgIDHs=; b=mH46F0SJVyjviefB8cJKVOJGWV
 sD8BNh0iq85QJT5IL1SwhJYtAGtB796w4PqaklBExYS9KftIeNUIp+Ccgwl+NiKOFvf21NggzlLFm
 ubNKClePnNvomd0oaRZryZwRhdLi+c3nM/MRkYin6tSWPqq4x/5NqSBWDf/8OXn7Fag4=;
Received: from mail-lf1-f66.google.com ([209.85.167.66])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kl7nr-00EqyT-CX
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Dec 2020 09:55:07 +0000
Received: by mail-lf1-f66.google.com with SMTP id a9so6870849lfh.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 04 Dec 2020 01:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=W8F7nIfHFD15zJgSTuCi/95RE+49mBFthLKoPhgIDHs=;
 b=qkg6snpedeMoymtyfHbpiDsdqKa7nJNpDSOvGRpY+Y/GVyYl++EGpkXUiLXanBjGNz
 aVibN6cRp6dzCEJ3eAJQTKjyBMcJ6nLl3xm7PvTe44EDDfyVkGBgZMdTo70leGOA6OXb
 siOtGlpDOfIGpLMsSMPLivA9SpC7Qs98cHVgZ1feOziNyNKKShlfUgNP8XCx0rbyGTaP
 xJXNqfiP7uleOFyEW9ps7RExMevcNyTKwEt5AWL/tTd1IuabbBnNW1447XEEP+DIpwbH
 tpaO5WdVufB6Wm5w03dRIQXQPSJ0yUqZDIlTZMuygupHb12SyJ1oWpGiJl/L7P60Y8QP
 wsHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=W8F7nIfHFD15zJgSTuCi/95RE+49mBFthLKoPhgIDHs=;
 b=T0Xylg9YFzi2GxlDK/DLcB5vqXlvZJOytmej7NLiq9mcvugX0epeW37gznbO59Muhs
 fw+eb9DR7zSt4jLQSiGgAuhk3SqDVGyRgYDIATDVhJr0cNv1e8iI9IPOhwh7ZlQSvMg7
 0FtCazX+IdJf8E18ElPamEr8AT2Bu3OKpKn3/v5nMsDX/427WiJ62Xtpt80QQY83nk09
 ZJaqLZZ3DDUM6IYXBETGARQ+4v5IldaSazwvnWieQ309Yu6Bkly9cWLBko29ptU8zv98
 AV22yN8idVuk/S4g1Bk2ElS4MwM0v56ft4nvxcQPB9yHeqjmJG5zrKaIPUVor+DwAiME
 91Tw==
X-Gm-Message-State: AOAM531hGlroi28oLvSmPCuOE5XgEkwei4z+a2i8jv3Uaj3XHIWIqgvN
 x+ltA5hB7fdwQVPLaOt6sefDHGR+n+vu+LU+BCM=
X-Google-Smtp-Source: ABdhPJxyb0vgnPCgHJj/qixMeERnq7+hyRY2JeOEI4o7On1lpvw0+hWUFGNtcpBcx0qSL7yXY6iUX7ahPVKdchIDnfI=
X-Received: by 2002:a05:6512:3a6:: with SMTP id
 v6mr2825989lfp.90.1607075696750; 
 Fri, 04 Dec 2020 01:54:56 -0800 (PST)
MIME-Version: 1.0
References: <20201204072802.795397-1-daeho43@gmail.com>
 <680c5cbe-d570-b20d-f478-28acbefd8ef5@huawei.com>
 <CACOAw_xiW7ui-2g5LP8yR9kzUSg=MhGcFQ_09Aj-fYuOGZU4sA@mail.gmail.com>
In-Reply-To: <CACOAw_xiW7ui-2g5LP8yR9kzUSg=MhGcFQ_09Aj-fYuOGZU4sA@mail.gmail.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 4 Dec 2020 18:54:45 +0900
Message-ID: <CACOAw_xbVdYcjbOT176qLvQrUvGDhBd4J4Dh0v+G18OWkbdWrA@mail.gmail.com>
To: Chao Yu <yuchao0@huawei.com>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.66 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kl7nr-00EqyT-CX
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix race of pending_pages in
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

QXMgSSB0b2xkLCB0aGlzIHBhdGNoIGhhcyBhIGJ1Zy4gSWdub3JlIHRoaXMgb25lLiBTbywgSSdt
IGltcGxlbWVudGluZwphbm90aGVyIG9uZS4gOigKCjIwMjDrhYQgMTLsm5QgNOydvCAo6riIKSDs
mKTtm4QgNjo1MCwgRGFlaG8gSmVvbmcgPGRhZWhvNDNAZ21haWwuY29tPuuLmOydtCDsnpHshLE6
Cj4KPiBBcyBJIHRvbGQsIHRoaXMgcGF0Y2ggaGFzIGEgYnVnLiBJZ25vcmUgdGhpcyBvbmUuIFNv
LCBJJ20gaW1wbGVtZW50aW5nIGFub3RoZXIgb25lLiA6KAo+Cj4KPiAyMDIw64WEIDEy7JuUIDTs
nbwgKOq4iCkg7Jik7ZuEIDU6MDQsIENoYW8gWXUgPHl1Y2hhbzBAaHVhd2VpLmNvbT7ri5jsnbQg
7J6R7ISxOgo+Pgo+PiBPbiAyMDIwLzEyLzQgMTU6MjgsIERhZWhvIEplb25nIHdyb3RlOgo+PiA+
IEZyb206IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4+ID4KPj4gPiBJIGZv
dW5kIG91dCBmMmZzX2ZyZWVfZGljKCkgaXMgaW52b2tlZCBpbiBhIHdyb25nIHRpbWluZywgYnV0
Cj4+ID4gZjJmc192ZXJpZnlfYmlvKCkgc3RpbGwgbmVlZGVkIHRoZSBkaWMgaW5mbyBhbmQgaXQg
dHJpZ2dlcmVkIHRoZQo+PiA+IGJlbG93IGtlcm5lbCBwYW5pYy4gSXQgaGFzIGJlZW4gY2F1c2Vk
IGJ5IHRoZSByYWNlIGNvbmRpdGlvbiBvZgo+PiA+IHBlbmRpbmdfcGFnZXMgdmFsdWUgYmV0d2Vl
biBkZWNvbXByZXNzaW9uIGFuZCB2ZXJpdHkgbG9naWMsIHdoZW4KPj4gPiB0aGUgc2FtZSBjb21w
cmVzc2lvbiBjbHVzdGVyIGhhZCBiZWVuIHNwbGl0IGluIGRpZmZlcmVudCBiaW9zLgo+PiA+IEJ5
IHNwbGl0IGJpb3MsIGYyZnNfdmVyaWZ5X2JpbygpIGVuZGVkIHVwIHdpdGggZGVjcmVhc2luZwo+
PiA+IHBlbmRpbmdfcGFnZXMgdmFsdWUgYmVmb3JlIGl0IGlzIHJlc2V0IHRvIG5yX2NwYWdlcyBi
eQo+PiA+IGYyZnNfZGVjb21wcmVzc19wYWdlcygpIGFuZCBjYXVzZWQgdGhlIGtlcm5lbCBwYW5p
Yy4KPj4gPgo+PiA+IFsgNDQxNi41NjQ3NjNdIFVuYWJsZSB0byBoYW5kbGUga2VybmVsIE5VTEwg
cG9pbnRlciBkZXJlZmVyZW5jZQo+PiA+ICAgICAgICAgICAgICAgICBhdCB2aXJ0dWFsIGFkZHJl
c3MgMDAwMDAwMDAwMDAwMDAwMAo+PiA+IC4uLgo+PiA+IFsgNDQxNi44OTYwMTZdIFdvcmtxdWV1
ZTogZnN2ZXJpdHlfcmVhZF9xdWV1ZSBmMmZzX3Zlcml0eV93b3JrCj4+ID4gWyA0NDE2LjkwODUx
NV0gcGMgOiBmc3Zlcml0eV92ZXJpZnlfcGFnZSsweDIwLzB4NzgKPj4gPiBbIDQ0MTYuOTEzNzIx
XSBsciA6IGYyZnNfdmVyaWZ5X2JpbysweDExYy8weDI5Ywo+PiA+IFsgNDQxNi45MTM3MjJdIHNw
IDogZmZmZmZmYzAxOTUzM2NkMAo+PiA+IFsgNDQxNi45MTM3MjNdIHgyOTogZmZmZmZmYzAxOTUz
M2NkMCB4Mjg6IDAwMDAwMDAwMDAwMDA0MDIKPj4gPiBbIDQ0MTYuOTEzNzI0XSB4Mjc6IDAwMDAw
MDAwMDAwMDAwMDEgeDI2OiAwMDAwMDAwMDAwMDAwMTAwCj4+ID4gWyA0NDE2LjkxMzcyNl0geDI1
OiAwMDAwMDAwMDAwMDAwMDAxIHgyNDogMDAwMDAwMDAwMDAwMDAwNAo+PiA+IFsgNDQxNi45MTM3
MjddIHgyMzogMDAwMDAwMDAwMDAwMTAwMCB4MjI6IDAwMDAwMDAwMDAwMDAwMDAKPj4gPiBbIDQ0
MTYuOTEzNzI4XSB4MjE6IDAwMDAwMDAwMDAwMDAwMDAgeDIwOiBmZmZmZmZmZjIwNzZmOWMwCj4+
ID4gWyA0NDE2LjkxMzcyOV0geDE5OiBmZmZmZmZmZjIwNzZmOWMwIHgxODogZmZmZmZmOGEzMjM4
MGMzMAo+PiA+IFsgNDQxNi45MTM3MzFdIHgxNzogZmZmZmZmYzAxZjk2NmQ5NyB4MTY6IDAwMDAw
MDAwMDAwMDAyOTgKPj4gPiBbIDQ0MTYuOTEzNzMyXSB4MTU6IDAwMDAwMDAwMDAwMDAwMDAgeDE0
OiAwMDAwMDAwMDAwMDAwMDAwCj4+ID4gWyA0NDE2LjkxMzczM10geDEzOiBmMDc0ZmFlYzg5ZmZm
ZmZmIHgxMjogMDAwMDAwMDAwMDAwMDAwMAo+PiA+IFsgNDQxNi45MTM3MzRdIHgxMTogMDAwMDAw
MDAwMDAwMTAwMCB4MTA6IDAwMDAwMDAwMDAwMDEwMDAKPj4gPiBbIDQ0MTYuOTI5MTc2XSB4OSA6
IGZmZmZmZmZmMjBkMWY1YzcgeDggOiAwMDAwMDAwMDAwMDAwMDAwCj4+ID4gWyA0NDE2LjkyOTE3
OF0geDcgOiA2MjZkNzQ2NGZmMjg2YjZiIHg2IDogZmZmZmZmYzAxOTUzM2FkZQo+PiA+IFsgNDQx
Ni45MjkxNzldIHg1IDogMDAwMDAwMDA4MDQ5MDAwZSB4NCA6IGZmZmZmZmZmMjc5M2U5ZTAKPj4g
PiBbIDQ0MTYuOTI5MTgwXSB4MyA6IDAwMDAwMDAwODA0OTAwMGUgeDIgOiBmZmZmZmY4OWVjZmE3
NGQwCj4+ID4gWyA0NDE2LjkyOTE4MV0geDEgOiAwMDAwMDAwMDAwMDAwYzQwIHgwIDogZmZmZmZm
ZmYyMDc2ZjljMAo+PiA+IFsgNDQxNi45MjkxODRdIENhbGwgdHJhY2U6Cj4+ID4gWyA0NDE2Ljky
OTE4N10gIGZzdmVyaXR5X3ZlcmlmeV9wYWdlKzB4MjAvMHg3OAo+PiA+IFsgNDQxNi45MjkxODld
ICBmMmZzX3ZlcmlmeV9iaW8rMHgxMWMvMHgyOWMKPj4gPiBbIDQ0MTYuOTI5MTkyXSAgZjJmc192
ZXJpdHlfd29yaysweDU4LzB4ODQKPj4gPiBbIDQ0MTcuMDUwNjY3XSAgcHJvY2Vzc19vbmVfd29y
aysweDI3MC8weDQ3Ywo+PiA+IFsgNDQxNy4wNTUzNTRdICB3b3JrZXJfdGhyZWFkKzB4MjdjLzB4
NGQ4Cj4+ID4gWyA0NDE3LjA1OTc4NF0gIGt0aHJlYWQrMHgxM2MvMHgzMjAKPj4gPiBbIDQ0MTcu
MDYzNjkzXSAgcmV0X2Zyb21fZm9yaysweDEwLzB4MTgKPj4gPgo+PiA+IFNpZ25lZC1vZmYtYnk6
IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4+ID4gU2lnbmVkLW9mZi1ieTog
SmFlZ2V1ayBLaW0gPGphZWdldWtAa2VybmVsLm9yZz4KPj4gPiAtLS0KPj4gPiB2MjogbWVyZ2Vk
IHZlcml0eV9wYWdlcyB3aXRoIHBlbmRpbmdfcGFnZXMsIGFuZCBpbmNyZWFzZWQgdGhlCj4+ID4g
ICAgICBwZW5kaW5nX3BhZ2VzIGNvdW50IG9ubHkgaWYgU1RFUF9WRVJJVFkgaXMgc2V0IG9uIGJp
bwo+PiA+IC0tLQo+PiA+ICAgZnMvZjJmcy9jb21wcmVzcy5jIHwgMiAtLQo+PiA+ICAgZnMvZjJm
cy9kYXRhLmMgICAgIHwgMiArKwo+PiA+ICAgZnMvZjJmcy9mMmZzLmggICAgIHwgMiArLQo+PiA+
ICAgMyBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4+ID4K
Pj4gPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9jb21wcmVzcy5jIGIvZnMvZjJmcy9jb21wcmVzcy5j
Cj4+ID4gaW5kZXggODcwOTBkYTg2OTNkLi44MzJiMTk5ODZjYWYgMTAwNjQ0Cj4+ID4gLS0tIGEv
ZnMvZjJmcy9jb21wcmVzcy5jCj4+ID4gKysrIGIvZnMvZjJmcy9jb21wcmVzcy5jCj4+ID4gQEAg
LTgwMyw4ICs4MDMsNiBAQCB2b2lkIGYyZnNfZGVjb21wcmVzc19wYWdlcyhzdHJ1Y3QgYmlvICpi
aW8sIHN0cnVjdCBwYWdlICpwYWdlLCBib29sIHZlcml0eSkKPj4gPiAgICAgICBpZiAoY29wcy0+
ZGVzdHJveV9kZWNvbXByZXNzX2N0eCkKPj4gPiAgICAgICAgICAgICAgIGNvcHMtPmRlc3Ryb3lf
ZGVjb21wcmVzc19jdHgoZGljKTsKPj4gPiAgIG91dF9mcmVlX2RpYzoKPj4gPiAtICAgICBpZiAo
dmVyaXR5KQo+PiA+IC0gICAgICAgICAgICAgYXRvbWljX3NldCgmZGljLT5wZW5kaW5nX3BhZ2Vz
LCBkaWMtPm5yX2NwYWdlcyk7Cj4+ID4gICAgICAgaWYgKCF2ZXJpdHkpCj4+ID4gICAgICAgICAg
ICAgICBmMmZzX2RlY29tcHJlc3NfZW5kX2lvKGRpYy0+cnBhZ2VzLCBkaWMtPmNsdXN0ZXJfc2l6
ZSwKPj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHJldCwgZmFsc2UpOwo+PiA+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2RhdGEu
YyBiL2ZzL2YyZnMvZGF0YS5jCj4+ID4gaW5kZXggNDIyNTRkMzg1OWM3Li5iODI1ZDYzY2FiZGQg
MTAwNjQ0Cj4+ID4gLS0tIGEvZnMvZjJmcy9kYXRhLmMKPj4gPiArKysgYi9mcy9mMmZzL2RhdGEu
Ywo+PiA+IEBAIC0yMjkwLDYgKzIyOTAsOCBAQCBpbnQgZjJmc19yZWFkX211bHRpX3BhZ2VzKHN0
cnVjdCBjb21wcmVzc19jdHggKmNjLCBzdHJ1Y3QgYmlvICoqYmlvX3JldCwKPj4gPiAgICAgICAg
ICAgICAgIGN0eCA9IGJpby0+YmlfcHJpdmF0ZTsKPj4gPiAgICAgICAgICAgICAgIGlmICghKGN0
eC0+ZW5hYmxlZF9zdGVwcyAmICgxIDw8IFNURVBfREVDT01QUkVTUykpKQo+PiA+ICAgICAgICAg
ICAgICAgICAgICAgICBjdHgtPmVuYWJsZWRfc3RlcHMgfD0gMSA8PCBTVEVQX0RFQ09NUFJFU1M7
Cj4+ID4gKyAgICAgICAgICAgICBpZiAoY3R4LT5lbmFibGVkX3N0ZXBzICYgKDEgPDwgU1RFUF9W
RVJJVFkpKQo+PiA+ICsgICAgICAgICAgICAgICAgICAgICBhdG9taWNfaW5jKCZkaWMtPnBlbmRp
bmdfcGFnZXMpOwo+Pgo+PiBIbW0uLiBoYXZlIGEgZ2xhbmNlIGF0IHRoaXMsIHRoZW4gZjJmc19k
ZWNvbXByZXNzX3BhZ2VzKCkgd2lsbCBhbHdheXMgcmV0dXJuIGR1ZQo+PiB0byBhdG9taWNfZGVj
X3JldHVybigpIGlzIHRydWU/IHRoZW4gZjJmc19kb19kZWNvbXByZXNzX3BhZ2VzKCkgd2lsbCBu
ZXZlciBiZQo+PiBjYWxsZWQ/Cj4+Cj4+IGF0b21pY19pbmMoZGljLT52ZXJpdHlfcGFnZXMpIGhl
cmUgYW5kIGF0b21pY19kZWMoZGljLT52ZXJpdHlfcGFnZXMpIGluCj4+IGYyZnNfdmVyaWZ5X2Jp
bygpPwo+Pgo+PiAgICAgICAgIGlmIChhdG9taWNfZGVjX3JldHVybihkaWMtPnZlcml0eV9wYWdl
cykpCj4+ICAgICAgICAgICAgICAgICBjb250aW51ZTsKPj4KPj4gVGhhbmtzLAo+Pgo+PiA+Cj4+
ID4gICAgICAgICAgICAgICBpbmNfcGFnZV9jb3VudChzYmksIEYyRlNfUkRfREFUQSk7Cj4+ID4g
ICAgICAgICAgICAgICBmMmZzX3VwZGF0ZV9pb3N0YXQoc2JpLCBGU19EQVRBX1JFQURfSU8sIEYy
RlNfQkxLU0laRSk7Cj4+ID4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZjJmcy5oIGIvZnMvZjJmcy9m
MmZzLmgKPj4gPiBpbmRleCA5NGQxNmJkZTVlMjQuLmE5ZWU3OTIxYzdlYyAxMDA2NDQKPj4gPiAt
LS0gYS9mcy9mMmZzL2YyZnMuaAo+PiA+ICsrKyBiL2ZzL2YyZnMvZjJmcy5oCj4+ID4gQEAgLTEz
NDAsNyArMTM0MCw3IEBAIHN0cnVjdCBkZWNvbXByZXNzX2lvX2N0eCB7Cj4+ID4gICAgICAgc3Ry
dWN0IGNvbXByZXNzX2RhdGEgKmNidWY7ICAgICAvKiB2aXJ0dWFsIG1hcHBlZCBhZGRyZXNzIG9u
IGNwYWdlcyAqLwo+PiA+ICAgICAgIHNpemVfdCBybGVuOyAgICAgICAgICAgICAgICAgICAgLyog
dmFsaWQgZGF0YSBsZW5ndGggaW4gcmJ1ZiAqLwo+PiA+ICAgICAgIHNpemVfdCBjbGVuOyAgICAg
ICAgICAgICAgICAgICAgLyogdmFsaWQgZGF0YSBsZW5ndGggaW4gY2J1ZiAqLwo+PiA+IC0gICAg
IGF0b21pY190IHBlbmRpbmdfcGFnZXM7ICAgICAgICAgLyogaW4tZmxpZ2h0IGNvbXByZXNzZWQg
cGFnZSBjb3VudCAqLwo+PiA+ICsgICAgIGF0b21pY190IHBlbmRpbmdfcGFnZXM7ICAgICAgICAg
LyogaW4tZmxpZ2h0IGNvbXByZXNzZWQgKyB2ZXJpdHkgcGFnZSBjb3VudCAqLwo+PiA+ICAgICAg
IGJvb2wgZmFpbGVkOyAgICAgICAgICAgICAgICAgICAgLyogaW5kaWNhdGUgSU8gZXJyb3IgZHVy
aW5nIGRlY29tcHJlc3Npb24gKi8KPj4gPiAgICAgICB2b2lkICpwcml2YXRlOyAgICAgICAgICAg
ICAgICAgIC8qIHBheWxvYWQgYnVmZmVyIGZvciBzcGVjaWZpZWQgZGVjb21wcmVzc2lvbiBhbGdv
cml0aG0gKi8KPj4gPiAgICAgICB2b2lkICpwcml2YXRlMjsgICAgICAgICAgICAgICAgIC8qIGV4
dHJhIHBheWxvYWQgYnVmZmVyICovCj4+ID4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1m
MmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdl
Lm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
