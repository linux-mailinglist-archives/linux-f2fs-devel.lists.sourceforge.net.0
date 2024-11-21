Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B34A9D5098
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 Nov 2024 17:21:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tE9vH-00056E-1v;
	Thu, 21 Nov 2024 16:20:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1tE9v1-00055n-4a
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 Nov 2024 16:20:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F69dPqVihkEhukH+jhXCS1titaBePWikQd9qPzC55aM=; b=Yat5aKy/AW3LDqc6t4IHthPukf
 V4rLS+gq+OJAzwJQyVjcSIAmhAnjaPdeCqxjr8CYIMWpo1tdxDxpHB/BcQ+mKHlGpHT0fPfzw8TkK
 SahhWGKoOa8DW6wp8koj1TUkjbX/Nq16NMDy2kvReJKQuRLaq72pCEmzE43GhqEayYII=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F69dPqVihkEhukH+jhXCS1titaBePWikQd9qPzC55aM=; b=bC82qmK+ZlQhliB2XlHCoAXD2z
 edyF88JNE4P1DHMZXef/4M0dkCvzbnH37YmywBNQATuNDcMROfu/935QgIGrUCIxRV15y0hM4qKcc
 pi2qTEsiG/F9iOTa0f15712X17GQS+CpFlLEkjv81oppEQ6BNYhnmnHr+Dg8GUU8exoo=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tE9v0-0003PS-Ha for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 Nov 2024 16:20:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8C4C8A40B88;
 Thu, 21 Nov 2024 16:18:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82259C4CECD;
 Thu, 21 Nov 2024 16:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732206023;
 bh=RGARQvB2BI7CSMbr1w+xiIywJu8/CNafzE06Oc++Uis=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=LQXPgOPSSJnZlW1PMrEG5sc+WXFNSTb7KD/V6aPfk/HcQMHpWwROh5hQjIsYnBEbW
 bTRVAZK0W7JI0rABvVEHhjfZTSjmFLUJP9C65zgq1fc4Hrrt8AHZyUNv3uaw2TbRz/
 DMfhLf/526gWjsnDPjXZyYAh5njkErVi8KtBfWtwVEqKiwArO6iUQRcJ5n9GO0JSyL
 IvlXMLP1MIlEmkz7PtlVhuQ/g7GGgnhTJnMY82qchY11Q8KmzEoWpHuAV1aLxu+hOr
 zYjHc4CJaduLMQuARR3i5F/mnZXyrqCZndDq6Xkpk7M/3ovAn2KUL6gGuuEz7RcnM3
 cXXDrEkqbE4BQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADD063809A00; Thu, 21 Nov 2024 16:20:36 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <173220603549.1977996.14578612741483518273.git-patchwork-notify@kernel.org>
Date: Thu, 21 Nov 2024 16:20:35 +0000
References: <20241107014602.3638020-1-chao@kernel.org>
In-Reply-To: <20241107014602.3638020-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Thu, 7 Nov 2024 09:46:02 +0800 you wrote:
 > f2fs doesn't support different blksize in one instance, so > bytes_to_blks()
 and blks_to_bytes() are equal to F2FS_BYTES_TO_BLK > and F2FS_BLK_TO_BYTES,
 [...] Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tE9v0-0003PS-Ha
Subject: Re: [f2fs-dev] [PATCH] f2fs: clean up w/ F2FS_{BLK_TO_BYTES,
 BTYES_TO_BLK}
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
Cc: jaegeuk@kernel.org, zhiguo.niu@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Thu,  7 Nov 2024 09:46:02 +0800 you wrote:
> f2fs doesn't support different blksize in one instance, so
> bytes_to_blks() and blks_to_bytes() are equal to F2FS_BYTES_TO_BLK
> and F2FS_BLK_TO_BYTES, let's use F2FS_BYTES_TO_BLK/F2FS_BLK_TO_BYTES
> instead for cleanup.
> 
> Reported-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> Signed-off-by: Chao Yu <chao@kernel.org>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: clean up w/ F2FS_{BLK_TO_BYTES, BTYES_TO_BLK}
    https://git.kernel.org/jaegeuk/f2fs/c/7461f3709418

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
