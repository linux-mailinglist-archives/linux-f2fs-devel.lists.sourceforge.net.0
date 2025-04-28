Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E56ABA9FD23
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Apr 2025 00:40:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Date:Message-Id:MIME-Version:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DFLLpwEJaJeeJBejnOWEHUiHo0JXEReoYDrAAjL9bPg=; b=HmmL/45jrXORO1VNZCx6/rsR3N
	RJ/vOb7hAJPo9TikRzckQ9sa1uotGpUsGpyBQmLrIiZjroF5CsrBEB6aoFbqO32o0FLQK3UMh6LcW
	+t3ILi8ghF8FWOEtiZKEn96FmPILh2alqfNCcyb9B61ZlSJNefqT+6Rdum780UZzYCuE=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u9X9T-0000ij-BG;
	Mon, 28 Apr 2025 22:40:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1u9X9S-0000id-C8
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Apr 2025 22:40:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QvwHuRo3tj/PmYc1elhCOmO6RWBj37cPnjrEslTSgug=; b=elWBipsdGTR0+X4D3dYH+fuaOQ
 DZUWp7sBThEXFtKI1k0ciXD7AhXzQAyvSwgGObTO23SHyuidqR3HOrlHH1kmpxWlMje94qlpD5Jmy
 ZQRowiXRDt+ncWbSuX8Gmz+StPihkNgFbFSrmgU47fCwu9clRi1Hn7NBaPqoC2gTVrpM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=QvwHuRo3tj/PmYc1elhCOmO6RWBj37cPnjrEslTSgug=; b=g
 ShJp7Y7rvySkQgfGJ3Tc+ydNbt3a5h265QCSZVw75c84QNLq/QNpM3cbM20N5H2rtNGh67Up71fEQ
 I8RMwiX4OakHY5TfLscCpAQjZMypwG/6GSiyiy9t4lIVqOi47nQdhmpVdMZ/TZLbXCMWmgaW3iSgR
 dbofgKI20NgY161U=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u9X9C-0002K7-5d for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Apr 2025 22:40:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3534C614AE
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 28 Apr 2025 22:39:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C7DBC4CEE4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 28 Apr 2025 22:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745880011;
 bh=+3N9bZBS36B4kXAKaNV60ZjebY3ANOM93nRJ0TxifV4=;
 h=Subject:From:Date:To:From;
 b=P5y5BvO6KFqjLbQD55Pmk3Rf1h3GEMWGVp+xG5QgikrSqfEVWPMJL3SQHPxeL0Isj
 yUj9uYmfiPJzMWdDchLy0IXiZUEsGpII2jdeq/uw8ijB+Dl0iiMhcG+JZxzlQybLLM
 +gsCngb+pEeyjglkOSl7+nunv/Ieic7QKXiLgVj0QgVVOFM7DRLkn92l6W1DViKkqz
 7fy2th+4CFlQO5z/oWqWjyxiBl9+DbfOydThhILuaFHYM5kUqe8PwGzP1IPpj85awt
 34A6DCHrTyKX5YvEhohfuLAuLKER8CRTt/csvUQh6wU+1ks3EzsjYJpe519Uw+mbuM
 PXW9E+LPdEqzQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 375BB3822D43 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 28 Apr 2025 22:40:51 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <174588004967.1067750.11313106020989877434.git-patchwork-summary@kernel.org>
Date: Mon, 28 Apr 2025 22:40:49 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Series: f2fs folio conversions
 for 6.16 Submitter: Matthew Wilcox <willy@infradead.org> Committer: Jaegeuk
 Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kernel.org/project/f2fs/list/?series=94 [...] 
 Content analysis details:   (-0.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u9X9C-0002K7-5d
Subject: [f2fs-dev] Patchwork summary for: f2fs
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

The following patches were marked "accepted", because they were applied to
jaegeuk/f2fs.git (dev):

Series: f2fs folio conversions for 6.16
  Submitter: Matthew Wilcox <willy@infradead.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=948674
  Lore link: https://lore.kernel.org/r/20250331201256.1057782-1-willy@infradead.org
    Patches: [f2fs-dev,001/153] f2fs: Use a folio in f2fs_compress_free_page()
             [f2fs-dev,002/153] f2fs: Use a folio in f2fs_write_raw_pages()
             [f2fs-dev,004/153] f2fs: Use F2FS_P_SB() in f2fs_is_compressed_page()
             [f2fs-dev,005/153] f2fs: Use bio_for_each_folio_all() in __has_merged_page()
             [f2fs-dev,006/153] f2fs: Use a folio in add_ipu_page()
             [f2fs-dev,007/153] f2fs: Remove access to page->mapping in f2fs_is_cp_guaranteed()
             [f2fs-dev,009/153] f2fs: Use a folio in f2fs_quota_read()
             [f2fs-dev,010/153] f2fs: Add f2fs_grab_meta_folio()
             [f2fs-dev,011/153] f2fs: Use a folio in commit_checkpoint()
             [f2fs-dev,012/153] f2fs: Convert __f2fs_write_meta_page() to __f2fs_write_meta_folio()
             [f2fs-dev,013/153] f2fs: Use f2fs_folio_wait_writeback()
             [f2fs-dev,014/153] f2fs: Pass a folio to f2fs_submit_merged_ipu_write()
             [f2fs-dev,015/153] f2fs: Convert __get_meta_page() to __get_meta_folio()
             [f2fs-dev,016/153] f2fs: Convert f2fs_get_tmp_page() to f2fs_get_tmp_folio()
             [f2fs-dev,017/153] f2fs: Pass a folio to next_blkaddr_of_node()
             [f2fs-dev,018/153] f2fs: Use a folio in f2fs_ra_meta_pages()
             [f2fs-dev,020/153] f2fs: Use a folio in write_orphan_inodes()
             [f2fs-dev,021/153] f2fs: Use a folio in get_next_nat_page()
             [f2fs-dev,022/153] f2fs: Convert get_next_sit_page() to get_next_sit_folio()
             [f2fs-dev,023/153] f2fs: Use a folio in f2fs_update_meta_page()
             [f2fs-dev,024/153] f2fs: Use a folio in write_current_sum_page()
             [f2fs-dev,025/153] f2fs: Use a folio in write_compacted_summaries()
             [f2fs-dev,026/153] f2fs: Remove f2fs_grab_meta_page()
             [f2fs-dev,027/153] f2fs: Add f2fs_get_meta_folio()
             [f2fs-dev,028/153] f2fs: Use a folio in build_sit_entries()
             [f2fs-dev,029/153] f2fs: Use a folio in f2fs_recover_orphan_inodes()
             [f2fs-dev,030/153] f2fs: Use a folio in validate_checkpoint()
             [f2fs-dev,032/153] f2fs: Use a folio in f2fs_get_node_info()
             [f2fs-dev,033/153] f2fs: Use a folio in __get_nat_bitmaps()
             [f2fs-dev,034/153] f2fs: Use a folio in read_compacted_summaries()
             [f2fs-dev,035/153] f2fs: Use a folio in read_normal_summaries()
             [f2fs-dev,036/153] f2fs: Remove f2fs_get_meta_page()
             [f2fs-dev,037/153] f2fs: Convert f2fs_get_meta_page_retry() to f2fs_get_meta_folio_retry()
             [f2fs-dev,038/153] f2fs: Pass an address to scan_nat_page()
             [f2fs-dev,039/153] f2fs: Add f2fs_get_sum_folio()
             [f2fs-dev,040/153] f2fs: Use folios in do_garbage_collect()
             [f2fs-dev,041/153] f2fs: Use a folio in check_index_in_prev_nodes()
             [f2fs-dev,042/153] f2fs: Use a folio in change_curseg()
             [f2fs-dev,043/153] f2fs: Remove f2fs_get_sum_page()
             [f2fs-dev,044/153] f2fs: Use a folio in find_in_level()
             [f2fs-dev,045/153] f2fs: Use a folio in f2fs_delete_entry()
             [f2fs-dev,046/153] f2fs: Use a folio in f2fs_readdir()
             [f2fs-dev,047/153] f2fs: Remove f2fs_find_data_page()
             [f2fs-dev,048/153] f2fs: Use a folio in f2fs_get_new_data_page()
             [f2fs-dev,049/153] f2fs: Use a folio in f2fs_migrate_blocks()
             [f2fs-dev,050/153] f2fs: Add f2fs_get_new_data_folio()
             [f2fs-dev,051/153] highmem: Add memcpy_folio()
             [f2fs-dev,052/153] f2fs: Use a folio in __clone_blkaddrs()
             [f2fs-dev,053/153] f2fs: Use a folio in f2fs_defragment_range()
             [f2fs-dev,054/153] f2fs: Remove f2fs_get_lock_data_page()
             [f2fs-dev,055/153] f2fs: Use a folio in fill_zero()
             [f2fs-dev,056/153] f2fs: Use a folio in f2fs_add_regular_entry()
             [f2fs-dev,057/153] f2fs: Use a folio in make_empty_dir()
             [f2fs-dev,058/153] f2fs: Remove f2fs_get_new_data_page()
             [f2fs-dev,059/153] f2fs: Use a folio in f2fs_xattr_fiemap()
             [f2fs-dev,060/153] f2fs: Use a folio in ra_data_block()
             [f2fs-dev,061/153] f2fs: Use a folio in move_data_block()
             [f2fs-dev,062/153] f2fs: Use a folio in f2fs_convert_inline_inode()
             [f2fs-dev,063/153] f2fs: Use a folio in f2fs_move_inline_dirents()
             [f2fs-dev,064/153] f2fs: Add f2fs_new_node_folio()
             [f2fs-dev,065/153] f2fs: Use a folio in f2fs_ra_node_page()
             [f2fs-dev,067/153] f2fs: Pass a folio to f2fs_inode_chksum_verify()
             [f2fs-dev,068/153] f2fs: Use a folio in f2fs_recover_inode_page()
             [f2fs-dev,069/153] f2fs: Remove f2fs_grab_cache_page()
             [f2fs-dev,070/153] f2fs: Add f2fs_get_xnode_folio()
             [f2fs-dev,071/153] f2fs: Use a folio in write_all_xattrs()
             [f2fs-dev,072/153] f2fs: Use a folio in f2fs_recover_xattr_data()
             [f2fs-dev,073/153] f2fs: Add f2fs_get_node_folio()
             [f2fs-dev,075/153] f2fs: Use a folio in truncate_node()
             [f2fs-dev,076/153] f2fs: Use a folio in truncate_nodes()
             [f2fs-dev,077/153] f2fs: Use folios in truncate_partial_nodes()
             [f2fs-dev,079/153] f2fs: Use a folio in gc_node_segment()
             [f2fs-dev,080/153] f2fs: Convert f2fs_move_node_page() to f2fs_move_node_folio()
             [f2fs-dev,081/153] f2fs: Convert __write_node_page() to __write_node_folio()
             [f2fs-dev,082/153] f2fs: Use a folio in is_alive()
             [f2fs-dev,083/153] f2fs: Use a folio in check_index_in_prev_nodes()
             [f2fs-dev,084/153] f2fs: Remove f2fs_get_node_page()
             [f2fs-dev,085/153] f2fs: Use a folio in prepare_write_begin
             [f2fs-dev,086/153] f2fs: Use a folio in __find_data_block()
             [f2fs-dev,087/153] f2fs: Use a folio in f2fs_init_inode_metadata()
             [f2fs-dev,088/153] f2fs: Pass a folio to make_empty_dir()
             [f2fs-dev,089/153] f2fs: Use a folio in f2fs_try_convert_inline_dir()
             [f2fs-dev,090/153] f2fs: Use a folio in f2fs_add_inline_entry()
             [f2fs-dev,091/153] f2fs: Pass a folio to f2fs_move_inline_dirents()
             [f2fs-dev,092/153] f2fs: Pass a folio to f2fs_move_rehashed_dirents()
             [f2fs-dev,093/153] f2fs: Use a folio in f2fs_do_truncate_blocks()
             [f2fs-dev,094/153] f2fs: Use a folio in f2fs_truncate_xattr_node()
             [f2fs-dev,095/153] f2fs: Pass folios to set_new_dnode()
             [f2fs-dev,096/153] f2fs: Convert f2fs_convert_inline_page() to f2fs_convert_inline_folio()
             [f2fs-dev,097/153] f2fs: Use a folio in read_xattr_block()
             [f2fs-dev,098/153] f2fs: Remove f2fs_get_xnode_page()
             [f2fs-dev,099/153] f2fs: Use a folio in f2fs_write_inline_data()
             [f2fs-dev,100/153] f2fs: Use a folio in f2fs_read_inline_data()
             [f2fs-dev,101/153] f2fs: Use a folio in f2fs_recover_inline_data()
             [f2fs-dev,102/153] f2fs: Use a folio in f2fs_find_in_inline_dir()
             [f2fs-dev,103/153] f2fs: Use a folio in f2fs_empty_inline_dir()
             [f2fs-dev,104/153] f2fs: Use a folio in f2fs_read_inline_dir()
             [f2fs-dev,105/153] f2fs: Use a folio in f2fs_inline_data_fiemap()
             [f2fs-dev,106/153] f2fs: Use a folio in f2fs_update_inode_page()
             [f2fs-dev,107/153] f2fs: Use a folio in do_read_inode()
             [f2fs-dev,108/153] f2fs: Pass folios to f2fs_init_acl()
             [f2fs-dev,109/153] f2fs: Pass a folio to f2fs_setxattr()
             [f2fs-dev,110/153] f2fs: Pass a folio to __f2fs_setxattr()
             [f2fs-dev,111/153] f2fs: Pass a folio to write_all_xattrs()
             [f2fs-dev,112/153] f2fs: Use a folio in read_inline_xattr()
             [f2fs-dev,113/153] f2fs: Use a folio in f2fs_recover_inline_xattr()
             [f2fs-dev,114/153] f2fs: Remove f2fs_get_inode_page()
             [f2fs-dev,115/153] f2fs: Pass a folio to f2fs_getxattr()
             [f2fs-dev,116/153] f2fs: Pass a folio to read_inline_xattr()
             [f2fs-dev,117/153] f2fs: Pass a folio to do_recover_data()
             [f2fs-dev,118/153] f2fs: Pass a folio to f2fs_recover_inline_xattr()
             [f2fs-dev,119/153] f2fs: Pass a folio to inline_xattr_addr()
             [f2fs-dev,120/153] f2fs: Pass a folio to init_dent_inode()
             [f2fs-dev,121/153] f2fs: Pass a folio to f2fs_make_empty_inline_dir()
             [f2fs-dev,122/153] f2fs: Pass a folio to f2fs_has_enough_room()
             [f2fs-dev,123/153] f2fs: Convert dnode_of_data->inode_page to inode_folio
             [f2fs-dev,124/153] f2fs: Pass a folio to f2fs_do_read_inline_data()
             [f2fs-dev,125/153] f2fs: Pass a folio to f2fs_truncate_inline_inode()
             [f2fs-dev,126/153] f2fs: Pass a folio to __f2fs_find_entry()
             [f2fs-dev,128/153] f2fs: Pass a folio to f2fs_parent_dir()
             [f2fs-dev,129/153] f2fs: Pass a folio to f2fs_delete_entry()
             [f2fs-dev,130/153] f2fs: Pass a folio to f2fs_delete_inline_entry()
             [f2fs-dev,131/153] f2fs: Pass a folio to f2fs_recover_inline_data()
             [f2fs-dev,132/153] f2fs: Pass a folio to __recover_inline_status()
             [f2fs-dev,133/153] f2fs: Pass a folio to inline_data_addr()
             [f2fs-dev,134/153] f2fs: Convert f2fs_put_page_dic() to f2fs_put_folio_dic()
             [f2fs-dev,135/153] f2fs: Pass a folio to f2fs_set_link()
             [f2fs-dev,136/153] f2fs: Use a folio in need_inode_page_update()
             [f2fs-dev,137/153] f2fs: Use a folio in f2fs_truncate_meta_inode_pages()
             [f2fs-dev,138/153] f2fs: Use a folio in f2fs_cache_compressed_page()
             [f2fs-dev,139/153] f2fs: Use a folio in prepare_compress_overwrite()
             [f2fs-dev,140/153] f2fs: Convert f2fs_load_compressed_page() to f2fs_load_compressed_folio()
             [f2fs-dev,141/153] f2fs: Use a folio in f2fs_encrypt_one_page()
             [f2fs-dev,142/153] f2fs: Use a folio in redirty_blocks()
             [f2fs-dev,143/153] f2fs: Use a folio in f2fs_wait_on_block_writeback()
             [f2fs-dev,144/153] f2fs: Pass a folio to f2fs_init_read_extent_tree()
             [f2fs-dev,145/153] f2fs: Return a folio from f2fs_init_inode_metadata()
             [f2fs-dev,146/153] f2fs: Pass a folio to f2fs_update_inode()
             [f2fs-dev,147/153] f2fs: Pass a folio to set_nid()
             [f2fs-dev,148/153] f2fs: Convert dnode_of_data->node_page to node_folio
             [f2fs-dev,149/153] f2fs: Pass a folio to get_dnode_addr()
             [f2fs-dev,150/153] f2fs: Convert fsync_node_entry->page to folio
             [f2fs-dev,151/153] f2fs: Remove f2fs_new_node_page()
             [f2fs-dev,152/153] f2fs: Use a folio in flush_inline_data()
             [f2fs-dev,153/153] f2fs: Convert clear_node_page_dirty() to clear_node_folio_dirty()

Series: [f2fs-dev,1/2] f2fs: sysfs: add encoding_flags entry
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=953835
  Lore link: https://lore.kernel.org/r/20250416054805.1416834-1-chao@kernel.org
    Patches: [f2fs-dev,1/2] f2fs: sysfs: add encoding_flags entry
             [f2fs-dev,2/2] f2fs: sysfs: export linear_lookup in features directory

Series: [f2fs-dev,1/2] f2fs: clean up w/ fscrypt_is_bounce_page()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=953021
  Lore link: https://lore.kernel.org/r/20250414105237.728522-1-chao@kernel.org
    Patches: [f2fs-dev,1/2] f2fs: clean up w/ fscrypt_is_bounce_page()
             [f2fs-dev,2/2] f2fs: fix to detect gcing page in f2fs_is_cp_guaranteed()

Patch: [f2fs-dev] f2fs: fix to do sanity check on sit_bitmap_size
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=953022
  Lore link: https://lore.kernel.org/r/20250414105520.729616-1-chao@kernel.org

Patch: [f2fs-dev,v3,1/2] f2fs: zone: fix to calculate first_zoned_segno correctly
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=951823
  Lore link: https://lore.kernel.org/r/20250410031019.2884852-1-chao@kernel.org

Patch: [f2fs-dev,v2] f2fs: handle error cases of memory donation
  Submitter: Daeho Jeong <daeho43@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=956352
  Lore link: https://lore.kernel.org/r/20250423204935.2335000-1-daeho43@gmail.com

Patch: [f2fs-dev] f2fs: fix to bail out in get_new_segment()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=955671
  Lore link: https://lore.kernel.org/r/20250422115638.123455-1-chao@kernel.org


Total patches: 153

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
