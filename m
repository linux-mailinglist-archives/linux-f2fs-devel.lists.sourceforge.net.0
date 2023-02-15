Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAAA6982D0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Feb 2023 19:00:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pSM57-0003mG-FW;
	Wed, 15 Feb 2023 18:00:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pSM56-0003mA-EH
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Feb 2023 18:00:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=flkGDdVXNbYZkNxzqjJPsvTPqqY9vmfIUVQkSzJlE1o=; b=fSQVH35wZhUurB5vCDQSaoiF8E
 //mqq/k3LnuRoidjEz8leNVaBlg/nu15L6Y4TTvz4NUa1PxYW5fVkf4bJMOxxkR4+R1whFxgI2QpA
 3lV/RuwzoTg5DM7GXum7rw/fItR1eG2+n4QEPa4OyVGGKd3D5m3AdifC1sl9uKRH9SWo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=flkGDdVXNbYZkNxzqjJPsvTPqqY9vmfIUVQkSzJlE1o=; b=c
 MgEysXJFOxa26nSb8IZJCOdZ/8hgppVlO0vTmDNkIn4JeeerrpccqsTqjNsjMl5Y0XOUqYq/x6yo6
 dbEU7tWIR6pYk47keuK2cmg8gXomgTs/f0tHpkHfAXYDH0hzc/sBx+DLRVHxTk95FLePg5y3JFw4R
 0BVPODYMx2NBSpDs=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pSM4z-000791-Sn for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Feb 2023 18:00:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2D003B8114B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 15 Feb 2023 18:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E79F2C433EF
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 15 Feb 2023 18:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676484019;
 bh=ttj+jAwOffYNVNBMliLOwl5QyKYSn1V0n7lnh+dZ7p0=;
 h=Subject:From:Date:To:From;
 b=q3CqYVbnGv4p1/w8XQxYPKGG1Bkaq1w8PtmjfJpzYz1mEsl6gM67KLr49fphQSm9M
 GiJGUOMn1Z7Yog0BL/8J5GsuwMURRDC90QxJPPvkyvsGFgn7XmUxPi0WTl6YsCdC/u
 aXMZcxKwQ31y2HtkY+b0ROZunzrfIEcBLWZfsUXjqpMUYytmi6BFkUvi85EZhOLp4n
 oKeK3+o6kE0XDgb34CzcnDEGHQeP6K/Br4pExPKPO/w+2RSPs/JWXgd4ZdAYsIcFeh
 AZLucULfDyTGp6j1LFKLhO6E7VPY5M+5sujU/7AtOwdDvFbvp08ogJZlIE9gImeLBV
 qlkD0c4ZN+wTA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 BE93FC4166F for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 15 Feb 2023 18:00:19 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <167648401960.12560.17590344451949389271.git-patchwork-summary@kernel.org>
Date: Wed, 15 Feb 2023 18:00:19 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev] f2fs: Revert
 "f2fs: truncate blocks in batch in __complete_revoke_list()" Submitter:
 Jaegeuk
 Kim <jaegeuk@kernel.org> Committer: Jaegeuk Kim <jaegeuk@kernel.org>
 Patchwork: https://p [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pSM4z-000791-Sn
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

Patch: [f2fs-dev] f2fs: Revert "f2fs: truncate blocks in batch in __complete_revoke_list()"
  Submitter: Jaegeuk Kim <jaegeuk@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=721904
  Lore link: https://lore.kernel.org/r/20230214235719.799831-1-jaegeuk@kernel.org

Patch: [f2fs-dev] f2fs: drop unnecessary arg for f2fs_ioc_*()
  Submitter: Yangtao Li <frank.li@vivo.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=722003
  Lore link: https://lore.kernel.org/r/20230215061701.1433-1-frank.li@vivo.com


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
