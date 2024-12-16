Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC299F3644
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Dec 2024 17:40:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tNE98-0006Os-U2;
	Mon, 16 Dec 2024 16:40:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1tNE95-0006Oj-Ev
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Dec 2024 16:40:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lMxZL8IwxkNuKW3p+4gqCGOQokFeCbWWWYM1KvIsohg=; b=LmhJ1tryJrmiaBnDBT2P4wrhgS
 uafcFtz4q7D1hcN1LCs18E0yyTT4lUGXtlCpANXQmOjeFvyY53LaCHvXhDldwuWdXJlnM5bm+8BO+
 MvysfHOCC9OSwo0Ox/PyRRVY2Eg7nqWrE3XNUgz3tY0hf6BvEwVc6vdrwErV55ooRdnc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lMxZL8IwxkNuKW3p+4gqCGOQokFeCbWWWYM1KvIsohg=; b=KYXywHNWww7851+ZkcGthXgtqx
 N05ogN+efzvwr7QWAINjhM42sZ+eDbz6wOVW6Zu7MNxpOWXd5wmOtLrqcX0jUdXN18f2sTxzReFRn
 /3gsYFX395p0Pmy9G+NP7kF+LGvwhOY30NaztURUnal6aAUGLgBy8Ys+Yc6TdXaGJ0QQ=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tNE94-0000sh-7F for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Dec 2024 16:40:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B63A9A418A7;
 Mon, 16 Dec 2024 16:38:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33953C4CEE0;
 Mon, 16 Dec 2024 16:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734367223;
 bh=70lINbxMiuJr0DwKul2hLcahtcYekps2D3NWfzvPUqI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=juaKhib8i5XlsjUEzHgmF0Nw7IUh8wLMcxaJgD9jtqOtrJKcweuBM5fE6yqdpPoKl
 tCcdvvqNJ2RjWT6WtfJlJ9/X63DcamtPC1azcuiq/r04Ot3wIuEoJyvW2ibYn5iZ+a
 rdqyNyer3mX7L/VXfF3avH01e9WozcO5uAIFubWbBiwRvM5jsPLS9FZlkIeBWtmk+G
 sIaaA0coaW40RvxEGnrMRYSiNmMGtWZmaZ55alY/vdrTGxxeiUd60XjyKfmygUX+Dd
 sUwJ6VhWrnwW6yZ1JMtkTQzm/wwsa95O6A8AaluZH5a1Q3FICPl0mb+p3FmK+nZRdy
 xaxEaual5SZIg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 71A9B3806656; Mon, 16 Dec 2024 16:40:41 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <173436724000.272389.17352923573264150429.git-patchwork-notify@kernel.org>
Date: Mon, 16 Dec 2024 16:40:40 +0000
References: <20241204033113.4133027-1-yangyongpeng1@oppo.com>
In-Reply-To: <20241204033113.4133027-1-yangyongpeng1@oppo.com>
To: Yongpeng Yang <yangyongpeng1@oppo.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 4 Dec 2024 11:31:13 +0800 you wrote:
 > In SSR mode, the segment selected for allocation might be the same as >
 the target segment of the GC triggered by ioctl, resulting in the GC > moving
 the [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tNE94-0000sh-7F
Subject: Re: [f2fs-dev] [PATCH V2] f2fs: The GC triggered by ioctl also
 needs to mark the segno as victim
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed,  4 Dec 2024 11:31:13 +0800 you wrote:
> In SSR mode, the segment selected for allocation might be the same as
> the target segment of the GC triggered by ioctl, resulting in the GC
> moving the CURSEG_I(sbi, type)->segno.
> Thread A				Thread B or Thread A
> - f2fs_ioc_gc_range
>  - __f2fs_ioc_gc_range(.victim_segno=segno#N)
>   - f2fs_gc
>    - __get_victim
>     - f2fs_get_victim
>     : segno#N is valid, return segno#N as source segment of GC
> 					- f2fs_allocate_data_block
> 						- need_new_seg
> 						- get_ssr_segment
> 						- f2fs_get_victim
> 						: get segno #N as destination segment
> 						- change_curseg
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,V2] f2fs: The GC triggered by ioctl also needs to mark the segno as victim
    https://git.kernel.org/jaegeuk/f2fs/c/e9a844f6e487

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
