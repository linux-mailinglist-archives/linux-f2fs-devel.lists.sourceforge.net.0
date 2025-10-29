Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F92C17F67
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Oct 2025 02:59:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LLrxO/tGW0dUKxqdjUbGEZBhUUfggL36AjqDWTRYGFQ=; b=PsMF3Xe+/LjTsZ5kI3f7aKkmMj
	oVXYVZBZsq+Utk8SM8q/N0HTOZ9N3mxHT64od8rGso7RslDjTqFAdfpYVStLtUtmUzbVueR85Rt7g
	SMK4khjecHazFafQg1rElw0NiGlAmyXqY4xM1HLLPZtfgNMTcVVXBfvTSpJ6DGf5STpg=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vDvTN-0004i8-E4;
	Wed, 29 Oct 2025 01:59:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vDvTL-0004i2-Pd
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Oct 2025 01:59:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HnUNt2iARWaVYuShZ7zwJSTBn2wuUMNL0Z2MvJcySHU=; b=bPVZZUEzVDVhM9F8d6PWBsl4ct
 rGyilDShcAbAipRgGOV4djufkJ/QYtaqNv2UxJbXGcqRSrtEdCA1eZg31TA1vDvUfR6q2S1TIh0Gz
 zSiscPXBe2ZyMv4vhxYC8D7fL7EtVa+FUaEksN0dPFakjH0G7mtZiPOpIOzJ/FFKZLeM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HnUNt2iARWaVYuShZ7zwJSTBn2wuUMNL0Z2MvJcySHU=; b=Xgz4qX4RwhakemiE7fWxnBZq6z
 mDgejVq/SP4FY2ZeJDbiI97TxIXb8VwK71vbAGglakg/gtcuchFG0BmE12V9I+73ZIaOQq4Wj156k
 hwLBlbXA7RwgwQso2+TRsOYBq9N9K7pYxwWrnCoQCz0m6sGNHxtUd2F3McTM+1/P719g=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vDvTL-0003E8-AH for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Oct 2025 01:59:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D08EE41A24;
 Wed, 29 Oct 2025 01:59:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B66B7C4CEE7;
 Wed, 29 Oct 2025 01:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761703169;
 bh=5A0bqYgUh+b4BRK+MHQPiFSxgiKVmhjVrTJaCP9LRUQ=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=LXCLxwjXYFdO1wViPa/QrdlK5oFUkAeT+VSfWOxswgeGRldU69pHVyat2NrXUSENc
 z0axMk+qesg6LPNLaWa4JkQaAk74HmFFp0RWhdvbxpiZYnhDj2nZQet25N7GetVd53
 ohaiN0U/IL85MmjU/4LPp74O+sivBOVu0WXga9EiQ5N6AJYrn9oOxDxabmUZ3Zky/i
 FurKbUcoSnJCF+5t8MztUtHp7uRboV6ZgIv1AYSqqoBme2bs6tKUBbAjeKhPOaf4zG
 JKEeu2ZR5sPslFaqluyYhCnVLS2R6l44trUHDENbbgk6dhDODMLKVvRF4jWcSa5obl
 q76RYe6AcRvqw==
Message-ID: <714ed524-8a2f-4409-9bda-15df07695d3c@kernel.org>
Date: Wed, 29 Oct 2025 09:59:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20251006084615.2585252-1-jprusakowski@google.com>
 <c4643bb6-882a-4229-b938-e94398294905@kernel.org>
 <aOkuA_Ffq2klE5g6@google.com>
 <ac1bcf67-cc5f-4288-a2f3-c4fb6013c38a@kernel.org>
 <aPEvpeM_cXWcxcZe@google.com>
 <b4a0af34-bd8b-4130-a96f-6aacbe0fb576@kernel.org>
 <aQEGFWy7AmP2RcVM@google.com>
Content-Language: en-US
In-Reply-To: <aQEGFWy7AmP2RcVM@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/29/25 02:06, Jaegeuk Kim wrote: > Testing this patch:
 > > Xfstests generic/335, generic/336 sometimes crash with the following
 message: > > F2FS-fs (dm-0): detect filesystem reference count leak [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vDvTL-0003E8-AH
Subject: Re: [f2fs-dev] [PATCH] f2fs: ensure node page reads complete before
 f2fs_put_super() finishes
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 10/29/25 02:06, Jaegeuk Kim wrote:
> Testing this patch:
> 
> Xfstests generic/335, generic/336 sometimes crash with the following message:
> 
> F2FS-fs (dm-0): detect filesystem reference count leak during umount, type: 9, count: 1
> ------------[ cut here ]------------
> kernel BUG at fs/f2fs/super.c:1939!
> Oops: invalid opcode: 0000 [#1] SMP NOPTI
> CPU: 1 UID: 0 PID: 609351 Comm: umount Tainted: G        W           6.17.0-rc5-xfstests-g9dd1835ecda5 #1 PREEMPT(none)
> Tainted: [W]=WARN
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> RIP: 0010:f2fs_put_super+0x3b3/0x3c0
> Call Trace:
>  <TASK>
>  generic_shutdown_super+0x7e/0x190
>  kill_block_super+0x1a/0x40
>  kill_f2fs_super+0x9d/0x190
>  deactivate_locked_super+0x30/0xb0
>  cleanup_mnt+0xba/0x150
>  task_work_run+0x5c/0xa0
>  exit_to_user_mode_loop+0xb7/0xc0
>  do_syscall_64+0x1ae/0x1c0
>  entry_SYSCALL_64_after_hwframe+0x76/0x7e
>  </TASK>
> ---[ end trace 0000000000000000 ]---
> 
> It appears that sometimes it is possible that f2fs_put_super() is called before
> all node page reads are completed.
> Adding a call to f2fs_wait_on_all_pages() for F2FS_RD_NODE fixes the problem.
> 
> Fixes: 20872584b8c0b ("f2fs: fix to drop all dirty meta/node pages during umount()")

Cc: stable@kernel.org

Otherwise it looks good to me.

> Signed-off-by: Jan Prusakowski <jprusakowski@google.com>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,

> ---
>  fs/f2fs/super.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index bdb5ddb4f966..0b0ef8ba243b 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -1989,14 +1989,6 @@ static void f2fs_put_super(struct super_block *sb)
>  		truncate_inode_pages_final(META_MAPPING(sbi));
>  	}
>  
> -	for (i = 0; i < NR_COUNT_TYPE; i++) {
> -		if (!get_pages(sbi, i))
> -			continue;
> -		f2fs_err(sbi, "detect filesystem reference count leak during "
> -			"umount, type: %d, count: %lld", i, get_pages(sbi, i));
> -		f2fs_bug_on(sbi, 1);
> -	}
> -
>  	f2fs_bug_on(sbi, sbi->fsync_node_num);
>  
>  	f2fs_destroy_compress_inode(sbi);
> @@ -2007,6 +1999,15 @@ static void f2fs_put_super(struct super_block *sb)
>  	iput(sbi->meta_inode);
>  	sbi->meta_inode = NULL;
>  
> +	/* Should check the page counts after dropping all node/meta pages */
> +	for (i = 0; i < NR_COUNT_TYPE; i++) {
> +		if (!get_pages(sbi, i))
> +			continue;
> +		f2fs_err(sbi, "detect filesystem reference count leak during "
> +			"umount, type: %d, count: %lld", i, get_pages(sbi, i));
> +		f2fs_bug_on(sbi, 1);
> +	}
> +
>  	/*
>  	 * iput() can update stat information, if f2fs_write_checkpoint()
>  	 * above failed with error.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
