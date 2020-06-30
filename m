Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DB120FE46
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Jun 2020 22:56:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jqNJA-0005d9-Hf; Tue, 30 Jun 2020 20:56:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jqNJ9-0005d2-KH
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 30 Jun 2020 20:56:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1U7qDe81bxeS8KAHawbIOFO9Fggjwj9LA0IzCK/CCEU=; b=Vou9/K/0K2SIjQqknZUfyVpLiJ
 G/iKDQGLTW5vq6G7CD2wuw0VrfB2rDJ2klHYqR6Ab0RXDjLgyre5ngrIFAIcN/bt1NCme6godgwWj
 erEjYVGamYK/MbNGNNWW1K6GDck1MEvemMLdRbB9qoqgSjeigknYpR2Fro+O7bIYNQWo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1U7qDe81bxeS8KAHawbIOFO9Fggjwj9LA0IzCK/CCEU=; b=lN6UIH7h4eiUGpQgvjhcgbE7kf
 OkLjG1Vm5DN5qazTv1hqXMCfqWkrkQHFN+6VwXVcyKYfUJ80oczE37F7woftC0WC2irpo+SZ1Fk//
 B7J4FBSgOblq+P1sQudPtftOzdlhmcLl6rsFujzXhOniaFR1NC22EiUHxWzmo8W3DprE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jqNJ3-003UZN-F3
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 30 Jun 2020 20:56:47 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F32E22074D;
 Tue, 30 Jun 2020 20:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593550596;
 bh=SyHZ0Wo0kdMmXhB3HauNfjbw3rcUtpXH44TVKsmAjGU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=poiy4WZ9FK2/3ySDGGwENxJRuNeC9b7nRe7aM8hJoJXADIW3NillTF248reYglom8
 0+ZuFTxbRjkkQjnv+ejTW5FXps36eGS/0zvgIlkiu8CDtqvPzWWSp08v4sfnRsVBJk
 InH2N6wr38soyV1bleIvfSlOAcFHCPDb6YcWj1aA=
Date: Tue, 30 Jun 2020 13:56:35 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Nathan Chancellor <natechancellor@gmail.com>
Message-ID: <20200630205635.GB1396584@google.com>
References: <20200624012148.180050-1-jaegeuk@kernel.org>
 <20200629150323.GA3293033@google.com>
 <20200629202720.GA230664@google.com>
 <20200630204348.GA2504307@ubuntu-s3-xlarge-x86>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200630204348.GA2504307@ubuntu-s3-xlarge-x86>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jqNJ3-003UZN-F3
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: avoid readahead race condition
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
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMDYvMzAsIE5hdGhhbiBDaGFuY2VsbG9yIHdyb3RlOgo+IE9uIE1vbiwgSnVuIDI5LCAyMDIw
IGF0IDAxOjI3OjIwUE0gLTA3MDAsIEphZWdldWsgS2ltIHdyb3RlOgo+ID4gSWYgdHdvIHJlYWRh
aGVhZCB0aHJlYWRzIGhhdmluZyBzYW1lIG9mZnNldCBlbnRlciBpbiByZWFkcGFnZXMsIGV2ZXJ5
IHJlYWQKPiA+IElPcyBhcmUgc3BsaXQgYW5kIGlzc3VlZCB0byB0aGUgZGlzayB3aGljaCBnaXZp
bmcgbG93ZXIgYmFuZHdpZHRoLgo+ID4gCj4gPiBUaGlzIHBhdGNoIHRyaWVzIHRvIGF2b2lkIHJl
ZHVuZGFudCByZWFkYWhlYWQgY2FsbHMuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEphZWdldWsg
S2ltIDxqYWVnZXVrQGtlcm5lbC5vcmc+Cj4gPiAtLS0KPiA+IHYzOgo+ID4gIC0gdXNlIFJFQUR8
V1JJVEVfT05DRQo+ID4gdjI6Cj4gPiAgIC0gYWRkIG1pc3NpbmcgY29kZSB0byBieXBhc3MgcmVh
ZAo+ID4gIAo+ID4gIGZzL2YyZnMvZGF0YS5jICB8IDE4ICsrKysrKysrKysrKysrKysrKwo+ID4g
IGZzL2YyZnMvZjJmcy5oICB8ICAxICsKPiA+ICBmcy9mMmZzL3N1cGVyLmMgfCAgMiArKwo+ID4g
IDMgZmlsZXMgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEv
ZnMvZjJmcy9kYXRhLmMgYi9mcy9mMmZzL2RhdGEuYwo+ID4gaW5kZXggOTk1Y2Y3OGIyM2M1ZS4u
MzYwYjRjOTA4MGQ5NyAxMDA2NDQKPiA+IC0tLSBhL2ZzL2YyZnMvZGF0YS5jCj4gPiArKysgYi9m
cy9mMmZzL2RhdGEuYwo+ID4gQEAgLTIyOTYsNiArMjI5Niw3IEBAIHN0YXRpYyBpbnQgZjJmc19t
cGFnZV9yZWFkcGFnZXMoc3RydWN0IGlub2RlICppbm9kZSwKPiA+ICAJdW5zaWduZWQgbnJfcGFn
ZXMgPSByYWMgPyByZWFkYWhlYWRfY291bnQocmFjKSA6IDE7Cj4gPiAgCXVuc2lnbmVkIG1heF9u
cl9wYWdlcyA9IG5yX3BhZ2VzOwo+ID4gIAlpbnQgcmV0ID0gMDsKPiA+ICsJYm9vbCBkcm9wX3Jh
ID0gZmFsc2U7Cj4gPiAgCj4gPiAgCW1hcC5tX3BibGsgPSAwOwo+ID4gIAltYXAubV9sYmxrID0g
MDsKPiA+IEBAIC0yMzA2LDEwICsyMzA3LDI0IEBAIHN0YXRpYyBpbnQgZjJmc19tcGFnZV9yZWFk
cGFnZXMoc3RydWN0IGlub2RlICppbm9kZSwKPiA+ICAJbWFwLm1fc2VnX3R5cGUgPSBOT19DSEVD
S19UWVBFOwo+ID4gIAltYXAubV9tYXlfY3JlYXRlID0gZmFsc2U7Cj4gPiAgCj4gPiArCS8qCj4g
PiArCSAqIFR3byByZWFkYWhlYWQgdGhyZWFkcyBmb3Igc2FtZSBhZGRyZXNzIHJhbmdlIGNhbiBj
YXVzZSByYWNlIGNvbmRpdGlvbgo+ID4gKwkgKiB3aGljaCBmcmFnbWVudHMgc2VxdWVudGlhbCBy
ZWFkIElPcy4gU28gbGV0J3MgYXZvaWQgZWFjaCBvdGhlci4KPiA+ICsJICovCj4gPiArCWlmIChy
YWMgJiYgcmVhZGFoZWFkX2NvdW50KHJhYykpIHsKPiA+ICsJCWlmIChSRUFEX09OQ0UoRjJGU19J
KGlub2RlKS0+cmFfb2Zmc2V0KSA9PSByZWFkYWhlYWRfaW5kZXgocmFjKSkKPiA+ICsJCQlkcm9w
X3JhID0gdHJ1ZTsKPiA+ICsJCWVsc2UKPiA+ICsJCQlXUklURV9PTkNFKEYyRlNfSShpbm9kZSkt
PnJhX29mZnNldCwKPiA+ICsJCQkJCQlyZWFkYWhlYWRfaW5kZXgocmFjKSk7Cj4gPiArCX0KPiA+
ICsKPiA+ICAJZm9yICg7IG5yX3BhZ2VzOyBucl9wYWdlcy0tKSB7Cj4gPiAgCQlpZiAocmFjKSB7
Cj4gPiAgCQkJcGFnZSA9IHJlYWRhaGVhZF9wYWdlKHJhYyk7Cj4gPiAgCQkJcHJlZmV0Y2h3KCZw
YWdlLT5mbGFncyk7Cj4gPiArCQkJaWYgKGRyb3BfcmEpCj4gPiArCQkJCWdvdG8gbmV4dF9wYWdl
Owo+IAo+IFdoZW4gQ09ORklHX0YyRlNfRlNfQ09NUFJFU1NJT04gaXMgbm90IHNldCAoaS5lLiB4
ODZfNjQgZGVmY29uZmlnICsKPiBDT05GSUdfRjJGU19GUz15KToKPiAKPiAkIG1ha2UgLXNraiIk
KG5wcm9jKSIgTz1vdXQgZGlzdGNsZWFuIGRlZmNvbmZpZyBmcy9mMmZzL2RhdGEubwo+IC4uL2Zz
L2YyZnMvZGF0YS5jOiBJbiBmdW5jdGlvbiDigJhmMmZzX21wYWdlX3JlYWRwYWdlc+KAmToKPiAu
Li9mcy9mMmZzL2RhdGEuYzoyMzI3OjU6IGVycm9yOiBsYWJlbCDigJhuZXh0X3BhZ2XigJkgdXNl
ZCBidXQgbm90IGRlZmluZWQKPiAgMjMyNyB8ICAgICBnb3RvIG5leHRfcGFnZTsKPiAgICAgICB8
ICAgICBefn5+Cj4gLi4uCgpUaGFua3MuIEkgcHVzaGVkIHRoZSBmaXggZm9yIC1uZXh0LgpodHRw
czovL2xvcmUua2VybmVsLm9yZy9saW51eC1mMmZzLWRldmVsLzFiZTE4Mzk3LTdmYzYtNzAzZS0x
MjFiLWUyMTBlMTAxMzU3ZkBpbmZyYWRlYWQub3JnL1QvI3QKClRoYW5rcywKCj4gCj4gQ2hlZXJz
LAo+IE5hdGhhbgo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiBMaW51eC1mMmZzLWRl
dmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0
L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApM
aW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJj
ZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
