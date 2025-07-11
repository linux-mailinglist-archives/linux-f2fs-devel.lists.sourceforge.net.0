Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8CAB0218E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 11 Jul 2025 18:20:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Date:Message-Id:MIME-Version:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+1qD8UyG4zfkpX6chCWn4uL+VK3f5aCZdcXwF7Ds1C8=; b=fM2d7iBhvdigGIIyjOo44NOECp
	oB1AcDduqN/iXa+8SdelY8YB9jNo6AmcSFxpUiQdquXQKwCwnNXYsyC1ifravtl6j/WSfIdp4Xtp/
	zKj6BydBuPSQhU5JmMtRbDt0B1Zp4YKhxKgeuPXdDXQXtZjZ4Orq7GWBt/2bDrcT6LwE=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uaGTq-00058W-1B;
	Fri, 11 Jul 2025 16:20:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1uaGTn-00058F-Ud
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Jul 2025 16:20:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fmcDFlywWFIKA3eZVHBRDdFxk350vDZPxBrVnXsU6bg=; b=ZHm46MAZSpyZoMulBY+h+SCC/U
 FRrUTPfK2s5Q/HE6E0re4I/53sGABqOuxidmPaaxy3q0MpD4I3hE3aQXmKT6gEObfQVrUWxLiWUyB
 HO5pC2AGVh9EKm1Z6u2o3Ejw3SEcfwCzhrYq85YdlqXDQRaKzENqVWu8PTuckR9b75AM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=fmcDFlywWFIKA3eZVHBRDdFxk350vDZPxBrVnXsU6bg=; b=Q
 oh4XAJXHxAc9OejthRpsNrcuRvxbVuNv21a1o4aIzgEfhb5x5HFY5rjS05ll4y9u2J9dU2BDx18+E
 wgxHqyEuX+YE21LQgWQgFF0cVVVtR1ujuOWjQd21FzGeT+Aiq2bh6IcztNvdHrTERd++hIPaU2ekK
 NQR4nvu1gHCAwVrY=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uaGTl-0005rX-IT for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Jul 2025 16:20:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 42942433AD
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 11 Jul 2025 16:19:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22C20C4CEED
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 11 Jul 2025 16:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752250795;
 bh=IxpkPGUaxuJwXd5C0Qxbhoizzhe3F5cyocDoRxOyDlU=;
 h=Subject:From:Date:To:From;
 b=aBKr3wgLWZVzkLH4XQBioV8rkh2+Oxf5Slhb2fbTazWKXbwPiSxuEfZvnLYXyz6Ge
 +iqo3QB132iZIJeLLUHbssGhS40TKvTfHTxOkHM1KUPp9aUsXK6Qx7/z3+rmarP8uY
 C0f8XtBzoiK1DkTN5C43upB8HCgMZd8NiAqrv8hhqDHDvHuG94bbHiy107UUvr/Jsa
 UrD5H6me6f1U/9MbtXLkuIBf8110HU7U6i0reY4VbQgbutjz3h0bjyXmN7fiRmKM3K
 wr+sbX+3XYxR8AgzW5BiOhjjWBeTecAeg651o67zXhm9TavKYC7JJ4PNYMOlcCL1jI
 TN7/v6LHwiOFA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 37FF8383B275 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 11 Jul 2025 16:20:18 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175225081679.2325425.7816502983073372451.git-patchwork-summary@kernel.org>
Date: Fri, 11 Jul 2025 16:20:16 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Series: f2fs folio conversions
 for 6.17 Submitter: Matthew Wilcox <willy@infradead.org> Patchwork:
 https://patchwork.kernel.org/project/f2fs/list/?series=980132
 Lore link: https://lore.kernel.org/r/20 [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uaGTl-0005rX-IT
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

Series: f2fs folio conversions for 6.17
  Submitter: Matthew Wilcox <willy@infradead.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=980132
  Lore link: https://lore.kernel.org/r/20250708170359.111653-1-willy@infradead.org
    Patches: [f2fs-dev,01/60] f2fs: Pass a folio to recover_dentry()
             [f2fs-dev,02/60] f2fs: Pass a folio to recover_inode()
             [f2fs-dev,03/60] f2fs: Pass a folio to recover_quota_data()
             [f2fs-dev,04/60] f2fs: Pass a folio to f2fs_recover_inode_page()
             [f2fs-dev,05/60] f2fs: Pass a folio to sanity_check_extent_cache()
             [f2fs-dev,06/60] f2fs: Pass a folio to sanity_check_inode()
             [f2fs-dev,07/60] f2fs: Pass a folio to f2fs_sanity_check_inline_data()
             [f2fs-dev,08/60] f2fs: Pass a folio to inode_has_blocks()
             [f2fs-dev,12/60] f2fs: Pass a folio to is_recoverable_dnode()
             [f2fs-dev,13/60] f2fs: Pass a folio to set_dentry_mark()
             [f2fs-dev,14/60] f2fs: Pass a folio to set_fsync_mark()
             [f2fs-dev,15/60] f2fs: Pass a folio to set_mark()
             [f2fs-dev,16/60] f2fs: Pass a folio to f2fs_allocate_data_block()
             [f2fs-dev,17/60] f2fs: Pass a folio to f2fs_inode_chksum_set()
             [f2fs-dev,18/60] f2fs: Pass a folio to f2fs_enable_inode_chksum()
             [f2fs-dev,19/60] f2fs: Pass a folio to f2fs_inode_chksum()
             [f2fs-dev,20/60] f2fs: Pass a folio to fill_node_footer_blkaddr()
             [f2fs-dev,21/60] f2fs: Pass a folio to get_nid()
             [f2fs-dev,22/60] f2fs: Pass a folio to set_cold_node()
             [f2fs-dev,23/60] f2fs: Pass folios to copy_node_footer()
             [f2fs-dev,24/60] f2fs: Pass a folio to fill_node_footer()
             [f2fs-dev,25/60] f2fs: Pass a folio to cpver_of_node()
             [f2fs-dev,26/60] f2fs: Pass a folio to f2fs_recover_xattr_data()
             [f2fs-dev,27/60] f2fs: Pass a folio to is_fsync_dnode()
             [f2fs-dev,28/60] f2fs: Pass a folio to is_dent_dnode()
             [f2fs-dev,29/60] f2fs: Add fio->folio
             [f2fs-dev,30/60] f2fs: Use folio_unlock() in f2fs_write_compressed_pages()
             [f2fs-dev,31/60] f2fs: Pass a folio to is_cold_node()
             [f2fs-dev,32/60] f2fs: Pass a folio to is_node()
             [f2fs-dev,33/60] f2fs: Pass a folio to IS_DNODE()
             [f2fs-dev,34/60] f2fs: Pass a folio to ofs_of_node()
             [f2fs-dev,35/60] f2fs: Pass a folio to get_dnode_base()
             [f2fs-dev,36/60] f2fs: Pass a folio to ADDRS_PER_PAGE()
             [f2fs-dev,37/60] f2fs: Pass a folio to IS_INODE()
             [f2fs-dev,38/60] f2fs: Add folio counterparts to page_private_flags functions
             [f2fs-dev,40/60] f2fs: Convert set_page_private_data() to folio_set_f2fs_data()
             [f2fs-dev,41/60] f2fs: Convert get_page_private_data() to folio_get_f2fs_data()
             [f2fs-dev,42/60] f2fs: Pass a folio to f2fs_compress_write_end_io()
             [f2fs-dev,43/60] f2fs: Use a folio in f2fs_merge_page_bio()
             [f2fs-dev,44/60] f2fs: Use a bio in f2fs_submit_page_write()
             [f2fs-dev,45/60] f2fs: Pass a folio to WB_DATA_TYPE() and f2fs_is_cp_guaranteed()
             [f2fs-dev,46/60] f2fs: Use a folio iterator in f2fs_handle_step_decompress()
             [f2fs-dev,47/60] f2fs: Pass a folio to f2fs_end_read_compressed_page()
             [f2fs-dev,48/60] f2fs: Use a folio iterator in f2fs_verify_bio()
             [f2fs-dev,49/60] f2fs: Pass a folio to f2fs_is_compressed_page()
             [f2fs-dev,50/60] f2fs: Convert get_next_nat_page() to get_next_nat_folio()
             [f2fs-dev,51/60] f2fs: Pass the nat_blk to __update_nat_bits()
             [f2fs-dev,52/60] f2fs: Pass a folio to F2FS_NODE()
             [f2fs-dev,53/60] f2fs: Pass a folio to f2fs_cache_compressed_page()
             [f2fs-dev,54/60] f2fs: Use a folio in f2fs_encrypted_get_link()
             [f2fs-dev,55/60] f2fs: Use F2FS_F_SB() in f2fs_read_end_io()
             [f2fs-dev,56/60] f2fs: Remove clear_page_private_all()
             [f2fs-dev,57/60] f2fs: Remove use of page from f2fs_write_single_data_page()
             [f2fs-dev,58/60] f2fs: Pass a folio to f2fs_submit_merged_write_cond()
             [f2fs-dev,59/60] f2fs: Pass a folio to __has_merged_page()
             [f2fs-dev,60/60] f2fs: Remove F2FS_P_SB()

Patch: [f2fs-dev] f2fs: fix to avoid out-of-boundary access in devs.path
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=981365
  Lore link: https://lore.kernel.org/r/20250711071450.207302-1-chao@kernel.org


Total patches: 57

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
