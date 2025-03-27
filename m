Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A943AA72AF3
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Mar 2025 09:01:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1txiAg-0001o8-Gd;
	Thu, 27 Mar 2025 08:01:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yohan.joung@sk.com>) id 1txiAX-0001mt-MX
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Mar 2025 08:00:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KOrLlP3xEOabRRMDrY3samUcXLFwPbVBnmQcHMjazrA=; b=QTY9XCJvQc9Ka/oSRJG8WA2rXB
 35YVcNcSoCaSqAA5ugA4HY8E6Tbd2X8auWhaXfAM1ve76A9trLWnbwCl50pJmMeJMUDApvU7sq9Gx
 pvx1BPBfsIEaqzPfSJ368n+o1HExVygXgo1fPy+hLXaI5TsKviOtn99cCYmslIlTrpbs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KOrLlP3xEOabRRMDrY3samUcXLFwPbVBnmQcHMjazrA=; b=GPqQqHnktlPJ//SCrZAu1MLTSX
 QpThBtpTDCl1A+Aol6C8eF9ZVvPpHq8oQ0CgxG3Gy1d1oJH8S6UcLZXKq22vEmaUkcWOamutRP+pE
 Z5G8R3wuk4VXQnoSEa8ZqpbB4PHPY5jy47n4qFD8Y03G3Xu+LbptwrpYaDk7JM2p5eWo=;
Received: from exvmail3.skhynix.com ([166.125.252.90]
 helo=invmail3.skhynix.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1txiAV-0004gU-Q6 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Mar 2025 08:00:54 +0000
X-AuditID: a67dfc59-057ff7000000aab6-46-67e505a76524
Received: from hymail21.hynixad.com (10.156.135.51) by hymail24.hynixad.com
 (10.156.135.54) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1544.14; Thu, 27 Mar
 2025 17:00:39 +0900
Received: from hymail21.hynixad.com ([10.156.135.51]) by hymail21.hynixad.com
 ([10.156.135.51]) with mapi id 15.02.1544.014;
 Thu, 27 Mar 2025 17:00:39 +0900
From: "yohan.joung@sk.com" <yohan.joung@sk.com>
To: Chao Yu <chao@kernel.org>, Yohan Joung <jyh429@gmail.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>, "daeho43@gmail.com"
 <daeho43@gmail.com>
Thread-Topic: [External Mail] Re: [External Mail] Re: [PATCH] f2fs: prevent
 the current section from being selected as a victim during garbage collection
Thread-Index: AQHbnt3fELlyoJQ1W0qLIYQiUdi4aLOGhdAQ//95qYCAAJuVkA==
Date: Thu, 27 Mar 2025 08:00:38 +0000
Message-ID: <8d1f6aa914f94f5da1ccd46c75e9031b@sk.com>
References: <20250326141428.280-1-yohan.joung@sk.com>
 <bf3f571c-a6bf-4a17-8745-039b37ac4f48@kernel.org>
 <2d95428375bd4a5592516bb6cefe4592@sk.com>
 <deb42999-df89-471b-a161-e33b97f96b74@kernel.org>
In-Reply-To: <deb42999-df89-471b-a161-e33b97f96b74@kernel.org>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.152.36.156]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprNIsWRmVeSWpSXmKPExsXC9ZZnoe5y1qfpBsduS1ucnnqWyeLNkTMs
 Fk/Wz2K2+HL1GrvFpUXuDqweO2fdZffYtKqTzWP3gs9MAcxRXDYpqTmZZalF+nYJXBn3fh1l
 KThlWXFq6xmmBsYeiy5GTg4JAROJE1+eMXYxcnEICbxhlJj0ZjMzhLOAUeLDt51sIFVsAvoS
 x1//YAVJiAhMZZS4uv84WBWzwGFGiWnnn7OAOMICsxgl3q5+zQ5RNptR4tHphcwg/SICThJT
 D54AmsXBwSKgKtH5IxEkzCtgKnHnyH8miH0nGSVW/9vMBJLgFLCTOLv2PTtIPaOArMTVazIg
 YWYBcYnFX68xQxwuILFkz3koW1Ti5eN/rCDlEgKKEne3SoGYzAKaEut36UN0KkpM6X7IDrFV
 UOLkzCcsEJ2SEgdX3GCZwCg2C8mCWQjds5B0z0LSvYCRZRWjSGZeWW5iZo6xXnF2RmVeZoVe
 cn7uJkZglC2r/RO5g/HbheBDjAIcjEo8vAkcT9KFWBPLiitzDzFKcDArifBKXgEK8aYkVlal
 FuXHF5XmpBYfYpTmYFES5zX6Vp4iJJCeWJKanZpakFoEk2Xi4JRqYKxh5t5aea9j5oxNMR/t
 f539P3mNXVwztynji9fm/frubCGhRdvS9+oryh9nWdtTvHqS6IZHHwVtOOdsvzLxDsebF1kR
 ofuzGtabP9IMmROf9upVq6JcxpZVFsdKP28+ziwr82hW0ZWluvG5tZFKU0MjWuQm9uqqMjt9
 fvugwFXqGY83d9PDKCWW4oxEQy3mouJEAGyf45CuAgAA
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  > From: Chao Yu <chao@kernel.org> > Sent: Thursday, March
   27, 2025 4:30 PM > To: 정요한(JOUNG YOHAN) Mobile AE <yohan.joung@sk.com>;
    Yohan Joung > <jyh429@gmail.com>; jaegeuk@kernel.org; daeho43@gm [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                         [166.125.252.90 listed in sa-trusted.bondedsender.org]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [166.125.252.90 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1txiAV-0004gU-Q6
Subject: Re: [f2fs-dev] [External Mail] Re: [External Mail] Re: [PATCH]
 f2fs: prevent the current section from being selected as a victim during
 garbage collection
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
aCAyNywgMjAyNSA0OjMwIFBNDQo+IFRvOiDsoJXsmpTtlZwoSk9VTkcgWU9IQU4pIE1vYmlsZSBB
RSA8eW9oYW4uam91bmdAc2suY29tPjsgWW9oYW4gSm91bmcNCj4gPGp5aDQyOUBnbWFpbC5jb20+
OyBqYWVnZXVrQGtlcm5lbC5vcmc7IGRhZWhvNDNAZ21haWwuY29tDQo+IENjOiBjaGFvQGtlcm5l
bC5vcmc7IGxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0OyBsaW51eC0NCj4g
a2VybmVsQHZnZXIua2VybmVsLm9yZzsg6rmA7ZWE7ZiEKEtJTSBQSUxIWVVOKSBNb2JpbGUgQUUg
PHBpbGh5dW4ua2ltQHNrLmNvbT4NCj4gU3ViamVjdDogW0V4dGVybmFsIE1haWxdIFJlOiBbRXh0
ZXJuYWwgTWFpbF0gUmU6IFtQQVRDSF0gZjJmczogcHJldmVudCB0aGUNCj4gY3VycmVudCBzZWN0
aW9uIGZyb20gYmVpbmcgc2VsZWN0ZWQgYXMgYSB2aWN0aW0gZHVyaW5nIGdhcmJhZ2UgY29sbGVj
dGlvbg0KPiANCj4gT24gMy8yNy8yNSAxNDo0MywgeW9oYW4uam91bmdAc2suY29tIHdyb3RlOg0K
PiA+PiBGcm9tOiBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+DQo+ID4+IFNlbnQ6IFRodXJzZGF5
LCBNYXJjaCAyNywgMjAyNSAzOjAyIFBNDQo+ID4+IFRvOiBZb2hhbiBKb3VuZyA8anloNDI5QGdt
YWlsLmNvbT47IGphZWdldWtAa2VybmVsLm9yZzsNCj4gPj4gZGFlaG80M0BnbWFpbC5jb20NCj4g
Pj4gQ2M6IGNoYW9Aa2VybmVsLm9yZzsgbGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQ7IGxpbnV4LQ0KPiA+PiBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyDsoJXsmpTtlZwoSk9V
TkcgWU9IQU4pIE1vYmlsZSBBRQ0KPiA+PiA8eW9oYW4uam91bmdAc2suY29tPg0KPiA+PiBTdWJq
ZWN0OiBbRXh0ZXJuYWwgTWFpbF0gUmU6IFtQQVRDSF0gZjJmczogcHJldmVudCB0aGUgY3VycmVu
dA0KPiA+PiBzZWN0aW9uIGZyb20gYmVpbmcgc2VsZWN0ZWQgYXMgYSB2aWN0aW0gZHVyaW5nIGdh
cmJhZ2UgY29sbGVjdGlvbg0KPiA+Pg0KPiA+PiBPbiAzLzI2LzI1IDIyOjE0LCBZb2hhbiBKb3Vu
ZyB3cm90ZToNCj4gPj4+IFdoZW4gc2VsZWN0aW5nIGEgdmljdGltIHVzaW5nIG5leHRfdmljdGlt
X3NlZyBpbiBhIGxhcmdlIHNlY3Rpb24sDQo+ID4+PiB0aGUgc2VsZWN0ZWQgc2VjdGlvbiBtaWdo
dCBhbHJlYWR5IGhhdmUgYmVlbiBjbGVhcmVkIGFuZCBkZXNpZ25hdGVkDQo+ID4+PiBhcyB0aGUg
bmV3IGN1cnJlbnQgc2VjdGlvbiwgbWFraW5nIGl0IGFjdGl2ZWx5IGluIHVzZS4NCj4gPj4+IFRo
aXMgYmVoYXZpb3IgY2F1c2VzIGluY29uc2lzdGVuY3kgYmV0d2VlbiB0aGUgU0lUIGFuZCBTU0Eu
DQo+ID4+DQo+ID4+IEhpLCBkb2VzIHRoaXMgZml4IHlvdXIgaXNzdWU/DQo+ID4NCj4gPiBUaGlz
IGlzIGFuIGlzc3VlIHRoYXQgYXJpc2VzIHdoZW4gZGl2aWRpbmcgYSBsYXJnZSBzZWN0aW9uIGlu
dG8NCj4gPiBzZWdtZW50cyBmb3IgZ2FyYmFnZSBjb2xsZWN0aW9uLg0KPiA+IGNhdXNlZCBieSB0
aGUgYmFja2dyb3VuZCBHQyAoZ2FyYmFnZSBjb2xsZWN0aW9uKSB0aHJlYWQgaW4gbGFyZ2UNCj4g
PiBzZWN0aW9uDQo+ID4gZjJmc19nYyh2aWN0aW1fc2VjdGlvbikgLT4NCj4gPiBmMmZzX2NsZWFy
X3ByZWZyZWVfc2VnbWVudHModmljdGltX3NlY3Rpb24pLT4NCj4gPiBjdXJzZWModmljdGltX3Nl
Y3Rpb24pIC0+IGYyZnNfZ2ModmljdGltX3NlY3Rpb24gYnkgbmV4dF92aWN0aW1fc2VnKQ0KPiAN
Cj4gSSBkaWRuJ3QgZ2V0IGl0LCB3aHkgZjJmc19nZXRfdmljdGltKCkgd2lsbCByZXR1cm4gc2Vj
dGlvbiB3aGljaCBpcyB1c2VkDQo+IGJ5IGN1cnNlZz8gSXQgc2hvdWxkIGJlIGF2b2lkZWQgYnkg
Y2hlY2tpbmcgdy8gc2VjX3VzYWdlX2NoZWNrKCkuDQo+IA0KPiBPciB3ZSBtaXNzZWQgdG8gY2hl
Y2sgZ2Npbmcgc2VjdGlvbiB3aGljaCBuZXh0X3ZpY3RpbV9zZWcgcG9pbnRzIHRvIGR1cmluZw0K
PiBnZXRfbmV3X3NlZ21lbnQoKT8NCj4gDQo+IENhbiB0aGlzIGhhcHBlbj8NCj4gDQo+IGUuZy4N
Cj4gLSBiZ2djIHNlbGVjdHMgc2VjICMwDQo+IC0gbmV4dF92aWN0aW1fc2VnOiBzZWcgIzANCj4g
LSBtaWdyYXRlIHNlZyAjMCBhbmQgc3RvcA0KPiAtIG5leHRfdmljdGltX3NlZzogc2VnICMxDQo+
IC0gY2hlY2twb2ludCwgc2V0IHNlYyAjMCBmcmVlIGlmIHNlYyAjMCBoYXMgbm8gdmFsaWQgYmxv
Y2tzDQo+IC0gYWxsb2NhdGUgc2VnICMwIGluIHNlYyAjMCBmb3IgY3Vyc2VnDQo+IC0gY3Vyc2Vn
IG1vdmVzIHRvIHNlZyAjMSBhZnRlciBhbGxvY2F0aW9uDQo+IC0gYmdnYyB0cmllcyB0byBtaWdy
YXRlIHNlZyAjMQ0KPiANCj4gVGhhbmtzLA0KVGhhdCdzIGNvcnJlY3QNCkluIGYyZnNfZ2V0X3Zp
Y3RpbSwgd2UgdXNlIG5leHRfdmljdGltX3NlZyB0byANCmRpcmVjdGx5IGp1bXAgdG8gZ290X3Jl
c3VsdCwgdGhlcmVieSBieXBhc3Npbmcgc2VjX3VzYWdlX2NoZWNrDQpXaGF0IGRvIHlvdSB0aGlu
ayBhYm91dCB0aGlzIGNoYW5nZT8NCg0KQEAgLTg1MCwxNSArODUwLDIwIEBAIGludCBmMmZzX2dl
dF92aWN0aW0oc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCB1bnNpZ25lZCBpbnQgKnJlc3VsdCwN
CiAgICAgICAgICAgICAgICAgICAgICAgIHAubWluX3NlZ25vID0gc2JpLT5uZXh0X3ZpY3RpbV9z
ZWdbQkdfR0NdOw0KICAgICAgICAgICAgICAgICAgICAgICAgKnJlc3VsdCA9IHAubWluX3NlZ25v
Ow0KICAgICAgICAgICAgICAgICAgICAgICAgc2JpLT5uZXh0X3ZpY3RpbV9zZWdbQkdfR0NdID0g
TlVMTF9TRUdOTzsNCi0gICAgICAgICAgICAgICAgICAgICAgIGdvdG8gZ290X3Jlc3VsdDsNCiAg
ICAgICAgICAgICAgICB9DQogICAgICAgICAgICAgICAgaWYgKGdjX3R5cGUgPT0gRkdfR0MgJiYN
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2JpLT5uZXh0X3ZpY3RpbV9zZWdbRkdf
R0NdICE9IE5VTExfU0VHTk8pIHsNCiAgICAgICAgICAgICAgICAgICAgICAgIHAubWluX3NlZ25v
ID0gc2JpLT5uZXh0X3ZpY3RpbV9zZWdbRkdfR0NdOw0KICAgICAgICAgICAgICAgICAgICAgICAg
KnJlc3VsdCA9IHAubWluX3NlZ25vOw0KICAgICAgICAgICAgICAgICAgICAgICAgc2JpLT5uZXh0
X3ZpY3RpbV9zZWdbRkdfR0NdID0gTlVMTF9TRUdOTzsNCi0gICAgICAgICAgICAgICAgICAgICAg
IGdvdG8gZ290X3Jlc3VsdDsNCiAgICAgICAgICAgICAgICB9DQorDQorICAgICAgICAgICAgICAg
c2Vjbm8gPSBHRVRfU0VDX0ZST01fU0VHKHNiaSwgc2Vnbm8pOw0KKw0KKyAgICAgICAgICAgICAg
IGlmIChzZWNfdXNhZ2VfY2hlY2soc2JpLCBzZWNubykpDQorICAgICAgICAgICAgICAgICAgICAg
ICBnb3RvIG5leHQ7DQorDQorICAgICAgICAgICAgICAgZ290byBnb3RfcmVzdWx0Ow0KICAgICAg
ICB9DQo+IA0KPiA+DQo+ID4gQmVjYXVzZSB0aGUgY2FsbCBzdGFjayBpcyBkaWZmZXJlbnQsDQo+
ID4gSSB0aGluayB0aGF0IGluIG9yZGVyIHRvIGhhbmRsZSBldmVyeXRoaW5nIGF0IG9uY2UsIHdl
IG5lZWQgdG8gYWRkcmVzcw0KPiA+IGl0IHdpdGhpbiBkb19nYXJiYWdlX2NvbGxlY3QsIG9yIG90
aGVyd2lzZSBpbmNsdWRlIGl0IG9uIGJvdGggc2lkZXMuDQo+ID4gV2hhdCBkbyB5b3UgdGhpbms/
DQo+ID4NCj4gPiBbMzAxNDYuMzM3NDcxXVsgVDEzMDBdIEYyRlMtZnMgKGRtLTU0KTogSW5jb25z
aXN0ZW50IHNlZ21lbnQgKDcwOTYxKQ0KPiA+IHR5cGUgWzAsIDFdIGluIFNTQSBhbmQgU0lUIFsz
MDE0Ni4zNDYxNTFdWyBUMTMwMF0gQ2FsbCB0cmFjZToNCj4gPiBbMzAxNDYuMzQ2MTUyXVsgVDEz
MDBdICBkdW1wX2JhY2t0cmFjZSsweGU4LzB4MTBjIFszMDE0Ni4zNDYxNTddWw0KPiA+IFQxMzAw
XSAgc2hvd19zdGFjaysweDE4LzB4MjggWzMwMTQ2LjM0NjE1OF1bIFQxMzAwXQ0KPiA+IGR1bXBf
c3RhY2tfbHZsKzB4NTAvMHg2YyBbMzAxNDYuMzQ2MTYxXVsgVDEzMDBdICBkdW1wX3N0YWNrKzB4
MTgvMHgyOA0KPiA+IFszMDE0Ni4zNDYxNjJdWyBUMTMwMF0gIGYyZnNfc3RvcF9jaGVja3BvaW50
KzB4MWMvMHgzYyBbMzAxNDYuMzQ2MTY1XVsNCj4gPiBUMTMwMF0gIGRvX2dhcmJhZ2VfY29sbGVj
dCsweDQxYy8weDI3MWMgWzMwMTQ2LjM0NjE2N11bIFQxMzAwXQ0KPiA+IGYyZnNfZ2MrMHgyN2Mv
MHg4MjggWzMwMTQ2LjM0NjE2OF1bIFQxMzAwXSAgZ2NfdGhyZWFkX2Z1bmMrMHgyOTAvMHg4OGMN
Cj4gPiBbMzAxNDYuMzQ2MTY5XVsgVDEzMDBdICBrdGhyZWFkKzB4MTFjLzB4MTY0IFszMDE0Ni4z
NDYxNzJdWyBUMTMwMF0NCj4gPiByZXRfZnJvbV9mb3JrKzB4MTAvMHgyMA0KPiA+DQo+ID4gc3Ry
dWN0IGN1cnNlZ19pbmZvIDogMHhmZmZmZmY4MDNmOTVlODAwIHsNCj4gPiAJc2Vnbm8gICAgICAg
IDogMHgxMTUzMSA6IDcwOTYxDQo+ID4gfQ0KPiA+DQo+ID4gc3RydWN0IGYyZnNfc2JfaW5mbyA6
IDB4ZmZmZmZmODgxMWQxMjAwMCB7DQo+ID4gCW5leHRfdmljdGltX3NlZ1swXSA6IDB4MTE1MzEg
OiA3MDk2MQ0KPiA+IH0NCj4gPg0KPiA+Pg0KPiA+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9s
aW51eC1mMmZzLWRldmVsLzIwMjUwMzI1MDgwNjQ2LjMyOTE5NDctMi0NCj4gPj4gY2hhb0BrZXJu
ZWwub3JnDQo+ID4+DQo+ID4+IFRoYW5rcywNCj4gPj4NCj4gPj4+DQo+ID4+PiBTaWduZWQtb2Zm
LWJ5OiBZb2hhbiBKb3VuZyA8eW9oYW4uam91bmdAc2suY29tPg0KPiA+Pj4gLS0tDQo+ID4+PiAg
ZnMvZjJmcy9nYy5jIHwgNCArKysrDQo+ID4+PiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKQ0KPiA+Pj4NCj4gPj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2djLmMgYi9mcy9mMmZzL2dj
LmMgaW5kZXgNCj4gPj4+IDJiOGY5MjM5YmVkZS4uNGI1ZDE4ZTM5NWViIDEwMDY0NA0KPiA+Pj4g
LS0tIGEvZnMvZjJmcy9nYy5jDQo+ID4+PiArKysgYi9mcy9mMmZzL2djLmMNCj4gPj4+IEBAIC0x
OTI2LDYgKzE5MjYsMTAgQEAgaW50IGYyZnNfZ2Moc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBz
dHJ1Y3QNCj4gPj4gZjJmc19nY19jb250cm9sICpnY19jb250cm9sKQ0KPiA+Pj4gIAkJZ290byBz
dG9wOw0KPiA+Pj4gIAl9DQo+ID4+Pg0KPiA+Pj4gKwlpZiAoX19pc19sYXJnZV9zZWN0aW9uKHNi
aSkgJiYNCj4gPj4+ICsJCQlJU19DVVJTRUMoc2JpLCBHRVRfU0VDX0ZST01fU0VHKHNiaSwgc2Vn
bm8pKSkNCj4gPj4+ICsJCWdvdG8gc3RvcDsNCj4gPj4+ICsNCj4gPj4+ICAJc2VnX2ZyZWVkID0g
ZG9fZ2FyYmFnZV9jb2xsZWN0KHNiaSwgc2Vnbm8sICZnY19saXN0LCBnY190eXBlLA0KPiA+Pj4g
IAkJCQlnY19jb250cm9sLT5zaG91bGRfbWlncmF0ZV9ibG9ja3MsDQo+ID4+PiAgCQkJCWdjX2Nv
bnRyb2wtPm9uZV90aW1lKTsNCj4gPg0KDQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJm
cy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5u
ZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
