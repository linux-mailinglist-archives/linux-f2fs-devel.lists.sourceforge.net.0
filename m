Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DC590FD9C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Jun 2024 09:23:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sKC8u-00060u-Hs;
	Thu, 20 Jun 2024 07:23:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daejun7.park@samsung.com>) id 1sKC8s-00060n-AX
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Jun 2024 07:23:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:In-Reply-To:CC:To:From:Sender:Reply-To:Subject:Mime-Version:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZMD+eUNPkTvI8EzE/tK4EjSojliihh5xZOfubO866Oo=; b=Abk6rvdZwdblBgw4VmzNbp5xMC
 BDs3tyyhG1dpuaJ3gs67TIKtaV6FCVmFvpdc7kPgJrePgwg9nFq9lpUcXKJs1STEsYUw6xM52bPcQ
 EsZOtVIRLY2QrtNcdvT8EXZTn95gZYZW25KFKSeVNNeEkponTQ1yXEWz4vEtKsUApdZw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:
 In-Reply-To:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZMD+eUNPkTvI8EzE/tK4EjSojliihh5xZOfubO866Oo=; b=khZSgTPRrurKXubDKmzojEkGeC
 HvtDyIWhaYqqFMAgvfFgWoRT0Sl3tqx8zYXfxRENSodINRCKEUkm+ibybXfv3qukcbMEq1cgnhFml
 YHQMgMG+2wxUeLkGLKKhM7/dhZqn8aKLfVL7qWRoSfNpIBA43LRr7JSGKhxf8qDcri3Q=;
Received: from mailout4.samsung.com ([203.254.224.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sKC8q-0007Sx-VY for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Jun 2024 07:23:33 +0000
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20240620072320epoutp04482ec6d09a5a0955d269e95ed9299056~apYVhxsde1648816488epoutp04z
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 20 Jun 2024 07:23:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20240620072320epoutp04482ec6d09a5a0955d269e95ed9299056~apYVhxsde1648816488epoutp04z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1718868200;
 bh=ZMD+eUNPkTvI8EzE/tK4EjSojliihh5xZOfubO866Oo=;
 h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
 b=HrXN57BFujvL90h6J0Tcs71hrVG6wMVDDYh62Gymxa1qvaX6Dp+I1F5dqtf7HcD4X
 6HN30EnSZYdNvKWTbqrypenC70W+bi2x9KFpzKngWwV926cIKSfmruj06o6rqR/W8c
 BFL3EmB0zsKaCvmAFKb6O1Dp7GfoVJB92zFkn4gA=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTP id
 20240620072319epcas2p4fa0015bca03ed230be409c525e8b0e64~apYVLDKDS0981009810epcas2p4T;
 Thu, 20 Jun 2024 07:23:19 +0000 (GMT)
Received: from epsmgec2p1.samsung.com (unknown [182.195.36.92]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4W4X5g2J23z4x9QF; Thu, 20 Jun
 2024 07:23:19 +0000 (GMT)
X-AuditID: b6c32a43-993ff7000000dbb1-7e-6673d8e7222d
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
 epsmgec2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 50.DD.56241.7E8D3766; Thu, 20 Jun 2024 16:23:19 +0900 (KST)
Mime-Version: 1.0
From: Daejun Park <daejun7.park@samsung.com>
To: Chao Yu <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 Wenjie Cheng <cwjhust@gmail.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <e2371e59-7be5-40dc-9a2a-aef90ac93b18@kernel.org>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20240620072218epcms2p11597e482b28804dd5f66b9d42a21b22f@epcms2p1>
Date: Thu, 20 Jun 2024 16:22:18 +0900
X-CMS-MailID: 20240620072218epcms2p11597e482b28804dd5f66b9d42a21b22f
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-CPGSPASS: Y
X-CPGSPASS: Y
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgk+LIzCtJLcpLzFFi42LZdljTXPf5jeI0gw1LBCxOTz3LZPHykKZF
 z6Y1LBarHoRbPFk/i9ni0iJ3i8u75rBZXFt+l9GBw2PnrLvsHptWdbJ57F7wmcmjb8sqRo/P
 m+QCWKOybTJSE1NSixRS85LzUzLz0m2VvIPjneNNzQwMdQ0tLcyVFPISc1NtlVx8AnTdMnOA
 DlFSKEvMKQUKBSQWFyvp29kU5ZeWpCpk5BeX2CqlFqTkFJgX6BUn5haX5qXr5aWWWBkaGBiZ
 AhUmZGe87Z/PXtCjWtHZ/o2xgfGXUhcjJ4eEgInEynkXWbsYuTiEBHYwSiz58oOxi5GDg1dA
 UOLvDmGQGmGBTIln724xgthCAkoS6y/OYoeI60ncergGLM4moCMx/cR9sLiIQI7E+/Yj7CAz
 mQVeM0rcbd/MArGMV2JG+1MoW1pi+/KtYM2cAnYSl3++ZoaIa0j8WNYLZYtK3Fz9lh3Gfn9s
 PiOELSLReu8sVI2gxIOfu6HikhK3526Cqs+X+H9lOZRdI7HtwDwoW1/iWsdGsBt4BXwlvm56
 wQZiswioSvSv3s8GUeMicefECbAaZgFtiWULQW7jALI1Jdbv0gcxJQSUJY7cgqrgk+g4/Jcd
 5sOGjb+xsnfMe8IEYatJrPu5nmkCo/IsREDPQrJrFsKuBYzMqxjFUguKc9NTk40KDOFxm5yf
 u4kRnCS1nHcwXpn/T+8QIxMH4yFGCQ5mJRHe511FaUK8KYmVValF+fFFpTmpxYcYTYG+nMgs
 JZqcD0zTeSXxhiaWBiZmZobmRqYG5krivPda56YICaQnlqRmp6YWpBbB9DFxcEo1MPluXcl6
 yabV53co+9Ywf81laSESrKlveAuWLrhgHbcia/vtJcJdD+rXJNkbSRmtM95uf+3mL8HWTcf3
 /fao21Gz7p37pgaXS2tPrAkPtFrOoF3Qznbv+VkBjYPVC5n7vp/e0rZLg0/XkPVhMetB5W2r
 b4ikrTlQobGvZ/V2l+1z/mkuensyulqR8/DXF6afOVSUZmu87ztxyuvF/ve/vx9W+CJtNv+B
 4+JnWqcWO2m/PGryrqRsL4/6wbDD6lv9FnUs9Ux8k9IWWl7dP9XN4uasDfd/vp1fx3DUU3vx
 r90TFFLdy1dq3VY92MLy/JQVv8APydzI4Nv7LhRbnLsSl7SZ2UBGbq9R4t0v//+lbLupxFKc
 kWioxVxUnAgANMXXyRsEAAA=
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240620032223epcas2p4d6b770a8e256d140e5296df8a386418e
References: <e2371e59-7be5-40dc-9a2a-aef90ac93b18@kernel.org>
 <2842767c-db80-407b-a5e5-2b9fa74b0d79@kernel.org>
 <20240614004841.103114-1-cwjhust@gmail.com>
 <20240620055648epcms2p11b9914d40f560fb02fa241a7d2599298@epcms2p1>
 <CGME20240620032223epcas2p4d6b770a8e256d140e5296df8a386418e@epcms2p1>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  >On 2024/6/20 13:56, Daejun Park wrote: >> Hi Chao, >> >>>
 Jaegeuk, >>> >>> Quoted commit message from commit c550e25bca66 ("f2fs: use
 flush command >>> instead of FUA for zoned device") >>> " >>> The [...] 
 Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
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
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sKC8q-0007Sx-VY
Subject: Re: [f2fs-dev] (2) (2) [PATCH] Revert "f2fs: use flush command
 instead of FUA for zoned device"
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
Cc: "qwjhust@gmail.com" <qwjhust@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Pk9uIDIwMjQvNi8yMCAxMzo1NiwgRGFlanVuIFBhcmsgd3JvdGU6Cj4+IEhpIENoYW8sCj4+Cj4+
PiBKYWVnZXVrLAo+Pj4KPj4+IFF1b3RlZCBjb21taXQgbWVzc2FnZSBmcm9tIGNvbW1pdCBjNTUw
ZTI1YmNhNjYgKCJmMmZzOiB1c2UgZmx1c2ggY29tbWFuZAo+Pj4gaW5zdGVhZCBvZiBGVUEgZm9y
IHpvbmVkIGRldmljZSIpCj4+PiAiCj4+PiBUaGUgYmxvY2sgbGF5ZXIgZm9yIHpvbmVkIGRpc2sg
Y2FuIHJlb3JkZXIgdGhlIEZVQSdlZCBJT3MuIExldCdzIHVzZSBmbHVzaAo+Pj4gY29tbWFuZCB0
byBrZWVwIHRoZSB3cml0ZSBvcmRlci4KPj4+ICIKPj4+Cj4+PiBJdCBzZWVtcyBtcS1kZWFkbGlu
ZSB1c2UgZmlmbyBxdWV1ZSBhbmQgbWFrZSBxdWV1ZSBkZXB0aCBvZiB6b25lIGRldmljZQo+Pj4g
YXMgMSB0byBJTyBvcmRlciwgc28gd2h5IEZVQSdlZCB3cml0ZSBub2RlIElPcyBjYW4gYmUgcmVv
cmRlcmVkIGJ5IGJsb2NrCj4+PiBsYXllcj8KPj4KPj4gV2hpbGUgb3RoZXIgd3JpdGVzIGFyZSBh
bGlnbmVkIGJ5IHRoZSBtcS1kZWFkbGluZSwgd3JpdGUgd2l0aCBGVUEgaXMgbm90IHBhc3NlZAo+
PiB0byB0aGUgc2NoZWR1bGVyIGJ1dCBoYW5kbGVkIGF0IHRoZSBibG9jayBsYXllci4KPgo+SGkg
RGFlanVuLAo+Cj5JSVVDLCBkbyB5b3UgbWVhbiB3cml0ZSB3LyBGVUEgbWF5IGJlIGhhbmRsZWQg
ZGlyZWN0bHkgaW4gYmVsb3cgcGF0aD8KPgo+LSBibGtfbXFfc3VibWl0X2Jpbwo+wqAgLSBvcF9p
c19mbHVzaCAmJiBibGtfaW5zZXJ0X2ZsdXNoDQoNCkhpIENoYW8sDQoNClllcywgSSB0aGluayB0
aGUgcGF0aCBjYXVzZWQgYW4gdW5hbGlnbmVkIHdyaXRlIHdoZW4gdGhlIHpvbmUgbG9jayB3YXMN
CmJlaW5nIGFwcGxpZWQgYnkgbXEtZGVhZGxpbmUuDQoNCj4NCj5UaGFua3MsDQo+DQo+Pg0KPj4g
VGhhbmtzLA0KPj4gRGFlanVuDQo+Pg0KPj4+DQo+Pj4gVGhhbmtzLA0KPj4+DQo+Pj4gT24gMjAy
NC82LzE0IDg6NDgsIFdlbmppZSBDaGVuZyB3cm90ZToNCj4+Pj4gVGhpcyByZXZlcnRzIGNvbW1p
dCBjNTUwZTI1YmNhNjYwZWQyNTU0Y2JiNDhkMzJiODJkMGJiOThlNGIxLg0KPj4+Pg0KPj4+PiBD
b21taXQgYzU1MGUyNWJjYTY2MGVkMjU1NGNiYjQ4ZDMyYjgyZDBiYjk4ZTRiMSAoImYyZnM6IHVz
ZSBmbHVzaA0KPj4+PiBjb21tYW5kIGluc3RlYWQgb2YgRlVBIGZvciB6b25lZCBkZXZpY2UiKSB1
c2VkIGFkZGl0aW9uYWwgZmx1c2gNCj4+Pj4gY29tbWFuZCB0byBrZWVwIHdyaXRlIG9yZGVyLg0K
Pj4+Pg0KPj4+PiBTaW5jZSBDb21taXQgZGQyOTFkNzdjYzkwZWI2YTg2ZTk4NjBiYThlNmUzOGVl
YmQ1N2QxMiAoImJsb2NrOg0KPj4+PiBJbnRyb2R1Y2Ugem9uZSB3cml0ZSBwbHVnZ2luZyIpIGhh
cyBlbmFibGVkIHRoZSBibG9jayBsYXllciB0bw0KPj4+PiBoYW5kbGUgdGhpcyBvcmRlciBpc3N1
ZSwgdGhlcmUgaXMgbm8gbmVlZCB0byB1c2UgZmx1c2ggY29tbWFuZC4NCj4+Pj4NCj4+Pj4gU2ln
bmVkLW9mZi1ieTogV2VuamllIENoZW5nIDxjd2podXN0QGdtYWlsLmNvbT4NCj4+Pj4gLS0tDQo+
Pj4+wqAgwqAgZnMvZjJmcy9maWxlLmMgMyArLS0NCj4+Pj7CoCDCoCBmcy9mMmZzL25vZGUuYyAy
ICstDQo+Pj4+wqAgwqAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pDQo+Pj4+DQo+Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2ZpbGUuYyBiL2ZzL2YyZnMv
ZmlsZS5jDQo+Pj4+IGluZGV4IGVhZTJlNzkwODA3Mi4uZjA4ZTYyMDhlMTgzIDEwMDY0NA0KPj4+
PiAtLS0gYS9mcy9mMmZzL2ZpbGUuYw0KPj4+PiArKysgYi9mcy9mMmZzL2ZpbGUuYw0KPj4+PiBA
QCAtMzcyLDggKzM3Miw3IEBAIHN0YXRpYyBpbnQgZjJmc19kb19zeW5jX2ZpbGUoc3RydWN0IGZp
bGUgKmZpbGUsIGxvZmZfdCBzdGFydCwgbG9mZl90IGVuZCwNCj4+Pj7CoCDCoCDCoCDCoCDCoCDC
oCDCoGYyZnNfcmVtb3ZlX2lub19lbnRyeShzYmksIGlubywgQVBQRU5EX0lOTyk7DQo+Pj4+wqAg
wqAgwqAgwqAgwqAgwqAgwqBjbGVhcl9pbm9kZV9mbGFnKGlub2RlLCBGSV9BUFBFTkRfV1JJVEUp
Ow0KPj4+PsKgIMKgIGZsdXNoX291dDoNCj4+Pj4gLSDCoCDCoCDCoCDCoGlmICgoIWF0b21pYyAm
JiBGMkZTX09QVElPTihzYmkpLmZzeW5jX21vZGUgIT0gRlNZTkNfTU9ERV9OT0JBUlJJRVIpDQo+
Pj4+IC0gwqAgwqAgwqAgwqDCoCDCoCAoYXRvbWljICYmICF0ZXN0X29wdChzYmksIE5PQkFSUklF
UikgJiYgZjJmc19zYl9oYXNfYmxrem9uZWQoc2JpKSkpDQo+Pj4+ICsgwqAgwqAgwqAgwqBpZiAo
IWF0b21pYyAmJiBGMkZTX09QVElPTihzYmkpLmZzeW5jX21vZGUgIT0gRlNZTkNfTU9ERV9OT0JB
UlJJRVIpDQo+Pj4+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXQgPSBmMmZzX2lz
c3VlX2ZsdXNoKHNiaSwgaW5vZGUtPmlfaW5vKTsNCj4+Pj7CoCDCoCDCoCDCoCDCoCDCoCDCoGlm
ICghcmV0KSB7DQo+Pj4+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBmMmZzX3JlbW92
ZV9pbm9fZW50cnkoc2JpLCBpbm8sIFVQREFURV9JTk8pOw0KPj4+PiBkaWZmIC0tZ2l0IGEvZnMv
ZjJmcy9ub2RlLmMgYi9mcy9mMmZzL25vZGUuYw0KPj4+PiBpbmRleCAxNDRmOWY5NjY2OTAuLmM0
NWQzNDFkY2Y2ZSAxMDA2NDQNCj4+Pj4gLS0tIGEvZnMvZjJmcy9ub2RlLmMNCj4+Pj4gKysrIGIv
ZnMvZjJmcy9ub2RlLmMNCj4+Pj4gQEAgLTE2MzEsNyArMTYzMSw3IEBAIHN0YXRpYyBpbnQgX193
cml0ZV9ub2RlX3BhZ2Uoc3RydWN0IHBhZ2UgKnBhZ2UsIGJvb2wgYXRvbWljLCBib29sICpzdWJt
aXR0ZWQsDQo+Pj4+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBnb3RvIHJlZGlydHlf
b3V0Ow0KPj4+PsKgIMKgIMKgIMKgIMKgIMKgIMKgfQ0KPj4+PsKgDQo+Pj4+IC0gwqAgwqAgwqAg
wqBpZiAoYXRvbWljICYmICF0ZXN0X29wdChzYmksIE5PQkFSUklFUikgJiYgIWYyZnNfc2JfaGFz
X2Jsa3pvbmVkKHNiaSkpDQo+Pj4+ICsgwqAgwqAgwqAgwqBpZiAoYXRvbWljICYmICF0ZXN0X29w
dChzYmksIE5PQkFSUklFUikpDQo+Pj4+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBm
aW8ub3BfZmxhZ3MgPSBSRVFfUFJFRkxVU0ggUkVRX0ZVQTsNCj4+Pj7CoA0KPj4+PsKgIMKgIMKg
IMKgIMKgIMKgIMKgLyogc2hvdWxkIGFkZCB0byBnbG9iYWwgbGlzdCBiZWZvcmUgY2xlYXJpbmcg
UEFHRUNBQ0hFIHN0YXR1cyAqLwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2
ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xp
c3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
