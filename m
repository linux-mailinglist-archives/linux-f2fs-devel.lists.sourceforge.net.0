Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Yl5NOWimVWqIrQAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Jul 2026 05:00:56 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C6A750863
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Jul 2026 05:00:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=DeBiLxjv;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=ev6R6AsD;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=dahGgYnt;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=G4v6PmXJ;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mn1TTQtBzaGB6tZn2vuQv3P4Elb2nBoQ58thuo0Me6Q=; b=DeBiLxjvoeSTWQbKT3Y9/VAWDY
	RPX+JMWP/4HzqSCLEXCNULRpaTsJ0vl0T5UVarR8rg2m9t2so87pQ50G8u2YaAaA/KpUAMm2KJpPr
	SQ9uogJk8ywPc8G/QHIlSRAmt/Ef/+wLEnjAT/Xz3GhMD3ZgSZZj38PdhzOtHQS1K1vs=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wjTOA-00063r-Ei;
	Tue, 14 Jul 2026 03:00:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1wjTO1-00063f-2J
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Jul 2026 03:00:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zChAImWOrlDN51gcoddbdazwdae3tP6/MAG5aFHKXeI=; b=ev6R6AsDjNxNzKsH1OsvwOxMnk
 nB1Y1NVFVxguP1kFaZQ6cziNJz34VdmXplCKB501v8unKLMCKGacWxrFRMtFUOymfuQFSBujE5v5i
 zrjTqVt5oNRw58IHLruN0lA5n2UpYhb2h/OPLVbnn/y7uEWmckpuYUjzrMYWxJ9aqIgg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zChAImWOrlDN51gcoddbdazwdae3tP6/MAG5aFHKXeI=; b=dahGgYntzpKNwECUxC6IgnsRgr
 rZdby+V7JR6N8Ts7lyFC4iyVPLLu/4OjqnATavpu0Ku8s9naslgXAhc6miUtEGQuwcY+lqf/5HiqW
 w9JF/+6NR/4w8GmpqGvn8JeMynt+qaDhB0I1z0RhbjyE9nzkPYDKkX+boR6K3CPvx6oQ=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wjTNz-0000ke-Gg for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Jul 2026 03:00:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id E4BB3601DE;
 Tue, 14 Jul 2026 03:00:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 997BC1F000E9;
 Tue, 14 Jul 2026 03:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783998032;
 bh=zChAImWOrlDN51gcoddbdazwdae3tP6/MAG5aFHKXeI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc;
 b=G4v6PmXJCDJwnX6/hwmigLLg1xAapqTTBAu80i0vuAAlJbODU398uwrDQrgK6/h66
 ZdNlh/R+NZivJuqcKj27NVluxBTmSogc5SLArhv/cBWi0xbeQEA7d9zstgljrVq3c6
 NNYglqlTqHay6hxtJtmWkqtxDTuaBmt9Ucy3YUvZqTzwRW3hs3oluaVbgnTyYEUNDd
 JyLjlrEzgHgpLCz7I6c9BpQchpRtOrz+A35uMNFE94QqsEds5vq86qZo0UIYGb4Mq6
 1Nr9uIS89Ffvnp1ksXXdTKswKPEkw/XXHTmGlKJTGm+ApIcprb3RWzeN8aBQv3MItn
 nYhBHRl0AvlgA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 D0A213924FB7; Tue, 14 Jul 2026 03:00:08 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <178399800738.2939750.5347430287438781500.git-patchwork-notify@kernel.org>
Date: Tue, 14 Jul 2026 03:00:07 +0000
References: <20260629114918.224537-1-chao@kernel.org>
In-Reply-To: <20260629114918.224537-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 29 Jun 2026 11:49:18 +0000 you
 wrote: > Blocks of pinfile may not aligned to section size due to wrong use
 > on pinfile, result in heavy overhead of GC, let avoid this by > adding
 additional c [...] 
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
X-Headers-End: 1wjTNz-0000ke-Gg
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid potential
 section-unaligned pinfile
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
 stable@kernel.org, linux-kernel@vger.kernel.org, daehojeong@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:stable@kernel.org,m:linux-kernel@vger.kernel.org,m:daehojeong@google.com,s:lists@lfdr.de];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[patchwork-bot+f2fs@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 98C6A750863

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 29 Jun 2026 11:49:18 +0000 you wrote:
> Blocks of pinfile may not aligned to section size due to wrong use
> on pinfile, result in heavy overhead of GC, let avoid this by
> adding additional check condition in f2fs_setattr().
> 
> - truncate -s 8mb pinfile
> : random checkpoint may persist filesize w/ inode
> - fallocate -o 0 -l 8mb pinfile
>  - f2fs_fallocate
>   - f2fs_expand_inode_data
>    - f2fs_allocate_pinning_section
>    - f2fs_map_blocks
>     - f2fs_map_lock
>     - __allocate_data_block
>     - file_need_truncate
>     : w/ FADVISE_TRUNC_BIT, we can expect unaligned mapping can be
>       truncated while open() if f2fs is not umount abnormally
>     - f2fs_map_unlock
>     : following f2fs checkpoint and sudden power-cut
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix to avoid potential section-unaligned pinfile
    https://git.kernel.org/jaegeuk/f2fs/c/bf4272cef5ec

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
