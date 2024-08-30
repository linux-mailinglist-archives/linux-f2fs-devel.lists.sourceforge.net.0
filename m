Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C9570966AF0
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 Aug 2024 22:52:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sk8bK-0000nY-Sj;
	Fri, 30 Aug 2024 20:52:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1sk8bJ-0000nK-DR
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 Aug 2024 20:52:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h9DQ4JL/mfOue/zEZVM1x6Qf0wETxRo9slchx2rCE0o=; b=Xc1t0hwNpnSghujcmabvmB6Inf
 7gWYkEc0fsfa0iIwOUAmQofPcCZBifkcuxXutanIDXFwssiCodXQ7ef7LRInXs5a/p8OXC/vBsGPU
 VwfPyuQT6gJpSQUfYLaZVuf/I2Bq0DdanBpfLXjLRYIfxq0qgV74eLnBtO/mOT0FRTzM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h9DQ4JL/mfOue/zEZVM1x6Qf0wETxRo9slchx2rCE0o=; b=Cmkmqa8o7X2iNt5xI1DCmxs54F
 gt0YnFDOMGwg+wsN9eVSNS9rhsT3+VwH1PfhlPIYObojiSpeuA9i2wvOY+853NkB8ypFL5J8rHvZp
 dsWcN+CYbbs51lkIjyD41vAL4fwKUt2Yf5YHsug/ZAEnk03KIQYENVym72z5GGNTKJ/k=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sk8bJ-0005oW-FN for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 Aug 2024 20:52:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id CE43CA41958
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 30 Aug 2024 20:51:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A6F4C4CEC2;
 Fri, 30 Aug 2024 20:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725051118;
 bh=1Wn6yqoxyoKYrvAnKdloD6T5n0X04RDSUrbiGIH0IN8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=MmFixrAHwCdUROvjULPxvCKlKRcRiMbB9dbFJLS8i4RQNNItrcwD2aOo3ZzLEy+w/
 f2s/Z2tvAMwLGb4uQuMsoeYTygGa3tchGeP9KGNxJ/G8q019gt/hUgCfr0b9Z9IXy1
 ZwHLJPxe6p8027GrOF5X0JDCBj8iV6yyrDNPbfU+JpQvTh1QV9CTsboY5lUBmAnHx0
 nxYuJw7HpVswaAjdqSey+A+bnSncKlrFYkki79A+yg34z8lWxXThFPj4JvtAFFh/6n
 k9q0ehCL9lyunWBdZqwZOUP5hc2zJKUH3NONT9HGG/Vb4vlGnG33dwIxlU2oqh8HKA
 P9LavN+Sun0qg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 342513809A80; Fri, 30 Aug 2024 20:52:00 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <172505111900.2712133.2121725656305360259.git-patchwork-notify@kernel.org>
Date: Fri, 30 Aug 2024 20:51:59 +0000
References: <20240816011342.1668666-1-chao@kernel.org>
In-Reply-To: <20240816011342.1668666-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Fri, 16 Aug 2024 09:13:42 +0800 you
 wrote: > atomic write can only be used via buffered IO, let's fail direct
 IO on > atomic_file and return -EOPNOTSUPP. > > Signed-off-by: Chao Yu
 <chao@kernel.org [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [147.75.193.91 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sk8bJ-0005oW-FN
Subject: Re: [f2fs-dev] [PATCH v2 4/4] f2fs: atomic: fix to forbid dio in
 atomic_file
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

On Fri, 16 Aug 2024 09:13:42 +0800 you wrote:
> atomic write can only be used via buffered IO, let's fail direct IO on
> atomic_file and return -EOPNOTSUPP.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v2:
> - fix error path handling.
>  fs/f2fs/file.c | 36 ++++++++++++++++++++++++------------
>  1 file changed, 24 insertions(+), 12 deletions(-)

Here is the summary with links:
  - [f2fs-dev,v2,4/4] f2fs: atomic: fix to forbid dio in atomic_file
    https://git.kernel.org/jaegeuk/f2fs/c/b2c160f4f3cf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
