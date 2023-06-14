Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B66372F46C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Jun 2023 08:09:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q9Jgz-0005xq-KQ;
	Wed, 14 Jun 2023 06:09:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daejun7.park@samsung.com>) id 1q9Jgx-0005xk-Vp
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Jun 2023 06:09:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:In-Reply-To:CC:To:From:Sender:Reply-To:Subject:Mime-Version:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ams/WCEjAdJZZhA9Dn0/3apZO2D9Et1VjB/NoGAccik=; b=l7fahq4ohYFktrI97US+QEuKKX
 PFVkYQ02yh801KnArPtgrekJ9Bh7Ks3CFj3vmt+gzQkRhPHGwGItIxNy/yO55UxTiO5YZlETFGSll
 i98zxswSjXA3ACfY3c2tAVKhjDs2GwzUgdbWreD28dcWYMRN3ltUR8FtB/+v+3NrHK+8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:
 In-Reply-To:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ams/WCEjAdJZZhA9Dn0/3apZO2D9Et1VjB/NoGAccik=; b=Xv9OxvgsxCQrrw0IJf+p4k7H0z
 KhgIOVHyQOmRkFPk3nmVNMFQQOIY2AfojC36FlZgCtqm0q2EDTudklWxrkPxA4N6f8b/L7CorVLAc
 w5pmUgEUG8EwQ5ZQA26McOL6anocIUym2hCinv56SoV3Z1j1XY4NgNiuPz43lMEi/sbo=;
Received: from mailout3.samsung.com ([203.254.224.33])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q9Jgu-002bEe-8Q for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Jun 2023 06:09:16 +0000
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20230614060858epoutp03298de8a74d7558b26fdc78948a9d4058~ocZOAmdnp1281112811epoutp03-
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 14 Jun 2023 06:08:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20230614060858epoutp03298de8a74d7558b26fdc78948a9d4058~ocZOAmdnp1281112811epoutp03-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1686722938;
 bh=Ams/WCEjAdJZZhA9Dn0/3apZO2D9Et1VjB/NoGAccik=;
 h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
 b=JEA+az0rQTF763c935Bfj2kn2JuWmkniLqaYlyP1ORxofTkGu/BpF+EFN/BveLjP9
 48klM+aBuvHuckk2tOkuF8jBHfF5fXQh/99xcgOu7RcmB1YPe5OtmTliUN/JZTLc0H
 2XX6/ntn+8abEsjp0tIAdfnciopqs5i7WEBzsKh4=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTP id
 20230614060858epcas2p416e7127c36b51ad767165207f5047542~ocZNTfPh01707717077epcas2p40;
 Wed, 14 Jun 2023 06:08:58 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.70]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4Qgw3Y3j9tz4x9Q0; Wed, 14 Jun
 2023 06:08:57 +0000 (GMT)
X-AuditID: b6c32a48-c3ff87000000acbc-6c-6489597951a4
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
 epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 06.42.44220.97959846; Wed, 14 Jun 2023 15:08:57 +0900 (KST)
Mime-Version: 1.0
From: Daejun Park <daejun7.park@samsung.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <20230613203947.2745943-1-jaegeuk@kernel.org>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20230614060757epcms2p4e11a8f8bf2fa44eac99a5bb7f47f8dcd@epcms2p4>
Date: Wed, 14 Jun 2023 15:07:57 +0900
X-CMS-MailID: 20230614060757epcms2p4e11a8f8bf2fa44eac99a5bb7f47f8dcd
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-CPGSPASS: Y
X-CPGSPASS: Y
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrEKsWRmVeSWpSXmKPExsWy7bCmuW5lZGeKQetHCYuXhzQtVj0It3iy
 fhazxaVF7haXd81hc2D12LSqk81j94LPTB59W1YxenzeJBfAEpVtk5GamJJapJCal5yfkpmX
 bqvkHRzvHG9qZmCoa2hpYa6kkJeYm2qr5OIToOuWmQO0VEmhLDGnFCgUkFhcrKRvZ1OUX1qS
 qpCRX1xiq5RakJJTYF6gV5yYW1yal66Xl1piZWhgYGQKVJiQnTG1ZzpTwRfuinu7t7M3MP7l
 6mLk5JAQMJE4crSFqYuRi0NIYAejxN/DX9m7GDk4eAUEJf7uEAYxhQViJRZOswEpFxJQklh/
 cRY7iC0soCdx6+EaRhCbTUBHYvqJ+2BxEYFdjBIX25NAbGYBLYlzW9cxQqzilZjR/pQFwpaW
 2L58K1icU8BK4kTvGlaIuIbEj2W9zBC2qMTN1W/ZYez3x+ZDzRGRaL13FqpGUOLBz91QcUmJ
 23M3QdXnS/y/shzKrpHYdmAelK0vca1jI9gNvAK+Esdv3gfrZRFQlXi98A3UHBeJD2eWM0Lc
 ry2xbOFrZlAwMAtoSqzfpQ9iSggoSxy5xQJRwSfRcfgvO8yHDRt/Y2XvmPeECcJWk1j3cz3T
 BEblWYhgnoVk1yyEXQsYmVcxiqUWFOempxYbFZjAYzY5P3cTIzjxaXnsYJz99oPeIUYmDsZD
 jBIczEoivE812lOEeFMSK6tSi/Lji0pzUosPMZoCfTmRWUo0OR+YevNK4g1NLA1MzMwMzY1M
 DcyVxHk/diinCAmkJ5akZqemFqQWwfQxcXBKNTBtSn6dYKIdMfWv8+Rl1cEzM4S5T6x587hB
 +8KfDzt29Myczd4b++TzIT7ZrbFWks8nl5ZyWG46L7CrUNqwVtp7bq2X40qLX9cXVq4p/xug
 9qROYs+OO1+PHHff9TPJ/OuTFLtkK5P/QnMFm6/KGLAxl055+3v1pukNld3TDc5MuX0iY2rd
 5i+WOfERWjMt1LZbfMtRf1IveFb544Epp9mKD54vdllxesYmp4rvhvJ+p8S3132b7sC5W0Xr
 xJxFbZbRH9K32tY/2qP9+0dH4qq2BL4Vr55Ipac4/Ao5sSzoyN9vK/UuRNi/NCoLO35DN/bJ
 X/arbFNK8hcfj08QP7mQWeK19PEj/n63SvhuTxN7r8RSnJFoqMVcVJwIAEbnOmQFBAAA
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230613204109epcas2p158ecc100d3fe2db1ab2b7ee8335d01e7
References: <20230613203947.2745943-1-jaegeuk@kernel.org>
 <CGME20230613204109epcas2p158ecc100d3fe2db1ab2b7ee8335d01e7@epcms2p4>
X-Spam-Score: -3.2 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Jaegeuk, > If there're huge # of small discards, this will
 increase checkpoint latency > insanely. Let's issue small discards only by
 trim. > > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> > --- > fs/f2fs/s
 [...] Content analysis details:   (-3.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.33 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.33 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q9Jgu-002bEe-8Q
Subject: Re: [f2fs-dev] [PATCH] f2fs: do not issue small discard commands
 during checkpoint
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkgSmFlZ2V1aywKCj4gSWYgdGhlcmUncmUgaHVnZSAjIG9mIHNtYWxsIGRpc2NhcmRzLCB0aGlz
IHdpbGwgaW5jcmVhc2UgY2hlY2twb2ludCBsYXRlbmN5Cj4gaW5zYW5lbHkuIExldCdzIGlzc3Vl
IHNtYWxsIGRpc2NhcmRzIG9ubHkgYnkgdHJpbS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYWVnZXVr
IEtpbSA8amFlZ2V1a0BrZXJuZWwub3JnPgo+IC0tLQo+ICBmcy9mMmZzL3NlZ21lbnQuYyB8IDUg
KystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zZWdtZW50LmMgYi9mcy9mMmZzL3NlZ21lbnQuYwo+
IGluZGV4IDBjMGMwMzNjNGJkZC4uZWY0NmJiMDg1Mzg1IDEwMDY0NAo+IC0tLSBhL2ZzL2YyZnMv
c2VnbWVudC5jCj4gKysrIGIvZnMvZjJmcy9zZWdtZW50LmMKPiBAQCAtMjE3OCw3ICsyMTc4LDcg
QEAgdm9pZCBmMmZzX2NsZWFyX3ByZWZyZWVfc2VnbWVudHMoc3RydWN0IGYyZnNfc2JfaW5mbyAq
c2JpLAo+IMKgIMKgIMKgIMKgIMKgfQ0KPiDCoCDCoCDCoCDCoCDCoG11dGV4X3VubG9jaygmZGly
dHlfaS0+c2VnbGlzdF9sb2NrKTsNCj4gIA0KPiAtIMKgIMKgIMKgIMKgaWYgKCFmMmZzX2Jsb2Nr
X3VuaXRfZGlzY2FyZChzYmkpKQ0KPiArIMKgIMKgIMKgIMKgaWYgKCFmMmZzX2Jsb2NrX3VuaXRf
ZGlzY2FyZChzYmkpIHx8ICFmb3JjZSkNCg0KSWYgd2UgZG9uJ3QgaGFuZGxlIHRoZSBkaXNjYXJk
IGVudHJpZXMgaGVyZSwgZGNjLT5lbnRyeV9saXN0IHdpbGwgc3RpbGwgaGF2ZSB0aGVtLA0Kc28g
c3RhbGUgZGlzY2FyZCBlbnRyaWVzIG1heSBiZSBoYW5kbGVkIGJ5IHRyaW0sIGNhdXNpbmcgaW5j
b3JyZWN0IGRpc2NhcmRzIHRvIGJlIGlzc3VlZC4NClRoZXJlZm9yZSwgSSB0aGluayB0aGlzIHBh
dGNoIHNob3VsZCBhbHNvIHByZXZlbnQgdGhlIGNyZWF0aW9uIG9mIGRpc2NhcmQgZW50cmllcw0K
aW4gYWRkX2Rpc2NhcmRfYWRkcnMoKSwgdW5sZXNzIGl0IGlzIGEgY2hlY2twb2ludCBjYXVzZWQg
YnkgdHJpbS4NClRoaXMgd291bGQgZnVydGhlciByZWR1Y2UgdGhlIGxhdGVuY3kgY2F1c2VkIGJ5
IHRoZSBjcmVhdGlvbiBvZiBhIGRpc2NhcmQgZW50cnkuDQoNClRoYW5rcywNCkRhZWp1bg0KCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJm
cy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5u
ZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJm
cy1kZXZlbAo=
