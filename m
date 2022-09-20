Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C1E5BE488
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Sep 2022 13:32:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oabUh-0003Gb-9M;
	Tue, 20 Sep 2022 11:32:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhangqilong3@huawei.com>) id 1oabUT-0003BQ-Rn
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Sep 2022 11:32:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CaK/j5kP2kCeHBkm7cqo+dxTZaXKhjeb0vAuv6K/0Ag=; b=RHMbrzfRWsG4fNEdOescFHHG2t
 kpUhY8TMcm9nVUry2JX5Ls6I2Hqzjqnvo2euJvRye7VazbMjGBGEkFj2hF4gNW2jMrbnVIHdz2hQV
 IIA6w6G+o/gofhxeW8z8AexqxUA3XNXKpQCLWB6EHp+NCQs94pYpcRBgqFPBuaJloTOM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CaK/j5kP2kCeHBkm7cqo+dxTZaXKhjeb0vAuv6K/0Ag=; b=jjomVF3+F8WGLCEuiwBGzSwkTV
 yLS0TguG6emM/RuPjfQMsWxB1c8O+48edDkEMqx5kRxZGmd/knKiRaAa6yh/CSRRWbR8HMlU5NVNa
 DeHMniqQd7YvDpkZzFtc6sPdoLTDdicHTCcWOVMo1qePGMg+jTH+JZ63uhBhgJ3MovsQ=;
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oabUP-0001iC-F9 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Sep 2022 11:32:36 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MWznT0Q3BzmVcG;
 Tue, 20 Sep 2022 19:28:29 +0800 (CST)
Received: from kwepemm000016.china.huawei.com (7.193.23.210) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 20 Sep 2022 19:32:19 +0800
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 kwepemm000016.china.huawei.com (7.193.23.210) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 20 Sep 2022 19:32:19 +0800
Received: from kwepemm600014.china.huawei.com ([7.193.23.54]) by
 kwepemm600014.china.huawei.com ([7.193.23.54]) with mapi id 15.01.2375.031;
 Tue, 20 Sep 2022 19:32:19 +0800
To: Chao Yu <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>
Thread-Topic: =?utf-8?B?W2YyZnMtZGV2XSDnrZTlpI06IOetlOWkjTogW1BBVENIIC1uZXh0XSBmMmZz?=
 =?utf-8?Q?:_adding_truncate_page_cache_after_being_moved?=
Thread-Index: AQHYxx+z7HSWJPdxBUGNkR78i+7hia3ctEag//9/RYCAAJFX4P//lcoAgAABE4CAC9vQwA==
Date: Tue, 20 Sep 2022 11:32:19 +0000
Message-ID: <79e53fe2293d4070a76f9ce0610265a0@huawei.com>
References: <20220913030529.3944-1-zhangqilong3@huawei.com>
 <293a41a4-7c7d-aac8-0bc2-15d47b7bd538@kernel.org>
 <4430326a24364b6aa92332c1393509f4@huawei.com>
 <0cf48a6c-79ff-ef04-b630-a76faaca34c6@kernel.org>
 <ae929a5c21b441f49fc187e7e893fe61@huawei.com>
 <4fd0acaa-8231-200b-b90c-81d1e82dd861@kernel.org>
 <4e5d2c1c-f77d-841c-8920-c0e0ec41680c@kernel.org>
In-Reply-To: <4e5d2c1c-f77d-841c-8920-c0e0ec41680c@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.177.246]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > > On 2022/9/13 14:10, Chao Yu wrote: > > On 2022/9/13 12:37,
 zhangqilong wrote: > >>> > >>> On 2022/9/13 11:41, zhangqilong wrote: > >>>>>
 On 2022/9/13 11:05, Zhang Qilong wrote: > >>>>>> If we do n [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.188 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1oabUP-0001iC-F9
Subject: [f2fs-dev] =?utf-8?b?562U5aSNOiAg562U5aSNOiDnrZTlpI06IFtQQVRDSCAt?=
 =?utf-8?q?next=5D_f2fs=3A_adding_truncate_page_cache_after_being_moved?=
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
From: zhangqilong via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: zhangqilong <zhangqilong3@huawei.com>
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

PiANCj4gT24gMjAyMi85LzEzIDE0OjEwLCBDaGFvIFl1IHdyb3RlOg0KPiA+IE9uIDIwMjIvOS8x
MyAxMjozNywgemhhbmdxaWxvbmcgd3JvdGU6DQo+ID4+Pg0KPiA+Pj4gT24gMjAyMi85LzEzIDEx
OjQxLCB6aGFuZ3FpbG9uZyB3cm90ZToNCj4gPj4+Pj4gT24gMjAyMi85LzEzIDExOjA1LCBaaGFu
ZyBRaWxvbmcgd3JvdGU6DQo+ID4+Pj4+PiBJZiB3ZSBkbyBub3QgdHJ1bmNhdGUgc291cmNlIHBh
Z2UgY2FjaGUsIHVzZXIgY2FuIHN0aWxsIHNlZSB0aGUNCj4gPj4+Pj4+IHByZXZpb3VzIHNvdXJj
ZSBkYXRhIGFmdGVyIGJlaW5nIG1vdmVkLiBXZSBmaXggaXQgYnkgYWRkaW5nDQo+ID4+Pj4+PiB0
cnVuY2F0aW5nIGFmdGVyIF9fZXhjaGFuZ2VfZGF0YV9ibG9jay4NCj4gPj4+Pj4+DQo+ID4+Pj4+
PiBGaXhlczo0ZGQ2Zjk3N2ZjNzc4ICgiZjJmczogc3VwcG9ydCBhbiBpb2N0bCB0byBtb3ZlIGEg
cmFuZ2Ugb2YNCj4gPj4+Pj4+IGRhdGENCj4gPj4+Pj4+IGJsb2NrcyIpDQo+ID4+Pj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBaaGFuZyBRaWxvbmcgPHpoYW5ncWlsb25nM0BodWF3ZWkuY29tPg0KPiA+Pj4+
Pj4gLS0tDQo+ID4+Pj4+PiDCoMKgwqAgZnMvZjJmcy9maWxlLmMgfCA0ICsrKysNCj4gPj4+Pj4+
IMKgwqDCoCAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspDQo+ID4+Pj4+Pg0KPiA+Pj4+
Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZmlsZS5jIGIvZnMvZjJmcy9maWxlLmMgaW5kZXgNCj4g
Pj4+Pj4+IDc3MWYxZjdmMzY5MC4uZTNmZjY0OGFhNDk2IDEwMDY0NA0KPiA+Pj4+Pj4gLS0tIGEv
ZnMvZjJmcy9maWxlLmMNCj4gPj4+Pj4+ICsrKyBiL2ZzL2YyZnMvZmlsZS5jDQo+ID4+Pj4+PiBA
QCAtMjc4OSw2ICsyNzg5LDEwIEBAIHN0YXRpYyBpbnQgZjJmc19tb3ZlX2ZpbGVfcmFuZ2Uoc3Ry
dWN0DQo+ID4+Pj4+PiBmaWxlDQo+ID4+Pj4+ICpmaWxlX2luLCBsb2ZmX3QgcG9zX2luLA0KPiA+
Pj4+Pj4gwqDCoMKgwqDCoMKgwqAgfQ0KPiA+Pj4+Pj4gwqDCoMKgwqDCoMKgwqAgZjJmc191bmxv
Y2tfb3Aoc2JpKTsNCj4gPj4+Pj4+DQo+ID4+Pj4+PiArwqDCoMKgIGZpbGVtYXBfaW52YWxpZGF0
ZV9sb2NrKHNyYy0+aV9tYXBwaW5nKTsNCj4gPj4+Pj4NCj4gPj4+Pj4gaW52YWxpZGF0ZSBsb2Nr
IHNob3VsZCBjb3ZlciBfX2V4Y2hhbmdlX2RhdGFfYmxvY2soKT8NCj4gPj4+Pj4NCj4gPj4+Pj4+
ICvCoMKgwqAgdHJ1bmNhdGVfcGFnZWNhY2hlX3JhbmdlKHNyYywgcG9zX2luLCBwb3NfaW4gKyBs
ZW4gLSAxKTsNCj4gPj4+Pj4NCj4gPj4+Pj4gdHJ1bmNhdGVfcGFnZWNhY2hlX3JhbmdlKCkgc2hv
dWxkIGJlIGNhbGxlZCBiZWZvcmUNCj4gPj4+Pj4gX19leGNoYW5nZV9kYXRhX2Jsb2NrKCk/DQo+
ID4+Pj4NCj4gPj4+PiBJIGhhdmUgdHJpZWQgaXQsIGJ1dCBpdCBkbyBub3Qgd29yay4gU28gSSBt
b3ZlIHRoZSB0cnVuY2F0ZQ0KPiA+Pj4+IG9wZXJhdGlvbiB0byB0aGUgYmFjayBvZiBfX2V4Y2hh
bmdlX2RhdGFfYmxvY2sgdGhhdCBpdCB3b3JrcyB3ZWxsLg0KPiA+Pj4+IEkgZG9uJ3Qga25vdyBt
dWNoIGVub3VnaCwgd2hhdCBkbyB5b3UgdGhpbmsgb2YgdGhpcyBpc3N1ZS4NCj4gPj4+DQo+ID4+
PiBDYW4geW91IGRlc2NyaWJlIGRldGFpbHMgYWJvdXQgdGhlIHRlc3RjYXNlPw0KPiA+Pj4NCkhp
LA0KDQpJIG1heSBmb3VuZCB0aGUgcmVhc29uIHRoYXQgdHJ1bmNhdGVfcGFnZWNhY2hlX3Jhbmdl
KCkgYmVpbmcgY2FsbGVkIGJlZm9yZSBfX2V4Y2hhbmdlX2RhdGFfYmxvY2soKSB0aGF0IGRvZXMg
bm90IHdvcmsuDQpJbiB0aGUgZm9sbG93aW5nIHBhdGg6DQogIC0+IGYyZnNfbW92ZV9maWxlX3Jh
bmdlDQogICAgLT4gX19leGNoYW5nZV9kYXRhX2Jsb2NrDQogICAgICAtPiBfX2Nsb25lX2Jsa2Fk
ZHJzDQogICAgICAgLT4gZjJmc19nZXRfbG9ja19kYXRhX3BhZ2UNClRoZSBzb3VyY2UgcGFnZShz
KSBhcmUgcmVhZCBhZ2Fpbi4gU28gd2UgdHJ1bmNhdGUgc291cmNlIHBhZ2UocykgYmVmb3JlIF9f
ZXhjaGFuZ2VfZGF0YV9ibG9jayBpcyB1c2VsZXNzLiBXZSBuZWVkIHRvIHRydW5jYXRlDQpzb3Vy
Y2UgcGFnZShzKSBhZnRlciBfX2V4Y2hhbmdlX2RhdGFfYmxvY2soKS4gSG93IGRvIHlvdSB0aGlu
az8NCg0KVGhhbmtzLA0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlz
dHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xp
c3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
