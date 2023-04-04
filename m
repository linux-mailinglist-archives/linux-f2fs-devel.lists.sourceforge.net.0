Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF8A6D5652
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Apr 2023 03:54:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pjVsd-00062N-O3;
	Tue, 04 Apr 2023 01:54:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pjVsb-00062H-U8
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 01:54:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UTOu0CgYB0NFZKQZPr5cKcEeac96YytJqN1G6yzsTPo=; b=cLobxkIXGfsRibtT2n4LK6VGrX
 U6yjF9gG4H6wi/IJzk4g3y7h7e9Nq1ty1olugTDs/S9xFtULB77UCI3HC59nkSt04OZZdP5d553NL
 6IPpIP+oh1CVS0YVJxQ5UsCRUYXkMRf1Lm/A1O7IQiFxgz2X7LhHV5fciWFlZrK+l2nM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UTOu0CgYB0NFZKQZPr5cKcEeac96YytJqN1G6yzsTPo=; b=M7SN2JhmADfuXzJ1K/81NsHPcY
 1bIewPFcPn7A+6GwJY7zf1kBuc3nHhumcuYbf0alX5OMufj1kjejLFm6DvI+13JIus8Gry07doFhv
 Ih3tg4wXJL4NkzMOT5Uzl7z6UNfTEZtLfd/IpYWLKcIyOoArRoWowHrE6Qkv/uKA3Dt0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pjVsb-0000X2-9j for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 01:54:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E3D5C623BE
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  4 Apr 2023 01:54:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 92735C433D2;
 Tue,  4 Apr 2023 01:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680573271;
 bh=hryDKmP5KESu5SQ1U29kbrRkg3Ll6z0zQN9N62UJGWQ=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=BrrHKhPayRefHk4AgT/tfcbwtWv6/cShtZgx/YYR1IBlAuXEQQTNdAmWc24qXqeH8
 gJVma4wYShxeQryG1gegTiFyRt1plgNa/XXXP+XI+TYaRNUkrshHMztcU9oW83pb9o
 7/bcnj6T51dkSb3BHo8pokoF0bDgRs8W+f6Q+uKJjzgb802w6d/KLCMGgPKRdy/Obr
 APzb1hmnmxFYBJ4B+v3m7jhsiuDw60V0VOv8/CnVis025LrHHmnO4D0GG7YYL/wpCn
 RZhvYpxjWmKqn2di1SgE7t0Mdd3CS+5l0Xw8jWwypwtLewd49sJ6AIZEQWvKoL6ZsY
 xJBS8WYCOSn+A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 744B8E5EA89; Tue,  4 Apr 2023 01:54:31 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <168057327147.21470.3067072388880133796.git-patchwork-notify@kernel.org>
Date: Tue, 04 Apr 2023 01:54:31 +0000
References: <20230403165038.3018949-1-jaegeuk@kernel.org>
In-Reply-To: <20230403165038.3018949-1-jaegeuk@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 3 Apr 2023 09:50:38 -0700 you wrote:
 > We got a kernel panic if old_addr is NULL. > > Signed-off-by: Jaegeuk Kim
 <jaegeuk@kernel.org> > --- > fs/f2fs/segment.c | 2 +- > 1 file changed, 1
 inser [...] 
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
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pjVsb-0000X2-9j
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix null pointer panic in tracepoint
 in __replace_atomic_write_block
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon,  3 Apr 2023 09:50:38 -0700 you wrote:
> We got a kernel panic if old_addr is NULL.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/segment.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - [f2fs-dev] f2fs: fix null pointer panic in tracepoint in __replace_atomic_write_block
    https://git.kernel.org/jaegeuk/f2fs/c/053654436fc6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
