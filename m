Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C514B0424
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Feb 2022 05:03:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nI0fx-00085c-LG; Thu, 10 Feb 2022 04:03:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <david@fromorbit.com>) id 1nI0fv-00085V-7n
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Feb 2022 04:03:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C5FcYudh4U8x3wKliwF6eTwpu/OJ5TBQh+ivyu3tItg=; b=WbGKw+FK5475dvdTLsqwDtDPJF
 CqsB6pWQlwUTUPb0yafWOZOThXNb899uN8p6aLhGwUBgua/LCkhyro8Cl2Jx4552L6b6KLJRLp+P1
 9/2BWTNLmykCkMK0JRHEWKSUZXaznpRIBNHGzWX1mYGILgJtJdncHe0h+L54X7tabVxA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=C5FcYudh4U8x3wKliwF6eTwpu/OJ5TBQh+ivyu3tItg=; b=RVwbws+uhMW1F+TfEyaAGrx42C
 UH8R23YqbitNlkzQZ/v7FPtz8HkY+GXEiJJ7e/fn5tfdP7yMAiQwBWvKKlEWpRT7NueRPygozRxOK
 l7+3QZTCDirAGPQb0+dpmzwBELMEJeFm8Rs2oAXMryecAUrzsAxS9rSv6IzepPee9P6s=;
Received: from mail104.syd.optusnet.com.au ([211.29.132.246])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.94.2)
 id 1nI0fo-00CXvj-Ka
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Feb 2022 04:03:17 +0000
Received: from dread.disaster.area (pa49-180-69-7.pa.nsw.optusnet.com.au
 [49.180.69.7])
 by mail104.syd.optusnet.com.au (Postfix) with ESMTPS id C995852CBBA;
 Thu, 10 Feb 2022 15:03:05 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1nI0fg-00ACyj-Bx; Thu, 10 Feb 2022 15:03:04 +1100
Date: Thu, 10 Feb 2022 15:03:04 +1100
From: Dave Chinner <david@fromorbit.com>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20220210040304.GM59729@dread.disaster.area>
References: <YekdnxpeunTGfXqX@infradead.org> <20220120171027.GL13540@magnolia>
 <YenIcshA706d/ziV@sol.localdomain>
 <20220120210027.GQ13540@magnolia>
 <20220120220414.GH59729@dread.disaster.area>
 <Yenm1Ipx87JAlyXg@sol.localdomain>
 <20220120235755.GI59729@dread.disaster.area>
 <20220121023603.GH13563@magnolia>
 <20220123230332.GL59729@dread.disaster.area>
 <YgMUa2Cdr/QoMTPh@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YgMUa2Cdr/QoMTPh@sol.localdomain>
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.4 cv=e9dl9Yl/ c=1 sm=1 tr=0 ts=62048e7a
 a=NB+Ng1P8A7U24Uo7qoRq4Q==:117 a=NB+Ng1P8A7U24Uo7qoRq4Q==:17
 a=IkcTkHD0fZMA:10 a=oGFeUVbbRNcA:10 a=7-415B0cAAAA:8
 a=txpYLRzjzDLeYr1fpcUA:9 a=QEXdDO2ut3YA:10 a=biEYGPWJfzWAr4FL6Ov7:22
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Feb 08, 2022 at 05:10:03PM -0800, Eric Biggers wrote:
 > On Mon, Jan 24, 2022 at 10:03:32AM +1100, Dave Chinner wrote: > > > > >
 > /* 0xa0 */ > > > > > > /* File range alignment needed for best [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [211.29.132.246 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nI0fo-00CXvj-Ka
Subject: Re: [f2fs-dev] [PATCH v10 0/5] add support for direct I/O with
 fscrypt using blk-crypto
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
Cc: linux-xfs@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 "Darrick J. Wong" <djwong@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 Christoph Hellwig <hch@infradead.org>, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVHVlLCBGZWIgMDgsIDIwMjIgYXQgMDU6MTA6MDNQTSAtMDgwMCwgRXJpYyBCaWdnZXJzIHdy
b3RlOgo+IE9uIE1vbiwgSmFuIDI0LCAyMDIyIGF0IDEwOjAzOjMyQU0gKzExMDAsIERhdmUgQ2hp
bm5lciB3cm90ZToKPiA+ID4gCj4gPiA+IAkvKiAweGEwICovCj4gPiA+IAo+ID4gPiAJLyogRmls
ZSByYW5nZSBhbGlnbm1lbnQgbmVlZGVkIGZvciBiZXN0IHBlcmZvcm1hbmNlLCBpbiBieXRlcy4g
Ki8KPiA+ID4gCV9fdTMyCXN0eF9kaW9fZnBvc19hbGlnbl9vcHQ7Cj4gPiAKPiA+IFRoaXMgaXMg
YSBjb21tb24gcHJvcGVydHkgb2YgYm90aCBESU8gYW5kIGJ1ZmZlcmVkIElPLCBzbyBubyBuZWVk
Cj4gPiBmb3IgaXQgdG8gYmUgZGlvLW9ubHkgcHJvcGVydHkuCj4gPiAKPiA+IAlfX3UzMglzdHhf
b2Zmc2V0X2FsaWduX29wdGltYWw7Cj4gPiAKPiAKPiBMb29raW5nIGF0IHRoaXMgbW9yZSBjbG9z
ZWx5OiB3aWxsIHN0eF9vZmZzZXRfYWxpZ25fb3B0aW1hbCBhY3R1YWxseSBiZSB1c2VmdWwsCj4g
Z2l2ZW4gdGhhdCBzdFt4XV9ibGtzaXplIGFscmVhZHkgZXhpc3RzPwoKWWVzLCBiZWNhdXNlLi4u
LgoKPiBGcm9tIHRoZSBzdGF0KDIpIGFuZCBzdGF0eCgyKSBtYW4gcGFnZXM6Cj4gCj4gCXN0X2Js
a3NpemUKPiAJCVRoaXMgZmllbGQgIGdpdmVzICB0aGUgICJwcmVmZXJyZWQiICBibG9jayAgc2l6
ZSAgZm9yICBlZmZpY2llbnQKPiAJCWZpbGVzeXN0ZW0gSS9PLgo+IAo+IAlzdHhfYmxrc2l6ZQo+
IAkJVGhlICJwcmVmZXJyZWQiIGJsb2NrIHNpemUgZm9yIGVmZmljaWVudCBmaWxlc3lzdGVtIEkv
Ty4gIChXcml04oCQCj4gCQlpbmcgIHRvICBhIGZpbGUgaW4gc21hbGxlciBjaHVua3MgbWF5IGNh
dXNlIGFuIGluZWZmaWNpZW50IHJlYWQtCj4gCQltb2RpZnktcmV3cml0ZS4pCgouLi4gaGlzdG9y
aWNhbGx5IHNwZWFraW5nLCB0aGlzIGlzIGludGVuZGVkIHRvIGF2b2lkIFJNVyBjeWNsZXMgZm9y
CnN1Yi1ibG9jayBhbmQvb3Igc3ViLVBBR0VfU0laRSB3cml0ZSgpIElPcy4gaS5lLiB0aGUgcHJh
Y3RpY2FsCmRlZmluaXRpb24gb2Ygc3RfYmxrc2l6ZSBpcyB0aGUgKm1pbmltdW0qIElPIHNpemUg
dGhlIG5lZWRlZCB0bwphdm9pZCBwYWdlIGNhY2hlIFJNVyBjeWNsZXMuCgpIb3dldmVyLCBYRlMg
aGFzIGEgIi1vIGxhcmdlaW8iIG1vdW50IG9wdGlvbiwgdGhhdCBzZXRzIHRoaXMgdmFsdWUKdG8g
aW50ZXJuYWwgb3B0aW1hbCBmaWxlc3l0c2VtIGFsaWdubWVudCB2YWx1ZXMgc3VjaCBhcyBzdHJp
cGUgdW5pdApvciBldmVuIHN0cmlwZSB3aWR0aCAoLW8gbGFyZ2Vpbyxzd2FsbG9jKS4gVEhpcyBt
ZWFucyBpdCBjYW4gYmUgdXAKdG8gMkdCIChtYXliZSBsYXJnZXI/KSBpbiBzaXplLgoKVEhlIHBy
b2JsZW0gd2l0aCB0aGlzIGlzIHRoYXQgbWFueSBhcHBsaWNhdGlvbnMgYXJlIG5vdCBwcmVwYXJl
ZCB0bwpzZWUgYSB2YWx1ZSBvZiwgc2F5LCAxNk1CIGluIHN0X2Jsa3NpemUgcmF0aGVyIHRoYW4g
NDA5NiBieXRlcy4gQW4KZXhhbXBsZSBvZiBzdWNoIHByb2JsZW1zIGFyZSBhcHBsaWNhdGlvbnMg
c2l6aW5nIHRoZWlyIElPIGJ1ZmZlcnMgYXMKYSBtdWx0aXBsZSBvZiBzdF9ibGtzaXplIC0gd2Un
dmUgaGFkIGFwcGxpY2F0aW9ucyBmYWlsIGJlY2F1c2UgdGhleQp0cnkgdG8gdXNlIG11bHRpLUdC
IHNpemVkIElPIGJ1ZmZlcnMgYXMgYSByZXN1bHQgb2Ygc2V0dGluZwpzdF9ibGtzaXplIHRvIHRo
ZSBmaWxlc3lzdGVtL3N0b3JhZ2UgaWRlYSBvZiBvcHRpbWFsIElPIHNpemUgcmF0aGVyCnRoYW4g
UEFHRV9TSVpFLgoKSGVuY2UsIHdlIGNhbid0IHJlYWxseSBjaGFuZ2UgdGhlIHZhbHVlIG9mIHN0
X2Jsa3NpemUgd2l0aG91dApyaXNraW5nIHJhbmRvbSBicmVha2FnZSBpbiB1c2Vyc3BhY2UuIGhl
bmNlIHRoZSBwcmFjdGljYWwgZGVmaW5pdGlvbgpvZiBzdF9ibGtzaXplIGlzIHRoZSAqbWluaW11
bSogSU8gc2l6ZSB0aGF0IGF2b2lkcyBSTVcgY3ljbGVzIGZvciBhbgppbmRpdmlkdWFsIHdyaXRl
KCkgc3lzY2FsbCwgbm90IHRoZSBtb3N0IGVmZmljaWVudCBJTyBzaXplLgoKPiBGaWxlIG9mZnNl
dHMgYXJlbid0IGV4cGxpY2l0bHkgbWVudGlvbmVkLCBidXQgSSB0aGluayBpdCdzIGltcGxpZWQg
dGhleSBzaG91bGQKPiBiZSBhIG11bHRpcGxlIG9mIHN0W3hdX2Jsa3NpemUsIGp1c3QgbGlrZSB0
aGUgSS9PIHNpemUuICBPdGhlcndpc2UsIHRoZSBJL08KPiB3b3VsZCBvYnZpb3VzbHkgcmVxdWly
ZSByZWFkaW5nL3dyaXRpbmcgcGFydGlhbCBibG9ja3MuCgpPZiBjb3Vyc2UgaXQgaW1wbGllcyBh
bGlnbmVkIGZpbGUgb2Zmc2V0cyAtIGJsb2NrIGFsaWduZWQgSU8gaXMKYWJzb2x1dGVseSBuZWNl
c3NhcnkgZm9yIGVmZmNpZW50IGZpbGVzeXN0ZW0gSU8uIEl0IGhhcyBmb3IgcHJldHR5Cm11Y2gg
dGhlIGVudGlyZSBvZiB1bml4IGhpc3RvcnkuLi4KCj4gU28sIHRoZSBwcm9wb3NlZCBzdHhfb2Zm
c2V0X2FsaWduX29wdGltYWwgZmllbGQgc291bmRzIGxpa2UgdGhlIHNhbWUgdGhpbmcgdG8KPiBt
ZS4gIElzIHRoZXJlIGFueXRoaW5nIEknbSBtaXN1bmRlcnN0YW5kaW5nPwo+Cj4gUHV0dGluZyBz
dHhfb2Zmc2V0X2FsaWduX29wdGltYWwgYmVoaW5kIHRoZSBTVEFUWF9ESVJFQ1RJTyBmbGFnIHdv
dWxkIGFsc28gYmUKPiBjb25mdXNpbmcgaWYgaXQgd291bGQgYXBwbHkgdG8gYm90aCBkaXJlY3Qg
YW5kIGJ1ZmZlcmVkIEkvTy4KClNvIGp1c3QgbmFtZSB0aGUgZmxhZyBTVEFUWF9JT0FMSUdOIHNv
IHRoYXQgaXQgY2FuIGNvdmVyIGdlbmVyaWMsCmJ1ZmZlcmVkIHNwZWNpZmljIGFuZCBESU8gc3Bl
Y2lmaWMgcGFyYW1ldGVycyBpbiBvbmUgaGl0LiBTaW1wbGUsCnllcz8KCkNoZWVycywKCkRhdmUu
Ci0tIApEYXZlIENoaW5uZXIKZGF2aWRAZnJvbW9yYml0LmNvbQoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBs
aXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMu
c291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
