Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A5AB40E7F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Sep 2025 22:20:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N5EpVsKVYTAW78pdQWSnAl/Jjx1aIj3gJeXABNSxF4M=; b=C8mc9+LfC18ey+lERmrgn1vV+G
	TrYqnfUC28d45pezyZf5sIwBUuQudnmmRq6OWFgTHXzQSX2rQAs1g6mYExYG2RGFnr+zWHRisW9sg
	C6J8MT8zRHLQgANDdFFzgxX62oWr4aJ+GGdkHZgyb7CzLMxP5tQNtB7MWQLc8sa9eOME=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1utXUK-0004ch-Sb;
	Tue, 02 Sep 2025 20:20:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1utXUI-0004c7-FL
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Sep 2025 20:20:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MbL68XRcpphNK+jgM1B4G/dAqtQXubB9T5lfJVpoKg4=; b=Ngnpr9p4aQ8r1WCo5Z4Fta9Xhf
 0VJ13qgifKQccSKyTXgn1v8UZng1E5+kSiIl4zLvPDQ+LMTpcn3SsaPoGxCZE5xg40Qp14RtLcdkE
 9j90asyqCc8dezB8COm0lZ62XxHFn181ZnBYmFlb9iRL0m4VPF5ipn3T9Emqg/FePH00=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MbL68XRcpphNK+jgM1B4G/dAqtQXubB9T5lfJVpoKg4=; b=XeLC6ymg1CViWiX6UsXgRQy4xV
 iMLB167ueJNUee1sKeMynzrxOqplHeM5t76yf6pcIfrh8iDR9Uk0Tc2/CKouqZQ80lv4+1Fl5q1lY
 GOLveLoIokKkj+Gax3h6dNbtB2tQ0h76MluMzviziEof0YThIcWJi//2trPdSBeC5UDY=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1utXUI-0004BF-PK for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Sep 2025 20:20:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7A7DA44BC2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  2 Sep 2025 20:20:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B1E6C4CEED;
 Tue,  2 Sep 2025 20:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756844408;
 bh=PwOmcYZ+4wSAR671uBP+wyJSVUsoGTkD0PrI8IMT7ok=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Y/0b5CFhYijlV+q/qFuSKF9bOr4jYw6n6VwLySQu+RqRbA3ucfcJfoKz/NPRvHPEX
 6aomzt24PIZvrxJMxC56X2chORKBcPoncZtphIqMsOTqC8carn7pkI1fXVHnbcdnOj
 c4XV+hRBbHiV/lXhlYLPn3olIWRPdBR6Nt28ePyElAe11MMI4L7Rz9bIhevXXq5IQk
 bcOg7tIgl14/FfVYeCq2MGQcX1fDAn+D5Iz23Zkwlj7PVmzLllPeDzXeGQ390nZffQ
 BAIcnPinbYbmKz5Giu1RJ+ttwkZwI2sRntyvaU+m6Y1XBRza/eDZj/wNTn3rsUwBw0
 EAPyefqNQpPXw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EC711383BF64; Tue,  2 Sep 2025 20:20:14 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175684441374.425353.1717450032024097846.git-patchwork-notify@kernel.org>
Date: Tue, 02 Sep 2025 20:20:13 +0000
References: <20250827215222.1615844-1-jaegeuk@kernel.org>
In-Reply-To: <20250827215222.1615844-1-jaegeuk@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 27 Aug 2025 21:52:22 +0000 you
 wrote: > Let's split IPU writes in hot data area to improve the GC efficiency.
 > > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> > --- > fs/f2fs/segment.c
 | 3 [...] 
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
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [172.234.252.31 listed in list.dnswl.org]
X-Headers-End: 1utXUI-0004BF-PK
Subject: Re: [f2fs-dev] [PATCH] f2fs: allocate HOT_DATA for IPU writes
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed, 27 Aug 2025 21:52:22 +0000 you wrote:
> Let's split IPU writes in hot data area to improve the GC efficiency.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/segment.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Here is the summary with links:
  - [f2fs-dev] f2fs: allocate HOT_DATA for IPU writes
    https://git.kernel.org/jaegeuk/f2fs/c/c872b6279cd2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
