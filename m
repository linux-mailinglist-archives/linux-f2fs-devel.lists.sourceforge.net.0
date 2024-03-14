Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6AA87C117
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Mar 2024 17:16:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rknkw-0004qq-35;
	Thu, 14 Mar 2024 16:16:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rknku-0004qj-9l
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Mar 2024 16:16:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=a0lDV0lr73qQLDXk1bcrHAQawHG1fHO5QWfmZrZw2Tw=; b=el37ZDpm7gwRuDK9GahESDUjse
 iM6+8Ry0nMGjPv56xwBztWhstkxvEniwXnACChr3Nub7GiueGbl2DnS7z9waXjHPTOM43PqPUTNMd
 NBkj8+KBKmR4hKRuTLeK2D/cKFfwZqaRX33PBtXS9m9f0QfLndQC188Ck2iRYdsHNyss=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=a0lDV0lr73qQLDXk1bcrHAQawHG1fHO5QWfmZrZw2Tw=; b=RkxjJ3Skriq/XZ2WS1stigSPnW
 ar7Y6ZdhyMxq+Qg82Ufbf7k/O5W7h7vyp80UYWjqQeHcvfc/4qHTqGJb2qubbKRBkeGiIKhP8uZ4A
 qX+jr0k7lcJMNNsWtDbVBbdIOZtJsDbSXoCi1j3a8N2QAAaEyMnE2m3/3dBKV4fFJKdw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rknkj-0001Ud-P3 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Mar 2024 16:16:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 74E29614E6;
 Thu, 14 Mar 2024 16:16:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E72B1C433F1;
 Thu, 14 Mar 2024 16:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710432977;
 bh=U8AyetdLrhnWBQCfPFpv6tTgew9AS0AAM56e79RtgeM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PIHwkShnXphYqFArdN0hG3XJx0vwoeoLih4Bo5c9IFPa6h3zvCl9niRZeulLJKt71
 HrlmHYATceiLkvKZss3yUOaCmesxi4c0ry8fGaSRowDsATKyQI+sR+LeaIDlT2u+HC
 oigBQf5i3j4Qd0O/mhg3ZXAXBVjVixMRig2oXOPhoYwP9iemI0HyhJUbMbi8Nz+rUk
 gNWoB1ikRk2G7KKeJt+mhjqi1MrqR53m85A8E4GqnH89UgvUy8G+67U2pKScRTCwf4
 qNdJyKuvI79ST5R1khU7BNANNPIvGM2Vhv+fxYg1BVfzBpdc5A4jgJC9PxmqNI2z8j
 AJw9e3/zQ2bug==
Date: Thu, 14 Mar 2024 09:16:15 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZfMiz67zynbEFBl9@google.com>
References: <20240314020528.3051533-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240314020528.3051533-1-chao@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 03/14,
 Chao Yu wrote: > syzbot reports a f2fs bug as below:
 > > BUG: KASAN: slab-use-after-free in f2fs_filemap_fault+0xd1/0x2c0
 fs/f2fs/file.c:49
 > Read of size 8 at addr ffff88807bb22680 by task [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rknkj-0001Ud-P3
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid use-after-free issue in
 f2fs_filemap_fault
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
Cc: Hillf Danton <hdanton@sina.com>, Ed Tsai <Ed.Tsai@mediatek.com>,
 syzbot+763afad57075d3f862f2@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 03/14, Chao Yu wrote:
> syzbot reports a f2fs bug as below:
> 
> BUG: KASAN: slab-use-after-free in f2fs_filemap_fault+0xd1/0x2c0 fs/f2fs/file.c:49
> Read of size 8 at addr ffff88807bb22680 by task syz-executor184/5058
> 
> CPU: 0 PID: 5058 Comm: syz-executor184 Not tainted 6.7.0-syzkaller-09928-g052d534373b7 #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/17/2023
> Call Trace:
>  <TASK>
>  __dump_stack lib/dump_stack.c:88 [inline]
>  dump_stack_lvl+0x1e7/0x2d0 lib/dump_stack.c:106
>  print_address_description mm/kasan/report.c:377 [inline]
>  print_report+0x163/0x540 mm/kasan/report.c:488
>  kasan_report+0x142/0x170 mm/kasan/report.c:601
>  f2fs_filemap_fault+0xd1/0x2c0 fs/f2fs/file.c:49
>  __do_fault+0x131/0x450 mm/memory.c:4376
>  do_shared_fault mm/memory.c:4798 [inline]
>  do_fault mm/memory.c:4872 [inline]
>  do_pte_missing mm/memory.c:3745 [inline]
>  handle_pte_fault mm/memory.c:5144 [inline]
>  __handle_mm_fault+0x23b7/0x72b0 mm/memory.c:5285
>  handle_mm_fault+0x27e/0x770 mm/memory.c:5450
>  do_user_addr_fault arch/x86/mm/fault.c:1364 [inline]
>  handle_page_fault arch/x86/mm/fault.c:1507 [inline]
>  exc_page_fault+0x456/0x870 arch/x86/mm/fault.c:1563
>  asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:570
> 
> The root cause is: in f2fs_filemap_fault(), vmf->vma may be not alive after
> filemap_fault(), so it may cause use-after-free issue when accessing
> vmf->vma->vm_flags in trace_f2fs_filemap_fault(). So it needs to keep vm_flags
> in separated temporary variable for tracepoint use.
> 
> Fixes: 87f3afd366f7 ("f2fs: add tracepoint for f2fs_vm_page_mkwrite()")
> Reported-and-tested-by: syzbot+763afad57075d3f862f2@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/lkml/000000000000e8222b060f00db3b@google.com
> Cc: Ed Tsai <Ed.Tsai@mediatek.com>
> Cc: Hillf Danton <hdanton@sina.com>

Suggested-by: Hillf Danton <hdanton@sina.com>

I modified to "Suggested-by". Please let me know if this doesn't work.

> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/file.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index a47c57e813bb..c19e55a3e50e 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -39,6 +39,7 @@
>  static vm_fault_t f2fs_filemap_fault(struct vm_fault *vmf)
>  {
>  	struct inode *inode = file_inode(vmf->vma->vm_file);
> +	vm_flags_t flags = vmf->vma->vm_flags;
>  	vm_fault_t ret;
>  
>  	ret = filemap_fault(vmf);
> @@ -46,7 +47,7 @@ static vm_fault_t f2fs_filemap_fault(struct vm_fault *vmf)
>  		f2fs_update_iostat(F2FS_I_SB(inode), inode,
>  					APP_MAPPED_READ_IO, F2FS_BLKSIZE);
>  
> -	trace_f2fs_filemap_fault(inode, vmf->pgoff, vmf->vma->vm_flags, ret);
> +	trace_f2fs_filemap_fault(inode, vmf->pgoff, flags, ret);
>  
>  	return ret;
>  }
> -- 
> 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
