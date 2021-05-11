Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F08F37B10B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 May 2021 23:51:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lgaHW-0004I2-3n; Tue, 11 May 2021 21:51:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lgaHU-0004Ho-Kk
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 May 2021 21:51:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tADXxgUNq+uw853BSCcS14tNEj/nmuXAZ0RHmUj2TkA=; b=AVF5oswnLd3Z4Y1CVxOm5A6KdM
 OjiyFjN/EHmdPTqyfBuDFNvw4NsokIBu1r2ApV1R8h/nxyAAwE/Wvzx2NHMKQnC7oY6nLuBGZhOzc
 AQcTnCznt/2UbNPD+EfztUzdKKPmVpVClm2aHL8xr1VIBe84Kb85S7L+Z5Vi95XPsGbM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tADXxgUNq+uw853BSCcS14tNEj/nmuXAZ0RHmUj2TkA=; b=XJbO11hmLghzUt/meha+YpPVQf
 N59tPqIh6VxRskciPQqf+VWuX8j1dM/CrdK9XGfhBvFTh1XDhaF6m7FU8nyC/vpH+VImhhYVGUriD
 BexN1CE+QURkG3WrY0QxCfwP0kysv2gsOE8FxR2yozjPLty/omPMdWQxUqmvoUC4dOAo=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lgaHO-004Jx6-83
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 May 2021 21:51:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5821361628;
 Tue, 11 May 2021 21:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620769856;
 bh=2pi9Gk3ILIYBRuCdmP8GeTLIqcHAkVvoEeVt4NR6QU0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QvS5KnCPUXGrtRoHvyvJslty8QyJO4BRFTHEAC3R6bAkmEFxxvtll3/hFZqWBFiD6
 NIH3/LRijzVwDWzejD3loX2PoD8GTh5TFu8oe82N9Cublxw6ioQfpUnx9JFns97FRl
 WSBvrCg4Yrh6oi/D2YJbyhTOSZ6eEWvwqli40U1KGdpoFe3Ph4Tghg2+ZN+caKe8Ks
 zL+be+u2JIuxESfSJb29yqbtB7TZPPwCCu0jsQx/rGgjrosts4XauyR0RwEjS/lzEA
 k/XSYNzgNf8Y4S0EAwqwnX/TzfJDmOHJVISp6z7gGNaaOb3h1IvSFXeEOQ6qz20fXb
 50BozWA0tc3Og==
Date: Tue, 11 May 2021 14:50:54 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: changfengnan@vivo.com
Message-ID: <YJr8PuZlOBqb+Qv1@google.com>
References: <20210507094455.1695-1-changfengnan@vivo.com>
 <YJlUpHJLONlORWWl@google.com>
 <000b01d74656$518e96f0$f4abc4d0$@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <000b01d74656$518e96f0$f4abc4d0$@vivo.com>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lgaHO-004Jx6-83
Subject: Re: [f2fs-dev] =?utf-8?b?562U5aSNOiBbUEFUQ0ggdjRdIGYyZnM6IGNvbXBy?=
 =?utf-8?q?ess=3A_avoid_unnecessary_check_in_f2fs=5Fprepare=5Fcompress=5Fo?=
 =?utf-8?q?verwrite?=
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMDUvMTEsIGNoYW5nZmVuZ25hbkB2aXZvLmNvbSB3cm90ZToKPiBIaSBKYWVnZXVrOgo+IAo+
IElmIHRoZXJlJ3JlIGV4aXN0aW5nIGNsdXN0ZXJzIGJleW9uZCBpX3NpemUsIG1heSBjYXVzZSBk
YXRhIGNvcnJ1cHRpb24sIGJ1dAo+IHdpbGwgdGhpcyBoYXBwZW4gaW4gbm9ybWFsPyBtYXliZSBz
b21lIGVycm9yIGNhbiBjYXVzZSB0aGlzLCBpZiBpX3NpemUgaXMKPiBlcnJvciB0aGUgZGF0YSBi
ZXlvbmQgc2l6ZSBzdGlsbCBjYW4ndCBoYW5kbGUgcHJvcGVybHkuICBJcyB0aGVyZSBub3JtYWwK
PiBjYXNlIGNhbiBjYXN1ZSBleGlzdGluZyBjbHVzdGVycyBiZXlvbmQgaV9zaXplPwoKV2UgZG9u
J3QgaGF2ZSBhIHJ1bGUgdG8gc3luYyBiZXR3ZWVuIGlfc2l6ZSBhbmQgaV9ibG9ja3MuCgo+IAo+
IFRoYW5rcy4KPiAKPiAtLS0tLemCruS7tuWOn+S7ti0tLS0tCj4g5Y+R5Lu25Lq6OiBKYWVnZXVr
IEtpbSA8amFlZ2V1a0BrZXJuZWwub3JnPiAKPiDlj5HpgIHml7bpl7Q6IDIwMjHlubQ15pyIMTDm
l6UgMjM6NDQKPiDmlLbku7bkuro6IEZlbmduYW4gQ2hhbmcgPGNoYW5nZmVuZ25hbkB2aXZvLmNv
bT4KPiDmioTpgIE6IGNoYW9Aa2VybmVsLm9yZzsgbGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQKPiDkuLvpopg6IFJlOiBbUEFUQ0ggdjRdIGYyZnM6IGNvbXByZXNzOiBhdm9p
ZCB1bm5lY2Vzc2FyeSBjaGVjayBpbgo+IGYyZnNfcHJlcGFyZV9jb21wcmVzc19vdmVyd3JpdGUK
PiAKPiBPbiAwNS8wNywgRmVuZ25hbiBDaGFuZyB3cm90ZToKPiA+IHdoZW4gd3JpdGUgY29tcHJl
c3NlZCBmaWxlIHdpdGggT19UUlVOQywgdGhlcmUgd2lsbCBiZSBhIGxvdCBvZiAKPiA+IHVubmVj
ZXNzYXJ5IGNoZWNrIHZhbGlkIGJsb2NrcyBpbiBmMmZzX3ByZXBhcmVfY29tcHJlc3Nfb3Zlcndy
aXRlLCAKPiA+IGVzcGVjaWFsbHkgd2hlbiB3cml0dGVuIGluIHBhZ2Ugc2l6ZSwgcmVtb3ZlIGl0
Lgo+ID4gCj4gPiBUaGlzIHBhdGNoIHdpbGwgbm90IGJyaW5nIHNpZ25pZmljYW50IHBlcmZvcm1h
bmNlIGltcHJvdmVtZW50cywgSSB0ZXN0IAo+ID4gdGhpcyBvbiBtb2JpbGUgcGhvbmUsIHVzZSBh
bmRyb2JlbmNoLCB0aGUgc2VxdWVudGlhbCB3cml0ZSB0ZXN0IGNhc2UgCj4gPiB3YXMgb3BlbiBm
aWxlIHdpdGggT19UUlVOQywgc2V0IHdyaXRlIHNpemUgdG8gNEtCLCAgcGVyZm9ybWFuY2UgCj4g
PiBpbXByb3ZlZCBhYm91dCAyJS0zJS4gSWYgd3JpdGUgc2l6ZSBzZXQgdG8gMzJNQiwgcGVyZm9y
bWFuY2UgaW1wcm92ZWQKPiBhYm91dCAwLjUlLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBGZW5n
bmFuIENoYW5nIDxjaGFuZ2ZlbmduYW5Adml2by5jb20+Cj4gPiAtLS0KPiA+ICBmcy9mMmZzL2Rh
dGEuYyB8IDggKysrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCj4g
PiAKPiA+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2RhdGEuYyBiL2ZzL2YyZnMvZGF0YS5jIGluZGV4
IAo+ID4gY2Y5MzU0NzRmZmJhLi5iOWVjN2IxODJmNDUgMTAwNjQ0Cj4gPiAtLS0gYS9mcy9mMmZz
L2RhdGEuYwo+ID4gKysrIGIvZnMvZjJmcy9kYXRhLmMKPiA+IEBAIC0zMzAzLDkgKzMzMDMsMTcg
QEAgc3RhdGljIGludCBmMmZzX3dyaXRlX2JlZ2luKHN0cnVjdCBmaWxlICpmaWxlLCAKPiA+IHN0
cnVjdCBhZGRyZXNzX3NwYWNlICptYXBwaW5nLCAgI2lmZGVmIENPTkZJR19GMkZTX0ZTX0NPTVBS
RVNTSU9OCj4gPiAgCWlmIChmMmZzX2NvbXByZXNzZWRfZmlsZShpbm9kZSkpIHsKPiA+ICAJCWlu
dCByZXQ7Cj4gPiArCQlwZ29mZl90IGVuZCA9IChpX3NpemVfcmVhZChpbm9kZSkgKyBQQUdFX1NJ
WkUgLSAxKSA+Pgo+IFBBR0VfU0hJRlQ7Cj4gPiAKPiA+ICAJCSpmc2RhdGEgPSBOVUxMOwo+ID4g
Cj4gPiArCQkvKgo+ID4gKwkJICogd2hlbiB3cml0ZSBwb3MgaXMgYmlnZ2VyIHRoYW4gaW5vZGUg
c2l6ZQo+ICxmMmZzX3ByZXBhcmVfY29tcHJlc3Nfb3ZlcndyaXRlCj4gPiArCQkgKiBhbHdheXMg
cmV0dXJuIDAsIHNvIGNoZWNrIHBvcyBmaXJzdCB0byBhdm9pZCB0aGlzLgo+ID4gKwkJICovCj4g
PiArCQlpZiAoaW5kZXggPj0gZW5kKQo+ID4gKwkJCWdvdG8gcmVwZWF0Owo+IAo+IFdoYXQgaWYg
dGhlcmUncmUgZXhpc3RpbmcgY2x1c3RlcnMgYmV5b25kIGlfc2l6ZT8gR2l2ZW4gcGVyZm9ybWFu
Y2UgaW1wYWN0cywKPiBkbyB3ZSByZWFsbHkgbmVlZCB0aGlzPwo+IAo+ID4gKwo+ID4gIAkJcmV0
ID0gZjJmc19wcmVwYXJlX2NvbXByZXNzX292ZXJ3cml0ZShpbm9kZSwgcGFnZXAsCj4gPiAgCQkJ
CQkJCWluZGV4LCBmc2RhdGEpOwo+ID4gIAkJaWYgKHJldCA8IDApIHsKPiA+IC0tCj4gPiAyLjI5
LjAKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJj
ZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9s
aW51eC1mMmZzLWRldmVsCg==
