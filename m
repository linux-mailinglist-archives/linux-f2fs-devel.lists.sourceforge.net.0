Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F716F62CF
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 May 2023 04:09:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1puOPP-0007wN-Vs;
	Thu, 04 May 2023 02:09:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daejun7.park@samsung.com>) id 1puOPO-0007wH-5N
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 May 2023 02:09:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:In-Reply-To:CC:To:From:Sender:Reply-To:Subject:Mime-Version:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ldq7GVI/B8Lcs7yFVEBDLCKixZga1LX/ZvWn2gAjL4w=; b=I06CXtUdTDEZv+pt/A4UOBeh4x
 9ZZlJ5rf4e0rcRpUX0gmspDsaV6mrNuifv6j9s5Ckc5pxacGXZ+PGSI9KehQXwr9KrhKF8WR14iHc
 YNG1M1wPtRLVZ0yKthXqUnqWVjnYvkxKwa0P6hln8r7/CFas1NlRYfvMYQagZeSwNn1A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:
 In-Reply-To:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ldq7GVI/B8Lcs7yFVEBDLCKixZga1LX/ZvWn2gAjL4w=; b=BhobX0A9o6f9ymkVaKH+QmJVH/
 ErRWT63sJ/zkXNFx0YuZ5XHcTrD0J23mqIs4lBzw/JmnQFU2RmP7xKmmBvuYj2uh9P3ttlM7ygN13
 TiWxo+2XFGDnXsWij5HZ81eJw+06NwC+/KIM9TyML8SOrRdTXmrStDtEKAyh9y3F0hyw=;
Received: from mailout4.samsung.com ([203.254.224.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1puOPL-00066n-Tp for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 May 2023 02:09:26 +0000
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20230504020912epoutp048e70c48db464cd15276d8294645a9056~bzrKVUuPH2110221102epoutp04T
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  4 May 2023 02:09:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20230504020912epoutp048e70c48db464cd15276d8294645a9056~bzrKVUuPH2110221102epoutp04T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1683166152;
 bh=ldq7GVI/B8Lcs7yFVEBDLCKixZga1LX/ZvWn2gAjL4w=;
 h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
 b=fMkJx5uNWeKQMl9dVMs/lXlwBFeUz+nZioN6yVfERW0R7kZJrDuBzDLYteDX4PWXu
 dqtWbnOdgvAY/sxuPWZQl4PoY3c5vh9J9DkDo1pBHmRuhz9HNsK5T2PB5f6kCISiwB
 r9ov1wU0OVrcMEJtQpW8QoTvT+zZ6ghi19CQaR90=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTP id
 20230504020911epcas2p2cc8f03fc11f0d5ce5ba9dfab2165ea59~bzrKF6EyH0750707507epcas2p21;
 Thu,  4 May 2023 02:09:11 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.98]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4QBcgq2KlQz4x9Q3; Thu,  4 May
 2023 02:09:11 +0000 (GMT)
X-AuditID: b6c32a46-8b7ff7000001438d-6f-645313c7d2cb
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
 epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 C9.14.17293.7C313546; Thu,  4 May 2023 11:09:11 +0900 (KST)
Mime-Version: 1.0
From: Daejun Park <daejun7.park@samsung.com>
To: Chao Yu <chao@kernel.org>, Daejun Park <daejun7.park@samsung.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>, "rostedt@goodmis.org"
 <rostedt@goodmis.org>, "mhiramat@kernel.org" <mhiramat@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-trace-kernel@vger.kernel.org"
 <linux-trace-kernel@vger.kernel.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <6596335b-2448-20f7-30ea-42ba40f1af72@kernel.org>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20230504020810epcms2p2511cc27f9824fee69563e2be99284f78@epcms2p2>
Date: Thu, 04 May 2023 11:08:10 +0900
X-CMS-MailID: 20230504020810epcms2p2511cc27f9824fee69563e2be99284f78
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-CPGSPASS: Y
X-CPGSPASS: Y
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprDJsWRmVeSWpSXmKPExsWy7bCmhe5x4eAUg8NTuCwuzPvIbHF66lkm
 i5eHNC1WPQi3eLJ+FrPFpUXuFpd3zWGzOLL+LIvF4uVqFvs6HjBZrOqYy2gx9fwRJgcej5Z9
 t9g9Nq3qZPPYveAzk0ffllWMHp83yQWwRmXbZKQmpqQWKaTmJeenZOal2yp5B8c7x5uaGRjq
 GlpamCsp5CXmptoqufgE6Lpl5gDdpqRQlphTChQKSCwuVtK3synKLy1JVcjILy6xVUotSMkp
 MC/QK07MLS7NS9fLSy2xMjQwMDIFKkzIzrh16Bxjwf0Oxor/R2+zNjB2tDJ2MXJySAiYSGz+
 9Z69i5GLQ0hgB6PEou4+ti5GDg5eAUGJvzuEQWqEBVwl/p1pZQexhQSUJNZfnMUOEdeTuPVw
 DdgcNgEdiekn7oPNERHYzCzxZNEDJpA5zAKVEp/POUDs4pWY0f6UBcKWlti+fCtYL6eAncTM
 uXvYIeIaEj+W9TJD2KISN1e/ZYex3x+bD3WziETrvbNQNYISD37uhopLStyeuwmqPl/i/5Xl
 UHaNxLYD86BsfYlrHRvBbuAV8JVoebIYLM4ioCox58EvqNtcJG7N28cEYjMLaEssW/iaGeIV
 TYn1u/RBTAkBZYkjt1ggKvgkOg7/ZYf5sGHjb6zsHfOeMEHYahLrfq5nmsCoPAsRzrOQ7JqF
 sGsBI/MqRrHUguLc9NRiowIjeOQm5+duYgQnUy23HYxT3n7QO8TIxMF4iFGCg1lJhPdDoV+K
 EG9KYmVValF+fFFpTmrxIUZToC8nMkuJJucD03leSbyhiaWBiZmZobmRqYG5kjivtO3JZCGB
 9MSS1OzU1ILUIpg+Jg5OqQamI6IqGx1+62ywD5hnuc79mV25wIRUOwbZ/d3qEjG/eVoPhAba
 HU2+6VI9RfzLq3zh+2eU/Kf+nq3xdpLBr/UPIi3dz2jsOWDH9JbVdNvv5+crmE/JnxBgFt9f
 uuHq5/3fZ8vZKZ26HfbwCPuFU9qv9r3729b96/m3/xZBq/zspj8u/vf7NNusYAnRziTxipmO
 FhrTc98oubrbmr5fJBCRnrT/6ccl+f3OWhsdY06ynt2lduPryTDltStUJt3fb/7ivc+dVJ/P
 S+6WSzk2NZnurFL5e3RjwNmDd/ZsX2g6SSdd6lyE3seHoSGnFNdp3Xp16fD3budw2/pSacaw
 /2kmJ+6Xngv+0XbtV0Hl3KpFE5VYijMSDbWYi4oTAeMt/uQvBAAA
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230502041628epcms2p7233a97389cebafb73fc525a47215e707
References: <6596335b-2448-20f7-30ea-42ba40f1af72@kernel.org>
 <20230502041628epcms2p7233a97389cebafb73fc525a47215e707@epcms2p7>
 <CGME20230502041628epcms2p7233a97389cebafb73fc525a47215e707@epcms2p2>
X-Spam-Score: -3.2 (---)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Thank you for reviewing the patch. > --------- Original Message
    --------- > Sender : Chao Yu <chao@kernel.org> > Date : 2023-05-04 10:43
    (GMT+9) > Title : Re: [PATCH v4] f2fs: add async reset zone command support
    > To : 박대준<daej [...] 
 
 Content analysis details:   (-3.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [203.254.224.34 listed in wl.mailspike.net]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [203.254.224.34 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1puOPL-00066n-Tp
Subject: Re: [f2fs-dev] (2) [PATCH v4] f2fs: add async reset zone command
 support
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
Reply-To: daejun7.park@samsung.com
Cc: Seokhwan Kim <sukka.kim@samsung.com>, beomsu kim <beomsu7.kim@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

VGhhbmsgeW91IGZvciByZXZpZXdpbmcgdGhlIHBhdGNoLgoKPiAtLS0tLS0tLS0gT3JpZ2luYWwg
TWVzc2FnZSAtLS0tLS0tLS0KPiBTZW5kZXIgOiBDaGFvIFl1wqA8Y2hhb0BrZXJuZWwub3JnPg0K
PiBEYXRlIDogMjAyMy0wNS0wNCAxMDo0MyAoR01UKzkpDQo+IFRpdGxlIDogUmU6IFtQQVRDSCB2
NF0gZjJmczogYWRkIGFzeW5jIHJlc2V0IHpvbmUgY29tbWFuZCBzdXBwb3J0DQo+IFRvIDog67CV
64yA7KSAPGRhZWp1bjcucGFya0BzYW1zdW5nLmNvbT4sIGphZWdldWtAa2VybmVsLm9yZzxqYWVn
ZXVrQGtlcm5lbC5vcmc+LCByb3N0ZWR0QGdvb2RtaXMub3JnPHJvc3RlZHRAZ29vZG1pcy5vcmc+
LCBtaGlyYW1hdEBrZXJuZWwub3JnPG1oaXJhbWF0QGtlcm5lbC5vcmc+LCBsaW51eC1mMmZzLWRl
dmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldDxsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZv
cmdlLm5ldD4sIGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc8bGludXgta2VybmVsQHZnZXIu
a2VybmVsLm9yZz4sIGxpbnV4LXRyYWNlLWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc8bGludXgtdHJh
Y2Uta2VybmVsQHZnZXIua2VybmVsLm9yZz4NCj4gQ0MgOiDquYDshJ3tmZg8c3Vra2Eua2ltQHNh
bXN1bmcuY29tPiwg7Iah7Jqp6ri4PHlvbmdnaWwuc29uZ0BzYW1zdW5nLmNvbT4sIOq5gOuylOyI
mDxiZW9tc3U3LmtpbUBzYW1zdW5nLmNvbT4NCj4gwqANCj4gT24gMjAyMy81LzIgMTI6MTYsIERh
ZWp1biBQYXJrIHdyb3RlOg0KPiA+IENoYW5nZWxvZzoNCj4gPiANCj4gPiB2MyAtPiB2NA0KPiA+
IEZpeGVkIGJ1aWxkIGVycm9yIGNhdXNlZCBieSB1bnVzZWQgZnVuY3Rpb24uDQo+ID4gDQo+ID4g
djIgLT4gdjMNCj4gPiBNb2RpZmllZCBhcmd1bWVudHMgdG8gYmUgY29ycmVjdCBmb3IgZnRyYWNl
IHBhcmFtZXRlci4NCj4gPiBDaGFuZ2VkIF9fc3VibWl0X3pvbmVfcmVzZXRfY21kIHRvIHZvaWQg
cmV0dXJuLg0KPiA+IFJlZmFjdG9yZWQgdGhlIGYyZnNfd2FpdF9kaXNjYXJkX2JpbyBmdW5jdGlv
bi4NCj4gPiBGaXhlZCBjb2RlIHRoYXQgd2FzIHByZXZpb3VzbHkgaW5jb3JyZWN0bHkgbWVyZ2Vk
Lg0KPiA+IA0KPiA+IHYxIC0+IHYyDQo+ID4gQ2hhbmdlZCB0byBhcHBseSB0aGUgb3B0aW9uYWwg
YXN5bmMgcmVzZXQgd3JpdGUgcG9pbnRlciBieSBkZWZhdWx0Lg0KPiA+IA0KPiA+IFRoaXMgcGF0
Y2ggZW5hYmxlcyBzdWJtaXQgcmVzZXQgem9uZSBjb21tYW5kIGFzeW5jaG9ybm91c2x5LiBJdCBo
ZWxwcw0KPiA+IGRlY3JlYXNlIGF2ZXJhZ2UgbGF0ZW5jeSBvZiB3cml0ZSBJT3MgaW4gaGlnaCB1
dGlsaXphdGlvbiBzY2VuYXJpbyBieQ0KPiA+IGZhc3RlciBjaGVja3BvaW50aW5nLg0KPiA+IA0K
PiA+IFNpZ25lZC1vZmYtYnk6IERhZWp1biBQYXJrIDxkYWVqdW43LnBhcmtAc2Ftc3VuZy5jb20+
DQo+ID4gLS0tDQo+ID4gwqAgZnMvZjJmcy9zZWdtZW50LmMgwqAgwqAgwqAgwqAgwqAgfCA4MyAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tDQo+ID4gwqAgaW5jbHVkZS90cmFj
ZS9ldmVudHMvZjJmcy5oIHwgMTggKysrKysrKy0NCj4gPiDCoCAyIGZpbGVzIGNoYW5nZWQsIDk2
IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2Zz
L2YyZnMvc2VnbWVudC5jIGIvZnMvZjJmcy9zZWdtZW50LmMNCj4gPiBpbmRleCA2ZGI0MTBmMWJi
OGMuLmVjN2E4ZGU3MTE5OCAxMDA2NDQNCj4gPiAtLS0gYS9mcy9mMmZzL3NlZ21lbnQuYw0KPiA+
ICsrKyBiL2ZzL2YyZnMvc2VnbWVudC5jDQo+ID4gQEAgLTExOTYsNiArMTE5Niw0NCBAQCBzdGF0
aWMgdm9pZCBfX2luaXRfZGlzY2FyZF9wb2xpY3koc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLA0K
PiA+IMKgIHN0YXRpYyB2b2lkIF9fdXBkYXRlX2Rpc2NhcmRfdHJlZV9yYW5nZShzdHJ1Y3QgZjJm
c19zYl9pbmZvICpzYmksDQo+ID4gwqAgwqDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHN0cnVjdCBibG9ja19kZXZpY2UgKmJkZXYsIGJsb2NrX3QgbHN0YXJ0
LA0KPiA+IMKgIMKgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBibG9ja190IHN0YXJ0LCBibG9ja190IGxlbik7DQo+ID4gKw0KPiA+ICsjaWZkZWYgQ09ORklH
X0JMS19ERVZfWk9ORUQNCj4gPiArc3RhdGljIHZvaWQgX19zdWJtaXRfem9uZV9yZXNldF9jbWQo
c3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLA0KPiA+ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgc3RydWN0IGRpc2NhcmRfY21kICpkYywgYmxrX29w
Zl90IGZsYWcsDQo+ID4gKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCBzdHJ1Y3QgbGlzdF9oZWFkICp3YWl0X2xpc3QsDQo+ID4gKyDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB1bnNpZ25lZCBpbnQgKmlz
c3VlZCkNCj4gPiArew0KPiA+ICsgwqAgwqAgwqAgwqBzdHJ1Y3QgZGlzY2FyZF9jbWRfY29udHJv
bCAqZGNjID0gU01fSShzYmkpLT5kY2NfaW5mbzsNCj4gPiArIMKgIMKgIMKgIMKgc3RydWN0IGJs
b2NrX2RldmljZSAqYmRldiA9IGRjLT5iZGV2Ow0KPiA+ICsgwqAgwqAgwqAgwqBzdHJ1Y3QgYmlv
ICpiaW8gPSBiaW9fYWxsb2MoYmRldiwgMCwgUkVRX09QX1pPTkVfUkVTRVQgfCBmbGFnLCBHRlBf
Tk9GUyk7DQo+ID4gKyDCoCDCoCDCoCDCoHVuc2lnbmVkIGxvbmcgZmxhZ3M7DQo+ID4gKw0KPiA+
ICsgwqAgwqAgwqAgwqB0cmFjZV9mMmZzX2lzc3VlX3Jlc2V0X3pvbmUoYmRldiwgZGMtPmRpLnN0
YXJ0KTsNCj4gPiArDQo+ID4gKyDCoCDCoCDCoCDCoHNwaW5fbG9ja19pcnFzYXZlKCZkYy0+bG9j
aywgZmxhZ3MpOw0KPiA+ICsgwqAgwqAgwqAgwqBkYy0+c3RhdGUgPSBEX1NVQk1JVDsNCj4gPiAr
IMKgIMKgIMKgIMKgZGMtPmJpb19yZWYrKzsNCj4gPiArIMKgIMKgIMKgIMKgc3Bpbl91bmxvY2tf
aXJxcmVzdG9yZSgmZGMtPmxvY2ssIGZsYWdzKTsNCj4gPiArDQo+ID4gKyDCoCDCoCDCoCDCoGlm
IChpc3N1ZWQpDQo+ID4gKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCgqaXNzdWVkKSsrOw0KPiA+
ICsNCj4gPiArIMKgIMKgIMKgIMKgYXRvbWljX2luYygmZGNjLT5xdWV1ZWRfZGlzY2FyZCk7DQo+
ID4gKyDCoCDCoCDCoCDCoGRjLT5xdWV1ZWQrKzsNCj4gPiArIMKgIMKgIMKgIMKgbGlzdF9tb3Zl
X3RhaWwoJmRjLT5saXN0LCB3YWl0X2xpc3QpOw0KPiA+ICsNCj4gPiArIMKgIMKgIMKgIMKgLyog
c2FuaXR5IGNoZWNrIG9uIGRpc2NhcmQgcmFuZ2UgKi8NCj4gPiArIMKgIMKgIMKgIMKgX19jaGVj
a19zaXRfYml0bWFwKHNiaSwgZGMtPmRpLmxzdGFydCwgZGMtPmRpLmxzdGFydCArIGRjLT5kaS5s
ZW4pOw0KPiA+ICsNCj4gPiArIMKgIMKgIMKgIMKgYmlvLT5iaV9pdGVyLmJpX3NlY3RvciA9IFNF
Q1RPUl9GUk9NX0JMT0NLKGRjLT5kaS5zdGFydCk7DQo+ID4gKyDCoCDCoCDCoCDCoGJpby0+Ymlf
cHJpdmF0ZSA9IGRjOw0KPiA+ICsgwqAgwqAgwqAgwqBiaW8tPmJpX2VuZF9pbyA9IGYyZnNfc3Vi
bWl0X2Rpc2NhcmRfZW5kaW87DQo+ID4gKyDCoCDCoCDCoCDCoHN1Ym1pdF9iaW8oYmlvKTsNCj4g
DQo+IEhvdyBhYm91dCBhY2NvdW50aW5nIGlvc3RhdCBpbmZvIGZvciB6b25lIHJlc2V0IGNvbW1h
bmQ/DQo+IA0KPiBmMmZzX3VwZGF0ZV9pb3N0YXQoc2JpLCBOVUxMLCBGU19aT05FX1JFU0VUX0lP
LCBsZW4gKiBGMkZTX0JMS1NJWkUpOw0KDQpTdXJlLCBJIHdpbGwgZG8uDQogDQo+ID4gKw0KPiA+
ICsgwqAgwqAgwqAgwqBhdG9taWNfaW5jKCZkY2MtPmlzc3VlZF9kaXNjYXJkKTsNCj4gPiArfQ0K
PiA+ICsjZW5kaWYNCj4gPiArDQo+ID4gwqAgLyogdGhpcyBmdW5jdGlvbiBpcyBjb3BpZWQgZnJv
bSBibGtkZXZfaXNzdWVfZGlzY2FyZCBmcm9tIGJsb2NrL2Jsay1saWIuYyAqLw0KPiA+IMKgIHN0
YXRpYyBpbnQgX19zdWJtaXRfZGlzY2FyZF9jbWQoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLA0K
PiA+IMKgIMKgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBz
dHJ1Y3QgZGlzY2FyZF9wb2xpY3kgKmRwb2xpY3ksDQo+ID4gQEAgLTEyMTcsNiArMTI1NSwxMyBA
QCBzdGF0aWMgaW50IF9fc3VibWl0X2Rpc2NhcmRfY21kKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNi
aSwNCj4gPiDCoCDCoMKgIMKgIMKgIMKgaWYgKGlzX3NiaV9mbGFnX3NldChzYmksIFNCSV9ORUVE
X0ZTQ0spKQ0KPiA+IMKgIMKgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXR1cm4gMDsNCj4gPiDC
oCANCj4gPiArI2lmZGVmIENPTkZJR19CTEtfREVWX1pPTkVEDQo+ID4gKyDCoCDCoCDCoCDCoGlm
IChmMmZzX3NiX2hhc19ibGt6b25lZChzYmkpICYmIGJkZXZfaXNfem9uZWQoYmRldikpIHsNCj4g
PiArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgX19zdWJtaXRfem9uZV9yZXNldF9jbWQoc2JpLCBk
YywgZmxhZywgd2FpdF9saXN0LCBpc3N1ZWQpOw0KPiA+ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqByZXR1cm4gMDsNCj4gPiArIMKgIMKgIMKgIMKgfQ0KPiA+ICsjZW5kaWYNCj4gPiArDQo+ID4g
wqAgwqDCoCDCoCDCoCDCoHRyYWNlX2YyZnNfaXNzdWVfZGlzY2FyZChiZGV2LCBkYy0+ZGkuc3Rh
cnQsIGRjLT5kaS5sZW4pOw0KPiA+IMKgIA0KPiA+IMKgIMKgwqAgwqAgwqAgwqBsc3RhcnQgPSBk
Yy0+ZGkubHN0YXJ0Ow0KPiA+IEBAIC0xNDYxLDYgKzE1MDYsMTkgQEAgc3RhdGljIHZvaWQgX191
cGRhdGVfZGlzY2FyZF90cmVlX3JhbmdlKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwNCj4gPiDC
oCDCoMKgIMKgIMKgIMKgfQ0KPiA+IMKgIH0NCj4gPiDCoCANCj4gPiArI2lmZGVmIENPTkZJR19C
TEtfREVWX1pPTkVEDQo+ID4gK3N0YXRpYyB2b2lkIF9fcXVldWVfem9uZV9yZXNldF9jbWQoc3Ry
dWN0IGYyZnNfc2JfaW5mbyAqc2JpLA0KPiA+ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdHJ1
Y3QgYmxvY2tfZGV2aWNlICpiZGV2LCBibG9ja190IGJsa3N0YXJ0LCBibG9ja190IGxibGtzdGFy
dCwNCj4gPiArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYmxvY2tfdCBibGtsZW4pDQo+ID4gK3sN
Cj4gPiArIMKgIMKgIMKgIMKgdHJhY2VfZjJmc19xdWV1ZV9yZXNldF96b25lKGJkZXYsIGJsa3N0
YXJ0KTsNCj4gPiArDQo+ID4gKyDCoCDCoCDCoCDCoG11dGV4X2xvY2soJlNNX0koc2JpKS0+ZGNj
X2luZm8tPmNtZF9sb2NrKTsNCj4gPiArIMKgIMKgIMKgIMKgX19pbnNlcnRfZGlzY2FyZF9jbWQo
c2JpLCBiZGV2LCBsYmxrc3RhcnQsIGJsa3N0YXJ0LCBibGtsZW4pOw0KPiA+ICsgwqAgwqAgwqAg
wqBtdXRleF91bmxvY2soJlNNX0koc2JpKS0+ZGNjX2luZm8tPmNtZF9sb2NrKTsNCj4gPiArfQ0K
PiA+ICsjZW5kaWYNCj4gPiArDQo+ID4gwqAgc3RhdGljIHZvaWQgX19xdWV1ZV9kaXNjYXJkX2Nt
ZChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksDQo+ID4gwqAgwqDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHN0cnVjdCBibG9ja19kZXZpY2UgKmJkZXYsIGJsb2NrX3QgYmxrc3RhcnQsIGJsb2NrX3Qg
YmxrbGVuKQ0KPiA+IMKgIHsNCj4gPiBAQCAtMTcyNCw2ICsxNzgyLDE5IEBAIHN0YXRpYyB2b2lk
IGYyZnNfd2FpdF9kaXNjYXJkX2JpbyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGJsb2NrX3Qg
YmxrYWRkcikNCj4gPiDCoCANCj4gPiDCoCDCoMKgIMKgIMKgIMKgbXV0ZXhfbG9jaygmZGNjLT5j
bWRfbG9jayk7DQo+ID4gwqAgwqDCoCDCoCDCoCDCoGRjID0gX19sb29rdXBfZGlzY2FyZF9jbWQo
c2JpLCBibGthZGRyKTsNCj4gPiArI2lmZGVmIENPTkZJR19CTEtfREVWX1pPTkVEDQo+ID4gKyDC
oCDCoCDCoCDCoGlmIChkYyAmJiBmMmZzX3NiX2hhc19ibGt6b25lZChzYmkpICYmIGJkZXZfaXNf
em9uZWQoZGMtPmJkZXYpKSB7DQo+ID4gKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC8qIGZvcmNl
IHN1Ym1pdCB6b25lIHJlc2V0ICovDQo+ID4gKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmIChk
Yy0+c3RhdGUgPT0gRF9QUkVQKQ0KPiA+ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBfX3N1Ym1pdF96b25lX3Jlc2V0X2NtZChzYmksIGRjLCBSRVFfU1lOQywNCj4gPiArIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgJmRjYy0+d2FpdF9saXN0LCBOVUxMKTsNCj4gPiArIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgZGMtPnJlZisrOw0KPiANCj4gSUlVQywgc2hvdWxkIGJlPw0KPiANCj4gZWxzZQ0K
PiAgwqAgwqAgwqAgwqBkYy0+cmVmKys7DQo+IA0KPiBUaGFua3MsDQoNCkluIGNhc2Ugb2YgZGlz
Y2FyZCwgd2UgY2FuIGRlbGV0ZSBhIHBlbmRpbmcgZGlzY2FyZCB2aWEgX19wdW5jaF9kaXNjYXJk
X2NtZCgpLg0KSG93ZXZlciwgd2UgY2Fubm90IHJlbW92ZSB0aGUgcGVuZGluZyB6b25lIHJlc2V0
IGNvbW1hbmQuDQpBbmQsIHdlIHNob3VsZCBhbHdheXMgd2FpdCBmb3IgdGhlIGNvbXBsZXRpb24g
b2YgdGhlIHpvbmUgcmVzZXQgY29tbWFuZCwgDQpzbyBJIGluY3JlYXNlZCB0aGUgcmVmZXJlbmNl
IGNvdW50ZXIuDQoNClRoYW5rcywNCkRhZWp1bg0KDQogDQo+ID4gKyDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoG11dGV4X3VubG9jaygmZGNjLT5jbWRfbG9jayk7DQo+ID4gKyDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoC8qIHdhaXQgem9uZSByZXNldCAqLw0KPiA+ICsgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBfX3dhaXRfb25lX2Rpc2NhcmRfYmlvKHNiaSwgZGMpOw0KPiA+ICsgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqByZXR1cm47DQo+ID4gKyDCoCDCoCDCoCDCoH0NCj4gPiArI2VuZGlmDQo+ID4g
wqAgwqDCoCDCoCDCoCDCoGlmIChkYykgew0KPiA+IMKgIMKgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBpZiAoZGMtPnN0YXRlID09IERfUFJFUCkgew0KPiA+IMKgIMKgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBfX3B1bmNoX2Rpc2NhcmRfY21kKHNiaSwgZGMsIGJsa2FkZHIpOw0K
PiA+IEBAIC0xODc2LDkgKzE5NDcsMTUgQEAgc3RhdGljIGludCBfX2YyZnNfaXNzdWVfZGlzY2Fy
ZF96b25lKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwNCj4gPiDCoCDCoMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGJsa3N0YXJ0LCBibGtsZW4pOw0KPiA+
IMKgIMKgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXR1cm4gLUVJTzsNCj4g
PiDCoCDCoMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfQ0KPiA+IC0gwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqB0cmFjZV9mMmZzX2lzc3VlX3Jlc2V0X3pvbmUoYmRldiwgYmxrc3RhcnQpOw0KPiA+IC0g
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXR1cm4gYmxrZGV2X3pvbmVfbWdtdChiZGV2LCBSRVFf
T1BfWk9ORV9SRVNFVCwNCj4gPiAtIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc2VjdG9yLCBucl9zZWN0cywgR0ZQX05PRlMpOw0KPiA+
ICsNCj4gPiArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKHVubGlrZWx5KGlzX3NiaV9mbGFn
X3NldChzYmksIFNCSV9QT1JfRE9JTkcpKSkgew0KPiA+ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqB0cmFjZV9mMmZzX2lzc3VlX3Jlc2V0X3pvbmUoYmRldiwgYmxrc3RhcnQp
Ow0KPiA+ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXR1cm4gYmxrZGV2
X3pvbmVfbWdtdChiZGV2LCBSRVFfT1BfWk9ORV9SRVNFVCwNCj4gPiArIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
c2VjdG9yLCBucl9zZWN0cywgR0ZQX05PRlMpOw0KPiA+ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqB9DQo+ID4gKw0KPiA+ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBfX3F1ZXVlX3pvbmVfcmVz
ZXRfY21kKHNiaSwgYmRldiwgYmxrc3RhcnQsIGxibGtzdGFydCwgYmxrbGVuKTsNCj4gPiArIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0dXJuIDA7DQo+ID4gwqAgwqDCoCDCoCDCoCDCoH0NCj4g
PiDCoCANCj4gPiDCoCDCoMKgIMKgIMKgIMKgLyogRm9yIGNvbnZlbnRpb25hbCB6b25lcywgdXNl
IHJlZ3VsYXIgZGlzY2FyZCBpZiBzdXBwb3J0ZWQgKi8NCj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS90cmFjZS9ldmVudHMvZjJmcy5oIGIvaW5jbHVkZS90cmFjZS9ldmVudHMvZjJmcy5oDQo+ID4g
aW5kZXggOTljYmM1OTQ5ZTNjLi5lZTE0NzdkZTgzMjQgMTAwNjQ0DQo+ID4gLS0tIGEvaW5jbHVk
ZS90cmFjZS9ldmVudHMvZjJmcy5oDQo+ID4gKysrIGIvaW5jbHVkZS90cmFjZS9ldmVudHMvZjJm
cy5oDQo+ID4gQEAgLTE1MTIsNyArMTUxMiw3IEBAIERFRklORV9FVkVOVChmMmZzX2Rpc2NhcmQs
IGYyZnNfcmVtb3ZlX2Rpc2NhcmQsDQo+ID4gwqAgwqDCoCDCoCDCoCDCoFRQX0FSR1MoZGV2LCBi
bGtzdGFydCwgYmxrbGVuKQ0KPiA+IMKgICk7DQo+ID4gwqAgDQo+ID4gLVRSQUNFX0VWRU5UKGYy
ZnNfaXNzdWVfcmVzZXRfem9uZSwNCj4gPiArREVDTEFSRV9FVkVOVF9DTEFTUyhmMmZzX3Jlc2V0
X3pvbmUsDQo+ID4gwqAgDQo+ID4gwqAgwqDCoCDCoCDCoCDCoFRQX1BST1RPKHN0cnVjdCBibG9j
a19kZXZpY2UgKmRldiwgYmxvY2tfdCBibGtzdGFydCksDQo+ID4gwqAgDQo+ID4gQEAgLTE1Mjgs
MTEgKzE1MjgsMjUgQEAgVFJBQ0VfRVZFTlQoZjJmc19pc3N1ZV9yZXNldF96b25lLA0KPiA+IMKg
IMKgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBfX2VudHJ5LT5ibGtzdGFydCA9IGJsa3N0YXJ0Ow0K
PiA+IMKgIMKgwqAgwqAgwqAgwqApLA0KPiA+IMKgIA0KPiA+IC0gwqAgwqAgwqAgwqBUUF9wcmlu
dGsoImRldiA9ICglZCwlZCksIHJlc2V0IHpvbmUgYXQgYmxvY2sgPSAweCVsbHgiLA0KPiA+ICsg
wqAgwqAgwqAgwqBUUF9wcmludGsoImRldiA9ICglZCwlZCksIHpvbmUgYXQgYmxvY2sgPSAweCVs
bHgiLA0KPiA+IMKgIMKgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzaG93X2RldihfX2VudHJ5LT5k
ZXYpLA0KPiA+IMKgIMKgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAodW5zaWduZWQgbG9uZyBsb25n
KV9fZW50cnktPmJsa3N0YXJ0KQ0KPiA+IMKgICk7DQo+ID4gwqAgDQo+ID4gK0RFRklORV9FVkVO
VChmMmZzX3Jlc2V0X3pvbmUsIGYyZnNfcXVldWVfcmVzZXRfem9uZSwNCj4gPiArDQo+ID4gKyDC
oCDCoCDCoCDCoFRQX1BST1RPKHN0cnVjdCBibG9ja19kZXZpY2UgKmRldiwgYmxvY2tfdCBibGtz
dGFydCksDQo+ID4gKw0KPiA+ICsgwqAgwqAgwqAgwqBUUF9BUkdTKGRldiwgYmxrc3RhcnQpDQo+
ID4gKyk7DQo+ID4gKw0KPiA+ICtERUZJTkVfRVZFTlQoZjJmc19yZXNldF96b25lLCBmMmZzX2lz
c3VlX3Jlc2V0X3pvbmUsDQo+ID4gKw0KPiA+ICsgwqAgwqAgwqAgwqBUUF9QUk9UTyhzdHJ1Y3Qg
YmxvY2tfZGV2aWNlICpkZXYsIGJsb2NrX3QgYmxrc3RhcnQpLA0KPiA+ICsNCj4gPiArIMKgIMKg
IMKgIMKgVFBfQVJHUyhkZXYsIGJsa3N0YXJ0KQ0KPiA+ICspOw0KPiA+ICsNCj4gPiDCoCBUUkFD
RV9FVkVOVChmMmZzX2lzc3VlX2ZsdXNoLA0KPiA+IMKgIA0KPiA+IMKgIMKgwqAgwqAgwqAgwqBU
UF9QUk9UTyhzdHJ1Y3QgYmxvY2tfZGV2aWNlICpkZXYsIHVuc2lnbmVkIGludCBub2JhcnJpZXIs
DQo+IA0KPiDCoA0KPiDCoAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxA
bGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3Rz
L2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
