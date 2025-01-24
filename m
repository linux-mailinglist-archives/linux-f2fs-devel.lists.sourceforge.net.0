Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AED83A1AE6C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Jan 2025 03:07:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tb96P-0000kQ-Ol;
	Fri, 24 Jan 2025 02:07:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <huangjianan@xiaomi.com>) id 1tb96O-0000kJ-95
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 24 Jan 2025 02:07:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jVavKbQvG6u3yXfUONSt2rdpwdZ+B2uKJ4AZJgRySxo=; b=HGDaXGyQqduxNsjuH9EAmvEMNE
 36J/GMUh+QVzxGXZKau+YwScLiVewB0kHwigpkkOfpj1AlyL45ymdQjxoYWVmJOHsa8rKahDE27T0
 NsZaMu2gwFqidAwRmhDoj0+bciMKonaqBZXk0WFIB7DpKlM75PGqL18n6GuiThq0aj+I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jVavKbQvG6u3yXfUONSt2rdpwdZ+B2uKJ4AZJgRySxo=; b=Cd4+BevIc7wTwPSLKWMDt6kf5y
 QbE/GsHnmUNtO6xVKz5MRr8yx+fRyH3CyNcwxpXUoIa0zTKEiL6RqbM0c6x6piezHK7w/t+y1BwWm
 ESCj/+kK+xoHz5xsniCv6G36XQfMTv/ENhgO2qPB+UyuP3owpXBcy8frNWVr9Sj3XvNg=;
Received: from outboundhk.mxmail.xiaomi.com ([118.143.206.90])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1tb96N-0001LW-Qg for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 24 Jan 2025 02:07:20 +0000
X-CSE-ConnectionGUID: iWKHtGIKQn65tT+FwA283w==
X-CSE-MsgGUID: eHGXqyQETsiLfLo7HBoHPw==
X-IronPort-AV: E=Sophos;i="6.13,230,1732550400"; d="scan'208";a="105591658"
To: Chao Yu <chao@kernel.org>, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, "jaegeuk@kernel.org"
 <jaegeuk@kernel.org>
Thread-Topic: [External Mail]Re: [f2fs-dev] [PATCH] f2fs: fix inconsistent
 dirty state of atomic file
Thread-Index: AQHbbWZrBacCkLfDy0OzXVWD1DNMKrMjl2MAgAEMqAA=
Date: Fri, 24 Jan 2025 01:51:28 +0000
Message-ID: <03f1d5e8-db4d-499a-88ce-2594fddca8c3@xiaomi.com>
References: <20250123071417.253019-1-huangjianan@xiaomi.com>
 <8bee628f-69a4-419e-aaee-c72b7c7861f9@kernel.org>
In-Reply-To: <8bee628f-69a4-419e-aaee-c72b7c7861f9@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.149.46.75]
Content-ID: <6BEB9ED923F9B7408E10E88D41E076AB@xiaomi.com>
MIME-Version: 1.0
X-Spam-Score: 0.9 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2025/1/23 17:49, Chao Yu wrote: > [外部邮件] 此邮件来源于小米公司外部，请谨慎处理。若对邮件安全性存疑，请将邮件转发给misec@xiaomi.com进行反馈
    > > On 1/23 [...] 
 
 Content analysis details:   (0.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [118.143.206.90 listed in wl.mailspike.net]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [118.143.206.90 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                         [118.143.206.90 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.9 SPF_HELO_SOFTFAIL      SPF: HELO does not match SPF record (softfail)
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1tb96N-0001LW-Qg
Subject: Re: [f2fs-dev] [External Mail]Re: [PATCH] f2fs: fix inconsistent
 dirty state of atomic file
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
Cc: =?utf-8?B?5L+e5Lic5paM?= <yudongbin@xiaomi.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?utf-8?B?546L6L6J?= <wanghui33@xiaomi.com>,
 "daehojeong@google.com" <daehojeong@google.com>,
 "jnhuang95@gmail.com" <jnhuang95@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNS8xLzIzIDE3OjQ5LCBDaGFvIFl1IHdyb3RlOg0KPiBb5aSW6YOo6YKu5Lu2XSDmraTp
gq7ku7bmnaXmupDkuo7lsI/nsbPlhazlj7jlpJbpg6jvvIzor7fosKjmhY7lpITnkIbjgILoi6Xl
r7npgq7ku7blronlhajmgKflrZjnlpHvvIzor7flsIbpgq7ku7bovazlj5Hnu5ltaXNlY0B4aWFv
bWkuY29t6L+b6KGM5Y+N6aaIDQo+IA0KPiBPbiAxLzIzLzI1IDE1OjE0LCBKaWFuYW4gSHVhbmcg
dmlhIExpbnV4LWYyZnMtZGV2ZWwgd3JvdGU6DQo+PiBXaGVuIHRlc3RpbmcgdGhlIGF0b21pYyB3
cml0ZSBmaXggcGF0Y2hlcywgdGhlIGYyZnNfYnVnX29uIHdhcw0KPj4gdHJpZ2dlcmVkIGFzIGJl
bG93Og0KPj4NCj4+IC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0tLS0tLS0tLQ0KPj4ga2Vy
bmVsIEJVRyBhdCBmcy9mMmZzL2lub2RlLmM6OTM1IQ0KPj4gT29wczogaW52YWxpZCBvcGNvZGU6
IDAwMDAgWyMxXSBQUkVFTVBUIFNNUCBQVEkNCj4+IENQVTogMyBVSUQ6IDAgUElEOiAyNTcgQ29t
bTogYmFzaCBOb3QgdGFpbnRlZCA2LjEzLjAtcmMxLTAwMDMzLWdjMjgzYTcwZDM0OTcgIzUNCj4+
IFJJUDogMDAxMDpmMmZzX2V2aWN0X2lub2RlKzB4NTBmLzB4NTIwDQo+PiBDYWxsIFRyYWNlOg0K
Pj4gICA8VEFTSz4NCj4+ICAgPyBfX2RpZV9ib2R5KzB4NjUvMHhiMA0KPj4gICA/IGRpZSsweDlm
LzB4YzANCj4+ICAgPyBkb190cmFwKzB4YTEvMHgxNzANCj4+ICAgPyBmMmZzX2V2aWN0X2lub2Rl
KzB4NTBmLzB4NTIwDQo+PiAgID8gZjJmc19ldmljdF9pbm9kZSsweDUwZi8weDUyMA0KPj4gICA/
IGhhbmRsZV9pbnZhbGlkX29wKzB4NjUvMHg4MA0KPj4gICA/IGYyZnNfZXZpY3RfaW5vZGUrMHg1
MGYvMHg1MjANCj4+ICAgPyBleGNfaW52YWxpZF9vcCsweDM5LzB4NTANCj4+ICAgPyBhc21fZXhj
X2ludmFsaWRfb3ArMHgxYS8weDIwDQo+PiAgID8gX19wZnhfZjJmc19nZXRfZHF1b3RzKzB4MTAv
MHgxMA0KPj4gICA/IGYyZnNfZXZpY3RfaW5vZGUrMHg1MGYvMHg1MjANCj4+ICAgPyBmMmZzX2V2
aWN0X2lub2RlKzB4MmU1LzB4NTIwDQo+PiAgIGV2aWN0KzB4MTg2LzB4MmYwDQo+PiAgIHBydW5l
X2ljYWNoZV9zYisweDc1LzB4YjANCj4+ICAgc3VwZXJfY2FjaGVfc2NhbisweDFhOC8weDIwMA0K
Pj4gICBkb19zaHJpbmtfc2xhYisweDE2My8weDMyMA0KPj4gICBzaHJpbmtfc2xhYisweDJmYy8w
eDQ3MA0KPj4gICBkcm9wX3NsYWIrMHg4Mi8weGYwDQo+PiAgIGRyb3BfY2FjaGVzX3N5c2N0bF9o
YW5kbGVyKzB4NGUvMHhiMA0KPj4gICBwcm9jX3N5c19jYWxsX2hhbmRsZXIrMHgxODMvMHgyODAN
Cj4+ICAgdmZzX3dyaXRlKzB4MzZkLzB4NDUwDQo+PiAgIGtzeXNfd3JpdGUrMHg2OC8weGQwDQo+
PiAgIGRvX3N5c2NhbGxfNjQrMHhjOC8weDFhMA0KPj4gICA/IGFyY2hfZXhpdF90b191c2VyX21v
ZGVfcHJlcGFyZSsweDExLzB4NjANCj4+ICAgPyBpcnFlbnRyeV9leGl0X3RvX3VzZXJfbW9kZSsw
eDdlLzB4YTANCj4+DQo+PiBUaGUgcm9vdCBjYXVzZSBpczogZjJmcyB1c2VzIEZJX0FUT01JQ19E
SVJUSUVEIHRvIGluZGljYXRlIGRpcnR5DQo+PiBhdG9taWMgZmlsZXMgZHVyaW5nIGNvbW1pdC4g
SWYgdGhlIGlub2RlIGlzIGRpcnRpZWQgZHVyaW5nIGNvbW1pdCwNCj4+IHN1Y2ggYXMgYnkgZjJm
c19pX3Bpbm9fd3JpdGUsIHRoZSB2ZnMgaW5vZGUga2VlcHMgY2xlYW4gYW5kIHRoZQ0KPj4gZjJm
cyBpbm9kZSBpcyBzZXQgdG8gRklfRElSVFlfSU5PREUuIFRoZSBGSV9ESVJUWV9JTk9ERSBmbGFn
IGNhbm4ndA0KPj4gYmUgY2xlYXJlZCBieSB3cml0ZV9pbm9kZSBsYXRlciBkdWUgdG8gdGhlIGNs
ZWFuIHZmcyBpbm9kZS4gRmluYWxseSwNCj4+IGYyZnNfYnVnX29uIGlzIHRyaWdnZXJlZCBkdWUg
dG8gdGhpcyBpbmNvbnNpc3RlbnQgc3RhdGUgd2hlbiBldmljdC4NCj4+DQo+PiBUbyByZXByb2R1
Y2UgdGhpcyBzaXR1YXRpb246DQo+PiAtIGZkID0gb3BlbigiL21udC90ZXN0LmRiIiwgT19XUk9O
TFkpDQo+PiAtIGlvY3RsKGZkLCBGMkZTX0lPQ19TVEFSVF9BVE9NSUNfV1JJVEUpDQo+PiAtIG12
IC9tbnQvdGVzdC5kYiAvbW50L3Rlc3QxLmRiDQo+PiAtIGlvY3RsKGZkLCBGMkZTX0lPQ19DT01N
SVRfQVRPTUlDX1dSSVRFKQ0KPj4gLSBlY2hvIDMgPiAvcHJvYy9zeXMvdm0vZHJvcF9jYWNoZXMN
Cj4+DQo+PiBUbyBmaXggdGhpcyBwcm9ibGVtLCBjbGVhciBGSV9ESVJUWV9JTk9ERSBhZnRlciBj
b21taXQsIHRoZW4NCj4+IGYyZnNfbWFya19pbm9kZV9kaXJ0eV9zeW5jIHdpbGwgZW5zdXJlIGEg
Y29uc2lzdGVudCBkaXJ0eSBzdGF0ZS4NCj4+DQo+PiBGaXhlczogZmNjYWE4MWRlODdlICgiZjJm
czogcHJldmVudCBhdG9taWMgZmlsZSBmcm9tIGJlaW5nIGRpcnRpZWQgYmVmb3JlIGNvbW1pdCIp
DQo+PiBTaWduZWQtb2ZmLWJ5OiBZdW5sZWkgSGUgPGhleXVubGVpQHhpYW9taS5jb20+DQo+PiBT
aWduZWQtb2ZmLWJ5OiBKaWFuYW4gSHVhbmcgPGh1YW5namlhbmFuQHhpYW9taS5jb20+DQo+PiAt
LS0NCj4+ICAgZnMvZjJmcy9zZWdtZW50LmMgfCAxICsNCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc2VnbWVudC5jIGIvZnMv
ZjJmcy9zZWdtZW50LmMNCj4+IGluZGV4IGRjMWI0N2Y5MjY5YS4uNzFiNTA5YTMxZWFlIDEwMDY0
NA0KPj4gLS0tIGEvZnMvZjJmcy9zZWdtZW50LmMNCj4+ICsrKyBiL2ZzL2YyZnMvc2VnbWVudC5j
DQo+PiBAQCAtMjAxLDYgKzIwMSw3IEBAIHZvaWQgZjJmc19hYm9ydF9hdG9taWNfd3JpdGUoc3Ry
dWN0IGlub2RlICppbm9kZSwgYm9vbCBjbGVhbikNCj4+ICAgICAgICBjbGVhcl9pbm9kZV9mbGFn
KGlub2RlLCBGSV9BVE9NSUNfRklMRSk7DQo+PiAgICAgICAgaWYgKGlzX2lub2RlX2ZsYWdfc2V0
KGlub2RlLCBGSV9BVE9NSUNfRElSVElFRCkpIHsNCj4+ICAgICAgICAgICAgICAgIGNsZWFyX2lu
b2RlX2ZsYWcoaW5vZGUsIEZJX0FUT01JQ19ESVJUSUVEKTsNCj4+ICsgICAgICAgICAgICAgY2xl
YXJfaW5vZGVfZmxhZyhpbm9kZSwgRklfRElSVFlfSU5PREUpOw0KPiANCj4gSmlhbmFuLA0KPiAN
Cj4gQ2FuIHlvdSBwbGVhc2UgYWRkIGNvbW1lbnRzIGZvciB0aGlzIGNoYW5nZT8gb3RoZXJ3aXNl
IGl0IGxvb2tzIGdvb2QgdG8gbWUuDQoNClVwZGF0ZWQgaW4gdjIuDQoNClRoYW5rcywNCg0KPiAN
Cj4gVGhhbmtzLA0KPiANCj4+ICAgICAgICAgICAgICAgIGYyZnNfbWFya19pbm9kZV9kaXJ0eV9z
eW5jKGlub2RlLCB0cnVlKTsNCj4+ICAgICAgICB9DQo+PiAgICAgICAgc3RhdF9kZWNfYXRvbWlj
X2lub2RlKGlub2RlKTsNCj4gDQoNCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRl
dmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9s
aXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
