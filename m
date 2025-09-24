Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 57ACDB988F1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Sep 2025 09:33:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:References:MIME-Version:Message-ID:Date:In-Reply-To:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8X0ZUYp3LAzP5388I5a7nJLuugHNcnsmmHRHUY5qqSY=; b=XiewX6p7Ls8HUXf/ozaIjdNDzy
	imDbNN5+fU1RUvWXwe9jcrXNTsRuoyiIknorlWJ75WFX7tU8RN3H12QWtmC0OzBNBwrv5Ou2xWJdl
	sEKxum6fDaRC61jzaiHwnX6Y4wTwYXZkjaWpe7OW+3F9+CUgFxCMR3AhhkNdByzMtpyk=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v1K0L-0006m0-CF;
	Wed, 24 Sep 2025 07:33:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yunji0.kang@samsung.com>) id 1v1K0J-0006lt-Jp
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Sep 2025 07:33:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WlJ7wJPElM3wc18LxgXDPA1uOvBE4Y5qrSSvIuBgqPU=; b=Fn9iILIQQN12cS1/N0C40GTMZ1
 OUhUTqTYRGjwd0O171SZiIxhbqg9J8bwGe0LP1B0nQy8HW255g4NX8/GpY3TcNrKo3JTZfg9KW2zZ
 A2H289vSuAhSRhLKmjGgvQREVFqpVJUjUB6CtqX7n7gHzxFeKX3st4PyZ+0OfNTJGEQE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID
 :Date:Subject:In-Reply-To:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WlJ7wJPElM3wc18LxgXDPA1uOvBE4Y5qrSSvIuBgqPU=; b=AgtlfEsZuxnTWjEDagponF70AW
 4fdHok5+yggR/thX/CIFRqhN7ovhHOOo1/k7/bOBSAELAlFAu/E2gKOdZ3BlasBn5B9efzQRfw+Oa
 1cwekrQYuKlKDQSEpY3YiUm1uitEk5R0r9K55UweEJoNFiojb5fLDi9c/sQc5zdITxbI=;
Received: from mailout4.samsung.com ([203.254.224.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v1K0I-0003V7-CJ for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Sep 2025 07:33:31 +0000
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20250924073318epoutp04197676f4f54f509dad883611f78d0963~oJ5pcPrwL2752527525epoutp04c
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 24 Sep 2025 07:33:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20250924073318epoutp04197676f4f54f509dad883611f78d0963~oJ5pcPrwL2752527525epoutp04c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1758699198;
 bh=WlJ7wJPElM3wc18LxgXDPA1uOvBE4Y5qrSSvIuBgqPU=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=O+hNl3GXGik+2GkOhMQS9huZXifhJb/TA8ASBDKuuvWUP1fNi/oSWLFtGt/M8vcQV
 3VvUObN27DlhhZbbuZvrkXkN3wH5b6Qqji+CdK0orIXa+58SJUQ6oNlb4V/MTkg669
 K42uoCx0S45f095KSum7/1HCa6YOqL0CQ3zYdzSE=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPS id
 20250924073318epcas1p443b94281544243d7563664de3dc1ebe8~oJ5pHHPiN2870828708epcas1p49;
 Wed, 24 Sep 2025 07:33:18 +0000 (GMT)
Received: from epcas1p3.samsung.com (unknown [182.195.38.240]) by
 epsnrtp04.localdomain (Postfix) with ESMTP id 4cWpVP4p1Lz6B9mc; Wed, 24 Sep
 2025 07:33:17 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20250924073316epcas1p49fe9274ac2e9a2b576a57e2a373e491e~oJ5ntW95j2870828708epcas1p46;
 Wed, 24 Sep 2025 07:33:16 +0000 (GMT)
Received: from yunji0kang01 (unknown [10.253.100.171]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250924073316epsmtip1681e0b7812bd94b1fda707cfb0067197~oJ5nqK5D12247522475epsmtip1o;
 Wed, 24 Sep 2025 07:33:16 +0000 (GMT)
From: "Yunji Kang" <yunji0.kang@samsung.com>
To: "'Chao Yu'" <chao@kernel.org>, <jaegeuk@kernel.org>
In-Reply-To: <84d65c75-7ab7-4c0c-9085-9423effb8632@kernel.org>
Date: Wed, 24 Sep 2025 16:33:16 +0900
Message-ID: <055101dc2d25$7e068a70$7a139f50$@samsung.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQLJ+3fmt+QCibYu+QNx3C6/vuLkWQHN7bNGAg+MCJQBrmMzkgIJQwVOsommwKA=
Content-Language: ko
X-CMS-MailID: 20250924073316epcas1p49fe9274ac2e9a2b576a57e2a373e491e
X-Msg-Generator: CA
CMS-TYPE: 101P
cpgsPolicy: CPGSC10-711,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250918082037epcas1p1eb201d3b6d5780c0bff3ba32740ccdcf
References: <CGME20250918082037epcas1p1eb201d3b6d5780c0bff3ba32740ccdcf@epcas1p1.samsung.com>
 <20250918082023.57381-1-yunji0.kang@samsung.com>
 <89f237cd-3f86-405a-8f8f-d9cad250ef00@kernel.org>
 <00d401dc2d0a$18100c20$48302460$@samsung.com>
 <84d65c75-7ab7-4c0c-9085-9423effb8632@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > On 9/24/25 12:17,
 Yunji Kang wrote: > >>> In f2fs_precache_extents(), 
 For large files, It requires reading > >>> many node blocks. Instead of reading
 each node block with > >>> synchronous I/O, this [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.34 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v1K0I-0003V7-CJ
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: readahead node blocks in
 F2FS_GET_BLOCK_PRECACHE mode
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
Cc: 'Sungjong Seo' <sj1557.seo@samsung.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

PiBPbiA5LzI0LzI1IDEyOjE3LCBZdW5qaSBLYW5nIHdyb3RlOgo+ID4+PiBJbiBmMmZzX3ByZWNh
Y2hlX2V4dGVudHMoKSwgRm9yIGxhcmdlIGZpbGVzLCBJdCByZXF1aXJlcyByZWFkaW5nCj4gPj4+
IG1hbnkgbm9kZSBibG9ja3MuIEluc3RlYWQgb2YgcmVhZGluZyBlYWNoIG5vZGUgYmxvY2sgd2l0
aAo+ID4+PiBzeW5jaHJvbm91cyBJL08sIHRoaXMgcGF0Y2ggYXBwbGllcyByZWFkYWhlYWQgc28g
dGhhdCBub2RlIGJsb2Nrcwo+ID4+PiBjYW4gYmUgZmV0Y2hlZCBpbiBhZHZhbmNlLgo+ID4+Pgo+
ID4+PiBJdCByZWR1Y2VzIHRoZSBvdmVyaGVhZCBvZiByZXBlYXRlZCBzeW5jIHJlYWRzIGFuZCBp
bXByb3Zlcwo+ID4+PiBlZmZpY2llbmN5IHdoZW4gcHJlY2FjaGluZyBleHRlbnRzIG9mIGxhcmdl
IGZpbGVzLgo+ID4+Pgo+ID4+PiBJIGNyZWF0ZWQgYSBmaWxlIHdpdGggdGhlIHNhbWUgbGFyZ2Vz
dCBleHRlbnQgYW5kIGV4ZWN1dGVkIHRoZSB0ZXN0Lgo+ID4+PiBGb3IgdGhpcyBleHBlcmltZW50
LCBJIHNldCB0aGUgZmlsZSdzIGxhcmdlc3QgZXh0ZW50IHdpdGggYW4gb2Zmc2V0Cj4gPj4+IG9m
Cj4gPj4+IDAgYW5kIGEgc2l6ZSBvZiAxR0IuIEkgY29uZmlndXJlZCB0aGUgcmVtYWluaW5nIGFy
ZWEgd2l0aCAxMDBNQgo+IGV4dGVudHMuCj4gPj4+Cj4gPj4+IDVHQiB0ZXN0IGZpbGU6Cj4gPj4+
IGRkIGlmPS9kZXYvdXJhbmRvbSBvZj10ZXN0MSBicz0xbSBjb3VudD01MTIwIGNwIHRlc3QxIHRl
c3QyIGZzeW5jCj4gPj4+IHRlc3QxIGRkIGlmPXRlc3QxIG9mPXRlc3QyIGJzPTFtIHNraXA9MTAy
NCBzZWVrPTEwMjQgY291bnQ9MTAwCj4gPj4+IGNvbnY9bm90cnVuYyBkZCBpZj10ZXN0MSBvZj10
ZXN0MiBicz0xbSBza2lwPTEyMjQgc2Vlaz0xMjI0Cj4gPj4+IGNvdW50PTEwMCBjb252PW5vdHJ1
bmMgLi4uCj4gPj4+IGRkIGlmPXRlc3QxIG9mPXRlc3QyIGJzPTFtIHNraXA9NTAyNCBzZWVrPTUw
MjQgY291bnQ9MTAwCj4gPj4+IGNvbnY9bm90cnVuYyByZWJvb3QKPiA+Pj4KPiA+Pj4gSSBhbHNv
IGNyZWF0ZWQgMTBHQiBhbmQgMjBHQiBmaWxlcyB3aXRoIGxhcmdlIGV4dGVudHMgdXNpbmcgdGhl
IHNhbWUKPiA+Pj4gbWV0aG9kLgo+ID4+Pgo+ID4+PiBpb2N0bChGMkZTX0lPQ19QUkVDQUNIRV9F
WFRFTlRTKSB0ZXN0IHJlc3VsdHMgYXJlIGFzIGZvbGxvd3M6Cj4gPj4+ICAgKy0tLS0tLS0tLS0t
Ky0tLS0tLS0tLSstLS0tLS0tLS0rLS0tLS0tLS0tLS0rCj4gPj4+ICAgfCBGaWxlIHNpemUgfCBC
ZWZvcmUgIHwgQWZ0ZXIgICB8IFJlZHVjdGlvbiB8Cj4gPj4+ICAgKy0tLS0tLS0tLS0tKy0tLS0t
LS0tLSstLS0tLS0tLS0rLS0tLS0tLS0tLS0rCj4gPj4+ICAgfCA1R0IgICAgICAgfCAxMDEuOG1z
IHwgNzIuMW1zICB8IDI5LjIlICAgICB8Cj4gPj4+ICAgfCAxMEdCICAgICAgfCAyMjIuOW1zIHwg
MTQ5LjVtcyB8IDMyLjklICAgICB8Cj4gPj4+ICAgfCAyMEdCICAgICAgfCA0NDYuMm1zIHwgMjc2
LjNtcyB8IDM4LjElICAgICB8Cj4gPj4+ICAgKy0tLS0tLS0tLS0tKy0tLS0tLS0tLSstLS0tLS0t
LS0rLS0tLS0tLS0tLS0rCj4gPj4KPiA+PiBZdW5qaSwKPiA+Pgo+ID4+IFdpbGwgd2UgZ2FpbiBi
ZXR0ZXIgcGVyZm9ybWFuY2UgaWYgd2UgcmVhZGFoZWFkIG1vcmUgbm9kZSBwYWdlcyB3Lwo+ID4+
IHN5Y2hyb25vdXMgcmVxdWVzdCBmb3IgcHJlY2FjaGUgZXh0ZW50IGNhc2U/IEhhdmUgeW91IHRy
aWVkIHRoYXQ/Cj4gPj4KPiA+PiBUaGFua3MsCj4gPj4KPiA+Cj4gPiBEb2VzIOKAnHJlYWRhaGVh
ZCBtb3JlIG5vZGUgcGFnZXPigJ0gbWVhbiByZW1vdmluZyB0aGlzIGNvbmRpdGlvbj8NCj4gPiAi
IG9mZnNldFtpIC0gMV0gJSBNQVhfUkFfTk9ERSA9PSAwICINCj4gDQo+IEFjdHVhbGx5LCBJIG1l
YW50IGEpIHJlbW92ZSAib2Zmc2V0W2kgLSAxXSAlIE1BWF9SQV9OT0RFID09IDAiIG9yIGIpDQo+
IGluY3JlYXNlIE1BWF9SQV9OT0RFLg0KPiANCj4gQWxzbywgbWF5YmUgd2UgY2FuIHRyeSBhcyBi
ZWxvdyB0byB0cmlnZ2VyIHN5bmNocm9ub3VzIElPIGZvciBzdWNoIGhpZ2gNCj4gZGV0ZXJtaW5h
Y3kgcmVhZC4NCj4gDQo+IHZvaWQgZGYyZnNfcmFfbm9kZV9wYWdlKCkNCj4gew0KPiAuLi4NCj4g
CWVyciA9IHJlYWRfbm9kZV9mb2xpbyhhZm9saW8sIDApOw0KPiAuLi4NCj4gfQ0KPiANCg0KSeKA
mW0gbm90IHN1cmUgaWYgSSBmdWxseSB1bmRlcnN0b29kLCBidXQgZG9lcyB0aGlzIG1lYW4gdGhh
dCBpbiB0aGUgY2FzZSBvZiBwcmVjYWNoZSwgdGhlIHJlYWRhaGVhZCBub2RlcyBhcmUgaGFuZGxl
ZCB3aXRoIHN5bmMgcmVhZHM/DQpXaXRoIHRoZSBjdXJyZW50IGNvZGUsIGl0IHNlZW1zIGRpZmZp
Y3VsdCB0byBpbXBsZW1lbnQgdGhpcy4NCg0KPiA+DQo+ID4gSSBvcmlnaW5hbGx5IGFkZGVkIHRo
ZSBjb25kaXRpb24gdG8gcHJldmVudCB1bm5lY2Vzc2FyeSByZWFkYWhlYWQNCj4gPiByZXF1ZXN0
cywgYnV0IGl0IHNlZW1zIHRoaXMgY29uZGl0aW9uIHdhcyBhY3R1YWxseSBibG9ja2luZyB2YWxp
ZA0KPiByZWFkYWhlYWQgYXMgd2VsbC4NCj4gPg0KPiA+IEFmdGVyIHJlbW92aW5nIHRoZSBjb25k
aXRpb24gYW5kIHJ1bm5pbmcgdGVzdHMsIEkgY29uZmlybWVkIHRoYXQgbW9yZQ0KPiA+IHJlYWRh
aGVhZCBub2RlIHBhZ2VzIGFyZSBiZWluZyBpc3N1ZWQuDQo+ID4NCj4gPiBJ4oCZbGwgc2hhcmUg
dGhlIHRlc3QgcmVzdWx0cyBhbG9uZyB3aXRoIHRoZSBpbXByb3ZlZCBwYXRjaC4NCj4gDQo+IEl0
IG1ha2VzIHNlbnNlLCB0aGFua3MgZm9yIGNoZWNraW5nIHRoaXMgYW5kIHNoYXJpbmcgdGhlIHJl
c3VsdC4NCj4gDQo+IFRoYW5rcywNCj4gDQoNCkkgdGVzdGVkIHdpdGggdGhlIHJldmlzZWQgdjMg
Y29kZSBhbmQgY29uZmlybWVkIHRoYXQgbW9zdCBub2RlIHBhZ2VzIGFyZSBub3cgaGFuZGxlZCBi
eSByZWFkYWhlYWQuIA0KKEluIHRoZSB2MiB2ZXJzaW9uLCBvbmx5IGFib3V0IGhhbGYgb2Ygbm9k
ZXMgd2VyZSBwcm9jZXNzZWQgd2l0aCByZWFkYWhlYWQuKQ0KDQpUaGFuayB5b3UgZm9yIHlvdXIg
cmV2aWV3Lg0KDQo+ID4NCj4gPiBUaGFua3MsDQo+ID4NCj4gPj4+IFRlc3RlZCBvbiBhIDI1NkdC
IG1vYmlsZSBkZXZpY2Ugd2l0aCBhbiBTTTg3NTAgY2hpcHNldC4NCj4gPj4+DQo+ID4+PiBSZXZp
ZXdlZC1ieTogU3VuZ2pvbmcgU2VvIDxzajE1NTcuc2VvQHNhbXN1bmcuY29tPg0KPiA+Pj4gUmV2
aWV3ZWQtYnk6IFN1bm1pbiBKZW9uZyA8c19taW4uamVvbmdAc2Ftc3VuZy5jb20+DQo+ID4+PiBT
aWduZWQtb2ZmLWJ5OiBZdW5qaSBLYW5nIDx5dW5qaTAua2FuZ0BzYW1zdW5nLmNvbT4NCj4gPj4+
IC0tLQ0KPiA+Pj4gdjI6DQo+ID4+PiAgLSBNb2RpZnkgdGhlIHJlYWRhaGVhZCBjb25kaXRpb24g
Y2hlY2sgcm91dGluZSBmb3IgYmV0dGVyIGNvZGUNCj4gPj4+IHJlYWRhYmlsaXR5Lg0KPiA+Pj4g
IC0gVXBkYXRlIHRoZSB0aXRsZSBmcm9tICdub2RlIGJsb2NrJyB0byAnbm9kZSBibG9ja3MnLg0K
PiA+Pj4NCj4gPj4+ICBmcy9mMmZzL2RhdGEuYyB8IDMgKysrDQo+ID4+PiAgZnMvZjJmcy9mMmZz
LmggfCAxICsNCj4gPj4+ICBmcy9mMmZzL25vZGUuYyB8IDUgKysrKy0NCj4gPj4+ICAzIGZpbGVz
IGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+Pj4NCj4gPj4+IGRp
ZmYgLS1naXQgYS9mcy9mMmZzL2RhdGEuYyBiL2ZzL2YyZnMvZGF0YS5jIGluZGV4DQo+ID4+PiA3
OTYxZTBkZGZjYTMuLmFiMzExN2UzYjI0YSAxMDA2NDQNCj4gPj4+IC0tLSBhL2ZzL2YyZnMvZGF0
YS5jDQo+ID4+PiArKysgYi9mcy9mMmZzL2RhdGEuYw0KPiA+Pj4gQEAgLTE1NzIsNiArMTU3Miw5
IEBAIGludCBmMmZzX21hcF9ibG9ja3Moc3RydWN0IGlub2RlICppbm9kZSwNCj4gPj4+IHN0cnVj
dA0KPiA+PiBmMmZzX21hcF9ibG9ja3MgKm1hcCwgaW50IGZsYWcpDQo+ID4+PiAgCXBnb2ZzID0J
KHBnb2ZmX3QpbWFwLT5tX2xibGs7DQo+ID4+PiAgCWVuZCA9IHBnb2ZzICsgbWF4YmxvY2tzOw0K
PiA+Pj4NCj4gPj4+ICsJaWYgKGZsYWcgPT0gRjJGU19HRVRfQkxPQ0tfUFJFQ0FDSEUpDQo+ID4+
PiArCQltb2RlID0gTE9PS1VQX05PREVfUFJFQ0FDSEU7DQo+ID4+PiArDQo+ID4+PiAgbmV4dF9k
bm9kZToNCj4gPj4+ICAJaWYgKG1hcC0+bV9tYXlfY3JlYXRlKSB7DQo+ID4+PiAgCQlpZiAoZjJm
c19sZnNfbW9kZShzYmkpKQ0KPiA+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZjJmcy5oIGIvZnMv
ZjJmcy9mMmZzLmggaW5kZXgNCj4gPj4+IDlkM2JjOTYzM2MxZC4uM2NlNDE1MjhkNDhlIDEwMDY0
NA0KPiA+Pj4gLS0tIGEvZnMvZjJmcy9mMmZzLmgNCj4gPj4+ICsrKyBiL2ZzL2YyZnMvZjJmcy5o
DQo+ID4+PiBAQCAtNjUxLDYgKzY1MSw3IEBAIGVudW0gew0KPiA+Pj4gIAkJCQkJICogbG9vayB1
cCBhIG5vZGUgd2l0aCByZWFkYWhlYWQgY2FsbGVkDQo+ID4+PiAgCQkJCQkgKiBieSBnZXRfZGF0
YV9ibG9jay4NCj4gPj4+ICAJCQkJCSAqLw0KPiA+Pj4gKwlMT09LVVBfTk9ERV9QUkVDQUNIRSwJ
CS8qIGxvb2sgdXAgYSBub2RlIGZvcg0KPiA+PiBGMkZTX0dFVF9CTE9DS19QUkVDQUNIRSAqLw0K
PiA+Pj4gIH07DQo+ID4+Pg0KPiA+Pj4gICNkZWZpbmUgREVGQVVMVF9SRVRSWV9JT19DT1VOVAk4
CS8qIG1heGltdW0gcmV0cnkgcmVhZCBJTyBvcg0KPiBmbHVzaA0KPiA+PiBjb3VudCAqLw0KPiA+
Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvbm9kZS5jIGIvZnMvZjJmcy9ub2RlLmMgaW5kZXgNCj4g
Pj4+IDQyNTRkYjQ1M2IyZC4uZDRiZjNjZTcxNWM1IDEwMDY0NA0KPiA+Pj4gLS0tIGEvZnMvZjJm
cy9ub2RlLmMNCj4gPj4+ICsrKyBiL2ZzL2YyZnMvbm9kZS5jDQo+ID4+PiBAQCAtODYwLDcgKzg2
MCwxMCBAQCBpbnQgZjJmc19nZXRfZG5vZGVfb2ZfZGF0YShzdHJ1Y3QgZG5vZGVfb2ZfZGF0YQ0K
PiA+Pj4gKmRuLA0KPiA+PiBwZ29mZl90IGluZGV4LCBpbnQgbW9kZSkNCj4gPj4+ICAJCQlzZXRf
bmlkKHBhcmVudCwgb2Zmc2V0W2kgLSAxXSwgbmlkc1tpXSwgaSA9PSAxKTsNCj4gPj4+ICAJCQlm
MmZzX2FsbG9jX25pZF9kb25lKHNiaSwgbmlkc1tpXSk7DQo+ID4+PiAgCQkJZG9uZSA9IHRydWU7
DQo+ID4+PiAtCQl9IGVsc2UgaWYgKG1vZGUgPT0gTE9PS1VQX05PREVfUkEgJiYgaSA9PSBsZXZl
bCAmJiBsZXZlbCA+IDEpDQo+ID4+IHsNCj4gPj4+ICsJCX0gZWxzZSBpZiAoKGkgPT0gbGV2ZWwg
JiYgbGV2ZWwgPiAxKSAmJg0KPiA+Pj4gKwkJCQkobW9kZSA9PSBMT09LVVBfTk9ERV9SQSB8fA0K
PiA+Pj4gKwkJCQkobW9kZSA9PSBMT09LVVBfTk9ERV9QUkVDQUNIRSAmJg0KPiA+Pj4gKwkJCQlv
ZmZzZXRbaSAtIDFdICUgTUFYX1JBX05PREUgPT0gMCkpKSB7DQo+ID4+PiAgCQkJbmZvbGlvW2ld
ID0gZjJmc19nZXRfbm9kZV9mb2xpb19yYShwYXJlbnQsIG9mZnNldFtpIC0NCj4gPj4gMV0pOw0K
PiA+Pj4gIAkJCWlmIChJU19FUlIobmZvbGlvW2ldKSkgew0KPiA+Pj4gIAkJCQllcnIgPSBQVFJf
RVJSKG5mb2xpb1tpXSk7DQo+ID4NCj4gPg0KPiA+DQoNCg0KCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxp
c3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5z
b3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
