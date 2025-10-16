Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F50BE50C1
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Oct 2025 20:24:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=osT2jRdwiqSigLEnIhrZaNpy5jhDP5QW78hNCvEMilc=; b=RyEEPL0NuDKa2ILMhl6Y9nKFCt
	+RuM4uWgcD1TdjwF6riFihEHaT+2FzviBefLNIESmHhl1EdaFpb/14m/RUfdw/nHdgJt2MtkSnSNS
	EkvnuzF3BONk6iuO2pL9YFnA/JzNpnSOgW6zW1xhD0jwfueoVFcfcZrCPET7kTHDY6CM=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v9Sea-0003WK-Ks;
	Thu, 16 Oct 2025 18:24:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1v9SeZ-0003WD-AY
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Oct 2025 18:24:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KkUKABDko2TIJSl/knuf7dk+GaISdeADYinL3+3YMec=; b=Ty19Nubu5XtAnUi/+1hicDPcBV
 OfefDkJOKt1GvNG+mzfrz3TOnbzzfRgH11yBp1npqykxRHsHkSNMt0stkgRlN369+X54sYfMpqvJQ
 72fOBubwDo7XjPBEEKSIKiRKdR+6bbH0KweSDNPHVH3frAAwH7CXSnE0iFheGGn5+ffo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KkUKABDko2TIJSl/knuf7dk+GaISdeADYinL3+3YMec=; b=CECXcDy80eN4+AuoznQ7AhkNAu
 iBBjCFd1MO6CIYEfL/dLhtzFuS+jFX1XUc0K4NDo34CKRzMiqCvpGNylA+XKqbaeYinZGxR8QFjiU
 H9/wGGYPzf9n5Yif0XntqjV4Ft7oaOV4i1iLZ7ExKs88/O9VUwjyGK18cEy0gmuBnRfM=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v9SeY-0001yI-Oe for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Oct 2025 18:24:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1AB08640CB;
 Thu, 16 Oct 2025 18:24:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA8DBC4CEFB;
 Thu, 16 Oct 2025 18:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760639076;
 bh=UG4tJ47jBwN6WkEwJhZo8CXkSYUtmUCcVml6zvd2iZ4=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=CbFjOPjCpta7jhz0j5nw7ki4tJZgwIm2HdOp8Vc3I+RMND5GzR7KG+wzPz8ISZQ/r
 VtwLX7VUwtrHm2JJ/wc7nxV2XUAKXDvHb12NMROEjR1d6E3LQLoYCWY+iSibXzVzUi
 wca3rDVgrJO7bs7GN/onmXfbGu2z7s7g7uHzav6+5xBhqdmU2nyEgmLLjSWDZ9NCPB
 H3JdbCW/SZCq5h8DcgX5yR5tELu4BN7OpCgDIf7ib5u8MXn41Wstx/qcEHPqFJ3N/A
 gJ2LARDpT1WG6luh0JnLjZF6ZUxgunylPNcwFYlkNORdlUtodt8KVMdlMDlR1pqRjr
 opGfsvcku0sEw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33FCE39B167A; Thu, 16 Oct 2025 18:24:22 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <176063906099.1852182.14456838329334893039.git-patchwork-notify@kernel.org>
Date: Thu, 16 Oct 2025 18:24:20 +0000
References: <20251004031217.50242-1-pedrodemargomes@gmail.com>
In-Reply-To: <20251004031217.50242-1-pedrodemargomes@gmail.com>
To: Pedro Demarchi Gomes <pedrodemargomes@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Sat, 4 Oct 2025 00:12:17 -0300 you wrote:
 > folio_nr_pages() is a faster helper function to get the number of pages
 when > NR_PAGES_IN_LARGE_FOLIO is enabled. > > Signed-off-by: Pedro Demarchi
 Gome [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v9SeY-0001yI-Oe
Subject: Re: [f2fs-dev] [PATCH] f2fs: use folio_nr_pages() instead of shift
 operation
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

On Sat,  4 Oct 2025 00:12:17 -0300 you wrote:
> folio_nr_pages() is a faster helper function to get the number of pages when
> NR_PAGES_IN_LARGE_FOLIO is enabled.
> 
> Signed-off-by: Pedro Demarchi Gomes <pedrodemargomes@gmail.com>
> ---
>  fs/f2fs/f2fs.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - [f2fs-dev] f2fs: use folio_nr_pages() instead of shift operation
    https://git.kernel.org/jaegeuk/f2fs/c/c9cd50d5aaf8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
