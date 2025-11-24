Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A9605C8227F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Nov 2025 19:50:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Date:Message-Id:MIME-Version:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ij+sPWJetQxalkFq8E10Y28VeTsFnpRTD4t37+Aalw8=; b=g6/BCjW+Egk36QelJpchbL8ew7
	cba+U+epAxufkuLqLqgL2TxQIdo/TLroUEaNgOKjnwIcIOQGb0SmtkWyCE9Mqvug/2sBERVi1qyjS
	4NkYofa7NkjKD99NcITaLggClaUCSs0hoa08CP7qewdgBlHy19qekkswviCXsF7e3RY4=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vNbeG-00060V-5P;
	Mon, 24 Nov 2025 18:50:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vNbeE-00060K-Qo
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 18:50:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u3u0KcYzRJUuKde/2lp9V8AXASK9lKwO8Zl2Ssse5RA=; b=EWu4VnMfqXvLbJQ3qw8G/9TDVh
 ivxriYplmNVHpwZrjeVQLndAWEEkWgVI4tW+/xWKb1nwukdbqVBaRireCjIKJ88JQTwj3viw/36X5
 Kvp0jw4djGuGeHNZwyfOa7WNP3wEITKvnRS5ZmjuN7YL63Hz1aSuYr14fAeai6cP8/0I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=u3u0KcYzRJUuKde/2lp9V8AXASK9lKwO8Zl2Ssse5RA=; b=T
 dkoyKKATaijOyXJB3H76dBB7u+lMXI9O9Hz+nOUs5DwbJ/hwN0D86x4dCgfJedAoK2/GndJJLyAoP
 VANP1iGP/PisXcm2C1OVfw0YkI0DPQFg2zuAoHEsvPaMNMbynj3EoN6k4H4daQ1T9PvZId0pxACeM
 TugyIEAZoEfjn8NM=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vNbeD-0002dJ-Px for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 18:50:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 449CD42D9F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 24 Nov 2025 18:50:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24C01C4CEF1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 24 Nov 2025 18:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764010244;
 bh=QPr93+LAbvcRreHeHf5RbUhwapswH2y3ZDw7mtqW8wc=;
 h=Subject:From:Date:To:From;
 b=fU22+qQeGccgAWhf6uvoHx5w7oiDmjYDPi5QacA4ua5HKC7KpZWTflt0Wc60xNjci
 xFZlkquLRawXzo7S1C6hfojPT2EdrHaRgLmfc4ZqvxPXHJIfnbh4x3kDeDdzReTrPc
 YRQWLeGCXVoc3JWiqGJXvxHt5MLzVjlNxyV+pEIum2Djj4OKaETkyyP9hKlB9YvG90
 rMIpagKHVQE3/sMUiLFWobVocZ3V4e3WO1G+/Q18w6S8Pxgmq5M3nI+Vmkj1TiYorL
 LUD8Re8sQIm25t1a5lPukCikfEO8vGfthpLQ2x8Jaa4rbuVeGHmEGrlP9q2fwwocMB
 A6x/n8HeQUOIw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 382653A86296 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 24 Nov 2025 18:50:08 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <176401020671.42009.14354151108309181667.git-patchwork-summary@kernel.org>
Date: Mon, 24 Nov 2025 18:50:06 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Series: [f2fs-dev,v2,1/3] f2fs:
 wrap all unusable_blocks_per_sec code in CONFIG_BLK_DEV_ZONED Submitter:
 Yongpeng Yang <yangyongpeng.storage@gmail.com> Committer: Jaegeuk Kim
 <jaegeuk@kernel.org> Patc [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vNbeD-0002dJ-Px
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

Series: [f2fs-dev,v2,1/3] f2fs: wrap all unusable_blocks_per_sec code in CONFIG_BLK_DEV_ZONED
  Submitter: Yongpeng Yang <yangyongpeng.storage@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1021430
  Lore link: https://lore.kernel.org/r/20251110082223.902207-1-yangyongpeng.storage@gmail.com
    Patches: [f2fs-dev,v2,1/3] f2fs: wrap all unusable_blocks_per_sec code in CONFIG_BLK_DEV_ZONED
             [f2fs-dev,v2,2/3] f2fs: add a sysfs entry to show max open zones

Patch: [f2fs-dev,v1] f2fs: simplify list initialization in f2fs_recover_fsync_data()
  Submitter: Baolin Liu <liubaolin12138@163.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1022044
  Lore link: https://lore.kernel.org/r/20251111121728.29433-1-liubaolin12138@163.com

Series: [f2fs-dev,v2,1/3] f2fs: use memalloc_retry_wait() as much as possible
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1022266
  Lore link: https://lore.kernel.org/r/20251112014749.2006439-1-chao@kernel.org
    Patches: [f2fs-dev,v2,1/3] f2fs: use memalloc_retry_wait() as much as possible
             [f2fs-dev,v2,2/3] f2fs: introduce f2fs_schedule_timeout()
             [f2fs-dev,v2,3/3] f2fs: change default schedule timeout value

Patch: [f2fs-dev,v7] f2fs: revert summary entry count from 2048 to 512 in 16kb block support
  Submitter: Daeho Jeong <daeho43@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1022171
  Lore link: https://lore.kernel.org/r/20251111175246.17202-1-daeho43@gmail.com

Patch: [f2fs-dev,v5] docs: f2fs: wrap ASCII tables in literal blocks to fix LaTeX build
  Submitter: Masaharu Noguchi <nogunix@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1024235
  Lore link: https://lore.kernel.org/r/20251117122754.297742-1-nogunix@gmail.com

Patch: [f2fs-dev] f2fs: expand scalability of f2fs mount option
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1024236
  Lore link: https://lore.kernel.org/r/20251117124559.1634936-1-chao@kernel.org

Series: [f2fs-dev,1/2] f2fs: introduce f2fs_schedule_timeout()
  Submitter: Chao Yu <chao@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1022034
  Lore link: https://lore.kernel.org/r/20251111115229.1729729-1-chao@kernel.org
    Patches: [f2fs-dev,1/2] f2fs: introduce f2fs_schedule_timeout()
             [f2fs-dev,2/2] f2fs: change default schedule timeout value

Patch: [f2fs-dev,v2] f2fs: fix has_curseg_enough_space to check all data segments for dentry blocks
  Submitter: Xiaole He <hexiaole1994@126.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1021869
  Lore link: https://lore.kernel.org/r/20251111061051.337547-1-hexiaole1994@126.com


Total patches: 12

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
