Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA6316274D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Feb 2020 14:42:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j439D-0000aN-E7; Tue, 18 Feb 2020 13:42:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1j439B-0000aF-Um
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Feb 2020 13:42:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sRRfkuIro3UJgk7ronBRbu9Qpl4FSkPX98/JT02cIzQ=; b=cUyRZez6yb5ypp3CsIbQhYbuaV
 9Kq/UCFTSblV1vObcfnJYC5HTHtbEknvFLao4ziL8IpyS/Om5p7C7phqXwgpsDy/S0bp03Rb2PsfC
 uBGYzJYTsHLJN/vzMLNd6GZbJbWZpApuXJvouD8ESL3q25eA0DxFVJIV0XLF+b9BfYXs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sRRfkuIro3UJgk7ronBRbu9Qpl4FSkPX98/JT02cIzQ=; b=DYE4vJCjDoZlZ/ceJn3/53Ndcs
 2+vfLaMxM07kA2Pgk5CcgtLrjr4YPvUCPI1YD/Y5Z6MZTLxqJFKlXLd2tejunkFE0e9W00p3EFCT1
 rITJF0OH7UqHpdv7ptDXUw0EEOYIWTbY24OTWKVYTBu+8/zIDLD9goKAtzpOicHzrTV4=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j439A-0071GI-1h
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Feb 2020 13:42:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=sRRfkuIro3UJgk7ronBRbu9Qpl4FSkPX98/JT02cIzQ=; b=WiqMBzR3mGIQcEq161KXuYNNqn
 oGEGsCAD1sh6ZxDHFnwWKQ2UwAbxLDKaVUSstZlvvZi3x4yIlHuLp2u6l7YrszKdgcpLhi972Q0/M
 v2lPX/oCVktUYRubwI/oT4ULqsPrfYeqx1ppvykbJky0SIGyrQDEEKC6qeiOAZIZLEEa8fGbwzymS
 SKIhK0eTvDnycS/K6GjH9DoFUk9lT4+Bh4Q7le4HVT8wkpD+696fuAoTeI+nAElAF/93gchu8m6kq
 3yyLRS2ZUp2AAlJpuu2kf3UYi/qoxOxEhYzdrtFmaDyvoJBUAzp1grGpHZPuH40DCWRoboP4begWK
 g4B3syeQ==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j438w-0002EE-C5; Tue, 18 Feb 2020 13:42:30 +0000
Date: Tue, 18 Feb 2020 05:42:30 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20200218134230.GN7778@bombadil.infradead.org>
References: <20200217184613.19668-1-willy@infradead.org>
 <20200218045633.GH10776@dread.disaster.area>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200218045633.GH10776@dread.disaster.area>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1j439A-0071GI-1h
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

T24gVHVlLCBGZWIgMTgsIDIwMjAgYXQgMDM6NTY6MzNQTSArMTEwMCwgRGF2ZSBDaGlubmVyIHdy
b3RlOgo+IExhdGVzdCB2ZXJzaW9uIGluIHlvdXIgZ2l0IHRyZWU6Cj4gCj4gJCDilrYgZ2xvIC1u
IDUgd2lsbHkvcmVhZGFoZWFkCj4gNGJlNDk3MDk2YzA0IG1tOiBVc2UgbWVtYWxsb2Nfbm9mc19z
YXZlIGluIHJlYWRhaGVhZCBwYXRoCj4gZmY2MzQ5N2ZjYjk4IGlvbWFwOiBDb252ZXJ0IGZyb20g
cmVhZHBhZ2VzIHRvIHJlYWRhaGVhZAo+IDI2YWVlNjBlODliNSBpb21hcDogUmVzdHJ1Y3R1cmUg
aW9tYXBfcmVhZHBhZ2VzX2FjdG9yCj4gODExNWJjY2E3MzEyIGZ1c2U6IENvbnZlcnQgZnJvbSBy
ZWFkcGFnZXMgdG8gcmVhZGFoZWFkCj4gM2RiM2QxMGQ5ZWExIGYyZnM6IENvbnZlcnQgZnJvbSBy
ZWFkcGFnZXMgdG8gcmVhZGFoZWFkCj4gJAo+IAo+IG1lcmdlZCBpbnRvIGEgNS42LXJjMiB0cmVl
IGZhaWxzIGF0IGJvb3Qgb24gbXkgdGVzdCB2bToKPiAKPiBbICAgIDIuNDIzMTE2XSAtLS0tLS0t
LS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0KPiBbICAgIDIuNDI0OTU3XSBsaXN0X2FkZCBk
b3VibGUgYWRkOiBuZXc9ZmZmZmVhMDAwZWZmZjRjOCwgcHJldj1mZmZmODg4M2JmZmZlZTYwLCBu
ZXh0PWZmZmZlYTAwMGVmZmY0YzguCj4gWyAgICAyLjQyODI1OV0gV0FSTklORzogQ1BVOiA0IFBJ
RDogMSBhdCBsaWIvbGlzdF9kZWJ1Zy5jOjI5IF9fbGlzdF9hZGRfdmFsaWQrMHg2Ny8weDcwCj4g
WyAgICAyLjQ1NzQ4NF0gQ2FsbCBUcmFjZToKPiBbICAgIDIuNDU4MTcxXSAgX19wYWdldmVjX2xy
dV9hZGRfZm4rMHgxNWYvMHgyYzAKPiBbICAgIDIuNDU5Mzc2XSAgcGFnZXZlY19scnVfbW92ZV9m
bisweDg3LzB4ZDAKPiBbICAgIDIuNDYwNTAwXSAgPyBwYWdldmVjX21vdmVfdGFpbF9mbisweDJk
MC8weDJkMAo+IFsgICAgMi40NjE3MTJdICBscnVfYWRkX2RyYWluX2NwdSsweDhkLzB4MTYwCj4g
WyAgICAyLjQ2Mjc4N10gIGxydV9hZGRfZHJhaW4rMHgxOC8weDIwCgpBcmUgeW91IHN1cmUgdGhh
dCB3YXMgNGJlNDk3MDk2YzA0ID8gIEkgYXNrIGJlY2F1c2UgdGhlcmUgd2FzIGEKdmVyc2lvbiBw
dXNoZWQgdG8gdGhhdCBnaXQgdHJlZSB0aGF0IGRpZCBjb250YWluIGEgbGlzdCBkb3VibGUtYWRk
CihkdWUgdG8gYSBtaXNtZXJnZSB3aGVuIHNodWZmbGluZyBwYXRjaGVzKS4gIEkgbm90aWNlZCBp
dCBhbmQgZml4ZWQKaXQsIGFuZCA0YmU0OTcwOTZjMDQgZG9lc24ndCBoYXZlIHRoYXQgcHJvYmxl
bS4gIEkgYWxzbyB0ZXN0IHdpdGgKQ09ORklHX0RFQlVHX0xJU1QgdHVybmVkIG9uLCBidXQgdGhp
cyBwcm9ibGVtIHlvdSBoaXQgaXMgZ29pbmcgdG8gYmUKcHJvYmFiaWxpc3RpYyBiZWNhdXNlIGl0
J2xsIGRlcGVuZCBvbiB0aGUgdGltaW5nIGJldHdlZW4gd2hhdGV2ZXIgb3RoZXIKbGlzdCBpcyBi
ZWluZyB1c2VkIGFuZCB0aGUgcGFnZSBhY3R1YWxseSBiZWluZyBhZGRlZCB0byB0aGUgTFJVLgoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1m
MmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdl
Lm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1m
MmZzLWRldmVsCg==
