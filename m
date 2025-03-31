Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 55ECAA76E2D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVc-0003n9-AE;
	Mon, 31 Mar 2025 20:13:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVW-0003kv-KT
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lfUpNjNSv203DHMXSowl5Wt0+hSiBd1WujJQZMIsjLU=; b=Udj58rIGThc2lLHuXTQKyxUkBZ
 Nzp0jQ6vJYp5xzD5aTk9uT79GL6QBfwRgU8fNTIYu64ZSt9Ybz6hyGtiePdFwxf9ycJlRsmPlwBUV
 30oiwkua/cJz3FhFRQnsuTTc+d5P2+W6wv3vUDfTwe0+tNPOh8Z3Nh+s63hbqcuvEhD0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=lfUpNjNSv203DHMXSowl5Wt0+hSiBd1WujJQZMIsjLU=; b=J
 3igVP9xeqy8Y04wPUtxx1+lf36TwWfcQIwoTepLTYINgry1mXClGBQ4dpBX9AqrUP+8op/1BV4koK
 SLZPa877eXftW5YYed7cgzgrTgJQIRJnhW5eo6TgfBHikZx5xfcRPz13zotuaH8rBXYm7t2o6dW3p
 fakHKjJ6U6lzqe+w=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVQ-0003Yf-KV for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=lfUpNjNSv203DHMXSowl5Wt0+hSiBd1WujJQZMIsjLU=; b=cqBQjG7coykmoEyQhFDhTZ4BqK
 3w8uJvJdOmVYhGZgE65dcuKlwYk4xwaiSTioWoM9T5oBvicvDkt8cpvlat7fM88/Ws3Aqavg0A1d4
 UWhM1tSJ9H3rPDsFYmEZjpZW2Oz8LPYZ/S/WBUkWy4gMXdoD0+ewP2pudqPSUW0TVLToImCj64Edu
 id5GtLR9Wl3NNn7F/uu9hehw3QFlKA9numYaxeoTDXbD3GUvftIb3B/P02EeXf/1asDfo6LYp0O4P
 hX2GNX5G6Le6FdL6CE/zZ36P7oKoL9THwhBx+sxaGXiobVVSCiiw1lCbCPrbeJJj1/odpDa11Rjp6
 NLvNqADA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVF-00000004RTc-0bbe;
 Mon, 31 Mar 2025 20:13:01 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:10:20 +0100
Message-ID: <20250331201256.1057782-1-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Sorry for the length of this series. Each patch in this
 series
 builds, but obviously I haven't done any testing. It should be easy to bisect
 to any mistakes I've made. This conversion isn't complete; [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-accredit.habeas.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1tzLVQ-0003Yf-KV
Subject: [f2fs-dev] [PATCH 000/153] f2fs folio conversions for 6.16
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
Cc: "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Sorry for the length of this series.  Each patch in this series builds,
but obviously I haven't done any testing.  It should be easy to bisect
to any mistakes I've made.  This conversion isn't complete; I estimate
another 100 or so patches will be needed.

Matthew Wilcox (Oracle) (153):
  f2fs: Use a folio in f2fs_compress_free_page()
  f2fs: Use a folio in f2fs_write_raw_pages()
  f2fs: Introduce fio_inode()
  f2fs: Use F2FS_P_SB() in f2fs_is_compressed_page()
  f2fs: Use bio_for_each_folio_all() in __has_merged_page()
  f2fs: Use a folio in add_ipu_page()
  f2fs: Remove access to page->mapping in f2fs_is_cp_guaranteed()
  f2fs: Use a folio in move_data_block()
  f2fs: Use a folio in f2fs_quota_read()
  f2fs: Add f2fs_grab_meta_folio()
  f2fs: Use a folio in commit_checkpoint()
  f2fs: Convert __f2fs_write_meta_page() to __f2fs_write_meta_folio()
  f2fs: Use f2fs_folio_wait_writeback()
  f2fs: Pass a folio to f2fs_submit_merged_ipu_write()
  f2fs: Convert __get_meta_page() to __get_meta_folio()
  f2fs: Convert f2fs_get_tmp_page() to f2fs_get_tmp_folio()
  f2fs: Pass a folio to next_blkaddr_of_node()
  f2fs: Use a folio in f2fs_ra_meta_pages()
  f2fs: Use a folio in f2fs_ra_meta_pages_cond()
  f2fs: Use a folio in write_orphan_inodes()
  f2fs: Use a folio in get_next_nat_page()
  f2fs: Convert get_next_sit_page() to get_next_sit_folio()
  f2fs: Use a folio in f2fs_update_meta_page()
  f2fs: Use a folio in write_current_sum_page()
  f2fs: Use a folio in write_compacted_summaries()
  f2fs: Remove f2fs_grab_meta_page()
  f2fs: Add f2fs_get_meta_folio()
  f2fs: Use a folio in build_sit_entries()
  f2fs: Use a folio in f2fs_recover_orphan_inodes()
  f2fs: Use a folio in validate_checkpoint()
  f2fs: Use a folio in f2fs_get_valid_checkpoint()
  f2fs: Use a folio in f2fs_get_node_info()
  f2fs: Use a folio in __get_nat_bitmaps()
  f2fs: Use a folio in read_compacted_summaries()
  f2fs: Use a folio in read_normal_summaries()
  f2fs: Remove f2fs_get_meta_page()
  f2fs: Convert f2fs_get_meta_page_retry() to
    f2fs_get_meta_folio_retry()
  f2fs: Pass an address to scan_nat_page()
  f2fs: Add f2fs_get_sum_folio()
  f2fs: Use folios in do_garbage_collect()
  f2fs: Use a folio in check_index_in_prev_nodes()
  f2fs: Use a folio in change_curseg()
  f2fs: Remove f2fs_get_sum_page()
  f2fs: Use a folio in find_in_level()
  f2fs: Use a folio in f2fs_delete_entry()
  f2fs: Use a folio in f2fs_readdir()
  f2fs: Remove f2fs_find_data_page()
  f2fs: Use a folio in f2fs_get_new_data_page()
  f2fs: Use a folio in f2fs_migrate_blocks()
  f2fs: Add f2fs_get_new_data_folio()
  highmem: Add memcpy_folio()
  f2fs: Use a folio in __clone_blkaddrs()
  f2fs: Use a folio in f2fs_defragment_range()
  f2fs: Remove f2fs_get_lock_data_page()
  f2fs: Use a folio in fill_zero()
  f2fs: Use a folio in f2fs_add_regular_entry()
  f2fs: Use a folio in make_empty_dir()
  f2fs: Remove f2fs_get_new_data_page()
  f2fs: Use a folio in f2fs_xattr_fiemap()
  f2fs: Use a folio in ra_data_block()
  f2fs: Use a folio in move_data_block()
  f2fs: Use a folio in f2fs_convert_inline_inode()
  f2fs: Use a folio in f2fs_move_inline_dirents()
  f2fs: Add f2fs_new_node_folio()
  f2fs: Use a folio in f2fs_ra_node_page()
  f2fs: Convert read_node_page() to read_node_folio()
  f2fs: Pass a folio to f2fs_inode_chksum_verify()
  f2fs: Use a folio in f2fs_recover_inode_page()
  f2fs: Remove f2fs_grab_cache_page()
  f2fs: Add f2fs_get_xnode_folio()
  f2fs: Use a folio in write_all_xattrs()
  f2fs: Use a folio in f2fs_recover_xattr_data()
  f2fs: Add f2fs_get_node_folio()
  f2fs: Use folios in f2fs_get_dnode_of_data()
  f2fs: Use a folio in truncate_node()
  f2fs: Use a folio in truncate_nodes()
  f2fs: Use folios in truncate_partial_nodes()
  f2fs: Pass a folio to f2fs_ra_node_pages()
  f2fs: Use a folio in gc_node_segment()
  f2fs: Convert f2fs_move_node_page() to f2fs_move_node_folio()
  f2fs: Convert __write_node_page() to __write_node_folio()
  f2fs: Use a folio in is_alive()
  f2fs: Use a folio in check_index_in_prev_nodes()
  f2fs: Remove f2fs_get_node_page()
  f2fs: Use a folio in prepare_write_begin
  f2fs: Use a folio in __find_data_block()
  f2fs: Use a folio in f2fs_init_inode_metadata()
  f2fs: Pass a folio to make_empty_dir()
  f2fs: Use a folio in f2fs_try_convert_inline_dir()
  f2fs: Use a folio in f2fs_add_inline_entry()
  f2fs: Pass a folio to f2fs_move_inline_dirents()
  f2fs: Pass a folio to f2fs_move_rehashed_dirents()
  f2fs: Use a folio in f2fs_do_truncate_blocks()
  f2fs: Use a folio in f2fs_truncate_xattr_node()
  f2fs: Pass folios to set_new_dnode()
  f2fs: Convert f2fs_convert_inline_page() to
    f2fs_convert_inline_folio()
  f2fs: Use a folio in read_xattr_block()
  f2fs: Remove f2fs_get_xnode_page()
  f2fs: Use a folio in f2fs_write_inline_data()
  f2fs: Use a folio in f2fs_read_inline_data()
  f2fs: Use a folio in f2fs_recover_inline_data()
  f2fs: Use a folio in f2fs_find_in_inline_dir()
  f2fs: Use a folio in f2fs_empty_inline_dir()
  f2fs: Use a folio in f2fs_read_inline_dir()
  f2fs: Use a folio in f2fs_inline_data_fiemap()
  f2fs: Use a folio in f2fs_update_inode_page()
  f2fs: Use a folio in do_read_inode()
  f2fs: Pass folios to f2fs_init_acl()
  f2fs: Pass a folio to f2fs_setxattr()
  f2fs: Pass a folio to __f2fs_setxattr()
  f2fs: Pass a folio to write_all_xattrs()
  f2fs: Use a folio in read_inline_xattr()
  f2fs: Use a folio in f2fs_recover_inline_xattr()
  f2fs: Remove f2fs_get_inode_page()
  f2fs: Pass a folio to f2fs_getxattr()
  f2fs: Pass a folio to read_inline_xattr()
  f2fs: Pass a folio to do_recover_data()
  f2fs: Pass a folio to f2fs_recover_inline_xattr()
  f2fs: Pass a folio to inline_xattr_addr()
  f2fs: Pass a folio to init_dent_inode()
  f2fs: Pass a folio to f2fs_make_empty_inline_dir()
  f2fs: Pass a folio to f2fs_has_enough_room()
  f2fs: Convert dnode_of_data->inode_page to inode_folio
  f2fs: Pass a folio to f2fs_do_read_inline_data()
  f2fs: Pass a folio to f2fs_truncate_inline_inode()
  f2fs: Pass a folio to __f2fs_find_entry()
  f2fs: Pass a folio to f2fs_find_entry()
  f2fs: Pass a folio to f2fs_parent_dir()
  f2fs: Pass a folio to f2fs_delete_entry()
  f2fs: Pass a folio to f2fs_delete_inline_entry()
  f2fs: Pass a folio to f2fs_recover_inline_data()
  f2fs: Pass a folio to __recover_inline_status()
  f2fs: Pass a folio to inline_data_addr()
  f2fs: Convert f2fs_put_page_dic() to f2fs_put_folio_dic()
  f2fs: Pass a folio to f2fs_set_link()
  f2fs: Use a folio in need_inode_page_update()
  f2fs: Use a folio in f2fs_truncate_meta_inode_pages()
  f2fs: Use a folio in f2fs_cache_compressed_page()
  f2fs: Use a folio in prepare_compress_overwrite()
  f2fs: Convert f2fs_load_compressed_page() to
    f2fs_load_compressed_folio()
  f2fs: Use a folio in f2fs_encrypt_one_page()
  f2fs: Use a folio in redirty_blocks()
  f2fs: Use a folio in f2fs_wait_on_block_writeback()
  f2fs: Pass a folio to f2fs_init_read_extent_tree()
  f2fs: Return a folio from f2fs_init_inode_metadata()
  f2fs: Pass a folio to f2fs_update_inode()
  f2fs: Pass a folio to set_nid()
  f2fs: Convert dnode_of_data->node_page to node_folio
  f2fs: Pass a folio to get_dnode_addr()
  f2fs: Convert fsync_node_entry->page to folio
  f2fs: Remove f2fs_new_node_page()
  f2fs: Use a folio in flush_inline_data()
  f2fs: Convert clear_node_page_dirty() to clear_node_folio_dirty()

 fs/f2fs/acl.c           |  33 ++-
 fs/f2fs/acl.h           |  10 +-
 fs/f2fs/checkpoint.c    | 193 +++++++--------
 fs/f2fs/compress.c      | 134 +++++-----
 fs/f2fs/data.c          | 208 ++++++++--------
 fs/f2fs/dir.c           | 240 +++++++++---------
 fs/f2fs/extent_cache.c  |  10 +-
 fs/f2fs/f2fs.h          | 184 +++++++-------
 fs/f2fs/file.c          | 155 ++++++------
 fs/f2fs/gc.c            | 140 ++++++-----
 fs/f2fs/inline.c        | 306 +++++++++++------------
 fs/f2fs/inode.c         |  94 +++----
 fs/f2fs/namei.c         | 112 ++++-----
 fs/f2fs/node.c          | 526 ++++++++++++++++++++--------------------
 fs/f2fs/node.h          |  12 +-
 fs/f2fs/recovery.c      | 178 +++++++-------
 fs/f2fs/segment.c       | 147 ++++++-----
 fs/f2fs/segment.h       |   6 +-
 fs/f2fs/super.c         |  36 ++-
 fs/f2fs/xattr.c         | 116 ++++-----
 fs/f2fs/xattr.h         |  24 +-
 include/linux/highmem.h |  27 +++
 22 files changed, 1444 insertions(+), 1447 deletions(-)

-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
