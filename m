Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF729B37E5
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Oct 2024 18:40:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5Tjb-0002LH-VL;
	Mon, 28 Oct 2024 17:40:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1t5Tja-0002L3-Ci
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Oct 2024 17:40:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PCkAIZrdh6SqGnmD73CuebThLNYvDEB4+aPqrw52LKk=; b=EL+LDzgu8MJmiBTp9EFeEA4UJJ
 SzzJb2jpyzCDFfkV6Jo1kleM7Yu3HeefI06KbvDk2BwqG6auc7RbAgXkO6BP0Qxg0dRmS1w64QC0U
 2M+xo4oAJWrrSDDKloj7sNpE3xURNKtdqTlfKA1frsd6Tom7Rn7wfZKI432kL89XAL6s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PCkAIZrdh6SqGnmD73CuebThLNYvDEB4+aPqrw52LKk=; b=fyw0AAD6JxnuKfTYC1mFQ+60Cz
 AlZWEQabvzrZzYphUZxU9zZLkwWkhj1a8uXtPewgtY7zO72ptsMTbj0Ar5bgSmScmBiYl6gEk4GgF
 6M55w4HWHBkSo0YUZNEYD7YlCCuK1uv585juN5IayUaVXJspR6s7xYIBH32hAD/7Dv4M=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5TjZ-0005II-4v for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Oct 2024 17:40:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 251C2A41FDD
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 28 Oct 2024 17:38:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC8EBC4CEC7;
 Mon, 28 Oct 2024 17:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730137241;
 bh=1g4pCRYlPLwvCXSAUfYAAQ/mLLeUYd7xuLPtmql3+Mc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=S/yDcMRvmCeuNpiePf7+edKVD+PEJv5/MZFqvK0P1Jd+poUYqwHNgoX6qc0yXiJF7
 CnpoOHOw8WCwxnYM5YKTjt0HH0qGIApBuw2pMBzc2pBqTwevoAzietwEdTpT9/7I2i
 O+8eE6vwcAUoAcqhhtoGRhKaqnjT89b/cuxSPvCaqiTpWMMpj8Ye0X6gc588zvB+q4
 r2dSMFAXe5NROTu/A7STzpU9st/3Y3NJHLRK02JML1imBKV1kC0zJK1X3zuwmG/NUd
 6EaZyxB137GZ7Q+xAMCUup7N24Dk9kTPOaSVvHaairtXtnfuaYQlp7cUrVwkw+lLN6
 HgDeLt6tuWZZA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 716E2380AC1C; Mon, 28 Oct 2024 17:40:50 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <173013724899.126843.18304853477430411378.git-patchwork-notify@kernel.org>
Date: Mon, 28 Oct 2024 17:40:48 +0000
References: <1726653980-590956-1-git-send-email-liuderong@oppo.com>
In-Reply-To: <1726653980-590956-1-git-send-email-liuderong@oppo.com>
To: patchwork-bot+f2fs--- via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 18 Sep 2024 18:06:18 +0800 you
 wrote: > From: liuderong <liuderong@oppo.com> > > In cost-benefit GC algorithm,
 mtime will affect > the selection of victim segment.For a large section,
 > mtime [...] 
 Content analysis details:   (-0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t5TjZ-0005II-4v
Subject: Re: [f2fs-dev] [PATCH v3 0/2] f2fs: modify the calculation method
 of mtime
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed, 18 Sep 2024 18:06:18 +0800 you wrote:
> From: liuderong <liuderong@oppo.com>
> 
> In cost-benefit GC algorithm, mtime will affect
> the selection of victim segment.For a large section,
> mtime should be the mean value of valid blocks,
> in order to select correct victim segment,
> it needs to modify the calculation method of mtime.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v3,1/2] f2fs: remove unused parameters
    (no matching commit)
  - [f2fs-dev,v3,2/2] f2fs: introduce f2fs_get_section_mtime
    https://git.kernel.org/jaegeuk/f2fs/c/b19ee7272208

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
