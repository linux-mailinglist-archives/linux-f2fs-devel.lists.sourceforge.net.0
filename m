Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 252AFB11259
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Jul 2025 22:30:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Date:Message-Id:MIME-Version:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YWg02Zz0BEbpEmh0ClMJb3p41Wm8SYtKiZsKuoZh+vg=; b=YCxTTOBsIfEtEFH6F7gDLTxsIo
	/x54gesJX917jWrHikVAefen/EdrUA+mtz4nnN0YV5fAvZuEBVKQdLkg3QjxuEBlcDARPHRIC+h2b
	YHT/So4hzmTqBKaw+uir0+qJc49CD62WLbmhetFuB6Ihnz3D6jWba2mlRVOBjlKAeToA=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uf2Zo-00025Z-F5;
	Thu, 24 Jul 2025 20:30:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1uf2Zk-00024T-2X
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Jul 2025 20:30:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gtlaCeZ3xzRknk2XSA4Hkj32MbeENQ2YFG259+c2vwo=; b=hwszNhrTfudV7xVWq8an8a3HC2
 uzPIg23T/uZi0NQKEHuN0/fHLG7BXzEXqsDKabCmy0QbPBEpWgnpxn+0KvzzjspIhkX6nOTkUO8pl
 aK+WrkVmi752e11XY4fc2PoSEGtNrv+HK3lla9K5iLRRVgrtgxbi2Teib6m12DAibUY4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=gtlaCeZ3xzRknk2XSA4Hkj32MbeENQ2YFG259+c2vwo=; b=m
 jo2Ziih8bdbHtJllC0JYb0JD/Lkgsj+r2w8yFGrR7x4oC6me0892rxzg2yx2utiEEXg9+dnShjbh5
 gb4caPFRJFEOiRcaGQc24c1EA4Oh8t2p/Z/x6VltPmzenztrkpWnml8N4OTbManbP740l4MHsKWRi
 u3aPCGLvuQdJ1UXM=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uf2Zj-00012C-Ep for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Jul 2025 20:30:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D77AAA5643B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 24 Jul 2025 20:29:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84DA7C4CEED
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 24 Jul 2025 20:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753388988;
 bh=t+YliHKG6y/KjLzzUz4B+q4KkjElO4N5B61voE9NRQI=;
 h=Subject:From:Date:To:From;
 b=QK9hc6igbAaOrO/L6hcTHnsFRVLTxglGuviUDz2/5gzXliCx35CIIDRe+ipWjkbjO
 qdrlHMNHwso5nYfV/U4grwee7FnnKf3GNOQWHv5AEIywYypZjpmP5lUAB0Xn5zSt6c
 QsqG006P24E51uchRsey0t0ayYoq7Q9UJvmbW4P1oEbAYORdzN3nz88HVLclJlX32z
 xJuSCbXft+cwFMpkzCkyCeV7bhnR+OU2ZfLAo99n0eCmHQGqJoFp3ZPl9zQj4C4+5V
 +aaTk3KFB9+kc+Hbnie4eSXZXuciPjWwvD/a4bkKrTNkTtfT4qpYwJghPok2M7YxsP
 XnV3BcRKRuHlQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 74D9E383BF4E for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 24 Jul 2025 20:30:07 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175338900599.2519964.10573602737991049274.git-patchwork-summary@kernel.org>
Date: Thu, 24 Jul 2025 20:30:05 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev] f2fs: remove
 unnecessary tracepoint enabled check Submitter: Sheng Yong
 <shengyong2021@gmail.com>
 Committer: Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kernel.org/ [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uf2Zj-00012C-Ep
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

Patch: [f2fs-dev] f2fs: remove unnecessary tracepoint enabled check
  Submitter: Sheng Yong <shengyong2021@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=985162
  Lore link: https://lore.kernel.org/r/20250723142456.2328461-1-shengyong1@xiaomi.com

Patch: [f2fs-dev] f2fs: don't break allocation when crossing contiguous sections
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=984143
  Lore link: https://lore.kernel.org/r/20250721020231.2482090-1-chao@kernel.org

Patch: [f2fs-dev] f2fs: merge the two conditions to avoid code duplication
  Submitter: mason.zhang <masonzhang.linuxer@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=985175
  Lore link: https://lore.kernel.org/r/20250723145837.187089-1-masonzhang.linuxer@gmail.com

Patch: [f2fs-dev,v3] f2fs: zone: wait for inflight dio completion, excluding pinned files read using dio
  Submitter: yohan.joung <yohan.joung@sk.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=984548
  Lore link: https://lore.kernel.org/r/20250722060240.1469-1-yohan.joung@sk.com

Patch: [f2fs-dev] f2fs: ignore valid ratio when free section count is low
  Submitter: Daeho Jeong <daeho43@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=983893
  Lore link: https://lore.kernel.org/r/20250718220431.2290301-1-daeho43@gmail.com

Patch: [f2fs-dev,v2] f2fs: vm_unmap_ram() may be called from an invalid context
  Submitter: Jan Prusakowski <jprusakowski@google.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=985638
  Lore link: https://lore.kernel.org/r/20250724153115.125311-1-jprusakowski@google.com


Total patches: 6

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
