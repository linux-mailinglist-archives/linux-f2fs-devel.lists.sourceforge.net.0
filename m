Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D646C50003
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Nov 2025 23:50:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Date:Message-Id:MIME-Version:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KdQtW2HwUfDSww7L7JxVK3UU47fU7oo/iYZeiqEx5Ts=; b=VMuhy7I57HsFd3YkfYFcjT02WS
	PkwsTsyerfxRly8gdh178eO3Wc4moHS1DNGWJEZXRDbcHo/+yOSgRWryRk1nGo9H2a9GhMbEBrHWC
	9KooS4O8h7CHU1Cn+J0nYnHM5D4lBZvVdxIh8JMEwObXV3BWkiETN2sHh1I3mnpUsyU0=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vIxCN-0008P9-Rf;
	Tue, 11 Nov 2025 22:50:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vIxCL-0008Op-AX
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Nov 2025 22:50:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1a/SW32EdRr0FLatR2O4RYtGbgCHE4aO8LiAk/FvMZE=; b=dIi7WVo5GKtuRO+G+uy5IiWl6p
 GwnO4KSQTO7LMQ/s17J6zfbpgDpjvwhsHl+GnkGonVoWRFzWOSZXM1BV6xP7aHIQcFv44+W1nvmNB
 /bURUaMuss1juWKOmhTCeiUXZ9PIN2cGyouamOA1QuwPgwWsEUeF4yO8jNq0hSRey/tA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=1a/SW32EdRr0FLatR2O4RYtGbgCHE4aO8LiAk/FvMZE=; b=S
 xw6v+PW/VR13B2dM2XsgA4mDYWavx3+hvPO7kIM10fbb43jPO8tfOqnnOKsTluGIwx2NtE7zWkItU
 dSbZveCeg0SGSFdOlOHe/OPppyIcWsPwta1aA4LiW7dN7+gVMRm3FtJ804f1dhA4Dg0DR9kcJeKt/
 TDboaZHaOh/y8NrU=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vIxCL-00045q-D3 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Nov 2025 22:50:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id ABFAA60055
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 11 Nov 2025 22:50:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50F6AC19422
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 11 Nov 2025 22:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762901438;
 bh=gs/Kcin0qihTJDtmFs0cxgUJuS94JCeV/GIPuqRHOek=;
 h=Subject:From:Date:To:From;
 b=d2beQkvRiced2vXb5cN20nspl/L0Qy60VqoTd6Hv35ndrCV9oNBo8OM2JhG+YBXH/
 1fGyZwLa2K4ZHpulPcfBxZQCOm29Hg5YYd/1UWNMm4A4yUPFHrnlR+DKgqyxfVxG5W
 FZG3HYveX18ckwYjU6ZqymIBEQO1Jme+7HXxUYXsQKFGxx1sCVlpWeZVRFisPTL+Ou
 w5Jrnd8DEq0fr0pmB+5HY7Qp9RbMiQb6CX5malbAhKb5ygfh+yzmNEa5zf8yO2c173
 amSkDwhInScMFES23eUJoxia0+Zbj8VZ+Is6eOHWl3SRMXsBwxaq7snfxJwZfXblH8
 IANou6KRJPKUA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 74D04380DBCD for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 11 Nov 2025 22:50:09 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <176290140793.3596344.9537141552084831690.git-patchwork-summary@kernel.org>
Date: Tue, 11 Nov 2025 22:50:07 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev] f2fs: fix
 to access i_size w/ i_size_read() Submitter: Chao Yu <chao@kernel.org>
 Committer: Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kernel.org/project/f2fs/list [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vIxCL-00045q-D3
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

Patch: [f2fs-dev] f2fs: fix to access i_size w/ i_size_read()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1017047
  Lore link: https://lore.kernel.org/r/20251029063105.989253-1-chao@kernel.org

Series: [f2fs-dev,1/4] f2fs: clean up w/ bio_add_folio_nofail()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1011103
  Lore link: https://lore.kernel.org/r/20251014062704.1734984-1-chao@kernel.org
    Patches: [f2fs-dev,1/4] f2fs: clean up w/ bio_add_folio_nofail()
             [f2fs-dev,2/4] f2fs: convert add_ipu_page() to use folio
             [f2fs-dev,3/4] f2fs: use f2fs_filemap_get_folio() instead of f2fs_pagecache_get_page()

Patch: [f2fs-dev] f2fs: ensure minimum trim granularity accounts for all devices
  Submitter: Yongpeng Yang <yangyongpeng.storage@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1015521
  Lore link: https://lore.kernel.org/r/20251024143746.187140-1-yangyongpeng.storage@gmail.com

Patch: [f2fs-dev,v2] f2fs: use global inline_xattr_slab instead of per-sb slab cache
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1013825
  Lore link: https://lore.kernel.org/r/20251021034856.739272-1-chao@kernel.org

Series: [f2fs-dev,1/2] f2fs: fix to propagate error from f2fs_enable_checkpoint()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1016060
  Lore link: https://lore.kernel.org/r/20251027063534.103963-1-chao@kernel.org
    Patches: [f2fs-dev,1/2] f2fs: fix to propagate error from f2fs_enable_checkpoint()
             [f2fs-dev,2/2] f2fs: block cache/dio write during f2fs_enable_checkpoint()

Series: [f2fs-dev,1/2] f2fs: fix to do sanity check on node folio during its writeback
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1010312
  Lore link: https://lore.kernel.org/r/20251011123016.715964-1-chao@kernel.org
    Patches: [f2fs-dev,1/2] f2fs: fix to do sanity check on node folio during its writeback
             [f2fs-dev,2/2] f2fs: fix to do sanity check on node footer in {read, write}_end_io

Patch: [f2fs-dev,v2] f2fs: fix to avoid updating zero-sized extent in extent cache
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1013360
  Lore link: https://lore.kernel.org/r/20251020024213.332873-1-chao@kernel.org

Patch: [f2fs-dev,v1] f2fs: fix uninitialized one_time_gc in victim_sel_policy
  Submitter: Xiaole He <hexiaole1994@126.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1017027
  Lore link: https://lore.kernel.org/r/20251029051807.3804-1-hexiaole1994@126.com

Patch: [f2fs-dev,v2] f2fs: invalidate dentry cache on failed whiteout creation
  Submitter: Deepanshu Kartikey <kartikey406@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1016265
  Lore link: https://lore.kernel.org/r/20251027130635.13739-1-kartikey406@gmail.com

Series: [f2fs-dev,1/2] f2fs: fix return value of f2fs_recover_fsync_data()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1019730
  Lore link: https://lore.kernel.org/r/20251105065023.3656975-1-chao@kernel.org
    Patches: [f2fs-dev,1/2] f2fs: fix return value of f2fs_recover_fsync_data()
             [f2fs-dev,2/2] f2fs: fix to detect recoverable inode during dryrun of find_fsync_dnodes()

Series: f2fs: Add sanity checks before unlinking and loading inodes
  Submitter: Nikola Z. Ivanov <zlatistiv@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1019834
  Lore link: https://lore.kernel.org/r/cover.1762339963.git.zlatistiv@gmail.com
    Patches: [f2fs-dev,v4,1/2] f2fs: Rename f2fs_unlink exit label
             [f2fs-dev,v4,2/2] f2fs: Add sanity checks before unlinking and loading inodes

Patch: [f2fs-dev] f2fs: fix to avoid potential deadlock
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1011256
  Lore link: https://lore.kernel.org/r/20251014114735.1840965-1-chao@kernel.org

Patch: [f2fs-dev,v2] f2fs: fix to avoid updating compression context during writeback
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1014288
  Lore link: https://lore.kernel.org/r/20251022030636.1194244-1-chao@kernel.org

Patch: [f2fs-dev,v2] f2fs: fix age extent cache insertion skip on counter overflow
  Submitter: Xiaole He <hexiaole1994@126.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1016126
  Lore link: https://lore.kernel.org/r/20251027092341.5011-1-hexiaole1994@126.com

Patch: [f2fs-dev,v2] f2fs: change the unlock parameter of f2fs_put_page to bool
  Submitter: Yongpeng Yang <yangyongpeng.storage@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1016260
  Lore link: https://lore.kernel.org/r/20251027125543.633506-1-yangyongpeng.storage@gmail.com

Patch: [f2fs-dev,v2] f2fs: Use mapping->gfp_mask to get file cache for writing
  Submitter: Jiucheng Xu <jiucheng.xu@amlogic.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1010058
  Lore link: https://lore.kernel.org/r/20251010-origin-dev-v2-1-952a3c98cd9c@amlogic.com


Total patches: 22

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
