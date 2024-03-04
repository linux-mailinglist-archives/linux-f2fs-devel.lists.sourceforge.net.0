Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C9D870961
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Mar 2024 19:20:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rhCvU-0008Su-7k;
	Mon, 04 Mar 2024 18:20:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1rhCvS-0008Sm-Pm
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Mar 2024 18:20:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LXIErrNTO+BRaJRqybF3ijoynWyqGK1/0M7RQ0JJ19I=; b=Wyt8qtJk0+IoyYjQ2FUu+di9Zx
 AJa3iNk+K7Sqdf+/ZVZ3egoFQAcGctxiOy3VbSTAtmn3TC/j/owM0V/YuKql/COc3ry9m63v9P1Aw
 Lyfo/KJ4jyfC0d7y2ZzA66oh1QmvWKfdEPRS05yU1COvn8G8URso/Gbhc2IWG9dacInE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=LXIErrNTO+BRaJRqybF3ijoynWyqGK1/0M7RQ0JJ19I=; b=M
 g11AAgXYAzeUzoW9TaLc9o7PwMTiSdMf02kvggUuVQKup48Bz/sw49gzGHmkaIvgKUIbF+YlXzt7u
 BI46Vxg03SuqgCLFr55hEFrzJC2251X1AQG6zQq2FklI4lwpzw9eug+joiwsL/xCDppTAMWW3OC7H
 R6HRcwQjcVp7uXro=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rhCvM-0002fP-H9 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Mar 2024 18:20:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 39B7660EFC
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  4 Mar 2024 18:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D8AFEC433F1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  4 Mar 2024 18:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709576428;
 bh=qwyAtP+Ex1Wn+GtMrycVqvjZFbLzrOIlZpsByZaq2Tw=;
 h=Subject:From:Date:To:From;
 b=tqoCtKuvuFmr0A7OBTyJr9KJiorCa98c7lCxjvNWm+xcp1j2Xu1YUmqAliCBCjXSa
 s0e/5Iefenp+X4YqgAg0kGgB621RRHcKMKZ4O1+TvEhn8urQ7HWijmgdNvNqxpZiej
 zR3TbCT4r6O8PelenGjEFAgd6TBs2ENJh7br6b2fJWzt6gOEKkw6wMkIlM0l/8x6SB
 dfhIxH6Zl7zulbEAzaZhgXVp4mzxwo0+x9bqXOnmgcsAc5oAJInxwUVIbxJI2WRbaE
 cSPo2e5I+/ibLH55MS1iXwARoYEqHo+VyfKF6VONMdYXgEm+uwD3SXK0ISHuLSBy7H
 QQ8LVXpS2mi6g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 C29F9D9A4BB for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  4 Mar 2024 18:20:28 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <170957642871.16816.4377481812991371857.git-patchwork-summary@kernel.org>
Date: Mon, 04 Mar 2024 18:20:28 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev,
 v2] f2fs: introduce
 SEGS_TO_BLKS/BLKS_TO_SEGS for cleanup Submitter: Chao Yu <chao@kernel.org>
 Committer: Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kernel.org/proj [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rhCvM-0002fP-H9
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

Patch: [f2fs-dev,v2] f2fs: introduce SEGS_TO_BLKS/BLKS_TO_SEGS for cleanup
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=831928
  Lore link: https://lore.kernel.org/r/20240304032855.1425579-1-chao@kernel.org

Series: [f2fs-dev,1/2] f2fs: fix to check return value __allocate_new_segment
  Submitter: Zhiguo Niu <zhiguo.niu@unisoc.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=831423
  Lore link: https://lore.kernel.org/r/1709281555-11373-1-git-send-email-zhiguo.niu@unisoc.com
    Patches: [f2fs-dev,1/2] f2fs: fix to check return value __allocate_new_segment
             [f2fs-dev,2/2] f2fs: fix to check return value of f2fs_gc_range

Series: [f2fs-dev,1/4] f2fs: fix blkofs_end correctly in f2fs_migrate_blocks()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=829643
  Lore link: https://lore.kernel.org/r/20240226013208.2389246-1-chao@kernel.org
    Patches: [f2fs-dev,1/4] f2fs: fix blkofs_end correctly in f2fs_migrate_blocks()
             [f2fs-dev,2/4] f2fs: relocate f2fs_precache_extents() in f2fs_swap_activate()
             [f2fs-dev,3/4] f2fs: clean up new_curseg()
             [f2fs-dev,4/4] f2fs: fix to reset fields for unloaded curseg

Series: [f2fs-dev,1/2] f2fs: ro: compress: fix to avoid caching unaligned extent
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=829726
  Lore link: https://lore.kernel.org/r/20240226073539.2509926-1-chao@kernel.org
    Patches: [f2fs-dev,1/2] f2fs: ro: compress: fix to avoid caching unaligned extent
             [f2fs-dev,2/2] f2fs: ro: don't start discard thread for readonly image

Patch: [f2fs-dev] f2fs: fix to check return value in f2fs_insert_range()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=829662
  Lore link: https://lore.kernel.org/r/20240226031916.2420870-1-chao@kernel.org

Patch: [f2fs-dev] f2fs: fix to do sanity check in update_sit_entry
  Submitter: Zhiguo Niu <zhiguo.niu@unisoc.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=830683
  Lore link: https://lore.kernel.org/r/1709121594-22314-1-git-send-email-zhiguo.niu@unisoc.com

Patch: [f2fs-dev,v2] f2fs: fix to use correct segment type in f2fs_allocate_data_block()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=829557
  Lore link: https://lore.kernel.org/r/20240225063628.2086320-1-chao@kernel.org


Total patches: 12

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
