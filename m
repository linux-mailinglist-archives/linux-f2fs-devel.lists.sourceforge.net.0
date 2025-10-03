Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA0DBB7D01
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 03 Oct 2025 19:56:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:To:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8DKbhhk+aD6mKgr8jhkxfMpagPLHIHDr/0LomUiVQQI=; b=IpoXsozUOUHJbVYinmAhGVuz60
	0mB/hsM1hNZ3DcbKiRsnrKTikZQdVivtc+daLyOsK0Dn7CGNCvYcYyPa5uA5Q71JEeSB2QsaCk0uw
	MChzkf2yiWFNbJjyeE6G+NbZ+2tsIcXlXhgxM5IBB+rhtTOpVH5xGF2/pbqEVnBFjrHw=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v4k1K-0006wb-So;
	Fri, 03 Oct 2025 17:56:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1v4k1D-0006wQ-Ta
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Oct 2025 17:56:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ViXxVsQ9gptQboe7G49ryde/ZRSHGNwtdElrOh6cnGA=; b=mYIRdhVsKMAH33uI7NIZn2s7R4
 zOmg0ZiPKsIWcEzsxTkA5zwUkmTdbY1QIgmMAv9zrkki8VZNbz0Ksi72mCsZtuhz/kdUjUb78LEvA
 REsvL3ovGuLd6U+7gou7EdpIlvoZJLc4HYdc1U17rwAGjLSdZdiP+ZYiLC8ZovdCBQoA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ViXxVsQ9gptQboe7G49ryde/ZRSHGNwtdElrOh6cnGA=; b=Z
 GDHOgbgt9mMDUOnx+wMskT+j1Ov8XBnIcjqWtazxwZzNMxVBUHoqjfcHpxkEfCEFB8fADaSRyml9L
 BuDYOD7Jg7UjigjyivNolechC2x50h4NPrbmiQClXWIMBpwHgKxLMXMng2n4IsQuKHXBlc7NF2NL0
 1IYVNAXc6hsaCTTk=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v4k1D-0005Yb-4R for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Oct 2025 17:56:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6D98E60307;
 Fri,  3 Oct 2025 17:56:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE387C4CEF9;
 Fri,  3 Oct 2025 17:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759514189;
 bh=9KCW7Uhqm+iyr1CXL3CkWO3+4qhqMUAqI/DIsF6l3nI=;
 h=Date:From:To:Cc:Subject:From;
 b=pC0WLvIVXeOkIrbvsKc/+0RtR2M/bGdoIt1liZCWpCZkGiIS+bU7hBMImTmNsEqTv
 gKbuw/s/ph+E7xdh19KhNgLuNopdn6MsYG82LMMUzkvUm19OCLXp6l4VvItUI39BSt
 DUlXYS6uZqN3YK9my2ppDQ+EcAUmYTBh03PadSjo33DrN9Dkyuelk31fJ2uMX23pVq
 hKbkMm68czq756FG8ZVOS+OGIONp4nRNOtBeMYM+Mw5wgefOev+SspXnVtIr1Gx6+n
 dVOZ4+B5UOWE9YFNGoDu4ueQ2tmkPDFA9SlnY4R2OKe49Lt8pT6LplqZsVEzWv+GZX
 PCZmQfAPxuCyw==
Date: Fri, 3 Oct 2025 17:56:27 +0000
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <aOAOS864BmSwjfGm@google.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Linus, Could you please consider this pull request? Thanks,
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v4k1D-0005Yb-4R
Subject: [f2fs-dev] [GIT PULL] f2fs for 6.18-rc1
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

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-6.18-rc1

for you to fetch changes up to 4e715744bf7b4e5521cc3b77f310060f862cb719:

  f2fs: add missing dput() when printing the donation list (2025-10-03 03:16:10 +0000)

----------------------------------------------------------------
f2fs-for-6.18-rc1

This release focuses on two primary updates for Android devices. First, it sets
hash-based file name lookup as the default method to improve performance, while
retaining an option to fall back to a linear lookup. Second, it resolves a
persistent issue with the checkpoint=enable feature. The update further boosts
performance by prefetching node blocks, merging FUA writes more efficiently, and
optimizing block allocation policies.

The release is rounded out by a comprehensive set of bug fixes that address
memory safety, data integrity, and potential system hangs, along with minor
documentation and code clean-ups.

Enhancement:
 - add mount option and sysfs entry to tune the lookup mode
 - dump more information and add a timeout when enabling/disabling checkpoints
 - readahead node blocks in F2FS_GET_BLOCK_PRECACHE mode
 - merge FUA command with the existing writes
 - allocate HOT_DATA for IPU writes
 - Use allocate_section_policy to control write priority in multi-devices setups
 - add reserved nodes for privileged users
 - Add bggc_io_aware to adjust the priority of BG_GC when issuing IO
 - show the list of donation files

Bug fix:
 - add missing dput() when printing the donation list
 - fix UAF issue in f2fs_merge_page_bio()
 - add sanity check on ei.len in __update_extent_tree_range()
 - fix infinite loop in __insert_extent_tree()
 - fix zero-sized extent for precache extents
 - fix to mitigate overhead of f2fs_zero_post_eof_page()
 - fix to avoid migrating empty section
 - fix to truncate first page in error path of f2fs_truncate()
 - fix to update map->m_next_extent correctly in f2fs_map_blocks()
 - fix wrong layout information on 16KB page
 - fix to do sanity check on node footer for non inode dnode
 - fix to avoid NULL pointer dereference in f2fs_check_quota_consistency()
 - fix to detect potential corrupted nid in free_nid_list
 - fix to clear unusable_cap for checkpoint=enable
 - fix to zero data after EOF for compressed file correctly
 - fix to avoid overflow while left shift operation
 - fix condition in __allow_reserved_blocks()

----------------------------------------------------------------
Bagas Sanjaya (6):
      Documentation: f2fs: Separate errors mode subtable
      Documentation: f2fs: Format compression level subtable
      Documentation: f2fs: Span write hint table section rows
      Documentation: f2fs: Wrap snippets in literal code blocks
      Documentation: f2fs: Indent compression_mode option list
      Documentation: f2fs: Reword title

Chao Yu (22):
      f2fs: dump more information when checkpoint was blocked for long time
      f2fs: add time stats of checkpoint for debug
      f2fs: fix condition in __allow_reserved_blocks()
      f2fs: fix to avoid overflow while left shift operation
      f2fs: fix to zero data after EOF for compressed file correctly
      f2fs: clean up f2fs_truncate_partial_cluster()
      f2fs: fix to clear unusable_cap for checkpoint=enable
      f2fs: fix to detect potential corrupted nid in free_nid_list
      f2fs: add timeout in f2fs_enable_checkpoint()
      f2fs: dump more information for f2fs_{enable,disable}_checkpoint()
      f2fs: clean up w/ get_left_section_blocks()
      f2fs: fix to avoid NULL pointer dereference in f2fs_check_quota_consistency()
      f2fs: fix to allow removing qf_name
      f2fs: fix to do sanity check on node footer for non inode dnode
      f2fs: avoid unnecessary folio_clear_uptodate() for cleanup
      f2fs: clean up error handing of f2fs_submit_page_read()
      f2fs: fix to update map->m_next_extent correctly in f2fs_map_blocks()
      f2fs: fix to truncate first page in error path of f2fs_truncate()
      f2fs: fix to avoid migrating empty section
      f2fs: fix to mitigate overhead of f2fs_zero_post_eof_page()
      f2fs: add sanity check on ei.len in __update_extent_tree_range()
      f2fs: fix UAF issue in f2fs_merge_page_bio()

Chunhai Guo (1):
      f2fs: add reserved nodes for privileged users

Daniel Lee (2):
      f2fs: add lookup_mode mount option
      f2fs: add sysfs entry for effective lookup mode

Jaegeuk Kim (5):
      f2fs: show the list of donation files
      f2fs: allocate HOT_DATA for IPU writes
      f2fs: merge FUA command with the existing writes
      f2fs: fix wrong layout information on 16KB page
      f2fs: add missing dput() when printing the donation list

Liao Yuanhong (2):
      f2fs: Add bggc_io_aware to adjust the priority of BG_GC when issuing IO
      f2fs: Use allocate_section_policy to control write priority in multi-devices setups

Soham Metha (1):
      docs: f2fs: fixed spelling mistakes in documentation

Yunji Kang (1):
      f2fs: readahead node blocks in F2FS_GET_BLOCK_PRECACHE mode

mason.zhang (1):
      f2fs: add error checking in do_write_page()

wangzijie (2):
      f2fs: fix zero-sized extent for precache extents
      f2fs: fix infinite loop in __insert_extent_tree()

 Documentation/ABI/testing/sysfs-fs-f2fs |  56 ++++++++++++++-
 Documentation/filesystems/f2fs.rst      | 122 ++++++++++++++++++++------------
 fs/f2fs/checkpoint.c                    |  53 ++++++++++++++
 fs/f2fs/compress.c                      |  43 ++++++-----
 fs/f2fs/data.c                          |  59 ++++++---------
 fs/f2fs/dir.c                           |  17 ++++-
 fs/f2fs/extent_cache.c                  |  15 ++++
 fs/f2fs/f2fs.h                          |  88 ++++++++++++++++++-----
 fs/f2fs/file.c                          |  49 +++++++------
 fs/f2fs/gc.c                            |  25 ++++++-
 fs/f2fs/node.c                          |  77 ++++++++++++++------
 fs/f2fs/node.h                          |   1 +
 fs/f2fs/recovery.c                      |   2 +-
 fs/f2fs/segment.c                       |  30 +++++++-
 fs/f2fs/segment.h                       |  28 ++++----
 fs/f2fs/super.c                         | 121 +++++++++++++++++++++++++++----
 fs/f2fs/sysfs.c                         | 119 ++++++++++++++++++++++++++++++-
 include/linux/f2fs_fs.h                 |   1 +
 18 files changed, 702 insertions(+), 204 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
