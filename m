Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A7648C8227E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Nov 2025 19:50:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yqd3Yru42fILDCLP+Vjauv7Jrdf+9AOBtp8ASfkh/gc=; b=UUQpGp/tIaGszr/O6enDn/AQ6f
	TwVscN8HEh/IRwWq+ZydnLeFUrK13KCRTsXUgTSZFvK3PkeYDKtyvg+KLozizG+leQyAmRPY80BuW
	c1IvJ3day92elUuY9J/omvtcoP3y3ZB7vnvrCHA0QdYM5bxWTxjWLt1oNoa56dFGUlbI=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vNbeL-00061F-JS;
	Mon, 24 Nov 2025 18:50:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vNbeK-000611-D7
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 18:50:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KXTpi6PAeI4doBNu7jWNypMy5YYmlo4H4CSZwGpWwQI=; b=d52qQvsiEpl+Hvo+ToBJG2YLYz
 J1vpkKm3fAeIUoC1uNF7h/dwDDD+Kfi11d17rE5t/w7MRWQnp/uUpC6LQx0bio5VJA1qUVpn+bk26
 jc8B9+USQNFA2t0kxBbVLuoTRK+7vBj4lz6kmMe71d85Wi43AXVwvcxrfS5OJVgoAwFo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KXTpi6PAeI4doBNu7jWNypMy5YYmlo4H4CSZwGpWwQI=; b=MXa+NFDZcEsPxJyFk86XkTSO0g
 YarSafk0QqU/s0b6dnIZcDzgPo7zE20Ivw8bgsTw9Io28vyd27r5dJs1zk//7JfoyjOJtiJjca4m9
 YqGUcgUSQzNtCPzhlotrBEcPqTyRM3XIPxcJmEsKm83jhQZWBFeg5lpKza73WnfCdkdg=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vNbeJ-0002eV-Mz for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 18:50:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6CFAE43BA7;
 Mon, 24 Nov 2025 18:50:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A54BC4CEF1;
 Mon, 24 Nov 2025 18:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764010245;
 bh=6+hOJU+ZUlkzpexFcleys5ODzLBpIoCb5W70nUHZDwg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=FVAQcs2GUnMLMsTA06WVInbK7cPJjVvIQPEOkJ6v4jr3YwZWvqyj6z6PXMTn4enzR
 +6NihjnlzUVD2ZhGUI2SIV3v67p7TjaL9HuWdTlNSLT0hAJ0lwQcaYM2IOwi3vKETR
 CMRa38wuO4LrEfEMc0tE45+sY2hhty1NRj82L2IdDu+yvpK0IdQBYuAf5F6HTyXRmF
 piA9j0hrQPH/Fwk9czuV708EmRmziKunCBQjtyIbjFmnoGvL6pH9RkUnTetZQCsoeX
 2b2+5hV/K2+TEasf2O7hMS63u4H1U2otIDJb7kfg0EkJoHcsIQkCPAghqi/nibFuJV
 cUPyjn52LEoQA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70E343A86296; Mon, 24 Nov 2025 18:50:09 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <176401020826.42009.7400663025827347208.git-patchwork-notify@kernel.org>
Date: Mon, 24 Nov 2025 18:50:08 +0000
References: <20251110082223.902207-1-yangyongpeng.storage@gmail.com>
In-Reply-To: <20251110082223.902207-1-yangyongpeng.storage@gmail.com>
To: Yongpeng Yang <yangyongpeng.storage@gmail.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 10 Nov 2025 16:22:21 +0800 you
 wrote: > From: Yongpeng Yang <yangyongpeng@xiaomi.com> > > The usage of
 unusable_blocks_per_sec
 is already wrapped by > CONFIG_BLK_DEV_ZONED, except for its decl [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vNbeJ-0002eV-Mz
Subject: Re: [f2fs-dev] [PATCH v2 1/3] f2fs: wrap all
 unusable_blocks_per_sec code in CONFIG_BLK_DEV_ZONED
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
Cc: jaegeuk@kernel.org, yangyongpeng@xiaomi.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 10 Nov 2025 16:22:21 +0800 you wrote:
> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
> 
> The usage of unusable_blocks_per_sec is already wrapped by
> CONFIG_BLK_DEV_ZONED, except for its declaration and the definitions of
> CAP_BLKS_PER_SEC and CAP_SEGS_PER_SEC. This patch ensures that all code
> related to unusable_blocks_per_sec is properly wrapped under the
> CONFIG_BLK_DEV_ZONED option.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2,1/3] f2fs: wrap all unusable_blocks_per_sec code in CONFIG_BLK_DEV_ZONED
    https://git.kernel.org/jaegeuk/f2fs/c/9e1244d45e7d
  - [f2fs-dev,v2,2/3] f2fs: add a sysfs entry to show max open zones
    https://git.kernel.org/jaegeuk/f2fs/c/823190ca76b0
  - [f2fs-dev,v2,3/3] f2fs: fix handling of zoned block devices with max_open_zones == 0
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
