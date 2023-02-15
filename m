Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F276982CB
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Feb 2023 19:00:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pSM4x-0001K8-LP;
	Wed, 15 Feb 2023 18:00:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pSM4w-0001K2-Hd
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Feb 2023 18:00:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OOjWcuMsZvMznO9AzmayRjdfFOmgRl17ulK5uch+ULE=; b=GQlejf93MGfS4msJmwDT0OFTri
 u10q1u8s0kcHp75ZfvnorJUTEbC3P991p4nltAKKgn9cGRuCCECOvceL6uO/lpea7Rz1UBNt+YclL
 fcePnGMnz0YfzJ/lBWp8nyj7zi/yuR39cojVogLXxc5jylZoNDWFsjCp2Lnvn0zOHe+E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OOjWcuMsZvMznO9AzmayRjdfFOmgRl17ulK5uch+ULE=; b=keParYLWWZDNTpy19htFr/15Nl
 RwUgnbzhBPLW/UNUargdHA/A5KPmVltrPM3TcoWJC8ZbXcphX+9o3YNkICJBNSzQMGZRjZYwgYsoS
 toYZY/6IqqHbYVxCSG+Qta2Dy4T0I0UpSq9Tel3ZKV0zsXxxmFrKkRMdvsnRgJPHxu5g=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pSM4v-00078z-9S for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Feb 2023 18:00:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9FFE861D06;
 Wed, 15 Feb 2023 18:00:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 12C0BC4339B;
 Wed, 15 Feb 2023 18:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676484020;
 bh=j2eRplYbp9PP1g5JU1C4Wj/IK2TR7ql64N9/+y8UEhQ=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=KKhVeoVQF9m3Mre4FKRPIIyXrIqW7pMewu7e0nZTXY8+lkPcgzEl9s81Avmi+1ZP6
 LFF9kFIOV+j+taxrx1ofxINDSNxpCOv/bjBSr4haSy7kLTmyFd7JWtLBJsElHFfpOJ
 l//dLqRWDihCuREco995b5CQwLzR0NfR0bFne0SW1LK0h9rmcrQ3zKTTIzbAFUMj9s
 DQMWBF2ItVqPcMUujvV44H7KonyF43AFlrppQImZWILiLDbJa1jd8Yq2fvY1hDBzP3
 tin79c0TBQpcALJ0gm/9vI0QW+mfXH1tKxHNrL0UsgmB6HhvdkfDZ5ePu4YZWY3lgm
 BGflPMhcV/WBA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 D6C83C41676; Wed, 15 Feb 2023 18:00:19 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <167648401986.12560.9834857293407249431.git-patchwork-notify@kernel.org>
Date: Wed, 15 Feb 2023 18:00:19 +0000
References: <20230215061701.1433-1-frank.li@vivo.com>
In-Reply-To: <20230215061701.1433-1-frank.li@vivo.com>
To: Yangtao Li <frank.li@vivo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 15 Feb 2023 14:17:01 +0800 you
 wrote: > They are not used, let's remove them. > > Signed-off-by: Yangtao
 Li <frank.li@vivo.com> > --- > fs/f2fs/file.c | 16 ++++++++-------- > 1 file
 changed, 8 [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pSM4v-00078z-9S
Subject: Re: [f2fs-dev] [PATCH] f2fs: drop unnecessary arg for f2fs_ioc_*()
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

On Wed, 15 Feb 2023 14:17:01 +0800 you wrote:
> They are not used, let's remove them.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>  fs/f2fs/file.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)

Here is the summary with links:
  - [f2fs-dev] f2fs: drop unnecessary arg for f2fs_ioc_*()
    https://git.kernel.org/jaegeuk/f2fs/c/ddf1eca4fc5a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
