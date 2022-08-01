Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A0837586E08
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Aug 2022 17:47:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oIXdp-0000Jl-J4; Mon, 01 Aug 2022 15:47:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1oIXde-0000Ig-I4
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Aug 2022 15:47:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nvWHu/786/wJZ2v40FYynXQXTCK8gxfQWZteuigNnA4=; b=f0AHoWku8wx3WMjSz7MkJpArla
 ntCXLFTl9AFlVESifJAZYFNX6qkVTUiDtYZxBB8h6xiMju2S5iVUX2bAsEvOT7oovimnirHgiZcqN
 UbPJ2qe0666LTIdLnwr9DvHvr0wDlZYANTaEpehB1L/z4akKwq5ep/r38xMLt7fstd/U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nvWHu/786/wJZ2v40FYynXQXTCK8gxfQWZteuigNnA4=; b=Qydudx3ZSO7UmYIoib93GAAWrK
 qLouG1NBPziJZZTqB8ts1S9Jc6t0aD6teaYqFHdc8SB8LqaaqT3IgYONvYrf9RXqkkdO6s3NSyMIQ
 BnL2jylrVSASqj0EcLpfmH103EJtakEeO8PkwNd36uwJFHnzXWl8y/lASrO1GNqbdi9M=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oIXdd-00HScU-P5
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Aug 2022 15:47:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 90B0D60BBF;
 Mon,  1 Aug 2022 15:47:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9523EC433C1;
 Mon,  1 Aug 2022 15:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659368835;
 bh=EelFEDjYIFAlC+o2r5NZx9bJaOmFQVywzegLhjqSaC4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HuJwsZ9xV38BeQqatGjqnIImOC1cOM0xch1ETGPfrPJ6nL3+K5D/o2cLSRwXpApHk
 1kTUNtJqk1PLn5Tj0ceFqZ8COJSwzW1Tb1eTxb+iEafBAV6wxcQsJR8RwDy9mivsq1
 uW0BcmC4tSANkv4EGbqc94hXDgVBZKEIq3RbN/mc4W/fRdKnjXpOWuau1/I1LRpuAr
 C4Uubjj5670tgl1vfpReX7s4px+rTrYZTAop3l7AFmRfoBUxmcU1ETYhWESW2op+Nx
 xEJglOCfSo1dTo7pZTLTfZ6aSdlKJ0QxJxphnOIBDrhZg7z3Fc5KnAQO9qTVN5/XCF
 Y5684Qu87fzFg==
Message-ID: <9db28a6d-38a4-b22b-ad5e-10b7d4617385@kernel.org>
Date: Mon, 1 Aug 2022 23:47:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Ye Bin <yebin10@huawei.com>, jaegeuk@kernel.org
References: <20220801112604.3406642-1-yebin10@huawei.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220801112604.3406642-1-yebin10@huawei.com>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/8/1 19:26, Ye Bin wrote: > There is issue as follows
 when test f2fs atomic write: > F2FS-fs (loop0): Can't find valid F2FS
 filesystem
 in 2th superblock > F2FS-fs (loop0): invalid crc_offset: 0 [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oIXdd-00HScU-P5
Subject: Re: [f2fs-dev] [PATCH -next v2] f2fs: fix null-ptr-deref in
 f2fs_get_dnode_of_data
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/8/1 19:26, Ye Bin wrote:
> There is issue as follows when test f2fs atomic write:
> F2FS-fs (loop0): Can't find valid F2FS filesystem in 2th superblock
> F2FS-fs (loop0): invalid crc_offset: 0
> F2FS-fs (loop0): f2fs_check_nid_range: out-of-range nid=1, run fsck to fix.
> F2FS-fs (loop0): f2fs_check_nid_range: out-of-range nid=2, run fsck to fix.
> ==================================================================
> BUG: KASAN: null-ptr-deref in f2fs_get_dnode_of_data+0xac/0x16d0
> Read of size 8 at addr 0000000000000028 by task rep/1990
> 
> CPU: 4 PID: 1990 Comm: rep Not tainted 5.19.0-rc6-next-20220715 #266
> Call Trace:
>   <TASK>
>   dump_stack_lvl+0x6e/0x91
>   print_report.cold+0x49a/0x6bb
>   kasan_report+0xa8/0x130
>   f2fs_get_dnode_of_data+0xac/0x16d0
>   f2fs_do_write_data_page+0x2a5/0x1030
>   move_data_page+0x3c5/0xdf0
>   do_garbage_collect+0x2015/0x36c0
>   f2fs_gc+0x554/0x1d30
>   f2fs_balance_fs+0x7f5/0xda0
>   f2fs_write_single_data_page+0xb66/0xdc0
>   f2fs_write_cache_pages+0x716/0x1420
>   f2fs_write_data_pages+0x84f/0x9a0
>   do_writepages+0x130/0x3a0
>   filemap_fdatawrite_wbc+0x87/0xa0
>   file_write_and_wait_range+0x157/0x1c0
>   f2fs_do_sync_file+0x206/0x12d0
>   f2fs_sync_file+0x99/0xc0
>   vfs_fsync_range+0x75/0x140
>   f2fs_file_write_iter+0xd7b/0x1850
>   vfs_write+0x645/0x780
>   ksys_write+0xf1/0x1e0
>   do_syscall_64+0x3b/0x90
>   entry_SYSCALL_64_after_hwframe+0x63/0xcd
> 
> As 3db1de0e582c commit changed atomic write way which new a cow_inode for
> atomic write file, and also mark cow_inode as FI_ATOMIC_FILE.
> When f2fs_do_write_data_page write cow_inode will use cow_inode's cow_inode
> which is NULL. Then will trigger null-ptr-deref.
> To solve above issue, introduce FI_COW_FILE flag for COW inode.
> 
> Fiexes: 3db1de0e582c("f2fs: change the current atomic write way")
> Signed-off-by: Ye Bin <yebin10@huawei.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
