Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE4AB283FD
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Aug 2025 18:40:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uFhfa7TrfgZXx2EHu77rDumut4FSEtKU9re3yWYvuDM=; b=R3m3/aaw+dw0DMkDp/em0phzoM
	weATdKR34XFlJPvHG8o2I06aJFFGnUGLQyB1cXOY3CNqmwqmzLuncxm/uL4dy3o7YKRW6/h4thvpX
	If3xfjpaeY7FywazMYR6LWy57zMgw23uTqcsqdIn8s2AX77sy4Ojvb0cN+xDs3tDdf/8=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1umxTW-0006VL-Tx;
	Fri, 15 Aug 2025 16:40:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1umxTV-0006V4-EH
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Aug 2025 16:40:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MdPHRCIKN88O+20VfqS3EagK9jzXCeN5tp06UON1v4M=; b=Lq1EymQnc1Qb8Mk3KRthR91+e7
 49XRQLFcd8F1TgElR+qJyRDaYTPwxGIspbieuloNYqvw3FybrIjRDJNgC79BjZH5wz4neOKErXHCf
 BRTeHVDtuIv8ed84B98zpZs3iarJqMwBnVOhwjoDO9FiPix4beqP5k7zQxNwfZfhHY/Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MdPHRCIKN88O+20VfqS3EagK9jzXCeN5tp06UON1v4M=; b=csOfsqtpM3sKDyLinpDugedDOJ
 4Fn3B9io65/Pb+7l+mYd6SqQBIt+trXM62e186Zz5zytv7c6eEx+EKeNPGhP1xnB9QLcDqQJ/oasp
 xqFlOxrg5UWh9UjWHasBlGz3mzfB477XNOFY12odlBylsFn8JPHG2A3Bk6x5a0CmPh4M=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1umxTU-00018i-Un for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Aug 2025 16:40:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 925265C547E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 15 Aug 2025 16:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 621E8C4CEEB;
 Fri, 15 Aug 2025 16:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755276011;
 bh=7+LOQoLikyi18MadAlEPOle4980wKp4w/1YuWDRWYmc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=j2Vw1muaTRl4q6chHJR0Wukm/m74RlWfEVjGwMQYZgFPn9CtkNie65rdpaIWAC4VO
 vk8iQ2KCZx+bTK3OZ4sJGbmFdCxD1rOdKNKvr388u1hhRDg/rvZwopVPz27IMb4Rlo
 Md5o69HCoHhz/pewPwLJF80Y8OviR/kfq+0uTg+8hoqV3GSZ7hbKpO9LVfnvRLfOdn
 FuBClfXuEoK5McBl1HDPb08xyLlP4tjrohKX6WdEPGRR2ptI6c9ZxqoJmjz3SWAvNN
 U0DVB6sBJ9TCi6o+w5rSNZZczReNUsXUSAMK1OlBpxf61KAH5Z7uJdvwMnbhU6g4Ld
 aiLl1jZss2ZtA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADBB139D0C3D; Fri, 15 Aug 2025 16:40:23 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175527602223.1161945.8969283986568227588.git-patchwork-notify@kernel.org>
Date: Fri, 15 Aug 2025 16:40:22 +0000
References: <20250731053405.1127197-1-chao@kernel.org>
In-Reply-To: <20250731053405.1127197-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Thu, 31 Jul 2025 13:34:04 +0800 you
 wrote: > generic/299 w/ mode=lfs will cause long time latency of checkpoint,
 > let's dump more information once we hit case. > > CP merge: > - Queued
 : 0 > - Iss [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1umxTU-00018i-Un
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: dump more information when
 checkpoint was blocked for long time
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Thu, 31 Jul 2025 13:34:04 +0800 you wrote:
> generic/299 w/ mode=lfs will cause long time latency of checkpoint,
> let's dump more information once we hit case.
> 
> CP merge:
>   - Queued :    0
>   - Issued :    1
>   - Total :    1
>   - Cur time : 9765(ms)
>   - Peak time : 9765(ms)
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,1/2] f2fs: dump more information when checkpoint was blocked for long time
    https://git.kernel.org/jaegeuk/f2fs/c/3fcf228b6494
  - [f2fs-dev,2/2] f2fs: add time stats of checkpoint for debug
    https://git.kernel.org/jaegeuk/f2fs/c/57e74035ad5e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
