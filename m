Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBsFK6kNsmnuIAAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Mar 2026 01:49:45 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C06DB26BC26
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Mar 2026 01:49:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f5QiJ/zEHBY+EieN9XPgfkBS8Fbe8wmnfohr8zdLvb4=; b=c1dxNzNnFNtl3LpMsaXmo/mS/6
	yUepH0fOmLaqUgGKtqkRDjcRjpkdnVtXADFF83ke/NSPodMHTSvzx+WoZOnVzuQtl2DCBchejfAWu
	ptwHv3aB7UcRN1sDFQOY8RA1qZ013KvIvdDQX/hqs7tZLpGkBIhtUockKvkz86Epw8ZQ=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w0UF5-0000g2-LJ;
	Thu, 12 Mar 2026 00:49:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1w0UF4-0000fv-KP
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Mar 2026 00:49:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TZ0UDDubIVkXUJPi5vZVOWThClA+Ir8w6OpsLUtAGv4=; b=XbQOCup3zjA5qJvoVbVanxztF+
 lalEJm3Keo7O3VQXFoBvDH4AQ9Xx+HujKBnc4zX/IopdmX2KcZlxr0R53GHnj4fZhrI5qf3MA3Hci
 VegKBdNa07D7iGbSL7S17JU904gINVjmHw1PVmt5DSWRyMAMzzTFGX9tfnRUGLZKYCEI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TZ0UDDubIVkXUJPi5vZVOWThClA+Ir8w6OpsLUtAGv4=; b=BFY2ksMhspCp0a7lVIjKFWIJD+
 rylGBR6FGu6MwjdMFqzGff8wc5zMTKM4Yya5zEOMMQFVEeP7LB+fTRgvopaZFUYkV2WQNunjkQCaO
 WXZIZKdOcjadnp3e4fzFx355hZN+jjgwUP1/FjdV3rSNjF3VjA7mJ4evt34NMUw9pf88=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w0UF4-0001jk-4m for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Mar 2026 00:49:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 74BAB6012B;
 Thu, 12 Mar 2026 00:49:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9AD0C19421;
 Thu, 12 Mar 2026 00:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773276563;
 bh=msKE3Kzm7PkLb6BKV3f4t3zO65Q1TovnQ31OW+nptPA=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=ok0Rl48heuxbALQFxSxApK23hnCv5p6LBV8H9VVy5oftYeD5lQ9TbdNldgtPIC4VM
 SSqow28DTUatnzpT/zEDWJBAsScOKw6YaJkD/94yLFG2krCJMB63Ta0RJ3ANlcn4vv
 rxfw9sHTtY1l5Qd0uEc3xMPGdO+m7MdxSmpodZdkfmUv1EZNP4yO3yaQEIq/3RXnAr
 5wTHfDDZLV8BJF2e2NMPxlxstdDw5ON8oRFcFyn975Ee43Ml4BYKGFVbs0jAbzhi2V
 VFXTC/AoNejRymvPJQFleguWSv6VK0UL+kzU3G+x5JvEcekTGIUYbEwVhNSV3GVOA4
 gbJK2JFaGbgZg==
Message-ID: <f331751b-08ad-42d2-ad23-37d21e1364f8@kernel.org>
Date: Thu, 12 Mar 2026 08:49:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <monty_pavel@sina.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260216112737.67408-1-monty_pavel@sina.com>
Content-Language: en-US
In-Reply-To: <20260216112737.67408-1-monty_pavel@sina.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026/2/16 19:27, Yongpeng Yang wrote: > From: Yongpeng
 Yang <yangyongpeng@xiaomi.com> > > Neither F2FS nor VFS invalidates the block
 device page cache, which > results in reading stale metadata. An [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w0UF4-0001jk-4m
Subject: Re: [f2fs-dev] [PATCH] f2fs: invalidate block device page cache on
 umount
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:monty_pavel@sina.com,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[sina.com,kernel.org];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email]
X-Rspamd-Queue-Id: C06DB26BC26
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026/2/16 19:27, Yongpeng Yang wrote:
> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
> 
> Neither F2FS nor VFS invalidates the block device page cache, which
> results in reading stale metadata. An example scenario is shown below:
> 
> Terminal A                  Terminal B
> mount /dev/vdb /mnt/f2fs
> touch mx // ino = 4
> sync
> dump.f2fs -i 4 /dev/vdb// block on "[Y/N]"
>                              touch mx2 // ino = 5
>                              sync
>                              umount /mnt/f2fs
>                              dump.f2fs -i 5 /dev/vdb // block addr is 0
> 
> After umount, the block device page cache is not purged, causing
> `dump.f2fs -i 5 /dev/vdb` to read stale metadata and see inode 5 with
> block address 0.
> 
> This patch calls invalidate_bdev during umount to invalidate the block
> device page cache, preventing stale metadata from being read.
> 
> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
> ---
>   fs/f2fs/super.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 1a755997aff5..39d3b52ceac1 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -2091,6 +2091,12 @@ static void f2fs_put_super(struct super_block *sb)
>   #if IS_ENABLED(CONFIG_UNICODE)
>   	utf8_unload(sb->s_encoding);
>   #endif
> +	sync_blockdev(sb->s_bdev);

We will call sync_blockdev in below path?

- kill_f2fs_super
  - kill_block_super
   - generic_shutdown_super
    - put_super
   - sync_blockdev

1721 void kill_block_super(struct super_block *sb)
1722 {
1723         struct block_device *bdev = sb->s_bdev;
1724
1725         generic_shutdown_super(sb);
1726         if (bdev) {
1727                 sync_blockdev(bdev);
1728                 bdev_fput(sb->s_bdev_file);
1729         }
1730 }

> +	invalidate_bdev(sb->s_bdev);

I guess we can leave the device w/ uptodate cache, in case if there are
multiple user on the device?

Thanks,

> +	for (i = 1; i < sbi->s_ndevs; i++) {
> +		sync_blockdev(FDEV(i).bdev);
> +		invalidate_bdev(FDEV(i).bdev);
> +	}
>   }
>   
>   int f2fs_sync_fs(struct super_block *sb, int sync)



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
