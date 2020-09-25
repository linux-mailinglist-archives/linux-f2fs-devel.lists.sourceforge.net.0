Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6629E27838E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Sep 2020 11:07:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kLjh1-0005j9-P8; Fri, 25 Sep 2020 09:07:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kLjgw-0005hV-Jg
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 25 Sep 2020 09:06:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZL1pTU+Pw81FkWlgVFfXVXiiEegio/1XiTaueP5UxNQ=; b=RiUOl10anWxgq1PQLk2H9P0bNs
 ecdtaC2/alLQjoDV0Tia6yy3rmg6WYDTzhTSd+krGIFDc2GSN7JeJdxvYEKAOpxysl1SYCbk9I0Xa
 i4gZHzhkkwA5kbK+A/pVNvPOxV3Ko28aZskjuxv5OiGUUT+N8iIn2P55dW2rFvCQhxt8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZL1pTU+Pw81FkWlgVFfXVXiiEegio/1XiTaueP5UxNQ=; b=Bv94jQ8cxaJtmqSUS+COUjXrl2
 WTgpgXd8W7koEggmrTT3+ycB8XtWlGSKe7yOS8iBDfbVSuaZ4HZCMZSk+GwNQqxXjhRZtIj7CaBHx
 18XLXK7yL9yFU4qw4K6UmeNh3cGzcUFsD9FbqsplCWqxovbyqkhiNH7ma8sgXBdGFwsE=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kLjgk-007X3D-7I
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 25 Sep 2020 09:06:58 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 79C65292597CE6390E0C;
 Fri, 25 Sep 2020 17:06:35 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.207) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 25 Sep
 2020 17:06:33 +0800
To: syzbot <syzbot+0eac6f0bbd558fd866d7@syzkaller.appspotmail.com>,
 <chao@kernel.org>, <glider@google.com>, <jaegeuk@kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <linux-kernel@vger.kernel.org>,
 <syzkaller-bugs@googlegroups.com>
References: <000000000000f9f80905b01c7185@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <eb03a5c9-eb77-eb91-e17f-8a3273aab7da@huawei.com>
Date: Fri, 25 Sep 2020 17:06:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <000000000000f9f80905b01c7185@google.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: 2.2 (++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: googlegroups.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.2 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kLjgk-007X3D-7I
Subject: Re: [f2fs-dev] KMSAN: uninit-value in f2fs_lookup
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,

I don't see any problem here, thanks for your report. :)

Thanks,

On 2020/9/25 13:18, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    c5a13b33 kmsan: clang-format core
> git tree:       https://github.com/google/kmsan.git master
> console output: https://syzkaller.appspot.com/x/log.txt?x=14f5b19b900000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=20f149ad694ba4be
> dashboard link: https://syzkaller.appspot.com/bug?extid=0eac6f0bbd558fd866d7
> compiler:       clang version 10.0.0 (https://github.com/llvm/llvm-project/ c2443155a0fb245c8f17f2c1c72b6ea391e86e81)
> userspace arch: i386
> 
> Unfortunately, I don't have any reproducer for this issue yet.
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+0eac6f0bbd558fd866d7@syzkaller.appspotmail.com
> 
> =====================================================
> BUG: KMSAN: uninit-value in f2fs_lookup+0xe05/0x1a80 fs/f2fs/namei.c:503
> CPU: 0 PID: 20216 Comm: syz-executor.5 Not tainted 5.9.0-rc4-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> Call Trace:
>   __dump_stack lib/dump_stack.c:77 [inline]
>   dump_stack+0x21c/0x280 lib/dump_stack.c:118
>   kmsan_report+0xf7/0x1e0 mm/kmsan/kmsan_report.c:122
>   __msan_warning+0x58/0xa0 mm/kmsan/kmsan_instr.c:219
>   f2fs_lookup+0xe05/0x1a80 fs/f2fs/namei.c:503
>   lookup_open fs/namei.c:3082 [inline]
>   open_last_lookups fs/namei.c:3177 [inline]
>   path_openat+0x2729/0x6a90 fs/namei.c:3365
>   do_filp_open+0x2b8/0x710 fs/namei.c:3395
>   do_sys_openat2+0xa88/0x1140 fs/open.c:1168
>   do_sys_open fs/open.c:1184 [inline]
>   __do_compat_sys_openat fs/open.c:1242 [inline]
>   __se_compat_sys_openat+0x2a4/0x310 fs/open.c:1240
>   __ia32_compat_sys_openat+0x56/0x70 fs/open.c:1240
>   do_syscall_32_irqs_on arch/x86/entry/common.c:80 [inline]
>   __do_fast_syscall_32+0x129/0x180 arch/x86/entry/common.c:139
>   do_fast_syscall_32+0x6a/0xc0 arch/x86/entry/common.c:162
>   do_SYSENTER_32+0x73/0x90 arch/x86/entry/common.c:205
>   entry_SYSENTER_compat_after_hwframe+0x4d/0x5c
> RIP: 0023:0xf7f73549
> Code: b8 01 10 06 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 00 00 00 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 eb 0d 90 90 90 90 90 90 90 90 90 90 90 90
> RSP: 002b:00000000f554c0cc EFLAGS: 00000296 ORIG_RAX: 0000000000000127
> RAX: ffffffffffffffda RBX: 00000000ffffff9c RCX: 0000000020000980
> RDX: 000000000002f042 RSI: 0000000000000000 RDI: 0000000000000000
> RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
> R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
> 
> Local variable ----page@f2fs_lookup created at:
>   f2fs_lookup+0x8f/0x1a80 fs/f2fs/namei.c:477
>   f2fs_lookup+0x8f/0x1a80 fs/f2fs/namei.c:477
> =====================================================
> 
> 
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
