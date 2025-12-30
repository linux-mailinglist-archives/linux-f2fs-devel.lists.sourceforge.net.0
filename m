Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2786DCE8AD3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Dec 2025 05:19:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TwCcn4a8U6Dh1vkLTz4HB3pJjUhafWtuIur8KQUNVEc=; b=UpWCJZJafJbuVjJHhQp35DTsSR
	gAd5bpdxaAm0NrGfJSwlKrYvdlnQuJ9WF7ego3ICNapyr7FE/QDiz5nP+2fWGvElyGpP4WFsMJPHJ
	wk2/m2liUpEEpl6wrAj033YemGf7jogssHMihf5QfUH88RXc2zXqpQWsO8Itamecm0aA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vaRC3-00048K-Eg;
	Tue, 30 Dec 2025 04:18:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vaRC2-000485-1g
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Dec 2025 04:18:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1XbdU7SLzNeqQm7hb/5G5RKJKpyirBFOO/uyo0cmfpI=; b=ANDDnA7ELho+M61MqhnET5x9zF
 1CVMFZ5Hc5zE3yvWFSJm1mcKr7ojqhj1GzaiMS923ry/nVC0xCHKcK+2rP8ciOG68xAaJAoDpPvJv
 N0tmK5NYXX74SdS2CKZn74FpREOofqv8YNtys1xKGYO8a9zpI1vfgpVxeamwYoGScQ9Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1XbdU7SLzNeqQm7hb/5G5RKJKpyirBFOO/uyo0cmfpI=; b=aQgG+EXFFJXXMzJnbfN+0mQ2iq
 qH6l2av0U8ra09pQ4jzBLeRlgqmHdiYgdgcb40NVrQsrFnCI1w9Z0PqKrzxd+ggcUHYhZ5dsyEudr
 xtcG67kBhb3OSJYax0VUDxTYrBH5Q/fS0V0sszxC9V0OUrYsiPh9KifE2Nz251KH/t9I=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vaRC2-0003OO-BP for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Dec 2025 04:18:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0151B405A0;
 Tue, 30 Dec 2025 04:18:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1C94C4CEFB;
 Tue, 30 Dec 2025 04:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767068315;
 bh=6uCCxoj8rZJVTzxBhnh/CGa97qrwyugjvKNQZgQ0mkg=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=oPswZhgzwrKILos6lUa0FGDyl77LptpLc1zfHKl17XtY2uiWXFc3FzR5jwCcOOrV9
 KmVXfGCbHOya/8rWeeAcqC5wkJ/UhAazyDj9QzK2BR6k2YkqJjgIBwkc5j73Ev7HQG
 l/IXKgW91QTwUwBgRbUM5kVdbXzYOX00pEuGOpxlOrTTixJKh8Zxaq3/msoJgTb8pJ
 hurNVJHrJgVYRSWXilYtzxDHrxdcixeCZ12QQk58R9GpAKoI76Dkwx/gzIlzM7/9pF
 nmAXD0Ae+GtbuKRYO1z+mLO3z/HD7bra4aNpGcu4vFmZU/XWBoFkIPMyPkFbMzfEJ9
 5nQQKodsExfpQ==
Message-ID: <0a61c069-93e9-49b4-af8b-e592cb8cae81@kernel.org>
Date: Tue, 30 Dec 2025 12:18:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Szymon Wilczek <swilczek.lx@gmail.com>, jaegeuk@kernel.org
References: <20251223162823.23606-1-swilczek.lx@gmail.com>
 <20251227024944.8612-1-swilczek.lx@gmail.com>
Content-Language: en-US
In-Reply-To: <20251227024944.8612-1-swilczek.lx@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/27/2025 10:49 AM,
 Szymon Wilczek wrote: > Syzbot reported
 a slab-use-after-free issue in f2fs_write_end_io(): > > BUG: KASAN:
 slab-use-after-free
 in f2fs_write_end_io+0x9b9/0xb60 > Read of size [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vaRC2-0003OO-BP
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: fix use-after-free in
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

On 12/27/2025 10:49 AM, Szymon Wilczek wrote:
> Syzbot reported a slab-use-after-free issue in f2fs_write_end_io():
> 
> BUG: KASAN: slab-use-after-free in f2fs_write_end_io+0x9b9/0xb60
> Read of size 4 at addr ffff88804357d170 by task kworker/u4:4/45
> 
> The race condition occurs between the filesystem unmount path
> (kill_f2fs_super) and the asynchronous I/O completion handler
> (f2fs_write_end_io).
> 
> When unmounting, kill_f2fs_super() frees the sbi structure. However, if
> there are pending CP_DATA writes, the f2fs_write_end_io() callback might
> still be running in softirq context and attempt to access sbi->cp_wait,
> causing a use-after-free.
> 
> Fix this by calling synchronize_rcu() after f2fs_wait_on_all_pages()
> but before kfree(sbi). Since bio completion callbacks run in softirq
> context, which is an implicit RCU read-side critical section,
> synchronize_rcu() ensures all in-flight callbacks have completed
> before we free sbi.
> 
> Reported-by: syzbot+b4444e3c972a7a124187@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=b4444e3c972a7a124187
> Signed-off-by: Szymon Wilczek <swilczek.lx@gmail.com>
> ---
> v3: Simplified to minimal fix - only super.c change with synchronize_rcu(),
>      as pointed out by Chao Yu that data.c changes are not necessary since
>      synchronize_rcu() alone guarantees sbi won't be freed before callbacks
>      complete.
> v2: Add synchronize_rcu() to wait for softirq bio callbacks to complete.
> ---
>   fs/f2fs/super.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index c4c225e09dc4..924bc30d08b6 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -5454,6 +5454,8 @@ static void kill_f2fs_super(struct super_block *sb)
>   	kill_block_super(sb);
>   	/* Release block devices last, after fscrypt_destroy_keyring(). */
>   	if (sbi) {
> +		f2fs_wait_on_all_pages(sbi, F2FS_WB_CP_DATA);

f2fs_wait_on_all_pages() -> f2fs_submit_merged_write() will access sbi->write_io
which should has been released in f2fs_put_super()?

Thanks,

> +		synchronize_rcu();
>   		destroy_device_list(sbi);
>   		kfree(sbi);
>   		sb->s_fs_info = NULL;



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
