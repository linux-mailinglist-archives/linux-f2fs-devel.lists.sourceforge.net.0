Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6329699B6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Sep 2024 12:06:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1slQR1-00045k-4t;
	Tue, 03 Sep 2024 10:06:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <huangjianan@xiaomi.com>) id 1slQR0-00045e-Iu
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Sep 2024 10:06:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XOVQ707CMA64SAkQoKVPUzsZM3uB3E3NDa9YdXVxXYs=; b=iP9cKoZUp568wF6GxhqnmEm+ru
 UbikGtNH6218dHejRUQE2VxHR2j4NEdW1wulcC1mIQietkcRgXcta4sd3Nqxx/eXgPJWHnuTuZxsY
 3hamobkVcq8oISxKbCL3hlEuglgo+vybovC0lPhGcNxylyENNrkv4TVGuzeyU1Aa3M5A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XOVQ707CMA64SAkQoKVPUzsZM3uB3E3NDa9YdXVxXYs=; b=CB4fMgU6ZDe/0kJUyIG/DrqUe8
 dQfvyU+IfpKxKfQw7v7w8/Vwgf1B11oMsAz1BPOwNoUg1Lwk4/4Ap6vOLma/yyrlpi8VPJURiaBI3
 7lNiI5+8hOLMFZem3M/IlFC+WUA9OexnFtPpuyv244KIRizvxu+Bm8MTlrwypfgTsuHg=;
Received: from outboundhk.mxmail.xiaomi.com ([207.226.244.122])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1slQQz-0007VX-G2 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Sep 2024 10:06:50 +0000
X-CSE-ConnectionGUID: Y3LtmdYtR0C+oVJmOa/52Q==
X-CSE-MsgGUID: aKoAoiowQiGb/3Lvw25XOQ==
X-IronPort-AV: E=Sophos;i="6.10,198,1719849600"; d="scan'208";a="121008352"
To: Wu Bo <wubo.oduw@gmail.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Thread-Topic: [External Mail][f2fs-dev] [PATCH 05/13] f2fs: set inline tail
 flag when create inode
Thread-Index: AQHa/d9TEJ0BFkkmf0yNrLcOSrFLD7JFS5uA
Date: Tue, 3 Sep 2024 09:50:41 +0000
Message-ID: <9f381694-2573-4f72-9177-54e2b5c07652@xiaomi.com>
References: <cover.1725334811.git.bo.wu@vivo.com>
 <d5f1a318931b213f7a27de8441ba985354eecabb.1725334811.git.bo.wu@vivo.com>
In-Reply-To: <d5f1a318931b213f7a27de8441ba985354eecabb.1725334811.git.bo.wu@vivo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.88.13]
Content-ID: <624B598B5950C141A39959F41105D51B@xiaomi.com>
MIME-Version: 1.0
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2024/9/3 16:54, Wu Bo via Linux-f2fs-devel wrote: > [外部邮件]
    此邮件来源于小米公司外部，请谨慎处理。若对邮件安全性存疑，请将邮件转发给misec@xiaomi.com进行
    [...] 
 
 Content analysis details:   (-0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
  0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
                             [207.226.244.122 listed in wl.mailspike.net]
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1slQQz-0007VX-G2
Subject: Re: [f2fs-dev] [External Mail] [PATCH 05/13] f2fs: set inline tail
 flag when create inode
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC85LzMgMTY6NTQsIFd1IEJvIHZpYSBMaW51eC1mMmZzLWRldmVsIHdyb3RlOg0KPiBb
5aSW6YOo6YKu5Lu2XSDmraTpgq7ku7bmnaXmupDkuo7lsI/nsbPlhazlj7jlpJbpg6jvvIzor7fo
sKjmhY7lpITnkIbjgILoi6Xlr7npgq7ku7blronlhajmgKflrZjnlpHvvIzor7flsIbpgq7ku7bo
vazlj5Hnu5ltaXNlY0B4aWFvbWkuY29t6L+b6KGM5Y+N6aaIDQo+IA0KPiBTZXQgaW5saW5lIHRh
aWwgZmxhZyB0byBlbmFibGUgdGhpcyBmZWF0dXJlIHdoZW4gbmV3IGlub2RlIGlzIGNyZWF0ZWQu
DQo+IEluaGVyaXQgdGhlIGNvbmRpdGlvbnMgZnJvbSBpbmxpbmUgZGF0YS4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IFd1IEJvIDxiby53dUB2aXZvLmNvbT4NCj4gLS0tDQo+ICAgZnMvZjJmcy9uYW1l
aS5jIHwgMyArKysNCj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvZnMvZjJmcy9uYW1laS5jIGIvZnMvZjJmcy9uYW1laS5jDQo+IGluZGV4IDM4
YjQ3NTA0NzVkYi4uMTNjMjk1ZWExOWRlIDEwMDY0NA0KPiAtLS0gYS9mcy9mMmZzL25hbWVpLmMN
Cj4gKysrIGIvZnMvZjJmcy9uYW1laS5jDQo+IEBAIC0zMTUsNiArMzE1LDkgQEAgc3RhdGljIHN0
cnVjdCBpbm9kZSAqZjJmc19uZXdfaW5vZGUoc3RydWN0IG1udF9pZG1hcCAqaWRtYXAsDQo+ICAg
ICAgICAgIC8qIFNob3VsZCBlbmFibGUgaW5saW5lX2RhdGEgYWZ0ZXIgY29tcHJlc3Npb24gc2V0
ICovDQo+ICAgICAgICAgIGlmICh0ZXN0X29wdChzYmksIElOTElORV9EQVRBKSAmJiBmMmZzX21h
eV9pbmxpbmVfZGF0YShpbm9kZSkpDQo+ICAgICAgICAgICAgICAgICAgc2V0X2lub2RlX2ZsYWco
aW5vZGUsIEZJX0lOTElORV9EQVRBKTsNCj4gKyAgICAgICAvKiBJbmhlcml0IHRoZSBjb25kaXRp
b25zIGZyb20gaW5saW5lIGRhdGEgKi8NCj4gKyAgICAgICBpZiAodGVzdF9vcHQoc2JpLCBJTkxJ
TkVfVEFJTCkgJiYgZjJmc19oYXNfaW5saW5lX2RhdGEoaW5vZGUpKQ0KPiArICAgICAgICAgICAg
ICAgc2V0X2lub2RlX2ZsYWcoaW5vZGUsIEZJX0lOTElORV9UQUlMKTsNCg0KU2hvdWxkIGYyZnNf
cG9zdF9yZWFkX3JlcXVpcmVkKCkgYmUgY2hlY2tlZCBoZXJlLCBsaWtlIGlubGluZSBkYXRhPw0K
DQpUaGFua3MsDQpKaWFuYW4NCg0KPiANCj4gICAgICAgICAgaWYgKG5hbWUgJiYgIXRlc3Rfb3B0
KHNiaSwgRElTQUJMRV9FWFRfSURFTlRJRlkpKQ0KPiAgICAgICAgICAgICAgICAgIHNldF9maWxl
X3RlbXBlcmF0dXJlKHNiaSwgaW5vZGUsIG5hbWUpOw0KPiAtLQ0KPiAyLjM1LjMNCj4gDQo+IA0K
PiANCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4g
TGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QNCj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5z
b3VyY2Vmb3JnZS5uZXQNCj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlz
dGluZm8vbGludXgtZjJmcy1kZXZlbA0KDQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJm
cy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5u
ZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
