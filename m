Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2593982B4BE
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Jan 2024 19:28:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rNzmw-0006fI-Jt;
	Thu, 11 Jan 2024 18:28:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rNzmv-0006fC-Cq
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Jan 2024 18:28:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rBHoygIUjTHKCaMek3FTcf4j9b349OvB4SXMR9VthH4=; b=c0ivL6yo/H5JjqbX2Xduy4/kcH
 71UGD47oCrjGXKyqnYptkSoKtcKl/KgflB50gtjHFwvdm6TDpmem+c0aJgpAQ+mk9PAd4fxvqXFur
 k4ixa4a46X9qXMdeBvkpgC30qEMmiAuRhuNBrJ1yz98ROeoUbzlq7qme2xz4eGgRXGIU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=rBHoygIUjTHKCaMek3FTcf4j9b349OvB4SXMR9VthH4=; b=B
 hhoHwqtotoIy62e9iGiHLGuOk6q2rNPsjgDO3KAM3Gi170m11/+9+BYS0i9Ogw8r7lg2DAoUYtDyP
 AYcqhOdRiWWMGkqFyvte+RswKTFHxykjg46ZJeZuijZ0elzVJCO3Png3Ug6eWEYEUXHYJ1vOMtryA
 aM43LFqcyyZFYyug=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rNzms-0000pj-Ta for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Jan 2024 18:28:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id DF342B820C1;
 Thu, 11 Jan 2024 18:28:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25A32C43390;
 Thu, 11 Jan 2024 18:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704997692;
 bh=O1JrLIUB6Kvam8m8FN9/RwfK/9ti74DZSsh90LyxUbw=;
 h=Date:From:To:Cc:Subject:From;
 b=K2GvxO0VnDftR2wRlz0ZC3pH6KEzQ/Je9I59cnKidcPgPPMpWD0XjipWrzs8jYVZ1
 msBif1ifaCeFRViVvk3aGwRRGbe73aKX5d3GHMTZSwY5LO75e4ikZhuw3jyK5UDMPJ
 DhJyrJjxbta4njaDL4nTX+S2WHHQrASos6Mn1f0h+zcsNXCCqFijd0yRQyRpK2F8PH
 T7QWi8RTS2c5MbrJxl6gyThtCNX6IYcvT6xPrvYmzndxGZT9+9fe/+OjCkT5Gw+QC5
 vsixTrKsHLr5PMDl7zMELOZcPFcoOiP5YsiL1oavbK3oGK0w0GWdKRvVa+8O/ISxqB
 pmQBu++Z3CaeQ==
Date: Thu, 11 Jan 2024 10:28:10 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <ZaAzOgd3iWL0feTU@google.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -5.0 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Linus, Happy new year! Could you please consider this pull
 request? 
 Content analysis details:   (-5.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rNzms-0000pj-Ta
Subject: [f2fs-dev] [GIT PULL] f2fs update for 6.8-rc1
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

Happy new year!

Could you please consider this pull request?

Thank you.

The following changes since commit 6bc40e44f1ddef16a787f3501b97f1fff909177c:

  Merge tag 'ovl-fixes-6.7-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/overlayfs/vfs (2023-11-17 09:18:48 -0500)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-6.8-rc1

for you to fetch changes up to c3c2d45b9050180974e35ec8672c6e788adc236a:

  f2fs: show more discard status by sysfs (2023-12-26 13:07:26 -0800)

----------------------------------------------------------------
f2fs update for 6.8-rc1

In this series, we've some progress to support Zoned block device regarding to
the power-cut recovery flow and enabling checkpoint=disable feature which is
essential for Android OTA. Other than that, some patches touched sysfs entries
and tracepoints which are minor, while several bug fixes on error handlers and
compression flows are good to improve the overall stability.

Enhancement:
 - enable checkpoint=disable for zoned block device
 - sysfs entries such as discard status, discard_io_aware, dir_level
 - tracepoints such as f2fs_vm_page_mkwrite(), f2fs_rename(), f2fs_new_inode()
 - use shared inode lock during f2fs_fiemap() and f2fs_seek_block()

Bug fix:
 - address some power-cut recovery issues on zoned block device
 - handle errors and logics on do_garbage_collect(), f2fs_reserve_new_block(),
   f2fs_move_file_range(), f2fs_recover_xattr_data()
 - don't set FI_PREALLOCATED_ALL for partial write
 - fix to update iostat correctly in f2fs_filemap_fault()
 - fix to wait on block writeback for post_read case
 - fix to tag gcing flag on page during block migration
 - restrict max filesize for 16K f2fs
 - fix to avoid dirent corruption
 - explicitly null-terminate the xattr list

There are also several clean-up patches to remove dead codes and better
readability.

----------------------------------------------------------------
Chao Yu (18):
      f2fs: clean up w/ dotdot_name
      f2fs: use shared inode lock during f2fs_fiemap()
      f2fs: fix to check return value of f2fs_reserve_new_block()
      f2fs: fix to avoid dirent corruption
      f2fs: introduce tracepoint for f2fs_rename()
      f2fs: show i_mode in trace_f2fs_new_inode()
      f2fs: sysfs: support discard_io_aware
      f2fs: delete obsolete FI_FIRST_BLOCK_WRITTEN
      f2fs: delete obsolete FI_DROP_CACHE
      f2fs: introduce get_dnode_addr() to clean up codes
      f2fs: update blkaddr in __set_data_blkaddr() for cleanup
      f2fs: introduce f2fs_invalidate_internal_cache() for cleanup
      f2fs: add tracepoint for f2fs_vm_page_mkwrite()
      f2fs: fix to tag gcing flag on page during block migration
      f2fs: fix to wait on block writeback for post_read case
      f2fs: fix to check compress file in f2fs_move_file_range()
      f2fs: fix to update iostat correctly in f2fs_filemap_fault()
      f2fs: don't set FI_PREALLOCATED_ALL for partial write

Daniel Rosenberg (1):
      f2fs: Restrict max filesize for 16K f2fs

Eric Biggers (1):
      f2fs: explicitly null-terminate the xattr list

Jaegeuk Kim (6):
      f2fs: skip adding a discard command if exists
      f2fs: allow checkpoint=disable for zoned block device
      f2fs: allocate new section if it's not new
      f2fs: fix write pointers on zoned device after roll forward
      f2fs: check write pointers when checkpoint=disable
      f2fs: let's finish or reset zones all the time

Kevin Hao (1):
      f2fs: Use wait_event_freezable_timeout() for freezable kthread

Yang Hubin (1):
      f2fs: the name of a struct is wrong in a comment.

Yongpeng Yang (2):
      f2fs: Constrain the modification range of dir_level in the sysfs
      f2fs: Add error handling for negative returns from do_garbage_collect

Zhiguo Niu (2):
      f2fs: fix to check return value of f2fs_recover_xattr_data
      f2fs: show more discard status by sysfs

zhangxirui (1):
      f2fs: use inode_lock_shared instead of inode_lock in f2fs_seek_block()

 Documentation/ABI/testing/sysfs-fs-f2fs |  21 +++++
 fs/f2fs/compress.c                      |   6 +-
 fs/f2fs/data.c                          |  48 ++++-------
 fs/f2fs/f2fs.h                          |  46 +++++++----
 fs/f2fs/file.c                          |  66 +++++++--------
 fs/f2fs/gc.c                            |  16 ++--
 fs/f2fs/inode.c                         |  57 ++++---------
 fs/f2fs/namei.c                         |  23 +++---
 fs/f2fs/node.c                          |   6 +-
 fs/f2fs/recovery.c                      |  25 ++++--
 fs/f2fs/segment.c                       | 138 +++++++++++---------------------
 fs/f2fs/super.c                         |  16 ++--
 fs/f2fs/sysfs.c                         |  50 ++++++++++++
 fs/f2fs/xattr.c                         |  17 +++-
 include/linux/f2fs_fs.h                 |   2 +-
 include/trace/events/f2fs.h             | 127 +++++++++++++++++++++++++----
 16 files changed, 395 insertions(+), 269 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
