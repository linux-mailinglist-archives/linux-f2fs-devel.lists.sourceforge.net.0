Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DDF18D004
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Mar 2020 15:22:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jFIY1-0001OT-I6; Fri, 20 Mar 2020 14:22:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1jFIXy-0001MZ-8t
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Mar 2020 14:22:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jq1xqEfh1zKPMWFc0eKFngWbKFqaSlCjUUM4SK88mAo=; b=c1hGNnMQSvP5xZWEPN9tZCVkss
 JpDrW5ZVFSXzBoY9IEadchFHtMBVsRLaz+fYI71jE0zSA/r50vGZ/m3nj3Ug+aBrIK5oSCWF93zbi
 O+Ug9p9Mm5fS9uPFb7QGJVPrfsv3alCn9FI70ttggDxZvBui/orkSCSIsiUjJgbfetCU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=jq1xqEfh1zKPMWFc0eKFngWbKFqaSlCjUUM4SK88mAo=; b=l
 E52AfnLrlLrR76SZJ5LEohbGs7AQwO5LMOpWcMBHq54cAhL5S0QRBcnD4y2Amv+R/JvY5IARfSTSx
 S0OteI8WPm3FUAMoxJxNulHWDaxmwi1jDaZaxNibtkw95d7j8gtFcKhGKDGAffGVKq6fjcqpNARIY
 EywIrvTXHOpONaX0=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jFIXq-00FEF5-Mu
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Mar 2020 14:22:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=jq1xqEfh1zKPMWFc0eKFngWbKFqaSlCjUUM4SK88mAo=; b=cPnzWaQhpjH/0rLywMuKzc+RbH
 aeY46Kzgy6QRMVohOJqzMvB+j+3J4LDg4xNuOYFk/LcomQ15i8hybfxyzK14oCu2msCaLwR0hhuwD
 I+aUQjt/TJmoBBkHHRaMPcitmlyA47zIjsNTn+J2mJ/c4qc7hcN6Lz22IDsHLxXYPOiGHXertPrer
 7f5RofKfrqQrOEzYrc22wXm1RZfS8vNa23M2U17KUQiqOJIl5vBOOTxAsv1fQJHMqfApp9wsA5N67
 52dh6pRc8M8qn1i0c/QDVA8UW0+fbROD2J8w+emiTxQvyMmVRo99f8dgYjSzKlP5QIxYch0UqvDB6
 6SW5nsZA==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jFIXg-0000gx-VY; Fri, 20 Mar 2020 14:22:32 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 20 Mar 2020 07:22:06 -0700
Message-Id: <20200320142231.2402-1-willy@infradead.org>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jFIXq-00FEF5-Mu
Subject: [f2fs-dev] [PATCH v9 00/25] Change readahead API
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
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

This series adds a readahead address_space operation to replace the
readpages operation.  The key difference is that pages are added to the
page cache as they are allocated (and then looked up by the filesystem)
instead of passing them on a list to the readpages operation and having
the filesystem add them to the page cache.  It's a net reduction in
code for each implementation, more efficient than walking a list, and
solves the direct-write vs buffered-read problem reported by yu kuai at
https://lore.kernel.org/linux-fsdevel/20200116063601.39201-1-yukuai3@huawei.com/

The only unconverted filesystems are those which use fscache.  Their
conversion is pending Dave Howells' rewrite which will make the conversion
substantially easier.  This should be completed by the end of the year.

I want to thank the reviewers/testers; Dave Chinner, John Hubbard,
Eric Biggers, Johannes Thumshirn, Dave Sterba, Zi Yan and Christoph
Hellwig have done a marvellous job of providing constructive criticism.

These patches pass an xfstests run on ext4, xfs & btrfs with no
regressions that I can tell (some of the tests seem a little flaky before
and remain flaky afterwards).

This series can also be found at
http://git.infradead.org/users/willy/linux-dax.git/shortlog/refs/tags/readahead_v9

v9: No code changes.  Fixed a changelog and added some reviewed-by tags.

v8:
 - btrfs, ext4 and xfs all survive an xfstests run (thanks to Kent Overstreet
   for providing the ktest framework)
 - iomap restructuring dropped due to Christoph's opposition and the
   redesign of readahead_page() meaning it wasn't needed any more.
 - f2fs_mpage_readpages() made static again
 - Made iomap_readahead() comment more useful
 - Added kernel-doc for the entire readahead_control API
 - Conditionally zero batch_count in readahead_page() (requested by John)
 - Hold RCU read lock while iterating over the xarray in readahead_page_batch()
 - Iterate over the correct pages in readahead_page_batch()
 - Correct the return type of readahead_index() (spotted by Zi Yan)
 - Added a 'skip_page' parameter to read_pages for better documentation
   purposes and so we can reuse the readahead_control higher in the call
   chain in future.
 - Removed the use_list bool (requested by Christoph)
 - Removed the explicit initialisation of _nr_pages to 0 (requested by
   Christoph & John)
 - Add comments explaining why nr_to_read is being capped (requested by John)
 - Reshuffled some of the patches:
   - Split out adding the readahead_control API from the three patches which
     added it piecemeal
   - Shift the final two mm patches to be with the other mm patches
   - Split the f2fs "pass the inode" patch from the "convert to readahead"
     patch, like ext4

v7:
 - Now passes an xfstests run on ext4!
 - Documentation improvements
 - Move the readahead prototypes out of mm.h (new patch)
 - readahead_for_each* iterators are gone; replaced with readahead_page()
   and readahead_page_batch()
 - page_cache_readahead_limit() renamed to page_cache_readahead_unbounded()
   and arguments changed
 - iomap_readahead_actor() restructured differently
 - The readahead code no longer uses the word 'offset' to reduce ambiguity
 - read_pages() now maintains the rac so we can just call it and continue
   instead of mucking around with branches
 - More assertions
 - More readahead functions return void

v6:
 - Name the private members of readahead_control with a leading underscore
   (suggested by Christoph Hellwig)
 - Fix whitespace in rst file
 - Remove misleading comment in btrfs patch
 - Add readahead_next() API and use it in iomap
 - Add iomap_readahead kerneldoc.
 - Fix the mpage_readahead kerneldoc
 - Make various readahead functions return void
 - Keep readahead_index() and readahead_offset() pointing to the start of
   this batch through the body.  No current user requires this, but it's
   less surprising.
 - Add kerneldoc for page_cache_readahead_limit
 - Make page_idx an unsigned long, and rename it to just 'i'
 - Get rid of page_offset local variable
 - Add patch to call memalloc_nofs_save() before allocating pages (suggested
   by Michal Hocko)
 - Resplit a lot of patches for more logical progression and easier review
   (suggested by John Hubbard)
 - Added sign-offs where received, and I deemed still relevant

v5 switched to passing a readahead_control struct (mirroring the
writepages_control struct passed to writepages).  This has a number of
advantages:
 - It fixes a number of bugs in various implementations, eg forgetting to
   increment 'start', an off-by-one error in 'nr_pages' or treating 'start'
   as a byte offset instead of a page offset.
 - It allows us to change the arguments without changing all the
   implementations of ->readahead which just call mpage_readahead() or
   iomap_readahead()
 - Figuring out which pages haven't been attempted by the implementation
   is more natural this way.
 - There's less code in each implementation.

Matthew Wilcox (Oracle) (25):
  mm: Move readahead prototypes from mm.h
  mm: Return void from various readahead functions
  mm: Ignore return value of ->readpages
  mm: Move readahead nr_pages check into read_pages
  mm: Add new readahead_control API
  mm: Use readahead_control to pass arguments
  mm: Rename various 'offset' parameters to 'index'
  mm: rename readahead loop variable to 'i'
  mm: Remove 'page_offset' from readahead loop
  mm: Put readahead pages in cache earlier
  mm: Add readahead address space operation
  mm: Move end_index check out of readahead loop
  mm: Add page_cache_readahead_unbounded
  mm: Document why we don't set PageReadahead
  mm: Use memalloc_nofs_save in readahead path
  fs: Convert mpage_readpages to mpage_readahead
  btrfs: Convert from readpages to readahead
  erofs: Convert uncompressed files from readpages to readahead
  erofs: Convert compressed files from readpages to readahead
  ext4: Convert from readpages to readahead
  ext4: Pass the inode to ext4_mpage_readpages
  f2fs: Convert from readpages to readahead
  f2fs: Pass the inode to f2fs_mpage_readpages
  fuse: Convert from readpages to readahead
  iomap: Convert from readpages to readahead

 Documentation/filesystems/locking.rst |   6 +-
 Documentation/filesystems/vfs.rst     |  15 ++
 block/blk-core.c                      |   1 +
 drivers/staging/exfat/exfat_super.c   |   7 +-
 fs/block_dev.c                        |   7 +-
 fs/btrfs/extent_io.c                  |  46 ++---
 fs/btrfs/extent_io.h                  |   3 +-
 fs/btrfs/inode.c                      |  16 +-
 fs/erofs/data.c                       |  39 ++--
 fs/erofs/zdata.c                      |  29 +--
 fs/ext2/inode.c                       |  10 +-
 fs/ext4/ext4.h                        |   5 +-
 fs/ext4/inode.c                       |  21 +-
 fs/ext4/readpage.c                    |  25 +--
 fs/ext4/verity.c                      |  35 +---
 fs/f2fs/data.c                        |  50 ++---
 fs/f2fs/f2fs.h                        |   3 -
 fs/f2fs/verity.c                      |  35 +---
 fs/fat/inode.c                        |   7 +-
 fs/fuse/file.c                        |  46 ++---
 fs/gfs2/aops.c                        |  23 +--
 fs/hpfs/file.c                        |   7 +-
 fs/iomap/buffered-io.c                |  92 +++------
 fs/iomap/trace.h                      |   2 +-
 fs/isofs/inode.c                      |   7 +-
 fs/jfs/inode.c                        |   7 +-
 fs/mpage.c                            |  38 +---
 fs/nilfs2/inode.c                     |  15 +-
 fs/ocfs2/aops.c                       |  34 ++--
 fs/omfs/file.c                        |   7 +-
 fs/qnx6/inode.c                       |   7 +-
 fs/reiserfs/inode.c                   |   8 +-
 fs/udf/inode.c                        |   7 +-
 fs/xfs/xfs_aops.c                     |  13 +-
 fs/zonefs/super.c                     |   7 +-
 include/linux/fs.h                    |   2 +
 include/linux/iomap.h                 |   3 +-
 include/linux/mm.h                    |  19 --
 include/linux/mpage.h                 |   4 +-
 include/linux/pagemap.h               | 151 ++++++++++++++
 include/trace/events/erofs.h          |   6 +-
 include/trace/events/f2fs.h           |   6 +-
 mm/fadvise.c                          |   6 +-
 mm/internal.h                         |  12 +-
 mm/migrate.c                          |   2 +-
 mm/readahead.c                        | 278 ++++++++++++++++----------
 46 files changed, 580 insertions(+), 589 deletions(-)

base-commit: 11a48a5a18c63fd7621bb050228cebf13566e4d8
-- 
2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
