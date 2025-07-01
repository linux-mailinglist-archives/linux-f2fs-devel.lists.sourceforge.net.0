Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F62AEF179
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  1 Jul 2025 10:42:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dRK0XAibnjxK8ZopAbxxBLA1eDhSLsE9FOdn4ZXOQLY=; b=OZlSqZx1PP8PZ64kYAReYOBeEp
	Z7ZEGYUoCtmBhDedFV1Z+tNGQQyReSeAsRadNUCT4Rhnpn8kLB4VkkXS9UR4VCgs4h7o0NfmTQ3PV
	bXhWcX4D1TBCRLB8MsSxotCF9IbCxX1QOQEFNCy+qX1X5gbmwAqfTf8eBVjNleng3rME=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uWWZ2-00033G-30;
	Tue, 01 Jul 2025 08:42:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1uWWYI-0002kF-8O
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 01 Jul 2025 08:41:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XkvmebUNN0z0rnljY/tJt5bU6O2Klp1uRflk3OyyA0I=; b=AXvkKcGRRc80y0PpwmOmP4/yUO
 8XJAZP2/pLGMvof34MtDAz3aOIkrMlEdz2zaJ2jS4hCD9XgynYUDI7l1u2NyVick8NTs4y1SV5g1O
 lkhK1ddqjAbIpRzYsSvCM14o7ri2jkNgccryioD4l49Zj/uZ8GKEoIhNJqX25H01Fq0o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XkvmebUNN0z0rnljY/tJt5bU6O2Klp1uRflk3OyyA0I=; b=S5F1AmueekygErXClS4K4qfjEC
 4sIW2NHDpaqFDla/meNFK+MrZ9eb0BMLLRbna5vE12jPquhM42gcSMw68WX6o4MZtVvx3z0TqDxBX
 O0NubG41ymU69XldBzO+0CH2aOBiCO92qn27QCNSP0h1+z88KcmCT+lRsvDmFv/3P00M=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uWWYH-0004Oi-S4 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 01 Jul 2025 08:41:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 261EC61441;
 Tue,  1 Jul 2025 08:41:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D407C4CEEE;
 Tue,  1 Jul 2025 08:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751359266;
 bh=GE1FdSfW6he+GnVWYoQZBrWesQRe1qmmmvrnDmUzBNM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UqYMOQ3vrk2jwiOUfIt4fIC6B8GLLExBCIZt3+WLzN8NfStvVaHsyp4PyNHIdzBnY
 jcHxiYmxA7JiTIfW9yblevPtL473Nad0VFsjcedArsJ8/kpQy0M5T/Sq94tW8gR18N
 /QvRxsPQhq/VNxblvnLMopmtPN4c0pUkGhyKnFcciW3VCOLw3MGi3p9kmOeYhq2DJE
 8sYqCFR62tlA5NLCEKo016ifFxvoL6mN0ZDl3s2OHm6njCnXZZ29K7IRbp8hMFD48r
 Pogr99rfgSbX6JS1uB4vER8VLSme0vWUNUcX60uPexNE2vSbvOpx4ZpB3NGV5TRQXN
 kF1C5uNvAMW0w==
Date: Tue, 1 Jul 2025 10:41:01 +0200
To: Qu Wenruo <quwenruo.btrfs@gmx.com>
Message-ID: <20250701-beziffern-penetrant-ed93dbc57654@brauner>
References: <cover.1751347436.git.wqu@suse.com>
 <6164b8c708b6606c640c066fbc42f8ca9838c24b.1751347436.git.wqu@suse.com>
 <aGN8zsyYEArKr0DV@infradead.org>
 <baec02a0-e2fb-4801-b2ad-f602fc4d1cfc@gmx.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <baec02a0-e2fb-4801-b2ad-f602fc4d1cfc@gmx.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-2.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Tue, Jul 01, 2025 at 04:05:03PM +0930, Qu Wenruo wrote:
    > > > 在 2025/7/1 15:44, Christoph Hellwig 写道: > > On Tue, Jul 01, 2025
    at 03:02:34PM +0930, Qu Wenruo wrote: > > > To allow those multi [...] 
 
 Content analysis details:   (-0.3 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uWWYH-0004Oi-S4
Subject: Re: [f2fs-dev] [PATCH v2 1/6] fs: enhance and rename shutdown()
 callback to remove_bdev()
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
From: Christian Brauner via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Christian Brauner <brauner@kernel.org>
Cc: linux-xfs@vger.kernel.org, ntfs3@lists.linux.dev, jack@suse.cz,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 Qu Wenruo <wqu@suse.com>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org,
 viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVHVlLCBKdWwgMDEsIDIwMjUgYXQgMDQ6MDU6MDNQTSArMDkzMCwgUXUgV2VucnVvIHdyb3Rl
Ogo+IAo+IAo+IOWcqCAyMDI1LzcvMSAxNTo0NCwgQ2hyaXN0b3BoIEhlbGx3aWcg5YaZ6YGTOgo+
ID4gT24gVHVlLCBKdWwgMDEsIDIwMjUgYXQgMDM6MDI6MzRQTSArMDkzMCwgUXUgV2VucnVvIHdy
b3RlOgo+ID4gPiBUbyBhbGxvdyB0aG9zZSBtdWx0aS1kZXZpY2UgZmlsZXN5c3RlbXMgdG8gYmUg
aW50ZWdyYXRlZCB0byB1c2UKPiA+ID4gZnNfaG9sZGVyX29wczoKPiA+ID4gCj4gPiA+IC0gUmVu
YW1lIHNodXRkb3duKCkgY2FsbCBiYWNrIHRvIHJlbW92ZV9iZGV2KCkKPiA+ID4gICAgVG8gYmV0
dGVyIGRlc2NyaWJlIHdoZW4gdGhlIGNhbGwgYmFjayBpcyBjYWxsZWQuCj4gPiAKPiA+IFdoYXQg
aXMgcmVuYW1lZCBiYWNrIGhlcmU/Cj4gCj4gUmVuYW1lIHRoZSBvbGQgc2h1dGRvd24gdG8gcmVt
b3ZlX2JkZXYoKS4KPiAKPiA+IAo+ID4gPiAtc3RhdGljIHZvaWQgZXhmYXRfc2h1dGRvd24oc3Ry
dWN0IHN1cGVyX2Jsb2NrICpzYikKPiA+ID4gK3N0YXRpYyB2b2lkIGV4ZmF0X3NodXRkb3duKHN0
cnVjdCBzdXBlcl9ibG9jayAqc2IsIHN0cnVjdCBibG9ja19kZXZpY2UgKmJkZXYpCj4gPiA+ICAg
ewo+ID4gPiAgIAlleGZhdF9mb3JjZV9zaHV0ZG93bihzYiwgRVhGQVRfR09JTkdfRE9XTl9OT1NZ
TkMpOwo+ID4gPiAgIH0KPiA+ID4gQEAgLTIwMiw3ICsyMDIsNyBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IHN1cGVyX29wZXJhdGlvbnMgZXhmYXRfc29wcyA9IHsKPiA+ID4gICAJLnB1dF9zdXBlcgk9
IGV4ZmF0X3B1dF9zdXBlciwKPiA+ID4gICAJLnN0YXRmcwkJPSBleGZhdF9zdGF0ZnMsCj4gPiA+
ICAgCS5zaG93X29wdGlvbnMJPSBleGZhdF9zaG93X29wdGlvbnMsCj4gPiA+IC0JLnNodXRkb3du
CT0gZXhmYXRfc2h1dGRvd24sCj4gPiA+ICsJLnJlbW92ZV9iZGV2CT0gZXhmYXRfc2h1dGRvd24s
Cj4gPiAKPiA+IFBsZWFzZSBhbHNvIHJlbmFtZSB0aGUgZnVuY3Rpb24gc28gdGhhdCB0aGV5IG1h
dGNoIHRoZSBtZXRob2QgbmFtZS4KPiAKPiBJIHByZWZlciBub3QsIGFuZCBpdCBpcyBpbnRlbnRp
b25hbGx5IGxlZnQgYXMgaXMuCj4gCj4gVGhpcyBnaXZlIHVzIGEgdmVyeSBjbGVhciB2aWV3IHdo
YXQgYSBmcyBpcyBleHBlY3RlZCB0byBkby4KClF1LCB3b3VsZCB5b3UgcGxlYXNlIHJlbmFtZSB0
aGUgaW5kaXZpZHVhbCBmdW5jdGlvbnM/CgpUaGUgTkFLIGxhdGVyIGp1c3QgYmVjYXVzZSBvZiB0
aGlzIGlzIHVubmVjZXNzYXJ5LiBJIHdpbGwgc2F5IGNsZWFybHkKdGhhdCBJIHdpbGwgaWdub3Jl
IGdyYXR1aXRvdXMgTkFLcyB0aGF0IGFyZSBwcmVtaXNlZCBvbiBsYXJnZSBzY2FsZQpyZXdyaXRl
cyB0aGF0IGFyZSBvdXQgb2Ygc2NvcGUgZm9yIHRoZSBwcm9ibGVtLgoKSGVyZSB0aGUgcmVxdWVz
dGVkIHJld29yayBoYXMgYW4gYWNjZXB0YWJsZSBzY29wZSB0aG91Z2ggYW5kIHdlIGNhbgpzaWRl
c3RlcCB0aGUgd2hvbGUgcHJvYmxlbSBhbmQgc29sdmUgaXQgc28gZXZlcnlvbmUncyBoYXBweS4K
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1m
MmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdl
Lm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1m
MmZzLWRldmVsCg==
