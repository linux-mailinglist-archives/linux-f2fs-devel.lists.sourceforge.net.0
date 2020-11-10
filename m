Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E061E2ADA6A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Nov 2020 16:27:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kcVYf-0007mE-EI; Tue, 10 Nov 2020 15:27:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dsterba@suse.cz>)
 id 1kcVYf-0007m5-31; Tue, 10 Nov 2020 15:27:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nLFmoa0aloAZvgnWh5K26JQfxjzsuVMDGq8sXagZeog=; b=OsiOOv1SYwP7PBZgxLrBWcsIEc
 lpWnq1tgpxnIPwBbOPyVQJQGpvypg4WfVpDFqE/ZP4LlYJ+J8hE03ZV9ZELCuLCK35lk4E0vUcGDG
 PY4x8x6gO/SKnDZ9h6ueLViagLbwu+P3wmrsIN1PoLJBxrLItj9RCNfVv8/SD4A6EEqA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nLFmoa0aloAZvgnWh5K26JQfxjzsuVMDGq8sXagZeog=; b=VQMevQqEABp0XNJ/STV808Neho
 z4HYO4l/98cein6h0a+7nI2x83CRkH5r563HpZwc7f9j4pLIV640+fFJ4KF72kX/tEFyW0CHATkXj
 NJt7ektJSQekrZfyU2QJqfa1Nf0XoLRlpVAXYK5ig+oTgmhcAlot6dZL031N4G8Qc6fQ=;
Received: from mx2.suse.de ([195.135.220.15])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kcVYZ-00Fcn3-LM; Tue, 10 Nov 2020 15:27:45 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DBFC2ABD1;
 Tue, 10 Nov 2020 15:27:22 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
 id 7255CDA7D7; Tue, 10 Nov 2020 16:25:41 +0100 (CET)
Date: Tue, 10 Nov 2020 16:25:41 +0100
From: David Sterba <dsterba@suse.cz>
To: Chris Mason <clm@fb.com>
Message-ID: <20201110152541.GK6756@twin.jikos.cz>
Mail-Followup-To: dsterba@suse.cz, Chris Mason <clm@fb.com>,
 Christoph Hellwig <hch@infradead.org>,
 Nick Terrell <nickrterrell@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 linux-crypto@vger.kernel.org, linux-btrfs@vger.kernel.org,
 squashfs-devel@lists.sourceforge.net,
 linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, Kernel Team <Kernel-team@fb.com>,
 Nick Terrell <terrelln@fb.com>, Petr Malat <oss@malat.biz>,
 Johannes Weiner <jweiner@fb.com>, Niket Agarwal <niketa@fb.com>,
 Yann Collet <cyan@fb.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20201103060535.8460-1-nickrterrell@gmail.com>
 <20201103060535.8460-2-nickrterrell@gmail.com>
 <20201106183846.GA28005@infradead.org>
 <D9338FE4-1518-4C7B-8C23-DBDC542DAC35@fb.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <D9338FE4-1518-4C7B-8C23-DBDC542DAC35@fb.com>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.135.220.15 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kcVYZ-00Fcn3-LM
Subject: Re: [f2fs-dev] [PATCH v5 1/9] lib: zstd: Add zstd compatibility
 wrapper
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
Reply-To: dsterba@suse.cz
Cc: squashfs-devel@lists.sourceforge.net,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Nick Terrell <nickrterrell@gmail.com>, Yann Collet <cyan@fb.com>,
 Petr Malat <oss@malat.biz>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 Nick Terrell <terrelln@fb.com>, linux-crypto@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kernel Team <Kernel-team@fb.com>, Niket Agarwal <niketa@fb.com>,
 linux-btrfs@vger.kernel.org, Johannes Weiner <jweiner@fb.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gTW9uLCBOb3YgMDksIDIwMjAgYXQgMDI6MDE6NDFQTSAtMDUwMCwgQ2hyaXMgTWFzb24gd3Jv
dGU6Cj4gT24gNiBOb3YgMjAyMCwgYXQgMTM6MzgsIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+
ID4gWW91IGp1c3Qga2VlcCByZXNlZG5pbmcgdGhpcyBjcmFwLCBkb24ndCB5b3U/ICBIYXZlbid0
IHlvdSBiZWVuIHRvbGQKPiA+IG11bHRpcGxlIHRpbWVzIHRvIHByb3ZpZGUgYSBwcm9wZXIga2Vy
bmVsIEFQSSBieSBub3c/Cj4gCj4gWW91IGRvIGNvbnNpc3RlbnRseSBhc2sgZm9yIGEgc2hpbSBs
YXllciwgYnV0IHlvdSBoYXZlbuKAmXQgZXhwbGFpbmVkIAo+IHdoYXQgd2UgZ2FpbiBieSBkaXZl
cmdpbmcgZnJvbSB0aGUgZG9jdW1lbnRlZCBhbmQgdGVzdGVkIEFQSSBvZiB0aGUgCj4gdXBzdHJl
YW0genN0ZCBwcm9qZWN0LiAgSXTigJlzIGFuIGltcG9ydGFudCBkaXNjdXNzaW9uIGdpdmVuIHRo
YXQgd2UgCj4gaG9wZSB0byByZWd1bGFybHkgdXBkYXRlIHRoZSBrZXJuZWwgc2lkZSBhcyB0aGV5
IG1ha2UgaW1wcm92ZW1lbnRzIGluIAo+IHpzdGQuCj4gCj4gVGhlIG9ubHkgYmVuZWZpdCBkZXNj
cmliZWQgc28gZmFyIHNlZW1zIHRvIGJlIGNhbWVsY2FzZSByZWxhdGVkLCBidXQgaWYgCj4gdGhl
cmUgYXJlIHByb2JsZW1zIGluIHRoZSBBUEkgYmV5b25kIHRoYXQsIEkgaGF2ZW7igJl0IHNlZW4g
eW91IGRlc2NyaWJlIAo+IHRoZW0uICBJIGRvbuKAmXQgdGhpbmsgdGhlIGNhbWVsY2FzZSBhbG9u
ZSBqdXN0aWZpZXMgdGhlIGFkZGVkIGNvc3RzIG9mIAo+IHRoZSBzaGltLgoKVGhlIEFQSSBjaGFu
Z2UgaW4gdGhpcyBwYXRjaHNldCBpcyBhZGRpbmcgY2h1cm4gdGhhdCB3b3VsZG4ndCBiZQpuZWNl
c3NhcnkgaWYgdGhlcmUgd2VyZSBhbiB1cHN0cmVhbTwtPmtlcm5lbCBBUEkgZnJvbSB0aGUgYmVn
aW5uaW5nLgoKVGhlIHBhdGNoIDUvOSBpcyBhbG1vc3QgZW50aXJlbHkgcmVuYW1pbmcganVzdCBz
b21lIGludGVybmFsIGlkZW50aWZpZXJzCgotCQkJICAgICAgWlNURF9DU3RyZWFtV29ya3NwYWNl
Qm91bmQocGFyYW1zLmNQYXJhbXMpLAotCQkJICAgICAgWlNURF9EU3RyZWFtV29ya3NwYWNlQm91
bmQoWlNURF9CVFJGU19NQVhfSU5QVVQpKTsKKwkJCSAgICAgIFpTVERfZXN0aW1hdGVDU3RyZWFt
U2l6ZV91c2luZ0NQYXJhbXMocGFyYW1zLmNQYXJhbXMpLAorCQkJICAgICAgWlNURF9lc3RpbWF0
ZURTdHJlYW1TaXplKFpTVERfQlRSRlNfTUFYX0lOUFVUKSk7CgpwbHVzIHVwZGF0aW5nIHRoZSBu
YW1lcyBpbiB0aGUgZXJyb3Igc3RyaW5ncy4gVGhlIGNvbXByZXNzaW9uIEFQSSB0aGF0CmZpbGVz
eXN0ZW1zIG5lZWQgaXMgc2ltcGxlOgoKLSBzZXQgdXAgd29ya3NwYWNlIGFuZCBwYXJhbWV0ZXJz
Ci0gY29tcHJlc3MgYnVmZmVyCi0gZGVjb21wcmVzcyBidWZmZXIKCldlIHJlYWxseSBzaG91bGQg
bm90IGNhcmUgaWYgdXBzdHJlYW0gaGFzIDMgZnVuY3Rpb25zIGZvciBpbml0aWFsaXppbmcKc3Ry
ZWFtIChaU1REX2luaXRDU3RyZWFtL1pTVERfaW5pdFN0YXRpY0NTdHJlYW0vWlNURF9pbml0Q1N0
cmVhbV9hZHZhbmNlZCksCm9yIGlmIHRoZSBuYW1lIGNoYW5nZXMgYWdhaW4gaW4gdGhlIGZ1dHVy
ZS4KClRoaXMgc2hvdWxkIG5vdCByZXF1aXJlIGV4cGxpY2l0IGV4cGxhbmF0aW9uLCB0aGlzIHNo
b3VsZCBiZSBhIG5hdHVyYWwKcmVxdWlyZW1lbnQgZXNwZWNpYWxseSBmb3Igc2VwYXJhdGUgcHJv
amVjdHMgdGhhdCBkb24ndCBzaGFyZSB0aGUgc2FtZQpjb2Rpbmcgc3R5bGUgYnV0IGhhdmUgdG8g
YmUgaW50ZWdyYXRlZCBpbiBzb21lIHdheS4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1m
MmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdl
Lm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
