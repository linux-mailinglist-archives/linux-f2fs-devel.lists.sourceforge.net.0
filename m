Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDC3A2B162
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Feb 2025 19:40:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tg6nc-0005IP-MV;
	Thu, 06 Feb 2025 18:40:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1tg6nb-0005IG-0b
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Feb 2025 18:40:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T7aeeV+G0mQMbu9HKTP7nLn0oakjP8caq/L32Y0XX44=; b=Yf5pnxWO07uJNGr4Ik7KD1umjM
 bFD0XrQoHfIwlZCHIFVMs1bOX8D2dcmGGqMmjhJP+63IGjJHaDtmPD+7rIRq57v3IfjmGfFD/T7aC
 Nyqcyz2VhbkQxXdo6YJ+vMLzZ8Gj7rEUi6XAZLFHqFiIn90/+8oOzr5Z8nxZSgg2FB7c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T7aeeV+G0mQMbu9HKTP7nLn0oakjP8caq/L32Y0XX44=; b=MErOTcfFjz+0n8KrbscD5C9Uf5
 npwTNBCOy80de6sl/D7AXu+8TIQxxoYCna+dQIRDuc+A/voGXovk+xp+HMFMmU5dq6mVSUHNGrDrX
 WYOjqL3OSYeQH7S2+PZ9XgMd4sFa+UmffxMmzN61GASew3rJ0y385vZa76T3BEuhnGOc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tg6nb-0006Ku-5b for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Feb 2025 18:40:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 13BD95C6F5C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  6 Feb 2025 18:39:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83788C4CEE3;
 Thu,  6 Feb 2025 18:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738867216;
 bh=pVq4CMDAhc4V1jMrsbf17rYpj/pKJWdpelfy3IyvIGQ=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=G19p2HTZhpJLKtrPIgKSDBP7Lq+SyXJbaiiWtP6ILcdEmndkqAjMf9PzKSK1ZaOdC
 cafX91YZmpzFLTRpN/fXFDy/YnMTxNMbfCPCHxDEJi2qDdFLNxPo6NiAjetJeytHNE
 as95jdUAs2EzIKhZDsh4MUUHRTkWPzigb7YaUC8zWO/DhbX2DWH+Whm5ekK7X64Sdw
 +fnK4qMseghPE1O3wy0BNLoHPvAtOoTJdy2KiVcCCvqfZJWycDHd4mI6Qh8Q5cROIi
 ksWiZReUpPt3PBfb2/DpjCIjKQG3/2fifeJP2VPVO8Oj/37DaSv1njF0CkjqTfqo2l
 GHq/f4MhN+Lig==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 714C2380AADE; Thu,  6 Feb 2025 18:40:45 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <173886724400.1614734.1303529241100125768.git-patchwork-notify@kernel.org>
Date: Thu, 06 Feb 2025 18:40:44 +0000
References: <20250131222457.1634039-1-jaegeuk@kernel.org>
In-Reply-To: <20250131222457.1634039-1-jaegeuk@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Fri, 31 Jan 2025 22:24:56 +0000 you
 wrote: > Fix a wrong kobject_put in the error path. > > Signed-off-by: Jaegeuk
 Kim <jaegeuk@kernel.org> > --- > fs/f2fs/sysfs.c | 3 ++- > 1 file changed,
 2 inser [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tg6nb-0006Ku-5b
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: don't kobject_put in the error case
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri, 31 Jan 2025 22:24:56 +0000 you wrote:
> Fix a wrong kobject_put in the error path.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/sysfs.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Here is the summary with links:
  - [f2fs-dev,1/2] f2fs: don't kobject_put in the error case
    (no matching commit)
  - [f2fs-dev,2/2] f2fs: introduce f2fs_base_attr for global sysfs entries
    https://git.kernel.org/jaegeuk/f2fs/c/21925ede449e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
