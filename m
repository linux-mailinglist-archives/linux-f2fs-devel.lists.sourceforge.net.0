Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B12D9BAB70
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Nov 2024 04:31:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t7noO-0004bH-Sv;
	Mon, 04 Nov 2024 03:31:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jinsu1.lee@samsung.com>) id 1t7noM-0004au-GD
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Nov 2024 03:31:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XW7Tr0AzfONF9JAh8jwgreE8dCgwPj6E80Ah/QrwGYE=; b=T3oG/FHsPJMrJTYhNqMfd0/NK0
 USIEBjFtA21DCV5ZLaoxfTImZ+KbebsM64QRoNwwY9iRMp0Vv/TtQXcySQ1TsFhqwrc+wgUPBLDoV
 IBV7wO6D8x894qzXUB73uIGlsl5AIL4z6o0pXCnDJoYslAARwtLo49IvJKmtVHhBEYGI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:CC:To:
 From:Sender:Reply-To:Subject:Mime-Version:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=XW7Tr0AzfONF9JAh8jwgreE8dCgwPj6E80Ah/QrwGYE=; b=d
 dNCCOBuQF2gdSWB7h7EK5Cqh722UgjulMhFxV4pG0gYZ4g9TiYUwjo1MEjO1GPcdmK+QeWkpqCjLv
 AdOJ4GguQGyjRo+Nm3jm++Pjf0kEGTPMFGFJM+bm9+WFmwGhNDJ2BYBVJAtZPAlsqER7lqlDS/1QD
 KgkoOZ/l7tJ51hoQ=;
Received: from mailout1.samsung.com ([203.254.224.24])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t7noJ-0005TH-Nl for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Nov 2024 03:31:26 +0000
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20241104033116epoutp014db9b3cb9e259b4889472ca5688a08a6~Epl1d_tWh1949919499epoutp01I
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  4 Nov 2024 03:31:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20241104033116epoutp014db9b3cb9e259b4889472ca5688a08a6~Epl1d_tWh1949919499epoutp01I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1730691076;
 bh=XW7Tr0AzfONF9JAh8jwgreE8dCgwPj6E80Ah/QrwGYE=;
 h=Subject:Reply-To:From:To:CC:Date:References:From;
 b=f4fX4Hsoj1Fis/zHlJjhCuZW7QL2Uggc7xQ56N4u14svGw1WFs0mek7da5weLj5+N
 dcrake166IpgQRHUlvRT+kwYFzFSbF1vpwozbiuKTbHeZ3Jyxf4aO7/v0ymQs/bEp4
 IdQBZnLcjtacSp2wurkTwHxTana67QPjIcFhOLW4=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas2p3.samsung.com (KnoxPortal) with ESMTP id
 20241104033116epcas2p38388eac36a1640bced9169419b71eed9~Epl1OeVNl0642706427epcas2p3C;
 Mon,  4 Nov 2024 03:31:16 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.99]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4XhcSg6ghQz4x9Q7; Mon,  4 Nov
 2024 03:31:15 +0000 (GMT)
X-AuditID: b6c32a46-638d9a800000262a-14-67284003751b
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
 epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 58.0E.09770.30048276; Mon,  4 Nov 2024 12:31:15 +0900 (KST)
Mime-Version: 1.0
From: Jinsu Lee <jinsu1.lee@samsung.com>
To: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
X-Priority: 3
X-Content-Kind-Code: NORMAL
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20241104033115epcms2p2867a532b5cdb012b1612931597cedf4a@epcms2p2>
Date: Mon, 04 Nov 2024 12:31:15 +0900
X-CMS-MailID: 20241104033115epcms2p2867a532b5cdb012b1612931597cedf4a
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrDKsWRmVeSWpSXmKPExsWy7bCmuS6zg0a6wdobKhanp55lsniyfhaz
 xaVF7haXd81hc2Dx2LSqk81j94LPTB6fN8kFMEdl22SkJqakFimk5iXnp2TmpdsqeQfHO8eb
 mhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYALVNSKEvMKQUKBSQWFyvp29kU5ZeWpCpk5BeX2Cql
 FqTkFJgX6BUn5haX5qXr5aWWWBkaGBiZAhUmZGf0bTzOXDBTomLB0b1sDYzzxbsYOTkkBEwk
 Pnycy9LFyMUhJLCDUeJD2x7mLkYODl4BQYm/O4RBaoQF8iWWHlvGCmILCShITG3ZxAYR15I4
 vvQ/E4jNJqAh8eX+L3YQW0QgXGL+8h3sIDOZBaYySnx7soEFYhmvxIz2p1C2tMT25VsZIWwN
 iR/LepkhbFGJm6vfssPY74/Nh6oRkWi9dxaqRlDiwc/dUHFJiZ0tC6Hi+RIPzz9iBVksIdDC
 KHF6zhSoIn2JbX9mgy3mFfCVaDt9GCzOIqAqsfHTJnaQhyUEXCTm3wsCCTMLaEssW/gaHA7M
 ApoS63fpQ1QoSxy5xQJRwSfRcfgvO8xXO+Y9YYKwVSRWz90HdY2UxJwVk6AO8JDYOh3CFhII
 lPjUs5BtAqPCLERAz0KydxbC3gWMzKsYxVILinPTU4uNCozgcZucn7uJEZzstNx2ME55+0Hv
 ECMTB+MhRgkOZiUR3nmp6ulCvCmJlVWpRfnxRaU5qcWHGE2BHp7ILCWanA9Mt3kl8YYmlgYm
 ZmaG5kamBuZK4rz3WuemCAmkJ5akZqemFqQWwfQxcXBKNTAl1mdpxFziXMybYaSUssDu5a6t
 zd9Fi1uWbN7oN3NT5q/iNSeX730f2eWiFn2rMstt5iOV6etOrluUfPISw7Mqq8zXTxzcJupZ
 Wjg22DcatHNOSPxa91Iv2rr/flz0nhDDqjmLWeN+brx09J/qJaYNp5yOz+19bOk52/RVsRH3
 rw83smYpJzu/FbudfGs3z7JL5llXd8QsWH760b97dVYfzz7fInG5VXynvpiB2EKR5tDMUzxp
 u71Ng1fOvXyK8XfH03dLFje4Hf11szPNb/H//Fnm29M1jk1yiXz/q6Xt39NZHU2uX4wfWPH9
 t7LcZDM5SNGdXcL/huW50wq7G4Nv7z/7wMKsxkp/fv2Uc8GTlFiKMxINtZiLihMBxHUz2/8D
 AAA=
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241104033115epcms2p2867a532b5cdb012b1612931597cedf4a
References: <CGME20241104033115epcms2p2867a532b5cdb012b1612931597cedf4a@epcms2p2>
X-Spam-Score: -2.8 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > Jinsu Lee reported aperformance regression issue, after
 commit > 5c8764f8679e ("f2fs: fixto force buffered IO on inline_data > inode"),
 we forced directwrite to use buffered IO on inline_data > inod [...] 
 Content analysis details:   (-2.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.24 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.24 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t7noJ-0005TH-Nl
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid forcing direct write to
 use buffered IO on inline_data ino
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
Reply-To: jinsu1.lee@samsung.com
Cc: "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

PiBKaW5zdSBMZWUgcmVwb3J0ZWQgYXBlcmZvcm1hbmNlIHJlZ3Jlc3Npb24gaXNzdWUsIGFmdGVy
IGNvbW1pdAo+IDVjODc2NGY4Njc5ZSAoImYyZnM6IGZpeHRvIGZvcmNlIGJ1ZmZlcmVkIElPIG9u
IGlubGluZV9kYXRhCj4gaW5vZGUiKSwgd2UgZm9yY2VkIGRpcmVjdHdyaXRlIHRvIHVzZSBidWZm
ZXJlZCBJTyBvbiBpbmxpbmVfZGF0YQo+IGlub2RlLCBpdCB3aWxsIGNhdXNlcGVyZm9ybWFjZSBy
ZWdyZXNzaW9uIGR1ZSB0byBtZW1vcnkgY29weQo+IGFuZCBkYXRhIGZsdXNoLgrCoA0KPiBJdCdz
IGZpbmUgdG8gbm90IGZvcmNlIGRpcmVjdHdyaXRlIHRvIHVzZSBidWZmZXJlZCBJTywgYXMgaXQN
Cj4gY2FuIGNvbnZlcnQgaW5saW5lIGlub2RlYmVmb3JlIGNvbW1pdHRpbmcgZGlyZWN0IHdyaXRl
IElPLg0KwqANCj4gRml4ZXM6IDVjODc2NGY4Njc5ZSgiZjJmczogZml4IHRvIGZvcmNlIGJ1ZmZl
cmVkIElPIG9uIGlubGluZV9kYXRhIGlub2RlIikNCj4gUmVwb3J0ZWQtYnk6IEppbnN1IExlZTxq
aW5zdTEubGVlQHNhbXN1bmcuY29tPg0KPiBDbG9zZXM6aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGludXgtZjJmcy1kZXZlbC9hZjAzZGQyYy1lMzYxLTRmODAtYjJmZC0zOTQ0MDc2NmNmNmVAa2Vy
bmVsLm9yZw0KPiBTaWduZWQtb2ZmLWJ5OiBDaGFvIFl1PGNoYW9Aa2VybmVsLm9yZz4NCj4gLS0t
DQo+IGZzL2YyZnMvZmlsZS5jIDYgKysrKystDQo+IDEgZmlsZSBjaGFuZ2VkLCA1aW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQ0KwqANCj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZmlsZS5jYi9m
cy9mMmZzL2ZpbGUuYw0KPiBpbmRleDBlN2EwMTk1ZWNhOC4uMzc3YTEwYjgxYmYzIDEwMDY0NA0K
PiAtLS0gYS9mcy9mMmZzL2ZpbGUuYw0KPiArKysgYi9mcy9mMmZzL2ZpbGUuYw0KPiBAQCAtODgz
LDcgKzg4MywxMSBAQCBzdGF0aWNib29sIGYyZnNfZm9yY2VfYnVmZmVyZWRfaW8oc3RydWN0IGlu
b2RlICppbm9kZSwgaW50IHJ3KQ0KPsKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiB0cnVlOw0KPsKg
wqDCoMKgwqBpZihmMmZzX2NvbXByZXNzZWRfZmlsZShpbm9kZSkpDQo+wqDCoMKgwqDCoMKgwqDC
oMKgcmV0dXJuIHRydWU7DQo+IC0gwqDCoMKgwqBpZiAoZjJmc19oYXNfaW5saW5lX2RhdGEoaW5v
ZGUpKQ0KPiArIMKgwqDCoMKgLyoNCj4gKyDCoMKgwqDCoCogb25seSBmb3JjZSBkaXJlY3QgcmVh
ZCB0byB1c2UgYnVmZmVyZWRJTywgZm9yIGRpcmVjdCB3cml0ZSwNCj4gKyDCoMKgwqDCoCogaXQg
ZXhwZWN0cyBpbmxpbmUgZGF0YSBjb252ZXJzaW9uIGJlZm9yZWNvbW1pdHRpbmcgSU8uDQo+ICsg
wqDCoMKgwqAqLw0KPiArIMKgwqDCoMKgaWYgKGYyZnNfaGFzX2lubGluZV9kYXRhKGlub2RlKSAm
JnJ3ID09IFJFQUQpDQrCoA0KSGksIENoYW8gWXUNClRoZSBmaW8gZGlyZWN0IHBlcmZvcm1hbmNl
IHByb2JsZW0gSSByZXBvcnRlZCBkaWQgbm90IGltcHJvdmUgd2hlbiByZWZsZWN0aW5nIHRoaXMg
Y29tbWl0Lg0KUmF0aGVyLCBpdCBoYXMgYmVlbiBpbXByb3ZlZCB3aGVuIHJlZmxlY3RpbmcgeW91
ciBjb21taXQgYmVsb3cuDQrCoA0KVGhlIHByZXZpb3VzIGNvbW1pdCBzZWVtcyB0byBiZSBtaXN0
aXRsZWQgYXMgcmVhZCBhbmQgdGhlIGZvbGxvd2luZyBjb21taXQgYXBwZWFycyB0byBiZSB0aGUg
ZmluYWwgdmVyc2lvbi7CoA0KDQogICAgY29tbWl0IDJiNmJiMGNkM2JkY2IxMTA4MTg5MzAxZWM0
ZWM3NmM4OWY5MzkzMTANCiAgICBBdXRob3I6IENoYW8gWXUgdmlhIExpbnV4LWYyZnMtZGV2ZWwg
PGxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Pg0KICAgIERhdGU6ICAgTW9u
IE5vdiA0IDA5OjM1OjUxIDIwMjQgKzA4MDANCg0KICAgICAgICBbZjJmcy1kZXZdIFtQQVRDSCB2
Ml0gZjJmczogZml4IHRvIG1hcCBibG9ja3MgY29ycmVjdGx5IGZvciBkaXJlY3Qgd3JpdGUNCg0K
DQp0aGUgcmVhc29uIGZvciB0aGUgaW1wcm92ZW1lbnQgdG8gY29tbWl0ICgyYjZiYjBjZDNiZGMp
IHNlZW1zIHRvIGJlIGJlY2F1c2Ugb2YgdGhlICJtX21heV9jcmVhdGUiIGNvbmRpdGlvbi4NCndo
ZW4gcGVyZm9ybWluZyAiaW9fc3VibWl0IiBkaXJlY3RseSwgc28gcGVyZm9ybWFuY2UgcmVncmVz
c2lvbiBpc3N1ZSBtYXkgb2NjdXIuDQoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZz
LWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5l
dC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
