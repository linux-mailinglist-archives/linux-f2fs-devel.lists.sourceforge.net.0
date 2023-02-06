Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6169768B490
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  6 Feb 2023 04:40:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pOsMq-0006lj-00;
	Mon, 06 Feb 2023 03:40:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pOsMo-0006lc-M4
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 Feb 2023 03:40:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JCrNLEvSUFzrrcn6jtu2hZ5oUYyolTj73f6oUKTAXxQ=; b=UmTeLupREmT4g/UX5MgSQfFivW
 Eo5s8LQ1KXAMx2MK7mX45nFJPUimTN9qTxFnAmc7iuPGRLKb4g0F7tsp88MaZA7fUOOEgIBPKBh6W
 5M66gXlPjFLHvUkRqK6e14iyTgQrDZ64oOJloYoGKtHzrNWY5tGGYwUE/WoS4fYDWOSs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=JCrNLEvSUFzrrcn6jtu2hZ5oUYyolTj73f6oUKTAXxQ=; b=L
 QfHeYV67jvPSqXcQcUOAmXXfWqLukTnjtvzNiz3eCNIjAMkhM3bwBD8dbkwKvuqaVVf0eB78pOZpm
 S/Rd2gPpd8f3+jTEZdK2fmBVZCNvnkJqHsKoL6egmqgUCLyfqK8Kep/aYzcvK7DPdl/66LlMa7CsB
 4NajFKJGhj2tKJbc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pOsMl-00CFNF-UB for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 Feb 2023 03:40:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1300A60BAD
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  6 Feb 2023 03:40:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 78828C4339B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  6 Feb 2023 03:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675654819;
 bh=um3N6uSsGhU6TlLXrY/Wj+ogZ2MhFAPqptaedC6NsX4=;
 h=Subject:From:Date:To:From;
 b=sDRuCy8z4uq7Qk6M8gtpjNb8cjcyf1uhVTiTsfQna0v1Eve9sAAZuKToYfVKPfNRS
 94BmExvmCacPtIgb4BawWFGx/7KZ33O0nVyPwH5g+iZsexCTWfDacRuMHMGanhXmvo
 26hRvZ+Qo9IsJ7JZjF+o43BKA33qQGPinq1MPrY8pDPinZkbwNYyPjW3NBnDSUpktt
 3yhcX8AZIpOG9gfH717bPwHRX1/9he8tNUfNgoqINmwJKH8AI8ib+5BNCdp3Tqn8yK
 e6YPsbEPnwAAV2EsMGZPWJBzINmqpTt1v5obqSa9ebI5XIiqdG11viNRUWtbB+CAH0
 tOSIaGs/6Gpiw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 59C3AE55EFB for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  6 Feb 2023 03:40:19 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <167565481930.5323.12409536553590094207.git-patchwork-summary@kernel.org>
Date: Mon, 06 Feb 2023 03:40:19 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev] f2fs: fix
 cgroup writeback accounting with fs-layer encryption Submitter: Eric Biggers
 <ebiggers@kernel.org> Committer: Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork. [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pOsMl-00CFNF-UB
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

Patch: [f2fs-dev] f2fs: fix cgroup writeback accounting with fs-layer encryption
  Submitter: Eric Biggers <ebiggers@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=718375
  Lore link: https://lore.kernel.org/r/20230203010239.216421-1-ebiggers@kernel.org

Patch: [f2fs-dev,v3] f2fs: reduce stack memory cost by using bitfield in struct f2fs_io_info
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=718000
  Lore link: https://lore.kernel.org/r/20230202070456.3497513-1-chao@kernel.org

Series: [f2fs-dev,1/2,v3] f2fs: fix wrong calculation of block age
  Submitter: qixiaoyu1 <qxy65535@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=718019
  Lore link: https://lore.kernel.org/r/20230202082028.9013-1-qixiaoyu1@xiaomi.com
    Patches: [f2fs-dev,1/2,v3] f2fs: fix wrong calculation of block age


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
