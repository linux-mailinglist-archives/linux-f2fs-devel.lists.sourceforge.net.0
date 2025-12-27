Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDA5CDF34A
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 27 Dec 2025 02:42:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AKfV9CqSCdLdNI2Xq/Ve7UofhBiIjl9FrK+EttzbzkM=; b=aYr76zQ53ufJpQcQbn6vB4muHf
	i4JAp1aFvIVPqt4V3xlBBX5kkGLZrcqy0jes8Gl7EUEg27TmwRG/j99dqco+DZJ7QPLxVzx5RY3jr
	RspCRE91B0PaspUmy3zyiS9xvQl1QznV1T5OfvyFjM0mmI/BecDM4jd8B98BNd4AryW0=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vZJKQ-0000MG-14;
	Sat, 27 Dec 2025 01:42:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vZJKO-0000MA-Lp
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Dec 2025 01:42:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eR1lXhXA3hEPevjkJZm0w8yWaV2WUFjoqkJm/v02T7E=; b=GhkZzBxQQ/zOeo1mvt8H52NcJP
 WcwNy7QEoO0BV0XcoD3aiofCWo9qgLu2WeB4wIoRAEWpth2Q3dBmPVIbIxZkZtWlw+ghBNPXf9T0t
 bd9nR8emXnun+RQnooHZIOrt9TZE0/0wMzUzNGM2icctJsD4IV70AKud90qdn3IPc0co=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eR1lXhXA3hEPevjkJZm0w8yWaV2WUFjoqkJm/v02T7E=; b=lZA4rOdPfzUU1CQuPW6b8apQxQ
 k9fppWLiLJpS0/as9EM0ZQM7gRiwt7vLsqwqEW7QCvl7g6BoWncJTUwrXN4uN4B/EV3eZOQBmAc7p
 Y9m5ixDWJEkKK8+3VSyzC1aERQFsS05pWul4Fvpdu6VccvuAHo1Lgre/qzpXiOUNnWHI=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vZJKO-0001UD-2p for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Dec 2025 01:42:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id AFBD360007;
 Sat, 27 Dec 2025 01:42:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58FD4C4CEF7;
 Sat, 27 Dec 2025 01:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766799752;
 bh=psiRxPZYPxZHGhykhBEspi2fZhz96aTTjbcRKDE4mcs=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=MbOLAbeLQzMyB3g7HKCYxearNWirDYS4EX3exfTI/q3OykeoRHCgy635rGtuwtfS+
 v3JqJXZ3Wn/9DCfib4f10UASc/tCIeSuBsolqTmVGVzriG+VPOEDyx9jhdT0bDFfjo
 6nTxeTDLMJ7hopjYzEhUf5pi96jIt6d+C3jyfn09TP4pyxIb6hdzt4H5WjdwFS0QwN
 9pVn6zex3lIgbKrlmO6P/GJwEAjhfwj7r6jSJt3M0WOSdxNTNawAMV/r5F8B8YJ92P
 gIZD3esli6azZjxgf9DwVlOY/u/dDMs3etHtxbH81oC8nE/W87ihCGaGWnXyX5NG/u
 Qxrw8RURBFpdw==
Message-ID: <3bfe20b2-9f89-4bb9-9fbd-6ca2f780ad66@kernel.org>
Date: Sat, 27 Dec 2025 09:42:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <yangyongpeng.storage@gmail.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20251226141111.119177-3-yangyongpeng.storage@gmail.com>
Content-Language: en-US
In-Reply-To: <20251226141111.119177-3-yangyongpeng.storage@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/26/2025 10:11 PM, Yongpeng Yang wrote: > From: Yongpeng
 Yang <yangyongpeng@xiaomi.com> > > During SPO tests, when mounting F2FS,
 an -EINVAL error was returned from > f2fs_recover_inode_page. The [...] 
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
X-Headers-End: 1vZJKO-0001UD-2p
Subject: Re: [f2fs-dev] [PATCH v2 1/1] f2fs: fix IS_CHECKPOINTED flag
 inconsistency issue caused by concurrent atomic commit and checkpoint
 writes
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
Cc: Jinbao Liu <jinbaoliu365@gmail.com>,
 Yongpeng Yang <yangyongpeng@xiaomi.com>, Jinbao Liu <liujinbao1@xiaomi.com>,
 Sheng Yong <shengyong1@xiaomi.com>, linux-f2fs-devel@lists.sourceforge.net,
 Yongpeng Yang <yangyongpeng.storage@outlook.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/26/2025 10:11 PM, Yongpeng Yang wrote:
> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
> 
> During SPO tests, when mounting F2FS, an -EINVAL error was returned from
> f2fs_recover_inode_page. The issue occurred under the following scenario
> 
> Thread A                                     Thread B
> f2fs_ioc_commit_atomic_write
>   - f2fs_do_sync_file // atomic = true
>    - f2fs_fsync_node_pages
>      : last_folio = inode folio
>      : schedule before folio_lock(last_folio) f2fs_write_checkpoint
>                                                - block_operations// writeback last_folio
>                                                - schedule before f2fs_flush_nat_entries
>      : set_fsync_mark(last_folio, 1)
>      : set_dentry_mark(last_folio, 1)
>      : folio_mark_dirty(last_folio)
>      : __write_node_folio(last_folio)
>                                                - f2fs_flush_nat_entries
>                                                  : {struct nat_entry}->flag |= BIT(IS_CHECKPOINTED)
>                                               SPO
> 
> Thread A calls f2fs_need_dentry_mark(sbi, ino), and the last_folio has
> already been written once. However, the {struct nat_entry}->flag did not
> have the IS_CHECKPOINTED set, causing set_dentry_mark(last_folio, 1) and
> write last_folio again.
> 
> After SPO and reboot, it was detected that {struct node_info}->blk_addr
> was not NULL_ADDR because Thread B successfully write the checkpoint.
> 
> This issue only occurs in atomic write scenarios, and does not affect
> regular file fsync operations. Therefore, for atomic file fsync,
> sbi->node_write should be acquired through __write_node_folio to ensure
> that the IS_CHECKPOINTED flag correctly indicates that the checkpoint
> write has been completed.
> 
> Fixes: 608514deba38 ("f2fs: set fsync mark only for the last dnode")
> Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
> Signed-off-by: Jinbao Liu <liujinbao1@xiaomi.com>
> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
> ---
> v2:
> - set_dentry_mark for atomic file's last_folio in __write_node_folio.
> ---
>   fs/f2fs/node.c | 14 ++++++++++----
>   1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index 482a362f2625..2c6102bee349 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -1774,8 +1774,13 @@ static bool __write_node_folio(struct folio *folio, bool atomic, bool *submitted
>   		goto redirty_out;
>   	}
>   
> -	if (atomic && !test_opt(sbi, NOBARRIER))
> -		fio.op_flags |= REQ_PREFLUSH | REQ_FUA;
> +	if (atomic) {
> +		if (!test_opt(sbi, NOBARRIER))
> +			fio.op_flags |= REQ_PREFLUSH | REQ_FUA;
> +		if (IS_INODE(folio))
> +			set_dentry_mark(folio,
> +				f2fs_need_dentry_mark(sbi, ino_of_node(folio)));
> +	}
>   
>   	/* should add to global list before clearing PAGECACHE status */
>   	if (f2fs_in_warm_node_list(sbi, folio)) {
> @@ -1916,8 +1921,9 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
>   					if (is_inode_flag_set(inode,
>   								FI_DIRTY_INODE))
>   						f2fs_update_inode(inode, folio);
> -					set_dentry_mark(folio,
> -						f2fs_need_dentry_mark(sbi, ino));

What about !atomic case?

			if (!atomic || folio == last_folio) {

Thanks,

> +					if (!atomic)
> +						set_dentry_mark(folio,
> +							f2fs_need_dentry_mark(sbi, ino));
>   				}
>   				/* may be written by other thread */
>   				if (!folio_test_dirty(folio))



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
