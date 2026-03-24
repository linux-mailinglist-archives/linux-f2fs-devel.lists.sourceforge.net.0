Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHilJLjKwmn7mAQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Mar 2026 18:32:40 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1ED31A0FB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Mar 2026 18:32:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dow6HtXs9HzZu/fK2A6v1MWsfp740yJ8ju/NjjIlAUE=; b=VKnFgfhWgns/z4Yz0NGmwLw8I7
	+p2F6pqlbFeUx0RaVnlF7BbeEFpARNsRhdutf6khFqquFFRjbqyjZPNK50Ke0KpY9NqOqTUp6iAyy
	WMSfU7PKUftIFBavab0dyEm1hefRKqj3YEYCWKScyEUNbPAyNlOUFkmNlZVZbyzqLKyc=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w55cF-0001ua-1s;
	Tue, 24 Mar 2026 17:32:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1w55cD-0001uU-MO
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Mar 2026 17:32:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WyIsIaZb95pj2DQBdr+MTW/GQzYCt7gfAF7gxmdydVY=; b=EjsY2+1ReLQpMc+4a5SYuYDPWZ
 0pANw+1qgsFlh/l3i+DZN3N/8zd+MkdDSgxY95PgNS81NvmqEwSdiv2x74xr4IPgV3wwE95smOive
 KDmvEMrq1i5PBlt0NkK6i74zdHi7I6re2yITgXqWD0Jdz9cCaVbfOInQdTtFFzEYNUOI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WyIsIaZb95pj2DQBdr+MTW/GQzYCt7gfAF7gxmdydVY=; b=X6VJqBkYUdmAz8dKTwGP1s6eRS
 ZIJkSotoORARl/0Wtx8AF1LDz7Ox6Nuv15wyX36mDeMZ00Jn5Nn3z2aww7mtE4y77/wqPfIgayjOc
 ybXTVQ0e01ZjeSedtqQQGfkl/WFWvak8QseG9E9ZNSmENKdzjK1cKwl5W+y577EzhXzM=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w55cC-0007pr-Tz for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Mar 2026 17:32:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9BFC6443C7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 24 Mar 2026 17:32:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B958C19424;
 Tue, 24 Mar 2026 17:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774373543;
 bh=H10zgJWacjix9t0rWOWwAHj3KVClFGNzPr8DVOaDYjE=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=nvxwR1V+9vbEJZBDfTa2diIuW2PHn6mRXd1buIVvmxMfJw5BKAE+XTJeo9uoMxBjL
 0pybdVBJwcxBXYTHV8Jgto9efijJh4nruYqpyy/4zgZJCH92cHIUPM7zgf3Z8JcAmw
 SyMQg7U7K1E1aKb9xcUSopNGG6G5RuTjZ/47bc1KbbU/4QG4VQcVSbijELcqQKS5DD
 t50m8RoYmUYugOf5zsosqQplab6byjLsPq3L4m+PQ/h1hd/2zktBrKM3DTUj/nRSBT
 G0RcVm3yRflIJrv+DxKnpGOognTs0D/kWvwDDkGdBtAOMh+ZJZFFcPn0FJ3Hu8TNfF
 5Jpe/cVRnF1Mw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 7CCDB3808203; Tue, 24 Mar 2026 17:32:12 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <177437353128.1223048.4639198904019180546.git-patchwork-notify@kernel.org>
Date: Tue, 24 Mar 2026 17:32:11 +0000
References: <20260323083834.156393-1-chao@kernel.org>
In-Reply-To: <20260323083834.156393-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 23 Mar 2026 16:38:32 +0800 you
 wrote: > f2fs_handle_page_eio() is the only left place we set CP_ERROR_FLAG
 > directly, it missed to update superblock.s_stop_reason,
 let's > call f2fs_handle_cr [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w55cC-0007pr-Tz
Subject: Re: [f2fs-dev] [PATCH v3 1/2] f2fs: call
 f2fs_handle_critical_error() to set cp_error flag
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[patchwork-bot+f2fs@kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: 1F1ED31A0FB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 23 Mar 2026 16:38:32 +0800 you wrote:
> f2fs_handle_page_eio() is the only left place we set CP_ERROR_FLAG
> directly, it missed to update superblock.s_stop_reason, let's
> call f2fs_handle_critical_error() instead to fix that.
> 
> Introduce STOP_CP_REASON_READ_{META,NODE,DATA} stop_cp_reason enum
> variable to indicate which kind of data we failed to read.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v3,1/2] f2fs: call f2fs_handle_critical_error() to set cp_error flag
    https://git.kernel.org/jaegeuk/f2fs/c/bd882ffdd48a
  - [f2fs-dev,v3,2/2] f2fs: use more generic f2fs_stop_checkpoint()
    https://git.kernel.org/jaegeuk/f2fs/c/be09d78b6d54

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
