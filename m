Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AG58C8m3cmlKowAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jan 2026 00:50:33 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF556E9D2
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jan 2026 00:50:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bVFBJk2pt8E4pppmcUB/5Sk795BAWVAvwBuNir+7ojg=; b=ZpXaHhy+rUUn9bMcOANTm5kxX7
	VpFyXZPTOfQOlP7N7+pr0R7gj+J/Lc0OcnXUXjssKXPYFEUbOebaodsXtEf+znCYp9H2kM1+eZ2iT
	NrYDBqT4ls6LI6vwicF78ydW5uzamxryzlezkbvPVf56RggkhZ2BBFV8esRA6EKsvjoU=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vj4Rb-0002WE-Og;
	Thu, 22 Jan 2026 23:50:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vj4RZ-0002W0-Sm
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Jan 2026 23:50:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SGjNyd566oiEoHLHoP0tgstxNYZz3unpR3AX6pSU4aA=; b=N9pVO/1T/rtZi0BO6mO2Kua9oX
 fZLyoS+HmtNUZPYPzbUGfA6+oLz3k9UykSZ9hiwcjd9OvUxfrOSCfcWJrGjTsWwWWZQF+Hm/soRAt
 tfAtkjs/13gfQBSt/itrpkIe99Ny9j7cO1AMQRC3nGRq1Ilm6VdnhN/sW/QHaMiBgJ7Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SGjNyd566oiEoHLHoP0tgstxNYZz3unpR3AX6pSU4aA=; b=VXQz7j6CA1TkzQUmMxrnjPEt4l
 qxAuVapbTlyjP2ZFt7GPJ+zn+/5CaJ5/3RqupKNsndIvBV5aGP4ngRI1N8tuPLVfovskEV3fzlKJU
 30SsuxJTzViiY2WV5aGifPPk0xhZ6ANri8As8mEL+WJdzAk1AkikcpqfIRvzsw21asVE=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vj4RZ-0002OY-DI for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Jan 2026 23:50:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1C9334427F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 22 Jan 2026 23:50:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0170EC116C6;
 Thu, 22 Jan 2026 23:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769125819;
 bh=GQP3W1o9/Z+UGDEBNYav8DimvY2v59eMPoDEFwWHb0Q=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=kzJf5U29LNwt8dYpIVDg/E52Zw0lKiXbGkQ6t6cAmDiQjWvuaSHbx67hwUZVhl+Lu
 FuzfYP32l7Tv8icOp0YFgJCy1dbDdndhBOOpl9ewFvnw1kGjuQfn3YSqNOCaQSn4YH
 Up2dVUGBxdpkVVOqG40tEKJdSQJq00eVIzdcgx/3I2jy7proQxA8bDtbykXHyGSy+O
 Y0L2bcLKbA+bwFMSxA5obte81loJdHcvSM0ue/JVkbLaB5kxlitFo7TEZm7qbXbibb
 qV5TtmuGmyWJBNWbAZ/c7gtfMEjflhuMDg/zTXAE7fCcdhpK6PZODItxESvpGEJHKG
 OnOsCdKRywU7w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 8BAE43808200; Thu, 22 Jan 2026 23:50:16 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <176912581509.2327822.8605689752451565989.git-patchwork-notify@kernel.org>
Date: Thu, 22 Jan 2026 23:50:15 +0000
References: <20260116063115.21938-1-chao@kernel.org>
In-Reply-To: <20260116063115.21938-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Fri, 16 Jan 2026 14:31:15 +0800 you
 wrote: > We missed to unlock folio in error path of
 f2fs_read_data_large_folio(), 
 > fix it. > > With below testcase, it can reproduce the bug. > > touch /mnt/f2f
 [...] Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vj4RZ-0002OY-DI
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to unlock folio in
 f2fs_read_data_large_folio()
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
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.983];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_REPLYTO(0.00)[patchwork-bot+f2fs@kernel.org]
X-Rspamd-Queue-Id: 1AF556E9D2
X-Rspamd-Action: no action

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri, 16 Jan 2026 14:31:15 +0800 you wrote:
> We missed to unlock folio in error path of f2fs_read_data_large_folio(),
> fix it.
> 
> With below testcase, it can reproduce the bug.
> 
> touch /mnt/f2fs/file
> truncate -s $((1024*1024*1024)) /mnt/f2fs/file
> f2fs_io setflags immutable /mnt/f2fs/file
> sync
> echo 3 > /proc/sys/vm/drop_caches
> time dd if=/mnt/f2fs/file of=/dev/null bs=1M count=1024
> f2fs_io clearflags immutable /mnt/f2fs/file
> echo 1 > /proc/sys/vm/drop_caches
> time dd if=/mnt/f2fs/file of=/dev/null bs=1M count=1024
> time dd if=/mnt/f2fs/file of=/dev/null bs=1M count=1024
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: fix to unlock folio in f2fs_read_data_large_folio()
    https://git.kernel.org/jaegeuk/f2fs/c/a5d8b9d94e18

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
