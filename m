Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 040AABF5BBE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Oct 2025 12:17:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:References:
	In-Reply-To:To:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CKIrR6qVIqEmGf9ssYv8fEW8KfOBgKFpQ80upDqefRc=; b=TsxMWH1p1PUOwyd8+e74dGhhaR
	+lQtJYAiq05bPYyJabMm7j5lAkRQAqZ8rwJii7hLSd5NlPBE2Iz595dMnp/FtZg1inC22xPBQegd6
	nt71+NB+XfmSQ3LuNfiqHcu0stEcu04BdiBDNyP99TaaTkvWtFGRAArBliZSyR1ieSVA=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vB9QO-0006l3-Sa;
	Tue, 21 Oct 2025 10:17:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=382e81130=mngyadam@amazon.de>)
 id 1vB9QN-0006ku-2I for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Oct 2025 10:17:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:References:In-Reply-To:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8MDXwoEIFINszKm73LVpBYFxmKJH+hoRSLKsyiU5mp4=; b=d5h4eDykX2ZofMkcAQs5ypBLq4
 1hCzE2X4vPLbEinO06X/VrxD5U9wPVMtHAUfqbTpLJadEYGHhUpJod0I/1k9fNsFtOesI/lCPKE8C
 /8ktg/R1460qCZukE9TtFIlds4uroSP5SNzb+DZfsVa3k002AjJk6hq02ZPo/uO7YoaQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8MDXwoEIFINszKm73LVpBYFxmKJH+hoRSLKsyiU5mp4=; b=Ro1+zsiBNZI/lVTEAm0YcFQaX4
 tC7OH+Yx/J0g/oElsNxBJl2esJ7QYLWiEXmGyBOzodknUu/WvAtKaPPjbErC0ui1DL/kLvDc8YqkK
 IxmnFA71UXGI0NFDHrpC3T8gnoKBLcDndvtEAfum3A2CtLv7zW/bbN2S9WA6wkScB1PY=;
Received: from fra-out-006.esa.eu-central-1.outbound.mail-perimeter.amazon.com
 ([18.197.217.180]) by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vB9QL-0006qX-OL for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Oct 2025 10:17:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
 t=1761041821; x=1792577821;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=8MDXwoEIFINszKm73LVpBYFxmKJH+hoRSLKsyiU5mp4=;
 b=BcSHIywYEDjz77A7EjKmZYK+iwDS/pT3JGIdrPRDaLNwjTCFNHJiKP6r
 ZggBUNvFAcRl395nBaE1LSE7aDmNr7+HTH8W/E+lEV9zBUVhtKZb0Yw2Z
 q6na8qftZYaZrVSBsevuJfX1DfmyEbkXDxcB1ryr7EfVWe6xyPQ47gKeq
 uIe4tVVlAWgoTDB/zfr/UlnfDJ5VM7N9eGNmfs8og6lD14gdwuBLvs738
 JCg4Frdowq034/NESJ0BqumqZGtR2c/wyrlnRr4rBdEktnWdEMGCJxe/i
 19Sf5h+q+DQ3NkMUkEQsQmb5DtCrYeiftPGu8sNHzS3uyXI53nCt0UALR Q==;
X-CSE-ConnectionGUID: t3cCI8X3TtayPGBVW0wUyg==
X-CSE-MsgGUID: KEzN1gffTHWZaf9BIhzJBg==
X-IronPort-AV: E=Sophos;i="6.19,244,1754956800"; 
   d="scan'208";a="3947772"
Received: from ip-10-6-3-216.eu-central-1.compute.internal (HELO
 smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.3.216])
 by internal-fra-out-006.esa.eu-central-1.outbound.mail-perimeter.amazon.com
 with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 10:16:43 +0000
Received: from EX19MTAEUA002.ant.amazon.com [54.240.197.232:30186]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.17.8:2525]
 with esmtp (Farcaster)
 id faaeaca1-ecac-4e7b-891e-ed40e4b2799d; Tue, 21 Oct 2025 10:16:43 +0000 (UTC)
X-Farcaster-Flow-ID: faaeaca1-ecac-4e7b-891e-ed40e4b2799d
Received: from EX19D013EUB004.ant.amazon.com (10.252.51.92) by
 EX19MTAEUA002.ant.amazon.com (10.252.50.126) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Tue, 21 Oct 2025 10:16:35 +0000
Received: from dev-dsk-mngyadam-1c-cb3f7548.eu-west-1.amazon.com.amazon.de
 (10.253.107.175) by EX19D013EUB004.ant.amazon.com (10.252.51.92) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20; Tue, 21 Oct 2025
 10:16:26 +0000
To: Greg KH <gregkh@linuxfoundation.org>
In-Reply-To: <2025102111-stoppage-clergyman-f425@gregkh> (Greg KH's message of
 "Tue, 21 Oct 2025 09:43:45 +0200")
References: <20251021070353.96705-2-mngyadam@amazon.de>
 <2025102128-agent-handheld-30a6@gregkh>
 <lrkyqms5klnri.fsf@dev-dsk-mngyadam-1c-cb3f7548.eu-west-1.amazon.com>
 <2025102111-stoppage-clergyman-f425@gregkh>
Date: Tue, 21 Oct 2025 12:16:22 +0200
Message-ID: <lrkyqikg8lfux.fsf_-_@dev-dsk-mngyadam-1c-cb3f7548.eu-west-1.amazon.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Originating-IP: [10.253.107.175]
X-ClientProxiedBy: EX19D040UWB004.ant.amazon.com (10.13.138.91) To
 EX19D013EUB004.ant.amazon.com (10.252.51.92)
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Greg KH <gregkh@linuxfoundation.org> writes: > On Tue, Oct
 21, 2025 at 09:25:37AM +0200,
 Mahmoud Nagy Adam wrote: >> Greg KH <gregkh@linuxfoundation.org>
 writes: >> >> > >> > >> > On Tue, Oct 21, 2025 at 09:03:35AM +0200, Mahmoud
 Adam wrote: >> [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vB9QL-0006qX-OL
Subject: Re: [f2fs-dev] [PATCH 6.1 0/8] Backporting CVE-2025-38073 fix patch
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
From: Mahmoud Nagy Adam via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Mahmoud Nagy Adam <mngyadam@amazon.de>
Cc: "Darrick J. Wong" <djwong@kernel.org>, nagy@khwaternagy.com,
 linux-mm@kvack.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 linux-nilfs@vger.kernel.org, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Christoph Hellwig <hch@infradead.org>, Ilya Dryomov <idryomov@gmail.com>,
 linux-ext4@vger.kernel.org, linux-block@vger.kernel.org,
 Damien Le Moal <dlemoal@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Xiubo Li <xiubli@redhat.com>, Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Jens Axboe <axboe@kernel.dk>, linux-nfs@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Luis Chamberlain <mcgrof@kernel.org>, Anna
 Schumaker <anna@kernel.org>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Hannes Reinecke <hare@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

R3JlZyBLSCA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+IHdyaXRlczoKCj4gT24gVHVlLCBP
Y3QgMjEsIDIwMjUgYXQgMDk6MjU6MzdBTSArMDIwMCwgTWFobW91ZCBOYWd5IEFkYW0gd3JvdGU6
Cj4+IEdyZWcgS0ggPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPiB3cml0ZXM6Cj4+Cj4+ID4K
Pj4gPgo+PiA+IE9uIFR1ZSwgT2N0IDIxLCAyMDI1IGF0IDA5OjAzOjM1QU0gKzAyMDAsIE1haG1v
dWQgQWRhbSB3cm90ZToKPj4gPj4gVGhpcyBzZXJpZXMgYWltcyB0byBmaXggdGhlIENWRS0yMDI1
LTM4MDczIGZvciA2LjEgTFRTLgo+PiA+Cj4+ID4gVGhhdCdzIG5vdCBnb2luZyB0byB3b3JrIHVu
dGlsIHRoZXJlIGlzIGEgZml4IGluIHRoZSA2LjYueSB0cmVlIGZpcnN0Lgo+PiA+IFlvdSBhbGwg
a25vdyB0aGlzIHF1aXRlIHdlbGwgOigKPj4gPgo+PiA+IFBsZWFzZSB3b3JrIG9uIHRoYXQgdHJl
ZSBmaXJzdCwgYW5kIHRoZW4gbW92ZSB0byBvbGRlciBvbmVzLgo+PiA+Cj4+Cj4+IFl1cCwgSSd2
ZSBhbHJlYWR5IHNlbnQgYSBzZXJpZXMgZm9yIDYuNiB5ZXN0ZXJkYXk6Cj4+IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL3N0YWJsZS8yMDI1MTAyMDEyMjU0MS43MjI3LTEtbW5neWFkYW1AYW1hem9u
LmRlLwo+Cj4gQWgsIHRvdGFsbHkgbWlzc2VkIHRoYXQgYXMgaXQgd2FzICJqdXN0IiBhIHNpbmds
ZSBiYWNrcG9ydCwgbXkgZmF1bHQuCj4KCjYuNiBoYWQgYWxsIHRoZSByZXF1aXJlZCBkZXBlbmRl
bmNpZXMgYWxyZWFkeSBzbyBpdCB3YXMgZm9ydHVuYXRlbHkgYQpzaW1wbGVyIHNlcmllcyA6KS4g
SSdsbCBtYWtlIHN1cmUgdG8gcmVmZXJlbmNlIHRoZSBvdGhlciBzZXJpZXMgaW4gdGhlCmZ1dHVy
ZSBhcyB3ZWxsLgoKPiBUaGFua3MgZm9yIHRoaXMsIEknbGwgcmV2aWV3IHRoaXMgd2hlbiBJIGdl
dCBhIGNoYW5jZS4gIEhvdyB3YXMgdGhpcwo+IHRlc3RlZD8KClRoaXMgd2FzIHRlc3RlZCBieSBv
dXIgaW50ZXJuYWwgdGVzdGluZyBvdmVyIHZhcmlvdXMgRUMyIGluc3RhbmNlcwooeDg2XzY0ICYg
QVJNKS4gT3VyIHRlc3RpbmcgaW5jbHVkZXMgcnVubmluZyBrc2VsZnRlc3RzLCBmc3Rlc3RzLCBM
VFAKc3VpdGVzLgoKSWYgdGhlcmUgYXJlIHNwZWNpZmljIHRlc3RzIHlvdeKAmWQgbGlrZSBtZSB0
byBydW4gb3IgcmVzdWx0cyB0byBwcm92aWRlLApwbGVhc2UgbGV0IG1lIGtub3cuCgpUaGFua3Ms
Ck1OQWRhbQoKCgpBbWF6b24gV2ViIFNlcnZpY2VzIERldmVsb3BtZW50IENlbnRlciBHZXJtYW55
IEdtYkgKVGFtYXJhLURhbnotU3RyLiAxMwoxMDI0MyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhydW5n
OiBDaHJpc3RpYW4gU2NobGFlZ2VyCkVpbmdldHJhZ2VuIGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0
ZW5idXJnIHVudGVyIEhSQiAyNTc3NjQgQgpTaXR6OiBCZXJsaW4KVXN0LUlEOiBERSAzNjUgNTM4
IDU5NwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vm
b3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGlu
dXgtZjJmcy1kZXZlbAo=
