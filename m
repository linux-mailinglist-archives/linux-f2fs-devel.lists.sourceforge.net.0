Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC003D340A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jul 2021 07:27:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m6niU-0004rT-Vk; Fri, 23 Jul 2021 05:27:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1m6niT-0004rD-5b
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Jul 2021 05:27:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z5xce86Nw3TCz3vpxUvXkohKWg+L3ngl50CyXtelJEI=; b=Q1TK2zJZeoiAM4KXorAnLDikxf
 oc0+JoOqKLG1+/w90fCqYcWMOmmxeQRXve7G/Go3qB1Om/oXZ/97Rtibol9yHECGDxi6xRloXMYkU
 5ij9IOd6ciIIHPjpvmMvuNct8BWhxENfiGcnH44DbfnMjlbrohc+jv+Ejs9PB0YWleQY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=z5xce86Nw3TCz3vpxUvXkohKWg+L3ngl50CyXtelJEI=; b=hqZIzwzCKYrTzHglA8Qk7CygXo
 6xTbkCRAKGe/f0g8T+f/1UuBBs83ZX5e7Uio5aD4dYsgyzH3v8w6WM0r06NlZihVq38Hj8inBlmG7
 J/IOkYM1MyDF6DSUvr6h1tBT1CO52SjxQqaPpn0A5MpZrPYhBqGyscD3hEbOftzM5+6k=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m6niK-000894-DU
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Jul 2021 05:27:21 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3076060EB2;
 Fri, 23 Jul 2021 05:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627018019;
 bh=ZCLKMT9vB8dWUoMEcEsNpXT5xHGP2otBPeAV1gWqhz4=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=pbw6iMJbPWFh22FDEn409TE3K6WveuRXXiBm5CX4wGNtMhyfEPsaWFuknnHM5Bwvj
 mjsVJBLBSqoa2SFULdAHgxXnBKjd8E2PcUQcOQG0sJTr2sVQ1caKB2RZAkanjsmMYg
 osLiHpFVCMA2hNXcEUJKU9XIQFBYcf+FU34ThpYZjiJMAaMIKArc7E1XaDa/8h+8YG
 J2cACR9RJk3xCL8sbvxORE8bKdOW8JgH15ob0fLUAioZ5Mou+otNHOkGaWa8m47qjH
 SD090dLocxwP25TlEoX336dNwc+yvkBUkElSckVKKODguovj3ANpMF947uM9y9GDu4
 wjBk8Bs7P9EMA==
To: Fengnan Chang <changfengnan@vivo.com>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20210722034729.231855-1-changfengnan@vivo.com>
 <58f5c3c2-ef99-1592-8dbd-1a56ce2eeda3@kernel.org>
 <6f8aa853-e65c-9f4e-8a31-5d13a2cde19d@vivo.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <6d903ed9-469e-7bab-12bd-c47564a20ce0@kernel.org>
Date: Fri, 23 Jul 2021 13:26:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <6f8aa853-e65c-9f4e-8a31-5d13a2cde19d@vivo.com>
Content-Language: en-US
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 NICE_REPLY_A           Looks like a legit reply (A)
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m6niK-000894-DU
Subject: Re: [f2fs-dev] [RFC PATCH] f2fs: compress: reduce one page array
 alloc and free when write compressed page
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

T24gMjAyMS83LzIzIDExOjUyLCBGZW5nbmFuIENoYW5nIHdyb3RlOgo+IFNvcnJ5LCBJIGRpZG4n
dCBnZXQgeW91ciBwb2ludCwgaW4gbXkgb3BpbmlvbiwgbmV3X25yX2NwYWdlcyBzaG91bGQKPiBh
bHdheXMgbGl0dGxlIHRoYW4gbnJfY3BhZ2VzLCBpcyB0aGlzIHJpZ2h0PyBTbyB3ZSBjYW4ganVz
dCB1c2UgY3BhZ2VzLAo+IGRvbid0IG5lZWQgdG8gYWxsb2MgbmV3IG9uZS4KPiAKPiBUaGFua3Mu
Cj4gCj4gCj4gT24gMjAyMS83LzIyIDIxOjUzLCBDaGFvIFl1IHdyb3RlOgo+PiBPbiAyMDIxLzcv
MjIgMTE6NDcsIEZlbmduYW4gQ2hhbmcgd3JvdGU6Cj4+PiBEb24ndCBhbGxvYyBuZXcgcGFnZSBh
cnJheSB0byByZXBsYWNlIG9sZCwganVzdCB1c2Ugb2xkIHBhZ2UgYXJyYXksIHRyeQo+Pj4gdG8g
cmVkdWNlIG9uZSBwYWdlIGFycmF5IGFsbG9jIGFuZCBmcmVlIHdoZW4gd3JpdGUgY29tcHJlc3Mg
cGFnZS4KPj4KPj4gTm9wZSwgc2VlIHdob2xlIHN0b3J5IGluIGJlbG93IGxpbms6Cj4+Cj4+IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL3BhdGNod29yay9wYXRjaC8xMzA1MDk2Lwo+Pgo+PiBUaGFu
a3MsCj4+Cj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogRmVuZ25hbiBDaGFuZyA8Y2hhbmdmZW5nbmFu
QHZpdm8uY29tPgo+Pj4gLS0tCj4+PiAgwqAgZnMvZjJmcy9jb21wcmVzcy5jIHwgMTQgKystLS0t
LS0tLS0tLS0KPj4+ICDCoCBmcy9mMmZzL2YyZnMuaMKgwqDCoMKgIHzCoCAxICsKPj4+ICDCoCAy
IGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCj4+Pgo+Pj4g
ZGlmZiAtLWdpdCBhL2ZzL2YyZnMvY29tcHJlc3MuYyBiL2ZzL2YyZnMvY29tcHJlc3MuYwo+Pj4g
aW5kZXggNDU1NTYxODI2YzdkLi40M2RhYWZlMzgyZTcgMTAwNjQ0Cj4+PiAtLS0gYS9mcy9mMmZz
L2NvbXByZXNzLmMKPj4+ICsrKyBiL2ZzL2YyZnMvY29tcHJlc3MuYwo+Pj4gQEAgLTYxOCw3ICs2
MTgsNiBAQCBzdGF0aWMgaW50IGYyZnNfY29tcHJlc3NfcGFnZXMoc3RydWN0IGNvbXByZXNzX2N0
eAo+Pj4gKmNjKQo+Pj4gIMKgwqDCoMKgwqAgY29uc3Qgc3RydWN0IGYyZnNfY29tcHJlc3Nfb3Bz
ICpjb3BzID0KPj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGYyZnNfY29w
c1tmaS0+aV9jb21wcmVzc19hbGdvcml0aG1dOwo+Pj4gIMKgwqDCoMKgwqAgdW5zaWduZWQgaW50
IG1heF9sZW4sIG5ld19ucl9jcGFnZXM7Cj4+PiAtwqDCoMKgIHN0cnVjdCBwYWdlICoqbmV3X2Nw
YWdlczsKPj4+ICDCoMKgwqDCoMKgIHUzMiBjaGtzdW0gPSAwOwo+Pj4gIMKgwqDCoMKgwqAgaW50
IGksIHJldDsKPj4+IEBAIC02MzMsNiArNjMyLDcgQEAgc3RhdGljIGludCBmMmZzX2NvbXByZXNz
X3BhZ2VzKHN0cnVjdCBjb21wcmVzc19jdHgKPj4+ICpjYykKPj4+ICDCoMKgwqDCoMKgIG1heF9s
ZW4gPSBDT01QUkVTU19IRUFERVJfU0laRSArIGNjLT5jbGVuOwo+Pj4gIMKgwqDCoMKgwqAgY2Mt
Pm5yX2NwYWdlcyA9IERJVl9ST1VORF9VUChtYXhfbGVuLCBQQUdFX1NJWkUpOwo+Pj4gK8KgwqDC
oCBjYy0+cmF3X25yX2NwYWdlcyA9IGNjLT5ucl9jcGFnZXM7CgpJZiByYXdfbnJfY3BhZ3MgaXMg
dXNlZCB0byBzdG9yZSBvcmlnaW5hbCBucl9jcGFnZXMsIHdlIG5lZWQgdG8gY2FsbApwYWdlX2Fy
cmF5X2ZyZWUoLCBjYy0+Y3BhZ2VzLCBjYy0+cmF3X25yX2NwYWdlcykgaW4gYWxsIHBsYWNlcywg
Y2FuIHlvdQpwbGVhc2UgY2hlY2sgd2hldGhlciB0aGlzIGFyZSBhbnkgbWlzc2VkIGNhc2VzPwoK
VGhhbmtzLAoKPj4+ICDCoMKgwqDCoMKgIGNjLT5jcGFnZXMgPSBwYWdlX2FycmF5X2FsbG9jKGNj
LT5pbm9kZSwgY2MtPm5yX2NwYWdlcyk7Cj4+PiAgwqDCoMKgwqDCoCBpZiAoIWNjLT5jcGFnZXMp
IHsKPj4+IEBAIC02ODMsMTMgKzY4Myw2IEBAIHN0YXRpYyBpbnQgZjJmc19jb21wcmVzc19wYWdl
cyhzdHJ1Y3QKPj4+IGNvbXByZXNzX2N0eCAqY2MpCj4+PiAgwqDCoMKgwqDCoCBuZXdfbnJfY3Bh
Z2VzID0gRElWX1JPVU5EX1VQKGNjLT5jbGVuICsgQ09NUFJFU1NfSEVBREVSX1NJWkUsCj4+PiBQ
QUdFX1NJWkUpOwo+Pj4gLcKgwqDCoCAvKiBOb3cgd2UncmUgZ29pbmcgdG8gY3V0IHVubmVjZXNz
YXJ5IHRhaWwgcGFnZXMgKi8KPj4+IC3CoMKgwqAgbmV3X2NwYWdlcyA9IHBhZ2VfYXJyYXlfYWxs
b2MoY2MtPmlub2RlLCBuZXdfbnJfY3BhZ2VzKTsKPj4+IC3CoMKgwqAgaWYgKCFuZXdfY3BhZ2Vz
KSB7Cj4+PiAtwqDCoMKgwqDCoMKgwqAgcmV0ID0gLUVOT01FTTsKPj4+IC3CoMKgwqDCoMKgwqDC
oCBnb3RvIG91dF92dW5tYXBfY2J1ZjsKPj4+IC3CoMKgwqAgfQo+Pj4gLQo+Pj4gIMKgwqDCoMKg
wqAgLyogemVybyBvdXQgYW55IHVudXNlZCBwYXJ0IG9mIHRoZSBsYXN0IHBhZ2UgKi8KPj4+ICDC
oMKgwqDCoMKgIG1lbXNldCgmY2MtPmNidWYtPmNkYXRhW2NjLT5jbGVuXSwgMCwKPj4+ICDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAobmV3X25yX2NwYWdlcyAqIFBBR0VfU0laRSkgLQo+Pj4g
QEAgLTcwMCw3ICs2OTMsNiBAQCBzdGF0aWMgaW50IGYyZnNfY29tcHJlc3NfcGFnZXMoc3RydWN0
IGNvbXByZXNzX2N0eAo+Pj4gKmNjKQo+Pj4gIMKgwqDCoMKgwqAgZm9yIChpID0gMDsgaSA8IGNj
LT5ucl9jcGFnZXM7IGkrKykgewo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoaSA8IG5ld19u
cl9jcGFnZXMpIHsKPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG5ld19jcGFnZXNbaV0gPSBj
Yy0+Y3BhZ2VzW2ldOwo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnRpbnVlOwo+
Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgIGYyZnNfY29t
cHJlc3NfZnJlZV9wYWdlKGNjLT5jcGFnZXNbaV0pOwo+Pj4gQEAgLTcxMCw4ICs3MDIsNiBAQCBz
dGF0aWMgaW50IGYyZnNfY29tcHJlc3NfcGFnZXMoc3RydWN0IGNvbXByZXNzX2N0eAo+Pj4gKmNj
KQo+Pj4gIMKgwqDCoMKgwqAgaWYgKGNvcHMtPmRlc3Ryb3lfY29tcHJlc3NfY3R4KQo+Pj4gIMKg
wqDCoMKgwqDCoMKgwqDCoCBjb3BzLT5kZXN0cm95X2NvbXByZXNzX2N0eChjYyk7Cj4+PiAtwqDC
oMKgIHBhZ2VfYXJyYXlfZnJlZShjYy0+aW5vZGUsIGNjLT5jcGFnZXMsIGNjLT5ucl9jcGFnZXMp
Owo+Pj4gLcKgwqDCoCBjYy0+Y3BhZ2VzID0gbmV3X2NwYWdlczsKPj4+ICDCoMKgwqDCoMKgIGNj
LT5ucl9jcGFnZXMgPSBuZXdfbnJfY3BhZ2VzOwo+Pj4gIMKgwqDCoMKgwqAgdHJhY2VfZjJmc19j
b21wcmVzc19wYWdlc19lbmQoY2MtPmlub2RlLCBjYy0+Y2x1c3Rlcl9pZHgsCj4+PiBAQCAtMTMz
MCw3ICsxMzIwLDcgQEAgc3RhdGljIGludCBmMmZzX3dyaXRlX2NvbXByZXNzZWRfcGFnZXMoc3Ry
dWN0Cj4+PiBjb21wcmVzc19jdHggKmNjLAo+Pj4gIMKgwqDCoMKgwqAgc3Bpbl91bmxvY2soJmZp
LT5pX3NpemVfbG9jayk7Cj4+PiAgwqDCoMKgwqDCoCBmMmZzX3B1dF9ycGFnZXMoY2MpOwo+Pj4g
LcKgwqDCoCBwYWdlX2FycmF5X2ZyZWUoY2MtPmlub2RlLCBjYy0+Y3BhZ2VzLCBjYy0+bnJfY3Bh
Z2VzKTsKPj4+ICvCoMKgwqAgcGFnZV9hcnJheV9mcmVlKGNjLT5pbm9kZSwgY2MtPmNwYWdlcywg
Y2MtPnJhd19ucl9jcGFnZXMpOwo+Pj4gIMKgwqDCoMKgwqAgY2MtPmNwYWdlcyA9IE5VTEw7Cj4+
PiAgwqDCoMKgwqDCoCBmMmZzX2Rlc3Ryb3lfY29tcHJlc3NfY3R4KGNjLCBmYWxzZSk7Cj4+PiAg
wqDCoMKgwqDCoCByZXR1cm4gMDsKPj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2YyZnMuaCBiL2Zz
L2YyZnMvZjJmcy5oCj4+PiBpbmRleCA4NjdmMmM1ZDk1NTkuLjhiMWY4NGQ4OGE2NSAxMDA2NDQK
Pj4+IC0tLSBhL2ZzL2YyZnMvZjJmcy5oCj4+PiArKysgYi9mcy9mMmZzL2YyZnMuaAo+Pj4gQEAg
LTE0NTQsNiArMTQ1NCw3IEBAIHN0cnVjdCBjb21wcmVzc19jdHggewo+Pj4gIMKgwqDCoMKgwqAg
dW5zaWduZWQgaW50IG5yX3JwYWdlczvCoMKgwqDCoMKgwqDCoCAvKiB0b3RhbCBwYWdlIG51bWJl
ciBpbiBycGFnZXMgKi8KPj4+ICDCoMKgwqDCoMKgIHN0cnVjdCBwYWdlICoqY3BhZ2VzO8KgwqDC
oMKgwqDCoMKgIC8qIHBhZ2VzIHN0b3JlIGNvbXByZXNzZWQgZGF0YSBpbgo+Pj4gY2x1c3RlciAq
Lwo+Pj4gIMKgwqDCoMKgwqAgdW5zaWduZWQgaW50IG5yX2NwYWdlczvCoMKgwqDCoMKgwqDCoCAv
KiB0b3RhbCBwYWdlIG51bWJlciBpbiBjcGFnZXMgKi8KPj4+ICvCoMKgwqAgdW5zaWduZWQgaW50
IHJhd19ucl9jcGFnZXM7wqDCoMKgIC8qIG1heCB0b3RhbCBwYWdlIG51bWJlciBpbiBjcGFnZXMg
Ki8KPj4+ICDCoMKgwqDCoMKgIHZvaWQgKnJidWY7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKiB2
aXJ0dWFsIG1hcHBlZCBhZGRyZXNzIG9uIHJwYWdlcyAqLwo+Pj4gIMKgwqDCoMKgwqAgc3RydWN0
IGNvbXByZXNzX2RhdGEgKmNidWY7wqDCoMKgIC8qIHZpcnR1YWwgbWFwcGVkIGFkZHJlc3Mgb24K
Pj4+IGNwYWdlcyAqLwo+Pj4gIMKgwqDCoMKgwqAgc2l6ZV90IHJsZW47wqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAvKiB2YWxpZCBkYXRhIGxlbmd0aCBpbiByYnVmICovCj4+Pgo+PgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwg
bWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBz
Oi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
