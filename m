Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE22CAE2BB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 08 Dec 2025 21:43:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:To:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/HVQiyy/eRR5T2uvU58yGgh64OaaKeKBikOFezWFz4U=; b=m5Mbi2pGfn+jV0t/JJ/ocULR6s
	V97KtSclq69EwPFY3IIgbKjEudiHlSuS/k5QHPJ2sDsO99R7NkOFuXbm+JjuyUOR6qwShyN4c77Y7
	XsJw6IfBLCZJuOWBVtftho7b7dNYkgW4lHZdal2e54sAQwzi3MsCaOVrAbZM3Ow4D490=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vSi4N-0006C2-Ne;
	Mon, 08 Dec 2025 20:42:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1vSi4L-0006Bw-L2
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 08 Dec 2025 20:42:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=233VldYq6CWub0TEl80C5P+QQt6FcC9dVDQrizsL7Os=; b=XBLTN0MG76yAzO3h0i50hcfQnF
 7sk1Hr/aECShDM2fdDNJz0Xw0pAUTrZlbfARKAhMnwJe13qMMnvI+JEI6k438h6Z5y4YPSEH+0nkf
 PKD/nslinIf40NWWoHC7a7KPt92gJBa6VVLIe4sLyqHb+HR6iq9foCSCclqvfbiqpjDs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=233VldYq6CWub0TEl80C5P+QQt6FcC9dVDQrizsL7Os=; b=i
 ZWelcajswdhm1PYL/uP/GOBPEkYSgiwKbzDJQ7aTCABBCwymQbDIP/N3qGx/TonX7vWDeNWTSJgWt
 cSmzWn2VMCXAMaZbcxzpS5wxxRYShAwFTipCtfHUHorExLNZgKS2SoOeEieRrtkwERJiKZl2n8j2b
 WzlhyBAJ1L2t804k=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vSi4K-0008T7-W3 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 08 Dec 2025 20:42:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3BD0E60133;
 Mon,  8 Dec 2025 20:42:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3D8AC4CEF1;
 Mon,  8 Dec 2025 20:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765226561;
 bh=Gu+gOyRjk5lTbW3f7H2VIWX+/mBbYCZOzJEn3yc5If4=;
 h=Date:From:To:Cc:Subject:From;
 b=tRWlb9Q7ma8WCWMUj+zswJa4ZHrlN+YuXV7d/h4wpQeYWdFWFEuAa4MB3XAfHq9LB
 TuBNvx0OmYgVQNYKJnzzbsyHHIJ1c9tv0CFOR8BQEMj2Uj/lCREewd5GCWzJDmnMDq
 pcp4abUCDOdGFr6pIY/+wJWX+qeWRdsWqfGdyC3Dlsi/z49NnpIeLJmdGhw6cwCNlo
 90lUMUTrKsbY2CqvEAYpVzt1kX1xVaeUjqBSLS6ZRNEANdf1DenZ5GnrNk4FVaKbgO
 EA/3lfApqZ5dKuMq6ylvdc5ZbjvCN3rympgsY3yGeXnvxb3qS/Ib7EMU2KPktJXZIP
 0QyjDpA/7e2oQ==
Date: Mon, 8 Dec 2025 20:42:40 +0000
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <aTc4QJ9A-0qKfBzM@google.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Linus, Could you please consider this pull request? Thanks,
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [172.105.4.254 listed in dnsbl-2.uceprotect.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vSi4K-0008T7-W3
Subject: [f2fs-dev] [GIT PULL] f2fs for 6.19-rc1
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

The following changes since commit d2818517e3486d11c9bd55aca3e14059e4c69886:

  Merge tag 'block-6.18-20251023' of git://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux (2025-10-24 12:48:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-6.19-rc1

for you to fetch changes up to 76ee7fd6af6851ef78016139bd727057ba467c4e:

  f2fs: ignore discard return value (2025-12-04 02:00:06 +0000)

----------------------------------------------------------------
f2fs-for-6.19-rc1

This series focuses on minor clean-ups and performance optimizations across
sysfs, documentation, debugfs, tracepoints, slab allocation, and GC.
Furthermore, it resolves several corner-case bugs caught by xfstests, as
well as issues related to 16KB page support and f2fs_enable_checkpoint.

Enhancement:
 - wrap ASCII tables in literal blocks to fix LaTeX build
 - optimize trace_f2fs_write_checkpoint with enums
 - support to show curseg.next_blkoff in debugfs
 - add a sysfs entry to show max open zones
 - add fadvise tracepoint
 - use global inline_xattr_slab instead of per-sb slab cache
 - set default valid_thresh_ratio to 80 for zoned devices
 - maintain one time GC mode is enabled during whole zoned GC cycle

Bug fix:
 - ensure node page reads complete before f2fs_put_super() finishes
 - fix to not account invalid blocks in get_left_section_blocks()
 - revert summary entry count from 2048 to 512 in 16kb block support
 - fix to detect recoverable inode during dryrun of find_fsync_dnodes()
 - fix age extent cache insertion skip on counter overflow
 - Add sanity checks before unlinking and loading inodes
 - ensure minimum trim granularity accounts for all devices
 - block cache/dio write during f2fs_enable_checkpoint()
 - fix to propagate error from f2fs_enable_checkpoint()
 - invalidate dentry cache on failed whiteout creation
 - fix to avoid updating compression context during writeback
 - fix to avoid updating zero-sized extent in extent cache
 - fix to avoid potential deadlock

----------------------------------------------------------------
Baolin Liu (1):
      f2fs: simplify list initialization in f2fs_recover_fsync_data()

Chaitanya Kulkarni (1):
      f2fs: ignore discard return value

Chao Yu (19):
      f2fs: clean up w/ bio_add_folio_nofail()
      f2fs: convert add_ipu_page() to use folio
      f2fs: use f2fs_filemap_get_folio() instead of f2fs_pagecache_get_page()
      f2fs: use f2fs_filemap_get_folio() to support fault injection
      f2fs: fix to avoid potential deadlock
      f2fs: fix to avoid updating zero-sized extent in extent cache
      f2fs: fix to avoid updating compression context during writeback
      f2fs: use global inline_xattr_slab instead of per-sb slab cache
      f2fs: fix to propagate error from f2fs_enable_checkpoint()
      f2fs: block cache/dio write during f2fs_enable_checkpoint()
      f2fs: fix to access i_size w/ i_size_read()
      f2fs: fix return value of f2fs_recover_fsync_data()
      f2fs: fix to detect recoverable inode during dryrun of find_fsync_dnodes()
      f2fs: use memalloc_retry_wait() as much as possible
      f2fs: introduce f2fs_schedule_timeout()
      f2fs: change default schedule timeout value
      f2fs: expand scalability of f2fs mount option
      f2fs: support to show curseg.next_blkoff in debugfs
      f2fs: fix to not account invalid blocks in get_left_section_blocks()

Daeho Jeong (3):
      f2fs: maintain one time GC mode is enabled during whole zoned GC cycle
      f2fs: set default valid_thresh_ratio to 80 for zoned devices
      f2fs: revert summary entry count from 2048 to 512 in 16kb block support

Deepanshu Kartikey (1):
      f2fs: invalidate dentry cache on failed whiteout creation

Jaegeuk Kim (1):
      f2fs: add fadvise tracepoint

Jan Prusakowski (1):
      f2fs: ensure node page reads complete before f2fs_put_super() finishes

Jiucheng Xu (1):
      f2fs: Use mapping->gfp_mask to get file cache for writing

Masaharu Noguchi (1):
      docs: f2fs: wrap ASCII tables in literal blocks to fix LaTeX build

Nikola Z. Ivanov (2):
      f2fs: Rename f2fs_unlink exit label
      f2fs: Add sanity checks before unlinking and loading inodes

Pedro Demarchi Gomes (1):
      f2fs: use folio_nr_pages() instead of shift operation

Xiaole He (2):
      f2fs: fix uninitialized one_time_gc in victim_sel_policy
      f2fs: fix age extent cache insertion skip on counter overflow

YH Lin (1):
      f2fs: optimize trace_f2fs_write_checkpoint with enums

Yongpeng Yang (4):
      f2fs: change the unlock parameter of f2fs_put_page to bool
      f2fs: ensure minimum trim granularity accounts for all devices
      f2fs: wrap all unusable_blocks_per_sec code in CONFIG_BLK_DEV_ZONED
      f2fs: add a sysfs entry to show max open zones

 Documentation/ABI/testing/sysfs-fs-f2fs |   6 +
 Documentation/filesystems/f2fs.rst      | 131 ++++++++++----------
 fs/f2fs/checkpoint.c                    |  10 +-
 fs/f2fs/compress.c                      |  17 ++-
 fs/f2fs/data.c                          |  50 +++++---
 fs/f2fs/debug.c                         |  29 +++--
 fs/f2fs/extent_cache.c                  |   5 +-
 fs/f2fs/f2fs.h                          | 162 +++++++++++++++----------
 fs/f2fs/file.c                          |  26 ++--
 fs/f2fs/gc.c                            | 165 ++++++++++++++-----------
 fs/f2fs/gc.h                            |   2 +-
 fs/f2fs/inline.c                        |   4 +-
 fs/f2fs/inode.c                         |   6 +
 fs/f2fs/namei.c                         |  39 +++---
 fs/f2fs/recovery.c                      |  31 ++---
 fs/f2fs/segment.c                       |  63 ++++++----
 fs/f2fs/segment.h                       |  21 +++-
 fs/f2fs/super.c                         | 208 ++++++++++++++++----------------
 fs/f2fs/sysfs.c                         |   9 ++
 fs/f2fs/verity.c                        |   2 +-
 fs/f2fs/xattr.c                         |  32 ++---
 fs/f2fs/xattr.h                         |  10 +-
 include/linux/f2fs_fs.h                 |   5 +-
 include/trace/events/f2fs.h             |  59 +++++++--
 24 files changed, 643 insertions(+), 449 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
