Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YE+lD8C3cmlKowAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jan 2026 00:50:24 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3438F6E9AF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jan 2026 00:50:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F4unkjjRBeE5xkj/brRcPPqh4PwzoVavP2AJlJqAAKQ=; b=G+tPjwgQwdaawRanBQe1ZLjxVU
	cedVl1hLVMg6wn/QR6ilE0PwQ9PjUoyPXS0GOulm1KmAor5jmMEbi+2N0TcSw8ztYbiFmxN18rLch
	L5Wj4q95Lin0F0g4GhYP40x0xQXyUWrVpWmxRc+0DEsc94ktw/3OpZOSWrb91bNiH3Kc=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vj4RS-0004Lx-RE;
	Thu, 22 Jan 2026 23:50:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vj4RR-0004Lo-V9
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Jan 2026 23:50:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jNSxoVNtE7HPsOalkCR1SARIQESAqlC33S6iv0+GSrs=; b=cqQ9lkQD4MtqSZ+VNdGppaof3+
 k7XmtiVAc8WGFsrMtBfAUPx6m0uDV/P73q8K3YmAvnDDBSEAbvwhMmYKpBJWt3r6yyZsvMn5sUi5I
 a67J3yncy3XGE3TO1Uu+DvPWZt4PD4f4gTL2gx9jmF/o564JM64PceAplTyYtu8dBn7c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jNSxoVNtE7HPsOalkCR1SARIQESAqlC33S6iv0+GSrs=; b=hQa1mQJEFl8ClFD9xKMpplZzXh
 3Jwxv18XfMAIb7MlS/BmMJtFbo/vQUw26leSnxJ0fcTUFiw6k+Pxg3rainpahQhBeN7Xajk8yr4UD
 vqDmeQBLZi9zB7HBAQ9qg2tYw5tXoK8Bjn9HnUvhxJi0nkOVRUFnQ2oNWeOiil6Y8VuY=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vj4RR-0002Nw-Bn for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Jan 2026 23:50:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CA6A460146
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 22 Jan 2026 23:50:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81ED2C116C6;
 Thu, 22 Jan 2026 23:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769125810;
 bh=OnYnDkShB7EvEDeHr4ztkM/E1nYsb/voxa3SVqourQ0=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=UDxqRmG8mQ0Z9FnhLlTxkrdBvbQfUDhiFDT7/RW8YRG4Zd+1Y6GTNyXlCqUCcSnjx
 PPSXWAEFUjQ1t3PgjNos6npF0QznsFV6h2U7DvTmVjgZTr8J9WahbVLRsSxD5V2kzh
 7yUf1WxymRl/p56HRe95V71ZcP2MOoRtpIRxvde9GL3IgbXtzg1bSSrQP6CaivlzyA
 8ZY3I7zDmrszWaU7R3JXNEU7PfeBg7rVmq666/bNqF0wm3cW0D5GsHGcWhAXcMcViw
 TSvXcyaTVllnP5YpV1v4Frol7fBTq/cXtEkY9bOpuXgXXYmfCdPaIz7ZNSWKk4B92P
 hyHmdhTU18P2w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 11AB73808200; Thu, 22 Jan 2026 23:50:08 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <176912580662.2327822.16181379860924625323.git-patchwork-notify@kernel.org>
Date: Thu, 22 Jan 2026 23:50:06 +0000
References: <20260116215044.2565391-1-jaegeuk@kernel.org>
In-Reply-To: <20260116215044.2565391-1-jaegeuk@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Fri, 16 Jan 2026 21:50:44 +0000 you
 wrote: > This reverts commit 4bc347779698b5e67e1514bab105c2c083e55502. > >
 For stability, let's keep flushing all the data. > > Cc: stable@kernel.org
 > Fixes: 4b [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vj4RR-0002Nw-Bn
Subject: Re: [f2fs-dev] [PATCH] Revert "f2fs: add timeout in
 f2fs_enable_checkpoint()"
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
Cc: stable@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:stable@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-0.984];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_REPLYTO(0.00)[patchwork-bot+f2fs@kernel.org]
X-Rspamd-Queue-Id: 3438F6E9AF
X-Rspamd-Action: no action

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri, 16 Jan 2026 21:50:44 +0000 you wrote:
> This reverts commit 4bc347779698b5e67e1514bab105c2c083e55502.
> 
> For stability, let's keep flushing all the data.
> 
> Cc: stable@kernel.org
> Fixes: 4bc347779698 (f2fs: add timeout in f2fs_enable_checkpoint()")
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] Revert "f2fs: add timeout in f2fs_enable_checkpoint()"
    https://git.kernel.org/jaegeuk/f2fs/c/993663874be5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
