Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B58AE6782
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Jun 2025 15:57:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YsAI2S/u91cXauJXZVY4A3GXxtGjIMZpl1VktBLAW68=; b=I+4vBuHHeiwWdJxu74ppfMmBzK
	A4K9p9MbhpcL8sGzNe88MHlm2m/EKEqGZA1qxyZltHHH8nNrW7BB4crb4FkHV1+cK2jKv4XfM1IVI
	bqYbqAd8u0vmp6Np9AneMMKX0uUmLfXPGzIoJ2nHlcF4oQUbiKeXiGJWvAJdPuk33VBI=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uU495-0005jV-9C;
	Tue, 24 Jun 2025 13:57:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uU493-0005jF-Iv
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Jun 2025 13:57:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9ZcZGzGzE4dKOHLNW7Nsq3QyGYM4/9VjWylThKTs+os=; b=fb5R3+DLpGIP6jbfgGBm+uhGgw
 OD/K5dum8/QG1bL1biv9/azNSO6bgQw+Lluphf5Js67eRBvYB4wBCctxWiSML0Y9ztBFKDfjZevn+
 ZA3VtYlo6WnMH3mLCiKudqpVnXiqSOqXUfMG8GuZMNFJ9sK3eI17Cw2t7I/d9kVQGksk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9ZcZGzGzE4dKOHLNW7Nsq3QyGYM4/9VjWylThKTs+os=; b=deIaqiQhCisVwoa5mSLN31WBp/
 8t8WUmeOynYmFitQqryUiXXjjXlHwKGPoU3MUXJPdevhe9h38cj7IRduwKzKNGWsJSs4O+byOc6kJ
 c8OyGm435OW14jK3BFnTNnHTalT9lJyljo6Kqwghh8rPEForh/S9iXlgpWvsv8Wj9umY=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uU492-00037c-W2 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Jun 2025 13:57:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3B29D629D1;
 Tue, 24 Jun 2025 13:56:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62A71C4CEEE;
 Tue, 24 Jun 2025 13:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750773418;
 bh=BsVChafrGL+bcjLT8Z2LC1dEsY/A+W0KmI5n4itsrDc=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=SoxMggtQvcuMJ0IMEL0ZRBbKEYk2vKEXwCJ7F+sh4L2DyKhUJebU92CGIq0y62ug0
 ZMXwxItrgsVbYSKEsStnIT8XDm7fK1BSLKZsJSY4ZM8u/2PKBh5ZN1NZYqssqfIuV8
 z697YfPi+Ttw3I5zxUxuAvXIa+Yx1LoxRsILyZJMaYMZ3YvydCdtJtVffIjUEJGQM2
 Qz7VENK22BvvfSpjW+Mtr42YlSUK6PtBT+A4yPQJE8NPgyHKooXWW6mCTZsjkL17U5
 3rBSOMi+v446+yeEkJ985AwmzURg8F6Y6jzibqUTJ9ogARpq/I+hWv5ZErp6AI/Myg
 WD5CB4gzGZukA==
Message-ID: <2dcd431f-f4ae-4162-ae02-a7ae3b419e55@kernel.org>
Date: Tue, 24 Jun 2025 21:56:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sheng Yong <shengyong2021@gmail.com>,
 Jianan Huang <huangjianan@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org
References: <20250617055542.218681-1-huangjianan@xiaomi.com>
 <c89b359f-da89-4285-98c2-a98470a5f959@kernel.org>
 <5b27466d-4b39-432a-b7c3-b1918a0cc2d8@gmail.com>
Content-Language: en-US
In-Reply-To: <5b27466d-4b39-432a-b7c3-b1918a0cc2d8@gmail.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/6/17 21:13, Sheng Yong wrote: > On 6/17/25 19:37,
 Chao Yu via Linux-f2fs-devel wrote: >> On 6/17/25 13:55, Jianan Huang wrote:
 >>> When fewer pages are read, nr_pages may be smaller than nr_cp [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uU492-00037c-W2
Subject: Re: [f2fs-dev] [PATCH] f2fs: avoid splitting bio when reading
 multiple pages
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
Cc: shengyong1@xiaomi.com, wanghui33@xiaomi.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNS82LzE3IDIxOjEzLCBTaGVuZyBZb25nIHdyb3RlOgo+IE9uIDYvMTcvMjUgMTk6Mzcs
IENoYW8gWXUgdmlhIExpbnV4LWYyZnMtZGV2ZWwgd3JvdGU6Cj4+IE9uIDYvMTcvMjUgMTM6NTUs
IEppYW5hbiBIdWFuZyB3cm90ZToKPj4+IFdoZW4gZmV3ZXIgcGFnZXMgYXJlIHJlYWQsIG5yX3Bh
Z2VzIG1heSBiZSBzbWFsbGVyIHRoYW4gbnJfY3BhZ2VzLiBEdWUKPj4+IHRvIHRoZSBucl92ZWNz
IGxpbWl0LCB0aGUgY29tcHJlc3NlZCBwYWdlcyB3aWxsIGJlIHNwbGl0IGludG8gbXVsdGlwbGUK
Pj4+IGJpb3MgYW5kIHRoZW4gbWVyZ2VkIGF0IHRoZSBibG9jayBsZXZlbC4gSW4gdGhpcyBjYXNl
LCBucl9jcGFnZXMgc2hvdWxkCj4+PiBiZSB1c2VkIHRvIHByZS1hbGxvY2F0ZSBidmVjcy4KPj4+
Cj4+PiBTaWduZWQtb2ZmLWJ5OiBKaWFuYW4gSHVhbmcgPGh1YW5namlhbmFuQHhpYW9taS5jb20+
Cj4+PiBTaWduZWQtb2ZmLWJ5OiBTaGVuZyBZb25nIDxzaGVuZ3lvbmcxQHhpYW9taS5jb20+Cj4+
PiAtLS0KPj4+IMKgIGZzL2YyZnMvZGF0YS5jIHwgMTAgKysrKystLS0tLQo+Pj4gwqAgMSBmaWxl
IGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0t
Z2l0IGEvZnMvZjJmcy9kYXRhLmMgYi9mcy9mMmZzL2RhdGEuYwo+Pj4gaW5kZXggMzFlODkyODQy
NjI1Li5jNzc3M2IwOWQ4M2YgMTAwNjQ0Cj4+PiAtLS0gYS9mcy9mMmZzL2RhdGEuYwo+Pj4gKysr
IGIvZnMvZjJmcy9kYXRhLmMKPj4+IEBAIC0yMzAzLDcgKzIzMDMsOCBAQCBpbnQgZjJmc19yZWFk
X211bHRpX3BhZ2VzKHN0cnVjdCBjb21wcmVzc19jdHggCj4+PiAqY2MsIHN0cnVjdCBiaW8gKipi
aW9fcmV0LAo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBp
ZiAoIWJpbykgewo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYmlvID0gZjJmc19ncmFiX3Jl
YWRfYmlvKGlub2RlLCBibGthZGRyLCBucl9wYWdlcywKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGJpbyA9IGYyZnNfZ3JhYl9yZWFkX2Jpbyhpbm9kZSwgYmxrYWRkciwKPj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtYXgobnJfcGFnZXMsIGNjLT5ucl9jcGFn
ZXMpIC0gaSwKPj4KPj4gSGkgSmlhbmFuLAo+Pgo+PiBlLmcuCj4+Cj4+IFVzZXIgd2FudHMgdG8g
cmVhZCBwYWdlIFsxLCA1XSwKPj4gcGFnZSAjMSwyLDMsNCBsb2NhdGVzIGluIGNvbXByZXNzZWQg
YmxvY2sgIzEwMDAsMTAwMSwxMDAzLAo+PiBwYWdlICM1IGxvY2F0ZSBpbiBjb21wcmVzc2VkIGJs
b2NrICMxMDA0LDEwMDUKPj4KPj4gSXQgc3VibWl0cyBmaXJzdCBiaW8gdy8gYmxvY2sgIzEwMDAs
MTAwMQo+PiBJdCBhbGxvY2F0ZXMgc2Vjb25kIGJpbyB3LyBzaXplIG9mIG1heChucl9wYWdlcz0x
LCBucl9jcGFnZXM9MykgLSAyID0gMSA/Cj4+IEhvd2V2ZXIgYmxvY2sgIzEwMDMgYW5kIGJsb2Nr
ICMxMDA0LDEwMDUgY2FuIGJlIHJlYWRlZCBpbiBvbmUgYmlvLCB3ZQo+PiBzaG91bGQgYWxsb2Nh
dGUgbGFyZ2VyIGJpbyBmb3IgbGFzdCBjb250aW51b3VzIGJsb2NrcyB3aGljaCBjcm9zcyAKPj4g
Y2x1c3RlcnMuCj4gCj4gSGksIENoYW8sCj4gCj4gSSB0aGluayBgbWF4KG5yX3BhZ2VzLCBjYy0+
bnJfY3BhZ2VzKSAtIGlgIGNhbiByZXNlcnZlIGVub3VnaCB2ZWN0b3JzIGluIAo+IGJpbwo+IGZv
ciBsYXRlciByZWFkcy4gSUlVQywgdGhlIGNhc2UgYWJvdmUgaXM6Cj4gCj4gcmVhZCBwYWdlICMx
LDIsMyw0IGF0IGJsa2FkZHIgIzEwMDAsMTAwMSwxMDAzOgo+ICDCoCAqIG5yX3BhZ2VzPTUsIGNw
YWdlcz0zLCBmb3IgdGhlIGZpcnN0IGJpbzEsIHZlYz1tYXgoNSwzKS0wPTUgKDIgdmVjcyAKPiBh
cmUgdXNlZCkKPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgZm9yIHRoZSBzZWNvbmQgYmlvMiwgdmVjPW1heCg1LDMpLTI9MyAoMSB2ZWMgCj4gaXMg
dXNlZCkKCkhpIFlvbmcsCgpTb3JyeSBmb3IgdGhlIGRlbGF5LgoKQWJvdXQgdGhlIHNlY29uZCBi
aW8yICh2ZWM9bWF4KDUsMyktMj0zKSwgaW4gdGhpcyBwYXRjaCwgd2UgcGFzcyAKbnJfcGFnZXMg
aW5zdGVhZCBvZiBtYXhfbnJfcGFnZXMsIG5yX3BhZ2VzIHdpbGwgYmUgZGVjcmVhc2VkIHRvIDEg
cmF0aGVyIAp0aGFuIDUgd2hlbiB3ZSBhbGxvY2F0ZSBuZXcgYmlvLiBCZWNhdXNlIHdlIGFkZCBw
YWdlICMxLDIsMyw0IHRvIApkZWNvbXByZXNzX2N0eCBmaXJzdCwgYW5kIHRoZW4gcmVhZCBjbHVz
dGVyIGVudGlyZWx5LCBhdCB0aGF0IHRpbWUsIApucl9wYWdlcyBpcyAxPyBJSVJDLgoKVGhhbmtz
LAoKPiByZWFkIHBhZ2UgIzUgYXQgYmxrYWRkciAjMTAwNCwxMDA1LCBwcmV2IGJpbzIgaXMgc3Rp
bGwgYXZhaWxhYmxlCj4gIMKgICogbnJfcGFnZXM9MSwgY3BhZ2VzPTIsIHByZXYgYmlvMiwgMiB2
ZWNzIGxlZnQKPiAKPiAKPiBGb3IgY2FzZTogcGFnZSAjMSwyLDMsNCBhdCBjb21wcmVzc2VkIGJs
a2FkZHIgIzEwMDAsMTAwMSwxMDAzCj4gIMKgwqDCoMKgwqDCoMKgwqDCoCBwYWdlICM1LDYsNyw4
IGF0IGNvbXByZXNzZWQgYmxrYWRkciAjMTAwNCwxMDA1LDEwMDYKPiBJZiB3ZSBhcmUgcmVhZGlu
ZyBwYWdlWzEsNV0sIHdlIGNvdWxkIGRvIGNhbGN1bGF0aW9uIGFzIHRoZSBmb2xsb3dpbmc/Cj4g
Cj4gIMKgwqDCoCBtYXhfbnJfcGFnZXM9YWxpZ24obnJfcGFnZXMsIGNsdXN0ZXJfc2l6ZSkKPiAg
wqDCoMKgIG1heChtYXhfbnJfcGFnZXMsIGNjLT5ucl9jcGFnZXMpIC0gaQo+IAo+IAo+IHRoYW5r
cywKPiBzaGVuZ3lvbmcKPj4KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBmMmZzX3JhX29wX2ZsYWdzKHJhYyksCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgZm9saW8tPmluZGV4LCBmb3Jfd3JpdGUpOwo+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKElTX0VSUihiaW8pKSB7Cj4+PiBAQCAtMjM3Myw3ICsy
Mzc0LDYgQEAgc3RhdGljIGludCBmMmZzX21wYWdlX3JlYWRwYWdlcyhzdHJ1Y3QgaW5vZGUgCj4+
PiAqaW5vZGUsCj4+PiDCoMKgwqDCoMKgIHBnb2ZmX3QgaW5kZXg7Cj4+PiDCoCAjZW5kaWYKPj4+
IMKgwqDCoMKgwqAgdW5zaWduZWQgbnJfcGFnZXMgPSByYWMgPyByZWFkYWhlYWRfY291bnQocmFj
KSA6IDE7Cj4+PiAtwqDCoMKgIHVuc2lnbmVkIG1heF9ucl9wYWdlcyA9IG5yX3BhZ2VzOwo+Pgo+
PiBNYXliZSB3ZSBjYW4gYWxpZ24gYm90aCBzdGFydCBhbmQgZW5kIG9mIHJlYWQgcmFuZ2Ugdy8g
Y2x1c3Rlcl9zaXplLCAKPj4gYW5kIHVzZQo+PiBzdGFydCBhbmQgZW5kIGZvciBtYXhfbnJfcGFn
ZXMgY2FsY3VsYXRpb24sIHRoZW4gcGFzcyBpdCB0bwo+PiBmMmZzX3JlYWRfe211bHRpLHNpbmds
ZX1fcGFnZXMoKSwgc29tZXRoaW5nIGxpa2UgdGhpcz8KPj4KPj4gbWF4X25yX3BhZ2VzID0gcm91
bmRfdXAoZW5kX2lkeCwgY2x1c3Rlcl9zaXplKSAtCj4+IMKgwqDCoMKgwqDCoMKgIHJvdW5kX2Rv
d24oc3RhcnRfaWR4LCBjbHVzdGVyX3NpemUpOwo+Pgo+PiBJdHMgc2l6ZSBzaG91bGQgYWx3YXlz
IGNvdmVyIHNpemUgb2YgYWxsIGNwYWdlIGFuZC9vciBycGFnZS4KPj4KPj4gVGhhbmtzLAo+Pgo+
Pj4gwqDCoMKgwqDCoCBpbnQgcmV0ID0gMDsKPj4+IMKgwqDCoMKgwqAgbWFwLm1fcGJsayA9IDA7
Cj4+PiBAQCAtMjQwMCw3ICsyNDAwLDcgQEAgc3RhdGljIGludCBmMmZzX21wYWdlX3JlYWRwYWdl
cyhzdHJ1Y3QgaW5vZGUgCj4+PiAqaW5vZGUsCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgLyogdGhl
cmUgYXJlIHJlbWFpbmVkIGNvbXByZXNzZWQgcGFnZXMsIHN1Ym1pdCB0aGVtICovCj4+PiDCoMKg
wqDCoMKgwqDCoMKgwqAgaWYgKCFmMmZzX2NsdXN0ZXJfY2FuX21lcmdlX3BhZ2UoJmNjLCBpbmRl
eCkpIHsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9IGYyZnNfcmVhZF9tdWx0
aV9wYWdlcygmY2MsICZiaW8sCj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBtYXhfbnJfcGFnZXMsCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBucl9wYWdlcywKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZsYXN0X2Jsb2NrX2luX2JpbywKPj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJhYywgZmFs
c2UpOwo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZjJmc19kZXN0cm95X2NvbXByZXNz
X2N0eCgmY2MsIGZhbHNlKTsKPj4+IEBAIC0yNDMyLDcgKzI0MzIsNyBAQCBzdGF0aWMgaW50IGYy
ZnNfbXBhZ2VfcmVhZHBhZ2VzKHN0cnVjdCBpbm9kZSAKPj4+ICppbm9kZSwKPj4+IMKgIHJlYWRf
c2luZ2xlX3BhZ2U6Cj4+PiDCoCAjZW5kaWYKPj4+IC3CoMKgwqDCoMKgwqDCoCByZXQgPSBmMmZz
X3JlYWRfc2luZ2xlX3BhZ2UoaW5vZGUsIGZvbGlvLCBtYXhfbnJfcGFnZXMsICZtYXAsCj4+PiAr
wqDCoMKgwqDCoMKgwqAgcmV0ID0gZjJmc19yZWFkX3NpbmdsZV9wYWdlKGlub2RlLCBmb2xpbywg
bnJfcGFnZXMsICZtYXAsCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgJmJpbywgJmxhc3RfYmxvY2tfaW5fYmlvLCByYWMpOwo+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgIGlmIChyZXQpIHsKPj4+IMKgICNpZmRlZiBDT05GSUdfRjJGU19GU19DT01QUkVTU0lPTgo+
Pj4gQEAgLTI0NTAsNyArMjQ1MCw3IEBAIHN0YXRpYyBpbnQgZjJmc19tcGFnZV9yZWFkcGFnZXMo
c3RydWN0IGlub2RlIAo+Pj4gKmlub2RlLAo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
LyogbGFzdCBwYWdlICovCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAobnJfcGFn
ZXMgPT0gMSAmJiAhZjJmc19jbHVzdGVyX2lzX2VtcHR5KCZjYykpIHsKPj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0ID0gZjJmc19yZWFkX211bHRpX3BhZ2VzKCZjYywg
JmJpbywKPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgbWF4X25yX3BhZ2VzLAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBucl9wYWdlcywKPj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJmxhc3RfYmxvY2tfaW5f
YmlvLAo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCByYWMsIGZhbHNlKTsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgZjJmc19kZXN0cm95X2NvbXByZXNzX2N0eCgmY2MsIGZhbHNlKTsKPj4KPj4KPj4KPj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gTGludXgt
ZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vm
b3JnZS5uZXQKPj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8v
bGludXgtZjJmcy1kZXZlbAo+IAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRl
dmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9s
aXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
