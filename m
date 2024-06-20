Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F8090FE1C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Jun 2024 09:58:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sKCg4-0006re-BF;
	Thu, 20 Jun 2024 07:57:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daejun7.park@samsung.com>) id 1sKCg2-0006rW-LJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Jun 2024 07:57:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:In-Reply-To:CC:To:From:Sender:Reply-To:Subject:Mime-Version:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VsPlIU7z0WQN6dg2eoLZqUdIRcUYZOwLQUQxBDukr0Y=; b=TksPgAaFN1HjTwkiES75MlAoq6
 IRgAbpjmNhN1NIF9k7cSliAbjT/AC56xqzPZOcGEjTCH+w1ShORG/19kYD6I7B08w4kzpNimAJYuu
 l+GdfcPgzojtKBqgHKjBvrwv9YYP7NRGAq3q2BXB1hXJqN9/xd78xl/6sRjuX9sI+x2g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:
 In-Reply-To:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VsPlIU7z0WQN6dg2eoLZqUdIRcUYZOwLQUQxBDukr0Y=; b=QRNG+rj/dLopGYbnDgJHcOmpYH
 aRbgEvSVyqSuC/sh/2x3PBFZiBBxNSJV8iNGNGb9079itYJ26m7Ssvw9f9xCV/VA6CsavKEY3h/wJ
 sMPTiNAYnXXPFwJQJuxgcqxSoBC6aEt5uhsgRs0ighjc3atrOq84dUOg6xF6ncuPFkRc=;
Received: from mailout1.samsung.com ([203.254.224.24])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sKCg1-0000sq-D2 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Jun 2024 07:57:50 +0000
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20240620075736epoutp0155411358451c7385ca44c0096b20d93b~ap2QhGd8H0950109501epoutp01G
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 20 Jun 2024 07:57:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20240620075736epoutp0155411358451c7385ca44c0096b20d93b~ap2QhGd8H0950109501epoutp01G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1718870256;
 bh=VsPlIU7z0WQN6dg2eoLZqUdIRcUYZOwLQUQxBDukr0Y=;
 h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
 b=XZOCJOrUJU4oTwe98SqmcCOZMT2orLjDD2CRD48hcryKbu4UZ7ekbnuyz8pPcGbQJ
 vUesmcNgN5QenwKuQIztxKaj3LilOclXiyTXFK4jpNWsTnqGx9hCnEFseE0eKMu+/c
 iPmQh9iKI6c8nDmtuGBB+9KNCAhmlFzZw1+GuiyA=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTP id
 20240620075735epcas2p42abbc68a264c94163020bcc386ccd3e5~ap2QJLKgP1106411064epcas2p4J;
 Thu, 20 Jun 2024 07:57:35 +0000 (GMT)
Received: from epsmgec2p1-new.samsung.com (unknown [182.195.36.92]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4W4XsC223zz4x9QL; Thu, 20 Jun
 2024 07:57:35 +0000 (GMT)
X-AuditID: b6c32a4d-001ff700000262f0-7d-6673e0eff6ad
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
 epsmgec2p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
 22.C5.25328.FE0E3766; Thu, 20 Jun 2024 16:57:35 +0900 (KST)
Mime-Version: 1.0
From: Daejun Park <daejun7.park@samsung.com>
To: Chao Yu <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 Wenjie Cheng <cwjhust@gmail.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <e0d89f10-19b0-45db-948d-4c140c2dffa7@kernel.org>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20240620075634epcms2p35d3bafffb5f60902b1df25bf3269a686@epcms2p3>
Date: Thu, 20 Jun 2024 16:56:34 +0900
X-CMS-MailID: 20240620075634epcms2p35d3bafffb5f60902b1df25bf3269a686
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-CPGSPASS: Y
X-CPGSPASS: Y
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmk+LIzCtJLcpLzFFi42LZdljTXPf9g+I0g3sHOS1OTz3LZPHykKZF
 z6Y1LBarHoRbPFk/i9ni0iJ3i8u75rBZXFt+l9GBw2PnrLvsHptWdbJ57F7wmcmjb8sqRo/P
 m+QCWKOybTJSE1NSixRS85LzUzLz0m2VvIPjneNNzQwMdQ0tLcyVFPISc1NtlVx8AnTdMnOA
 DlFSKEvMKQUKBSQWFyvp29kU5ZeWpCpk5BeX2CqlFqTkFJgX6BUn5haX5qXr5aWWWBkaGBiZ
 AhUmZGdcmJ5b0KVTsfp7J2sD43XNLkZODgkBE4kVv1YwdTFycQgJ7GGUONc0ibmLkYODV0BQ
 4u8OYZAaYYFcieOfrrOB2EICShLrL85ih4jrSdx6uIYRxGYT0JGYfuI+WFxEIEfiffsRdpCZ
 zAKvGSXutm9mgVjGKzGj/SmULS2xfflWsGZOATuJJ8sXMUHENSR+LOtlhrBFJW6ufssOY78/
 Np8RwhaRaL13FqpGUOLBz91QcUmJ23M3QdXnS/y/shzKrpHYdmAelK0vca1jI9gNvAK+Else
 3wSzWQRUJZ7tPgZV4yJxZskeVhCbWUBbYtnC1+AwYRbQlFi/Sx/ElBBQljhyiwWigk+i4/Bf
 dpgPGzb+xsreMe8J1IdqEut+rmeawKg8CxHQs5DsmoWwawEj8ypGqdSC4tz01GSjAkPdvNRy
 ePQm5+duYgSnSi3fHYyv1//VO8TIxMF4iFGCg1lJhPd5V1GaEG9KYmVValF+fFFpTmrxIUZT
 oE8nMkuJJucDk3VeSbyhiaWBiZmZobmRqYG5kjjvvda5KUIC6YklqdmpqQWpRTB9TBycUg1M
 5QFvmQ8L7foxzXat9T+LfYU2/PISjkXr5baq/dK5rWrzJ1jzyc7L2gYX1f7dWLUqv7E/zqt9
 c7vwyjshgZXPJeZY6B06sF7nic70qjdvrtjYJT8NMZGvbbwQ9Usx45K2JQP7+xQ37pM+m0xr
 d93xVZxuoNDfMud4BWPqtkUWN3y7trHULZz0+hiHcFvGhPvfi/Km/uztW3/SqdjVyVKb9/Lu
 L1qX102c+PWG5J7yFwzBd3bxJQlyfntYt4vHOTlpWb2uTvOhOvU/OX1xn7zaerW2uPv0NLC0
 cV1uauqrWHHoh7vvJ3/hCaZOCa9CFuqX7On1nNafa/Nz7ZOyuZynFY7eYxO8WCJxPOf1s2dK
 LMUZiYZazEXFiQA3y0vvHgQAAA==
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240620032223epcas2p4d6b770a8e256d140e5296df8a386418e
References: <e0d89f10-19b0-45db-948d-4c140c2dffa7@kernel.org>
 <e2371e59-7be5-40dc-9a2a-aef90ac93b18@kernel.org>
 <2842767c-db80-407b-a5e5-2b9fa74b0d79@kernel.org>
 <20240614004841.103114-1-cwjhust@gmail.com>
 <20240620055648epcms2p11b9914d40f560fb02fa241a7d2599298@epcms2p1>
 <20240620072218epcms2p11597e482b28804dd5f66b9d42a21b22f@epcms2p1>
 <CGME20240620032223epcas2p4d6b770a8e256d140e5296df8a386418e@epcms2p3>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  >On 2024/6/20 15:22,
 Daejun Park wrote: >>> On 2024/6/20 13:56, 
 Daejun Park wrote: >>>> Hi Chao, >>>> >>>>> Jaegeuk, >>>>> >>>>> Quoted commit
 message from commit c550e25bca66 ("f2fs: use flush comman [...] 
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
 [203.254.224.24 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [203.254.224.24 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.24 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sKCg1-0000sq-D2
Subject: Re: [f2fs-dev] (2) (2) (2) [PATCH] Revert "f2fs: use flush command
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

Pk9uIDIwMjQvNi8yMCAxNToyMiwgRGFlanVuIFBhcmsgd3JvdGU6Cj4+PiBPbiAyMDI0LzYvMjAg
MTM6NTYsIERhZWp1biBQYXJrIHdyb3RlOgo+Pj4+IEhpIENoYW8sCj4+Pj4KPj4+Pj4gSmFlZ2V1
aywKPj4+Pj4KPj4+Pj4gUXVvdGVkIGNvbW1pdCBtZXNzYWdlIGZyb20gY29tbWl0IGM1NTBlMjVi
Y2E2NiAoImYyZnM6IHVzZSBmbHVzaCBjb21tYW5kCj4+Pj4+IGluc3RlYWQgb2YgRlVBIGZvciB6
b25lZCBkZXZpY2UiKQo+Pj4+PiAiCj4+Pj4+IFRoZSBibG9jayBsYXllciBmb3Igem9uZWQgZGlz
ayBjYW4gcmVvcmRlciB0aGUgRlVBJ2VkIElPcy4gTGV0J3MgdXNlIGZsdXNoCj4+Pj4+IGNvbW1h
bmQgdG8ga2VlcCB0aGUgd3JpdGUgb3JkZXIuCj4+Pj4+ICIKPj4+Pj4KPj4+Pj4gSXQgc2VlbXMg
bXEtZGVhZGxpbmUgdXNlIGZpZm8gcXVldWUgYW5kIG1ha2UgcXVldWUgZGVwdGggb2Ygem9uZSBk
ZXZpY2UKPj4+Pj4gYXMgMSB0byBJTyBvcmRlciwgc28gd2h5IEZVQSdlZCB3cml0ZSBub2RlIElP
cyBjYW4gYmUgcmVvcmRlcmVkIGJ5IGJsb2NrCj4+Pj4+IGxheWVyPwo+Pj4+Cj4+Pj4gV2hpbGUg
b3RoZXIgd3JpdGVzIGFyZSBhbGlnbmVkIGJ5IHRoZSBtcS1kZWFkbGluZSwgd3JpdGUgd2l0aCBG
VUEgaXMgbm90IHBhc3NlZAo+Pj4+IHRvIHRoZSBzY2hlZHVsZXIgYnV0IGhhbmRsZWQgYXQgdGhl
IGJsb2NrIGxheWVyLgo+Pj4KPj4+IEhpIERhZWp1biwKPj4+Cj4+PiBJSVVDLCBkbyB5b3UgbWVh
biB3cml0ZSB3LyBGVUEgbWF5IGJlIGhhbmRsZWQgZGlyZWN0bHkgaW4gYmVsb3cgcGF0aD8KPj4+
Cj4+PiAtIGJsa19tcV9zdWJtaXRfYmlvCj4+PsKgIMKgIC0gb3BfaXNfZmx1c2ggJiYgYmxrX2lu
c2VydF9mbHVzaA0KPj4NCj4+IEhpIENoYW8sDQo+Pg0KPj4gWWVzLCBJIHRoaW5rIHRoZSBwYXRo
IGNhdXNlZCBhbiB1bmFsaWduZWQgd3JpdGUgd2hlbiB0aGUgem9uZSBsb2NrIHdhcw0KPj4gYmVp
bmcgYXBwbGllZCBieSBtcS1kZWFkbGluZS4NCj4NCj5CdXQsIGJsa19pbnNlcnRfZmx1c2goKSBt
YXkgcmV0dXJuIGZhbHNlIGR1ZSB0byBwb2xpY3kgc2hvdWxkIGJlDQo+UkVRX0ZTRVFfREFUQSBv
ciBSRVFfRlNFUV9EQVRBIFJFUV9GU0VRX1BPU1RGTFVTSCwgdGhlbg0KPmJsa19tcV9pbnNlcnRf
cmVxdWVzdCgpIGFmdGVyIGJsa19pbnNlcnRfZmx1c2goKSB3aWxsIGJlIGNhbGxlZD8NCj4NCg0K
SSB3YXMganVzdCBkaXNjdXNzaW5nIHRoZSBoYW5kbGluZyBvZiBGVUFzIGluIGNvbW1pdCBjNTUw
ZTI1YmNhNjYsDQp3aGljaCBpcyBub3QgYW4gaXNzdWUgaW4gdGhlIGN1cnJlbnQgY29kZSBhcyBG
VUFzIGFyZSBoYW5kbGVkIGNvcnJlY3RseS4NCg0KVGhhbmtzLA0KDQoNCj5UaGFua3MsDQo+DQo+
Pg0KPj4+DQo+Pj4gVGhhbmtzLA0KPj4+DQo+Pj4+DQo+Pj4+IFRoYW5rcywNCj4+Pj4gRGFlanVu
DQo+Pj4+DQo+Pj4+Pg0KPj4+Pj4gVGhhbmtzLA0KPj4+Pj4NCj4+Pj4+IE9uIDIwMjQvNi8xNCA4
OjQ4LCBXZW5qaWUgQ2hlbmcgd3JvdGU6DQo+Pj4+Pj4gVGhpcyByZXZlcnRzIGNvbW1pdCBjNTUw
ZTI1YmNhNjYwZWQyNTU0Y2JiNDhkMzJiODJkMGJiOThlNGIxLg0KPj4+Pj4+DQo+Pj4+Pj4gQ29t
bWl0IGM1NTBlMjViY2E2NjBlZDI1NTRjYmI0OGQzMmI4MmQwYmI5OGU0YjEgKCJmMmZzOiB1c2Ug
Zmx1c2gNCj4+Pj4+PiBjb21tYW5kIGluc3RlYWQgb2YgRlVBIGZvciB6b25lZCBkZXZpY2UiKSB1
c2VkIGFkZGl0aW9uYWwgZmx1c2gNCj4+Pj4+PiBjb21tYW5kIHRvIGtlZXAgd3JpdGUgb3JkZXIu
DQo+Pj4+Pj4NCj4+Pj4+PiBTaW5jZSBDb21taXQgZGQyOTFkNzdjYzkwZWI2YTg2ZTk4NjBiYThl
NmUzOGVlYmQ1N2QxMiAoImJsb2NrOg0KPj4+Pj4+IEludHJvZHVjZSB6b25lIHdyaXRlIHBsdWdn
aW5nIikgaGFzIGVuYWJsZWQgdGhlIGJsb2NrIGxheWVyIHRvDQo+Pj4+Pj4gaGFuZGxlIHRoaXMg
b3JkZXIgaXNzdWUsIHRoZXJlIGlzIG5vIG5lZWQgdG8gdXNlIGZsdXNoIGNvbW1hbmQuDQo+Pj4+
Pj4NCj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBXZW5qaWUgQ2hlbmcgPGN3amh1c3RAZ21haWwuY29t
Pg0KPj4+Pj4+IC0tLQ0KPj4+Pj4+wqAgwqAgwqAgZnMvZjJmcy9maWxlLmMgMyArLS0NCj4+Pj4+
PsKgIMKgIMKgIGZzL2YyZnMvbm9kZS5jIDIgKy0NCj4+Pj4+PsKgIMKgIMKgIDIgZmlsZXMgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPj4+Pj4+DQo+Pj4+Pj4gZGlm
ZiAtLWdpdCBhL2ZzL2YyZnMvZmlsZS5jIGIvZnMvZjJmcy9maWxlLmMNCj4+Pj4+PiBpbmRleCBl
YWUyZTc5MDgwNzIuLmYwOGU2MjA4ZTE4MyAxMDA2NDQNCj4+Pj4+PiAtLS0gYS9mcy9mMmZzL2Zp
bGUuYw0KPj4+Pj4+ICsrKyBiL2ZzL2YyZnMvZmlsZS5jDQo+Pj4+Pj4gQEAgLTM3Miw4ICszNzIs
NyBAQCBzdGF0aWMgaW50IGYyZnNfZG9fc3luY19maWxlKHN0cnVjdCBmaWxlICpmaWxlLCBsb2Zm
X3Qgc3RhcnQsIGxvZmZfdCBlbmQsDQo+Pj4+Pj7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGYyZnNf
cmVtb3ZlX2lub19lbnRyeShzYmksIGlubywgQVBQRU5EX0lOTyk7DQo+Pj4+Pj7CoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoGNsZWFyX2lub2RlX2ZsYWcoaW5vZGUsIEZJX0FQUEVORF9XUklURSk7DQo+
Pj4+Pj7CoCDCoCDCoCBmbHVzaF9vdXQ6DQo+Pj4+Pj4gLSDCoCDCoCDCoCDCoGlmICgoIWF0b21p
YyAmJiBGMkZTX09QVElPTihzYmkpLmZzeW5jX21vZGUgIT0gRlNZTkNfTU9ERV9OT0JBUlJJRVIp
DQo+Pj4+Pj4gLSDCoCDCoCDCoCDCoMKgIMKgIChhdG9taWMgJiYgIXRlc3Rfb3B0KHNiaSwgTk9C
QVJSSUVSKSAmJiBmMmZzX3NiX2hhc19ibGt6b25lZChzYmkpKSkNCj4+Pj4+PiArIMKgIMKgIMKg
IMKgaWYgKCFhdG9taWMgJiYgRjJGU19PUFRJT04oc2JpKS5mc3luY19tb2RlICE9IEZTWU5DX01P
REVfTk9CQVJSSUVSKQ0KPj4+Pj4+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBy
ZXQgPSBmMmZzX2lzc3VlX2ZsdXNoKHNiaSwgaW5vZGUtPmlfaW5vKTsNCj4+Pj4+PsKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgaWYgKCFyZXQpIHsNCj4+Pj4+PsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgZjJmc19yZW1vdmVfaW5vX2VudHJ5KHNiaSwgaW5vLCBVUERBVEVfSU5PKTsN
Cj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9ub2RlLmMgYi9mcy9mMmZzL25vZGUuYw0KPj4+
Pj4+IGluZGV4IDE0NGY5Zjk2NjY5MC4uYzQ1ZDM0MWRjZjZlIDEwMDY0NA0KPj4+Pj4+IC0tLSBh
L2ZzL2YyZnMvbm9kZS5jDQo+Pj4+Pj4gKysrIGIvZnMvZjJmcy9ub2RlLmMNCj4+Pj4+PiBAQCAt
MTYzMSw3ICsxNjMxLDcgQEAgc3RhdGljIGludCBfX3dyaXRlX25vZGVfcGFnZShzdHJ1Y3QgcGFn
ZSAqcGFnZSwgYm9vbCBhdG9taWMsIGJvb2wgKnN1Ym1pdHRlZCwNCj4+Pj4+PsKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ290byByZWRpcnR5X291dDsNCj4+Pj4+PsKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgfQ0KPj4+Pj4+wqANCj4+Pj4+PiAtIMKgIMKgIMKgIMKgaWYgKGF0b21p
YyAmJiAhdGVzdF9vcHQoc2JpLCBOT0JBUlJJRVIpICYmICFmMmZzX3NiX2hhc19ibGt6b25lZChz
YmkpKQ0KPj4+Pj4+ICsgwqAgwqAgwqAgwqBpZiAoYXRvbWljICYmICF0ZXN0X29wdChzYmksIE5P
QkFSUklFUikpDQo+Pj4+Pj7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGZpby5v
cF9mbGFncyA9IFJFUV9QUkVGTFVTSCBSRVFfRlVBOw0KPj4+Pj4+wqANCj4+Pj4+PsKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgLyogc2hvdWxkIGFkZCB0byBnbG9iYWwgbGlzdCBiZWZvcmUgY2xlYXJp
bmcgUEFHRUNBQ0hFIHN0YXR1cyAqLwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMt
ZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0
L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
