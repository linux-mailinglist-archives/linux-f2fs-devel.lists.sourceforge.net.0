Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D64C0696C77
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Feb 2023 19:10:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pRzlI-0000Ja-Jo;
	Tue, 14 Feb 2023 18:10:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pRzlG-0000JT-0G
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Feb 2023 18:10:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZVCzItmjb1y+W6NM7bT6RuoPJ3yZhc9kFEwDV4i/ago=; b=BdVPImMEGASOMcy3sOwUtAO6Fb
 YHhHsZLRseOg3iCCq2dp/iAAFywmfohbSAfV6delS/oKdjC0WE8RsFtNC6kZkTu7QfQfTYrkUWCYH
 fucRbOjstxKnbsQ/E0dfBxVitWwC9fMJEH+zKhPoH9P1Sg7FQCopDwGRqFQTNVk1PvfE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZVCzItmjb1y+W6NM7bT6RuoPJ3yZhc9kFEwDV4i/ago=; b=HXKw7sz9Q/hXjJaurUZKnPiJ1r
 nBJ20Ngn0J4LaaJoZc000HTmXtzEssTol8X0mcngQdsqaUeJp+sa82cGxBmjfxjAj16Mr73FkgapH
 4cAfOoM7nFZsbJmkMI42LfjwCmM6JP9O6geVfzb/efA2UyoHZ0pdT9KpWy3KzyreTvT0=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pRzlD-0001LO-Gx for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Feb 2023 18:10:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 07AC9B81EB6;
 Tue, 14 Feb 2023 18:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 76D66C433EF;
 Tue, 14 Feb 2023 18:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676398228;
 bh=hjZ67XNKi/w+9jxZRZs54E81083oaVh693j/6bpGlMc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=FAU0YGBpbga5nkL/MO8SQMnRjVQALM9zhJTZ4lYTLzzINdtFcn/KUe08+IBPVktG5
 A7ELJM9YvXyMG11Aqo4UkqNE+zUefX7+uLZpdrknXaYWDKjV1TF9btjfIMQ60mCr3/
 3ocPz1mE9Pm1AjgJpkztqtawXIF+slfZRhVilG4MaWP+8mNG5ZULANvJ4CEL3H4uRb
 1VaQhBqrBrYmSKaZ0+yk6fZwouI9mmCAk6hhC3eXPnePTQUSggb2H8rbxQyn0oa6Mi
 Tp30bg+x4ij1IlCuLqXw13Cxk2HdWVg8x/8ltsFY/63ix5uyOAL/j4l4o85netX54s
 DEVU94fra1oFQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 5A9BFE68D35; Tue, 14 Feb 2023 18:10:28 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <167639822836.3874.17414617616074524611.git-patchwork-notify@kernel.org>
Date: Tue, 14 Feb 2023 18:10:28 +0000
References: <20230209181819.2333522-1-daeho43@gmail.com>
In-Reply-To: <20230209181819.2333522-1-daeho43@gmail.com>
To: Daeho Jeong <daeho43@gmail.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Thu, 9 Feb 2023 10:18:19 -0800 you wrote:
 > From: Daeho Jeong <daehojeong@google.com> > > To fix a race condition
 between
 atomic write aborts, I use the inode > lock and make COW inode to be re-usa
 [...] Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pRzlD-0001LO-Gx
Subject: Re: [f2fs-dev] [PATCH] f2fs: synchronize atomic write aborts
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
Cc: daehojeong@google.com, kernel-team@android.com,
 linux-kernel@vger.kernel.org,
 syzbot+823000d23b3400619f7c@syzkaller.appspotmail.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Thu,  9 Feb 2023 10:18:19 -0800 you wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> To fix a race condition between atomic write aborts, I use the inode
> lock and make COW inode to be re-usable thoroughout the whole
> atomic file inode lifetime.
> 
> Reported-by: syzbot+823000d23b3400619f7c@syzkaller.appspotmail.com
> Fixes: 3db1de0e582c ("f2fs: change the current atomic write way")
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: synchronize atomic write aborts
    https://git.kernel.org/jaegeuk/f2fs/c/a46bebd502fe

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
