Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D0A6E5665
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Apr 2023 03:27:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1poa7r-0004dx-Ku;
	Tue, 18 Apr 2023 01:27:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yonggil.song@samsung.com>) id 1poa7p-0004dr-C1
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Apr 2023 01:27:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:In-Reply-To:CC:To:From:Sender:Reply-To:Subject:Mime-Version:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9jD8MkKc2CZWsO3dAiDEDnoLcBNmFJX5v2SzVETTPes=; b=edrBPVJDyW+t9+pbpSvxYNXIzh
 +5vFBC6ikGsrSdmc1Zl1QglSTc0rc1C7IMpZjSwAmY+n1Emi6IZgkoM2zWl6X4wSTUgQTeHtvQ7aV
 gP9H9sdpOG//0YgS+Gtf0gLEg1iRfizsQGQdH+92bifo7Ui46JqypvyU1HtbH6oJ6osI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:
 In-Reply-To:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9jD8MkKc2CZWsO3dAiDEDnoLcBNmFJX5v2SzVETTPes=; b=jaVC2k6rLcZiW+jahrEA9Mxy0n
 Bbjoa5+2UuQVyNdNKt9rW82TLx+iuGW/VzKF1ScLSPpML21ebrWu2oMoDpOV6KHx8Ppp0Syx1e5ip
 O6TrAkL3EiGsIazhW7/9I6gTCDWJZxqyyhHp19FwUiZ5A3ZQHaH71dDyODsiVbr4q6DU=;
Received: from mailout4.samsung.com ([203.254.224.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1poa7l-0005lM-Jf for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Apr 2023 01:27:18 +0000
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20230418012706epoutp045a517ab802ad24e674d310a8b708ef58~W4x2G35GQ0171601716epoutp04s
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 18 Apr 2023 01:27:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20230418012706epoutp045a517ab802ad24e674d310a8b708ef58~W4x2G35GQ0171601716epoutp04s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1681781226;
 bh=9jD8MkKc2CZWsO3dAiDEDnoLcBNmFJX5v2SzVETTPes=;
 h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
 b=bUqy8LZDERuHn0TRAwh6HZGVreteLhWcI9WFvf14m1u54ZpN5OA5IEOB+ySKj/OHK
 3RRxE6JgL7+f4BUTb+R5z+Eie4pi7Wu9g/u6W8NQHGE2PFxMU5HcWKJBrPPgk/MwbC
 1eM2mxn+x5ugIAc6z1cjSGVwpGPzxeLggHVCjkDg=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTP id
 20230418012706epcas2p483591a9d00395f697a4ffab95828e666~W4x15Zp6C2140621406epcas2p4s;
 Tue, 18 Apr 2023 01:27:06 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.68]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4Q0mVf0Xk3z4x9QF; Tue, 18 Apr
 2023 01:27:06 +0000 (GMT)
X-AuditID: b6c32a47-ca5fd700000026d2-60-643df1e97a44
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
 epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 69.E2.09938.9E1FD346; Tue, 18 Apr 2023 10:27:05 +0900 (KST)
Mime-Version: 1.0
From: Yonggil Song <yonggil.song@samsung.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <ZD2+sJcf3NALjEDC@google.com>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20230418012705epcms2p82e62d1e3f6c730ab1f050174987a702a@epcms2p8>
Date: Tue, 18 Apr 2023 10:27:05 +0900
X-CMS-MailID: 20230418012705epcms2p82e62d1e3f6c730ab1f050174987a702a
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEKsWRmVeSWpSXmKPExsWy7bCmhe7Lj7YpBnc/GVucnnqWyeLJ+lnM
 FpcWuTswe2xa1cnmsXvBZ6YApqhsm4zUxJTUIoXUvOT8lMy8dFsl7+B453hTMwNDXUNLC3Ml
 hbzE3FRbJRefAF23zBygHUoKZYk5pUChgMTiYiV9O5ui/NKSVIWM/OISW6XUgpScAvMCveLE
 3OLSvHS9vNQSK0MDAyNToMKE7Iwpp5YzFlxSqzh7+g5LA+Md5S5GTg4JAROJp+tmM3YxcnEI
 CexglFi6dz1bFyMHB6+AoMTfHcIgNcICbhJr7/1hArGFBJQkrh3oZYGI60tsXryMHcRmE9CV
 +LthOZgtIqAicWjRZTCbWaBI4vi+XkaIXbwSM9qfskDY0hLbl28Fi3MKaElMXTUfKq4h8WNZ
 LzOELSpxc/Vbdhj7/bH5UHNEJFrvnYWqEZR48HM3VFxSYtGh80wQdr7E3xXX2SDsGomtDW1Q
 cX2Jax0bwXbxCvhKTLh1CGw+i4CqRMeq46wQNS4SE6bfYYK4X1ti2cLXzKAgYRbQlFi/Sx/E
 lBBQljhyiwWigk+i4/BfdpgPd8x7ArVJTWLzps1QE2UkLjxug7rSQ+LYjRfMExgVZyHCeRaS
 XbMQdi1gZF7FKJZaUJybnlpsVGAMj9rk/NxNjODEpuW+g3HG2w96hxiZOBgPMUpwMCuJ8J5x
 tUoR4k1JrKxKLcqPLyrNSS0+xGgK9OVEZinR5Hxgas0riTc0sTQwMTMzNDcyNTBXEueVtj2Z
 LCSQnliSmp2aWpBaBNPHxMEp1cC0JEktg3tdxMeAyN7F/1zYnBLqqrhLYr4JMJ+6vkrIQe0l
 S8PbH1Er5+wI2TyPL9fveGPLkRU9p1Mi31iF6J9sir8VlCWYm/qvWGdeyDO33qnBVza9st1S
 /+O60zSmwsoW7SNCy5pTD5fpaf1lXPV0Q0PAV9ueD1x23Zl7Hy/hPjTT2Sgm5daUltstvTdm
 Bpg8m3D0AXPKyb9e239OurwjbonLqh1mE6PvTHqh7P05WXv5lwt7j27TWXuhjGnijU2/F6g6
 6P7YHzf3MUMov3Wb3Rwfu/bshu0hrXHLijf0l+WuV73smrAgYYlvwobV77XOPmm0XFV5cKN1
 hEX61w0/u649EJ6q0dRn/Yfp5oTXSizFGYmGWsxFxYkAxOiG//UDAAA=
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230414035331epcas2p2bdf8280ca5eb9a5050dd2cc5dfff0f14
References: <ZD2+sJcf3NALjEDC@google.com>
 <20230414035146.1381029-1-chao@kernel.org>
 <20230417030715epcms2p23a6154070f7140a5ae49c6e07114b88e@epcms2p2>
 <CGME20230414035331epcas2p2bdf8280ca5eb9a5050dd2cc5dfff0f14@epcms2p8>
X-Spam-Score: -3.2 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 04/17, Yonggil Song wrote: >> >Fixed a xfstests failure.
 >> > >> >From 400c722c2117660b83190c88e5442d63fbbffe6e Mon Sep 17 00:00:00
 2001 >> >From: Jaegeuk Kim <jaegeuk@kernel.org> >> >Date: Mon, 10 [...] 
 Content analysis details:   (-3.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.34 listed in wl.mailspike.net]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.34 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1poa7l-0005lM-Jf
Subject: Re: [f2fs-dev] (2)  [PATCH] f2fs_io: support checkpoint command
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
Reply-To: yonggil.song@samsung.com
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMDQvMTcsIFlvbmdnaWwgU29uZyB3cm90ZToKPj4gPkZpeGVkIGEgeGZzdGVzdHMgZmFpbHVy
ZS4KPj4gPgo+PiA+RnJvbSA0MDBjNzIyYzIxMTc2NjBiODMxOTBjODhlNTQ0MmQ2M2ZiYmZmZTZl
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+PiA+RnJvbTogSmFlZ2V1ayBLaW0gPGphZWdldWtA
a2VybmVsLm9yZz4KPj4gPkRhdGU6IE1vbiwgMTAgQXByIDIwMjMgMTQ6NDg6NTAgLTA3MDAKPj4g
PlN1YmplY3Q6IFtQQVRDSF0gZjJmczogcmVmYWN0b3IgZjJmc19nYyB0byBjYWxsIGNoZWNrcG9p
bnQgaW4gdXJnZW50IGNvbmRpdGlvbgo+PiA+Cj4+ID5UaGUgbWFqb3IgY2hhbmdlIGlzIHRvIGNh
bGwgY2hlY2twb2ludCwgaWYgdGhlcmUncyBub3QgZW5vdWdoIHNwYWNlIHdoaWxlIGhhdmluZwo+
PiA+c29tZSBwcmVmcmVlIHNlZ21lbnRzIGluIEZHX0dDIGNhc2UuCj4+ID4KPj4gPlNpZ25lZC1v
ZmYtYnk6IEphZWdldWsgS2ltIDxqYWVnZXVrQGtlcm5lbC5vcmc+Cj4+ID4tLS0KPj4gPiBmcy9m
MmZzL2djLmMgfCAyNyArKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0KPj4gPiAxIGZpbGUgY2hh
bmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCj4+ID4KPj4gPmRpZmYgLS1n
aXQgYS9mcy9mMmZzL2djLmMgYi9mcy9mMmZzL2djLmMKPj4gPmluZGV4IGM3NDhjZGZiMDUwMS4u
YmE1Nzc1ZGNhZGU2IDEwMDY0NAo+PiA+LS0tIGEvZnMvZjJmcy9nYy5jCj4+ID4rKysgYi9mcy9m
MmZzL2djLmMKPj4gPkBAIC0xODI5LDcgKzE4MjksMTAgQEAgaW50IGYyZnNfZ2Moc3RydWN0IGYy
ZnNfc2JfaW5mbyAqc2JpLCBzdHJ1Y3QgZjJmc19nY19jb250cm9sICpnY19jb250cm9sKQo+PiA+
IAkJZ290byBzdG9wOwo+PiA+IAl9Cj4+ID4gCj4+ID4tCWlmIChnY190eXBlID09IEJHX0dDICYm
IGhhc19ub3RfZW5vdWdoX2ZyZWVfc2VjcyhzYmksIDAsIDApKSB7Cj4+ID4rCS8qIExldCdzIHJ1
biBGR19HQywgaWYgd2UgZG9uJ3QgaGF2ZSBlbm91Z2ggc3BhY2UuICovCj4+ID4rCWlmIChoYXNf
bm90X2Vub3VnaF9mcmVlX3NlY3Moc2JpLCAwLCAwKSkgewo+PiA+KwkJZ2NfdHlwZSA9IEZHX0dD
Owo+PiA+Kwo+PiAKPj4gSGksIEphZWdldWsgJiBDaGFvCj4+IAo+PiBXb3VsZCBpdCBiZSBwb3Nz
aWJsZSB0byBjbGFyaWZ5IGlmIHRoaXMgcGF0Y2ggaXMgaW50ZW5kZWQgdG8gcGVyZm9ybSBjaGVj
a3BvaW50IGV2ZXJ5IGdjIHJvdW5kPwo+Cj5JbnRlbnRpb24gaXMgdG8gdHJpZ2dlciBjaGVja3Bv
aW50IHdoZW4gdGhlcmUncyBub3QgZW5vdWdoIGZyZWUgc3BhY2UuIFNvLCBpdCdzCj5ub3QgZm9y
IGV2ZXJ5IGdjIHJvdW5kLgo+CgpUaGFua3MgZm9yIHlvdXIgcmVwbHkuCgpXaGVuIHRoZSBmaWxl
IHN5c3RlbSBpcyBhbG1vc3QgZnVsbCwgdGhlIHZpY3RpbeKAmXMgdmFsaWQgYmxvY2tzIHJhdGlv
IGlzIGhpZ2guDQpUaGVyZWZvcmUsIG1vc3QgZ2Mgcm91bmRzIGNvbnN1bWUgZnJlZSBzZWN0aW9u
cyB0byByZWxvY2F0ZSB2aWN0aW1zLg0KU28sIGZyZWUgc2VjdGlvbnMgc2hyaW5rIGFuZCBwcmVm
cmVlIHJlbWFpbnMgYWZ0ZXIganVtcGluZyB0byBnY19tb3JlLg0KV291bGRu4oCZdCB0aGlzIHRy
aWdnZXIgYSBjaGVja3BvaW50IGV2ZXJ5IGdjIHJvdW5kPw0KDQpUaGFua3MuDQoNCj4+IA0KPj4g
VGhhbmtzLg0KPj4gDQo+PiA+IAkJLyoNCj4+ID4gCQkgKiBGb3IgZXhhbXBsZSwgaWYgdGhlcmUg
YXJlIG1hbnkgcHJlZnJlZV9zZWdtZW50cyBiZWxvdyBnaXZlbg0KPj4gPiAJCSAqIHRocmVzaG9s
ZCwgd2UgY2FuIG1ha2UgdGhlbSBmcmVlIGJ5IGNoZWNrcG9pbnQuIFRoZW4sIHdlDQo+PiA+QEAg
LTE4NDAsOCArMTg0Myw2IEBAIGludCBmMmZzX2djKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwg
c3RydWN0IGYyZnNfZ2NfY29udHJvbCAqZ2NfY29udHJvbCkNCj4+ID4gCQkJaWYgKHJldCkNCj4+
ID4gCQkJCWdvdG8gc3RvcDsNCj4+ID4gCQl9DQo+PiA+LQkJaWYgKGhhc19ub3RfZW5vdWdoX2Zy
ZWVfc2VjcyhzYmksIDAsIDApKQ0KPj4gPi0JCQlnY190eXBlID0gRkdfR0M7DQo+PiA+IAl9DQo+
PiA+IA0KPj4gPiAJLyogZjJmc19iYWxhbmNlX2ZzIGRvZXNuJ3QgbmVlZCB0byBkbyBCR19HQyBp
biBjcml0aWNhbCBwYXRoLiAqLw0KPj4gPkBAIC0xODY4LDE5ICsxODY5LDE1IEBAIGludCBmMmZz
X2djKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgc3RydWN0IGYyZnNfZ2NfY29udHJvbCAqZ2Nf
Y29udHJvbCkNCj4+ID4gCWlmIChzZWdfZnJlZWQgPT0gZjJmc191c2FibGVfc2Vnc19pbl9zZWMo
c2JpLCBzZWdubykpDQo+PiA+IAkJc2VjX2ZyZWVkKys7DQo+PiA+IA0KPj4gPi0JaWYgKGdjX3R5
cGUgPT0gRkdfR0MpDQo+PiA+KwlpZiAoZ2NfdHlwZSA9PSBGR19HQykgew0KPj4gPiAJCXNiaS0+
Y3VyX3ZpY3RpbV9zZWMgPSBOVUxMX1NFR05POw0KPj4gPiANCj4+ID4tCWlmIChnY19jb250cm9s
LT5pbml0X2djX3R5cGUgPT0gRkdfR0MgfHwNCj4+ID4tCSAgICAhaGFzX25vdF9lbm91Z2hfZnJl
ZV9zZWNzKHNiaSwNCj4+ID4tCQkJCShnY190eXBlID09IEZHX0dDKSA/IHNlY19mcmVlZCA6IDAs
IDApKSB7DQo+PiA+LQkJaWYgKGdjX3R5cGUgPT0gRkdfR0MgJiYgc2VjX2ZyZWVkIDwgZ2NfY29u
dHJvbC0+bnJfZnJlZV9zZWNzKQ0KPj4gPi0JCQlnb3RvIGdvX2djX21vcmU7DQo+PiA+LQkJZ290
byBzdG9wOw0KPj4gPi0JfQ0KPj4gPi0NCj4+ID4tCS8qIEZHX0dDIHN0b3BzIEdDIGJ5IHNraXBf
Y291bnQgKi8NCj4+ID4tCWlmIChnY190eXBlID09IEZHX0dDKSB7DQo+PiA+KwkJaWYgKCFoYXNf
bm90X2Vub3VnaF9mcmVlX3NlY3Moc2JpLCBzZWNfZnJlZWQsIDApKSB7DQo+PiA+KwkJCWlmICgh
Z2NfY29udHJvbC0+bm9fYmdfZ2MgJiYNCj4+ID4rCQkJICAgIHNlY19mcmVlZCA8IGdjX2NvbnRy
b2wtPm5yX2ZyZWVfc2VjcykNCj4+ID4rCQkJCWdvdG8gZ29fZ2NfbW9yZTsNCj4+ID4rCQkJZ290
byBzdG9wOw0KPj4gPisJCX0NCj4+ID4gCQlpZiAoc2JpLT5za2lwcGVkX2djX3J3c2VtKQ0KPj4g
PiAJCQlza2lwcGVkX3JvdW5kKys7DQo+PiA+IAkJcm91bmQrKzsNCj4+ID5AQCAtMTg4OSw2ICsx
ODg2LDggQEAgaW50IGYyZnNfZ2Moc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBzdHJ1Y3QgZjJm
c19nY19jb250cm9sICpnY19jb250cm9sKQ0KPj4gPiAJCQlyZXQgPSBmMmZzX3dyaXRlX2NoZWNr
cG9pbnQoc2JpLCAmY3BjKTsNCj4+ID4gCQkJZ290byBzdG9wOw0KPj4gPiAJCX0NCj4+ID4rCX0g
ZWxzZSBpZiAoIWhhc19ub3RfZW5vdWdoX2ZyZWVfc2VjcyhzYmksIDAsIDApKSB7DQo+PiA+KwkJ
Z290byBzdG9wOw0KPj4gPiAJfQ0KPj4gPiANCj4+ID4gCV9fZ2V0X3NlY3NfcmVxdWlyZWQoc2Jp
LCBOVUxMLCAmdXBwZXJfc2VjcywgTlVMTCk7DQo+PiA+LS0gDQo+PiA+Mi40MC4wLjYzNC5nNGNh
M2VmMzIxMS1nb29nDQo+PiA+DQo+PiA+DQo+PiA+DQo+PiA+X19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18NCj4+ID5MaW51eC1mMmZzLQ0KPj4gbWFpbGluZyBs
aXN0DQo+PiA+TGludXgtZjJmcy0NCj4+QGxpc3RzLnNvdXJjZWZvcmdlLm5ldA0KPj4gPmh0dHBz
Oi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtDQo+PgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYy
ZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2Uu
bmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYy
ZnMtZGV2ZWwK
