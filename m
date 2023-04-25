Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC346EE78F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Apr 2023 20:36:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1prNWc-0004Px-W4;
	Tue, 25 Apr 2023 18:36:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1prNWT-0004Pr-2u
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Apr 2023 18:36:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=avwF1Cc6TtZjWk2I5X9HGD0YEXJ7M8wipMf84IyPtok=; b=KTOD1acbRI3mEHr70fSs+2XNIh
 ZBM99gggZi3XVK0BLpQHlP4aazcaDh12Tfe6njpb+32Bo+C8US+6SFDP6hhoR84ihpMo8hkCHhLiS
 a58Spn9rfwp19oIKvuLQsi8QPN37cgkT+KtelW4MdOunCAAu9h140oMKqJc9StHyrS6k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=avwF1Cc6TtZjWk2I5X9HGD0YEXJ7M8wipMf84IyPtok=; b=e
 x9/LPgLBr53DQIFsnq8t69ARPM3kNNRhL8wle+/hKxY4LMzP7gnNSauL5WhnnGD1z9AuLdIk2YsFT
 uTQuOPiGObRC1d4ArGX+tpM5OQjR2xBBcyOoQ2q++9/LpUkULbO7TH0xIdNNfndSqe4k3uDTWfpQQ
 70uD/VPcP7L06c78=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1prNWS-0007ok-LE for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Apr 2023 18:36:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 49C1761403;
 Tue, 25 Apr 2023 18:36:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 945E9C433D2;
 Tue, 25 Apr 2023 18:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682447770;
 bh=ai2eDZjdIlPTRpRxYqniC77LrA1HSD9tpG1QN3G8gqM=;
 h=Date:From:To:Cc:Subject:From;
 b=j4xE6o/nI2Mfq6F/NdSzxq/dl6Y23ATp1ZY7dQtg97i5EvsNQb7nj8tsk9QCLZlXj
 iepyd9QP6jDPa18XgKlMSiSrF8Ty+k74baIKaK/Z4s/D2b5kczG+UA/NHiXKlFVGZS
 kVBe0kNKmakJpRuPmVpagyRf+FcoPZE8jPd0x+PkT5nCMrtZTMwnfCJ3qEsY+xhW0U
 fcDfOL2Vus59sVjDi7+b52cIygpjxsRxdvHUGKvochF/D9jsjWqSifra8W7QzMZ54s
 rZODztOP7DLDxdRdvm0E+MfrbcuCkWFqGQCG6bIJn9QklI6VVuJvBSe5ZsKZGKNv6I
 2sAbs801+uiZA==
Date: Tue, 25 Apr 2023 11:36:08 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <ZEgdmJWhJX9NJ0fG@google.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Linus, Could you please consider this pull request? Thanks,
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1prNWS-0007ok-LE
Subject: [f2fs-dev] [GIT PULL] f2fs update for 6.4
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

The following changes since commit ffe78bbd512166e0ef1cc4858010b128c510ed7d:

  Merge tag 'xtensa-20230327' of https://github.com/jcmvbkbc/linux-xtensa (2023-03-29 10:24:07 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-6.4-rc1

for you to fetch changes up to 8375be2b6414577487486a92995bdc97a7934033:

  f2fs: remove unnessary comment in __may_age_extent_tree (2023-04-24 11:03:10 -0700)

----------------------------------------------------------------
f2fs update for 6.4-rc1

In this round, we've mainly modified to support non-power-of-two zone size,
which is not required for f2fs by design. In order to avoid arch dependency,
we refactored the messy rb_entry structure shared across different extent_cache.
In addition to the improvement, we've also fixed several subtle bugs and
error cases.

Enhancement:
- support non-power-of-two zone size for zoned device
- remove sharing the rb_entry structure in extent cache
- refactor f2fs_gc to call checkpoint in urgent condition
- support iopoll

Bug fix:
- fix potential corruption when moving a directory
- fix to avoid use-after-free for cached IPU bio
- fix the folio private usage
- avoid kernel warnings or panics in the cp_error case
- fix to recover quota data correctly
- fix some bugs in atomic operations
- fix system crash due to lack of free space in LFS
- fix null pointer panic in tracepoint in __replace_atomic_write_block
- fix iostat lock protection
- fix scheduling while atomic in decompression path
- preserve direct write semantics when buffering is forced
- fix to call f2fs_wait_on_page_writeback() in f2fs_write_raw_pages()

----------------------------------------------------------------
Chao Yu (10):
      f2fs: use f2fs_hw_is_readonly() instead of bdev_read_only()
      f2fs: remove unneeded in-memory i_crtime copy
      f2fs: fix to avoid use-after-free for cached IPU bio
      f2fs: fix to drop all dirty pages during umount() if cp_error is set
      f2fs: fix to keep consistent i_gc_rwsem lock order
      f2fs: fix to check readonly condition correctly
      f2fs: fix to recover quota data correctly
      f2fs: fix to check return value of f2fs_do_truncate_blocks()
      f2fs: fix to check return value of inc_valid_block_count()
      f2fs: remove folio_detach_private() in .invalidate_folio and .release_folio

Daeho Jeong (3):
      f2fs: fix passing relative address when discard zones
      f2fs: use cow inode data when updating atomic write
      f2fs: allocate node blocks for atomic write block replacement

Hans Holmberg (1):
      f2fs: preserve direct write semantics when buffering is forced

Jaegeuk Kim (10):
      f2fs: factor out victim_entry usage from general rb_tree use
      f2fs: factor out discard_cmd usage from general rb_tree use
      f2fs: remove entire rb_entry sharing
      f2fs: apply zone capacity to all zone type
      f2fs: fix scheduling while atomic in decompression path
      f2fs: fix null pointer panic in tracepoint in __replace_atomic_write_block
      f2fs: fix potential corruption when moving a directory
      f2fs: refactor f2fs_gc to call checkpoint in urgent condition
      f2fs: relax sanity check if checkpoint is corrupted
      f2fs: remove power-of-two limitation of zoned device

Li Zetao (1):
      f2fs: make f2fs_sync_inode_meta() static

Qi Han (1):
      f2fs: remove unnessary comment in __may_age_extent_tree

Qilin Tan (1):
      f2fs: fix iostat lock protection

Wang Han (1):
      docs: f2fs: Correct instruction to disable checkpoint

Weizhao Ouyang (1):
      f2fs: use common implementation of file type

Wu Bo (2):
      f2fs: support iopoll method
      f2fs: allocate trace path buffer from names_cache

Yangtao Li (16):
      f2fs: export compress_percent and compress_watermark entries
      f2fs: convert to use bitmap API
      f2fs: handle dqget error in f2fs_transfer_project_quota()
      f2fs: convert to MAX_SBI_FLAG instead of 32 in stat_show()
      f2fs: fix to handle filemap_fdatawrite() error in f2fs_ioc_decompress_file/f2fs_ioc_compress_file
      f2fs: remove else in f2fs_write_cache_pages()
      f2fs: compress: fix to call f2fs_wait_on_page_writeback() in f2fs_write_raw_pages()
      f2fs: convert is_extension_exist() to return bool type
      f2fs: add compression feature check for all compress mount opt
      f2fs: remove struct victim_selection default_v_ops
      f2fs: set default compress option only when sb_has_compression
      f2fs: convert to use sysfs_emit
      f2fs: merge lz4hc_compress_pages() to lz4_compress_pages()
      f2fs: remove batched_trim_sections node description
      f2fs: remove bulk remove_proc_entry() and unnecessary kobject_del()
      f2fs: add has_enough_free_secs()

Yohan Joung (2):
      f2fs: fix align check for npo2
      f2fs: add radix_tree_preload_end in error case

Yonggil Song (3):
      f2fs: fix uninitialized skipped_gc_rwsem
      f2fs: Fix discard bug on zoned block devices with 2MiB zone size
      f2fs: Fix system crash due to lack of free space in LFS

 Documentation/ABI/testing/sysfs-fs-f2fs |  23 +-
 Documentation/filesystems/f2fs.rst      |   2 +-
 fs/f2fs/checkpoint.c                    |  52 ++---
 fs/f2fs/compress.c                      |  47 ++--
 fs/f2fs/data.c                          |  71 +++---
 fs/f2fs/debug.c                         |  37 +--
 fs/f2fs/dir.c                           |  47 +---
 fs/f2fs/extent_cache.c                  | 264 +++++++--------------
 fs/f2fs/f2fs.h                          | 252 ++++++++++-----------
 fs/f2fs/file.c                          |  76 +++++--
 fs/f2fs/gc.c                            | 205 ++++++++++-------
 fs/f2fs/gc.h                            |  16 +-
 fs/f2fs/inline.c                        |   2 +-
 fs/f2fs/inode.c                         |   5 +-
 fs/f2fs/namei.c                         |  28 ++-
 fs/f2fs/node.h                          |  20 +-
 fs/f2fs/recovery.c                      |  17 +-
 fs/f2fs/segment.c                       | 390 +++++++++++++++++---------------
 fs/f2fs/segment.h                       |  57 +++--
 fs/f2fs/super.c                         | 111 +++++++--
 fs/f2fs/sysfs.c                         |  50 ++--
 include/linux/f2fs_fs.h                 |  24 +-
 22 files changed, 899 insertions(+), 897 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
