Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B35F4A3EAA6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Feb 2025 03:17:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tlIbO-0006MC-Ab;
	Fri, 21 Feb 2025 02:17:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1tlIbK-0006M4-FU
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Feb 2025 02:17:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SmMRcyUl6u7PHDJ3+WJixyNdB3CUBws7Og1Cm4FIAgM=; b=I60BiiBq62U8PFpQScINftViRp
 9fhiuO80YEXdxISVyGUSL4UhIZmQMYQFkpB5aSUW9wrQ7jb69vJrv9j8Uak+PDKyFCjm/aXVI9jaw
 aNkOKfN081+pqyZrxr4Qdg2CfO2NX1dSSEvASu3e50P0FM5XYIgTn/E1+e4L/OBt0POk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=SmMRcyUl6u7PHDJ3+WJixyNdB3CUBws7Og1Cm4FIAgM=; b=C
 buJPI3ZJrJLcH8oUqzA2fODnMIIXdiISQJPO16pebtZQSLEGP8+dr2xkJ/iQuvwrdYuWg16Qc/fPe
 AfFlEVKDx00ux5Z/631IkPCWBUzAnwu4VYU6Tt8DGwcMq3l7IrmMBBfQlb5Rk7M4PdL/LHouqMEv2
 gPJ6X+FEPVmvJzSU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tlIbJ-0005LA-JL for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Feb 2025 02:17:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 23FF65C5CC9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 21 Feb 2025 02:16:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E716EC4CED1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 21 Feb 2025 02:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740104222;
 bh=Erea8eF5zGP4tHDylGsD5SuuLy0suzk1ByZD6We6GgM=;
 h=Subject:From:Date:To:From;
 b=si7y+NWlRFbyRMjDmytnDdWsthKD4YrZZjX4cwgBMULwA0bJrf9vWr/YNMdFWsgEY
 Vl9atmF6CjrZRMuyQalRatlD2Rf25wyRtTjiw0s44dODY8Vib+HOnCXhEhrFkZouCt
 ZouvTseAKAiNb4LJYWslPgeSi9mxEaujG9YEnh/5LjS4zyxAAib3x0P4KJWsCmi6Hx
 31DtKh45RZdU22RL4XnqxgrNaNHdM0pY9ws1EA62gRZPONbuEjjajJIiu3wFruW6CW
 nJccSppfHesAzBb8RG66iSKB0kdaUuQK87s71jwgNsxoCGooWelZPsOTII7vNeERqI
 G7+Wjxv6g3Haw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EB4343806641 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 21 Feb 2025 02:17:34 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <174010425347.1545236.4656938230211324696.git-patchwork-summary@kernel.org>
Date: Fri, 21 Feb 2025 02:17:33 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -5.7 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Series: reclaim file-backed
 pages given POSIX_FADV_NOREUSE Submitter: Jaegeuk Kim <jaegeuk@kernel.org>
 Committer: Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kernel.org/project/f2fs/ [...] 
 Content analysis details:   (-5.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tlIbJ-0005LA-JL
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

Series: reclaim file-backed pages given POSIX_FADV_NOREUSE
  Submitter: Jaegeuk Kim <jaegeuk@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=932954
  Lore link: https://lore.kernel.org/r/20250212023518.897942-1-jaegeuk@kernel.org
    Patches: [f2fs-dev,1/2] f2fs: keep POSIX_FADV_NOREUSE ranges
             [f2fs-dev,2/2] f2fs: add a sysfs entry to reclaim POSIX_FADV_NOREUSE pages


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
