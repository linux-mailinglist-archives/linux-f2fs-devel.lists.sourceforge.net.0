Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B5955B283F3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Aug 2025 18:40:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JusL40mlcaseJjfJMY0UBHqIkkqojnjoxxL5o/E8+Gk=; b=SDFhDxrjzBTD0LYHhl5cobR3rs
	a+lsIGe9e6xTbgmtFis3FgRlXKABm6qcOW9OU3+tzANRdQ3a8I4ju7vjEr8NMRoj0CIcrxaPrSBpv
	Cf+swHGTsuSdXGciY/SZCwhJ7Vi2ktH+bdrR1EfdeRQEsu2Aop4VzqiKMwPT4VqKGTls=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1umxTL-00089i-8d;
	Fri, 15 Aug 2025 16:40:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1umxTJ-00089a-GQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Aug 2025 16:40:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xj/JT3qd509G8dhRonb6l+YZGdVQQMfoGshq9LueuY8=; b=E0zOZIgEh1zCbqLF8KB6BQ/fSt
 CDlX8x2QTxhz68lPHN/mDDnONy2+UVE0tOp9BeCqEDmYKiPGrZF3hpAFBkoegfkPqGsgKrNIxeuEI
 GXctRG1bprl+FPlohTW8H7nVglBhj56G/elwclPGB+HMrz2fatt8gcckLLUYPWFEt2HA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xj/JT3qd509G8dhRonb6l+YZGdVQQMfoGshq9LueuY8=; b=QgyOAIP2w53qF8bqbs1F/CD+ZR
 F1unh35n6ANyuzvG2tbC0tfIbstaiXUVYYTrZihkfL+6UoplSjYahEsF6M6ES1YRivLdhgSnSbqlp
 Bqz9eMWxt2LxfTsS3GmxhpJdsFVeRNK+7NXIGN83WqoNujtcqOsfj8h2th94mO0xkiok=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1umxTI-00016t-Tx for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Aug 2025 16:40:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4336BA582E8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 15 Aug 2025 16:39:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1940C4CEF6;
 Fri, 15 Aug 2025 16:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755275998;
 bh=y9d5xuqRVvqJXmyoxx0QT1QVdEClBj28FW1UTbEJL+Y=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=WXEP2HOHDNjzXGBHRRfJtnHZ/CWS6PWgJOPwlljH5Rl18IOjsE9u48rOrZED2DB4L
 IJSOnjfswJWZTkYfQETrEulvCC/PQk5lJ2IXjlLL0MGOAbvQKSbJmGR8TLBrP0h4W7
 +9MEVPqpHikD0wQom29wHfpAm/pYXrO7EuPJqebCW2rBM5hwULkkvQBCy58DeTQRhW
 PCIhWyIMz6C/Qs+bAXPJUVUW6Ok0lQ2Hlw0+qi/Rx6yaqMLUB9mIpCH6cXXbfOXAx9
 YNm6gCFmgeQunkRS+AU5ZqV3CNw91fJi9WtGPOzmXvUGnAEGW+MpVNfqs+8N3PESdK
 pzQXXhlNXRG9g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33A3E39D0C3D; Fri, 15 Aug 2025 16:40:11 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175527600974.1161945.15609859403158896445.git-patchwork-notify@kernel.org>
Date: Fri, 15 Aug 2025 16:40:09 +0000
References: <20250805062912.3070949-1-chao@kernel.org>
In-Reply-To: <20250805062912.3070949-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 5 Aug 2025 14:29:10 +0800 you wrote:
 > Should cast type of folio->index from pgoff_t to loff_t to avoid overflow
 > while left shift operation. > > Fixes: 3265d3db1f16 ("f2fs: support partial
 t [...] Content analysis details:   (-0.2 points, 5.0 required)
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
X-Headers-End: 1umxTI-00016t-Tx
Subject: Re: [f2fs-dev] [PATCH v3 1/3] f2fs: fix to avoid overflow while
 left shift operation
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

On Tue,  5 Aug 2025 14:29:10 +0800 you wrote:
> Should cast type of folio->index from pgoff_t to loff_t to avoid overflow
> while left shift operation.
> 
> Fixes: 3265d3db1f16 ("f2fs: support partial truncation on compressed inode")
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/compress.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - [f2fs-dev,v3,1/3] f2fs: fix to avoid overflow while left shift operation
    https://git.kernel.org/jaegeuk/f2fs/c/0fe1c6bec54e
  - [f2fs-dev,v3,2/3] f2fs: fix to zero data after EOF for compressed file correctly
    https://git.kernel.org/jaegeuk/f2fs/c/0b2cd5092139
  - [f2fs-dev,v3,3/3] f2fs: clean up f2fs_truncate_partial_cluster()
    https://git.kernel.org/jaegeuk/f2fs/c/cbba5038ee29

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
