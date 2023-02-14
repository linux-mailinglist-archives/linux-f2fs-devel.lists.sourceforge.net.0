Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B5178696C76
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Feb 2023 19:10:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pRzlH-00067f-11;
	Tue, 14 Feb 2023 18:10:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pRzlD-00067Q-Ru
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Feb 2023 18:10:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/HFyrRfwC+mp0H0vc0CDMKQwg3t9fCOnxwKyDFVwNsQ=; b=ex6gYXULPCXg/qqPOpmm5no8DK
 9mTZ5bL2tH9ZHa6rCV+onM9P12lq8P5yU/Lqfgbk/1qIGtQX2HbdY0/lpXzfVyGg47WFagvuoEVnz
 FWgVQDvQleTOcXdZrfJuZHJnRxpyzOG1l/lLOa5px36NXN63MiBWWAyVAqT7/91WX9fY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/HFyrRfwC+mp0H0vc0CDMKQwg3t9fCOnxwKyDFVwNsQ=; b=Pb9nU0P12qBW3gICrgeDDrUBIe
 kjTtuiy7TbNre1o34qnRXItPiiJ/wNuKGULsoH0iGqA9SfcKgibZXe9534KIB7W0rqsHWjJEPljaL
 +s8Mf8R5molRnLuRHR/ZihQRolA7d1CzsMG6BxHS/kVY5dt9IoTArodVHDE+UaEpNTaQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pRzlC-004OGU-61 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Feb 2023 18:10:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C2C1661820;
 Tue, 14 Feb 2023 18:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 83646C4339B;
 Tue, 14 Feb 2023 18:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676398228;
 bh=jkvp/0FdVuBITSbyQQFdytDTZtIkYXrWLGZGWL78WS0=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=AQ6rLaaiTAuk+GLEKa/5pxc/Q8WlxYlti1/1ehgzRZh8q7FolxNi0AToP4lJ7wrHW
 3+mz+UcVqwlloTztbVIdSivS0/9ZuA1djIcQVUJKashQLuFPO7BltsP4Drp8NxnJr2
 k6gAcmMkKyRXZVnianN7e/NjvFSTRkWoQvrnEvizpDbuzGgpmtO72f9J4LexHc8s9f
 Cb/ldJ1aoMJZxV/zOD+gJCj5hHrHBPBCRrVKAoBC8SmqU2oARSFKKWB1S0NHi+srjA
 R+8mOk4GxMNworc0MQi0whrrM65fTp0MvV0S7/o8SbPuE8lduGCKHwRsBEzNlS4TDW
 6C1aTRZxTdKlQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 631D8C41672; Tue, 14 Feb 2023 18:10:28 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <167639822840.3874.759826899218773944.git-patchwork-notify@kernel.org>
Date: Tue, 14 Feb 2023 18:10:28 +0000
References: <20230213141825.22858-1-frank.li@vivo.com>
In-Reply-To: <20230213141825.22858-1-frank.li@vivo.com>
To: Yangtao Li <frank.li@vivo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 13 Feb 2023 22:18:24 +0800 you
 wrote: > Export ipu_policy as a string in debugfs for better readability and
 > it can help us better understand some strategies of the file system. >
 > Signed-of [...] 
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
X-Headers-End: 1pRzlC-004OGU-61
Subject: Re: [f2fs-dev] [PATCH v3 1/2] f2fs: export ipu policy in debugfs
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 13 Feb 2023 22:18:24 +0800 you wrote:
> Export ipu_policy as a string in debugfs for better readability and
> it can help us better understand some strategies of the file system.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
> v3:
> - remove unnecessary '\n'
>  fs/f2fs/debug.c   | 24 ++++++++++++++++++++++++
>  fs/f2fs/segment.h |  1 +
>  2 files changed, 25 insertions(+)

Here is the summary with links:
  - [f2fs-dev,v3,1/2] f2fs: export ipu policy in debugfs
    https://git.kernel.org/jaegeuk/f2fs/c/f2e357893cb7
  - [f2fs-dev,v3,2/2] f2fs: replace si->sbi w/ sbi in stat_show()
    https://git.kernel.org/jaegeuk/f2fs/c/dda7d77bcd42

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
