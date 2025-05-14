Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FDEAB7016
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 May 2025 17:40:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Date:Message-Id:MIME-Version:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y2b552IdfKIth7sKeADdjFDADQnSLwQC7VkU2eyS+k4=; b=QIBMBVhd/b1XC8Lm0H0WfitpFl
	DktnJ7+2XN6pW6hM4EudCm+qthfsEwNpjm91HvwXQ7jPU8psCtAvUne+/TlKeJiyRqgU9uFtmq/nm
	jzVmRF2Iw6TFWRIIIBksTkXZpZsg1eOdHv7qT6kURy502dP3munPi1wQt54gjY/v0ykg=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uFEDI-0005jS-9g;
	Wed, 14 May 2025 15:40:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1uFEDE-0005jJ-Mh
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 May 2025 15:40:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G/5BuRTRcohLNp63mQptNz15e590xKC8mrlN6lqztdY=; b=JCcllx0J9zW/7WzR80Eo54slr7
 EeVbaxpdnjP03i+Zl4BDf/0kVSYR63+k4dZBRdmlVYA/XTxq1oXIQTkmQUx0P1PQ8TBV32ymtIbhT
 4JgWn8mTjr9W8lwtgG97fOXOmgpxkYXctv0q2gArGbLxxsl/p3sMrA1tDUtdyeSA+DW8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=G/5BuRTRcohLNp63mQptNz15e590xKC8mrlN6lqztdY=; b=V
 XLFxco3+bj3u6RC3g9zGEMDHb+GKwHPRLJ3ywUL1NZOFLWjyvuX/otW1CZpN+q/3wb9O6arquL1tj
 OaWjYwhMvaEXVMw3GMCOrb8+DS3j/kIAEzk+xHwFO9KcRnAt6lPoQX3704cbuT8NzhJRvJ/hmZbna
 oOqqdNcLhlz4mXhE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uFEDE-0002DI-6M for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 May 2025 15:40:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7F9D25C1851
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 14 May 2025 15:37:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F1F4C4CEE3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 14 May 2025 15:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747237193;
 bh=Klfk8xKs1fZcYHznB7OVIHSbZtx7eLOz685R9eVqwVU=;
 h=Subject:From:Date:To:From;
 b=PHhOq+GgiUGs3D+CvP+SUZTK98/ZnkqUrltbA8XuVImog1GBQRcgj/EVeKqQGU1mG
 b2D0W9tsGwWRZCE+xONYQYjo9O8TMqLW672qakalNmQRH0efHARDHuxVv2Fmssafkt
 nob7OlnVi3dmzG3itN7mJ13+VHqSyHM/fYMWLNA793JiLSVDRvonbfhCKBEpumPaMK
 ZDthnAtg/iR6aifIMte17BYPEtftQo5Tlv4zgeI+pbVUxmtEX1sWpIQhsCfYcEDpma
 FAg1t7I6r1V3OCXGmTp2/oHKlY54rHLDqrOATdx+gcHL3/CsKsZy2NSnvM6tfIkZ2l
 o1K0MCwbVEZ8Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EEA22380AA66 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 14 May 2025 15:40:30 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <174723722955.2412407.3991451179335923045.git-patchwork-summary@kernel.org>
Date: Wed, 14 May 2025 15:40:29 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -6.6 (------)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev] f2fs: don't
 over-report free space or inodes in statvfs Submitter: Chao Yu
 <chao@kernel.org>
 Committer: Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kernel.org/proje [...] 
 Content analysis details:   (-6.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/, high
 trust [139.178.84.217 listed in list.dnswl.org]
X-Headers-End: 1uFEDE-0002DI-6M
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

Patch: [f2fs-dev] f2fs: don't over-report free space or inodes in statvfs
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=962404
  Lore link: https://lore.kernel.org/r/20250513112538.2999915-1-chao@kernel.org

Patch: [f2fs-dev] f2fs: fix 32-bits hexademical number in fault injection doc
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=961992
  Lore link: https://lore.kernel.org/r/20250512115514.2641059-1-chao@kernel.org

Series: [f2fs-dev,1/2] f2fs: add f2fs_bug_on() to detect potential bug
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=961991
  Lore link: https://lore.kernel.org/r/20250512115442.2640895-1-chao@kernel.org
    Patches: [f2fs-dev,1/2] f2fs: add f2fs_bug_on() to detect potential bug

Series: [f2fs-dev,v5,1/2] f2fs: add a method for calculating the remaining blocks in the current segment in LFS mode.
  Submitter: yohan.joung <yohan.joung@sk.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=961892
  Lore link: https://lore.kernel.org/r/20250512073611.718-1-yohan.joung@sk.com
    Patches: [f2fs-dev,v5,1/2] f2fs: add a method for calculating the remaining blocks in the current segment in LFS mode.
             [f2fs-dev,v5,2/2] f2fs: add ckpt_valid_blocks to the section entry

Series: [f2fs-dev,1/2] f2fs: use vmalloc instead of kvmalloc in .init_{, de}compress_ctx
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=962278
  Lore link: https://lore.kernel.org/r/20250513055721.2918793-1-chao@kernel.org
    Patches: [f2fs-dev,1/2] f2fs: use vmalloc instead of kvmalloc in .init_{, de}compress_ctx
             [f2fs-dev,2/2] f2fs: introduce FAULT_VMALLOC


Total patches: 7

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
