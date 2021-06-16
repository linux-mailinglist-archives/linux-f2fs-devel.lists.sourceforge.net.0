Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B453A9A8F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Jun 2021 14:37:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ltUmm-0004dj-Iv; Wed, 16 Jun 2021 12:36:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1ltUmk-0004db-Lg
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 16 Jun 2021 12:36:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CdXkZF48mqGXYPWQVL8A+l0ZkTeLvLSNKPi1CIAsvmg=; b=Vo2P46RT8VM5xyb2HiL/u9H4JO
 HR5X9jTTh4T1gIfw8hbqYKPUZ15RINDXLZSHd2HbZkFXosLP0kFcb9RG0snZF/UXVH0eg4NzZL2ir
 l2k0/qXuKAX9F4pzjBqnsA8/7bS+HMkgKD/EGnWC4KXWVwjVthQ7/JNARo3FcTnwFeIs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CdXkZF48mqGXYPWQVL8A+l0ZkTeLvLSNKPi1CIAsvmg=; b=BEZWcS4R51C8Pb8PMsOFYb0+Ue
 4r8D068DvynlajjrXc6cgSlkwhcNHWjj/CqdNo5VKcfPIUh4mDJ5BpGTIkBxQTM1eTM6vud6qycAi
 73kLzRrsz7mdxdtiOg3ITGKFwTs8As46Z3hCu6B9nunDEAKKC6RBc9VDJ31BT5cKtdhU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1ltUmc-00CJsr-T8
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 16 Jun 2021 12:36:50 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BA7F561166;
 Wed, 16 Jun 2021 12:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623846979;
 bh=7ZuuEyAytr6xeZN/laWbjM8f3Jl75UtVgZnXZO8r/3I=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=IT/RWaekNClB4x0hI5oDif4Ctkd8wyqfqLWqrFyB33eb+JEx3VRISlO1psO3yRBst
 VPMWXpHbs2LBc+j299vAYXfFkMGJsRx18yONksG790pVtmB3WSVYvZq6vDSAN5cCwQ
 rrv9YtkLoM+fU5Z3S/SwNKQOttV9CB4Wp2Vli3vdfLmPzKeP0etZKjEt1mVj45MSib
 wQJaJ+oChewldcjzic0tJ7NWTuLEyAGM5fVhYU98Llt14gTJXvEuFXxCf/d6mq2dNW
 yH7l8J0gBQV5q26yt0LWxg8diLTUtYq7xoBn1ECWzTMUBHoKlC4h5KEdmPtP5nXeUs
 cVcAURzH+LRxQ==
To: Sun Ke <sunke32@huawei.com>, fstests@vger.kernel.org, guan@eryu.me,
 yuchao0@huawei.com, linux-f2fs-devel@lists.sourceforge.net
References: <20210611112211.1408767-1-sunke32@huawei.com>
 <d95c4ac2-50a2-4f08-3940-ac0597266280@huawei.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <258b1228-2a8a-e4c1-cf6c-695f49c0cca0@kernel.org>
Date: Wed, 16 Jun 2021 20:36:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d95c4ac2-50a2-4f08-3940-ac0597266280@huawei.com>
Content-Language: en-US
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: lkml.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 NICE_REPLY_A           Looks like a legit reply (A)
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ltUmc-00CJsr-T8
Subject: Re: [f2fs-dev] [PATCH] common/rc: f2fs do not support metadata
 journaling
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMS82LzE1IDExOjI1LCBTdW4gS2Ugd3JvdGU6Cj4gCj4gCj4g5ZyoIDIwMjEvNi8xMSAx
OToyMiwgU3VuIEtlIOWGmemBkzoKPj4gSW4gZ2VuZXJpYy81MCwgdG91Y2ggMTAwIGZpbGVzLCBn
byBkb3duIHRoZSBmcyBpbW1lZGlhdGVseSwgVGhlbiB1bW91bnQKPj4gYW5kIHNldCB0aGUgZGlz
ayByZWFkaS1vbmx5LiBUcnkgdG8gbW91bnQgaXQgYWdhaW4gd2l0aG91dCBcLW8KPj4gbm9yZWNv
dmVyeVwsIGl0IHNob3VsZCBmYWlsLCBiZWNhdXNlIGl0IGNhbiBub3QgcmVjb3Zlcnkgb24gYSBy
ZWFkLW9ubHkKPj4gZGV2aWNlLiBCdXQgZjJmcyBtb3VudCBzdWNjZXNzZnVsbHkgYW5kIHRoZSB0
ZXN0IGZhaWwuCj4+Cj4+IGYyZnMgc2VlbXMgZG8gbm90IHN1cHBvcnQgbWV0YWRhdGEgam91cm5h
bGluZy4KCkl0IGxvb2tzIG5vdCBjb3JyZWN0LgoKRllJLAoKaHR0cHM6Ly9sa21sLm9yZy9sa21s
LzIwMjEvMy8yMy83NQoKVGhhbmtzLAoKPj4KPj4gU2lnbmVkLW9mZi1ieTogU3VuIEtlIDxzdW5r
ZTMyQGh1YXdlaS5jb20+Cj4+IC0tLQo+Pgo+PiBJIGFtIG5vdCB2ZXJ5IHN1cmUgaWYgZjJmcyBk
byBub3Qgc3VwcG9ydCBtZXRhZGF0YSBqb3VybmFsaW5nLgo+Pgo+PiAjIyMKPj4gYmVmb3JlIGNo
YW5nZQo+PiAjIyMKPj4gW3Jvb3RAbG9jYWxob3N0IHhmc3Rlc3RzLWRldl0jIC4vY2hlY2sgdGVz
dHMvZ2VuZXJpYy8wNTAKPj4gRlNUWVDCoMKgwqDCoMKgwqDCoMKgIC0tIGYyZnMKPj4gUExBVEZP
Uk3CoMKgwqDCoMKgIC0tIExpbnV4L3g4Nl82NCBsb2NhbGhvc3QgNS4xMi4wLXJjNS1uZXh0LTIw
MjEwMzMwICM4IFNNUCBUdWUgSnVuIDggMTE6MDk6MzcgQ1NUIDIwMjEKPj4gTUtGU19PUFRJT05T
wqAgLS0gL2Rldi9zZGIKPj4gTU9VTlRfT1BUSU9OUyAtLSAtbyBhY2wsdXNlcl94YXR0ciAvZGV2
L3NkYiAvdG1wL3NjcmF0Y2gKPj4KPj4gZ2VuZXJpYy8wNTAgNHMgLi4uIC0gb3V0cHV0IG1pc21h
dGNoIChzZWUgL3Jvb3Qvd29yay94ZnN0ZXN0cy1kZXYvcmVzdWx0cy8vZ2VuZXJpYy8wNTAub3V0
LmJhZCkKPj4gwqDCoMKgwqAgLS0tIHRlc3RzL2dlbmVyaWMvMDUwLm91dMKgwqAgMjAyMS0wNS0z
MSAxNTozNzo0MC4wMDAwMDAwMDAgKzA4MDAKPj4gwqDCoMKgwqAgKysrIC9yb290L3dvcmsveGZz
dGVzdHMtZGV2L3Jlc3VsdHMvL2dlbmVyaWMvMDUwLm91dC5iYWTCoMKgwqAgMjAyMS0wNi0xMSAx
Njo0ODoxOS45OTMwMDAwMDAgKzA4MDAKPj4gwqDCoMKgwqAgQEAgLTEzLDkgKzEzLDcgQEAKPj4g
wqDCoMKgwqDCoCBzZXR0aW5nIGRldmljZSByZWFkLW9ubHkKPj4gwqDCoMKgwqDCoCBtb3VudGlu
ZyBmaWxlc3lzdGVtIHRoYXQgbmVlZHMgcmVjb3Zlcnkgb24gYSByZWFkLW9ubHkgZGV2aWNlOgo+
PiDCoMKgwqDCoMKgIG1vdW50OiBkZXZpY2Ugd3JpdGUtcHJvdGVjdGVkLCBtb3VudGluZyByZWFk
LW9ubHkKPj4gwqDCoMKgwqAgLW1vdW50OiBjYW5ub3QgbW91bnQgZGV2aWNlIHJlYWQtb25seQo+
PiDCoMKgwqDCoMKgIHVubW91bnRpbmcgcmVhZC1vbmx5IGZpbGVzeXN0ZW0KPj4gwqDCoMKgwqAg
LXVtb3VudDogU0NSQVRDSF9ERVY6IG5vdCBtb3VudGVkCj4+IMKgwqDCoMKgwqAgbW91bnRpbmcg
ZmlsZXN5c3RlbSB3aXRoIC1vIG5vcmVjb3Zlcnkgb24gYSByZWFkLW9ubHkgZGV2aWNlOgo+PiDC
oMKgwqDCoCAuLi4KPj4gwqDCoMKgwqAgKFJ1biAnZGlmZiAtdSAvcm9vdC93b3JrL3hmc3Rlc3Rz
LWRldi90ZXN0cy9nZW5lcmljLzA1MC5vdXQgL3Jvb3Qvd29yay94ZnN0ZXN0cy1kZXYvcmVzdWx0
cy8vZ2VuZXJpYy8wNTAub3V0LmJhZCfCoCB0byBzZWUgdGhlIGVudGlyZSBkaWZmKQo+PiBSYW46
IGdlbmVyaWMvMDUwCj4+IEZhaWx1cmVzOiBnZW5lcmljLzA1MAo+PiBGYWlsZWQgMSBvZiAxIHRl
c3RzCj4+Cj4+ICMjIwo+PiBhZnRlciBjaGFuZ2UKPj4gIyMjCj4+IFtyb290QGxvY2FsaG9zdCB4
ZnN0ZXN0cy1kZXZdIyAuL2NoZWNrIHRlc3RzL2dlbmVyaWMvMDUwCj4+IEZTVFlQwqDCoMKgwqDC
oMKgwqDCoCAtLSBmMmZzCj4+IFBMQVRGT1JNwqDCoMKgwqDCoCAtLSBMaW51eC94ODZfNjQgbG9j
YWxob3N0IDUuMTIuMC1yYzUtbmV4dC0yMDIxMDMzMCAjOCBTTVAgVHVlIEp1biA4IDExOjA5OjM3
IENTVCAyMDIxCj4+IE1LRlNfT1BUSU9OU8KgIC0tIC9kZXYvc2RiCj4+IE1PVU5UX09QVElPTlMg
LS0gLW8gYWNsLHVzZXJfeGF0dHIgL2Rldi9zZGIgL3RtcC9zY3JhdGNoCj4+Cj4+IGdlbmVyaWMv
MDUwIDRzIC4uLsKgIDRzCj4+IFJhbjogZ2VuZXJpYy8wNTAKPj4gUGFzc2VkIGFsbCAxIHRlc3Rz
Cj4+Cj4+Cj4+Cj4+IMKgIGNvbW1vbi9yYyB8IDIgKy0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9jb21tb24vcmMg
Yi9jb21tb24vcmMKPj4gaW5kZXggYTBhYTczMDAuLjQyOGI4YjgwIDEwMDY0NAo+PiAtLS0gYS9j
b21tb24vcmMKPj4gKysrIGIvY29tbW9uL3JjCj4+IEBAIC0zNTQzLDcgKzM1NDMsNyBAQCBfaGFz
X21ldGFkYXRhX2pvdXJuYWxpbmcoKQo+PiDCoMKgwqDCoMKgIGZpCj4+IMKgwqDCoMKgwqAgY2Fz
ZSAiJEZTVFlQIiBpbgo+PiAtwqDCoMKgIGV4dDJ8dmZhdHxtc2Rvc3x1ZGZ8ZXhmYXR8dG1wZnMp
Cj4+ICvCoMKgwqAgZXh0Mnx2ZmF0fG1zZG9zfHVkZnxleGZhdHx0bXBmc3xmMmZzKQo+PiDCoMKg
wqDCoMKgwqDCoMKgwqAgZWNobyAiJEZTVFlQIGRvZXMgbm90IHN1cHBvcnQgbWV0YWRhdGEgam91
cm5hbGluZyIKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAxCj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCA7Owo+Pgo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiBMaW51eC1mMmZzLWRl
dmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0
L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApM
aW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJj
ZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
