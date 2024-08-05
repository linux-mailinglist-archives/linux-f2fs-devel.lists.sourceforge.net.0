Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A34EA9485FC
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Aug 2024 01:31:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sb7AQ-0007JW-F6;
	Mon, 05 Aug 2024 23:31:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1sb7AK-0007J7-Ra
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 Aug 2024 23:31:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hG8QDX8jXA5aQjYTpuC0Vw115tLQuTUTonl7BS0N+D4=; b=Kn0tnhnNIg7Vv09MHpZ9n0jp89
 DBXLaZon3o8lhw4uVPKN+f/Bq5kFzoPBcunl4xZuyDxMb3gD8IYmtUr+k3eKASmJzYpp0OGdSNFlI
 kjpR3WZBK79EI5tf7We/0O0uRfAZlbnv93BFJ5vGE7cRUuieGFTiwYJgXbfdrqxuUgYc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hG8QDX8jXA5aQjYTpuC0Vw115tLQuTUTonl7BS0N+D4=; b=ciCRsJ6MUIDI+qabp8M0yqzgXX
 i7ddrzidHYmJaP5qr0D+s9n5pOvPjITxpjhExJmliIfqYedzTGoQwtWeZBFjjygEOGTFHfbFTU3RY
 u9cY6DlgtfUtOTYASOSjCA87DdosZUZb+hTvR1uaGvT0ubzncfUPHbOwjd1U+A58EOyU=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sb7AK-0005A3-1e for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 Aug 2024 23:31:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4F7ABCE0C45;
 Mon,  5 Aug 2024 23:30:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 17844C4AF50;
 Mon,  5 Aug 2024 23:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722900652;
 bh=BmAKtpyETPm1YzZTlRU1TiFMVb0KZtHi8NofXiNghTg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Q1eM5oh1c2oVU0tBZorsUrcpABdyVOs6p5k/vQivhg8HOx3TA0KDLc+LhEj1HyNfy
 mnDzGNa0HarqXnRLjmqSJdCyAToMz/BVuzoc42SBOyxfCBy3x/3b4IgqQ++haZ+gjH
 cRrqCPfFEd2M5EXGbGFadJU3uzLL1iY5LWI/l/L5YZbnmPivFsLEQCI0y9FEmguygQ
 KKNm3V8xuPU1yjnINTPjExE1CqJYkdur5+aYEV8r+bRCZKuREJCRFRmDfFy6OZ/nyM
 bXu8YWpiKExwTZ6MVtNF4Kq/bWzsN2j4Cl5hmYtymPP9yuj1hBrbhxAGGbG30sm/Cj
 FFEVa3hzFWy/Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 0B476C3274D; Mon,  5 Aug 2024 23:30:52 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <172290065204.2803.10007931893613649587.git-patchwork-notify@kernel.org>
Date: Mon, 05 Aug 2024 23:30:52 +0000
References: <20240724170544.11372-1-n.zhandarovich@fintech.ru>
In-Reply-To: <20240724170544.11372-1-n.zhandarovich@fintech.ru>
To: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 24 Jul 2024 10:05:44 -0700 you
 wrote: > The result of multiplication between values derived from functions
 > dir_buckets() and bucket_blocks() *could* technically reach > 2^30 * 2^2
 = 2^32. > [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sb7AK-0005A3-1e
Subject: Re: [f2fs-dev] [PATCH] f2fs: prevent possible int overflow in
 dir_block_index()
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
Cc: lvc-project@linuxtesting.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed, 24 Jul 2024 10:05:44 -0700 you wrote:
> The result of multiplication between values derived from functions
> dir_buckets() and bucket_blocks() *could* technically reach
> 2^30 * 2^2 = 2^32.
> 
> While unlikely to happen, it is prudent to ensure that it will not
> lead to integer overflow. Thus, use mul_u32_u32() as it's more
> appropriate to mitigate the issue.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: prevent possible int overflow in dir_block_index()
    https://git.kernel.org/jaegeuk/f2fs/c/47f268f33dff

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
