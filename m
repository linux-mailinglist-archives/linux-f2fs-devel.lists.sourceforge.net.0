Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 863DAA118C9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Jan 2025 06:11:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tXvgo-0000s9-Lo;
	Wed, 15 Jan 2025 05:11:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Yi.Sun@unisoc.com>) id 1tXvgn-0000s3-Ga
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Jan 2025 05:11:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Bi0Nik0phql+3WmafTW7FtrEjr3ZgEjQPNGqV2vtN+0=; b=N/c85aUGZ2LKnqkgExzE5rMQyv
 5AzyoLFjxsgGFTiRwWHVLpd4R0/Enw9G88+hCFNGPkbnOm2uEvrIhjQNJB0ntqwMo2cbGHRwB7edu
 Hp6hzixYBrZBSZNvXmOHR/n4maR1noripS8wFuwLLaTqxJtV4+w4FzwWcHuYLUAKWofk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Bi0Nik0phql+3WmafTW7FtrEjr3ZgEjQPNGqV2vtN+0=; b=iBmrpG/Fb4E7ELLGwGIfcTRT/I
 z5si7ZV5bNJzHY2776PHXKf03LrZgelqrnfhDN8w7BSqMZUnY2BuRLKGMsZQnNpYRVmsrlU41oKBP
 1LQuaYJHHbDE8WHEpQrweHZbCGjapP6nDagL4ekNbjy2orvoqVIQnFwUV9H5E5ri+QBo=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tXvgm-0007JF-IV for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Jan 2025 05:11:38 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 50F59moL046228;
 Wed, 15 Jan 2025 13:09:48 +0800 (+08)
 (envelope-from Yi.Sun@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4YXv9S4N0Gz2Pp75x;
 Wed, 15 Jan 2025 13:06:36 +0800 (CST)
Received: from BJMBX02.spreadtrum.com (10.0.64.8) by BJMBX02.spreadtrum.com
 (10.0.64.8) with Microsoft SMTP Server (TLS) id 15.0.1497.23; Wed, 15 Jan
 2025 13:09:46 +0800
Received: from BJMBX02.spreadtrum.com ([fe80::c8c3:f3a0:9c9f:b0fb]) by
 BJMBX02.spreadtrum.com ([fe80::c8c3:f3a0:9c9f:b0fb%19]) with mapi id
 15.00.1497.023; Wed, 15 Jan 2025 13:09:46 +0800
From: =?utf-8?B?5a2Z5q+FIChZaSBTdW4p?= <Yi.Sun@unisoc.com>
To: Chao Yu <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>
Thread-Topic: [PATCH v4 4/4] f2fs: Optimize f2fs_truncate_data_blocks_range()
Thread-Index: AQHbVRIuhELiJIS31USl5+f8emwXQLMVSWAAgAIDlrA=
Date: Wed, 15 Jan 2025 05:09:45 +0000
Message-ID: <e98d055529994fa6b988136888e470f8@BJMBX02.spreadtrum.com>
References: <20241223081044.1126291-1-yi.sun@unisoc.com>
 <20241223081044.1126291-5-yi.sun@unisoc.com>
 <8a8dbb83-134b-4545-9b37-9c0b5b2be972@kernel.org>
In-Reply-To: <8a8dbb83-134b-4545-9b37-9c0b5b2be972@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.93.65]
MIME-Version: 1.0
X-MAIL: SHSQR01.spreadtrum.com 50F59moL046228
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  > -----邮件原件----- > 发件人: Chao Yu <chao@kernel.org>
    > 发送时间: 2025年1月14日 12:29 > 收件人: 孙毅 (Yi Sun) <Yi.Sun@unisoc.com>;
    jaegeuk@kernel.org > 抄送: chao@kernel.org; s [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [222.66.158.135 listed in sa-accredit.habeas.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [222.66.158.135 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1tXvgm-0007JF-IV
Subject: [f2fs-dev] =?utf-8?b?562U5aSNOiBbUEFUQ0ggdjQgNC80XSBmMmZzOiBPcHRp?=
 =?utf-8?q?mize_f2fs=5Ftruncate=5Fdata=5Fblocks=5Frange=28=29?=
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
Cc: =?utf-8?B?546L56eRIChLZSBXYW5nKQ==?= <Ke.Wang@unisoc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "sunyibuaa@gmail.com" <sunyibuaa@gmail.com>,
 =?utf-8?B?5a2Z5q+FIChZaSBTdW4p?= <Yi.Sun@unisoc.com>,
 =?utf-8?B?546L55qTIChIYW9faGFvIFdhbmcp?= <Hao_hao.Wang@unisoc.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

DQoNCj4gLS0tLS3pgq7ku7bljp/ku7YtLS0tLQ0KPiDlj5Hku7bkuro6IENoYW8gWXUgPGNoYW9A
a2VybmVsLm9yZz4NCj4g5Y+R6YCB5pe26Ze0OiAyMDI15bm0MeaciDE05pelIDEyOjI5DQo+IOaU
tuS7tuS6ujog5a2Z5q+FIChZaSBTdW4pIDxZaS5TdW5AdW5pc29jLmNvbT47IGphZWdldWtAa2Vy
bmVsLm9yZw0KPiDmioTpgIE6IGNoYW9Aa2VybmVsLm9yZzsgc3VueWlidWFhQGdtYWlsLmNvbTsg
bGludXgtZjJmcy0NCj4gZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0OyBsaW51eC1rZXJuZWxA
dmdlci5rZXJuZWwub3JnOw0KPiBuaXV6aGlndW84NEBnbWFpbC5jb207IOeOi+eakyAoSGFvX2hh
byBXYW5nKSA8SGFvX2hhby5XYW5nQHVuaXNvYy5jb20+Ow0KPiDnjovnp5EgKEtlIFdhbmcpIDxL
ZS5XYW5nQHVuaXNvYy5jb20+DQo+IOS4u+mimDogUmU6IFtQQVRDSCB2NCA0LzRdIGYyZnM6IE9w
dGltaXplIGYyZnNfdHJ1bmNhdGVfZGF0YV9ibG9ja3NfcmFuZ2UoKQ0KPiANCj4gT24gMTIvMjMv
MjQgMTY6MTAsIFlpIFN1biB3cm90ZToNCj4gPiBGdW5jdGlvbiBmMmZzX2ludmFsaWRhdGVfYmxv
Y2tzKCkgY2FuIHByb2Nlc3MgY29udGludW91cw0KPiA+IGJsb2NrcyBhdCBhIHRpbWUsIHNvIGYy
ZnNfdHJ1bmNhdGVfZGF0YV9ibG9ja3NfcmFuZ2UoKSBpcw0KPiA+IG9wdGltaXplZCB0byB1c2Ug
dGhlIG5ldyBmdW5jdGlvbmFsaXR5IG9mDQo+ID4gZjJmc19pbnZhbGlkYXRlX2Jsb2NrcygpLg0K
PiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogWWkgU3VuIDx5aS5zdW5AdW5pc29jLmNvbT4NCj4gPiAt
LS0NCj4gPiAgIGZzL2YyZnMvZmlsZS5jIHwgNzIgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKystLS0NCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA2OCBpbnNlcnRp
b25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZmls
ZS5jIGIvZnMvZjJmcy9maWxlLmMNCj4gPiBpbmRleCA4MTc2NGIxMDg0MGIuLjk5ODBkMTdlZjlm
NSAxMDA2NDQNCj4gPiAtLS0gYS9mcy9mMmZzL2ZpbGUuYw0KPiA+ICsrKyBiL2ZzL2YyZnMvZmls
ZS5jDQo+ID4gQEAgLTYxMiw2ICs2MTIsMTUgQEAgc3RhdGljIGludCBmMmZzX2ZpbGVfb3Blbihz
dHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZmlsZQ0KPiAqZmlscCkNCj4gPiAgICAgICByZXR1
cm4gZmluaXNoX3ByZWFsbG9jYXRlX2Jsb2Nrcyhpbm9kZSk7DQo+ID4gICB9DQo+ID4NCj4gPiAr
c3RhdGljIGJvb2wgY2hlY2tfY3Vycl9ibG9ja19pc19jb25zZWN1dGl2ZShzdHJ1Y3QgZjJmc19z
Yl9pbmZvICpzYmksDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBi
bG9ja190IGN1cnIsIGJsb2NrX3QgZW5kKQ0KPiANCj4gc3RhdGljIGlubGluZSBib29sIGlzX2Nv
bnNlY3V0aXZlX2Jsa2FkZHJzKGJsb2NrX3QgY3VyLCBibG9ja190IGVuZCkNCj4gew0KPiAgICAg
ICAgIHJldHVybiBjdXIgPT0gZW5kIHx8IGN1ciA9PSBlbmQgKyAxOw0KPiB9DQo+IA0KPiBCdXQg
bWF5YmUgd2UgZG9uJ3QgbmVlZCB0byBhZGQgdGhpcyBmdW5jdGlvbiwgc2VlIGJlbG93IGNvbW1l
bnRzLg0KPiANCj4gPiArew0KPiA+ICsgICAgIGlmIChjdXJyIC0gZW5kID09IDEgfHwgY3VyciA9
PSBlbmQpDQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gdHJ1ZTsNCj4gPiArICAgICBlbHNlDQo+
ID4gKyAgICAgICAgICAgICByZXR1cm4gZmFsc2U7DQo+ID4gK30NCj4gPiArDQo+ID4gICB2b2lk
IGYyZnNfdHJ1bmNhdGVfZGF0YV9ibG9ja3NfcmFuZ2Uoc3RydWN0IGRub2RlX29mX2RhdGEgKmRu
LCBpbnQgY291bnQpDQo+ID4gICB7DQo+ID4gICAgICAgc3RydWN0IGYyZnNfc2JfaW5mbyAqc2Jp
ID0gRjJGU19JX1NCKGRuLT5pbm9kZSk7DQo+ID4gQEAgLTYyMSw4ICs2MzAsMjcgQEAgdm9pZCBm
MmZzX3RydW5jYXRlX2RhdGFfYmxvY2tzX3JhbmdlKHN0cnVjdA0KPiBkbm9kZV9vZl9kYXRhICpk
biwgaW50IGNvdW50KQ0KPiA+ICAgICAgIGludCBjbHVzdGVyX2luZGV4ID0gMCwgdmFsaWRfYmxv
Y2tzID0gMDsNCj4gPiAgICAgICBpbnQgY2x1c3Rlcl9zaXplID0gRjJGU19JKGRuLT5pbm9kZSkt
PmlfY2x1c3Rlcl9zaXplOw0KPiA+ICAgICAgIGJvb2wgcmVsZWFzZWQgPSAhYXRvbWljX3JlYWQo
JkYyRlNfSShkbi0+aW5vZGUpLT5pX2NvbXByX2Jsb2Nrcyk7DQo+ID4gKyAgICAgLyoNCj4gPiAr
ICAgICAgKiBUZW1wb3JhcnkgcmVjb3JkIGxvY2F0aW9uLg0KPiA+ICsgICAgICAqIFdoZW4gdGhl
IGN1cnJlbnQgIEBibGthZGRyIGFuZCBAYmxrYWRkcl9lbmQgY2FuIGJlIHByb2Nlc3NlZA0KPiA+
ICsgICAgICAqIHRvZ2V0aGVyLCB1cGRhdGUgdGhlIHZhbHVlIG9mIEBibGthZGRyX2VuZC4NCj4g
PiArICAgICAgKiBXaGVuIGl0IGlzIGRldGVjdGVkIHRoYXQgY3VycmVudCBAYmxrYWRkciBpcyBu
b3QgY29udGludWVzIHdpdGgNCj4gPiArICAgICAgKiBAYmxrYWRkcl9lbmQsIGl0IGlzIG5lY2Vz
c2FyeSB0byBwcm9jZXNzIGNvbnRpbnVlcyBibG9ja3MNCj4gDQo+IEkgcHJlZmVyIG5vdCBhZGRp
bmcgdGhlc2UgY29tbWVudHMgaW50byBmdW5jdGlvbiwgd2hhdCBhYm91dCBkZXNjcmliaW5nIHRo
ZQ0KPiBkZXRhaWxzIGluIGNvbW1pdCBtZXNzYWdlLCBpbnN0ZWFkLCB0aG91Z2h0cz8NCj4gDQo+
ID4gKyAgICAgICogcmFuZ2UgW2Jsa2FkZHJfc3RhcnQsIGJsa2FkZHJfZW5kXS4NCj4gPiArICAg
ICAgKi8NCj4gPiArICAgICBibG9ja190IGJsa2FkZHJfc3RhcnQsIGJsa2FkZHJfZW5kOw0KPiA+
ICsgICAgIC8qLg0KPiA+ICsgICAgICAqIFRvIGF2b2lkIHByb2Nlc3NpbmcgdmFyaW91cyBpbnZh
bGlkIGRhdGEgYmxvY2tzLg0KPiA+ICsgICAgICAqIEJlY2F1c2UgQGJsa2FkZHJfc3RhcnQgYW5k
IEBibGthZGRyX2VuZCBtYXkgYmUgYXNzaWduZWQNCj4gPiArICAgICAgKiBOVUxMX0FERFIgb3Ig
aW52YWxpZCBkYXRhIGJsb2NrcywgQGxhc3RfdmFsaWQgaXMgdXNlZCB0bw0KPiA+ICsgICAgICAq
IHJlY29yZCB0aGlzIHNpdHVhdGlvbi4NCj4gPiArICAgICAgKi8NCj4gDQo+IERpdHRvLA0KPiAN
Cj4gV2hhdCBhYm91dCB1c2luZyBibGtzdGFydCAmIGJsa2xlbiB0byByZWNvcmQgbGFzdCBjb25z
ZWN1dGl2ZSBibG9jayBhZGRyZXNzZXMsDQo+IGFuZCB1c2luZyBibGtsZW4gdG8gaWRlbnRpZnkg
d2hldGhlciB3ZSBuZWVkIHRvIGNhbGwgZjJmc19pbnZhbGlkYXRlX2Jsb2NrcygpIG9yDQo+IG5v
dD8NCj4gDQo+ID4gKyAgICAgYm9vbCBsYXN0X3ZhbGlkID0gZmFsc2U7DQo+ID4gKyAgICAgLyog
UHJvY2VzcyB0aGUgbGFzdCBAYmxrYWRkciBzZXBhcmF0ZWx5PyAqLw0KPiA+ICsgICAgIGJvb2wg
bGFzdF9vbmUgPSB0cnVlOw0KPiA+DQo+ID4gICAgICAgYWRkciA9IGdldF9kbm9kZV9hZGRyKGRu
LT5pbm9kZSwgZG4tPm5vZGVfcGFnZSkgKyBvZnM7DQo+ID4gKyAgICAgYmxrYWRkcl9zdGFydCA9
IGJsa2FkZHJfZW5kID0gbGUzMl90b19jcHUoKmFkZHIpOw0KPiA+DQo+ID4gICAgICAgLyogQXNz
dW1wdGlvbjogdHJ1bmNhdGlvbiBzdGFydHMgd2l0aCBjbHVzdGVyICovDQo+ID4gICAgICAgZm9y
ICg7IGNvdW50ID4gMDsgY291bnQtLSwgYWRkcisrLCBkbi0+b2ZzX2luX25vZGUrKywgY2x1c3Rl
cl9pbmRleCsrKSB7DQo+ID4gQEAgLTYzOCwyNCArNjY2LDYwIEBAIHZvaWQgZjJmc190cnVuY2F0
ZV9kYXRhX2Jsb2Nrc19yYW5nZShzdHJ1Y3QNCj4gZG5vZGVfb2ZfZGF0YSAqZG4sIGludCBjb3Vu
dCkNCj4gPiAgICAgICAgICAgICAgIH0NCj4gPg0KPiA+ICAgICAgICAgICAgICAgaWYgKGJsa2Fk
ZHIgPT0gTlVMTF9BRERSKQ0KPiA+IC0gICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsNCj4g
PiArICAgICAgICAgICAgICAgICAgICAgZ290byBuZXh0Ow0KPiA+DQo+ID4gICAgICAgICAgICAg
ICBmMmZzX3NldF9kYXRhX2Jsa2FkZHIoZG4sIE5VTExfQUREUik7DQo+ID4NCj4gPiAgICAgICAg
ICAgICAgIGlmIChfX2lzX3ZhbGlkX2RhdGFfYmxrYWRkcihibGthZGRyKSkgew0KPiA+ICAgICAg
ICAgICAgICAgICAgICAgICBpZiAodGltZV90b19pbmplY3Qoc2JpLCBGQVVMVF9CTEtBRERSX0NP
TlNJU1RFTkNFKSkNCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsN
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG5leHQ7DQo+ID4gICAgICAg
ICAgICAgICAgICAgICAgIGlmICghZjJmc19pc192YWxpZF9ibGthZGRyX3JhdyhzYmksIGJsa2Fk
ZHIsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIERB
VEFfR0VORVJJQ19FTkhBTkNFKSkNCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICBj
b250aW51ZTsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG5leHQ7DQo+
ID4gICAgICAgICAgICAgICAgICAgICAgIGlmIChjb21wcmVzc2VkX2NsdXN0ZXIpDQo+ID4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgdmFsaWRfYmxvY2tzKys7DQo+ID4gICAgICAgICAg
ICAgICB9DQo+ID4NCj4gPiAtICAgICAgICAgICAgIGYyZnNfaW52YWxpZGF0ZV9ibG9ja3Moc2Jp
LCBibGthZGRyLCAxKTsNCj4gDQo+IEhvdyBhYm91dCB0aGlzPyBDYW4geW91IGNoYW5nZSBiYXNl
ZCBvbiBpdD8NCj4gDQo+ICAgICAgICAgICAgICAgICBpZiAoYmxrc3RhcnQgKyBibGtsZW4gPT0g
YmxrYWRkcikgew0KPiAgICAgICAgICAgICAgICAgICAgICAgICBibGtsZW4rKzsNCj4gICAgICAg
ICAgICAgICAgIH0gZWxzZSB7DQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGYyZnNfaW52YWxp
ZGF0ZV9ibG9ja3Moc2JpLCBibGtzdGFydCwgYmxrbGVuKTsNCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgYmxrc3RhcnQgPSBibGthZGRyOw0KPiAgICAgICAgICAgICAgICAgICAgICAgICBibGts
ZW4gPSAxOw0KPiAgICAgICAgICAgICAgICAgfQ0KPiANCj4gPiArDQo+ID4gKyAgICAgICAgICAg
ICBpZiAoY2hlY2tfY3Vycl9ibG9ja19pc19jb25zZWN1dGl2ZShzYmksIGJsa2FkZHIsIGJsa2Fk
ZHJfZW5kKSkgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAvKg0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgKiBUaGUgY3VycmVudCBibG9jayBAYmxrYWRkciBpcyBjb250aW51b3VzIHdp
dGgNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICogQGJsa2FkZHJfZW5kLCBzbyBAYmxrYWRk
cl9lbmQgaXMgdXBkYXRlZC4NCj4gPiArICAgICAgICAgICAgICAgICAgICAgICogQW5kIHRoZSBm
MmZzX2ludmFsaWRhdGVfYmxvY2tzKCkgaXMgc2tpcHBlZA0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgKiB1bnRpbCBAYmxrYWRkciB0aGF0IGNhbm5vdCBiZSBwcm9jZXNzZWQNCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICogdG9nZXRoZXIgaXMgZW5jb3VudGVyZWQuDQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAqLw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICBibGthZGRyX2Vu
ZCA9IGJsa2FkZHI7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGlmIChjb3VudCA9PSAxKQ0K
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxhc3Rfb25lID0gZmFsc2U7DQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgIGVsc2UNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBnb3RvIHNraXBfaW52YWxpZDsNCj4gPiArICAgICAgICAgICAgIH0NCj4gPiArDQo+ID4g
KyAgICAgICAgICAgICBmMmZzX2ludmFsaWRhdGVfYmxvY2tzKHNiaSwgYmxrYWRkcl9zdGFydCwN
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJsa2FkZHJfZW5kIC0g
YmxrYWRkcl9zdGFydCArIDEpOw0KPiA+ICsgICAgICAgICAgICAgYmxrYWRkcl9zdGFydCA9IGJs
a2FkZHJfZW5kID0gYmxrYWRkcjsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgICBpZiAoY291bnQg
PT0gMSAmJiBsYXN0X29uZSkNCj4gPiArICAgICAgICAgICAgICAgICAgICAgZjJmc19pbnZhbGlk
YXRlX2Jsb2NrcyhzYmksIGJsa2FkZHIsIDEpOw0KPiA+ICsNCj4gPiArc2tpcF9pbnZhbGlkOg0K
PiA+ICsgICAgICAgICAgICAgbGFzdF92YWxpZCA9IHRydWU7DQo+ID4NCj4gPiAgICAgICAgICAg
ICAgIGlmICghcmVsZWFzZWQgfHwgYmxrYWRkciAhPSBDT01QUkVTU19BRERSKQ0KPiA+ICAgICAg
ICAgICAgICAgICAgICAgICBucl9mcmVlKys7DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgY29u
dGludWU7DQo+ID4gKw0KPiA+ICtuZXh0Og0KPiANCj4gbmV4dDoNCj4gDQo+ICAgICAgICAgICAg
ICAgICBpZiAoYmxrbGVuKSB7DQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGYyZnNfaW52YWxp
ZGF0ZV9ibG9ja3Moc2JpLCBibGtzdGFydCwgYmxrbGVuKTsNCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgYmxrc3RhcnQgPSBibGthZGRyOw0KPiAgICAgICAgICAgICAgICAgICAgICAgICBibGts
ZW4gPSAxOw0KPiAgICAgICAgICAgICAgICAgfQ0KPiANCj4gPiArICAgICAgICAgICAgIC8qIElm
IGNvbnNlY3V0aXZlIGJsb2NrcyBoYXZlIGJlZW4gcmVjb3JkZWQsIHdlIG5lZWQgdG8gcHJvY2Vz
cyB0aGVtLg0KPiAqLw0KPiA+ICsgICAgICAgICAgICAgaWYgKGxhc3RfdmFsaWQgPT0gdHJ1ZSkN
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgZjJmc19pbnZhbGlkYXRlX2Jsb2NrcyhzYmksIGJs
a2FkZHJfc3RhcnQsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBi
bGthZGRyX2VuZCAtIGJsa2FkZHJfc3RhcnQgKyAxKTsNCj4gPiArDQo+ID4gKyAgICAgICAgICAg
ICBibGthZGRyX3N0YXJ0ID0gYmxrYWRkcl9lbmQgPSBsZTMyX3RvX2NwdSgqKGFkZHIgKyAxKSk7
DQo+ID4gKyAgICAgICAgICAgICBsYXN0X3ZhbGlkID0gZmFsc2U7DQo+ID4gKw0KPiA+ICAgICAg
IH0NCj4gDQo+ICAgICAgICAgaWYgKGJsa2xlbikNCj4gICAgICAgICAgICAgICAgIGYyZnNfaW52
YWxpZGF0ZV9ibG9ja3Moc2JpLCBibGtzdGFydCwgYmxrbGVuKTsNCj4gDQo+IFRoYW5rcywNCj4g
DQoNCkhpIENoYW8sDQpZb3VyIHN1Z2dlc3Rpb24gbG9va3MgZ3JlYXQsIEkgd2lsbCBtb2RpZnkg
aXQgYWNjb3JkaW5nbHkuDQoNCj4gPg0KPiA+ICAgICAgIGlmIChjb21wcmVzc2VkX2NsdXN0ZXIp
DQoNCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZv
cmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51
eC1mMmZzLWRldmVsCg==
