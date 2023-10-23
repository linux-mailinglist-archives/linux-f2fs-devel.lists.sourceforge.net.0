Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 705617D3AC7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Oct 2023 17:30:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1quwt4-0002fu-RY;
	Mon, 23 Oct 2023 15:30:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1quwsy-0002fl-NU
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Oct 2023 15:30:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CDhGyy2e+cWcjQktptPUmkTthj6cqHmTAYrKF17kAQM=; b=alQ/i4c7nVWJbQqXjbE1LgAvDH
 HskJa2tuqNbS1SToynxEhLF/pRPD+OuzdL9IoBTJqqeZr2/3y8+J8TGDHEIgXBGiGa4r5+j+vXmov
 YG5Q+qodibmJeEH0+5SKdzRyiHHYZuhvecEXrh7tHgLqScPldoPQGMM8CAWCQfrWd60s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CDhGyy2e+cWcjQktptPUmkTthj6cqHmTAYrKF17kAQM=; b=CNXZYPztBLuCRdjpHl0eOP77pI
 hZa267Cpc4SsMYt9WzrFZ8TEO5MVSk8oLZCW3R8eF6XfqTQpnjmsQiBjPQX3v+F1zNxfN2x0UcytC
 uxVLqniJANx/GNGtExnWQ3OCLl1f4zB9OHZ5R0ZvsQmMjRdr8NqK42UzoZWu7dw80xB4=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1quwsy-0002HU-0T for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Oct 2023 15:30:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id BE320B81E0A;
 Mon, 23 Oct 2023 15:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1A375C433C7;
 Mon, 23 Oct 2023 15:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698075025;
 bh=V7CY16dZcqj1cI8ePj7b2E7EEEYuy7K8Hf/oHcEVGRI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=PFh1xyb5FicPOqrPCP+Pl3CeBIYQfVbiBUQClV1JDiHesbOl/R/VwGH84uuMGRGZy
 /YpvV2Un/hFkqHyfLcyJB0FRgrCur409DA3w+X3sqhp1a6bHKYjT4MeKGr7KSSHRBM
 SW6GjwtiQZ1SC14MWItdNVHTbOzC7OS8IAyVYRDuEJXaGX/ssi+wWlWT2SPZHtae4i
 wZOABadTP16BxNE17Udanta3OvM2E7Y1XO7wMU9yM35uZAs5ywtQ3Y4ydInjBtmXc2
 +jD+8FWEbPVd9esQkfwXB+0E9QHsU7SClYEULYhsfTHxN5GR8hrE31RL5Loj4vXukl
 5wOKabgxDxP7g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 F2EE4E4CC11; Mon, 23 Oct 2023 15:30:24 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <169807502498.26537.15785065563477697728.git-patchwork-notify@kernel.org>
Date: Mon, 23 Oct 2023 15:30:24 +0000
References: <1697455651-11124-1-git-send-email-zhiguo.niu@unisoc.com>
In-Reply-To: <1697455651-11124-1-git-send-email-zhiguo.niu@unisoc.com>
To: Zhiguo Niu <zhiguo.niu@unisoc.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 16 Oct 2023 19:27:31 +0800 you
 wrote: > If NAT is corrupted, let scan_nat_page() return EFSCORRUPTED, so
 that, > caller can set SBI_NEED_FSCK flag into checkpoint for later repair
 by > fsck. > [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1quwsy-0002HU-0T
Subject: Re: [f2fs-dev] [PATCH V2] f2fs: fix error path of
 __f2fs_build_free_nids
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
Cc: jaegeuk@kernel.org, niuzhiguo84@gmail.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 16 Oct 2023 19:27:31 +0800 you wrote:
> If NAT is corrupted, let scan_nat_page() return EFSCORRUPTED, so that,
> caller can set SBI_NEED_FSCK flag into checkpoint for later repair by
> fsck.
> 
> Also, this patch introduces a new fscorrupted error flag, and in above
> scenario, it will persist the error flag into superblock synchronously
> to avoid it has no luck to trigger a checkpoint to record SBI_NEED_FSCK
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,V2] f2fs: fix error path of __f2fs_build_free_nids
    https://git.kernel.org/jaegeuk/f2fs/c/a5e80e18f268

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
