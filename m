Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC1CC4FFFC
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Nov 2025 23:50:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0juxGkXU9bRn+SXA2SJPbCxEAHdjfF7VRKeEZgZKDz0=; b=L2rmQ3dVGjciWJRpJ6t3tsQP+h
	wZDSget9+tg1Ch9zdamuJWqoGAyhhvF7Q1MVAGfzx3oFNY2zoE7h9AU39+pFhFyGD1FeEwJB9WAS6
	LbHbXUpLCMV2GbI9Z4uI9DZ482z2021pOlkO8B674p+YzMZ+Sz1zNEeWie91W0mFTPvY=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vIxCO-0002V7-Pk;
	Tue, 11 Nov 2025 22:50:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vIxCN-0002Uy-IX
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Nov 2025 22:50:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n1aJHFunhyeu1HD7hYAHURyeWpnbmsmZ+WmOz+w55HE=; b=LT/ia7RRgxfvlGk5dwcFQJaW3q
 JwkPgYO65I933cX8YSHbrR+CdqS9kG9253cZZ42tO0zBKTrHfoCtSHXLmH6h4igkWw7a9DtBipdiX
 I+Baeqv7yUgm22ypkE661Gd2VdL2ztDtAnP4+zuUuYA381h0BEwV9Z1Exe0QZ2+ZUvYY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n1aJHFunhyeu1HD7hYAHURyeWpnbmsmZ+WmOz+w55HE=; b=gJb1Sc3+PYLv/yJTc6TWV4KYJF
 mmIHShsgr3qAudALi56biUvrZ9MLUmntPBcZt4KfC4o0q2LQyNr1F6CumFnk6XOwkjS72rbyO4qF+
 +F+q+HoPAB5b2gMNcjV9gITPOrBIf+52drUeuW6KStYNNAt5panG/MNJuS6cQbV2Hlrw=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vIxCN-000462-2I for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Nov 2025 22:50:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BA62340472
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 11 Nov 2025 22:50:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CA77C19425;
 Tue, 11 Nov 2025 22:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762901440;
 bh=aRhgIOpemWJXGYEkieS9N5M2153rOKFOn0HPq3DvZYg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Gu5GZk2sdFoujBrlMh92KOXCBbvEy5Tf3IWjECLW2jTblHitx357XoGzIIdNWW3Fo
 Gw/C4USFhzkubdyK2toU/DWXq/5VTRPiXSnb9ZNDAV/fh5XMXLW4UvG4eYo/2qbxj8
 Kg/eJCw7aZAI6+zFQveH3piuyntqnBflEUe2vbmtLH4wWV28BWGKLudaU79zLBzjbg
 eiioUOZgeoZXB3X/PNkuZTHRa2Nf/UsGT5AZJwN9VNSD7cfp2zPm09nGwGgWoJJP7s
 veCfB1Tze+bhcKI96SI0zht8R1Lc0+ZdtcCF8MwzyJn++ToH5nfni6ffugsKAXzWgV
 uWzhe1Eliwkwg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EAC8F380DBCD; Tue, 11 Nov 2025 22:50:11 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <176290141074.3596344.11323424525560613552.git-patchwork-notify@kernel.org>
Date: Tue, 11 Nov 2025 22:50:10 +0000
References: <20251014062704.1734984-1-chao@kernel.org>
In-Reply-To: <20251014062704.1734984-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 14 Oct 2025 14:27:01 +0800 you
 wrote: > In add_bio_entry(), adding a page to newly allocated bio should never
 fail,
 > let's use bio_add_folio_nofail() instead of bio_add_page() & unnecessary
 > [...] Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vIxCN-000462-2I
Subject: Re: [f2fs-dev] [PATCH 1/4] f2fs: clean up w/ bio_add_folio_nofail()
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

On Tue, 14 Oct 2025 14:27:01 +0800 you wrote:
> In add_bio_entry(), adding a page to newly allocated bio should never fail,
> let's use bio_add_folio_nofail() instead of bio_add_page() & unnecessary
> error handling for cleanup.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/data.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

Here is the summary with links:
  - [f2fs-dev,1/4] f2fs: clean up w/ bio_add_folio_nofail()
    https://git.kernel.org/jaegeuk/f2fs/c/6862f6948aa3
  - [f2fs-dev,2/4] f2fs: convert add_ipu_page() to use folio
    https://git.kernel.org/jaegeuk/f2fs/c/22de407ee7fd
  - [f2fs-dev,3/4] f2fs: use f2fs_filemap_get_folio() instead of f2fs_pagecache_get_page()
    https://git.kernel.org/jaegeuk/f2fs/c/10005e36127b
  - [f2fs-dev,4/4] f2fs: use f2fs_filemap_get_folio() to support fault injection
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
