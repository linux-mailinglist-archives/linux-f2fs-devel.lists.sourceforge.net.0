Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 76928927102
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 Jul 2024 09:56:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sPHKX-0007yc-LT;
	Thu, 04 Jul 2024 07:56:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daejun7.park@samsung.com>) id 1sPHKW-0007yQ-LG
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Jul 2024 07:56:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:In-Reply-To:CC:To:From:Sender:Reply-To:Subject:Mime-Version:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nJsXcRh8QdAcnpMVPzgSJc5Ql2XpNsjVAnlyj6Jj21k=; b=exlI18fGXwmdjIOM7U1B8dri3J
 8WqQzzr492PnnDoBd/ryALTTxfQkcd/fMb6SsKA2W+5cirN7dlmMqXJ2PvFVwaWwc+l2l+mkVHcwD
 y1DzuzSQ1HY4sipIdS0AJdYL6kXR8jcqZ1tyF1T+h+qKNaQLia3dMYLcfkQEh6MGatac=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:
 In-Reply-To:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nJsXcRh8QdAcnpMVPzgSJc5Ql2XpNsjVAnlyj6Jj21k=; b=Booo5pGzT34afIXNilTkVrJGj7
 9mQCRFlZtcQGVCQLnJgDbX7stlnuCkvJ9rf9T8BXHVrL+Qvab993XIU8CDe8jmdQ6/aZDJOafxz54
 c5nelw5vRTe4HlkxyuwEf0KIm+TPEXUNxau2HpEjcsMea7JFv2t5TaBuqEqTdjYX6dZA=;
Received: from mailout4.samsung.com ([203.254.224.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sPHKW-00061d-9N for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Jul 2024 07:56:36 +0000
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20240704075623epoutp04659586d89fe24a4dd8f3546ca84f3405~e83MWvgPU2884428844epoutp04W
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  4 Jul 2024 07:56:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20240704075623epoutp04659586d89fe24a4dd8f3546ca84f3405~e83MWvgPU2884428844epoutp04W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1720079783;
 bh=nJsXcRh8QdAcnpMVPzgSJc5Ql2XpNsjVAnlyj6Jj21k=;
 h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
 b=hUZo2lFO9JAVBbmKdTLqah9esllONPctYb0vygtxRSltCrxU436cg2pvLEsu9hWfr
 uO6gRfZCVjjVH+9b125cD+h8W2J22sfJXeY2cq9m71M3ZFHPE0EavW2TIB667n37Xe
 OwCEICWBRKLdLR/stWFHH3dxhreIAtHhd949UBxE=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas2p3.samsung.com (KnoxPortal) with ESMTP id
 20240704075622epcas2p3878696583b1c0cb0147035b39ab9565e~e83MAG6Bt1605416054epcas2p3X;
 Thu,  4 Jul 2024 07:56:22 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.99]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4WF89L41yWz4x9Q4; Thu,  4 Jul
 2024 07:56:22 +0000 (GMT)
X-AuditID: b6c32a46-f3bff7000000250d-e2-668655a60689
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
 epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 A5.A5.09485.6A556866; Thu,  4 Jul 2024 16:56:22 +0900 (KST)
Mime-Version: 1.0
From: Daejun Park <daejun7.park@samsung.com>
To: Chao Yu <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "daehojeong@google.com" <daehojeong@google.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <460c4708-3ec6-4fbc-8f6c-7f8e5f901061@kernel.org>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20240704075521epcms2p49cc9985b6624e4e1129907e883fbc1d9@epcms2p4>
Date: Thu, 04 Jul 2024 16:55:21 +0900
X-CMS-MailID: 20240704075521epcms2p49cc9985b6624e4e1129907e883fbc1d9
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-CPGSPASS: Y
X-CPGSPASS: Y
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHJsWRmVeSWpSXmKPExsWy7bCmme6y0LY0g4XPOCxOTz3LZPHykKbF
 1Pa9jBarHoRb/DhpYtG/u53F4sn6WcwWlxa5W1zeNYfNouWPk8X5ia+ZLFZ1zGW0mHr+CJMD
 r8eCTaUem1Z1snnsXvCZyaNvyypGj8+b5AJYo7JtMlITU1KLFFLzkvNTMvPSbZW8g+Od403N
 DAx1DS0tzJUU8hJzU22VXHwCdN0yc4DOU1IoS8wpBQoFJBYXK+nb2RTll5akKmTkF5fYKqUW
 pOQUmBfoFSfmFpfmpevlpZZYGRoYGJkCFSZkZ5xct4W9YK5URfvGScwNjEcluxg5OSQETCR2
 /l7C3MXIxSEksINR4uD+j+xdjBwcvAKCEn93CIPUCAsESdw++ZgJxBYSUJJYf3EWO0RcT+LW
 wzWMIDabgI7E9BP3weIiApOZJPbdzwaZySwwg0li3uleNohlvBIz2p+yQNjSEtuXbwVr5hSw
 kzjw+jUTRFxD4seyXmYIW1Ti5uq37DD2+2PzGSFsEYnWe2ehagQlHvzcDRWXlLg9dxNUfb7E
 /yvLoewaiW0H5kHZ+hLXOjaC3cAr4Csxp7sP7DYWAVWJc4fnQc1xkWjfcxHsHmYBbYllC18z
 g8KEWUBTYv0ufRBTQkBZ4sgtFogKPomOw3/ZYT5s2PgbK3vHvCdQH6pJrPu5nmkCo/IsREDP
 QrJrFsKuBYzMqxjFUguKc9NTi40KjOBxm5yfu4kRnFC13HYwTnn7Qe8QIxMH4yFGCQ5mJRFe
 qffNaUK8KYmVValF+fFFpTmpxYcYTYG+nMgsJZqcD0zpeSXxhiaWBiZmZobmRqYG5krivPda
 56YICaQnlqRmp6YWpBbB9DFxcEo1MKkk/9aJXRJufO5QuvNJHRbGdRfWOjL9Lzfn97l4KVtw
 g2PUua+Hj9j58pnZXti6/hnLybDj+n92m3Fl2v1i33whNPPC4rf7GZ7xtbX5HD+X1G4rdJnx
 S0zpW8OZgoy+78ytb+cbPGrcb5wdPblcB5gT8vlu/uWpXCbI8/12itWV6qXvVjhd8UnIm7us
 cnJ0XFae8XGT+xNEFszaXchZ6boqcULL04kbC0V87zWf0byouvT5tCcuv5funNUQPmu/zLcb
 D2vtCucW1Ok0CnxYvauxlmVC1OOrphNMl/7yEjuuccxvR73jEXbHu3t9fI4Fc0pFTNbhXPzJ
 ba77ln1bm5nqziWtFPP/v37p5YYZMkosxRmJhlrMRcWJAJrXiIYxBAAA
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240704010121epcms2p4cff8b25d976d4a1b820ba18f1eb5aa90
References: <460c4708-3ec6-4fbc-8f6c-7f8e5f901061@kernel.org>
 <20240704010121epcms2p4cff8b25d976d4a1b820ba18f1eb5aa90@epcms2p4>
 <CGME20240704010121epcms2p4cff8b25d976d4a1b820ba18f1eb5aa90@epcms2p4>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi Chao Yu, >  >--------- Original Message --------- >Sender
    : Chao Yu <chao@kernel.org> >Date : 2024-07-04 16:16 (GMT+9) >Title : Re:
    [PATCH] f2fs: fix null reference error when checking end of zon [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
                             blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [URIs: samsung.com]
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                         [203.254.224.34 listed in sa-trusted.bondedsender.org]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [203.254.224.34 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [203.254.224.34 listed in wl.mailspike.net]
  0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sPHKW-00061d-9N
Subject: Re: [f2fs-dev] (2) [PATCH] f2fs: fix null reference error when
 checking end of zone
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
Cc: Nayeon Kim <nayeoni.kim@samsung.com>, Siwoo Jung <siu.jung@samsung.com>,
 Seokhwan Kim <sukka.kim@samsung.com>, Dongjin Kim <dongjin_.kim@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGnCoENoYW8gWXUsDQo+wqANCj4tLS0tLS0tLS0gT3JpZ2luYWwgTWVzc2FnZSAtLS0tLS0tLS0N
Cj5TZW5kZXIgOiBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+DQo+RGF0ZSA6IDIwMjQtMDctMDQg
MTY6MTYgKEdNVCs5KQ0KPlRpdGxlIDogUmU6IFtQQVRDSF0gZjJmczogZml4IG51bGwgcmVmZXJl
bmNlIGVycm9yIHdoZW4gY2hlY2tpbmcgZW5kIG9mIHpvbmUNCj7CoA0KPk9uIDIwMjQvNy80IDk6
MDEsIERhZWp1biBQYXJrIHdyb3RlOg0KPj4gVGhpcyBwYXRjaCBmaXhlcyBhIHBvdGVudGlhbGx5
IG51bGwgcG9pbnRlciBiZWluZyBhY2Nlc3NlZCBieQ0KPj4gaXNfZW5kX3pvbmVfYmxrYWRkcigp
IHRoYXQgY2hlY2tzIHRoZSBsYXN0IGJsb2NrIG9mIGEgem9uZQ0KPj4gd2hlbiBmMmZzIGlzIG1v
dW50ZWQgYXMgYSBzaW5nbGUgZGV2aWNlLg0KPg0KPmJsa3pvbmVkIGZlYXR1cmUgZGVwZW5kcyBv
biBtdWx0aXBsZSBkZXZpY2UgZmVhdHVyZT8gT25lIHJlZ3VsYXINCj5kZXZpY2UgYW5kIG9uZSBz
ZXEtem9uZSBkZXZpY2U/DQoNCkFjY29yZGluZyB0byBta2ZzLmYyZnMsIGlmIHRoZXJlIGFyZSBh
IHN1ZmZpY2llbnQgbnVtYmVyIG9mDQpjb252ZW50aW9uYWwgem9uZXMsIGEgc2luZ2xlIHpvbmVk
IGRldmljZSBjYW4gYmUgdXNlZC4NCg0KVGhhbmtzLA0KRGFlanVuDQoNCj4NCj5UaGFua3MsDQo+
DQo+Pg0KPj4gRml4ZXM6IGUwNjdkYzNjNmI5YyAoImYyZnM6IG1haW50YWluIHNpeCBvcGVuIHpv
bmVzIGZvciB6b25lZCBkZXZpY2VzIikNCj4+IFNpZ25lZC1vZmYtYnk6IERhZWp1biBQYXJrIDxk
YWVqdW43LnBhcmtAc2Ftc3VuZy5jb20+DQo+PiAtLS0NCj4+wqAgZnMvZjJmcy9kYXRhLmMgNCAr
KystDQo+PsKgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkN
Cj4+DQo+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9kYXRhLmMgYi9mcy9mMmZzL2RhdGEuYw0KPj4g
aW5kZXggYjZkY2IzYmNhZWY3Li4xYWE3ZWVmYTY1OWMgMTAwNjQ0DQo+PiAtLS0gYS9mcy9mMmZz
L2RhdGEuYw0KPj4gKysrIGIvZnMvZjJmcy9kYXRhLmMNCj4+IEBAIC05MjUsNiArOTI1LDcgQEAg
aW50IGYyZnNfbWVyZ2VfcGFnZV9iaW8oc3RydWN0IGYyZnNfaW9faW5mbyAqZmlvKQ0KPj7CoCAj
aWZkZWYgQ09ORklHX0JMS19ERVZfWk9ORUQNCj4+wqAgc3RhdGljIGJvb2wgaXNfZW5kX3pvbmVf
YmxrYWRkcihzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGJsb2NrX3QgYmxrYWRkcikNCj4+wqAg
ew0KPj4gKyDCoCDCoCDCoCDCoHN0cnVjdCBibG9ja19kZXZpY2UgKmJkZXYgPSBzYmktPnNiLT5z
X2JkZXY7DQo+PsKgIMKgIMKgIMKgIMKgIMKgaW50IGRldmkgPSAwOw0KPj7CoA0KPj7CoCDCoCDC
oCDCoCDCoCDCoGlmIChmMmZzX2lzX211bHRpX2RldmljZShzYmkpKSB7DQo+PiBAQCAtOTM1LDgg
KzkzNiw5IEBAIHN0YXRpYyBib29sIGlzX2VuZF96b25lX2Jsa2FkZHIoc3RydWN0IGYyZnNfc2Jf
aW5mbyAqc2JpLCBibG9ja190IGJsa2FkZHIpDQo+PsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgcmV0dXJuIGZhbHNlOw0KPj7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoH0NCj4+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBibGthZGRyIC09IEZERVYoZGV2
aSkuc3RhcnRfYmxrOw0KPj4gKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJkZXYgPSBGREVWKGRl
dmkpLmJkZXY7DQo+PsKgIMKgIMKgIMKgIMKgIMKgfQ0KPj4gLSDCoCDCoCDCoCDCoHJldHVybiBi
ZGV2X2lzX3pvbmVkKEZERVYoZGV2aSkuYmRldikgJiYNCj4+ICsgwqAgwqAgwqAgwqByZXR1cm4g
YmRldl9pc196b25lZChiZGV2KSAmJg0KPj7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGYy
ZnNfYmxrel9pc19zZXEoc2JpLCBkZXZpLCBibGthZGRyKSAmJg0KPj7CoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoChibGthZGRyICUgc2JpLT5ibG9ja3NfcGVyX2Jsa3ogPT0gc2JpLT5ibG9j
a3NfcGVyX2Jsa3ogLSAxKTsNCj4+wqAgfQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYy
ZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2Uu
bmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
