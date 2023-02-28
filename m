Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E27D6A5063
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 28 Feb 2023 02:02:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pWoNd-0004tJ-H2;
	Tue, 28 Feb 2023 01:02:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pWoNa-0004t0-AC
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Feb 2023 01:02:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pVqm6lsoLOG1AQZgUMtyKG6vnxakPcUI0ApRvinYxvg=; b=W2LWwQMI2IqMMictUCYHp61DiD
 7Ah6lVU8s4QBUIo+KxpUxXltDAHEL5aw4tkhuajyqn7cbB7rViG4mHBKZjPfGVotCTRpS2FGPwFjQ
 vfBEzkZubUqoJ+Nuwja/ekSEQ9A0TMEnOl+6eT2lmlBATdDBfPzM+EL00hl9I0pywUro=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pVqm6lsoLOG1AQZgUMtyKG6vnxakPcUI0ApRvinYxvg=; b=NzEyNziKU8zoQ5skAQ6ND3h/k6
 7FU0OPFu9vE5cHNVDN+T5zNXTQ9MaCJ3FQlY1VIz4jZ6uCDdV011N/CyaTGWJVIG6POnv5vrMtu9W
 BdrgY4CeMEvTN22pboTnGQ6k4osPHYiq2aHVsOItbYPQRKiDsC798XBkmhF6+JSiMkUg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pWoNU-0001fO-RV for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Feb 2023 01:02:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3F54860F82
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 28 Feb 2023 01:01:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3CFB1C433A1;
 Tue, 28 Feb 2023 01:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677546115;
 bh=EkQcNS9ff+s73/ftmm+esj3kNcGvM+iC7iMN8fE5iBM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=MLg4vfi/I+uvxuMwP620rcv1pbGUJ6mV1XVBXK9Np1oCy6z7cZcB/ZqVzikOZNK2K
 /vYd2S4lZjCqj6TJRc7qvJhBTuxI5Goh6YntGHn0kCKqlVsZnean1Q1wWELql6Zy7i
 IQjumfC8dwyXHW92IDIGlMkIVJ7sszKBJEQLyo9MbT4BxS3jJzI7Q3uBnTUb8NRORk
 8Fgse5NOIExS22jJkbafSXkEGbE6foMx/WNytDQSR43bVaLB5KmmIEjuiZdYeGSfNq
 eo8nGVLSQZFp4kZuvP+YOKUkKT3cubSpl/q48qJy4AmsyrwufC7AV6VAkVU6sPw1dk
 3yfVPORjIE7/Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 1B67FE68D2D; Tue, 28 Feb 2023 01:01:55 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <167754611510.27916.9240415450147336075.git-patchwork-notify@kernel.org>
Date: Tue, 28 Feb 2023 01:01:55 +0000
References: <20230116232257.64377-1-ebiggers@kernel.org>
In-Reply-To: <20230116232257.64377-1-ebiggers@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Eric Biggers <ebiggers@google.com>: On Mon, 16 Jan 2023 15:22:57 -0800 you
 wrote: > From: Eric Biggers <ebiggers@google.com> > > We're moving fsverity
 development to use its own git repo, mailing list, > and patchwork project,
 instead o [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pWoNU-0001fO-RV
Subject: Re: [f2fs-dev] [PATCH] MAINTAINERS: update fsverity git repo, list,
 and patchwork
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
Cc: fsverity@lists.linux.dev, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Eric Biggers <ebiggers@google.com>:

On Mon, 16 Jan 2023 15:22:57 -0800 you wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> We're moving fsverity development to use its own git repo, mailing list,
> and patchwork project, instead of reusing the fscrypt ones.  Update the
> MAINTAINERS file accordingly.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] MAINTAINERS: update fsverity git repo, list, and patchwork
    https://git.kernel.org/jaegeuk/f2fs/c/ef7592e466ef

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
