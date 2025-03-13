Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE8EA5FF18
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 13 Mar 2025 19:20:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tsnA6-0000cE-MQ;
	Thu, 13 Mar 2025 18:20:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1tsnA5-0000c4-H6
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Mar 2025 18:20:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PN3e7hhG2JOKmnNQbz9O/WFmhX7q7YAiyFI6ao561rY=; b=hcZD71R/UxxQo4/hPizh2hJhnk
 2H+kZHXemyHpN35+DzkEDk98TjLBs9BiIDoTZ0Xou0+OEZO87MYrQXF8CS3/E8DtYg5wOrwWqrjC1
 ns8TrBDTlVkbp5yPLqjFVbluYsPY7P1y/Xt9elErg8FAabmPVzpMCfwt5nhoDnF1SrRM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PN3e7hhG2JOKmnNQbz9O/WFmhX7q7YAiyFI6ao561rY=; b=YCZQNi8ntKJ1oKU41bm5l2e7az
 VLELnmTO/QipBroR5OJGPKlVOMHGPEoeyK7vB/8o00pLyETTMn4htdG8WhP3O7FH/gwblbb2g2l5n
 lZ4HUe1zEmPHcEm4UiQyRLwXhE6A6Il13Ys6YalHpTO33ZiZae7PwPLhK6BdCopdQs0E=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tsnA5-0004QA-Kd for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Mar 2025 18:20:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 798B85C3549;
 Thu, 13 Mar 2025 18:17:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7BAEC4CEDD;
 Thu, 13 Mar 2025 18:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741890000;
 bh=JcZSXIOAHPgvBQ2KGu8M0cJY4B1MRK5/h3YqAHvaW74=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=n+KUPPqnLvxYNZLbEnW25rEM9ZgL6wrt07I4zgnPtrfZTG/3W60vtF+VoXAQ7dncs
 6KGBmFL358sZ0Et2tXVZpX8iwRb1dcqzBJD5qCKy4uR2xlnAUkjO3XcZkhpoZ/Yhpq
 nR3skKOpZw6gpkl66QF/MkXRontwSwU+0DBZZp+iXvRySBU8lqLt1HmQ80lztZ1/Af
 bw+5FfS/OV5+X7qoxvWWvQhWZkZxT1y1tP78h05T9jW2Q2GiduaORdbpSO21uLWGcw
 gCyOso45KKmXquJhM3bZZ836IiYtiZLMjDrgdoNwooTCMt16xNZje1voGmlxsKPdK0
 0hDhJIbV4BDrg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADC303806651; Thu, 13 Mar 2025 18:20:35 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <174189003450.1620163.5293489407347859969.git-patchwork-notify@kernel.org>
Date: Thu, 13 Mar 2025 18:20:34 +0000
References: <20250303172127.298602-1-sandeen@redhat.com>
In-Reply-To: <20250303172127.298602-1-sandeen@redhat.com>
To: Eric Sandeen <sandeen@redhat.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 3 Mar 2025 11:12:10 -0600 you wrote:
 > I have been struggling to get to a good series to convert f2fs to the >
 new mount API. f2fs is more complex, because much of the option parsing >
 assumes [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tsnA5-0004QA-Kd
Subject: Re: [f2fs-dev] [PATCH 0/9] f2fs: first steps towards mount API
 conversion
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
Cc: jaegeuk@kernel.org, lihongbo22@huawei.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon,  3 Mar 2025 11:12:10 -0600 you wrote:
> I have been struggling to get to a good series to convert f2fs to the
> new mount API. f2fs is more complex, because much of the option parsing
> assumes that the superblock has already been read from disk, and uses
> that to test various on-disk features, etc. All of those tests will need
> to be moved to after parsing is complete, and this series is just a
> start.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,1/9] f2fs: use f2fs_sb_has_device_alias during option parsing
    https://git.kernel.org/jaegeuk/f2fs/c/64ee7503cbf6
  - [f2fs-dev,2/9] f2fs: consolidate unsupported option handling errors
    https://git.kernel.org/jaegeuk/f2fs/c/277352b6cbed
  - [f2fs-dev,3/9] f2fs: factor out an f2fs_default_check function
    https://git.kernel.org/jaegeuk/f2fs/c/abd0e040e9a5
  - [f2fs-dev,4/9] f2fs: make INLINECRYPT a mount option flag
    (no matching commit)
  - [f2fs-dev,5/9] f2fs: make LAZYTIME a mount option flag
    (no matching commit)
  - [f2fs-dev,6/9] f2fs: Pass sbi rather than sb to f2fs_set_test_dummy_encryption
    https://git.kernel.org/jaegeuk/f2fs/c/0edcb2197e76
  - [f2fs-dev,7/9] f2fs: defer readonly check vs norecovery
    https://git.kernel.org/jaegeuk/f2fs/c/9cca49875997
  - [f2fs-dev,8/9] f2fs: pass sbi rather than sb to quota qf_name helpers
    https://git.kernel.org/jaegeuk/f2fs/c/b7de231b9df4
  - [f2fs-dev,9/9] f2fs: pass sbi rather than sb to parse_options()
    https://git.kernel.org/jaegeuk/f2fs/c/71e9bd3d5c04

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
