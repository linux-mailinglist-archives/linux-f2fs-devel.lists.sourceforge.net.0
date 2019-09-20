Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1ECB9831
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Sep 2019 22:01:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iBP5o-0002ya-AG; Fri, 20 Sep 2019 20:01:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1iBP5m-0002yK-Mq
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Sep 2019 20:01:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uYq9I+nHJEyu+IeSMTakMDuiGxf0d0onzMCzIlKyQPY=; b=GDwhDz+DW7vST1pdrETv+b8+KC
 /SYKtQW3BvUkwOkVz3rQssPxi4550H34eNu5helMXqqccA5sAAZUwEw+0pjvqAN+H4Wlvk5duKIVS
 Ki1HC5/bPtaurun7KsStshzedGKvbwUHXolv3RkM0CklVI1Vgn9E4jXlNMHDC/F6Bh3I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=uYq9I+nHJEyu+IeSMTakMDuiGxf0d0onzMCzIlKyQPY=; b=U
 lMZ8JBfTegPN2SHJUQNcnWTVvzV4+oitNLdXBMIJoRUZsuv9kHPjAOuM3l4WQZmFWX1YGZdIHps/j
 b7QKAT61XABk6i9a3uBPwdpwsKt3vPg9avVJ2icJmkF5MLU9OaI9cjfI4vo7t+JD9bGeKSazpPea1
 Y7o7v8f72zs6Aj6Q=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iBP5i-000wmT-VI
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Sep 2019 20:01:22 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5C7172067B;
 Fri, 20 Sep 2019 20:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569009668;
 bh=TsCzroLgNhThVbiMnKL3twJK9UDWIJ/baZ2ndbvC/48=;
 h=Date:From:To:Cc:Subject:From;
 b=EYzlsHPnMiXEP5uyD+JbM3WVPWRGzmWz0BJWxQsgScoeFW9URPVwA8XQ7CAklo8ec
 gUiIGAlmLTpACLLZt4fqvbHeXxhMc9WPjepLeZQjSLGiPvk3tRtjTI6Hp8vXsXEvhk
 wjOplBOwy0/KxZ/y6V3opNfJTHmA9llxn2YTswE8=
Date: Fri, 20 Sep 2019 13:01:07 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20190920200107.GA57911@jaegeuk-macbookpro.roam.corp.google.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1iBP5i-000wmT-VI
Subject: [f2fs-dev] [GIT PULL] f2fs for 5.4
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

The following changes since commit b7e7c85dc7b0ea5ff821756c331489e3b151eed1:

  Merge tag 'arm64-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux (2019-08-16 10:51:47 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-5.4

for you to fetch changes up to fbbf779989d2ef9a51daaa4e53c0b2ecc8c55c4e:

  f2fs: add a condition to detect overflow in f2fs_ioc_gc_range() (2019-09-17 13:56:15 -0700)

----------------------------------------------------------------
f2fs-for-5.4-rc1

In this round, we introduced casefolding support in f2fs, and fixed various bugs
in individual features such as IO alignment, checkpoint=disable, quota, and
swapfile.

Enhancement:
 - support casefolding w/ enhancement in ext4
 - support fiemap for directory
 - support FS_IO_GET|SET_FSLABEL

Bug fix:
 - fix IO stuck during checkpoint=disable
 - avoid infinite GC loop
 - fix panic/overflow related to IO alignment feature
 - fix livelock in swap file
 - fix discard command leak
 - disallow dio for atomic_write

----------------------------------------------------------------
Chao Yu (34):
      f2fs: introduce {page,io}_is_mergeable() for readability
      f2fs: fix panic of IO alignment feature
      f2fs: disallow switching io_bits option during remount
      f2fs: fix to drop meta/node pages during umount
      f2fs: fix to avoid tagging SBI_QUOTA_NEED_REPAIR incorrectly
      f2fs: fix to avoid discard command leak
      f2fs: support fiemap() for directory inode
      f2fs: fix to spread f2fs_is_checkpoint_ready()
      f2fs: fix to detect cp error in f2fs_setxattr()
      f2fs: fix to handle quota_{on,off} correctly
      f2fs: disallow direct IO in atomic write
      f2fs: fix to avoid call kvfree under spinlock
      f2fs: use wrapped IS_SWAPFILE()
      f2fs: fix to use more generic EOPNOTSUPP
      f2fs: use wrapped f2fs_cp_error()
      f2fs: fix to migrate blocks correctly during defragment
      f2fs: fix wrong available node count calculation
      Revert "f2fs: avoid out-of-range memory access"
      f2fs: fix to avoid data corruption by forbidding SSR overwrite
      f2fs: support FS_IOC_{GET,SET}FSLABEL
      f2fs: allocate memory in batch in build_sit_info()
      f2fs: introduce f2fs_match_name() for cleanup
      f2fs: optimize case-insensitive lookups
      f2fs: fix to writeout dirty inode during node flush
      f2fs: fix wrong error injection path in inc_valid_block_count()
      f2fs: clean up __bio_alloc()'s parameter
      f2fs: enhance f2fs_is_checkpoint_ready()'s readability
      f2fs: add missing documents of reserve_root/resuid/resgid
      f2fs: fix error path of f2fs_convert_inline_page()
      f2fs: fix to avoid accessing uninitialized field of inode page in is_alive()
      f2fs: fix extent corrupotion during directIO in LFS mode
      f2fs: fix to handle error path correctly in f2fs_map_blocks
      f2fs: fix to fallback to buffered IO in IO aligned mode
      f2fs: fix to add missing F2FS_IO_ALIGNED() condition

Daniel Rosenberg (3):
      fs: Reserve flag for casefolding
      f2fs: include charset encoding information in the superblock
      f2fs: Support case-insensitive file name lookups

Goldwyn Rodrigues (1):
      f2fs: fix inode rwsem regression

Jaegeuk Kim (4):
      f2fs: fix livelock in swapfile writes
      f2fs: fix flushing node pages when checkpoint is disabled
      f2fs: convert inline_data in prior to i_size_write
      f2fs: avoid infinite GC loop due to stale atomic files

Jia-Ju Bai (1):
      fs: f2fs: Remove unnecessary checks of SM_I(sbi) in update_general_status()

Lihong Kou (2):
      f2fs: remove duplicate code in f2fs_file_write_iter
      f2fs: cleanup the code in build_sit_entries.

Lockywolf (1):
      f2fs: Add a small clarification to CONFIG_FS_F2FS_FS_SECURITY

Sahitya Tummala (3):
      f2fs: Fix indefinite loop in f2fs_gc()
      f2fs: Fix indefinite loop in f2fs_gc()
      f2fs: add a condition to detect overflow in f2fs_ioc_gc_range()

Surbhi Palande (1):
      f2fs: check all the data segments against all node ones

YueHaibing (1):
      f2fs: Fix build error while CONFIG_NLS=m

 Documentation/ABI/testing/sysfs-fs-f2fs |   7 ++
 Documentation/filesystems/f2fs.txt      |   8 ++
 fs/f2fs/Kconfig                         |   5 +-
 fs/f2fs/data.c                          | 104 ++++++++++++------
 fs/f2fs/debug.c                         |   4 +-
 fs/f2fs/dir.c                           | 184 ++++++++++++++++++++++++++++++--
 fs/f2fs/f2fs.h                          |  47 ++++++--
 fs/f2fs/file.c                          | 162 ++++++++++++++++++++++------
 fs/f2fs/gc.c                            |  27 ++++-
 fs/f2fs/hash.c                          |  37 ++++++-
 fs/f2fs/inline.c                        |  18 +++-
 fs/f2fs/inode.c                         |  11 +-
 fs/f2fs/namei.c                         |  54 ++++++----
 fs/f2fs/node.c                          |  57 +++++++++-
 fs/f2fs/segment.c                       | 135 ++++++++++++-----------
 fs/f2fs/segment.h                       |  12 ++-
 fs/f2fs/super.c                         | 156 +++++++++++++++++++++++++--
 fs/f2fs/sysfs.c                         |  23 ++++
 fs/f2fs/xattr.c                         |   6 ++
 include/linux/f2fs_fs.h                 |  10 +-
 include/uapi/linux/fs.h                 |   1 +
 tools/include/uapi/linux/fs.h           |   1 +
 22 files changed, 865 insertions(+), 204 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
