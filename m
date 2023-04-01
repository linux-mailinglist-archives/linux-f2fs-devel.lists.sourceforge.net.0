Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0236D2D54
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  1 Apr 2023 03:49:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1piQMy-0000Qj-I8;
	Sat, 01 Apr 2023 01:49:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1piQMx-0000Qd-BH
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 01 Apr 2023 01:49:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QS1PB0ZbRRZImmw2O5qxCBQNlDCwZHpHii4GQ4rn07A=; b=mJKwq5pt7BbA0kYjrYJesYv1Rn
 qw7FAchyOvUuXbuf+2snhNyGpdg5ozhALzer3ImNTvTe86d2PrTaKYZKh1JbrwtekfLL1dtYWuhxU
 jab4Kuevs94eDVH/VDWvQcWyBIRZosJX3wblUzuH2J1ewGgG10GCPx9OMgtJpNvu7v8Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QS1PB0ZbRRZImmw2O5qxCBQNlDCwZHpHii4GQ4rn07A=; b=FchfCtMXgUqmYf6s4WSYE1aWj3
 LVqhBkfohQaus5RFJks8WzmyUZEuYjM6oPfVlSj4HTpqc3PyArGSRgHWL+BOv8ldjKhbI0t+y6jj6
 aFw7gXNKJ1Nx8hjZbnOFj6IuKpwZmTTR5fzAcmHz7XUWzFioGa/rRG8uDtCKurUIqz6Q=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1piQMw-0002Tx-RE for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 01 Apr 2023 01:49:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CB18E62B83;
 Sat,  1 Apr 2023 01:49:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D7C4C433EF;
 Sat,  1 Apr 2023 01:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680313759;
 bh=jT5FBQyI7dpDl0WTd9grmQmwScdfcc+9wiwY0baN8Kc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=elrvg/Oo5WlLKQy73XlerIavUGkkTcdArmOZXaJ1/SBdzXYmLyYL3xebLJ1L3lTMN
 AEWrGzdl5GCOkmKLJzD4rO1LcfzOi1ZeeSPNyvn0VfZfl4rz6m+eC7HpudqXfyPPwr
 xzsHX2yWdfd+Exd46Ui+PWop1ejTmf4oJhFBjskAPQbwqkBBS6ONtGHm5PU+VoAzS+
 0CgNSU4rPHK5JEw11R6edygxr4ZoR9IeUMb+qPiUeOm+c7MtXga/qGt9Z7Nd3dNtiA
 oG46adXJUrxZSWyb/ZEd0WA6VElFNkT6SeFXVpzd/hYO++6FtJjtwMWK2xqi4XBkCm
 lYpVkAqKiT2cQ==
Message-ID: <6db7be47-9455-c466-f99a-497f8fe8930a@kernel.org>
Date: Sat, 1 Apr 2023 09:49:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Yohan Joung <jyh429@gmail.com>, jaegeuk@kernel.org
References: <ZBzlJ36kO5KvxODB@google.com>
 <20230324130747.523-1-jyh429@gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230324130747.523-1-jyh429@gmail.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/3/24 21:07, Yohan Joung wrote: > Fix alignment check
 to be correct in npo2 as well > > Signed-off-by: Yohan Joung
 <yohan.joung@sk.com>
 > --- > fs/f2fs/segment.c | 5 +++-- > 1 file changed, 3 i [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1piQMw-0002Tx-RE
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix align check for npo2
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
Cc: oe-kbuild-all@lists.linux.dev, linux-f2fs-devel@lists.sourceforge.net,
 lkp@intel.com, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/3/24 21:07, Yohan Joung wrote:
> Fix alignment check to be correct in npo2 as well
> 
> Signed-off-by: Yohan Joung <yohan.joung@sk.com>
> ---
>   fs/f2fs/segment.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 055e70e77aa2..f4a22a065277 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -1842,6 +1842,7 @@ static int __f2fs_issue_discard_zone(struct f2fs_sb_info *sbi,
>   	sector_t sector, nr_sects;
>   	block_t lblkstart = blkstart;
>   	int devi = 0;
> +	u32 remainder = 0;
>   
>   	if (f2fs_is_multi_device(sbi)) {
>   		devi = f2fs_target_device_index(sbi, blkstart);
> @@ -1857,9 +1858,9 @@ static int __f2fs_issue_discard_zone(struct f2fs_sb_info *sbi,
>   	if (f2fs_blkz_is_seq(sbi, devi, blkstart)) {
>   		sector = SECTOR_FROM_BLOCK(blkstart);
>   		nr_sects = SECTOR_FROM_BLOCK(blklen);
> +		div_u64_rem(sector, bdev_zone_sectors(bdev), &remainder);

Should use div64_u64_rem()? As both sector and return value of bdev_zone_sectors()
are u64.

Thanks,

>   
> -		if (sector & (bdev_zone_sectors(bdev) - 1) ||
> -				nr_sects != bdev_zone_sectors(bdev)) {
> +		if (remainder || nr_sects != bdev_zone_sectors(bdev)) {
>   			f2fs_err(sbi, "(%d) %s: Unaligned zone reset attempted (block %x + %x)",
>   				 devi, sbi->s_ndevs ? FDEV(devi).path : "",
>   				 blkstart, blklen);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
