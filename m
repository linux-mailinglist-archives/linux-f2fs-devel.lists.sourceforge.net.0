Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B6E3EE0E8
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Aug 2021 02:30:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mFn07-0000Mz-Ga; Tue, 17 Aug 2021 00:30:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1mFn06-0000Mq-Tq
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Aug 2021 00:30:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ya6KEcdSssDZpWElAyiyUytq5C1C9xEq3lsR6omHcgY=; b=m3SZuo5gSydezH4RHuqUVN2sRw
 UOIy+sbwQngbj11Xmds1pqOBmTVyTEs+OXnYcASxC1bcaMalWe8FPTmxyuJM810uIme6FTV8v12y4
 5qdTvSrtkCosaOyDqKCMTFCTZ7Sy2/u8MowX4+UGCxugJNZany4ln8Iwufm16Lst/Cdw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ya6KEcdSssDZpWElAyiyUytq5C1C9xEq3lsR6omHcgY=; b=bX45Y50sGGnWAaULC4rswXWsvy
 0MhGebIP6iOQ1jc4mzngOOBa9zPGiOffmjo0bUHBrIyJQsLMT5s02/W0+nLe5jP1DOjTg6asc6NNN
 DVbRSLPsjKbrCX0hCjeCnRpe+jIs83RvBgi86oidN3FA4VMALNtJ2uwrrgo5AZHk5vc8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mFn04-008lup-TM
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Aug 2021 00:30:42 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 58C5E60F55;
 Tue, 17 Aug 2021 00:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629160235;
 bh=EdCrxzsMmkwYwBRpv9mB8ATfiVlhXsxkIRGxlrChfes=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z/OxiQOpk/MWnSzb7t+AfFk4DY6FTSC86PcX4E1IpF6EPejYKZGilb1Oc5Ps47w0+
 k0MxtsE0IMhDy+yXcdlPk8m5eIKDvFYQRdK7ugBmZvUB47HnWNoqx3Xw7KLNSKzRWd
 S2wnX2hYQEH54X3y/J7tZD0XJGq6SEmod1F5EmFbZtb9M/kEm6XNfQlSaH+riw10ah
 7aq7u7Uwywk838nIPspwgOwx4sah0Su+by2w7kBqnY2UWx+FnNCroH1X/042ubLLy5
 9xBYNN53s6Vx494pOZiOrYXtiw+a6uMzvSti1Hh06XYG7ZoNPNJ3W2rxHw2osh3OIZ
 Df+/idgGiHQYw==
Date: Mon, 16 Aug 2021 17:30:33 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <YRsDKWcghjEXr1Ro@google.com>
References: <20210816122807.71400-1-frank.li@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210816122807.71400-1-frank.li@vivo.com>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mFn04-008lup-TM
Subject: Re: [f2fs-dev] [PATCH] f2fs: change value of recovery to bool
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hmm, I don't see a great benefit of this patch. Do we have a chance to use
integer to get more specifics of the recovery reason in future?

On 08/16, Yangtao Li wrote:
> Recovery has only two values, 0 and 1, let's change it to bool type.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>  fs/f2fs/super.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 8fecd3050ccd..98727e04d271 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -3541,7 +3541,7 @@ static int init_blkz_info(struct f2fs_sb_info *sbi, int devi)
>   */
>  static int read_raw_super_block(struct f2fs_sb_info *sbi,
>  			struct f2fs_super_block **raw_super,
> -			int *valid_super_block, int *recovery)
> +			int *valid_super_block, bool *recovery)
>  {
>  	struct super_block *sb = sbi->sb;
>  	int block;
> @@ -3559,7 +3559,7 @@ static int read_raw_super_block(struct f2fs_sb_info *sbi,
>  			f2fs_err(sbi, "Unable to read %dth superblock",
>  				 block + 1);
>  			err = -EIO;
> -			*recovery = 1;
> +			*recovery = true;
>  			continue;
>  		}
>  
> @@ -3569,7 +3569,7 @@ static int read_raw_super_block(struct f2fs_sb_info *sbi,
>  			f2fs_err(sbi, "Can't find valid F2FS filesystem in %dth superblock",
>  				 block + 1);
>  			brelse(bh);
> -			*recovery = 1;
> +			*recovery = true;
>  			continue;
>  		}
>  
> @@ -3784,15 +3784,16 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>  	int err;
>  	bool skip_recovery = false, need_fsck = false;
>  	char *options = NULL;
> -	int recovery, i, valid_super_block;
> +	int i, valid_super_block;
>  	struct curseg_info *seg_i;
>  	int retry_cnt = 1;
> +	bool recovery;
>  
>  try_onemore:
>  	err = -EINVAL;
>  	raw_super = NULL;
>  	valid_super_block = -1;
> -	recovery = 0;
> +	recovery = false;
>  
>  	/* allocate memory for f2fs-specific super block info */
>  	sbi = kzalloc(sizeof(struct f2fs_sb_info), GFP_KERNEL);
> -- 
> 2.32.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
