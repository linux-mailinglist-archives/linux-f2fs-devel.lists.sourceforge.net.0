Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 503A4A6650A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Mar 2025 02:30:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tuLmX-0000c7-Ab;
	Tue, 18 Mar 2025 01:30:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1tuLmV-0000c0-Nc
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Mar 2025 01:30:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KYFbY+lwOyM5i6A//pvCsiBLcEm8K/aNDD3kwakrX6k=; b=IcVNB8WpASVVaE55iYVmWFcXB2
 POfGmt3ySnyVAdEe9fGc0E6Y2XGDfDijxH2is0tHp7rBpPzRBA/78cTLM9eGpuW4zLqfQBmqpQyEV
 tA46ZyjPmemnuw8I/8JMVZh8o1FlZQ1IMP9MF1g5eXP95/++AVZuDSPM0epa5gwS3mbk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KYFbY+lwOyM5i6A//pvCsiBLcEm8K/aNDD3kwakrX6k=; b=Hi1Que3NNEbVuAdfm5wNXhZRhY
 dh0GSQCscEveXAFYdCqU1becbTt0vC/ueAMMkpOUROYVvM7f/PaxE9M24X1MQCgov/0CTbASKxi6q
 FOuVVcX/2NHYvH9s6EuqqPUBwuZOLM2hDykHD2auf0Ceq6EcD5Z2fh4SMHM+ejS0sgeY=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tuLmU-0006sb-Hi for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Mar 2025 01:30:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 618B8A48E45;
 Tue, 18 Mar 2025 01:24:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A12D7C4CEEC;
 Tue, 18 Mar 2025 01:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742261398;
 bh=KT+Vy/FXX3jvNAPPBygtO31qSpTtbmjLb9YegbN3mQQ=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=DiYGI+3kQOcfGRc4yT92oXwaSbR8him9DoweICbqUbNh+Z+20BjWuFJldcANdVfQs
 xCzujGgdEG2FD4C+8lne0rRlwHdmsGXW4Ra+0s1KOzZsrQQj6jnDD35nphgdC6dTS6
 rKHAEx6iHx0uxbACxRc6EDDOsWJfMjvh8mBacZIg5l3NazaAvDiLeXHkjP6G2mA0OZ
 0b7dUuvNkcffO3mpBGzy3T6fa4ssjweWRFGJatp+CFVbS+yPsYOmZxz0Qn9NwpfQHV
 +RGYBgI/xqDTN+/x3fSXY0iYkC5v7HduaMoKcDpvW3b/Fugsv5LRMiGEPOGcCTpvpq
 9y3CmgWQz3c/A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 34D52380DBEF; Tue, 18 Mar 2025 01:30:35 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <174226143398.3976340.10979169569040925806.git-patchwork-notify@kernel.org>
Date: Tue, 18 Mar 2025 01:30:33 +0000
References: <20250317101624.3223575-1-guochunhai@vivo.com>
In-Reply-To: <20250317101624.3223575-1-guochunhai@vivo.com>
To: Chunhai Guo <guochunhai@vivo.com>
X-Spam-Score: -2.8 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 17 Mar 2025 04:16:24 -0600 you
 wrote: > During a checkpoint, the current active segment X may not be handled
 > properly. This occurs when segment X has 0 valid blocks and a non-zero
 > number o [...] 
 Content analysis details:   (-2.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tuLmU-0006sb-Hi
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: fix missing discard for active
 segments
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

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 17 Mar 2025 04:16:24 -0600 you wrote:
> During a checkpoint, the current active segment X may not be handled
> properly. This occurs when segment X has 0 valid blocks and a non-zero
> number of discard blocks, for the following reasons:
> 
> locate_dirty_segment() does not mark any active segment as a prefree
> segment. As a result, segment X is not included in dirty_segmap[PRE], and
> f2fs_clear_prefree_segments() skips it when handling prefree segments.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v3] f2fs: fix missing discard for active segments
    https://git.kernel.org/jaegeuk/f2fs/c/21263d035ff2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
