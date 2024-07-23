Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC46939896
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Jul 2024 05:12:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sW5wp-0007cY-6O;
	Tue, 23 Jul 2024 03:12:19 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1sW5wn-0007cS-8u
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jul 2024 03:12:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9+ZzNfLKx1x+E/jrJLAE81V36izhpkebUp8gJEUE2eA=; b=IuuzN0M5QW766uUzRMneB1LFDF
 poUwm65qtKaiSsP2nXpPCH1WixOi3I3jK7W2FNSrzJjwVnxhTnrV40Ktt67YCCxt5xGOXqdrpL/0H
 0RU4xvu2+UjF+NEDUy7f2PN2uaNGnLjtLMcn0mSnHD/S31nHDxkwdihlWApUIoPQ9TpM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=9+ZzNfLKx1x+E/jrJLAE81V36izhpkebUp8gJEUE2eA=; b=f
 rEmpIwbvNf5aG4AoUs5zc9Dgemf4RGHpuJxx+9WQaQdNM8Fu5WH0dNv9/DwdMjBoOBCI+fC8RqZ9Z
 bAzyrz8ga2S/kHhnMF789lnXMtf8bZr+A9H32DTOohA/ms0WwgjA7tIegedUBTJ5p80KD6tWQtE2A
 4rbJV+/si6L2FjVI=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sW5wk-0004rL-T1 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jul 2024 03:12:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=9+ZzNfLKx1x+E/jrJLAE81V36izhpkebUp8gJEUE2eA=; b=M70k9AFdXAIjqyFoFZ8dKa4CER
 0Tu4Fjf82g0j6gzR6KhFTK3dLjXvbth5y6OGCMjndHbd+3iNTqX+CNw3v8PINiYX6FZs7lsQB9zH6
 mgwatODQFBAB7glBxd6Ytj1MtieNXCYECGFn3L1peItYuDxEwS64zXr8D/Gv6qhWuJmijuoTSs3uf
 UdvBkB2gsFxenVGZNUq+fSSmiU7CpzYiKEnhJznCtegk4Ps+TqwlvpsVX2/Wrw9a97O+g5rfpbiGB
 3iqDGx6gdJnah8LqEn6yi+K3RUu0ZJrC+eCZNPSdQESSYqGcU4nhATCei0Q/XA7BP5Vc/iolfFjEg
 JPfey3Ow==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1sW5wX-00000006Sue-3Xpv;
 Tue, 23 Jul 2024 03:12:01 +0000
Date: Tue, 23 Jul 2024 04:12:01 +0100
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
Message-ID: <Zp8fgUSIBGQ1TN0D@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  My project for the next few weeks is removing page->index.
 The last patch in the series is mostly: +++ b/include/linux/mm_types.h @@
 -103,7 +103,7 @@ struct page { /* See page-flags.h for PAGE_MAPPING_FLAGS
 */ struct address_space *mapping; union { - pgoff_t index; /* Our offset
 within map ping. */ [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: kernelnewbies.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1sW5wk-0004rL-T1
Subject: [f2fs-dev] State of removing page->index
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
Cc: linux-btrfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

My project for the next few weeks is removing page->index.

The last patch in the series is mostly:

+++ b/include/linux/mm_types.h
@@ -103,7 +103,7 @@ struct page {
                        /* See page-flags.h for PAGE_MAPPING_FLAGS */
                        struct address_space *mapping;
                        union {
-                               pgoff_t index;          /* Our offset within map
ping. */
+                               pgoff_t __folio_index;          /* Our offset wi
thin mapping. */
                                unsigned long share;    /* share count for fsdax */
                        };
                        /**

This is a stepping stone to shrinking struct page by half (64 bytes down
to 32 bytes) [1] and allocating struct folio separately from struct page.
It's currently 15 patches:

      bootmem: Stop using page->index
      mm: Constify page_address_in_vma()
      mm: Convert page_to_pgoff() to page_pgoff()
      mm: Mass constification of folio/page pointers
      fs: Turn page_offset() into a wrapper around folio_pos()
      fs: Remove page_mkwrite_check_truncate()
      mm: Remove references to page->index in huge_memory.c
      mm: Use page->private instead of page->index in percpu
      perf: Remove setting of page->index and ->mapping
      dax: Remove access to page->index
      null_blk: Remove accesses to page->index
      watch_queue: Use page->private instead of page->index
      isofs: Partially convert zisofs_read_folio to use a folio
      dax: Use folios more widely within DAX
      mm: Rename page->index to page->__folio_index

I haven't pushed the git tree because the build bots will choke on
the following files which still use page->index:

drivers/hwtracing/intel_th/msu.c
drivers/net/ethernet/sun/niu.c
drivers/staging/fbtft/fbtft-core.c
drivers/video/fbdev/core/fb_defio.c
fs/btrfs/compression.c
fs/btrfs/extent_io.c
fs/btrfs/file.c
fs/btrfs/super.c
fs/ceph/addr.c
fs/ceph/dir.c
fs/ceph/inode.c
fs/crypto/crypto.c
fs/ecryptfs/crypto.c
fs/ecryptfs/mmap.c
fs/ecryptfs/read_write.c
fs/erofs/data.c
fs/f2fs/checkpoint.c
fs/f2fs/compress.c
fs/f2fs/data.c
fs/f2fs/dir.c
fs/f2fs/file.c
fs/f2fs/inline.c
fs/f2fs/inode.c
fs/f2fs/node.c
fs/f2fs/segment.c
fs/f2fs/super.c
fs/fuse/file.c
fs/jffs2/file.c
fs/jfs/jfs_metapage.c
fs/ntfs3/frecord.c
fs/ocfs2/alloc.c
fs/ocfs2/aops.c
fs/ocfs2/mmap.c
fs/reiserfs/file.c
fs/reiserfs/inode.c
fs/smb/client/smb2ops.c
fs/squashfs/file.c
fs/squashfs/page_actor.c
fs/ufs/dir.c
mm/zsmalloc.c

Some of these will be fixed with scheduled pull requests (jfs), or are
improved (and maybe solved) by other pending series (ufs, ecryptfs,
jffs2, zsmalloc).

Expect to see a few patches from me over the next few weeks that seem
random; there is a destination in mind, and if everything lines up,
we might be able to get to it by the next merge window.  Probably
something will miss landing in v6.12 and it'll be the v6.13 release
before page->index goes away entirely.

I believe I have someone lined up to help with ocfs2.  If anyone wants to
help with the remaining filesystems (btrfs & f2fs in particular!), let
me know.  I'm honestly tempted to mark reiserfs BROKEN at this point.

The diffstat of what I currently have looks like this:

 arch/x86/mm/init_64.c         |  9 +++----
 drivers/block/null_blk/main.c |  8 +++---
 drivers/dax/device.c          |  9 +++----
 fs/ceph/addr.c                | 11 ++++----
 fs/dax.c                      | 53 ++++++++++++++++++++-------------------
 fs/isofs/compress.c           | 13 +++++-----
 include/linux/bootmem_info.h  | 25 +++++++++++++------
 include/linux/ksm.h           |  7 +++---
 include/linux/mm_types.h      |  6 ++---
 include/linux/pagemap.h       | 58 ++++++-------------------------------------
 include/linux/rmap.h          | 12 ++++-----
 kernel/events/core.c          |  2 --
 kernel/watch_queue.c          |  4 +--
 mm/bootmem_info.c             | 11 ++++----
 mm/huge_memory.c              | 18 +++++++-------
 mm/internal.h                 | 13 +++++++---
 mm/ksm.c                      |  5 ++--
 mm/memory-failure.c           | 28 +++++++++++----------
 mm/page_vma_mapped.c          |  5 ++--
 mm/percpu.c                   |  4 +--
 mm/rmap.c                     | 18 ++++++++------
 mm/sparse.c                   |  8 +++---
 mm/util.c                     |  2 +-
 23 files changed, 153 insertions(+), 176 deletions(-)

... mostly it's a 1:1 replacement of page with folio, or ->index with
->private, but we get to delete some stuff along the way.

[1] https://kernelnewbies.org/MatthewWilcox/Memdescs/Path
Yes, page->mapping is next on the list in case you're touching
a page->index and notice a page->mapping next door to it.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
