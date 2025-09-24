Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA98B982DD
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Sep 2025 06:17:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:References:MIME-Version:Message-ID:Date:In-Reply-To:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PrH9rSMqt7ekHnw45kCyU3TX+JVJnS1LMWvGWQMW848=; b=era+KDL6SGsqnLmUGW8qlFaqmf
	BDrw2yrcYVchEZlxVwGQwplP2OMyPLU/CXI2eQUzIDn2qNo1PVZC9DgIN/M3y/wj4co7uW1tmGH90
	mw/H6pTi2lB/C81U2PkSMv3SmSuDYAjcA5bQiLDqZfNo/iKkN30KCb9z5baVPTXpJk+k=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v1GwU-0004bU-6h;
	Wed, 24 Sep 2025 04:17:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yunji0.kang@samsung.com>) id 1v1GwQ-0004bI-HQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Sep 2025 04:17:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jYbjNYvDcvxUJIbV4CcVlf3jrFpR4g5YEjPmTZVG/mg=; b=UvjKgROwt3PGkaVTbYRo36M/G9
 0teatLBIY6Npph0IRjKjAON8Eo9V1amKzzXR3W6Fe8bLvMMT7PErFjw2jh6VPcP8ItRtyRO3PSiwG
 u2yVF8ildW8kIlCyiR+dlTh3YRE0eI7isIlTEx591isaMNrIUKbsg5/o0+tL8kgbmzV0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID
 :Date:Subject:In-Reply-To:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jYbjNYvDcvxUJIbV4CcVlf3jrFpR4g5YEjPmTZVG/mg=; b=Ig4/Rf7z5zck2QFTCnh1huWL7p
 cpxL3UM/m4AzxmM4EfZHK/Y7xTh03OTznIX1XDKb+Y2CPMIsu4HoNm3j8PvG/sDvrBFyczZ0d0bT/
 mEYu2+ejSLn5SjxGlIaHKKOFM+dIqnHKqcqhU49QpwL6dIt/5hen4yoRIWEtRD3/LohM=;
Received: from mailout3.samsung.com ([203.254.224.33])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v1GwP-0002Cu-G8 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Sep 2025 04:17:18 +0000
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20250924041710epoutp036ff0b412d774ae10b1b66e1c8fa98c6a~oHOZtwRyq1940819408epoutp03f
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 24 Sep 2025 04:17:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20250924041710epoutp036ff0b412d774ae10b1b66e1c8fa98c6a~oHOZtwRyq1940819408epoutp03f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1758687430;
 bh=jYbjNYvDcvxUJIbV4CcVlf3jrFpR4g5YEjPmTZVG/mg=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=SxJvvQ4OaCXCEpurWuC5N9CZrzFk2kwvdzhn/abhjeutuKKnay9ibwsZpN97I1aCj
 N5mXZvuVgrspY0UDW3xtg7Zz5Y2G5IJYK5xmMqWMEwTWTF5SUxWxLIjVqQq3C6Knhf
 B0oTQ9lGEydGGZhfuVkofNJwwwqqAXkLl6nIkUw0=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPS id
 20250924041710epcas1p31839db2ffc0bb57e6874cc1f490e85ae~oHOZcEOi70590605906epcas1p3c;
 Wed, 24 Sep 2025 04:17:10 +0000 (GMT)
Received: from epcas1p2.samsung.com (unknown [182.195.36.227]) by
 epsnrtp03.localdomain (Postfix) with ESMTP id 4cWk855sfbz3hhTC; Wed, 24 Sep
 2025 04:17:09 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20250924041709epcas1p487d175805cbfb988b556ae4034995747~oHOYbA3Ls1797517975epcas1p4I;
 Wed, 24 Sep 2025 04:17:09 +0000 (GMT)
Received: from yunji0kang01 (unknown [10.253.100.171]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250924041709epsmtip21da12bfd155b24fefb4dd00ea7cbbe94~oHOYYAMdS2684526845epsmtip2P;
 Wed, 24 Sep 2025 04:17:09 +0000 (GMT)
From: "Yunji Kang" <yunji0.kang@samsung.com>
To: "'Chao Yu'" <chao@kernel.org>, <jaegeuk@kernel.org>
In-Reply-To: <89f237cd-3f86-405a-8f8f-d9cad250ef00@kernel.org>
Date: Wed, 24 Sep 2025 13:17:08 +0900
Message-ID: <00d401dc2d0a$18100c20$48302460$@samsung.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQLJ+3fmt+QCibYu+QNx3C6/vuLkWQHN7bNGAg+MCJSypyzxwA==
Content-Language: ko
X-CMS-MailID: 20250924041709epcas1p487d175805cbfb988b556ae4034995747
X-Msg-Generator: CA
CMS-TYPE: 101P
cpgsPolicy: CPGSC10-711,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250918082037epcas1p1eb201d3b6d5780c0bff3ba32740ccdcf
References: <CGME20250918082037epcas1p1eb201d3b6d5780c0bff3ba32740ccdcf@epcas1p1.samsung.com>
 <20250918082023.57381-1-yunji0.kang@samsung.com>
 <89f237cd-3f86-405a-8f8f-d9cad250ef00@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > > In f2fs_precache_extents(), For large files, It requires
 reading many > > node blocks. Instead of reading each node block with
 synchronous
 I/O, > > this patch applies readahead so that node blocks [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.33 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v1GwP-0002Cu-G8
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: readahead node blocks in
 F2FS_GET_BLOCK_PRECACHE mode
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
Cc: 'Sungjong Seo' <sj1557.seo@samsung.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

PiA+IEluIGYyZnNfcHJlY2FjaGVfZXh0ZW50cygpLCBGb3IgbGFyZ2UgZmlsZXMsIEl0IHJlcXVp
cmVzIHJlYWRpbmcgbWFueQo+ID4gbm9kZSBibG9ja3MuIEluc3RlYWQgb2YgcmVhZGluZyBlYWNo
IG5vZGUgYmxvY2sgd2l0aCBzeW5jaHJvbm91cyBJL08sCj4gPiB0aGlzIHBhdGNoIGFwcGxpZXMg
cmVhZGFoZWFkIHNvIHRoYXQgbm9kZSBibG9ja3MgY2FuIGJlIGZldGNoZWQgaW4KPiA+IGFkdmFu
Y2UuCj4gPgo+ID4gSXQgcmVkdWNlcyB0aGUgb3ZlcmhlYWQgb2YgcmVwZWF0ZWQgc3luYyByZWFk
cyBhbmQgaW1wcm92ZXMgZWZmaWNpZW5jeQo+ID4gd2hlbiBwcmVjYWNoaW5nIGV4dGVudHMgb2Yg
bGFyZ2UgZmlsZXMuCj4gPgo+ID4gSSBjcmVhdGVkIGEgZmlsZSB3aXRoIHRoZSBzYW1lIGxhcmdl
c3QgZXh0ZW50IGFuZCBleGVjdXRlZCB0aGUgdGVzdC4KPiA+IEZvciB0aGlzIGV4cGVyaW1lbnQs
IEkgc2V0IHRoZSBmaWxlJ3MgbGFyZ2VzdCBleHRlbnQgd2l0aCBhbiBvZmZzZXQgb2YKPiA+IDAg
YW5kIGEgc2l6ZSBvZiAxR0IuIEkgY29uZmlndXJlZCB0aGUgcmVtYWluaW5nIGFyZWEgd2l0aCAx
MDBNQiBleHRlbnRzLgo+ID4KPiA+IDVHQiB0ZXN0IGZpbGU6Cj4gPiBkZCBpZj0vZGV2L3VyYW5k
b20gb2Y9dGVzdDEgYnM9MW0gY291bnQ9NTEyMCBjcCB0ZXN0MSB0ZXN0MiBmc3luYwo+ID4gdGVz
dDEgZGQgaWY9dGVzdDEgb2Y9dGVzdDIgYnM9MW0gc2tpcD0xMDI0IHNlZWs9MTAyNCBjb3VudD0x
MDAKPiA+IGNvbnY9bm90cnVuYyBkZCBpZj10ZXN0MSBvZj10ZXN0MiBicz0xbSBza2lwPTEyMjQg
c2Vlaz0xMjI0IGNvdW50PTEwMAo+ID4gY29udj1ub3RydW5jIC4uLgo+ID4gZGQgaWY9dGVzdDEg
b2Y9dGVzdDIgYnM9MW0gc2tpcD01MDI0IHNlZWs9NTAyNCBjb3VudD0xMDAgY29udj1ub3RydW5j
Cj4gPiByZWJvb3QKPiA+Cj4gPiBJIGFsc28gY3JlYXRlZCAxMEdCIGFuZCAyMEdCIGZpbGVzIHdp
dGggbGFyZ2UgZXh0ZW50cyB1c2luZyB0aGUgc2FtZQo+ID4gbWV0aG9kLgo+ID4KPiA+IGlvY3Rs
KEYyRlNfSU9DX1BSRUNBQ0hFX0VYVEVOVFMpIHRlc3QgcmVzdWx0cyBhcmUgYXMgZm9sbG93czoK
PiA+ICAgKy0tLS0tLS0tLS0tKy0tLS0tLS0tLSstLS0tLS0tLS0rLS0tLS0tLS0tLS0rCj4gPiAg
IHwgRmlsZSBzaXplIHwgQmVmb3JlICB8IEFmdGVyICAgfCBSZWR1Y3Rpb24gfAo+ID4gICArLS0t
LS0tLS0tLS0rLS0tLS0tLS0tKy0tLS0tLS0tLSstLS0tLS0tLS0tLSsKPiA+ICAgfCA1R0IgICAg
ICAgfCAxMDEuOG1zIHwgNzIuMW1zICB8IDI5LjIlICAgICB8Cj4gPiAgIHwgMTBHQiAgICAgIHwg
MjIyLjltcyB8IDE0OS41bXMgfCAzMi45JSAgICAgfAo+ID4gICB8IDIwR0IgICAgICB8IDQ0Ni4y
bXMgfCAyNzYuM21zIHwgMzguMSUgICAgIHwKPiA+ICAgKy0tLS0tLS0tLS0tKy0tLS0tLS0tLSst
LS0tLS0tLS0rLS0tLS0tLS0tLS0rCj4gCj4gWXVuamksCj4gCj4gV2lsbCB3ZSBnYWluIGJldHRl
ciBwZXJmb3JtYW5jZSBpZiB3ZSByZWFkYWhlYWQgbW9yZSBub2RlIHBhZ2VzIHcvCj4gc3ljaHJv
bm91cyByZXF1ZXN0IGZvciBwcmVjYWNoZSBleHRlbnQgY2FzZT8gSGF2ZSB5b3UgdHJpZWQgdGhh
dD8KPiAKPiBUaGFua3MsCj4gCgpEb2VzIOKAnHJlYWRhaGVhZCBtb3JlIG5vZGUgcGFnZXPigJ0g
bWVhbiByZW1vdmluZyB0aGlzIGNvbmRpdGlvbj8NCiIgb2Zmc2V0W2kgLSAxXSAlIE1BWF9SQV9O
T0RFID09IDAgIg0KDQpJIG9yaWdpbmFsbHkgYWRkZWQgdGhlIGNvbmRpdGlvbiB0byBwcmV2ZW50
IHVubmVjZXNzYXJ5IHJlYWRhaGVhZCByZXF1ZXN0cywgDQpidXQgaXQgc2VlbXMgdGhpcyBjb25k
aXRpb24gd2FzIGFjdHVhbGx5IGJsb2NraW5nIHZhbGlkIHJlYWRhaGVhZCBhcyB3ZWxsLg0KDQpB
ZnRlciByZW1vdmluZyB0aGUgY29uZGl0aW9uIGFuZCBydW5uaW5nIHRlc3RzLCANCkkgY29uZmly
bWVkIHRoYXQgbW9yZSByZWFkYWhlYWQgbm9kZSBwYWdlcyBhcmUgYmVpbmcgaXNzdWVkLg0KDQpJ
4oCZbGwgc2hhcmUgdGhlIHRlc3QgcmVzdWx0cyBhbG9uZyB3aXRoIHRoZSBpbXByb3ZlZCBwYXRj
aC4NCg0KVGhhbmtzLA0KDQo+ID4gVGVzdGVkIG9uIGEgMjU2R0IgbW9iaWxlIGRldmljZSB3aXRo
IGFuIFNNODc1MCBjaGlwc2V0Lg0KPiA+DQo+ID4gUmV2aWV3ZWQtYnk6IFN1bmdqb25nIFNlbyA8
c2oxNTU3LnNlb0BzYW1zdW5nLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogU3VubWluIEplb25nIDxz
X21pbi5qZW9uZ0BzYW1zdW5nLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBZdW5qaSBLYW5nIDx5
dW5qaTAua2FuZ0BzYW1zdW5nLmNvbT4NCj4gPiAtLS0NCj4gPiB2MjoNCj4gPiAgLSBNb2RpZnkg
dGhlIHJlYWRhaGVhZCBjb25kaXRpb24gY2hlY2sgcm91dGluZSBmb3IgYmV0dGVyIGNvZGUNCj4g
PiByZWFkYWJpbGl0eS4NCj4gPiAgLSBVcGRhdGUgdGhlIHRpdGxlIGZyb20gJ25vZGUgYmxvY2sn
IHRvICdub2RlIGJsb2NrcycuDQo+ID4NCj4gPiAgZnMvZjJmcy9kYXRhLmMgfCAzICsrKw0KPiA+
ICBmcy9mMmZzL2YyZnMuaCB8IDEgKw0KPiA+ICBmcy9mMmZzL25vZGUuYyB8IDUgKysrKy0NCj4g
PiAgMyBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPg0K
PiA+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2RhdGEuYyBiL2ZzL2YyZnMvZGF0YS5jIGluZGV4DQo+
ID4gNzk2MWUwZGRmY2EzLi5hYjMxMTdlM2IyNGEgMTAwNjQ0DQo+ID4gLS0tIGEvZnMvZjJmcy9k
YXRhLmMNCj4gPiArKysgYi9mcy9mMmZzL2RhdGEuYw0KPiA+IEBAIC0xNTcyLDYgKzE1NzIsOSBA
QCBpbnQgZjJmc19tYXBfYmxvY2tzKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdA0KPiBmMmZz
X21hcF9ibG9ja3MgKm1hcCwgaW50IGZsYWcpDQo+ID4gIAlwZ29mcyA9CShwZ29mZl90KW1hcC0+
bV9sYmxrOw0KPiA+ICAJZW5kID0gcGdvZnMgKyBtYXhibG9ja3M7DQo+ID4NCj4gPiArCWlmIChm
bGFnID09IEYyRlNfR0VUX0JMT0NLX1BSRUNBQ0hFKQ0KPiA+ICsJCW1vZGUgPSBMT09LVVBfTk9E
RV9QUkVDQUNIRTsNCj4gPiArDQo+ID4gIG5leHRfZG5vZGU6DQo+ID4gIAlpZiAobWFwLT5tX21h
eV9jcmVhdGUpIHsNCj4gPiAgCQlpZiAoZjJmc19sZnNfbW9kZShzYmkpKQ0KPiA+IGRpZmYgLS1n
aXQgYS9mcy9mMmZzL2YyZnMuaCBiL2ZzL2YyZnMvZjJmcy5oIGluZGV4DQo+ID4gOWQzYmM5NjMz
YzFkLi4zY2U0MTUyOGQ0OGUgMTAwNjQ0DQo+ID4gLS0tIGEvZnMvZjJmcy9mMmZzLmgNCj4gPiAr
KysgYi9mcy9mMmZzL2YyZnMuaA0KPiA+IEBAIC02NTEsNiArNjUxLDcgQEAgZW51bSB7DQo+ID4g
IAkJCQkJICogbG9vayB1cCBhIG5vZGUgd2l0aCByZWFkYWhlYWQgY2FsbGVkDQo+ID4gIAkJCQkJ
ICogYnkgZ2V0X2RhdGFfYmxvY2suDQo+ID4gIAkJCQkJICovDQo+ID4gKwlMT09LVVBfTk9ERV9Q
UkVDQUNIRSwJCS8qIGxvb2sgdXAgYSBub2RlIGZvcg0KPiBGMkZTX0dFVF9CTE9DS19QUkVDQUNI
RSAqLw0KPiA+ICB9Ow0KPiA+DQo+ID4gICNkZWZpbmUgREVGQVVMVF9SRVRSWV9JT19DT1VOVAk4
CS8qIG1heGltdW0gcmV0cnkgcmVhZCBJTyBvciBmbHVzaA0KPiBjb3VudCAqLw0KPiA+IGRpZmYg
LS1naXQgYS9mcy9mMmZzL25vZGUuYyBiL2ZzL2YyZnMvbm9kZS5jIGluZGV4DQo+ID4gNDI1NGRi
NDUzYjJkLi5kNGJmM2NlNzE1YzUgMTAwNjQ0DQo+ID4gLS0tIGEvZnMvZjJmcy9ub2RlLmMNCj4g
PiArKysgYi9mcy9mMmZzL25vZGUuYw0KPiA+IEBAIC04NjAsNyArODYwLDEwIEBAIGludCBmMmZz
X2dldF9kbm9kZV9vZl9kYXRhKHN0cnVjdCBkbm9kZV9vZl9kYXRhICpkbiwNCj4gcGdvZmZfdCBp
bmRleCwgaW50IG1vZGUpDQo+ID4gIAkJCXNldF9uaWQocGFyZW50LCBvZmZzZXRbaSAtIDFdLCBu
aWRzW2ldLCBpID09IDEpOw0KPiA+ICAJCQlmMmZzX2FsbG9jX25pZF9kb25lKHNiaSwgbmlkc1tp
XSk7DQo+ID4gIAkJCWRvbmUgPSB0cnVlOw0KPiA+IC0JCX0gZWxzZSBpZiAobW9kZSA9PSBMT09L
VVBfTk9ERV9SQSAmJiBpID09IGxldmVsICYmIGxldmVsID4gMSkNCj4gew0KPiA+ICsJCX0gZWxz
ZSBpZiAoKGkgPT0gbGV2ZWwgJiYgbGV2ZWwgPiAxKSAmJg0KPiA+ICsJCQkJKG1vZGUgPT0gTE9P
S1VQX05PREVfUkEgfHwNCj4gPiArCQkJCShtb2RlID09IExPT0tVUF9OT0RFX1BSRUNBQ0hFICYm
DQo+ID4gKwkJCQlvZmZzZXRbaSAtIDFdICUgTUFYX1JBX05PREUgPT0gMCkpKSB7DQo+ID4gIAkJ
CW5mb2xpb1tpXSA9IGYyZnNfZ2V0X25vZGVfZm9saW9fcmEocGFyZW50LCBvZmZzZXRbaSAtDQo+
IDFdKTsNCj4gPiAgCQkJaWYgKElTX0VSUihuZm9saW9baV0pKSB7DQo+ID4gIAkJCQllcnIgPSBQ
VFJfRVJSKG5mb2xpb1tpXSk7DQoNCg0KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJm
cy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5u
ZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
