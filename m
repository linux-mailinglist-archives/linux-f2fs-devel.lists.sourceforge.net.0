Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 480D7813C04
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Dec 2023 21:50:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rDsfS-00055F-0j;
	Thu, 14 Dec 2023 20:50:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1rDsfQ-000556-8V
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Dec 2023 20:50:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/bnSx2J+vyas0di0BtcF3IXIqWWYcifpL2XUKfEky/g=; b=D6oMfsrdVYB4vQrhS3O0HnpKr4
 pIKebRXTSRtail/PR8JXzShAFsOPXPY2dCVVfoSj9Q1x6O3NJ7oEHY+zv2k/rjMVVgaogGH9BOI+E
 cIu7RyBPkwtuisUvaZlEVgxPqNKil4uODJ/8Zsfc6/HWq0hc0kztABC4lj/Vpv7nBu8M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/bnSx2J+vyas0di0BtcF3IXIqWWYcifpL2XUKfEky/g=; b=TKeJpuNCdcVAur3VaGTPssbyMK
 ez6iCpD7cVaxGduC8zIOOME6uMXU4ujvIbdDsf2W+EyokyQJrH+PP+QD62XTKJGsC5EJk1FNDuYYG
 RYK2F+jTKRAG09SDNW/iOdG3QF46NrOuxstdVK4GGZMTtci4J13DeFTHCiqha+kvfP5I=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rDsfN-0000kK-8z for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Dec 2023 20:50:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D2C55CE248E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 14 Dec 2023 20:50:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 19FA0C433C8;
 Thu, 14 Dec 2023 20:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702587032;
 bh=exGfzJaHVz5AxP1KE0el+gwRexf5RDQkGq9tiG97kEk=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=kcV9ytAKzZeSCYwzRVXCRbTdVnoWKm3JdfZKpe+U4L5mni8X+5gr/CBFLvJ5l0h4N
 O+EUjWCGU2eCUAOdaV5hEqg3NfdYk6Vj/4SatHRbVnDSKu0eXKJ7vV1OtEghtv8I8a
 OYoYHfoLjaZUGbWOtKVkHvwrIx034wZV+ed/XJZe/sSB5w8qATavpgMZOeiP6qpQyP
 zVZwUYtWQTK+3ZDFEIayGLErHxRFGsU+GuQgtBxyBIwmiWVP0fMwO0BaqSPvHAffhv
 4eUDLMpMmi01gki00AKqOy6ar5+JHPeURp/IW6FZb3NjCapDtdh8EnIdsGUUBcnshL
 2o0kOl8O18fvw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 E90E0DD4EFD; Thu, 14 Dec 2023 20:50:31 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <170258703195.30587.3513758411413071845.git-patchwork-notify@kernel.org>
Date: Thu, 14 Dec 2023 20:50:31 +0000
References: <20231210113547.3412782-1-chao@kernel.org>
In-Reply-To: <20231210113547.3412782-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Sun, 10 Dec 2023 19:35:42 +0800 you
 wrote: > It needs to add missing gcing flag on page during block migration,
 > in order to garantee migrated data be persisted during checkpoint,
 > otherwise out- [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rDsfN-0000kK-8z
Subject: Re: [f2fs-dev] [PATCH 1/6] f2fs: fix to tag gcing flag on page
 during block migration
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

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Sun, 10 Dec 2023 19:35:42 +0800 you wrote:
> It needs to add missing gcing flag on page during block migration,
> in order to garantee migrated data be persisted during checkpoint,
> otherwise out-of-order persistency between data and node may cause
> data corruption after SPOR.
> 
> Similar issue was fixed by commit 2d1fe8a86bf5 ("f2fs: fix to tag
> gcing flag on page during file defragment").
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,1/6] f2fs: fix to tag gcing flag on page during block migration
    https://git.kernel.org/jaegeuk/f2fs/c/4961acdd65c9
  - [f2fs-dev,2/6] f2fs: fix to wait on block writeback for post_read case
    https://git.kernel.org/jaegeuk/f2fs/c/55fdc1c24a1d
  - [f2fs-dev,3/6] f2fs: fix to check compress file in f2fs_move_file_range()
    https://git.kernel.org/jaegeuk/f2fs/c/fb9b65340c81
  - [f2fs-dev,4/6] f2fs: don't set FI_PREALLOCATED_ALL for partial write
    (no matching commit)
  - [f2fs-dev,5/6] f2fs: fix to restrict condition of compress inode conversion
    (no matching commit)
  - [f2fs-dev,6/6] f2fs: fix to update iostat correctly in f2fs_filemap_fault()
    https://git.kernel.org/jaegeuk/f2fs/c/bb34cc6ca87f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
