Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F13932ED0A5
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 Jan 2021 14:24:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kxVH9-0006hg-AZ; Thu, 07 Jan 2021 13:24:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack@suse.cz>) id 1kxVH7-0006hQ-T8
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 07 Jan 2021 13:24:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x6d8jTAVGAa8a1PccGOO8u0l4P48YgAakdhUKjx39dM=; b=J4ilCkdNgUji0qM6XANWG3HOVZ
 Nyv9oFkkshym7+C7dOW3E8BmvFRfpDozXANdljS1gTXkNkTuCd0OBfdf872Uw4mc92zI+MFyhEvAk
 PRiv0ZdKFhxOIH6MxBRW1jqHvnPNVUEgrCuuqCBs1VpS29rbn8EO6TfhSKYeEYR4p7xE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=x6d8jTAVGAa8a1PccGOO8u0l4P48YgAakdhUKjx39dM=; b=MxKkE7wm5Jv8f7/+5VfnVGDMBu
 BsJyeLmWhm9IARlIoNl3IduRFpEwf7qLCuspjcaX9aRwCehzFA7zo2u5841mKTPUIQXas/h4gPJCe
 EDDc8lLpYxR+6mPiQpjbkAuFGokdRq35aT+BgvMMvkQoplaOMXK2Kr5hA10tnxKxklfM=;
Received: from mx2.suse.de ([195.135.220.15])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kxVH1-00Ak6L-JH
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 07 Jan 2021 13:24:25 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 45A53AD12;
 Thu,  7 Jan 2021 13:24:13 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 019341E0872; Thu,  7 Jan 2021 14:24:12 +0100 (CET)
Date: Thu, 7 Jan 2021 14:24:12 +0100
From: Jan Kara <jack@suse.cz>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20210107132412.GE12990@quack2.suse.cz>
References: <20210105005452.92521-1-ebiggers@kernel.org>
 <20210105005452.92521-9-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210105005452.92521-9-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.135.220.15 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kxVH1-00Ak6L-JH
Subject: Re: [f2fs-dev] [PATCH 08/13] ext4: simplify i_state checks in
 __ext4_update_other_inode_time()
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
Cc: Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon 04-01-21 16:54:47, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Since I_DIRTY_TIME and I_DIRTY_INODE are mutually exclusive in i_state,
> there's no need to check for I_DIRTY_TIME && !I_DIRTY_INODE.  Just check
> for I_DIRTY_TIME.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  fs/ext4/inode.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
> index 4cc6c7834312f..9e34541715968 100644
> --- a/fs/ext4/inode.c
> +++ b/fs/ext4/inode.c
> @@ -4962,14 +4962,12 @@ static void __ext4_update_other_inode_time(struct super_block *sb,
>  		return;
>  
>  	if ((inode->i_state & (I_FREEING | I_WILL_FREE | I_NEW |
> -			       I_DIRTY_INODE)) ||
> -	    ((inode->i_state & I_DIRTY_TIME) == 0))
> +			       I_DIRTY_TIME)) != I_DIRTY_TIME)
>  		return;

This is OK.

>  	spin_lock(&inode->i_lock);
> -	if (((inode->i_state & (I_FREEING | I_WILL_FREE | I_NEW |
> -				I_DIRTY_INODE)) == 0) &&
> -	    (inode->i_state & I_DIRTY_TIME)) {
> +	if ((inode->i_state & (I_FREEING | I_WILL_FREE | I_NEW |
> +			       I_DIRTY_TIME)) != I_DIRTY_TIME) {

But this condition is negated AFAICT. We should have == I_DIRTY_TIME here
AFAICT.

								Honza

-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
