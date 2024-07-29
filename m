Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B767293FA85
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jul 2024 18:21:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sYT7c-0000n2-2o;
	Mon, 29 Jul 2024 16:21:16 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1sYT7b-0000mr-49
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jul 2024 16:21:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RyLLDcP9fQPvwMvGxlJI/YA7XNQpWN6BnebzhWAmhSA=; b=NPM6XrDDgROCn9EPn4BXQqdZAN
 C3LZ0EPjIaFMNjS5GJZUcZvT/ukyR8jUM96okNxJH8TDK4WoQjuEOJbp8TeXkWT4KPe3Rp1AoY/YI
 Sh03hBTmKm97tPvIhpN5S3D8jxipPjRqGEl2tbuv0V6V2Dzr4aEQb7xdxyZkDHIZhqSk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RyLLDcP9fQPvwMvGxlJI/YA7XNQpWN6BnebzhWAmhSA=; b=YeEc0KjTZDE6sTmRWhKZEcHNfH
 /hoAPoYQC+z+wRYv6aWmA9uu1uB5mSrvLPi93wggkZdBqmKY02jQw9XlIauyeXGIZqPUkIuwYfa25
 pOFz6sfF1cAGAnlOPWWadiQcSFbljLPcplsTFg9RLLw5cX8oE/EqxymiLFOWMMaXz+0c=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sYT7a-0001KF-7r for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jul 2024 16:21:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DF36961B77
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 29 Jul 2024 16:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68BEBC4AF19;
 Mon, 29 Jul 2024 16:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722270063;
 bh=L6jcEa8CfEldUuj1WusbJIcpD6rrcXH0GVGphBmFRwg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RvEaVZVKOp986/b3JSq7HO+zqtJTxfVCLOEH5WROoYKTVhKIsEXEvTEaDoSlwVtrf
 g4sJ9q1hNLetbliwaOap3O9yPw2vmOY1Cz0jcl7W2N9EadlfEcEqS3hCOkXEhhMAkU
 LGo+H1Q/+rD3gocQ4okL7fERC1XVxxe7hLfKzX1PXnqBpTbsZtzv/LLmB8kPE4+8A5
 PRgvhDJjlk129VH4MXAfIPBVPkvuOHwQA1CO5u9rNECztOvKzH8U8ux/oyG+blRQEa
 qgt7nPx1cOm01PoA/8fmoEtz1FeqVMW2up1ovkd2Sw0HNe7foQYdg52U+8eQMP1lCV
 juwf9kz7BwZ0Q==
Date: Mon, 29 Jul 2024 16:21:01 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZqfBbQGxwpAvCO2m@google.com>
References: <20240712073415.227226-1-chao@kernel.org>
 <ZqKDnpzwX85RyGaa@google.com>
 <c2b7d0cd-ea10-4e25-829c-53967927bd03@kernel.org>
 <ZqRpHOJyWU3Sn8Ma@google.com>
 <74dbb5f1-1565-4971-ae5c-c176d62cfa8f@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <74dbb5f1-1565-4971-ae5c-c176d62cfa8f@kernel.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 07/29, Chao Yu wrote: > On 2024/7/27 11:27, Jaegeuk Kim
 wrote: > > On 07/26, Chao Yu wrote: > > > On 2024/7/26 0:55, Jaegeuk Kim
 wrote: > > > > On 07/12, Chao Yu wrote: > > > > > All directory bloc [...]
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sYT7a-0001KF-7r
Subject: Re: [f2fs-dev] [PATCH] f2fs: don't traverse directory blocks after
 EOF
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

On 07/29, Chao Yu wrote:
> On 2024/7/27 11:27, Jaegeuk Kim wrote:
> > On 07/26, Chao Yu wrote:
> > > On 2024/7/26 0:55, Jaegeuk Kim wrote:
> > > > On 07/12, Chao Yu wrote:
> > > > > All directory blocks are within the scope of i_size, so let's limit
> > > > > the end_block to just check valid dirent blocks.
> > > > 
> > > > Do we really need this?
> > > 
> > > f2fs_readdir() and f2fs_empty_dir() uses dir_blocks() for upper boundary,
> > > this patch aligns find_in_level() w/ them.
> > > 
> > > Also, it can avoid grabbing never used page cache across EOF.
> > > 
> > > So, we can consider taking this patch?
> > 
> > I'm wondering whether the current code has a bug or not.
> 
> I think it's not a bug, but, in corner case it may waste memory and
> cause a bit performance reduction.

Well, I don't think it's really a problem.

> 
> Thanks,
> 
> > 
> > > 
> > > Thanks,
> > > 
> > > > 
> > > > > 
> > > > > Meanwhile, it uses dir_blocks() instead of variable for cleanup in
> > > > > __f2fs_find_entry().
> > > > > 
> > > > > Signed-off-by: Chao Yu <chao@kernel.org>
> > > > > ---
> > > > >    fs/f2fs/dir.c | 6 ++++--
> > > > >    1 file changed, 4 insertions(+), 2 deletions(-)
> > > > > 
> > > > > diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
> > > > > index 02c9355176d3..d4591c215f07 100644
> > > > > --- a/fs/f2fs/dir.c
> > > > > +++ b/fs/f2fs/dir.c
> > > > > @@ -305,18 +305,21 @@ static struct f2fs_dir_entry *find_in_level(struct inode *dir,
> > > > >    	int s = GET_DENTRY_SLOTS(fname->disk_name.len);
> > > > >    	unsigned int nbucket, nblock;
> > > > >    	unsigned int bidx, end_block;
> > > > > +	unsigned long last_block;
> > > > >    	struct page *dentry_page;
> > > > >    	struct f2fs_dir_entry *de = NULL;
> > > > >    	pgoff_t next_pgofs;
> > > > >    	bool room = false;
> > > > >    	int max_slots;
> > > > > +	last_block = dir_blocks(dir);
> > > > >    	nbucket = dir_buckets(level, F2FS_I(dir)->i_dir_level);
> > > > >    	nblock = bucket_blocks(level);
> > > > >    	bidx = dir_block_index(level, F2FS_I(dir)->i_dir_level,
> > > > >    			       le32_to_cpu(fname->hash) % nbucket);
> > > > >    	end_block = bidx + nblock;
> > > > > +	end_block = min_t(unsigned int, end_block, last_block);
> > > > >    	while (bidx < end_block) {
> > > > >    		/* no need to allocate new dentry pages to all the indices */
> > > > > @@ -361,7 +364,6 @@ struct f2fs_dir_entry *__f2fs_find_entry(struct inode *dir,
> > > > >    					 const struct f2fs_filename *fname,
> > > > >    					 struct page **res_page)
> > > > >    {
> > > > > -	unsigned long npages = dir_blocks(dir);
> > > > >    	struct f2fs_dir_entry *de = NULL;
> > > > >    	unsigned int max_depth;
> > > > >    	unsigned int level;
> > > > > @@ -373,7 +375,7 @@ struct f2fs_dir_entry *__f2fs_find_entry(struct inode *dir,
> > > > >    		goto out;
> > > > >    	}
> > > > > -	if (npages == 0)
> > > > > +	if (dir_blocks(dir) == 0)
> > > > >    		goto out;
> > > > >    	max_depth = F2FS_I(dir)->i_current_depth;
> > > > > -- 
> > > > > 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
