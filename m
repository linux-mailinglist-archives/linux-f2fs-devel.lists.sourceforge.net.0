Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C2A43F50E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 Oct 2021 04:47:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mgHvE-0001BA-Ss; Fri, 29 Oct 2021 02:47:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1mgHvD-0001Az-Ts
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 Oct 2021 02:47:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PtXOk9JFB0N6iJwX5Ys8MNlCBawQZXqBVsqWfjXNFAU=; b=IF/7swGPhwTt2cGnIj/e9H+iU4
 Di4wqiQ2wXbOS9/5FYbM8mYgQXi+dGSX/xUWmkmUi2fZuG5OwxL2KI24CHLvNl1NwT4s+MRpszIcG
 Rw9UlHGEjGSuxzbgLJtcvYaWKr+6k+A9P3DwmKkAAOibtYWvCwE1pJeQsvqk2YCmbpF8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:From:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PtXOk9JFB0N6iJwX5Ys8MNlCBawQZXqBVsqWfjXNFAU=; b=lxbXQ+ZXJhJtPZ4KR8PlomRwD8
 WKOm2NrU3UE0X+pxfALVGgpxlN+temefrWYh+cC1kJJu/5GHeSR29xUuvHpvQj9RKYqCCjV0Nw+vg
 SXwsDTUghH9yheUr/nagcPbqpgaPzl3OMQ1kNfrplq7nSc0Q95i/S3Kp813AjpGAH7LE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.92.3)
 id 1mgHrE-004hqN-T4
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 Oct 2021 02:47:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B34B9610E8;
 Fri, 29 Oct 2021 02:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635474857;
 bh=k+q5cwoUghGqcxAWgg2DvpUzWPsMNg2BWCU7/8wFZa4=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=Wjlt4z8uedxdmPbxVmntoWKxUtK1PCMg6UhhRS2GjRL5BPldvNWCkCuNNk5c6QY7t
 EAHlcGlVj0LmFtRsg+KtLAOxFOoddwdGDKnvf7mkjtsZEP4KbrPfAjXJGuigL2kxdj
 zREKIPRrchp4xGG1eEl+4qm/C6pwfIIQ0MwpuwXXGOokqeH/MOlAflGSzhudm8VyAX
 NA6qFggxKuibIyeNOOTiZa6hs7gP6akDvleMi+WEYtuCDM2+/AAPHZvjsj93QrpWe2
 fy0AnFYAfWKw8s0WOJsV+uUjreJoUXREWnptT7NLxKFoRPDLjPMcX/qWw5xYi+9Teb
 Aly8eiIr9mzXg==
Message-ID: <dec765de-407b-07c3-75f6-ec7f71c618b7@kernel.org>
Date: Fri, 29 Oct 2021 10:34:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.3
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210928151911.11189-1-chao@kernel.org>
 <YVNoHudG5c65X85G@google.com>
 <65f6c366-9e5b-fe7f-7c38-061996d1882b@kernel.org>
In-Reply-To: <65f6c366-9e5b-fe7f-7c38-061996d1882b@kernel.org>
X-Headers-End: 1mgHrE-004hqN-T4
Subject: Re: [f2fs-dev] [PATCH] f2fs: skip f2fs_preallocate_blocks() for
 overwrite case
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

UGluZywKCk9uIDIwMjEvOS8yOSA4OjA1LCBDaGFvIFl1IHdyb3RlOgo+IE9uIDIwMjEvOS8yOSAz
OjA4LCBKYWVnZXVrIEtpbSB3cm90ZToKPj4gT24gMDkvMjgsIENoYW8gWXUgd3JvdGU6Cj4+PiBJ
biBmMmZzX2ZpbGVfd3JpdGVfaXRlcigpLCBsZXQncyB1c2UgZjJmc19vdmVyd3JpdGVfaW8oKSB0
bwo+Pj4gY2hlY2sgd2hldGhlcmUgaXQgaXMgb3ZlcndyaXRlIGNhc2UsIGZvciBzdWNoIGNhc2Us
IHdlIGNhbiBza2lwCj4+PiBmMmZzX3ByZWFsbG9jYXRlX2Jsb2NrcygpIGluIG9yZGVyIHRvIGF2
b2lkIGYyZnNfZG9fbWFwX2xvY2soKSwKPj4+IHdoaWNoIG1heSBiZSBibG9ja2VkIGJ5IGNoZWNr
cG9pbnQoKSBwb3RlbnRpYWxseS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBDaGFvIFl1IDxjaGFv
QGtlcm5lbC5vcmc+Cj4+PiAtLS0KPj4+IMKgIGZzL2YyZnMvZmlsZS5jIHwgNCArKysrCj4+PiDC
oCAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2Zz
L2YyZnMvZmlsZS5jIGIvZnMvZjJmcy9maWxlLmMKPj4+IGluZGV4IDEzZGVhZTAzZGYwNi4uNTFm
ZWNiMmY0ZGI1IDEwMDY0NAo+Pj4gLS0tIGEvZnMvZjJmcy9maWxlLmMKPj4+ICsrKyBiL2ZzL2Yy
ZnMvZmlsZS5jCj4+PiBAQCAtNDMyMSw2ICs0MzIxLDEwIEBAIHN0YXRpYyBzc2l6ZV90IGYyZnNf
ZmlsZV93cml0ZV9pdGVyKHN0cnVjdCBraW9jYiAqaW9jYiwgc3RydWN0IGlvdl9pdGVyICpmcm9t
KQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHByZWFsbG9jYXRlZCA9IHRydWU7Cj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgdGFyZ2V0X3NpemUgPSBpb2NiLT5raV9wb3MgKyBpb3ZfaXRlcl9jb3VudChm
cm9tKTsKPj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoZjJmc19vdmVyd3JpdGVfaW8oaW5vZGUsIGlv
Y2ItPmtpX3BvcywKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGlvdl9pdGVyX2NvdW50KGZyb20pKSkKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGdvdG8gd3JpdGU7Cj4+Cj4+IFRoaXMgY2FsbHMgZjJmc19tYXBfYmxvY2tzKCkgd2hpY2ggY2Fu
IGJlIGR1cGxpY2F0ZSwgaWYgaXQncyBub3QgdGhlIG92ZXJ3aXJ0ZQo+PiBjYXNlLiBEbyB3ZSBo
YXZlIG90aGVyIGJlbmVmaXQ/Cj4gCj4gZjJmc19vdmVyd3JpdGVfaW8oKSB3aWxsIGJyZWFrIGZv
ciBhcHBlbmQgd3JpdGUgY2FzZSB3LyBiZWxvdyBjaGVjazoKPiAKPiAgwqDCoMKgwqBpZiAocG9z
ICsgbGVuID4gaV9zaXplX3JlYWQoaW5vZGUpKQo+ICDCoMKgwqDCoMKgwqDCoCByZXR1cm4gZmFs
c2U7Cj4gCj4gSSBndWVzcyB3ZSBtYXkgb25seSBzdWZmZXIgZG91YmxlIGYyZnNfbWFwX2Jsb2Nr
cygpIGZvciB3cml0ZSBob2xlCj4gY2FzZSwgZS5nLiB0cnVuY2F0ZSB0byBsYXJnZSBzaXplICYg
d3JpdGUgaW5zaWRlIHRoZSBmaWxlc2l6ZS4gRm9yCj4gdGhpcyBjYXNlLCBob3cgYWJvdXQgYWRk
aW5nIGEgY29uZGl0aW9uIHRvIGFsbG93IGRvdWJsZSBmMmZzX21hcF9ibG9ja3MoKQo+IG9ubHkg
aWYgd3JpdGUgc2l6ZSBpcyBzbWFsbGVyIHRoYW4gYSB0aHJlc2hvbGQ/Cj4gCj4gVGhhbmtzLAo+
IAo+Pgo+Pj4gKwo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGVyciA9IGYyZnNfcHJlYWxsb2NhdGVf
YmxvY2tzKGlvY2IsIGZyb20pOwo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChlcnIpIHsKPj4+
IMKgIG91dF9lcnI6Cj4+PiAtLSAKPj4+IDIuMzIuMAo+IAo+IAo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5n
IGxpc3QKPiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+IGh0dHBzOi8v
YXBjMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUy
Rmxpc3RzLnNvdXJjZWZvcmdlLm5ldCUyRmxpc3RzJTJGbGlzdGluZm8lMkZsaW51eC1mMmZzLWRl
dmVsJmFtcDtkYXRhPTA0JTdDMDElN0NjaGFvLnl1JTQwb3Bwby5jb20lN0M0MjFjMDY4MTJlYmE0
ZjkyMmIwOTA4ZDk4MmRjZGNjNSU3Q2YxOTA1ZWIxYzM1MzQxYzU5NTE2NjJiNGE1NGI1ZWU2JTdD
MCU3QzAlN0M2Mzc2ODQ3MDczNzQ5NDAxOTAlN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lq
b2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4w
JTNEJTdDMTAwMCZhbXA7c2RhdGE9dTIyZUVXREFQYUFaQ3lJU3lqVFVPdFFETER1eUt4VG5OQ0kz
ZVN3d1dybyUzRCZhbXA7cmVzZXJ2ZWQ9MAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYy
ZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2Uu
bmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
