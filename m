Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 05011B29D1C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 18 Aug 2025 11:06:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mEK343KWn0Au6bSJ84wmpT0BqTV7YbE/53X3Q3FrVqU=; b=QhiJWlMOdKOqWWp0oDvEiqZhbu
	xzoFui+Nb/+wBi4GbiUT9R2PFyEBRZwB4BF8dS8hGZYZMPsbMoMK5SoJSL0oZWiTsUd8gOz5KCwCa
	rGvCRE9GRMvN13kYHFjHziUVO64CYfsj59RKhLH01zsNICTweZLxxQA0NO1y/aHhrMWY=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1unvoe-0002x2-No;
	Mon, 18 Aug 2025 09:06:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1unvod-0002ww-JX
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Aug 2025 09:06:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bw0LcqNaO1c9buO6zQ7zq6rFie68UF+XLlfAk5ZqbXY=; b=TbVV4Ht/Y+RCpjtNXuZ5VAjTeQ
 Ui5wK/mdMob7frvocSUMVNoU9j9dKec+1gHrrwVpL65FNqfEnKSyTn4G7BfsKajyKf0iwSWqwMUg2
 vkhAcJi9fBtRELaY0bCRUTaeB3YKaXf24hBh7jeAFJkGinWDxO4vH3KqSLd5KUe+haGY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bw0LcqNaO1c9buO6zQ7zq6rFie68UF+XLlfAk5ZqbXY=; b=QrfEjh8os6G0iMgWb078+tMMj1
 ZngrHi4yTaLP0owJ8jI1ZAcfrqKdA+yf9KadEb0UchqRgcjKevEfJo6jESSfkwjzlgXKMXPd5eKGf
 IT/FAET7SrHBnC+YQBMQK7PCbNyHMHtUvyIgcP5FLw2xlAW2Tw/Nam8cL8XZ1PsImxY4=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1unvoZ-000361-CL for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Aug 2025 09:06:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DDDAC41527;
 Mon, 18 Aug 2025 09:05:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BDABC4CEEB;
 Mon, 18 Aug 2025 09:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755507952;
 bh=rVEr7j4uON2HRqnaGgTz/O2MC9q3/sSErwMBgfgFoCQ=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=u/JNrr5tpd+gf8C/tZuctbXMeySpsbVkHnCCipAN86et4KnD1ImSuBaPg/NcDC0Vs
 othPbAqkbtTke/MQkTbD9NHLSYHBVmaq0MP5NyJgrAjAob06GX9QN/xznY2bJvvjV2
 9S+RbmiY/92NwKY8WX9kEokZKsRZEpoUJKGfol1PRCzSAtR1Ffnf7YMeFmMmOv3TAj
 PzD+lIHROd235ZrkoRjOj/VGIFIsGEcb2PBkfYA4qRiPLK7OPNfNRkSf5hUa8FgvJ6
 bayrwmaHZ0F0amqAWqcO9tLds4WrtghWT/QUBMNqm2WAVdUdCpR5na1Hm1RvNNRRlB
 ZQwVh17eQtVvg==
Message-ID: <1eb37db3-d9e4-40fc-9b83-3640c689a1a7@kernel.org>
Date: Mon, 18 Aug 2025 17:05:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?B?546L5pmT54+6?= <wangxiaojun@vivo.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>
References: <20250807084442.422751-1-wangxiaojun@vivo.com>
 <7fbd778a-8676-4040-bb8f-f5417d458c7e@kernel.org>
 <4ca35d43-1e9d-4dd4-a291-0a54f93a2d67@vivo.com>
 <19b1554b-12ed-4992-8a0a-6cf2f115a4d2@vivo.com>
Content-Language: en-US
In-Reply-To: <19b1554b-12ed-4992-8a0a-6cf2f115a4d2@vivo.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-2.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 8/18/25 11:51, 王晓珺 wrote: > Hi Chao, > > The combination
    of truncate and falloc complicates the recovery process. > > For example,
    in the following scenario: > > write fileA 2M | fsync | trun [...] 
 
 Content analysis details:   (-0.2 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
X-Headers-End: 1unvoZ-000361-CL
Subject: Re: [f2fs-dev] [PATCH v3] f2fs:fix missing space reclamation during
 the recovery process
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gOC8xOC8yNSAxMTo1MSwg546L5pmT54+6IHdyb3RlOgo+IEhpIENoYW8sCj4gCj4gVGhlIGNv
bWJpbmF0aW9uIG9mIHRydW5jYXRlIGFuZCBmYWxsb2MgY29tcGxpY2F0ZXMgdGhlIHJlY292ZXJ5
IHByb2Nlc3MuCj4gCj4gRm9yIGV4YW1wbGUsIGluIHRoZSBmb2xsb3dpbmcgc2NlbmFyaW86Cj4g
Cj4gd3JpdGUgZmlsZUEgMk0gfCBmc3luYyB8IHRydW5jYXRlIDI1NksgfCBmYWxsb2MgLWsgMjU2
SyAxTSB8IGZzeW5jIEEgfCBTUE8KPiBUaGUgZmFsbG9jICgyNTZLLCAxTSkgbmVlZCB0byBiZSBy
ZWNvdmVyZWQgYXMgcHJlLWFsbG9jYXRlZCBzcGFjZS4KPiAKPiBCdXQgaW4gdGhlIGZvbGxvd2lu
ZyBzY2VuYXJpb3MsIHRoZSBzaXR1YXRpb24gaXMgdGhlIG9wcG9zaXRlLgo+IAo+IHdyaXRlIGZp
bGVBIDJNIHwgZnN5bmMgfCBmYWxsb2MgLWsgMk0gMTBNIHwgZnN5bmMgQSB8IHRydW5jYXRlIDI1
NksgfCAKPiBmc3luYyBBIHwgU1BPCj4gSW4gdGhpcyBzY2VuYXJpbywgdGhlIHNwYWNlIGFsbG9j
YXRlZCBieSBmYWxsb2MgbmVlZHMgdG8gYmUgdHJ1bmNhdGVkLgo+IEluIGZhY3QsIHRoZSBjdXJy
ZW50IGYyZnMgY2Fubm90IHJlY2xhaW0gdGhpcyBwYXJ0IG9mIHRoZSBzcGFjZS4KPiAKPiBEdXJp
bmcgdGhlIHJlY292ZXJ5IHByb2Nlc3MsIGl0IGlzIGRpZmZpY3VsdCB0byBkaXN0aW5ndWlzaAo+
IGJldHdlZW4gdGhlIGFib3ZlIHR3byB0eXBlcyBvZiBmYWxsb2MuCj4gCj4gSSB0aGluayB0aGF0
IHdoZW4gYSBmaWxlIGlzIHRydW5jYXRlZCwgYSBGSV9UUlVOQ19GSUxFIGZsYWcgc2hvdWxkIGJl
IAo+IHNldHRlZC4KPiBXaGVuIHRoZSBmaWxlIGlzIGZzeW5jJ2QsIGlmIHRoZSBGSV9UUlVOQ19G
SUxFIGZsYWcgaXMgcHJlc2VudCwKPiBhIGNoZWNrcG9pbnQgbmVlZHMgdG8gYmUgcGVyZm9ybWVk
LgoKdHJ1bmNhdGUgdG8gc21hbGwgc2l6ZSBhbmQgZnN5bmMgd291bGQgYmUgYSBjb21tb24gY2Fz
ZSwgaXQncyBiZXR0ZXIKdG8gbm90IHRyaWdnZXIgY2hlY2twb2ludCBkdXJpbmcgZnN5bmMuCgpX
aGF0IGRvIHlvdSB0aGluayBvZiB0cmlnZ2VyaW5nIGNoZWNrcG9pbnQgZm9yIGZzeW5jIGFmdGVy
IGZhbGxvYyAtayAuLi4KaW5zdGVhZD8gSU1PLCBpdCBzaG91bGRuJ3QgYmUgYSBjb21tb24gY2Fz
ZSBpbiBBbmRyb2lkLgoKVGhhbmtzLAoKPiAKPiBUaGFua3MsCj4gCj4gT24gOC8xMS8yMDI1IDEw
OjU0IEFNLCBXYW5nIFhpYW9qdW4gd3JvdGU6Cj4+IEhpIENoYW8sCj4+Cj4+IFRoaXMgcGF0Y2gg
d2lsbCBjYXVzZSBmYWxsb2MgdG8gZmFpbCBpbiB0aGUgZm9sbG93aW5nIHNjZW5hcmlvcy4KPj4g
d3JpdGUgZmlsZUEgMk0gfCBmc3luYyB8IHRydW5jYXRlIDI1NksgfCBmYWxsb2MgLWsgMjU2SyAx
TSB8IGZzeW5jIEEgCj4+IHzCoFNQTwo+PiBTbyBJIHdpbGwgZml4IHRoaXMgaXNzdWUgaW4gdGhl
IG5leHQgdmVyc2lvbiBvZiB0aGUgcGF0Y2guCj4+Cj4+IFRoYW5rcywKPj4KPj4gT24gOC84LzIw
MjUgMTI6MTYgUE0sIENoYW8gWXUgd3JvdGU6Cj4+PiBYaWFvanVuLAo+Pj4KPj4+IEkganVzdCBu
b3RpY2UgZ2VuZXJpYy80ODMgd2lsbCBmYWlsIHcvIHRoaXMgY2hhbmdlLCBjYW4geW91IHBsZWFz
ZSAKPj4+IHRha2UgYQo+Pj4gbG9vaz8KPj4+Cj4+PiBUaGFua3MsCj4+Pgo+Pj4gT24gOC83LzIw
MjUgNDo0NCBQTSwgV2FuZyBYaWFvanVuIHdyb3RlOgo+Pj4+IFRoaXMgcGF0Y2ggZml4ZXMgbWlz
c2luZyBzcGFjZSByZWNsYW1hdGlvbiBkdXJpbmcgdGhlIHJlY292ZXJ5IHByb2Nlc3MuCj4+Pj4g
SW4gdGhlIGZvbGxvd2luZyBzY2VuYXJpb3MsIEYyRlMgY2Fubm90IHJlY2xhaW0gdHJ1bmNhdGVk
IHNwYWNlLgo+Pj4+IGNhc2UgMToKPj4+PiB3cml0ZSBmaWxlIEEsIHNpemUgaXMgMUcgfCBDUCB8
IHRydW5jYXRlIEEgdG8gMU0gfCBmc3luYyBBIHwgU1BPCj4+Pj4KPj4+PiBjYXNlIDI6Cj4+Pj4g
Q1AgfCB3cml0ZSBmaWxlIEEsIHNpemUgaXMgMUcgfCBmc3luYyBBIHwgdHJ1bmNhdGUgQSB0byAx
TSB8IGZzeW5jIEEgCj4+Pj4gfFNQTwo+Pj4+Cj4+Pj4gRHVyaW5nIHRoZSByZWNvdmVyeSBwcm9j
ZXNzLCBGMkZTIHdpbGwgcmVjb3ZlciBmaWxlIEEsCj4+Pj4gYnV0IHRoZSAxTS0xRyBzcGFjZSBj
YW5ub3QgYmUgcmVjbGFpbWVkLgo+Pj4+Cj4+Pj4gRml4ZXM6IGQ2MjRjOTZmYjMyNDkgKCJmMmZz
OiBhZGQgcmVjb3Zlcnkgcm91dGluZXMgZm9yIHJvbGwtZm9yd2FyZCIpCj4+Pj4KPj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBXYW5nIFhpYW9qdW4gPHdhbmd4aWFvanVuQHZpdm8uY29tPgo+Pj4+IC0tLQo+
Pj4+IHYzOiBBZGQgYSBGaXhlcyBsaW5lLgo+Pj4+IHYyOiBBcHBseSBDaGFvJ3Mgc3VnZ2VzdGlv
biBmcm9tIHYxLiBObyBsb2dpY2FsIGNoYW5nZXMuCj4+Pj4gdjE6IEZpeCBtaXNzaW5nIHNwYWNl
IHJlY2xhbWF0aW9uIGR1cmluZyB0aGUgcmVjb3ZlcnkgcHJvY2Vzcy4KPj4+PiAtLS0KPj4+PiDC
oCBmcy9mMmZzL2YyZnMuaMKgwqDCoMKgIHzCoCAxICsKPj4+PiDCoCBmcy9mMmZzL3JlY292ZXJ5
LmMgfCAxOCArKysrKysrKysrKysrKysrKy0KPj4+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDE4IGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZz
L2YyZnMuaCBiL2ZzL2YyZnMvZjJmcy5oCj4+Pj4gaW5kZXggNDZiZTc1NjA1NDhjLi4yOGZjZTU5
MTk4Y2UgMTAwNjQ0Cj4+Pj4gLS0tIGEvZnMvZjJmcy9mMmZzLmgKPj4+PiArKysgYi9mcy9mMmZz
L2YyZnMuaAo+Pj4+IEBAIC00NTksNiArNDU5LDcgQEAgc3RydWN0IGZzeW5jX2lub2RlX2VudHJ5
IHsKPj4+PiDCoMKgwqDCoMKgIHN0cnVjdCBpbm9kZSAqaW5vZGU7wqDCoMKgIC8qIHZmcyBpbm9k
ZSBwb2ludGVyICovCj4+Pj4gwqDCoMKgwqDCoCBibG9ja190IGJsa2FkZHI7wqDCoMKgIC8qIGJs
b2NrIGFkZHJlc3MgbG9jYXRpbmcgdGhlIGxhc3QgZnN5bmMgKi8KPj4+PiDCoMKgwqDCoMKgIGJs
b2NrX3QgbGFzdF9kZW50cnk7wqDCoMKgIC8qIGJsb2NrIGFkZHJlc3MgbG9jYXRpbmcgdGhlIGxh
c3QgCj4+Pj4gZGVudHJ5ICovCj4+Pj4gK8KgwqDCoCBsb2ZmX3QgbWF4X2lfc2l6ZTvCoMKgwqAg
LyogcHJldmlvdXMgbWF4IGZpbGUgc2l6ZSBmb3IgdHJ1bmNhdGUgKi8KPj4+PiDCoCB9Owo+Pj4+
IMKgIMKgICNkZWZpbmUgbmF0c19pbl9jdXJzdW0oam5sKSAobGUxNl90b19jcHUoKGpubCktPm5f
bmF0cykpCj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvcmVjb3ZlcnkuYyBiL2ZzL2YyZnMvcmVj
b3ZlcnkuYwo+Pj4+IGluZGV4IDRjYjNhOTE4MDFiNC4uNjhiNjJjOGE3NGQzIDEwMDY0NAo+Pj4+
IC0tLSBhL2ZzL2YyZnMvcmVjb3ZlcnkuYwo+Pj4+ICsrKyBiL2ZzL2YyZnMvcmVjb3ZlcnkuYwo+
Pj4+IEBAIC05NSw2ICs5NSw3IEBAIHN0YXRpYyBzdHJ1Y3QgZnN5bmNfaW5vZGVfZW50cnkgCj4+
Pj4gKmFkZF9mc3luY19pbm9kZShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksCj4+Pj4gwqDCoMKg
wqDCoCBlbnRyeSA9IGYyZnNfa21lbV9jYWNoZV9hbGxvYyhmc3luY19lbnRyeV9zbGFiLAo+Pj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBHRlBfRjJGU19aRVJP
LCB0cnVlLCBOVUxMKTsKPj4+PiDCoMKgwqDCoMKgIGVudHJ5LT5pbm9kZSA9IGlub2RlOwo+Pj4+
ICvCoMKgwqAgZW50cnktPm1heF9pX3NpemUgPSBpX3NpemVfcmVhZChpbm9kZSk7Cj4+Pj4gwqDC
oMKgwqDCoCBsaXN0X2FkZF90YWlsKCZlbnRyeS0+bGlzdCwgaGVhZCk7Cj4+Pj4gwqAgwqDCoMKg
wqDCoCByZXR1cm4gZW50cnk7Cj4+Pj4gQEAgLTc5Niw2ICs3OTcsNyBAQCBzdGF0aWMgaW50IHJl
Y292ZXJfZGF0YShzdHJ1Y3QgZjJmc19zYl9pbmZvIAo+Pj4+ICpzYmksIHN0cnVjdCBsaXN0X2hl
YWQgKmlub2RlX2xpc3QsCj4+Pj4gwqDCoMKgwqDCoCB3aGlsZSAoMSkgewo+Pj4+IMKgwqDCoMKg
wqDCoMKgwqDCoCBzdHJ1Y3QgZnN5bmNfaW5vZGVfZW50cnkgKmVudHJ5Owo+Pj4+IMKgwqDCoMKg
wqDCoMKgwqDCoCBzdHJ1Y3QgZm9saW8gKmZvbGlvOwo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBsb2Zm
X3QgaV9zaXplOwo+Pj4+IMKgIMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoIWYyZnNfaXNfdmFsaWRf
YmxrYWRkcihzYmksIGJsa2FkZHIsIE1FVEFfUE9SKSkKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBicmVhazsKPj4+PiBAQCAtODI4LDYgKzgzMCw5IEBAIHN0YXRpYyBpbnQgcmVjb3Zl
cl9kYXRhKHN0cnVjdCBmMmZzX3NiX2luZm8gCj4+Pj4gKnNiaSwgc3RydWN0IGxpc3RfaGVhZCAq
aW5vZGVfbGlzdCwKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFr
Owo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCByZWNvdmVyZWRfaW5vZGUrKzsKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBpX3NpemUgPSBpX3NpemVfcmVhZChlbnRyeS0+aW5vZGUpOwo+Pj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGlmIChlbnRyeS0+bWF4X2lfc2l6ZSA8IGlfc2l6ZSkKPj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVudHJ5LT5tYXhfaV9zaXplID0gaV9zaXplOwo+Pj4+IMKg
wqDCoMKgwqDCoMKgwqDCoCB9Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChlbnRyeS0+bGFz
dF9kZW50cnkgPT0gYmxrYWRkcikgewo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVy
ciA9IHJlY292ZXJfZGVudHJ5KGVudHJ5LT5pbm9kZSwgZm9saW8sIGRpcl9saXN0KTsKPj4+PiBA
QCAtODQ0LDggKzg0OSwxOSBAQCBzdGF0aWMgaW50IHJlY292ZXJfZGF0YShzdHJ1Y3QgZjJmc19z
Yl9pbmZvIAo+Pj4+ICpzYmksIHN0cnVjdCBsaXN0X2hlYWQgKmlub2RlX2xpc3QsCj4+Pj4gwqDC
oMKgwqDCoMKgwqDCoMKgIH0KPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmVjb3ZlcmVkX2Rub2Rl
Kys7Cj4+Pj4gwqAgLcKgwqDCoMKgwqDCoMKgIGlmIChlbnRyeS0+YmxrYWRkciA9PSBibGthZGRy
KQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoZW50cnktPmJsa2FkZHIgPT0gYmxrYWRkcikgewo+
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlfc2l6ZSA9IGlfc2l6ZV9yZWFkKGVudHJ5LT5p
bm9kZSk7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGVudHJ5LT5tYXhfaV9zaXpl
ID4gaV9zaXplKSB7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlcnIgPSBm
MmZzX3RydW5jYXRlX2Jsb2NrcyhlbnRyeS0+aW5vZGUsCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpX3NpemUsIGZhbHNlKTsKPj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChlcnIpIHsKPj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZjJmc19mb2xpb19wdXQoZm9saW8sIHRy
dWUpOwo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsK
Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGYyZnNfbWFya19pbm9kZV9kaXJ0eV9zeW5jKGVudHJ5LT5pbm9k
ZSwgdHJ1ZSk7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+Pj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGxpc3RfbW92ZV90YWlsKCZlbnRyeS0+bGlzdCwgdG1wX2lub2RlX2xp
c3QpOwo+Pj4+ICvCoMKgwqDCoMKgwqDCoCB9Cj4+Pj4gwqAgbmV4dDoKPj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqAgcmFfYmxvY2tzID0gYWRqdXN0X3Bvcl9yYV9ibG9ja3Moc2JpLCByYV9ibG9ja3Ms
IGJsa2FkZHIsCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IG5leHRfYmxrYWRkcl9vZl9ub2RlKGZvbGlvKSk7Cj4+Pgo+Pgo+IAoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxp
bmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xp
c3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
