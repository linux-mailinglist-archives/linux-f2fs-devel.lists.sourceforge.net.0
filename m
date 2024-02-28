Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE4F86A4F9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Feb 2024 02:26:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rf8iA-0003Ef-1f;
	Wed, 28 Feb 2024 01:26:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Zhiguo.Niu@unisoc.com>) id 1rf8i7-0003EY-QJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Feb 2024 01:26:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YArx/ul3nX3YA+zE5w0LhqxzbD9nyv1jstx1EHtV+dA=; b=MjeYBdxX8SbtcB4J/uPEsKbhVa
 TA6JEnwYhD8xEt4nQHhPBYoMrTLNB4SB2YXipipzzPwQNYrxh/BXCYDp2ISQ7gMRHHvtUF3yxrL7b
 S6OxQbHSHvicGQBkGwJClYPNAEiYo8zqoOpaIMnW9UQsKEDtUcGjGlkKuu3u/svlQB9s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:Message-ID
 :Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=YArx/ul3nX3YA+zE5w0LhqxzbD9nyv1jstx1EHtV+dA=; b=N
 NsrjEzux2UFjj2oDBlP1MSGY7/OfaLOJyxM7CFe6Vrq/oMNRAxAJ03j6VEteWFa6NsRIj10Rud2XK
 rAu2YNDNmorOU7M2A4dKbv5IMVbFA7xMUxLH6Pou17KVd5JvFBL8g45YxIdVR3Bl+RXPkJZ7hJlIK
 NaV24Gp1dzmCZrIk=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rf8i7-0007ml-42 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Feb 2024 01:26:16 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 41S1PlnF011606;
 Wed, 28 Feb 2024 09:25:47 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4TkxVM0jlzz2KXNZd;
 Wed, 28 Feb 2024 09:24:59 +0800 (CST)
Received: from BJMBX02.spreadtrum.com (10.0.64.8) by BJMBX02.spreadtrum.com
 (10.0.64.8) with Microsoft SMTP Server (TLS) id 15.0.1497.23; Wed, 28 Feb
 2024 09:25:45 +0800
Received: from BJMBX02.spreadtrum.com ([fe80::f022:2a7c:e5bc:aacd]) by
 BJMBX02.spreadtrum.com ([fe80::f022:2a7c:e5bc:aacd%19]) with mapi id
 15.00.1497.023; Wed, 28 Feb 2024 09:25:45 +0800
From: =?utf-8?B?54mb5b+X5Zu9IChaaGlndW8gTml1KQ==?= <Zhiguo.Niu@unisoc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>
Thread-Topic: [f2fs-dev] [bug report] f2fs: stop checkpoint when get a
 out-of-bounds segment
Thread-Index: AQHaaZC98VGfl/lHWEqqmLtwNS/on7Ed7jMAgAD/nLCAAACAgIAACBQg
Date: Wed, 28 Feb 2024 01:25:44 +0000
Message-ID: <488d3814783a49c5a92eee6be2c2550d@BJMBX02.spreadtrum.com>
References: <bb8814a4-09e1-49b7-ab13-391624a0658c@moroto.mountain>
 <Zd4d_qPiG-8-l1J2@google.com>  
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.126.103]
MIME-Version: 1.0
X-MAIL: SHSQR01.spreadtrum.com 41S1PlnF011606
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi Jaegeuk, I understand what you mean^^, please ignore my
    last email, sorry again:). Thanks! -----邮件原件----- 发件人: 牛志国
    (Zhiguo Niu) 发送时间: 2024年2月28日 8:55 收件人: 'J [...] 
 
 Content analysis details:   (-0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rf8i7-0007ml-42
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

SGkgSmFlZ2V1aywNCkkgdW5kZXJzdGFuZCB3aGF0IHlvdSBtZWFuXl4sIA0KcGxlYXNlIGlnbm9y
ZSBteSBsYXN0IGVtYWlsLCBzb3JyeSBhZ2FpbjopLg0KVGhhbmtzIQ0KLS0tLS3pgq7ku7bljp/k
u7YtLS0tLQ0K5Y+R5Lu25Lq6OiDniZvlv5flm70gKFpoaWd1byBOaXUpIA0K5Y+R6YCB5pe26Ze0
OiAyMDI05bm0MuaciDI45pelIDg6NTUNCuaUtuS7tuS6ujogJ0phZWdldWsgS2ltJyA8amFlZ2V1
a0BrZXJuZWwub3JnPjsgJ0RhbiBDYXJwZW50ZXInIDxkYW4uY2FycGVudGVyQGxpbmFyby5vcmc+
DQrmioTpgIE6ICdsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldCcgPGxpbnV4
LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Pjsg6YeR57qi5a6HIChIb25neXUgSmlu
KSA8SG9uZ3l1LkppbkB1bmlzb2MuY29tPjsgJ0NoYW8gWXUnIDxjaGFvQGtlcm5lbC5vcmc+DQrk
uLvpopg6IOetlOWkjTogW2YyZnMtZGV2XSBbYnVnIHJlcG9ydF0gZjJmczogc3RvcCBjaGVja3Bv
aW50IHdoZW4gZ2V0IGEgb3V0LW9mLWJvdW5kcyBzZWdtZW50DQoNCg0KSGkgSmFlZ2V1aywNCkNo
YW8ncyBwYXRjaCAgZml4IHNob3VsZCBjYW4gZml4IHRoaXMgd2FybmluZzoNCmYyZnM6IGZpeCB0
byBkb24ndCBjYWxsIGYyZnNfc3RvcF9jaGVja3BvaW50IGluIHNwaW5sb2NrIGNvdmVyYWdlIHRo
YW5rcyENCi0tLS0t6YKu5Lu25Y6f5Lu2LS0tLS0NCuWPkeS7tuS6ujogSmFlZ2V1ayBLaW0gPGph
ZWdldWtAa2VybmVsLm9yZz4NCuWPkemAgeaXtumXtDogMjAyNOW5tDLmnIgyOOaXpSAxOjM4DQrm
lLbku7bkuro6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAbGluYXJvLm9yZz4NCuaKhOmA
gTog54mb5b+X5Zu9IChaaGlndW8gTml1KSA8WmhpZ3VvLk5pdUB1bmlzb2MuY29tPjsgbGludXgt
ZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQNCuS4u+mimDogUmU6IFtmMmZzLWRldl0g
W2J1ZyByZXBvcnRdIGYyZnM6IHN0b3AgY2hlY2twb2ludCB3aGVuIGdldCBhIG91dC1vZi1ib3Vu
ZHMgc2VnbWVudA0KDQoNCuazqOaEjzog6L+Z5bCB6YKu5Lu25p2l6Ieq5LqO5aSW6YOo44CC6Zmk
6Z2e5L2g56Gu5a6a6YKu5Lu25YaF5a655a6J5YWo77yM5ZCm5YiZ5LiN6KaB54K55Ye75Lu75L2V
6ZO+5o6l5ZKM6ZmE5Lu244CCDQpDQVVUSU9OOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBv
dXRzaWRlIG9mIHRoZSBvcmdhbml6YXRpb24uIERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0
dGFjaG1lbnRzIHVubGVzcyB5b3UgcmVjb2duaXplIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNv
bnRlbnQgaXMgc2FmZS4NCg0KDQoNCkhpLA0KDQpJIG1lcmdlZCB0d28gcGF0Y2hlcywgd2hpY2gg
YWRkcmVzc2VzIHRoaXMuDQoNCmYyZnM6IHN0b3AgY2hlY2twb2ludCB3aGVuIGdldCBhIG91dC1v
Zi1ib3VuZHMgc2VnbWVudA0KZjJmczogZml4IHRvIGRvbid0IGNhbGwgZjJmc19zdG9wX2NoZWNr
cG9pbnQgaW4gc3BpbmxvY2sgY292ZXJhZ2UNCg0KT24gMDIvMjcsIERhbiBDYXJwZW50ZXIgd3Jv
dGU6DQo+IEhlbGxvIFpoaWd1byBOaXUsDQo+DQo+IFRoZSBwYXRjaCA3YTAzOTI5MzJmOTc6ICJm
MmZzOiBzdG9wIGNoZWNrcG9pbnQgd2hlbiBnZXQgYSANCj4gb3V0LW9mLWJvdW5kcyBzZWdtZW50
IiBmcm9tIEZlYiAyMCwgMjAyNCAobGludXgtbmV4dCksIGxlYWRzIHRvIHRoZSANCj4gZm9sbG93
aW5nIFNtYXRjaCBzdGF0aWMgY2hlY2tlciB3YXJuaW5nOg0KPg0KPiAgICAgICBmcy9mMmZzL2No
ZWNrcG9pbnQuYzozNCBmMmZzX3N0b3BfY2hlY2twb2ludCgpDQo+ICAgICAgIHdhcm46IHNsZWVw
aW5nIGluIGF0b21pYyBjb250ZXh0DQo+DQo+IGZzL2YyZnMvc2VnbWVudC5jDQo+ICAgMjY1MCAg
c3RhdGljIHZvaWQgZ2V0X25ld19zZWdtZW50KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwNCj4g
ICAyNjUxICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgKm5ld3NlZywgYm9v
bCBuZXdfc2VjLCBib29sIHBpbm5pbmcpDQo+ICAgMjY1MiAgew0KPiAgIDI2NTMgICAgICAgICAg
c3RydWN0IGZyZWVfc2VnbWFwX2luZm8gKmZyZWVfaSA9IEZSRUVfSShzYmkpOw0KPiAgIDI2NTQg
ICAgICAgICAgdW5zaWduZWQgaW50IHNlZ25vLCBzZWNubywgem9uZW5vOw0KPiAgIDI2NTUgICAg
ICAgICAgdW5zaWduZWQgaW50IHRvdGFsX3pvbmVzID0gTUFJTl9TRUNTKHNiaSkgLyBzYmktPnNl
Y3NfcGVyX3pvbmU7DQo+ICAgMjY1NiAgICAgICAgICB1bnNpZ25lZCBpbnQgaGludCA9IEdFVF9T
RUNfRlJPTV9TRUcoc2JpLCAqbmV3c2VnKTsNCj4gICAyNjU3ICAgICAgICAgIHVuc2lnbmVkIGlu
dCBvbGRfem9uZW5vID0gR0VUX1pPTkVfRlJPTV9TRUcoc2JpLCAqbmV3c2VnKTsNCj4gICAyNjU4
ICAgICAgICAgIGJvb2wgaW5pdCA9IHRydWU7DQo+ICAgMjY1OSAgICAgICAgICBpbnQgaTsNCj4g
ICAyNjYwDQo+ICAgMjY2MSAgICAgICAgICBzcGluX2xvY2soJmZyZWVfaS0+c2VnbWFwX2xvY2sp
Ow0KPiAgICAgICAgICAgICAgICAgXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXiBwcmVl
bXB0IGRpc2FibGVkIGhlcmUNCj4NCj4gICAyNjYyDQo+ICAgMjY2MyAgICAgICAgICBpZiAoIW5l
d19zZWMgJiYgKCgqbmV3c2VnICsgMSkgJSBTRUdTX1BFUl9TRUMoc2JpKSkpIHsNCj4gICAyNjY0
ICAgICAgICAgICAgICAgICAgc2Vnbm8gPSBmaW5kX25leHRfemVyb19iaXQoZnJlZV9pLT5mcmVl
X3NlZ21hcCwNCj4gICAyNjY1ICAgICAgICAgICAgICAgICAgICAgICAgICBHRVRfU0VHX0ZST01f
U0VDKHNiaSwgaGludCArIDEpLCAqbmV3c2VnICsgMSk7DQo+ICAgMjY2NiAgICAgICAgICAgICAg
ICAgIGlmIChzZWdubyA8IEdFVF9TRUdfRlJPTV9TRUMoc2JpLCBoaW50ICsgMSkpDQo+ICAgMjY2
NyAgICAgICAgICAgICAgICAgICAgICAgICAgZ290byBnb3RfaXQ7DQo+ICAgMjY2OCAgICAgICAg
ICB9DQo+ICAgMjY2OQ0KPiAgIDI2NzAgICAgICAgICAgLyoNCj4gICAyNjcxICAgICAgICAgICAq
IElmIHdlIGZvcm1hdCBmMmZzIG9uIHpvbmVkIHN0b3JhZ2UsIGxldCdzIHRyeSB0byBnZXQgcGlu
bmVkIHNlY3Rpb25zDQo+ICAgMjY3MiAgICAgICAgICAgKiBmcm9tIGJlZ2lubmluZyBvZiB0aGUg
c3RvcmFnZSwgd2hpY2ggc2hvdWxkIGJlIGEgY29udmVudGlvbmFsIG9uZS4NCj4gICAyNjczICAg
ICAgICAgICAqLw0KPiAgIDI2NzQgICAgICAgICAgaWYgKGYyZnNfc2JfaGFzX2Jsa3pvbmVkKHNi
aSkpIHsNCj4gICAyNjc1ICAgICAgICAgICAgICAgICAgc2Vnbm8gPSBwaW5uaW5nID8gMCA6IG1h
eChmaXJzdF96b25lZF9zZWdubyhzYmkpLCAqbmV3c2VnKTsNCj4gICAyNjc2ICAgICAgICAgICAg
ICAgICAgaGludCA9IEdFVF9TRUNfRlJPTV9TRUcoc2JpLCBzZWdubyk7DQo+ICAgMjY3NyAgICAg
ICAgICB9DQo+ICAgMjY3OA0KPiAgIDI2NzkgIGZpbmRfb3RoZXJfem9uZToNCj4gICAyNjgwICAg
ICAgICAgIHNlY25vID0gZmluZF9uZXh0X3plcm9fYml0KGZyZWVfaS0+ZnJlZV9zZWNtYXAsIE1B
SU5fU0VDUyhzYmkpLCBoaW50KTsNCj4gICAyNjgxICAgICAgICAgIGlmIChzZWNubyA+PSBNQUlO
X1NFQ1Moc2JpKSkgew0KPiAgIDI2ODIgICAgICAgICAgICAgICAgICBzZWNubyA9IGZpbmRfZmly
c3RfemVyb19iaXQoZnJlZV9pLT5mcmVlX3NlY21hcCwNCj4gICAyNjgzICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE1BSU5fU0VDUyhzYmkp
KTsNCj4gICAyNjg0ICAgICAgICAgICAgICAgICAgaWYgKHNlY25vID49IE1BSU5fU0VDUyhzYmkp
KSB7DQo+ICAgMjY4NSAgICAgICAgICAgICAgICAgICAgICAgICAgZjJmc19zdG9wX2NoZWNrcG9p
bnQoc2JpLCBmYWxzZSwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIF5eXl5eIFRoaXMgDQo+IGZhbHNlIG1lYW5zIHdlIHNsZWVwIHdo
aWxlIGhvbGRpbmcgYSBzcGluIGxvY2suDQo+DQo+ICAgMjY4NiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBTVE9QX0NQX1JFQVNPTl9OT19TRUdNRU5UKTsNCj4gICAyNjg3ICAgICAg
ICAgICAgICAgICAgICAgICAgICBmMmZzX2J1Z19vbihzYmksIDEpOw0KPiAgIDI2ODggICAgICAg
ICAgICAgICAgICB9DQo+ICAgMjY4OSAgICAgICAgICB9DQo+ICAgMjY5MCAgICAgICAgICBzZWdu
byA9IEdFVF9TRUdfRlJPTV9TRUMoc2JpLCBzZWNubyk7DQo+ICAgMjY5MSAgICAgICAgICB6b25l
bm8gPSBHRVRfWk9ORV9GUk9NX1NFQyhzYmksIHNlY25vKTsNCj4NCj4gZnMvZjJmcy9jaGVja3Bv
aW50LmMNCj4gICAgIDI5IHZvaWQgZjJmc19zdG9wX2NoZWNrcG9pbnQoc3RydWN0IGYyZnNfc2Jf
aW5mbyAqc2JpLCBib29sIGVuZF9pbywNCj4gICAgIDMwICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGNoYXIgcmVhc29uKQ0KPiAgICAgMzEg
ew0KPiAgICAgMzIgICAgICAgICBmMmZzX2J1aWxkX2ZhdWx0X2F0dHIoc2JpLCAwLCAwKTsNCj4g
ICAgIDMzICAgICAgICAgaWYgKCFlbmRfaW8pDQo+IC0tPiAzNCAgICAgICAgICAgICAgICAgZjJm
c19mbHVzaF9tZXJnZWRfd3JpdGVzKHNiaSk7DQo+ICAgICAzNSAgICAgICAgIGYyZnNfaGFuZGxl
X2NyaXRpY2FsX2Vycm9yKHNiaSwgcmVhc29uLCBlbmRfaW8pOw0KPiAgICAgMzYgfQ0KPg0KPiBy
ZWdhcmRzLA0KPiBkYW4gY2FycGVudGVyDQo+DQo+DQo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fDQo+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0
DQo+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0DQo+IGh0dHBzOi8vbGlz
dHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwNCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRl
dmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApo
dHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRl
dmVsCg==
