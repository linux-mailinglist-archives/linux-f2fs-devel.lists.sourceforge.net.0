Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F2314929D
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 25 Jan 2020 02:36:20 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ivAN0-0001yk-OQ; Sat, 25 Jan 2020 01:36:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1ivAMz-0001yc-0X
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 25 Jan 2020 01:36:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r6GOkDmHzXzhSVqOAD8xlLIM6J6vOicE1/PE/yHNhJg=; b=W6hI9/e8ZJ2rEh5GxJQa0FtFgs
 H5Ft07SPe0Lv8SmwuDBqtDtS18zz/fFryqIh3ifvXOjFWqX6spGjkvXZx6lt9nFmDyBX+eVEGgGNj
 +uMxnBhDFAevm7BCT/SqcUMwZJ3mUz9Ch+j1TNfvYCCxcANmAPvwqpYV2GlnPUHENvd8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=r6GOkDmHzXzhSVqOAD8xlLIM6J6vOicE1/PE/yHNhJg=; b=B
 /9CnIaa/Hqf8XyF5b3PN/ZSvP4XfW4NxpVvMXOPVnwPusTdkItQyMvH9Dgyc518PY56ktf/USbNiU
 4FTOoA771s6t5zBbEAvYv93rgTb7dXtTSz8BznVbkDpHIc1rasLW0qjhdEnGcMMswN2En54Z4r7Ox
 O6QkPbSdYe+hHzBA=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ivAMu-0001R2-Kl
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 25 Jan 2020 01:36:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r6GOkDmHzXzhSVqOAD8xlLIM6J6vOicE1/PE/yHNhJg=; b=u/qkoarH8z0iijq33ZVQ9301v
 9Rwk5QUWYJuir0JRz2g3gAvmwfEk2dveuO6cp6kOah1H+gU5RcgFpZyz8DOTwcq4u41wsYNesptA0
 DXWwxdfd621h81YVmJJ6QyYt9XLzBwRj4Jjxdi+im2s9zwR/Mdkn5Xy9ag9DkFKXzAcHngeQJznAY
 IH/oeFxaS/lqVzfpSuTithOrftDc8EsfLSUsRuMvpblcWkatJapDh1LX+b0NnrjN3vpcLlh3vxdyB
 4FxYQxNjeDWA6ghvaA058mgMgNJpasVgaPd45I3lX1j0F1vfqg5aArs0bf9j0xFTI4zgAeO6rnM94
 yjHIU1COw==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1ivAMd-0006VA-6E; Sat, 25 Jan 2020 01:35:55 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Fri, 24 Jan 2020 17:35:41 -0800
Message-Id: <20200125013553.24899-1-willy@infradead.org>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
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
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ivAMu-0001R2-Kl
Subject: [f2fs-dev] [PATCH 00/12] Change readahead API
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

This series adds a readahead address_space operation to eventually
replace the readpages operation.  The key difference is that
pages are added to the page cache as they are allocated (and
then looked up by the filesystem) instead of passing them on a
list to the readpages operation and having the filesystem add
them to the page cache.  It's a net reduction in code for each
implementation, more efficient than walking a list, and solves
the direct-write vs buffered-read problem reported by yu kuai at
https://lore.kernel.org/linux-fsdevel/20200116063601.39201-1-yukuai3@huawei.com/

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
 Documentation/filesystems/vfs.rst     | 11 ++++
 drivers/staging/exfat/exfat_super.c   |  9 ++--
 fs/block_dev.c                        |  9 ++--
 fs/btrfs/extent_io.c                  | 15 ++----
 fs/btrfs/extent_io.h                  |  2 +-
 fs/btrfs/inode.c                      | 18 +++----
 fs/erofs/data.c                       | 34 +++++-------
 fs/erofs/zdata.c                      | 21 +++-----
 fs/ext2/inode.c                       | 12 ++---
 fs/ext4/ext4.h                        |  2 +-
 fs/ext4/inode.c                       | 24 ++++-----
 fs/ext4/readpage.c                    | 20 +++----
 fs/f2fs/data.c                        | 33 +++++-------
 fs/fat/inode.c                        |  8 +--
 fs/fuse/file.c                        | 35 ++++++------
 fs/gfs2/aops.c                        | 20 ++++---
 fs/hpfs/file.c                        |  8 +--
 fs/iomap/buffered-io.c                | 74 ++++++--------------------
 fs/iomap/trace.h                      |  2 +-
 fs/isofs/inode.c                      |  9 ++--
 fs/jfs/inode.c                        |  8 +--
 fs/mpage.c                            | 38 +++++---------
 fs/nilfs2/inode.c                     | 13 ++---
 fs/ocfs2/aops.c                       | 32 +++++------
 fs/omfs/file.c                        |  8 +--
 fs/qnx6/inode.c                       |  8 +--
 fs/reiserfs/inode.c                   | 10 ++--
 fs/udf/inode.c                        |  8 +--
 fs/xfs/xfs_aops.c                     | 10 ++--
 include/linux/fs.h                    |  2 +
 include/linux/iomap.h                 |  2 +-
 include/linux/mpage.h                 |  2 +-
 include/linux/pagemap.h               | 12 +++++
 include/trace/events/erofs.h          |  6 +--
 include/trace/events/f2fs.h           |  6 +--
 mm/internal.h                         |  2 +-
 mm/migrate.c                          |  2 +-
 mm/readahead.c                        | 76 +++++++++++++++++----------
 39 files changed, 289 insertions(+), 329 deletions(-)

-- 
2.24.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
