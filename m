Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C67A049322B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Jan 2022 02:11:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1n9zVK-0006rU-Hd; Wed, 19 Jan 2022 01:11:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1n9zVJ-0006rN-Ml
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Jan 2022 01:11:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hgejKEXtIT96OqKH18ONvQqURAqBzKbc60N1o1XawDE=; b=kv9yfEugRPePl+1lkUEtLMMrfE
 2Kx0JUzFxrTz3mGWjOi21KAuq2qJtApFF9va/x3FYi6w31LnkG8LUFbxlH6QUqcNw0XJf//lc75vl
 itRw55YhB6z3KOaEOiRkyQoEr3KCkdyOq+5ucdVyGSMu0a+/IDnLETdIQeDrQxc++PEg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=hgejKEXtIT96OqKH18ONvQqURAqBzKbc60N1o1XawDE=; b=P
 QloD/SKmdtRnxAbHtYf4CzmVm7KgbpGdp4TMq7AZI+LIxW3LvMz7Cwezg4Ytu0WaXYNARg2O2qKis
 dO37Idsw65cQwI0AyrzoFFNp6+bQxNH/Yn72rHvTW6kOgip/OFkqRdtigUhAOf3cqqKIb6Fsq//Oq
 Lek4D60NkmIuxbTo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1n9zVB-000820-R8
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Jan 2022 01:11:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 87547614D9;
 Wed, 19 Jan 2022 01:10:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6AAAC340E0;
 Wed, 19 Jan 2022 01:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642554655;
 bh=L1emoT2JOCxKxebRi7Jb6xfIULWVJUwDe1hefYltELs=;
 h=Date:From:To:Cc:Subject:From;
 b=tT8sBap/Ew0TeE/Rn/AiIxbj5kmqgTN3/4NepTVSZ/QbjGGACNeuXbJawRbPJhyE9
 kIhzG/jfgBf972E4yq6/4z6oyV87WVIQ1lO2FgBWSeeWHL6g0W9yZFsQpY9PaQd2hU
 5ZF+YFNECCELCmpRRvliZF0bZelAscRl3RLbbwRm37jCq0eECR8DQ+KFUnRQwW0eqR
 R4IkwV+jet8/sulw3Qy0jkpSiIMIeNz09AYJtlUHCH1iY00v9yV5Cpt1mea87wWIOu
 OZnuwhgghebmo5jAL7eQU/ijoTVhM3VgnyJkj4N2uUxVb4Dv0tcKjzb1AHUsrYDEET
 szcuXq9uF2fLg==
Date: Tue, 18 Jan 2022 17:10:53 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <YedlHVEa4sdbvB2F@google.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Linus, Could you please consider this pull request? Thanks
 as always, 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1n9zVB-000820-R8
Subject: [f2fs-dev] [GIT PULL] f2fs update for 5.17-rc1
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

Thanks as always,

The following changes since commit 8ab774587903771821b59471cc723bba6d893942:

  Merge tag 'trace-v5.16-5' of git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace (2021-11-14 19:07:19 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-5.17-rc1

for you to fetch changes up to 5fed0be8583f08c1548b4dcd9e5ee0d1133d0730:

  f2fs: do not allow partial truncation on pinned file (2022-01-10 09:05:09 -0800)

----------------------------------------------------------------
f2fs-for-5.17-rc1

In this round, we've tried to address some performance issues in f2fs_checkpoint
and direct IO flows. Also, there was a work to enhance the page cache management
used for compression. Other than them, we've done typical work including sysfs,
code clean-ups, tracepoint, sanity check, in addition to bug fixes on corner
cases.

Enhancement:
 - use iomap for direct IO
 - try to avoid lock contention to improve f2fs_ckpt speed
 - avoid unnecessary memory allocation in compression flow
 - POSIX_FADV_DONTNEED drops the page cache containing compression pages
 - add some sysfs entries (gc_urgent_high_remaining, pending_discard)

Bug fix:
 - try not to expose unwritten blocks to user by DIO
   : this was added to avoid merge conflict; another patch is coming to address
     other missing case.
 - relax minor error condition for file pinning feature used in Android OTA
 - fix potential deadlock case in compression flow
 - should not truncate any block on pinned file

In addition, we've done some code clean-ups and tracepoint/sanity check
improvement.

----------------------------------------------------------------
Chao Yu (9):
      f2fs: fix to do sanity check on inode type during garbage collection
      f2fs: fix to avoid panic in is_alive() if metadata is inconsistent
      f2fs: fix to do sanity check in is_alive()
      f2fs: fix to do sanity check on last xattr entry in __f2fs_setxattr()
      f2fs: clean up __find_inline_xattr() with __find_xattr()
      f2fs: support fault injection to f2fs_trylock_op()
      f2fs: fix to check available space of CP area correctly in update_ckpt_flags()
      f2fs: fix to reserve space for IO align feature
      f2fs: don't drop compressed page cache in .{invalidate,release}page

Daeho Jeong (1):
      f2fs: add gc_urgent_high_remaining sysfs node

Eric Biggers (5):
      f2fs: rework write preallocations
      f2fs: reduce indentation in f2fs_file_write_iter()
      f2fs: fix the f2fs_file_write_iter tracepoint
      f2fs: implement iomap operations
      f2fs: use iomap for direct I/O

Fengnan Chang (4):
      f2fs: compress: reduce one page array alloc and free when write compressed page
      f2fs: fix remove page failed in invalidate compress pages
      f2fs: support POSIX_FADV_DONTNEED drop compressed page cache
      f2fs: remove redunant invalidate compress pages

Hyeong-Jun Kim (1):
      f2fs: compress: fix potential deadlock of compress file

Jaegeuk Kim (8):
      f2fs: do not expose unwritten blocks to user by DIO
      f2fs: show more DIO information in tracepoint
      f2fs: show number of pending discard commands
      f2fs: avoid duplicate call of mark_inode_dirty
      f2fs: avoid EINVAL by SBI_NEED_FSCK when pinning a file
      f2fs: avoid down_write on nat_tree_lock during checkpoint
      f2fs: do not bother checkpoint by f2fs_get_node_info
      f2fs: do not allow partial truncation on pinned file

Yang Li (1):
      f2fs: Simplify bool conversion

 Documentation/ABI/testing/sysfs-fs-f2fs |  12 +
 Documentation/filesystems/f2fs.rst      |   1 +
 fs/f2fs/Kconfig                         |   1 +
 fs/f2fs/checkpoint.c                    |   6 +-
 fs/f2fs/compress.c                      |  84 +++---
 fs/f2fs/data.c                          | 351 +++++-----------------
 fs/f2fs/f2fs.h                          |  43 ++-
 fs/f2fs/file.c                          | 509 ++++++++++++++++++++++++++------
 fs/f2fs/gc.c                            |  26 +-
 fs/f2fs/inline.c                        |   4 +-
 fs/f2fs/inode.c                         |  18 +-
 fs/f2fs/iostat.c                        |  40 ++-
 fs/f2fs/node.c                          |  23 +-
 fs/f2fs/recovery.c                      |   2 +-
 fs/f2fs/segment.c                       |   2 +-
 fs/f2fs/segment.h                       |   3 +-
 fs/f2fs/super.c                         |  46 +++
 fs/f2fs/sysfs.c                         |  26 +-
 fs/f2fs/xattr.c                         |  40 +--
 include/trace/events/f2fs.h             |  27 +-
 20 files changed, 759 insertions(+), 505 deletions(-)



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
