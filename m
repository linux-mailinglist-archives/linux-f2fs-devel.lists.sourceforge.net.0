Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 07942240DD3
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Aug 2020 21:11:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k5DCk-0004lJ-Go; Mon, 10 Aug 2020 19:11:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1k5DCj-0004lA-6k
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 Aug 2020 19:11:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pdO/FbMOyLdHmWuwvJbjAf0du30ycOptkwkpG5bnnc0=; b=Rd/GQv6qeM/rExPx42yfvQrDAA
 0aczRdroZ8h0suYyNxgH/veMCKBDo1tGjdUyo6ynSDhtioxdcN9pPp2w84muStSoHPjw+XALCOMte
 MVzvf9kwy0roZ3rRV1+6Mv3KqbdkoWuvD9h1DUUx0dA9ig5CxUcj2FSdVsB7urAyyIew=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=pdO/FbMOyLdHmWuwvJbjAf0du30ycOptkwkpG5bnnc0=; b=D
 sYK2s1G8Q5Mo2x1P+Rx3fJWrB011efBWXI6Xh9tueS+RUOlGBTNJ5HdKnNBLAVt321mN5ZAeRd9Ax
 tMF63LECDHe3mUED+NMHe2G7tkK1e0d3Mk32UMYCwhKpCb6D+81oUtdOxQP8a8FktHODBaBdec0kY
 Jd0qmGKxHi7W0WC0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k5DCh-0038HS-Uv
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 Aug 2020 19:11:29 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6593F2078D;
 Mon, 10 Aug 2020 19:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597086682;
 bh=oz5lfY+7L8NdSeywy+XO6G18fZmEfvnJI25DMElnV3Y=;
 h=Date:From:To:Cc:Subject:From;
 b=q0G1r97fVhzwoiwIHcsQ08uQj7Nw9c3f3dN8RYSCNPT93vYorSMAVZPLaaQlkbbMO
 Qg/PJQYjODJqmhTlaL6XO60cmhvFj6RNt0jf34VEhMqc5/Qq8pljxj/3xeUYdYXdRs
 a8hCdVwA11+PhCWstihdTVbViXZ8ygtOEMiIkMDg=
Date: Mon, 10 Aug 2020 12:11:21 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20200810191121.GA2745602@google.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -0.4 (/)
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
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k5DCh-0038HS-Uv
Subject: [f2fs-dev] [GIT PULL] f2fs update for 5.9-rc1
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

The following changes since commit b29482fde649c72441d5478a4ea2c52c56d97a5e:

  Merge branch 'work.epoll' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs (2020-06-10 18:09:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-5.9-rc1

for you to fetch changes up to 828add774f0d2bf930cdeca6c982c1fbcdd846bb:

  f2fs: prepare a waiter before entering io_schedule (2020-08-03 20:54:58 -0700)

----------------------------------------------------------------
f2fs-for-5.9-rc1

In this round, we've added two small interfaces, 1) GC_URGENT_LOW mode for
performance, and 2) F2FS_IOC_SEC_TRIM_FILE ioctl for security. The new GC
mode allows Android to run some lower priority GCs in background, while new
ioctl discards user information without race condition when the account is
removed. In addition, some patches were merged to address latency-related
issues. We've fixed some compression-related bug fixes as well as edge race
conditions.

Enhancement:
 - add GC_URGENT_LOW mode in gc_urgent
 - introduce F2FS_IOC_SEC_TRIM_FILE ioctl
 - bypass racy readahead to improve read latencies
 - shrink node_write lock coverage to avoid long latency

Bug fix:
 - fix missing compression flag control, i_size, and mount option
 - fix deadlock between quota writes and checkpoint
 - remove inode eviction path in synchronous path to avoid deadlock
 - fix to wait GCed compressed page writeback
 - fix a kernel panic in f2fs_is_compressed_page
 - check page dirty status before writeback
 - wait page writeback before update in node page write flow
 - fix a race condition between f2fs_write_end_io and f2fs_del_fsync_node_entry

We've added some minor sanity checks and refactored trivial code blocks for
better readability and debugging information.

----------------------------------------------------------------
Chao Yu (21):
      f2fs: add prefix for exported symbols
      f2fs: fix to document reserved special compression extension
      f2fs: shrink node_write lock coverage
      f2fs: clean up parameter of f2fs_allocate_data_block()
      f2fs: show more debug info for per-temperature log
      f2fs: fix to wait page writeback before update
      f2fs: fix wrong return value of f2fs_bmap_compress()
      f2fs: support to trace f2fs_bmap()
      f2fs: support to trace f2fs_fiemap()
      f2fs: fix to check page dirty status before writeback
      f2fs: split f2fs_allocate_new_segments()
      f2fs: fix return value of move_data_block()
      f2fs: fix to wait GCed compressed page writeback
      f2fs: fix wrong description of compress feature in f2fs.rst
      f2fs: fix error path in do_recover_data()
      f2fs: don't keep meta inode pages used for compressed block migration
      f2fs: compress: fix to avoid memory leak on cc->cpages
      f2fs: compress: fix to update isize when overwriting compressed file
      f2fs: compress: delay temp page allocation
      f2fs: compress: add sanity check during compressed cluster read
      f2fs: compress: disable compression mount option if compression is off

Daeho Jeong (3):
      f2fs: add GC_URGENT_LOW mode in gc_urgent
      f2fs: add F2FS_IOC_SEC_TRIM_FILE ioctl
      f2fs: make file immutable even if releasing zero compression block

Dehe Gu (1):
      f2fs: remove write attribute of main_blkaddr sysfs node

Denis Efremov (1):
      f2fs: use kfree() instead of kvfree() to free superblock data

Eric Biggers (1):
      f2fs: use generic names for generic ioctls

Jack Qiu (4):
      f2fs: get the right gc victim section when section has several segments
      f2fs: space related cleanup
      f2fs: correct comment of f2fs_exist_written_data
      f2fs: use macro instead of f2fs verity version

Jaegeuk Kim (5):
      f2fs: avoid checkpatch error
      f2fs: avoid readahead race condition
      f2fs: should avoid inode eviction in synchronous path
      f2fs: fix deadlock between quota writes and checkpoint
      f2fs: prepare a waiter before entering io_schedule

Jia Yang (2):
      f2fs: add parameter op_flag in f2fs_submit_page_read()
      f2fs: Change the type of f2fs_flush_inline_data() to void

Li Guifu (1):
      f2fs: fix use-after-free issue

Lihong Kou (1):
      f2fs: make trace enter and end in pairs for unlink

Liu Song (2):
      f2fs: fix typo in comment of f2fs_do_add_link
      f2fs: remove useless parameter of __insert_free_nid()

Qilong Zhang (1):
      f2fs: add f2fs_gc exception handle in f2fs_ioc_gc_range

Randy Dunlap (1):
      f2fs: segment.h: delete a duplicated word

Wang Xiaojun (2):
      f2fs: use kfree() to free variables allocated by match_strdup()
      f2fs: remove the unused compr parameter

Wei Fang (1):
      f2fs: remove useless truncate in f2fs_collapse_range()

Wuyun Zhao (1):
      f2fs: fix a race condition between f2fs_write_end_io and f2fs_del_fsync_node_entry

Yu Changchun (1):
      f2fs: fix an oops in f2fs_is_compressed_page

Yubo Feng (1):
      f2fs: lost matching-pair of trace in f2fs_truncate_inode_blocks

Yufen Yu (1):
      f2fs: replace test_and_set/clear_bit() with set/clear_bit()

Zhihao Cheng (1):
      f2fs: update_sit_entry: Make the judgment condition of f2fs_bug_on more intuitive

 Documentation/ABI/testing/sysfs-fs-f2fs |   4 +-
 Documentation/filesystems/f2fs.rst      |   6 +-
 fs/f2fs/checkpoint.c                    |  15 +-
 fs/f2fs/compress.c                      |  89 ++++++++---
 fs/f2fs/data.c                          |  93 ++++++++---
 fs/f2fs/debug.c                         |  64 ++++++--
 fs/f2fs/dir.c                           |   2 +-
 fs/f2fs/extent_cache.c                  |  18 +--
 fs/f2fs/f2fs.h                          |  81 +++++-----
 fs/f2fs/file.c                          | 264 +++++++++++++++++++++++++++-----
 fs/f2fs/gc.c                            |  75 +++++----
 fs/f2fs/inline.c                        |  21 ++-
 fs/f2fs/inode.c                         |   4 +-
 fs/f2fs/namei.c                         |  18 ++-
 fs/f2fs/node.c                          |  38 +++--
 fs/f2fs/recovery.c                      |  12 +-
 fs/f2fs/segment.c                       | 129 +++++++++++-----
 fs/f2fs/segment.h                       |  10 +-
 fs/f2fs/super.c                         |  68 ++++----
 fs/f2fs/sysfs.c                         |  23 ++-
 fs/f2fs/verity.c                        |   6 +-
 fs/f2fs/xattr.c                         |   4 +-
 include/trace/events/f2fs.h             |  63 ++++++++
 23 files changed, 815 insertions(+), 292 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
