Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD9A11794D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Dec 2019 23:28:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ieRWE-0000zF-9H; Mon, 09 Dec 2019 22:28:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1ieRW7-0000z2-Kc
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Dec 2019 22:28:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KCuRQ5EO01eXcRhbb8mkk3qF3WB+qL2AtIYOdw088G8=; b=cUPu80drV5lkfWKF7mO5vSRBtc
 jT/AzEm/FAlJlB9q6J4noklh0KDsfoCxVopLf0EFK7+AGFUB+NpeH4CLXEmQfBkbdPWVSOm5jA6xw
 6tKYwCf36FBrndZ3veMy7ljecaVtw7XcrbrrhPe1eSY2J25h6KK8yiarc2rZ7+CgDLAg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KCuRQ5EO01eXcRhbb8mkk3qF3WB+qL2AtIYOdw088G8=; b=XAhUGif2/pWJBXAeNz/sQfeVZY
 PTCJ/+8qVCvvJAl00kxABP9/SXKboPj8W7jIX1lOJmxBgy4wBzwaOkjnk4LUcXp4Qk3W7w8v8HtZo
 Uufe5bPSN1MBw4lLffKe+SycMijHTZi7Hd586lyHhqjfaXrJ9it4qjlBMBmRkHSW2108=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ieRW6-00FjBy-IZ
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Dec 2019 22:28:35 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C887220637;
 Mon,  9 Dec 2019 22:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575930508;
 bh=P0iEsLxI1uweiGSusdApFJh0pwecHJrFeTNlNQl9mUk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VFfW2H5I8LgDzPwwvAI+t7g4kiU8Q7z47aLRBiKlqqwtyluFQJyMx+DobL4WxYQAz
 GFxqp+VcU5MPg/ApgL9Uq+ZPnWymht9ZQLhvTHJ7XpGgw0XtFIgDbSll6zQcbWX9Jr
 mTe5gEVXG5YzLSQarjOE7x4FDdE5CyvD2rqK39UM=
Date: Mon, 9 Dec 2019 14:28:28 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20191209222828.GA798@jaegeuk-macbookpro.roam.corp.google.com>
References: <20191209200055.204040-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191209200055.204040-1-ebiggers@kernel.org>
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
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ieRW6-00FjBy-IZ
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

On 12/09, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> META_MAPPING is used to move blocks for both encrypted and verity files.
> So the META_MAPPING invalidation condition in do_checkpoint() should
> consider verity too, not just encrypt.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  fs/f2fs/checkpoint.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index ffdaba0c55d29..44e84ac5c9411 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -1509,10 +1509,10 @@ static int do_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
>  	f2fs_wait_on_all_pages_writeback(sbi);
>  
>  	/*
> -	 * invalidate intermediate page cache borrowed from meta inode
> -	 * which are used for migration of encrypted inode's blocks.
> +	 * invalidate intermediate page cache borrowed from meta inode which are
> +	 * used for migration of encrypted or verity inode's blocks.
>  	 */
> -	if (f2fs_sb_has_encrypt(sbi))
> +	if (f2fs_sb_has_encrypt(sbi) || f2fs_sb_has_verity(sbi))

Do we need f2fs_post_read_required() aligned to the condition of
move_data_block()?

>  		invalidate_mapping_pages(META_MAPPING(sbi),
>  				MAIN_BLKADDR(sbi), MAX_BLKADDR(sbi) - 1);
>  
> -- 
> 2.24.0.393.g34dc348eaf-goog


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
