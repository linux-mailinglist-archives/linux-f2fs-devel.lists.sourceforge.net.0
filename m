Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A416E541E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Apr 2023 23:50:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1poWk0-0003XO-1U;
	Mon, 17 Apr 2023 21:50:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1poWjx-0003XH-Uk
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Apr 2023 21:50:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oqJn7V30xB4bPYPp4vhrv4ycb4skyRDdelPdXHBUmho=; b=l5iPAoT4OoXsq+iAlPpqbe2Uoh
 xpwgs+xeXU4OqR+hPPyDupSSg44vjecEWcH5amtXEBr01OAB0u7CkhkNPTU8I8G2R66wh+2PSfoNd
 qTdraXnnIoP1PwoG1s82nkbQDcXXJzUOETLl1WIt1JX2AnmMqytWos1mj/PIzTlYtwyk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oqJn7V30xB4bPYPp4vhrv4ycb4skyRDdelPdXHBUmho=; b=IFkkmxAm1cQNr0ok566V8d3Z+g
 h5fP60sKqAdc5VO/V7dMW3+84RuTuiSq/5rpmfGAXWk4jMniktMHK506k7PnqG3SuJtf9uUxTpAqx
 xE1TexIMqNbFdzuFUMTG00vA/WOTmBJIaWe3OIkceHAwv5MBlddJVMlCiaMeb3Bj6ih8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1poWjw-00Atwr-HN for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Apr 2023 21:50:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 33791621C6;
 Mon, 17 Apr 2023 21:50:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 97104C4339B;
 Mon, 17 Apr 2023 21:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681768218;
 bh=k/iLWe5JIRygwm7y4JmXtyf4IstYXvnRZ1SRfnjZKp4=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=pZtQa/qQeVA6f4wkVvGLuHQe5KfTq2WmCtnVGqo2Ypmx0HvSm6xkYIe7y36Kno5/w
 V8zAyalWKI2igzwUnDpvaxrI20AMFY1tWhVcOmV5LgACFfewFbgJwBnuC8Bbyf6oUl
 U807MmZUak4x8TZ9FmL9CbVgOkqOHBYittUvGXfDDD4PdfS32e50/++V5e2JnVj9Ai
 sfZgqFYqOEXtx/fqJfh5L85pU+Su4kxF7K93fAn1meDA54NEtj1PSPxnFTTvq7QK8l
 SgXNLDYc8qfzXoROBDOiTyxu3ijBGeDvUk+QZ4+Z5UIHp7Z9I6Nk24EvUD1oKAgXWI
 ZAL0c476T/naQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 69D1FE3309F; Mon, 17 Apr 2023 21:50:18 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <168176821843.10429.17764121899305487542.git-patchwork-notify@kernel.org>
Date: Mon, 17 Apr 2023 21:50:18 +0000
References: <20230406191629.63024-1-frank.li@vivo.com>
In-Reply-To: <20230406191629.63024-1-frank.li@vivo.com>
To: Yangtao Li <frank.li@vivo.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Fri, 7 Apr 2023 03:16:29 +0800 you wrote:
 > Convert to use remove_proc_subtree() and kill kobject_del() directly. >
 kobject_put() actually covers kobject removal automatically, which is > single
 st [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
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
X-Headers-End: 1poWjw-00Atwr-HN
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove bulk remove_proc_entry() and
 unnecessary kobject_del()
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

On Fri,  7 Apr 2023 03:16:29 +0800 you wrote:
> Convert to use remove_proc_subtree() and kill kobject_del() directly.
> kobject_put() actually covers kobject removal automatically, which is
> single stage removal.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>  fs/f2fs/sysfs.c | 15 ++-------------
>  1 file changed, 2 insertions(+), 13 deletions(-)

Here is the summary with links:
  - [f2fs-dev] f2fs: remove bulk remove_proc_entry() and unnecessary kobject_del()
    https://git.kernel.org/jaegeuk/f2fs/c/33560f8020c2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
