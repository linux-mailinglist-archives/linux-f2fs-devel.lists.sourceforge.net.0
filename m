Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BADCFC907
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 07 Jan 2026 09:18:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ddeSU2llN8ph8XlFYeiXsHHn5cwiYO2Hov6Al4ph0Ik=; b=MGV3dM2bR4zo2XTF46t7+ekPkv
	AiZWnLkS77j3lvLH6m/lIm1NOJ6PPQ2d0E3H1bm9LU4Q2Ds0nm5yvbYRXblGl9doq74tw05iKhDJp
	dTCoeY5fESpliR9l9Qg3DNHLqnIbS3jYtXga7aRI0OMFeWIwaJLz/g74hJ7d2MGqJVPM=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vdOkI-00042d-FF;
	Wed, 07 Jan 2026 08:18:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+b20c6d4e813e90af7b7b+8172+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vdOk7-0003zH-Of for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jan 2026 08:18:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5zuInJ7HAsYwAb0wNDVepC+ziu1s/ezU57ZH+9ZEPCY=; b=FPflR3spkhSWG1xdq2RX3LdJrZ
 dcEjENgreLg2sHe3GqwBqvhAo5NUzvAPtinb9Kq0bVnsIaVmeks/ANlP0rh22/2u6Oj+5xD3Ln1Xr
 RJSl7K9N339Cl7kFn2FT6mLEU0mwjik9UzVJm/06/e6w5GJwpJPJZL2IA37f3ayhl1Y4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5zuInJ7HAsYwAb0wNDVepC+ziu1s/ezU57ZH+9ZEPCY=; b=CGqsSdK2wt3gBxF4OL5tSqeNz2
 ZsUPPMZvnW3bLpqu/PjiS/NwcpD0MahyYbToH2ErRgVwrLlsnpHbJTWl0Mo6QsQU7j1rHTLJUy5Cy
 6MUXHpRaPG9+rI9Z+h14o/nJtPsEpJLkA6a/MpdXmWBPGpt2d21R3cFcosU9Dlcu2Vg8=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vdOk7-0000Oi-8s for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jan 2026 08:18:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=5zuInJ7HAsYwAb0wNDVepC+ziu1s/ezU57ZH+9ZEPCY=; b=TomsHyvYOFZLaH7VoXe5oFPz40
 YU5osO6dCmvK4wW0UPoZxYeQPe1n/cJk6MwtW84yjwkDIC7quo7O7jZLukbioAuTIJ2kCAB6bBmR4
 EWGd0LePalJjJD81ku+lcPYkKxugrOVShXfu5R17cr1PJ0VqhMhMC4X0VVfjy3069Go1o1mhhnNcy
 XpbJuN3Wz9tu6NpOs3Cbx1Wz97BbzTvb4CS0UChH39wlU0nosRQ4OC3e403WPypkjACS6jGva7ka6
 FTyIbwUVIPtsiOik5BZ9FLUqvC/+DF8/GMXV72+3W3CTsstEJDyFhzPGLn9QgD5NzAjPMeci5k5Fw
 wZn7IP/g==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1vdOjw-0000000ENqi-3Em2;
 Wed, 07 Jan 2026 08:18:00 +0000
Date: Wed, 7 Jan 2026 00:18:00 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Joanne Chang <joannechien@google.com>
Message-ID: <aV4WuCaMl7I2TQAd@infradead.org>
References: <20251229023145.1806877-1-joannechien@google.com>
 <aV34aGUeU0pQkwj2@infradead.org>
 <CACQK4XCF-Hex_H31evMu8Zpv_OLtV0QBU0MpajOSHcfaREMAKw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACQK4XCF-Hex_H31evMu8Zpv_OLtV0QBU0MpajOSHcfaREMAKw@mail.gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jan 07, 2026 at 04:12:44PM +0800, Joanne Chang wrote:
 > On Wed, Jan 7, 2026 at 2:08 PM Christoph Hellwig <hch@infradead.org> wrote:
 > > I still don't understand why we can't do this programmat [...] 
 Content analysis details:   (-0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1vdOk7-0000Oi-8s
Subject: Re: [f2fs-dev] [PATCH v2] common/rc: add _require_blocks_in_file
 helper
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
Cc: Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gV2VkLCBKYW4gMDcsIDIwMjYgYXQgMDQ6MTI6NDRQTSArMDgwMCwgSm9hbm5lIENoYW5nIHdy
b3RlOgo+IE9uIFdlZCwgSmFuIDcsIDIwMjYgYXQgMjowOOKAr1BNIENocmlzdG9waCBIZWxsd2ln
IDxoY2hAaW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4gPiBJIHN0aWxsIGRvbid0IHVuZGVyc3RhbmQg
d2h5IHdlIGNhbid0IGRvIHRoaXMgcHJvZ3JhbW1hdGljYWxseS4gIEkgZ3Vlc3MKPiA+IGl0IHdv
dWxkIGJlIHNpbXBseSB0b28gc2xvdz8gIEluIHRoYXQgY2FzZSB0aGF0IHNob3VsZCBwcm9iYWJs
eSBiZQo+ID4gZG9jdW1lbnRlZCBoZXJlIGluIHRoZSBjb21taXQgbG9nLiAgT3RoZXJ3aXNlIHRo
aXMgbG9va3MgZ29vZCB0byBtZS4KPiAKPiBJIHVzZWQgYSBjb25zdGFudCB0byBhdm9pZCBtYXNr
aW5nIGJ1Z3MgdGhhdCBjYXVzZSB0aGUgbWF4aW11bSBmaWxlIHNpemUKPiB0byBzaHJpbmsgb24g
ZmlsZXN5c3RlbXMgdGhhdCBzaG91bGQgc3VwcG9ydCB0aGlzIHRlc3QuIEkgY2FuIGFkZCB0aGUK
PiByZWFzb24gdG8gdGhlIGNvbW1pdCBtZXNzYWdlIGlmIHRoYXQgd291bGQgbWFrZSBpdCBjbGVh
cmVyLgoKVGhhdCB3b3VsZCBiZSBncmVhdCwgdGhhbmtzIQoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlz
dApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNv
dXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
