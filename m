Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7384D3EF8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Mar 2022 02:53:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nS7zj-0001JB-65; Thu, 10 Mar 2022 01:53:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nS7zi-0001J4-N2
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Mar 2022 01:53:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VAoqdHVPC1R3dEvV4PriYe9lPkybtq9qTj6XQuKPsjs=; b=lENnl/0oWEtI8RHDhDU3s2V5OU
 T+GhPkeo3hNgPED3j3OnDxrRrUN8VoXMKtSucb21FrpV51/f6RM8iFzgYT3Yh/FNqb0X9JcBBPTJA
 et0yB0+2s4m6OjtWncj8k0sKIJrdOTa7Ict5irCeAPoRU3ZheOPZFzFnbhsO7F1R3Bcg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VAoqdHVPC1R3dEvV4PriYe9lPkybtq9qTj6XQuKPsjs=; b=dIutekDAnx0w/NMG9FSTEF4Nk2
 U2cQJJxmcMAhberqPKUNZQ8dVx8C0FLKO69yhEWMSWl7dBhPpvs1SAbCd+8P0AVloeHTIRnVP1WiE
 lSkkH/dJTiqV50RMN7YylYcj2Tbxgei4It8gNk0/thGS3J+nlxjFf/9Y0CxUNXO3/riw=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nS7zd-00087g-HH
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Mar 2022 01:53:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A0C8CB82459
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 10 Mar 2022 01:53:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54853C340E8;
 Thu, 10 Mar 2022 01:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646877196;
 bh=FSwwg7VIAWVfVNVd3TkpDiWBggJe4J2RS2eGz3KYKkI=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=o9hlq/3/YlHMZWtZcKPQhziCXhpUiLVNj5h5GtH6a+juwKjsJim/ii6fHMXGhr0Q+
 t+/fw5hBgFSPZnUOYoa2+VWf3WS4oJIfKR2VWgTSj68phjGhVS/nkmkF+2EjLTEB9+
 DAqCcABDWULl8RVK+I1YXDpoRd8Y+C/VqEAmGkyE4ph/83UGgKdYi0MnvD732UKHqE
 jTXB4qHiVPC3FgKfo/hI7tGwiRC/LOPEQ2RCSjAFITSSAwWX5lcGJzcGOnh/jlKZ3f
 QuEk8FFaBjkM5zxlKzqKPvpUAKPe8PHhddbn+dluvj++oXv8EMLZbC7ILHEXtfbHXx
 Kijrv6rn35aRQ==
Message-ID: <2a5564bb-463e-d163-0042-34fad42e2e46@kernel.org>
Date: Thu, 10 Mar 2022 09:53:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20220309214834.3408741-1-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220309214834.3408741-1-jaegeuk@kernel.org>
X-Spam-Score: -5.7 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/3/10 5:48, Jaegeuk Kim wrote: > Let's purge inode
 cache in order to avoid the below deadlock. > > [freeze test] shrinkder >
 freeze_super > - pwercpu_down_write(SB_FREEZE_FS) > - super_cache_sc [...]
 Content analysis details:   (-5.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nS7zd-00087g-HH
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: evict inode cache for frozen fs
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/3/10 5:48, Jaegeuk Kim wrote:
> Let's purge inode cache in order to avoid the below deadlock.
> 
> [freeze test]                         shrinkder
> freeze_super
>   - pwercpu_down_write(SB_FREEZE_FS)
>                                         - super_cache_scan
>                                           - down_read(&sb->s_umount)
>                                             - prune_icache_sb
>                                              - dispose_list
>                                               - evict
>                                                - f2fs_evict_inode
> thaw_super
>   - down_write(&sb->s_umount);
>                                                - __percpu_down_read(SB_FREEZE_FS)

Ah, finally we catch this. :)

> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>   fs/f2fs/debug.c | 1 +
>   fs/f2fs/f2fs.h  | 1 +
>   fs/f2fs/inode.c | 6 ++++--
>   fs/f2fs/super.c | 4 ++++
>   4 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
> index 9a13902c7702..cba5eab24595 100644
> --- a/fs/f2fs/debug.c
> +++ b/fs/f2fs/debug.c
> @@ -338,6 +338,7 @@ static char *s_flag[] = {
>   	[SBI_QUOTA_SKIP_FLUSH]	= " quota_skip_flush",
>   	[SBI_QUOTA_NEED_REPAIR]	= " quota_need_repair",
>   	[SBI_IS_RESIZEFS]	= " resizefs",
> +	[SBI_IS_FREEZING]	= " freezefs",

Could you please update description of "sb_status" entry in
Documentation/ABI/testing/sysfs-fs-f2fs as well?

Thanks,

>   };
>   
>   static int stat_show(struct seq_file *s, void *v)
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 68d791ec8b27..da729f53daa8 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1293,6 +1293,7 @@ enum {
>   	SBI_QUOTA_SKIP_FLUSH,			/* skip flushing quota in current CP */
>   	SBI_QUOTA_NEED_REPAIR,			/* quota file may be corrupted */
>   	SBI_IS_RESIZEFS,			/* resizefs is in process */
> +	SBI_IS_FREEZING,			/* freezefs is in process */
>   };
>   
>   enum {
> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> index ab8e0c06c78c..71f232dcf3c2 100644
> --- a/fs/f2fs/inode.c
> +++ b/fs/f2fs/inode.c
> @@ -778,7 +778,8 @@ void f2fs_evict_inode(struct inode *inode)
>   	f2fs_remove_ino_entry(sbi, inode->i_ino, UPDATE_INO);
>   	f2fs_remove_ino_entry(sbi, inode->i_ino, FLUSH_INO);
>   
> -	sb_start_intwrite(inode->i_sb);
> +	if (!is_sbi_flag_set(sbi, SBI_IS_FREEZING))
> +		sb_start_intwrite(inode->i_sb);
>   	set_inode_flag(inode, FI_NO_ALLOC);
>   	i_size_write(inode, 0);
>   retry:
> @@ -809,7 +810,8 @@ void f2fs_evict_inode(struct inode *inode)
>   		if (dquot_initialize_needed(inode))
>   			set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
>   	}
> -	sb_end_intwrite(inode->i_sb);
> +	if (!is_sbi_flag_set(sbi, SBI_IS_FREEZING))
> +		sb_end_intwrite(inode->i_sb);
>   no_delete:
>   	dquot_drop(inode);
>   
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 8e3840973077..4b570b5c2674 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -1663,11 +1663,15 @@ static int f2fs_freeze(struct super_block *sb)
>   	/* ensure no checkpoint required */
>   	if (!llist_empty(&F2FS_SB(sb)->cprc_info.issue_list))
>   		return -EINVAL;
> +
> +	/* to avoid deadlock on f2fs_evict_inode->SB_FREEZE_FS */
> +	set_sbi_flag(F2FS_SB(sb), SBI_IS_FREEZING);
>   	return 0;
>   }
>   
>   static int f2fs_unfreeze(struct super_block *sb)
>   {
> +	clear_sbi_flag(F2FS_SB(sb), SBI_IS_FREEZING);
>   	return 0;
>   }
>   


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
