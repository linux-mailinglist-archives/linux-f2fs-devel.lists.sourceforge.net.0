Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2OyLBNjbD2ojQgYAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 May 2026 06:30:16 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C48A05AE9F2
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 May 2026 06:30:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sAaIK2JNEtBdSciYAmL2ZXKc7aIdebxs2B8hYOYNslU=; b=P8FCyWf7PGFZFKpBKSZSt4xBiM
	Kkb1uSQzHtO+HGupu7KZd8qH8uQlU1v0uPXSzVeyMlwtXejubcve4Rihe/NyZI+kOutMmuh84ccNX
	6neowflrDXhnH8MNGtl4U2dt2jOkW5sP5+AirEySNrw/6igqSrctd7+pTFqNeOtPlvA0=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wQHWW-0004pW-2u;
	Fri, 22 May 2026 04:30:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1wQHWU-0004pP-8o
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 May 2026 04:30:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mPnxaM1WRSuU791cpIdpn6BVjmAy9+RyCqbQsLl8vO8=; b=eIehQhjVA9GIyluey7vwMFM0g8
 /wRiXx1MO9I2L2Tv5G1jiRLTFbROXiDQy4NCmyPMXfBHSMNFZQ7dXYyhDeDpad0CRS6Lt3o3xfRSK
 WgMX46yZZZoDGjgudhYBWWW8OVkrg363Gty7a+DddXyeFHPhqUCNV35cemTu6nmEXXpA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mPnxaM1WRSuU791cpIdpn6BVjmAy9+RyCqbQsLl8vO8=; b=e4UxNSA8ZF1e7TwAYpA9Wrx2T8
 GLk7v1xFQb7KOX0PAL5bTcw253lJ4vH5xP5MGqR38d+FzqMqWwHZzKqXvtua9HMgvJcHPQRkCwJ/n
 PmSq895zxCtRles3JzNu/Bn349G7TOSdRYPpcnz570e9CdPuasVP/Lczm3RESz4100Uc=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wQHWQ-0007Sd-UN for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 May 2026 04:30:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id F323741892;
 Fri, 22 May 2026 04:29:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5B891F000E9;
 Fri, 22 May 2026 04:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1779424196;
 bh=mPnxaM1WRSuU791cpIdpn6BVjmAy9+RyCqbQsLl8vO8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc;
 b=bEea72xixIDiWFIqYWH/XtIQKSPx9TtKeixs/3itU6D1Kjt2/XcevRLMP90n7d6zm
 DeyXOoipGSgW9p6YJ2xB08E1bBK3dsHwIEf+S8a79DamqrwnW2hGyhzbXu7jkP50Lq
 6wOR3shcByG7QqTrUxrZU6kD9FM8IF4y4PaZjth19b/4aomKqs73lmqXbfDh7Lrfoc
 VPjVjXWaKFEUwZOxlsq6vkPfdu3ZiPmiMEIPkcwH5ER/13R+3hBeTIaWRcQtzu+ebV
 4+Z3s+k55vRwxM7te84NhoaeSoj7rIuCEWRmNTIfMTapAINVPbJWj/p2ydYfDUDMCg
 Nvx9yWMncFtGA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 939403930E41; Fri, 22 May 2026 04:30:07 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <177942420615.624124.15880655072071965222.git-patchwork-notify@kernel.org>
Date: Fri, 22 May 2026 04:30:06 +0000
References: <20260521021505.1357466-1-chao@kernel.org>
In-Reply-To: <20260521021505.1357466-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Thu, 21 May 2026 10:15:05 +0800 you
 wrote: > - ioctl(F2FS_IOC_GARBAGE_COLLECT_RANGE) - shrink > - f2fs_gc > -
 gc_data_segment > - ra_data_block(cow_inode) > - mapping =
 F2FS_I(inode)->atomic_inode- [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [172.234.252.31 listed in list.dnswl.org]
X-Headers-End: 1wQHWQ-0007Sd-UN
Subject: Re: [f2fs-dev] [PATCH] f2fs: atomic: fix UAF issue on
 f2fs_inode_info.atomic_inode
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
Cc: jaegeuk@kernel.org, stable@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, daehojeong@google.com,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:stable@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:daehojeong@google.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo];
	NEURAL_HAM(-0.00)[-1.000];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	HAS_REPLYTO(0.00)[patchwork-bot+f2fs@kernel.org]
X-Rspamd-Queue-Id: C48A05AE9F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Thu, 21 May 2026 10:15:05 +0800 you wrote:
> - ioctl(F2FS_IOC_GARBAGE_COLLECT_RANGE)		- shrink
>  - f2fs_gc
>   - gc_data_segment
>    - ra_data_block(cow_inode)
>     - mapping = F2FS_I(inode)->atomic_inode->i_mapping
>     : f2fs_is_cow_file(cow_inode) is true
> 						 - f2fs_evict_inode(atomic_inode)
> 						  - clear_inode_flag(fi->cow_inode, FI_COW_FILE)
> 						  - F2FS_I(fi->cow_inode)->atomic_inode = NULL
> 						  ...
> 						  - truncate_inode_pages_final(atomic_inode)
>     - f2fs_grab_cache_folio(mapping)
>     : create folio in atomic_inode->mapping
> 						  - clear_inode(atomic_inode)
> 						   - BUG_ON(atomic_inode->i_data.nrpages)
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: atomic: fix UAF issue on f2fs_inode_info.atomic_inode
    https://git.kernel.org/jaegeuk/f2fs/c/6a59aa5442e3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
