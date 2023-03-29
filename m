Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2772D6CF64C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 30 Mar 2023 00:21:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pheAo-0004In-29;
	Wed, 29 Mar 2023 22:21:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pheAk-0004Ig-TO
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Mar 2023 22:21:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Zu70c2V5iFG1q782jb03tR8fwdTBG1vts3vYe0UcLD8=; b=JmD/UTHD4SlKxg1x1M0u+6H1zN
 RMf9EilMyltMg4PZyt1GM37Gx8026kBE4YxvATsAzl8pel9EPiW1hoodZFIWkQpDBkCLFvN2RIXA3
 bJOM6a123hTpO+dVOsvXpt1Q1g0BBwPYMzAfqcqOvxcbSd0UwikUMkKCmFQyYEwXahMo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Zu70c2V5iFG1q782jb03tR8fwdTBG1vts3vYe0UcLD8=; b=j
 RZ+li/KfHarGz/4O09Nomlex55EMZjY902DM+1JeOY7kRHTywldYdibpj32JwUNL55/D9a+6lStXS
 jNrsqyJ2t7V4xMrlxTBJVuGl/t8K3V5LuCN2GOah7qU9FIx2ljonE6RA9ecIBE2HT1WyUcEIwxJkN
 91PZBOGzsl9OwrRg=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pheAj-0007p4-8m for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Mar 2023 22:21:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EC094B824EA
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 29 Mar 2023 22:21:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 987ECC433D2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 29 Mar 2023 22:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680128489;
 bh=3hDnJvCenzm7Vfo3wMnItNokEGrzdQN/5eMgfm2jPO4=;
 h=Subject:From:Date:To:From;
 b=WKX7MqVrO60pBCQwfxgRzRUK7ocl368q3KCu7MhzuL4CKYjohXv8TrQA1mqSDfWtS
 wT1RRz2gRvBlSNVT/J1OwkSTbZzb/EykezVmESxzZlrzjQiwFRINPmrU5Lv7+K4bTh
 jbteDaZD8TO5c5NVS2jRMTaweNso+do2xnWN7u7tQ/Cg4cUlqnbnINTtqsdYolMyq6
 1wmSa28tpbvRN95/BLizJkTiVFLMzhKeaBoEym+IbU7zPzVg+yMZzd/XIbQQ78NmQ0
 jcmXf3MZdpJKLamMVwiFgw3qHz7I4nS56Q2Rucju7+ywaQPWpGVn06AR8oEv9MKzVD
 bcHTHoqn7sO0w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 77EB9E21EE4 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 29 Mar 2023 22:21:29 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <168012848936.3718.13199673917603363181.git-patchwork-summary@kernel.org>
Date: Wed, 29 Mar 2023 22:21:29 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev,GIT,PULL] f2fs
 fix for 6.3-rc5 Submitter: Jaegeuk Kim <jaegeuk@kernel.org> Committer: Linus
 Torvalds <torvalds@linux-foundation.org> Patchwork:
 https://patchwork.kernel.org/project/f2 [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pheAj-0007p4-8m
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

Patch: [f2fs-dev,GIT,PULL] f2fs fix for 6.3-rc5
  Submitter: Jaegeuk Kim <jaegeuk@kernel.org>
  Committer: Linus Torvalds <torvalds@linux-foundation.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=734802
  Lore link: https://lore.kernel.org/r/ZCOHd4jYn8zUCEZ0@google.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
