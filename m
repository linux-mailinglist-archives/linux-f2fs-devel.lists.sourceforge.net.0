Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B37E4696C75
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Feb 2023 19:10:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pRzlG-00067W-Le;
	Tue, 14 Feb 2023 18:10:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pRzlD-00067K-EN
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Feb 2023 18:10:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nJVcmXOnyPYLjF6Uws+MaoQoxPPBCSyTDktRiSS1Z/k=; b=gSZL0vmDn9Kemgq4A+SZiybKL+
 eV1vyj9XZ51qcKayhlyJVauYXQs1R25trU6WCG7vCEUc1OCjjdzGzV9GAi0BNQZp6DCICue7GqGdA
 KMmFmIVN5S8i1WgRcdgY1j+gb3mQ9MFHj0Fl3zE6moPseMX3IZN/g7mIQY4xl4mnYovk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=nJVcmXOnyPYLjF6Uws+MaoQoxPPBCSyTDktRiSS1Z/k=; b=F
 euANuH2TdGL6YZAbNB9z3zRDxjjQNxVIvZeU/rQLiNOWu/+05pccg+yUMAYzXH0SBBHP8MwXARRF1
 +ggmhsG46XX7YRGpBSs1A8aPy/bUdTXn4hsCm+GlKvgYh57Lzcq8nZEY30S+nGnltt4jSAtkXeNYx
 bL4lHIuwA4ZwCTQs=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pRzlB-0001LL-Al for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Feb 2023 18:10:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B510461812
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 14 Feb 2023 18:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6821AC433D2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 14 Feb 2023 18:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676398228;
 bh=GuynPZdvxBxG4GUeu1xWs3rM3Ivw5PvuWMv1h2FyTbU=;
 h=Subject:From:Date:To:From;
 b=fc9u/SyIBSlikOUpDeN+S/KQb71evSTuTAj49wcCpwzb21T/ZUHoJf4YTZAbhuKvW
 A7ogr/C/k8BOB8btslg5YTyYKQgI2y7ChFHa/88KVlo+5+HqRvxH3g4dRhLTs7XIwg
 Sh3dpWVgYohYwGbZ1g0kHXf2JFlKZvhnAx9MGxn2RGtrhmD0TSUoNiAJAP3MEJqbja
 wp27KSwOyLkk52mfp5f0YWiBHNE5WpSKnTtxcyKoujemp7503Hd7MZGh5GI2ZlTbR4
 /A6tq3J1vBBRP1GzlaSuPgggbqsIs38Bzf4yxVIdJEmR/J9OVNho+dfhGxVhqdum28
 H9JscSidkOndw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 52C54C4166F for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 14 Feb 2023 18:10:28 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <167639822833.3874.2915071388704469722.git-patchwork-summary@kernel.org>
Date: Tue, 14 Feb 2023 18:10:28 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev] f2fs:
 synchronize
 atomic write aborts Submitter: Daeho Jeong <daeho43@gmail.com> Committer:
 Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kernel.org/project/f2fs/list [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pRzlB-0001LL-Al
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

Patch: [f2fs-dev] f2fs: synchronize atomic write aborts
  Submitter: Daeho Jeong <daeho43@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=720437
  Lore link: https://lore.kernel.org/r/20230209181819.2333522-1-daeho43@gmail.com

Series: [f2fs-dev,v3,1/2] f2fs: export ipu policy in debugfs
  Submitter: Yangtao Li <frank.li@vivo.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=721304
  Lore link: https://lore.kernel.org/r/20230213141825.22858-1-frank.li@vivo.com
    Patches: [f2fs-dev,v3,1/2] f2fs: export ipu policy in debugfs
             [f2fs-dev,v3,2/2] f2fs: replace si->sbi w/ sbi in stat_show()


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
