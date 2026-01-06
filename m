Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A44CF73EB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 06 Jan 2026 09:14:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9+rYd2Bq8vVQEbXhI3gHVGUx+KVnJrGPeHg+Hvk21mg=; b=LzAoXV3ufwMSMnkPYcSdCoKlZN
	68+nSqBS9K4Qlwyy5pZSUYlJWz8/3fUKyx+kiTwIfU8clhzsF+qxG51pbIvHQNLGV33c4HaBCxYqs
	1vHECLqSXKC5CpWHfXaG6b9pACmkuz8lFzMm5GPCwgHflOmnSEZCtzcseJBw4A6X4TZA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vd2Cz-00064G-QG;
	Tue, 06 Jan 2026 08:14:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vd2Cy-000643-II
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jan 2026 08:14:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eygUIBzUHVUmroCpEWEGC1LZLXwagKkwRhM4qmzzjQM=; b=IQQOdVdbBZyo+xdyas132+y34H
 ezz6Bs7E2so643JfzZ50oEC3kXcdtPCTYQEO+Kxy6pI3nKW3yXAsAbL9QWO6Acw/yxGfVmtTGfC9p
 H2hJ2T2lRvzSkV+NldRkfo55X3lkNv27X4Mj3h1lkHl17nxWKXdZfSx3QnpAXVnewhww=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eygUIBzUHVUmroCpEWEGC1LZLXwagKkwRhM4qmzzjQM=; b=FzlnfHaKPkQzlJoI4EiJ2hfu0F
 AhqaJPM9sGHoVxYzutY2XZhgDyNtOEu+sNzrmOjwLtRT2/HuZNrf/j8pCY82xWydWOFMpaArsQm2U
 PAcdndUWSqVz7lZTsS9I4GlFQD9HV2Zfn7s+VWmDM+Gh/6ExZZZUtQ/JHi8p2tX0Jry4=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vd2Cy-0005j4-MW for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jan 2026 08:14:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3073443FFB;
 Tue,  6 Jan 2026 08:14:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD1A1C116C6;
 Tue,  6 Jan 2026 08:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767687258;
 bh=F4RtnOEqGW5sahZpVUJ3h1wki9Hc/vi9R3ILi+eHVRQ=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=kg6l7a+hf4m0TOQBrtlm+VJbWZeVvICP8OzjJH7J+zs0xRa6aVIwtuno8WYThBkK5
 8o94Tp8Wtnc4BD7NoozDUW2kFx2xkViD8dhhPs2/A0lmzMqxi8LHcbMePnt90RV45b
 s6aWT1kcHSypcXxRQRHVC5WroPAALkT5XPPSrRj1vBS3SCIqqLSQK7Ho+eAoqenTpC
 onptQVwJK7zBcBXYLrmhW0EcdAtU8My7QbZB7EBkFxp1xsEDkMPTT9W7urhLkMLpPN
 INEwcWijAAZzs6GhsSbwwjfgJWcYbkjB8R52SIE2Z+zT/WcB/Z8XPp9AYDehL3RDeQ
 s6hTQRtN8UCEg==
Message-ID: <b8e999ba-6bf4-4a69-ae06-0090c6f531b9@kernel.org>
Date: Tue, 6 Jan 2026 16:14:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Szymon Wilczek <swilczek.lx@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20251223162823.23606-1-swilczek.lx@gmail.com>
 <20251230140850.70778-1-swilczek.lx@gmail.com>
Content-Language: en-US
In-Reply-To: <20251230140850.70778-1-swilczek.lx@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/30/2025 10:08 PM,
 Szymon Wilczek wrote: > Syzbot reported
 a slab-use-after-free issue in f2fs_write_end_io(): > > BUG: KASAN:
 slab-use-after-free
 in f2fs_write_end_io+0x9b9/0xb60 > Read of size [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vd2Cy-0005j4-MW
Subject: Re: [f2fs-dev] [PATCH v5] f2fs: fix use-after-free in
 f2fs_write_end_io
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
Cc: syzbot+b4444e3c972a7a124187@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/30/2025 10:08 PM, Szymon Wilczek wrote:
> Syzbot reported a slab-use-after-free issue in f2fs_write_end_io():
> 
> BUG: KASAN: slab-use-after-free in f2fs_write_end_io+0x9b9/0xb60
> Read of size 4 at addr ffff88804357d170 by task kworker/u4:4/45
> 
> The race condition occurs between the filesystem unmount path
> (kill_f2fs_super) and the asynchronous I/O completion handler
> (f2fs_write_end_io).
> 
> When unmounting, kill_f2fs_super() frees the sbi structure. However,
> if the bio completion callback f2fs_write_end_io() is still running
> in softirq context, it may access sbi->cp_wait after sbi has been
> freed, causing a use-after-free.
> 
> Fix this by calling synchronize_rcu() before kfree(sbi). Since
> bio completion callbacks run in softirq context, which is an implicit
> RCU read-side critical section, synchronize_rcu() ensures all
> in-flight callbacks have completed before we free sbi.
> 
> Reported-by: syzbot+b4444e3c972a7a124187@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=b4444e3c972a7a124187
> Signed-off-by: Szymon Wilczek <swilczek.lx@gmail.com>
> ---
> v5: Resend as reply to original thread (v4 was mistakenly sent to a new thread).
> v4: Removed f2fs_wait_on_all_pages() call as pointed out by Chao Yu that
>      it accesses sbi->write_io which has already been freed in f2fs_put_super().
> v3: Simplified to minimal fix - only super.c change with synchronize_rcu(),
>      as pointed out by Chao Yu that data.c changes are not necessary since
>      synchronize_rcu() alone guarantees sbi won't be freed before callbacks
>      complete.
> v2: Add synchronize_rcu() to wait for softirq bio callbacks to complete.
>   fs/f2fs/super.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index c4c225e09dc4..dfa3c76c6f2a 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -5454,6 +5454,7 @@ static void kill_f2fs_super(struct super_block *sb)
>   	kill_block_super(sb);
>   	/* Release block devices last, after fscrypt_destroy_keyring(). */
>   	if (sbi) {
> +		synchronize_rcu();

Can you please add one line comment to describe why we need to call
synchronize_rcu() here?

Thanks,

>   		destroy_device_list(sbi);
>   		kfree(sbi);
>   		sb->s_fs_info = NULL;



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
