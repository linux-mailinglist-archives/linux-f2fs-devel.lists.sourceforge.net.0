Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 415E872675A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Jun 2023 19:30:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q6wzT-0002dg-IY;
	Wed, 07 Jun 2023 17:30:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1q6wzQ-0002dZ-05
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jun 2023 17:30:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ISN1xylzzfRGbEDB0mtFpecaYaDO4iCHl7OtcRNvKok=; b=OqP7d2ZTpPftqSSURS2YaviZ+2
 /rWop9jMjm0GXnvCUQBEXFyGHBOtwXJtBBCroU11K2LioV2WTaERmiJNDq+b7ls8/DyT9o5xcR48M
 HlyzxXC5mQWTF6uqp9oT79gwud8Bc2lMgKeJnb79ReMo/YtFGJOl2K8suuFjdKtEfseA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ISN1xylzzfRGbEDB0mtFpecaYaDO4iCHl7OtcRNvKok=; b=X0EY3xeskNnWylOm0bZTEUfPHd
 N7yCcunSeBEvht6U7ShPr1kzLW0fdiwgaSLCqkMOPXnin+1Rq7iiqCt+LtvVvDzFDQ02v89Vjspal
 9P2CwBIlI7ay+g6+eritYQA8e9dNERi1xaTKPbRVwG2fp23CpdJDyXBrEGpK6pw60IW8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q6wzP-00DvrK-Vj for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jun 2023 17:30:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ED33B64204;
 Wed,  7 Jun 2023 17:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 55A97C4339B;
 Wed,  7 Jun 2023 17:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686159025;
 bh=Iu0WdkrFGv1GjZ2atrz9cBImnG3oKrStjhc+uU+EgpI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=oq0QouLgg4ddzK8u3+yf703bLYcZNkZbV9Tb9+uzbMtT+yBG2FeVSw/Rzb89/yMaK
 G9IfYZOwaa8n2qAlZQOtVwh+kUo6wnY2zCtO3pk1pDwvtvgvDBChhrzqMM9yBR0HgS
 XNjr1VVwWCV1k77BPu10o/7L3KbXhg4cr22or+10RhpR3zisdhgiHtsuAbim/1rrxI
 sqeIuVjqCDsgjW85CjY4t4R6xnS9UT63ec1Mw0sO6V3Fb1ZtKUUg8VS44GkDpXTp3W
 YsN/SDUK/i9BmdVG8bRDeAzIKdWTONpVBT/R+IiBF9YclmtyP36MI+fNx7gVjCmyYL
 9FYrMnrTkeNeA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 2FA3DE4F13A; Wed,  7 Jun 2023 17:30:25 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <168615902518.7521.17734763826963254315.git-patchwork-notify@kernel.org>
Date: Wed, 07 Jun 2023 17:30:25 +0000
References: <20230531125918.55609-1-frank.li@vivo.com>
In-Reply-To: <20230531125918.55609-1-frank.li@vivo.com>
To: Yangtao Li <frank.li@vivo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 31 May 2023 20:59:18 +0800 you
 wrote: > After enabling this feature, the read performance has been greatly
 > improved: > > 167M/s -> 234M/s, Increase ratio by 40% > > Test w/: > ./fio
 --name=o [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q6wzP-00DvrK-Vj
Subject: Re: [f2fs-dev] [PATCH] f2fs: flag as supporting buffered async reads
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org, luhongfei@vivo.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed, 31 May 2023 20:59:18 +0800 you wrote:
> After enabling this feature, the read performance has been greatly
> improved:
> 
>     167M/s -> 234M/s, Increase ratio by 40%
> 
> Test w/:
>     ./fio --name=onessd --filename=/data/test/local/io_uring_test
>     --size=256M --rw=randread --bs=4k --direct=0 --overwrite=0
>     --numjobs=1 --iodepth=1 --time_based=0 --runtime=10
>     --ioengine=io_uring --registerfiles --fixedbufs
>     --gtod_reduce=1 --group_reporting --sqthread_poll=1
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: flag as supporting buffered async reads
    https://git.kernel.org/jaegeuk/f2fs/c/fdb43e12e0c1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
