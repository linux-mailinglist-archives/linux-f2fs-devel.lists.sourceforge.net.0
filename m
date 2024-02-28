Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 849EB86A497
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Feb 2024 01:55:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rf8Ee-0005Md-3Y;
	Wed, 28 Feb 2024 00:55:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Zhiguo.Niu@unisoc.com>) id 1rf8Ec-0005MN-FM
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Feb 2024 00:55:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZETUhWHy2leDv0nZjpWaDxqnVr3N0/RYv2zWaDicudo=; b=j+tYWF8Z709oH2DrDM8WlmLAp+
 DqZtM9iBjbTuYBjEPpLkeNlsJPHEBFGBQJfhvtV1euvc1zMoUrf8+aAcibmheGJJwdF/b5b+AJoYr
 obUlqBHY1IPakqwbRtnmkQcInMXAQMn0M+qTxYNdUHcQb2AGz4oEolhkq6AIdXJE89N8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:Message-ID
 :Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ZETUhWHy2leDv0nZjpWaDxqnVr3N0/RYv2zWaDicudo=; b=T
 8hpOa6W/FxL/0wbJSYZMk6Ks49EhydkbM6Gz99IOHHVzQS8B+SdgL6ZPjXbDihAMMOc2YNM6tvguF
 QhXpGqU2lMK62rghE4B2u+6uzLCKPai+hZBpmjKcxjnbaKf1T14zn6oGXEpDW5KlCnX/xt/B20Jvl
 Tpj81xjdgxTMlPM0=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rf8EY-0006Jg-58 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Feb 2024 00:55:47 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 41S0t9bT059236;
 Wed, 28 Feb 2024 08:55:09 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx01.spreadtrum.com [10.0.64.7])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4Tkwq06kg6z2KGTdQ;
 Wed, 28 Feb 2024 08:54:20 +0800 (CST)
Received: from BJMBX02.spreadtrum.com (10.0.64.8) by BJMBX01.spreadtrum.com
 (10.0.64.7) with Microsoft SMTP Server (TLS) id 15.0.1497.23; Wed, 28 Feb
 2024 08:55:06 +0800
Received: from BJMBX02.spreadtrum.com ([fe80::f022:2a7c:e5bc:aacd]) by
 BJMBX02.spreadtrum.com ([fe80::f022:2a7c:e5bc:aacd%19]) with mapi id
 15.00.1497.023; Wed, 28 Feb 2024 08:55:06 +0800
From: =?utf-8?B?54mb5b+X5Zu9IChaaGlndW8gTml1KQ==?= <Zhiguo.Niu@unisoc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>
Thread-Topic: [f2fs-dev] [bug report] f2fs: stop checkpoint when get a
 out-of-bounds segment
Thread-Index: AQHaaZC98VGfl/lHWEqqmLtwNS/on7Ed7jMAgAD/nLCAAACAgA==
Date: Wed, 28 Feb 2024 00:55:06 +0000
Message-ID: <9036a77053a743c89222a811fe624803@BJMBX02.spreadtrum.com>
References: <bb8814a4-09e1-49b7-ab13-391624a0658c@moroto.mountain>
 <Zd4d_qPiG-8-l1J2@google.com> 
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.126.103]
MIME-Version: 1.0
X-MAIL: SHSQR01.spreadtrum.com 41S0t9bT059236
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi Jaegeuk, Chao's patch fix should can fix this warning:
   f2fs: fix to don't call f2fs_stop_checkpoint in spinlock coverage thanks!
   -----邮件原件----- 发件人: Jaegeuk Kim <jaegeuk@kernel.org> � [...]
    
 
 Content analysis details:   (-0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rf8EY-0006Jg-58
Subject: [f2fs-dev] =?utf-8?b?562U5aSNOiAgW2J1ZyByZXBvcnRdIGYyZnM6IHN0b3Ag?=
 =?utf-8?q?checkpoint_when_get_a_out-of-bounds_segment?=
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
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

DQpIaSBKYWVnZXVrLA0KQ2hhbydzIHBhdGNoICBmaXggc2hvdWxkIGNhbiBmaXggdGhpcyB3YXJu
aW5nOg0KZjJmczogZml4IHRvIGRvbid0IGNhbGwgZjJmc19zdG9wX2NoZWNrcG9pbnQgaW4gc3Bp
bmxvY2sgY292ZXJhZ2UgdGhhbmtzIQ0KLS0tLS3pgq7ku7bljp/ku7YtLS0tLQ0K5Y+R5Lu25Lq6
OiBKYWVnZXVrIEtpbSA8amFlZ2V1a0BrZXJuZWwub3JnPg0K5Y+R6YCB5pe26Ze0OiAyMDI05bm0
MuaciDI45pelIDE6MzgNCuaUtuS7tuS6ujogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBs
aW5hcm8ub3JnPg0K5oqE6YCBOiDniZvlv5flm70gKFpoaWd1byBOaXUpIDxaaGlndW8uTml1QHVu
aXNvYy5jb20+OyBsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldA0K5Li76aKY
OiBSZTogW2YyZnMtZGV2XSBbYnVnIHJlcG9ydF0gZjJmczogc3RvcCBjaGVja3BvaW50IHdoZW4g
Z2V0IGEgb3V0LW9mLWJvdW5kcyBzZWdtZW50DQoNCg0K5rOo5oSPOiDov5nlsIHpgq7ku7bmnaXo
h6rkuo7lpJbpg6jjgILpmaTpnZ7kvaDnoa7lrprpgq7ku7blhoXlrrnlronlhajvvIzlkKbliJnk
uI3opoHngrnlh7vku7vkvZXpk77mjqXlkozpmYTku7bjgIINCkNBVVRJT046IFRoaXMgZW1haWwg
b3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgdGhlIG9yZ2FuaXphdGlvbi4gRG8gbm90IGNsaWNr
IGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSByZWNvZ25pemUgdGhlIHNlbmRl
ciBhbmQga25vdyB0aGUgY29udGVudCBpcyBzYWZlLg0KDQoNCg0KSGksDQoNCkkgbWVyZ2VkIHR3
byBwYXRjaGVzLCB3aGljaCBhZGRyZXNzZXMgdGhpcy4NCg0KZjJmczogc3RvcCBjaGVja3BvaW50
IHdoZW4gZ2V0IGEgb3V0LW9mLWJvdW5kcyBzZWdtZW50DQpmMmZzOiBmaXggdG8gZG9uJ3QgY2Fs
bCBmMmZzX3N0b3BfY2hlY2twb2ludCBpbiBzcGlubG9jayBjb3ZlcmFnZQ0KDQpPbiAwMi8yNywg
RGFuIENhcnBlbnRlciB3cm90ZToNCj4gSGVsbG8gWmhpZ3VvIE5pdSwNCj4NCj4gVGhlIHBhdGNo
IDdhMDM5MjkzMmY5NzogImYyZnM6IHN0b3AgY2hlY2twb2ludCB3aGVuIGdldCBhIA0KPiBvdXQt
b2YtYm91bmRzIHNlZ21lbnQiIGZyb20gRmViIDIwLCAyMDI0IChsaW51eC1uZXh0KSwgbGVhZHMg
dG8gdGhlIA0KPiBmb2xsb3dpbmcgU21hdGNoIHN0YXRpYyBjaGVja2VyIHdhcm5pbmc6DQo+DQo+
ICAgICAgIGZzL2YyZnMvY2hlY2twb2ludC5jOjM0IGYyZnNfc3RvcF9jaGVja3BvaW50KCkNCj4g
ICAgICAgd2Fybjogc2xlZXBpbmcgaW4gYXRvbWljIGNvbnRleHQNCj4NCj4gZnMvZjJmcy9zZWdt
ZW50LmMNCj4gICAyNjUwICBzdGF0aWMgdm9pZCBnZXRfbmV3X3NlZ21lbnQoc3RydWN0IGYyZnNf
c2JfaW5mbyAqc2JpLA0KPiAgIDI2NTEgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVk
IGludCAqbmV3c2VnLCBib29sIG5ld19zZWMsIGJvb2wgcGlubmluZykNCj4gICAyNjUyICB7DQo+
ICAgMjY1MyAgICAgICAgICBzdHJ1Y3QgZnJlZV9zZWdtYXBfaW5mbyAqZnJlZV9pID0gRlJFRV9J
KHNiaSk7DQo+ICAgMjY1NCAgICAgICAgICB1bnNpZ25lZCBpbnQgc2Vnbm8sIHNlY25vLCB6b25l
bm87DQo+ICAgMjY1NSAgICAgICAgICB1bnNpZ25lZCBpbnQgdG90YWxfem9uZXMgPSBNQUlOX1NF
Q1Moc2JpKSAvIHNiaS0+c2Vjc19wZXJfem9uZTsNCj4gICAyNjU2ICAgICAgICAgIHVuc2lnbmVk
IGludCBoaW50ID0gR0VUX1NFQ19GUk9NX1NFRyhzYmksICpuZXdzZWcpOw0KPiAgIDI2NTcgICAg
ICAgICAgdW5zaWduZWQgaW50IG9sZF96b25lbm8gPSBHRVRfWk9ORV9GUk9NX1NFRyhzYmksICpu
ZXdzZWcpOw0KPiAgIDI2NTggICAgICAgICAgYm9vbCBpbml0ID0gdHJ1ZTsNCj4gICAyNjU5ICAg
ICAgICAgIGludCBpOw0KPiAgIDI2NjANCj4gICAyNjYxICAgICAgICAgIHNwaW5fbG9jaygmZnJl
ZV9pLT5zZWdtYXBfbG9jayk7DQo+ICAgICAgICAgICAgICAgICBeXl5eXl5eXl5eXl5eXl5eXl5e
Xl5eXl5eXl5eXl5eIHByZWVtcHQgZGlzYWJsZWQgaGVyZQ0KPg0KPiAgIDI2NjINCj4gICAyNjYz
ICAgICAgICAgIGlmICghbmV3X3NlYyAmJiAoKCpuZXdzZWcgKyAxKSAlIFNFR1NfUEVSX1NFQyhz
YmkpKSkgew0KPiAgIDI2NjQgICAgICAgICAgICAgICAgICBzZWdubyA9IGZpbmRfbmV4dF96ZXJv
X2JpdChmcmVlX2ktPmZyZWVfc2VnbWFwLA0KPiAgIDI2NjUgICAgICAgICAgICAgICAgICAgICAg
ICAgIEdFVF9TRUdfRlJPTV9TRUMoc2JpLCBoaW50ICsgMSksICpuZXdzZWcgKyAxKTsNCj4gICAy
NjY2ICAgICAgICAgICAgICAgICAgaWYgKHNlZ25vIDwgR0VUX1NFR19GUk9NX1NFQyhzYmksIGhp
bnQgKyAxKSkNCj4gICAyNjY3ICAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIGdvdF9pdDsN
Cj4gICAyNjY4ICAgICAgICAgIH0NCj4gICAyNjY5DQo+ICAgMjY3MCAgICAgICAgICAvKg0KPiAg
IDI2NzEgICAgICAgICAgICogSWYgd2UgZm9ybWF0IGYyZnMgb24gem9uZWQgc3RvcmFnZSwgbGV0
J3MgdHJ5IHRvIGdldCBwaW5uZWQgc2VjdGlvbnMNCj4gICAyNjcyICAgICAgICAgICAqIGZyb20g
YmVnaW5uaW5nIG9mIHRoZSBzdG9yYWdlLCB3aGljaCBzaG91bGQgYmUgYSBjb252ZW50aW9uYWwg
b25lLg0KPiAgIDI2NzMgICAgICAgICAgICovDQo+ICAgMjY3NCAgICAgICAgICBpZiAoZjJmc19z
Yl9oYXNfYmxrem9uZWQoc2JpKSkgew0KPiAgIDI2NzUgICAgICAgICAgICAgICAgICBzZWdubyA9
IHBpbm5pbmcgPyAwIDogbWF4KGZpcnN0X3pvbmVkX3NlZ25vKHNiaSksICpuZXdzZWcpOw0KPiAg
IDI2NzYgICAgICAgICAgICAgICAgICBoaW50ID0gR0VUX1NFQ19GUk9NX1NFRyhzYmksIHNlZ25v
KTsNCj4gICAyNjc3ICAgICAgICAgIH0NCj4gICAyNjc4DQo+ICAgMjY3OSAgZmluZF9vdGhlcl96
b25lOg0KPiAgIDI2ODAgICAgICAgICAgc2Vjbm8gPSBmaW5kX25leHRfemVyb19iaXQoZnJlZV9p
LT5mcmVlX3NlY21hcCwgTUFJTl9TRUNTKHNiaSksIGhpbnQpOw0KPiAgIDI2ODEgICAgICAgICAg
aWYgKHNlY25vID49IE1BSU5fU0VDUyhzYmkpKSB7DQo+ICAgMjY4MiAgICAgICAgICAgICAgICAg
IHNlY25vID0gZmluZF9maXJzdF96ZXJvX2JpdChmcmVlX2ktPmZyZWVfc2VjbWFwLA0KPiAgIDI2
ODMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgTUFJTl9TRUNTKHNiaSkpOw0KPiAgIDI2ODQgICAgICAgICAgICAgICAgICBpZiAoc2Vjbm8g
Pj0gTUFJTl9TRUNTKHNiaSkpIHsNCj4gICAyNjg1ICAgICAgICAgICAgICAgICAgICAgICAgICBm
MmZzX3N0b3BfY2hlY2twb2ludChzYmksIGZhbHNlLA0KPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXl5eXl4gVGhpcyANCj4gZmFsc2Ug
bWVhbnMgd2Ugc2xlZXAgd2hpbGUgaG9sZGluZyBhIHNwaW4gbG9jay4NCj4NCj4gICAyNjg2ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNUT1BfQ1BfUkVBU09OX05PX1NFR01FTlQp
Ow0KPiAgIDI2ODcgICAgICAgICAgICAgICAgICAgICAgICAgIGYyZnNfYnVnX29uKHNiaSwgMSk7
DQo+ICAgMjY4OCAgICAgICAgICAgICAgICAgIH0NCj4gICAyNjg5ICAgICAgICAgIH0NCj4gICAy
NjkwICAgICAgICAgIHNlZ25vID0gR0VUX1NFR19GUk9NX1NFQyhzYmksIHNlY25vKTsNCj4gICAy
NjkxICAgICAgICAgIHpvbmVubyA9IEdFVF9aT05FX0ZST01fU0VDKHNiaSwgc2Vjbm8pOw0KPg0K
PiBmcy9mMmZzL2NoZWNrcG9pbnQuYw0KPiAgICAgMjkgdm9pZCBmMmZzX3N0b3BfY2hlY2twb2lu
dChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGJvb2wgZW5kX2lvLA0KPiAgICAgMzAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgY2hhciBy
ZWFzb24pDQo+ICAgICAzMSB7DQo+ICAgICAzMiAgICAgICAgIGYyZnNfYnVpbGRfZmF1bHRfYXR0
cihzYmksIDAsIDApOw0KPiAgICAgMzMgICAgICAgICBpZiAoIWVuZF9pbykNCj4gLS0+IDM0ICAg
ICAgICAgICAgICAgICBmMmZzX2ZsdXNoX21lcmdlZF93cml0ZXMoc2JpKTsNCj4gICAgIDM1ICAg
ICAgICAgZjJmc19oYW5kbGVfY3JpdGljYWxfZXJyb3Ioc2JpLCByZWFzb24sIGVuZF9pbyk7DQo+
ICAgICAzNiB9DQo+DQo+IHJlZ2FyZHMsDQo+IGRhbiBjYXJwZW50ZXINCj4NCj4NCj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gTGludXgtZjJmcy1k
ZXZlbCBtYWlsaW5nIGxpc3QNCj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5u
ZXQNCj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgt
ZjJmcy1kZXZlbA0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMu
c291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3Rp
bmZvL2xpbnV4LWYyZnMtZGV2ZWwK
