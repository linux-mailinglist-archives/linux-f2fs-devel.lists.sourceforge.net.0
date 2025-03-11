Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C20A5D332
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Mar 2025 00:38:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ts9BD-0001DG-NK;
	Tue, 11 Mar 2025 23:38:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yohan.joung@sk.com>) id 1ts9BC-0001D9-E9
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Mar 2025 23:38:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Dy6XTrg2YbesNpUIJUrv1Z+c70yw2cAxHzd8KzE7saM=; b=LDvJnIBU7qUjonJ1UwzbQD058D
 dzoAqiWhFv4ns4x/92p0gka1P1dVlbD2aKoiwgL8jygjvHt4xYWppv7ylq0iJFPj1e+hy4TxehF/v
 tj5s7xDPdehXPNGCnIyqUnyVfZUhaIDQajpannEedH946k93LRMco0o3/pk1yTrRI0Rs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Dy6XTrg2YbesNpUIJUrv1Z+c70yw2cAxHzd8KzE7saM=; b=KBVzO237M3O4NSLpYwnft95h4y
 9i2pqsbfxnms3IYS47QrMtDtdG4TIwPKFsKF0IMhpBH8rsKqyiIu1UJ71ufir9bKAl+5AtMRvGwRl
 BD2/gEgXhrFaRUy7+FzRl1/FWCSOGTn4p/InOBmcB8EgDlT0vOt5h4EdwyWykvEFcxTg=;
Received: from exvmail3.skhynix.com ([166.125.252.90]
 helo=invmail3.skhynix.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1ts9B0-000502-0l for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Mar 2025 23:38:34 +0000
X-AuditID: a67dfc59-057ff7000000aab6-ab-67d0c5dd97dd
Received: from hymail21.hynixad.com (10.156.135.51) by hymail19.hynixad.com
 (10.156.135.49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1544.14; Wed, 12 Mar
 2025 08:23:09 +0900
Received: from hymail21.hynixad.com ([10.156.135.51]) by hymail21.hynixad.com
 ([10.156.135.51]) with mapi id 15.02.1544.014;
 Wed, 12 Mar 2025 08:23:06 +0900
From: "yohan.joung@sk.com" <yohan.joung@sk.com>
To: Daeho Jeong <daeho43@gmail.com>, Chao Yu <chao@kernel.org>
Thread-Topic: [External Mail] Re: [PATCH] f2fs: optimize f2fs DIO overwrites
Thread-Index: AQHbkn00lv0bD/uNpkOSB4BEuT0LwbNt2ToAgAC3fdA=
Date: Tue, 11 Mar 2025 23:23:06 +0000
Message-ID: <f3b370421af94f16ab96dd43b8e9ae44@sk.com>
References: <20250307145650.568-1-yohan.joung@sk.com>
 <936351d5-e99c-4c5b-bd8b-8d541122f709@kernel.org>
 <CACOAw_xpcjaSPXTrPaZZzed6UbfLpdBEww8HDmUHU3yacaq7sg@mail.gmail.com>
In-Reply-To: <CACOAw_xpcjaSPXTrPaZZzed6UbfLpdBEww8HDmUHU3yacaq7sg@mail.gmail.com>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.152.36.156]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRmVeSWpSXmKPExsXC9ZZnoe7doxfSDf7flLc4PfUsk8WbI2dY
 LJ6sn8Vs8eXqNXaLS4vcHVg9ds66y+6xaVUnm8fuBZ+ZApijuGxSUnMyy1KL9O0SuDK+/DjI
 VLDFtOLdod1sDYwtJl2MHBwSAiYSc9qtuxi5OIQE3jBKLH33mw3CWcAo8ebHX9YuRk4ONgF9
 ieOvf4DZIgJ2Eg8f72UGKWIWmMAksffzDmaQhLCAt8T9fTPYIYp8JPae/ssCYVtJXHp2kQnE
 ZhFQlXj4vAesnlfAVGL11LnMENs2MEosW/QFbAOnQKDEjZZpbCDnMQrISly9JgMSZhYQl1j8
 9RpYr4SAgMSSPeehbFGJl4//sUJ8oyhxd6sUiMksoCmxfpc+RKeixJTuh+wQWwUlTs58wgLR
 KSlxcMUNlgmMYrOQLJiF0D0LSfcsJN0LGFlWMYpk5pXlJmbmGOsVZ2dU5mVW6CXn525iBMbX
 sto/kTsYv10IPsQowMGoxMO7Q+5CuhBrYllxZe4hRgkOZiUR3tW2QCHelMTKqtSi/Pii0pzU
 4kOM0hwsSuK8Rt/KU4QE0hNLUrNTUwtSi2CyTBycUg2M9Wr3DL9VbFq8tHaDXZLBZHX2ZZN2
 vG5YxXH4edfqF+L7DR/0i0c8Y3qWrXVVn/9FZ9wp/d1SEd/XCUkmbVzNXvEyZ37E7duHzz46
 tPl8bYzqr4WJZ/Y/iPjj/rP24j1uQ3N+74jDPzdPDc0x3f/E+9+CJu6T7lJ5a2f6cH4RuPJa
 iLXOzs3nthJLcUaioRZzUXEiAMSMayGrAgAA
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > From: Daeho Jeong <daeho43@gmail.com> > Sent: Wednesday,
 March 12, 2025 6:14 AM > To: Chao Yu <chao@kernel.org> > Cc: Yohan Joung
 <jyh429@gmail.com>; jaegeuk@kernel.org; linux-f2fs- > devel@lists.so [...]
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [166.125.252.90 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [166.125.252.90 listed in sa-trusted.bondedsender.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1ts9B0-000502-0l
Subject: Re: [f2fs-dev] [External Mail] Re: [PATCH] f2fs: optimize f2fs DIO
 overwrites
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
Cc: "pilhyun.kim@sk.com" <pilhyun.kim@sk.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yohan Joung <jyh429@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

PiBGcm9tOiBEYWVobyBKZW9uZyA8ZGFlaG80M0BnbWFpbC5jb20+DQo+IFNlbnQ6IFdlZG5lc2Rh
eSwgTWFyY2ggMTIsIDIwMjUgNjoxNCBBTQ0KPiBUbzogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3Jn
Pg0KPiBDYzogWW9oYW4gSm91bmcgPGp5aDQyOUBnbWFpbC5jb20+OyBqYWVnZXVrQGtlcm5lbC5v
cmc7IGxpbnV4LWYyZnMtDQo+IGRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldDsgbGludXgta2Vy
bmVsQHZnZXIua2VybmVsLm9yZzsg7KCV7JqU7ZWcKEpPVU5HDQo+IFlPSEFOKSBNb2JpbGUgQUUg
PHlvaGFuLmpvdW5nQHNrLmNvbT4NCj4gU3ViamVjdDogW0V4dGVybmFsIE1haWxdIFJlOiBbUEFU
Q0hdIGYyZnM6IG9wdGltaXplIGYyZnMgRElPIG92ZXJ3cml0ZXMNCj4gDQo+IE9uIFR1ZSwgTWFy
IDExLCAyMDI1IGF0IDU6MDDigK9BTSBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+IHdyb3RlOg0K
PiA+DQo+ID4gT24gMy83LzI1IDIyOjU2LCBZb2hhbiBKb3VuZyB3cm90ZToNCj4gPiA+IHRoaXMg
aXMgdW5uZWNlc3Nhcnkgd2hlbiB3ZSBrbm93IHdlIGFyZSBvdmVyd3JpdGluZyBhbHJlYWR5DQo+
ID4gPiBhbGxvY2F0ZWQgYmxvY2tzIGFuZCB0aGUgb3ZlcmhlYWQgb2Ygc3RhcnRpbmcgYSB0cmFu
c2FjdGlvbiBjYW4gYmUNCj4gPiA+IHNpZ25pZmljYW50IGVzcGVjaWFsbHkgZm9yIG11bHRpdGhy
ZWFkZWQgd29ya2xvYWRzIGRvaW5nIHNtYWxsIHdyaXRlcy4NCj4gPg0KPiA+IEhpIFlvaGFuLA0K
PiA+DQo+ID4gU28geW91J3JlIHRyeWluZyB0byBhdm9pZCBmMmZzX21hcF9sb2NrKCkgaW4gZGlv
IHdyaXRlIHBhdGgsIHJpZ2h0Pw0KPiA+DQo+ID4gVGhhbmtzLA0KPiA+DQo+ID4gPg0KPiA+ID4g
U2lnbmVkLW9mZi1ieTogWW9oYW4gSm91bmcgPHlvaGFuLmpvdW5nQHNrLmNvbT4NCj4gPiA+IC0t
LQ0KPiA+ID4gIGZzL2YyZnMvZGF0YS5jIHwgMjAgKysrKysrKysrKysrKysrKysrKysgIGZzL2Yy
ZnMvZjJmcy5oIHwgIDEgKw0KPiA+ID4gZnMvZjJmcy9maWxlLmMgfCAgNSArKysrLQ0KPiA+ID4g
IDMgZmlsZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+ID4N
Cj4gPiA+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2RhdGEuYyBiL2ZzL2YyZnMvZGF0YS5jIGluZGV4
DQo+ID4gPiAwOTQzN2RiZDFiNDIuLjcyODYzMDAzN2I3NCAxMDA2NDQNCj4gPiA+IC0tLSBhL2Zz
L2YyZnMvZGF0YS5jDQo+ID4gPiArKysgYi9mcy9mMmZzL2RhdGEuYw0KPiA+ID4gQEAgLTQyNjcs
NiArNDI2NywyNiBAQCBzdGF0aWMgaW50IGYyZnNfaW9tYXBfYmVnaW4oc3RydWN0IGlub2RlICpp
bm9kZSwNCj4gbG9mZl90IG9mZnNldCwgbG9mZl90IGxlbmd0aCwNCj4gPiA+ICAgICAgIHJldHVy
biAwOw0KPiA+ID4gIH0NCj4gPiA+DQo+ID4gPiArc3RhdGljIGludCBmMmZzX2lvbWFwX292ZXJ3
cml0ZV9iZWdpbihzdHJ1Y3QgaW5vZGUgKmlub2RlLCBsb2ZmX3QNCj4gb2Zmc2V0LA0KPiA+ID4g
KyAgICAgICAgICAgICBsb2ZmX3QgbGVuZ3RoLCB1bnNpZ25lZCBmbGFncywgc3RydWN0IGlvbWFw
ICppb21hcCwNCj4gPiA+ICsgICAgICAgICAgICAgc3RydWN0IGlvbWFwICpzcmNtYXApDQo+ID4g
PiArew0KPiA+ID4gKyAgICAgaW50IHJldDsNCj4gPiA+ICsNCj4gPiA+ICsgICAgIC8qDQo+ID4g
PiArICAgICAgKiBFdmVuIGZvciB3cml0ZXMgd2UgZG9uJ3QgbmVlZCB0byBhbGxvY2F0ZSBibG9j
a3MsIHNvIGp1c3QNCj4gcHJldGVuZA0KPiA+ID4gKyAgICAgICogd2UgYXJlIHJlYWRpbmcgdG8g
c2F2ZSBvdmVyaGVhZCBvZiBzdGFydGluZyBhIHRyYW5zYWN0aW9uLg0KPiA+ID4gKyAgICAgICov
DQo+ID4gPiArICAgICBmbGFncyAmPSB+SU9NQVBfV1JJVEU7DQo+ID4gPiArICAgICByZXQgPSBm
MmZzX2lvbWFwX2JlZ2luKGlub2RlLCBvZmZzZXQsIGxlbmd0aCwgZmxhZ3MsIGlvbWFwLA0KPiBz
cmNtYXApOw0KPiA+ID4gKyAgICAgV0FSTl9PTl9PTkNFKCFyZXQgJiYgaW9tYXAtPnR5cGUgIT0g
SU9NQVBfTUFQUEVEKTsNCj4gPiA+ICsgICAgIHJldHVybiByZXQ7DQo+ID4gPiArfQ0KPiA+ID4g
Kw0KPiA+ID4gIGNvbnN0IHN0cnVjdCBpb21hcF9vcHMgZjJmc19pb21hcF9vcHMgPSB7DQo+ID4g
PiAgICAgICAuaW9tYXBfYmVnaW4gICAgPSBmMmZzX2lvbWFwX2JlZ2luLA0KPiA+ID4gIH07DQo+
ID4gPiArDQo+ID4gPiArY29uc3Qgc3RydWN0IGlvbWFwX29wcyBmMmZzX2lvbWFwX292ZXJ3cml0
ZV9vcHMgPSB7DQo+ID4gPiArICAgICAuaW9tYXBfYmVnaW4gICAgPSBmMmZzX2lvbWFwX292ZXJ3
cml0ZV9iZWdpbiwNCj4gPiA+ICt9Ow0KPiA+ID4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZjJmcy5o
IGIvZnMvZjJmcy9mMmZzLmggaW5kZXgNCj4gPiA+IGM2Y2MyNjk0ZjlhYy4uMDUxMWFiNWVkNDJh
IDEwMDY0NA0KPiA+ID4gLS0tIGEvZnMvZjJmcy9mMmZzLmgNCj4gPiA+ICsrKyBiL2ZzL2YyZnMv
ZjJmcy5oDQo+ID4gPiBAQCAtMzkzNiw2ICszOTM2LDcgQEAgdm9pZCBmMmZzX2Rlc3Ryb3lfcG9z
dF9yZWFkX3Byb2Nlc3Npbmcodm9pZCk7DQo+ID4gPiAgaW50IGYyZnNfaW5pdF9wb3N0X3JlYWRf
d3Eoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKTsgIHZvaWQNCj4gPiA+IGYyZnNfZGVzdHJveV9w
b3N0X3JlYWRfd3Eoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKTsgIGV4dGVybiBjb25zdA0KPiA+
ID4gc3RydWN0IGlvbWFwX29wcyBmMmZzX2lvbWFwX29wczsNCj4gPiA+ICtleHRlcm4gY29uc3Qg
c3RydWN0IGlvbWFwX29wcyBmMmZzX2lvbWFwX292ZXJ3cml0ZV9vcHM7DQo+ID4gPg0KPiA+ID4g
IHN0YXRpYyBpbmxpbmUgc3RydWN0IHBhZ2UgKmYyZnNfZmluZF9kYXRhX3BhZ2Uoc3RydWN0IGlu
b2RlICppbm9kZSwNCj4gPiA+ICAgICAgICAgICAgICAgcGdvZmZfdCBpbmRleCwgcGdvZmZfdCAq
bmV4dF9wZ29mcykgZGlmZiAtLWdpdA0KPiA+ID4gYS9mcy9mMmZzL2ZpbGUuYyBiL2ZzL2YyZnMv
ZmlsZS5jIGluZGV4IDgyYjIxYmFmNTYyOC4uYmIyZmU2ZGFjOWI2DQo+ID4gPiAxMDA2NDQNCj4g
PiA+IC0tLSBhL2ZzL2YyZnMvZmlsZS5jDQo+ID4gPiArKysgYi9mcy9mMmZzL2ZpbGUuYw0KPiA+
ID4gQEAgLTQ5ODUsNiArNDk4NSw3IEBAIHN0YXRpYyBzc2l6ZV90IGYyZnNfZGlvX3dyaXRlX2l0
ZXIoc3RydWN0IGtpb2NiDQo+ICppb2NiLCBzdHJ1Y3QgaW92X2l0ZXIgKmZyb20sDQo+ID4gPiAg
ICAgICBjb25zdCBzc2l6ZV90IGNvdW50ID0gaW92X2l0ZXJfY291bnQoZnJvbSk7DQo+ID4gPiAg
ICAgICB1bnNpZ25lZCBpbnQgZGlvX2ZsYWdzOw0KPiA+ID4gICAgICAgc3RydWN0IGlvbWFwX2Rp
byAqZGlvOw0KPiA+ID4gKyAgICAgY29uc3Qgc3RydWN0IGlvbWFwX29wcyAqaW9tYXBfb3BzID0g
JmYyZnNfaW9tYXBfb3BzOw0KPiA+ID4gICAgICAgc3NpemVfdCByZXQ7DQo+ID4gPg0KPiA+ID4g
ICAgICAgdHJhY2VfZjJmc19kaXJlY3RfSU9fZW50ZXIoaW5vZGUsIGlvY2IsIGNvdW50LCBXUklU
RSk7IEBADQo+ID4gPiAtNTAyNSw3ICs1MDI2LDkgQEAgc3RhdGljIHNzaXplX3QgZjJmc19kaW9f
d3JpdGVfaXRlcihzdHJ1Y3Qga2lvY2INCj4gKmlvY2IsIHN0cnVjdCBpb3ZfaXRlciAqZnJvbSwN
Cj4gPiA+ICAgICAgIGRpb19mbGFncyA9IDA7DQo+ID4gPiAgICAgICBpZiAocG9zICsgY291bnQg
PiBpbm9kZS0+aV9zaXplKQ0KPiA+ID4gICAgICAgICAgICAgICBkaW9fZmxhZ3MgfD0gSU9NQVBf
RElPX0ZPUkNFX1dBSVQ7DQo+ID4gPiAtICAgICBkaW8gPSBfX2lvbWFwX2Rpb19ydyhpb2NiLCBm
cm9tLCAmZjJmc19pb21hcF9vcHMsDQo+ID4gPiArICAgICBlbHNlIGlmIChmMmZzX292ZXJ3cml0
ZV9pbyhpbm9kZSwgcG9zLCBjb3VudCkpDQo+ID4gPiArICAgICAgICAgICAgIGlvbWFwX29wcyA9
ICZmMmZzX2lvbWFwX292ZXJ3cml0ZV9vcHM7DQo+ID4gPiArICAgICBkaW8gPSBfX2lvbWFwX2Rp
b19ydyhpb2NiLCBmcm9tLCBpb21hcF9vcHMsDQo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAmZjJmc19pb21hcF9kaW9fd3JpdGVfb3BzLCBkaW9fZmxhZ3MsIE5VTEwsIDApOw0KPiA+
ID4gICAgICAgaWYgKElTX0VSUl9PUl9OVUxMKGRpbykpIHsNCj4gPiA+ICAgICAgICAgICAgICAg
cmV0ID0gUFRSX0VSUl9PUl9aRVJPKGRpbyk7DQo+IA0KPiBJIHRoaW5rIHdlIGNhbiBhZGQgdGhl
IG92ZXJ3cml0ZSBjaGVjayBpbiBmMmZzX2lvbWFwX2JlZ2luKCkgYmVmb3JlDQo+IHNldHRpbmcg
dGhlIG1hcC5tX21heV9jcmVhdGUsIGluc3RlYWQgb2YgYWRkaW5nIGEgbmV3IGZ1bmN0aW9uDQo+
IGYyZnNfaW9tYXBfb3ZlcndyaXRlX2JlZ2luKCkuDQo+IFdoYXQgZG8geW91IHRoaW5rPw0KRGFl
aG8sIElzIHRoaXMgdGhlIHdheSB5b3Ugd2FudCBpdCBjaGFuZ2VkPyBJZiBzbywgSSdsbCB1cGxv
YWQgaXQgbGlrZSB0aGlzIA0Kc3RhdGljIGludCBmMmZzX2lvbWFwX2JlZ2luKHN0cnVjdCBpbm9k
ZSAqaW5vZGUsIGxvZmZfdCBvZmZzZXQsIGxvZmZfdCBsZW5ndGgsDQoJCQkgICAgdW5zaWduZWQg
aW50IGZsYWdzLCBzdHJ1Y3QgaW9tYXAgKmlvbWFwLA0KCQkJICAgIHN0cnVjdCBpb21hcCAqc3Jj
bWFwKQ0Kew0KCXN0cnVjdCBmMmZzX21hcF9ibG9ja3MgbWFwID0ge307DQoJcGdvZmZfdCBuZXh0
X3Bnb2ZzID0gMDsNCglpbnQgZXJyOw0KDQoJbWFwLm1fbGJsayA9IEYyRlNfQllURVNfVE9fQkxL
KG9mZnNldCk7DQoJbWFwLm1fbGVuID0gRjJGU19CWVRFU19UT19CTEsob2Zmc2V0ICsgbGVuZ3Ro
IC0gMSkgLSBtYXAubV9sYmxrICsgMTsNCgltYXAubV9uZXh0X3Bnb2ZzID0gJm5leHRfcGdvZnM7
DQoJbWFwLm1fc2VnX3R5cGUgPSBmMmZzX3J3X2hpbnRfdG9fc2VnX3R5cGUoRjJGU19JX1NCKGlu
b2RlKSwNCgkJCQkJCWlub2RlLT5pX3dyaXRlX2hpbnQpOw0KCWlmICgoZmxhZ3MgJiBJT01BUF9X
UklURSkgJiYgIWYyZnNfb3ZlcndyaXRlX2lvKGlub2RlLCBvZmZzZXQsIGxlbmd0aCkpDQoJCW1h
cC5tX21heV9jcmVhdGUgPSB0cnVlOw0KDQo+IA0KPiA+DQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QK
TGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
