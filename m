Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 98006B7E8DF
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Sep 2025 14:53:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jq+UBYrud9Q0W+6ZtFXGhKzSV4Kt4bZ4LN+CysFDGFE=; b=bcwMRo2K2uJSyn25JTJAV7D2YY
	8IpB4x3HBju5r22ap+d+5K+cJU+WqpuXn/C+kr7E5PK/XqmAFYpcNtb5cmzKY5GuQJh4aFSuPy3aA
	dFQBPnOy0AFK+ag+UW0YHx5z5L+P+HdQiudJj0JjTbsQCSGzFkUQ0KdyKJThTW2U4NCw=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uyn2X-0002CQ-Rc;
	Wed, 17 Sep 2025 07:57:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uyn2W-0002CJ-JG
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Sep 2025 07:57:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HH91WYSaIqcQgSq6QiZ0COJrE+vJ+c2gGsD+acFO9pE=; b=ThswxldArOGq+4zFNcXF19nnD2
 WeZ9g87pYBiDKsUzObybP9uGOK2Ej4spITR9RqJs5+OaJvAjq1qjxTkY+sWi1m8Q15Fu5MT9xkYbM
 ucw9ncuPIGqnzK6rMvbhBs5T0LtVIuXM1hNfP6UIF+HUD9qMYjekqm3q8YaXe+SwuunA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HH91WYSaIqcQgSq6QiZ0COJrE+vJ+c2gGsD+acFO9pE=; b=E1bJabjYqGa8K32dKw7g7u4R30
 hllDmf4JSJkxwuT4IdKeaqHw65SMThyAKsdLokZgc+NDNArLaandtESze2/AHaA/e9t8vJoqkGoXr
 4anP37DeR1DAaipGM3W0vEMNW4aJbSlwchxkfGyzIJj9ulQFjEBthE8lFHrBokZOGezc=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uyn2W-00005F-7W for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Sep 2025 07:57:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C95CE40750;
 Wed, 17 Sep 2025 07:57:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED502C4CEF0;
 Wed, 17 Sep 2025 07:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758095829;
 bh=gqi+Je9O1n+GdXxCwk4Oc1By7Xpu7yNWj4QRpQLsigc=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=d7K0rv1nfYJMKSEpfQg8eREexP6zGEDjiRdCBfGFBI0ObsZuOg2U5ifTG4B+eWmAL
 KioDVDxasKiU/Yta/7N7fo87KrL1z2rGOkVNULfs9ZHt5X0KraQVqN3D/1so35Q8L0
 vYxZ/AqPskY1tKMwUVVgTRSgxUrbeP62xbg/65kqBr/ShySPC2r8NWByqkDfjFWOYD
 mizkk77l0Lt9dbDRIJOUtDBO8aIv0PbtDIm0DMj/WhFF40NIPA9dO7EdzaprQS2lyl
 wktFXxI8QyGD3ckE3WOV5xtUMCy2XiZY8cXd1hu0khrFm1OkAoUJBA+uApaWkaURMB
 QSJ5DZe0FlIrQ==
Message-ID: <22d9f9d1-1db0-4bad-a782-212ab3da630e@kernel.org>
Date: Wed, 17 Sep 2025 15:57:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Liao Yuanhong <liaoyuanhong@vivo.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 "open list:F2FS FILE SYSTEM" <linux-f2fs-devel@lists.sourceforge.net>,
 open list <linux-kernel@vger.kernel.org>
References: <20250909134418.502922-1-liaoyuanhong@vivo.com>
 <20250909134418.502922-3-liaoyuanhong@vivo.com>
 <b42b161d-cd5d-45dc-8e84-c2b28eb632e5@kernel.org>
 <a508b9b8-3c81-4a2c-a525-baac822563b3@vivo.com>
Content-Language: en-US
In-Reply-To: <a508b9b8-3c81-4a2c-a525-baac822563b3@vivo.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 9/17/25 15:08, Liao Yuanhong wrote: > > On 9/15/2025 4:36
 PM, Chao Yu wrote: >> On 9/9/25 21:44, Liao Yuanhong wrote: >>> When the
 proportion of dirty segments within a section exceeds the >>> vali [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uyn2W-00005F-7W
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: Enhance the subsequent logic of
 valid_thresh_ratio to prevent unnecessary background GC
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gOS8xNy8yNSAxNTowOCwgTGlhbyBZdWFuaG9uZyB3cm90ZToKPiAKPiBPbiA5LzE1LzIwMjUg
NDozNiBQTSwgQ2hhbyBZdSB3cm90ZToKPj4gT24gOS85LzI1IDIxOjQ0LCBMaWFvIFl1YW5ob25n
IHdyb3RlOgo+Pj4gV2hlbiB0aGUgcHJvcG9ydGlvbiBvZiBkaXJ0eSBzZWdtZW50cyB3aXRoaW4g
YSBzZWN0aW9uIGV4Y2VlZHMgdGhlCj4+PiB2YWxpZF90aHJlc2hfcmF0aW8sIHRoZSBnY19jb3N0
IG9mIHRoYXQgc2VjdGlvbiBpcyBzZXQgdG8gVUlOVF9NQVgsCj4+PiBpbmRpY2F0aW5nIHRoYXQg
dGhlc2Ugc2VjdGlvbnMgc2hvdWxkIG5vdCBiZSByZWxlYXNlZC4gSG93ZXZlciwgaWYgYWxsCj4+
PiBzZWN0aW9uIGNvc3RzIHdpdGhpbiB0aGUgc2Nhbm5pbmcgcmFuZ2Ugb2YgZ2V0X3ZpY3RpbSgp
IGFyZSBVSU5UX01BWCwKPj4+IGJhY2tncm91bmQgR0Mgd2lsbCBzdGlsbCBvY2N1ci4gQWRkIGEg
Y29uZGl0aW9uIHRvIHByZXZlbnQgdGhpcyBzaXR1YXRpb24uCj4+IEZvciB0aGlzIGNhc2UsIGYy
ZnNfZ2V0X3ZpY3RpbSgpIHdpbGwgcmV0dXJuIDAsIGFuZCBmMmZzX2djKCkgd2lsbCB1c2UgdW5j
aGFuZ2VkCj4+IHNlZ25vIGZvciBHQz8KPj4KPj4gVGhhbmtzLAo+IAo+IFlvdSdyZSByaWdodCwg
c2Vnbm8gd29uJ3QgdXBkYXRlIGluIHRoaXMgc2NlbmFyaW8sIGFuZCB0aGlzIHBhdGNoIGZlYXR1
cmUgaXMgcmVkdW5kYW50LgoKT2gsIEkgbWVhbnQsIGlmIGYyZnNfZ2V0X3ZpY3RpbSgpIGZhaWxz
IHRvIHNlbGVjdCBhIHZhbGlkIHZpY3RpbSBkdWUgdG8gdGhlIHJlYXNvbiB5b3UKZGVzY3JpYmVk
LCBmMmZzX2dldF92aWN0aW0oKSB3aWxsIHJldHVybiAwLCBhbmQgZjJmc19nYygpIHdpbGwgbWln
cmF0ZSBzZWdtZW50ICNOVUxMX1NFR05PPwpPciBhbSBJIG1pc3Npbmcgc29tZXRoaW5nPwoKVGhh
bmtzLAoKPiAKPiAKPiBUaGFua3MsCj4gCj4gTGlhbwo+IAo+Pj4gU2lnbmVkLW9mZi1ieTogTGlh
byBZdWFuaG9uZyA8bGlhb3l1YW5ob25nQHZpdm8uY29tPgo+Pj4gLS0tCj4+PiDCoCBmcy9mMmZz
L2djLmMgfCA1ICsrKysrCj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4+
Pgo+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZ2MuYyBiL2ZzL2YyZnMvZ2MuYwo+Pj4gaW5kZXgg
NGE4YzA4Zjk3MGUzLi5mZmMzMTg4NDE2ZjQgMTAwNjQ0Cj4+PiAtLS0gYS9mcy9mMmZzL2djLmMK
Pj4+ICsrKyBiL2ZzL2YyZnMvZ2MuYwo+Pj4gQEAgLTkzNiw2ICs5MzYsMTEgQEAgaW50IGYyZnNf
Z2V0X3ZpY3RpbShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIHVuc2lnbmVkIGludCAqcmVzdWx0
LAo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4+IMKgwqDCoMKgwqAgfQo+Pj4gwqAgK8KgwqDC
oCBpZiAoZjJmc19zYl9oYXNfYmxrem9uZWQoc2JpKSAmJiBwLm1pbl9jb3N0ID09IFVJTlRfTUFY
KSB7Cj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0ID0gLUVOT0RBVEE7Cj4+PiArwqDCoMKgwqDCoMKg
wqAgZ290byBvdXQ7Cj4+PiArwqDCoMKgIH0KPj4+ICsKPj4+IMKgwqDCoMKgwqAgLyogZ2V0IHZp
Y3RpbSBmb3IgR0NfQVQvQVRfU1NSICovCj4+PiDCoMKgwqDCoMKgIGlmIChpc19hdGdjKSB7Cj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqAgbG9va3VwX3ZpY3RpbV9ieV9hZ2Uoc2JpLCAmcCk7CgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMt
ZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0
Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMt
ZGV2ZWwK
