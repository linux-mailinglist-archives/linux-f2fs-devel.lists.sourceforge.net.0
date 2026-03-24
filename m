Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QEYNHLzKwmkBmQQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Mar 2026 18:32:44 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC2E31A138
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Mar 2026 18:32:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XiFvh6VqWFKTPJSkiHYWN0auHszNTk7kHhQXu6rVrJ4=; b=EnENu406Tzm+oaPQEgiVAq1Ft3
	hZ+PWNYFUReh0AwPFZQjq/rnC18s0cfvMRND31fD8gy5fjYlJnfgr/wQlJ9TFLSWca7msEJokBRgZ
	q/wwJss0zZLDFGoFQ2vgGqoA07XEgILRxPBoEZzCEkAP117oSJoQgAcZsEv6f94k60Vg=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w55cR-00053B-28;
	Tue, 24 Mar 2026 17:32:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1w55cO-00052r-IV
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Mar 2026 17:32:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bbTV5SZGiZwYCqkNLa4MzhMvvnymyPYu4/ABbt0k+DQ=; b=NhhWvU08U6rIWThXSG8TyDH6fD
 xVL8lru+Pv7CQsWJwA3RtBjv5IehGK50r5kfpo+5HeUCrVMSdeceplKDNoUsJEOjgwwC6EpDWbV5v
 ww8fCE2oNq4oNd9eavCh5amsmn/aoSZb/TykhlvS8CYmg388sjeEGRBh6dw0WFdGxvkQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bbTV5SZGiZwYCqkNLa4MzhMvvnymyPYu4/ABbt0k+DQ=; b=OX+mxwqEd9nvke5Q9bj+Ds0fyt
 pVEyvROww9fM9Va6dg+VXokGccNGZlnlHOet6NuXKGZbRNDvxNnTslLy5KjeAUgDeZthOuJv83YJH
 qDzzxl45vdcbq+xBOimNJT8GXwGI82nG/WMTynDamp3eI/naPFYojGoAVSRYvB4WVVzY=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w55cN-0007qR-Sh for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Mar 2026 17:32:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C66BE43E09;
 Tue, 24 Mar 2026 17:32:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA934C2BC9E;
 Tue, 24 Mar 2026 17:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774373559;
 bh=kRWI/KijUS+BhDaAF3ZSZLA5iwXg4T1CxkO3AnqCnO4=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=WvnImmmGgAHlDpJ6/fv6GI+F7JBpCLhEEuorJ+a2UicPRHyCrG5J06FC7jzotKcbo
 voDUSpol5+jM2UHTxRJFKmgVZJuBfpBhi9MBzI0S53jklk4h6MRvzR/sgcyxX4UsY/
 OHayym6gl2GuSFKhoar0gzQBSL+2u0hIoAH2zrANSfZ3VAPCQPMcEBzQpcg3AEcabw
 6M6O/eyONLjG/Bv9opKdipjkRFVba6bhlES+Lm3+B59k2nACmKLl5vfRs7rUOGmn/e
 zA0XylHKFa7erhTe0NjPj4gq0u6d2z8C7nBbvBAkMEpgCvNIRc9yIJkFXPNhmAZ1w0
 bRbt/CDVWlwaw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 B3D5A3808203; Tue, 24 Mar 2026 17:32:28 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <177437354753.1223048.633752985554179871.git-patchwork-notify@kernel.org>
Date: Tue, 24 Mar 2026 17:32:27 +0000
References: <20260310093611.2865092-2-monty_pavel@sina.com>
In-Reply-To: <20260310093611.2865092-2-monty_pavel@sina.com>
To: Yongpeng Yang <monty_pavel@sina.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 10 Mar 2026 17:36:10 +0800 you
 wrote: > From: Yongpeng Yang <yangyongpeng@xiaomi.com> > > This patchset
 addresses
 a data consistency issue caused by the lack of > mutual exclusion between
 chec [...] 
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
X-Headers-End: 1w55cN-0007qR-Sh
Subject: Re: [f2fs-dev] [PATCH 0/2] f2fs: fix data consistency issue caused
 by nat_entry flag
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
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: 5DC2E31A138
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue, 10 Mar 2026 17:36:10 +0800 you wrote:
> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
> 
> This patchset addresses a data consistency issue caused by the lack of
> mutual exclusion between checks of the HAS_FSYNCED_INODE,
> IS_CHECKPOINTED, and HAS_LAST_FSYNC flags and the checkpoint write path.
> 
> In f2fs_flush_nat_entries(), after writing back the NAT block, the code
> sets HAS_LAST_FSYNC and IS_CHECKPOINTED, and clears HAS_FSYNCED_INODE.
> Although accesses and updates to these flags are protected by
> nm_i->nat_tree_lock, observing this state in the fsync context does not
> guarantee that the corresponding nat_entry state has already been
> persisted to the device.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,1/2] f2fs: fix fsck inconsistency caused by incorrect nat_entry flag usage
    (no matching commit)
  - [f2fs-dev,2/2] f2fs: fix data loss caused by incorrect use of nat_entry flag
    https://git.kernel.org/jaegeuk/f2fs/c/06d5ce7683fe

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
