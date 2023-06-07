Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 852AD72675D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Jun 2023 19:30:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q6wzZ-0000o1-7i;
	Wed, 07 Jun 2023 17:30:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1q6wzW-0000nh-Iu
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jun 2023 17:30:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f6IItzbuZ5e1C1e/4rgK5i4aZigbp9rHNWe0+3kkowQ=; b=SW5EsGDAFSnEJM4YtBb51Gp0Um
 R44gxiafK1zh7D6DckIWjI4Io+DEfhRaLS/F4KJ45AejTly+ub7poLyoNl4ok4ATKP0lCvB18hw2/
 HVpYogGJC/hJzOg/pmqr4nkQA7RCfJgwCaWJUi5Hx/n+2r2zqH4t6iHdtRo0etBGH2WA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f6IItzbuZ5e1C1e/4rgK5i4aZigbp9rHNWe0+3kkowQ=; b=GP/omqFjOUVmyvj7fdDCODKfNP
 hgm15kWbNWzEEf19vLsIKxANsRx7poz+rxlLlPDuQ2iCPJZ34VM/TrLC7gEpvBwWb4Z2DiFuGXHVf
 HTz2EHtbkyFZmT+YvGnyJ1PetHhzYzvicr414+aqExH8gVZlTvxxRglCO24n1o4GswOk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q6wzV-0007mo-E3 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jun 2023 17:30:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 81C8D64211;
 Wed,  7 Jun 2023 17:30:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5FDD8C4339E;
 Wed,  7 Jun 2023 17:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686159025;
 bh=j+ZyRRT6qc28MG3Irp4xXHMDHCVWM5gjkopPvv30d/w=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=DQFEihDpJl4lFI3g/XYu3hNCTwGd5c4BogX/uTVU9fP+ZMb8737ZkUjt0Sm+o/nA2
 BLgYlzCPLahq0BwGlv7yJyY/O7oViA7ML0XJys9qQYEhZRxmVEziK8ygajc00/ucZr
 Qm+Ue6GmkYuHFzTyX7Ps6bkLdWZLAFN87CxZEGy1dV4enY+HEV2dlyc8CX0EKJIc+o
 CuFUWC6DFoXpLlRL4+VxYhMUFd6y8zNapnv4RXpFeussiphZ5MUUlECPZId6EzIB+5
 MVRAdJ1HPpkAesDuDSdcEc59hArBTgy8/gyHO/X0X17cuN8yWz/C8Bk/EOTixh79xd
 ujsBN3LAtCjyA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 42BD8E4F13C; Wed,  7 Jun 2023 17:30:25 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <168615902527.7521.505890454109723802.git-patchwork-notify@kernel.org>
Date: Wed, 07 Jun 2023 17:30:25 +0000
References: <20230601013759.75500-1-bo.wu@vivo.com>
In-Reply-To: <20230601013759.75500-1-bo.wu@vivo.com>
To: Wu Bo <bo.wu@vivo.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Thu, 1 Jun 2023 09:37:59 +0800 you wrote:
 > The NULL return of 'd_splice_alias' dosen't mean error. Thus the >
 successful
 case will also return NULL, which makes the tracepoint always > print 'err=
 [...] Content analysis details:   (-5.9 points, 6.0 required)
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
X-Headers-End: 1q6wzV-0007mo-E3
Subject: Re: [f2fs-dev] [PATCH v3 1/1] f2fs: fix args passed to
 trace_f2fs_lookup_end
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
Cc: wubo.oduw@gmail.com, jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Thu,  1 Jun 2023 09:37:59 +0800 you wrote:
> The NULL return of 'd_splice_alias' dosen't mean error. Thus the
> successful case will also return NULL, which makes the tracepoint always
> print 'err=-ENOENT'.
> 
> And the different cases of 'new' & 'err' are list as following:
> 1) dentry exists: err(0) with new(NULL) --> dentry, err=0
> 2) dentry exists: err(0) with new(VALID) --> new, err=0
> 3) dentry exists: err(0) with new(ERR) --> dentry, err=ERR
> 4) no dentry exists: err(-ENOENT) with new(NULL) --> dentry, err=-ENOENT
> 5) no dentry exists: err(-ENOENT) with new(VALID) --> new, err=-ENOENT
> 6) no dentry exists: err(-ENOENT) with new(ERR) --> dentry, err=ERR
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v3,1/1] f2fs: fix args passed to trace_f2fs_lookup_end
    https://git.kernel.org/jaegeuk/f2fs/c/fddd7d0466ae

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
