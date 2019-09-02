Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A3824A5DE2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Sep 2019 00:54:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i4vDL-0004Fl-6l; Mon, 02 Sep 2019 22:54:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1i4vDJ-0004FU-Gc
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Sep 2019 22:54:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c2uctHXhs8lJPcHKs977Gx2YpYDgnbB4l8PmYGR7+1I=; b=I/4D900nsPyiWcmQGiiCGjaoYp
 DKP8iq16YSujpEQKkO6nYsJenbVBqlktV5zgSq+5JWJipVNa9pMmy2rWVy9rfJ95Fmy1+6dwt6hPT
 Oq+V9kbipo9C7bBVICfLoRfacaYIR+Mzcqe9IRhexrcayAyuyTiq7VhhDPLiYieUuikw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=c2uctHXhs8lJPcHKs977Gx2YpYDgnbB4l8PmYGR7+1I=; b=VUYP2FvAoOi4ImNLDAT3iBXB7g
 D/MkMAtMSgQOWsZTa0lOa9ZW/NN+IKEr84K5gbBGaQqHIPh5LUZiUSHkhlMsgedQp7gy/FnDvfNEE
 fjTKhgzurpob5Cpeebdv83YIzf3o/FjeyYI2TGRdYloyawqzx3XXguseBGLbXQhcs7BM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i4vDI-00Dpje-6z
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Sep 2019 22:54:21 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7FD8F216C8;
 Mon,  2 Sep 2019 22:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567464854;
 bh=bzZjfZ+mvTNiUmcXg5HlIkB/RRWo5xarRlEOE/jTwTQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xo56DupzfPwOOR3BWemVG1NBwxCFHOMVyZX5kxNNCy46UBRvIcz7lexE7RrvF9iRZ
 goJhEH0EbHKz9HNXYXWpyq8akpk+WdwE6n8toTDcEJgmSUlQpKT3oSC2RbguXbPJ+5
 wmakN/RTdEscGeGa2ArhC93Ees16i7VylZnQI/QA=
Date: Mon, 2 Sep 2019 15:54:13 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20190902225413.GC71929@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190831095401.8142-1-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190831095401.8142-1-yuchao0@huawei.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1i4vDI-00Dpje-6z
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs: introduce
 get_available_block_count() for cleanup
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

On 08/31, Chao Yu wrote:
> There are very similar codes in inc_valid_block_count() and
> inc_valid_node_count() which is used for available user block
> count calculation.
> 
> This patch introduces a new helper get_available_block_count()
> to include those common codes, and used it instead for cleanup.
> 
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
> v2:
> - fix panic during recovery
>  fs/f2fs/f2fs.h | 47 +++++++++++++++++++++++++++--------------------
>  1 file changed, 27 insertions(+), 20 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index a89ad8cab821..9c010e6cba5c 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1756,6 +1756,27 @@ static inline bool __allow_reserved_blocks(struct f2fs_sb_info *sbi,
>  	return false;
>  }
>  
> +static inline unsigned int get_available_block_count(struct f2fs_sb_info *sbi,
> +						struct inode *inode, bool cap)
> +{
> +	block_t avail_user_block_count;
> +
> +	avail_user_block_count = sbi->user_block_count -
> +					sbi->current_reserved_blocks;
> +
> +	if (!__allow_reserved_blocks(sbi, inode, cap))
> +		avail_user_block_count -= F2FS_OPTION(sbi).root_reserved_blocks;
> +
> +	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
> +		if (avail_user_block_count > sbi->unusable_block_count)
> +			avail_user_block_count -= sbi->unusable_block_count;
> +		else
> +			avail_user_block_count = 0;
> +	}
> +
> +	return avail_user_block_count;
> +}
> +
>  static inline void f2fs_i_blocks_write(struct inode *, block_t, bool, bool);
>  static inline int inc_valid_block_count(struct f2fs_sb_info *sbi,
>  				 struct inode *inode, blkcnt_t *count)
> @@ -1782,17 +1803,8 @@ static inline int inc_valid_block_count(struct f2fs_sb_info *sbi,
>  
>  	spin_lock(&sbi->stat_lock);
>  	sbi->total_valid_block_count += (block_t)(*count);
> -	avail_user_block_count = sbi->user_block_count -
> -					sbi->current_reserved_blocks;
> +	avail_user_block_count = get_available_block_count(sbi, inode, true);
>  
> -	if (!__allow_reserved_blocks(sbi, inode, true))
> -		avail_user_block_count -= F2FS_OPTION(sbi).root_reserved_blocks;
> -	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
> -		if (avail_user_block_count > sbi->unusable_block_count)
> -			avail_user_block_count -= sbi->unusable_block_count;
> -		else
> -			avail_user_block_count = 0;
> -	}
>  	if (unlikely(sbi->total_valid_block_count > avail_user_block_count)) {
>  		diff = sbi->total_valid_block_count - avail_user_block_count;
>  		if (diff > *count)
> @@ -2005,7 +2017,8 @@ static inline int inc_valid_node_count(struct f2fs_sb_info *sbi,
>  					struct inode *inode, bool is_inode)
>  {
>  	block_t	valid_block_count;
> -	unsigned int valid_node_count, user_block_count;
> +	unsigned int valid_node_count;
> +	unsigned int avail_user_block_count;
>  	int err;
>  
>  	if (is_inode) {
> @@ -2027,16 +2040,10 @@ static inline int inc_valid_node_count(struct f2fs_sb_info *sbi,
>  
>  	spin_lock(&sbi->stat_lock);
>  
> -	valid_block_count = sbi->total_valid_block_count +
> -					sbi->current_reserved_blocks + 1;
> -
> -	if (!__allow_reserved_blocks(sbi, inode, false))
> -		valid_block_count += F2FS_OPTION(sbi).root_reserved_blocks;
> -	user_block_count = sbi->user_block_count;
> -	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
> -		user_block_count -= sbi->unusable_block_count;
> +	valid_block_count = sbi->total_valid_block_count + 1;
> +	avail_user_block_count = get_available_block_count(sbi, inode, false);

This doesn't look like same?

>  
> -	if (unlikely(valid_block_count > user_block_count)) {
> +	if (unlikely(valid_block_count > avail_user_block_count)) {
>  		spin_unlock(&sbi->stat_lock);
>  		goto enospc;
>  	}
> -- 
> 2.18.0.rc1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
