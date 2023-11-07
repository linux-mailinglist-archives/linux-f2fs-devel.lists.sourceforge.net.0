Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AB64E7E41F5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Nov 2023 15:39:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r0NF3-0005JM-Si;
	Tue, 07 Nov 2023 14:39:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1r0NF2-0005JG-Iy
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Nov 2023 14:39:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 Subject:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9Mut2FcPyamayvcGBu8GQ6RJcu9jOGGjYB/PhK30Gew=; b=jjzk/t3V9CFObAA11j3vOWM1pz
 kdKhYpvA4gOk7cJDq74upyZQ19Tvt+v3a4ow2snQiR/QuFaf73fWqqz8yU0ia0Y4T7BVDpkeMkRYx
 0AmLpQuWsEMN5KtwSOYqE8Lt+ZCRdqyDkIX4jbBRSB9WgUaCEQAmt7H552KSBEpIEk0A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From:
 References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9Mut2FcPyamayvcGBu8GQ6RJcu9jOGGjYB/PhK30Gew=; b=DHncdwa9cuubZBAHFuGj1UsVJG
 8tgtmbX6XoFZhGg6wPahRbfnSq4KGB4ZYKhAart5L4OnWtu+aoa77f2SAzCkjsqy/Wh+YbJUU+tPv
 6zq7sCwGBSdjWmlx/6xTOvmjAjIlshXfSilLl/coenGdKN4gA72d0f2usGiAeDvDwsRE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r0NF2-0008Sm-Gj for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Nov 2023 14:39:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 22D4261215;
 Tue,  7 Nov 2023 14:39:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86140C433C7;
 Tue,  7 Nov 2023 14:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699367978;
 bh=pvLfmhyTPv0yZa8MpxDOVBvvq48uuUUWcsn2a9XiUrk=;
 h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
 b=gvZqUZQ5ZP7y2V5NzTJQ8nko7/3ZfNKnY+vWtEb2wkOtzfatxLHzM7WSYrqqOlheY
 8sers6zfZgier7VHx7mysRb1O4jbIVOeTTDo016M2XRPd3MIEztyPEeqvGUeet6NYt
 6ugsTXku985ejMqjPnK3L8DGsvYeA3Bslo++6hq5cNoS8XDwxnOpzwvVtFKfHRM3Pk
 UEJI5FyGMYos1GRuAXNnzJGYCWI5CmNcOfnTbPWWEszjVk8VM/BqJ8JnO0pBSsWHjl
 Wiu6Y29Uk9/TWAzUrgytf6CGjV5x56H0OIavpAC0o9pcdo17oGjq+C5WxEBRl+ro7B
 nffU5CSiMIV+g==
Message-ID: <c181256e-9f6e-d43e-4d02-a7d8d5286d56@kernel.org>
Date: Tue, 7 Nov 2023 22:39:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Wu Bo <bo.wu@vivo.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20231030094024.263707-1-bo.wu@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20231030094024.263707-1-bo.wu@vivo.com>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/10/30 17:40, Wu Bo wrote: > If GC victim has pinned
 block, it can't be recycled. > And if GC is foreground running, after many
 failure try, the pinned file > is expected to be clear pin flag. [...] 
 Content analysis details:   (-7.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.3 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1r0NF2-0008Sm-Gj
Subject: Re: [f2fs-dev] [PATCH 1/1] f2fs: fix fallocate failed under pinned
 block situation
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
Cc: Wu Bo <wubo.oduw@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/10/30 17:40, Wu Bo wrote:
> If GC victim has pinned block, it can't be recycled.
> And if GC is foreground running, after many failure try, the pinned file
> is expected to be clear pin flag. To enable the section be recycled.
> 
> But when fallocate trigger FG_GC, GC can never recycle the pinned
> section. Because GC will go to stop before the failure try meet the threshold:
> 	if (has_enough_free_secs(sbi, sec_freed, 0)) {
> 		if (!gc_control->no_bg_gc &&
> 		    total_sec_freed < gc_control->nr_free_secs)
> 			goto go_gc_more;
> 		goto stop;
> 	}
> 
> So when fallocate trigger FG_GC, at least recycle one.

Hmm... it may break pinfile's semantics at least on one pinned file?
In this case, I prefer to fail fallocate() rather than unpinning file,
in order to avoid leaving invalid LBA references of unpinned file held
by userspace.

Thoughts?

Thanks,

> 
> This issue can be reproduced by filling f2fs space as following layout.
> Every segment has one block is pinned:
> +-+-+-+-+-+-+-----+-+
> | | |p| | | | ... | | seg_n
> +-+-+-+-+-+-+-----+-+
> +-+-+-+-+-+-+-----+-+
> | | |p| | | | ... | | seg_n+1
> +-+-+-+-+-+-+-----+-+
> ...
> +-+-+-+-+-+-+-----+-+
> | | |p| | | | ... | | seg_n+k
> +-+-+-+-+-+-+-----+-+
> 
> And following are steps to reproduce this issue:
> dd if=/dev/zero of=./f2fs_pin.img bs=2M count=1024
> mkfs.f2fs f2fs_pin.img
> mkdir f2fs
> mount f2fs_pin.img ./f2fs
> cd f2fs
> dd if=/dev/zero of=./large_padding bs=1M count=1760
> ./pin_filling.sh
> rm padding*
> sync
> touch fallocate_40m
> f2fs_io pinfile set fallocate_40m
> fallocate -l 41943040 fallocate_40m
> 
> fallocate always fail with EAGAIN even there has enough free space.
> 
> 'pin_filling.sh' is:
> count=1
> while :
> do
>      # filling the seg space
>      for i in {1..511}:
>      do
>          name=padding_$count-$i
>          echo write $name
>          dd if=/dev/zero of=./$name bs=4K count=1 > /dev/null 2>&1
>          if [ $? -ne 0 ]; then
>                  exit 0
>          fi
>      done
>      sync
> 
>      # pin one block in a segment
>      name=pin_file$count
>      dd if=/dev/zero of=./$name bs=4K count=1 > /dev/null 2>&1
>      sync
>      f2fs_io pinfile set $name
>      count=$(($count + 1))
> done
> 
> Signed-off-by: Wu Bo <bo.wu@vivo.com>
> ---
>   fs/f2fs/file.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index ca5904129b16..e8a13616543f 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -1690,7 +1690,7 @@ static int f2fs_expand_inode_data(struct inode *inode, loff_t offset,
>   			.init_gc_type = FG_GC,
>   			.should_migrate_blocks = false,
>   			.err_gc_skipped = true,
> -			.nr_free_secs = 0 };
> +			.nr_free_secs = 1 };
>   	pgoff_t pg_start, pg_end;
>   	loff_t new_size;
>   	loff_t off_end;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
