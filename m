Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1B668B48F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  6 Feb 2023 04:40:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pOsMp-0001dk-Sl;
	Mon, 06 Feb 2023 03:40:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pOsMo-0001dd-6M
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 Feb 2023 03:40:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SPGbRbDd+x3zujiOAFNj9PNX0tQwH/7lRVsH841qI2w=; b=KnsUr6Skky/UJ2In0DAfmLEXNt
 JjML3N3JXXKnJqNyZJZsp61xnb9ZXV4xNuZ+vq6VfDkbwibEHIbkVLqQ0VfZgmOGMwnJhfhrCmqFR
 qZu1tCGHm1jUfHt8qvZpLeTCoBPrEa0iJvrBfzMohZx9qUoPNeJ8/D1Dn/lM+A+UD9us=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SPGbRbDd+x3zujiOAFNj9PNX0tQwH/7lRVsH841qI2w=; b=gLQ/jWYGgFyxzi8W4mBkwi70bt
 /g4KNprDdHYREFS1wfCfrEaIVmOsNWFIaV/yGkAtJZKj1wa7E2avNLTOK2tOQ8Ko1REVMuJ8WhIM8
 4AeHHZ3mrY9qVGked8Vfc2ZQJWqL/IG9PV+4KyX+ncjphB0Xsza0eO0tKvWYCpXPrr1A=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pOsMm-00CFNN-Ni for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 Feb 2023 03:40:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9B54DB80D27;
 Mon,  6 Feb 2023 03:40:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9C2C6C433A0;
 Mon,  6 Feb 2023 03:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675654819;
 bh=KwKRt75uEK2f/FDXaE2lng5C8xdbuN8ECgK7NOXQUOc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=qSMztfuAeI+B2rqa7hb0TGmrhdcNL3wcvfsVpy3RaeSX/zI4toNNttBRM5PitOo5N
 vmldF1Vll56wtoik6SFtJpcki3PUdlWjOH5aZ1GbEny2Vjiuf/KxeVJ3iFggMiVSwy
 kfv497XvhWcyRQXgDFePo11rnpWlhIbJD2VhqBtOgQ/69zeEbxVx7c0r7dIBQhH/Kp
 KpktHHcpUG/y8Dkbv7Sz+K93h0s14+q/Qtcf2jpiWXsfyvOrDYIv5hsozAhVKlWErT
 dnN23gQL09rPxLKC8jFj2khaYtZke9GUJ8x1hQhokma+40Mu+jPU6gGIfnmwttHljc
 wAR2ZtHqBn8Nw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 7246EE55F02; Mon,  6 Feb 2023 03:40:19 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <167565481946.5323.16929437612897381301.git-patchwork-notify@kernel.org>
Date: Mon, 06 Feb 2023 03:40:19 +0000
References: <20230202082028.9013-1-qixiaoyu1@xiaomi.com>
In-Reply-To: <20230202082028.9013-1-qixiaoyu1@xiaomi.com>
To: qixiaoyu1 <qxy65535@gmail.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Thu, 2 Feb 2023 16:20:27 +0800 you wrote:
 > Currently we wrongly calculate the new block age to > old * LAST_AGE_WEIGHT
 / 100. > > Fix it to new * (100 - LAST_AGE_WEIGHT) / 100 > + old * LAST_AGE_W
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
X-Headers-End: 1pOsMm-00CFNN-Ni
Subject: Re: [f2fs-dev] [PATCH 1/2 v3] f2fs: fix wrong calculation of block
 age
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
Cc: qixiaoyu1@xiaomi.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, xiongping1@xiaomi.com,
 jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Thu,  2 Feb 2023 16:20:27 +0800 you wrote:
> Currently we wrongly calculate the new block age to
> old * LAST_AGE_WEIGHT / 100.
> 
> Fix it to new * (100 - LAST_AGE_WEIGHT) / 100
>                 + old * LAST_AGE_WEIGHT / 100.
> 
> Signed-off-by: qixiaoyu1 <qixiaoyu1@xiaomi.com>
> Signed-off-by: xiongping1 <xiongping1@xiaomi.com>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,1/2,v3] f2fs: fix wrong calculation of block age
    https://git.kernel.org/jaegeuk/f2fs/c/b03a41a495df
  - [f2fs-dev,2/2,v3] f2fs: add sysfs nodes to set last_age_weight
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
