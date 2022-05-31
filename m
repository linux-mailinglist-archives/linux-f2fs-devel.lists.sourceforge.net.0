Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D43C539862
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 31 May 2022 23:02:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nw90J-0001C3-6N; Tue, 31 May 2022 21:02:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nw90I-0001Bx-GL
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 31 May 2022 21:02:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KyY+pZZvxKrB/6wKRYHAhwqkeKBOnXfo5Q/E4NVu5nU=; b=hBgp2d0p/azb8bG22X9kwTx6Kv
 opjM/itjYSlbzlxMguWPp7FDfuQYsNBMzeIrFpWAzmQn5s/7ZNHdWI/rqzAZaVXpluFToswvfPtoq
 Lybj+5xRMF+E21RYxZ3hxADX+7ovtQ5aOFBeaM3ofyq5/uv+LYs9/7nc39zRtJD8GbV0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=KyY+pZZvxKrB/6wKRYHAhwqkeKBOnXfo5Q/E4NVu5nU=; b=G
 MtWfDN/C6hLFRthdoeqS7Jbl2N2cACOsRRFn+FMUt2k84z0dln0Si6B0JWljSw427o7WTQmMTSq8w
 E9g8hbUrkELOEGG5/0fk6Dr54ib0TJ/podXQxdbw1ozhgoK7Ax70E4kE9QN3XbtzWruG3rwrcxBN+
 eYWfl7XCJsihO5bw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nw90D-0007Ur-4F
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 31 May 2022 21:02:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 192B861329;
 Tue, 31 May 2022 21:02:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62D15C385A9;
 Tue, 31 May 2022 21:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654030924;
 bh=zimXZZGRYReHBNE2SVCnLEGfZzXqmrfhmRSoT8zU2z0=;
 h=Date:From:To:Cc:Subject:From;
 b=oe8biq0UdICPQEUrWhL4com6oFsfxX7JQZ6n1lKum1VLmhnL5aW7dvr0Y/vZErCo+
 Q9vEXDkSLvy7RwM0cP+9mFM5hRuDo7V4WifUzWPgGzAa8BBqWedLASGA5W1hMR1BRu
 vkWiEcZYJHwQmCXEtwOLF0FpJE7UvVA+cmn4spF/346CGwZLydxlhgghEMD0lVxvD+
 p+HVQ5DF2d88YYhrCY+wGevhl4b5iHv40RQ1gDgNVUCswKWTvCOFgrdK/aTcv8NVhW
 V+eJ72ku6BtwZiO5NZsp1jR22b9CkktOyOG9WTqOYoEp4/4Icbwd5xEWxMGRv22oJQ
 0jt+JhdQxYgew==
Date: Tue, 31 May 2022 14:02:02 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <YpaCSoxxcWCqo8FQ@google.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Linus, Could you please consider this pull request? Thanks,
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nw90D-0007Ur-4F
Subject: [f2fs-dev] [GIT PULL] f2fs for 5.19
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

The following changes since commit d615b5416f8a1afeb82d13b238f8152c572d59c0:

  Merge tag 'f2fs-fix-5.18' of git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs (2022-04-25 10:53:56 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-5.19-rc1

for you to fetch changes up to 2d1fe8a86bf5e0663866fd0da83c2af1e1b0e362:

  f2fs: fix to tag gcing flag on page during file defragment (2022-05-27 13:58:42 -0700)

----------------------------------------------------------------
f2fs-for-5.19

In this round, we've refactored the existing atomic write support implemented
by in-memory operations to have storing data in disk temporarily, which can give
us a benefit to accept more atomic writes. At the same time, we removed the
existing volatile write support. We've also revisited the file pinning and GC
flows and found some corner cases which contributeed abnormal system behaviours.
As usual, there're several minor code refactoring for readability, sanity check,
and clean ups.

Enhancement
 - allow compression for mmap files in compress_mode=user
 - kill volatile write support
 - change the current atomic write way
 - give priority to select unpinned section for foreground GC
 - introduce data read/write showing path info
 - remove unnecessary f2fs_lock_op in f2fs_new_inode

Bug fix
 - fix the file pinning flow during checkpoint=disable and GCs
 - fix foreground and background GCs to select the right victims and get free
   sections on time
 - fix GC flags on defragmenting pages
 - avoid an infinite loop to flush node pages
 - fix fallocate to use file_modified to update permissions consistently

----------------------------------------------------------------
Byungki Lee (1):
      f2fs: write checkpoint during FG_GC

Chao Liu (1):
      f2fs: make f2fs_read_inline_data() more readable

Chao Yu (13):
      f2fs: check pinfile in gc_data_segment() in advance
      f2fs: don't set GC_FAILURE_PIN for background GC
      f2fs: fix to do sanity check on inline_dots inode
      f2fs: fix to clear dirty inode in f2fs_evict_inode()
      f2fs: fix to avoid f2fs_bug_on() in dec_valid_node_count()
      f2fs: fix to do sanity check on block address in f2fs_do_zero_range()
      f2fs: fix deadloop in foreground GC
      f2fs: fix to do sanity check on total_data_blocks
      f2fs: give priority to select unpinned section for foreground GC
      f2fs: fix fallocate to use file_modified to update permissions consistently
      f2fs: fix to do sanity check for inline inode
      f2fs: avoid unneeded error handling for revoke_entry_slab allocation
      f2fs: fix to tag gcing flag on page during file defragment

Daeho Jeong (1):
      f2fs: change the current atomic write way

Dongliang Mu (1):
      f2fs: remove WARN_ON in f2fs_is_valid_blkaddr

Eric Biggers (2):
      f2fs: reject test_dummy_encryption when !CONFIG_FS_ENCRYPTION
      f2fs: don't use casefolded comparison for "." and ".."

Jaegeuk Kim (10):
      f2fs: remove unnecessary f2fs_lock_op in f2fs_new_inode
      f2fs: introduce data read/write showing path info
      f2fs: use flush command instead of FUA for zoned device
      f2fs: avoid infinite loop to flush node pages
      f2fs: stop allocating pinned sections if EAGAIN happens
      f2fs: don't need inode lock for system hidden quota
      f2fs: kill volatile write support
      f2fs: introduce f2fs_gc_control to consolidate f2fs_gc parameters
      f2fs: keep wait_ms if EAGAIN happens
      f2fs: do not stop GC when requiring a free section

Jakob Koschel (3):
      f2fs: fix dereference of stale list iterator after loop body
      f2fs: Remove usage of list iterator pas the loop for list_move_tail()
      f2fs: replace usage of found with dedicated list iterator variable

Julia Lawall (1):
      f2fs: fix typo in comment

Luis Chamberlain (2):
      f2fs: call bdev_zone_sectors() only once on init_blkz_info()
      f2fs: ensure only power of 2 zone sizes are allowed

Niels Dossche (1):
      f2fs: extend stat_lock to avoid potential race in statfs

Sungjong Seo (1):
      f2fs: allow compression for mmap files in compress_mode=user

Weichao Guo (1):
      f2fs: skip GC if possible when checkpoint disabling

Yufen Yu (2):
      f2fs: add f2fs_init_write_merge_io function
      f2fs: replace F2FS_I(inode) and sbi by the local variable

 fs/f2fs/checkpoint.c        |  16 +-
 fs/f2fs/data.c              | 213 +++++++++++++-------
 fs/f2fs/debug.c             |  18 +-
 fs/f2fs/dir.c               |   3 +-
 fs/f2fs/f2fs.h              | 133 ++++++-------
 fs/f2fs/file.c              | 307 +++++++++++++----------------
 fs/f2fs/gc.c                | 186 ++++++++++++------
 fs/f2fs/hash.c              |  11 +-
 fs/f2fs/inline.c            |  29 ++-
 fs/f2fs/inode.c             |  34 ++--
 fs/f2fs/namei.c             |  38 ++--
 fs/f2fs/node.c              |  29 ++-
 fs/f2fs/node.h              |   1 -
 fs/f2fs/segment.c           | 460 +++++++++++++++++---------------------------
 fs/f2fs/segment.h           |  40 ++--
 fs/f2fs/super.c             |  88 ++++-----
 fs/f2fs/verity.c            |   2 +-
 include/trace/events/f2fs.h | 141 +++++++++++---
 18 files changed, 926 insertions(+), 823 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
