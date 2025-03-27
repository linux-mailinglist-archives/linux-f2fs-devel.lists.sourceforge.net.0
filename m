Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E48A72A45
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Mar 2025 07:44:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1txgyK-0003zZ-N9;
	Thu, 27 Mar 2025 06:44:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yohan.joung@sk.com>) id 1txgyI-0003zS-RO
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Mar 2025 06:44:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qilFpGbta7/gcGLItWMYaKO9y4dlnH2ag6LWOQTDfyM=; b=D50fvKUwpwpDttAaQhzEGix5/c
 Vbp8O63Omx+5WQaiGFbnVzY4rYWVYlwFeA/Z3goN3G7rVgfm4SMsk//Uecr/RCBn3dwBcTJXQGGLu
 jaJQhK23m8zxV8l38UrtaTHMJytxTBsAMa/q3HqCGMS5bbnHDsAfs4EghYb5T9NYh04U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qilFpGbta7/gcGLItWMYaKO9y4dlnH2ag6LWOQTDfyM=; b=LltUTZgZgX2Ni2TzcYB9k9N00e
 vykwVTXaB51TMuaE/8KFZrIshCiraRgxxCESmBZZm2U8Xfxb23nSNa39EUQ6tIOWmrHL+szASsiMG
 0QaPXp4yWoU30XGSDN1fI/YirbQGifPuHEoD6EGsw95Mhtc1MGhyGGTMjV2KaqrbTpPc=;
Received: from exvmail.skhynix.com ([166.125.252.79] helo=invmail.skhynix.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1txgy7-0001oK-6d for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Mar 2025 06:44:11 +0000
X-AuditID: a67dfc4e-97bff70000022046-13-67e4f3a78597
Received: from hymail21.hynixad.com (10.156.135.51) by hymail23.hynixad.com
 (10.156.135.53) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1544.14; Thu, 27 Mar
 2025 15:43:51 +0900
Received: from hymail21.hynixad.com ([10.156.135.51]) by hymail21.hynixad.com
 ([10.156.135.51]) with mapi id 15.02.1544.014;
 Thu, 27 Mar 2025 15:43:51 +0900
From: "yohan.joung@sk.com" <yohan.joung@sk.com>
To: Chao Yu <chao@kernel.org>, Yohan Joung <jyh429@gmail.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>, "daeho43@gmail.com"
 <daeho43@gmail.com>
Thread-Topic: [External Mail] Re: [PATCH] f2fs: prevent the current section
 from being selected as a victim during garbage collection
Thread-Index: AQHbnt3fELlyoJQ1W0qLIYQiUdi4aLOGhdAQ
Date: Thu, 27 Mar 2025 06:43:50 +0000
Message-ID: <2d95428375bd4a5592516bb6cefe4592@sk.com>
References: <20250326141428.280-1-yohan.joung@sk.com>
 <bf3f571c-a6bf-4a17-8745-039b37ac4f48@kernel.org>
In-Reply-To: <bf3f571c-a6bf-4a17-8745-039b37ac4f48@kernel.org>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.152.36.156]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFIsWRmVeSWpSXmKPExsXC9ZZnoe7yz0/SDQ40yVucnnqWyeLNkTMs
 Fk/Wz2K2+HL1GrvFpUXuDqweO2fdZffYtKqTzWP3gs9MAcxRXDYpqTmZZalF+nYJXBmTjm5j
 L5ghX7Hm91HmBsYNcl2MnBwSAiYSfx72snQxcnEICbxhlLjXtJYRwlnAKHHmwEI2kCo2AX2J
 469/sIIkRASmMkpc3X+cGcRhFjjMKDHt/HOwfmGBNkaJN4cvMUKUtTNK3J/7gBWkX0TASGLV
 6m3MIDaLgKrEyRtL2EFsXgFTiaNrZjOB2EICmRK7Tu4Hq+EUsJNo3LESaCoHB6OArMTVazIg
 YWYBcYnFX68xQxwuILFkz3koW1Ti5eN/rCDlEgKKEne3SoGYzAKaEut36UN0KkpM6X4ItVRQ
 4uTMJywQnZISB1fcYJnAKDYLyYJZCN2zkHTPQtK9gJFlFaNwZl5ZbmJmjl5xdkZlXmaFXnJ+
 7iZGYIwtq/3jt4Pxy4XgQ4wCHIxKPLwJHE/ShVgTy4orcw8xSnAwK4nwSl4BCvGmJFZWpRbl
 xxeV5qQWH2KU5mBREuc1+laeIiSQnliSmp2aWpBaBJNl4uCUamBkefOO49PLPvWZv4zWy/db
 TI5KX+vV+OXH9eZO4cC10e/ldL6cv3tv53oZgfdpDVPyDDU3X5pdFyJ7kGvbnJ27cqfMzNZZ
 2xZ+drpZZdaliIXrppdvrOT4cDmrauf1Hx79awteGbasvN7SvO/CZjsmPgUzy2/J0xM8vjJK
 CLCKnv+6JvLohk9OSizFGYmGWsxFxYkAsrDSOq0CAAA=
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > From: Chao Yu <chao@kernel.org> > Sent: Thursday, March
 27, 2025 3:02 PM > To: Yohan Joung <jyh429@gmail.com>; jaegeuk@kernel.org;
 daeho43@gmail.com > Cc: chao@kernel.org; linux-f2fs-devel@lists.sou [...]
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [166.125.252.79 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [166.125.252.79 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [166.125.252.79 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1txgy7-0001oK-6d
Subject: Re: [f2fs-dev] [External Mail] Re: [PATCH] f2fs: prevent the
 current section from being selected as a victim during garbage collection
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

PiBGcm9tOiBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IFRodXJzZGF5LCBNYXJj
aCAyNywgMjAyNSAzOjAyIFBNDQo+IFRvOiBZb2hhbiBKb3VuZyA8anloNDI5QGdtYWlsLmNvbT47
IGphZWdldWtAa2VybmVsLm9yZzsgZGFlaG80M0BnbWFpbC5jb20NCj4gQ2M6IGNoYW9Aa2VybmVs
Lm9yZzsgbGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQ7IGxpbnV4LQ0KPiBr
ZXJuZWxAdmdlci5rZXJuZWwub3JnOyDsoJXsmpTtlZwoSk9VTkcgWU9IQU4pIE1vYmlsZSBBRSA8
eW9oYW4uam91bmdAc2suY29tPg0KPiBTdWJqZWN0OiBbRXh0ZXJuYWwgTWFpbF0gUmU6IFtQQVRD
SF0gZjJmczogcHJldmVudCB0aGUgY3VycmVudCBzZWN0aW9uDQo+IGZyb20gYmVpbmcgc2VsZWN0
ZWQgYXMgYSB2aWN0aW0gZHVyaW5nIGdhcmJhZ2UgY29sbGVjdGlvbg0KPiANCj4gT24gMy8yNi8y
NSAyMjoxNCwgWW9oYW4gSm91bmcgd3JvdGU6DQo+ID4gV2hlbiBzZWxlY3RpbmcgYSB2aWN0aW0g
dXNpbmcgbmV4dF92aWN0aW1fc2VnIGluIGEgbGFyZ2Ugc2VjdGlvbiwgdGhlDQo+ID4gc2VsZWN0
ZWQgc2VjdGlvbiBtaWdodCBhbHJlYWR5IGhhdmUgYmVlbiBjbGVhcmVkIGFuZCBkZXNpZ25hdGVk
IGFzIHRoZQ0KPiA+IG5ldyBjdXJyZW50IHNlY3Rpb24sIG1ha2luZyBpdCBhY3RpdmVseSBpbiB1
c2UuDQo+ID4gVGhpcyBiZWhhdmlvciBjYXVzZXMgaW5jb25zaXN0ZW5jeSBiZXR3ZWVuIHRoZSBT
SVQgYW5kIFNTQS4NCj4gDQo+IEhpLCBkb2VzIHRoaXMgZml4IHlvdXIgaXNzdWU/DQoNClRoaXMg
aXMgYW4gaXNzdWUgdGhhdCBhcmlzZXMgd2hlbiBkaXZpZGluZyANCmEgbGFyZ2Ugc2VjdGlvbiBp
bnRvIHNlZ21lbnRzIGZvciBnYXJiYWdlIGNvbGxlY3Rpb24uDQpjYXVzZWQgYnkgdGhlIGJhY2tn
cm91bmQgR0MgKGdhcmJhZ2UgY29sbGVjdGlvbikgdGhyZWFkIGluIGxhcmdlIHNlY3Rpb24NCmYy
ZnNfZ2ModmljdGltX3NlY3Rpb24pIC0+IGYyZnNfY2xlYXJfcHJlZnJlZV9zZWdtZW50cyh2aWN0
aW1fc2VjdGlvbiktPiANCmN1cnNlYyh2aWN0aW1fc2VjdGlvbikgLT4gZjJmc19nYyh2aWN0aW1f
c2VjdGlvbiBieSBuZXh0X3ZpY3RpbV9zZWcpDQoNCkJlY2F1c2UgdGhlIGNhbGwgc3RhY2sgaXMg
ZGlmZmVyZW50LCANCkkgdGhpbmsgdGhhdCBpbiBvcmRlciB0byBoYW5kbGUgZXZlcnl0aGluZyBh
dCBvbmNlLCANCndlIG5lZWQgdG8gYWRkcmVzcyBpdCB3aXRoaW4gZG9fZ2FyYmFnZV9jb2xsZWN0
LCANCm9yIG90aGVyd2lzZSBpbmNsdWRlIGl0IG9uIGJvdGggc2lkZXMuIFdoYXQgZG8geW91IHRo
aW5rPw0KDQpbMzAxNDYuMzM3NDcxXVsgVDEzMDBdIEYyRlMtZnMgKGRtLTU0KTogSW5jb25zaXN0
ZW50IHNlZ21lbnQgKDcwOTYxKSB0eXBlIFswLCAxXSBpbiBTU0EgYW5kIFNJVA0KWzMwMTQ2LjM0
NjE1MV1bIFQxMzAwXSBDYWxsIHRyYWNlOg0KWzMwMTQ2LjM0NjE1Ml1bIFQxMzAwXSAgZHVtcF9i
YWNrdHJhY2UrMHhlOC8weDEwYw0KWzMwMTQ2LjM0NjE1N11bIFQxMzAwXSAgc2hvd19zdGFjaysw
eDE4LzB4MjgNClszMDE0Ni4zNDYxNThdWyBUMTMwMF0gIGR1bXBfc3RhY2tfbHZsKzB4NTAvMHg2
Yw0KWzMwMTQ2LjM0NjE2MV1bIFQxMzAwXSAgZHVtcF9zdGFjaysweDE4LzB4MjgNClszMDE0Ni4z
NDYxNjJdWyBUMTMwMF0gIGYyZnNfc3RvcF9jaGVja3BvaW50KzB4MWMvMHgzYw0KWzMwMTQ2LjM0
NjE2NV1bIFQxMzAwXSAgZG9fZ2FyYmFnZV9jb2xsZWN0KzB4NDFjLzB4MjcxYw0KWzMwMTQ2LjM0
NjE2N11bIFQxMzAwXSAgZjJmc19nYysweDI3Yy8weDgyOA0KWzMwMTQ2LjM0NjE2OF1bIFQxMzAw
XSAgZ2NfdGhyZWFkX2Z1bmMrMHgyOTAvMHg4OGMNClszMDE0Ni4zNDYxNjldWyBUMTMwMF0gIGt0
aHJlYWQrMHgxMWMvMHgxNjQNClszMDE0Ni4zNDYxNzJdWyBUMTMwMF0gIHJldF9mcm9tX2Zvcmsr
MHgxMC8weDIwDQoNCnN0cnVjdCBjdXJzZWdfaW5mbyA6IDB4ZmZmZmZmODAzZjk1ZTgwMCB7DQoJ
c2Vnbm8gICAgICAgIDogMHgxMTUzMSA6IDcwOTYxDQp9DQoNCnN0cnVjdCBmMmZzX3NiX2luZm8g
OiAweGZmZmZmZjg4MTFkMTIwMDAgew0KCW5leHRfdmljdGltX3NlZ1swXSA6IDB4MTE1MzEgOiA3
MDk2MQ0KfQ0KDQo+IA0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1mMmZzLWRldmVs
LzIwMjUwMzI1MDgwNjQ2LjMyOTE5NDctMi0NCj4gY2hhb0BrZXJuZWwub3JnDQo+IA0KPiBUaGFu
a3MsDQo+IA0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogWW9oYW4gSm91bmcgPHlvaGFuLmpvdW5n
QHNrLmNvbT4NCj4gPiAtLS0NCj4gPiAgZnMvZjJmcy9nYy5jIHwgNCArKysrDQo+ID4gIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9mcy9mMmZz
L2djLmMgYi9mcy9mMmZzL2djLmMgaW5kZXgNCj4gPiAyYjhmOTIzOWJlZGUuLjRiNWQxOGUzOTVl
YiAxMDA2NDQNCj4gPiAtLS0gYS9mcy9mMmZzL2djLmMNCj4gPiArKysgYi9mcy9mMmZzL2djLmMN
Cj4gPiBAQCAtMTkyNiw2ICsxOTI2LDEwIEBAIGludCBmMmZzX2djKHN0cnVjdCBmMmZzX3NiX2lu
Zm8gKnNiaSwgc3RydWN0DQo+IGYyZnNfZ2NfY29udHJvbCAqZ2NfY29udHJvbCkNCj4gPiAgCQln
b3RvIHN0b3A7DQo+ID4gIAl9DQo+ID4NCj4gPiArCWlmIChfX2lzX2xhcmdlX3NlY3Rpb24oc2Jp
KSAmJg0KPiA+ICsJCQlJU19DVVJTRUMoc2JpLCBHRVRfU0VDX0ZST01fU0VHKHNiaSwgc2Vnbm8p
KSkNCj4gPiArCQlnb3RvIHN0b3A7DQo+ID4gKw0KPiA+ICAJc2VnX2ZyZWVkID0gZG9fZ2FyYmFn
ZV9jb2xsZWN0KHNiaSwgc2Vnbm8sICZnY19saXN0LCBnY190eXBlLA0KPiA+ICAJCQkJZ2NfY29u
dHJvbC0+c2hvdWxkX21pZ3JhdGVfYmxvY2tzLA0KPiA+ICAJCQkJZ2NfY29udHJvbC0+b25lX3Rp
bWUpOw0KDQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8v
bGludXgtZjJmcy1kZXZlbAo=
