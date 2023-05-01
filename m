Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E541E6F2D9F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 May 2023 05:14:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ptJzf-0007AR-TW;
	Mon, 01 May 2023 03:14:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mcgrof@infradead.org>) id 1ptJze-0007AK-4Y
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 May 2023 03:14:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AkJl0tFqtRHi9AGRk0MSBLVfjZO+jM952c9eQV2BcB8=; b=akbSot0ihe8Juqeq4PJmugsytI
 kbtD12eO0r3wlEdtCOzzaq3ulKJ8r52bZiqsDTnanzAiNYKBhipbecSGDf37K7jlIM/5W7JyEwjxD
 19tABe2Uut+NHmodlAB1JA9v9QpcFGeh5tvHYvT+9qeTVEYaULVlQ9HUG899wgRSrgYc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AkJl0tFqtRHi9AGRk0MSBLVfjZO+jM952c9eQV2BcB8=; b=OoWOPNTJ6qlIrU9R7Zg+GeGCLI
 rzK8bz39/+eZo/p8+hJp8qE1vsXDA0KCcGRDlF0TP20f5KOgYUa1X7n28ffap33+ldfxzeBdyb+eN
 sNBh3PtOhv7/OSFpdU13qugSFHaMBtMi+AlYVMWeoDbfpH3fqnRVlVHedIeuaDRFhwAc=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ptJzb-00044f-WF for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 May 2023 03:14:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=AkJl0tFqtRHi9AGRk0MSBLVfjZO+jM952c9eQV2BcB8=; b=JhHSEEQPfjKvVQ+rrWGeXbR5Iw
 dpqFd38ICY6Wgg8C/+vEQhaLPROke1zV16ZNQ1xIG0Uq2O999RGBqRcQ08S7Y8G98kowaRMq00L2i
 Wailu9iQ+uNRZsy1h+ptTgg0tRZE7bc2YO61KjE82BHeAxV+Q8WW+y6WbGZHYtEXx4C+q2mAhCnaY
 7ZY52Z3rvy/uwShJj0SxGNkDL00K0yxkevUBa8/5bBlj+SS4w7EIU2xH549sMti/O2UmSqaNCOeWw
 aA6IvzNOK+M7BI6pjKmDVj+PJmKK2UL6RE0fzq6VkotIRt5dkGEYwHxJlzABn/lxNZzxVFQdxtdda
 Qvz/fyQQ==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.96 #2 (Red
 Hat Linux)) id 1ptJzH-00FB2K-1S; Mon, 01 May 2023 03:14:03 +0000
Date: Sun, 30 Apr 2023 20:14:03 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <ZE8ue9Mx6n2T0yn6@bombadil.infradead.org>
References: <20230424054926.26927-1-hch@lst.de>
 <20230424054926.26927-18-hch@lst.de>
 <ZExgzbBCbdC1y9Wk@bombadil.infradead.org>
 <ZExw0eW52lYj2R1m@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZExw0eW52lYj2R1m@casper.infradead.org>
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, Apr 29, 2023 at 02:20:17AM +0100,
 Matthew Wilcox wrote:
 > On Fri, Apr 28, 2023 at 05:11:57PM -0700, Luis Chamberlain wrote: > > [
 11.245248] BUG: kernel NULL pointer dereference, address: 0000 [...] 
 Content analysis details:   (-2.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1ptJzb-00044f-WF
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

On Sat, Apr 29, 2023 at 02:20:17AM +0100, Matthew Wilcox wrote:
> On Fri, Apr 28, 2023 at 05:11:57PM -0700, Luis Chamberlain wrote:
> > [   11.245248] BUG: kernel NULL pointer dereference, address: 0000000000000000
> > [   11.254581] #PF: supervisor read access in kernel mode
> > [   11.257387] #PF: error_code(0x0000) - not-present page
> > [   11.260921] PGD 0 P4D 0
> > [   11.262600] Oops: 0000 [#1] PREEMPT SMP PTI
> > [   11.264993] CPU: 7 PID: 198 Comm: (udev-worker) Not tainted 6.3.0-large-block-20230426 #2
> > [   11.269385] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.0-debian-1.16.0-5 04/01/2014
> > [   11.275054] RIP: 0010:iomap_page_create.isra.0+0xc/0xd0
> > [   11.277924] Code: 41 5e 41 5f c3 cc cc cc cc 0f 1f 44 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 0f 1f 44 00 00 41 54 55 48 89 f5 53 <48> 8b 06 48 c1 e8 0d 89 c6 83 e6 01 0f 84 a1 00 00 00 4c 8b 65 28
> > [   11.287293] RSP: 0018:ffffb0f0805ef9d8 EFLAGS: 00010293
> > [   11.289964] RAX: ffff9de3c1fa8388 RBX: ffffb0f0805efa78 RCX: 000000037ffe0000
> > [   11.293212] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 000000000000000d
> > [   11.296485] RBP: 0000000000000000 R08: 0000000000021000 R09: ffffffff9c733b20
> > [   11.299724] R10: 0000000000000001 R11: 000000000000c000 R12: 0000000000000000
> > [   11.302974] R13: ffffffff9be96260 R14: ffffb0f0805efa58 R15: 0000000000000000
> 
> RSI is argument 2, which is folio.
> 
> Code starting with the faulting instruction
> ===========================================
>    0:	48 8b 06             	mov    (%rsi),%rax
>    3:	48 c1 e8 0d          	shr    $0xd,%rax
> 
> Looks to me like a NULL folio was passed into iomap_page_create().
> 
> > [   11.306206] FS:  00007f03ea8368c0(0000) GS:ffff9de43bdc0000(0000) knlGS:0000000000000000
> > [   11.309949] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [   11.312464] CR2: 0000000000000000 CR3: 0000000117ec6006 CR4: 0000000000770ee0
> > [   11.315442] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > [   11.318310] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > [   11.321010] PKRU: 55555554
> > [   11.322212] Call Trace:
> > [   11.323224]  <TASK>
> > [   11.324146]  iomap_readpage_iter+0x96/0x300
> > [   11.325694]  iomap_readahead+0x174/0x2d0
> > [   11.327129]  read_pages+0x69/0x1f0
> > [   11.329751]  page_cache_ra_unbounded+0x187/0x1d0
> 
> ... that shouldn't be possible.  read_pages() allocates pages, puts them
> in the page cache and tells the filesystem to fill them in.
> 
> In your patches, did you call mapping_set_large_folios() anywhere?

No but the only place to add that would be in the block cache. Adding
that alone to the block cache doesn't fix the issue. The below patch
however does get us by.

From my readings it does't seem like readahead_folio() should always
return non-NULL, and also I couldn't easily verify the math is right.
The max cap I see is for the backing device io_size, but there are
some other heuristics which will take me some time to try to grok
to understand if they are correct.

diff --git a/block/bdev.c b/block/bdev.c
index 21c63bfef323..afa0c5ebd364 100644
--- a/block/bdev.c
+++ b/block/bdev.c
@@ -411,6 +411,7 @@ struct block_device *bdev_alloc(struct gendisk *disk, u8 partno)
 	inode->i_rdev = 0;
 	inode->i_data.a_ops = &def_blk_aops;
 	mapping_set_gfp_mask(&inode->i_data, GFP_USER);
+	mapping_set_large_folios(inode->i_mapping);
 
 	bdev = I_BDEV(inode);
 	mutex_init(&bdev->bd_fsfreeze_mutex);
diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 8115b0d9a85a..d3c9e16a7066 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -384,7 +384,10 @@ static loff_t iomap_readahead_iter(const struct iomap_iter *iter,
 		}
 		if (!ctx->cur_folio) {
 			ctx->cur_folio = readahead_folio(ctx->rac);
-			ctx->cur_folio_in_bio = false;
+			if (ctx->cur_folio)
+				ctx->cur_folio_in_bio = false;
+			else
+				continue;
 		}
 		ret = iomap_readpage_iter(iter, ctx, done);
 		if (ret <= 0)

We still see:

Apr 30 19:54:21 iomap kernel: ------------[ cut here ]------------
Apr 30 19:54:21 iomap kernel: WARNING: CPU: 4 PID: 197 at block/fops.c:389 blkdev_iomap_begin+0x80/0x90
Apr 30 19:54:21 iomap kernel: Modules linked in: psmouse virtio_blk failover nvme nvme_core crc32c_intel t10_pi virtio_pci
virtio_pci_legacy_dev virtio_pci_modern_dev virtio crc64_rocksoft >
Apr 30 19:54:21 iomap kernel: CPU: 4 PID: 197 Comm: (udev-worker) Not tainted 6.3.0-large-block-20230426-dirty #7
Apr 30 19:54:21 iomap kernel: Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.0-debian-1.16.0-5 04/01/2014
Apr 30 19:54:21 iomap kernel: RIP: 0010:blkdev_iomap_begin+0x80/0x90
Apr 30 19:54:21 iomap kernel: Code: c0 48 89 53 10 5b 5d 41 5c c3 cc cc
cc cc 89 c6 83 e8 01 48 8d 6c 2e ff 48 f7 de 48 29 c5 48 21 ee 48 89 73
08 48 39 d6 7c c6 <0f> 0b b8 fb ff ff ff 5b 5>
Apr 30 19:54:21 iomap kernel: RSP: 0018:ffffa437c0723a08 EFLAGS: 00010246
Apr 30 19:54:21 iomap kernel: RAX: 0000000000007fff RBX: ffffa437c0723aa0 RCX: 0000000000000000
Apr 30 19:54:21 iomap kernel: RDX: 0000000400000000 RSI: 0000000400000000 RDI: ffff92f9c23c5788
Apr 30 19:54:21 iomap kernel: RBP: 0000000400000000 R08: ffffa437c0723aa0 R09: ffffa437c0723af0
Apr 30 19:54:21 iomap kernel: R10: 0000000000000001 R11: 000000000000c000 R12: ffff92f9c23c5788
Apr 30 19:54:21 iomap kernel: R13: ffffa437c0723af0 R14: ffffffff828962e0 R15: ffffa437c0723cc8
Apr 30 19:54:21 iomap kernel: FS:  00007febee04b8c0(0000) GS:ffff92fa3bd00000(0000) knlGS:0000000000000000
Apr 30 19:54:21 iomap kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Apr 30 19:54:21 iomap kernel: CR2: 00007ffd68325108 CR3: 0000000102a9a005 CR4: 0000000000770ee0
Apr 30 19:54:21 iomap kernel: DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
Apr 30 19:54:21 iomap kernel: DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Apr 30 19:54:21 iomap kernel: PKRU: 55555554
Apr 30 19:54:21 iomap kernel: Call Trace:
Apr 30 19:54:21 iomap kernel:  <TASK>
Apr 30 19:54:21 iomap kernel:  iomap_iter+0x179/0x350
Apr 30 19:54:21 iomap kernel:  iomap_readahead+0x200/0x2e0
Apr 30 19:54:21 iomap kernel:  read_pages+0x69/0x1f0
Apr 30 19:54:21 iomap kernel:  ? folio_add_lru+0x7e/0xe0
Apr 30 19:54:21 iomap kernel:  page_cache_ra_unbounded+0x187/0x1d0
Apr 30 19:54:21 iomap kernel:  force_page_cache_ra+0x94/0xb0
Apr 30 19:54:21 iomap kernel:  filemap_get_pages+0x10e/0x650
Apr 30 19:54:21 iomap kernel:  ? _raw_spin_lock+0x13/0x40
Apr 30 19:54:21 iomap kernel:  ? _raw_spin_unlock+0x15/0x30
Apr 30 19:54:21 iomap kernel:  ? __mark_inode_dirty+0x155/0x380
Apr 30 19:54:21 iomap kernel:  filemap_read+0xbf/0x340
Apr 30 19:54:21 iomap kernel:  ? aa_file_perm+0x117/0x4b0
Apr 30 19:54:21 iomap kernel:  ? generic_fillattr+0x45/0xf0
Apr 30 19:54:21 iomap kernel:  ? _copy_to_user+0x22/0x30
Apr 30 19:54:21 iomap kernel:  ? cp_new_stat+0x150/0x180
Apr 30 19:54:21 iomap kernel:  blkdev_read_iter+0x5e/0x140
Apr 30 19:54:21 iomap kernel:  vfs_read+0x1f0/0x2c0
Apr 30 19:54:21 iomap kernel:  ksys_read+0x63/0xe0
Apr 30 19:54:21 iomap kernel:  do_syscall_64+0x37/0x90
Apr 30 19:54:21 iomap kernel:  entry_SYSCALL_64_after_hwframe+0x72/0xdc
Apr 30 19:54:21 iomap kernel: RIP: 0033:0x7febee74e03d
Apr 30 19:54:21 iomap kernel: Code: 31 c0 e9 c6 fe ff ff 50 48 8d 3d a6
55 0a 00 e8 39 fe 01 00 66 0f 1f 84 00 00 00 00 00 80 3d a1 25 0e 00 00
74 17 31 c0 0f 05 <48> 3d 00 f0 ff ff 77 5b c>
Apr 30 19:54:21 iomap kernel: RSP: 002b:00007ffd68329148 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
Apr 30 19:54:21 iomap kernel: RAX: ffffffffffffffda RBX: 000055b30a902020 RCX: 00007febee74e03d
Apr 30 19:54:21 iomap kernel: RDX: 0000000000000100 RSI: 000055b30a905138 RDI: 000000000000000c
Apr 30 19:54:21 iomap kernel: RBP: 00000003ffffe000 R08: 00007febee828d40 R09: 00007febee828d40
Apr 30 19:54:21 iomap kernel: R10: 0000000000000000 R11: 0000000000000246 R12: 000055b30a905110
Apr 30 19:54:21 iomap kernel: R13: 0000000000000100 R14: 000055b30a902078 R15: 000055b30a905128
Apr 30 19:54:21 iomap kernel:  </TASK>
Apr 30 19:54:21 iomap kernel: ---[ end trace 0000000000000000 ]---

And then also:

Apr 30 19:54:21 iomap kernel: ------------[ cut here ]------------
Apr 30 19:54:21 iomap kernel: WARNING: CPU: 4 PID: 197 at fs/iomap/iter.c:32 iomap_iter+0x335/0x350
Apr 30 19:54:21 iomap kernel: Modules linked in: psmouse virtio_blk failover nvme nvme_core crc32c_intel t10_pi virtio_pci
virtio_pci_legacy_dev virtio_pci_modern_dev virtio crc64_rocksoft >
Apr 30 19:54:21 iomap kernel: CPU: 4 PID: 197 Comm: (udev-worker) Tainted: G        W          6.3.0-large-block-20230426-dirty #7
Apr 30 19:54:21 iomap kernel: Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.0-debian-1.16.0-5 04/01/2014
Apr 30 19:54:21 iomap kernel: RIP: 0010:iomap_iter+0x335/0x350
Apr 30 19:54:21 iomap kernel: Code: b8 fe ff ff e8 dc 29 c0 ff e9 ae fe
ff ff 0f 0b e9 71 fe ff ff 0f 0b e9 77 fe ff ff 0f 0b e9 7c fe ff ff 0f
0b e9 7f fe ff ff <0f> 0b b8 fb ff ff ff e9 8>
Apr 30 19:54:21 iomap kernel: RSP: 0018:ffffa437c0723a28 EFLAGS: 00010287
Apr 30 19:54:21 iomap kernel: RAX: 0000000000008000 RBX: ffffa437c0723a78 RCX: 0000000000008000
Apr 30 19:54:21 iomap kernel: RDX: 000000000000a000 RSI:00000003fffab000 RDI: ffffa437c0723a78
Apr 30 19:54:21 iomap kernel: RBP: ffffffff828962e0 R08: 0000000000005000 R09: ffffffff83133b20
Apr 30 19:54:21 iomap kernel: R10: 0000000000000001 R11: 000000000000c000 R12: 0000000000008000
Apr 30 19:54:21 iomap kernel: R13: ffffa437c0723a78 R14: ffffffff828962e0 R15: ffffa437c0723cc8
Apr 30 19:54:21 iomap kernel: FS:  00007febee04b8c0(0000) GS:ffff92fa3bd00000(0000) knlGS:0000000000000000
Apr 30 19:54:21 iomap kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Apr 30 19:54:21 iomap kernel: CR2: 00007ffd68325108 CR3: 0000000102a9a005 CR4: 0000000000770ee0
Apr 30 19:54:21 iomap kernel: DR0: 0000000000000000 DR1:0000000000000000 DR2: 0000000000000000
Apr 30 19:54:21 iomap kernel: DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Apr 30 19:54:21 iomap kernel: PKRU: 55555554
Apr 30 19:54:21 iomap kernel: Call Trace:
Apr 30 19:54:21 iomap kernel:  <TASK>
Apr 30 19:54:21 iomap kernel:  iomap_readahead+0x200/0x2e0
Apr 30 19:54:21 iomap kernel:  read_pages+0x69/0x1f0
Apr 30 19:54:21 iomap kernel:  ? folio_add_lru+0x7e/0xe0
Apr 30 19:54:21 iomap kernel:  page_cache_ra_unbounded+0x187/0x1d0
Apr 30 19:54:21 iomap kernel:  force_page_cache_ra+0x94/0xb0
Apr 30 19:54:21 iomap kernel:  filemap_get_pages+0x10e/0x650
Apr 30 19:54:21 iomap kernel:  filemap_read+0xbf/0x340
Apr 30 19:54:21 iomap kernel:  ? tomoyo_path_number_perm+0x68/0x1d0
Apr 30 19:54:21 iomap kernel:  ? aa_file_perm+0x117/0x4b0
Apr 30 19:54:21 iomap kernel:  blkdev_read_iter+0x5e/0x140
Apr 30 19:54:21 iomap kernel:  vfs_read+0x1f0/0x2c0
Apr 30 19:54:21 iomap kernel:  ksys_read+0x63/0xe0
Apr 30 19:54:21 iomap kernel:  do_syscall_64+0x37/0x90
Apr 30 19:54:21 iomap kernel:  entry_SYSCALL_64_after_hwframe+0x72/0xdc
Apr 30 19:54:21 iomap kernel: RIP: 0033:0x7febee74e03d
Apr 30 19:54:21 iomap kernel: Code: 31 c0 e9 c6 fe ff ff 50 48 8d 3d a6
55 0a 00 e8 39 fe 01 00 66 0f 1f 84 00 00 00 00 00 80 3d a1 25 0e 00 00
74 17 31 c0 0f 05 <48> 3d 00 f0 ff ff 77 5b c>
Apr 30 19:54:21 iomap kernel: RSP: 002b:00007ffd68329198 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
Apr 30 19:54:21 iomap kernel: RAX: ffffffffffffffda RBX: 000055b30a902020 RCX: 00007febee74e03d
Apr 30 19:54:21 iomap kernel: RDX: 0000000000000018 RSI:i 000055b30a8fe518 RDI: 000000000000000c
Apr 30 19:54:21 iomap kernel: RBP: 00000003fffaba00 R08: 00007febee828cc0 R09: 0000000000000070
Apr 30 19:54:21 iomap kernel: R10: 0000000000000000 R11:0000000000000246 R12: 000055b30a8fe4f0
Apr 30 19:54:21 iomap kernel: R13: 0000000000000018 R14: 000055b30a902078 R15: 000055b30a8fe508
Apr 30 19:54:21 iomap kernel:  </TASK>
Apr 30 19:54:21 iomap kernel: ---[ end trace 0000000000000000 ]---



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
