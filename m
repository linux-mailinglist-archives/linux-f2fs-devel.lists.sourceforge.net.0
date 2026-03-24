Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MEoLsHKwmn9mAQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Mar 2026 18:32:49 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A64DB31A15C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Mar 2026 18:32:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xeMNsyZq29Jsk0x15Afp6I/BMI6xWc3Ee8UZcy+xrpw=; b=PcaavMkbpKDFsV35Ut3c9kPuKa
	Nd99cNSFs8ttEHzJ4hccn+ZtxEJE8eNVZjnVXWbvNQhIh2Nm/jxq99xISfmdZynOfQU4KFkZGjGUL
	oTlfO9ihqS4b2uZPkYslsTe7Qc1esC299T+CV0i5dtoIo7y0Y+Ktp3RFP3164E9fCqtU=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w55cW-00054D-Ck;
	Tue, 24 Mar 2026 17:32:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1w55cU-00053z-Rv
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Mar 2026 17:32:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UYW5kMpBYRcyuYfZFbwic638EYdxX84hMNVHWb14/lw=; b=SxSCxq8L7mWFp0M1XK8Q5zVkhe
 K2qkpLl2lcVLquLcHCVTM/TvhAgN6zlSVEtZTBMvh5kDSee2OIf0RKQRb7dawE4UXyvBYvXuy+mkv
 UgA5YasTZp0kIJuQHfJhovvd17qNtmhURNc16OVdzorF/kJ294bOaDnutBXk+cKCPCJs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UYW5kMpBYRcyuYfZFbwic638EYdxX84hMNVHWb14/lw=; b=ADAPl4CJE9uK2wFWkD2YT0uDst
 A3yn9ICm0qpCItRH2ZPZn7HCaK/XTS27ERqN8kQ64AoYLoQzsX5ViLHPH70XbCjB4je47Q23hAvUO
 oRylJFyne8+aysW7V8TDMGm+f0bR2BQ7w/1Bcj6aHodqLKhMQT8ddu3XjRGW9QapNXfU=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w55cU-0007rM-4J for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Mar 2026 17:32:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CC39444559;
 Tue, 24 Mar 2026 17:32:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABFE8C19424;
 Tue, 24 Mar 2026 17:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774373555;
 bh=79VVdCufUzoteJIpCc+oBcSqvrJt4B9pmt+LUmvVlL0=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=W+usy5IZhvmJj7m1yfgBRfeCroJE8L8beUWaoTNgzf/f/93zSvh7fWtTI62SadVLl
 3HSeo1ntCOgPg0v5zDpIlfxqnTpdKXTQfWKBhKMJgDCkNF2NV0f5bCmRBHmgmRHamF
 nA+d+DH23rW8eB4J3ckZq2UMEnhJWHAp+eRxRXvQlkFMOh3hNx/vqtY4FwyFvqaY6A
 jWtryXk/+5snegXIAlwsd/bZnGiyFQGVnDEuNlzfrLMUAvWXUPx/muXIzY3nrHDBZG
 W8PuVpQryS4oETpztexJTY9rD7LmEMFYE/jU3LG7uy2zbHSivmLuWYwrsBo0QxNAUY
 aCeQ7SQ+wmbDA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 B9E233808203; Tue, 24 Mar 2026 17:32:24 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <177437354328.1223048.1620530406654959719.git-patchwork-notify@kernel.org>
Date: Tue, 24 Mar 2026 17:32:23 +0000
References: <20260306122421.209903-1-chao@kernel.org>
In-Reply-To: <20260306122421.209903-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Fri, 6 Mar 2026 12:24:20 +0000 you wrote:
 > lockdep reported a potential deadlock: > > a) TCMU device removal context:
 > - call del_gendisk() to get q->q_usage_counter > - call start_flush_work()
 t [...] Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w55cU-0007rM-4J
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix false alarm of lockdep on
 cp_global_sem lock
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
Cc: shinichiro.kawasaki@wdc.com, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, stable@kernel.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
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
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:shinichiro.kawasaki@wdc.com,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:stable@kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim];
	NEURAL_HAM(-0.00)[-1.000];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[patchwork-bot+f2fs@kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: A64DB31A15C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri,  6 Mar 2026 12:24:20 +0000 you wrote:
> lockdep reported a potential deadlock:
> 
> a) TCMU device removal context:
>  - call del_gendisk() to get q->q_usage_counter
>  - call start_flush_work() to get work_completion of wb->dwork
> b) f2fs writeback context:
>  - in wb_workfn(), which holds work_completion of wb->dwork
>  - call f2fs_balance_fs() to get sbi->gc_lock
> c) f2fs vfs_write context:
>  - call f2fs_gc() to get sbi->gc_lock
>  - call f2fs_write_checkpoint() to get sbi->cp_global_sem
> d) f2fs mount context:
>  - call recover_fsync_data() to get sbi->cp_global_sem
>  - call f2fs_check_and_fix_write_pointer() to call blkdev_report_zones()
>    that goes down to blk_mq_alloc_request and get q->q_usage_counter
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix false alarm of lockdep on cp_global_sem lock
    https://git.kernel.org/jaegeuk/f2fs/c/6163918b64ae

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
