Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C199A9F418
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Apr 2025 17:09:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u9Q6I-0007si-77;
	Mon, 28 Apr 2025 15:08:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1u9Q6G-0007sW-Lk
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Apr 2025 15:08:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y3rmbT02DNhgej6TxgnfBwxzAWW+Xjw64NhDjQIGiDY=; b=EdqZKt3C7gFbDMfjB5APaKr2le
 fiUevzIksPGKG4JVEmyzHsBsHBgJwCAz1bBNdmfaMGFNSGqhI3lp3AdZ2qeFmoKfiKBWyquqPLI2b
 wP5jwDeQgJNDK73ykQfr27y8lGnra9cND5hR9To3tZau/nKdTr/gypdMx231agONOMJI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Y3rmbT02DNhgej6TxgnfBwxzAWW+Xjw64NhDjQIGiDY=; b=L1w+IXq3os7BPOlmFefQTnIOAe
 RmzW4j3/usryA+/t+kyXyti3kjcF7KN6CjtwPo3PXgK9InncXda6VtbtfF2J8oSvJSuWSDtt9IT9U
 Kwhhkp+fFonH2KpjiKAuPPfIctfrN8v2AO49ODAjR4bq1w0SIPEManRWqIhyfE2MG+LA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u9Q61-0008Kk-CD for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Apr 2025 15:08:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D622B5C075B;
 Mon, 28 Apr 2025 15:06:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83B7BC4CEE4;
 Mon, 28 Apr 2025 15:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745852911;
 bh=J1o4b1Wb3+wflosLnretLqhNuaeu3AwCGv6zHzKkbvA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TzsqCeNVnSFi1VSLaSLBFMGJggVLvrGkTVBZpWkVSpHNFuilhJBz4O2kNCQXqqqcy
 UN6op++c2b0bV7DNMIrylWQoF1muXb3AEpr7mYOoIqIl24aIRPds3wKFrD3SgiWu3t
 lOvKDonVAbHyOrqY6TP3IRzhtXvWpGYDtLtJLJhjIhffZyorDp9n1LTUgkqRjUTcqA
 OZfzvrC5hwkpl7TnKueXzPDwMkfb6USfcyi0rkI+gcGr/af7YFwTybrFKF3keEVUkV
 fgdH1ZNbYMtxAPJ8xkzoZWZFPaRUZyshdZCYUG5g9cVDDEwrcIcSTfMWoU0Yd7nygk
 khH8VwRcInLKw==
Date: Mon, 28 Apr 2025 15:08:29 +0000
To: Chao Yu <chao@kernel.org>
Message-ID: <aA-Z7dyZKAvBAVVx@google.com>
References: <20250331201256.1057782-1-willy@infradead.org>
 <7e6e2a93-74fa-43af-9335-8acedabda4fd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7e6e2a93-74fa-43af-9335-8acedabda4fd@kernel.org>
X-Spam-Score: -5.7 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 04/28, Chao Yu wrote: > On 4/1/25 04:10, Matthew Wilcox
 (Oracle) wrote: > > Sorry for the length of this series. Each patch in this
 series builds, > > but obviously I haven't done any testing. It s [...] 
 Content analysis details:   (-5.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
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
X-Headers-End: 1u9Q61-0008Kk-CD
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 04/28, Chao Yu wrote:
> On 4/1/25 04:10, Matthew Wilcox (Oracle) wrote:
> > Sorry for the length of this series.  Each patch in this series builds,
> > but obviously I haven't done any testing.  It should be easy to bisect
> > to any mistakes I've made.  This conversion isn't complete; I estimate
> > another 100 or so patches will be needed.
> > 
> > Matthew Wilcox (Oracle) (153):
> >   f2fs: Use a folio in f2fs_compress_free_page()
> >   f2fs: Use a folio in f2fs_write_raw_pages()
> >   f2fs: Introduce fio_inode()
> >   f2fs: Use F2FS_P_SB() in f2fs_is_compressed_page()
> >   f2fs: Use bio_for_each_folio_all() in __has_merged_page()
> >   f2fs: Use a folio in add_ipu_page()
> >   f2fs: Remove access to page->mapping in f2fs_is_cp_guaranteed()
> >   f2fs: Use a folio in move_data_block()
> >   f2fs: Use a folio in f2fs_quota_read()
> >   f2fs: Add f2fs_grab_meta_folio()
> >   f2fs: Use a folio in commit_checkpoint()
> >   f2fs: Convert __f2fs_write_meta_page() to __f2fs_write_meta_folio()
> >   f2fs: Use f2fs_folio_wait_writeback()
> >   f2fs: Pass a folio to f2fs_submit_merged_ipu_write()
> >   f2fs: Convert __get_meta_page() to __get_meta_folio()
> >   f2fs: Convert f2fs_get_tmp_page() to f2fs_get_tmp_folio()
> >   f2fs: Pass a folio to next_blkaddr_of_node()
> >   f2fs: Use a folio in f2fs_ra_meta_pages()
> >   f2fs: Use a folio in f2fs_ra_meta_pages_cond()
> >   f2fs: Use a folio in write_orphan_inodes()
> >   f2fs: Use a folio in get_next_nat_page()
> >   f2fs: Convert get_next_sit_page() to get_next_sit_folio()
> >   f2fs: Use a folio in f2fs_update_meta_page()
> >   f2fs: Use a folio in write_current_sum_page()
> >   f2fs: Use a folio in write_compacted_summaries()
> >   f2fs: Remove f2fs_grab_meta_page()
> >   f2fs: Add f2fs_get_meta_folio()
> >   f2fs: Use a folio in build_sit_entries()
> >   f2fs: Use a folio in f2fs_recover_orphan_inodes()
> >   f2fs: Use a folio in validate_checkpoint()
> >   f2fs: Use a folio in f2fs_get_valid_checkpoint()
> >   f2fs: Use a folio in f2fs_get_node_info()
> >   f2fs: Use a folio in __get_nat_bitmaps()
> >   f2fs: Use a folio in read_compacted_summaries()
> >   f2fs: Use a folio in read_normal_summaries()
> >   f2fs: Remove f2fs_get_meta_page()
> >   f2fs: Convert f2fs_get_meta_page_retry() to
> >     f2fs_get_meta_folio_retry()
> >   f2fs: Pass an address to scan_nat_page()
> >   f2fs: Add f2fs_get_sum_folio()
> >   f2fs: Use folios in do_garbage_collect()
> >   f2fs: Use a folio in check_index_in_prev_nodes()
> >   f2fs: Use a folio in change_curseg()
> >   f2fs: Remove f2fs_get_sum_page()
> >   f2fs: Use a folio in find_in_level()
> >   f2fs: Use a folio in f2fs_delete_entry()
> >   f2fs: Use a folio in f2fs_readdir()
> >   f2fs: Remove f2fs_find_data_page()
> >   f2fs: Use a folio in f2fs_get_new_data_page()
> >   f2fs: Use a folio in f2fs_migrate_blocks()
> >   f2fs: Add f2fs_get_new_data_folio()
> >   highmem: Add memcpy_folio()
> >   f2fs: Use a folio in __clone_blkaddrs()
> >   f2fs: Use a folio in f2fs_defragment_range()
> >   f2fs: Remove f2fs_get_lock_data_page()
> >   f2fs: Use a folio in fill_zero()
> >   f2fs: Use a folio in f2fs_add_regular_entry()
> >   f2fs: Use a folio in make_empty_dir()
> >   f2fs: Remove f2fs_get_new_data_page()
> >   f2fs: Use a folio in f2fs_xattr_fiemap()
> >   f2fs: Use a folio in ra_data_block()
> >   f2fs: Use a folio in move_data_block()
> >   f2fs: Use a folio in f2fs_convert_inline_inode()
> >   f2fs: Use a folio in f2fs_move_inline_dirents()
> >   f2fs: Add f2fs_new_node_folio()
> >   f2fs: Use a folio in f2fs_ra_node_page()
> >   f2fs: Convert read_node_page() to read_node_folio()
> >   f2fs: Pass a folio to f2fs_inode_chksum_verify()
> >   f2fs: Use a folio in f2fs_recover_inode_page()
> >   f2fs: Remove f2fs_grab_cache_page()
> >   f2fs: Add f2fs_get_xnode_folio()
> >   f2fs: Use a folio in write_all_xattrs()
> >   f2fs: Use a folio in f2fs_recover_xattr_data()
> >   f2fs: Add f2fs_get_node_folio()
> >   f2fs: Use folios in f2fs_get_dnode_of_data()
> >   f2fs: Use a folio in truncate_node()
> >   f2fs: Use a folio in truncate_nodes()
> >   f2fs: Use folios in truncate_partial_nodes()
> >   f2fs: Pass a folio to f2fs_ra_node_pages()
> >   f2fs: Use a folio in gc_node_segment()
> >   f2fs: Convert f2fs_move_node_page() to f2fs_move_node_folio()
> >   f2fs: Convert __write_node_page() to __write_node_folio()
> >   f2fs: Use a folio in is_alive()
> >   f2fs: Use a folio in check_index_in_prev_nodes()
> >   f2fs: Remove f2fs_get_node_page()
> >   f2fs: Use a folio in prepare_write_begin
> >   f2fs: Use a folio in __find_data_block()
> >   f2fs: Use a folio in f2fs_init_inode_metadata()
> >   f2fs: Pass a folio to make_empty_dir()
> >   f2fs: Use a folio in f2fs_try_convert_inline_dir()
> >   f2fs: Use a folio in f2fs_add_inline_entry()
> >   f2fs: Pass a folio to f2fs_move_inline_dirents()
> >   f2fs: Pass a folio to f2fs_move_rehashed_dirents()
> >   f2fs: Use a folio in f2fs_do_truncate_blocks()
> >   f2fs: Use a folio in f2fs_truncate_xattr_node()
> >   f2fs: Pass folios to set_new_dnode()
> >   f2fs: Convert f2fs_convert_inline_page() to
> >     f2fs_convert_inline_folio()
> >   f2fs: Use a folio in read_xattr_block()
> >   f2fs: Remove f2fs_get_xnode_page()
> >   f2fs: Use a folio in f2fs_write_inline_data()
> >   f2fs: Use a folio in f2fs_read_inline_data()
> >   f2fs: Use a folio in f2fs_recover_inline_data()
> >   f2fs: Use a folio in f2fs_find_in_inline_dir()
> >   f2fs: Use a folio in f2fs_empty_inline_dir()
> >   f2fs: Use a folio in f2fs_read_inline_dir()
> >   f2fs: Use a folio in f2fs_inline_data_fiemap()
> >   f2fs: Use a folio in f2fs_update_inode_page()
> >   f2fs: Use a folio in do_read_inode()
> >   f2fs: Pass folios to f2fs_init_acl()
> >   f2fs: Pass a folio to f2fs_setxattr()
> >   f2fs: Pass a folio to __f2fs_setxattr()
> >   f2fs: Pass a folio to write_all_xattrs()
> >   f2fs: Use a folio in read_inline_xattr()
> >   f2fs: Use a folio in f2fs_recover_inline_xattr()
> >   f2fs: Remove f2fs_get_inode_page()
> >   f2fs: Pass a folio to f2fs_getxattr()
> >   f2fs: Pass a folio to read_inline_xattr()
> >   f2fs: Pass a folio to do_recover_data()
> >   f2fs: Pass a folio to f2fs_recover_inline_xattr()
> >   f2fs: Pass a folio to inline_xattr_addr()
> >   f2fs: Pass a folio to init_dent_inode()
> >   f2fs: Pass a folio to f2fs_make_empty_inline_dir()
> >   f2fs: Pass a folio to f2fs_has_enough_room()
> >   f2fs: Convert dnode_of_data->inode_page to inode_folio
> >   f2fs: Pass a folio to f2fs_do_read_inline_data()
> >   f2fs: Pass a folio to f2fs_truncate_inline_inode()
> >   f2fs: Pass a folio to __f2fs_find_entry()
> >   f2fs: Pass a folio to f2fs_find_entry()
> >   f2fs: Pass a folio to f2fs_parent_dir()
> >   f2fs: Pass a folio to f2fs_delete_entry()
> >   f2fs: Pass a folio to f2fs_delete_inline_entry()
> >   f2fs: Pass a folio to f2fs_recover_inline_data()
> >   f2fs: Pass a folio to __recover_inline_status()
> >   f2fs: Pass a folio to inline_data_addr()
> >   f2fs: Convert f2fs_put_page_dic() to f2fs_put_folio_dic()
> >   f2fs: Pass a folio to f2fs_set_link()
> >   f2fs: Use a folio in need_inode_page_update()
> >   f2fs: Use a folio in f2fs_truncate_meta_inode_pages()
> >   f2fs: Use a folio in f2fs_cache_compressed_page()
> >   f2fs: Use a folio in prepare_compress_overwrite()
> >   f2fs: Convert f2fs_load_compressed_page() to
> >     f2fs_load_compressed_folio()
> >   f2fs: Use a folio in f2fs_encrypt_one_page()
> >   f2fs: Use a folio in redirty_blocks()
> >   f2fs: Use a folio in f2fs_wait_on_block_writeback()
> >   f2fs: Pass a folio to f2fs_init_read_extent_tree()
> >   f2fs: Return a folio from f2fs_init_inode_metadata()
> >   f2fs: Pass a folio to f2fs_update_inode()
> >   f2fs: Pass a folio to set_nid()
> >   f2fs: Convert dnode_of_data->node_page to node_folio
> >   f2fs: Pass a folio to get_dnode_addr()
> >   f2fs: Convert fsync_node_entry->page to folio
> >   f2fs: Remove f2fs_new_node_page()
> >   f2fs: Use a folio in flush_inline_data()
> >   f2fs: Convert clear_node_page_dirty() to clear_node_folio_dirty()
> 
> Thanks for the work, the patchset looks good to me.
> 
> Reviewed-by: Chao Yu <chao@kernel.org>
> 
> Note that, it needs to clean up f2fs_put_page(, {0,1}) w/
> f2fs_folio_put(, {false,true}), I guess Jaegeuk could help to update
> directly in dev-test branch?

Yup, let me resolve them directly.

Thanks,

> 
> Thanks,
> 
> > 
> >  fs/f2fs/acl.c           |  33 ++-
> >  fs/f2fs/acl.h           |  10 +-
> >  fs/f2fs/checkpoint.c    | 193 +++++++--------
> >  fs/f2fs/compress.c      | 134 +++++-----
> >  fs/f2fs/data.c          | 208 ++++++++--------
> >  fs/f2fs/dir.c           | 240 +++++++++---------
> >  fs/f2fs/extent_cache.c  |  10 +-
> >  fs/f2fs/f2fs.h          | 184 +++++++-------
> >  fs/f2fs/file.c          | 155 ++++++------
> >  fs/f2fs/gc.c            | 140 ++++++-----
> >  fs/f2fs/inline.c        | 306 +++++++++++------------
> >  fs/f2fs/inode.c         |  94 +++----
> >  fs/f2fs/namei.c         | 112 ++++-----
> >  fs/f2fs/node.c          | 526 ++++++++++++++++++++--------------------
> >  fs/f2fs/node.h          |  12 +-
> >  fs/f2fs/recovery.c      | 178 +++++++-------
> >  fs/f2fs/segment.c       | 147 ++++++-----
> >  fs/f2fs/segment.h       |   6 +-
> >  fs/f2fs/super.c         |  36 ++-
> >  fs/f2fs/xattr.c         | 116 ++++-----
> >  fs/f2fs/xattr.h         |  24 +-
> >  include/linux/highmem.h |  27 +++
> >  22 files changed, 1444 insertions(+), 1447 deletions(-)
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
