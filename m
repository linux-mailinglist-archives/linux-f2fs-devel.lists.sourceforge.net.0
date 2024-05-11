Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 634298C2E1C
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 11 May 2024 02:50:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s5aww-00043e-Ph;
	Sat, 11 May 2024 00:50:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1s5aws-00043C-80
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 11 May 2024 00:50:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Xc3X31wWsEwh/+x2DYAeVaiNihpJJJkTElVjM3XYjLM=; b=EI9q6ENbPBZNuExkLaALGIHok/
 Ip2fXsCrpjFWCSFM1wL/TRn5PL9keIfHrXvQiP/0cNy42kQE9to0f8nWoC9aX6Gz09DHFvSEYmpHQ
 KPhnSp4viE0opNPKvpbGGC7oJhQEFWjPNyZNfu5jpWtlE5zqAXoHsVn6TijNArU5Yd/4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Xc3X31wWsEwh/+x2DYAeVaiNihpJJJkTElVjM3XYjLM=; b=ODR5KIq0CsEZKTBS6HebxyMdKL
 H6vy3h8Qiykp3DZKbCMFgGPjUQezUUguAaJKJ3AaSnhQEKkoT0qeofxC/cIS48YSeh55yaVn6xh6+
 diUsT1/B3Q801gdVL55fpmYM6NP+oeU8OOP7B9xeTMJ3oiR+6+AP3qGBLjVenQqURtBI=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s5awr-0004zb-L5 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 11 May 2024 00:50:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5A98BCE1F39
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 11 May 2024 00:50:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 220EEC4DDE0;
 Sat, 11 May 2024 00:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715388634;
 bh=Awf1r273q7gGg010KfrhYdOCJKlxBHOXjUBot6jM11Y=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Y6fM4V4ovkebTJKUcT03MXxdriMrWkQ/KfUhOu2NmPj8mhLHJSWnkjH8oOKQz08WN
 mrkDF6jQRtg5QOkS4JGg186iKFr4DgdgS34oSlLy7L6acGQlTaW6X+FfwPW6af2Qxt
 1wCTl4ZONlP9d+BiNVXFc25dn+e2OQWHdAekbzdAL4NRepa3dgRnrMuEiOA4uzNUSy
 iT3sfCoHh87Q4/E8OZfsj0vNuqAR2PYQ4MvCeMbFjCmX68eQD4P1bqtRiu2aKZNSvh
 +WgzgDd7s5LVdqItmnZO/bK/Ca4jo9uxYL33NnEY4EvQ0fPhJA2iDxYlZhSkcoz/ab
 Qz6+z3P1d+uyw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 16FBFC54BA3; Sat, 11 May 2024 00:50:34 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <171538863409.11229.15179982798559586188.git-patchwork-notify@kernel.org>
Date: Sat, 11 May 2024 00:50:34 +0000
References: <20240426093348.377018-1-chao@kernel.org>
In-Reply-To: <20240426093348.377018-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Fri, 26 Apr 2024 17:33:48 +0800 you
 wrote: > If active_log is not 6, we never use WARM_DATA segment, let's > avoid
 allocating WARM_DATA segment for direct IO. > > Signed-off-by: Yunlei He
 <heyunlei [...] 
 Content analysis details:   (-0.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1s5awr-0004zb-L5
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid allocating WARM_DATA
 segment for direct IO
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

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri, 26 Apr 2024 17:33:48 +0800 you wrote:
> If active_log is not 6, we never use WARM_DATA segment, let's
> avoid allocating WARM_DATA segment for direct IO.
> 
> Signed-off-by: Yunlei He <heyunlei@oppo.com>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/data.c    |  3 ++-
>  fs/f2fs/f2fs.h    |  2 +-
>  fs/f2fs/file.c    |  5 +++--
>  fs/f2fs/segment.c | 11 +++++++++--
>  4 files changed, 15 insertions(+), 6 deletions(-)

Here is the summary with links:
  - [f2fs-dev] f2fs: fix to avoid allocating WARM_DATA segment for direct IO
    https://git.kernel.org/jaegeuk/f2fs/c/a320b2f08b3b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
