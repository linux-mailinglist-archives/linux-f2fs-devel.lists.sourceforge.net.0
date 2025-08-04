Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B52B1AA6D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Aug 2025 23:40:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:To:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QIML3DJ5L3KFwFcO1FCjdg4EbCsq8dx7KIFYqqbDRGM=; b=aBpQ7z10o0G0sejRhIBG6MhU/f
	4a5dZPowzPeXaVfzAzZIppibN6n/Svjk2X/otyhor64IMjND6/imu79HPHFdo+3fTccPUnPS1lpkw
	p5c7SN025cFo3NVG9Ol2+ZfS8SgHJ5wvma7l5hYGAjG44e67VHarMDvF7woKHIHHnjuo=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uj2vI-0000CR-PP;
	Mon, 04 Aug 2025 21:40:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1uj2uh-0000AL-8Z
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Aug 2025 21:40:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eoY28P4XO53vxp0Rg5aAFbxqgqKHZWJzvj19W3U8AWc=; b=T0uCXC48Ttb4UOLFBVeRrOiSNJ
 8OJSe4krY0jRRUq6afzPbIbTEjmfuYXuD4I6YoGwxVaNmnc95qnw5dwPTRH+WWnTMalh/gsLI+d5D
 0oXBmqyLZqm70Tfax4VnO+/0EaoB7abahK34G74ZsSNUkCXbcZ79tVFz5YxDYr3+BzKM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=eoY28P4XO53vxp0Rg5aAFbxqgqKHZWJzvj19W3U8AWc=; b=F
 VKWZxNa9HsJKaKajoD3tLQbVu6fn9844QAsJWKnqDUmZ2OLbKj2z7JSfYXcb0a4Gkeb0bvsRu7SQb
 K3p0imkXHJIVouUQHTU92Zhk5x5McRQNgNg3g26mMXtLPNbH8SEJUpYoWQhXmSWKDmHJ1BeSX1NX7
 AY6fp29rf7s8+9nA=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uj2uf-0007qo-Qn for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Aug 2025 21:40:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 38E38A557E0;
 Mon,  4 Aug 2025 21:40:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB6F3C4CEE7;
 Mon,  4 Aug 2025 21:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754343603;
 bh=wpCbMoYZl7wrgj40DCEWhKnt3Q9KlL4TAexMlaA+2XI=;
 h=Date:From:To:Cc:Subject:From;
 b=bW/SuZzv8XiBWdDRsskg/E9qifCDGTfTDkq7So1CJcpkV1gNUhO6OzmwHAaBkLiuM
 f6XdnUq7J1Vab2feuA5SXsYub0SS/yGqvb6gI0XPig9h3BJJmb1NJJE0gF9RJkl95W
 9q32CL0D+0v9esL9VxE8B1PH3mS3vZTUXH1i1dBp4qBYd54iQZtf4uEBygW9OIzYZS
 /Tf5YaCtTVbowYwhbme+h4kjntN2hp0N4aqUGuFA1BQMrzipqRmGsMiisbA4wsUEQQ
 /LTmlWfcQc4VJelgJ/Uo319PY1XXoXguDqxb8CR0JC9QD3QSPwiVL41kPioQYnbX5Q
 yLUbOdk+xsxNg==
Date: Mon, 4 Aug 2025 21:40:02 +0000
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <aJEosjoG_mD0OgwK@google.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Linus, Could you please consider this pull request? Thanks,
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uj2uf-0007qo-Qn
Subject: [f2fs-dev] [GIT PULL] f2fs for 6.17-rc1
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

The following changes since commit 78f4e737a53e1163ded2687a922fce138aee73f5:

  Merge tag 'for-6.16/dm-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm (2025-06-23 15:02:57 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-6.17-rc1

for you to fetch changes up to 078cad8212ce4f4ebbafcc0936475b8215e1ca2a:

  f2fs: drop inode from the donation list when the last file is closed (2025-07-30 17:13:12 +0000)

----------------------------------------------------------------
f2fs-for-6.17-rc1

In this round, we've mainly updated three parts: 1) folio conversion by Matthew,
2) switch to a new mount API by Hongbo and Eric, and 3) several sysfs entries
to tune GCs for ZUFS with finer granularity by Daeho. There are also patches
to address bugs and issues in the existing features such as GCs, file pinning,
write-while-dio-read, contingous block allocation, and memory access violations.

Enhancement:
 - switch to new mount API and folio conversion
 - add sysfs nodes to controle F2FS GCs for ZUFS
 - improve performance on the nat entry cache
 - drop inode from the donation list when the last file is closed
 - avoid splitting bio when reading multiple pages

Bug fix:
 - fix to trigger foreground gc during f2fs_map_blocks() in lfs mode
 - make sure zoned device GC to use FG_GC in shortage of free section
 - fix to calculate dirty data during has_not_enough_free_secs()
 - fix to update upper_p in __get_secs_required() correctly
 - wait for inflight dio completion, excluding pinned files read using dio
 - don't break allocation when crossing contiguous sections
 - vm_unmap_ram() may be called from an invalid context
 - fix to avoid out-of-boundary access in dnode page
 - fix to avoid panic in f2fs_evict_inode
 - fix to avoid UAF in f2fs_sync_inode_meta()
 - fix to use f2fs_is_valid_blkaddr_raw() in do_write_page()
 - fix UAF of f2fs_inode_info in f2fs_free_dic
 - fix to avoid invalid wait context issue
 - fix bio memleak when committing super block
 - handle nat.blkaddr corruption in f2fs_get_node_info()

In addition, there are also clean-ups and minor bug fixes.

----------------------------------------------------------------
Abinash Singh (1):
      f2fs: fix KMSAN uninit-value in extent_info usage

Chao Yu (18):
      f2fs: handle nat.blkaddr corruption in f2fs_get_node_info()
      f2fs: do sanity check on fio.new_blkaddr in do_write_page()
      f2fs: fix to avoid invalid wait context issue
      f2fs: introduce reserved_pin_section sysfs entry
      f2fs: account and print more stats during recovery
      f2fs: fix to check upper boundary for gc_valid_thresh_ratio
      f2fs: fix to check upper boundary for gc_no_zoned_gc_percent
      f2fs: fix to use f2fs_is_valid_blkaddr_raw() in do_write_page()
      f2fs: doc: fix wrong quota mount option description
      f2fs: fix to avoid UAF in f2fs_sync_inode_meta()
      f2fs: fix to avoid panic in f2fs_evict_inode
      f2fs: introduce is_cur{seg,sec}()
      f2fs: fix to avoid out-of-boundary access in devs.path
      f2fs: fix to avoid out-of-boundary access in dnode page
      f2fs: don't break allocation when crossing contiguous sections
      f2fs: fix to update upper_p in __get_secs_required() correctly
      f2fs: fix to calculate dirty data during has_not_enough_free_secs()
      f2fs: fix to trigger foreground gc during f2fs_map_blocks() in lfs mode

Daeho Jeong (5):
      f2fs: make sure zoned device GC to use FG_GC in shortage of free section
      f2fs: turn off one_time when forcibly set to foreground GC
      f2fs: ignore valid ratio when free section count is low
      f2fs: add gc_boost_gc_multiple sysfs node
      f2fs: add gc_boost_gc_greedy sysfs node

Hongbo Li (7):
      f2fs: Add fs parameter specifications for mount options
      f2fs: move the option parser into handle_mount_opt
      f2fs: Allow sbi to be NULL in f2fs_printk
      f2fs: Add f2fs_fs_context to record the mount options
      f2fs: separate the options parsing and options checking
      f2fs: introduce fs_context_operation structure
      f2fs: switch to the new mount api

Jaegeuk Kim (2):
      f2fs: check the generic conditions first
      f2fs: drop inode from the donation list when the last file is closed

Jan Prusakowski (1):
      f2fs: vm_unmap_ram() may be called from an invalid context

Jianan Huang (1):
      f2fs: avoid splitting bio when reading multiple pages

Jiazi Li (1):
      f2fs: use kfree() instead of kvfree() to free some memory

Matthew Wilcox (Oracle) (60):
      f2fs: Pass a folio to recover_dentry()
      f2fs: Pass a folio to recover_inode()
      f2fs: Pass a folio to recover_quota_data()
      f2fs: Pass a folio to f2fs_recover_inode_page()
      f2fs: Pass a folio to sanity_check_extent_cache()
      f2fs: Pass a folio to sanity_check_inode()
      f2fs: Pass a folio to f2fs_sanity_check_inline_data()
      f2fs: Pass a folio to inode_has_blocks()
      f2fs: Pass a folio to F2FS_INODE()
      f2fs: Pass a folio to ino_of_node()
      f2fs: Pass a folio to nid_of_node()
      f2fs: Pass a folio to is_recoverable_dnode()
      f2fs: Pass a folio to set_dentry_mark()
      f2fs: Pass a folio to set_fsync_mark()
      f2fs: Pass a folio to set_mark()
      f2fs: Pass a folio to f2fs_allocate_data_block()
      f2fs: Pass a folio to f2fs_inode_chksum_set()
      f2fs: Pass a folio to f2fs_enable_inode_chksum()
      f2fs: Pass a folio to f2fs_inode_chksum()
      f2fs: Pass a folio to fill_node_footer_blkaddr()
      f2fs: Pass a folio to get_nid()
      f2fs: Pass a folio to set_cold_node()
      f2fs: Pass folios to copy_node_footer()
      f2fs: Pass a folio to fill_node_footer()
      f2fs: Pass a folio to cpver_of_node()
      f2fs: Pass a folio to f2fs_recover_xattr_data()
      f2fs: Pass a folio to is_fsync_dnode()
      f2fs: Pass a folio to is_dent_dnode()
      f2fs: Add fio->folio
      f2fs: Use folio_unlock() in f2fs_write_compressed_pages()
      f2fs: Pass a folio to is_cold_node()
      f2fs: Pass a folio to is_node()
      f2fs: Pass a folio to IS_DNODE()
      f2fs: Pass a folio to ofs_of_node()
      f2fs: Pass a folio to get_dnode_base()
      f2fs: Pass a folio to ADDRS_PER_PAGE()
      f2fs: Pass a folio to IS_INODE()
      f2fs: Add folio counterparts to page_private_flags functions
      f2fs: Use a folio in f2fs_is_cp_guaranteed()
      f2fs: Convert set_page_private_data() to folio_set_f2fs_data()
      f2fs: Convert get_page_private_data() to folio_get_f2fs_data()
      f2fs: Pass a folio to f2fs_compress_write_end_io()
      f2fs: Use a folio in f2fs_merge_page_bio()
      f2fs: Use a bio in f2fs_submit_page_write()
      f2fs: Pass a folio to WB_DATA_TYPE() and f2fs_is_cp_guaranteed()
      f2fs: Use a folio iterator in f2fs_handle_step_decompress()
      f2fs: Pass a folio to f2fs_end_read_compressed_page()
      f2fs: Use a folio iterator in f2fs_verify_bio()
      f2fs: Pass a folio to f2fs_is_compressed_page()
      f2fs: Convert get_next_nat_page() to get_next_nat_folio()
      f2fs: Pass the nat_blk to __update_nat_bits()
      f2fs: Pass a folio to F2FS_NODE()
      f2fs: Pass a folio to f2fs_cache_compressed_page()
      f2fs: Use a folio in f2fs_encrypted_get_link()
      f2fs: Use F2FS_F_SB() in f2fs_read_end_io()
      f2fs: Remove clear_page_private_all()
      f2fs: Remove use of page from f2fs_write_single_data_page()
      f2fs: Pass a folio to f2fs_submit_merged_write_cond()
      f2fs: Pass a folio to __has_merged_page()
      f2fs: Remove F2FS_P_SB()

Sheng Yong (2):
      f2fs: fix bio memleak when committing super block
      f2fs: remove unnecessary tracepoint enabled check

Swarna Prabhu (1):
      f2fs: Fix the typos in comments

Zhiguo Niu (2):
      f2fs: compress: change the first parameter of page_array_{alloc,free} to sbi
      f2fs: compress: fix UAF of f2fs_inode_info in f2fs_free_dic

mason.zhang (1):
      f2fs: merge the two conditions to avoid code duplication

wangzijie (4):
      f2fs: convert F2FS_I_SB to sbi in f2fs_setattr()
      f2fs: don't allow unaligned truncation to smaller/equal size on pinned file
      f2fs: avoid redundant clean nat entry move in lru list
      f2fs: directly add newly allocated pre-dirty nat entry to dirty set list

yohan.joung (3):
      f2fs: fix to check upper boundary for value of gc_boost_zoned_gc_percent
      f2fs: enable tuning of boost_zoned_gc_percent via sysfs
      f2fs: zone: wait for inflight dio completion, excluding pinned files read using dio

 Documentation/ABI/testing/sysfs-fs-f2fs |   22 +
 Documentation/filesystems/f2fs.rst      |    6 +-
 fs/f2fs/checkpoint.c                    |    8 +-
 fs/f2fs/compress.c                      |  120 +-
 fs/f2fs/data.c                          |  183 +--
 fs/f2fs/debug.c                         |   21 +-
 fs/f2fs/dir.c                           |    4 +-
 fs/f2fs/extent_cache.c                  |   10 +-
 fs/f2fs/f2fs.h                          |  151 ++-
 fs/f2fs/file.c                          |  107 +-
 fs/f2fs/gc.c                            |   54 +-
 fs/f2fs/gc.h                            |    5 +-
 fs/f2fs/inline.c                        |   20 +-
 fs/f2fs/inode.c                         |   84 +-
 fs/f2fs/namei.c                         |   12 +-
 fs/f2fs/node.c                          |  261 ++--
 fs/f2fs/node.h                          |   77 +-
 fs/f2fs/recovery.c                      |  116 +-
 fs/f2fs/segment.c                       |   62 +-
 fs/f2fs/segment.h                       |   59 +-
 fs/f2fs/super.c                         | 2111 ++++++++++++++++++-------------
 fs/f2fs/sysfs.c                         |   48 +
 include/linux/f2fs_fs.h                 |    2 +-
 include/linux/fscrypt.h                 |   10 +-
 24 files changed, 2019 insertions(+), 1534 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
