Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YiG5AGmmVWqMrQAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Jul 2026 05:00:57 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 80247750861
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Jul 2026 05:00:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=bkyxVWSL;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=ktjdjO8y;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=fucOcfIR;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=kYF+UtVR;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=89wW76nICHja3t46dEJKHHNmd2M0Wq5IL/gNsvzv+9Y=; b=bkyxVWSLH+LJ+MO6qe4EwfpVre
	Lm9Rp5G8kShMIjex/zyD+R3neNurYVN6LIZ1yRDGV+m5UJAS/UrTXW1K8iCpucOWjdAOp6PUQx2O7
	srsGW4J4jyHPM5Nq0GJ/eUONJM4HnpEgl4YmuZj/W8mhUEgpUscsE+u+eteQXMUGj9NE=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wjTO8-0006xu-HJ;
	Tue, 14 Jul 2026 03:00:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1wjTNz-0006xM-Jz
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Jul 2026 03:00:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IjExG8SLdFmswT+7SNT2VlWPxv/Kx5sx61AUKIoe19k=; b=ktjdjO8ynUORKEqSHFPpYm/iyP
 lmpl/+p9yyVk4E3wc70aaz9j+EvPh3MAqbTRp7DuVHiIYXyYQpzQOL2hW3GI4LoL+KpLT0YpL5rl7
 TvJzsFs7mC90XJ7QdLgk2O1rj8nybBczx7SqsAd9+FyWjbn+Fcc18NA69YaUDuyq0n68=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IjExG8SLdFmswT+7SNT2VlWPxv/Kx5sx61AUKIoe19k=; b=fucOcfIR9VaX3PodPqlj4XiCDM
 dDdVu4o5LR0lm8qN9Bm298b+Q3GsVN9e9BJWTOWCratNRN994HgSkUyIcrr1fFWHDZGgxyQXfzeKN
 lzmlZTFTR4Px2Ba4hb9uVVEsSr6vZCybBLJ5JZ8xNlHA76btVwn4y3wU5kwZdUt7ExRE=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wjTNx-0000kV-62 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Jul 2026 03:00:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 3BC0343C60;
 Tue, 14 Jul 2026 03:00:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EBD71F00A3A;
 Tue, 14 Jul 2026 03:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783998034;
 bh=IjExG8SLdFmswT+7SNT2VlWPxv/Kx5sx61AUKIoe19k=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc;
 b=kYF+UtVR/Z+tP0BDgQMNjRPnXw/M1HHg6GG8xmZiCLxUHcREwRJ9Dq/s9SNan6N4O
 cjm+O/x6W31Uh9sWN+fcjRdaD1SYFJ3EU1IkDR6JX5iYquZcCFF3f4B+V0PZxgpoNn
 WPtCqoX3HP7DMihqIGnfMZKamifF1wAKGJZsrl9dZgq1yW0n6ZI58LSPmKVlb9zWsN
 UfVQtWoj7a7321ZQiOwTblibHG7n0z75SpVD4oASjSsR3wAgOFN2R76vdmI6ND2hOp
 XVCQhLM4MtCyaJd+v4JQbVWS9xli5UYj7gm0fdnpmRANegx/9giENWGoW+9+owwwRt
 ZpaNhIZpSzLTQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 569EF3924FB7; Tue, 14 Jul 2026 03:00:10 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <178399800888.2939750.13968624423667195416.git-patchwork-notify@kernel.org>
Date: Tue, 14 Jul 2026 03:00:08 +0000
References: <20260713111944.924883-1-zhaoyang.huang@unisoc.com>
In-Reply-To: <20260713111944.924883-1-zhaoyang.huang@unisoc.com>
To: zhaoyang.huang <zhaoyang.huang@unisoc.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 13 Jul 2026 19:19:44 +0800 you
 wrote: > From: Zhaoyang Huang <zhaoyang.huang@unisoc.com> > > Our v6.18 based
 Android system is continuely suffering livelock and bad > page stat as shown
 in[1] [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wjTNx-0000kV-62
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix folio_nr_pages() race after put in
 large folio invalidate
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
Cc: huangzhaoyang@gmail.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 jaegeuk@kernel.org, steve.kang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zhaoyang.huang@unisoc.com,m:huangzhaoyang@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:jaegeuk@kernel.org,m:steve.kang@unisoc.com,s:lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.sourceforge.net,kernel.org,unisoc.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[patchwork-bot+f2fs@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 80247750861

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 13 Jul 2026 19:19:44 +0800 you wrote:
> From: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
> 
> Our v6.18 based Android system is continuely suffering livelock and bad
> page stat as shown in[1] which related to broken xarray slot status. By
> investigating big folio operations within f2fs, we find below races and
> fix it by get the nr_pages before drop the refcount and folio_lock.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix folio_nr_pages() race after put in large folio invalidate
    https://git.kernel.org/jaegeuk/f2fs/c/aebfda7985f6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
