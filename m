Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8667D983B48
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Sep 2024 04:42:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ssvVs-0002nB-ST;
	Tue, 24 Sep 2024 02:42:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1ssvVr-0002n5-Ai
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Sep 2024 02:42:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9rkR2x5m096bPl0Z6m+55hjEomeNXEeLu7cXLSzIxPU=; b=GWdJMuKvXlUt1QOgr2ONLHrj1Y
 0/U/H1qXlTLbpctSdaggUFafxMofTgv9EiPaxWv4Ww7FVkUKqLOd0ri7ajr1Iptinks5ntlMSIZrc
 srXBPhiJ+gh7FFAda8VdP0N1Hdq94aN6DA5+5C3K/EkxeTPGaXWmuyAB6ggTxly1/YpA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=9rkR2x5m096bPl0Z6m+55hjEomeNXEeLu7cXLSzIxPU=; b=e
 XCCBR4VAXRwKnYbjmhEHMckkphXMidfdoHPxf9AmunFzwsxfyAWnnPooo+T5CuJrcZeDBzaqNZtn2
 Rw7+XygM4n6COMG/rKf66XN/QA0nHmqASkQqo55fn3ZzPnFaN1JGMf8KfFfj5JllH/qp9r1FyUtre
 MsJENgGQsAgXc7Ng=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ssvVq-0006PP-GW for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Sep 2024 02:42:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4431E5C5AA6;
 Tue, 24 Sep 2024 02:42:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB162C4CEC4;
 Tue, 24 Sep 2024 02:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727145759;
 bh=+MR8hh8IN9g+TpCdULcS3JhKqn/mxMo9AdrqWiAvlR8=;
 h=Date:From:To:Cc:Subject:From;
 b=hVyumYgcKtEW0vdGJpUp79O74FPejQ4PsMJGmdLXVsnqa9izNNqMqjJRlWnynid2u
 RMTywr7lsmBP6TcmHKKNT+RHYAxyhs5j+Y2gPw0S2lX292iWgD4SkbTdbARxjrTStE
 /2Rf2myzGah/1IKml+IfLKfLEvcfaEeDEyXHwMuUoRb91JXrd4fnjQCc6J0SjTy8sb
 6CqqTQ8mxdwklpf90aNjzkrmE7+ID88D0WS9vb1flxu6wQxM4H7wA7Lk3GIuObIU5e
 tj8A09WW9+9HMygY/KNVsIyhpOgcNf8RWGRhsNa24SAxA5Yb9gpVrUO0jK4XR52S5Q
 qtXWBkfgZ/0aw==
Date: Tue, 24 Sep 2024 02:42:37 +0000
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <ZvInHczHWvWeXEoF@google.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Linus, Could you please consider this pull reuqest? Thanks,
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ssvVq-0006PP-GW
Subject: [f2fs-dev] [GIT PULL] f2fs for 6.12-rc1
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

Could you please consider this pull reuqest?

Thanks,

The following changes since commit c813111d19e65b6336a6352eae9c1ff5c40f722f:

  Merge tag 'slab-fixes-for-6.11-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab (2024-08-05 09:23:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-6.12-rc1

for you to fetch changes up to ae87b9c2dc9800e6ab52febd09341140599ff8e3:

  f2fs: allow F2FS_IPU_NOCACHE for pinned file (2024-09-23 15:42:13 +0000)

----------------------------------------------------------------
f2fs-6.12-rc1

In this series, the main changes include 1) converting major IO paths to use
folio, and 2) adding various knobs to control GC more flexibly for Zoned
devices. In addition, there are several patches to address corner cases of
atomic file operations and better support for file pinning on zoned device.

Enhancement:
 - add knobs to tune foreground/background GCs for Zoned devices
 - convert IO paths to use folio
 - reduce expensive checkpoint trigger frequency
 - allow F2FS_IPU_NOCACHE for pinned file
 - forcibly migrate to secure space for zoned device file pinning
 - get rid of buffer_head use
 - add write priority option based on zone UFS
 - get rid of online repair on corrupted directory

Bug fix:
 - fix to don't panic system for no free segment fault injection
 - fix to don't set SB_RDONLY in f2fs_handle_critical_error()
 - avoid unused block when dio write in LFS mode
 - compress: don't redirty sparse cluster during {,de}compress
 - check discard support for conventional zones
 - atomic: prevent atomic file from being dirtied before commit
 - atomic: fix to check atomic_file in f2fs ioctl interfaces
 - atomic: fix to forbid dio in atomic_file
 - atomic: fix to truncate pagecache before on-disk metadata truncation
 - atomic: create COW inode from parent dentry
 - atomic: fix to avoid racing w/ GC
 - atomic: require FMODE_WRITE for atomic write ioctls
 - fix to wait page writeback before setting gcing flag
 - fix to avoid racing in between read and OPU dio write, dio completion
 - fix several potential integer overflows in file offsets and dir_block_index
 - fix to avoid use-after-free in f2fs_stop_gc_thread()

As usual, there are several code clean-ups and refactorings.

----------------------------------------------------------------
Chao Yu (32):
      f2fs: clean up data_blkaddr() and get_dnode_addr()
      f2fs: atomic: fix to avoid racing w/ GC
      f2fs: reduce expensive checkpoint trigger frequency
      f2fs: fix to wait dio completion
      f2fs: fix to avoid racing in between read and OPU dio write
      f2fs: get rid of buffer_head use
      f2fs: fix to wait page writeback before setting gcing flag
      f2fs: atomic: fix to truncate pagecache before on-disk metadata truncation
      f2fs: fix to avoid use-after-free in f2fs_stop_gc_thread()
      f2fs: atomic: fix to forbid dio in atomic_file
      f2fs: convert f2fs_compress_ctx_add_page() to use folio
      f2fs: convert f2fs_vm_page_mkwrite() to use folio
      f2fs: convert f2fs_clear_page_cache_dirty_tag() to use folio
      f2fs: convert f2fs_write_inline_data() to use folio
      f2fs: convert f2fs_write_single_data_page() to use folio
      f2fs: convert f2fs_do_write_meta_page() to use folio
      f2fs: convert __f2fs_write_meta_page() to use folio
      f2fs: convert f2fs_read_multi_pages() to use folio
      f2fs: convert f2fs_handle_page_eio() to use folio
      f2fs: convert f2fs_submit_page_read() to use folio
      f2fs: convert f2fs_write_begin() to use folio
      f2fs: convert f2fs_write_end() to use folio
      f2fs: convert f2fs_set_compressed_page() to use folio
      f2fs: convert f2fs_do_write_data_page() to use folio
      f2fs: convert f2fs_write_data_page() to use folio
      f2fs: convert __write_node_page() to use folio
      f2fs: convert read_node_page() to use folio
      f2fs: get rid of page->index
      f2fs: get rid of online repaire on corrupted directory
      f2fs: fix to check atomic_file in f2fs ioctl interfaces
      f2fs: fix to don't set SB_RDONLY in f2fs_handle_critical_error()
      f2fs: fix to don't panic system for no free segment fault injection

Christophe JAILLET (1):
      f2fs: Use sysfs_emit_at() to simplify code

Daeho Jeong (9):
      f2fs: prevent atomic file from being dirtied before commit
      f2fs: make BG GC more aggressive for zoned devices
      f2fs: introduce migration_window_granularity
      f2fs: add reserved_segments sysfs node
      f2fs: increase BG GC migration window granularity when boosted for zoned devices
      f2fs: do FG_GC when GC boosting is required for zoned devices
      f2fs: create gc_no_zoned_gc_percent and gc_boost_zoned_gc_percent
      f2fs: add valid block ratio not to do excessive GC for one time GC
      f2fs: forcibly migrate to secure space for zoned device file pinning

Daejun Park (1):
      f2fs: avoid unused block when dio write in LFS mode

Jaegeuk Kim (1):
      f2fs: allow F2FS_IPU_NOCACHE for pinned file

Jann Horn (1):
      f2fs: Require FMODE_WRITE for atomic write ioctls

Julian Sun (2):
      f2fs: fix macro definition on_f2fs_build_free_nids
      f2fs: fix macro definition stat_inc_cp_count

Liao Yuanhong (1):
      f2fs: add write priority option based on zone UFS

Nikita Zhandarovich (3):
      f2fs: prevent possible int overflow in dir_block_index()
      f2fs: fix several potential integer overflows in file offsets
      f2fs: avoid potential int overflow in sanity_check_area_boundary()

Shin'ichiro Kawasaki (1):
      f2fs: check discard support for conventional zones

Wenjie Cheng (1):
      Revert "f2fs: use flush command instead of FUA for zoned device"

Yeongjin Gil (2):
      f2fs: Create COW inode from parent dentry for atomic write
      f2fs: compress: don't redirty sparse cluster during {,de}compress

Zhiguo Niu (2):
      f2fs: fix to use per-inode maxbytes and cleanup
      f2fs: clean up val{>>,<<}F2FS_BLKSIZE_BITS

Zijie Wang (1):
      f2fs: use f2fs_get_node_page when write inline data

liuderong (1):
      f2fs: remove unused parameters

liujinbao1 (1):
      f2fs: sysfs: support atgc_enabled

 Documentation/ABI/testing/sysfs-fs-f2fs |  56 +++++++++
 fs/f2fs/checkpoint.c                    |  17 +--
 fs/f2fs/compress.c                      |  63 ++++++----
 fs/f2fs/data.c                          | 195 +++++++++++++++++--------------
 fs/f2fs/debug.c                         |   2 +-
 fs/f2fs/dir.c                           |   8 +-
 fs/f2fs/extent_cache.c                  |   4 +-
 fs/f2fs/f2fs.h                          | 148 +++++++++++++++---------
 fs/f2fs/file.c                          | 199 +++++++++++++++++++++-----------
 fs/f2fs/gc.c                            | 113 +++++++++++++-----
 fs/f2fs/gc.h                            |  29 +++++
 fs/f2fs/inline.c                        |  31 +++--
 fs/f2fs/inode.c                         |   9 +-
 fs/f2fs/namei.c                         |  68 -----------
 fs/f2fs/node.c                          |  46 ++++----
 fs/f2fs/segment.c                       |  72 +++++++++---
 fs/f2fs/segment.h                       |   5 +-
 fs/f2fs/super.c                         | 119 +++++++++++--------
 fs/f2fs/sysfs.c                         |  82 +++++++++----
 fs/f2fs/verity.c                        |   5 +-
 fs/f2fs/xattr.c                         |  14 ++-
 include/linux/f2fs_fs.h                 |   4 +-
 include/trace/events/f2fs.h             |   3 +-
 23 files changed, 815 insertions(+), 477 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
