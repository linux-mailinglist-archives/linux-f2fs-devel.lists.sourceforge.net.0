Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 254C4A6E066
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Mar 2025 18:00:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1twlAL-0004Qq-6C;
	Mon, 24 Mar 2025 17:00:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1twlAJ-0004Qg-C9
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Mar 2025 17:00:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nLhjapKyg3U7jj/vln88yoFuHt2oN3JQUeP4tCfOCDw=; b=e2pLAvIOmd3sq6ZuYXD5sgPGgo
 OOD/l7rUkSP1+LJOJDYm7qT4mu1gzA4zIqPVdKE9XDGFkHMSBCYj7yHi7IeP7oI8L1QwHd+Z0I25R
 nQ3fk0wP90h5bPWFlSvd5mQp8ueTnJTcRXVLnYENzl195R2U85O839aH/P7RJNM/40Iw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=nLhjapKyg3U7jj/vln88yoFuHt2oN3JQUeP4tCfOCDw=; b=U
 A94DRjYWi950mS6oeLkpQwI0s9Qn/k3+1bgHENVKCH42iErGlFJ5KaY4HXoEezkwJnCtwra3hzfAW
 8nkGHBqI0pYODSvKvy+OKR5u+ZJGKKRmZ+6qOSRXL8jyPPGPmPExpPbLLK/HkCDAGvraK4NiFUVfu
 DpGbTDj/QBLevIqk=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1twlA7-0003k0-Nd for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Mar 2025 17:00:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E22B4A494B8;
 Mon, 24 Mar 2025 16:54:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B527C4CEDD;
 Mon, 24 Mar 2025 17:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742835620;
 bh=OYjY4yF0Ez+kzMNj68HY08LHLXeZZ33IkW2+u3BjZZ4=;
 h=Date:From:To:Cc:Subject:From;
 b=hfiSJPgWrK3n5XEuTs6lLgyR6+Oc9d1NYdK5bm78TUs5+KTNw35+JRP+QhdME6zgP
 gI+UfttrT13h6Kj8rCGpsJpshxF+B9m1XduyUidcuVJ8vMrc/s6+NWCpDyoPqSibAB
 bsw27jxl9gQZfjVZ5uNt+zfuGdlP+vppSbMvku2CwMnq5TT3JgkpRZUUfsZ1MJmt2t
 L8jw9MARkq3k+NjSubuwmH+1UX3unxaImn2GA23Xa2iX3ndPlPV+igW40swoKBF4l/
 tW1xKhlnctxDTyrFuMjbrwzxEFIKv2Lv/0JP8em6wHXI9Oc4vNVlFD5WAQVVFQvLoD
 2+DyQnwLhAOvw==
Date: Mon, 24 Mar 2025 17:00:18 +0000
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <Z-GPopTYCOl0hjp3@google.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Linus, Could you please consider this pull request? Thanks,
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1twlA7-0003k0-Nd
Subject: [f2fs-dev] [GIT PULL] f2fs update for 6.15-rc1
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Linus,

Could you please consider this pull request?

Thanks,

The following changes since commit f286757b644c226b6b31779da95a4fa7ab245ef5:

  Merge tag 'timers-urgent-2025-02-03' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip (2025-02-03 09:10:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-6.15-rc1

for you to fetch changes up to 21263d035ff21fa0ccf79adba20bab9cd8cca0f2:

  f2fs: fix missing discard for active segments (2025-03-18 01:26:06 +0000)

----------------------------------------------------------------
f2fs-for-6.15-rc1

In this round, there are three major updates: 1) folio conversion, 2) refactor
for mount API conversion, 3) some performance improvement such as direct IO,
checkpoint speed, and IO priority hints. For stability, there are patches
which add more sanity checks and fixes some major issues like i_size in
atomic write operations and write pointer recovery in zoned devices.

Enhancement:
 - huge folio converion work by Matthew Wilcox
 - clean up for mount API conversion by Eric Sandeen
 - improve direct IO speed in the overwrite case
 - add some sanity check on node consistency
 - set highest IO priority for checkpoint thread
 - keep POSIX_FADV_NOREUSE ranges and add sysfs entry to reclaim pages
 - add ioctl to get IO priority hint
 - add carve_out sysfs node for fsstat

Bug fix:
 - disable nat_bits during umount to avoid potential nat entry corruption
 - fix missing i_size update on atomic writes
 - fix missing discard for active segments
 - fix running out of free segments
 - fix out-of-bounds access in f2fs_truncate_inode_blocks()
 - call f2fs_recover_quota_end() correctly
 - fix potential deadloop in prepare_compress_overwrite()
 - fix the missing write pointer correction for zoned device
 - fix to avoid panic once fallocation fails for pinfile
 - don't retry IO for corrupted data scenario

There are many other clean up patches and minor bug fixes as usual.

----------------------------------------------------------------
Chao Yu (15):
      f2fs: quota: fix to avoid warning in dquot_writeback_dquots()
      f2fs: don't retry IO for corrupted data scenario
      f2fs: add dump_stack() in f2fs_handle_critical_error()
      f2fs: fix to avoid panic once fallocation fails for pinfile
      f2fs: fix to set .discard_granularity correctly
      f2fs: fix potential deadloop in prepare_compress_overwrite()
      f2fs: fix to call f2fs_recover_quota_end() correctly
      f2fs: fix to avoid out-of-bounds access in f2fs_truncate_inode_blocks()
      f2fs: control nat_bits feature via mount option
      f2fs: do sanity check on inode footer in f2fs_get_inode_page()
      f2fs: do sanity check on xattr node footer in f2fs_get_xnode_page()
      f2fs: introduce FAULT_INCONSISTENT_FOOTER
      f2fs: fix to avoid accessing uninitialized curseg
      Revert "f2fs: rebuild nat_bits during umount"
      f2fs: fix to avoid running out of free segments

Chunhai Guo (1):
      f2fs: fix missing discard for active segments

Daeho Jeong (1):
      f2fs: add carve_out sysfs node

Eric Sandeen (9):
      f2fs: use f2fs_sb_has_device_alias during option parsing
      f2fs: consolidate unsupported option handling errors
      f2fs: factor out an f2fs_default_check function
      f2fs: make INLINECRYPT a mount option flag
      f2fs: make LAZYTIME a mount option flag
      f2fs: Pass sbi rather than sb to f2fs_set_test_dummy_encryption
      f2fs: defer readonly check vs norecovery
      f2fs: pass sbi rather than sb to quota qf_name helpers
      f2fs: pass sbi rather than sb to parse_options()

Jaegeuk Kim (6):
      f2fs: introduce f2fs_base_attr for global sysfs entries
      f2fs: add ioctl to get IO priority hint
      f2fs: keep POSIX_FADV_NOREUSE ranges
      f2fs: add a sysfs entry to reclaim POSIX_FADV_NOREUSE pages
      f2fs: fix the missing write pointer correction
      f2fs: set highest IO priority for checkpoint thread

Kohei Enju (1):
      f2fs: remove unnecessary null checking

Leo Stone (1):
      f2fs: add check for deleted inode

Matthew Wilcox (Oracle) (31):
      f2fs: Add f2fs_folio_wait_writeback()
      mm: Remove wait_for_stable_page()
      f2fs: Add f2fs_folio_put()
      f2fs: Convert f2fs_flush_inline_data() to use a folio
      f2fs: Convert f2fs_sync_node_pages() to use a folio
      f2fs: Pass a folio to flush_dirty_inode()
      f2fs: Convert f2fs_fsync_node_pages() to use a folio
      f2fs: Convert last_fsync_dnode() to use a folio
      f2fs: Return a folio from last_fsync_dnode()
      f2fs: Add f2fs_grab_cache_folio()
      mm: Remove grab_cache_page_write_begin()
      f2fs: Use a folio in __get_node_page()
      f2fs: Use a folio in do_write_page()
      f2fs: Convert f2fs_write_end_io() to use a folio_iter
      f2fs: Mark some functions as taking a const page pointer
      f2fs: Convert f2fs_in_warm_node_list() to take a folio
      f2fs: Add f2fs_get_node_folio()
      f2fs: Use a folio throughout f2fs_truncate_inode_blocks()
      f2fs: Use a folio throughout __get_meta_page()
      f2fs: Hoist the page_folio() call to the start of f2fs_merge_page_bio()
      f2fs: Add f2fs_get_read_data_folio()
      f2fs: Add f2fs_get_lock_data_folio()
      f2fs: Convert move_data_page() to use a folio
      f2fs: Convert truncate_partial_data_page() to use a folio
      f2fs: Convert gc_data_segment() to use a folio
      f2fs: Add f2fs_find_data_folio()
      mm: Remove wait_on_page_locked()
      f2fs: Remove check for ->writepage
      f2fs: Remove f2fs_write_data_page()
      f2fs: Remove f2fs_write_meta_page()
      f2fs: Remove f2fs_write_node_page()

Yeongjin Gil (1):
      f2fs: fix to avoid atomicity corruption of atomic file

Yohan Joung (1):
      f2fs: optimize f2fs DIO overwrites

Zhiguo Niu (1):
      f2fs: fix to return SHRINK_EMPTY if no objects to free

 Documentation/ABI/testing/sysfs-fs-f2fs |  18 ++
 Documentation/filesystems/f2fs.rst      |   3 +
 fs/f2fs/checkpoint.c                    |  71 ++---
 fs/f2fs/compress.c                      |   1 +
 fs/f2fs/data.c                          | 190 +++++++-------
 fs/f2fs/debug.c                         |   3 +
 fs/f2fs/dir.c                           |   2 +-
 fs/f2fs/f2fs.h                          | 155 ++++++++---
 fs/f2fs/file.c                          | 126 +++++++--
 fs/f2fs/gc.c                            |  42 +--
 fs/f2fs/inline.c                        |  22 +-
 fs/f2fs/inode.c                         |  33 ++-
 fs/f2fs/namei.c                         |   8 +
 fs/f2fs/node.c                          | 450 +++++++++++++++-----------------
 fs/f2fs/node.h                          |  13 +-
 fs/f2fs/segment.c                       |  55 ++--
 fs/f2fs/segment.h                       |   9 +-
 fs/f2fs/shrinker.c                      |  92 ++++++-
 fs/f2fs/super.c                         | 191 +++++++++-----
 fs/f2fs/sysfs.c                         | 139 ++++++++--
 fs/f2fs/xattr.c                         |   8 +-
 include/linux/pagemap.h                 |   9 -
 include/uapi/linux/f2fs.h               |   7 +
 mm/filemap.c                            |   2 +-
 mm/folio-compat.c                       |  14 -
 25 files changed, 1059 insertions(+), 604 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
