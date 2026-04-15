Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIdmAwvC32l7YgAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Apr 2026 18:51:23 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7949F4067F8
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Apr 2026 18:51:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ka1UY462pnTcws2/5ZsuxRipeFtXwrNjvguAWAz09u0=; b=SEcQG9w3YZncblo89RLjsh0ZJv
	mRyWPxXWUyuI810dsRlXF2FPO66R2HYM47327CnTyzXHF8cWnFWx1emH5y8EzU8FGK9xXgLa9aTOW
	SkNGYABszK2ma/7/ghFmx8CwZ/O3LVBSMo3o6FMS5vYu3F4z4MJK0U5R8QNb2B6xBLgU=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wD3SR-0007rp-QE;
	Wed, 15 Apr 2026 16:51:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1wD3SE-0007rU-Jf
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Apr 2026 16:51:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1sdRIyCQ0PJsfszbhXqi3yaNhaQDfvshjm80uM4cGRI=; b=WLVewlNyWG5ftMblWo3QtERc4o
 wfE3uI3AftarjGW99ylzBi73HpEi6kUniBdkmklVGWEMgU3Fmo8VcxBy1xd+1ygjliuVrRJvdBxtH
 1nKWpwgJxg3R4xLJ3H6YoYwqqvml/I5E8DRf6MbYa6of1Rjw8SFgnwAcH3Y4DgxGWD9c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1sdRIyCQ0PJsfszbhXqi3yaNhaQDfvshjm80uM4cGRI=; b=PcfS03y1EQmz971bTVfUviD7ww
 R5jEPUYKSzLQ0JmyEFQ19+1hqaaTniAxfEn+SVcu9/hIhdgdeoIrJBitP97XHmZJXVmOiaFm2Lttv
 V1cdmrhcAzTNykvN4AT2mWeUa02VmmKzIK0EwJMGjcoAoQxNJzBTbwmsN9kSek1lAay8=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wD3SE-00017O-3I for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Apr 2026 16:51:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 48D3E60121;
 Wed, 15 Apr 2026 16:51:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2CDFC19424;
 Wed, 15 Apr 2026 16:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1776271860;
 bh=3UKuoCnbWCPi5AYoqbT0nYhFKSG8ZJdM+2Nrf/ObEDk=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=UANLjVv3B9f/my/m42EJsEH4CoHDFTuljwaH3ccj/pXjtiGwYXTXnX2FT8gZCjJG0
 9+20ietESzcRAiNiqZ00CVDaU+7LKJ28HOOtIgRa/2Tm9vgKRNlVI4Pybv0jndauNg
 cGTESFfNRty/aXTAialutlbZzz0PfOyfNGe3I3wAoYwzCucSfAIjyz6KmPogRR7A/o
 twP7m5owPR2ximfMAyyvFINZyir6BWSrAXWGoDCeTnjtvWgOxccdjRS5O1CdVGyFtF
 n2M5PtT0aOsr4Ag/DFf0xvdXA/n5nm5cVjwDhT4wrUH2FZj+cfiEMMsEFE+Lg9HyAR
 dJD4v8I9YUvVA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 B9E95380A963; Wed, 15 Apr 2026 16:50:30 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <177627182951.2303073.12530611590767736509.git-patchwork-notify@kernel.org>
Date: Wed, 15 Apr 2026 16:50:29 +0000
References: <20260410150537.1683974-2-monty_pavel@sina.com>
In-Reply-To: <20260410150537.1683974-2-monty_pavel@sina.com>
To: Yongpeng Yang <monty_pavel@sina.com>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Fri, 10 Apr 2026 23:05:37 +0800 you
 wrote: > From: Yongpeng Yang <yangyongpeng@xiaomi.com> > > An extension should
 not exist in both the cold and hot extension lists > simultaneously. When
 adding a [...] 
 Content analysis details:   (-0.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1wD3SE-00017O-3I
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: disallow setting an extension to
 both cold and hot
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
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:monty_pavel@sina.com,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_TO(0.00)[sina.com];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,xiaomi.com:email]
X-Rspamd-Queue-Id: 7949F4067F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri, 10 Apr 2026 23:05:37 +0800 you wrote:
> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
> 
> An extension should not exist in both the cold and hot extension lists
> simultaneously. When adding a hot extension, check whether it already
> exists in the cold list, and vice versa. Reject the operation with
> -EINVAL if a conflict is found.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,1/2] f2fs: disallow setting an extension to both cold and hot
    https://git.kernel.org/jaegeuk/f2fs/c/b8b902fd57fb
  - [f2fs-dev,2/2] f2fs: protect extension_list reading with sb_lock in f2fs_sbi_show()
    https://git.kernel.org/jaegeuk/f2fs/c/5909bedbed38

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
