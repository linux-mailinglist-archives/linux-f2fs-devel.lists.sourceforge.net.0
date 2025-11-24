Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E44CC82290
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Nov 2025 19:51:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wQ+tWL7mPOY19z/StBYUuMA9xbTaU5gNWzy3mHDWYo4=; b=hotsIYjk9MDlLnMCN2xXQ7gReX
	pWOxTtziUrd703MplTj1iGGFpPVxWH4ugy9ErWasy6PgCfKVBvFTsX1L0V5654iRVdMmq+EgKrW27
	4za6u6JVHPJt2qw9MRw46OSFaSugFjuTYf0TALAryo9bDhAfLGMVNQtxT/o89f86dyWk=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vNbeR-0001ud-54;
	Mon, 24 Nov 2025 18:51:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vNbeP-0001uO-Tt
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 18:51:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V2u+27z6kuqQ6PV9MyNbRAN/0gwxXiTH3bc1VAlDiig=; b=CKqmahCzCAbSiZZU5rffMDyvze
 wMOUkEUVk7vOn4zl5wr/c2Z7TTHmftK5Sdj4SdiPZJYaQjIJLdRA+rGddomYp1pcnbKAlQHRH0bFI
 mzOmI7drYC477YWsql2Xr7boV2aHvZFNMemXl1xbiWRkMwv6EZTFGlk+RYruviJsZdw8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V2u+27z6kuqQ6PV9MyNbRAN/0gwxXiTH3bc1VAlDiig=; b=SopS9e5nA1VLXHgtSYfVOiTij+
 VijP5QyCC7CidgLQTYClmgIRePf7A13f1KDGQovTsMAafIt424MkkPCZBpQUKtrJktCx3SdoQ6LhI
 BvjnVzGbsQoIHAVQ1Amo6APGUl/qzYFlnCg7l2DEcuBYduul2KFFi5zWuAD+uVnMgTC0=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vNbeP-0002fY-5E for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 18:51:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 962EF601E8;
 Mon, 24 Nov 2025 18:50:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4312EC4CEF1;
 Mon, 24 Nov 2025 18:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764010255;
 bh=ZlK/4H05DLojINQDJP3H0QFDwaycUmg2yoM6N1gwdrw=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=J9G0ahgVEx487Lw3wa7hN0FftApabQVvxM0k93u0UTB4OgTYkxclaAbwqZMZ8lztQ
 ucRp93n4BC76iO5/C2DJMbh8CRZXQsl7sQnac5fQAajRdDZXyHOlhvTsL1JvtOYd02
 J3o2O4mQSGVRNi9AamxP7Hm4/4RFU7zUP7LFNSgRmL2sOOnZNvObcRrTZfMgbrCN87
 ekBQIpwQ7n4X5Onmdkf5x4Ss9CsV9QdFAToQwxRQGc9OKgSIEWDi0ooPWHlzAFG5Ya
 PTOZTId+IUbuobJDKFg00iaOmQpA4fKDfmqRMapXvlFYBRQbOIMYoMcag1LjY0/lMi
 wjJWWfLVZAFtQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 712783A86296; Mon, 24 Nov 2025 18:50:19 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <176401021825.42009.3887972145540432748.git-patchwork-notify@kernel.org>
Date: Mon, 24 Nov 2025 18:50:18 +0000
References: <20251111061051.337547-1-hexiaole1994@126.com>
In-Reply-To: <20251111061051.337547-1-hexiaole1994@126.com>
To: Xiaole He <hexiaole1994@126.com>
X-Spam-Score: 0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 11 Nov 2025 14:10:51 +0800 you
 wrote: > When active_logs == 6, dentry blocks can be allocated to HOT, WARM,
 or > COLD segments based on various conditions in __get_segment_type_6():
 > - age ex [...] 
 Content analysis details:   (0.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [172.105.4.254 listed in dnsbl-2.uceprotect.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vNbeP-0002fY-5E
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix has_curseg_enough_space to
 check all data segments for dentry blocks
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
Cc: jaegeuk@kernel.org, stable@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue, 11 Nov 2025 14:10:51 +0800 you wrote:
> When active_logs == 6, dentry blocks can be allocated to HOT, WARM, or
> COLD segments based on various conditions in __get_segment_type_6():
> - age extent cache (if enabled)
> - FI_HOT_DATA flag (set when dirty_pages <= min_hot_blocks)
> - rw_hint (defaults to WARM via f2fs_rw_hint_to_seg_type)
> - file_is_hot(), FI_NEED_IPU, f2fs_is_cow_file(), etc.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: fix has_curseg_enough_space to check all data segments for dentry blocks
    https://git.kernel.org/jaegeuk/f2fs/c/6d87364f7e94

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
