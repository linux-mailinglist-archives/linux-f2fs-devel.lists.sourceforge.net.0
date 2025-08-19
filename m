Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8654FB2B5C6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 Aug 2025 03:16:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Jc3n41XQUKKm5NmfElhEMy4rBDxS1Uk1tl5GkVM8nA=; b=eIlXlP+IKNeR+h1fqTUSuN10Vq
	1COL06nAyngD1T27aHYp5YhtH5XEwK/h1v9FwWD7R2vmgtenSpXI70EB1mKAflXOR9f0HsFt9uTM/
	JRgJcl0B5qyjDyw/FX7gsTedH6/QKLBuD0ee44eDSKvg3ktnjkX4/iK0jZHZF2YVUf9g=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uoAxT-0006Ph-PF;
	Tue, 19 Aug 2025 01:16:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lihongbo22@huawei.com>) id 1uoAxR-0006Pb-Ih
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Aug 2025 01:16:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:CC:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u2iy5E0L0yV4N7Yu9OC6ZivwWS21GoiMrX6LbYPwJWg=; b=eUuivvQDYhHgqTVJ2tRCnDP4Vh
 yUkiBZ/H+LXXJwsdbWMGHRc2BDUXPw99mFR25OUSX9siww+bFD5TL/sfABEBsCU8BhLpDExyQ/iGc
 9yhhktPc17DPJHFJRX96PWDBhS1vDBZJKYtk/6Z+0U3JloV54ELGjzphgeQtyl8t+gqY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=u2iy5E0L0yV4N7Yu9OC6ZivwWS21GoiMrX6LbYPwJWg=; b=lLZopZM0ZcCFenjSwb0iFir4+S
 cYOQkNqTTbghnIgSHy/5H2tydJXQ+Zs6oHEZhk/UAdcRE6rJN7nPVY1AVxsKTkUrm4ouH9v+4YR+m
 Y5iWIefb1GzSxEdSRWjCv+YEqXyPMCbcwUCTPRoYnwFJszrrin40fRqefNBXwzNFA8r8=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uoAxQ-00014E-D1 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Aug 2025 01:16:13 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4c5WmS0sgdz2TT3C;
 Tue, 19 Aug 2025 09:13:12 +0800 (CST)
Received: from kwepemo500009.china.huawei.com (unknown [7.202.194.199])
 by mail.maildlp.com (Postfix) with ESMTPS id 7D1EA180042;
 Tue, 19 Aug 2025 09:15:59 +0800 (CST)
Received: from [10.67.111.104] (10.67.111.104) by
 kwepemo500009.china.huawei.com (7.202.194.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 19 Aug 2025 09:15:58 +0800
Message-ID: <88a96294-c2a2-477f-ac9b-5867e0b59883@huawei.com>
Date: Tue, 19 Aug 2025 09:15:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, <jaegeuk@kernel.org>
References: <20250818020939.3529802-1-chao@kernel.org>
Content-Language: en-US
In-Reply-To: <20250818020939.3529802-1-chao@kernel.org>
X-Originating-IP: [10.67.111.104]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemo500009.china.huawei.com (7.202.194.199)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/8/18 10:09, Chao Yu wrote: > syzbot reported a f2fs
 bug as below: > > Oops: gen[ 107.736417][ T5848] Oops: general protection
 fault, probably for non-canonical address 0xdffffc0000000000: 0000 [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [45.249.212.190 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [45.249.212.190 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uoAxQ-00014E-D1
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: fix to avoid NULL pointer
 dereference in f2fs_check_quota_consistency()
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
From: Hongbo Li via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Hongbo Li <lihongbo22@huawei.com>
Cc: syzbot+d371efea57d5aeab877b@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



On 2025/8/18 10:09, Chao Yu wrote:
> syzbot reported a f2fs bug as below:
> 
> Oops: gen[  107.736417][ T5848] Oops: general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] SMP KASAN PTI
> KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
> CPU: 1 UID: 0 PID: 5848 Comm: syz-executor263 Tainted: G        W           6.17.0-rc1-syzkaller-00014-g0e39a731820a #0 PREEMPT_{RT,(full)}
> RIP: 0010:strcmp+0x3c/0xc0 lib/string.c:284
> Call Trace:
>   <TASK>
>   f2fs_check_quota_consistency fs/f2fs/super.c:1188 [inline]
>   f2fs_check_opt_consistency+0x1378/0x2c10 fs/f2fs/super.c:1436
>   __f2fs_remount fs/f2fs/super.c:2653 [inline]
>   f2fs_reconfigure+0x482/0x1770 fs/f2fs/super.c:5297
>   reconfigure_super+0x224/0x890 fs/super.c:1077
>   do_remount fs/namespace.c:3314 [inline]
>   path_mount+0xd18/0xfe0 fs/namespace.c:4112
>   do_mount fs/namespace.c:4133 [inline]
>   __do_sys_mount fs/namespace.c:4344 [inline]
>   __se_sys_mount+0x317/0x410 fs/namespace.c:4321
>   do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>   do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
>   entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> The direct reason is f2fs_check_quota_consistency() may suffer null-ptr-deref
> issue in strcmp().
> 
> The bug can be reproduced w/ below scripts:
> mkfs.f2fs -f /dev/vdb
> mount -t f2fs -o usrquota /dev/vdb /mnt/f2fs
> quotacheck -uc /mnt/f2fs/
> umount /mnt/f2fs
> mount -t f2fs -o usrjquota=aquota.user,jqfmt=vfsold /dev/vdb /mnt/f2fs
> mount -t f2fs -o remount,usrjquota=,jqfmt=vfsold /dev/vdb /mnt/f2fs
> umount /mnt/f2fs
> 
> So, before old_qname and new_qname comparison, we need to check whether
> they are all valid pointers, fix it.
> 
> Reported-by: syzbot+d371efea57d5aeab877b@syzkaller.appspotmail.com
> Fixes: d18535132523 ("f2fs: separate the options parsing and options checking")
> Closes: https://lore.kernel.org/linux-f2fs-devel/689ff889.050a0220.e29e5.0037.GAE@google.com
> Cc: Hongbo Li <lihongbo22@huawei.com>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---

Reviewed-by: Hongbo Li <lihongbo22@huawei.com>

Thanks,
Hongbo

>   fs/f2fs/super.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 5aa9d650512d..465604fdc5dd 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -1219,7 +1219,8 @@ static int f2fs_check_quota_consistency(struct fs_context *fc,
>   				goto err_jquota_change;
>   
>   			if (old_qname) {
> -				if (strcmp(old_qname, new_qname) == 0) {
> +				if (new_qname &&
> +					strcmp(old_qname, new_qname) == 0) {
>   					ctx->qname_mask &= ~(1 << i);
>   					continue;
>   				}


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
