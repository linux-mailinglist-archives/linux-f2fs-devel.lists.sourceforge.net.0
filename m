Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A963202B9D
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 21 Jun 2020 18:38:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jn2zc-0005V2-2Y; Sun, 21 Jun 2020 16:38:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jn2za-0005Uf-6b
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 21 Jun 2020 16:38:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aVLaXB/RqpOmhqDaPuouCqbVSMw9vecIME5mHgtlmcU=; b=h6wT3dhRjyP37cBBABbvBQgLLa
 SBwsNZopda/ZWnWXHDqDdpx+gn8N7ZoJVtD5BsyDLV3RwL3n2X8mi6QjzASv5NAO2csWnOWV8ISvP
 nchB15gF4lWt7wjC34umuXRrSae4MuN4xk6qMhd/m/7MCe3rN6rfxqMcUmiGT9Ae+rUI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aVLaXB/RqpOmhqDaPuouCqbVSMw9vecIME5mHgtlmcU=; b=VkhIRSe5CxGJGbFqMSP0BySNbI
 5ylwU3jpzEnlAV8CouwpPJcLIdSqtP/5KpyUI/T+rp6KZlOzjz8wJ1arZ+uZ97GpqkI0mMPO+wNUD
 jpOfS2P5Ubtw3ZZzCwRsXPzDsa0Go1Q0gWL19BZjqVlN6XzVH9JVsuS+7qCEiwNycEaE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jn2zV-00Cpgq-LS
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 21 Jun 2020 16:38:49 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6616324863;
 Sun, 21 Jun 2020 16:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592757515;
 bh=J1EVzWQeu1qIX3NeNJnPQNRrxOsl4sDjRx/e8sWGlF0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=w6Y7WtzvB+HWO/wsVn/bbxET77TaGLdfOWE9mze2SeZnxEu+t4QyQGPNkzynZJoAD
 b9b6KvEx/Ver5cwBQqf8G6VRyZqGFIR1oyDCFDwER/8XBb91kmSY1ZGpQiiSEq+Z65
 6HSrK+AzJEMFfnLxZiqbsGMDnSrfj4fr1eDkpOTA=
Date: Sun, 21 Jun 2020 09:38:34 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200621163834.GA36924@google.com>
References: <20200618063625.110273-1-yuchao0@huawei.com>
 <20200618235932.GA227771@google.com>
 <f5bbb14b-52a0-9697-a8fe-c3e39f78b0a5@huawei.com>
 <20200619054922.GC227771@google.com>
 <3634ef79-5903-449d-0d52-3d5566481863@huawei.com>
 <20200619224755.GA60059@google.com>
 <3f49539a-7be1-be90-d13a-2f66a8483458@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3f49539a-7be1-be90-d13a-2f66a8483458@huawei.com>
X-Spam-Score: -0.2 (/)
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
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jn2zV-00Cpgq-LS
Subject: Re: [f2fs-dev] [PATCH 1/5] f2fs: fix to wait page writeback before
 update
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

On 06/20, Chao Yu wrote:
> On 2020/6/20 6:47, Jaegeuk Kim wrote:
> > On 06/19, Chao Yu wrote:
> >> On 2020/6/19 13:49, Jaegeuk Kim wrote:
> >>> On 06/19, Chao Yu wrote:
> >>>> Hi Jaegeuk,
> >>>>
> >>>> On 2020/6/19 7:59, Jaegeuk Kim wrote:
> >>>>> Hi Chao,
> >>>>>
> >>>>> On 06/18, Chao Yu wrote:
> >>>>>> to make page content stable for special device like raid.
> >>>>>
> >>>>> Could you elaborate the problem a bit?
> >>>>
> >>>> Some devices like raid5 wants page content to be stable, because
> >>>> it will calculate parity info based page content, if page is not
> >>>> stable, parity info could be corrupted, result in data inconsistency
> >>>> in stripe.
> >>>
> >>> I don't get the point, since those pages are brand new pages which were not
> >>> modified before. If it's on writeback, we should not modify them regardless
> >>> of whatever raid configuration. For example, f2fs_new_node_page() waits for
> >>> writeback. Am I missing something?
> >>
> >> I think we should use f2fs_bug_on(, PageWriteback()) rather than
> >> f2fs_wait_on_page_writeback() for brand new page which is allocated just now.
> >> For other paths, we can keep rule that waiting for writeback before updating.
> >>
> >> How do you think?
> >>
> >> Thanks,
> >>
> >>>
> >>>>
> >>>> Thanks,
> >>>>
> >>>>>
> >>>>>>
> >>>>>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> >>>>>> ---
> >>>>>>  fs/f2fs/dir.c          |  2 ++
> >>>>>>  fs/f2fs/extent_cache.c | 18 +++++++++---------
> >>>>>>  fs/f2fs/f2fs.h         |  2 +-
> >>>>>>  fs/f2fs/file.c         |  1 +
> >>>>>>  fs/f2fs/inline.c       |  2 ++
> >>>>>>  fs/f2fs/inode.c        |  3 +--
> >>>>>>  6 files changed, 16 insertions(+), 12 deletions(-)
> >>>>>>
> >>>>>> diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
> >>>>>> index d35976785e8c..91e86747a604 100644
> >>>>>> --- a/fs/f2fs/dir.c
> >>>>>> +++ b/fs/f2fs/dir.c
> >>>>>> @@ -495,6 +495,8 @@ static int make_empty_dir(struct inode *inode,
> >>>>>>  	if (IS_ERR(dentry_page))
> >>>>>>  		return PTR_ERR(dentry_page);
> >>>>>>  
> >>>>>> +	f2fs_bug_on(F2FS_I_SB(inode), PageWriteback(dentry_page));
> >>>>>> +
> >>>>>>  	dentry_blk = page_address(dentry_page);
> >>>>>>  
> >>>>>>  	make_dentry_ptr_block(NULL, &d, dentry_blk);
> >>>>>> diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
> >>>>>> index e60078460ad1..686c68b98610 100644
> >>>>>> --- a/fs/f2fs/extent_cache.c
> >>>>>> +++ b/fs/f2fs/extent_cache.c
> >>>>>> @@ -325,9 +325,10 @@ static void __drop_largest_extent(struct extent_tree *et,
> >>>>>>  }
> >>>>>>  
> >>>>>>  /* return true, if inode page is changed */
> >>>>>> -static bool __f2fs_init_extent_tree(struct inode *inode, struct f2fs_extent *i_ext)
> >>>>>> +static void __f2fs_init_extent_tree(struct inode *inode, struct page *ipage)
> >>>>>>  {
> >>>>>>  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> >>>>>> +	struct f2fs_extent *i_ext = ipage ? &F2FS_INODE(ipage)->i_ext : NULL;
> >>>>>>  	struct extent_tree *et;
> >>>>>>  	struct extent_node *en;
> >>>>>>  	struct extent_info ei;
> >>>>>> @@ -335,16 +336,18 @@ static bool __f2fs_init_extent_tree(struct inode *inode, struct f2fs_extent *i_e
> >>>>>>  	if (!f2fs_may_extent_tree(inode)) {
> >>>>>>  		/* drop largest extent */
> >>>>>>  		if (i_ext && i_ext->len) {
> >>>>>> +			f2fs_wait_on_page_writeback(ipage, NODE, true, true);
> >>>>>>  			i_ext->len = 0;
> >>>>>> -			return true;
> >>>>>> +			set_page_dirty(ipage);
> >>>>>> +			return;
> >>>>>>  		}
> >>>>>> -		return false;
> >>>>>> +		return;
> >>>>>>  	}
> >>>>>>  
> >>>>>>  	et = __grab_extent_tree(inode);
> >>>>>>  
> >>>>>>  	if (!i_ext || !i_ext->len)
> >>>>>> -		return false;
> >>>>>> +		return;
> >>>>>>  
> >>>>>>  	get_extent_info(&ei, i_ext);
> >>>>>>  
> >>>>>> @@ -360,17 +363,14 @@ static bool __f2fs_init_extent_tree(struct inode *inode, struct f2fs_extent *i_e
> >>>>>>  	}
> >>>>>>  out:
> >>>>>>  	write_unlock(&et->lock);
> >>>>>> -	return false;
> >>>>>>  }
> >>>>>>  
> >>>>>> -bool f2fs_init_extent_tree(struct inode *inode, struct f2fs_extent *i_ext)
> >>>>>> +void f2fs_init_extent_tree(struct inode *inode, struct page *ipage)
> >>>>>>  {
> >>>>>> -	bool ret =  __f2fs_init_extent_tree(inode, i_ext);
> >>>>>> +	__f2fs_init_extent_tree(inode, ipage);
> >>>>>>  
> >>>>>>  	if (!F2FS_I(inode)->extent_tree)
> >>>>>>  		set_inode_flag(inode, FI_NO_EXTENT);
> >>>>>> -
> >>>>>> -	return ret;
> >>>>>>  }
> >>>>>>  
> >>>>>>  static bool f2fs_lookup_extent_tree(struct inode *inode, pgoff_t pgofs,
> >>>>>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> >>>>>> index b35a50f4953c..326c12fa0da5 100644
> >>>>>> --- a/fs/f2fs/f2fs.h
> >>>>>> +++ b/fs/f2fs/f2fs.h
> >>>>>> @@ -3795,7 +3795,7 @@ struct rb_entry *f2fs_lookup_rb_tree_ret(struct rb_root_cached *root,
> >>>>>>  bool f2fs_check_rb_tree_consistence(struct f2fs_sb_info *sbi,
> >>>>>>  						struct rb_root_cached *root);
> >>>>>>  unsigned int f2fs_shrink_extent_tree(struct f2fs_sb_info *sbi, int nr_shrink);
> >>>>>> -bool f2fs_init_extent_tree(struct inode *inode, struct f2fs_extent *i_ext);
> >>>>>> +void f2fs_init_extent_tree(struct inode *inode, struct page *ipage);
> >>>>>>  void f2fs_drop_extent_tree(struct inode *inode);
> >>>>>>  unsigned int f2fs_destroy_extent_node(struct inode *inode);
> >>>>>>  void f2fs_destroy_extent_tree(struct inode *inode);
> >>>>>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> >>>>>> index 3268f8dd59bb..1862073b96d2 100644
> >>>>>> --- a/fs/f2fs/file.c
> >>>>>> +++ b/fs/f2fs/file.c
> >>>>>> @@ -1250,6 +1250,7 @@ static int __clone_blkaddrs(struct inode *src_inode, struct inode *dst_inode,
> >>>>>>  				f2fs_put_page(psrc, 1);
> >>>>>>  				return PTR_ERR(pdst);
> >>>>>>  			}
> >>>>>> +			f2fs_wait_on_page_writeback(pdst, DATA, true, true);
> > 
> > Do you mean pdst can be under writeback?
> 
> Use f2fs_bug_on(, dirty || writeback) here?
> 
> > 
> >>>>>>  			f2fs_copy_page(psrc, pdst);
> >>>>>>  			set_page_dirty(pdst);
> >>>>>>  			f2fs_put_page(pdst, 1);
> >>>>>> diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
> >>>>>> index dbade310dc79..4bcbc486c9e2 100644
> >>>>>> --- a/fs/f2fs/inline.c
> >>>>>> +++ b/fs/f2fs/inline.c
> >>>>>> @@ -340,6 +340,8 @@ int f2fs_make_empty_inline_dir(struct inode *inode, struct inode *parent,
> >>>>>>  	struct f2fs_dentry_ptr d;
> >>>>>>  	void *inline_dentry;
> >>>>>>  
> >>>>>> +	f2fs_wait_on_page_writeback(ipage, NODE, true, true);
> 
> f2fs_bug_on(, writeback)?

So, which case do you suspect unstable page for raid?

> 
> Thanks,
> 
> >>>>>> +
> >>>>>>  	inline_dentry = inline_data_addr(inode, ipage);
> >>>>>>  
> >>>>>>  	make_dentry_ptr_inline(inode, &d, inline_dentry);
> >>>>>> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> >>>>>> index 44582a4db513..7c156eb26dd7 100644
> >>>>>> --- a/fs/f2fs/inode.c
> >>>>>> +++ b/fs/f2fs/inode.c
> >>>>>> @@ -367,8 +367,7 @@ static int do_read_inode(struct inode *inode)
> >>>>>>  	fi->i_pino = le32_to_cpu(ri->i_pino);
> >>>>>>  	fi->i_dir_level = ri->i_dir_level;
> >>>>>>  
> >>>>>> -	if (f2fs_init_extent_tree(inode, &ri->i_ext))
> >>>>>> -		set_page_dirty(node_page);
> >>>>>> +	f2fs_init_extent_tree(inode, node_page);
> >>>>>>  
> >>>>>>  	get_inline_info(inode, ri);
> >>>>>>  
> >>>>>> -- 
> >>>>>> 2.18.0.rc1
> >>>>> .
> >>>>>
> >>> .
> >>>
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
