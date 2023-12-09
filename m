Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA3080B377
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  9 Dec 2023 10:46:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rBtur-0004NG-ND;
	Sat, 09 Dec 2023 09:46:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rBtup-0004N9-Iv
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 09 Dec 2023 09:46:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2TMkV4AG0kEfZnc3zS3V+8rS6AEqRDtPbhRFLUuMFmM=; b=MrvM8pRClmpwHHZgWUhjWlyKrO
 C08VmpS60deKxI3jaygIx+fs09F4lRnErusM+041eIiSVdiP4gYvZPa88+BMdrnqfuopG6AkhN9LI
 5U/mrlGnWExloYp04ZgBBuIo0RmuuwnlMjpWY/Cn6xRimZIEQbqVJ5BYOMXXsv3Mw/WM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2TMkV4AG0kEfZnc3zS3V+8rS6AEqRDtPbhRFLUuMFmM=; b=c5ldAZOGyNNQcczQf1J9V7uTxx
 SVQ+lrvX1QaFy9ACrWloIePGLfeoe7kPbddBjbJlZuny1bILCIS2yb5DC6Tc+FHUpFKIRtlO4W2Sa
 +YhinNQDQ6ItJh83y4DEdBqIppa1W3Z+LXq1Pi3l4Lh1gJDVz05DMEDsfLoFM8Y6ZMV8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rBtup-0001uR-2R for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 09 Dec 2023 09:46:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9FA2060B35;
 Sat,  9 Dec 2023 09:46:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62F4CC433C8;
 Sat,  9 Dec 2023 09:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702115180;
 bh=U6fopzDLFmxYGajaPyLdrMDyEnvHoP8CkiUHB46VBno=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=nW/JZt39Ty/3imZv1AcZJYalRbm4XnTAjssBuReN6HI66CRfpEeYo1GXnhdhltOCP
 8FNWETVMMxjFg3GBDpZerh7Lq20+McFbq8jaxqF+tVIyyG4h12T4SIkkJ5vryh8iVF
 nvde1AGf17vezhETL/+1/xET64aZJDHV7VZIz/NQPEayu10fSdAun4WieXdEOKvymW
 MLsHgWuhzqNyHCgvqj2+1eBfzOt1jkKrg61NKoBapSc80GtYDv1vY+QsJdbpA68Arv
 bxZs/g7BDigHG1ffFaZzznJeRyhgsjfX3Nzh+I/rWv6YLy0R8r+9Rx20rCkdLefO0U
 HGSl6RzCMy66g==
Message-ID: <09cd02dd-a8d9-4b7a-8f10-b445e2c9ea85@kernel.org>
Date: Sat, 9 Dec 2023 17:46:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Wu Bo <wubo.oduw@gmail.com>, Wu Bo <bo.wu@vivo.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20231030094024.263707-1-bo.wu@vivo.com>
 <c181256e-9f6e-d43e-4d02-a7d8d5286d56@kernel.org>
 <670ce4a6-f00c-dbe9-86e2-366311221cf3@gmail.com>
 <a69b7544-2312-486c-d655-8b86e370c55e@kernel.org>
 <faa90acc-c03e-2913-c19a-bd50fd93d197@gmail.com>
 <5d8726fc-e912-6954-3820-862eecff07b0@kernel.org>
 <eedad403-5754-4d5e-965d-19eff02e3d40@gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <eedad403-5754-4d5e-965d-19eff02e3d40@gmail.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/11/28 20:51, Wu Bo wrote: > > On 2023/11/28 14:22,
 Chao Yu wrote: >> On 2023/11/17 7:34, Wu Bo wrote: >>> On 2023/11/11 12:49,
 Chao Yu wrote: >>>> On 2023/11/8 21:48, Wu Bo wrote: >>>>> On 202 [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rBtup-0001uR-2R
Subject: Re: [f2fs-dev] [PATCH 1/1] f2fs: fix fallocate failed under pinned
 block situation
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

T24gMjAyMy8xMS8yOCAyMDo1MSwgV3UgQm8gd3JvdGU6Cj4gCj4gT24gMjAyMy8xMS8yOCAxNDoy
MiwgQ2hhbyBZdSB3cm90ZToKPj4gT24gMjAyMy8xMS8xNyA3OjM0LCBXdSBCbyB3cm90ZToKPj4+
IE9uIDIwMjMvMTEvMTEgMTI6NDksIENoYW8gWXUgd3JvdGU6Cj4+Pj4gT24gMjAyMy8xMS84IDIx
OjQ4LCBXdSBCbyB3cm90ZToKPj4+Pj4gT24gMjAyMy8xMS83IDIyOjM5LCBDaGFvIFl1IHdyb3Rl
Ogo+Pj4+Pj4gT24gMjAyMy8xMC8zMCAxNzo0MCwgV3UgQm8gd3JvdGU6Cj4+Pj4+Pj4gSWYgR0Mg
dmljdGltIGhhcyBwaW5uZWQgYmxvY2ssIGl0IGNhbid0IGJlIHJlY3ljbGVkLgo+Pj4+Pj4+IEFu
ZCBpZiBHQyBpcyBmb3JlZ3JvdW5kIHJ1bm5pbmcsIGFmdGVyIG1hbnkgZmFpbHVyZSB0cnksIHRo
ZSBwaW5uZWQgZmlsZQo+Pj4+Pj4+IGlzIGV4cGVjdGVkIHRvIGJlIGNsZWFyIHBpbiBmbGFnLiBU
byBlbmFibGUgdGhlIHNlY3Rpb24gYmUgcmVjeWNsZWQuCj4+Pj4+Pj4KPj4+Pj4+PiBCdXQgd2hl
biBmYWxsb2NhdGUgdHJpZ2dlciBGR19HQywgR0MgY2FuIG5ldmVyIHJlY3ljbGUgdGhlIHBpbm5l
ZAo+Pj4+Pj4+IHNlY3Rpb24uIEJlY2F1c2UgR0Mgd2lsbCBnbyB0byBzdG9wIGJlZm9yZSB0aGUg
ZmFpbHVyZSB0cnkgbWVldCB0aGUKPj4+Pj4+PiB0aHJlc2hvbGQ6Cj4+Pj4+Pj4gwqDCoMKgwqDC
oGlmIChoYXNfZW5vdWdoX2ZyZWVfc2VjcyhzYmksIHNlY19mcmVlZCwgMCkpIHsKPj4+Pj4+PiDC
oMKgwqDCoMKgwqDCoMKgIGlmICghZ2NfY29udHJvbC0+bm9fYmdfZ2MgJiYKPj4+Pj4+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgdG90YWxfc2VjX2ZyZWVkIDwgZ2NfY29udHJvbC0+bnJfZnJl
ZV9zZWNzKQo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGdvX2djX21vcmU7
Cj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCBnb3RvIHN0b3A7Cj4+Pj4+Pj4gwqDCoMKgwqDCoH0K
Pj4+Pj4+Pgo+Pj4+Pj4+IFNvIHdoZW4gZmFsbG9jYXRlIHRyaWdnZXIgRkdfR0MsIGF0IGxlYXN0
IHJlY3ljbGUgb25lLgo+Pj4+Pj4KPj4+Pj4+IEhtbS4uLiBpdCBtYXkgYnJlYWsgcGluZmlsZSdz
IHNlbWFudGljcyBhdCBsZWFzdCBvbiBvbmUgcGlubmVkIGZpbGU/Cj4+Pj4+PiBJbiB0aGlzIGNh
c2UsIEkgcHJlZmVyIHRvIGZhaWwgZmFsbG9jYXRlKCkgcmF0aGVyIHRoYW4gdW5waW5uaW5nIGZp
bGUsCj4+Pj4+PiBpbiBvcmRlciB0byBhdm9pZCBsZWF2aW5nIGludmFsaWQgTEJBIHJlZmVyZW5j
ZXMgb2YgdW5waW5uZWQgZmlsZSBoZWxkCj4+Pj4+PiBieSB1c2Vyc3BhY2UuCj4+Pj4+Cj4+Pj4+
IEFzIGYyZnMgZGVzaWduZWQgbm93LCBGR19HQyBpcyBhYmxlIHRvIHVucGluIHRoZSBwaW5uZWQg
ZmlsZS4KPj4+Pj4KPj4+Pj4gZmFsbG9jYXRlKCkgdHJpZ2dlcmVkIEZHX0dDLCBidXQgY2FuJ3Qg
cmVjeWNsZSBzcGFjZS7CoCBJdCBicmVha3MgdGhlCj4+Pj4+IGRlc2lnbiBsb2dpYyBvZiBGR19H
Qy4KPj4+Pgo+Pj4+IFllcywgY29udHJhZGljdG9yaW5lc3MgZXhpc3RzLgo+Pj4+Cj4+Pj4gSU1P
LCB1bnBpbiBmaWxlIGJ5IEdDIGxvb2tzIG1vcmUgZGFuZ2Vyb3VzLCBpdCBtYXkgY2F1c2UgcG90
ZW50aWFsIGRhdGEKPj4+PiBjb3JydXB0aW9uIHcvIGJlbG93IGNhc2U6Cj4+Pj4gMS4gYXBwIHBp
bnMgZmlsZSAmIGhvbGRzIExCQXMgb2YgZGF0YSBibG9ja3MuCj4+Pj4gMi4gR0MgdW5waW5zIGZp
bGUgYW5kIG1pZ3JhdGVzIGl0cyBkYXRhIHRvIG5ldyBMQkFzLgo+Pj4+IDMuIG90aGVyIGZpbGUg
cmV1c2VzIHByZXZpb3VzIExCQXMuCj4+Pj4gNC4gYXBwIHJlYWQvd3JpdGUgZGF0YSB2aWEgcHJl
dmlvdXMgTEJBcy4KPj4+Pgo+Pj4+IFNvIEkgc3VnZ2VzdCB0byBub3JtYWxpemUgdXNlIG9mIHBp
bmZpbGUgYW5kIGRvIG5vdCBhZGQgbW9yZSB1bnBpbiBjYXNlcwo+Pj4+IGluIGZpbGVzeXN0ZW0g
aW5uZXIgcHJvY2Vzc2VzLgo+Pj4+Cj4+Pj4+Cj4+Pj4+IFRoaXMgaXNzdWUgaXMgaGFwcGVuZWQg
aW4gQW5kcm9pZCBPVEEgc2NlbmFyaW8uwqAgZmFsbG9jYXRlKCkgYWx3YXlzCj4+Pj4+IHJldHVy
biBmYWlsdXJlIGNhdXNlIE9UQSBmYWlsLgo+Pj4+Cj4+Pj4gQ2FuIHlvdSBwbGVhc2UgY2hlY2sg
d2h5IG90aGVyIHBpbm5lZCBmaWxlcyB3ZXJlIHNvIGZyYWdtZW50ZWQgdGhhdCBmMmZzX2djKCkK
Pj4+PiBjYW4gbm90IHJlY3ljbGUgb25lIGZyZWUgc2VjdGlvbj8KPj4+Pgo+Pj4gTm90IGJlY2F1
c2UgcGlubmVkIGZpbGVzIHdlcmUgZnJhZ21lbnRlZCwgYnV0IGlmIHRoZSBHQyB2aWN0aW0gc2Vj
dGlvbiBoYXMgb25lIGJsb2NrIGlzIHBpbm5lZCB3aWxsIGNhdXNlIHRoaXMgaXNzdWUuCj4+Pgo+
Pj4gSWYgdGhlIHNlY3Rpb24gZG9uJ3QgdW5waW4gdGhlIGJsb2NrLCBpdCBjYW4ndCBiZSByZWN5
Y2xlZC4gQnV0IHRoZXJlIGlzIGhpZ2ggY2hhbmNlIHRoYXQgdGhlIHBpbm5lZCBzZWN0aW9uIHdp
bGwgYmUgY2hvc2VuIG5leHQgdGltZSB1bmRlciBmMmZzIGN1cnJlbnQgdmljdGltIHNlbGVjdGlv
biBzdHJhdGVneS4KPj4+Cj4+PiBTbyBpZiB3ZSB3YW50IHRvIGF2b2lkIHVucGluIGZpbGVzLCBJ
IHRoaW5rIGNoYW5nZSB2aWN0aW0gc2VsZWN0aW9uIHRvIGNvbnNpZGVyaW5nIHBpbm5lZCBibG9j
a3MgY2FuIGZpeCB0aGlzIGlzc3VlLgo+Pgo+PiBPaCwgSSBnZXQgaXQuCj4+Cj4+IEhvdyBhYm91
dCB0aGlzPwo+Pgo+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9maWxlLmMgYi9mcy9mMmZzL2ZpbGUu
Ywo+PiBpbmRleCAzMjVkYWIwMWEyOWQuLjNmYjUyZGVjNWRmOCAxMDA2NDQKPj4gLS0tIGEvZnMv
ZjJmcy9maWxlLmMKPj4gKysrIGIvZnMvZjJmcy9maWxlLmMKPj4gQEAgLTE3MzAsNyArMTczMCwx
MCBAQCBuZXh0X2FsbG9jOgo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZjJmc19kb3duX3dy
aXRlKCZzYmktPmdjX2xvY2spOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RhdF9pbmNf
Z2NfY2FsbF9jb3VudChzYmksIEZPUkVHUk9VTkQpOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgZXJyID0gZjJmc19nYyhzYmksICZnY19jb250cm9sKTsKPj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgaWYgKGVyciAmJiBlcnIgIT0gLUVOT0RBVEEpCj4+ICsKPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgaWYgKGVyciA9PSAtRUFHQUlOKQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGYyZnNfYmFsYW5jZV9mcyhzYmksIHRydWUpOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBlbHNlIGlmIChlcnIgJiYgZXJyICE9IC1FTk9EQVRBKQo+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBnb3RvIG91dF9lcnI7Cj4+IMKgwqDCoMKgwqDCoMKgwqAgfQo+IERv
IHlvdSBtZWFuIHRvIGNhbGwgZjJmc19iYWxhbmNlX2ZzKCkgdG8gcmVjeWNsZSBvbmUgc2VjdGlv
bj8KPiBCdXQgaW4gdGhpcyBzaXR1YXRpb24sIGYyZnNfYmFsYW5jZV9mcygpIHdpbGwgcmV0dXJu
IGF0IGVub3VnaC1mcmVlLXNlY3Rpb24gY2hlY2s6Cj4gIMKgwqDCoCBpZiAoaGFzX2Vub3VnaF9m
cmVlX3NlY3Moc2JpLCAwLCAwKSkKPiAgwqDCoMKgwqDCoMKgwqAgcmV0dXJuOwoKQXMgeW91IHNh
aWQsIHRoZXJlIGFyZSBsb3RzIG9mIGZyZWUgc2VnbWVudHMsIHNvIEkgZ3Vlc3MgaXQncyBmaW5l
IGZvcgpsYXR0ZXIgMm0tYWxpZ25lZCBhbGxvY2F0aW9uLCBhbmQgZm9yIHRoZSBjYXNlIG51bWJl
ciBvZiBmcmVlIHNlY3Rpb24gaXMKbG93ZXIgdGhhbiBmZ2djIHRocmVzaG9sZCwgd2UgY2FuIGNh
bGwgZjJmc19iYWxhbmNlX2ZzKCkgdG8gcmVjbGFpbSBlbm91Z2gKZnJlZSBzZWN0aW9ucy4KClRo
YW5rcywKCj4+Cj4+IEhvd2V2ZXIsIHRoZSBjb2RlIHdvbid0IGZpeCBjb250cmFkaWN0b3JpbmVz
cyBpc3N1ZSwgYmVjYXVzZSB0aGUgcm9vdCBjYXVzZQo+PiBpcyB3ZSBsZWZ0IGZyYWdtZW50ZWQg
cGlubmVkIGRhdGEgaW4gZmlsZXN5c3RlbSwgd2hpY2ggc2hvdWxkIGJlIGF2b2lkZWQgaW4KPj4g
R0MtcmVsaWFuY2UgTEZTIGZpbGVzeWV0ZW0gYXMgbXVjaCBhcyBwb3NzaWJsZS4KPj4KPj4gVGhh
bmtzLAo+Pgo+Pj4KPj4+PiBUaGFua3MsCj4+Pj4KPj4+Pj4KPj4+Pj4gwqAgwqBBbmQgdGhpcyBj
b21taXQgY2hhbmdlZCBwcmV2aW91cyBiZWhhdmlvciBvZiBmYWxsb2NhdGUoKToKPj4+Pj4KPj4+
Pj4gQ29tbWl0IDJlNDJiN2Y4MTdhYyAoImYyZnM6IHN0b3AgYWxsb2NhdGluZyBwaW5uZWQgc2Vj
dGlvbnMgaWYgRUFHQUlOCj4+Pj4+IGhhcHBlbnMiKQo+Pj4+Pgo+Pj4+PiBCZWZvcmUgdGhpcyBj
b21taXQsIGlmIGZhbGxvY2F0ZSgpIG1lZXQgdGhpcyBzaXR1YXRpb24sIGl0IHdpbGwgdHJpZ2dl
cgo+Pj4+PiBGR19HQyB0byByZWN5Y2xlIHBpbm5lZCBzcGFjZSBmaW5hbGx5Lgo+Pj4+Pgo+Pj4+
PiBGR19HQyBpcyBleHBlY3RlZCB0byByZWN5Y2xlIHBpbm5lZCBzcGFjZSB3aGVuIHRoZXJlIGlz
IG5vIG1vcmUgZnJlZQo+Pj4+PiBzcGFjZS7CoCBBbmQgdGhpcyBpcyB0aGUgcmlnaHQgdGltZSB0
byBkbyBpdCB3aGVuIGZhbGxvY2F0ZSgpIG5lZWQgZnJlZQo+Pj4+PiBzcGFjZS4KPj4+Pj4KPj4+
Pj4gSXQgaXMgd2VpcmQgd2hlbiBmMmZzIHNob3dzIGVub3VnaCBzcGFyZSBzcGFjZSBidXQgY2Fu
J3QgZmFsbG9jYXRlKCkuIFNvCj4+Pj4+IEkgdGhpbmsgaXQgc2hvdWxkIGJlIGZpeGVkLgo+Pj4+
Pgo+Pj4+Pj4KPj4+Pj4+IFRob3VnaHRzPwo+Pj4+Pj4KPj4+Pj4+IFRoYW5rcywKPj4+Pj4+Cj4+
Pj4+Pj4KPj4+Pj4+PiBUaGlzIGlzc3VlIGNhbiBiZSByZXByb2R1Y2VkIGJ5IGZpbGxpbmcgZjJm
cyBzcGFjZSBhcyBmb2xsb3dpbmcgbGF5b3V0Lgo+Pj4+Pj4+IEV2ZXJ5IHNlZ21lbnQgaGFzIG9u
ZSBibG9jayBpcyBwaW5uZWQ6Cj4+Pj4+Pj4gKy0rLSstKy0rLSstKy0tLS0tKy0rCj4+Pj4+Pj4g
fCB8IHxwfCB8IHwgfCAuLi4gfCB8IHNlZ19uCj4+Pj4+Pj4gKy0rLSstKy0rLSstKy0tLS0tKy0r
Cj4+Pj4+Pj4gKy0rLSstKy0rLSstKy0tLS0tKy0rCj4+Pj4+Pj4gfCB8IHxwfCB8IHwgfCAuLi4g
fCB8IHNlZ19uKzEKPj4+Pj4+PiArLSstKy0rLSstKy0rLS0tLS0rLSsKPj4+Pj4+PiAuLi4KPj4+
Pj4+PiArLSstKy0rLSstKy0rLS0tLS0rLSsKPj4+Pj4+PiB8IHwgfHB8IHwgfCB8IC4uLiB8IHwg
c2VnX24rawo+Pj4+Pj4+ICstKy0rLSstKy0rLSstLS0tLSstKwo+Pj4+Pj4+Cj4+Pj4+Pj4gQW5k
IGZvbGxvd2luZyBhcmUgc3RlcHMgdG8gcmVwcm9kdWNlIHRoaXMgaXNzdWU6Cj4+Pj4+Pj4gZGQg
aWY9L2Rldi96ZXJvIG9mPS4vZjJmc19waW4uaW1nIGJzPTJNIGNvdW50PTEwMjQKPj4+Pj4+PiBt
a2ZzLmYyZnMgZjJmc19waW4uaW1nCj4+Pj4+Pj4gbWtkaXIgZjJmcwo+Pj4+Pj4+IG1vdW50IGYy
ZnNfcGluLmltZyAuL2YyZnMKPj4+Pj4+PiBjZCBmMmZzCj4+Pj4+Pj4gZGQgaWY9L2Rldi96ZXJv
IG9mPS4vbGFyZ2VfcGFkZGluZyBicz0xTSBjb3VudD0xNzYwCj4+Pj4+Pj4gLi9waW5fZmlsbGlu
Zy5zaAo+Pj4+Pj4+IHJtIHBhZGRpbmcqCj4+Pj4+Pj4gc3luYwo+Pj4+Pj4+IHRvdWNoIGZhbGxv
Y2F0ZV80MG0KPj4+Pj4+PiBmMmZzX2lvIHBpbmZpbGUgc2V0IGZhbGxvY2F0ZV80MG0KPj4+Pj4+
PiBmYWxsb2NhdGUgLWwgNDE5NDMwNDAgZmFsbG9jYXRlXzQwbQo+Pj4+Pj4+Cj4+Pj4+Pj4gZmFs
bG9jYXRlIGFsd2F5cyBmYWlsIHdpdGggRUFHQUlOIGV2ZW4gdGhlcmUgaGFzIGVub3VnaCBmcmVl
IHNwYWNlLgo+Pj4+Pj4+Cj4+Pj4+Pj4gJ3Bpbl9maWxsaW5nLnNoJyBpczoKPj4+Pj4+PiBjb3Vu
dD0xCj4+Pj4+Pj4gd2hpbGUgOgo+Pj4+Pj4+IGRvCj4+Pj4+Pj4gwqDCoMKgwqDCoCAjIGZpbGxp
bmcgdGhlIHNlZyBzcGFjZQo+Pj4+Pj4+IMKgwqDCoMKgwqAgZm9yIGkgaW4gezEuLjUxMX06Cj4+
Pj4+Pj4gwqDCoMKgwqDCoCBkbwo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBuYW1lPXBhZGRp
bmdfJGNvdW50LSRpCj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGVjaG8gd3JpdGUgJG5hbWUK
Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZGQgaWY9L2Rldi96ZXJvIG9mPS4vJG5hbWUgYnM9
NEsgY291bnQ9MSA+IC9kZXYvbnVsbCAyPiYxCj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGlm
IFsgJD8gLW5lIDAgXTsgdGhlbgo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgZXhpdCAwCj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGZpCj4+Pj4+Pj4gwqDCoMKg
wqDCoCBkb25lCj4+Pj4+Pj4gwqDCoMKgwqDCoCBzeW5jCj4+Pj4+Pj4KPj4+Pj4+PiDCoMKgwqDC
oMKgICMgcGluIG9uZSBibG9jayBpbiBhIHNlZ21lbnQKPj4+Pj4+PiDCoMKgwqDCoMKgIG5hbWU9
cGluX2ZpbGUkY291bnQKPj4+Pj4+PiDCoMKgwqDCoMKgIGRkIGlmPS9kZXYvemVybyBvZj0uLyRu
YW1lIGJzPTRLIGNvdW50PTEgPiAvZGV2L251bGwgMj4mMQo+Pj4+Pj4+IMKgwqDCoMKgwqAgc3lu
Ywo+Pj4+Pj4+IMKgwqDCoMKgwqAgZjJmc19pbyBwaW5maWxlIHNldCAkbmFtZQo+Pj4+Pj4+IMKg
wqDCoMKgwqAgY291bnQ9JCgoJGNvdW50ICsgMSkpCj4+Pj4+Pj4gZG9uZQo+Pj4+Pj4+Cj4+Pj4+
Pj4gU2lnbmVkLW9mZi1ieTogV3UgQm8gPGJvLnd1QHZpdm8uY29tPgo+Pj4+Pj4+IC0tLQo+Pj4+
Pj4+IMKgwqAgZnMvZjJmcy9maWxlLmMgfCAyICstCj4+Pj4+Pj4gwqDCoCAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4+Pj4+Pgo+Pj4+Pj4+IGRpZmYgLS1n
aXQgYS9mcy9mMmZzL2ZpbGUuYyBiL2ZzL2YyZnMvZmlsZS5jCj4+Pj4+Pj4gaW5kZXggY2E1OTA0
MTI5YjE2Li5lOGExMzYxNjU0M2YgMTAwNjQ0Cj4+Pj4+Pj4gLS0tIGEvZnMvZjJmcy9maWxlLmMK
Pj4+Pj4+PiArKysgYi9mcy9mMmZzL2ZpbGUuYwo+Pj4+Pj4+IEBAIC0xNjkwLDcgKzE2OTAsNyBA
QCBzdGF0aWMgaW50IGYyZnNfZXhwYW5kX2lub2RlX2RhdGEoc3RydWN0IGlub2RlCj4+Pj4+Pj4g
Kmlub2RlLCBsb2ZmX3Qgb2Zmc2V0LAo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgLmluaXRfZ2NfdHlwZSA9IEZHX0dDLAo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgLnNob3VsZF9taWdyYXRlX2Jsb2NrcyA9IGZhbHNlLAo+Pj4+Pj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgLmVycl9nY19za2lwcGVkID0gdHJ1ZSwKPj4+Pj4+PiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAubnJfZnJlZV9zZWNzID0gMCB9Owo+Pj4+Pj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIC5ucl9mcmVlX3NlY3MgPSAxIH07Cj4+Pj4+Pj4gwqDCoMKgwqDCoMKgIHBn
b2ZmX3QgcGdfc3RhcnQsIHBnX2VuZDsKPj4+Pj4+PiDCoMKgwqDCoMKgwqAgbG9mZl90IG5ld19z
aXplOwo+Pj4+Pj4+IMKgwqDCoMKgwqDCoCBsb2ZmX3Qgb2ZmX2VuZDsKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxp
bmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xp
c3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
