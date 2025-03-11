Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 45386A5CFEA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Mar 2025 20:50:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ts5cS-000498-2c;
	Tue, 11 Mar 2025 19:50:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1ts5cQ-00048z-F9
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Mar 2025 19:50:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CHbHg+Du7dviz7xo1ezJEWU4fnDqude8Beye7XVM7ZE=; b=X40d7q3SY+yJ27ZXTXNalQZWKS
 uhCQEaoYyizwVsQo9JEp72qYF2N8tKIT/9y2VcgdJPlg7SxxGgjq6vHblWh1CPbBTAD+kTXuuds2u
 dJvmrt8YEYEhinJt4OhB57HSEID7uQAfAiTIviwVBgWLNjM/kN0PthU2HccZt0qs6jjw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CHbHg+Du7dviz7xo1ezJEWU4fnDqude8Beye7XVM7ZE=; b=jbFO9Y5WGTLdRhoX+nczEf/wMB
 VTYSeVPI+DjRCeH2Cymggcln+eUGYFDPkDdAiNUV3XD+9AbjmDgtVFTY7NERf/oUjwlvMInQhmAq7
 hw9l2pgjwMC9WIJCJ1YGctVQnJJK6Hip3LiBb8OxKDKOpNSRu0yKnsjH5kKEkCLKjuGI=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ts5cG-0002ky-JP for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Mar 2025 19:50:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DCA85A4663E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 11 Mar 2025 19:44:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9EBDC4CEE9;
 Tue, 11 Mar 2025 19:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741722605;
 bh=Cwz3YGGG06uS5rTz987s1NY7XkDbZR/rxmyhnN3CR7s=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=gb2Vb8hssPd5IwW6EJ8PaDZyyTxazXrxg31Wpdch7somRPY9HjRLGKqzMwDXoCao3
 m9yox02TZoyU2U/mxPB7e1tCbjV5EoUg8mZLhV0dCjAZVNbnYPAhpdGyX4ckZdeBc/
 0M2ZNoYGXBhCP1PylLV9MORJGhEIEntwwoEiWJ0zhdGPzR+KSHgKX9JXW9Vjk81s0e
 hvTQqR3GbhavBSj92O/t8Oc3eG8IkPxd+EjsnwN0Rv+AHJBHsy7Tc5QDTthLq/DxQm
 uURoWJLkauwY4k4itM8NJBcBNsDZTTCMK3SQeQEgYhMdrlCNv81ZSNWKCTywuQz8dG
 h4l5dCVVBDFxQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33AE5380AC1C; Tue, 11 Mar 2025 19:50:41 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <174172263998.214029.16633125667702978351.git-patchwork-notify@kernel.org>
Date: Tue, 11 Mar 2025 19:50:39 +0000
References: <20250305110712.2114200-1-chao@kernel.org>
In-Reply-To: <20250305110712.2114200-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 5 Mar 2025 19:07:12 +0800 you wrote:
 > It reports that there is potential corruption in node footer, > the most
 suspious feature is nat_bits,
 let's revert recovery > related code. > > Signed-o [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
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
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ts5cG-0002ky-JP
Subject: Re: [f2fs-dev] [PATCH] Revert "f2fs: rebuild nat_bits during umount"
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

On Wed,  5 Mar 2025 19:07:12 +0800 you wrote:
> It reports that there is potential corruption in node footer,
> the most suspious feature is nat_bits, let's revert recovery
> related code.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/checkpoint.c |  21 +++------
>  fs/f2fs/f2fs.h       |  32 +++++++++++++-
>  fs/f2fs/node.c       | 101 ++++++++++---------------------------------
>  3 files changed, 59 insertions(+), 95 deletions(-)

Here is the summary with links:
  - [f2fs-dev] Revert "f2fs: rebuild nat_bits during umount"
    https://git.kernel.org/jaegeuk/f2fs/c/19426c4988aa

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
