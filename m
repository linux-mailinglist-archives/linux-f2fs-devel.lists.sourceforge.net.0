Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C22681F3E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 31 Jan 2023 00:00:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pMd8d-0003ek-LE;
	Mon, 30 Jan 2023 23:00:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pMd8a-0003dK-J8
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Jan 2023 23:00:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lIUTmzWyYHH++uOCCYF67MZRvnzfHhfi4SWRWYE6VnA=; b=YvR83GSSCJ/Mls9p/PpB9KYzA9
 Cs2aI5nONTW5Da6zRVQKy8n2sGOqc7EdPoVlkeUgPKm3ah4ElzbMZItp0TXJ0FRRQ7V25G81d0tjT
 CGXGVyRZelJZKklgO3iBPnObcJnugjAcZRyZ2Y5E73dbSPoTpRFU8i509mVhMC80xSDE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=lIUTmzWyYHH++uOCCYF67MZRvnzfHhfi4SWRWYE6VnA=; b=k
 0KCE+lMi0G0YPzOQzq4JLspIjvtyHPpMm2zz45pZLbRuG/9If3XNWC6LAU6C2JyE5S2iNNQtz6L4R
 /YTNAvHt9vNf6YrI9mZ01Sssw6ypfQHKT9Xb3Wh4ddmDTzLGL4+sdxA3i9uZMFCE1sx00yC8yRiqX
 OS2MSNqqtLMvfW+4=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pMd8V-004OGY-SF for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Jan 2023 23:00:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 894DACE1A92
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 30 Jan 2023 23:00:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6891C433D2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 30 Jan 2023 23:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675119617;
 bh=iv6kseZGfeV90LPtMxVuaQwhfgO7vY8rFyGCXjdm8es=;
 h=Subject:From:Date:To:From;
 b=Rvb8S04KQGB11xYq3R64iYmdpnrOe3p/5phzPYujJXBOZUOV7Z2cJB8JBmVV0hs85
 CNEeQJMzdR2eaBDL2FShCCX58id/sXYtTLxK42a3mkg/ofnqrajrkVR2RTJwQMgFSB
 lVW5uVc9CmKWU7DQFPLeBXZuTR9+llXgtng9fnmFfAbNbva4EO+4ox9gafDtXxv4Ao
 7ka3JdzYZJZzHt+sEsqm3jpcpXUq7652llhKMONVnVNkF56OQqdY6+/g6FenQAuKad
 L43qm6cwE3Zf866/apmV61nGFoGWxzCkKkQtY8wlbNU2NJIlkJEoHrJRsBXxWpSAtO
 SxvFjFOhsMBGA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 BDC56C16ABD for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 30 Jan 2023 23:00:17 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <167511961772.12751.11589352812714248123.git-patchwork-summary@kernel.org>
Date: Mon, 30 Jan 2023 23:00:17 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Series: [f2fs-dev,1/5] f2fs:
 introduce trace_f2fs_replace_atomic_write_block Submitter: Chao Yu
 <chao@kernel.org>
 Committer: Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kernel.org/pr [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pMd8V-004OGY-SF
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

The following patches were marked "accepted", because they were applied to
jaegeuk/f2fs.git (dev):

Series: [f2fs-dev,1/5] f2fs: introduce trace_f2fs_replace_atomic_write_block
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=709941
  Lore link: https://lore.kernel.org/r/20230109034453.490176-1-chao@kernel.org
    Patches: [f2fs-dev,1/5] f2fs: introduce trace_f2fs_replace_atomic_write_block
             [f2fs-dev,2/5] f2fs: clear atomic_write_task in f2fs_abort_atomic_write()
             [f2fs-dev,4/5] f2fs: fix to avoid race condition of f2fs_abort_atomic_write()
             [f2fs-dev,5/5] f2fs: fix to avoid race condition of atomic write

Patch: [f2fs-dev] f2fs: fix to do sanity check on extent cache correctly
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=709943
  Lore link: https://lore.kernel.org/r/20230109034920.492914-1-chao@kernel.org

Patch: [f2fs-dev] f2fs: fix information leak in f2fs_move_inline_dirents()
  Submitter: Eric Biggers <ebiggers@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=714583
  Lore link: https://lore.kernel.org/r/20230123070414.138052-1-ebiggers@kernel.org

Patch: [f2fs-dev] f2fs: allow set compression option of files without blocks
  Submitter: Yangtao Li <frank.li@vivo.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=714641
  Lore link: https://lore.kernel.org/r/20230123094601.32940-1-frank.li@vivo.com

Patch: [f2fs-dev,v2] f2fs: fix to check warm_data_age_threshold
  Submitter: Yangtao Li <frank.li@vivo.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=712763
  Lore link: https://lore.kernel.org/r/20230117132442.77645-1-frank.li@vivo.com

Patch: [f2fs-dev] f2fs: remove unneeded f2fs_cp_error() in f2fs_create_whiteout()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=709942
  Lore link: https://lore.kernel.org/r/20230109034734.491518-1-chao@kernel.org

Patch: [f2fs-dev] f2fs: drop useless initializer and unneeded local variable
  Submitter: Yangtao Li <frank.li@vivo.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=706418
  Lore link: https://lore.kernel.org/r/20221222081855.81553-1-frank.li@vivo.com

Patch: [f2fs-dev] f2fs: return true if all cmd were issued or no cmd need to be issued for f2fs_issue_discard_timeout()
  Submitter: Yangtao Li <frank.li@vivo.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=711449
  Lore link: https://lore.kernel.org/r/20230112191404.59020-1-frank.li@vivo.com

Series: [f2fs-dev,1/3] f2fs: clarify compress level bit offset
  Submitter: Yangtao Li <frank.li@vivo.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=711312
  Lore link: https://lore.kernel.org/r/20230112133443.16713-1-frank.li@vivo.com
    Patches: [f2fs-dev,1/3] f2fs: clarify compress level bit offset

Patch: [f2fs-dev] f2fs: fix to show discard_unit mount opt
  Submitter: Yangtao Li <frank.li@vivo.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=712389
  Lore link: https://lore.kernel.org/r/20230116141228.43239-1-frank.li@vivo.com


Total patches: 13

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
