Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A65EB813C02
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Dec 2023 21:50:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rDsfM-0000yc-1D;
	Thu, 14 Dec 2023 20:50:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1rDsfK-0000yS-T2
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Dec 2023 20:50:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5QzJUtwWt+UkfS+TN4sPl31IqalfPfTJxnKO3VYMOxg=; b=Ieq/egsunXWFDG+IRhOZCj/BPs
 2/+NXwsYZSMF9+loJvR3Pk7lU5bxOnCs4Lf85Rcvr76WACljlWQSatxSGdsnl2aXSr/4VE2FQnlom
 GnEtUbdSiQksrATQlPYj0iBAlW+yRa6QlGFZUY4FT4pM2TtX5Tgi/n+tIi48d/A8rUFs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5QzJUtwWt+UkfS+TN4sPl31IqalfPfTJxnKO3VYMOxg=; b=Z7/mYgUOT16ZwD44C9nclxGrW2
 wyxJUiWwCc/9utCJTKQO+v1ZOwvXklCAKJw30N57qrwsZPSbcn7piLA2cIJsGSdmggKkpGc/+qMLs
 cS2nj76OqlEznywRiUy/Ktl2jKfRWN0L/3X1MwrvbxHwAFexTonyUtKrFRfmI2XhI7oU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rDsfI-0000k2-70 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Dec 2023 20:50:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 28609623A7;
 Thu, 14 Dec 2023 20:50:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 23713C433C9;
 Thu, 14 Dec 2023 20:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702587032;
 bh=oqqO0nkKDRdMtOwZP+eVqIh58wtlWupnsscuz8xF/A4=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=oXA18eN1/hez8NFiRN18Zsc5dzffCUZMJ2ymNWxkk7JPiJhnsGABj3mUe20HDH67E
 6YVzQgjeIi7Og5P9O+phWcwE3rwKMfJbmfvrgtf/lGlS5ERy5WV9QLdeT4ZwnF0w9Z
 vugoEpGFWA/ORT8e//3F6TJn2Mxjcn+Mh5Sl1qxPge+b3VRWBStndOpyRCokDgdLyc
 KHQEH7cxRfJmbHG7gGyw4CIYwjOzUhWUAA60v0jSIpMima9P6ajKUSKMIkBX1OmBOB
 R6wWBEHppfwTFVueBL1wz7XXzUKdT4yB8xoKeYxvcKyMq3qij6U+32dMp6xDND3EiN
 YWphxmqKHOfyQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 06A1ADD4F00; Thu, 14 Dec 2023 20:50:32 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <170258703202.30587.16093975604922475515.git-patchwork-notify@kernel.org>
Date: Thu, 14 Dec 2023 20:50:32 +0000
References: <20231205023801.3669458-1-drosen@google.com>
In-Reply-To: <20231205023801.3669458-1-drosen@google.com>
To: Daniel Rosenberg <drosen@google.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 4 Dec 2023 18:38:01 -0800 you wrote:
 > Blocks are tracked by u32, so the max permitted filesize is > (U32_MAX
 + 1) * BLOCK_SIZE. Additionally, in order to support crypto > data unit sizes
 of 4 [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rDsfI-0000k2-70
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: Restrict max filesize for 16K f2fs
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
Cc: jaegeuk@kernel.org, kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon,  4 Dec 2023 18:38:01 -0800 you wrote:
> Blocks are tracked by u32, so the max permitted filesize is
> (U32_MAX + 1) * BLOCK_SIZE. Additionally, in order to support crypto
> data unit sizes of 4K with a 16K block with IV_INO_LBLK_{32,64}, we must
> further restrict max filesize to (U32_MAX + 1) * 4096. This does not
> affect 4K blocksize f2fs as the natural limit for files are well below
> that.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v3] f2fs: Restrict max filesize for 16K f2fs
    https://git.kernel.org/jaegeuk/f2fs/c/a6a010f5def5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
