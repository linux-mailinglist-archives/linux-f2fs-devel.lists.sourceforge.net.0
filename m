Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B270590579A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Jun 2024 17:56:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sHQKp-0005T2-2X;
	Wed, 12 Jun 2024 15:56:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1sHQKc-0005SN-Fk
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Jun 2024 15:56:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E84HzURwrsiyg7Vxew2T3eQxj6WI4iUyFBB9HpmWCiQ=; b=ZbiVAIi0AW92pApSkHaoZb7UQM
 GPZogO0NileuLLBmTbD0Xw4mFkwv4FSp6a3rJre6rwTV36Qm4lrsNBbVPvsNNmdt8liBG5es8om8C
 CAStpnCOJOHLDtTRVDaTpTe8BRLYbewPhzmTN8XyqoYsZRCyknMKiuDqvuOOTIgKBgk8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E84HzURwrsiyg7Vxew2T3eQxj6WI4iUyFBB9HpmWCiQ=; b=CJk8IW5lL7CGAHQZYuUzOv2Gxz
 Zc3dgxxROLFHYOUc15J+XhwyfLI/vC6YK5RrCywLfJ4kO77Vo1e2Jt1g+0OQLdWAot0OYNJ89Rdi2
 b4+d3vCH8/e/GbCGwFG3se3CyUEV0KJrD9p60Eu0g9yPVpf4Y/WNW6ztT7cXd7jOEL6M=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sHQKa-0007SP-5H for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Jun 2024 15:56:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 75563CE21DB;
 Wed, 12 Jun 2024 15:55:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5C6AFC4AF67;
 Wed, 12 Jun 2024 15:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718207757;
 bh=CJm6NsCv8wXRYnJiLn7aO9iQv2WZJ5cD8PjUW3TwzJc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=sT9Uooot1oDKn00smIXy8LRV1QS09qTK9sb548rjXfIVxrtC9Xc4TlKfuOl25piOV
 8Vi+zatSxvp69yGyYHUcDu9HFWtCBTqrZnMvIK2i1Wouz94zsoh3UEsZsIJ4hchckC
 fMLXL7Y9IJ9Io9G0xHaLof9kSNQo/Bd1AAKV92L3pkjSDIzZIGmiWKPOunBHmkG6rW
 fK1744xxdMXOOAOtUbrZglOqGRZJSZCDrNUJfYjJLvCNRxMgrpJICRehr2FaOtK7ir
 nZ3gUMW85CWeqSavOKbN+W6Q98+Wh9laL1uLfHtMztaFsofROvgdq4jnFqD1UHwany
 zEFHC2OU2Zvqg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 52646C43619; Wed, 12 Jun 2024 15:55:57 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <171820775733.32393.12174093758559793586.git-patchwork-notify@kernel.org>
Date: Wed, 12 Jun 2024 15:55:57 +0000
References: <1717414526-19658-1-git-send-email-zhiguo.niu@unisoc.com>
In-Reply-To: <1717414526-19658-1-git-send-email-zhiguo.niu@unisoc.com>
To: Zhiguo Niu <zhiguo.niu@unisoc.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 3 Jun 2024 19:35:26 +0800 you wrote:
 > IOPRIO_PRIO_DATA in the new kernel version includes level and hint, > So
 Macro IOPRIO_PRIO_LEVEL is more accurate to get ckpt thread > ioprio
 data/level, [...] 
 Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sHQKa-0007SP-5H
Subject: Re: [f2fs-dev] [PATCH V2] f2fs: use new ioprio Macro to get ckpt
 thread ioprio level
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, ke.wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 3 Jun 2024 19:35:26 +0800 you wrote:
> IOPRIO_PRIO_DATA in the new kernel version includes level and hint,
> So Macro IOPRIO_PRIO_LEVEL is more accurate to get ckpt thread
> ioprio data/level, and it is also consisten with the way setting
> ckpt thread ioprio by IOPRIO_PRIO_VALUE(class, data/level).
> 
> Besides, change variable name from "data" to "level" for more readable.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,V2] f2fs: use new ioprio Macro to get ckpt thread ioprio level
    https://git.kernel.org/jaegeuk/f2fs/c/270b09313b4e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
