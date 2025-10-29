Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B16AC19D75
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Oct 2025 11:48:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dTBiqysEB+o7Qu70ddanSB6RFlPqe6GU5Mtp29ebhQU=; b=PsxKGJ9DhLN9fl3LtDsz5nw27u
	yx8NQK85O1+lou1V3KnrN+hQfcLTDWjF5K3qRlOa9VxGNCEzfGV1P/Y+AAyWrY454n4u9vLAqmGBu
	6onjJst+7qyC+28vxJRtOUWMS1/+PJtPNhENFrNThB7rDVWNq5m8IbTP1St1G1XsWKgc=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vE3iv-0007to-OA;
	Wed, 29 Oct 2025 10:48:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vE3iu-0007td-Hf
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Oct 2025 10:48:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=B7XW3TPX8WqEX01s3plPlaGfHsRE6PJHN9Cuil4gTyc=; b=Uv4HPwZtg8fxTK2YKYsYQsfHFd
 +OZG3zNF7hhQhwtbGyW7UzvdWnWN7NllZ6dS3YZsnWTSh7CV4Tx8qq25G1ZlIScviX/kMgzTPsG/i
 QD8XMUmpIxcE64F82pJdchDPFXfdlMj1Nqe8RDQ9EtUUuF6hmdzKVmscNfzJhqe/GWgw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=B7XW3TPX8WqEX01s3plPlaGfHsRE6PJHN9Cuil4gTyc=; b=gwBmzGe6gyqomgZJDkDOK12p8y
 Qk5E6Med+iXlGhZbMfxyN07AwRELEu2VAZd9P+BcQemErqBOjymO5EmgCB99Onsnni9SxEvPDi5Fy
 NcXAGwoXFfeH4EAh8D1CqMlhFK5BomwgXmS51F6c3P2YegOakRlpm3TSu2sW7PFD+imU=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vE3iu-0004kA-P2 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Oct 2025 10:48:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 14145603AB;
 Wed, 29 Oct 2025 10:48:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05B59C4CEF7;
 Wed, 29 Oct 2025 10:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761734886;
 bh=k0xyPnnJykAXBImiZDPRP273138hbAIuyyyIm7R6xac=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=bqcfmcKFQe+GzaDSYYHETpRQo8NMmKt/GCgw4hb5XGq4+JrTvlk3E3TOx+g5iLXW/
 1BxBb861dAKu+KRPxeOfNFTZCKARdbnhEGnpBDk5Gf862KVmlSC2AY4Tu0HJpfDrcM
 k7nUt1GFIi//ILheiSJGNoIxj6MDGp0AeoyYg1OTp2WUIgUW/W45MwVKnKMSOr3LAG
 bI6XIRkmaAVL8pBWE71+uzleiISXvYXrq82CNsTTcjZ7XLf6MXfIV3lQ/WIeFQ5dlj
 AwlkAH1X07bCQL9mtvfwf7BBF/Al9Y4ER4m/HtJeSCfFWJkXgFYohkiWO5ebl//ikv
 Ae4gQGYKeWq1w==
Message-ID: <f2ff436b-d0de-4d68-8374-1c6bf777d6ee@kernel.org>
Date: Wed, 29 Oct 2025 18:48:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Xiaole He <hexiaole1994@126.com>, linux-f2fs-devel@lists.sourceforge.net
References: <20251029051807.3804-1-hexiaole1994@126.com>
Content-Language: en-US
In-Reply-To: <20251029051807.3804-1-hexiaole1994@126.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/29/25 13:18, Xiaole He wrote: > The one_time_gc field
 in struct victim_sel_policy is conditionally > initialized but unconditionally
 read, leading to undefined behavior > that triggers UBSAN war [...] 
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
X-Headers-End: 1vE3iu-0004kA-P2
Subject: Re: [f2fs-dev] [PATCH v1] f2fs: fix uninitialized one_time_gc in
 victim_sel_policy
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
Cc: jaegeuk@kernel.org, stable@kernel.org, daehojeong@google.com,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 10/29/25 13:18, Xiaole He wrote:
> The one_time_gc field in struct victim_sel_policy is conditionally
> initialized but unconditionally read, leading to undefined behavior
> that triggers UBSAN warnings.
> 
> In f2fs_get_victim() at fs/f2fs/gc.c:774, the victim_sel_policy
> structure is declared without initialization:
> 
>     struct victim_sel_policy p;
> 
> The field p.one_time_gc is only assigned when the 'one_time' parameter
> is true (line 789):
> 
>     if (one_time) {
>         p.one_time_gc = one_time;
>         ...
>     }
> 
> However, this field is unconditionally read in subsequent get_gc_cost()
> at line 395:
> 
>     if (p->one_time_gc && (valid_thresh_ratio < 100) && ...)
> 
> When one_time is false, p.one_time_gc contains uninitialized stack
> memory. Hence p.one_time_gc is an invalid bool value.
> 
> UBSAN detects this invalid bool value:
> 
>     UBSAN: invalid-load in fs/f2fs/gc.c:395:7
>     load of value 77 is not a valid value for type '_Bool'
>     CPU: 3 UID: 0 PID: 1297 Comm: f2fs_gc-252:16 Not tainted 6.18.0-rc3
>     #5 PREEMPT(voluntary)
>     Hardware name: OpenStack Foundation OpenStack Nova,
>     BIOS 1.13.0-1ubuntu1.1 04/01/2014
>     Call Trace:
>      <TASK>
>      dump_stack_lvl+0x70/0x90
>      dump_stack+0x14/0x20
>      __ubsan_handle_load_invalid_value+0xb3/0xf0
>      ? dl_server_update+0x2e/0x40
>      ? update_curr+0x147/0x170
>      f2fs_get_victim.cold+0x66/0x134 [f2fs]
>      ? sched_balance_newidle+0x2ca/0x470
>      ? finish_task_switch.isra.0+0x8d/0x2a0
>      f2fs_gc+0x2ba/0x8e0 [f2fs]
>      ? _raw_spin_unlock_irqrestore+0x12/0x40
>      ? __timer_delete_sync+0x80/0xe0
>      ? timer_delete_sync+0x14/0x20
>      ? schedule_timeout+0x82/0x100
>      gc_thread_func+0x38b/0x860 [f2fs]
>      ? gc_thread_func+0x38b/0x860 [f2fs]
>      ? __pfx_autoremove_wake_function+0x10/0x10
>      kthread+0x10b/0x220
>      ? __pfx_gc_thread_func+0x10/0x10 [f2fs]
>      ? _raw_spin_unlock_irq+0x12/0x40
>      ? __pfx_kthread+0x10/0x10
>      ret_from_fork+0x11a/0x160
>      ? __pfx_kthread+0x10/0x10
>      ret_from_fork_asm+0x1a/0x30
>      </TASK>
> 
> This issue is reliably reproducible with the following steps on a
> 100GB SSD /dev/vdb:
> 
>     mkfs.f2fs -f /dev/vdb
>     mount /dev/vdb /mnt/f2fs_test
>     fio --name=gc --directory=/mnt/f2fs_test --rw=randwrite \
>         --bs=4k --size=8G --numjobs=12 --fsync=4 --runtime=10 \
>         --time_based
>     echo 1 > /sys/fs/f2fs/vdb/gc_urgent
> 
> The uninitialized value causes incorrect GC victim selection, leading
> to unpredictable garbage collection behavior.
> 
> Fix by zero-initializing the entire victim_sel_policy structure to
> ensure all fields have defined values.
> 
> Fixes: e791d00bd06c ("f2fs: add valid block ratio not to do excessive GC for one time GC")
> Cc: stable@kernel.org
> Signed-off-by: Xiaole He <hexiaole1994@126.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
