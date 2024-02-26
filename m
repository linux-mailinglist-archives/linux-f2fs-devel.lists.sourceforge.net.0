Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4467086677C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Feb 2024 02:22:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rePhQ-0005RB-HX;
	Mon, 26 Feb 2024 01:22:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Zhiguo.Niu@unisoc.com>) id 1rePhP-0005Qy-7a
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Feb 2024 01:22:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZyhQOxoT7odkOVHeIkfPmP/gcKRryidAWuWjm1mLjIg=; b=JA5xwvQseRmjr2JZ20cdfLSTp9
 CNpcQ1CO1xTH+LejO6fJKi1c7TPR+DMXwy5Bf/UUnpFlBtkcsu+1cAxzkKuqxfJZN3H2/2Gff/OFf
 YRwAmPOGkaU0lGxdOC9Y8HZZGEuTXxoqYQ0ArEGMuhFpvoVfod9keoY0TMYBL9OmysL4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:Message-ID
 :Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ZyhQOxoT7odkOVHeIkfPmP/gcKRryidAWuWjm1mLjIg=; b=T
 9jTHSLnwsqAqyj9DZju/oxUKiwqDxUxd5Yv8cgLtTXCtdgCUX4d06kbM4rpqMRveAs1Zwyn6cSh7Z
 shX8TwDrRZF7MX5lZFwocGXZagXmvO2I/P+Oq7/1U2Ihkb68K6pAK+zzBM6VB6EY5X3ex8LTu2975
 1hr3l0J96M5W1cQg=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rePhK-0007gS-TI for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Feb 2024 01:22:31 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 41Q1Ll8X099140;
 Mon, 26 Feb 2024 09:21:47 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx01.spreadtrum.com [10.0.64.7])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4TjjVk36Wxz2KC597;
 Mon, 26 Feb 2024 09:21:02 +0800 (CST)
Received: from BJMBX02.spreadtrum.com (10.0.64.8) by BJMBX01.spreadtrum.com
 (10.0.64.7) with Microsoft SMTP Server (TLS) id 15.0.1497.23; Mon, 26 Feb
 2024 09:21:45 +0800
Received: from BJMBX02.spreadtrum.com ([fe80::f022:2a7c:e5bc:aacd]) by
 BJMBX02.spreadtrum.com ([fe80::f022:2a7c:e5bc:aacd%19]) with mapi id
 15.00.1497.023; Mon, 26 Feb 2024 09:21:45 +0800
From: =?utf-8?B?54mb5b+X5Zu9IChaaGlndW8gTml1KQ==?= <Zhiguo.Niu@unisoc.com>
To: "jaegeuk@kernel.org" <jaegeuk@kernel.org>
Thread-Topic: [PATCH v3] f2fs: reduce expensive checkpoint trigger frequency
Thread-Index: AQHaRGbEIhIgX85RYE+VteQdj17287EQ+OwAgAshOiCAAAFCcA==
Date: Mon, 26 Feb 2024 01:21:44 +0000
Message-ID: <ed3eecaf9e2f4c8fae2fd01241aa097e@BJMBX02.spreadtrum.com>
References: <20240111081743.2999210-1-chao@kernel.org>
 <ae43ed8a-49b5-44bf-8fea-a222091e9790@kernel.org> 
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.126.103]
MIME-Version: 1.0
X-MAIL: SHSQR01.spreadtrum.com 41Q1Ll8X099140
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi Jaegeuk Sorry for disturbing you, Do you have any comments
    about this patch from Chao, I’ve met this issue several times on our platform
    when do monkey test. Thanks! -----邮件原件----- 发件人: Chao Yu <chao@kernel.org>
    发送时间: 2024年2月19日 15:19 收件人: jaegeuk@kernel.org 抄送:
    linux-f2fs-devel@lists.sourceforge.net; linux-kernel@vger.kernel. [...] 
 
 Content analysis details:   (-0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rePhK-0007gS-TI
Subject: [f2fs-dev] =?utf-8?b?562U5aSNOiBbUEFUQ0ggdjNdIGYyZnM6IHJlZHVjZSBl?=
 =?utf-8?q?xpensive_checkpoint_trigger_frequency?=
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
Cc: =?utf-8?B?6YeR57qi5a6HIChIb25neXUgSmluKQ==?= <hongyu.jin@unisoc.com>,
 "niuzhiguo84@gmail.com" <niuzhiguo84@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

DQpIaSBKYWVnZXVrDQoNClNvcnJ5IGZvciBkaXN0dXJiaW5nIHlvdSwgRG8geW91IGhhdmUgYW55
IGNvbW1lbnRzIGFib3V0IHRoaXMgcGF0Y2ggZnJvbSBDaGFvLCBJ4oCZdmUgbWV0IHRoaXMgaXNz
dWUgc2V2ZXJhbCB0aW1lcyBvbiBvdXIgcGxhdGZvcm0gd2hlbiBkbyBtb25rZXkgdGVzdC4NClRo
YW5rcyENCg0KLS0tLS3pgq7ku7bljp/ku7YtLS0tLQ0K5Y+R5Lu25Lq6OiBDaGFvIFl1IDxjaGFv
QGtlcm5lbC5vcmc+DQrlj5HpgIHml7bpl7Q6IDIwMjTlubQy5pyIMTnml6UgMTU6MTkNCuaUtuS7
tuS6ujogamFlZ2V1a0BrZXJuZWwub3JnDQrmioTpgIE6IGxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMu
c291cmNlZm9yZ2UubmV0OyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyDniZvlv5flm70g
KFpoaWd1byBOaXUpIDxaaGlndW8uTml1QHVuaXNvYy5jb20+DQrkuLvpopg6IFJlOiBbUEFUQ0gg
djNdIGYyZnM6IHJlZHVjZSBleHBlbnNpdmUgY2hlY2twb2ludCB0cmlnZ2VyIGZyZXF1ZW5jeQ0K
DQoNCuazqOaEjzog6L+Z5bCB6YKu5Lu25p2l6Ieq5LqO5aSW6YOo44CC6Zmk6Z2e5L2g56Gu5a6a
6YKu5Lu25YaF5a655a6J5YWo77yM5ZCm5YiZ5LiN6KaB54K55Ye75Lu75L2V6ZO+5o6l5ZKM6ZmE
5Lu244CCDQpDQVVUSU9OOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIHRo
ZSBvcmdhbml6YXRpb24uIERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVu
bGVzcyB5b3UgcmVjb2duaXplIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2Fm
ZS4NCg0KDQoNCkphZWdldWssDQoNCkFueSBjb21tZW50cz8NCg0KT24gMjAyNC8xLzExIDE2OjE3
LCBDaGFvIFl1IHdyb3RlOg0KPiBXZSBtYXkgdHJpZ2dlciBoaWdoIGZyZXF1ZW50IGNoZWNrcG9p
bnQgZm9yIGJlbG93IGNhc2U6DQo+IDEuIG1rZGlyIC9tbnQvZGlyMTsgc2V0IGRpcjEgZW5jcnlw
dGVkIDIuIHRvdWNoIC9tbnQvZmlsZTE7IGZzeW5jIA0KPiAvbW50L2ZpbGUxIDMuIG1rZGlyIC9t
bnQvZGlyMjsgc2V0IGRpcjIgZW5jcnlwdGVkIDQuIHRvdWNoIC9tbnQvZmlsZTI7IA0KPiBmc3lu
YyAvbW50L2ZpbGUyIC4uLg0KPg0KPiBBbHRob3VnaCwgbmV3bHkgY3JlYXRlZCBkaXIgYW5kIGZp
bGUgYXJlIG5vdCByZWxhdGVkLCBkdWUgdG8gY29tbWl0IA0KPiBiYmYxNTZmN2FmYTcgKCJmMmZz
OiBmaXggbG9zdCB4YXR0cnMgb2YgZGlyZWN0b3JpZXMiKSwgd2Ugd2lsbCB0cmlnZ2VyIA0KPiBj
aGVja3BvaW50IHdoZW5ldmVyIGZzeW5jKCkgY29tZXMgYWZ0ZXIgYSBuZXcgZW5jcnlwdGVkIGRp
ciBjcmVhdGVkLg0KPg0KPiBJbiBvcmRlciB0byBhdm9pZCBzdWNoIGNvbmRpdGlvbiwgbGV0J3Mg
cmVjb3JkIGFuIGVudHJ5IGluY2x1ZGluZyANCj4gZGlyZWN0b3J5J3MgaW5vIGludG8gZ2xvYmFs
IGNhY2hlIHdoZW4gd2UgaW5pdGlhbGl6ZSBlbmNyeXB0aW9uIHBvbGljeSANCj4gaW4gYSBjaGVj
a3BvaW50ZWQgZGlyZWN0b3J5LCBhbmQgdGhlbiBvbmx5IHRyaWdnZXIgY2hlY2twb2ludCgpIHdo
ZW4gDQo+IHRhcmdldCBmaWxlJ3MgcGFyZW50IGhhcyBub24tcGVyc2lzdGVkIGVuY3J5cHRpb24g
cG9saWN5LCBmb3IgdGhlIGNhc2UgDQo+IGl0cyBwYXJlbnQgaXMgbm90IGNoZWNrcG9pbnRlZCwg
bmVlZF9kb19jaGVja3BvaW50KCkgaGFzIGNvdmVyIHRoYXQgYnkgDQo+IHZlcmlmeWluZyBpdCB3
aXRoIGYyZnNfaXNfY2hlY2twb2ludGVkX25vZGUoKS4NCj4NCj4gUmVwb3J0ZWQtYnk6IFpoaWd1
byBOaXUgPHpoaWd1by5uaXVAdW5pc29jLmNvbT4NCj4gVGVzdGVkLWJ5OiBaaGlndW8gTml1IDx6
aGlndW8ubml1QHVuaXNvYy5jb20+DQo+IFJlcG9ydGVkLWJ5OiBZdW5sZWkgSGUgPGhleXVubGVp
QGhpaG9ub3IuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+
DQo+IC0tLQ0KPiB2MzoNCj4gLSBSZWNlbnRseSwgWmhpZ3VvIE5pdSByZXBvcnRlZCB0aGUgc2Ft
ZSBpc3N1ZSwgc28gSSByZXBvc3QgdGhpcyBwYXRjaCANCj4gZm9yIGNvbW1lbnRzLg0KPiAgIGZz
L2YyZnMvZjJmcy5oICAgICAgICAgICAgICB8ICAyICsrDQo+ICAgZnMvZjJmcy9maWxlLmMgICAg
ICAgICAgICAgIHwgIDMgKysrDQo+ICAgZnMvZjJmcy94YXR0ci5jICAgICAgICAgICAgIHwgMTYg
KysrKysrKysrKysrKystLQ0KPiAgIGluY2x1ZGUvdHJhY2UvZXZlbnRzL2YyZnMuaCB8ICAzICsr
LQ0KPiAgIDQgZmlsZXMgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkN
Cj4NCj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZjJmcy5oIGIvZnMvZjJmcy9mMmZzLmggaW5kZXgg
DQo+IGUyZTBjYTQ1Zjg4MS4uMDA5NGE4Yzg1ZjRhIDEwMDY0NA0KPiAtLS0gYS9mcy9mMmZzL2Yy
ZnMuaA0KPiArKysgYi9mcy9mMmZzL2YyZnMuaA0KPiBAQCAtMjc5LDYgKzI3OSw3IEBAIGVudW0g
ew0KPiAgICAgICBBUFBFTkRfSU5PLCAgICAgICAgICAgICAvKiBmb3IgYXBwZW5kIGlubyBsaXN0
ICovDQo+ICAgICAgIFVQREFURV9JTk8sICAgICAgICAgICAgIC8qIGZvciB1cGRhdGUgaW5vIGxp
c3QgKi8NCj4gICAgICAgVFJBTlNfRElSX0lOTywgICAgICAgICAgLyogZm9yIHRyYW5zYWN0aW9u
cyBkaXIgaW5vIGxpc3QgKi8NCj4gKyAgICAgRU5DX0RJUl9JTk8sICAgICAgICAgICAgLyogZm9y
IGVuY3J5cHRlZCBkaXIgaW5vIGxpc3QgKi8NCj4gICAgICAgRkxVU0hfSU5PLCAgICAgICAgICAg
ICAgLyogZm9yIG11bHRpcGxlIGRldmljZSBmbHVzaGluZyAqLw0KPiAgICAgICBNQVhfSU5PX0VO
VFJZLCAgICAgICAgICAvKiBtYXguIGxpc3QgKi8NCj4gICB9Ow0KPiBAQCAtMTE0Nyw2ICsxMTQ4
LDcgQEAgZW51bSBjcF9yZWFzb25fdHlwZSB7DQo+ICAgICAgIENQX0ZBU1RCT09UX01PREUsDQo+
ICAgICAgIENQX1NQRUNfTE9HX05VTSwNCj4gICAgICAgQ1BfUkVDT1ZFUl9ESVIsDQo+ICsgICAg
IENQX0VOQ19ESVIsDQo+ICAgfTsNCj4NCj4gICBlbnVtIGlvc3RhdF90eXBlIHsNCj4gZGlmZiAt
LWdpdCBhL2ZzL2YyZnMvZmlsZS5jIGIvZnMvZjJmcy9maWxlLmMgaW5kZXggDQo+IDgxOThhZmI1
ZmI5Yy4uMThiMzNiMWYwYzgzIDEwMDY0NA0KPiAtLS0gYS9mcy9mMmZzL2ZpbGUuYw0KPiArKysg
Yi9mcy9mMmZzL2ZpbGUuYw0KPiBAQCAtMjE4LDYgKzIxOCw5IEBAIHN0YXRpYyBpbmxpbmUgZW51
bSBjcF9yZWFzb25fdHlwZSBuZWVkX2RvX2NoZWNrcG9pbnQoc3RydWN0IGlub2RlICppbm9kZSkN
Cj4gICAgICAgICAgICAgICBmMmZzX2V4aXN0X3dyaXR0ZW5fZGF0YShzYmksIEYyRlNfSShpbm9k
ZSktPmlfcGlubywNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgVFJBTlNfRElSX0lOTykpDQo+ICAgICAgICAgICAgICAgY3BfcmVhc29uID0g
Q1BfUkVDT1ZFUl9ESVI7DQo+ICsgICAgIGVsc2UgaWYgKGYyZnNfZXhpc3Rfd3JpdHRlbl9kYXRh
KHNiaSwgRjJGU19JKGlub2RlKS0+aV9waW5vLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBFTkNfRElSX0lOTykpDQo+ICsgICAgICAgICAg
ICAgY3BfcmVhc29uID0gQ1BfRU5DX0RJUjsNCj4NCj4gICAgICAgcmV0dXJuIGNwX3JlYXNvbjsN
Cj4gICB9DQo+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3hhdHRyLmMgYi9mcy9mMmZzL3hhdHRyLmMg
aW5kZXggDQo+IGYyOTBmZTkzMjdjNC4uY2JkMWI4ODI5N2ZlIDEwMDY0NA0KPiAtLS0gYS9mcy9m
MmZzL3hhdHRyLmMNCj4gKysrIGIvZnMvZjJmcy94YXR0ci5jDQo+IEBAIC02MjksNiArNjI5LDcg
QEAgc3RhdGljIGludCBfX2YyZnNfc2V0eGF0dHIoc3RydWN0IGlub2RlICppbm9kZSwgaW50IGlu
ZGV4LA0KPiAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgY2hhciAqbmFtZSwgY29uc3Qgdm9p
ZCAqdmFsdWUsIHNpemVfdCBzaXplLA0KPiAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHBh
Z2UgKmlwYWdlLCBpbnQgZmxhZ3MpDQo+ICAgew0KPiArICAgICBzdHJ1Y3QgZjJmc19zYl9pbmZv
ICpzYmkgPSBGMkZTX0lfU0IoaW5vZGUpOw0KPiAgICAgICBzdHJ1Y3QgZjJmc194YXR0cl9lbnRy
eSAqaGVyZSwgKmxhc3Q7DQo+ICAgICAgIHZvaWQgKmJhc2VfYWRkciwgKmxhc3RfYmFzZV9hZGRy
Ow0KPiAgICAgICBpbnQgZm91bmQsIG5ld3NpemU7DQo+IEBAIC03NzIsOCArNzczLDE5IEBAIHN0
YXRpYyBpbnQgX19mMmZzX3NldHhhdHRyKHN0cnVjdCBpbm9kZSAqaW5vZGUsIGludCBpbmRleCwN
Cj4gICAgICAgaWYgKGluZGV4ID09IEYyRlNfWEFUVFJfSU5ERVhfRU5DUllQVElPTiAmJg0KPiAg
ICAgICAgICAgICAgICAgICAgICAgIXN0cmNtcChuYW1lLCBGMkZTX1hBVFRSX05BTUVfRU5DUllQ
VElPTl9DT05URVhUKSkNCj4gICAgICAgICAgICAgICBmMmZzX3NldF9lbmNyeXB0ZWRfaW5vZGUo
aW5vZGUpOw0KPiAtICAgICBpZiAoU19JU0RJUihpbm9kZS0+aV9tb2RlKSkNCj4gLSAgICAgICAg
ICAgICBzZXRfc2JpX2ZsYWcoRjJGU19JX1NCKGlub2RlKSwgU0JJX05FRURfQ1ApOw0KPiArDQo+
ICsgICAgIGlmIChTX0lTRElSKGlub2RlLT5pX21vZGUpKSB7DQo+ICsgICAgICAgICAgICAgLyoN
Cj4gKyAgICAgICAgICAgICAgKiBJbiByZXN0cmljdCBtb2RlLCBmc3luYygpIGFsd2F5cyB0cmll
cyB0cmlnZ2VyaW5nIGNoZWNrcG9pbnQNCj4gKyAgICAgICAgICAgICAgKiBmb3IgYWxsIG1ldGFk
YXRhIGNvbnNpc3RlbmN5LCBpbiBvdGhlciBtb2RlLCBpdCBvbmx5IHRyaWdnZXJzDQo+ICsgICAg
ICAgICAgICAgICogY2hlY2twb2ludCB3aGVuIHBhcmVudCdzIGVuY3J5cHRpb24gbWV0YWRhdGEg
dXBkYXRlcy4NCj4gKyAgICAgICAgICAgICAgKi8NCj4gKyAgICAgICAgICAgICBpZiAoRjJGU19P
UFRJT04oc2JpKS5mc3luY19tb2RlID09IEZTWU5DX01PREVfU1RSSUNUKQ0KPiArICAgICAgICAg
ICAgICAgICAgICAgc2V0X3NiaV9mbGFnKEYyRlNfSV9TQihpbm9kZSksIFNCSV9ORUVEX0NQKTsN
Cj4gKyAgICAgICAgICAgICBlbHNlIGlmIChJU19FTkNSWVBURUQoaW5vZGUpICYmDQo+ICsgICAg
ICAgICAgICAgICAgICAgICBmMmZzX2lzX2NoZWNrcG9pbnRlZF9ub2RlKHNiaSwgaW5vZGUtPmlf
aW5vKSkNCj4gKyAgICAgICAgICAgICAgICAgICAgIGYyZnNfYWRkX2lub19lbnRyeShzYmksIGlu
b2RlLT5pX2lubywgRU5DX0RJUl9JTk8pOw0KPiArICAgICB9DQo+DQo+ICAgc2FtZToNCj4gICAg
ICAgaWYgKGlzX2lub2RlX2ZsYWdfc2V0KGlub2RlLCBGSV9BQ0xfTU9ERSkpIHsgZGlmZiAtLWdp
dCANCj4gYS9pbmNsdWRlL3RyYWNlL2V2ZW50cy9mMmZzLmggYi9pbmNsdWRlL3RyYWNlL2V2ZW50
cy9mMmZzLmggaW5kZXggDQo+IDdlZDBmYzQzMGRjNi4uNDhmMmUzOTllMTg0IDEwMDY0NA0KPiAt
LS0gYS9pbmNsdWRlL3RyYWNlL2V2ZW50cy9mMmZzLmgNCj4gKysrIGIvaW5jbHVkZS90cmFjZS9l
dmVudHMvZjJmcy5oDQo+IEBAIC0xMzksNyArMTM5LDggQEAgVFJBQ0VfREVGSU5FX0VOVU0oRVhf
QkxPQ0tfQUdFKTsNCj4gICAgICAgICAgICAgICB7IENQX05PREVfTkVFRF9DUCwgICAgICAibm9k
ZSBuZWVkcyBjcCIgfSwgICAgICAgICAgICAgIFwNCj4gICAgICAgICAgICAgICB7IENQX0ZBU1RC
T09UX01PREUsICAgICAiZmFzdGJvb3QgbW9kZSIgfSwgICAgICAgICAgICAgIFwNCj4gICAgICAg
ICAgICAgICB7IENQX1NQRUNfTE9HX05VTSwgICAgICAibG9nIHR5cGUgaXMgMiIgfSwgICAgICAg
ICAgICAgIFwNCj4gLSAgICAgICAgICAgICB7IENQX1JFQ09WRVJfRElSLCAgICAgICAiZGlyIG5l
ZWRzIHJlY292ZXJ5IiB9KQ0KPiArICAgICAgICAgICAgIHsgQ1BfUkVDT1ZFUl9ESVIsICAgICAg
ICJkaXIgbmVlZHMgcmVjb3ZlcnkiIH0sICAgICAgICAgXA0KPiArICAgICAgICAgICAgIHsgQ1Bf
RU5DX0RJUiwgICAgICAgICAgICJwZXJzaXN0IGVuY3J5cHRpb24gcG9saWN5IiB9KQ0KPg0KPiAg
ICNkZWZpbmUgc2hvd19zaHV0ZG93bl9tb2RlKHR5cGUpICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXA0KPiAgICAgICBfX3ByaW50X3N5bWJvbGljKHR5cGUsICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Ckxp
bnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNl
Zm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
