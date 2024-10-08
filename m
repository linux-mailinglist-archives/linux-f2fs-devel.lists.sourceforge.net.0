Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B2223993D77
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Oct 2024 05:26:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sy0rL-0000XV-4d;
	Tue, 08 Oct 2024 03:26:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sy0rJ-0000XN-Qt
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Oct 2024 03:26:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6lihWLrLKUwx7jpLkvJhJNOf6L95C7tjdVHpYJUEXeo=; b=AEGWR+mIP1a2YIRdXNbKfATVuV
 jn8vlMSLnWsM3PWKIlKkYnr/44+mPiQMWMzXcqKudcWbiwONNklC5sT7lxJ0hbRDpyP6iyP48KXiD
 sEEyEzrECPvzyWYbE/xHrSAv+wAORFjoibAELfBLJc8QO9nc3bMv9JhdPk/TCglap8S0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6lihWLrLKUwx7jpLkvJhJNOf6L95C7tjdVHpYJUEXeo=; b=erJh7dMjQD9VUXpFy0ZQ1ukoh8
 VKqxgvcob7Ip15AnnQW+t9q2qNc61giKODo38ycljv2gZkobv2LWUfpGWiFWghQtkfzV9XFIb0Wym
 aw3ZDlkQDjY8jeZcduFncpZ0AeTsuY9KkWKAKPjpVcfKXqocu4HZNZjVZIe+reMPv9SQ=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sy0rI-0004Ha-H8 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Oct 2024 03:26:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3FD03A42997;
 Tue,  8 Oct 2024 03:25:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C59AC4CEC6;
 Tue,  8 Oct 2024 03:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728357949;
 bh=ahYiF+5APi3SyfJETyVj7UcmuY9R573psv9Nj//7cpg=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=I60R905ZGbEdvaKVec2zNhGQqAFZ1zZiATGeKBF+xYncc/TlKWxomAIh+Mv8lnrQu
 /frRPrONjsRz8UGyXgE4AKAyv8MCQ5eOJfjOsjS7TyeV9vFv8WkfZMacQh7Hweol0w
 PXzTrHdpQ7EfoMUUVANfN2T2OtoibjXXuEy2SogUSiqCNQ8tcJYqnQIcIj3lzQRYoT
 G7vnREQ6yLf4f332c1yE2rMdisrL8oydVCzNKTOaaIG/oJOd6JD/cA7XTO21H6Dq88
 d+UPU6+iSDJxvOro2Crpk3elbhIin87Uz1ehMxdeBx/SfKgT50otkgsNI+OakB9cMy
 Ie90/h8S1Nxbg==
Message-ID: <82e4a8bb-29d4-4ce8-bc04-985b08801aeb@kernel.org>
Date: Tue, 8 Oct 2024 11:25:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Qi Han <hanqi@vivo.com>, jaegeuk@kernel.org
References: <20240918084400.1821317-1-hanqi@vivo.com>
Content-Language: en-US
In-Reply-To: <20240918084400.1821317-1-hanqi@vivo.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/9/18 16:44, Qi Han wrote: > creating a large files
 during checkpoint disable until it runs out of > space and then delete it,
 then remount to enable checkpoint again, and > then unmount the fi [...] 
 Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sy0rI-0004Ha-H8
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix f2fs_bug_on when uninstalling
 filesystem call f2fs_evict_inode.
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

On 2024/9/18 16:44, Qi Han wrote:
> creating a large files during checkpoint disable until it runs out of
> space and then delete it, then remount to enable checkpoint again, and
> then unmount the filesystem triggers the f2fs_bug_on as below:
> 
> ------------[ cut here ]------------
> kernel BUG at fs/f2fs/inode.c:896!
> CPU: 2 UID: 0 PID: 1286 Comm: umount Not tainted 6.11.0-rc7-dirty #360
> Oops: invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
> RIP: 0010:f2fs_evict_inode+0x58c/0x610
> Call Trace:
>   __die_body+0x15/0x60
>   die+0x33/0x50
>   do_trap+0x10a/0x120
>   f2fs_evict_inode+0x58c/0x610
>   do_error_trap+0x60/0x80
>   f2fs_evict_inode+0x58c/0x610
>   exc_invalid_op+0x53/0x60
>   f2fs_evict_inode+0x58c/0x610
>   asm_exc_invalid_op+0x16/0x20
>   f2fs_evict_inode+0x58c/0x610
>   evict+0x101/0x260
>   dispose_list+0x30/0x50
>   evict_inodes+0x140/0x190
>   generic_shutdown_super+0x2f/0x150
>   kill_block_super+0x11/0x40
>   kill_f2fs_super+0x7d/0x140
>   deactivate_locked_super+0x2a/0x70
>   cleanup_mnt+0xb3/0x140
>   task_work_run+0x61/0x90
> 
> The root cause is: creating large files during disable checkpoint
> period results in not enough free segments, so when writing back root
> inode will failed in f2fs_enable_checkpoint. When umount the file
> system after enabling checkpoint, the root inode is dirty in
> f2fs_evict_inode function, which triggers BUG_ON. The steps to
> reproduce are as follows:
> 
> dd if=/dev/zero of=f2fs.img bs=1M count=55
> mount f2fs.img f2fs_dir -o checkpoint=disable:10%
> dd if=/dev/zero of=big bs=1M count=50
> sync
> rm big
> mount -o remount,checkpoint=enable f2fs_dir
> umount f2fs_dir
> 
> Let's redirty inode when there is not free segments during checkpoint
> is disable.
> 
> Signed-off-by: Qi Han <hanqi@vivo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
