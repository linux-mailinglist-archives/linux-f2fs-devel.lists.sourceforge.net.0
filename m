Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB9D168C6F
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 22 Feb 2020 06:02:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j5MvU-0004MK-86; Sat, 22 Feb 2020 05:02:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <megi@xff.cz>) id 1j5MvS-0004M7-V5
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 22 Feb 2020 05:02:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XBzM4JiuoaDLSdyFO1LDoTuMFKeeUXU6XzVNn+W/dQM=; b=ib/oEMVox9YyvrDq+jnfKxO0Uq
 H1YrSXvKSy4crAMzSNmG2JumlReIf1ZnvEciVjofx5PAIFwFSIhF4O3XwRwf4qgalZicC/DrZHu9L
 VKOV6kWMJmb8b9CMY6QD1u8LnuJ7eFvtMU4F42wcozbVejFeT5m/RZQrzIhWf4JQYiQU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XBzM4JiuoaDLSdyFO1LDoTuMFKeeUXU6XzVNn+W/dQM=; b=IY0A31CxkY5NLqES100uO2Hh0+
 6C/Yw4kQWsX7cphfhJD0G/y4J3KDNTUMYII5TYA2IucPRQkGgcN7anw3l7RtjbgsFMTuaHrV8XNZa
 OFkQ/U0ie3aAlRXUXTGqGqvLFsfiGmfDuoLJv3CZE2FCVr0YQy0hWCKrefa+IHVHnU4s=;
Received: from vps.xff.cz ([195.181.215.36])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j5MvL-004Mx4-SM
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 22 Feb 2020 05:02:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
 t=1582346778; bh=AU93XwymVxG1tNXGl1srm3ioYWzwHO+dNAtH9K6Tfto=;
 h=Date:From:To:Cc:Subject:References:X-My-GPG-KeyId:From;
 b=B6+iRBdGGXCezXY0bqWcDNllNSjpaO0ONWc0qx9jJWtHgTrHfZL9Q9k5BAdzkwy0s
 12VDVw7C7m+/AZwsmmHWkDLlMroVgjcvz8DsrUvRKbaqtIO/K6/R4IQTJgZjbClJhI
 RhOYoMmJcUevKoi+qrjb0j+oOFW2PeWzV8Ajzanw=
Date: Sat, 22 Feb 2020 05:46:17 +0100
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <20200222044617.pfrhnz2iavkrtdn6@core.my.home>
Mail-Followup-To: Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20191209222345.1078-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191209222345.1078-1-jaegeuk@kernel.org>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: megous.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1j5MvL-004Mx4-SM
Subject: Re: [f2fs-dev] [PATCH 1/6] f2fs: call f2fs_balance_fs outside of
 locked page
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello,

On Mon, Dec 09, 2019 at 02:23:40PM -0800, Jaegeuk Kim wrote:
> Otherwise, we can hit deadlock by waiting for the locked page in
> move_data_block in GC.

I had the task hangs on 5.6 shortly after boot. (f2fs as rootfs).
See below for stacktrace.

So I went through the changelog in f2fs and noticed this patch as
a suspect, and after reverting it the hung task panics went away.

I reverted it manually, because the master changed too much for
a clean revert:

https://megous.com/git/linux/commit/?h=orange-pi-5.6&id=9983bdae4974edc2af6ff547a401ae397388b6b5

regards,
	o.

INFO: task kworker/u16:2:341 blocked for more than 122 seconds.
      Not tainted 5.6.0-rc2-00254-g9a029a493dc16 #4
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
kworker/u16:2   D    0   341      2 0x00000000
Workqueue: writeback wb_workfn (flush-179:0)
Backtrace:
[<c0912bd0>] (__schedule) from [<c0913274>] (schedule+0x78/0xf4)
 r10:ede1a000 r9:00000000 r8:ede1ba60 r7:ec417290 r6:00000002 r5:ede1a000
 r4:ee8e8000
[<c09131fc>] (schedule) from [<c017ec74>] (rwsem_down_write_slowpath+0x24c/0x4c0)
 r5:00000001 r4:ec417280
[<c017ea28>] (rwsem_down_write_slowpath) from [<c0915f6c>] (down_write+0x6c/0x70)
 r10:ec417280 r9:ede1bd80 r8:ee128000 r7:00000001 r6:00000000 r5:eff0afc4
 r4:ec417280
[<c0915f00>] (down_write) from [<c0435b68>] (f2fs_write_single_data_page+0x608/0x7ac)
 r5:eff0afc4 r4:ec4170e0
[<c0435560>] (f2fs_write_single_data_page) from [<c0435fc0>] (f2fs_write_cache_pages+0x2b4/0x7c4)
 r10:ede1bc28 r9:ec4171e0 r8:ec4170e0 r7:00000001 r6:ede1bd80 r5:00000001
 r4:eff0afc4
[<c0435d0c>] (f2fs_write_cache_pages) from [<c0436814>] (f2fs_write_data_pages+0x344/0x35c)
 r10:0000012c r9:ee12802c r8:ee128000 r7:00000004 r6:ec4171e0 r5:ec4170e0
 r4:ede1bd80
[<c04364d0>] (f2fs_write_data_pages) from [<c0267fa0>] (do_writepages+0x3c/0xd4)
 r10:0000012c r9:c0e03d00 r8:00001400 r7:c0264e94 r6:ede1bd80 r5:ec4171e0
 r4:ec4170e0
[<c0267f64>] (do_writepages) from [<c0310d24>] (__writeback_single_inode+0x44/0x454)
 r7:ec4171e0 r6:ede1beac r5:ede1bd80 r4:ec4170e0
[<c0310ce0>] (__writeback_single_inode) from [<c0311338>] (writeback_sb_inodes+0x204/0x4b0)
 r10:0000012c r9:c0e03d00 r8:ec417148 r7:ec4170e0 r6:ede1beac r5:ec417188
 r4:eebed848
[<c0311134>] (writeback_sb_inodes) from [<c0311634>] (__writeback_inodes_wb+0x50/0xe4)
 r10:ee7128e8 r9:c0e03d00 r8:eebed85c r7:ede1beac r6:00000000 r5:eebed848
 r4:ee120000
[<c03115e4>] (__writeback_inodes_wb) from [<c031195c>] (wb_writeback+0x294/0x338)
 r10:00020800 r9:ede1a000 r8:c0e04e64 r7:eebed848 r6:000192d0 r5:ede1beac
 r4:eebed848
[<c03116c8>] (wb_writeback) from [<c0312e98>] (wb_workfn+0x3e0/0x54c)
 r10:ee894005 r9:eebed84c r8:eebed948 r7:eebed848 r6:00000000 r5:eebed954
 r4:00002b6e
[<c0312ab8>] (wb_workfn) from [<c014f2b8>] (process_one_work+0x214/0x544)
 r10:ee894005 r9:00000200 r8:00000000 r7:ee894000 r6:ef044400 r5:edb1c700
 r4:eebed954
[<c014f0a4>] (process_one_work) from [<c014f634>] (worker_thread+0x4c/0x574)
 r10:ef044400 r9:c0e03d00 r8:ef044418 r7:00000088 r6:ef044400 r5:edb1c714
 r4:edb1c700
[<c014f5e8>] (worker_thread) from [<c01564fc>] (kthread+0x144/0x170)
 r10:ef125e90 r9:ec0f235c r8:edb1c700 r7:ede1a000 r6:00000000 r5:ec0f2300
 r4:ec0f2340
[<c01563b8>] (kthread) from [<c01010e8>] (ret_from_fork+0x14/0x2c)
Exception stack(0xede1bfb0 to 0xede1bff8)
bfa0:                                     00000000 00000000 00000000 00000000
bfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
bfe0: 00000000 00000000 00000000 00000000 00000013 00000000
 r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:c01563b8
 r4:ec0f2300
NMI backtrace for cpu 2
CPU: 2 PID: 52 Comm: khungtaskd Not tainted 5.6.0-rc2-00254-g9a029a493dc16 #4
Hardware name: Allwinner A83t board
Backtrace:
[<c010db5c>] (dump_backtrace) from [<c010dee0>] (show_stack+0x20/0x24)
 r7:00000000 r6:60060013 r5:00000000 r4:c0e9ab10



>  Thread A                     Thread B
>  - do_page_mkwrite
>   - f2fs_vm_page_mkwrite
>    - lock_page
>                               - f2fs_balance_fs
>                                   - mutex_lock(gc_mutex)
>                                - f2fs_gc
>                                 - do_garbage_collect
>                                  - ra_data_block
>                                   - grab_cache_page
>    - f2fs_balance_fs
>     - mutex_lock(gc_mutex)
> 
> Fixes: 39a8695824510 ("f2fs: refactor ->page_mkwrite() flow")
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/file.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index e7fcbd8c23f4..6cebc6681487 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -50,7 +50,7 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
>  	struct page *page = vmf->page;
>  	struct inode *inode = file_inode(vmf->vma->vm_file);
>  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> -	struct dnode_of_data dn = { .node_changed = false };
> +	struct dnode_of_data dn;
>  	int err;
>  
>  	if (unlikely(f2fs_cp_error(sbi))) {
> @@ -63,6 +63,9 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
>  		goto err;
>  	}
>  
> +	/* should do out of any locked page */
> +	f2fs_balance_fs(sbi, true);
> +
>  	sb_start_pagefault(inode->i_sb);
>  
>  	f2fs_bug_on(sbi, f2fs_has_inline_data(inode));
> @@ -120,8 +123,6 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
>  out_sem:
>  	up_read(&F2FS_I(inode)->i_mmap_sem);
>  
> -	f2fs_balance_fs(sbi, dn.node_changed);
> -
>  	sb_end_pagefault(inode->i_sb);
>  err:
>  	return block_page_mkwrite_return(err);
> -- 
> 2.19.0.605.g01d371f741-goog
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
