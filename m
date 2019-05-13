Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E771BFE0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 May 2019 01:38:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hQKWc-0000Sw-Aw; Mon, 13 May 2019 23:38:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1hQKWb-0000Sq-CC
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 13 May 2019 23:38:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8GOj/Ovp2WU+NZVYOeeHTKgWGkAuPTN3/xrCKuPptWw=; b=XVx4EwFxgb4cWGCsuE+74W4cKR
 EIItm0Ll2fI+YzijFIaBgDVx1SFPxgYDEMLJLY5zDGnD15FWvqy9RHFswJXZR9uSn7H6m0zf4T0TZ
 5yV/Ws58+DdrJbJE5FiAiajsE1Tmnb5lEeKj6HvhwoZ0tVSfGbl4jKfrgk8QPuaUotYw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=8GOj/Ovp2WU+NZVYOeeHTKgWGkAuPTN3/xrCKuPptWw=; b=U
 vWUhCRhCSHv8t8XPTU/kZm0F1oGqhV8Rufc3RRZocJFDczjFhsKZ9eBA2oZJiDUVUY5EsWDmL6ZgN
 OC+e17M7yJW7S7CD3GlL6m3MvkcA9LOWvc8IvFBcl6e4CTNFL3kfWeH5xhIRUdwW2KTaoCJQqOqGB
 QYpKG7IAoR8gwQ/g=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hQKWa-00FTkh-5z
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 13 May 2019 23:38:29 +0000
Received: from localhost (unknown [104.132.1.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 34AA820879;
 Mon, 13 May 2019 23:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557790699;
 bh=KHo/8VO1q8PL3nZybC3R+kGEoBbsv8Y0Pf5QPxbCbzc=;
 h=Date:From:To:Cc:Subject:From;
 b=gBNHMtoCfSVHnVCV2d0qIt792RO4t/cNNMbhD2pP5rfMubxxghzk65jcy8rBUXY/h
 okAK8lDC6SiKq4pVzMhJS2SIsA4S+O7GQmbciN5EEWmU1dBWMu3Jrl7w472epO3fA/
 HDXE9FOrJsZWoh4E+ea9BH3r/q5WuJf2uS7EsqLA=
Date: Mon, 13 May 2019 16:38:18 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20190513233818.GA33287@jaegeuk-macbookpro.roam.corp.google.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hQKWa-00FTkh-5z
Subject: [f2fs-dev] [GIT PULL] f2fs-for-5.2
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

Thanks as lways,

The following changes since commit 8ed86627f715eacbd6db6862f9499d6d96ea4ad6:

  Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid (2019-04-03 06:11:12 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-v5.2-rc1

for you to fetch changes up to 2777e654371dd4207a3a7f4fb5fa39550053a080:

  f2fs: fix to avoid accessing xattr across the boundary (2019-05-09 09:43:29 -0700)

----------------------------------------------------------------
f2fs-for-5.2-rc1

Another round of various bug fixes came in. Damien improved SMR drive support a
bit, and Chao replaced BUG_ON() with reporting errors to user since we've not
hit from users but did hit from crafted images. We've found a disk layout bug
in large_nat_bits feature which supports very large NAT entries enabled at mkfs.
If the feature is enabled, it will give a notice to run fsck to correct the
on-disk layout.

Enhancement:
 - reduce memory consumption for SMR drive
 - better discard handling for multiple partitions
 - tracepoints for f2fs_file_write_iter/f2fs_filemap_fault
 - allow to change CP_CHKSUM_OFFSET
 - detect wrong layout of large_nat_bitmap feature
 - enhance checking valid data indices

Bug fix:
 - Multiple partition support for SMR drive
 - deadlock problem in f2fs_balance_fs_bg
 - add boundary checks to fix abnormal behaviors on fuzzed images
 - inline_xattr space calculations
 - replace f2fs_bug_on with errors

In addition, this series contains various memory boundary check and sanity check
of on-disk consistency.

----------------------------------------------------------------
Chao Yu (31):
      f2fs: fix potential recursive call when enabling data_flush
      f2fs: add comment for conditional compilation statement
      f2fs: add tracepoint for f2fs_file_write_iter()
      f2fs: fix to avoid deadloop in foreground GC
      f2fs: fix error path of recovery
      f2fs: fix to retrieve inline xattr space
      f2fs: fix to use inline space only if inline_xattr is enable
      f2fs: fix to avoid panic in dec_valid_block_count()
      f2fs: fix to avoid panic in dec_valid_node_count()
      f2fs: fix wrong __is_meta_io() macro
      f2fs: remove new blank line of f2fs kernel message
      f2fs: fix to clear dirty inode in error path of f2fs_iget()
      f2fs: fix to avoid panic in f2fs_remove_inode_page()
      f2fs: fix to do checksum even if inode page is uptodate
      f2fs: fix to do sanity check on free nid
      f2fs: fix to avoid panic in do_recover_data()
      f2fs: fix to do sanity check on valid node/block count
      f2fs: fix to do sanity check on valid block count of segment
      f2fs: fix to avoid panic in f2fs_inplace_write_data()
      f2fs: fix to set FI_UPDATE_WRITE correctly
      f2fs: introduce f2fs_read_single_page() for cleanup
      f2fs: allow address pointer number of dnode aligning to specified size
      f2fs: allow unfixed f2fs_checkpoint.checksum_offset
      f2fs: relocate chksum_offset for large_nat_bitmap feature
      f2fs: fix to consider multiple device for readonly check
      f2fs: fix to skip recovery on readonly device
      f2fs: fix to be aware of readonly device in write_checkpoint()
      f2fs: fix to handle error in f2fs_disable_checkpoint()
      f2fs: introduce DATA_GENERIC_ENHANCE
      f2fs: add tracepoint for f2fs_filemap_fault()
      f2fs: fix to avoid potential race on sbi->unusable_block_count access/update

Chengguang Xu (1):
      f2fs: remove redundant check in f2fs_file_write_iter()

Damien Le Moal (3):
      f2fs: Fix use of number of devices
      f2fs: Reduce zoned block device memory usage
      f2fs: improve discard handling with multi-device volumes

Hariprasad Kelam (1):
      f2fs: data: fix warning Using plain integer as NULL pointer

Park Ju Hyung (1):
      f2fs: mark is_extension_exist() inline

Randall Huang (1):
      f2fs: fix to avoid accessing xattr across the boundary

Youngjun Yoo (2):
      f2fs: insert space before the open parenthesis '('
      f2fs: Replace spaces with tab

 fs/f2fs/acl.c               |   4 +-
 fs/f2fs/checkpoint.c        | 108 +++++++++++++----
 fs/f2fs/data.c              | 285 +++++++++++++++++++++++++-------------------
 fs/f2fs/f2fs.h              | 127 +++++++++++++++-----
 fs/f2fs/file.c              |  76 +++++++-----
 fs/f2fs/gc.c                |  16 ++-
 fs/f2fs/inline.c            |  17 +++
 fs/f2fs/inode.c             |  12 +-
 fs/f2fs/namei.c             |   2 +-
 fs/f2fs/node.c              |  43 +++++--
 fs/f2fs/recovery.c          |  37 +++++-
 fs/f2fs/segment.c           |  71 ++++++-----
 fs/f2fs/segment.h           |  16 +--
 fs/f2fs/super.c             |  70 ++++++++---
 fs/f2fs/xattr.c             |  36 ++++--
 fs/f2fs/xattr.h             |   2 +
 include/linux/f2fs_fs.h     |  11 +-
 include/trace/events/f2fs.h |  57 +++++++++
 18 files changed, 688 insertions(+), 302 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
