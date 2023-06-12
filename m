Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 125D072D106
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Jun 2023 22:50:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q8oUj-0000WH-3d;
	Mon, 12 Jun 2023 20:50:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1q8oUf-0000Vz-9H
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jun 2023 20:50:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DeZML/HMtvz6NTCeYV7M4KBATdyK6jqWsdkdWwaQlmU=; b=c8T6Ps+acx5e1ADTKdKygnPbQ6
 z53d7wGZ0dpOAbW0Y6GKxH83wUjwkGUJ8w5Zq5SATxT1pJgIXv7RiLMb09VX41OlMU/nBK/gFygdf
 f3ieN+2RQ8/Uo/dspRYtVsAOtJA0Yy0BEd0Hty33edp3uUDAU4qfDz1/vv+1NaNBdjh4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DeZML/HMtvz6NTCeYV7M4KBATdyK6jqWsdkdWwaQlmU=; b=SzVY2T9MxlXmVWDZWrE3cPXKcU
 nUGHbsA3HERifrMZ/+Hj6eM9mCQP+Rfv0P/KLAryymEdcoOiVDFbT4Na3sh5WiShsbnP5++GxCWPB
 X6AKfKqGxDfJJ6FZQ1cEShFkvKMwzgKeZqpsT6kdozXizTcuQ5xmLunkp3HZHqZAH4u4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q8oUe-0007Ug-97 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jun 2023 20:50:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DCD3E6221C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 12 Jun 2023 20:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4A519C433EF;
 Mon, 12 Jun 2023 20:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686603022;
 bh=J3OtHHSsn0yjMX1uffsIAnEqKvVl+vYQ2fSPIvHvSCs=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=mUKTUdzxXFJuqgCl9mF64LbBWb0+c3szdJ5CHE27/XfC2lj4iNRQVmJRGJnKMnlHN
 zDratVzW4nhN3YxOfdlFbDup2LRGLUgrBS852fo40a/dFGoDv86agG6AkgeNct5qIz
 OmcoY8tAa4OEf0SHxB+PehExcg5wo0KPb/UX6hwFHYNoHoGfdFCfwdUI9EEq1ohJtr
 XK/qMqPpVBEEtHmUb7h9Kxms7e0lg5h2PY5fXI02PGKKAIbonBAHzockG/ZUwYdJYA
 l61hEr3doTcKZVuSlcYXjffbxzYDuDusPERIMp+V//DP2v5D+O60fA+2EEyQKq+XOx
 guwkf28Tdmp5Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 27AA1E2A05F; Mon, 12 Jun 2023 20:50:22 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <168660302215.10168.4138766982780443549.git-patchwork-notify@kernel.org>
Date: Mon, 12 Jun 2023 20:50:22 +0000
References: <20230606061901.1179970-1-chao@kernel.org>
In-Reply-To: <20230606061901.1179970-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 6 Jun 2023 14:19:01 +0800 you wrote:
 > freeze_super() can fail, it needs to check its return value and do > error
 handling in f2fs_resize_fs(). > > Fixes: 04f0b2eaa3b3 ("f2fs: ioctl for removi
 [...] Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
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
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q8oUe-0007Ug-97
Subject: Re: [f2fs-dev] [PATCH] f2fs: check return value of freeze_super()
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

On Tue,  6 Jun 2023 14:19:01 +0800 you wrote:
> freeze_super() can fail, it needs to check its return value and do
> error handling in f2fs_resize_fs().
> 
> Fixes: 04f0b2eaa3b3 ("f2fs: ioctl for removing a range from F2FS")
> Fixes: b4b10061ef98 ("f2fs: refactor resize_fs to avoid meta updates in progress")
> Signed-off-by: Chao Yu <chao@kernel.org>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: check return value of freeze_super()
    https://git.kernel.org/jaegeuk/f2fs/c/e6fd55c1f4b6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
