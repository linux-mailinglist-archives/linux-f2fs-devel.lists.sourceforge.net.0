Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CE910B82A18
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 Sep 2025 04:17:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q3UBbNHl5oK92TPmwhPJvNdQXaFJX+zT/Tuf1Q87kOM=; b=KasAWrhOivLY4tFYdqFHoLXVy0
	1bL061eutYs06jM4TjnQR+/pe971+Leut5AWECQ++wUw4L6qtR84owG9WOYBbA4utw67gF8A9H1Yb
	RHrIoRAwwo2m4XD3hiXz9D/L0eHsCkP2C2ogXFwBj5INpPG+uVcqPu6m+NW7vTU3CMAg=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uz4Cs-0001dm-HK;
	Thu, 18 Sep 2025 02:17:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uz4Cq-0001dd-Ra
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 Sep 2025 02:17:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fs+yGpfvZSXSL432mXUN0IyYGK69g2eakFyCKsE6m4o=; b=Fq2opsjBwHKOcK62h4cWHzgjiK
 BsGGFFuBpJWjSL79o65iOM5H6KX5GBKEQIKYQIHjAQXuSGX0xD0o4gikjGd+hoGYbbXKsmbCf7jNU
 41o2vfcC7+q7Sopqa/OVUUBNEGLNbhzliQohMJKIcGvjnzX80iTXFDYLsv4+AdGIZsJA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fs+yGpfvZSXSL432mXUN0IyYGK69g2eakFyCKsE6m4o=; b=jsVDEkGhzS1VVKNOvhjcDAvInz
 CnrPTQIwJIyDIKXfjR5v5KWFgC2pH3gMCyygHg4cOgt1BzN2N+UZXWbqBHqeqOyQ04P7plalV6/3a
 VtP35yy3X79eK5+AZ0HxphGshu5CmMK697wu+RsgoLotEyI7kdHlXOmA1Ew8rR1Do1tU=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uz4Cq-0006RP-CM for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 Sep 2025 02:17:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1B22B40966;
 Thu, 18 Sep 2025 02:16:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32094C4CEE7;
 Thu, 18 Sep 2025 02:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758161818;
 bh=7Wb0pHEzIG7mtfnM9t7VxEHFQL1mFdj0+KDBCrSulX0=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=d+R5L82HZklANHLi1YzrOxcQmvx8s0shiGA3mUc5B+uhqAeWbhGicG/NSkFsFb9t5
 OOoFLR8g3El4aaQAqqOW54rzmtsil+ksBfow1E330nZA6BAj07iw2qCsq+mYI4EDOY
 hdRn/eFHC+mt1ciHFkzOsJScvKwjt9lbUPAYpi+TW9V3JyO6Te7fTqB4tOSRacFJIK
 Q4gwak5OxYhsnrccyZq9nKlCXw+Zs8ex/H0VGC8cEFhcxFgFzrj7xYOUKu1/SXxxcU
 PooBCBGSKbi81EjU/1uX/+ylQr/RFEz6AmMSVE8M5I+1+ibsNMZ9JwhvRUXulLwQ2t
 jIYqhaRzVJlxQ==
Message-ID: <b7b20efb-8cdc-4cf0-a057-d4d41ae66aba@kernel.org>
Date: Thu, 18 Sep 2025 10:16:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Liao Yuanhong <liaoyuanhong@vivo.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 "open list:F2FS FILE SYSTEM" <linux-f2fs-devel@lists.sourceforge.net>,
 open list <linux-kernel@vger.kernel.org>
References: <20250909134418.502922-1-liaoyuanhong@vivo.com>
 <20250909134418.502922-3-liaoyuanhong@vivo.com>
 <b42b161d-cd5d-45dc-8e84-c2b28eb632e5@kernel.org>
 <a508b9b8-3c81-4a2c-a525-baac822563b3@vivo.com>
 <22d9f9d1-1db0-4bad-a782-212ab3da630e@kernel.org>
 <3cd3bfb5-857f-4b61-a1c1-55805bed4609@vivo.com>
Content-Language: en-US
In-Reply-To: <3cd3bfb5-857f-4b61-a1c1-55805bed4609@vivo.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 9/17/25 16:13, Liao Yuanhong wrote: > > On 9/17/2025 3:57
 PM, Chao Yu wrote: >> On 9/17/25 15:08, Liao Yuanhong wrote: >>> On 9/15/2025
 4:36 PM, Chao Yu wrote: >>>> On 9/9/25 21:44, Liao Yuanhong w [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uz4Cq-0006RP-CM
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

T24gOS8xNy8yNSAxNjoxMywgTGlhbyBZdWFuaG9uZyB3cm90ZToKPiAKPiBPbiA5LzE3LzIwMjUg
Mzo1NyBQTSwgQ2hhbyBZdSB3cm90ZToKPj4gT24gOS8xNy8yNSAxNTowOCwgTGlhbyBZdWFuaG9u
ZyB3cm90ZToKPj4+IE9uIDkvMTUvMjAyNSA0OjM2IFBNLCBDaGFvIFl1IHdyb3RlOgo+Pj4+IE9u
IDkvOS8yNSAyMTo0NCwgTGlhbyBZdWFuaG9uZyB3cm90ZToKPj4+Pj4gV2hlbiB0aGUgcHJvcG9y
dGlvbiBvZiBkaXJ0eSBzZWdtZW50cyB3aXRoaW4gYSBzZWN0aW9uIGV4Y2VlZHMgdGhlCj4+Pj4+
IHZhbGlkX3RocmVzaF9yYXRpbywgdGhlIGdjX2Nvc3Qgb2YgdGhhdCBzZWN0aW9uIGlzIHNldCB0
byBVSU5UX01BWCwKPj4+Pj4gaW5kaWNhdGluZyB0aGF0IHRoZXNlIHNlY3Rpb25zIHNob3VsZCBu
b3QgYmUgcmVsZWFzZWQuIEhvd2V2ZXIsIGlmIGFsbAo+Pj4+PiBzZWN0aW9uIGNvc3RzIHdpdGhp
biB0aGUgc2Nhbm5pbmcgcmFuZ2Ugb2YgZ2V0X3ZpY3RpbSgpIGFyZSBVSU5UX01BWCwKPj4+Pj4g
YmFja2dyb3VuZCBHQyB3aWxsIHN0aWxsIG9jY3VyLiBBZGQgYSBjb25kaXRpb24gdG8gcHJldmVu
dCB0aGlzIHNpdHVhdGlvbi4KPj4+PiBGb3IgdGhpcyBjYXNlLCBmMmZzX2dldF92aWN0aW0oKSB3
aWxsIHJldHVybiAwLCBhbmQgZjJmc19nYygpIHdpbGwgdXNlIHVuY2hhbmdlZAo+Pj4+IHNlZ25v
IGZvciBHQz8KPj4+Pgo+Pj4+IFRoYW5rcywKPj4+IFlvdSdyZSByaWdodCwgc2Vnbm8gd29uJ3Qg
dXBkYXRlIGluIHRoaXMgc2NlbmFyaW8sIGFuZCB0aGlzIHBhdGNoIGZlYXR1cmUgaXMgcmVkdW5k
YW50Lgo+PiBPaCwgSSBtZWFudCwgaWYgZjJmc19nZXRfdmljdGltKCkgZmFpbHMgdG8gc2VsZWN0
IGEgdmFsaWQgdmljdGltIGR1ZSB0byB0aGUgcmVhc29uIHlvdQo+PiBkZXNjcmliZWQsIGYyZnNf
Z2V0X3ZpY3RpbSgpIHdpbGwgcmV0dXJuIDAsIGFuZCBmMmZzX2djKCkgd2lsbCBtaWdyYXRlIHNl
Z21lbnQgI05VTExfU0VHTk8/Cj4+IE9yIGFtIEkgbWlzc2luZyBzb21ldGhpbmc/Cj4+Cj4+IFRo
YW5rcywKPiAKPiBZZXMuIEluIHRoaXMgc2NlbmFyaW8sIHNpbmNlIGl0IHdvbid0IGVudGVyIHRo
ZXxwLm1pbl9jb3N0ID4gY29zdHxjb25kaXRpb24sfHAubWluX3NlZ25vfHdpbGwgcmV0YWluIGl0
cyBpbml0aWFsIHZhbHVlfHx8TlVMTF9TRUdOT3wuIFRoaXMgaXMgY29uc2lzdGVudCB3aXRoIHdo
YXQgeW91IGRlc2NyaWJlZC4KCkRvIHlvdSBoYXZlIGEgc2NyaXB0IHRvIHJlcHJvZHVjZSB0aGlz
IGJ1Zz8KClRoYW5rcywKCj4gCj4gCj4gVGhhbmtzLAo+IAo+IExpYW8KPiAKPj4+Cj4+PiBUaGFu
a3MsCj4+Pgo+Pj4gTGlhbwo+Pj4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogTGlhbyBZdWFuaG9uZyA8
bGlhb3l1YW5ob25nQHZpdm8uY29tPgo+Pj4+PiAtLS0KPj4+Pj4gwqDCoCBmcy9mMmZzL2djLmMg
fCA1ICsrKysrCj4+Pj4+IMKgwqAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+Pj4+
Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9nYy5jIGIvZnMvZjJmcy9nYy5jCj4+Pj4+IGlu
ZGV4IDRhOGMwOGY5NzBlMy4uZmZjMzE4ODQxNmY0IDEwMDY0NAo+Pj4+PiAtLS0gYS9mcy9mMmZz
L2djLmMKPj4+Pj4gKysrIGIvZnMvZjJmcy9nYy5jCj4+Pj4+IEBAIC05MzYsNiArOTM2LDExIEBA
IGludCBmMmZzX2dldF92aWN0aW0oc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCB1bnNpZ25lZCBp
bnQgKnJlc3VsdCwKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+Pj4+PiDCoMKgwqDCoMKg
wqAgfQo+Pj4+PiDCoMKgICvCoMKgwqAgaWYgKGYyZnNfc2JfaGFzX2Jsa3pvbmVkKHNiaSkgJiYg
cC5taW5fY29zdCA9PSBVSU5UX01BWCkgewo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0ID0gLUVO
T0RBVEE7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBnb3RvIG91dDsKPj4+Pj4gK8KgwqDCoCB9Cj4+
Pj4+ICsKPj4+Pj4gwqDCoMKgwqDCoMKgIC8qIGdldCB2aWN0aW0gZm9yIEdDX0FUL0FUX1NTUiAq
Lwo+Pj4+PiDCoMKgwqDCoMKgwqAgaWYgKGlzX2F0Z2MpIHsKPj4+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqAgbG9va3VwX3ZpY3RpbV9ieV9hZ2Uoc2JpLCAmcCk7CgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBs
aXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMu
c291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
