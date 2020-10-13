Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B478328C792
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Oct 2020 05:33:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kSB3Z-0004Px-Ub; Tue, 13 Oct 2020 03:32:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kSB3X-0004Pl-8D
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 13 Oct 2020 03:32:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WI/puVJEv2eYPVHCW0hYP69TVavyuNjMOPuS4GZheIM=; b=M8xRjBXmZETr1IpIA8Jv3//h+c
 CRA8RiDE00L1xey+76YDD0nQE14SX/dQxTHFx0gPFcYSWO7EI/Kr8ycJn4hQEDcHlf5m5YisW+Xxu
 V+T18cI0iRM2DRsLH3dtuN6cw6pwHx2jFYr9TZxef9cuZIH0CEgmPWSicDrZhp1zPwd8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WI/puVJEv2eYPVHCW0hYP69TVavyuNjMOPuS4GZheIM=; b=ZslouJeyipLPFx0Nml+DTmK+Iw
 etoFZhhV9S2SzdXAhcYzbTTdZQvF6XcmTMkSiPVE8MDvdOZFkFrCrhvkdrUjWHLOslsy7oFUUAzFh
 saey15PIJuJIb3RPBDV+MJ1Vx7cRjAdXG0X1AB5maUPBK96xHmeZ7DW/pMnH7CJ0kkgg=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kSB3U-008CCm-EN
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 13 Oct 2020 03:32:55 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 684A4C094766F82F398A;
 Tue, 13 Oct 2020 11:32:41 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.206) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 13 Oct
 2020 11:32:40 +0800
To: Jamie Iles <jamie@nuviainc.com>, <linux-f2fs-devel@lists.sourceforge.net>
References: <20201012130948.58321-1-jamie@nuviainc.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <1a62804d-5e5a-8205-54d7-4401a43e2bc5@huawei.com>
Date: Tue, 13 Oct 2020 11:32:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20201012130948.58321-1-jamie@nuviainc.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: nuviainc.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kSB3U-008CCm-EN
Subject: Re: [f2fs-dev] [PATCH 2/5] f2fs: wait for sysfs kobject removal
 before freeing f2fs_sb_info
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/10/12 21:09, Jamie Iles wrote:
> syzkaller found that with CONFIG_DEBUG_KOBJECT_RELEASE=y, unmounting an
> f2fs filesystem could result in the following splat:
> 
>    kobject: 'loop5' ((____ptrval____)): kobject_release, parent 0000000000000000 (delayed 250)
>    kobject: 'f2fs_xattr_entry-7:5' ((____ptrval____)): kobject_release, parent 0000000000000000 (delayed 750)
>    ------------[ cut here ]------------
>    ODEBUG: free active (active state 0) object type: timer_list hint: delayed_work_timer_fn+0x0/0x98
>    WARNING: CPU: 0 PID: 699 at lib/debugobjects.c:485 debug_print_object+0x180/0x240
>    Kernel panic - not syncing: panic_on_warn set ...
>    CPU: 0 PID: 699 Comm: syz-executor.5 Tainted: G S                5.9.0-rc8+ #101
>    Hardware name: linux,dummy-virt (DT)
>    Call trace:
>     dump_backtrace+0x0/0x4d8
>     show_stack+0x34/0x48
>     dump_stack+0x174/0x1f8
>     panic+0x360/0x7a0
>     __warn+0x244/0x2ec
>     report_bug+0x240/0x398
>     bug_handler+0x50/0xc0
>     call_break_hook+0x160/0x1d8
>     brk_handler+0x30/0xc0
>     do_debug_exception+0x184/0x340
>     el1_dbg+0x48/0xb0
>     el1_sync_handler+0x170/0x1c8
>     el1_sync+0x80/0x100
>     debug_print_object+0x180/0x240
>     debug_check_no_obj_freed+0x200/0x430
>     slab_free_freelist_hook+0x190/0x210
>     kfree+0x13c/0x460
>     f2fs_put_super+0x624/0xa58
>     generic_shutdown_super+0x120/0x300
>     kill_block_super+0x94/0xf8
>     kill_f2fs_super+0x244/0x308
>     deactivate_locked_super+0x104/0x150
>     deactivate_super+0x118/0x148
>     cleanup_mnt+0x27c/0x3c0
>     __cleanup_mnt+0x28/0x38
>     task_work_run+0x10c/0x248
>     do_notify_resume+0x9d4/0x1188
>     work_pending+0x8/0x34c
> 
> Like the error handling for f2fs_register_sysfs(), we need to wait for
> the kobject to be destroyed before returning to prevent a potential
> use-after-free.
> 
> Fixes: bf9e697ecd4 ("f2fs: expose features to sysfs entry")
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Cc: Chao Yu <chao@kernel.org>
> Signed-off-by: Jamie Iles <jamie@nuviainc.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
