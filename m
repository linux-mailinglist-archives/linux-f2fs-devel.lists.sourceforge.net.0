Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B488ADCDC1
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Jun 2025 15:44:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U6vxtIvJH/hkx2npzjOt1WFfs6yDDvycKUECcQJYJv8=; b=Y49g5Ukaan0ocrNQTz1lxuNwlp
	Ch1idITbWybnVcMsR4yJWXJjSkSO9GkVTF8tngzHQKY7xgXk7vUdqzSs/NSaDpCRgyJn6z44kUbS5
	bks6U2OmNfJEN5SdZRj4J5DwR3t3FduHlTDB8gxOcsg+23FTsLZR5RZYWDkSmHmS+L/Y=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uRWbU-000644-NJ;
	Tue, 17 Jun 2025 13:43:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <huangjianan@xiaomi.com>) id 1uRWbS-00063t-CC
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Jun 2025 13:43:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Qaxnk9KrxfJE5K4CtPr9VRhHzX/mf9ffWuH0NkP+Yx4=; b=Kh9AaGCr8XpMevZcQ9UmiwoXl9
 E32LFS1meun0UGHQdol5z+wxPUCaush+AWYoOsnEbWaJYILaQroZcHsi4VsA8ceWpaAAg7qo6NOeT
 WOhOItbtPCd1qV7N+i5SY43pwbP8HIEfuCz9K3dDnmhZnQGE6XHMDMuuBooLzomlo6fQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Qaxnk9KrxfJE5K4CtPr9VRhHzX/mf9ffWuH0NkP+Yx4=; b=D49e7XTFCW3FXO4cWHLCrQbXdl
 zhakS8Mr+NgS5b+hI5W1z144FCg1MDLSlf4hKs2I750K4iGorXLcZqK+juerJ2rBfigrnFURwqs/q
 1QuCLpDJUUK6dD81pD5x/r/wmnZgBUoTpY8QqDwSAa/3/BqFUDGzhATQKfyw/4wnXnEw=;
Received: from outboundhk.mxmail.xiaomi.com ([207.226.244.123])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1uRWbR-0008HK-8q for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Jun 2025 13:43:54 +0000
X-CSE-ConnectionGUID: 5Jlkgj9cQpOszVpT0UOnCw==
X-CSE-MsgGUID: 07mjIRXqRYqaxnrSr7DpFA==
X-IronPort-AV: E=Sophos;i="6.16,243,1744041600"; d="scan'208";a="143427182"
To: Sheng Yong <shengyong2021@gmail.com>, Chao Yu <chao@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, "jaegeuk@kernel.org"
 <jaegeuk@kernel.org>
Thread-Topic: [External Mail]Re: [f2fs-dev] [PATCH] f2fs: avoid splitting bio
 when reading multiple pages
Thread-Index: AQHb34mYH3eV/c1rSUGC0WGXMdq3rbQG1n6A
Date: Tue, 17 Jun 2025 13:43:43 +0000
Message-ID: <340901da-47aa-4dab-8d54-b3f797274ab4@xiaomi.com>
References: <20250617055542.218681-1-huangjianan@xiaomi.com>
 <c89b359f-da89-4285-98c2-a98470a5f959@kernel.org>
 <5b27466d-4b39-432a-b7c3-b1918a0cc2d8@gmail.com>
In-Reply-To: <5b27466d-4b39-432a-b7c3-b1918a0cc2d8@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.88.13]
Content-ID: <309965ACF0F1CC408E00A74A5CBBDAD3@xiaomi.com>
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/6/17 21:13, Sheng Yong wrote: > > On 6/17/25 19:37, 
 Chao Yu via Linux-f2fs-devel wrote: >> On 6/17/25 13:55, Jianan Huang wrote:
 >>> When fewer pages are read, nr_pages may be smaller than nr_ [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [207.226.244.123 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uRWbR-0008HK-8q
Subject: Re: [f2fs-dev] [External Mail]Re: [PATCH] f2fs: avoid splitting bio
 when reading multiple pages
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
From: Huang Jianan via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Huang Jianan <huangjianan@xiaomi.com>
Cc: =?utf-8?B?55ub5YuH?= <shengyong1@xiaomi.com>,
 =?utf-8?B?546L6L6J?= <wanghui33@xiaomi.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNS82LzE3IDIxOjEzLCBTaGVuZyBZb25nIHdyb3RlOg0KPiANCj4gT24gNi8xNy8yNSAx
OTozNywgQ2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCB3cm90ZToNCj4+IE9uIDYvMTcvMjUg
MTM6NTUsIEppYW5hbiBIdWFuZyB3cm90ZToNCj4+PiBXaGVuIGZld2VyIHBhZ2VzIGFyZSByZWFk
LCBucl9wYWdlcyBtYXkgYmUgc21hbGxlciB0aGFuIG5yX2NwYWdlcy4gRHVlDQo+Pj4gdG8gdGhl
IG5yX3ZlY3MgbGltaXQsIHRoZSBjb21wcmVzc2VkIHBhZ2VzIHdpbGwgYmUgc3BsaXQgaW50byBt
dWx0aXBsZQ0KPj4+IGJpb3MgYW5kIHRoZW4gbWVyZ2VkIGF0IHRoZSBibG9jayBsZXZlbC4gSW4g
dGhpcyBjYXNlLCBucl9jcGFnZXMgc2hvdWxkDQo+Pj4gYmUgdXNlZCB0byBwcmUtYWxsb2NhdGUg
YnZlY3MuDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBKaWFuYW4gSHVhbmcgPGh1YW5namlhbmFu
QHhpYW9taS5jb20+DQo+Pj4gU2lnbmVkLW9mZi1ieTogU2hlbmcgWW9uZyA8c2hlbmd5b25nMUB4
aWFvbWkuY29tPg0KPj4+IC0tLQ0KPj4+IMKgIGZzL2YyZnMvZGF0YS5jIHwgMTAgKysrKystLS0t
LQ0KPj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0p
DQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9kYXRhLmMgYi9mcy9mMmZzL2RhdGEuYw0K
Pj4+IGluZGV4IDMxZTg5Mjg0MjYyNS4uYzc3NzNiMDlkODNmIDEwMDY0NA0KPj4+IC0tLSBhL2Zz
L2YyZnMvZGF0YS5jDQo+Pj4gKysrIGIvZnMvZjJmcy9kYXRhLmMNCj4+PiBAQCAtMjMwMyw3ICsy
MzAzLDggQEAgaW50IGYyZnNfcmVhZF9tdWx0aV9wYWdlcyhzdHJ1Y3QgY29tcHJlc3NfY3R4IA0K
Pj4+ICpjYywgc3RydWN0IGJpbyAqKmJpb19yZXQsDQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIH0NCj4+Pg0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoIWJpbykgew0KPj4+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBiaW8gPSBmMmZzX2dyYWJf
cmVhZF9iaW8oaW5vZGUsIGJsa2FkZHIsIG5yX3BhZ2VzLA0KPj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBiaW8gPSBmMmZzX2dyYWJfcmVhZF9iaW8oaW5vZGUsIGJs
a2FkZHIsDQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWF4KG5yX3BhZ2VzLCBjYy0+bnJfY3BhZ2VzKSAt
IGksDQo+Pg0KPj4gSGkgSmlhbmFuLA0KPj4NCj4+IGUuZy4NCj4+DQo+PiBVc2VyIHdhbnRzIHRv
IHJlYWQgcGFnZSBbMSwgNV0sDQo+PiBwYWdlICMxLDIsMyw0IGxvY2F0ZXMgaW4gY29tcHJlc3Nl
ZCBibG9jayAjMTAwMCwxMDAxLDEwMDMsDQo+PiBwYWdlICM1IGxvY2F0ZSBpbiBjb21wcmVzc2Vk
IGJsb2NrICMxMDA0LDEwMDUNCj4+DQo+PiBJdCBzdWJtaXRzIGZpcnN0IGJpbyB3LyBibG9jayAj
MTAwMCwxMDAxDQo+PiBJdCBhbGxvY2F0ZXMgc2Vjb25kIGJpbyB3LyBzaXplIG9mIG1heChucl9w
YWdlcz0xLCBucl9jcGFnZXM9MykgLSAyID0gMSA/DQo+PiBIb3dldmVyIGJsb2NrICMxMDAzIGFu
ZCBibG9jayAjMTAwNCwxMDA1IGNhbiBiZSByZWFkZWQgaW4gb25lIGJpbywgd2UNCj4+IHNob3Vs
ZCBhbGxvY2F0ZSBsYXJnZXIgYmlvIGZvciBsYXN0IGNvbnRpbnVvdXMgYmxvY2tzIHdoaWNoIGNy
b3NzIA0KPj4gY2x1c3RlcnMuDQo+IA0KPiBIaSwgQ2hhbywNCj4gDQo+IEkgdGhpbmsgYG1heChu
cl9wYWdlcywgY2MtPm5yX2NwYWdlcykgLSBpYCBjYW4gcmVzZXJ2ZSBlbm91Z2ggdmVjdG9ycyBp
biANCj4gYmlvDQo+IGZvciBsYXRlciByZWFkcy4gSUlVQywgdGhlIGNhc2UgYWJvdmUgaXM6DQo+
IA0KPiByZWFkIHBhZ2UgIzEsMiwzLDQgYXQgYmxrYWRkciAjMTAwMCwxMDAxLDEwMDM6DQo+ICDC
oCAqIG5yX3BhZ2VzPTUsIGNwYWdlcz0zLCBmb3IgdGhlIGZpcnN0IGJpbzEsIHZlYz1tYXgoNSwz
KS0wPTUgKDIgdmVjcyANCj4gYXJlIHVzZWQpDQo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmb3IgdGhlIHNlY29uZCBiaW8yLCB2ZWM9bWF4KDUs
MyktMj0zICgxIHZlYyANCj4gaXMgdXNlZCkNCj4gcmVhZCBwYWdlICM1IGF0IGJsa2FkZHIgIzEw
MDQsMTAwNSwgcHJldiBiaW8yIGlzIHN0aWxsIGF2YWlsYWJsZQ0KPiAgwqAgKiBucl9wYWdlcz0x
LCBjcGFnZXM9MiwgcHJldiBiaW8yLCAyIHZlY3MgbGVmdA0KPiANCj4gDQo+IEZvciBjYXNlOiBw
YWdlICMxLDIsMyw0IGF0IGNvbXByZXNzZWQgYmxrYWRkciAjMTAwMCwxMDAxLDEwMDMNCj4gIMKg
wqDCoMKgwqDCoMKgwqDCoCBwYWdlICM1LDYsNyw4IGF0IGNvbXByZXNzZWQgYmxrYWRkciAjMTAw
NCwxMDA1LDEwMDYNCj4gSWYgd2UgYXJlIHJlYWRpbmcgcGFnZVsxLDVdLCB3ZSBjb3VsZCBkbyBj
YWxjdWxhdGlvbiBhcyB0aGUgZm9sbG93aW5nPw0KPiANCj4gIMKgwqDCoCBtYXhfbnJfcGFnZXM9
YWxpZ24obnJfcGFnZXMsIGNsdXN0ZXJfc2l6ZSkNCj4gIMKgwqDCoCBtYXgobWF4X25yX3BhZ2Vz
LCBjYy0+bnJfY3BhZ2VzKSAtIGkNCj4gDQoNCmYyZnNfcmVhZF9tdWx0aV9wYWdlcyBvbmx5IHBy
b2Nlc3MgdGhlIGN1cnJlbnQgY2x1c3Rlciwgc28gdGhlcmUgYXJlIHR3byANCmNhc2VzOg0KMS4g
V2hlbiBhbGwgdGhlIHJlbWFpbmluZyBwYWdlcyBiZWxvbmcgdG8gdGhlIGN1cnJlbnQgY2x1c3Rl
ciwgDQoobnJfY3BhZ2VzIC0gaSkgaXMgZW5vdWdoIGZvciBhbGwgdmVjcy4NCjIuIFdoZW4gdGhl
cmUgYXJlIHBhZ2VzIGZyb20gb3RoZXIgY2x1c3RlcnMgeWV0IHRvIGJlIHByb2Nlc3NlZCwgDQoo
YWxpZ24obnJfcGFnZXMsIGNsdXN0ZXJfc2l6ZSkgLSBpKSBpcyBlbm91Z2ggZm9yIGFsbCB2ZWNz
Lg0KRm9yIGNhc2UgMSwgbnJfY3BhZ2VzIHNob3VsZCBiZSBlcXVhbCB0byBhbGlnbihucl9wYWdl
cywgY2x1c3Rlcl9zaXplKS4NClRoZXJlZm9yZSwgbWF4IGlzIG5vdCBuZWVkZWQuDQoNClRoYW5r
cywNCkppYW5hbg0KDQo+IA0KPiB0aGFua3MsDQo+IHNoZW5neW9uZw0KPj4NCj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgZjJmc19yYV9vcF9mbGFncyhyYWMpLA0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmb2xp
by0+aW5kZXgsIGZvcl93cml0ZSk7DQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBpZiAoSVNfRVJSKGJpbykpIHsNCj4+PiBAQCAtMjM3Myw3ICsyMzc0LDYgQEAg
c3RhdGljIGludCBmMmZzX21wYWdlX3JlYWRwYWdlcyhzdHJ1Y3QgaW5vZGUgDQo+Pj4gKmlub2Rl
LA0KPj4+IMKgwqDCoMKgIHBnb2ZmX3QgaW5kZXg7DQo+Pj4gwqAgI2VuZGlmDQo+Pj4gwqDCoMKg
wqAgdW5zaWduZWQgbnJfcGFnZXMgPSByYWMgPyByZWFkYWhlYWRfY291bnQocmFjKSA6IDE7DQo+
Pj4gLcKgwqDCoCB1bnNpZ25lZCBtYXhfbnJfcGFnZXMgPSBucl9wYWdlczsNCj4+DQo+PiBNYXli
ZSB3ZSBjYW4gYWxpZ24gYm90aCBzdGFydCBhbmQgZW5kIG9mIHJlYWQgcmFuZ2Ugdy8gY2x1c3Rl
cl9zaXplLCANCj4+IGFuZCB1c2UNCj4+IHN0YXJ0IGFuZCBlbmQgZm9yIG1heF9ucl9wYWdlcyBj
YWxjdWxhdGlvbiwgdGhlbiBwYXNzIGl0IHRvDQo+PiBmMmZzX3JlYWRfe211bHRpLHNpbmdsZX1f
cGFnZXMoKSwgc29tZXRoaW5nIGxpa2UgdGhpcz8NCj4+DQo+PiBtYXhfbnJfcGFnZXMgPSByb3Vu
ZF91cChlbmRfaWR4LCBjbHVzdGVyX3NpemUpIC0NCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHJvdW5kX2Rvd24oc3RhcnRfaWR4LCBjbHVzdGVyX3NpemUpOw0KPj4NCj4+IEl0cyBzaXpl
IHNob3VsZCBhbHdheXMgY292ZXIgc2l6ZSBvZiBhbGwgY3BhZ2UgYW5kL29yIHJwYWdlLg0KPj4N
Cj4+IFRoYW5rcywNCj4+DQo+Pj4gwqDCoMKgwqAgaW50IHJldCA9IDA7DQo+Pj4NCj4+PiDCoMKg
wqDCoCBtYXAubV9wYmxrID0gMDsNCj4+PiBAQCAtMjQwMCw3ICsyNDAwLDcgQEAgc3RhdGljIGlu
dCBmMmZzX21wYWdlX3JlYWRwYWdlcyhzdHJ1Y3QgaW5vZGUgDQo+Pj4gKmlub2RlLA0KPj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKiB0aGVyZSBhcmUgcmVtYWluZWQgY29tcHJlc3NlZCBw
YWdlcywgc3VibWl0IHRoZW0gKi8NCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFm
MmZzX2NsdXN0ZXJfY2FuX21lcmdlX3BhZ2UoJmNjLCBpbmRleCkpIHsNCj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9IGYyZnNfcmVhZF9tdWx0aV9wYWdl
cygmY2MsICZiaW8sDQo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1heF9ucl9w
YWdlcywNCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbnJfcGFnZXMsDQo+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAmbGFzdF9ibG9ja19pbl9iaW8sDQo+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByYWMsIGZhbHNlKTsNCj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGYyZnNfZGVzdHJveV9jb21wcmVzc19j
dHgoJmNjLCBmYWxzZSk7DQo+Pj4gQEAgLTI0MzIsNyArMjQzMiw3IEBAIHN0YXRpYyBpbnQgZjJm
c19tcGFnZV9yZWFkcGFnZXMoc3RydWN0IGlub2RlIA0KPj4+ICppbm9kZSwNCj4+PiDCoCByZWFk
X3NpbmdsZV9wYWdlOg0KPj4+IMKgICNlbmRpZg0KPj4+DQo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgcmV0ID0gZjJmc19yZWFkX3NpbmdsZV9wYWdlKGlub2RlLCBmb2xpbywgbWF4X25yX3Bh
Z2VzLCANCj4+PiAmbWFwLA0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9IGYyZnNf
cmVhZF9zaW5nbGVfcGFnZShpbm9kZSwgZm9saW8sIG5yX3BhZ2VzLCAmbWFwLA0KPj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAmYmlvLCAmbGFzdF9ibG9ja19pbl9iaW8sIHJhYyk7DQo+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGlmIChyZXQpIHsNCj4+PiDCoCAjaWZkZWYgQ09ORklHX0YyRlNfRlNf
Q09NUFJFU1NJT04NCj4+PiBAQCAtMjQ1MCw3ICsyNDUwLDcgQEAgc3RhdGljIGludCBmMmZzX21w
YWdlX3JlYWRwYWdlcyhzdHJ1Y3QgaW5vZGUgDQo+Pj4gKmlub2RlLA0KPj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyogbGFzdCBwYWdlICovDQo+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAobnJfcGFnZXMgPT0gMSAmJiAh
ZjJmc19jbHVzdGVyX2lzX2VtcHR5KCZjYykpIHsNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXQgPSBmMmZzX3JlYWRfbXVsdGlf
cGFnZXMoJmNjLCAmYmlvLA0KPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgbWF4X25yX3BhZ2VzLA0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgbnJfcGFnZXMsDQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJmxhc3RfYmxvY2tfaW5fYmlvLA0KPj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJhYywgZmFsc2UpOw0K
Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGYyZnNfZGVzdHJveV9jb21wcmVzc19jdHgoJmNjLCBmYWxzZSk7DQo+Pg0KPj4NCj4+DQo+
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPj4gTGlu
dXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QNCj4+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291
cmNlZm9yZ2UubmV0DQo+PiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0
aW5mby9saW51eC1mMmZzLWRldmVsDQo+IA0KDQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgt
ZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
