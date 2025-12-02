Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF45C9C8F8
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 02 Dec 2025 19:13:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ROKjQkjDFQcksC1qg1d0/WeIeGVLu/tMbl124IWXTHs=; b=gNhPJNJdO5KyDK+WUau/kzOrIs
	1MUnyw8mV0PlaVhrnfwsAFjDZK0E6zvaSEVtc1W4aZeba9GuGAM8ezA1xQiVnouLCKLUgBR5ubX5x
	7Rldjyn++PVoDI+fx0c2/zkorcXQTWV58Fyxn/yaItScQHsoXVC46Z+krhAnJ49XD/L4=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vQUsH-0004no-B2;
	Tue, 02 Dec 2025 18:13:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vQUsF-0004ni-TV
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Dec 2025 18:13:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+FvRbF7IoB37CFWa7F3rUem7Jg2TppSlSMh74m7hsbg=; b=dDPVJ86FQx9SrdEN9ooJXraRqv
 9fQtaZm+KCZxtX/o1FTJNSGxU8C1yxQFXIFUeG29JayWGtf0/8LnZG+aweCRPeS24nU6/W73pPBox
 7+F9JoIGNzyyaZuW+6ZfV4Glu4Imln/XcwozVFHTwKP1pc3U+yu5I+LY2yWb2lvtm5VQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+FvRbF7IoB37CFWa7F3rUem7Jg2TppSlSMh74m7hsbg=; b=b4TrozpATWTBfZU2gLzpHBU+O5
 LC8HgziBXXpipsM0zoGdhXebt6gwSU4gUDN82uQ894/Y9UC5fkrWo+ZU68aP7Df1dsVp/r/rfAYzE
 bqKBMvBcXx/TRiczroph4v/lM8Bqh6zp7hgddinB/ZW2vQMnEoF/Zi/Jpqj6aDFfWXyU=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vQUsF-0005br-FA for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Dec 2025 18:13:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AD9E844364
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  2 Dec 2025 18:13:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90408C4CEF1;
 Tue,  2 Dec 2025 18:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764699189;
 bh=AM20E7N97gR+mLXR0Pv81KPUyg8TwBevc7t6NbpIzBU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=a7GJ0DoI0wEv/60hYxI+U5M96Oz8G41ZE/heGa7SWBFG90Ar07nIKg0Qe//iuXvk+
 gI4m9Mlf+ODxyewt01IBRW+9boMlJ2yqEXWFHvVWKJWeYJBhtmuRkmQPkogSihhy33
 XvpQ56dSfGhduJsDOd80/VlR4HEOJRHP2UxP8Aq75rogf+j1jsxHM+r9xQjLGyWajl
 1GDfWhaoaI42qzCSjzZxBwhH+pjy0Ph8VYioIXfOu4Ezu2FtSr4CDsZiY3NGgm+Iea
 NZQnTCYTZ07uzNqA3Xyn9YgHOCqS2mZLVaXcHh5dkSh+cZ8ms63SGkbDPj4X8brzMr
 xDLxv6ucvDuuQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 359533A54A3A; Tue,  2 Dec 2025 18:10:10 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <176469900878.3331097.6081231340672357715.git-patchwork-notify@kernel.org>
Date: Tue, 02 Dec 2025 18:10:08 +0000
References: <20251128092507.1607278-1-chao@kernel.org>
In-Reply-To: <20251128092507.1607278-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Fri, 28 Nov 2025 17:25:07 +0800 you
 wrote: > w/ LFS mode, in get_left_section_blocks(), we should not account
 the > blocks which were used before and now are invalided, otherwise those
 > blocks wil [...] 
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
X-Headers-End: 1vQUsF-0005br-FA
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to not account invalid blocks in
 get_left_section_blocks()
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 stable@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri, 28 Nov 2025 17:25:07 +0800 you wrote:
> w/ LFS mode, in get_left_section_blocks(), we should not account the
> blocks which were used before and now are invalided, otherwise those
> blocks will be counted as freed one in has_curseg_enough_space(), result
> in missing to trigger GC in time.
> 
> Cc: stable@kernel.org
> Fixes: 249ad438e1d9 ("f2fs: add a method for calculating the remaining blocks in the current segment in LFS mode.")
> Fixes: bf34c93d2645 ("f2fs: check curseg space before foreground GC")
> Signed-off-by: Chao Yu <chao@kernel.org>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix to not account invalid blocks in get_left_section_blocks()
    https://git.kernel.org/jaegeuk/f2fs/c/30b135414fde

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
