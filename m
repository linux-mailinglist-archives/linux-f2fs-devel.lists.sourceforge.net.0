Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AD29BA85A5B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 11 Apr 2025 12:44:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u3Brm-0003H2-Vv;
	Fri, 11 Apr 2025 10:44:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1u3Brf-0003Gl-3r
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Apr 2025 10:44:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=byABEKtLqZMc9n4dXJoi0JsGa/cjjCsFSKVcN7e+yg8=; b=hOMv3AUSDNiKIGx1gjyDj+VU71
 ZWtyvQjUH+w0BxozxYiYmcEBhyqVUPE/ndBsO0IPdzhs/YmGfdgz9aMHZFaqD5DlyZf6gkkoiQ+PK
 LAWNs9QkaBXJEWDslDJopGmXRkSakU4jzSU4nYARElXXkyKCya11RjMnvd0r4fIYyy+Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=byABEKtLqZMc9n4dXJoi0JsGa/cjjCsFSKVcN7e+yg8=; b=F2GMwqse/VzakPQaSPLx2zrNzU
 RznAKH3u9RYgMfOcIgWaPALvzm0vyMIF0L7Rr9zB5kKtURicm1xwo61HDBrF/1MU4NI6jdh7wYhbr
 JICx9fqPeo5SD2apR6u4lkphnnxX70KWBG/hQg4ttPlGVhgfrxfampSUWpNAMKaNuyZc=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u3BrP-0000A9-N9 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Apr 2025 10:44:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7B7FA43B63;
 Fri, 11 Apr 2025 10:43:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F110C4CEE2;
 Fri, 11 Apr 2025 10:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744368222;
 bh=81omNmNjYGBI71ygb7YBOEyHHjbsQ4PSSJvmh97mgsE=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=QwGEC00wCz+Opm3CwD0kI9YjUGfR5KNIjWZgX6pRlhF+y5SR6ElNHigcbN2szUUNI
 gX5xo4lPdPzv3k4w8HTe2nn5TECYHGXO4cknszmB7dX+kZAB4jLjVjPm3FFRLonfBI
 ty2mzBQg53VEoAPRkEnf8SkjTj0pqYXiastCPpov1S79om2asdAJ1Zpj81V14EbLna
 07AbgqAyaWKkEilmTxZ95nGRKck9YodbbLavdwloHEii60Dcx3gM3niC9O6ZWVqTAG
 GMSi5wFKf9sEGMGAuWI4u2p97NJG81pB8jdHnJBovCXzaT0Ql6FPEWDoPh5bNDfY/0
 6z7LmRcEM4+2A==
Message-ID: <82ebb35f-dea6-4a66-8cdd-aa4c4af6a193@kernel.org>
Date: Fri, 11 Apr 2025 18:43:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Juhyung Park <qkrwngud825@gmail.com>
References: <20250411103710.8282-1-chao@kernel.org>
 <20250411103710.8282-2-chao@kernel.org>
 <CAD14+f2MuZMuB8F0NiyQ0eqPtcrWd_V9d+=o9t1D2cZZUESaqg@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAD14+f2MuZMuB8F0NiyQ0eqPtcrWd_V9d+=o9t1D2cZZUESaqg@mail.gmail.com>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/4/11 18:41, Juhyung Park wrote: > Hi Chao, > > My
 name wasn't the only thing I picked up on the v2 patch, just a > friendly
 ping in case you missed it :) Oops, sorry, will check them all soon. :( 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in sa-accredit.habeas.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u3BrP-0000A9-N9
Subject: Re: [f2fs-dev] [PATCH v3 2/2] resize.f2fs: add caution message for
 resize
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNS80LzExIDE4OjQxLCBKdWh5dW5nIFBhcmsgd3JvdGU6Cj4gSGkgQ2hhbywKPiAKPiBN
eSBuYW1lIHdhc24ndCB0aGUgb25seSB0aGluZyBJIHBpY2tlZCB1cCBvbiB0aGUgdjIgcGF0Y2gs
IGp1c3QgYQo+IGZyaWVuZGx5IHBpbmcgaW4gY2FzZSB5b3UgbWlzc2VkIGl0IDopCgpPb3BzLCBz
b3JyeSwgd2lsbCBjaGVjayB0aGVtIGFsbCBzb29uLiA6KAoKVGhhbmtzLAoKPiAKPiBPbiBGcmks
IEFwciAxMSwgMjAyNSBhdCAzOjM34oCvQU0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiB3cm90
ZToKPj4KPj4gcmVzaXplLmYyZnMgZG9lc24ndCBndWFyYW50ZWUgYXRvbWljYWxseSByZXNpemlu
ZyBmMmZzIGltYWdlLAo+PiBzbyB0aGF0IHBvdGVudGlhbCBzdWRkZW50IHBvd2VyIGN1dCwgSU8g
ZXJyb3IsIG91dCBvZiBtZW1vcnksCj4+IFNJR0tJTEwgcmVjZWl2ZWQgb3IgcHJvZ3JhbSBleGl0
cyBkdWUgdG8gb3RoZXIgcmVhc29ucyBtYXkgY2F1c2UKPj4gZGF0YSBjb3JydXB0aW9uLgo+Pgo+
PiBUaGlzIHBhdGNoIGFkZHMgY2F1dGlvbiBtZXNzYWdlIGZvciByZXNpemUgdXNlcnMgdG8gbm90
aWNlCj4+IHBvdGVudGlhbCByaXNrIG9mIHVzaW5nIHJlc2l6aW5nIHRvb2wsIGFuZCByZW1pbmQg
dGhlbSB0byBiYWNrdXAKPj4gZGF0YSBiZWZvcmUgcmVzaXplLgo+Pgo+PiByZXNpemUuZjJmcyA8
cGFydGl0aW9uPgo+Pgo+PiAiUGxlYXNlIG5vdGljZSB0aGVyZSBpcyBoaWdoIHJpc2sgb2YgZGF0
YSBsb3N0IGR1cmluZyByZXNpemUsIHBsZWFzZSBiYWNrdXAgeW91ciBkYXRhIGJlZm9yZSByZXNp
emUuCj4+IERvIHlvdSB3YW50IHRvIHJlc2l6ZSB0aGlzIHBhcnRpdGlvbj8gW3kvbl0geQo+PiBw
cm9jZXNzIHJlc2l6ZSIKPj4KPj4gSWYgd2Ugd2FudCB0byBmb3JjZSB0byB1c2UgcmVzaXplLmYy
ZnMsIHdlIGNhbiB1c2UgLUYgb3B0aW9uLAo+PiBsZXQncyBlbmFibGUgLUYgb3B0aW9uIGluIEFu
ZHJvaWQgYnkgZGVmYXVsdCB0byBub3QgYnJlYWsgYW55Cj4+IHVzYWdlLgo+Pgo+PiBDYzogSnVo
eXVuZyBQYXJrIDxxa3J3bmd1ZDgyNUBnbWFpbC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IENoYW8g
WXUgPGNoYW9Aa2VybmVsLm9yZz4KPj4gLS0tCj4+IHYzOgo+PiAtIHVwZGF0ZSBKdWh5dW5nJ3Mg
ZW1haWwgbmFtZQo+PiAgIGZzY2svbWFpbi5jICAgICAgIHwgMjcgKysrKysrKysrKysrKysrKysr
KysrKysrKy0tCj4+ICAgZnNjay9yZXNpemUuYyAgICAgfCAgMiArLQo+PiAgIGluY2x1ZGUvZjJm
c19mcy5oIHwgIDEgKwo+PiAgIG1hbi9yZXNpemUuZjJmcy44IHwgMTIgKysrKysrKysrKysrCj4+
ICAgNCBmaWxlcyBjaGFuZ2VkLCAzOSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Pgo+
PiBkaWZmIC0tZ2l0IGEvZnNjay9tYWluLmMgYi9mc2NrL21haW4uYwo+PiBpbmRleCBhZjQwNjEz
Li5lZjZiMTdkIDEwMDY0NAo+PiAtLS0gYS9mc2NrL21haW4uYwo+PiArKysgYi9mc2NrL21haW4u
Ywo+PiBAQCAtMjIyLDYgKzIyMiw4IEBAIHN0YXRpYyB2b2lkIGFkZF9kZWZhdWx0X29wdGlvbnMo
dm9pZCkKPj4gICAgICAgICAgICAgICAgICBpZiAoYy5mdW5jID09IEZTQ0spIHsKPj4gICAgICAg
ICAgICAgICAgICAgICAgICAgIC8qIC1hICovCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICBj
LmF1dG9fZml4ID0gMTsKPj4gKyAgICAgICAgICAgICAgIH0gZWxzZSBpZiAoYy5mdW5jID09IFJF
U0laRSkgewo+PiArICAgICAgICAgICAgICAgICAgICAgICBjLmZvcmNlID0gMTsKPj4gICAgICAg
ICAgICAgICAgICB9Cj4+Cj4+ICAgICAgICAgICAgICAgICAgLyoKPj4gQEAgLTYwMSw3ICs2MDMs
NyBAQCB2b2lkIGYyZnNfcGFyc2Vfb3B0aW9ucyhpbnQgYXJnYywgY2hhciAqYXJndltdKQo+PiAg
ICNlbmRpZgo+PiAgICAgICAgICB9IGVsc2UgaWYgKCFzdHJjbXAoInJlc2l6ZS5mMmZzIiwgcHJv
ZykpIHsKPj4gICAjaWZkZWYgV0lUSF9SRVNJWkUKPj4gLSAgICAgICAgICAgICAgIGNvbnN0IGNo
YXIgKm9wdGlvbl9zdHJpbmcgPSAiZDpmSHN0Om86ViI7Cj4+ICsgICAgICAgICAgICAgICBjb25z
dCBjaGFyICpvcHRpb25fc3RyaW5nID0gImQ6ZkZIc3Q6bzpWIjsKPj4KPj4gICAgICAgICAgICAg
ICAgICBjLmZ1bmMgPSBSRVNJWkU7Cj4+ICAgICAgICAgICAgICAgICAgd2hpbGUgKChvcHRpb24g
PSBnZXRvcHQoYXJnYywgYXJndiwgb3B0aW9uX3N0cmluZykpICE9IEVPRikgewo+PiBAQCAtNjE4
LDkgKzYyMCwxMiBAQCB2b2lkIGYyZnNfcGFyc2Vfb3B0aW9ucyhpbnQgYXJnYywgY2hhciAqYXJn
dltdKQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBjLmRiZ19sdik7Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJy
ZWFrOwo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgY2FzZSAnZic6Cj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgYy5pZ25vcmVfZXJyb3IgPSAxOwo+PiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIE1TRygwLCAiSW5mbzogSW5nb3JlIGVycm9yIGR1cmluZyByZXNp
emVcbiIpOwo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+PiArICAg
ICAgICAgICAgICAgICAgICAgICBjYXNlICdGJzoKPj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgYy5mb3JjZSA9IDE7Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IE1TRygwLCAiSW5mbzogRm9yY2UgdG8gcmVzaXplXG4iKTsKPj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBicmVhazsKPj4gICAgICAgICAgICAgICAgICAgICAgICAgIGNhc2UgJ0gn
Ogo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjLm5lZWRfd2hpbnQgPSB0cnVl
Owo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjLndoaW50ID0gV1JJVEVfTElG
RV9OT1RfU0VUOwo+PiBAQCAtMTEwNCw2ICsxMTA5LDI0IEBAIG91dF9yYW5nZToKPj4gICAjaWZk
ZWYgV0lUSF9SRVNJWkUKPj4gICBzdGF0aWMgaW50IGRvX3Jlc2l6ZShzdHJ1Y3QgZjJmc19zYl9p
bmZvICpzYmkpCj4+ICAgewo+PiArICAgICAgIGNoYXIgYW5zd2VyWzI1NV0gPSB7MH07Cj4+ICsg
ICAgICAgaW50IHJldDsKPj4gKwo+PiArICAgICAgIGlmICghYy5mb3JjZSkgewo+PiArcmV0cnk6
Cj4+ICsgICAgICAgICAgICAgICBwcmludGYoIlxuUGxlYXNlIG5vdGljZSB0aGVyZSBpcyBoaWdo
IHJpc2sgb2YgZGF0YSBsb3N0IGR1cmluZyByZXNpemUsICIKPj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgInBsZWFzZSBiYWNrdXAgeW91ciBkYXRhIGJlZm9yZSByZXNpemUuXG4iCj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgICJEbyB5b3Ugd2FudCB0byByZXNpemUgdGhpcyBwYXJ0aXRpb24/
IFt5L25dICIpOwo+PiArICAgICAgICAgICAgICAgcmV0ID0gc2NhbmYoIiVzIiwgYW5zd2VyKTsK
Pj4gKyAgICAgICAgICAgICAgIEFTU0VSVChyZXQgPj0gMCk7Cj4+ICsgICAgICAgICAgICAgICBp
ZiAoIXN0cmNhc2VjbXAoYW5zd2VyLCAieSIpKQo+PiArICAgICAgICAgICAgICAgICAgICAgICBw
cmludGYoInByb2Nlc3MgcmVzaXplXG4iKTsKPj4gKyAgICAgICAgICAgICAgIGVsc2UgaWYgKCFz
dHJjYXNlY21wKGFuc3dlciwgIm4iKSkKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJu
IDA7Cj4+ICsgICAgICAgICAgICAgICBlbHNlCj4+ICsgICAgICAgICAgICAgICAgICAgICAgIGdv
dG8gcmV0cnk7Cj4+ICsgICAgICAgfQo+PiArCj4+ICAgICAgICAgIGlmICghYy50YXJnZXRfc2Vj
dG9ycykKPj4gICAgICAgICAgICAgICAgICBjLnRhcmdldF9zZWN0b3JzID0gYy50b3RhbF9zZWN0
b3JzOwo+Pgo+PiBkaWZmIC0tZ2l0IGEvZnNjay9yZXNpemUuYyBiL2ZzY2svcmVzaXplLmMKPj4g
aW5kZXggMjY4MWI5Zi4uMWFiN2Q3NSAxMDA2NDQKPj4gLS0tIGEvZnNjay9yZXNpemUuYwo+PiAr
KysgYi9mc2NrL3Jlc2l6ZS5jCj4+IEBAIC03NjUsNyArNzY1LDcgQEAgaW50IGYyZnNfcmVzaXpl
KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkKPj4gICAgICAgICAgICAgICAgICB9Cj4+ICAgICAg
ICAgIGVsc2UgaWYgKCgoYy50YXJnZXRfc2VjdG9ycyAqIGMuc2VjdG9yX3NpemUgPj4KPj4gICAg
ICAgICAgICAgICAgICAgICAgICAgIGdldF9zYihsb2dfYmxvY2tzaXplKSkgPiBnZXRfc2IoYmxv
Y2tfY291bnQpKSB8fAo+PiAtICAgICAgICAgICAgICAgICAgICAgICBjLmZvcmNlKQo+PiArICAg
ICAgICAgICAgICAgICAgICAgICBjLmlnbm9yZV9lcnJvcikKPj4gICAgICAgICAgICAgICAgICBy
ZXR1cm4gZjJmc19yZXNpemVfZ3JvdyhzYmkpOwo+PiAgICAgICAgICBlbHNlIHsKPj4gICAgICAg
ICAgICAgICAgICBNU0coMCwgIk5vdGhpbmcgdG8gcmVzaXplLlxuIik7Cj4+IGRpZmYgLS1naXQg
YS9pbmNsdWRlL2YyZnNfZnMuaCBiL2luY2x1ZGUvZjJmc19mcy5oCj4+IGluZGV4IDdlM2YyNWIu
LjkyOGY5NjMgMTAwNjQ0Cj4+IC0tLSBhL2luY2x1ZGUvZjJmc19mcy5oCj4+ICsrKyBiL2luY2x1
ZGUvZjJmc19mcy5oCj4+IEBAIC0xNTI4LDYgKzE1MjgsNyBAQCBzdHJ1Y3QgZjJmc19jb25maWd1
cmF0aW9uIHsKPj4gICAgICAgICAgaW50IG5vX2tlcm5lbF9jaGVjazsKPj4gICAgICAgICAgaW50
IGZpeF9vbjsKPj4gICAgICAgICAgaW50IGZvcmNlOwo+PiArICAgICAgIGludCBpZ25vcmVfZXJy
b3I7Cj4+ICAgICAgICAgIGludCBkZWZzZXQ7Cj4+ICAgICAgICAgIGludCBidWdfb247Cj4+ICAg
ICAgICAgIHVuc2lnbmVkIGludCBpbnZhbGlkX3NiOwo+PiBkaWZmIC0tZ2l0IGEvbWFuL3Jlc2l6
ZS5mMmZzLjggYi9tYW4vcmVzaXplLmYyZnMuOAo+PiBpbmRleCAwMmZmMjQ1Li5iZGRhNGZkIDEw
MDY0NAo+PiAtLS0gYS9tYW4vcmVzaXplLmYyZnMuOAo+PiArKysgYi9tYW4vcmVzaXplLmYyZnMu
OAo+PiBAQCAtMTgsNiArMTgsMTIgQEAgcmVzaXplLmYyZnMgXC0gcmVzaXplIGZpbGVzeXN0ZW0g
c2l6ZQo+PiAgIC5JIG92ZXJwcm92aXNpb24tcmF0aW8tcGVyY2VudGFnZQo+PiAgIF0KPj4gICBb
Cj4+ICsuQiBcLWYKPj4gK10KPj4gK1sKPj4gKy5CIFwtRgo+PiArXQo+PiArWwo+PiAgIC5CIFwt
SAo+PiAgIF0KPj4gICBbCj4+IEBAIC01Myw2ICs1OSwxMiBAQCBTcGVjaWZ5IHRoZSBwZXJjZW50
YWdlIG9mIHRoZSB2b2x1bWUgdGhhdCB3aWxsIGJlIHVzZWQgYXMgb3ZlcnByb3Zpc2lvbiBhcmVh
Lgo+PiAgIFRoaXMgYXJlYSBpcyBoaWRkZW4gdG8gdXNlcnMsIGFuZCB1dGlsaXplZCBieSBGMkZT
IGNsZWFuZXIuIElmIG5vdCBzcGVjaWZpZWQsIHRoZQo+PiAgIGJlc3QgbnVtYmVyIHdpbGwgYmUg
YXNzaWduZWQgYXV0b21hdGljYWxseSBhY2NvcmRpbmcgdG8gdGhlIHBhcnRpdGlvbiBzaXplLgo+
PiAgIC5UUAo+PiArLkJJIFwtZgo+PiArRm9yY2UgdG8gZml4IGFueSBpbmNvbnNpc3RlbnQgZGF0
YSBkdXJpbmcgcmVzaXplLgo+PiArLlRQCj4+ICsuQkkgXC1GCj4+ICtTa2lwIGNhdXRpb24gZGlh
bG9ndWUgYW5kIHJlc2l6ZSBwYXJ0aXRpb24gZGlyZWN0bHkuCj4+ICsuVFAKPj4gICAuQkkgXC1I
Cj4+ICAgU3BlY2lmeSBzdXBwb3J0IHdyaXRlIGhpbnQuCj4+ICAgLlRQCj4+IC0tCj4+IDIuNDAu
MQo+PgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJj
ZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9s
aW51eC1mMmZzLWRldmVsCg==
