Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C19D887088C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Mar 2024 18:48:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rhCQ0-0003CI-TC;
	Mon, 04 Mar 2024 17:48:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rhCPy-0003C0-Sq
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Mar 2024 17:48:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GNcQPrleG2EH3QBHQ8Hb7zY441zs8KN/XSs11V+iBAU=; b=F0le410q0kepXb5AEImc0ClD58
 X+DBr4sgCrwp3x4URJWIOzuD7zIXMVla7Al1PsZ676LT9sitrd+WkDB1XNK+4oKzPMe2me9vkKno9
 SplXNN/NaMJvM+UorlCoBGZH71Kx2Qzma41AlzvMwVVtB6Tl6+1DO0cd1bJ6vE1ANvrc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GNcQPrleG2EH3QBHQ8Hb7zY441zs8KN/XSs11V+iBAU=; b=A8rnDfU2IIogxlx4J5EfpHU33h
 Ti3bShb7R4RVcvsMfs3aV5NZQKZqJMYY5MUl29leLXiM1WohLx5WM4g3B/zyibUe2eA3sIkIF/sEr
 ORGh3pbbYjPpoQHnnnbWI/8vGKad/bbqkcm3szbJAVoG+WyC3RpznYvQ5i9TkMWt3WNQ=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rhCPs-0000u4-4x for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Mar 2024 17:48:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8CF49CE149E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  4 Mar 2024 17:47:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBF17C433C7;
 Mon,  4 Mar 2024 17:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709574469;
 bh=2Ua8nygoCYe9R7ieEeyk8j5xe7GBMxuXNLVcBXyeTg4=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=LrT+mKUlJHwKipbRQEjxM8C7pmfW+ZFo6smghrow224D2hULUzXwCATD5JTlhQg81
 4zJ6fTJJ5t4sCX7MSdzzIJc9ZCH6wtbmwdS6ldZrN1sG4wgiM2MKUyzcMvhoojVNNn
 BNo2ZCKkwhnWtLDZ5DaTCppSxkiFdhAD89fiGG4CdFggUjoQ+k51i01IZ41trM+QyT
 tZAUFThWE3/2tTdLmrjngyr2WwkJyCw27HylZl9T0im3Bm2qu4Mn3ffyF+QnvksfdW
 isQIC1p5+tlN1CpR3BAtVOFLvdc/u2n8Adqp1IDDxtmBZo4IRoMA+t6x5Fbiw9AfLh
 zakFEad7LD25w==
Date: Mon, 4 Mar 2024 09:47:48 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <ZeYJRG3DBJlL3004@google.com>
References: <20240223205535.307307-1-jaegeuk@kernel.org>
 <20240223205535.307307-3-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240223205535.307307-3-jaegeuk@kernel.org>
X-Spam-Score: -3.1 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 02/23, Jaegeuk Kim wrote: > No functional change, but add
 some more logs. > > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> > ---
 > fs/f2fs/segment.c | 34 ++++++++++++++++++++++++ > fs/ [...] 
 Content analysis details:   (-3.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rhCPs-0000u4-4x
Subject: Re: [f2fs-dev] [PATCH 3/5] f2fs: print zone status in string and
 some log
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 02/23, Jaegeuk Kim wrote:
> No functional change, but add some more logs.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/segment.c | 34 ++++++++++++++++++++++++----------
>  fs/f2fs/super.c   |  1 +
>  2 files changed, 25 insertions(+), 10 deletions(-)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index d4f228e6f771..6d586ae8b55f 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -4912,6 +4912,16 @@ static int sanity_check_curseg(struct f2fs_sb_info *sbi)
>  }
>  
>  #ifdef CONFIG_BLK_DEV_ZONED
> +const char *f2fs_zone_status[BLK_ZONE_COND_OFFLINE + 1] = {

Added static.

> +	[BLK_ZONE_COND_NOT_WP]		= "NOT_WP",
> +	[BLK_ZONE_COND_EMPTY]		= "EMPTY",
> +	[BLK_ZONE_COND_IMP_OPEN]	= "IMPLICITE_OPEN",
> +	[BLK_ZONE_COND_EXP_OPEN]	= "EXPLICITE_OPEN",
> +	[BLK_ZONE_COND_CLOSED]		= "CLOSED",
> +	[BLK_ZONE_COND_READONLY]	= "READONLY",
> +	[BLK_ZONE_COND_FULL]		= "FULL",
> +	[BLK_ZONE_COND_OFFLINE]		= "OFFLINE",
> +};
>  
>  static int check_zone_write_pointer(struct f2fs_sb_info *sbi,
>  				    struct f2fs_dev_info *fdev,
> @@ -4928,18 +4938,22 @@ static int check_zone_write_pointer(struct f2fs_sb_info *sbi,
>  	zone_block = fdev->start_blk + (zone->start >> log_sectors_per_block);
>  	zone_segno = GET_SEGNO(sbi, zone_block);
>  
> +	/*
> +	 * Get # of valid block of the zone.
> +	 */
> +	valid_block_cnt = get_valid_blocks(sbi, zone_segno, true);
> +
>  	/*
>  	 * Skip check of zones cursegs point to, since
>  	 * fix_curseg_write_pointer() checks them.
>  	 */
>  	if (zone_segno >= MAIN_SEGS(sbi) ||
> -	    IS_CURSEC(sbi, GET_SEC_FROM_SEG(sbi, zone_segno)))
> +	    IS_CURSEC(sbi, GET_SEC_FROM_SEG(sbi, zone_segno))) {
> +		f2fs_notice(sbi, "Open zones: valid block[0x%x,0x%x] cond[%s]",
> +				zone_segno, valid_block_cnt,
> +				f2fs_zone_status[zone->cond]);
>  		return 0;
> -
> -	/*
> -	 * Get # of valid block of the zone.
> -	 */
> -	valid_block_cnt = get_valid_blocks(sbi, zone_segno, true);
> +	}
>  
>  	if ((!valid_block_cnt && zone->cond == BLK_ZONE_COND_EMPTY) ||
>  	    (valid_block_cnt && zone->cond == BLK_ZONE_COND_FULL))
> @@ -4947,8 +4961,8 @@ static int check_zone_write_pointer(struct f2fs_sb_info *sbi,
>  
>  	if (!valid_block_cnt) {
>  		f2fs_notice(sbi, "Zone without valid block has non-zero write "
> -			    "pointer. Reset the write pointer: cond[0x%x]",
> -			    zone->cond);
> +			    "pointer. Reset the write pointer: cond[%s]",
> +			    f2fs_zone_status[zone->cond]);
>  		ret = __f2fs_issue_discard_zone(sbi, fdev->bdev, zone_block,
>  					zone->len >> log_sectors_per_block);
>  		if (ret)
> @@ -4965,8 +4979,8 @@ static int check_zone_write_pointer(struct f2fs_sb_info *sbi,
>  	 * selected for write operation until it get discarded.
>  	 */
>  	f2fs_notice(sbi, "Valid blocks are not aligned with write "
> -		    "pointer: valid block[0x%x,0x%x] cond[0x%x]",
> -		    zone_segno, valid_block_cnt, zone->cond);
> +		    "pointer: valid block[0x%x,0x%x] cond[%s]",
> +		    zone_segno, valid_block_cnt, f2fs_zone_status[zone->cond]);
>  
>  	ret = blkdev_zone_mgmt(fdev->bdev, REQ_OP_ZONE_FINISH,
>  				zone->start, zone->len, GFP_NOFS);
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 4d03ce1109ad..fc7f1a9fbbda 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -4674,6 +4674,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>  	 * check zoned block devices' write pointer consistency.
>  	 */
>  	if (!f2fs_readonly(sb) && f2fs_sb_has_blkzoned(sbi)) {
> +		f2fs_notice(sbi, "Checking entire write pointers");
>  		err = f2fs_check_write_pointer(sbi);
>  		if (err)
>  			goto free_meta;
> -- 
> 2.44.0.rc0.258.g7320e95886-goog


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
