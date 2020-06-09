Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCF31F3238
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  9 Jun 2020 04:11:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jiTjs-0003zE-VW; Tue, 09 Jun 2020 02:11:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jiTjk-0003yv-UN
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 09 Jun 2020 02:11:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BLTWWqJcqOjcsGFUYjXWdse36QH6H4/pKLNxWVml+EQ=; b=g84MM7lLDj5vm+Eu/UNETqy6TQ
 TcDTLGym8X3qaiRCpUtDuok6Wde1bT+rIRYZZy3LNcdr60zfWDyexn+pU3WWYgTTUu9u5ZiDhs9Ii
 eJjBrKLo5Ca5/wczt0W4PC8rClb8Guq8gM+ImSWrn7u0IjNRr1pKQPQ9A79l9Lsg5khc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BLTWWqJcqOjcsGFUYjXWdse36QH6H4/pKLNxWVml+EQ=; b=mdm9UGHuHYaXypN9/SK8oj36un
 V5ua8WHuPZHYCgcbrWdGQaJYo5gLM8S4P8EbEeFrcdFSHpt9vuTQPyY3wW8mmS4doIrftXk4e5B7d
 zW0/IFCW9rhS0c94WvOapsICq2TUGjklpmKYT5lo7RTJ8zzyQ1kSaEb8GZTRd/qLfBJE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jiTjh-00CBy1-5y
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 09 Jun 2020 02:11:34 +0000
Received: from gmail.com (unknown [104.132.1.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C38CE206D5;
 Tue,  9 Jun 2020 02:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591668682;
 bh=8h4rg0+OI/koec/ZL494mV9tlBq01rrgE5xxzVnk0UA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eJi4rhkb7JPzRxFf2Fjdot296AwsjbJvZrIRJf7mNIRekcRDN8m4rQv3SYISCebZk
 iQ+Oa93TfIr+cIOdiAJDboQaWw8o5dsEC9FIumeeQK5LcpYza+G4zJsvkqZH+ARpoo
 A+jX6gSTUpN62QDPxD6+KBRIh5bet1dRA+h1Ub+k=
Date: Mon, 8 Jun 2020 19:11:21 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200609021121.GA43422@gmail.com>
References: <20200605045748.34018-1-ebiggers@kernel.org>
 <57c9bfa7-9b15-64e5-8b33-eb9829399f87@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <57c9bfa7-9b15-64e5-8b33-eb9829399f87@huawei.com>
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
X-Headers-End: 1jiTjh-00CBy1-5y
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: don't return vmalloc() memory from
 f2fs_kmalloc()
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jun 09, 2020 at 09:36:50AM +0800, Chao Yu wrote:
> On 2020/6/5 12:57, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > kmalloc() returns kmalloc'ed memory, and kvmalloc() returns either
> > kmalloc'ed or vmalloc'ed memory.  But the f2fs wrappers, f2fs_kmalloc()
> > and f2fs_kvmalloc(), both return both kinds of memory.
> > 
> > It's redundant to have two functions that do the same thing, and also
> > breaking the standard naming convention is causing bugs since people
> > assume it's safe to kfree() memory allocated by f2fs_kmalloc().  See
> > e.g. the various allocations in fs/f2fs/compress.c.
> > 
> > Fix this by making f2fs_kmalloc() just use kmalloc().  And to avoid
> > re-introducing the allocation failures that the vmalloc fallback was
> > intended to fix, convert the largest allocations to use f2fs_kvmalloc().
> > 
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > ---
> > 
> > v2: also use f2fs_kvzalloc() in init_blkz_info()
> > 
> >  fs/f2fs/checkpoint.c | 4 ++--
> >  fs/f2fs/f2fs.h       | 8 +-------
> >  fs/f2fs/node.c       | 8 ++++----
> >  fs/f2fs/super.c      | 2 +-
> >  4 files changed, 8 insertions(+), 14 deletions(-)
> > 
> > diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> > index 3dc3ac6fe14324..23606493025165 100644
> > --- a/fs/f2fs/checkpoint.c
> > +++ b/fs/f2fs/checkpoint.c
> > @@ -895,8 +895,8 @@ int f2fs_get_valid_checkpoint(struct f2fs_sb_info *sbi)
> >  	int i;
> >  	int err;
> >  
> > -	sbi->ckpt = f2fs_kzalloc(sbi, array_size(blk_size, cp_blks),
> > -				 GFP_KERNEL);
> > +	sbi->ckpt = f2fs_kvzalloc(sbi, array_size(blk_size, cp_blks),
> > +				  GFP_KERNEL);
> >  	if (!sbi->ckpt)
> >  		return -ENOMEM;
> >  	/*
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index 50e6cdf20b7331..c812fb8e2d9c7a 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -2998,18 +2998,12 @@ static inline bool f2fs_may_extent_tree(struct inode *inode)
> >  static inline void *f2fs_kmalloc(struct f2fs_sb_info *sbi,
> >  					size_t size, gfp_t flags)
> >  {
> > -	void *ret;
> > -
> >  	if (time_to_inject(sbi, FAULT_KMALLOC)) {
> >  		f2fs_show_injection_info(sbi, FAULT_KMALLOC);
> >  		return NULL;
> >  	}
> >  
> > -	ret = kmalloc(size, flags);
> > -	if (ret)
> > -		return ret;
> > -
> > -	return kvmalloc(size, flags);
> > +	return kmalloc(size, flags);
> 
> Then could we revert to use kfree instead of kvfree if memory was allocated
> from f2fs_kmalloc()? though there is actual problem w/o reverting.
> 

Yes, I think we should prefer kfree() when the memory was allocated with
f2fs_kmalloc().  It's not critical though, since kvfree() works on kmalloc'ed
memory.  So it should be a separate patch later.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
