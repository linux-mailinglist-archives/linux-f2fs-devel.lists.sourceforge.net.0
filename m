Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B79BA5CFE8
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Mar 2025 20:50:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ts5cH-0004tn-Dg;
	Tue, 11 Mar 2025 19:50:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1ts5cC-0004tc-CX
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Mar 2025 19:50:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TnQy4dSlnZdOGpFG6eWZ2SmsJQWnaVXasZx2G+HFWrw=; b=DI5tRmK80LstIBRhBZ+PPbxffu
 u81yElLn4pC1PKhnq7FndMMA3TO5QLWbaOpqdjIMe3y4c+hpM5Z912HV8bMunwCi3lqMhZ2YoMyjZ
 Phd/y2pm/VWknfBdgyN3kNIs4y2FBPgjP5MVj+3LyIoDGLX4nPDVGaRd9SeKlp/I7SRk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=TnQy4dSlnZdOGpFG6eWZ2SmsJQWnaVXasZx2G+HFWrw=; b=R
 HWcHRSGVr2WXZ47sZcuIrvR0VV4+ItIj7fms64s9yOD0S9jbet1bha/XcuCQPmcFtYkXt9UZmX4o5
 57Zk6zLSjncgpcRAQXGO8K05B9GVoTWsEhvPmGgcah1gN2p/2IPXxnvjHqW+JfGWzqiqSWjrmCiaQ
 zxQw22mmJKzhTCj8=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ts5c6-0002hy-Lo for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Mar 2025 19:50:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E65F6A46516
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 11 Mar 2025 19:44:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BE4CC4CEE9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 11 Mar 2025 19:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741722600;
 bh=qfCyDQjREHvccqZKa0FtHxL7cQkqd8XacEZ7xhC+dAM=;
 h=Subject:From:Date:To:From;
 b=X0Vkh8NQH1kse0CrxVnKBJXdt9ckm1hzNXWC8pleMCQISOgK5hywTAnRAN2gCf8wH
 4ooa06s8yxOQVjzMqz4Z5G0Sndih3L7MEJI/ultqsG9n91qZSHrhd4XVp6U7n5GGO6
 2IvHHDmOfdSdPTA/GLaEK+kv25Zkz7nbL0X3Xf7xc/A47INFYwyUjHF6XH6P3v6WuK
 nvtwpvoPpcEiTiAJlKqwBeZS78YTdJK0tI9aH/GwntgNVhX+Se5Uc04m/C6/rNGvdy
 rThHkIObR+u/1ldrMNpHBe9doaSnhlJtuexSOBGAAjJCH2W0LhOmMMP19lYTMxHen5
 mDT90ESCf5rTw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EF2D0380AC1C for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 11 Mar 2025 19:50:35 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <174172263449.214029.237303491639581396.git-patchwork-summary@kernel.org>
Date: Tue, 11 Mar 2025 19:50:34 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Series: [f2fs-dev,v2,1/3] f2fs:
 do sanity check on inode footer in f2fs_get_inode_page() Submitter: Chao
 Yu <chao@kernel.org> Committer: Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.k [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ts5c6-0002hy-Lo
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

Series: [f2fs-dev,v2,1/3] f2fs: do sanity check on inode footer in f2fs_get_inode_page()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=940424
  Lore link: https://lore.kernel.org/r/20250305091148.2086015-1-chao@kernel.org
    Patches: [f2fs-dev,v2,1/3] f2fs: do sanity check on inode footer in f2fs_get_inode_page()
             [f2fs-dev,v2,2/3] f2fs: do sanity check on xattr node footer in f2fs_get_xnode_page()
             [f2fs-dev,v2,3/3] f2fs: introduce FAULT_INCONSISTENT_FOOTER

Patch: [f2fs-dev,v2] f2fs: fix to avoid accessing uninitialized curseg
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=936995
  Lore link: https://lore.kernel.org/r/20250224102923.93758-1-chao@kernel.org

Series: f2fs: Remove uses of writepage
  Submitter: Matthew Wilcox <willy@infradead.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=941635
  Lore link: https://lore.kernel.org/r/20250307182151.3397003-1-willy@infradead.org
    Patches: [f2fs-dev,1/4] f2fs: Remove check for ->writepage
             [f2fs-dev,2/4] f2fs: Remove f2fs_write_data_page()
             [f2fs-dev,3/4] f2fs: Remove f2fs_write_meta_page()
             [f2fs-dev,4/4] f2fs: Remove f2fs_write_node_page()

Patch: [f2fs-dev] Revert "f2fs: rebuild nat_bits during umount"
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=940510
  Lore link: https://lore.kernel.org/r/20250305110712.2114200-1-chao@kernel.org


Total patches: 9

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
