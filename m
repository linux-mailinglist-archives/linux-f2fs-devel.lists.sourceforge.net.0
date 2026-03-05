Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 1iy+N17WqWl5GAEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 05 Mar 2026 20:15:42 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B0A217542
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 05 Mar 2026 20:15:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sLZ+Vbvz6qEAGmuFK5OzH2PEYb1H7kco1ZUM9Dn5S6g=; b=bB4LuMgR0/qFV+P4s+O52NGZFi
	zzJzLSbrBLhdS46ZaC0Iv5oo6gHU1SJ9wQ+cUVaF8NdN3MzVWWKZ+Coro+ELvA+JPEz1nBfn+Mkpe
	07D2no4v9QWDTHN+vYcx5QibKsdNYyMnjScF1qhwVilYxkhQnT/ZkSN+KqbmWR88HwVk=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vyEAd-00066X-A6;
	Thu, 05 Mar 2026 19:15:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vyEAb-00065x-VT
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Mar 2026 19:15:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y15WXs6HXCwJiCLEgssxPnbyafcgj2xPY1KE48yto+o=; b=Uxdtk9bz5BQFzdHNwjmPeEON3x
 OezWI9rKZXWuxHZ0cm+akpp47AhYYYePIv0fbteFV5RAG21lO9DXMxTEHvJHSCkOVYcnmZaO70MO4
 wmOfev24POpRynlhpTDFcFFNj7Puwko7xxiVhnPlM59drwm025lz9KLNhjxRIFsqKjck=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y15WXs6HXCwJiCLEgssxPnbyafcgj2xPY1KE48yto+o=; b=TOS8qIvdyX4wE7vFvQAL1AvbRN
 UKRkHTtUR3keeYAx8IeHloKLwzp6tCe/VHo7PBIF7VAeZS+qHgR1d4p99chxZ+6uQImqOQhaj2FJT
 WUTp04T7jilhMoADgO2ccTl2iRgwhvlppNbVVfN4+r3drfsjpNLhLEdzj7Jm6c5F0pnA=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vyE5a-0001v8-G0 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Mar 2026 19:10:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 090FC440C9;
 Thu,  5 Mar 2026 19:10:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB8E6C116C6;
 Thu,  5 Mar 2026 19:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772737815;
 bh=qpaMNmWLlzmCCJ9dV99/p2oiaZ+xEhLQjkfof8ah1ZY=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=djdAdSej6I94n3D9ww4wbXs90aeQVZ/pWjpbEAbKsYEER4H9HhNgQpzJgRB2HKlrV
 Y+Rj+cmOiN6aIpRiocC8EJeuTXKQleKW3CaYjK4522Lwkw8+FAzlqqVESlckSgQ9qf
 55sH+o3DdpAAq7e/vB39r2usElxDB11PPuJ7dv4Ud+PqI24wOj+x2WDquGQZ/Igmk+
 E3Ph5umr6gDeWM0Ie99a2YTbCIZYGEFSl9OetdCGVDy9VMCPo4qvfDDcsibKaGSH+B
 2MoFSckO41RJmXlIJP0mXnYMKJpCdsslZzNIhvc2OwKPXHFm0BokhUv5NADasyTVnD
 Mx09uyvb5z24w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 02D843808200; Thu,  5 Mar 2026 19:10:17 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <177273781579.3248266.1583300143954111265.git-patchwork-notify@kernel.org>
Date: Thu, 05 Mar 2026 19:10:15 +0000
References: <20260203133635.3942502-2-monty_pavel@sina.com>
In-Reply-To: <20260203133635.3942502-2-monty_pavel@sina.com>
To: Yongpeng Yang <monty_pavel@sina.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 3 Feb 2026 21:36:33 +0800 you wrote:
 > From: Yongpeng Yang <yangyongpeng@xiaomi.com> > > When the file block's
 address is mapped to NEW_ADDR, the extent is > currently marked with the
 FIEMAP_E [...] 
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
X-Headers-End: 1vyE5a-0001v8-G0
Subject: Re: [f2fs-dev] [PATCH 1/4] f2fs: fix incorrect extent flag when
 physical addr is NEW_ADDR in f2fs_fiemap
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
X-Rspamd-Queue-Id: 33B0A217542
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
	FORGED_RECIPIENTS(0.00)[m:monty_pavel@sina.com,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_TO(0.00)[sina.com];
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

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue,  3 Feb 2026 21:36:33 +0800 you wrote:
> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
> 
> When the file block's address is mapped to NEW_ADDR, the extent is
> currently marked with the FIEMAP_EXTENT_UNWRITTEN flag in f2fs_fiemap().
> This flag indicates that the block has been allocated but not yet
> written to. However, NEW_ADDR indicates delayed writing, meaning the
> block has not been allocated yet. Therefore, this should be modified
> such that when a file block's address is mapped to NEW_ADDR, the extent
> is marked with the FIEMAP_EXTENT_DELALLOC flags instead.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,1/4] f2fs: fix incorrect extent flag when physical addr is NEW_ADDR in f2fs_fiemap
    (no matching commit)
  - [f2fs-dev,2/4] f2fs: fix incorrect file address mapping when inline inode is unwritten
    https://git.kernel.org/jaegeuk/f2fs/c/56528dc7fcc6
  - [f2fs-dev,3/4] f2fs: fix fiemap boundary handling when read extent cache is incomplete
    (no matching commit)
  - [f2fs-dev,4/4] f2fs: fix inline data not being written to disk in writeback path
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
