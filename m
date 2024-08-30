Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CD2966AE5
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 Aug 2024 22:51:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sk8b1-00013G-Ie;
	Fri, 30 Aug 2024 20:51:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1sk8az-000138-No
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 Aug 2024 20:51:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IyTrDGFavmOoJFyX3SEXHLDqZCDVOdNfMnHKisM2NLg=; b=TSM3dd42UOgbqjKUCyFuDbz7L5
 nh7/biP3mLwIDiq2fzGp2b43SNkOCUkSW6LZrY5WqweJxLm/FC7IZQic1t3VT+CbbFkcWV45DpETr
 sGB0Rjm60CZsYUHRQe7ozxO63NOFUQXjfBrViWwqi53h+0Fp08DFh5LEEs9+oS701PxI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=IyTrDGFavmOoJFyX3SEXHLDqZCDVOdNfMnHKisM2NLg=; b=V
 b2BhGog0jZa1DJbt7o3nTiqPb+4Ot9/uxzO6lso3sAgDovvSqcozlCFktfeKGacVO9dMV+fFWfnZG
 vqJGk5RbWh7wum01o8HXTI3EWCpiSJweeA5V5sQw2ZItT1Ko93BGRSCfZzD2uTEJ5khWsOUCv0ZRh
 QB1KY3BqQ3jSWZf4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sk8ay-0005mh-R5 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 Aug 2024 20:51:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2C47E5C102D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 30 Aug 2024 20:51:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20019C4CEC2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 30 Aug 2024 20:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725051098;
 bh=ENS//WG8CgiiG3Zx3dHTUJhM2HWdiJU/WAIYLW47WX8=;
 h=Subject:From:Date:To:From;
 b=kEXKO6nwvIOEZPNhHIifH3BxNyUAVWk3CrYWAkjwMgvAwIlt11Sbi7uoI/DiX0Rhb
 7fFsytkbJ00Ae9VDXse+nuxHD2kLfIH3tfcLNAh5NXrCJPipt2eqR6jsLHpE+aTOjv
 Brzz+lwyfBglQOFH8QJBibNnW+Vld0fJF6c3s9pOgTH5SEBrCPfm42XVyPh4Rtu0sz
 vp3/QeuyafAnBByPQOJAYpQ6sgeW9TXgCydz9qrvwIxUQoN9+6Ff4iEJflwRD+rXA6
 7bWnGiThY6SZ6TUUhitQ1jDHxGELuSkRi6N+HRta2MZbcpHLIByn6SuLtAIOZM03+g
 uy63IPJbdh4uw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 B3A013809A80 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 30 Aug 2024 20:51:39 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <172505109833.2712133.13218322197206789863.git-patchwork-summary@kernel.org>
Date: Fri, 30 Aug 2024 20:51:38 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Series: [f2fs-dev,1/9] f2fs:
 convert f2fs_compress_ctx_add_page() to use folio Submitter: Chao Yu
 <chao@kernel.org>
 Committer: Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kernel.org/ [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sk8ay-0005mh-R5
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

Series: [f2fs-dev,1/9] f2fs: convert f2fs_compress_ctx_add_page() to use folio
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=879249
  Lore link: https://lore.kernel.org/r/20240813141331.417067-1-chao@kernel.org
    Patches: [f2fs-dev,1/9] f2fs: convert f2fs_compress_ctx_add_page() to use folio
             [f2fs-dev,2/9] f2fs: convert f2fs_vm_page_mkwrite() to use folio
             [f2fs-dev,3/9] f2fs: convert f2fs_clear_page_cache_dirty_tag() to use folio
             [f2fs-dev,4/9] f2fs: convert f2fs_write_inline_data() to use folio
             [f2fs-dev,5/9] f2fs: convert f2fs_write_single_data_page() to use folio
             [f2fs-dev,6/9] f2fs: convert f2fs_do_write_meta_page() to use folio
             [f2fs-dev,7/9] f2fs: convert __f2fs_write_meta_page() to use folio
             [f2fs-dev,9/9] f2fs: convert f2fs_handle_page_eio() to use folio

Series: [f2fs-dev,v2,1/8] f2fs: convert f2fs_write_begin() to use folio
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=881127
  Lore link: https://lore.kernel.org/r/20240820034654.698236-1-chao@kernel.org
    Patches: [f2fs-dev,v2,1/8] f2fs: convert f2fs_write_begin() to use folio
             [f2fs-dev,v2,2/8] f2fs: convert f2fs_write_end() to use folio
             [f2fs-dev,v2,3/8] f2fs: convert f2fs_set_compressed_page() to use folio
             [f2fs-dev,v2,4/8] f2fs: convert f2fs_do_write_data_page() to use folio
             [f2fs-dev,v2,5/8] f2fs: convert f2fs_write_data_page() to use folio
             [f2fs-dev,v2,6/8] f2fs: convert __write_node_page() to use folio
             [f2fs-dev,v2,7/8] f2fs: convert read_node_page() to use folio
             [f2fs-dev,v2,8/8] f2fs: get rid of page->index

Series: [f2fs-dev,v3,1/9] f2fs: convert f2fs_submit_page_read() to use folio
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=881405
  Lore link: https://lore.kernel.org/r/20240820145507.1372905-1-chao@kernel.org
    Patches: [f2fs-dev,v3,1/9] f2fs: convert f2fs_submit_page_read() to use folio
             [f2fs-dev,v3,2/9] f2fs: convert f2fs_write_begin() to use folio
             [f2fs-dev,v3,3/9] f2fs: convert f2fs_write_end() to use folio
             [f2fs-dev,v3,4/9] f2fs: convert f2fs_set_compressed_page() to use folio
             [f2fs-dev,v3,5/9] f2fs: convert f2fs_do_write_data_page() to use folio
             [f2fs-dev,v3,6/9] f2fs: convert f2fs_write_data_page() to use folio
             [f2fs-dev,v3,7/9] f2fs: convert __write_node_page() to use folio
             [f2fs-dev,v3,8/9] f2fs: convert read_node_page() to use folio
             [f2fs-dev,v3,9/9] f2fs: get rid of page->index

Patch: [f2fs-dev] f2fs: clean up val{>>,<<}F2FS_BLKSIZE_BITS
  Submitter: Zhiguo Niu <zhiguo.niu@unisoc.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=875709
  Lore link: https://lore.kernel.org/r/1722476031-22106-1-git-send-email-zhiguo.niu@unisoc.com

Patch: [f2fs-dev] f2fs: Use sysfs_emit_at() to simplify code
  Submitter: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=877769
  Lore link: https://lore.kernel.org/r/0afb817e75a84859e1a86e1a7ba2041a9b852b6e.1723117820.git.christophe.jaillet@wanadoo.fr

Patch: [f2fs-dev,RESEND] f2fs: Use sysfs_emit_at() to simplify code
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=879850
  Lore link: https://lore.kernel.org/r/20240815004728.983290-1-chao@kernel.org

Patch: None
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=879654
  Lore link: https://lore.kernel.org/r/20240814135059.802454-1-chao@kernel.org

Patch: [f2fs-dev] f2fs: fix to wait page writeback before setting gcing flag
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=878815
  Lore link: https://lore.kernel.org/r/20240812141242.4159033-1-chao@kernel.org

Patch: None
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=877370
  Lore link: https://lore.kernel.org/r/20240807102435.2198055-1-chao@kernel.org

Patch: [f2fs-dev] f2fs: prevent atomic file from being dirtied before commit
  Submitter: Daeho Jeong <daeho43@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=883510
  Lore link: https://lore.kernel.org/r/20240826202352.2150294-1-daeho43@gmail.com

Patch: [f2fs-dev,v2] f2fs: compress: don't redirty sparse cluster during {, de}compress
  Submitter: Yeongjin Gil <youngjin.gil@samsung.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=880812
  Lore link: https://lore.kernel.org/r/20240819083430.31852-1-youngjin.gil@samsung.com

Patch: [f2fs-dev] f2fs: Create COW inode from parent dentry for atomic write
  Submitter: Yeongjin Gil <youngjin.gil@samsung.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=879072
  Lore link: https://lore.kernel.org/r/20240813073244.9052-1-youngjin.gil@samsung.com

Patch: [f2fs-dev,v2] f2fs: check discard support for conventional zones
  Submitter: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=880178
  Lore link: https://lore.kernel.org/r/20240816040703.736887-1-shinichiro.kawasaki@wdc.com

Patch: None
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=880153
  Lore link: https://lore.kernel.org/r/20240816011342.1668666-1-chao@kernel.org

Patch: [f2fs-dev,v2] f2fs: fix to avoid use-after-free in f2fs_stop_gc_thread()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=874798
  Lore link: https://lore.kernel.org/r/20240730010855.2942132-1-chao@kernel.org


Total patches: 37

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
