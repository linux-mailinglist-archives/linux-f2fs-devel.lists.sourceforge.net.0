Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 140F414F83A
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  1 Feb 2020 16:12:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ixuS9-0002ZS-SQ; Sat, 01 Feb 2020 15:12:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1ixuS8-0002Z0-1C
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 01 Feb 2020 15:12:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dB7ywmsatelLVL7Psw2UVkpn4TS1ismlyPRVqvsNN4I=; b=fFBzbIbbJhgYjmSq1bPs8zEGFm
 zivC8tepmkwvvfkDtYnA4zE6fJh3qy7aXKo8VD9WtFMNETlG9411MTgbGvO8OHkpRYN4nlqqYzz1D
 bibign5Q5/E9ibapLlJz8FVD/4IWswP9sYBYtf752f5JUeI+JXi9ldUPVdeuAcCrgklY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=dB7ywmsatelLVL7Psw2UVkpn4TS1ismlyPRVqvsNN4I=; b=U
 bddYZiJnvbQsPNvfy6SBPdkE0GcKIcQGKwntNt/iuideww90acoLkhQynRz9v0Kx4/FW7OfqZ+hGT
 cnoQA1zIFHSwrFOnPnIHROHyfkEqeCyA9bgjJP6CkFUVNt4R7eqJ02NEcLwavImQZnMTTJ+UQ1dOa
 vXg4oBm2YsaKbhWI=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ixuS6-007Eg3-3C
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 01 Feb 2020 15:12:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dB7ywmsatelLVL7Psw2UVkpn4TS1ismlyPRVqvsNN4I=; b=RnoVi6fUM/M58i6TYhoTLY0TL
 V7I9zpJWwCzNP2scBs5DKrt7H9v8YkzB+zy/W4DudHEy5O3nZ2nS+CmMmx7gYjNpb//bY/tIKKSyZ
 BoIYl7MaogIfsM0Y9tjCirctp4DMLxm6KpweOFcDQtxE+etr4078ycEjYIbRbs9F7wyfbU5GGbVy3
 fnFz1u13IqALNOQOFhi0zXFNp8K2To+TxPFBQ7dryOGOMrqog5fJewQfdZiz2SpgzlRxhq5dAlgjj
 JO1o3SZNAvTMRVCpWVcSJwTwalk4DOgKQ0oSw60THP3NVyDBfjsNRTxzLp1iNTUgC+HvKJkv6LBzz
 TzfPOsY9g==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1ixuRu-0006HE-1K; Sat, 01 Feb 2020 15:12:42 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Sat,  1 Feb 2020 07:12:28 -0800
Message-Id: <20200201151240.24082-1-willy@infradead.org>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Spam-Score: 1.8 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 2.5 URIBL_DBL_ABUSE_MALW   Contains an abused malware URL listed in the
 Spamhaus DBL blocklist [URIs: infradead.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.6 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ixuS6-007Eg3-3C
Subject: [f2fs-dev] [PATCH v4 00/12] Change readahead API
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
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com, linux-ext4@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

I would particularly value feedback on this from the gfs2 and ocfs2
maintainers.  They have non-trivial changes, and a review on patch 5
would be greatly appreciated.

This series adds a readahead address_space operation to eventually
replace the readpages operation.  The key difference is that
pages are added to the page cache as they are allocated (and
then looked up by the filesystem) instead of passing them on a
list to the readpages operation and having the filesystem add
them to the page cache.  It's a net reduction in code for each
implementation, more efficient than walking a list, and solves
the direct-write vs buffered-read problem reported by yu kuai at
https://lore.kernel.org/linux-fsdevel/20200116063601.39201-1-yukuai3@huawei.com/

v4:
 - Rebase on current Linus (a62aa6f7f50a ("Merge tag 'gfs2-for-5.6'"))
 - Add comment to __do_page_cache_readahead() acknowledging we don't
   care _that_ much about setting PageReadahead.
 - Fix the return value check of add_to_page_cache_lru().
 - Add a missing call to put_page() in __do_page_cache_readahead() if
   we fail to insert the page.
 - Improve the documentation of ->readahead (including indentation
   problem identified by Randy).
 - Fix off by one error in read_pages() (Dave Chinner).
 - Fix nr_pages manipulation in btrfs (Dave Chinner).
 - Remove bogus refcount fix in erofs (Gao Xiang, Dave Chinner).
 - Update ext4 patch for Merkle tree readahead.
 - Update f2fs patch for Merkle tree readahead.
 - Reinstate next_page label in f2fs_readpages() now it's used by the
   compression code.
 - Reinstate call to fuse_wait_on_page_writeback (Miklos Szeredi).
 - Remove a double-unlock in the error path in fuse.
 - Remove an odd fly-speck in fuse_readpages().
 - Make nr_pages loop in fuse_readpages less convoluted (Dave Chinner).

Matthew Wilcox (Oracle) (12):
  mm: Fix the return type of __do_page_cache_readahead
  readahead: Ignore return value of ->readpages
  readahead: Put pages in cache earlier
  mm: Add readahead address space operation
  fs: Convert mpage_readpages to mpage_readahead
  btrfs: Convert from readpages to readahead
  erofs: Convert uncompressed files from readpages to readahead
  erofs: Convert compressed files from readpages to readahead
  ext4: Convert from readpages to readahead
  f2fs: Convert from readpages to readahead
  fuse: Convert from readpages to readahead
  iomap: Convert from readpages to readahead

 Documentation/filesystems/locking.rst |  7 ++-
 Documentation/filesystems/vfs.rst     | 14 +++++
 drivers/staging/exfat/exfat_super.c   |  9 +--
 fs/block_dev.c                        |  9 +--
 fs/btrfs/extent_io.c                  | 19 +++---
 fs/btrfs/extent_io.h                  |  2 +-
 fs/btrfs/inode.c                      | 18 +++---
 fs/erofs/data.c                       | 33 ++++------
 fs/erofs/zdata.c                      | 21 +++----
 fs/ext2/inode.c                       | 12 ++--
 fs/ext4/ext4.h                        |  5 +-
 fs/ext4/inode.c                       | 24 ++++----
 fs/ext4/readpage.c                    | 20 +++---
 fs/ext4/verity.c                      | 16 +++--
 fs/f2fs/data.c                        | 35 +++++------
 fs/f2fs/f2fs.h                        |  5 +-
 fs/f2fs/verity.c                      | 16 +++--
 fs/fat/inode.c                        |  8 +--
 fs/fuse/file.c                        | 37 +++++------
 fs/gfs2/aops.c                        | 20 +++---
 fs/hpfs/file.c                        |  8 +--
 fs/iomap/buffered-io.c                | 74 +++++-----------------
 fs/iomap/trace.h                      |  2 +-
 fs/isofs/inode.c                      |  9 +--
 fs/jfs/inode.c                        |  8 +--
 fs/mpage.c                            | 38 ++++--------
 fs/nilfs2/inode.c                     | 13 ++--
 fs/ocfs2/aops.c                       | 32 +++++-----
 fs/omfs/file.c                        |  8 +--
 fs/qnx6/inode.c                       |  8 +--
 fs/reiserfs/inode.c                   | 10 +--
 fs/udf/inode.c                        |  8 +--
 fs/xfs/xfs_aops.c                     | 10 +--
 include/linux/fs.h                    |  2 +
 include/linux/iomap.h                 |  2 +-
 include/linux/mpage.h                 |  2 +-
 include/linux/pagemap.h               | 12 ++++
 include/trace/events/erofs.h          |  6 +-
 include/trace/events/f2fs.h           |  6 +-
 mm/internal.h                         |  2 +-
 mm/migrate.c                          |  2 +-
 mm/readahead.c                        | 89 ++++++++++++++++++---------
 42 files changed, 332 insertions(+), 349 deletions(-)

-- 
2.24.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
