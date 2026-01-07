Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E30CFC481
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 07 Jan 2026 08:07:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DvFCr19RCraOtHYXO4Sifuyz+sWT858qQE4e0WaPzA4=; b=KYkaEIq/51OtT0xyt1xHqsvWeq
	e7vOtgt6Dmy4jh3W7PKdMWvHHxzGd2c1gbGG9YvDIuHRT+XMWm/1KOWzjxz6ZMQ4jCukRBNQVo0j5
	Bxkk9sR2yfEIuYCl+Pn9vBJARh9iPY6EIGp7JrwZ83IovlkyBkJAx8kiKDalb0d/0d38=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vdNdI-00046N-03;
	Wed, 07 Jan 2026 07:07:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vdNdG-00046H-PP
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jan 2026 07:07:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2PI2DC3vqfAKCXYJXnlXggHeXI7oizaZdnmbirmueAw=; b=RwPVo7Y1oEmpiC5otE5bK+l/9x
 7VRnLF8js5o0ilKHNqaF+x4QcVX4XkT12wqo8bzjLnKq7kkZ9bnAnVsfpScxvfCTQBS+T1m0sM40G
 qhcExa15oRq1R6yXFF65SL1Vs6MzbYHssTvlL5CzJECqmYKE69T/N3nQvTgYjyXIYWvM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2PI2DC3vqfAKCXYJXnlXggHeXI7oizaZdnmbirmueAw=; b=FyR+VwoF72Gc3R0FfEIMMkyrWR
 JxigZ2VMnCH1Kyt+HtvyNsHEb2mz/txfaTDfJ7A3JoIaPj0b7kVldGf7UY6EIdn2D7khmxq8ppueI
 rz9soQl0o/ZrSLJHCAsLkeyOviTwadbESTojmC2QMEA9O6QbyFNZRzFWMhoXR1beynWs=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vdNdG-0004Qj-7K for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jan 2026 07:07:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8F43560007;
 Wed,  7 Jan 2026 07:06:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F375DC4CEF7;
 Wed,  7 Jan 2026 07:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767769611;
 bh=DnwTHxnIFNf2z/PGo16b17zIVjyMAlukpNjHRfi1YdM=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=owDuFknjERfV4+Q1uE6k1i51sSFwUu7cGyuZuxvoqCuukmPC5j07ATkYOoXxNUFLV
 aLn7ixjfpQ+rpbpiQufWdU2UYRr/PWiVE3zMIyQZueCp13DMWWw6wa6aB1N1rDo4WL
 rGVVdFMxCltFkGbsNY0JxrZ12TIoTpZ0jRzpuLAKqmm5Jxbb/nFwwKdNEu4et+IA2r
 AT/O1dC0jmLDEEGRqbJvQHosm6p0OzDjFTGsi6R8XZu7Y83/dGBUyE97d606VWX1oM
 PDFFcHcOUwtH2pABboZ73cElPK0f6XrMp9AkaKGhrO5PNBOlEiKZLDGkVS3XUSHGKl
 uGf/LD9zYpIDQ==
Message-ID: <fbf190e3-a6a6-4202-9b40-1daeee195fa9@kernel.org>
Date: Wed, 7 Jan 2026 15:06:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Szymon Wilczek <swilczek.lx@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20251223162823.23606-1-swilczek.lx@gmail.com>
 <20260106130646.15092-1-swilczek.lx@gmail.com>
Content-Language: en-US
In-Reply-To: <20260106130646.15092-1-swilczek.lx@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 1/6/2026 9:06 PM, Szymon Wilczek wrote: > Syzbot reported
 a slab-use-after-free issue in f2fs_write_end_io(): > > BUG: KASAN:
 slab-use-after-free
 in f2fs_write_end_io+0x9b9/0xb60 > Read of size 4 a [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vdNdG-0004Qj-7K
Subject: Re: [f2fs-dev] [PATCH v6] f2fs: fix use-after-free in
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

On 1/6/2026 9:06 PM, Szymon Wilczek wrote:
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

As I checked w/ reproduer in syzbot, the patch doesn't fix the UAF issue.

https://lore.kernel.org/lkml/695e0473.050a0220.1c677c.0356.GAE@google.com

Thanks,

> Signed-off-by: Szymon Wilczek <swilczek.lx@gmail.com>
> ---
> v6: Add comment to explain synchronize_rcu() call.
>      Resend as reply to original thread.
> v5: Resend as reply to original thread (v4 was mistakenly sent to a new thread).
> v4: Removed f2fs_wait_on_all_pages() call as pointed out by Chao Yu that
>      it accesses sbi->write_io which has already been freed in f2fs_put_super().
> v3: Simplified to minimal fix - only super.c change with synchronize_rcu(),
>      as pointed out by Chao Yu that data.c changes are not necessary since
>      synchronize_rcu() alone guarantees sbi won't be freed before callbacks
>      complete.
> v2: Add synchronize_rcu() to wait for softirq bio callbacks to complete.
>   fs/f2fs/super.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index c4c225e09dc4..f5707591ba25 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -5454,6 +5454,8 @@ static void kill_f2fs_super(struct super_block *sb)
>   	kill_block_super(sb);
>   	/* Release block devices last, after fscrypt_destroy_keyring(). */
>   	if (sbi) {
> +		/* wait for f2fs_write_end_io() to finish */
> +		synchronize_rcu();
>   		destroy_device_list(sbi);
>   		kfree(sbi);
>   		sb->s_fs_info = NULL;



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
