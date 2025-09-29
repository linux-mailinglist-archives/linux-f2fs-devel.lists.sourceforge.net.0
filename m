Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C07BAAB23
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Sep 2025 00:30:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P+xobLtgJTy3l/h4oRwPpOeP8+/RYURf0um591aBaBI=; b=R8Rc8E0dCtKqf1n8/baeQdIJCY
	3JMutciOa9hmXWDd/4iviqH2SrCQ+0Po+daV1ED9earRXG+hav5IsnjrnNE07o3zHIut/N11KSwn4
	TPwOSxV1oWBNwRpB+Vgb0isn/9UKlkuywkNTbK3Lw55TMDeVHfraYjGGFQTOHZckc1rc=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v3MOS-0001nx-6a;
	Mon, 29 Sep 2025 22:30:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1v3MOP-0001n7-Ay
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Sep 2025 22:30:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2h+iAfwARMjNdNHlKBMOuSIxcCTrsV1eZ/Zy+KtPsGc=; b=i8Vyxq6HEcBDaWnFDMMtSbkxG9
 HEX3st30yFj59eTRyGc0XsnH6T8dXV4HsivHrtcHLj7W8JvngLjbTEqXx4v/an+IaVeYXxu9RI5TF
 PtOGzDhEzGSn2F4qE3hOWXtSgDpoJgtrTkZLeN9ZeIHcRszssZHe+cLlZ/pp5kfP54Zw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2h+iAfwARMjNdNHlKBMOuSIxcCTrsV1eZ/Zy+KtPsGc=; b=RNuZeVZzu8GtZW95nNEXq93XAw
 CxQLYE+X/d5A4zWdXkVFco1mwoUpld60PGy2mpI8VA34pXSFpIIimyu1dLGa4MCyh7IuR4rbSn84A
 VIZJbocbSES0EEB9w8HAXjCGWPAxILJi8EzS5vlIrLb5gEuz7dxtqoR5JSNwqRfIS6kg=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v3MOO-0005OX-OU for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Sep 2025 22:30:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 329A760277
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 29 Sep 2025 22:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 036FBC113D0;
 Mon, 29 Sep 2025 22:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759185038;
 bh=EfltOg2/g+0OzcQYOIHaLxnWVQ/3BkQk9eFFQdoxWEA=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=EpowPGdqFdoliAeFR3MahJJhc4/Zh4T4PYnOb721++WKVOjnk1HTF8FzczegkG7f9
 6kNiVZWhZjBWfb9b9tNfHZERHNfLZYjO1BVPZcIpTLD3DTaw8FtsYX0QR1UzPnoK7w
 Au4MmDMENGegVQKFjihAKk89NIhTScAErEwfmjD7j3TNLC5UCdFVFLWnuFvX4JdLr4
 pBTc1F9p5l50ineSw4FMHxJEwtz2OncD6szSEdso9smd9jQqQtkw5bwdVb1Mr1/wzh
 pYcQQW/6f5erQCWBLEBL+k9dC4PMhzdN2urAWXO1UPj9iPLrhLI+KCXTAe+wpHA1IV
 P/o+FbTWQI+Cw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADD3F39D0C1A; Mon, 29 Sep 2025 22:30:32 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175918503148.1733438.7250596778534076911.git-patchwork-notify@kernel.org>
Date: Mon, 29 Sep 2025 22:30:31 +0000
References: <20250902122720.2750481-1-chao@kernel.org>
In-Reply-To: <20250902122720.2750481-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 2 Sep 2025 20:27:19 +0800 you wrote:
 > In error path of __get_node_folio(), if the folio is not uptodate, let's
 > avoid unnecessary folio_clear_uptodate() for cleanup. > > Signed-off-by:
 Chao [...] 
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
X-Headers-End: 1v3MOO-0005OX-OU
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: avoid unnecessary
 folio_clear_uptodate() for cleanup
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

On Tue,  2 Sep 2025 20:27:19 +0800 you wrote:
> In error path of __get_node_folio(), if the folio is not uptodate, let's
> avoid unnecessary folio_clear_uptodate() for cleanup.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/node.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - [f2fs-dev,1/2] f2fs: avoid unnecessary folio_clear_uptodate() for cleanup
    https://git.kernel.org/jaegeuk/f2fs/c/2f84e99d6194
  - [f2fs-dev,2/2] f2fs: clean up error handing of f2fs_submit_page_read()
    https://git.kernel.org/jaegeuk/f2fs/c/d0236266cbfe

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
