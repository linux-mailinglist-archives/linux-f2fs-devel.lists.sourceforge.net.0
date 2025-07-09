Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2136EAFF084
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Jul 2025 20:10:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2C+EzCKoYyFBMMUL9SM5ZOkg/dts3TOsFIilnulMtiE=; b=cL3/XKRH3MqMT3aiuGgdQNG2Xv
	c2BaQ1eIKUpvyv7bzytvY1lhPfSOa/3Ykmt47YlvGJdu7FBctNtCfaxYVlsuxysFWWJYxAeCbz3SD
	TWIPQpoJT4C11RKiADSOrIUvJ6HeQ2a04vrJcGPEatqT+4w7YTBa1dzfc3zlJih1uuu4=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZZF1-00005m-NJ;
	Wed, 09 Jul 2025 18:09:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1uZZF0-00005a-1M
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Jul 2025 18:09:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T62vOfwKKgXpldNpaGeog8aLK9lzrK4YjQVRbF3orWk=; b=KQSVBUVkumQwPPVo9b1zokUJqY
 X+oBDXisKbebD1DGpLU7OnJcthkb9FlbTc8uTtou4oOELxC5OrxCXLZH7hlJyFNZ22zbAutZW3TBZ
 C25IHXVnwvKuWnN21SMXhFDNMMdXgAXUc6b9+V5qfQ7hZ/KFXSnUR+lVsUCCL4qy1UdI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T62vOfwKKgXpldNpaGeog8aLK9lzrK4YjQVRbF3orWk=; b=YPKtWQ5E3QPkCS7GOl8OinZXTv
 Z/jE2Lc/dzZKkhykwh1AaUxNa0GouqkNZocTWz3BVXudAFuHvOhluv7GkKq847DQucntqtmzcbp0I
 dNRqjeX8fa1TeZAvYrMWXhS9E4bUl6mI1IUE/sCjJ2hixVJ/erLr2UZqka0htocSTzVM=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZZEz-00013N-HI for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Jul 2025 18:09:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 28EBE42B8A;
 Wed,  9 Jul 2025 18:09:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06EABC4CEEF;
 Wed,  9 Jul 2025 18:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752084587;
 bh=phHLJ3EvywfcPLMn5ezWfhv0ep2yOCJcyMLvx/syR+Q=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=cx8Uo8YAvjT97aO21/vTtiJvX22G60EJjJhzYhGh+QCf+5/FTLdoOTDAmsKd99TSJ
 SR8p2HwLbEAhUBggtbun3Y1Nhj+ydiLBm/wk7whGzijAdowOfLrNriYwNb+uLYTsSs
 12dT2aBF0wmeep1TclUQ2WahK+Btlnvcq8nqFuJFHJZUhrpIwESUvjNH2ew0QSXpqc
 C6qCcz8ltLK7dhvLpPIDO/7Fhl8saRmZs8+nSqowDK9IMx4AiDJTW4bLC2kqOZ//Qh
 O/Vd11GLarjWOG8QRJjqqd8uqcCkrSLs6jrRztjOwYDAVNQiVcgnMM9PqVggsUE7NC
 Jwbcst1/CWpUQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 AE24F380DBEE; Wed,  9 Jul 2025 18:10:10 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175208460952.806926.13620512272731608715.git-patchwork-notify@kernel.org>
Date: Wed, 09 Jul 2025 18:10:09 +0000
References: <20250630125753.650630-1-huangjianan@xiaomi.com>
In-Reply-To: <20250630125753.650630-1-huangjianan@xiaomi.com>
To: Huang Jianan <huangjianan@xiaomi.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 30 Jun 2025 20:57:53 +0800 you
 wrote: > When fewer pages are read, nr_pages may be smaller than nr_cpages.
 Due > to the nr_vecs limit, the compressed pages will be split into multiple
 > bios a [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uZZEz-00013N-HI
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: avoid splitting bio when reading
 multiple pages
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
Cc: shengyong1@xiaomi.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org,
 wanghui33@xiaomi.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 30 Jun 2025 20:57:53 +0800 you wrote:
> When fewer pages are read, nr_pages may be smaller than nr_cpages. Due
> to the nr_vecs limit, the compressed pages will be split into multiple
> bios and then merged at the block level. In this case, nr_cpages should
> be used to pre-allocate bvecs.
> To handle this case, align max_nr_pages to cluster_size, which should be
> enough for all compressed pages.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v4] f2fs: avoid splitting bio when reading multiple pages
    https://git.kernel.org/jaegeuk/f2fs/c/185f203a6991

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
