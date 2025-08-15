Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FF8B283F2
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Aug 2025 18:40:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Date:Message-Id:MIME-Version:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GGJvaMFfWEiqO7H0PvmKtBp2N/URkmaOa2nH1t6alOM=; b=BUPqh6xiPsR+7N27qO1Ax34cPV
	21+XBCP0gsVoWqKHt5MjLXRGl2DRZQellpX4nifC9oL59UpDkJ0/0mymrWTr6TT/2TbNxv9fgjKxj
	55d0wiMiS89JT8ERWnKpKfrAT8g0ohBqF9+EvwgJeMv0qRhGOOjbfS92KI5+2CcsxvQk=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1umxTN-00012S-NY;
	Fri, 15 Aug 2025 16:40:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1umxTL-00012M-8o
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Aug 2025 16:40:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e57MzC89M3CMfXyzYENUIm35Rsjybqts72pLWzpqpGQ=; b=kc/oows/uI4xX7zN8HxKcJWw9X
 MTx0ILa2WAMfiC+ZPIq+Qkr6nqRH/b+hmNXxEye9/swXFnRtoAv8PJW0XDYkLVtUtXSmuC4vwRcAZ
 E9vt8xp1ZscmxYyqQcPZQG+9aQjkL/RhQJqtiIDE99jzORwq14cl0A6EkVE3tzmTPQ9w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=e57MzC89M3CMfXyzYENUIm35Rsjybqts72pLWzpqpGQ=; b=k
 cAISNC8977KU2GgL/7kGTVHA5T60xrKgQ1hw4q5fRbpfJDITIG9jMw2wv5NmE3KcJ94XbBxYMlWgY
 gn2+xZFZqCYVCzInhTAkYsa5pD/X8o4UuEu7begalEv+gx+DMxC6QmvRnh4eag/CITfo5T1+rFqj7
 PNorwMdk13nI5fOI=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1umxTK-000170-Mm for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Aug 2025 16:40:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 61C1F457C2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 15 Aug 2025 16:39:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43F28C4CEEB
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 15 Aug 2025 16:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755275996;
 bh=N0UnNz7AB9fQ8nsdfY9xTOKcXb9qdfokjSMq223Tt+g=;
 h=Subject:From:Date:To:From;
 b=uoH3xkoWg7ZLQ9gQT2eibFdTBJ73Xp4mlYGvUeX/ciRM6VCIBadbt8xee5B0rOZNF
 7flY/DcO4WtmrBn8ZNoqNwmfaalNxMyp2qCmCHoGbMxb+LkIYndjlnKcdWFIz4GAp5
 oItXSKLAv5wiI2Oa9HjVPHhI6KlB7n86o9XllR59dEOSS0IyVyhKH5U7c2fNZSToI5
 lbMsMlnQl8e6YnNatJSvs+Wv8MkqlKXJf7Mrr24oTGh4T5HLQkNoq2vlbaHJ7cFMG3
 FvSF8t+npYkWWUc2diZVQn7PR2xGzT0FFE26u6gqTlNBXIxqSVkwNbdp9AKYM1fALa
 PQlVQ2yotwEGw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 746FC39D0C3D for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 15 Aug 2025 16:40:08 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175527600704.1161945.2999634970605762120.git-patchwork-summary@kernel.org>
Date: Fri, 15 Aug 2025 16:40:07 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev] f2fs: fix
 to clear unusable_cap for checkpoint=enable Submitter: Chao Yu
 <chao@kernel.org>
 Committer: Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kernel.org/project [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1umxTK-000170-Mm
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

Patch: [f2fs-dev] f2fs: fix to clear unusable_cap for checkpoint=enable
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=988928
  Lore link: https://lore.kernel.org/r/20250807014836.3780988-1-chao@kernel.org

Series: [f2fs-dev,v3,1/3] f2fs: fix to avoid overflow while left shift operation
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=988334
  Lore link: https://lore.kernel.org/r/20250805062912.3070949-1-chao@kernel.org
    Patches: [f2fs-dev,v3,1/3] f2fs: fix to avoid overflow while left shift operation
             [f2fs-dev,v3,2/3] f2fs: fix to zero data after EOF for compressed file correctly
             [f2fs-dev,v3,3/3] f2fs: clean up f2fs_truncate_partial_cluster()

Series: [f2fs-dev,v3,1/2] f2fs: add lookup_mode mount option
  Submitter: Daniel Lee <chullee@google.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=988344
  Lore link: https://lore.kernel.org/r/20250805065228.1473089-1-chullee@google.com
    Patches: [f2fs-dev,v3,1/2] f2fs: add lookup_mode mount option
             [f2fs-dev,v3,2/2] f2fs: add sysfs entry for effective lookup mode

Series: [f2fs-dev,1/2] f2fs: add timeout in f2fs_enable_checkpoint()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=988961
  Lore link: https://lore.kernel.org/r/20250807040026.3834543-1-chao@kernel.org
    Patches: [f2fs-dev,1/2] f2fs: add timeout in f2fs_enable_checkpoint()
             [f2fs-dev,2/2] f2fs: dump more information for f2fs_{enable, disable}_checkpoint()

Patch: [f2fs-dev,v3] f2fs: fix CURSEG_HOT_DATA left space check
  Submitter: mason.zhang <masonzhang.linuxer@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=988747
  Lore link: https://lore.kernel.org/r/20250806123236.4389-1-masonzhang.linuxer@gmail.com

Patch: [f2fs-dev] f2fs: fix to detect potential corrupted nid in free_nid_list
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=988943
  Lore link: https://lore.kernel.org/r/20250807024431.3805293-1-chao@kernel.org

Patch: None
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=988628
  Lore link: https://lore.kernel.org/r/20250806061106.3445717-1-chao@kernel.org

Patch: [f2fs-dev] f2fs: fix condition in __allow_reserved_blocks()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=987235
  Lore link: https://lore.kernel.org/r/20250731060338.1136086-1-chao@kernel.org

Patch: [f2fs-dev,v6] f2fs: add reserved nodes for privileged users
  Submitter: Chunhai Guo <guochunhai@vivo.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=989131
  Lore link: https://lore.kernel.org/r/20250807133501.551848-1-guochunhai@vivo.com

Patch: [f2fs-dev] f2fs: clean up w/ get_left_section_blocks()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=990005
  Lore link: https://lore.kernel.org/r/20250811114123.1085143-1-chao@kernel.org

Series: [f2fs-dev,1/2] f2fs: dump more information when checkpoint was blocked for long time
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=987227
  Lore link: https://lore.kernel.org/r/20250731053405.1127197-1-chao@kernel.org
    Patches: [f2fs-dev,1/2] f2fs: dump more information when checkpoint was blocked for long time
             [f2fs-dev,2/2] f2fs: add time stats of checkpoint for debug


Total patches: 16

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
