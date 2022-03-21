Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DF44E31F5
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Mar 2022 21:39:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nWOgd-0005TA-Cn; Mon, 21 Mar 2022 20:39:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nWOgc-0005T3-JL
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 21 Mar 2022 20:39:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P5IiYJ8yKUIC5LO/2dXsAciXD+li1bRWQHRWzFNB4BA=; b=bZcTJjP2+9sO9hFh1Ki5ochUiC
 Q9UAjbFaoYTYD62z/NAI4lBPrbg5yywQRX6UinYBaZHcpgGnfwikvA8mioAfhfuCaBxJUmiJAz4M2
 zLM19SYORTYa0URTC3kGRvZage+R6wvcWRA/jOfNvsZsgdrb5MHKFlvjCawklWADKWZ8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=P5IiYJ8yKUIC5LO/2dXsAciXD+li1bRWQHRWzFNB4BA=; b=I
 qlDcp7igIpxD7hdADeMcSDxNu7YUMznERacZ7toN7KcbhiYJGDRGDtOPLJZbom1Xet7FDzDFCeJXe
 hS78NSXVSRE87I4A2sBroqwMJyhl7sDathmjDuNgCoWGVuibnBxHWWN9fO8achYHSgqJIB/3AWcTi
 8nFwqhybHcq4fsjM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nWOoX-0079mR-EY
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 21 Mar 2022 20:39:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4A51261224;
 Mon, 21 Mar 2022 20:39:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97A26C340E8;
 Mon, 21 Mar 2022 20:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647895173;
 bh=y7g4//qbSpEtgblpCFF3s9kIPm6pzICsJ7vhm6u/aQs=;
 h=Date:From:To:Cc:Subject:From;
 b=IO7xIvdk8tJoMtmAmb1PeEcpR/MYnA6+V07fPbtqicCkA7qP8DvJibzGEOO3vO6QS
 k7PjTY7+O54XW7S/bxYNH8TVgfVfsMCefGzujf9tqunEmv2v4UMDp0HRtyuXGxGddx
 MMbSLsM/xk617nqiNvdWRLxMEDr8BvrD7aY4ILcGhe6RU1ZXzo1ClAw2eKYKncAHDR
 vjtQ7vUn+WDIcQgrPKmSiKHlw+C44xoXZ+iKQu+cszsjV1OuXf7IZ5QpGfBzPKhkFO
 mw1jZUPnkAlF5VdHARaymR9PEbH2nwD39JknVIduorzk//0EGPaBQ/DgbHC2mKazxg
 QHWo+p62Zqsrw==
Date: Mon, 21 Mar 2022 13:39:32 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <YjjihIZuvZpUjaSs@google.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -6.4 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Linus, Could you please consider this pull request? Thanks,
 Content analysis details:   (-6.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nWOoX-0079mR-EY
Subject: [f2fs-dev] [GIT PULL] f2fs for 5.18
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

The following changes since commit dd81e1c7d5fb126e5fbc5c9e334d7b3ec29a16a0:

  Merge tag 'powerpc-5.17-2' of git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux (2022-01-23 17:52:42 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-5.18

for you to fetch changes up to 5b5b4f85b01604389f7a0f11ef180a725bf0e2d4:

  f2fs: fix to do sanity check on .cp_pack_total_block_count (2022-03-21 09:10:21 -0700)

----------------------------------------------------------------
f2fs-for-5.18

In this cycle, f2fs has some performance improvements for Android workloads such
as using read-unfair rwsems and adding some sysfs entries to control GCs and
discard commands in more details. In addtiion, it has some tunings to improve
the recovery speed after sudden power-cut.

Enhancement:
 - add reader-unfair rwsems with F2FS_UNFAIR_RWSEM
  : will replace with generic API support
 - adjust to make the readahead/recovery flow more efficiently
 - sysfs entries to control issue speeds of GCs and Discard commands
 - enable idmapped mounts

Bug fix:
 - correct wrong error handling routines
 - fix missing conditions in quota
 - fix a potential deadlock between writeback and block plug routines
 - fix a deadlock btween freezefs and evict_inode

We've added some boundary checks to avoid kernel panics on corrupted images,
and several minor code clean-ups.

----------------------------------------------------------------
Bart Van Assche (1):
      f2fs: Restore rwsem lockdep support

Chao Yu (11):
      f2fs: fix to enable ATGC correctly via gc_idle sysfs interface
      f2fs: fix to unlock page correctly in error path of is_alive()
      f2fs: adjust readahead block number during recovery
      f2fs: introduce F2FS_IPU_HONOR_OPU_WRITE ipu policy
      f2fs: support idmapped mounts
      f2fs: fix to avoid potential deadlock
      f2fs: fix to do sanity check on curseg->alloc_type
      f2fs: compress: fix to print raw data size in error path of lz4 decompression
      f2fs: initialize sbi->gc_mode explicitly
      f2fs: use aggressive GC policy during f2fs_disable_checkpoint()
      f2fs: fix to do sanity check on .cp_pack_total_block_count

Daeho Jeong (2):
      f2fs: introduce gc_urgent_mid mode
      f2fs: make gc_urgent and gc_segment_mode sysfs node readable

Fengnan Chang (1):
      f2fs: fix compressed file start atomic write may cause data corruption

Jaegeuk Kim (6):
      f2fs: add a way to limit roll forward recovery time
      f2fs: fix missing free nid in f2fs_handle_failed_inode
      f2fs: avoid an infinite loop in f2fs_sync_dirty_inodes
      f2fs: introduce F2FS_UNFAIR_RWSEM to support unfair rwsem
      f2fs: don't get FREEZE lock in f2fs_evict_inode in frozen fs
      f2fs: use spin_lock to avoid hang

Jia Yang (1):
      f2fs: remove unnecessary read for F2FS_FITS_IN_INODE

Juhyung Park (1):
      f2fs: quota: fix loop condition at f2fs_quota_sync()

Konstantin Vyshetsky (2):
      f2fs: move discard parameters into discard_cmd_control
      f2fs: expose discard related parameters in sysfs

Tim Murray (1):
      f2fs: move f2fs to use reader-unfair rwsems

Wang Xiaojun (1):
      f2fs: remove redundant parameter judgment

 Documentation/ABI/testing/sysfs-fs-f2fs |  54 ++++++++--
 fs/f2fs/Kconfig                         |   7 ++
 fs/f2fs/acl.c                           |  21 ++--
 fs/f2fs/checkpoint.c                    |  58 +++++++----
 fs/f2fs/compress.c                      |  11 +-
 fs/f2fs/data.c                          |  76 ++++++++------
 fs/f2fs/debug.c                         |  25 +++--
 fs/f2fs/dir.c                           |  12 +--
 fs/f2fs/f2fs.h                          | 154 +++++++++++++++++++++++-----
 fs/f2fs/file.c                          | 175 ++++++++++++++++----------------
 fs/f2fs/gc.c                            |  53 +++++-----
 fs/f2fs/inline.c                        |   4 +-
 fs/f2fs/inode.c                         |   7 +-
 fs/f2fs/namei.c                         |  78 +++++++-------
 fs/f2fs/node.c                          |  92 +++++++++--------
 fs/f2fs/node.h                          |   3 +
 fs/f2fs/recovery.c                      |  35 ++++++-
 fs/f2fs/segment.c                       |  73 +++++++------
 fs/f2fs/segment.h                       |   5 +-
 fs/f2fs/super.c                         |  91 ++++++++++-------
 fs/f2fs/sysfs.c                         |  40 +++++++-
 fs/f2fs/verity.c                        |   4 +-
 fs/f2fs/xattr.c                         |  12 +--
 23 files changed, 699 insertions(+), 391 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
