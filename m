Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC6E372392
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 May 2021 01:25:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ldhw8-00023k-F8; Mon, 03 May 2021 23:25:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1ldhw7-00023d-E7
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 03 May 2021 23:25:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mVMAG5BKJ9NnFJxSAtX0NztuE6gmbyxdkfYiRcWj1oU=; b=PKsyDXKNIlYCrNSFgwpymnpd3n
 K3z9K2xK3/vtGo1ZG+NXUbA00JvbAlLA1mN3U5ljKXjYARl20aVrFe9qD4M4gI/+FCp00+Suh70X6
 7TEjJUnO7+MdTLe74D8hyGYUfgyNES/irqi531PZM4cdQi0ooe7FlcqXC+cAJCXg7yxQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=mVMAG5BKJ9NnFJxSAtX0NztuE6gmbyxdkfYiRcWj1oU=; b=e
 mHCYJQJtxsqzr7isCIrKKc+PtZ2xbsRt7jPF95BEEL3fUyknj93a+Z1WgI6wlYPVjqAJdq0c+rpXK
 TacI/uJv70EgOvG+Z/ybgqsmveBReiQRomHV/GmrYQMgEvMudmD1yWx2p1+5O610SUd6J4Ce/GgtG
 Cb8jijzCzhsQPTVI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1ldhw3-0001iQ-SX
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 03 May 2021 23:25:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B0543610A2;
 Mon,  3 May 2021 23:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620084298;
 bh=N5zOlncN9R5ag0CV77uw5WYaavEVXPWnViy/gewguUc=;
 h=Date:From:To:Cc:Subject:From;
 b=LIvfhx2OV9Ct22PRwwteGn8nMaODzqYVnXQ1R4n08WEghw4bM66kKs2VCABd5Zqq5
 fa9qYX7JaJvaI0LmBKJGf7F7nkhP8MCaSav0DdrYuIm3mz5KkTYRO9fPKp84ov3kf/
 qvBnrIKSwPlDcKmrCGxHp9Y3T/tGUd7pJ00GENBA6HYQtcBReqnmvMMU+CvIRZC+xU
 n5y+6hXQiF2gEz9rb+SKcgh+fiCcjtFp8vjtJlO5UlGOeeLPnb9SjdcjHwgFsbS/mW
 olnAo0JCu10hpcVLZzXF3A/rTgIOsc1FnMUM+lJVx0OToZNt99SIcJZmvYRv6omJZP
 2h1YXrHl0lmgw==
Date: Mon, 3 May 2021 16:24:57 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <YJCGSeyA7XoNcyZT@google.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ldhw3-0001iQ-SX
Subject: [f2fs-dev] [GIT PULL] f2fs update for 5.13-rc1
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

The following changes since commit 344178334b0971a1ad5f36b76d7b739400e46ec6:

  Merge tag 'sound-5.12-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound (2021-03-12 12:01:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-5.13-rc1

for you to fetch changes up to 9557727876674893d35940fddbd03d3b505e7ed8:

  f2fs: drop inplace IO if fs status is abnormal (2021-04-26 09:50:39 -0700)

----------------------------------------------------------------
f2fs-for-5.13-rc1

In this round, we added a new mount option, "checkpoint_merge", which introduces
a kernel thread dealing with the f2fs checkpoints. Once we start to manage the
IO priority along with blk-cgroup, the checkpoint operation can be processed in
a lower priority under the process context. Since the checkpoint holds all the
filesystem operations, we give a higher priority to the checkpoint thread all
the time.

Enhancement:
- introduce gc_merge mount option to introduce a checkpoint thread
- improve to run discard thread efficiently
- allow modular compression algorithms
- expose # of overprivision segments to sysfs
- expose runtime compression stat to sysfs

Bug fix:
- fix OOB memory access by the node id lookup
- avoid touching checkpointed data in the checkpoint-disabled mode
- fix the resizing flow to avoid kernel panic and race conditions
- fix block allocation issues on pinned files
- address some swapfile issues
- fix hugtask problem and kernel panic during atomic write operations
- don't start checkpoint thread in RO

And, we've cleaned up some kernel coding style and build warnings. In addition,
we fixed some minor race conditions and error handling routines.

----------------------------------------------------------------
Chao Yu (25):
      f2fs: fix to allow migrating fully valid segment
      f2fs: fix panic during f2fs_resize_fs()
      f2fs: avoid unused f2fs_show_compress_options()
      f2fs: remove unused FORCE_FG_GC macro
      f2fs: update comments for explicit memory barrier
      f2fs: check discard command number before traversing discard pending list
      f2fs: remove unused file_clear_encrypt()
      f2fs: fix to align to section for fallocate() on pinned file
      f2fs: don't start checkpoint thread in readonly mountpoint
      f2fs: fix to avoid out-of-bounds memory access
      f2fs: fix error path of f2fs_remount()
      f2fs: fix to update last i_size if fallocate partially succeeds
      f2fs: fix to avoid touching checkpointed data in get_victim()
      f2fs: delete empty compress.h
      f2fs: fix to cover __allocate_new_section() with curseg_lock
      f2fs: introduce gc_merge mount option
      f2fs: fix to restrict mount condition on readonly block device
      f2fs: fix to avoid GC/mmap race with f2fs_truncate()
      f2fs: fix to avoid accessing invalid fio in f2fs_allocate_data_block()
      f2fs: document: add description about compressed space handling
      f2fs: avoid duplicated codes for cleanup
      f2fs: avoid using native allocate_segment_by_default()
      f2fs: clean up left deprecated IO trace codes
      f2fs: compress: remove unneed check condition
      f2fs: drop inplace IO if fs status is abnormal

Chengguang Xu (1):
      f2fs: fix to use per-inode maxbytes in f2fs_fiemap

Colin Ian King (1):
      f2fs: fix a redundant call to f2fs_balance_fs if an error occurs

Daeho Jeong (1):
      f2fs: add sysfs nodes to get runtime compression stat

Eric Biggers (1):
      f2fs: fix error handling in f2fs_end_enable_verity()

Geert Uytterhoeven (1):
      f2fs: compress: Allow modular (de)compression algorithms

Gustavo A. R. Silva (1):
      f2fs: Replace one-element array with flexible-array member

Jaegeuk Kim (2):
      f2fs: expose # of overprivision segments
      f2fs: set checkpoint_merge by default

Ruiqi Gong (1):
      f2fs: fix a typo in inode.c

Sahitya Tummala (2):
      f2fs: allow to change discard policy based on cached discard cmds
      f2fs: fix the periodic wakeups of discard thread

Wan Jiabing (1):
      f2fs: remove unnecessary struct declaration

Wang Xiaojun (1):
      f2fs: fix wrong alloc_type in f2fs_do_replace_block

Weichao Guo (1):
      f2fs: do not use AT_SSR mode in FG_GC & high urgent BG_GC

Yi Chen (1):
      f2fs: fix to avoid NULL pointer dereference

Yi Zhuang (2):
      f2fs: Fix a hungtask problem in atomic write
      f2fs: clean up build warnings

huangjianan@oppo.com (3):
      f2fs: remove unnecessary IS_SWAPFILE check
      f2fs: fix last_lblock check in check_swap_activate_fast
      f2fs: check if swapfile is section-alligned

jiahao (1):
      f2fs: fix a spacing coding style

qiulaibin (1):
      f2fs: fix wrong comment of nat_tree_lock

xuyehan (1):
      f2fs: fix a spelling error

 Documentation/ABI/testing/sysfs-fs-f2fs |  31 +++++-
 Documentation/filesystems/f2fs.rst      |  14 +++
 fs/f2fs/Kconfig                         |  16 ++-
 fs/f2fs/acl.c                           |   1 +
 fs/f2fs/checkpoint.c                    |   9 +-
 fs/f2fs/compress.c                      |  15 +--
 fs/f2fs/compress.h                      |   0
 fs/f2fs/data.c                          | 125 ++++++++++++++++++----
 fs/f2fs/debug.c                         |   3 +
 fs/f2fs/dir.c                           |   1 +
 fs/f2fs/f2fs.h                          |  55 ++++++----
 fs/f2fs/file.c                          |  51 +++++----
 fs/f2fs/gc.c                            |  95 +++++++++++++----
 fs/f2fs/gc.h                            |   6 ++
 fs/f2fs/inline.c                        |   3 +-
 fs/f2fs/inode.c                         |   3 +-
 fs/f2fs/namei.c                         |   3 +
 fs/f2fs/node.c                          |  19 +++-
 fs/f2fs/node.h                          |   1 +
 fs/f2fs/recovery.c                      |   3 +-
 fs/f2fs/segment.c                       | 184 +++++++++++++++++++++++---------
 fs/f2fs/segment.h                       |  16 ++-
 fs/f2fs/super.c                         | 102 +++++++++++++-----
 fs/f2fs/sysfs.c                         |  47 ++++++++
 fs/f2fs/verity.c                        |  75 +++++++++----
 fs/f2fs/xattr.c                         |   1 +
 include/linux/f2fs_fs.h                 |   2 +-
 27 files changed, 660 insertions(+), 221 deletions(-)
 delete mode 100644 fs/f2fs/compress.h


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
