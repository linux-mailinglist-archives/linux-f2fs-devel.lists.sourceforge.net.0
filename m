Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C826F6DE1BE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Apr 2023 19:00:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pmHMA-0001Td-FT;
	Tue, 11 Apr 2023 17:00:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pmHM9-0001TT-9B
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Apr 2023 17:00:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aW859DCfoYS+d5rL2kidvfZ8km93855tE23/B2Ct6mM=; b=JUhNlJERlu1UqrQn1eiUQ8JvUk
 s8jczt5xcKZ06ae7Zrwv1ZUvGimtrGqh9Hf0fti7xbkbUsjtOxi0pLYyRDFr3vEgQpGbM+jPNxT73
 9+GozUCcEOFJls+M46FFbVf+BiM/W+DTrlXTB5OXvEj9o7ex/mA9pdCpkaGdezyv7oBs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aW859DCfoYS+d5rL2kidvfZ8km93855tE23/B2Ct6mM=; b=GVJ9w02sa/PdyhAlxTtxdHGCpO
 BX3SNVAqncV7BfOLXVLJ9w8/9Y6BA1jVndaKdSUKApG7cXTR2ZJo+ulSnzJ0pxIZnhUYmrXWgNCLp
 aMLyZTgr7JpiarjKvrA8K5Z+Sen0wy/sm3uUXMJBdXs9+H4WERtAGV22L51cshahS3NM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pmHM7-004G7K-S8 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Apr 2023 17:00:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 96170629B7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 11 Apr 2023 17:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 19A7AC433AA;
 Tue, 11 Apr 2023 17:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681232420;
 bh=PMmdMCO12455MMTWEUxUMZXQatPGCk8YW8205G5rdHQ=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=SS7AZRGyWPIlQtBOj1GcVzY9XIxET3EWytGmhLpRTl9QX07zkq+rwn4xWf/MhBZ92
 zjXmdbc3FudP4ciEjYVwKSyUGay4UMSG8JO2G6RbRb3KdYmwFrbSfqknuLanm+wIPJ
 p/SQQm1irlz4DphNwif4LATHKRRXv51HBIgohXl5r/4hTAYifeqOGwAhrQi/1u8tCk
 chQVqCliUF8qbIhNNGeo0xLfNUX5cEEiIfV+c11EA31ACWnb3DKF2esvPWM4tXLio+
 0U5wZoXW4xbBjso827hVwQfZQQfwLyQk8LQ38aKFuhiqv8dvdy+1RF1zXcqYJ+C9fP
 QcXQeA4Nyv0jw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 E84D7E52445; Tue, 11 Apr 2023 17:00:19 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <168123241994.4928.5946573581439812528.git-patchwork-notify@kernel.org>
Date: Tue, 11 Apr 2023 17:00:19 +0000
References: <20230410021140.1825781-1-chao@kernel.org>
In-Reply-To: <20230410021140.1825781-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 10 Apr 2023 10:11:40 +0800 you
 wrote: > i_gc_rwsem[WRITE] and i_gc_rwsem[READ] lock order is reversed > in
 gc_data_segment() and f2fs_dio_write_iter(), fix to keep > consistent lock
 order as b [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pmHM7-004G7K-S8
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to keep consistent i_gc_rwsem lock
 order
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

On Mon, 10 Apr 2023 10:11:40 +0800 you wrote:
> i_gc_rwsem[WRITE] and i_gc_rwsem[READ] lock order is reversed
> in gc_data_segment() and f2fs_dio_write_iter(), fix to keep
> consistent lock order as below:
> 1. lock i_gc_rwsem[WRITE]
> 2. lock i_gc_rwsem[READ]
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix to keep consistent i_gc_rwsem lock order
    https://git.kernel.org/jaegeuk/f2fs/c/db141b729bcc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
