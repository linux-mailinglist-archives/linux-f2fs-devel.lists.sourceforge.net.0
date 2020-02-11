Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C1E158743
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Feb 2020 02:04:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j1JyI-0005ti-JK; Tue, 11 Feb 2020 01:04:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1j1JyC-0005sg-Fq
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 Feb 2020 01:04:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g3I96AED9xpuGVWKIIlCSpxOQGT6kirVfcGE/lGEHHY=; b=Izwi3dNTpE3Ri07EFpJ5KUjgf1
 BAXvpIiBznZkSO/rUpvRLMyx5l/kwiKAv4xutCfKTZF84i1Bh6egelDA0cyMqAeBI1lW9OwNgyjOz
 ALIjKXB3dIr5utjrpQbnB0Gx1pC25KS7ytxOuGulb8LGyeTOkBYVwQgMnZJuN+RtcRq4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=g3I96AED9xpuGVWKIIlCSpxOQGT6kirVfcGE/lGEHHY=; b=G
 SvnV+Ge/CsCrrSMnTPu5KkVXAh14HLDDynxSrGo+DYJ57mXELgCr/hS7flTO2bgbYxl+Qahq5Dir+
 uspVUXm7DIUmfCcYq+nwauRBHRkMd5j2rZxYAfIVYQiKHsgGwc2HN+P7X0Kon5qBbLaRwedDJMtkp
 96BLVqTz2wBc8qo4=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j1JyA-00090M-S7
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 Feb 2020 01:04:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=g3I96AED9xpuGVWKIIlCSpxOQGT6kirVfcGE/lGEHHY=; b=IXp8ySq9j05vmGKD4e3tUEEGfd
 hOOyiHFx8qObGT74MoBcbdPXktSRwwJozKH2633qw95TupzWzEwuw1RJ+zmC1prIg4EQiX6bkcTS/
 0aEQnOicMRpSjIA7dWMiAfE/9Cf++1qsl2uYViTvYIU9O27fy+VPmGQaU+EVbrXiIS/Ve7Cz47wmm
 QwBj1rPdBjR5+Q91XSAGgtCeOxAmZq1V5TIWdDqAdbUwe1ENxNkasVWcWE/bLyd5sZX47hK5A5qP4
 3u2UGE1vs769eDMQYnouLR87lD0ngEJvRttC6ZyZmpI+LPbwedvBRKxNUYNCE7pOiiMAsD7nQkHUb
 vwpQTIXg==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j1Jxu-0001ne-9M; Tue, 11 Feb 2020 01:03:50 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Mon, 10 Feb 2020 17:03:35 -0800
Message-Id: <20200211010348.6872-1-willy@infradead.org>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1j1JyA-00090M-S7
Subject: [f2fs-dev] [PATCH v5 00/13] Change readahead API
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
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com, linux-ext4@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

This series adds a readahead address_space operation to eventually
replace the readpages operation.  The key difference is that
pages are added to the page cache as they are allocated (and
then looked up by the filesystem) instead of passing them on a
list to the readpages operation and having the filesystem add
them to the page cache.  It's a net reduction in code for each
implementation, more efficient than walking a list, and solves
the direct-write vs buffered-read problem reported by yu kuai at
https://lore.kernel.org/linux-fsdevel/20200116063601.39201-1-yukuai3@huawei.com/

v5 switches to passing a readahead_control struct (mirroring the
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

This version deletes a lot more lines than previous versions of the patch
-- we're net -97 lines instead of -17 with v4.  It'll be even more when
we can finish the conversion and remove all the ->readpages support code,
including read_cache_pages().

Also new in v5 is patch 5 which adds page_cache_readahead_limit() and
converts ext4 and f2fs to use it for their Merkel trees.

Matthew Wilcox (Oracle) (13):
  mm: Fix the return type of __do_page_cache_readahead
  mm: Ignore return value of ->readpages
  mm: Put readahead pages in cache earlier
  mm: Add readahead address space operation
  mm: Add page_cache_readahead_limit
  fs: Convert mpage_readpages to mpage_readahead
  btrfs: Convert from readpages to readahead
  erofs: Convert uncompressed files from readpages to readahead
  erofs: Convert compressed files from readpages to readahead
  ext4: Convert from readpages to readahead
  f2fs: Convert from readpages to readahead
  fuse: Convert from readpages to readahead
  iomap: Convert from readpages to readahead

 Documentation/filesystems/locking.rst |   6 +-
 Documentation/filesystems/vfs.rst     |  13 +++
 drivers/staging/exfat/exfat_super.c   |   7 +-
 fs/block_dev.c                        |   7 +-
 fs/btrfs/extent_io.c                  |  48 +++------
 fs/btrfs/extent_io.h                  |   3 +-
 fs/btrfs/inode.c                      |  16 ++-
 fs/erofs/data.c                       |  39 +++----
 fs/erofs/zdata.c                      |  29 ++----
 fs/ext2/inode.c                       |  10 +-
 fs/ext4/ext4.h                        |   3 +-
 fs/ext4/inode.c                       |  23 ++---
 fs/ext4/readpage.c                    |  22 ++--
 fs/ext4/verity.c                      |  35 +------
 fs/f2fs/data.c                        |  50 ++++-----
 fs/f2fs/f2fs.h                        |   5 +-
 fs/f2fs/verity.c                      |  35 +------
 fs/fat/inode.c                        |   7 +-
 fs/fuse/file.c                        |  46 ++++-----
 fs/gfs2/aops.c                        |  23 ++---
 fs/hpfs/file.c                        |   7 +-
 fs/iomap/buffered-io.c                | 103 ++++++-------------
 fs/iomap/trace.h                      |   2 +-
 fs/isofs/inode.c                      |   7 +-
 fs/jfs/inode.c                        |   7 +-
 fs/mpage.c                            |  38 +++----
 fs/nilfs2/inode.c                     |  15 +--
 fs/ocfs2/aops.c                       |  34 +++---
 fs/omfs/file.c                        |   7 +-
 fs/qnx6/inode.c                       |   7 +-
 fs/reiserfs/inode.c                   |   8 +-
 fs/udf/inode.c                        |   7 +-
 fs/xfs/xfs_aops.c                     |  13 +--
 fs/zonefs/super.c                     |   7 +-
 include/linux/fs.h                    |   2 +
 include/linux/iomap.h                 |   3 +-
 include/linux/mpage.h                 |   4 +-
 include/linux/pagemap.h               |  84 +++++++++++++++
 include/trace/events/erofs.h          |   6 +-
 include/trace/events/f2fs.h           |   6 +-
 mm/internal.h                         |   2 +-
 mm/migrate.c                          |   2 +-
 mm/readahead.c                        | 143 ++++++++++++++++----------
 43 files changed, 422 insertions(+), 519 deletions(-)

-- 
2.25.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
