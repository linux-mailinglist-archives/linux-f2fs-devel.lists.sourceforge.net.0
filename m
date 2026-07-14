Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SwH1AmmmVWqPrQAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Jul 2026 05:00:57 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E229750864
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Jul 2026 05:00:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=IUdyltTP;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=QYxK+Vw2;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=Qn3ezU3M;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=WtZwht4T;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yn5lxMdn5X4MArm1kxHgk+apJYEAE1P10yWaTqqKGW0=; b=IUdyltTPNa5vqdZUvyuq1CYfE/
	N/Qhzz67sfsvAuxChFhIX/DVLkoemDH45y8kmBz9gCKjvMNYC6PRR9wOg2uGEICGyk2WgsuXnRKOZ
	yTfwwoFFza2bnuriQ65p31FKOWlKKWwU56EQ+dspEvXp1JbLsXaWBHbLoeRr09/adZRw=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wjTO9-0002e1-Jz;
	Tue, 14 Jul 2026 03:00:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1wjTO2-0002dk-AA
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Jul 2026 03:00:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YaG5Ta1xKsPadz96+IcwgZxoy7jf/OIJasluRQ5kZZM=; b=QYxK+Vw2Y//2zUTcQl2Dz/rSE9
 RKISdYI8MY7NvwUx3yMj7DgkuaKCD/f7ZJADdf7jTRcfll0vw1ElLzwCDvxM0b92D2GMcVmmg9RtQ
 xC1sazPLkvqxy2A4+iJeQM1c2wezl9hQoseuuarVK8J+0b1NnT3pzHca1wDAc/xGDcN4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YaG5Ta1xKsPadz96+IcwgZxoy7jf/OIJasluRQ5kZZM=; b=Qn3ezU3Mya101gmNAvg503EyHN
 ksvyx+4zDChhWNzT2zP3yd+8CqmWOP3R3n8hOhKLUCmN6XRxlBHGtlr8U6KwU7RPx1QkjLEIG9zyT
 sgOFkty+vyzNUMICLIXwsaB1woDDAHX7zuKpeScJLwBNNgzrTgXd7GDko0x4b1I5FvXQ=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wjTNw-0000kR-UE for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Jul 2026 03:00:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 3BF5F43B32;
 Tue, 14 Jul 2026 03:00:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D9D61F00A3D;
 Tue, 14 Jul 2026 03:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783998031;
 bh=YaG5Ta1xKsPadz96+IcwgZxoy7jf/OIJasluRQ5kZZM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc;
 b=WtZwht4TTYxfy0oh89NS2wlto/4csHAOvJb466UFIPGkuWuxRouWGovq99SNztYWj
 X6lXIH6/8MUriOd21RQQQ6If8vbmcsAMAHPUbFaCtyL2bmkKY9pc2l8rUuImgn7iCh
 rOumpKEmUh1KXzusI0EEWzlblEHbQK4MAasMOYDbi10+eeMlBgrpjsIvRqJ+j9OoqW
 d5sv1GgrInLXm85ycKOKhdQGHisD+CfIydJY9TwU9O0znbuk3HMNvAOprNwN0MicxI
 TzISDzTLSuf/RE5LxK1dAZo0cJXSc4lqVxuB7RFbqCoVep7XkIls4mD1b8a8hy8C1S
 qBHcPd5lHon6g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 569463924FB7; Tue, 14 Jul 2026 03:00:07 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <178399800589.2939750.3339446022508241105.git-patchwork-notify@kernel.org>
Date: Tue, 14 Jul 2026 03:00:05 +0000
References: <20260707113934.3003158-1-chao@kernel.org>
In-Reply-To: <20260707113934.3003158-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 7 Jul 2026 19:39:33 +0800 you wrote:
 > Commit 02117b8ae9c0 ("f2fs: Set GF_NOFS in read_cache_page_gfp while doing
 > f2fs_quota_read") adds GFP_NOFS in f2fs_quota_read() to avoid below deadlock
 [...] Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wjTNw-0000kR-UE
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs: quota: do not use GFP_NOFS in
 f2fs_quota_read()
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
Cc: jaegeuk@kernel.org, jack@suse.cz, linux-kernel@vger.kernel.org,
 willy@infradead.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:jack@suse.cz,m:linux-kernel@vger.kernel.org,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[patchwork-bot+f2fs@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9E229750864

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue,  7 Jul 2026 19:39:33 +0800 you wrote:
> Commit 02117b8ae9c0 ("f2fs: Set GF_NOFS in read_cache_page_gfp while doing
> f2fs_quota_read") adds GFP_NOFS in f2fs_quota_read() to avoid below deadlock:
> 
> - do_sys_open
>  - vfs_open
>   - dquot_file_open
>    - dquot_initialize
>     - dqget
>      - dquot_acquire
>       : locks &dqopt->dqio_mutex (VFS Quota Mutex)
>       - qtree_read_dquot
>        - f2fs_quota_read
>         - read_mapping_page (GFP_KERNEL / allows GFP_FS)
>          - __alloc_pages_nodemask
>           - try_to_free_pages (Direct Reclaim)
>            - prune_icache_sb
>             - evict
>              - f2fs_evict_inode
>               - dquot_drop
>                - dqput
>                 - dquot_commit
>                  : tries to lock &dqopt->dqio_mutex again
>                  ==> DEADLOCK (waiting for itself)
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2,1/2] f2fs: quota: do not use GFP_NOFS in f2fs_quota_read()
    https://git.kernel.org/jaegeuk/f2fs/c/9f3a37815818
  - [f2fs-dev,v2,2/2] f2fs: drop FGP_NOFS in f2fs_write_begin()
    https://git.kernel.org/jaegeuk/f2fs/c/6e7205a702e2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
