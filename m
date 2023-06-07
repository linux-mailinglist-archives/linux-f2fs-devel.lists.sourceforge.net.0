Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B6E726756
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Jun 2023 19:30:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q6wzQ-0000RO-0D;
	Wed, 07 Jun 2023 17:30:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1q6wzP-0000RH-35
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jun 2023 17:30:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3l9BAB0RpRyc51f36wJTHJ5qug4Zex49rbXvz/nzH6A=; b=XQNX3bRvC3RfmGIAOQ+iumsl7K
 7GnRdrTlsuKOBNLFAaRdj4vVcNoaA2as3qXoIaW90pJKcbmxavcT0Zk6HJqqHoQAyj3Fw85hKHIaU
 n1htWAS2nLu5uGp0kE8i3RCgR5ZuDkO6EWDUDKbh/ccvUrVr8gWlqdkH0L/R/Ze7+vFg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3l9BAB0RpRyc51f36wJTHJ5qug4Zex49rbXvz/nzH6A=; b=aODFgELgXenUzsdlBzTy7MWTK2
 2UrmpcsS/ichqQ90rXVktKBEV9CSM68u54koVKvC9X83o7OhhGEYgPMrvkf5ChdqgFfYPbnA8dttP
 PUN/KA7nlK7WT3sSHuJWioZp/dOGG+bIeXv/bwOJnryw5vJw2zJ+9EmHSauRCOHv8N/k=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q6wzP-0007mV-AW for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jun 2023 17:30:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E0F3864200
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  7 Jun 2023 17:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4F66FC433EF;
 Wed,  7 Jun 2023 17:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686159025;
 bh=rMJ3ZHFNgdmlUuFM0xas0L1YWaRZl3xS0/0vxWWbySo=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=a2SiPzTR8J6pyrOsbeOb69AYtOBZmdC0ghJT8cV6J2ILLBxbTxW/qb7N5euoDTGQm
 Z9b6877HcuZCQBmtOwc5JSlt+iznnLD8XhQVTgXDgZrDQlDSkXOHQBX0fyqcuH8Gdl
 hnPonUmxhxXtTcRQ7lp0ev0lAW/+0/9HrijJnWU4BTmGMNzamvvr3Q0nfcWOW9wbqb
 fLkjJpYtveFZjYRlmfPCoUwZWaxccxkBU2FALAVNP+VurWZcv1TKButLIOdNwpUgSK
 C5fyYBEMMmtP/PtPSWSWg7NC55FqxyCSKREQC+jwMgnoQh+dGfH5Fty5a2IzUPCnLB
 ok7KLYWvaL3Qg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 24B87E4D016; Wed,  7 Jun 2023 17:30:25 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <168615902514.7521.467509343163618820.git-patchwork-notify@kernel.org>
Date: Wed, 07 Jun 2023 17:30:25 +0000
References: <20230531014055.3904072-1-chao@kernel.org>
In-Reply-To: <20230531014055.3904072-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 31 May 2023 09:40:55 +0800 you
 wrote: > There are several issues in sanity_check_inode(): > - The code looks
 not clean, it checks extra_attr related condition > dispersively. > - It
 missed to [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q6wzP-0007mV-AW
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: do more sanity check on inode
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

On Wed, 31 May 2023 09:40:55 +0800 you wrote:
> There are several issues in sanity_check_inode():
> - The code looks not clean, it checks extra_attr related condition
> dispersively.
> - It missed to check i_extra_isize w/ lower boundary
> - It missed to check feature dependency: prjquota, inode_chksum,
> inode_crtime, compression features rely on extra_attr feature.
> - It's not necessary to check i_extra_isize due to it will only
> be assigned to non-zero value if f2fs_has_extra_attr() is true
> in do_read_inode().
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: do more sanity check on inode
    https://git.kernel.org/jaegeuk/f2fs/c/3ef38938753c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
