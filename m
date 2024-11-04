Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D496D9BAB6C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Nov 2024 04:31:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t7nnw-0005Qk-UP;
	Mon, 04 Nov 2024 03:31:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t7nnu-0005Qb-5Q
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Nov 2024 03:30:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0xVWwSVNiIPdyheliHsi7WptDJKB/5S4JhAilHSAXf4=; b=TTl3maIREF9iLxmbsz8qDofKY9
 0LFsi2er3pcZhDLqD7D4ar+sUvPxZn5vhmPPpp3neq/pLFFlP0m8ajoZ+O34ObH4L4RtNacGWLemc
 dWacDCw/pJJ2RjDkamuXKYOtv01mEQY8YxZgQXf88plBkcyurQpBi+85k+nkwbLUs5c4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0xVWwSVNiIPdyheliHsi7WptDJKB/5S4JhAilHSAXf4=; b=TOSIkfjMOMqTkl2XCIoRQR9pXh
 IfiToafSduqBfThE5wr4QCs8h4En8OtB94ZVkbpvh67Vn1IGNB90uN3aoiTha/2UOenk4ZbKPMKY0
 62QaH61P1E3xcOrzxmNh5uNZhH632IE8evGsywH7rsKmK9y+rvx9Y40t2+vgMKMoJNNw=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t7nnt-0005SH-GT for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Nov 2024 03:30:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8F728A425B1;
 Mon,  4 Nov 2024 03:28:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ABFFC4CED0;
 Mon,  4 Nov 2024 03:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730691046;
 bh=jIv4JxjklgBD9dTti9ihuX03zJArfivWHEKdJfA20h0=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=H5pFk2hlwvQemuYVuUB80BxyYMIVaULXzeexi2mNHn7k7qYPoiJWDDqAlnqHNlXRO
 I8TfH6p0mhDfLGTVSxlBNI4zaYs+r/ZW39YSS+fa0Iz/Xc74gpBHusAvL7Ro0vaS4b
 iAmawUPoesQsATmm6kCO5PY42VVgNvQcd4q8MAyybgHDFrxbFKg+4NIQixL+D1lYkq
 DBfbxBKmB2TDCDrWNghKT18XMNHEAWy18LOJpjnICqIBueec8HjmGwRP822vw5onJQ
 b7N94Gm9smDRXYzMHqsS9fn7OsUyYeArsluWeg/v4l7rFqwZpi7SbhNQK1s/KrHSuc
 MbWo1sRJwhd6g==
Message-ID: <81a55b36-0a69-42d6-b82a-94499c37a4fd@kernel.org>
Date: Mon, 4 Nov 2024 11:30:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Long Li <leo.lilong@huawei.com>, jaegeuk@kernel.org
References: <20241104020542.2603607-1-leo.lilong@huawei.com>
Content-Language: en-US
In-Reply-To: <20241104020542.2603607-1-leo.lilong@huawei.com>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/11/4 10:05, Long Li wrote: > In my test case,
 concurrent
 calls to f2fs shutdown report the following > stack trace: > > Oops: general
 protection fault, probably for non-canonical address 0xc6c [...] 
 Content analysis details:   (-0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t7nnt-0005SH-GT
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix race in concurrent
 f2fs_stop_gc_thread
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
Cc: yi.zhang@huawei.com, lonuxli.64@gmail.com, yangerkun@huawei.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/11/4 10:05, Long Li wrote:
> In my test case, concurrent calls to f2fs shutdown report the following
> stack trace:
> 
>   Oops: general protection fault, probably for non-canonical address 0xc6cfff63bb5513fc: 0000 [#1] PREEMPT SMP PTI
>   CPU: 0 UID: 0 PID: 678 Comm: f2fs_rep_shutdo Not tainted 6.12.0-rc5-next-20241029-g6fb2fa9805c5-dirty #85
>   Call Trace:
>    <TASK>
>    ? show_regs+0x8b/0xa0
>    ? __die_body+0x26/0xa0
>    ? die_addr+0x54/0x90
>    ? exc_general_protection+0x24b/0x5c0
>    ? asm_exc_general_protection+0x26/0x30
>    ? kthread_stop+0x46/0x390
>    f2fs_stop_gc_thread+0x6c/0x110
>    f2fs_do_shutdown+0x309/0x3a0
>    f2fs_ioc_shutdown+0x150/0x1c0
>    __f2fs_ioctl+0xffd/0x2ac0
>    f2fs_ioctl+0x76/0xe0
>    vfs_ioctl+0x23/0x60
>    __x64_sys_ioctl+0xce/0xf0
>    x64_sys_call+0x2b1b/0x4540
>    do_syscall_64+0xa7/0x240
>    entry_SYSCALL_64_after_hwframe+0x76/0x7e
> 
> The root cause is a race condition in f2fs_stop_gc_thread() called from
> different f2fs shutdown paths:
> 
>    [CPU0]                       [CPU1]
>    ----------------------       -----------------------
>    f2fs_stop_gc_thread          f2fs_stop_gc_thread
>                                   gc_th = sbi->gc_thread
>      gc_th = sbi->gc_thread
>      kfree(gc_th)
>      sbi->gc_thread = NULL
>                                   < gc_th != NULL >
>                                   kthread_stop(gc_th->f2fs_gc_task) //UAF
> 
> The commit c7f114d864ac ("f2fs: fix to avoid use-after-free in
> f2fs_stop_gc_thread()") attempted to fix this issue by using a read
> semaphore to prevent races between shutdown and remount threads, but
> it fails to prevent all race conditions.
> 
> Fix it by converting to write lock of s_umount in f2fs_do_shutdown().
> 
> Fixes: 7950e9ac638e ("f2fs: stop gc/discard thread after fs shutdown")
> Signed-off-by: Long Li <leo.lilong@huawei.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
