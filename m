Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 92256AE58B5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Jun 2025 02:40:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Date:Message-Id:MIME-Version:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gYgqQMOHuZ1HWaK4EygZ/wy8jXvMyVLDINWhL+r6eM0=; b=OHXSa1U10lxG2TixHUF8C/+D3o
	5KJWZntkCsEIT6gy+9/AkTRNrNcw72950JhFZfcZcu9GpzmOir12jDMxiZ757n59KRR8z+HX+/ISp
	uKoMW44uXw7YIhO2hpi7U3CQ8camaV3ZZAYGbK5WIlbeu3jl6jnqRVcI7XJ4jhgjuBJs=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uTriW-0002Nr-0e;
	Tue, 24 Jun 2025 00:40:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1uTriA-0002NH-4J
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Jun 2025 00:40:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=grVaqrtJrjvBafxzizjn6iSlg6s+vmP3z1hwJex2j1k=; b=aEWrRfFqGzQYZ7z9mwhdThu0sc
 CGh0Ex6Kvs0naMowDFG7r25v6VLDY7S3wkVOHq9Qq4Lv/K4UIviB/vdR4HfyHCJLu62jeE49goyM3
 z+fJyTjmVVNZkTjbNNdp8hb+wvWf0OyckzKympIK3YRgPatrltxQ1z0/wG2bQlxeyeao=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=grVaqrtJrjvBafxzizjn6iSlg6s+vmP3z1hwJex2j1k=; b=k
 DUJlqcPfHby5bBimrni8cMlBvdUtNLlINfxzvggDVL5CGATTmYPvAR/QY6T2aQbFC0Uf1gRTyNtvk
 vxKTcll4rcnQ4oqbxykAuH+9rXViDxOiOHzm021S86FLow87Xu1Wf8Dw0YG3H5OrqHhAFdkHbQNqP
 7sTudykAGA/gk4Rs=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uTri9-0006x7-Kq for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Jun 2025 00:40:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 42D7843AF1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 24 Jun 2025 00:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1639CC4CEEA
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 24 Jun 2025 00:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750725624;
 bh=F3NPwDc8XLhhXZrZO/C7fOgRQfjMOHlteRBn/9ai5p8=;
 h=Subject:From:Date:To:From;
 b=CktiTKvr85zFSVy7E/3AOahqUa3UdNm/LxIUAocdycsYuRGY9lirzUgUUzpGUnE0l
 Vj1DFZri9Q3kJyWLOzl45uJsYkSUCV/4qwDcYnE/Fbv8/NfTp/ZkQNpFy67JJziNnW
 +FY6+Nl/wOV6Vmy/vo6JEDe2Ti0MNSF+/oSc/kP1r7zAqZuwdh+y1aWUk+71J2QJcg
 kZVvhB7eo8YtQRslWKKwfygLKmFDhDi8QJgayWejmr2BJNkZ27eL2kfPEduBH8cK/2
 ZFNDgCjlY6MojqHTmtx8q4CpllX38OWAD0GRmBQwz9zFoAtMCMFd4SUb3GF9OnDzSv
 k2BmvSNj5QOQQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 3857339FEB7D for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 24 Jun 2025 00:40:52 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175072565079.3346761.4868343880873910953.git-patchwork-summary@kernel.org>
Date: Tue, 24 Jun 2025 00:40:50 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev] f2fs: make
 sure zoned device GC to use FG_GC in shortage of free section Submitter:
 Daeho Jeong <daeho43@gmail.com> Committer: Jaegeuk Kim <jaegeuk@kernel.org>
 Patchwork: https://pat [...] 
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
X-Headers-End: 1uTri9-0006x7-Kq
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

Patch: [f2fs-dev] f2fs: make sure zoned device GC to use FG_GC in shortage of free section
  Submitter: Daeho Jeong <daeho43@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=967453
  Lore link: https://lore.kernel.org/r/20250529222532.1088106-1-daeho43@gmail.com

Patch: [f2fs-dev,v2] f2fs: turn off one_time when forcibly set to foreground GC
  Submitter: Daeho Jeong <daeho43@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=969344
  Lore link: https://lore.kernel.org/r/20250606184904.224811-1-daeho43@gmail.com

Patch: [f2fs-dev] f2fs: handle nat.blkaddr corruption in f2fs_get_node_info()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=969731
  Lore link: https://lore.kernel.org/r/20250609072712.792834-1-chao@kernel.org

Patch: [f2fs-dev] f2fs: fix bio memleak when committing super block
  Submitter: Sheng Yong <shengyong2021@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=969425
  Lore link: https://lore.kernel.org/r/20250607064116.2993239-1-shengyong1@xiaomi.com

Patch: [f2fs-dev] f2fs: do sanity check on fio.new_blkaddr in do_write_page()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=970093
  Lore link: https://lore.kernel.org/r/20250610031315.1067993-1-chao@kernel.org

Patch: [f2fs-dev,v2] f2fs: introduce reserved_pin_section sysfs entry
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=971654
  Lore link: https://lore.kernel.org/r/20250613055109.2335-1-chao@kernel.org

Patch: [f2fs-dev] f2fs: fix to avoid invalid wait context issue
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=970712
  Lore link: https://lore.kernel.org/r/20250611084218.62774-1-chao@kernel.org

Series: [f2fs-dev,1/2] f2fs: compress: change the first parameter of page_array_{alloc, free} to sbi
  Submitter: Zhiguo Niu <zhiguo.niu@unisoc.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=971609
  Lore link: https://lore.kernel.org/r/1749779445-29125-1-git-send-email-zhiguo.niu@unisoc.com
    Patches: [f2fs-dev,1/2] f2fs: compress: change the first parameter of page_array_{alloc, free} to sbi
             [f2fs-dev,2/2] f2fs: compress: fix UAF of f2fs_inode_info in f2fs_free_dic


Total patches: 9

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
