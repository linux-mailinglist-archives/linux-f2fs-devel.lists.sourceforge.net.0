Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DC8163BA1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Feb 2020 04:48:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4GLq-0006qG-Jq; Wed, 19 Feb 2020 03:48:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1j4GLp-0006q9-Dw
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 03:48:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P0Aqnmh/ude15oZ9+jBKMekOeIkaNHoxHvgKFKL94mA=; b=OL8wdmVRswUAgLIV5V9K9B/s3b
 cCQ4aT3TY2QTdp5H5yJb18RwQTEwYjv7fOiGF/iz3NOwS0oYGmN0QW1ZB4/ZVBnSXFj0wzzVuiiYr
 SGiZrYin5eS8y06MqezOx8tQmE4W7x0v2TzBEk0TC0f/kiKCFYpsbNqMZ3Rb2iVrZE5o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=P0Aqnmh/ude15oZ9+jBKMekOeIkaNHoxHvgKFKL94mA=; b=DtUsT3Q5rBuGbsX/KJTA4eWl+n
 rK91jXPl9yK8PDZtyCJxJkV/A/jVgg9TsjK2MDJL4x1YJN4BJyLQyE5DvntbcnlU1HbXoKEaMq9Hl
 Fk5nb0EwVn5FBRTRV6f2Yskzm6TBkbpwdxIpMMl208qWiRsMqyx7ToOx3YtF/64bZRNM=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j4GLo-007tAO-4C
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 03:48:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=P0Aqnmh/ude15oZ9+jBKMekOeIkaNHoxHvgKFKL94mA=; b=FSoLGQMrnCic9sH2LnjBTVvXkY
 cR8rxIORXfKa4enzs9Cs2GXR0z+rIuK88JgQsM8DtS928q38iVLZIXEqIQc8q+6qXpA+vPjP2afdW
 JtadyP4iMVqVGAS5bem1ldbKGp0NNtsOSoR55HFUXZe2bqClYtvXkf0CTJALcTtf1fLUKAyYAxfFK
 uIGYTiCemjUsA7zZ2KRiYHV+n6nadA3f8CiLvC9UwXrmwnutB8y991dzJSvNTqvLXt/c12hRzyk+z
 l09uLVtA1n5dG8voulxeaN4r82ntGQnLY0NInwJabn4DZp6u6QQSpP+7/aa9cy5PT2a7MgjX4wADX
 Z5fiC2XA==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j4GLg-00024B-95; Wed, 19 Feb 2020 03:48:32 +0000
Date: Tue, 18 Feb 2020 19:48:32 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20200219034832.GL24185@bombadil.infradead.org>
References: <20200217184613.19668-1-willy@infradead.org>
 <20200218045633.GH10776@dread.disaster.area>
 <20200218134230.GN7778@bombadil.infradead.org>
 <20200218212652.GR10776@dread.disaster.area>
 <20200219034525.GH10776@dread.disaster.area>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200219034525.GH10776@dread.disaster.area>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j4GLo-007tAO-4C
Subject: Re: [f2fs-dev] [PATCH v6 00/19] Change readahead API
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
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gV2VkLCBGZWIgMTksIDIwMjAgYXQgMDI6NDU6MjVQTSArMTEwMCwgRGF2ZSBDaGlubmVyIHdy
b3RlOgo+IE9uIFdlZCwgRmViIDE5LCAyMDIwIGF0IDA4OjI2OjUyQU0gKzExMDAsIERhdmUgQ2hp
bm5lciB3cm90ZToKPiA+IE9uIFR1ZSwgRmViIDE4LCAyMDIwIGF0IDA1OjQyOjMwQU0gLTA4MDAs
IE1hdHRoZXcgV2lsY294IHdyb3RlOgo+ID4gPiBPbiBUdWUsIEZlYiAxOCwgMjAyMCBhdCAwMzo1
NjozM1BNICsxMTAwLCBEYXZlIENoaW5uZXIgd3JvdGU6Cj4gPiA+ID4gTGF0ZXN0IHZlcnNpb24g
aW4geW91ciBnaXQgdHJlZToKPiA+ID4gPiAKPiA+ID4gPiAkIOKWtiBnbG8gLW4gNSB3aWxseS9y
ZWFkYWhlYWQKPiA+ID4gPiA0YmU0OTcwOTZjMDQgbW06IFVzZSBtZW1hbGxvY19ub2ZzX3NhdmUg
aW4gcmVhZGFoZWFkIHBhdGgKPiA+ID4gPiBmZjYzNDk3ZmNiOTggaW9tYXA6IENvbnZlcnQgZnJv
bSByZWFkcGFnZXMgdG8gcmVhZGFoZWFkCj4gPiA+ID4gMjZhZWU2MGU4OWI1IGlvbWFwOiBSZXN0
cnVjdHVyZSBpb21hcF9yZWFkcGFnZXNfYWN0b3IKPiA+ID4gPiA4MTE1YmNjYTczMTIgZnVzZTog
Q29udmVydCBmcm9tIHJlYWRwYWdlcyB0byByZWFkYWhlYWQKPiA+ID4gPiAzZGIzZDEwZDllYTEg
ZjJmczogQ29udmVydCBmcm9tIHJlYWRwYWdlcyB0byByZWFkYWhlYWQKPiA+ID4gPiAkCj4gPiA+
ID4gCj4gPiA+ID4gbWVyZ2VkIGludG8gYSA1LjYtcmMyIHRyZWUgZmFpbHMgYXQgYm9vdCBvbiBt
eSB0ZXN0IHZtOgo+ID4gPiA+IAo+ID4gPiA+IFsgICAgMi40MjMxMTZdIC0tLS0tLS0tLS0tLVsg
Y3V0IGhlcmUgXS0tLS0tLS0tLS0tLQo+ID4gPiA+IFsgICAgMi40MjQ5NTddIGxpc3RfYWRkIGRv
dWJsZSBhZGQ6IG5ldz1mZmZmZWEwMDBlZmZmNGM4LCBwcmV2PWZmZmY4ODgzYmZmZmVlNjAsIG5l
eHQ9ZmZmZmVhMDAwZWZmZjRjOC4KPiA+ID4gPiBbICAgIDIuNDI4MjU5XSBXQVJOSU5HOiBDUFU6
IDQgUElEOiAxIGF0IGxpYi9saXN0X2RlYnVnLmM6MjkgX19saXN0X2FkZF92YWxpZCsweDY3LzB4
NzAKPiA+ID4gPiBbICAgIDIuNDU3NDg0XSBDYWxsIFRyYWNlOgo+ID4gPiA+IFsgICAgMi40NTgx
NzFdICBfX3BhZ2V2ZWNfbHJ1X2FkZF9mbisweDE1Zi8weDJjMAo+ID4gPiA+IFsgICAgMi40NTkz
NzZdICBwYWdldmVjX2xydV9tb3ZlX2ZuKzB4ODcvMHhkMAo+ID4gPiA+IFsgICAgMi40NjA1MDBd
ICA/IHBhZ2V2ZWNfbW92ZV90YWlsX2ZuKzB4MmQwLzB4MmQwCj4gPiA+ID4gWyAgICAyLjQ2MTcx
Ml0gIGxydV9hZGRfZHJhaW5fY3B1KzB4OGQvMHgxNjAKPiA+ID4gPiBbICAgIDIuNDYyNzg3XSAg
bHJ1X2FkZF9kcmFpbisweDE4LzB4MjAKPiA+ID4gCj4gPiA+IEFyZSB5b3Ugc3VyZSB0aGF0IHdh
cyA0YmU0OTcwOTZjMDQgPyAgSSBhc2sgYmVjYXVzZSB0aGVyZSB3YXMgYQo+ID4gCj4gPiBZZXMs
IGJlY2F1c2UgaXQncyB0aGUgb25seSB2ZXJzaW9uIEkndmUgYWN0dWFsbHkgbWVyZ2VkIGludG8g
bXkKPiA+IHdvcmtpbmcgdHJlZSwgY29tcGlsZWQgYW5kIHRyaWVkIHRvIHJ1bi4gOlAKPiA+IAo+
ID4gPiB2ZXJzaW9uIHB1c2hlZCB0byB0aGF0IGdpdCB0cmVlIHRoYXQgZGlkIGNvbnRhaW4gYSBs
aXN0IGRvdWJsZS1hZGQKPiA+ID4gKGR1ZSB0byBhIG1pc21lcmdlIHdoZW4gc2h1ZmZsaW5nIHBh
dGNoZXMpLiAgSSBub3RpY2VkIGl0IGFuZCBmaXhlZAo+ID4gPiBpdCwgYW5kIDRiZTQ5NzA5NmMw
NCBkb2Vzbid0IGhhdmUgdGhhdCBwcm9ibGVtLiAgSSBhbHNvIHRlc3Qgd2l0aAo+ID4gPiBDT05G
SUdfREVCVUdfTElTVCB0dXJuZWQgb24sIGJ1dCB0aGlzIHByb2JsZW0geW91IGhpdCBpcyBnb2lu
ZyB0byBiZQo+ID4gPiBwcm9iYWJpbGlzdGljIGJlY2F1c2UgaXQnbGwgZGVwZW5kIG9uIHRoZSB0
aW1pbmcgYmV0d2VlbiB3aGF0ZXZlciBvdGhlcgo+ID4gPiBsaXN0IGlzIGJlaW5nIHVzZWQgYW5k
IHRoZSBwYWdlIGFjdHVhbGx5IGJlaW5nIGFkZGVkIHRvIHRoZSBMUlUuCj4gPiAKPiA+IEknbGwg
c2VlIGlmIEkgY2FuIHJlcHJvZHVjZSBpdC4KPiAKPiBKdXN0IHVwZGF0ZWQgdG8gYSBjdXJyZW50
IFRPVCBMaW51cyBrZXJuZWwgYW5kIHlvdXIgbGF0ZXN0IGJyYW5jaCwKPiBhbmQgc28gZmFyIHRo
aXMgaXMgMTAwJSByZXByb2R1Y2FibGUuCj4gCj4gTm90IHN1cmUgaG93IEknbSBnb2luZyB0byBk
ZWJ1ZyBpdCB5ZXQsIGJlY2F1c2UgaXQncyBpbml0IHRoYXQgaXMKPiB0cmlnZ2VyaW5nIGl0Li4u
LgoKRXJpYyBmb3VuZCBpdCAuLi4gc3RpbGwgbm90IHN1cmUgd2h5IEkgZG9uJ3Qgc2VlIGl0LgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYy
ZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2Uu
bmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYy
ZnMtZGV2ZWwK
