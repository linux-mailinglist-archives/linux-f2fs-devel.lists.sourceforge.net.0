Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D254A4E7CC
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Mar 2025 18:10:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tpVmm-0002hY-U5;
	Tue, 04 Mar 2025 17:10:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1tpVmk-0002hQ-2Z
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Mar 2025 17:10:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=D7znQesJF9QcW9oJFYM9lakswctG5RixeNiUwCajqLY=; b=OTaDSlzqYCZZ50EmyrxRTFdaf4
 5nO8AQe9CK9QWKN7ngeee0OIRbraKrIK5Xkbvrq15T28lslZMOu/FDq/L12WxdibkCJg0qijF/z1z
 L6Wn0SmHT6YjiTD81/62yxzaYOcWEsAT9O+kdZIQcCU/LzAMuxABOXALo2GXShQSOLpo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=D7znQesJF9QcW9oJFYM9lakswctG5RixeNiUwCajqLY=; b=g
 ZeLwcMUtbJY9hA65+P88lv4YaNsCrBORYQcDOwzoo6Y68J9ILhpk8VSjpP4p0rj1DuwR+49alB9qN
 dsNbE1Z/+1PtFDDI5i3pBv1c0Wgv1rAdSrTufVHXllTY9hZpItD3h3p2XG5wWYooEWBxARYMYOT7c
 1cPr1PkYeGyqSJjo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tpVmf-0004nm-1w for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Mar 2025 17:10:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D7F4D5C5EE7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  4 Mar 2025 17:07:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DFA9C4CEE5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  4 Mar 2025 17:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741108210;
 bh=KnZMZGV27mKsu0Zf3uZIVQxeZ37xYPWWuP5kWcT/Rxw=;
 h=Subject:From:Date:To:From;
 b=cPcCT6Gicf3bolq5d2z/XNc5X9UPgKrMbxo7Hab/qX3K7WZw/5gce5RKDpqGGqw7e
 CltqR36Z1a+Sb1UkeHE5SpHeyVxA+g4eX18HiIZNjq52GDH/6nAGucmYTZBvlbOjJ0
 uIW+L3vD1lk/gn+Kj0tiEpXWkYO39IPKjBgHHOmTTxvFrTmrR95AbgW8xN3c+LGkyq
 NF1boJ5TcQ+R64cgXDNvAK0XdWuqjvkNpDSRjSJQS7WlgQbmKptBOdIdL8xxC7E6oh
 cxzl83zQzNBepX2sSKmM5WbYdDamCvfzPnLh3m84FPIX9tC7RsI0eSlWMI5DCUoKH1
 Vq/wP7uJyiJdg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70E28380AA7F for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  4 Mar 2025 17:10:44 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <174110824298.224349.3568071271576900474.git-patchwork-summary@kernel.org>
Date: Tue, 04 Mar 2025 17:10:42 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Series: f2fs folio conversions
 for v6.15 Submitter: Matthew Wilcox (Oracle) <willy@infradead.org> Committer:
 Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kernel.org/project/f2fs/list/ [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tpVmf-0004nm-1w
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

Series: f2fs folio conversions for v6.15
  Submitter: Matthew Wilcox (Oracle) <willy@infradead.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=934965
  Lore link: https://lore.kernel.org/r/20250218055203.591403-1-willy@infradead.org
    Patches: [f2fs-dev,01/27] f2fs: Add f2fs_folio_wait_writeback()
             [f2fs-dev,02/27] mm: Remove wait_for_stable_page()
             [f2fs-dev,04/27] f2fs: Convert f2fs_flush_inline_data() to use a folio
             [f2fs-dev,05/27] f2fs: Convert f2fs_sync_node_pages() to use a folio
             [f2fs-dev,06/27] f2fs: Pass a folio to flush_dirty_inode()
             [f2fs-dev,07/27] f2fs: Convert f2fs_fsync_node_pages() to use a folio
             [f2fs-dev,08/27] f2fs: Convert last_fsync_dnode() to use a folio
             [f2fs-dev,09/27] f2fs: Return a folio from last_fsync_dnode()
             [f2fs-dev,10/27] f2fs: Add f2fs_grab_cache_folio()
             [f2fs-dev,11/27] mm: Remove grab_cache_page_write_begin()
             [f2fs-dev,12/27] f2fs: Use a folio in __get_node_page()
             [f2fs-dev,13/27] f2fs: Use a folio in do_write_page()
             [f2fs-dev,14/27] f2fs: Convert f2fs_write_end_io() to use a folio_iter
             [f2fs-dev,15/27] f2fs: Mark some functions as taking a const page pointer
             [f2fs-dev,16/27] f2fs: Convert f2fs_in_warm_node_list() to take a folio
             [f2fs-dev,17/27] f2fs: Add f2fs_get_node_folio()
             [f2fs-dev,18/27] f2fs: Use a folio throughout f2fs_truncate_inode_blocks()
             [f2fs-dev,19/27] f2fs: Use a folio throughout __get_meta_page()
             [f2fs-dev,20/27] f2fs: Hoist the page_folio() call to the start of f2fs_merge_page_bio()
             [f2fs-dev,21/27] f2fs: Add f2fs_get_read_data_folio()
             [f2fs-dev,22/27] f2fs: Add f2fs_get_lock_data_folio()
             [f2fs-dev,23/27] f2fs: Convert move_data_page() to use a folio
             [f2fs-dev,24/27] f2fs: Convert truncate_partial_data_page() to use a folio
             [f2fs-dev,25/27] f2fs: Convert gc_data_segment() to use a folio
             [f2fs-dev,26/27] f2fs: Add f2fs_find_data_folio()
             [f2fs-dev,27/27] mm: Remove wait_on_page_locked()

Patch: [f2fs-dev] f2fs: fix to avoid out-of-bounds access in f2fs_truncate_inode_blocks()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=939434
  Lore link: https://lore.kernel.org/r/20250303034738.1355927-1-chao@kernel.org

Patch: [f2fs-dev] f2fs: fix potential deadloop in prepare_compress_overwrite()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=939421
  Lore link: https://lore.kernel.org/r/20250303032329.1309786-1-chao@kernel.org

Series: [f2fs-dev,1/3] f2fs: do sanity check on inode footer in f2fs_get_inode_page()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=939436
  Lore link: https://lore.kernel.org/r/20250303035423.1357211-1-chao@kernel.org
    Patches: [f2fs-dev,1/3] f2fs: do sanity check on inode footer in f2fs_get_inode_page()
             [f2fs-dev,2/3] f2fs: do sanity check on xattr node footer in f2fs_get_xnode_page()
             [f2fs-dev,3/3] f2fs: introduce FAULT_INCONSISTENT_FOOTER

Patch: [f2fs-dev] f2fs: fix to call f2fs_recover_quota_end() correctly
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=939422
  Lore link: https://lore.kernel.org/r/20250303032500.1310215-1-chao@kernel.org


Total patches: 32

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
