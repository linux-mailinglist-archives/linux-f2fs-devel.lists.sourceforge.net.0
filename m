Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF01725E90
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Jun 2023 14:17:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q6s6F-0006Ir-BR;
	Wed, 07 Jun 2023 12:17:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1q6s6C-0006IS-Tm
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jun 2023 12:17:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E9faakThGtCW+0bU4cgq1GBsW1Ng9dSqZFBHRCf6MfU=; b=U586UBHrydGrR5dDBrhG90bP6F
 FpVXw9qMoHa7wgOZHDrKQV3E2R/JTuvUw3WwBU3oMjxhsIh7p4id1u/sm31IbIQdR6QdYKVtLZi2S
 TOyb1dktepIa9xrVri0KqXXr7gJuv8/U4OzfC3g0QJThCq1m/xb226CFH5kDXraPns6g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=E9faakThGtCW+0bU4cgq1GBsW1Ng9dSqZFBHRCf6MfU=; b=McGPZ5XPVnhbsRqyIsUQ74ULoA
 i7oo3vaiDk4nv2tSNYNdb5IrcVE9nv2Td6QYC0ik3KaUpWAYZebM7lkBwyKGD7VsB4gdm0nX8Te1W
 E/SW3KigTKlyncoXNhSPEMsDSQEkciEon9wC91L3aM6WQdaUTQ4LeVq/sDFfAiMB2O08=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q6s6B-00Dfp7-1c for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jun 2023 12:17:12 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 52B4E6732D; Wed,  7 Jun 2023 14:16:58 +0200 (CEST)
Date: Wed, 7 Jun 2023 14:16:58 +0200
From: Christoph Hellwig <hch@lst.de>
To: Christian Brauner <brauner@kernel.org>
Message-ID: <20230607121658.GA13632@lst.de>
References: <20230606073950.225178-1-hch@lst.de>
 <20230606073950.225178-29-hch@lst.de>
 <20230607-kocht-kornfeld-a249c6740e38@brauner>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230607-kocht-kornfeld-a249c6740e38@brauner>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jun 07, 2023 at 11:21:14AM +0200, Christian Brauner
 wrote: > On Tue, Jun 06, 2023 at 09:39:47AM +0200, Christoph Hellwig wrote:
 > > The only overlap between the block open flags mapped into th [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q6s6B-00Dfp7-1c
Subject: Re: [f2fs-dev] [PATCH 28/31] block: replace fmode_t with a
 block-specific type for block open flags
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-nvme@lists.infradead.org,
 Phillip Potter <phil@philpotter.co.uk>, Chris Mason <clm@fb.com>,
 dm-devel@redhat.com, "Md. Haris Iqbal" <haris.iqbal@ionos.com>,
 Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Jack Wang <jinpu.wang@ionos.com>, Christoph Hellwig <hch@lst.de>,
 linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, linux-pm@vger.kernel.org,
 linux-um@lists.infradead.org, Josef Bacik <josef@toxicpanda.com>,
 Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
 linux-bcache@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 David Sterba <dsterba@suse.com>, Jens Axboe <axboe@kernel.dk>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gV2VkLCBKdW4gMDcsIDIwMjMgYXQgMTE6MjE6MTRBTSArMDIwMCwgQ2hyaXN0aWFuIEJyYXVu
ZXIgd3JvdGU6Cj4gT24gVHVlLCBKdW4gMDYsIDIwMjMgYXQgMDk6Mzk6NDdBTSArMDIwMCwgQ2hy
aXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gPiBUaGUgb25seSBvdmVybGFwIGJldHdlZW4gdGhlIGJs
b2NrIG9wZW4gZmxhZ3MgbWFwcGVkIGludG8gdGhlIGZtb2RlX3QgYW5kCj4gPiBvdGhlciB1c2Vz
IG9mIGZtb2RlX3QgYXJlIEZNT0RFX1JFQUQgYW5kIEZNT0RFX1dSSVRFLiAgRGVmaW5lIGEgbmV3
Cj4gCj4gYW5kIEZNT0RFX0VYQ0wgYWZhaWN0CgpGTU9ERV9FWENMIGlzbid0IHVzZWQgb3V0c2lk
ZSB0aGUgYmxvY2sgbGF5ZXIgYW5kIHJlbW92ZWQgaW4gdGhlIGxhc3QKcGF0Y2guCgo+ID4gK2Js
a19tb2RlX3QgZmlsZV90b19ibGtfbW9kZShzdHJ1Y3QgZmlsZSAqZmlsZSkKPiA+ICt7Cj4gPiAr
CWJsa19tb2RlX3QgbW9kZSA9IDA7Cj4gPiArCj4gPiArCWlmIChmaWxlLT5mX21vZGUgJiBGTU9E
RV9SRUFEKQo+ID4gKwkJbW9kZSB8PSBCTEtfT1BFTl9SRUFEOwo+ID4gKwlpZiAoZmlsZS0+Zl9t
b2RlICYgRk1PREVfV1JJVEUpCj4gPiArCQltb2RlIHw9IEJMS19PUEVOX1dSSVRFOwo+ID4gKwlp
ZiAoZmlsZS0+Zl9tb2RlICYgRk1PREVfRVhDTCkKPiA+ICsJCW1vZGUgfD0gQkxLX09QRU5fRVhD
TDsKPiA+ICsJaWYgKChmaWxlLT5mX2ZsYWdzICYgT19BQ0NNT0RFKSA9PSAzKQo+IAo+IEkgcmVh
bGx5IGRvbid0IGxpa2UgbWFnaWMgbnVtYmVycyBsaWtlIHRoaXMuCgpJIGRvbid0IGxpa2UgdGhl
bSBlaXRoZXIsIGJ1dCB0aGlzIGlzIGp1c3QgbW92ZWQgYXJvdW5kIGFuZCBub3QgbmV3LgoKPiBH
cm9hbiwgT19SRE9OTFkgYmVpbmcgZGVmaW5lZCBhcyAwIHN0cmlrZXMgYWdhaW4uLi4KPiBCZWN1
YXNlIG9mIHRoaXMgcXVpcmsgd2UgaW50ZXJuYWxseSBtYXAKPiAKPiBPX1JET05MWSgwKSAtPiBG
TU9ERV9SRUFEKDEpCj4gT19XUk9OTFkoMSkgLT4gRk1PREVfV1JJVEUoMikKPiBPX1JEV1IoMykg
ICAtPiAoRk1PREVfUkVBRCB8IEZNT0RFX1dSSVRFKQoKT19SRFdSIGlzIDIuCgo+IHNvIGNoZWNr
aW5nIGZvciB0aGUgcmF3IDMgaGVyZSBpcyBjb25mdXNpbmcgaW4gYWRkaXRpb24gdG8gYmVpbmcg
YSBtYWdpYwo+IG51bWJlciBhcyBpdCBjb3VsZCBnaXZlIHRoZSBpbXByZXNzaW9uIHRoYXQgd2hh
dCdzIGNoZWNrZWQgaGVyZSBpcwo+IChPX1dST05MWSB8IE9fUkRXUikgd2hpY2ggZG9lc24ndCBt
YWtlIHNlbnNlLi4uCgpXZWxsLCB0aGF0IGlzIGV4YWN0bHkgd2hhdCB3ZSBjaGVjayBmb3IuICBU
aGlzIGlzIGEgMzAtaXNoIHllYXIgb2xkCnF1aXJrIG9ubHkgdXNlZCBpbiB0aGUgZmxvcHB5IGRy
aXZlci4KCj4gU28gbXkgcGVyZmVyZW5jZSB3b3VsZCBiZSBpbiBkZXNjZW5kaW5nIG9yZGVyIG9m
IHByZWZlcmVuY2U6Cj4gCj4gKGZpbGUtPmZfZmxhZ3MgJiBPX0FDQ01PREUpID09IChGTU9ERV9S
RUFEIHwgRk1PREVfV1JJVEUpCj4gCj4gb3Igd2hpbGUgYSBsaXR0bGUgbGVzcyBjbGVhciBidXQg
aW5mb3JtYXRpdmUgZW5vdWdoIGZvciBwZW9wbGUgZmFtaWxpYXIKPiB3aXRoIHRoZSBPX1JET05M
WSBxdWlyazoKPiAKPiBpZiAoKGZpbGUtPmZfZmxhZ3MgJiBPX0FDQ01PREUpID09IE9fQUNDTU9E
RSkKCkkgZG9uJ3QgdW5kZXJzdGFuZCB0aGlzIHBhcnQuICBFc3BlY2lhbGx5IHRoZSBhYm92ZSBk
b2Vzbid0IG1ha2UKYW55IHNlbnNlIGFzIEZNT0RFX1JFQUQgYW5kIEZNT0RFX1dSSVRFIGFyZSBp
biBhIGNvbXBsZXRlbHkgZGlmZmVyZW50CnN5bWJvbCBzcGFjZSB0byBPXyosIGFuZCBub3QgYSBV
QVDQhiBidXQgYSBrZXJuZWwgaW50ZXJuYWwgdGhpbmcgdGhhdApjb3VsZCBiZSByZW51bWJlcmVk
IGFueSB0aW1lLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMu
c291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3Rp
bmZvL2xpbnV4LWYyZnMtZGV2ZWwK
