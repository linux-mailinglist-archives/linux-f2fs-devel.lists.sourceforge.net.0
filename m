Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9572A6F21EF
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 29 Apr 2023 03:20:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1psZGe-0003PC-KV;
	Sat, 29 Apr 2023 01:20:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1psZGd-0003P6-Ox
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 29 Apr 2023 01:20:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BaIEj2paZYE/uU2XkcW2I8y0R+043vPSdJ9uniAsh0U=; b=EcouF7Cd5HfzFlalbojW0YpyjK
 AHvIGAnpTy6G6onAPf1NemdaLsm9kgb+G5GoTq3T2eEIOC2EKIbOYpQJfqXQE4Ak3cywLE8cHyDtE
 VOpU1i2TXz0g8l5Tcr/qBFF9udpPnMZ9jaHkBIrLXclxIXzOJxgLTYzus3CEQS8IcOa0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BaIEj2paZYE/uU2XkcW2I8y0R+043vPSdJ9uniAsh0U=; b=my7wKy9rAQOk1t4A637xUHPE7K
 MoBvLsQaoGyO85qF8asWoZENH6z6OtJgEVQf47+lwcmH1JkkRALojS7IATuwoc19lb2aM3Lk3q/qY
 Xc+uxkqwO+q+E4sfandIGjpdc5VQ3OtL47I4kXer5KrdXIvFUoSF0ZsX3bTsWZj0bQ20=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1psZGc-006AUX-Uq for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 29 Apr 2023 01:20:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=BaIEj2paZYE/uU2XkcW2I8y0R+043vPSdJ9uniAsh0U=; b=Fu1HC8bUG02gPzRUECQ6ysoDOs
 TKxxmHyyETr+yycfGwhDUSeMV9sMGtard9Y9x6iKaNQrEjTizdLrKfJqajF9FFqYC0FcARAJBzYa7
 QmDsQyBNdOb1YuUCNd0jOstr5EUUo+rkNCx68RH6ucdm2kUyF+oMxXeeKPlKwzVpW0Vs2hPKvplhl
 zBtm35j8R0bVRMTrCVHq8C/RgnPDcuECqaH7jXz7zqz1yCjsGcZrjUCYWzP4bIZvk1TGoHdLj7G7Z
 Cb6pFJcswSczJFWlK1VT+VeMjZesZ6hXXpaiKMKi4EFId/Pr54k+/0BaupArt2vjbPiYkfYlfTNsz
 jgLrdWuA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1psZG6-0059h2-19; Sat, 29 Apr 2023 01:20:18 +0000
Date: Sat, 29 Apr 2023 02:20:17 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Message-ID: <ZExw0eW52lYj2R1m@casper.infradead.org>
References: <20230424054926.26927-1-hch@lst.de>
 <20230424054926.26927-18-hch@lst.de>
 <ZExgzbBCbdC1y9Wk@bombadil.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZExgzbBCbdC1y9Wk@bombadil.infradead.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Apr 28, 2023 at 05:11:57PM -0700, Luis Chamberlain
 wrote: > [ 11.245248] BUG: kernel NULL pointer dereference,
 address: 0000000000000000
 > [ 11.254581] #PF: supervisor read access in kernel mo [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1psZGc-006AUX-Uq
Subject: Re: [f2fs-dev] [PATCH 17/17] fs: add CONFIG_BUFFER_HEAD
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
Cc: Pankaj Raghav <p.raghav@samsung.com>, Jens Axboe <axboe@kernel.dk>,
 David Howells <dhowells@redhat.com>, cluster-devel@redhat.com,
 linux-xfs@vger.kernel.org, Miklos Szeredi <miklos@szeredi.hu>,
 "Darrick J. Wong" <djwong@kernel.org>, ceph-devel@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Daniel Gomez <da.gomez@samsung.com>, linux-mm@kvack.org,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Apr 28, 2023 at 05:11:57PM -0700, Luis Chamberlain wrote:
> [   11.245248] BUG: kernel NULL pointer dereference, address: 0000000000000000
> [   11.254581] #PF: supervisor read access in kernel mode
> [   11.257387] #PF: error_code(0x0000) - not-present page
> [   11.260921] PGD 0 P4D 0
> [   11.262600] Oops: 0000 [#1] PREEMPT SMP PTI
> [   11.264993] CPU: 7 PID: 198 Comm: (udev-worker) Not tainted 6.3.0-large-block-20230426 #2
> [   11.269385] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.0-debian-1.16.0-5 04/01/2014
> [   11.275054] RIP: 0010:iomap_page_create.isra.0+0xc/0xd0
> [   11.277924] Code: 41 5e 41 5f c3 cc cc cc cc 0f 1f 44 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 0f 1f 44 00 00 41 54 55 48 89 f5 53 <48> 8b 06 48 c1 e8 0d 89 c6 83 e6 01 0f 84 a1 00 00 00 4c 8b 65 28
> [   11.287293] RSP: 0018:ffffb0f0805ef9d8 EFLAGS: 00010293
> [   11.289964] RAX: ffff9de3c1fa8388 RBX: ffffb0f0805efa78 RCX: 000000037ffe0000
> [   11.293212] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 000000000000000d
> [   11.296485] RBP: 0000000000000000 R08: 0000000000021000 R09: ffffffff9c733b20
> [   11.299724] R10: 0000000000000001 R11: 000000000000c000 R12: 0000000000000000
> [   11.302974] R13: ffffffff9be96260 R14: ffffb0f0805efa58 R15: 0000000000000000

RSI is argument 2, which is folio.

Code starting with the faulting instruction
===========================================
   0:	48 8b 06             	mov    (%rsi),%rax
   3:	48 c1 e8 0d          	shr    $0xd,%rax

Looks to me like a NULL folio was passed into iomap_page_create().

> [   11.306206] FS:  00007f03ea8368c0(0000) GS:ffff9de43bdc0000(0000) knlGS:0000000000000000
> [   11.309949] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   11.312464] CR2: 0000000000000000 CR3: 0000000117ec6006 CR4: 0000000000770ee0
> [   11.315442] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [   11.318310] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> [   11.321010] PKRU: 55555554
> [   11.322212] Call Trace:
> [   11.323224]  <TASK>
> [   11.324146]  iomap_readpage_iter+0x96/0x300
> [   11.325694]  iomap_readahead+0x174/0x2d0
> [   11.327129]  read_pages+0x69/0x1f0
> [   11.329751]  page_cache_ra_unbounded+0x187/0x1d0

... that shouldn't be possible.  read_pages() allocates pages, puts them
in the page cache and tells the filesystem to fill them in.

In your patches, did you call mapping_set_large_folios() anywhere?



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
