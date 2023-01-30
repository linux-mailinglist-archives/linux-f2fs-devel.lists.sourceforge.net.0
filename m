Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C82681F3D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 31 Jan 2023 00:00:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pMd8c-0003eS-OM;
	Mon, 30 Jan 2023 23:00:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pMd8X-0003dD-83
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Jan 2023 23:00:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HDrGLyzwMZZPbQIKgqtQdfMLBicLJofLF405tYT6AsA=; b=We6zgbOQrpoU7qaXjfkW3F2cg6
 XTqJ4AeOrPCKdPXszbaKFhw/f+boLs47xOyNg6bJWCaoZ2NYkEP/tyXplAvhxTS8OCDBYkEawlu1f
 jR2w3hOmPH/Hie921l58ri1TMWD4qDbCv56z4r0IW3rFSIqQaO6/Fc29lQ5/Qdboh29A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HDrGLyzwMZZPbQIKgqtQdfMLBicLJofLF405tYT6AsA=; b=OmsUx60SEYnMRnJ7hxTKykE7yE
 MAgLsY6WKZBkQQ5EGYEnDz4Co3fPfbaZhaxvbt7o+51cUSfwofhw4l5cwlQPZu1f0bihrO2LIaYvx
 1LICPmC5cLBQnre8NYj6WiVwr4+7nc6Z8YTKi7EYqVzYaV6qhAA5z11Sq1Lei1nJeZlo=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pMd8T-0002fX-2r for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Jan 2023 23:00:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 96E8DB8172A;
 Mon, 30 Jan 2023 23:00:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5B713C43322;
 Mon, 30 Jan 2023 23:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675119618;
 bh=CvyZvy72JS05eTOox+biJHstIc1DNDyVc51Ujeo7+YY=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=oVgV5zFQpAC8umAvI8t83n06fWRTtoDE7MY8Mrjyr56VspToDBFJ7kWv9hzNHHxb3
 KswI6B3u4CzWPZcrHRXPCsFkA98UeWWcg2gLPBtaH1ItkXSPj2KtAaAUbbpcnaI5yX
 HQw436Gcmu6vThcrrHXjTx62JoAb0Ark2dl+/7WQP+vH679w7+Y7CgX9iqcBq8M90n
 wMXyyQUa1MSBUeUVnGf0QwCnBuyV3hkRH5Oudkhme/ipi4mRK87CBgYXv3mumeLv3t
 QH26Wl6feF8QQwirGjzR98hiY0CRJg+X1vO1DQ0KPZac5SLuk1D3OmNjIh9zg0278v
 DtaEg4LEgQdhg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 0A5F4E5255F; Mon, 30 Jan 2023 23:00:18 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <167511961803.12751.4198234903796122252.git-patchwork-notify@kernel.org>
Date: Mon, 30 Jan 2023 23:00:18 +0000
References: <20230112133443.16713-1-frank.li@vivo.com>
In-Reply-To: <20230112133443.16713-1-frank.li@vivo.com>
To: Yangtao Li <frank.li@vivo.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Thu, 12 Jan 2023 21:34:43 +0800 you
 wrote: > commit 3fde13f817e2 ("f2fs: compress: support compress level")
 introduce
 > compress level, which macro(COMPRESS_LEVEL_OFFSET) is 8, But use wrong
 > comm [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pMd8T-0002fX-2r
Subject: Re: [f2fs-dev] [PATCH 1/3] f2fs: clarify compress level bit offset
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

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Thu, 12 Jan 2023 21:34:43 +0800 you wrote:
> commit 3fde13f817e2 ("f2fs: compress: support compress level") introduce
> compress level, which macro(COMPRESS_LEVEL_OFFSET) is 8, But use wrong
> comment about compress level.
> 
> Let's fix it.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,1/3] f2fs: clarify compress level bit offset
    https://git.kernel.org/jaegeuk/f2fs/c/9adc6c8ff3da
  - [f2fs-dev,2/3] f2fs: add F2FS_IOC_SET_COMPRESS_OPTION_V2 ioctl
    (no matching commit)
  - [f2fs-dev,3/3] f2fs: add F2FS_IOC_GET_COMPRESS_OPTION_V2 ioctl
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
