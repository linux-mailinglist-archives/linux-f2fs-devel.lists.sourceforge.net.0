Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D058BAC2D1
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  7 Sep 2019 01:10:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i6NNI-0000SW-AD; Fri, 06 Sep 2019 23:10:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1i6NNH-0000SP-4F
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Sep 2019 23:10:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qtM8np69bsmqkNyitg1BGkQu58BaFVt0Y5Hny3xwr98=; b=XMRfo9Ke0a9EsgIm/GjSjqcD7h
 FyY7BQJoFvzHtx6TMEmd/s5rzqz2ya/C4sPMAs/plJbZ+TdYWgYAF/zqfmZjxtueDMJ3TVN0B0oWb
 Y0FFWIgzgqf3zN0eobg+sIPSyKEGtppPkciGfFzh6F0o7KpzM/TOLnzTp1/bC7OzX6eo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qtM8np69bsmqkNyitg1BGkQu58BaFVt0Y5Hny3xwr98=; b=N5W60dK/6LyBTgSm59Xebl5wCA
 HxUaumDSInOX8GsCTQt9RH2eynJeUuFjEAPo7BkKPMLVlwG4qluGn2DJk/zK3qyCuDqCyxhR7J6bt
 YnXFHmA/j3z/Fthm2YzS+nw+38lbErVcoEFajxkkXQpoIVZyvrMXQsosNvjVI1IQ7dCk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i6NND-00CWdx-D3
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Sep 2019 23:10:39 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1873D207FC;
 Fri,  6 Sep 2019 23:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567811428;
 bh=DWOUzOtNS02FNCJ7dP2lQJ0JmC8h3u5IYwib+4bFMaU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xsNcr0BYg/a3FJLdpndzLhE/qAjADYwt3EYa+zhXyJM2wPJSQ3GfbLZJ7fdPa9TRL
 Dkd4LUua+0K817a2PHJ3b48FMYI0KHhIJaGXlhIThlEeSSHAi6P3L917Yu2NElTsuP
 g+2y/UeX9CgU44Y5IqD7PfpVJh3L5SkzODiClCW0=
Date: Fri, 6 Sep 2019 16:10:27 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <20190906231027.GB71848@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190831095401.8142-1-yuchao0@huawei.com>
 <20190902225413.GC71929@jaegeuk-macbookpro.roam.corp.google.com>
 <6c5da795-4929-3bb6-fdbf-e103a2bcd431@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6c5da795-4929-3bb6-fdbf-e103a2bcd431@kernel.org>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1i6NND-00CWdx-D3
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

On 09/03, Chao Yu wrote:
> On 2019-9-3 6:54, Jaegeuk Kim wrote:
> > On 08/31, Chao Yu wrote:
> >> There are very similar codes in inc_valid_block_count() and
> >> inc_valid_node_count() which is used for available user block
> >> count calculation.
> >>
> >> This patch introduces a new helper get_available_block_count()
> >> to include those common codes, and used it instead for cleanup.
> >>
> >> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> >> ---
> >> v2:
> >> - fix panic during recovery
> >>  fs/f2fs/f2fs.h | 47 +++++++++++++++++++++++++++--------------------
> >>  1 file changed, 27 insertions(+), 20 deletions(-)
> >>
> >> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> >> index a89ad8cab821..9c010e6cba5c 100644
> >> --- a/fs/f2fs/f2fs.h
> >> +++ b/fs/f2fs/f2fs.h
> >> @@ -1756,6 +1756,27 @@ static inline bool __allow_reserved_blocks(struct f2fs_sb_info *sbi,
> >>  	return false;
> >>  }
> >>  
> >> +static inline unsigned int get_available_block_count(struct f2fs_sb_info *sbi,
> >> +						struct inode *inode, bool cap)
> >> +{
> >> +	block_t avail_user_block_count;
> >> +
> >> +	avail_user_block_count = sbi->user_block_count -
> >> +					sbi->current_reserved_blocks;
> >> +
> >> +	if (!__allow_reserved_blocks(sbi, inode, cap))
> >> +		avail_user_block_count -= F2FS_OPTION(sbi).root_reserved_blocks;
> >> +
> >> +	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
> >> +		if (avail_user_block_count > sbi->unusable_block_count)
> >> +			avail_user_block_count -= sbi->unusable_block_count;
> >> +		else
> >> +			avail_user_block_count = 0;
> >> +	}
> >> +
> >> +	return avail_user_block_count;
> >> +}
> >> +
> >>  static inline void f2fs_i_blocks_write(struct inode *, block_t, bool, bool);
> >>  static inline int inc_valid_block_count(struct f2fs_sb_info *sbi,
> >>  				 struct inode *inode, blkcnt_t *count)
> >> @@ -1782,17 +1803,8 @@ static inline int inc_valid_block_count(struct f2fs_sb_info *sbi,
> >>  
> >>  	spin_lock(&sbi->stat_lock);
> >>  	sbi->total_valid_block_count += (block_t)(*count);
> >> -	avail_user_block_count = sbi->user_block_count -
> >> -					sbi->current_reserved_blocks;
> >> +	avail_user_block_count = get_available_block_count(sbi, inode, true);
> >>  
> >> -	if (!__allow_reserved_blocks(sbi, inode, true))
> >> -		avail_user_block_count -= F2FS_OPTION(sbi).root_reserved_blocks;
> >> -	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
> >> -		if (avail_user_block_count > sbi->unusable_block_count)
> >> -			avail_user_block_count -= sbi->unusable_block_count;
> >> -		else
> >> -			avail_user_block_count = 0;
> >> -	}
> >>  	if (unlikely(sbi->total_valid_block_count > avail_user_block_count)) {
> >>  		diff = sbi->total_valid_block_count - avail_user_block_count;
> >>  		if (diff > *count)
> >> @@ -2005,7 +2017,8 @@ static inline int inc_valid_node_count(struct f2fs_sb_info *sbi,
> >>  					struct inode *inode, bool is_inode)
> >>  {
> >>  	block_t	valid_block_count;
> >> -	unsigned int valid_node_count, user_block_count;
> >> +	unsigned int valid_node_count;
> >> +	unsigned int avail_user_block_count;
> >>  	int err;
> >>  
> >>  	if (is_inode) {
> >> @@ -2027,16 +2040,10 @@ static inline int inc_valid_node_count(struct f2fs_sb_info *sbi,
> >>  
> >>  	spin_lock(&sbi->stat_lock);
> >>  
> >> -	valid_block_count = sbi->total_valid_block_count +
> >> -					sbi->current_reserved_blocks + 1;
> >> -
> >> -	if (!__allow_reserved_blocks(sbi, inode, false))
> >> -		valid_block_count += F2FS_OPTION(sbi).root_reserved_blocks;
> >> -	user_block_count = sbi->user_block_count;
> >> -	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
> >> -		user_block_count -= sbi->unusable_block_count;
> >> +	valid_block_count = sbi->total_valid_block_count + 1;
> >> +	avail_user_block_count = get_available_block_count(sbi, inode, false);
> > 
> > This doesn't look like same?
> 
> Actually, calculations of block count in inc_valid_node_count() and
> inc_valid_block_count() should be the same, I've no idea why we use different
> policy for reserved block for root user.

Hmm, for now, let's defer to discuss this.

> 
> Thanks,
> 
> > 
> >>  
> >> -	if (unlikely(valid_block_count > user_block_count)) {
> >> +	if (unlikely(valid_block_count > avail_user_block_count)) {
> >>  		spin_unlock(&sbi->stat_lock);
> >>  		goto enospc;
> >>  	}
> >> -- 
> >> 2.18.0.rc1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
