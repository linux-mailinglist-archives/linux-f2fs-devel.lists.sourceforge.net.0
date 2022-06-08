Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E845435E9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Jun 2022 17:03:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nyxDb-0005te-4d; Wed, 08 Jun 2022 15:03:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <willy@infradead.org>)
 id 1nyxDY-0005sH-2U; Wed, 08 Jun 2022 15:03:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C8q0R+e/rBy0+WV0269yeWJ3JYLa6mvxcMU049tzAMQ=; b=DNWqaRz+k0I6ZcwN0ucXR46L7b
 T3ep8hf+RfIqBrAdbmeEUeOxMY+xnWBFY1aU4nUnnp052AYyfiBokyI6IWEj3sd8jTVAHolHTB3Oo
 Xxut+xWh0WOVi8QaaJwLla+AiXyDbMwI2X4k4W2d4vkNXoI/KwH0ZHV56HlLe3yaedNM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=C8q0R+e/rBy0+WV0269yeWJ3JYLa6mvxcMU049tzAMQ=; b=K
 4BiNh1IQvHcEzB6OS7VRBiIsXvT9n3op3KRgHir7+KTfGmfUaqfJD/FOXOqcrox+qsE8fJ1tgstlf
 WcnxBIbhVX1GOoJzVr5m+7a7+Hj05zjllN45yW5Y70pqQimXIv4MWELF1i0rAiLJv+fGZSilO1dTT
 w3uVRIzC5e1mOQ+I=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nyxDW-0005FA-Q7; Wed, 08 Jun 2022 15:03:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=C8q0R+e/rBy0+WV0269yeWJ3JYLa6mvxcMU049tzAMQ=; b=CS/ArOOFgUazhgBuVIhXoz92Iz
 tLP1+UzjBKtIQ7Dy/5NVLgAnvWWvYfAukTChPBXBJHel7m/rRcIG1jTO3m2SVgS4dQ2RCnrpnI/2B
 9iKrigIdgG1UysTmv8VlwqX324N8NrztRT9jaBzDbk+mLDdYbNW5pr4mZOlj2VneHAgPoio17IYwj
 m/4vzv2MBPDQc303p8MvgJU+5ViW9y/S2mis6sPjvcMV3XgTzYLKOwdVsPPuf7dw1p/zkAkFsZwEO
 lx/oyhsuVa0FzBkMKs3shdhPr6iBtAans8vQe+2EUQiQ7GyfqEuQkKrwSdQNjedKZMBZwIoJM8JrF
 UgeRmSEA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nyxCt-00CjFE-KF; Wed, 08 Jun 2022 15:02:51 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Wed,  8 Jun 2022 16:02:30 +0100
Message-Id: <20220608150249.3033815-1-willy@infradead.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: We're getting to the last aops that take a struct page. The
 only remaining ones are ->writepage, ->write_begin,
 ->write_end and ->error_remove_page.
 Changes from v1: - Remove ->isolate_page from secretmem - Split the
 movable_operations
 from address_space_operations - Drop the conversions of balloon, zsmalloc
 and z3fold - Fix the build errors with [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1nyxDW-0005FA-Q7
Subject: [f2fs-dev] [PATCH v2 00/19] Convert aops->migratepage to
 aops->migrate_folio
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
Cc: linux-aio@kvack.org, linux-nfs@vger.kernel.org, cluster-devel@redhat.com,
 linux-ntfs-dev@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org, ocfs2-devel@oss.oracle.com,
 linux-ext4@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

We're getting to the last aops that take a struct page.  The only
remaining ones are ->writepage, ->write_begin, ->write_end and
->error_remove_page.

Changes from v1:
 - Remove ->isolate_page from secretmem
 - Split the movable_operations from address_space_operations
 - Drop the conversions of balloon, zsmalloc and z3fold
 - Fix the build errors with hugetlbfs
 - Fix the kerneldoc errors
 - Fix the ;; typo

Matthew Wilcox (Oracle) (19):
  secretmem: Remove isolate_page
  mm: Convert all PageMovable users to movable_operations
  fs: Add aops->migrate_folio
  mm/migrate: Convert fallback_migrate_page() to
    fallback_migrate_folio()
  mm/migrate: Convert writeout() to take a folio
  mm/migrate: Convert buffer_migrate_page() to buffer_migrate_folio()
  mm/migrate: Convert expected_page_refs() to folio_expected_refs()
  btrfs: Convert btree_migratepage to migrate_folio
  nfs: Convert to migrate_folio
  mm/migrate: Convert migrate_page() to migrate_folio()
  mm/migrate: Add filemap_migrate_folio()
  btrfs: Convert btrfs_migratepage to migrate_folio
  ubifs: Convert to filemap_migrate_folio()
  f2fs: Convert to filemap_migrate_folio()
  aio: Convert to migrate_folio
  hugetlb: Convert to migrate_folio
  secretmem: Convert to migrate_folio
  fs: Remove aops->migratepage()
  mm/folio-compat: Remove migration compatibility functions

 Documentation/filesystems/locking.rst       |   5 +-
 Documentation/filesystems/vfs.rst           |  13 +-
 Documentation/vm/page_migration.rst         |  33 +--
 arch/powerpc/platforms/pseries/cmm.c        |  60 +----
 block/fops.c                                |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c |   4 +-
 drivers/misc/vmw_balloon.c                  |  61 +----
 drivers/virtio/virtio_balloon.c             |  47 +---
 fs/aio.c                                    |  36 +--
 fs/btrfs/disk-io.c                          |  22 +-
 fs/btrfs/inode.c                            |  26 +--
 fs/ext2/inode.c                             |   4 +-
 fs/ext4/inode.c                             |   4 +-
 fs/f2fs/checkpoint.c                        |   4 +-
 fs/f2fs/data.c                              |  40 +---
 fs/f2fs/f2fs.h                              |   4 -
 fs/f2fs/node.c                              |   4 +-
 fs/gfs2/aops.c                              |   2 +-
 fs/hugetlbfs/inode.c                        |  23 +-
 fs/iomap/buffered-io.c                      |  25 --
 fs/nfs/file.c                               |   4 +-
 fs/nfs/internal.h                           |   6 +-
 fs/nfs/write.c                              |  16 +-
 fs/ntfs/aops.c                              |   6 +-
 fs/ocfs2/aops.c                             |   2 +-
 fs/ubifs/file.c                             |  29 +--
 fs/xfs/xfs_aops.c                           |   2 +-
 fs/zonefs/super.c                           |   2 +-
 include/linux/balloon_compaction.h          |   6 +-
 include/linux/buffer_head.h                 |  10 +
 include/linux/fs.h                          |  20 +-
 include/linux/iomap.h                       |   6 -
 include/linux/migrate.h                     |  48 ++--
 include/linux/page-flags.h                  |   2 +-
 include/linux/pagemap.h                     |   6 +
 include/uapi/linux/magic.h                  |   4 -
 mm/balloon_compaction.c                     |  10 +-
 mm/compaction.c                             |  34 ++-
 mm/folio-compat.c                           |  22 --
 mm/ksm.c                                    |   2 +-
 mm/migrate.c                                | 238 ++++++++++++--------
 mm/migrate_device.c                         |   3 +-
 mm/secretmem.c                              |  13 +-
 mm/shmem.c                                  |   2 +-
 mm/swap_state.c                             |   2 +-
 mm/util.c                                   |   4 +-
 mm/z3fold.c                                 |  82 +------
 mm/zsmalloc.c                               | 102 ++-------
 48 files changed, 367 insertions(+), 735 deletions(-)

-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
