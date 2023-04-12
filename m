Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C9B6DFB25
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Apr 2023 18:20:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pmdCx-0007lC-7H;
	Wed, 12 Apr 2023 16:20:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pmdCt-0007l5-2C
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Apr 2023 16:20:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/FXTyq0O0iFd8hqk452dS4N9DFTPCoPhazHnCC+8lXw=; b=l1VwvdSTfWR/Wh2mLzjKzS6EZZ
 iPJjFVvkiQUcgjl7sFg3Ll1hk4DSJBso1rocnpI2ixVcFu8WXC0Plm/CwW2ptdS83vQ5s5Ji4GuuS
 1PtBHBjbBEEzAUzF1vZCed50iioA3X/zmcHvYcfClO3xPJtKfRfdhyqGUJoV6qoffJmY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/FXTyq0O0iFd8hqk452dS4N9DFTPCoPhazHnCC+8lXw=; b=VM7J+KLoRKTmE4yOotrGvpiHhB
 y+oE2X91ruycubEbDPA9vPu80eg4cRRKmqkfDwrRMXokJVbNkpCxsXcCujhcH7Zn7K300/7m0/i9w
 WsYPYm8EJEXblYLJgaqbfPV/+FkyjnziNV+pPSm5sC0udRKglwEHSfyc7pPFTTiS4m8s=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pmdCr-0000VY-5w for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Apr 2023 16:20:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C00CC61182
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 12 Apr 2023 16:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 315B7C4339B;
 Wed, 12 Apr 2023 16:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681316419;
 bh=dD6JLHaY5QGrUy9uSU5rAL+T4OMswT/1bJQe6jI91Pw=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=BplGQgkC6NIBwqKcDa9PYMQuw1KC/Pph0eCWuCRWmDUgQ7Vifipe4ygmb1gw4G7js
 3NUYkD7DvHDXqgxPIaBvaSZs5/pwMjmiMHM7YbxaRTFHvAoTkMfr2gV/dLaEmCl/u9
 hk1arFk1WeWJ84wGwOXu9P85ZaIO6kBtNguYl2x1hCxm6jmRmxyRhKf/K2ViGkBtJI
 ezWk8KWiJsB4J8HvYY70kJKcKxXbmuyxwHxb85cXgBVskizEnjsTbMT445gryxpXRz
 mxcd0kzwrQ2X5PfGU5eCp7bzluy8QJU6hgk0epCpXNev0U0MRFbQu/hzvx3pDUWZLT
 R/KQRw0NQFbnw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 0CC1EE5244F; Wed, 12 Apr 2023 16:20:19 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <168131641904.15557.7224086713255348466.git-patchwork-notify@kernel.org>
Date: Wed, 12 Apr 2023 16:20:19 +0000
References: <20230402112706.42211-1-chao@kernel.org>
In-Reply-To: <20230402112706.42211-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Sun, 2 Apr 2023 19:27:06 +0800 you wrote:
 > With -O quota mkfs option, xfstests generic/417 fails due to fsck detects
 > data corruption on quota inodes. > > [ASSERT] (fsck_chk_quota_files:2051)
 --> [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pmdCr-0000VY-5w
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to recover quota data correctly
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

On Sun,  2 Apr 2023 19:27:06 +0800 you wrote:
> With -O quota mkfs option, xfstests generic/417 fails due to fsck detects
> data corruption on quota inodes.
> 
> [ASSERT] (fsck_chk_quota_files:2051)  --> Quota file is missing or invalid quota file content found.
> 
> The root cause is there is a hole f2fs doesn't hold quota inodes,
> so all recovered quota data will be dropped due to SBI_POR_DOING
> flag was set.
> - f2fs_fill_super
>  - f2fs_recover_orphan_inodes
>   - f2fs_enable_quota_files
>   - f2fs_quota_off_umount
> <--- quota inodes were dropped --->
>  - f2fs_recover_fsync_data
>   - f2fs_enable_quota_files
>   - f2fs_quota_off_umount
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix to recover quota data correctly
    https://git.kernel.org/jaegeuk/f2fs/c/cbb356d60c54

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
