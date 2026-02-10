Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id m5qpBRKji2kuXgAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Feb 2026 22:28:50 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A73B11F682
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Feb 2026 22:28:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7leFItwFXM5Thk5XXuocHkwQ948/wfVlcOA+xr/1Lbc=; b=HTBJPKeW0ncnPURsAnr04Vh55S
	lJGsIpQwR3ISZz126+D2NMY9XiUODtRwwFVK9K/QlXZF/2ARlWhktYEMQyHNIogXEiSaqR4jOopZ8
	rs8x2tRlw69hJFwV6jnT9ov6/liH3fkGuwjCdoikhSt68dRufb/OYtKyGwLQOVIgrpXc=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vpvHq-0001ee-K3;
	Tue, 10 Feb 2026 21:28:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vpvHp-0001eX-9A
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Feb 2026 21:28:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ObzWN8dpkPPmZM2wwyXo0Xp+ZYUiTl+iFhpffwMDDeY=; b=EU7njUd+nf5Xe7S6CAy37RHpnx
 QInSRhlJ+b02pP6YJqlcONi9WaczqPd+HBSTnP4xMSoV3TKH5wr6dEzkyJ3yXjGYBesJ9JP0g52TV
 L0vpcuqTvlFuRgcD+Uw4XnG1MK29l+JhLcqu3bXtKZCtUdeTQe/yubpn1zwnIMAO6vW8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ObzWN8dpkPPmZM2wwyXo0Xp+ZYUiTl+iFhpffwMDDeY=; b=UhyMsI5Et0RAGa4ppdcRQjtDLE
 FvwTmwPxAu85NQkZfyHDFZbvTxKUAMFGXnXiNoVOqHGk1uvy1ZEFaTMVIH9eu8EeuW4LU5XJpXy8C
 UQVHmLPofzIsg+TAi91Ym17U7TiGNhAtaLk/U60g0czHhT8/mcyAjvgw5rzipqWantZw=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vpvHo-00051j-HI for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Feb 2026 21:28:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3EA1444504
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 10 Feb 2026 21:28:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18C52C19424;
 Tue, 10 Feb 2026 21:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770758914;
 bh=wQHMv6Mf1rtk6NqvUFMPZ0OXiJzQwDvHAWYVzvrJtEQ=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=sPe1XVZm/jmZHjxj3u9FpnNrr48+ssMLMxS8n0ZKCVrdTXFT+gpMoEkonqjWLe3xy
 Vb9S8xM0j/boJx6eMCY/XLoZigZgnMJ50cerkXp2rOvH5NQf0jGvdXaFz0hhqhSltq
 1Jw+eW6kiDy0IlHWjOGp6LmGN652SXnqw+Sro7PtAQG+eS28kONQsmlXDFjQgo/Cfn
 I20bVTnE3/XA4w9yfdnlABBwdA9Ondr3iQHPjEnu351/tqz6tnDmUWsuV2ZL5UkSs6
 W1a3duWkhLtAALJQSxH2Q3R4DMmtLEwW/oZ5sVpHm/viwshZSO/7vot5ohHdLgLfE0
 eUembh+vNO5UQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 84F9739E3B79; Tue, 10 Feb 2026 21:28:30 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <177075890907.3671709.18125640893352806832.git-patchwork-notify@kernel.org>
Date: Tue, 10 Feb 2026 21:28:29 +0000
References: <20260130132809.59707-1-chao@kernel.org>
In-Reply-To: <20260130132809.59707-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Fri, 30 Jan 2026 21:28:08 +0800 you
 wrote: > If userspace thread has held f2fs rw semaphore,
 due to its low priority, 
 > it could be runnable or preempted state for long time, during the time,
 > it [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vpvHo-00051j-HI
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: fix lock priority inversion issue
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.21 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[patchwork-bot+f2fs@kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: 7A73B11F682
X-Rspamd-Action: no action

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri, 30 Jan 2026 21:28:08 +0800 you wrote:
> If userspace thread has held f2fs rw semaphore, due to its low priority,
> it could be runnable or preempted state for long time, during the time,
> it will block high priority thread which is trying to grab the same rw
> semaphore, e.g. cp_rwsem, io_rwsem...
> 
> To fix such issue, let's detect thread's priority when it tries to grab
> f2fs_rwsem lock, if the priority is lower than a priority threshold, let's
> uplift the priority before it enters into critical region of lock, and
> restore the priority after it leaves from critical region.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,1/2] f2fs: fix lock priority inversion issue
    https://git.kernel.org/jaegeuk/f2fs/c/07de55cbf576
  - [f2fs-dev,2/2] f2fs: introduce trace_f2fs_priority_update
    https://git.kernel.org/jaegeuk/f2fs/c/bc367775f602

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
