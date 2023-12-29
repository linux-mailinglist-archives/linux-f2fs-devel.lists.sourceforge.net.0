Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BFD820120
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 Dec 2023 20:10:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rJIFc-0001l6-I2;
	Fri, 29 Dec 2023 19:10:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1rJIFb-0001kz-76
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 Dec 2023 19:10:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=23eaMhKrUyDHks0Vz4qfKXwTrM4+Bf18A8zbIML0BaQ=; b=jVg8TORwuqD9mYINsxvoGHwZuV
 iZGlZCQ56JMERbSReVABUIjSsHMSq0Kj9Bqe/ORl1KG47QX/CdoLx+z0HJokSCJzsiRlYyZn0k7xZ
 VLh83ERDHe7nrJCP93l17qdcVG2nAJhUJSLQAXffxS189THkr+hpkYIYYF150yHWJ13o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=23eaMhKrUyDHks0Vz4qfKXwTrM4+Bf18A8zbIML0BaQ=; b=ONjaSsuI4RZrV7jWfLjmpzZJuu
 XZtnCcflo/tJ4IufcnRJJSW6oUM1MPbINGBc7Ven3Vxxk6WcKUWAHPnseRwurDMMNcP0yn3KiBhkI
 4Oy0Ws9Sx8GIA3K9YNn9e43spJGJ1DizU4eJ2f3zJ7H7MnHYRX5ijjCY4LvMKXiIdn9k=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rJIFa-0005NH-Ta for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 Dec 2023 19:10:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5B7A760EF4;
 Fri, 29 Dec 2023 19:10:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CEA50C433C9;
 Fri, 29 Dec 2023 19:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703877024;
 bh=azbq9IaFcbH3G1hY8wqg9qCkLNXlK1459gYGzqBZmB8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=DJu5tO23zkSBizsuEcsJ8lve5wEaPt3xh8r7hHFcy5yNbHXULOf9dKCWiPc0PMwvJ
 sC7V3b6/qVKuqdxb0Q6dF1pL+MAKuk0CX2QR3Ichgze7V9AW+I1YHnU1MLSdiKSYPR
 O3lZ3g0oA4VqTnWv8xTGhn7kjOpRBEv+PqUMUIhGOKwkbpDTc7lq+BwYhwNygY++KQ
 Xo5SIjFODNmXhr7+FWNg7g2uPBl1/2R9Kv8Lrj8CWxnjTvnbukDBQiNgzNPriOPvwf
 xhaApl/8r7l8Fm3s1qdyi6g0l0nhAgYP70Butd73zX1rUKc1hABVvY6dqLd3rpUzf8
 j2wye18ew2v0Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 B409BE333DB; Fri, 29 Dec 2023 19:10:24 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <170387702473.8173.3280676810374722700.git-patchwork-notify@kernel.org>
Date: Fri, 29 Dec 2023 19:10:24 +0000
References: <1703037598-4359-1-git-send-email-zhiguo.niu@unisoc.com>
In-Reply-To: <1703037598-4359-1-git-send-email-zhiguo.niu@unisoc.com>
To: Zhiguo Niu <zhiguo.niu@unisoc.com>
X-Spam-Score: -7.8 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 20 Dec 2023 09:59:58 +0800 you
 wrote: > The current pending_discard attr just only shows the discard_cmd_cnt
 > information. More discard status can be shown so that we can check > them
 through [...] 
 Content analysis details:   (-7.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rJIFa-0005NH-Ta
Subject: Re: [f2fs-dev] [PATCH V5] f2fs: show more discard status by sysfs
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org,
 niuzhiguo84@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed, 20 Dec 2023 09:59:58 +0800 you wrote:
> The current pending_discard attr just only shows the discard_cmd_cnt
> information. More discard status can be shown so that we can check
> them through sysfs when needed.
> 
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> ---
> changes of v2: Improve the patch according to Chao's suggestions.
> changes of v3: Add a blank line for easy reading.
> changes of v4: Split to three entries
> changes of v5: move these entries from disk/xxx to disk/stat/xxx.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,V5] f2fs: show more discard status by sysfs
    https://git.kernel.org/jaegeuk/f2fs/c/c3c2d45b9050

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
