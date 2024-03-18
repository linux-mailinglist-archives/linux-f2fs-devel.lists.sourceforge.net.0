Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7793A87EF71
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 18 Mar 2024 19:03:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rmHKh-0007Qh-T9;
	Mon, 18 Mar 2024 18:03:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rmHKe-0007QA-Id
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Mar 2024 18:03:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V3fL746iPxu+MBo6/iRgcfABKRa/YXB9n5IsDDoJ7aI=; b=Y0YpH3/hJGzXdBPRkuh/ehtjP0
 CPjmgVN9NtzcW4Yo+E2mpxr2iXcLLgG+ljcztPERefgRSFzpU4G4q9dX213a6KamsBItKAe91gYyj
 NDEpTX7Rv3fFMX8JuMiz5kRPH+dV6MB5Wlo4BpyiW0dFx1YatvPlFiJ7YEyVYvNeuYp0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=V3fL746iPxu+MBo6/iRgcfABKRa/YXB9n5IsDDoJ7aI=; b=a
 xXI6HMap6iM0vAwPWBAVGERMiwTSC/5BIzSKLHgWJfB86yBGQpkkHHTHRszbFOB4WlSGdINWFO6bl
 h+MJM3Drml9QndMonV+WZIpbl0Y/16H49zCTwttgrPsTeoQ7aKSt05C/vxPuWGbw32gA3VVHlABkA
 SFTvmyybNUIB8O84=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rmHKN-0007Da-4u for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Mar 2024 18:03:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C5B0C60C78;
 Mon, 18 Mar 2024 18:02:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 360AEC433F1;
 Mon, 18 Mar 2024 18:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710784953;
 bh=+JAH1mBsMESLs3MwMiRGxq6NxSHuEAFGRULjvG0Mhr4=;
 h=Date:From:To:Cc:Subject:From;
 b=hga6v1TALUxc8qjnxy9FOWozsLh8+6tDVZu7/Wm5O2OVFN8akL4GBoRvkx/yPe26d
 4giQ5RCm7AVJYxnXyJYsh5husS+FkG+8A8DCDNVKhFqPjfjX0ecVX3P19urSnZtnho
 xYiR6POW3L2h2dGsU9WV8i7s71JZLG/O9vZLnLx+9oO7PI5/oB1zSJ7hRrjOZ7aFPO
 U11/CFv220tl/UXDXci3N9z5BUxc3bfjeB9ujEFYBE59p/nFCaoO4JDdZP2b3yYC9p
 NU89s/o/Ugg5i0hpLoDx6hu5bKG4EA+D0Jgr81R3d+g5MAXGqIsfBTKgsXLE030RHV
 gte8pdr1DPM2Q==
Date: Mon, 18 Mar 2024 11:02:31 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <ZfiBt0gRe_Elp7hE@google.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Linus, Could you please consider this pull request? Thanks,
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rmHKN-0007Da-4u
Subject: [f2fs-dev] [GIT PULL] f2fs update for 6.9-rc1
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Linus,

Could you please consider this pull request?

Thanks,

The following changes since commit 54be6c6c5ae8e0d93a6c4641cb7528eb0b6ba478:

  Linux 6.8-rc3 (2024-02-04 12:20:36 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-6.9-rc1

for you to fetch changes up to eb70d5a6c932d9d23f4bb3e7b83782c21ac4b064:

  f2fs: fix to avoid use-after-free issue in f2fs_filemap_fault (2024-03-14 09:14:53 -0700)

----------------------------------------------------------------
f2fs update for 6.9-rc1

In this round, there are a number of updates on mainly two areas: Zoned block
device support and Per-file compression. For example, we've found several issues
to support Zoned block device especially having large sections regarding to GC
and file pinning used for Android devices. In compression side, we've fixed many
corner race conditions that had broken the design assumption.

Enhancement:
 - Support file pinning for Zoned block device having large section
 - Enhance the data recovery after sudden power cut on Zoned block device
 - Add more error injection cases to easily detect the kernel panics
 - add a proc entry show the entire disk layout
 - Improve various error paths paniced by BUG_ON in block allocation and GC
 - support SEEK_DATA and SEEK_HOLE for compression files

Bug fix:
 - fix to avoid use-after-free issue in f2fs_filemap_fault
 - fix some race conditions to break the atomic write design assumption
 - fix to truncate meta inode pages forcely
 - resolve various per-file compression issues wrt the space management and
   compression policies
 - fix some swap-related bugs

In addition, we removed deprecated codes such as io_bits and heap_allocation,
and also fixed minor error handling routines with neat debugging messages.

----------------------------------------------------------------
Chao Yu (29):
      f2fs: compress: fix to guarantee persisting compressed blocks by CP
      f2fs: compress: fix to cover normal cluster write with cp_rwsem
      f2fs: compress: fix to avoid inconsistence bewteen i_blocks and dnode
      f2fs: fix to remove unnecessary f2fs_bug_on() to avoid panic
      f2fs: introduce FAULT_BLKADDR_CONSISTENCE
      f2fs: zone: fix to wait completion of last bio in zone correctly
      f2fs: support printk_ratelimited() in f2fs_printk()
      f2fs: use f2fs_err_ratelimited() to avoid redundant logs
      f2fs: compress: fix to cover f2fs_disable_compressed_file() w/ i_sem
      f2fs: fix to avoid potential panic during recovery
      f2fs: fix to create selinux label during whiteout initialization
      f2fs: compress: fix to check zstd compress level correctly in mount option
      f2fs: introduce get_available_block_count() for cleanup
      f2fs: delete f2fs_get_new_segment() declaration
      f2fs: fix to handle segment allocation failure correctly
      f2fs: compress: fix to check compress flag w/ .i_sem lock
      f2fs: introduce FAULT_NO_SEGMENT
      f2fs: fix to use correct segment type in f2fs_allocate_data_block()
      f2fs: fix to check return value in f2fs_insert_range()
      f2fs: ro: compress: fix to avoid caching unaligned extent
      f2fs: ro: don't start discard thread for readonly image
      f2fs: fix blkofs_end correctly in f2fs_migrate_blocks()
      f2fs: relocate f2fs_precache_extents() in f2fs_swap_activate()
      f2fs: clean up new_curseg()
      f2fs: fix to reset fields for unloaded curseg
      f2fs: introduce SEGS_TO_BLKS/BLKS_TO_SEGS for cleanup
      f2fs: fix to truncate meta inode pages forcely
      f2fs: zone: fix to remove pow2 check condition for zoned block device
      f2fs: fix to avoid use-after-free issue in f2fs_filemap_fault

Daeho Jeong (4):
      f2fs: separate f2fs_gc_range() to use GC for a range
      f2fs: support SEEK_DATA and SEEK_HOLE for compression files
      f2fs: support file pinning for zoned devices
      f2fs: prevent atomic write on pinned file

HuangXiaojia (1):
      f2fs: Use folio in f2fs_read_merkle_tree_page

Jaegeuk Kim (10):
      f2fs: remove unnecessary f2fs_put_page in f2fs_rename
      f2fs: deprecate io_bits
      f2fs: use BLKS_PER_SEG, BLKS_PER_SEC, and SEGS_PER_SEC
      f2fs: kill heap-based allocation
      f2fs: prevent an f2fs_gc loop during disable_checkpoint
      f2fs: check number of blocks in a current section
      f2fs: fix write pointers all the time
      f2fs: print zone status in string and some log
      f2fs: allow to mount if cap is 100
      f2fs: add a proc entry show disk layout

Jeffrey Hugo (1):
      f2fs: doc: Fix bouncing email address for Sahitya Tummala

Sheng Yong (1):
      f2fs: compress: fix to check unreleased compressed cluster

Sunmin Jeong (2):
      f2fs: mark inode dirty for FI_ATOMIC_COMMITTED flag
      f2fs: truncate page cache before clearing flags when aborting atomic write

Wenjie Qi (1):
      f2fs: fix NULL pointer dereference in f2fs_submit_page_write()

Wu Bo (1):
      f2fs: check free sections before disable checkpoint

Xiuhong Wang (2):
      f2fs: compress: relocate some judgments in f2fs_reserve_compress_blocks
      f2fs: compress: fix reserve_cblocks counting error when out of space

Zhiguo Niu (8):
      f2fs: compress: remove some redundant codes in f2fs_cache_compressed_page
      f2fs: use IS_INODE replace IS_DNODE in f2fs_flush_inline_data
      f2fs: stop checkpoint when get a out-of-bounds segment
      f2fs: fix to do sanity check in update_sit_entry
      f2fs: fix to check return value __allocate_new_segment
      f2fs: fix to check return value of f2fs_gc_range
      f2fs: unify the error handling of f2fs_is_valid_blkaddr
      f2fs: fix to handle error paths of {new,change}_curseg()

 Documentation/ABI/testing/sysfs-fs-f2fs |  52 ++--
 Documentation/filesystems/f2fs.rst      |  54 ++--
 fs/f2fs/checkpoint.c                    |  74 +++---
 fs/f2fs/compress.c                      |  55 ++--
 fs/f2fs/data.c                          | 191 +++++---------
 fs/f2fs/debug.c                         |  11 +-
 fs/f2fs/dir.c                           |  10 +-
 fs/f2fs/extent_cache.c                  |   5 +-
 fs/f2fs/f2fs.h                          | 241 ++++++++++-------
 fs/f2fs/file.c                          | 171 +++++++-----
 fs/f2fs/gc.c                            | 129 +++++-----
 fs/f2fs/gc.h                            |   4 +-
 fs/f2fs/namei.c                         |  36 +--
 fs/f2fs/node.c                          |  26 +-
 fs/f2fs/node.h                          |   4 +-
 fs/f2fs/recovery.c                      |  56 ++--
 fs/f2fs/segment.c                       | 444 ++++++++++++++++++++------------
 fs/f2fs/segment.h                       |  90 ++++---
 fs/f2fs/super.c                         | 208 +++++----------
 fs/f2fs/sysfs.c                         |  52 +++-
 fs/f2fs/verity.c                        |  16 +-
 include/linux/f2fs_fs.h                 |   8 +-
 22 files changed, 1054 insertions(+), 883 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
