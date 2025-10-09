Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F4BBC74E0
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 09 Oct 2025 05:34:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cP/m5r5rFSJxYq7LICz0URa5Zo7qPZfL17OK3Ns6uLA=; b=inw+T6YAXC1bUrYwzFsNMSu8S4
	pplFjh6E6dZ5OucCTzeLcAvt/RL4TxXzpwXb+gie8q9FVlPpbBfKdV6OkxB9fY4VW609mgzjFEyMa
	cyiJFI/RAWjQVezgHAWHMzslEuSjVRMHvQRgE79H+cyF2kweIW3IwonAEP79ZJo6gqOA=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v6hPv-0006dl-TC;
	Thu, 09 Oct 2025 03:34:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1v6hPu-0006df-UM
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Oct 2025 03:34:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ya39Rk2KQwQNSUUDCpE0EymI+dlzbEjdxyGLzqUFybM=; b=dCNWfA3OsTboc0zDdNg+2AFFZi
 CjqhWiI5E88ITar/H1VUmGAjcKPf9mRNnoX4o2JaToow2f2ZDUeM55+e/BmlDz1GEvbc93LskSiew
 X1MWmLIgbE/bZVmEb5INc2Xri7eh4tJM4/7fQ+WwoJL+g3hVUetfbBu45/37dGE9Sz1Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ya39Rk2KQwQNSUUDCpE0EymI+dlzbEjdxyGLzqUFybM=; b=nC8drYQD2CJ0RpPFNZb/iCGCZd
 IuIRsDqaNGWTQkkjLNyu0TDEWorC8SRTqhMxH0enOY5cqRxDoFnFxaKNlpOaUI4/TtYAbJqIuw5m8
 ZCkK9ztYcQcIpK5/PRdbCbiAjW5dge43urYl2DSmsGgtHtEx5gMUT//tq0tF6h8vRua4=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v6hPu-00066H-Gq for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Oct 2025 03:34:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BE1B9611E9;
 Thu,  9 Oct 2025 03:33:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D0CFC4CEE7;
 Thu,  9 Oct 2025 03:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759980839;
 bh=xN41ZGE5H76e94Bp2o1lO5iAeArBWDxLBZZo+8wL+BI=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=Oy2Gxc11qxZN8TPQ/bTmqRRG6Av8DqQO6KKDUYdRmFKU+FDFEuWXB7VJbJ+57MF9Z
 cgU0GQOS3534jfvW/Xq3a9vjie1nMxoK9VOzCCt0v9zwQp+pD7nUswWnL+Af8xP6qm
 NSLKS5WF97Q29v1U2aKTcgZyjUzBGTAARKKE6mOXJLwTCDgDLNKrYyW449FEm+KMkA
 lcOz5YVFlx4RbZERt6UbmB1iv1jCUcDlBXw0VFOpOyZQg675jvmtWlZg3S3ndIImQg
 qi7n7g4C4bAbzdFvpz5jx7KqJee0Z60BQJO6SjkbEzSnT6HuRf5jD1jGRBdZ0VeTs9
 TE9v4Hen7xu9Q==
Message-ID: <c4643bb6-882a-4229-b938-e94398294905@kernel.org>
Date: Thu, 9 Oct 2025 11:33:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jan Prusakowski <jprusakowski@google.com>, jaegeuk@kernel.org
References: <20251006084615.2585252-1-jprusakowski@google.com>
Content-Language: en-US
In-Reply-To: <20251006084615.2585252-1-jprusakowski@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/6/2025 4:46 PM, Jan Prusakowski via Linux-f2fs-devel
 wrote: > Xfstests generic/335, generic/336 sometimes crash with the following
 message: > > F2FS-fs (dm-0): detect filesystem reference count [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v6hPu-00066H-Gq
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 10/6/2025 4:46 PM, Jan Prusakowski via Linux-f2fs-devel wrote:
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
>   <TASK>
>   generic_shutdown_super+0x7e/0x190
>   kill_block_super+0x1a/0x40
>   kill_f2fs_super+0x9d/0x190
>   deactivate_locked_super+0x30/0xb0
>   cleanup_mnt+0xba/0x150
>   task_work_run+0x5c/0xa0
>   exit_to_user_mode_loop+0xb7/0xc0
>   do_syscall_64+0x1ae/0x1c0
>   entry_SYSCALL_64_after_hwframe+0x76/0x7e
>   </TASK>
> ---[ end trace 0000000000000000 ]---
> 
> It appears that sometimes it is possible that f2fs_put_super() is called before
> all node page reads are completed.
> Adding a call to f2fs_wait_on_all_pages() for F2FS_RD_NODE fixes the problem.
> 
> Fixes: bf22c3cc8ce7 ("f2fs: fix the panic in do_checkpoint()")
> 
> Signed-off-by: Jan Prusakowski <jprusakowski@google.com>
> ---
>   fs/f2fs/super.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 1e0678e37a30..5c94bc42b8a1 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -1976,6 +1976,7 @@ static void f2fs_put_super(struct super_block *sb)
>   	f2fs_flush_merged_writes(sbi);
>   
>   	f2fs_wait_on_all_pages(sbi, F2FS_WB_CP_DATA);
> +	f2fs_wait_on_all_pages(sbi, F2FS_RD_NODE);

Jan,

At this stage, GC and checkpoint are both stopped, why there is still read
IOs on node page? Who is reading node page? Can you please dig more details
for this issue?

Thanks,

>   
>   	if (err || f2fs_cp_error(sbi)) {
>   		truncate_inode_pages_final(NODE_MAPPING(sbi));



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
