Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FG9FmQdqGnyoAAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 12:54:12 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B55091FF5AD
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 12:54:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wbGnwzaXikUia8s1v1MrEI7yT0a4BjwH7oaFwjhW4pk=; b=g9dlYveEZQS2DAcJl6YNWrkDxp
	av4hSitZgU40KFiJk+bmozhMJT3mEtYLtT5bJ15xrGoG+tEHqM2xwNpVnTrq/CASZ1hZJF/nrxe8c
	0aQfKZ3PN4U4a1TNai0EFkiA2NIAcIRrxBhMgUIzj49hpftjSgbj0ZNR1eO+Fp0hjrlY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vxknq-0001yA-5k;
	Wed, 04 Mar 2026 11:54:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vxknc-0001vN-UV
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Mar 2026 11:53:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QPQzNYEV2heUthohI2C2D5vNOzbh2n5rq8gRe5NZg7c=; b=gUZK5WNTiVKc7ro7Zt3rCrnHSx
 hlygFUUPZH8Xf2V/gxPQnyjykiB7HHPA0Suil+58d2ClytrXQO6kmVqR/07WggePf6XUy4LtjtFYn
 22/kqTkf3MR7jWkdbn0aII4DNG1qeOt0nBrZ7P0JTc4laeJMSbVHWwP74O6AIXgUXDKA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QPQzNYEV2heUthohI2C2D5vNOzbh2n5rq8gRe5NZg7c=; b=d4X2ZWS2m20TtIvy5f7/QE24gv
 DAemzPWurSrpTVdlej3xrDiueQ4KHoUsqWkCRsTZkF4BixKSt+kVyGXcKKcMOy98iNO2rw59v0G2u
 dS549DBmAXXnYisnylxZL5OIwhKiKdTYKoxRMULt6/jq2LFYlBp4G/wEbSowbrk51/Vs=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vxkna-0006gf-4Q for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Mar 2026 11:53:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B1EC7440AB;
 Wed,  4 Mar 2026 11:53:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9C09C19423;
 Wed,  4 Mar 2026 11:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772625223;
 bh=d2K2jRzxplR9SlTqLBERhX/Vo2cLePR3ysjFZnCuhMA=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=HAAz5UP6sULe5NNm8BZP1mKHn3PO4k/Cl+jBtCQzfKo7YZl5rhGC+RUcw73G7KaAE
 gBQubtW7eN0OHmXGuTOh20ChHi8gl4MFNGE5Fg2ZOMpB5n9sVhI8guTVabuAiOiuRD
 FnvQ1hc2DZjlGz8EOB4rRjKD0JfgpxaZq2S9GGH46C3vhukLvGSnIRc5UKsN2d0Pug
 jL5BrMTM8osv4Z4QEBOFy49jn9C7Uh8AKeIAuSwm3Xj4eR4z5mldx7A08B+uvWzTzV
 ncLnQwR0/Lo5TX3P/LpSZcUdmmzTjulNM06uFTc39feFcTQfOKGMytUMxiOuS7/00e
 75xXp37wwX+SQ==
Message-ID: <6c0b2709-150b-4325-b1da-c54bbc811b1c@kernel.org>
Date: Wed, 4 Mar 2026 19:53:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <monty_pavel@sina.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260227073052.3940958-2-monty_pavel@sina.com>
Content-Language: en-US
In-Reply-To: <20260227073052.3940958-2-monty_pavel@sina.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026/2/27 15:30, Yongpeng Yang wrote: > From: Yongpeng
 Yang <yangyongpeng@xiaomi.com> > > The xfstests case "generic/107" and syzbot
 have both reported a NULL > pointer dereference. > > The concurr [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vxkna-0006gf-4Q
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: fix UAF caused by decrementing
 sbi->nr_pages[] in f2fs_write_end_io()
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: syzbot+6e4cb1cac5efc96ea0ca@syzkaller.appspotmail.com,
 Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: B55091FF5AD
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
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[sina.com,kernel.org];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:monty_pavel@sina.com,m:jaegeuk@kernel.org,m:syzbot+6e4cb1cac5efc96ea0ca@syzkaller.appspotmail.com,m:yangyongpeng@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[appspotmail.com:email,xiaomi.com:email,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel,6e4cb1cac5efc96ea0ca];
	RCPT_COUNT_FIVE(0.00)[5];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[172.234.252.31:received,172.30.29.66:received];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Action: no action

On 2026/2/27 15:30, Yongpeng Yang wrote:
> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
> 
> The xfstests case "generic/107" and syzbot have both reported a NULL
> pointer dereference.
> 
> The concurrent scenario that triggers the panic is as follows:
> 
> F2FS_WB_CP_DATA write callback          umount
>                                          - f2fs_write_checkpoint
>                                           - f2fs_wait_on_all_pages(sbi, F2FS_WB_CP_DATA)
> - blk_mq_end_request
>   - bio_endio
>    - f2fs_write_end_io
>     : dec_page_count(sbi, F2FS_WB_CP_DATA)
>     : wake_up(&sbi->cp_wait)
>                                          - kill_f2fs_super
>                                           - kill_block_super
>                                            - f2fs_put_super
>                                             : iput(sbi->node_inode)
>                                             : sbi->node_inode = NULL
>     : f2fs_in_warm_node_list
>      - is_node_folio // sbi->node_inode is NULL and panic
> 
> The root cause is that f2fs_put_super() calls iput(sbi->node_inode) and
> sets sbi->node_inode to NULL after sbi->nr_pages[F2FS_WB_CP_DATA] is
> decremented to zero. As a result, f2fs_in_warm_node_list() may
> dereference a NULL node_inode when checking whether a folio belongs to
> the node inode, leading to a panic.
> 
> This patch fixes the issue by calling f2fs_in_warm_node_list() before
> decrementing sbi->nr_pages[F2FS_WB_CP_DATA], thus preventing the
> use-after-free condition.
> 

Cc: stable@kernel.org

> Fixes: 50fa53eccf9f ("f2fs: fix to avoid broken of dnode block list")
> Reported-by: syzbot+6e4cb1cac5efc96ea0ca@syzkaller.appspotmail.com
> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
