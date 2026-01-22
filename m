Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PeKI7+3cmlKowAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jan 2026 00:50:23 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 033576E991
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jan 2026 00:50:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fbVanONtKe1WWIm758GEhKbFJgN8l8cFd6B0fbyapto=; b=jHw6O+aH2kJnhk2HpZJ+8gc0Fo
	fjHvf3SoNtMDcdrCQqd9Phx9Ijh6Khp3AdY/4VMkNcqBowWhmIak/NlAKusPei1ptwbkqDF/to4mZ
	Cl4s9OJo01QaPg3g5YwcSyZM2lC9q1Cd+V24ZOGoi69JIL+cTCIre80pahfgQs9OvEEQ=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vj4RQ-0006cS-ER;
	Thu, 22 Jan 2026 23:50:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vj4RO-0006cD-Vo
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Jan 2026 23:50:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qsEyGJNA50Evhxkukr9xzyg9PauD8lV74P5/bAHGFEM=; b=gY5e4y/vV9JIV6FUijnzWHAGpc
 Xtx6ku45HbmKXjpy5QBliMmUTPn0L4gNr0H6rjK75kAAmFKKGeFloIfJN1QPd1A3uodlTtIA8GGrQ
 w3ONH15INxjDfoDJS5bjpSJ9SzIo81/StL83+IaGczmivlby4l5mDBNspZT2lsVNfPZo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qsEyGJNA50Evhxkukr9xzyg9PauD8lV74P5/bAHGFEM=; b=V8WJgchnpC/3XKdxjGP2uNJn0W
 00yfVmm+tv7fDXvqoQ3ldZmiR5SD9asnP5UdOsS1bva71D0WW9UU1lTVWYuKYlba723LLITLLlDIt
 pChvfIOEWLKeNWsvYAlIEEdf9S7Cw5H5P8PWM6QUd8DPklXEA9XZpAucQ7Xv3fRVJWkk=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vj4RP-0002Np-6j for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Jan 2026 23:50:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 876EF601D0;
 Thu, 22 Jan 2026 23:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F662C116C6;
 Thu, 22 Jan 2026 23:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769125813;
 bh=u7MZ2oGf8bvFQPVOp9JOEHK6BTLWSEIQoIZAXjxu95U=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=kSlXCTmxTMm/HfM5Zw/uisolc9X7EpAi9Libul78Xyu8PBa9pNIIVmrfcbIhST7ZO
 QYOjazTvxtRhkRJ4s/Hk9NGcTP5svA0kkhjaPhgt3NGwqL2Q5Abks99nL5bWkZUWul
 X1nmxhrNZNvCe+MclpzLyyuK4vkN9e2yJJ0ehf9SHqMuGCUgoJxrhGHFPpk2rdPWmy
 ACySgM2h/Pd8a51Y2ho0kUH9aG7lkNVKiwFWaZWpsDqjgY6/9cZPUlZ1ep1rTqNjmG
 +qJcbDY85HEV0Hj3a9AP2sQ1L/PIJEy8xKsTHtlJPSJwbpL69EEDtB5YH96xNLIsE3
 WXhXoA022vVAw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 C8C833808200; Thu, 22 Jan 2026 23:50:10 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <176912580934.2327822.12832175677427521259.git-patchwork-notify@kernel.org>
Date: Thu, 22 Jan 2026 23:50:09 +0000
References: <20260113152138.15979-2-monty_pavel@sina.com>
In-Reply-To: <20260113152138.15979-2-monty_pavel@sina.com>
To: Yongpeng Yang <monty_pavel@sina.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 13 Jan 2026 23:21:36 +0800 you
 wrote: > From: Yongpeng Yang <yangyongpeng@xiaomi.com> > > This patch series
 addresses long checkpoint write latency observed under > workloads with
 frequent met [...] 
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
X-Headers-End: 1vj4RP-0002Np-6j
Subject: Re: [f2fs-dev] [PATCH v2 0/3] f2fs: reduce checkpoint write latency
 under metadata-intensive workloads
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:monty_pavel@sina.com,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
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
	NEURAL_HAM(-0.00)[-0.869];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email]
X-Rspamd-Queue-Id: 033576E991
X-Rspamd-Action: no action

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue, 13 Jan 2026 23:21:36 +0800 you wrote:
> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
> 
> This patch series addresses long checkpoint write latency observed under
> workloads with frequent metadata operations. Analysis shows that the main
> bottleneck is high synchronous read latency of NAT blocks during checkpoint
> processing.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2,1/3] f2fs: add write latency stats for NAT and SIT blocks in f2fs_write_checkpoint
    https://git.kernel.org/jaegeuk/f2fs/c/10f96e94b38d
  - [f2fs-dev,v2,2/3] f2fs: change size parameter of __has_cursum_space() to unsigned int
    (no matching commit)
  - [f2fs-dev,v2,3/3] f2fs: optimize NAT block loading during checkpoint write
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
