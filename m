Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1066AA9FD25
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Apr 2025 00:40:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qxA7GVzHcofMVhlcRQRCz5IPJLVzXpkduJ5oc+WcB+U=; b=dL9GK2AAdcm3VxZSlqVJoEOlIC
	pDIhrsAXeE4cOZAn41G+JcDvQ4cCwqPma4ZPvs8ddMFo28xFquhHlc/oV4s8qXL/zpB50xHOD5s/P
	En41u2m7QGUcPGQCgyXIj/UwqNzVUoKpkNUZSGgSsddZ6qcQnkkRjY8neln0RsP7Lr0s=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u9X9R-0005ge-BX;
	Mon, 28 Apr 2025 22:40:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1u9X9P-0005gV-8W
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Apr 2025 22:40:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4a+Uq1EOhX8wC6QaMVxvtSpSZFbhuB6aBDv+G4XAli0=; b=N771qryoCMu4gsvDMV6tQabVHd
 Ds2ELu5fVlhIac6/SZ5Ny5Wxmvjx4wSUStjzPhwQkSWt4ZU0Gh48G5WiIULf3JC6xZVyEp7SHN5WM
 UXIUjWnDcORl0vHbjc6kzc4qtw/y7BhncWxt5PU1ETdcj3ANsr0Wi18ZFapA3IYY61V0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4a+Uq1EOhX8wC6QaMVxvtSpSZFbhuB6aBDv+G4XAli0=; b=ctpGeGCXU8Bua9nLdvukqRxuyn
 EsvCzpNk6CQzgvjlxTpADfmtkbfv5OKMGs6gsi64mkyAyHkP91GZ/JpXqTwPwq6XVxh/e9hHlSU6R
 ERQ5RAVkbPyZv2L6uuqOeAyvGzr/ZeDW+CjdxnRJCVMtjcjI9rmyNaGtvouu1RLCAuV8=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u9X98-0002Jz-EC for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Apr 2025 22:40:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 65593614AF;
 Mon, 28 Apr 2025 22:39:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55B6AC4CEE4;
 Mon, 28 Apr 2025 22:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745880012;
 bh=QeKUSw26SEYNA9gkHwhXpiC7cQ61GDz66/onamG51ZU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=eM2cUrrEN7iJz4yH8qqjOHonI7WPYgmJTm4lvqhabT3v4xKwzeMG3x+Ga+Pa3KiTr
 3MYwOC+Ipwf+lrpX+xijBCgzrJw9e0Nn7vD6gIP1uCir5r0MAjIb2zfB9QYt0d/MEo
 VUvyyk/wu2HMsm5C/IkWGXsAoyvmPMzWz66g0HeYoZVyCJ/RzZNLz1Mzvd6xn1U/FV
 rmN7U3V5o25Bi+5bbnuUbcFCRkFGdQHGQzLKu/CAWhYz/b/CV2MfJsnlYNwFQJcNVR
 7iVst+LJqCKu0xhiyEk0P75tS6bTQKQ0EnPLE9BS21EOkOUxDUAXqb9JMCDoc2HyOR
 TGd9VH/Q3KX0w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70EB33822D43; Mon, 28 Apr 2025 22:40:52 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <174588005124.1067750.8958205371842451316.git-patchwork-notify@kernel.org>
Date: Mon, 28 Apr 2025 22:40:51 +0000
References: <20250331201256.1057782-1-willy@infradead.org>
In-Reply-To: <20250331201256.1057782-1-willy@infradead.org>
To: Matthew Wilcox <willy@infradead.org>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 31 Mar 2025 21:10:20 +0100 you
 wrote: > Sorry for the length of this series. Each patch in this series builds,
 > but obviously I haven't done any testing. It should be easy to bisect >
 to any [...] 
 Content analysis details:   (-0.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u9X98-0002Jz-EC
Subject: Re: [f2fs-dev] [PATCH 000/153] f2fs folio conversions for 6.16
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
From: patchwork-bot+f2fs--- via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: patchwork-bot+f2fs@kernel.org
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 31 Mar 2025 21:10:20 +0100 you wrote:
> Sorry for the length of this series.  Each patch in this series builds,
> but obviously I haven't done any testing.  It should be easy to bisect
> to any mistakes I've made.  This conversion isn't complete; I estimate
> another 100 or so patches will be needed.
> 
> Matthew Wilcox (Oracle) (153):
>   f2fs: Use a folio in f2fs_compress_free_page()
>   f2fs: Use a folio in f2fs_write_raw_pages()
>   f2fs: Introduce fio_inode()
>   f2fs: Use F2FS_P_SB() in f2fs_is_compressed_page()
>   f2fs: Use bio_for_each_folio_all() in __has_merged_page()
>   f2fs: Use a folio in add_ipu_page()
>   f2fs: Remove access to page->mapping in f2fs_is_cp_guaranteed()
>   f2fs: Use a folio in move_data_block()
>   f2fs: Use a folio in f2fs_quota_read()
>   f2fs: Add f2fs_grab_meta_folio()
>   f2fs: Use a folio in commit_checkpoint()
>   f2fs: Convert __f2fs_write_meta_page() to __f2fs_write_meta_folio()
>   f2fs: Use f2fs_folio_wait_writeback()
>   f2fs: Pass a folio to f2fs_submit_merged_ipu_write()
>   f2fs: Convert __get_meta_page() to __get_meta_folio()
>   f2fs: Convert f2fs_get_tmp_page() to f2fs_get_tmp_folio()
>   f2fs: Pass a folio to next_blkaddr_of_node()
>   f2fs: Use a folio in f2fs_ra_meta_pages()
>   f2fs: Use a folio in f2fs_ra_meta_pages_cond()
>   f2fs: Use a folio in write_orphan_inodes()
>   f2fs: Use a folio in get_next_nat_page()
>   f2fs: Convert get_next_sit_page() to get_next_sit_folio()
>   f2fs: Use a folio in f2fs_update_meta_page()
>   f2fs: Use a folio in write_current_sum_page()
>   f2fs: Use a folio in write_compacted_summaries()
>   f2fs: Remove f2fs_grab_meta_page()
>   f2fs: Add f2fs_get_meta_folio()
>   f2fs: Use a folio in build_sit_entries()
>   f2fs: Use a folio in f2fs_recover_orphan_inodes()
>   f2fs: Use a folio in validate_checkpoint()
>   f2fs: Use a folio in f2fs_get_valid_checkpoint()
>   f2fs: Use a folio in f2fs_get_node_info()
>   f2fs: Use a folio in __get_nat_bitmaps()
>   f2fs: Use a folio in read_compacted_summaries()
>   f2fs: Use a folio in read_normal_summaries()
>   f2fs: Remove f2fs_get_meta_page()
>   f2fs: Convert f2fs_get_meta_page_retry() to
>     f2fs_get_meta_folio_retry()
>   f2fs: Pass an address to scan_nat_page()
>   f2fs: Add f2fs_get_sum_folio()
>   f2fs: Use folios in do_garbage_collect()
>   f2fs: Use a folio in check_index_in_prev_nodes()
>   f2fs: Use a folio in change_curseg()
>   f2fs: Remove f2fs_get_sum_page()
>   f2fs: Use a folio in find_in_level()
>   f2fs: Use a folio in f2fs_delete_entry()
>   f2fs: Use a folio in f2fs_readdir()
>   f2fs: Remove f2fs_find_data_page()
>   f2fs: Use a folio in f2fs_get_new_data_page()
>   f2fs: Use a folio in f2fs_migrate_blocks()
>   f2fs: Add f2fs_get_new_data_folio()
>   highmem: Add memcpy_folio()
>   f2fs: Use a folio in __clone_blkaddrs()
>   f2fs: Use a folio in f2fs_defragment_range()
>   f2fs: Remove f2fs_get_lock_data_page()
>   f2fs: Use a folio in fill_zero()
>   f2fs: Use a folio in f2fs_add_regular_entry()
>   f2fs: Use a folio in make_empty_dir()
>   f2fs: Remove f2fs_get_new_data_page()
>   f2fs: Use a folio in f2fs_xattr_fiemap()
>   f2fs: Use a folio in ra_data_block()
>   f2fs: Use a folio in move_data_block()
>   f2fs: Use a folio in f2fs_convert_inline_inode()
>   f2fs: Use a folio in f2fs_move_inline_dirents()
>   f2fs: Add f2fs_new_node_folio()
>   f2fs: Use a folio in f2fs_ra_node_page()
>   f2fs: Convert read_node_page() to read_node_folio()
>   f2fs: Pass a folio to f2fs_inode_chksum_verify()
>   f2fs: Use a folio in f2fs_recover_inode_page()
>   f2fs: Remove f2fs_grab_cache_page()
>   f2fs: Add f2fs_get_xnode_folio()
>   f2fs: Use a folio in write_all_xattrs()
>   f2fs: Use a folio in f2fs_recover_xattr_data()
>   f2fs: Add f2fs_get_node_folio()
>   f2fs: Use folios in f2fs_get_dnode_of_data()
>   f2fs: Use a folio in truncate_node()
>   f2fs: Use a folio in truncate_nodes()
>   f2fs: Use folios in truncate_partial_nodes()
>   f2fs: Pass a folio to f2fs_ra_node_pages()
>   f2fs: Use a folio in gc_node_segment()
>   f2fs: Convert f2fs_move_node_page() to f2fs_move_node_folio()
>   f2fs: Convert __write_node_page() to __write_node_folio()
>   f2fs: Use a folio in is_alive()
>   f2fs: Use a folio in check_index_in_prev_nodes()
>   f2fs: Remove f2fs_get_node_page()
>   f2fs: Use a folio in prepare_write_begin
>   f2fs: Use a folio in __find_data_block()
>   f2fs: Use a folio in f2fs_init_inode_metadata()
>   f2fs: Pass a folio to make_empty_dir()
>   f2fs: Use a folio in f2fs_try_convert_inline_dir()
>   f2fs: Use a folio in f2fs_add_inline_entry()
>   f2fs: Pass a folio to f2fs_move_inline_dirents()
>   f2fs: Pass a folio to f2fs_move_rehashed_dirents()
>   f2fs: Use a folio in f2fs_do_truncate_blocks()
>   f2fs: Use a folio in f2fs_truncate_xattr_node()
>   f2fs: Pass folios to set_new_dnode()
>   f2fs: Convert f2fs_convert_inline_page() to
>     f2fs_convert_inline_folio()
>   f2fs: Use a folio in read_xattr_block()
>   f2fs: Remove f2fs_get_xnode_page()
>   f2fs: Use a folio in f2fs_write_inline_data()
>   f2fs: Use a folio in f2fs_read_inline_data()
>   f2fs: Use a folio in f2fs_recover_inline_data()
>   f2fs: Use a folio in f2fs_find_in_inline_dir()
>   f2fs: Use a folio in f2fs_empty_inline_dir()
>   f2fs: Use a folio in f2fs_read_inline_dir()
>   f2fs: Use a folio in f2fs_inline_data_fiemap()
>   f2fs: Use a folio in f2fs_update_inode_page()
>   f2fs: Use a folio in do_read_inode()
>   f2fs: Pass folios to f2fs_init_acl()
>   f2fs: Pass a folio to f2fs_setxattr()
>   f2fs: Pass a folio to __f2fs_setxattr()
>   f2fs: Pass a folio to write_all_xattrs()
>   f2fs: Use a folio in read_inline_xattr()
>   f2fs: Use a folio in f2fs_recover_inline_xattr()
>   f2fs: Remove f2fs_get_inode_page()
>   f2fs: Pass a folio to f2fs_getxattr()
>   f2fs: Pass a folio to read_inline_xattr()
>   f2fs: Pass a folio to do_recover_data()
>   f2fs: Pass a folio to f2fs_recover_inline_xattr()
>   f2fs: Pass a folio to inline_xattr_addr()
>   f2fs: Pass a folio to init_dent_inode()
>   f2fs: Pass a folio to f2fs_make_empty_inline_dir()
>   f2fs: Pass a folio to f2fs_has_enough_room()
>   f2fs: Convert dnode_of_data->inode_page to inode_folio
>   f2fs: Pass a folio to f2fs_do_read_inline_data()
>   f2fs: Pass a folio to f2fs_truncate_inline_inode()
>   f2fs: Pass a folio to __f2fs_find_entry()
>   f2fs: Pass a folio to f2fs_find_entry()
>   f2fs: Pass a folio to f2fs_parent_dir()
>   f2fs: Pass a folio to f2fs_delete_entry()
>   f2fs: Pass a folio to f2fs_delete_inline_entry()
>   f2fs: Pass a folio to f2fs_recover_inline_data()
>   f2fs: Pass a folio to __recover_inline_status()
>   f2fs: Pass a folio to inline_data_addr()
>   f2fs: Convert f2fs_put_page_dic() to f2fs_put_folio_dic()
>   f2fs: Pass a folio to f2fs_set_link()
>   f2fs: Use a folio in need_inode_page_update()
>   f2fs: Use a folio in f2fs_truncate_meta_inode_pages()
>   f2fs: Use a folio in f2fs_cache_compressed_page()
>   f2fs: Use a folio in prepare_compress_overwrite()
>   f2fs: Convert f2fs_load_compressed_page() to
>     f2fs_load_compressed_folio()
>   f2fs: Use a folio in f2fs_encrypt_one_page()
>   f2fs: Use a folio in redirty_blocks()
>   f2fs: Use a folio in f2fs_wait_on_block_writeback()
>   f2fs: Pass a folio to f2fs_init_read_extent_tree()
>   f2fs: Return a folio from f2fs_init_inode_metadata()
>   f2fs: Pass a folio to f2fs_update_inode()
>   f2fs: Pass a folio to set_nid()
>   f2fs: Convert dnode_of_data->node_page to node_folio
>   f2fs: Pass a folio to get_dnode_addr()
>   f2fs: Convert fsync_node_entry->page to folio
>   f2fs: Remove f2fs_new_node_page()
>   f2fs: Use a folio in flush_inline_data()
>   f2fs: Convert clear_node_page_dirty() to clear_node_folio_dirty()
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,001/153] f2fs: Use a folio in f2fs_compress_free_page()
    https://git.kernel.org/jaegeuk/f2fs/c/a8cb9b3d9b84
  - [f2fs-dev,002/153] f2fs: Use a folio in f2fs_write_raw_pages()
    https://git.kernel.org/jaegeuk/f2fs/c/8cc29b38cb26
  - [f2fs-dev,003/153] f2fs: Introduce fio_inode()
    (no matching commit)
  - [f2fs-dev,004/153] f2fs: Use F2FS_P_SB() in f2fs_is_compressed_page()
    https://git.kernel.org/jaegeuk/f2fs/c/98251710cae1
  - [f2fs-dev,005/153] f2fs: Use bio_for_each_folio_all() in __has_merged_page()
    https://git.kernel.org/jaegeuk/f2fs/c/acede6a57360
  - [f2fs-dev,006/153] f2fs: Use a folio in add_ipu_page()
    https://git.kernel.org/jaegeuk/f2fs/c/1db30d82365b
  - [f2fs-dev,007/153] f2fs: Remove access to page->mapping in f2fs_is_cp_guaranteed()
    https://git.kernel.org/jaegeuk/f2fs/c/6f8b9318c6eb
  - [f2fs-dev,008/153] f2fs: Use a folio in move_data_block()
    (no matching commit)
  - [f2fs-dev,009/153] f2fs: Use a folio in f2fs_quota_read()
    https://git.kernel.org/jaegeuk/f2fs/c/0d1e687e432b
  - [f2fs-dev,010/153] f2fs: Add f2fs_grab_meta_folio()
    https://git.kernel.org/jaegeuk/f2fs/c/b15ca1857157
  - [f2fs-dev,011/153] f2fs: Use a folio in commit_checkpoint()
    https://git.kernel.org/jaegeuk/f2fs/c/668c7a564823
  - [f2fs-dev,012/153] f2fs: Convert __f2fs_write_meta_page() to __f2fs_write_meta_folio()
    https://git.kernel.org/jaegeuk/f2fs/c/a8d397386371
  - [f2fs-dev,013/153] f2fs: Use f2fs_folio_wait_writeback()
    https://git.kernel.org/jaegeuk/f2fs/c/46fd261c677e
  - [f2fs-dev,014/153] f2fs: Pass a folio to f2fs_submit_merged_ipu_write()
    https://git.kernel.org/jaegeuk/f2fs/c/b629c6480ece
  - [f2fs-dev,015/153] f2fs: Convert __get_meta_page() to __get_meta_folio()
    https://git.kernel.org/jaegeuk/f2fs/c/9030d55aedf8
  - [f2fs-dev,016/153] f2fs: Convert f2fs_get_tmp_page() to f2fs_get_tmp_folio()
    https://git.kernel.org/jaegeuk/f2fs/c/937d6a4d2c21
  - [f2fs-dev,017/153] f2fs: Pass a folio to next_blkaddr_of_node()
    https://git.kernel.org/jaegeuk/f2fs/c/f24f7f8cd6e8
  - [f2fs-dev,018/153] f2fs: Use a folio in f2fs_ra_meta_pages()
    https://git.kernel.org/jaegeuk/f2fs/c/95e3117621e9
  - [f2fs-dev,019/153] f2fs: Use a folio in f2fs_ra_meta_pages_cond()
    (no matching commit)
  - [f2fs-dev,020/153] f2fs: Use a folio in write_orphan_inodes()
    https://git.kernel.org/jaegeuk/f2fs/c/643d16687d7a
  - [f2fs-dev,021/153] f2fs: Use a folio in get_next_nat_page()
    https://git.kernel.org/jaegeuk/f2fs/c/5df510c8df69
  - [f2fs-dev,022/153] f2fs: Convert get_next_sit_page() to get_next_sit_folio()
    https://git.kernel.org/jaegeuk/f2fs/c/9c6b0f120e11
  - [f2fs-dev,023/153] f2fs: Use a folio in f2fs_update_meta_page()
    https://git.kernel.org/jaegeuk/f2fs/c/5c1b57bb8393
  - [f2fs-dev,024/153] f2fs: Use a folio in write_current_sum_page()
    https://git.kernel.org/jaegeuk/f2fs/c/43b3ed1c6ce0
  - [f2fs-dev,025/153] f2fs: Use a folio in write_compacted_summaries()
    https://git.kernel.org/jaegeuk/f2fs/c/1ec366290109
  - [f2fs-dev,026/153] f2fs: Remove f2fs_grab_meta_page()
    https://git.kernel.org/jaegeuk/f2fs/c/2424ee9b752a
  - [f2fs-dev,027/153] f2fs: Add f2fs_get_meta_folio()
    https://git.kernel.org/jaegeuk/f2fs/c/d6f3066301bc
  - [f2fs-dev,028/153] f2fs: Use a folio in build_sit_entries()
    https://git.kernel.org/jaegeuk/f2fs/c/6225716f38a8
  - [f2fs-dev,029/153] f2fs: Use a folio in f2fs_recover_orphan_inodes()
    https://git.kernel.org/jaegeuk/f2fs/c/375452b50751
  - [f2fs-dev,030/153] f2fs: Use a folio in validate_checkpoint()
    https://git.kernel.org/jaegeuk/f2fs/c/a2c746eac30e
  - [f2fs-dev,031/153] f2fs: Use a folio in f2fs_get_valid_checkpoint()
    (no matching commit)
  - [f2fs-dev,032/153] f2fs: Use a folio in f2fs_get_node_info()
    https://git.kernel.org/jaegeuk/f2fs/c/aa0c14ef54e0
  - [f2fs-dev,033/153] f2fs: Use a folio in __get_nat_bitmaps()
    https://git.kernel.org/jaegeuk/f2fs/c/8a6fb4cc554e
  - [f2fs-dev,034/153] f2fs: Use a folio in read_compacted_summaries()
    https://git.kernel.org/jaegeuk/f2fs/c/3a34e0cdd9c6
  - [f2fs-dev,035/153] f2fs: Use a folio in read_normal_summaries()
    https://git.kernel.org/jaegeuk/f2fs/c/9fdb4325e0a4
  - [f2fs-dev,036/153] f2fs: Remove f2fs_get_meta_page()
    https://git.kernel.org/jaegeuk/f2fs/c/657b31b2d71c
  - [f2fs-dev,037/153] f2fs: Convert f2fs_get_meta_page_retry() to f2fs_get_meta_folio_retry()
    https://git.kernel.org/jaegeuk/f2fs/c/350b8441c0e9
  - [f2fs-dev,038/153] f2fs: Pass an address to scan_nat_page()
    https://git.kernel.org/jaegeuk/f2fs/c/6b5c4a035913
  - [f2fs-dev,039/153] f2fs: Add f2fs_get_sum_folio()
    https://git.kernel.org/jaegeuk/f2fs/c/4a2c49d2cbb9
  - [f2fs-dev,040/153] f2fs: Use folios in do_garbage_collect()
    https://git.kernel.org/jaegeuk/f2fs/c/5d895f7beae9
  - [f2fs-dev,041/153] f2fs: Use a folio in check_index_in_prev_nodes()
    https://git.kernel.org/jaegeuk/f2fs/c/b536cd889ea8
  - [f2fs-dev,042/153] f2fs: Use a folio in change_curseg()
    https://git.kernel.org/jaegeuk/f2fs/c/0e1073f850fc
  - [f2fs-dev,043/153] f2fs: Remove f2fs_get_sum_page()
    https://git.kernel.org/jaegeuk/f2fs/c/366848cb7126
  - [f2fs-dev,044/153] f2fs: Use a folio in find_in_level()
    https://git.kernel.org/jaegeuk/f2fs/c/e4ca8ff450c3
  - [f2fs-dev,045/153] f2fs: Use a folio in f2fs_delete_entry()
    https://git.kernel.org/jaegeuk/f2fs/c/7d5a82490f94
  - [f2fs-dev,046/153] f2fs: Use a folio in f2fs_readdir()
    https://git.kernel.org/jaegeuk/f2fs/c/d040455c7911
  - [f2fs-dev,047/153] f2fs: Remove f2fs_find_data_page()
    https://git.kernel.org/jaegeuk/f2fs/c/c713bbb17c4d
  - [f2fs-dev,048/153] f2fs: Use a folio in f2fs_get_new_data_page()
    https://git.kernel.org/jaegeuk/f2fs/c/65f99d35fe87
  - [f2fs-dev,049/153] f2fs: Use a folio in f2fs_migrate_blocks()
    https://git.kernel.org/jaegeuk/f2fs/c/38f273c5049d
  - [f2fs-dev,050/153] f2fs: Add f2fs_get_new_data_folio()
    https://git.kernel.org/jaegeuk/f2fs/c/48b68943053a
  - [f2fs-dev,051/153] highmem: Add memcpy_folio()
    https://git.kernel.org/jaegeuk/f2fs/c/1313057c369b
  - [f2fs-dev,052/153] f2fs: Use a folio in __clone_blkaddrs()
    https://git.kernel.org/jaegeuk/f2fs/c/3dfcb2b43e3a
  - [f2fs-dev,053/153] f2fs: Use a folio in f2fs_defragment_range()
    https://git.kernel.org/jaegeuk/f2fs/c/c0a4bb8ae6da
  - [f2fs-dev,054/153] f2fs: Remove f2fs_get_lock_data_page()
    https://git.kernel.org/jaegeuk/f2fs/c/6965a65caf83
  - [f2fs-dev,055/153] f2fs: Use a folio in fill_zero()
    https://git.kernel.org/jaegeuk/f2fs/c/c35cc972c3cd
  - [f2fs-dev,056/153] f2fs: Use a folio in f2fs_add_regular_entry()
    https://git.kernel.org/jaegeuk/f2fs/c/c45ce8f76ab3
  - [f2fs-dev,057/153] f2fs: Use a folio in make_empty_dir()
    https://git.kernel.org/jaegeuk/f2fs/c/a85127c58a3b
  - [f2fs-dev,058/153] f2fs: Remove f2fs_get_new_data_page()
    https://git.kernel.org/jaegeuk/f2fs/c/d2eb6d86e0fe
  - [f2fs-dev,059/153] f2fs: Use a folio in f2fs_xattr_fiemap()
    https://git.kernel.org/jaegeuk/f2fs/c/514163f699af
  - [f2fs-dev,060/153] f2fs: Use a folio in ra_data_block()
    https://git.kernel.org/jaegeuk/f2fs/c/0d53be232343
  - [f2fs-dev,061/153] f2fs: Use a folio in move_data_block()
    https://git.kernel.org/jaegeuk/f2fs/c/2a96ddcb4a59
  - [f2fs-dev,062/153] f2fs: Use a folio in f2fs_convert_inline_inode()
    https://git.kernel.org/jaegeuk/f2fs/c/f8fa37fbec96
  - [f2fs-dev,063/153] f2fs: Use a folio in f2fs_move_inline_dirents()
    https://git.kernel.org/jaegeuk/f2fs/c/e57e6ee5cd80
  - [f2fs-dev,064/153] f2fs: Add f2fs_new_node_folio()
    https://git.kernel.org/jaegeuk/f2fs/c/cfa809146f82
  - [f2fs-dev,065/153] f2fs: Use a folio in f2fs_ra_node_page()
    https://git.kernel.org/jaegeuk/f2fs/c/9d79652e4473
  - [f2fs-dev,066/153] f2fs: Convert read_node_page() to read_node_folio()
    (no matching commit)
  - [f2fs-dev,067/153] f2fs: Pass a folio to f2fs_inode_chksum_verify()
    https://git.kernel.org/jaegeuk/f2fs/c/7c213e98c723
  - [f2fs-dev,068/153] f2fs: Use a folio in f2fs_recover_inode_page()
    https://git.kernel.org/jaegeuk/f2fs/c/8b78cea81238
  - [f2fs-dev,069/153] f2fs: Remove f2fs_grab_cache_page()
    https://git.kernel.org/jaegeuk/f2fs/c/5c93848a92ac
  - [f2fs-dev,070/153] f2fs: Add f2fs_get_xnode_folio()
    https://git.kernel.org/jaegeuk/f2fs/c/153e4a7f8906
  - [f2fs-dev,071/153] f2fs: Use a folio in write_all_xattrs()
    https://git.kernel.org/jaegeuk/f2fs/c/b3094519c1f1
  - [f2fs-dev,072/153] f2fs: Use a folio in f2fs_recover_xattr_data()
    https://git.kernel.org/jaegeuk/f2fs/c/401da8dd7887
  - [f2fs-dev,073/153] f2fs: Add f2fs_get_node_folio()
    https://git.kernel.org/jaegeuk/f2fs/c/aa220cede54e
  - [f2fs-dev,074/153] f2fs: Use folios in f2fs_get_dnode_of_data()
    (no matching commit)
  - [f2fs-dev,075/153] f2fs: Use a folio in truncate_node()
    https://git.kernel.org/jaegeuk/f2fs/c/df4101400621
  - [f2fs-dev,076/153] f2fs: Use a folio in truncate_nodes()
    https://git.kernel.org/jaegeuk/f2fs/c/878a05b09c0c
  - [f2fs-dev,077/153] f2fs: Use folios in truncate_partial_nodes()
    https://git.kernel.org/jaegeuk/f2fs/c/d68833a0b74e
  - [f2fs-dev,078/153] f2fs: Pass a folio to f2fs_ra_node_pages()
    (no matching commit)
  - [f2fs-dev,079/153] f2fs: Use a folio in gc_node_segment()
    https://git.kernel.org/jaegeuk/f2fs/c/c528defa64ae
  - [f2fs-dev,080/153] f2fs: Convert f2fs_move_node_page() to f2fs_move_node_folio()
    https://git.kernel.org/jaegeuk/f2fs/c/c795d9dbe035
  - [f2fs-dev,081/153] f2fs: Convert __write_node_page() to __write_node_folio()
    https://git.kernel.org/jaegeuk/f2fs/c/722066201f42
  - [f2fs-dev,082/153] f2fs: Use a folio in is_alive()
    https://git.kernel.org/jaegeuk/f2fs/c/1a116e876ab6
  - [f2fs-dev,083/153] f2fs: Use a folio in check_index_in_prev_nodes()
    https://git.kernel.org/jaegeuk/f2fs/c/da8768c87527
  - [f2fs-dev,084/153] f2fs: Remove f2fs_get_node_page()
    https://git.kernel.org/jaegeuk/f2fs/c/424fd5d831e1
  - [f2fs-dev,085/153] f2fs: Use a folio in prepare_write_begin
    https://git.kernel.org/jaegeuk/f2fs/c/c68b0bcb29d6
  - [f2fs-dev,086/153] f2fs: Use a folio in __find_data_block()
    https://git.kernel.org/jaegeuk/f2fs/c/0e1717dd92a9
  - [f2fs-dev,087/153] f2fs: Use a folio in f2fs_init_inode_metadata()
    https://git.kernel.org/jaegeuk/f2fs/c/7c99299c9ac8
  - [f2fs-dev,088/153] f2fs: Pass a folio to make_empty_dir()
    https://git.kernel.org/jaegeuk/f2fs/c/bdbf142204c5
  - [f2fs-dev,089/153] f2fs: Use a folio in f2fs_try_convert_inline_dir()
    https://git.kernel.org/jaegeuk/f2fs/c/869521352de8
  - [f2fs-dev,090/153] f2fs: Use a folio in f2fs_add_inline_entry()
    https://git.kernel.org/jaegeuk/f2fs/c/9283b58a148f
  - [f2fs-dev,091/153] f2fs: Pass a folio to f2fs_move_inline_dirents()
    https://git.kernel.org/jaegeuk/f2fs/c/717735db2604
  - [f2fs-dev,092/153] f2fs: Pass a folio to f2fs_move_rehashed_dirents()
    https://git.kernel.org/jaegeuk/f2fs/c/8f8c0c45449e
  - [f2fs-dev,093/153] f2fs: Use a folio in f2fs_do_truncate_blocks()
    https://git.kernel.org/jaegeuk/f2fs/c/d9554488b06d
  - [f2fs-dev,094/153] f2fs: Use a folio in f2fs_truncate_xattr_node()
    https://git.kernel.org/jaegeuk/f2fs/c/a8a4ad25b579
  - [f2fs-dev,095/153] f2fs: Pass folios to set_new_dnode()
    https://git.kernel.org/jaegeuk/f2fs/c/214235c224df
  - [f2fs-dev,096/153] f2fs: Convert f2fs_convert_inline_page() to f2fs_convert_inline_folio()
    https://git.kernel.org/jaegeuk/f2fs/c/6023048cf62d
  - [f2fs-dev,097/153] f2fs: Use a folio in read_xattr_block()
    https://git.kernel.org/jaegeuk/f2fs/c/c972c546fa2b
  - [f2fs-dev,098/153] f2fs: Remove f2fs_get_xnode_page()
    https://git.kernel.org/jaegeuk/f2fs/c/0999f98e6c21
  - [f2fs-dev,099/153] f2fs: Use a folio in f2fs_write_inline_data()
    https://git.kernel.org/jaegeuk/f2fs/c/466f0e661d7a
  - [f2fs-dev,100/153] f2fs: Use a folio in f2fs_read_inline_data()
    https://git.kernel.org/jaegeuk/f2fs/c/5f5efd70304a
  - [f2fs-dev,101/153] f2fs: Use a folio in f2fs_recover_inline_data()
    https://git.kernel.org/jaegeuk/f2fs/c/f7725a793e1e
  - [f2fs-dev,102/153] f2fs: Use a folio in f2fs_find_in_inline_dir()
    https://git.kernel.org/jaegeuk/f2fs/c/317c31680e94
  - [f2fs-dev,103/153] f2fs: Use a folio in f2fs_empty_inline_dir()
    https://git.kernel.org/jaegeuk/f2fs/c/08e83ca0954c
  - [f2fs-dev,104/153] f2fs: Use a folio in f2fs_read_inline_dir()
    https://git.kernel.org/jaegeuk/f2fs/c/f5ef723c170f
  - [f2fs-dev,105/153] f2fs: Use a folio in f2fs_inline_data_fiemap()
    https://git.kernel.org/jaegeuk/f2fs/c/a0fd315e31f3
  - [f2fs-dev,106/153] f2fs: Use a folio in f2fs_update_inode_page()
    https://git.kernel.org/jaegeuk/f2fs/c/870ef8d3c480
  - [f2fs-dev,107/153] f2fs: Use a folio in do_read_inode()
    https://git.kernel.org/jaegeuk/f2fs/c/802aa48dba07
  - [f2fs-dev,108/153] f2fs: Pass folios to f2fs_init_acl()
    https://git.kernel.org/jaegeuk/f2fs/c/9de27930c56b
  - [f2fs-dev,109/153] f2fs: Pass a folio to f2fs_setxattr()
    https://git.kernel.org/jaegeuk/f2fs/c/953ab314c75e
  - [f2fs-dev,110/153] f2fs: Pass a folio to __f2fs_setxattr()
    https://git.kernel.org/jaegeuk/f2fs/c/b3955efbc002
  - [f2fs-dev,111/153] f2fs: Pass a folio to write_all_xattrs()
    https://git.kernel.org/jaegeuk/f2fs/c/170c445a5e1f
  - [f2fs-dev,112/153] f2fs: Use a folio in read_inline_xattr()
    https://git.kernel.org/jaegeuk/f2fs/c/1aa467014b25
  - [f2fs-dev,113/153] f2fs: Use a folio in f2fs_recover_inline_xattr()
    https://git.kernel.org/jaegeuk/f2fs/c/2557c3ea4c4e
  - [f2fs-dev,114/153] f2fs: Remove f2fs_get_inode_page()
    https://git.kernel.org/jaegeuk/f2fs/c/cdbe260d559a
  - [f2fs-dev,115/153] f2fs: Pass a folio to f2fs_getxattr()
    https://git.kernel.org/jaegeuk/f2fs/c/39d20727d8b9
  - [f2fs-dev,116/153] f2fs: Pass a folio to read_inline_xattr()
    https://git.kernel.org/jaegeuk/f2fs/c/c8b198748611
  - [f2fs-dev,117/153] f2fs: Pass a folio to do_recover_data()
    https://git.kernel.org/jaegeuk/f2fs/c/847bfef73a70
  - [f2fs-dev,118/153] f2fs: Pass a folio to f2fs_recover_inline_xattr()
    https://git.kernel.org/jaegeuk/f2fs/c/39b53c0b9946
  - [f2fs-dev,119/153] f2fs: Pass a folio to inline_xattr_addr()
    https://git.kernel.org/jaegeuk/f2fs/c/e0691a051f11
  - [f2fs-dev,120/153] f2fs: Pass a folio to init_dent_inode()
    https://git.kernel.org/jaegeuk/f2fs/c/0439ae45b5e5
  - [f2fs-dev,121/153] f2fs: Pass a folio to f2fs_make_empty_inline_dir()
    https://git.kernel.org/jaegeuk/f2fs/c/c5622a4630b4
  - [f2fs-dev,122/153] f2fs: Pass a folio to f2fs_has_enough_room()
    https://git.kernel.org/jaegeuk/f2fs/c/c01547da6b15
  - [f2fs-dev,123/153] f2fs: Convert dnode_of_data->inode_page to inode_folio
    https://git.kernel.org/jaegeuk/f2fs/c/f1d54e07a97f
  - [f2fs-dev,124/153] f2fs: Pass a folio to f2fs_do_read_inline_data()
    https://git.kernel.org/jaegeuk/f2fs/c/848839ce0505
  - [f2fs-dev,125/153] f2fs: Pass a folio to f2fs_truncate_inline_inode()
    https://git.kernel.org/jaegeuk/f2fs/c/b3720382eee7
  - [f2fs-dev,126/153] f2fs: Pass a folio to __f2fs_find_entry()
    https://git.kernel.org/jaegeuk/f2fs/c/c190a13d71e7
  - [f2fs-dev,127/153] f2fs: Pass a folio to f2fs_find_entry()
    (no matching commit)
  - [f2fs-dev,128/153] f2fs: Pass a folio to f2fs_parent_dir()
    https://git.kernel.org/jaegeuk/f2fs/c/932a95537aca
  - [f2fs-dev,129/153] f2fs: Pass a folio to f2fs_delete_entry()
    https://git.kernel.org/jaegeuk/f2fs/c/03a757121314
  - [f2fs-dev,130/153] f2fs: Pass a folio to f2fs_delete_inline_entry()
    https://git.kernel.org/jaegeuk/f2fs/c/b5b66bc4dfd1
  - [f2fs-dev,131/153] f2fs: Pass a folio to f2fs_recover_inline_data()
    https://git.kernel.org/jaegeuk/f2fs/c/413977c956db
  - [f2fs-dev,132/153] f2fs: Pass a folio to __recover_inline_status()
    https://git.kernel.org/jaegeuk/f2fs/c/1834406c9849
  - [f2fs-dev,133/153] f2fs: Pass a folio to inline_data_addr()
    https://git.kernel.org/jaegeuk/f2fs/c/d79bc8ab4417
  - [f2fs-dev,134/153] f2fs: Convert f2fs_put_page_dic() to f2fs_put_folio_dic()
    https://git.kernel.org/jaegeuk/f2fs/c/1d6bf61778a5
  - [f2fs-dev,135/153] f2fs: Pass a folio to f2fs_set_link()
    https://git.kernel.org/jaegeuk/f2fs/c/5b61618aa0ad
  - [f2fs-dev,136/153] f2fs: Use a folio in need_inode_page_update()
    https://git.kernel.org/jaegeuk/f2fs/c/ba13af45e517
  - [f2fs-dev,137/153] f2fs: Use a folio in f2fs_truncate_meta_inode_pages()
    https://git.kernel.org/jaegeuk/f2fs/c/47d73eae3acc
  - [f2fs-dev,138/153] f2fs: Use a folio in f2fs_cache_compressed_page()
    https://git.kernel.org/jaegeuk/f2fs/c/3d56058c55d4
  - [f2fs-dev,139/153] f2fs: Use a folio in prepare_compress_overwrite()
    https://git.kernel.org/jaegeuk/f2fs/c/75de20f41fa8
  - [f2fs-dev,140/153] f2fs: Convert f2fs_load_compressed_page() to f2fs_load_compressed_folio()
    https://git.kernel.org/jaegeuk/f2fs/c/842974808ac2
  - [f2fs-dev,141/153] f2fs: Use a folio in f2fs_encrypt_one_page()
    https://git.kernel.org/jaegeuk/f2fs/c/b02a903218bd
  - [f2fs-dev,142/153] f2fs: Use a folio in redirty_blocks()
    https://git.kernel.org/jaegeuk/f2fs/c/5951fee46bef
  - [f2fs-dev,143/153] f2fs: Use a folio in f2fs_wait_on_block_writeback()
    https://git.kernel.org/jaegeuk/f2fs/c/97e1b86169b3
  - [f2fs-dev,144/153] f2fs: Pass a folio to f2fs_init_read_extent_tree()
    https://git.kernel.org/jaegeuk/f2fs/c/398c7df7bc6b
  - [f2fs-dev,145/153] f2fs: Return a folio from f2fs_init_inode_metadata()
    https://git.kernel.org/jaegeuk/f2fs/c/a6d26d5c7581
  - [f2fs-dev,146/153] f2fs: Pass a folio to f2fs_update_inode()
    https://git.kernel.org/jaegeuk/f2fs/c/f92379289f0c
  - [f2fs-dev,147/153] f2fs: Pass a folio to set_nid()
    https://git.kernel.org/jaegeuk/f2fs/c/66bca01bc52a
  - [f2fs-dev,148/153] f2fs: Convert dnode_of_data->node_page to node_folio
    https://git.kernel.org/jaegeuk/f2fs/c/6f7ec6618021
  - [f2fs-dev,149/153] f2fs: Pass a folio to get_dnode_addr()
    https://git.kernel.org/jaegeuk/f2fs/c/7d28f13c583c
  - [f2fs-dev,150/153] f2fs: Convert fsync_node_entry->page to folio
    https://git.kernel.org/jaegeuk/f2fs/c/963da02bc12d
  - [f2fs-dev,151/153] f2fs: Remove f2fs_new_node_page()
    https://git.kernel.org/jaegeuk/f2fs/c/6b1ad395455b
  - [f2fs-dev,152/153] f2fs: Use a folio in flush_inline_data()
    https://git.kernel.org/jaegeuk/f2fs/c/a4d077027121
  - [f2fs-dev,153/153] f2fs: Convert clear_node_page_dirty() to clear_node_folio_dirty()
    https://git.kernel.org/jaegeuk/f2fs/c/f16ebe0de732

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
