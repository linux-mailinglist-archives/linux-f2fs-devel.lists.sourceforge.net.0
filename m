Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJjcL5zWqWl5GAEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 05 Mar 2026 20:16:44 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C011217580
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 05 Mar 2026 20:16:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g5kF7zoHT1tPPaKOwEVdfkLncmIiRcpbbj4G78wjsfE=; b=CGCm1laJXPN833hcEDtGqdRFMZ
	Cd1/NT6wOzDijcfBb5J3LpKL8qH+ySPQcohhO5NEt/w16UhjtWDZhzkFRk14NBAfJczIjxJ3+R6T3
	OIB9trDVpDahqj3XyP+UaMA/MZYQT903//OKaUKpCsTuuBmYjzHIHg8KyOrLmKRH2+4c=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vyEBc-0002q0-8l;
	Thu, 05 Mar 2026 19:16:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vyEBb-0002po-3Q
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Mar 2026 19:16:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OAYqzZ2ObvXvoLlK859uhR1pC15KFl/kArM9sOoRfgQ=; b=F45nAXeuhMhxuYOClAYnf4aHAj
 sA9sfYa7y8JfJjdMt1OO5pCBsnxD8IH7zRXYWv24XRBeL2ObflazvHIX8QtfxEYjDcvVW0RL9LNjE
 jxaQZBy08c4URxhsu6egtOnu5ISb873Xv5uk+gX8DGRa7ttuaJKQG1SoLXa3oMoYWlJM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OAYqzZ2ObvXvoLlK859uhR1pC15KFl/kArM9sOoRfgQ=; b=WnIvWMWL2v+Nk8n8FOVs/MF9MG
 EEtH6p4LTO5drJCKkK+vzj6uGXDuIXAmuEKSGeyLvIo2obE0BxRQQFFRLWoRxRL5ZT9bCnfRgNEpZ
 ajLERkV7RK6vxzjLgkqz1ZGBNAxrgNMJpndWX8BjtSgio3cggCTVgoFj33VIzIDqSKfw=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vyE5Y-0001v1-15 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Mar 2026 19:10:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 75BA560126;
 Thu,  5 Mar 2026 19:10:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27FF9C116C6;
 Thu,  5 Mar 2026 19:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772737813;
 bh=oY0XzNkHTv7yBJNoSUlxUyZOVkmAO3U/yiXwKeI/j98=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Q4jUTGWLECj4jp6XE7GmKranVjrwOSptoyMDj/CX7anbh73ZBNTRbo16xU8FbO8WW
 L5ZGl9Y3E2890ZK+LzEQwNGGi5hSPFeb1rn+IPww3nYgke7f/Ivr487IhgPUO4NniY
 AzpYnni6Pq8PjS1b1qD7yVN8KluJNWC39U72m6n+4sU601DPGDMaqgUK6p5ju3dKpl
 Gx5sYEY5cjXFJLbosxmVuHT3jZWWKfz6Z5EUB009bUbV2soQqaujfD0TAASXJl0PKV
 fXwMv9EY7coWcVFa4f4zVL3Dl3ec7GJoBVrrSyy/2J18eCTfExF0jCOoMOQwBpnr8G
 Ocltn7XMXFCeg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 3FDB73808200; Thu,  5 Mar 2026 19:10:14 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <177273781304.3248266.12940471035367152097.git-patchwork-notify@kernel.org>
Date: Thu, 05 Mar 2026 19:10:13 +0000
References: <20260305011810.4189655-1-huangjianan@xiaomi.com>
In-Reply-To: <20260305011810.4189655-1-huangjianan@xiaomi.com>
To: =?utf-8?b?6buE5L2z55S3IDxodWFuZ2ppYW5hbkB4aWFvbWkuY29tPg==?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Thu, 5 Mar 2026 09:18:10 +0800 you wrote:
 > We found the following issue during fuzz testing: > > page: refcount:3
 mapcount:0 mapping:00000000b6e89c65 index:0x18b2dc pfn:0x161ba9 >
 memcg:f8ffff800e [...] 
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
X-Headers-End: 1vyE5Y-0001v1-15
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: avoid reading already updated pages
 during GC
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
X-Rspamd-Queue-Id: 1C011217580
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:=?utf-8?b?6buE5L2z55S3IDxodWFuZ2ppYW5hbkB4aWFvbWkuY29tPg==?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org,m:shengyong1@xiaomi.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:jaegeuk@kernel.org,m:wanghui33@xiaomi.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo];
	RCVD_COUNT_FIVE(0.00)[6];
	TO_DN_NONE(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[patchwork-bot+f2fs@kernel.org]
X-Rspamd-Action: no action

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Thu, 5 Mar 2026 09:18:10 +0800 you wrote:
> We found the following issue during fuzz testing:
> 
> page: refcount:3 mapcount:0 mapping:00000000b6e89c65 index:0x18b2dc pfn:0x161ba9
> memcg:f8ffff800e269c00
> aops:f2fs_meta_aops ino:2
> flags: 0x52880000000080a9(locked|waiters|uptodate|lru|private|zone=1|kasantag=0x4a)
> raw: 52880000000080a9 fffffffec6e17588 fffffffec0ccc088 a7ffff8067063618
> raw: 000000000018b2dc 0000000000000009 00000003ffffffff f8ffff800e269c00
> page dumped because: VM_BUG_ON_FOLIO(folio_test_uptodate(folio))
> page_owner tracks the page as allocated
>  post_alloc_hook+0x58c/0x5ec
>  prep_new_page+0x34/0x284
>  get_page_from_freelist+0x2dcc/0x2e8c
>  __alloc_pages_noprof+0x280/0x76c
>  __folio_alloc_noprof+0x18/0xac
>  __filemap_get_folio+0x6bc/0xdc4
>  pagecache_get_page+0x3c/0x104
>  do_garbage_collect+0x5c78/0x77a4
>  f2fs_gc+0xd74/0x25f0
>  gc_thread_func+0xb28/0x2930
>  kthread+0x464/0x5d8
>  ret_from_fork+0x10/0x20
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: avoid reading already updated pages during GC
    https://git.kernel.org/jaegeuk/f2fs/c/5d143972155e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
