Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UN2JILrKwmn9mAQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Mar 2026 18:32:42 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1B531A128
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Mar 2026 18:32:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=seT4MpH0hrBIWqc+P8yz6zgqeoV3wYu5dy4KBMsVDZw=; b=kL6CD9Y9/Fnhv8UlAb0mhygp1A
	ZdzackDTw4bA9xDZjld7KneUwXUGCbGZf/apMVrEZWPcp2RdQwBuMWqQcdp335PwwDroHS0C695Gf
	RovhdLjQPLzY7NI2jSChmOQJrM2vfDw4B4jDYHKVJrstSAE9YNl6rZXz/lam8m930s9w=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w55cO-0000nU-7v;
	Tue, 24 Mar 2026 17:32:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1w55cM-0000nC-Jz
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Mar 2026 17:32:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0DOv6DDzGcAbhT9QXFfNrlJRIlOF/pGyOsskgaqbb24=; b=EfgqUq5QeUx3MoNAjLLlIeruP/
 aN9O69WcCtdObL4PdzeAgebdSsDROg4m8UBHP3u3sFyPyAYoR2rjTu66C4kv44yyONwKMw6SqGdy4
 H5/0GXqdMHi5tpGQ7jWv57Mqgn0MHdn2ZiaBLex3H7tB0EiRgL4527teUk1hPghCWy5E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0DOv6DDzGcAbhT9QXFfNrlJRIlOF/pGyOsskgaqbb24=; b=EnAa4iXtQt/Kwlg0xvGZ35JI9p
 8cIUgxIMKkbThu9oyQX/pxMDhFmAIMb9iI8fEKLJQRQtVeCzT/76aKowyCv5+WSJIBe6q/M+7vYG0
 qY72SNFTa7rp/tp/ElXLKYRoM+PEoC/og3NKFPVtjcM9a1zA00BnYhOIFn0VW1aHr6zQ=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w55cM-0007qR-MN for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Mar 2026 17:32:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 97FB6405E2;
 Tue, 24 Mar 2026 17:32:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75903C2BC87;
 Tue, 24 Mar 2026 17:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774373558;
 bh=XjDWPFaC3BEJKzMiAmgWBIj7cF6+CCRqYnco2WSFGnc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=PhpT2JA0ObNIkBuHNxAA79hk6JzykVfGhWBDVI5O2y9jkV9B/VbeFEkTOKv2OKm7Z
 3ePkQpp+l/LWjDgZ+fZ9Qmvy2c2aPDhTvAgenGYJYq7tLXrSOkg5L1Z8hxG7JntcXY
 eV7e5cKh2BUXjx9Z7sUkNexVUusnCYESj0UX2StSwDWLHb8dO3LLZ9mgXmvi6hgjo2
 ONLc1g4xzIPiE0aGgUHuBDmDoW0Vveahkb5QwJs6iRG0L2yoe2oKkEHDhSwuQt1F+4
 oGOEb+Hebax/ZMGCF8II4o8LJz/KIlh0c4n9y4kqGvU8k9F9F6/ZK+MLAwSSOBTBrq
 L17w5m+k/jHYg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 7D07A3808203; Tue, 24 Mar 2026 17:32:27 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <177437354603.1223048.5695507886774694517.git-patchwork-notify@kernel.org>
Date: Tue, 24 Mar 2026 17:32:26 +0000
References: <20260318073253.3108313-1-zzzccc427@gmail.com>
In-Reply-To: <20260318073253.3108313-1-zzzccc427@gmail.com>
To: Cen Zhang <zzzccc427@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 18 Mar 2026 15:32:53 +0800 you
 wrote: > f2fs_update_inode() reads inode->i_blocks without holding i_lock
 to > serialize it to the on-disk inode,
 while concurrent truncate or > allocation paths [...] 
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
X-Headers-End: 1w55cM-0007qR-MN
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: add READ_ONCE() for i_blocks in
 f2fs_update_inode()
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
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, baijiaju1990@gmail.com,
 jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
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
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sourceforge.net,gmail.com,kernel.org];
	FREEMAIL_TO(0.00)[gmail.com];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zzzccc427@gmail.com,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:baijiaju1990@gmail.com,m:jaegeuk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[patchwork-bot+f2fs@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 6E1B531A128
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed, 18 Mar 2026 15:32:53 +0800 you wrote:
> f2fs_update_inode() reads inode->i_blocks without holding i_lock to
> serialize it to the on-disk inode, while concurrent truncate or
> allocation paths may modify i_blocks under i_lock.  Since blkcnt_t is
> u64, this risks torn reads on 32-bit architectures.
> 
> Following the approach in ext4_inode_blocks_set(), add READ_ONCE() to prevent
> potential compiler-induced tearing.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: add READ_ONCE() for i_blocks in f2fs_update_inode()
    https://git.kernel.org/jaegeuk/f2fs/c/5471834a96fb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
