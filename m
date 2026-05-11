Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLBJFv4zAWq9RwEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 May 2026 03:42:22 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3896D507014
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 May 2026 03:42:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZyjDSPFSVRwPEe30cE243XHz5oEt1zUWoxuhBwTVfEk=; b=fh8vNCdVp8XlTzBqpa0cZh37pb
	iU5rhNgnEo/BR2BdEa9k7TA8vN04ihu9CV3LRlQGEUc3mq5fxvk+ff2sQ7Pu/6QYqoaWQlxEQGq4s
	eAt8ZD2l2Xp2NueNG1Kw73Lzz6XtVIpa6oKkB9rbcabU6++NFtg9qhFO1e7nuSzQ7j0o=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wMFf5-0006Lv-Cy;
	Mon, 11 May 2026 01:42:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1wMFf4-0006Ll-12
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 May 2026 01:42:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m7aECYVsWesHg784n7391Y8VEAKVLXpVPRLxqBvqeaI=; b=OLC99tKACivy7lJNl6qA9Ix7Im
 3OXgHbDKJXSF7bEeY/zBEN3Tt4UqUEfI2hnzb1guLM2g6JhXHzapxM6nsOZt0UWM7cdqpHvevYFgH
 7cVNCWgRCLk5WS6418yF1mP6txBX0hNfIDOTVUMoPRPZsCRFa78ySK3nx512FHZawcYA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m7aECYVsWesHg784n7391Y8VEAKVLXpVPRLxqBvqeaI=; b=G187vT+L7mMaybhmJop7am5tXR
 vvMNn0wqLM6SjV71NvomXiLC9oT6UWXPSA6lVKFXE6/kb/uBP79Lcko66NLBXbnQ9ctG/NBI2yE4T
 ySoEjLvZxACFssik5gXal9SPxYHuuzFJHhktL1O+ZLTPJ/33/zt37jp9dWZZ9wkFpU+8=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wMFf1-0007Bn-02 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 May 2026 01:42:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6D2046132B;
 Mon, 11 May 2026 01:42:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 245B8C2BCB8;
 Mon, 11 May 2026 01:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778463728;
 bh=5Gi+M/HKbDX6gvVy3B371gEpxFJ3HAQ6dqzG6cjcyeo=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=SsoQGVCweG2zQ6zbBVqmr3rftFn+jnSXvorDoDZcmHKjGJ1XJJt0CnIbVXTaoX3Ff
 FCi371Cu6AEGl0ALiDxsjLxxbqa8EtprhdfOsOFx7PIavEE4mWpX7DwZIBmi9vVSx+
 KmNtz68XxrNuvnko5tHz2Ubkl1Pg9DPzk19GPM9hpr54A9SArI5E+bKHsAbLt9wgIn
 55iw/X6Bjf1W02WYz36kf2RTmvYx74wni0GhNdEeyYhRaLrEWrhWz3WfBeHaPOcqDG
 TURCGtH2bQNINUzs0BkQp62BgOxXVoCmrj+M9Fk3PNa0+osBYOPwUOlLLf6RQfqIXO
 gOtF7cju0jcVw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 7CDC13930039; Mon, 11 May 2026 01:41:16 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <177846367504.1975880.12293006639309276631.git-patchwork-notify@kernel.org>
Date: Mon, 11 May 2026 01:41:15 +0000
References: <20260510042336.94751-1-kartikey406@gmail.com>
In-Reply-To: <20260510042336.94751-1-kartikey406@gmail.com>
To: Deepanshu Kartikey <kartikey406@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Sun, 10 May 2026 09:53:36 +0530 you
 wrote: > When f2fs_get_valid_checkpoint() fails during mount (e.g. due to
 an > invalid checkpoint CRC on a malformed image), f2fs_fill_super() takes
 > an error p [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wMFf1-0007Bn-02
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: initialize ino_entry_info before
 checkpoint load
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 jaegeuk@kernel.org, syzbot+eec8f2693d71386bd600@syzkaller.appspotmail.com,
 stable@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 3896D507014
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kartikey406@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:jaegeuk@kernel.org,m:syzbot+eec8f2693d71386bd600@syzkaller.appspotmail.com,m:stable@kernel.org,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[patchwork-bot+f2fs@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel,eec8f2693d71386bd600];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Action: no action

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Sun, 10 May 2026 09:53:36 +0530 you wrote:
> When f2fs_get_valid_checkpoint() fails during mount (e.g. due to an
> invalid checkpoint CRC on a malformed image), f2fs_fill_super() takes
> an error path that eventually calls iput() on the root inode. This
> invokes f2fs_drop_inode() -> f2fs_exist_written_data(), which acquires
> sbi->im[]->ino_lock. However, f2fs_init_ino_entry_info() has not run
> yet at this point, so the spinlock is uninitialized and lockdep
> complains:
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: initialize ino_entry_info before checkpoint load
    https://git.kernel.org/jaegeuk/f2fs/c/16c55b3147cc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
