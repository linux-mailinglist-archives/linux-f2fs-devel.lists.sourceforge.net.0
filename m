Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E81FFD3AACA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 14:54:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uw/ZrykEBCrbWc8+dQvg+aNGjL8cZupo8GNywELtPbk=; b=A0sSI5V5lEJOL2JAnTOXwbZUuh
	jkuxzJRU0E8k68pqZjgujABdHRKcB//DZgYK087L/ciHruCyeymGkH3jPqbT6M7nH/nrjLUd9/kit
	zoAXFN3CfxcF/ThNOjrECSr6UFaP23zxRjce/YDG9YXdAO9xFkNh4n967KCpLZTje3aE=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhpi9-0001YI-S3;
	Mon, 19 Jan 2026 13:54:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vhpi7-0001Xx-Ag
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 13:54:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ybzvg7LFyxNWCZYc3Td4Q7Zr8vJsBBaLezt5GBVVBCs=; b=aeOFZMkffGZMizpDEiXG8oFaL7
 wL4KKakJ9N1fjhak8SHoO12n5gK1/TSHNLuQo9AroRa7si9M39JCLBMWtgrIRfH7lKhoqRmAK2e33
 RpRw+95p/yjMaagQEbE/8xH+gnbwA1upp1k3QvftaZZ3/HHywvAcV9LUMDdHrpiucF+E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ybzvg7LFyxNWCZYc3Td4Q7Zr8vJsBBaLezt5GBVVBCs=; b=C0GpQetZNq7Yp/uqT3hTNt6OlR
 /PI8D1zLkGyvdX8GG/rTnY/NLBVTrdKoCmpyhqVN2W7Sutwh8I4HnM9l3utyN/duY8cXAkfBuVTX3
 I/B6VUCMmp4I92D0R8Zki2KGgnyoxFnHHMjyjezgD8NUYJVxZ/KHPEJ+9o3MHbxbeoEQ=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vhpi7-0005r7-JS for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 13:54:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4EBF144451;
 Mon, 19 Jan 2026 13:54:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32B96C116C6;
 Mon, 19 Jan 2026 13:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768830862;
 bh=UaOpwZfVgQi4lTwpmpR/FZG0ekARNVcEu7JvoWCkOa4=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=tWSj88yFHUoO8rCn8aVNVFBneQxHYqXlDLAei7olPyPRoP8zZdVBfULbyZy7o22xz
 B93Myiksrduf/lLlKMw2iwYg/xuRiCPLcZ2CdNZ/laiqzKM0REcEqGthrqBnGTWH0Z
 nFvp6l4eTiv0aIRtjOefgFo4dMaxZpkxAvqB5setKPoC/i032x3tDChoMlojqDnCMK
 cyJF4g2WjzzFENjySu/+5JhTOg/h3YcjhQg3K+i35TZ/gZ4ejecP2kubDu1Yk4fEXi
 11xV9A4Oh8dVOeXzDMJDDcfzbFdqd9fRpbYWG4xgisIbd0ya7MucWpMX+O7w5aCM85
 EPWH/VuD5zyxQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 3B7DC3A54A38; Mon, 19 Jan 2026 13:50:53 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <176883065202.1419958.2177081840258528101.git-patchwork-notify@kernel.org>
Date: Mon, 19 Jan 2026 13:50:52 +0000
References: <20260116043203.2313943-1-jaegeuk@kernel.org>
In-Reply-To: <20260116043203.2313943-1-jaegeuk@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Fri, 16 Jan 2026 04:32:02 +0000 you
 wrote: > No logic change. > > Suggested-by: Matthew Wilcox (Oracle)
 <willy@infradead.org>
 > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> > --- > fs/f2fs/data. [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vhpi7-0005r7-JS
Subject: Re: [f2fs-dev] [PATCH] f2fs: use folio_end_read
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
Cc: linux-kernel@vger.kernel.org, willy@infradead.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri, 16 Jan 2026 04:32:02 +0000 you wrote:
> No logic change.
> 
> Suggested-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/data.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)

Here is the summary with links:
  - [f2fs-dev] f2fs: use folio_end_read
    https://git.kernel.org/jaegeuk/f2fs/c/ec8bb999dc0c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
