Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D79A86DF41
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  1 Mar 2024 11:33:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rg0CS-0000zo-Hg;
	Fri, 01 Mar 2024 10:33:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <huangjianan@xiaomi.com>) id 1rg0CI-0000yd-5s
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 Mar 2024 10:32:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HvBa5HKSFt+zjQYE3fIibPm8U7LxPt6+hG5mqHjvU8w=; b=ZUSTKs8ZYBHec8HFpg1xhrFGf5
 vZYXuOSYIYJLFs9svgSt6ZCBQI5CnzNPD78ecp9+pPBGpBzmFC1iMCZDytwyagxwnc4V0D1pBO/V9
 aTrkn+gMcBb5BNO8GOlzTReQ7cA8XkBy5YBM/Py2mllORiAQWYU3nEl3gDLxLc+Zq0Uw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HvBa5HKSFt+zjQYE3fIibPm8U7LxPt6+hG5mqHjvU8w=; b=O1zy/rRrLRRK/bfON3Kni99Msw
 sgUO1i8I/8xzXkOpuGwNHNrUwAzsWpBuiw9JIWA1kZhMGp9idB7XpDrobW5VEi8zxU2+8qJg55ZPa
 RPx1eQ4RkZSAkXwqTTOywqjkTfIexoOGiCqD0uNPkHcwHpJIlW/1nJDIHP5aXAswukH4=;
Received: from outboundhk.mxmail.xiaomi.com ([118.143.206.90])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1rg0C7-0003nr-W2 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 Mar 2024 10:32:52 +0000
X-IronPort-AV: E=Sophos;i="6.06,196,1705334400"; d="scan'208";a="79436643"
To: Juhyung Park <qkrwngud825@gmail.com>, "chao@kernel.org" <chao@kernel.org>
Thread-Topic: [External Mail]Re: [f2fs-dev] [PATCH v3] f2fs-tools: fix to
 check loop device for non-root users
Thread-Index: AQHaa6gLP9pDeXfIUkKjjHBfKzHLZLEiCnkAgAAfkYA=
Date: Fri, 1 Mar 2024 10:32:21 +0000
Message-ID: <9ee3e01b-72c2-4eed-aed7-b005b3173203@xiaomi.com>
References: <20240229074141.66395-1-huangjianan@xiaomi.com>
 <20240301071402.159309-1-huangjianan@xiaomi.com>
 <CAD14+f0saGRa401qDWKwFiYgsHUBcqrfxgmXCWcq1Eqphj8OPw@mail.gmail.com>
In-Reply-To: <CAD14+f0saGRa401qDWKwFiYgsHUBcqrfxgmXCWcq1Eqphj8OPw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.88.13]
Content-ID: <7B0F2F8CCDE11941B670D4352AB7B87E@xiaomi.com>
MIME-Version: 1.0
X-Spam-Score: 0.9 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2024/3/1 16:39, Juhyung Park wrote: > [外部邮件] 此邮件来源于小米公司外部，请谨慎处理。若对邮件安全性存疑，请将邮件转发给misec@xiaomi.com进行反馈
    > > Hi [...] 
 
 Content analysis details:   (0.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
                             [118.143.206.90 listed in wl.mailspike.net]
  0.9 SPF_HELO_SOFTFAIL      SPF: HELO does not match SPF record (softfail)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1rg0C7-0003nr-W2
Subject: Re: [f2fs-dev] [External Mail]Re: [PATCH v3] f2fs-tools: fix to
 check loop device for non-root users
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
From: =?utf-8?B?6buE5L2z55S3?= via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: =?utf-8?B?6buE5L2z55S3?= <huangjianan@xiaomi.com>
Cc: "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 =?utf-8?B?546L6L6J?= <wanghui33@xiaomi.com>,
 "jnhuang95@gmail.com" <jnhuang95@gmail.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC8zLzEgMTY6MzksIEp1aHl1bmcgUGFyayB3cm90ZToNCj4gW+WklumDqOmCruS7tl0g
5q2k6YKu5Lu25p2l5rqQ5LqO5bCP57Gz5YWs5Y+45aSW6YOo77yM6K+36LCo5oWO5aSE55CG44CC
6Iul5a+56YKu5Lu25a6J5YWo5oCn5a2Y55aR77yM6K+35bCG6YKu5Lu26L2s5Y+R57uZbWlzZWNA
eGlhb21pLmNvbei/m+ihjOWPjemmiA0KPg0KPiBIaSBIdWFuZyBhbmQgQ2hhby4NCj4NCj4gSSBm
ZWVsIGxpa2UgdGhpcyBzcGVjaWFsIGxvb3BiYWNrIGhhbmRsaW5nIGFsb25nc2lkZSBDaGFvJ3MN
Cj4gMTQxOTdkNTQ2YjkzIG9uIGYyZnMtdG9vbHMgaXMganVzdCB1bm5lY2Vzc2FyaWx5IGNvbXBs
aWNhdGluZyB0aGUgY29kZQ0KPiBmbG93Lg0KPiBXZSdyZSBub3cgZG9pbmcgd2hhdCwgbG9va3Vw
IHRvIC9zeXMsIHBhcnNlIG9yaWdpbmFsIGJhY2tpbmcgZmlsZSwNCj4gcmVtb3ZlIHRyYWlsaW5n
IG5ld2xpbmUgY2hhciwgc3RhdCgpJ2luZyBpdCB0byBtYWtlIHN1cmUgaXQgZXhpc3RzPw0KDQpJ
bmRlZWQgdGhpcyBpcyBub3QgYSBnb29kIGFwcHJvYWNoLg0KDQo+IFdoYXQgaWYgdGhlIHN0YXQo
KSdlZCBmaWxlIGlzIGEgbmV3IGZpbGUgYWZ0ZXIgdGhlIG9yaWdpbmFsIGJhY2tpbmcNCj4gZmls
ZSBoYXMgYmVlbiBkZWxldGVkPw0KPg0KPiBCZWluZyBhYmxlIHRvIG92ZXJ3cml0ZSBhbiBhY3Rp
dmUgbG9vcGJhY2sgYmFja2luZyBmaWxlIGlzIGEgc2VtYW50aWMNCj4gdGhhdCBMaW51eCBwcm92
aWRlcyB3aWxsaW5nbHkuDQo+IE9fRVhDTCBvbmx5IHdvcmtzIG9uIGJsb2NrIGRldmljZXMgYW5k
IGl0J3MgYSBQT1NJWCBndWFyYW50ZWUgdGhhdA0KPiBtdWx0aXBsZSB3cml0ZXJzIGNhbiB3b3Jr
IG9uIGEgcmVndWxhciBmaWxlLg0KPg0KPiBJTUhPIHdlIHNob3VsZCBob25vciB0aGF0LCBidXQg
aWYgd2UgcmVhbGx5IHdhbnQgdG8gcHJldmVudCB0aGlzIGFraW4NCj4gdG8gZTJmc3Byb2dzLCB3
ZSBzaG91bGQgYmUgdXNpbmcgbW50ZW50IGxpa2UgZTJmc3Byb2dzLg0KDQplMmZzcHJvZ3Mgd2ls
bCBjb250aW51ZSB0byBjaGVjayBpZiBvcGVuaW5nIHRoZSBsb29wIGRldmljZSBmYWlscywgDQpy
YXRoZXIgdGhhbg0KDQpleGl0aW5nLiBUaGlzIHdheSBub24tcm9vdCB1c2VycyBjYW4gdXNlIG1r
ZnMvZnNjayBub3JtYWxseSwgYWx0aG91Z2ggdGhlcmUNCg0KbWF5IGJlIG92ZXJ3cml0ZSBpc3N1
ZXMuDQoNCg0KVGhhbmtzLA0KDQpKaWFuYW4NCg0KPiBPbiBGcmksIE1hciAxLCAyMDI0IGF0IDQ6
MTXigK9QTSBIdWFuZyBKaWFuYW4gdmlhIExpbnV4LWYyZnMtZGV2ZWwNCj4gPGxpbnV4LWYyZnMt
ZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0PiB3cm90ZToNCj4+IEN1cnJlbnRseSBta2ZzL2Zz
Y2sgZ2V0cyB0aGUgZm9sbG93aW5nIGVycm9yIHdoZW4gZXhlY3V0ZWQgYnkNCj4+IG5vbi1yb290
IHVzZXJzOg0KPj4NCj4+IEluZm86IG9wZW4gL2Rldi9sb29wMCBmYWlsZWQgZXJybm86MTMNCj4+
ICAgICAgICAgIEVycm9yOiBOb3QgYXZhaWxhYmxlIG9uIG1vdW50ZWQgZGV2aWNlIQ0KPj4NCj4+
IExldCdzIGZpeCBpdCBieSByZWFkaW5nIHRoZSBiYWNraW5nIGZpbGUgZnJvbSBzeXNmcy4NCj4+
DQo+PiBGaXhlczogMTQxOTdkNTQ2YjkzICgiZjJmcy10b29sczogZml4IHRvIGNoZWNrIGxvb3Ag
ZGV2aWNlIikNCj4+IFNpZ25lZC1vZmYtYnk6IEh1YW5nIEppYW5hbiA8aHVhbmdqaWFuYW5AeGlh
b21pLmNvbT4NCj4+IC0tLQ0KPj4gdjM6DQo+PiAtIFNraXAgZGVsZXRlZCBiYWNraW5nIGZpbGUu
DQo+PiAgIGxpYi9saWJmMmZzLmMgfCA0MCArKysrKysrKysrKysrKysrKysrKysrKysrKystLS0t
LS0tLS0tLS0tDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCAxMyBkZWxl
dGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvbGliL2xpYmYyZnMuYyBiL2xpYi9saWJmMmZz
LmMNCj4+IGluZGV4IGQ1MWU0ODUuLmZhZDNmZDQgMTAwNjQ0DQo+PiAtLS0gYS9saWIvbGliZjJm
cy5jDQo+PiArKysgYi9saWIvbGliZjJmcy5jDQo+PiBAQCAtODMyLDcgKzgzMiw3IEBAIGludCBm
MmZzX2Rldl9pc191bW91bnRlZChjaGFyICpwYXRoKQ0KPj4gICAgICAgICAgICAgICAgICB9DQo+
PiAgICAgICAgICB9IGVsc2UgaWYgKFNfSVNSRUcoc3RfYnVmLnN0X21vZGUpKSB7DQo+PiAgICAg
ICAgICAgICAgICAgIC8qIGNoZWNrIHdoZXRoZXIgcmVndWxhciBpcyBiYWNrZmlsZSBvZiBsb29w
IGRldmljZSAqLw0KPj4gLSNpZiBkZWZpbmVkKEhBVkVfTElOVVhfTE9PUF9IKSAmJiBkZWZpbmVk
KEhBVkVfTElOVVhfTUFKT1JfSCkNCj4+ICsjaWYgZGVmaW5lZChIQVZFX0xJTlVYX01BSk9SX0gp
DQo+PiAgICAgICAgICAgICAgICAgIHN0cnVjdCBtbnRlbnQgKm1udDsNCj4+ICAgICAgICAgICAg
ICAgICAgc3RydWN0IHN0YXQgc3RfbG9vcDsNCj4+ICAgICAgICAgICAgICAgICAgRklMRSAqZjsN
Cj4+IEBAIC04NDAsOCArODQwLDkgQEAgaW50IGYyZnNfZGV2X2lzX3Vtb3VudGVkKGNoYXIgKnBh
dGgpDQo+PiAgICAgICAgICAgICAgICAgIGYgPSBzZXRtbnRlbnQoIi9wcm9jL21vdW50cyIsICJy
Iik7DQo+Pg0KPj4gICAgICAgICAgICAgICAgICB3aGlsZSAoKG1udCA9IGdldG1udGVudChmKSkg
IT0gTlVMTCkgew0KPj4gLSAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGxvb3BfaW5mbzY0
IGxvb3BpbmZvID0gezAsIH07DQo+PiAtICAgICAgICAgICAgICAgICAgICAgICBpbnQgbG9vcF9m
ZCwgZXJyOw0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHN0YXQgc3RfYmFjazsN
Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgIGludCBzeXNmc19mZCwgcmM7DQo+PiArICAgICAg
ICAgICAgICAgICAgICAgICBjaGFyIGJ1ZltQQVRIX01BWCArIDFdOw0KPj4NCj4+ICAgICAgICAg
ICAgICAgICAgICAgICAgICBpZiAobW50LT5tbnRfZnNuYW1lWzBdICE9ICcvJykNCj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOw0KPj4gQEAgLTg1MiwyMyArODUz
LDM2IEBAIGludCBmMmZzX2Rldl9pc191bW91bnRlZChjaGFyICpwYXRoKQ0KPj4gICAgICAgICAg
ICAgICAgICAgICAgICAgIGlmIChtYWpvcihzdF9sb29wLnN0X3JkZXYpICE9IExPT1BfTUFKT1Ip
DQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsNCj4+DQo+PiAt
ICAgICAgICAgICAgICAgICAgICAgICBsb29wX2ZkID0gb3BlbihtbnQtPm1udF9mc25hbWUsIE9f
UkRPTkxZKTsNCj4+IC0gICAgICAgICAgICAgICAgICAgICAgIGlmIChsb29wX2ZkIDwgMCkgew0K
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgc25wcmludGYoYnVmLCBQQVRIX01BWCwNCj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICIvc3lzL2Rldi9ibG9jay8lZDolZC9sb29w
L2JhY2tpbmdfZmlsZSIsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtYWpv
cihzdF9sb29wLnN0X3JkZXYpLCBtaW5vcihzdF9sb29wLnN0X3JkZXYpKTsNCj4+ICsNCj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgIHN5c2ZzX2ZkID0gb3BlbihidWYsIE9fUkRPTkxZKTsNCj4+
ICsgICAgICAgICAgICAgICAgICAgICAgIGlmIChzeXNmc19mZCA8IDApIHsNCj4+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIE1TRygwLCAiSW5mbzogb3BlbiAlcyBmYWlsZWQgZXJy
bm86JWRcbiIsDQo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbW50
LT5tbnRfZnNuYW1lLCBlcnJubyk7DQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgYnVmLCBlcnJubyk7DQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICByZXR1cm4gLTE7DQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgfQ0KPj4NCj4+IC0gICAg
ICAgICAgICAgICAgICAgICAgIGVyciA9IGlvY3RsKGxvb3BfZmQsIExPT1BfR0VUX1NUQVRVUzY0
LCAmbG9vcGluZm8pOw0KPj4gLSAgICAgICAgICAgICAgICAgICAgICAgY2xvc2UobG9vcF9mZCk7
DQo+PiAtICAgICAgICAgICAgICAgICAgICAgICBpZiAoZXJyIDwgMCkgew0KPj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBNU0coMCwgIlx0RXJyb3I6IGlvY3RsIExPT1BfR0VUX1NU
QVRVUzY0IGZhaWxlZCBlcnJubzolZCFcbiIsDQo+PiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgZXJybm8pOw0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgbWVtc2V0
KGJ1ZiwgMCwgUEFUSF9NQVggKyAxKTsNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgIHJjID0g
cmVhZChzeXNmc19mZCwgYnVmLCBQQVRIX01BWCk7DQo+PiArICAgICAgICAgICAgICAgICAgICAg
ICBpZiAocmMgPCAwKSB7DQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE1TRygw
LCAiSW5mbzogcmVhZCAlcyBmYWlsZWQgZXJybm86JWRcbiIsDQo+PiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgYnVmLCBlcnJubyk7DQo+PiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICByZXR1cm4gLTE7DQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAg
fQ0KPj4NCj4+IC0gICAgICAgICAgICAgICAgICAgICAgIGlmIChzdF9idWYuc3RfZGV2ID09IGxv
b3BpbmZvLmxvX2RldmljZSAmJg0KPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBz
dF9idWYuc3RfaW5vID09IGxvb3BpbmZvLmxvX2lub2RlKSB7DQo+PiArICAgICAgICAgICAgICAg
ICAgICAgICAvKiBSZW1vdmUgdHJhaWxpbmcgbmV3bGluZSAqLw0KPj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgaWYgKHJjID4gMCAmJiAqKGJ1ZiArIHJjIC0gMSkgPT0gJ1xuJykNCj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgLS1yYzsNCj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgIGJ1ZltyY10gPSAnXDAnOw0KPj4gKw0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgLyog
U2tpcCBkZWxldGVkIGZpbGVzIGxpa2UgInh4eCAoZGVsZXRlZCkiICovDQo+PiArICAgICAgICAg
ICAgICAgICAgICAgICBpZiAoc3RhdChidWYsICZzdF9iYWNrKSAhPSAwKQ0KPj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsNCj4+ICsNCj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgIGlmIChzdF9idWYuc3RfZGV2ID09IHN0X2JhY2suc3RfZGV2ICYmDQo+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0X2J1Zi5zdF9pbm8gPT0gc3RfYmFjay5zdF9p
bm8pIHsNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE1TRygwLCAiXHRFcnJv
cjogSW4gdXNlIGJ5IGxvb3AgZGV2aWNlIVxuIik7DQo+PiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICByZXR1cm4gLUVCVVNZOw0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgIH0N
Cj4+IC0tDQo+PiAyLjM0LjENCj4+DQo+Pg0KPj4NCj4+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fDQo+PiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlz
dA0KPj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQNCj4+IGh0dHBzOi8v
bGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwNCg0K
DQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
ZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgt
ZjJmcy1kZXZlbAo=
