Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8CC1634E4
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Feb 2020 22:27:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4AOb-00073N-1h; Tue, 18 Feb 2020 21:27:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <david@fromorbit.com>) id 1j4AOZ-00073D-6C
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Feb 2020 21:27:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Iu53jqs89fowoiedueVwZEvsfpQdTKl39hLZDNjuIDs=; b=DMc/sAL20SqEnvNeohc7qS0NmO
 2AMptxlaIaN2DORewXodqz3M2D60sWKLj75t9dzErpYW4xPc/15thrkTp26Z/PLefref7rjG8l70M
 i0A1NAJChMXea2M4g3dvUaQgTVikyFG2Xa5/QD/WIh9RxGW9pnOw6JMeAyuUWqa6GcwQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Iu53jqs89fowoiedueVwZEvsfpQdTKl39hLZDNjuIDs=; b=hak00XjU2LDU1qP4n+efihrXsM
 F+9UqrrgMeqVlI01VX9Ik98Gs4Ge8BKG0RU8iTJlizuZsn3nL5yy9iF5Bn4AcPNhbuqcPktAIJ8tJ
 kaetuk1gEENOR+Nw/qUr62IbXyVFJLgWPUN2Hhuo1BgCPVLj0fXRQTdShP+x0IY+lFdY=;
Received: from mail104.syd.optusnet.com.au ([211.29.132.246])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1j4AOX-00GwxU-El
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Feb 2020 21:27:06 +0000
Received: from dread.disaster.area (pa49-179-138-28.pa.nsw.optusnet.com.au
 [49.179.138.28])
 by mail104.syd.optusnet.com.au (Postfix) with ESMTPS id 0B3B97EA1A6;
 Wed, 19 Feb 2020 08:26:54 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1j4AOK-0003K5-Rm; Wed, 19 Feb 2020 08:26:52 +1100
Date: Wed, 19 Feb 2020 08:26:52 +1100
From: Dave Chinner <david@fromorbit.com>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200218212652.GR10776@dread.disaster.area>
References: <20200217184613.19668-1-willy@infradead.org>
 <20200218045633.GH10776@dread.disaster.area>
 <20200218134230.GN7778@bombadil.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200218134230.GN7778@bombadil.infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=X6os11be c=1 sm=1 tr=0
 a=zAxSp4fFY/GQY8/esVNjqw==:117 a=zAxSp4fFY/GQY8/esVNjqw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=l697ptgUJYAA:10
 a=7-415B0cAAAA:8 a=13k90lvrXjaGpILklQQA:9 a=QEXdDO2ut3YA:10
 a=biEYGPWJfzWAr4FL6Ov7:22
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: fromorbit.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j4AOX-00GwxU-El
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

T24gVHVlLCBGZWIgMTgsIDIwMjAgYXQgMDU6NDI6MzBBTSAtMDgwMCwgTWF0dGhldyBXaWxjb3gg
d3JvdGU6Cj4gT24gVHVlLCBGZWIgMTgsIDIwMjAgYXQgMDM6NTY6MzNQTSArMTEwMCwgRGF2ZSBD
aGlubmVyIHdyb3RlOgo+ID4gTGF0ZXN0IHZlcnNpb24gaW4geW91ciBnaXQgdHJlZToKPiA+IAo+
ID4gJCDilrYgZ2xvIC1uIDUgd2lsbHkvcmVhZGFoZWFkCj4gPiA0YmU0OTcwOTZjMDQgbW06IFVz
ZSBtZW1hbGxvY19ub2ZzX3NhdmUgaW4gcmVhZGFoZWFkIHBhdGgKPiA+IGZmNjM0OTdmY2I5OCBp
b21hcDogQ29udmVydCBmcm9tIHJlYWRwYWdlcyB0byByZWFkYWhlYWQKPiA+IDI2YWVlNjBlODli
NSBpb21hcDogUmVzdHJ1Y3R1cmUgaW9tYXBfcmVhZHBhZ2VzX2FjdG9yCj4gPiA4MTE1YmNjYTcz
MTIgZnVzZTogQ29udmVydCBmcm9tIHJlYWRwYWdlcyB0byByZWFkYWhlYWQKPiA+IDNkYjNkMTBk
OWVhMSBmMmZzOiBDb252ZXJ0IGZyb20gcmVhZHBhZ2VzIHRvIHJlYWRhaGVhZAo+ID4gJAo+ID4g
Cj4gPiBtZXJnZWQgaW50byBhIDUuNi1yYzIgdHJlZSBmYWlscyBhdCBib290IG9uIG15IHRlc3Qg
dm06Cj4gPiAKPiA+IFsgICAgMi40MjMxMTZdIC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0t
LS0tLS0tLQo+ID4gWyAgICAyLjQyNDk1N10gbGlzdF9hZGQgZG91YmxlIGFkZDogbmV3PWZmZmZl
YTAwMGVmZmY0YzgsIHByZXY9ZmZmZjg4ODNiZmZmZWU2MCwgbmV4dD1mZmZmZWEwMDBlZmZmNGM4
Lgo+ID4gWyAgICAyLjQyODI1OV0gV0FSTklORzogQ1BVOiA0IFBJRDogMSBhdCBsaWIvbGlzdF9k
ZWJ1Zy5jOjI5IF9fbGlzdF9hZGRfdmFsaWQrMHg2Ny8weDcwCj4gPiBbICAgIDIuNDU3NDg0XSBD
YWxsIFRyYWNlOgo+ID4gWyAgICAyLjQ1ODE3MV0gIF9fcGFnZXZlY19scnVfYWRkX2ZuKzB4MTVm
LzB4MmMwCj4gPiBbICAgIDIuNDU5Mzc2XSAgcGFnZXZlY19scnVfbW92ZV9mbisweDg3LzB4ZDAK
PiA+IFsgICAgMi40NjA1MDBdICA/IHBhZ2V2ZWNfbW92ZV90YWlsX2ZuKzB4MmQwLzB4MmQwCj4g
PiBbICAgIDIuNDYxNzEyXSAgbHJ1X2FkZF9kcmFpbl9jcHUrMHg4ZC8weDE2MAo+ID4gWyAgICAy
LjQ2Mjc4N10gIGxydV9hZGRfZHJhaW4rMHgxOC8weDIwCj4gCj4gQXJlIHlvdSBzdXJlIHRoYXQg
d2FzIDRiZTQ5NzA5NmMwNCA/ICBJIGFzayBiZWNhdXNlIHRoZXJlIHdhcyBhCgpZZXMsIGJlY2F1
c2UgaXQncyB0aGUgb25seSB2ZXJzaW9uIEkndmUgYWN0dWFsbHkgbWVyZ2VkIGludG8gbXkKd29y
a2luZyB0cmVlLCBjb21waWxlZCBhbmQgdHJpZWQgdG8gcnVuLiA6UAoKPiB2ZXJzaW9uIHB1c2hl
ZCB0byB0aGF0IGdpdCB0cmVlIHRoYXQgZGlkIGNvbnRhaW4gYSBsaXN0IGRvdWJsZS1hZGQKPiAo
ZHVlIHRvIGEgbWlzbWVyZ2Ugd2hlbiBzaHVmZmxpbmcgcGF0Y2hlcykuICBJIG5vdGljZWQgaXQg
YW5kIGZpeGVkCj4gaXQsIGFuZCA0YmU0OTcwOTZjMDQgZG9lc24ndCBoYXZlIHRoYXQgcHJvYmxl
bS4gIEkgYWxzbyB0ZXN0IHdpdGgKPiBDT05GSUdfREVCVUdfTElTVCB0dXJuZWQgb24sIGJ1dCB0
aGlzIHByb2JsZW0geW91IGhpdCBpcyBnb2luZyB0byBiZQo+IHByb2JhYmlsaXN0aWMgYmVjYXVz
ZSBpdCdsbCBkZXBlbmQgb24gdGhlIHRpbWluZyBiZXR3ZWVuIHdoYXRldmVyIG90aGVyCj4gbGlz
dCBpcyBiZWluZyB1c2VkIGFuZCB0aGUgcGFnZSBhY3R1YWxseSBiZWluZyBhZGRlZCB0byB0aGUg
TFJVLgoKSSdsbCBzZWUgaWYgSSBjYW4gcmVwcm9kdWNlIGl0LgoKQ2hlZXJzLAoKRGF2ZS4KLS0g
CkRhdmUgQ2hpbm5lcgpkYXZpZEBmcm9tb3JiaXQuY29tCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QK
TGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
