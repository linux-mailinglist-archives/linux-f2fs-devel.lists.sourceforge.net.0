Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB0C1179E0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Dec 2019 23:53:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ieRuN-0001QT-2D; Mon, 09 Dec 2019 22:53:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1ieRuL-0001QE-Gk
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Dec 2019 22:53:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ouMnqEeAQP3pgaHkiGan9srP4OuSmXIhNdTOeOXdoD0=; b=kLWVu68HTKQCaXkslR9+FwjshR
 osbxGHih65L1PKaxgfkzPWzYeVCxVx+spqFNhM4YWOvsGSwLZBtNngSzRYHHIEyNZwrimioxF1fKY
 /+BdnZ4Q6sJWPmmg+qma2dE88tX9VtXT/ZefHQkIj6hxJf/as7STsKH5m+HlctYb6E3Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ouMnqEeAQP3pgaHkiGan9srP4OuSmXIhNdTOeOXdoD0=; b=VIKY9A6cSd1Tx2BqYDt/OLzlW9
 LPN1CqQQwZCecKAZVzr52/e8zBjCEhiiKtiOEMY1x/kdE9nUV0XNA5NgwbKj+gIzGwJUgqCRMmar9
 4cU7UMqEHOXvdD9Hsm2lvXy/HO/DDvplWGkbtBxF+qGAEJmW6xthzqnYAYwja5Mqzsg8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ieRuK-00FkUC-Bp
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Dec 2019 22:53:37 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A8626206D5;
 Mon,  9 Dec 2019 22:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575932010;
 bh=iVY/LHU59YNkIrKmss+YACySzYJGFP4oy3lehsHNIP0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GxPLLO5LmxtmITVr9gbcIJoUvdBWWtsew49E8i8Z792pfMBZGV4slPXw838nG7zEa
 tnN31FChr8VKWCVMxRAixj8/YlAnmTY4D04vcXwXvxkHxrylMsgmTdNqiNaOmM81PL
 zjevy++uZE0YNgQ6Elwtbzpkd8e6m15oeygm7ND4=
Date: Mon, 9 Dec 2019 14:53:29 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <20191209225328.GG149190@gmail.com>
References: <20191209200055.204040-1-ebiggers@kernel.org>
 <20191209222828.GA798@jaegeuk-macbookpro.roam.corp.google.com>
 <20191209224051.GF149190@gmail.com>
 <20191209224857.GC798@jaegeuk-macbookpro.roam.corp.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191209224857.GC798@jaegeuk-macbookpro.roam.corp.google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -0.4 (/)
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
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ieRuK-00FkUC-Bp
Subject: Re: [f2fs-dev] [PATCH] f2fs: don't keep META_MAPPING pages used for
 moving verity file blocks
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
Cc: linux-fscrypt@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Dec 09, 2019 at 02:48:57PM -0800, Jaegeuk Kim wrote:
> On 12/09, Eric Biggers wrote:
> > On Mon, Dec 09, 2019 at 02:28:28PM -0800, Jaegeuk Kim wrote:
> > > On 12/09, Eric Biggers wrote:
> > > > From: Eric Biggers <ebiggers@google.com>
> > > > 
> > > > META_MAPPING is used to move blocks for both encrypted and verity files.
> > > > So the META_MAPPING invalidation condition in do_checkpoint() should
> > > > consider verity too, not just encrypt.
> > > > 
> > > > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > > > ---
> > > >  fs/f2fs/checkpoint.c | 6 +++---
> > > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> > > > index ffdaba0c55d29..44e84ac5c9411 100644
> > > > --- a/fs/f2fs/checkpoint.c
> > > > +++ b/fs/f2fs/checkpoint.c
> > > > @@ -1509,10 +1509,10 @@ static int do_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
> > > >  	f2fs_wait_on_all_pages_writeback(sbi);
> > > >  
> > > >  	/*
> > > > -	 * invalidate intermediate page cache borrowed from meta inode
> > > > -	 * which are used for migration of encrypted inode's blocks.
> > > > +	 * invalidate intermediate page cache borrowed from meta inode which are
> > > > +	 * used for migration of encrypted or verity inode's blocks.
> > > >  	 */
> > > > -	if (f2fs_sb_has_encrypt(sbi))
> > > > +	if (f2fs_sb_has_encrypt(sbi) || f2fs_sb_has_verity(sbi))
> > > 
> > > Do we need f2fs_post_read_required() aligned to the condition of
> > > move_data_block()?
> > > 
> > 
> > I think you're asking why verity files have to be moved via META_MAPPING?  The
> > reason is that we have to be super careful not to read pages of a verity file
> > into its own address_space without doing the fs-verity data verification, as
> > then unverified data would be available to userspace.
> > 
> > In theory, F2FS's garbage collector could do the data verification.  But it's
> > tricky because ->i_verity_info may not have been set up yet.  So it might be
> > easiest to continue to treat verity files like encrypted files.
> 
> I meant to ask why not just checking f2fs_post_read_required() here so that we
> could sync the check across multiple places.
> 

We can't use f2fs_post_read_required() here because f2fs_post_read_required()
deals with a specific inode, but do_checkpoint() is dealing with the entire
filesystem.  It's checking whether the filesystem might have *any* files that
were moved via META_MAPPING.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
