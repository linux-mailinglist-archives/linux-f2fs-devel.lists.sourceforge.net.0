Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8VIQOWimVWqJrQAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Jul 2026 05:00:56 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 790F3750860
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Jul 2026 05:00:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=XH+1TTyZ;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=Tc2Vt1YE;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="DkLG//h4";
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=msYO7tv1;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EubFl9x98t8CeGUAOEz6b181/p8ndBQrq6zh2/iBszA=; b=XH+1TTyZa0iV2MnOD+W6vu2DdU
	LX/yi5pzXEqH85DpmF0kHd2PNdZx5vE28QgBPfHegtimj4QisKCMRYRnF/+DgZVyWuTw/tagK3qAR
	tfKNntVlGZ6gG2XU4B04mt535Uk3YaY7VFn4LSBAXmmnrpkmLxvHVSMD19LTUerSTMqY=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wjTO8-0006y6-Vs;
	Tue, 14 Jul 2026 03:00:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1wjTO4-0006xZ-5Y
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Jul 2026 03:00:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cJfr09HfW+vVROQ0irOyEMo1PMk8FVcLJ1dq0f25jco=; b=Tc2Vt1YEPcpp5nBeaJt/FC64Ww
 6kAdJHCQGpnyzitXXeJcX7aqZjaP+uvli6tUH/4cAcb/Ghod4jdMeQDNIW4BNTgsHlb2Vp8m4WKZV
 ixujBgmkgm9ZUbS3u+6AHliM4mIsk+eGQuheoe6jByYQFWkAysslbq7dso9hsmQH4jJA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cJfr09HfW+vVROQ0irOyEMo1PMk8FVcLJ1dq0f25jco=; b=DkLG//h4E3bRgETc6BUhXNG1Oq
 +WkjlO5cVEJtI7JCC8MIYgWgKT7SflsDgFqUqvMMZNSMXBVG7L2Ak2xIZvKcOVdzoA0kA54exSLh6
 pqo3rEu3pXnKoR0Opahgw8Hcj18gOM+wNC5CpFl4rjLTXKUkQMox4Xx0U5g9IoHBb+Xs=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wjTO3-0000ko-J0 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Jul 2026 03:00:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 3C39F43C57
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 14 Jul 2026 03:00:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F7B91F00A3A;
 Tue, 14 Jul 2026 03:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783998037;
 bh=cJfr09HfW+vVROQ0irOyEMo1PMk8FVcLJ1dq0f25jco=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc;
 b=msYO7tv1CAwQ6+UGegDf/eYq057+WiMTxfUijLZ8RMaIhMpgYkv/gG29SNgT94947
 c6s5a9gpZOlaTW0jYz/XjN5gBvQOpIXhWQiy+4qKJto3o9wTQJV4piu3dEW9+vazA3
 PHE3WzFqTiIKFKEdblcTqgu1TvIRWFHd6cgajg/xEGBgDsH0ISPEugAGh7oLa1RbZB
 a2K3gJKM7h4dx5bDHGxf7LJ/Q4LvIclqvqqyKgLbxGUVL5WPkbTsCeppZKsalfKjUi
 7rQ71QtQJiqqghJxYyiaOkjjeC5Cj/amcxD/Nu+Akz+J2C3pZE9CqBaN5TFp4Y0hNC
 9q/cJOBzJjPTQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 5689A3924FB7; Tue, 14 Jul 2026 03:00:13 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <178399801188.2939750.4882347111407604068.git-patchwork-notify@kernel.org>
Date: Tue, 14 Jul 2026 03:00:11 +0000
References: <20260706072606.3709384-1-chao@kernel.org>
In-Reply-To: <20260706072606.3709384-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 6 Jul 2026 07:26:06 +0000 you wrote:
 > generic/794 4s ... - output mismatch (see
 /share/git/fstests/results//generic/794.out.bad)
 > --- tests/generic/794.out 2026-06-12 08:46:32.766426241 +080 [...] 
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
X-Headers-End: 1wjTO3-0000ko-J0
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to zero post-EOF data when
 extending file size
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:stable@kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCVD_COUNT_FIVE(0.00)[6];
	ARC_NA(0.00)[];
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
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ALIAS_RESOLVED(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[patchwork-bot+f2fs@kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 790F3750860

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon,  6 Jul 2026 07:26:06 +0000 you wrote:
> generic/794  4s ... - output mismatch (see /share/git/fstests/results//generic/794.out.bad)
>     --- tests/generic/794.out   2026-06-12 08:46:32.766426241 +0800
>     +++ /share/git/fstests/results//generic/794.out.bad 2026-07-05 18:32:55.000000000 +0800
>     @@ -1,4 +1,16 @@
>      QA output created by 794
>      append_write
>     +FAIL: non-zero data in gap [4080,4096) after shutdown+remount
>     +000000 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  >ZZZZZZZZZZZZZZZZ<
>     +*
>     +001000
>      truncate_up
>     ...
>     (Run 'diff -u /share/git/fstests/tests/generic/794.out /share/git/fstests/results//generic/794.out.bad'  to see the entire diff)
> Ran: generic/794
> Failures: generic/794
> Failed 1 of 1 tests
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix to zero post-EOF data when extending file size
    https://git.kernel.org/jaegeuk/f2fs/c/7e097cad3ac1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
