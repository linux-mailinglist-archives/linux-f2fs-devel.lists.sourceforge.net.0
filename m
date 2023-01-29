Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5286C67FDD0
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 29 Jan 2023 10:19:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pM3qR-0004qy-LF;
	Sun, 29 Jan 2023 09:19:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pM3q2-0004qm-K2
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 29 Jan 2023 09:19:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OvhZ0FLf9lW3R1mt7J+bn9HcIaVVrwI+jG/qPcqAP/E=; b=KLrfDjN2uHOXtAWQQBSACGtOyn
 g0Wr6MAiwk0PXOZK4ZhAs9qyJ0y3ur0vtTsp9gcLRv5GhgIH6RF88/VhIV6f7Ue9iOkRgkxC5Th79
 Hcyzbn00f5sFKnLDC3lCaJL4pwApYaP2RrHaj69KnnE2m7TtJJCBOgdTj3SC/sahv/70=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OvhZ0FLf9lW3R1mt7J+bn9HcIaVVrwI+jG/qPcqAP/E=; b=UHzrqNaViUoa5exL4AFFHfxmMI
 4LOyZC3jSL8aFP0RHWNNlfeudEVNh1DPC7ygEX3/eLiRQc4sioGk5tbKS5LaSyHIUbyYQBdy8JEyy
 /TI4lnSgEkXhbtMEnSCZu9yNLaKg2v0VP3XeHKvPVpPc85sv9PZBmGb2ng92QRP68x7k=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pM3q1-002LmY-3B for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 29 Jan 2023 09:19:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8BDF8B80C99;
 Sun, 29 Jan 2023 09:18:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AAB8C433D2;
 Sun, 29 Jan 2023 09:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674983930;
 bh=ZO4R5GFH7plmtZcgYUOM0lIZ0IXWpK3idGVmrhNgHOU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=eArWcfJes/FWOM+lE7l3eNmivCdFXfzdMN/pNYoFwBbo3NzdkAr3dbWzKoFSC/84T
 i49RWo6GcY8iI+Rs82tDJiQvHYVs06YepQHCsARS6aZp6Zg1kDmn9FNg6zJxsANNqL
 EH0xBR6T6Kqd+xNtAPvBzrSRnErW2PjIzhJ0vw42sI4PsSTJ5FrpJyMyL2KxShwKdQ
 +uX0SXMlnCL9HMeWkz/06+rEGDrxYmFbnCVyM4XrVrN5bnR4XA92latmhy5bdOefXn
 4g14W6e79I2mKV4GkVBlISS9v/JCj35V6Fh6fC6C+t6Bn630XEFqcQTFibXQe2LmeU
 cbs4N0g3U6cLA==
Message-ID: <5ad98a40-aa15-c6ea-e717-62b1364f18cb@kernel.org>
Date: Sun, 29 Jan 2023 17:18:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20230129075509.37107-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230129075509.37107-1-frank.li@vivo.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/1/29 15:55, Yangtao Li wrote: > syzbot reported a
 bug which could cause shift-out-of-bounds issue: > > UBSAN:
 shift-out-of-bounds
 in fs/f2fs/super.c:4184:41 > shift exponent 613 is too large f [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pM3q1-002LmY-3B
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix shift-out-of-bounds in
 f2fs_fill_super
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
Cc: syzbot+fea4bcda5eb938ee88ed@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/1/29 15:55, Yangtao Li wrote:
> syzbot reported a bug which could cause shift-out-of-bounds issue:
> 
> UBSAN: shift-out-of-bounds in fs/f2fs/super.c:4184:41
> shift exponent 613 is too large for 64-bit type 'loff_t' (aka 'long long')
> CPU: 1 PID: 5467 Comm: syz-executor.0 Not tainted 6.2.0-rc5-syzkaller #0
> Hardware name: Google Compute Engine/Google Compute Engine,
> 	BIOS Google 01/12/2023
> Call Trace:
>   <TASK>
>   __dump_stack lib/dump_stack.c:88 [inline]
>   dump_stack_lvl+0x1b1/0x290 lib/dump_stack.c:106
>   ubsan_epilogue lib/ubsan.c:151 [inline]
>   __ubsan_handle_shift_out_of_bounds+0x33d/0x3a0 lib/ubsan.c:321
>   f2fs_fill_super+0x5518/0x6ee0 fs/f2fs/super.c:4184
>   mount_bdev+0x26c/0x3a0 fs/super.c:1359
>   legacy_get_tree+0xea/0x180 fs/fs_context.c:610
>   vfs_get_tree+0x88/0x270 fs/super.c:1489
>   do_new_mount+0x289/0xad0 fs/namespace.c:3145
>   do_mount fs/namespace.c:3488 [inline]
>   __do_sys_mount fs/namespace.c:3697 [inline]
>   __se_sys_mount+0x2d3/0x3c0 fs/namespace.c:3674
>   do_syscall_x64 arch/x86/entry/common.c:50 [inline]
>   do_syscall_64+0x3d/0xb0 arch/x86/entry/common.c:80
>   entry_SYSCALL_64_after_hwframe+0x63/0xcd
>   </TASK>
> 
> Since currently only 4kb block size is supported by f2fs,
> let's use 4kb directly to avoid triggering UBSAN exception.

It doesn't fix the root cause...

How can we get invalid raw_super->log_blocksize value after below sanity check
in sanity_check_raw_super():

	/* Currently, support only 4KB block size */
	if (le32_to_cpu(raw_super->log_blocksize) != F2FS_BLKSIZE_BITS) {
		f2fs_info(sbi, "Invalid log_blocksize (%u), supports only %u",
			  le32_to_cpu(raw_super->log_blocksize),
			  F2FS_BLKSIZE_BITS);
		return -EFSCORRUPTED;
	}

Thanks,

> 
> Reported-by: syzbot+fea4bcda5eb938ee88ed@syzkaller.appspotmail.com
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>   fs/f2fs/super.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index d8a65645ee48..41c2bbd3e719 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -4174,8 +4174,8 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>   	if (err)
>   		goto free_options;
>   
> -	sb->s_maxbytes = max_file_blocks(NULL) <<
> -				le32_to_cpu(raw_super->log_blocksize);
> +	/* Currently, support only 4KB block size */
> +	sb->s_maxbytes = max_file_blocks(NULL) << F2FS_BLKSIZE_BITS;
>   	sb->s_max_links = F2FS_LINK_MAX;
>   
>   	err = f2fs_setup_casefold(sbi);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
