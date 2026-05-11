Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFXGExo0AWrPRwEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 May 2026 03:42:50 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB28507058
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 May 2026 03:42:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VwNQa4r8QVuI8jIh43l6seYpMN9cMLjzAlbTKc2GwUw=; b=S94gKVqn9B6C2wSckb0GTmClmq
	SZzLliTvw+91TNL1+bPjK0hhwdnRtlvdIroIRd2YuCacF+W4EayoSCEYPjycMmPRbzH3rsrsMOuSi
	dfeihPmjgl5a46fqbNQAgoII9gPZLC13iN7AcLwUbtiaTEUo3ymm79KWFuUQZI9q/6o4=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wMFey-0007db-5d;
	Mon, 11 May 2026 01:42:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1wMFew-0007dP-My
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 May 2026 01:42:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XceJd7t51sFiVBjcaLRuIItPtImpbhV0ssBquxFiOrM=; b=gMK0qalBJYOLCln69TeL56Hd1Y
 EDwiqXMQd7PsI+NE9uIDFIPCxTc0YLTPMYE1dG+ebkRVE6oB7ObHAzVhwl+3hRaTVGJfHWVmRPQA6
 kqLPe7cQBhuvrfYK/z89BK4/yx5VtwmufmoG9j0r9CPXxuKi8ruIsSCAHCWSsW6QX1ns=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XceJd7t51sFiVBjcaLRuIItPtImpbhV0ssBquxFiOrM=; b=DdWUxPK5vkEV52FL88fM4gIbuo
 dX2aSEjUe40pAQvS7eRqkLPfa9UXCfQh5yx54rbDasRpvbuovGlglsnHV4Ff++vwJVslAcJoH2tQH
 T4uYRs03rWxKkKqHlG3w1btu+2BDDCgM/fbFqpifbw3T+nLuYOvt+6QXZVyfdJmfRRNw=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wMFew-0007BZ-UN for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 May 2026 01:42:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3D9C660141;
 Mon, 11 May 2026 01:42:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E070FC2BCF6;
 Mon, 11 May 2026 01:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778463723;
 bh=664IJjAnAygTswmMXcF4pR+ZLCEzxvR7rupLK9cmhDc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=eSOqaTlCgVRKrAN3+Rh4c/kO+h9bEdRH9q6nZZbzMilQwr11cf2fsetVGQ9MTb86d
 5F96/Njjr0v58HvCY3RVHeYfE13tKGa/HY03rwl+TGr+UhB622vTe26lLdeurtJEIP
 So+slAx8KtmQ0IQX1LccFv7iZt9iHJlF2S8g7cfZM+6vtMwdxK8LFQK0TpQaFiTWzx
 v90uPaZv8S777qMWPq2BeiJX0nUQED7sPS8JeVPU0bfNGuRyTGRWkvSaFqT90IrvXH
 XUxC/nG3f7wAomFdr9h8iNKgqPFJ5xBORlDt3uLSVNfQnmL2AY9zG4prHw1JVKwn3l
 fk7x5BWNk+hWw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 3FD373930039; Mon, 11 May 2026 01:41:12 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <177846367082.1975880.2219593075807380790.git-patchwork-notify@kernel.org>
Date: Mon, 11 May 2026 01:41:10 +0000
References: <20260506010709.3287111-1-zzzccc427@gmail.com>
In-Reply-To: <20260506010709.3287111-1-zzzccc427@gmail.com>
To: Cen Zhang <zzzccc427@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 6 May 2026 09:07:09 +0800 you wrote:
 > f2fs stores mount-wide activity timestamps in sbi->last_time[] and > samples
 them from background discard, GC, and balance paths without a > dedicated
 lo [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URI: fastly.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1wMFew-0007BZ-UN
Subject: Re: [f2fs-dev] [PATCH] f2fs: annotate lockless last_time[] accesses
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
Cc: baijiaju1990@gmail.com, jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 2DB28507058
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,lists.sourceforge.net];
	FREEMAIL_TO(0.00)[gmail.com];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zzzccc427@gmail.com,m:baijiaju1990@gmail.com,m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[patchwork-bot+f2fs@kernel.org]
X-Rspamd-Action: no action

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed,  6 May 2026 09:07:09 +0800 you wrote:
> f2fs stores mount-wide activity timestamps in sbi->last_time[] and
> samples them from background discard, GC, and balance paths without a
> dedicated lock. The timestamps are used as best-effort heuristics to
> decide whether background work should run now or sleep a bit longer.
> 
> The current helpers use plain loads and stores, so KCSAN can report races
> between frequent foreground updates and background readers. Exact
> freshness is not required here, but the intentional lockless accesses
> should be marked explicitly.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: annotate lockless last_time[] accesses
    https://git.kernel.org/jaegeuk/f2fs/c/c4bbbc96e530

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
