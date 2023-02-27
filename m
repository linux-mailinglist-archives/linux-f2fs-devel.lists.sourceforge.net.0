Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6316A4EFC
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Feb 2023 23:55:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pWmPL-0008Tv-MH;
	Mon, 27 Feb 2023 22:55:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pWmPK-0008Tp-9i
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Feb 2023 22:55:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Rjg5Z/GISE+4D/XlXRLgZwh7B+Ag/HpG6YWwt91/DoM=; b=W37SqkqWwOU4+y5csANcoDBevI
 ypOoltXzbWNSCLREoYXGV3nteU2wLYgQUHdqT64CRmnTahXObmJspED1uuyEvAgKopuaJ8YMdwS30
 81yO0DdJTh2NSSGMZduUjVpmXbUTdox9sX+R/zD7PX6tXGLYxp4RYFuZMr4ue1jxBKcE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc
 :To:From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Rjg5Z/GISE+4D/XlXRLgZwh7B+Ag/HpG6YWwt91/DoM=; b=e
 YPcZ7OKmaiKlmNk1F4yJLJqu5BFIqLYtJNUK+AAAUrsfp+ueUWx2+/y+Vq2NCeSHC/7yw0H+mZjxr
 BB7eu4eFqhu2m7olJq5nz03J5OHV1jS2OV/DUWr+Q4prP9rcnocQR4phRCtPnqtF8Yuf8x0WIV3K5
 lqISwLWUoL5ZaZUs=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pWmPE-0006AE-VK for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Feb 2023 22:55:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 1514DCE11E0;
 Mon, 27 Feb 2023 22:55:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A3ABC433D2;
 Mon, 27 Feb 2023 22:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677538532;
 bh=v1ySok06DjBFdFulLeXUV64FpSnlUsDYWPmnD91gPm8=;
 h=Date:From:To:Cc:Subject:From;
 b=ieTfdbuX4DJgoyKFVNBrTShhU2A1FFCXB09z3c2kxmjzyrBUGd40Zl9ytIsI8pDht
 d/FEuPrhLQ2l+9r7No9mzwmJx1rlQzTtggCIE3Wuw6cDlX7L+Ve8b5a6kZSlWImTpP
 dTlGXOcZHlPd2FNz2W/ef+tJwtAUl93gjRcgYhBTpMJuIO+T3Jof7zOC63t+v5yrOr
 MtVBgwiGzl5u5AvS70PBOs8qfK+8NmkwCHBVz7WMlULOjVPeHNm7vXc7+lYh1Pzv3A
 ghBf0DxZdMColdJN049tnSLDh0SrmGWMGPLXqNBw7Guw6Y8rXueTiG9eIr4lAczbgE
 B0qATaPIJn7Sg==
Date: Mon, 27 Feb 2023 14:55:30 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <Y/004is4VtYI7G2u@google.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Linus, Could you please consider this pull request? Thanks,
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pWmPE-0006AE-VK
Subject: [f2fs-dev] [GIT PULL] f2fs update for 6.3-rc1
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Linus,

Could you please consider this pull request?

Thanks,

The following changes since commit 512dee0c00ad9e9c7ae9f11fc6743702ea40caff:

  Merge tag 'x86-urgent-2023-01-04' of git://git.kernel.org/pub/scm/linux/k=
ernel/git/tip/tip (2023-01-04 12:11:29 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-=
for-6.3-rc1

for you to fetch changes up to ddf1eca4fc5a4038cb323306f51fbba34ce3f4d2:

  f2fs: drop unnecessary arg for f2fs_ioc_*() (2023-02-15 09:49:04 -0800)

----------------------------------------------------------------
f2fs-for-6.3-rc1

In this round, we've got a huge number of patches that improve code readabi=
lity
along with minor bug fixes, while we've mainly fixed some critical issues in
recently-added per-block age-based extent_cache, atomic write support, and =
some
folio cases.

Enhancement:
 - add sysfs nodes to set last_age_weight and manage discard_io_aware_gran
 - show ipu policy in debugfs
 - reduce stack memory cost by using bitfield in struct f2fs_io_info
 - introduce trace_f2fs_replace_atomic_write_block
 - enhance iostat support and adds flush commands

Bug fix:
 - revert "f2fs: truncate blocks in batch in __complete_revoke_list()"
 - fix kernel crash on the atomic write abort flow
 - call clear_page_private_reference in .{release,invalid}_folio
 - support .migrate_folio for compressed inode
 - fix cgroup writeback accounting with fs-layer encryption
 - retry to update the inode page given data corruption
 - fix kernel crash due to null io->bio
 - fix some bugs in per-block age-based extent_cache:
    a. wrong calculation of block age
    b. update age extent in f2fs_do_zero_range()
    c. update age extent correctly during truncation

----------------------------------------------------------------
Alexander Potapenko (1):
      fs: f2fs: initialize fsdata in pagecache_write()

Chao Yu (17):
      f2fs: fix to support .migrate_folio for compressed inode
      f2fs: remove unused PAGE_PRIVATE_ATOMIC_WRITE
      f2fs: fix to call clear_page_private_reference in .{release,invalid}_=
folio
      f2fs: fix to avoid potential deadlock
      f2fs: add missing doc for fault injection sysfs
      f2fs: avoid to check PG_error flag
      f2fs: introduce trace_f2fs_replace_atomic_write_block
      f2fs: clear atomic_write_task in f2fs_abort_atomic_write()
      f2fs: remove unneeded f2fs_cp_error() in f2fs_create_whiteout()
      f2fs: fix to do sanity check on extent cache correctly
      f2fs: fix to abort atomic write only during do_exist()
      f2fs: reduce stack memory cost by using bitfield in struct f2fs_io_in=
fo
      f2fs: clean up i_compress_flag and i_compress_level usage
      f2fs: fix to handle F2FS_IOC_START_ATOMIC_REPLACE in f2fs_compat_ioct=
l()
      f2fs: fix to update age extent correctly during truncation
      f2fs: fix to update age extent in f2fs_do_zero_range()
      f2fs: fix to do sanity check on extent cache correctly

Christoph Hellwig (22):
      f2fs: don't rely on F2FS_MAP_* in f2fs_iomap_begin
      f2fs: decouple F2FS_MAP_ from buffer head flags
      f2fs: rename F2FS_MAP_UNWRITTEN to F2FS_MAP_DELALLOC
      f2fs: split __submit_bio
      f2fs: add a f2fs_lookup_extent_cache_block helper
      f2fs: add a f2fs_get_block_locked helper
      f2fs: f2fs_do_map_lock
      f2fs: reflow prepare_write_begin
      f2fs: simplify __allocate_data_block
      f2fs: remove f2fs_get_block
      f2fs: remove the create argument to f2fs_map_blocks
      f2fs: factor a f2fs_map_blocks_cached helper
      f2fs: factor out a f2fs_map_no_dnode
      f2fs: refactor the hole reporting and allocation logic in f2fs_map_bl=
ocks
      f2fs: remove __add_sum_entry
      f2fs: simplify do_checkpoint
      f2fs: add a f2fs_curseg_valid_blocks helper
      f2fs: refactor __allocate_new_segment
      f2fs: remove __allocate_new_section
      f2fs: refactor next blk selection
      f2fs: remove __has_curseg_space
      f2fs: factor the read/write tracing logic into a helper

Daeho Jeong (1):
      f2fs: synchronize atomic write aborts

Eric Biggers (2):
      f2fs: fix information leak in f2fs_move_inline_dirents()
      f2fs: fix cgroup writeback accounting with fs-layer encryption

Jaegeuk Kim (4):
      f2fs: retry to update the inode page given data corruption
      f2fs: fix kernel crash due to null io->bio
      f2fs: fix wrong segment count
      f2fs: Revert "f2fs: truncate blocks in batch in __complete_revoke_lis=
t()"

Jinyoung CHOI (1):
      f2fs: fix typos in comments

Sergey Shtylyov (1):
      f2fs: file: drop useless initializer in expand_inode_data()

Thomas Wei=DFschuh (1):
      f2fs: make kobj_type structures constant

Yangtao Li (27):
      docs: f2fs: fix html doc error
      f2fs: introduce IS_F2FS_IPU_* macro
      MAINTAINERS: Add f2fs's patchwork
      f2fs: judge whether discard_unit is section only when have CONFIG_BLK=
_DEV_ZONED
      f2fs: mark f2fs_init_compress_mempool w/ __init
      f2fs: remove unnecessary blank lines
      f2fs: add a f2fs_ prefix to punch_hole() and expand_inode_data()
      f2fs: merge f2fs_show_injection_info() into time_to_inject()
      f2fs: convert to use MIN_DISCARD_GRANULARITY macro
      f2fs: convert discard_wake and gc_wake to bool type
      f2fs: support accounting iostat count and avg_bytes
      f2fs: add iostat support for flush
      f2fs: drop useless initializer and unneeded local variable
      f2fs: introduce discard_io_aware_gran sysfs node
      f2fs: fix to show discard_unit mount opt
      f2fs: clarify compress level bit offset
      f2fs: return true if all cmd were issued or no cmd need to be issued =
for f2fs_issue_discard_timeout()
      f2fs: fix to check warm_data_age_threshold
      f2fs: allow set compression option of files without blocks
      f2fs: fix to avoid potential memory corruption in __update_iostat_lat=
ency()
      f2fs: fix f2fs_show_options to show nogc_merge mount option
      f2fs: use iostat_lat_type directly as a parameter in the iostat_updat=
e_and_unbind_ctx()
      f2fs: fix to set ipu policy
      f2fs: add missing description for ipu_policy node
      f2fs: export ipu policy in debugfs
      f2fs: replace si->sbi w/ sbi in stat_show()
      f2fs: drop unnecessary arg for f2fs_ioc_*()

Yuwei Guan (1):
      f2fs: deliver the accumulated 'issued' to __issue_discard_cmd_orderly=
()

Zhang Qilong (1):
      f2fs: start freeing cluster pages from the unused number

qixiaoyu1 (2):
      f2fs: fix wrong calculation of block age
      f2fs: add sysfs nodes to set last_age_weight

 Documentation/ABI/testing/sysfs-fs-f2fs |  80 +++-
 Documentation/filesystems/f2fs.rst      |   2 +-
 MAINTAINERS                             |   1 +
 fs/f2fs/checkpoint.c                    |  37 +-
 fs/f2fs/compress.c                      |  24 +-
 fs/f2fs/data.c                          | 624 ++++++++++++++++------------=
----
 fs/f2fs/debug.c                         |  64 +++-
 fs/f2fs/dir.c                           |   4 +-
 fs/f2fs/extent_cache.c                  |  60 ++-
 fs/f2fs/f2fs.h                          | 128 +++----
 fs/f2fs/file.c                          | 173 ++++-----
 fs/f2fs/gc.c                            |  22 +-
 fs/f2fs/gc.h                            |   2 +-
 fs/f2fs/inline.c                        |  14 +-
 fs/f2fs/inode.c                         |  78 ++--
 fs/f2fs/iostat.c                        | 186 +++++-----
 fs/f2fs/iostat.h                        |  19 +-
 fs/f2fs/namei.c                         |   5 +-
 fs/f2fs/node.c                          |   9 +-
 fs/f2fs/segment.c                       | 225 ++++++------
 fs/f2fs/segment.h                       |  41 ++-
 fs/f2fs/super.c                         |  63 ++--
 fs/f2fs/sysfs.c                         |  49 ++-
 fs/f2fs/verity.c                        |   2 +-
 include/linux/f2fs_fs.h                 |   2 +-
 include/trace/events/f2fs.h             | 104 ++++--
 26 files changed, 1090 insertions(+), 928 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
