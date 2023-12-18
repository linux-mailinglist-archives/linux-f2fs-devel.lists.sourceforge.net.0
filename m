Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DE78166DA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 18 Dec 2023 07:53:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rF7VI-0004hF-Tn;
	Mon, 18 Dec 2023 06:53:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dlemoal@kernel.org>) id 1rF7VH-0004h9-Ew
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Dec 2023 06:53:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Egr0NLFekHxbvioypBIptqX4P98m9+GvwDJy/D/IsaI=; b=lv5cIH6vhJXCQ0A9akq4LDte/T
 L+Hn+gpihhedE3CRjMgmgPbpfVi2qoj5MrLRgMi5wzL2wKgBt7mlgrxJiZccxe2i7we9n0wXyB06x
 WvpMUsSIHO3KSl0ldGtfK7nbWjEL3gw3JlC6bH4Gmtjy6fqcy5lyh8KFDar6FrRVN1sE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Egr0NLFekHxbvioypBIptqX4P98m9+GvwDJy/D/IsaI=; b=i0tcgZuPn+C4Gr3PfQPruamUN0
 CWMnXo1+Q2hFBt1W9Kq7Sb1OlhWGLtbqGnCu5T6DRMfu9U1f2FPQLs38z6cdcWXY3pDG0QN+fAV0j
 fOnpGjUjjWYb3kvwXuptKVi4DeDlpsMAD/+dgyZixdir1hFdwNAz9fDJA6TrrtXWhmNY=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rF7VF-0000cF-HA for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Dec 2023 06:53:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 836A5CE0EDA;
 Mon, 18 Dec 2023 06:53:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ADCEC433C8;
 Mon, 18 Dec 2023 06:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702882389;
 bh=EpFEN3Jue2G6Rxerxg89hbnN15oJOVy46RhaWGQO2tw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=loBrPuycmVkyYVqG8sgfHh3oEDZfWG5B8CoIyakdwRnEweatH2xsCuIZr02Fy23+s
 NP6GBo2huii33qSC8iG8JeB8qFZasdKInhhYftE3Q8ChdHj8/tCwUsmKJl6c8YLKxy
 cVlJTOYI8GtA3yDDTwe6nVlimJa8Rz5X2BUKqoUuQwFaMSrfaStI0bPQlO9a2rflyi
 xT2Ps/TW6alm8uF+2a2DYLo5ROKLijEteSNVxVnWCGFPt3iup5B11HrcZF/360Z7Jf
 zAUZNPBt9TAyJg61SfSNPXKR06JSvPTEKJqzevSpQ10Jd357eLVI5OPHS0/Yf/Iojn
 MqyxR4tcyMymA==
Message-ID: <190f58f7-2ed6-46f8-af59-5e167a0bddeb@kernel.org>
Date: Mon, 18 Dec 2023 15:53:06 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: =?UTF-8?B?RWQgVHNhaSAo6JSh5a6X6LuSKQ==?= <Ed.Tsai@mediatek.com>,
 "hch@lst.de" <hch@lst.de>, "axboe@kernel.dk" <axboe@kernel.dk>
References: <20231217165359.604246-1-hch@lst.de>
 <20231217165359.604246-4-hch@lst.de>
 <b4d33dc359495c6227a3f20285566eed27718a14.camel@mediatek.com>
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <b4d33dc359495c6227a3f20285566eed27718a14.camel@mediatek.com>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2023/12/18 15:15, Ed Tsai (蔡宗軒) wrote: > Hi Christoph,
    > > some minor suggestions: > > On Sun, 2023-12-17 at 17:53 +0100, Christoph
    Hellwig wrote: >> >> diff --git a/drivers/md/dm-table.c b/d [...] 
 
 Content analysis details:   (-2.6 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rF7VF-0000cF-HA
Subject: Re: [f2fs-dev] [PATCH 3/5] block: remove support for the host aware
 zone model
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
Cc: "dm-devel@lists.linux.dev" <dm-devel@lists.linux.dev>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 =?UTF-8?B?Q2FzcGVyIExpICjmnY7kuK3mpq4p?= <casper.li@mediatek.com>,
 =?UTF-8?B?Q2h1bi1IdW5nIFd1ICjlt6vpp7/lro8p?= <Chun-hung.Wu@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "virtualization@lists.linux.dev" <virtualization@lists.linux.dev>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMy8xMi8xOCAxNToxNSwgRWQgVHNhaSAo6JSh5a6X6LuSKSB3cm90ZToKPiBIaSBDaHJp
c3RvcGgsCj4gCj4gc29tZSBtaW5vciBzdWdnZXN0aW9uczoKPiAKPiBPbiBTdW4sIDIwMjMtMTIt
MTcgYXQgMTc6NTMgKzAxMDAsIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+Pgo+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tZC9kbS10YWJsZS5jIGIvZHJpdmVycy9tZC9kbS10YWJsZS5jCj4+IGlu
ZGV4IDE5OGQzOGI1MzMyMmMxLi4yNjBiNWI4ZjJiMGQ3ZSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVy
cy9tZC9kbS10YWJsZS5jCj4+ICsrKyBiL2RyaXZlcnMvbWQvZG0tdGFibGUuYwo+PiBAQCAtMTU3
OSwyMSArMTU3OSwxOCBAQCBib29sIGRtX3RhYmxlX2hhc19ub19kYXRhX2RldmljZXMoc3RydWN0
Cj4+IGRtX3RhYmxlICp0KQo+PiAgCXJldHVybiB0cnVlOwo+PiAgfQo+PiAgCj4+IC1zdGF0aWMg
aW50IGRldmljZV9ub3Rfem9uZWRfbW9kZWwoc3RydWN0IGRtX3RhcmdldCAqdGksIHN0cnVjdAo+
PiBkbV9kZXYgKmRldiwKPj4gLQkJCQkgIHNlY3Rvcl90IHN0YXJ0LCBzZWN0b3JfdCBsZW4sIHZv
aWQKPj4gKmRhdGEpCj4+ICtzdGF0aWMgaW50IGRldmljZV9ub3Rfem9uZWQoc3RydWN0IGRtX3Rh
cmdldCAqdGksIHN0cnVjdCBkbV9kZXYKPj4gKmRldiwKPj4gKwkJCSAgICBzZWN0b3JfdCBzdGFy
dCwgc2VjdG9yX3QgbGVuLCB2b2lkICpkYXRhKQo+PiAgewo+PiAtCXN0cnVjdCByZXF1ZXN0X3F1
ZXVlICpxID0gYmRldl9nZXRfcXVldWUoZGV2LT5iZGV2KTsKPj4gLQllbnVtIGJsa196b25lZF9t
b2RlbCAqem9uZWRfbW9kZWwgPSBkYXRhOwo+PiArCWJvb2wgKnpvbmVkID0gZGF0YTsKPj4gIAo+
PiAtCXJldHVybiBibGtfcXVldWVfem9uZWRfbW9kZWwocSkgIT0gKnpvbmVkX21vZGVsOwo+PiAr
CXJldHVybiBiZGV2X2lzX3pvbmVkKGRldi0+YmRldikgIT0gKnpvbmVkOwo+PiAgfQo+PiAgCj4+
ICBzdGF0aWMgaW50IGRldmljZV9pc196b25lZF9tb2RlbChzdHJ1Y3QgZG1fdGFyZ2V0ICp0aSwg
c3RydWN0IGRtX2Rldgo+PiAqZGV2LAo+PiAgCQkJCSBzZWN0b3JfdCBzdGFydCwgc2VjdG9yX3Qg
bGVuLCB2b2lkCj4+ICpkYXRhKQo+IAo+IFNlZW1zIGxpa2UgdGhlIHdvcmQgIm1vZGVsIiBzaG91
bGQgYWxzbyBiZSByZW1vdmUgaGVyZS4KPiAKPj4gIHsKPj4gLQlzdHJ1Y3QgcmVxdWVzdF9xdWV1
ZSAqcSA9IGJkZXZfZ2V0X3F1ZXVlKGRldi0+YmRldik7Cj4+IC0KPj4gLQlyZXR1cm4gYmxrX3F1
ZXVlX3pvbmVkX21vZGVsKHEpICE9IEJMS19aT05FRF9OT05FOwo+PiArCXJldHVybiBiZGV2X2lz
X3pvbmVkKGRldi0+YmRldik7Cj4+ICB9Cj4+ICAKPj4gIC8qCj4+IEBAIC0xNjAzLDggKzE2MDAs
NyBAQCBzdGF0aWMgaW50IGRldmljZV9pc196b25lZF9tb2RlbChzdHJ1Y3QKPj4gZG1fdGFyZ2V0
ICp0aSwgc3RydWN0IGRtX2RldiAqZGV2LAo+PiAgICogaGFzIHRoZSBETV9UQVJHRVRfTUlYRURf
Wk9ORURfTU9ERUwgZmVhdHVyZSBzZXQsIHRoZSBkZXZpY2VzIGNhbgo+PiBoYXZlIGFueQo+PiAg
ICogem9uZWQgbW9kZWwgd2l0aCBhbGwgem9uZWQgZGV2aWNlcyBoYXZpbmcgdGhlIHNhbWUgem9u
ZSBzaXplLgo+PiAgICovCj4+IC1zdGF0aWMgYm9vbCBkbV90YWJsZV9zdXBwb3J0c196b25lZF9t
b2RlbChzdHJ1Y3QgZG1fdGFibGUgKnQsCj4+IC0JCQkJCSAgZW51bSBibGtfem9uZWRfbW9kZWwK
Pj4gem9uZWRfbW9kZWwpCj4+ICtzdGF0aWMgYm9vbCBkbV90YWJsZV9zdXBwb3J0c196b25lZChz
dHJ1Y3QgZG1fdGFibGUgKnQsIGJvb2wgem9uZWQpCj4+ICB7Cj4+ICAJZm9yICh1bnNpZ25lZCBp
bnQgaSA9IDA7IGkgPCB0LT5udW1fdGFyZ2V0czsgaSsrKSB7Cj4+ICAJCXN0cnVjdCBkbV90YXJn
ZXQgKnRpID0gZG1fdGFibGVfZ2V0X3RhcmdldCh0LCBpKTsKPj4gQEAgLTE2MjMsMTEgKzE2MTks
MTEgQEAgc3RhdGljIGJvb2wKPj4gZG1fdGFibGVfc3VwcG9ydHNfem9uZWRfbW9kZWwoc3RydWN0
IGRtX3RhYmxlICp0LAo+PiAgCj4+ICAJCWlmIChkbV90YXJnZXRfc3VwcG9ydHNfem9uZWRfaG0o
dGktPnR5cGUpKSB7Cj4+ICAJCQlpZiAoIXRpLT50eXBlLT5pdGVyYXRlX2RldmljZXMgfHwKPj4g
LQkJCSAgICB0aS0+dHlwZS0+aXRlcmF0ZV9kZXZpY2VzKHRpLAo+PiBkZXZpY2Vfbm90X3pvbmVk
X21vZGVsLAo+PiAtCQkJCQkJICAgICAgJnpvbmVkX21vZGVsKSkKPj4gKwkJCSAgICB0aS0+dHlw
ZS0+aXRlcmF0ZV9kZXZpY2VzKHRpLAo+PiBkZXZpY2Vfbm90X3pvbmVkLAo+PiArCQkJCQkJICAg
ICAgJnpvbmVkKSkKPj4gIAkJCQlyZXR1cm4gZmFsc2U7Cj4+ICAJCX0gZWxzZSBpZiAoIWRtX3Rh
cmdldF9zdXBwb3J0c19taXhlZF96b25lZF9tb2RlbCh0aS0KPj4+IHR5cGUpKSB7Cj4+IC0JCQlp
ZiAoem9uZWRfbW9kZWwgPT0gQkxLX1pPTkVEX0hNKQo+PiArCQkJaWYgKHpvbmVkKQo+PiAgCQkJ
CXJldHVybiBmYWxzZTsKPj4gIAkJfQo+PiAgCX0KPiAKPiBUaGUgcGFyYW1ldGVyICJib29sIHpv
bmVkIiBpcyByZWR1bmRhbnQuIEl0IHNob3VsZCBiZSByZW1vdmVkIGZyb20gdGhlCj4gYWJvdmUg
MyBmdW5jdGlvbnMKPiAKPiBBZGRpdGlvbmFsbHksIGJlY2F1c2Ugd2Ugbm8gbG9uZ2VyIG5lZWQg
dG8gZGlzdGluZ3Vpc2ggdGhlIHpvbmVkIG1vZGVsCj4gaGVyZSwgRE1fVEFSR0VUX01JWEVEX1pP
TkVEX01PREVMIGlzIG1lYW5pbmdsZXNzLiBXZSBjYW4gYWxzbyBjbGVhbiB1cAo+IGl0cyByZWxh
dGVkIGNvZGUuCgpOb3BlLiBUaGUgbWl4ZWQgdGhpbmcgaXMgZm9yIG1peGluZyB1cCBub24tem9u
ZWQgd2l0aCB6b25lZCBtb2RlbHMuCkZvciB0aGUgZW50aXJlIERNIGNvZGUsIEhNIGFuZCBIQSBh
cmUgYm90aCB0cmVhdGVkIGFzIEhNLWxpa2Ugem9uZWQuCgotLSAKRGFtaWVuIExlIE1vYWwKV2Vz
dGVybiBEaWdpdGFsIFJlc2VhcmNoCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMt
ZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0
L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
