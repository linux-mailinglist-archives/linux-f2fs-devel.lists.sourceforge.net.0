Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8H1kChPWqWnbFwEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 05 Mar 2026 20:14:27 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D894F21751B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 05 Mar 2026 20:14:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/EC5tkF188yD3m8r+j1acP/SFSY07/cQqdFhgsedEp4=; b=auOj/H4Q/xFwgl7M/jllfJombz
	dvZj0/kMv38MwcAYaxdOxU1xbjk6tgXLrn+5GxwcG4QPIY95RW+Mvct82W/9o9hVrYcUvmiw6nIc2
	iB87A9xdUUQI9iNWRzL1yGHMarsAugwGrUZYpN0fFF0rj/SQF3PD3meDCBjFqFTYKqTU=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vyE9R-0001gv-2W;
	Thu, 05 Mar 2026 19:14:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vyE9Q-0001gk-Fv
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Mar 2026 19:14:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0YCF3v/Kgr/WKXHbTOq3+GarZP8HhMG8zbJsfcrlYS8=; b=amcSrcbItQJ0rovgtk7KtwnyQT
 DCejSXUHd/uK5oWq/aiDR9Y22BPWVhcwF8blpJkcuIqZty5vZxB1iMmIdC9RhZyEvRoGy3Zl6ANlH
 a8Zyl0IEimucP4LdMB3Zgb+c3LMfWyW11Lalky+40VCA2IYVKnj3uYXTHfgeVGeA5g60=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0YCF3v/Kgr/WKXHbTOq3+GarZP8HhMG8zbJsfcrlYS8=; b=XU3XVdW0uEpt3MPTFo//TaqIAv
 MWKyLe0dPgR04jjJmwFYjNOi7Eoj0WR/rYwB/ytg9PHZLMi7mWIVUllb6C9FBziRpPb5uMmDbSCdg
 ViOeoYyHqkdrA0SHjnptbk4QZOasBYVHB4vco0APARxdAjl3cECHHkAsAgs+YV1x9B7o=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vyE5P-0001ui-Sh for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Mar 2026 19:10:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7CB7540DDB;
 Thu,  5 Mar 2026 19:10:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52D1CC19422;
 Thu,  5 Mar 2026 19:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772737810;
 bh=IcoI7FAEGaGpT92lZeRQzeoic5GPyFEZOaRI24UIwy0=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=QydOxIsQ0l+QnHMJPcWodKZ1BJ/yVM1QlEyn3CQrlOfXIxhAAStMyGHnoicYDZJrI
 Nm+K2XawDjzOhr65prN105Sw0M8Bx6g3cyRjx8rc7dG9dt8T6PT2Ad/4FGdX56NB6v
 842JdiMW07ZxQlenAfMvMWod1E8XtjaUPY4FfhQ9fB5LfKgo43BjMZgiCt1XhB1faM
 srdoTPbbMhLdGVRge7ujqbc6MZifIpkiCdrTrpLylfINTYY94YPS+k5tnZYrCFfTAy
 RfgavpIPE1Yog78Wkm/l75IxJZFaaC4QOkP+eEux43sX4d91SYELlL8bpNF6XMGIJ1
 RlGmRzNFlvdLg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 7CF593808200; Thu,  5 Mar 2026 19:10:11 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <177273781004.3248266.6110829769428952883.git-patchwork-notify@kernel.org>
Date: Thu, 05 Mar 2026 19:10:10 +0000
References: <20260213122630.287516-1-jinbaoliu365@gmail.com>
In-Reply-To: <20260213122630.287516-1-jinbaoliu365@gmail.com>
To: liujinbao1 <jinbaoliu365@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Fri, 13 Feb 2026 20:26:30 +0800 you
 wrote: > From: liujinbao1 <liujinbao1@xiaomi.com> > > During the
 f2fs_get_victim
 process, when the f2fs_need_rand_seg is enabled in select_policy, > p->offset
 is [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vyE5P-0001ui-Sh
Subject: Re: [f2fs-dev] [PATCH v2] f2fs:Fix incomplete search range in
 f2fs_get_victim when f2fs_need_rand_seg is enabled
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
Cc: jaegeuk@kernel.org, liujinbao1@xiaomi.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: D894F21751B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jinbaoliu365@gmail.com,m:jaegeuk@kernel.org,m:liujinbao1@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[patchwork-bot+f2fs@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Action: no action

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri, 13 Feb 2026 20:26:30 +0800 you wrote:
> From: liujinbao1 <liujinbao1@xiaomi.com>
> 
> During the f2fs_get_victim process, when the f2fs_need_rand_seg is enabled in select_policy,
> p->offset is a random value, and the search range is from p->offset to MAIN_SECS.
> When segno >= last_segment, the loop breaks and exits directly without searching
> the range from 0 to p->offset.This results in an incomplete search when the random
> offset is not zero.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2] f2fs:Fix incomplete search range in f2fs_get_victim when f2fs_need_rand_seg is enabled
    https://git.kernel.org/jaegeuk/f2fs/c/279709ed388c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
