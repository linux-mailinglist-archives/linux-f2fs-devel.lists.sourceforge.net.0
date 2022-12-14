Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 815F564D272
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Dec 2022 23:39:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p5aPY-0007u0-Mm;
	Wed, 14 Dec 2022 22:39:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1p5aPW-0007tu-HV
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Dec 2022 22:39:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ntWk/X/it6Sf4w3U2hbc+t0EZZDICNT5YpcoeqPPiPo=; b=NSLSuF3IhL15D9vRJLS+iXOQXM
 wdV6Qn4rkNvlP9bMPMahl77B8nyCZmLw6fWFMgcNbeTYt3Kt1HNQFOrc8OnBABvVPtKxfS1rMVLef
 bQqb1payjhIY4MHf8OjTOLaRTPo00bOqfGXwFySaAUHb+8ImPomZjbt7BZjh9N6mp+cg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ntWk/X/it6Sf4w3U2hbc+t0EZZDICNT5YpcoeqPPiPo=; b=h
 EWS0+ODf3RUcVujbrs4ZiOCQ12WC9SD9QHP7o9bKFtiS7Y/KelbktuffQ429Tse61hlLXo3kmY/MX
 3zScfapBRaPBXCOVmvWZM3mU+ghx+G/+NVPx4lmg02UN92qQh9TzWlzpnBdv4QHubzj0LDcasfkAM
 V1FPH6Hr5XoMIekQ=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p5aPV-00079F-DP for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Dec 2022 22:39:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 21B16B81A2B;
 Wed, 14 Dec 2022 22:39:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C10A8C433EF;
 Wed, 14 Dec 2022 22:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671057565;
 bh=Di2ZPe2udn9/VzfMzwcmiI7C0GUupTC5E62CQVDZYck=;
 h=Date:From:To:Cc:Subject:From;
 b=amMEOg+rntwdS5vKFvDbAAsz0ZBc3NTRSpZOQGUPPQkZghvyfTOwWpYOsqB20tRMX
 EaBhLiswQgdujhwvwkQG+536FKq2JAcjs5tNBcLqLhg7/n1zSTQ8ySWCl5M0W0UXPm
 6BljjHJRFlPlGZdXNFO7/Dbcm+kYPjggYynFpfdHsegKn2DvclY1kOCT2YNmmEROXx
 l8xTOwD30eLVjBDGIEHwQH1TibV67zod+bh67CL4tT3zBhfzg2s6eIem8ZIZ2QRbZg
 WwyL2EE9yaPY5vSaSQ+h5lImgcEhKGaVAfVL3pOYJ0frLCDk4Q1X3XhjCfWwhMEnFv
 b7szYOvVyp+ww==
Date: Wed, 14 Dec 2022 14:39:24 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <Y5pQnBPCtfPkiCkF@google.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Linus, Could you please consider this pull request? Note
 that, since I attached Reviewed-by to some recent committed patches, they
 show quite new in the git log, but have been soaked in linux-next for a while.
 In addition, one patch on top of the tree [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p5aPV-00079F-DP
Subject: [f2fs-dev] [GIT PULL] f2fs update for 6.2-rc1
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

Note that, since I attached Reviewed-by to some recent committed patches, they
show quite new in the git log, but have been soaked in linux-next for a while.
In addition, one patch on top of the tree is still quite new, but it should be
a low risk of change. Hence, I added.

The following changes since commit bbb8ceb5e2421184db9560e9d2cfaf858e1db616:

  Merge tag 'v6.1-p2' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6 (2022-10-17 10:20:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-6.2-rc1

for you to fetch changes up to 26a8057a1ada97b528b93fdf3ac4fd03170f1900:

  f2fs: reset wait_ms to default if any of the victims have been selected (2022-12-12 15:18:36 -0800)

----------------------------------------------------------------
f2fs-for-6.2-rc1

In this round, we've added two features: 1) F2FS_IOC_START_ATOMIC_REPLACE and
2) per-block age-based extent cache. 1) is a variant of the previous atomic
write feature which guarantees a per-file atomicity. It would be more efficient
than AtomicFile implementation in Android framework. 2) implements another type
of extent cache in memory which keeps the per-block age in a file, so that block
allocator could split the hot and cold data blocks more accurately.

Enhancement:
 - introduce F2FS_IOC_START_ATOMIC_REPLACE
 - refactor extent_cache to add a new per-block-age-based extent cache support
 - introduce discard_urgent_util, gc_mode, max_ordered_discard sysfs knobs
 - add proc entry to show discard_plist info
 - optimize iteration over sparse directories
 - add barrier mount option

Bug fix
 - avoid victim selection from previous victim section
 - fix to enable compress for newly created file if extension matches
 - set zstd compress level correctly
 - initialize locks early in f2fs_fill_super() to fix bugs reported by syzbot
 - correct i_size change for atomic writes
 - allow to read node block after shutdown
 - allow to set compression for inlined file
 - fix gc mode when gc_urgent_high_remaining is 1
 - should put a page when checking the summary info

Minor fixes and various clean-ups in GC, discard, debugfs, sysfs, and doc.

----------------------------------------------------------------
Chao Yu (8):
      f2fs: fix to invalidate dcc->f2fs_issue_discard in error path
      f2fs: support fault injection for f2fs_is_valid_blkaddr()
      f2fs: fix to destroy sbi->post_read_wq in error path of f2fs_fill_super()
      f2fs: fix to avoid accessing uninitialized spinlock
      f2fs: optimize iteration over sparse directories
      f2fs: fix to do sanity check on i_extra_isize in is_alive()
      f2fs: truncate blocks in batch in __complete_revoke_list()
      MAINTAINERS: Add f2fs bug tracker link

Christoph Hellwig (3):
      f2fs: remove struct segment_allocation default_salloc_ops
      f2fs: open code allocate_segment_by_default
      f2fs: remove the unused flush argument to change_curseg

Colin Ian King (1):
      f2fs: Fix spelling mistake in label: free_bio_enrty_cache -> free_bio_entry_cache

Daeho Jeong (2):
      f2fs: correct i_size change for atomic writes
      f2fs: introduce F2FS_IOC_START_ATOMIC_REPLACE

Dongdong Zhang (1):
      f2fs: fix normal discard process

Jaegeuk Kim (11):
      f2fs: let's avoid to get cp_rwsem twice by f2fs_evict_inode by d_invalidate
      f2fs: allow to set compression for inlined file
      f2fs: use sysfs_emit instead of sprintf
      f2fs: add missing bracket in doc
      f2fs: allow to read node block after shutdown
      f2fs: specify extent cache for read explicitly
      f2fs: move internal functions into extent_cache.c
      f2fs: remove unnecessary __init_extent_tree
      f2fs: refactor extent_cache to support for read and more
      f2fs: allocate the extent_cache by default
      f2fs: add block_age-based extent cache

Keoseong Park (1):
      f2fs: Fix typo in comments

Mukesh Ojha (2):
      f2fs: fix the assign logic of iocb
      f2fs: fix the msg data type

Pavel Machek (1):
      f2fs: should put a page when checking the summary info

Sheng Yong (3):
      f2fs: set zstd compress level correctly
      f2fs: fix to enable compress for newly created file if extension matches
      f2fs: move set_file_temperature into f2fs_new_inode

Tetsuo Handa (1):
      f2fs: initialize locks earlier in f2fs_fill_super()

Yangtao Li (22):
      f2fs: remove batched_trim_sections node
      f2fs: fix gc mode when gc_urgent_high_remaining is 1
      f2fs: cleanup in f2fs_create_flush_cmd_control()
      f2fs: add barrier mount option
      f2fs: introduce max_ordered_discard sysfs node
      f2fs: fix return val in f2fs_start_ckpt_thread()
      f2fs: introduce gc_mode sysfs node
      f2fs: replace gc_urgent_high_remaining with gc_remaining_trials
      f2fs: add proc entry to show discard_plist info
      f2fs: fix to set flush_merge opt and show noflush_merge
      f2fs: remove submit label in __submit_discard_cmd()
      f2fs: fix description about discard_granularity node
      f2fs: make __queue_discard_cmd() return void
      f2fs: init discard policy after thread wakeup
      f2fs: define MIN_DISCARD_GRANULARITY macro
      f2fs: introduce discard_urgent_util sysfs node
      f2fs: do some cleanup for f2fs module init
      f2fs: remove F2FS_SET_FEATURE() and F2FS_CLEAR_FEATURE() macro
      f2fs: introduce f2fs_is_readonly() for readability
      f2fs: fix iostat parameter for discard
      f2fs: don't call f2fs_issue_discard_timeout() when discard_cmd_cnt is 0 in f2fs_put_super()
      f2fs: fix some format WARNING in debug.c and sysfs.c

Yonggil Song (1):
      f2fs: avoid victim selection from previous victim section

Yuwei Guan (4):
      f2fs: fix to alloc_mode changed after remount on a small volume device
      f2fs: cleanup for 'f2fs_tuning_parameters' function
      f2fs: change type for 'sbi->readdir_ra'
      f2fs: reset wait_ms to default if any of the victims have been selected

Zhang Qilong (1):
      f2fs: Fix the race condition of resize flag between resizefs

wangkailong@jari.cn (1):
      f2fs: replace ternary operator with max()

 Documentation/ABI/testing/sysfs-fs-f2fs |  47 ++-
 Documentation/filesystems/f2fs.rst      |  13 +-
 MAINTAINERS                             |   1 +
 fs/f2fs/checkpoint.c                    |   9 +-
 fs/f2fs/compress.c                      |  48 +--
 fs/f2fs/data.c                          |  54 +--
 fs/f2fs/debug.c                         | 131 ++++--
 fs/f2fs/dir.c                           |  36 +-
 fs/f2fs/extent_cache.c                  | 693 +++++++++++++++++++++++---------
 fs/f2fs/f2fs.h                          | 278 +++++++------
 fs/f2fs/file.c                          |  46 ++-
 fs/f2fs/gc.c                            |  79 ++--
 fs/f2fs/inode.c                         |  20 +-
 fs/f2fs/namei.c                         | 391 +++++++++---------
 fs/f2fs/node.c                          |  19 +-
 fs/f2fs/node.h                          |   3 +-
 fs/f2fs/recovery.c                      |   4 +-
 fs/f2fs/segment.c                       | 201 +++++----
 fs/f2fs/segment.h                       |   6 -
 fs/f2fs/shrinker.c                      |  25 +-
 fs/f2fs/super.c                         | 126 +++---
 fs/f2fs/sysfs.c                         | 164 ++++++--
 include/trace/events/f2fs.h             | 176 ++++++--
 include/uapi/linux/f2fs.h               |   1 +
 24 files changed, 1643 insertions(+), 928 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
