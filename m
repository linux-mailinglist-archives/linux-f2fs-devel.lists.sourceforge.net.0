Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 650BB339B4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  3 Jun 2019 22:26:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hXtXW-0005iO-Mt; Mon, 03 Jun 2019 20:26:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1hXtXV-0005iA-56
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 03 Jun 2019 20:26:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5q7OaVloZhlB3dEsAB1UmVhZiGElyZ/sQ9zK26UP6KM=; b=dmj759VKbuV13ZCjuCber8lcbr
 1OPNhBRMRdGOkRLl0JjN+Bi9XFta6kDZNa+/s26hfDgWkvnRViXnHk2lcBjf7eoAn3r2JxuuFKGJs
 k3OZcGneDR4wHMXgbS/6T7i1cAn+gRaa4eA7Oz7I7iy2nONThmlVLyIm3SCLA+id5wuA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5q7OaVloZhlB3dEsAB1UmVhZiGElyZ/sQ9zK26UP6KM=; b=NPXSnRv9TNaqCotSC1GdTIhLDj
 zq5nq0gL747HS9/qVWtTPP5aJ5uKB3YXiOqyLUbNH9encG8Uw623fCJSTQ8MA3rN9BX+iiJ5MblpZ
 bgDe3eSGgt4PPjE7CWHtMXcNvqJPj/01kP2zqw8c4M1FAsdKqXdhn+gF8UfKh4qDbNgU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hXtXT-00DIOX-DH
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 03 Jun 2019 20:26:41 +0000
Received: from localhost (unknown [104.132.1.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 551A626E5D;
 Mon,  3 Jun 2019 20:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559593591;
 bh=v9calqM6PHGdBj4mALXAqgtFc8xx6nsYR8rF3Gxiqq0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=zSYE0C9l3qM676qHbrmOp5NvQJ7w+P/sokWBCGTmaeHzN6QtS0eN38H8ncd3DClcz
 DjJALXzTzp4c2qWSFZWGgUjssI7sur8d70+9u1UUURc9nWf9sh2sWM8WHjjM+HwVYQ
 n/S63kQSg7IiUbcB3uM+zCD9Gf6KamrIGCdJ016w=
Date: Mon, 3 Jun 2019 13:26:30 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20190603202630.GB34729@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190530004906.261170-1-drosen@google.com>
 <20190530004906.261170-4-drosen@google.com>
 <c99079bd-99e1-e100-08f6-1e8adae5e722@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c99079bd-99e1-e100-08f6-1e8adae5e722@huawei.com>
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
 -0.0 T_DKIMWL_WL_HIGH       DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hXtXT-00DIOX-DH
Subject: Re: [f2fs-dev] [PATCH v3 3/4] f2fs: Fix accounting for unusable
 blocks
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
Cc: Daniel Rosenberg <drosen@google.com>, linux-doc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 06/03, Chao Yu wrote:
> On 2019/5/30 8:49, Daniel Rosenberg wrote:
> > Fixes possible underflows when dealing with unusable blocks.
> > 
> > Signed-off-by: Daniel Rosenberg <drosen@google.com>
> > ---
> >  fs/f2fs/f2fs.h | 15 ++++++++++-----
> >  1 file changed, 10 insertions(+), 5 deletions(-)
> > 
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index 9b3d9977cd1ef..a39cc4ffeb4b1 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -1769,8 +1769,12 @@ static inline int inc_valid_block_count(struct f2fs_sb_info *sbi,
> >  
> >  	if (!__allow_reserved_blocks(sbi, inode, true))
> >  		avail_user_block_count -= F2FS_OPTION(sbi).root_reserved_blocks;
> > -	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
> > -		avail_user_block_count -= sbi->unusable_block_count;
> > +	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
> > +		if (avail_user_block_count > sbi->unusable_block_count)
> > +			avail_user_block_count = 0;
> 
> avail_user_block_count -= sbi->unusable_block_count;
> 
> > +		else
> > +			avail_user_block_count -= sbi->unusable_block_count;
> 
> avail_user_block_count = 0;
> 

I fixed this.

Thanks,

> Thanks,
> 
> > +	}
> >  	if (unlikely(sbi->total_valid_block_count > avail_user_block_count)) {
> >  		diff = sbi->total_valid_block_count - avail_user_block_count;
> >  		if (diff > *count)
> > @@ -1970,7 +1974,7 @@ static inline int inc_valid_node_count(struct f2fs_sb_info *sbi,
> >  					struct inode *inode, bool is_inode)
> >  {
> >  	block_t	valid_block_count;
> > -	unsigned int valid_node_count;
> > +	unsigned int valid_node_count, user_block_count;
> >  	int err;
> >  
> >  	if (is_inode) {
> > @@ -1997,10 +2001,11 @@ static inline int inc_valid_node_count(struct f2fs_sb_info *sbi,
> >  
> >  	if (!__allow_reserved_blocks(sbi, inode, false))
> >  		valid_block_count += F2FS_OPTION(sbi).root_reserved_blocks;
> > +	user_block_count = sbi->user_block_count;
> >  	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
> > -		valid_block_count += sbi->unusable_block_count;
> > +		user_block_count -= sbi->unusable_block_count;
> >  
> > -	if (unlikely(valid_block_count > sbi->user_block_count)) {
> > +	if (unlikely(valid_block_count > user_block_count)) {
> >  		spin_unlock(&sbi->stat_lock);
> >  		goto enospc;
> >  	}
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
