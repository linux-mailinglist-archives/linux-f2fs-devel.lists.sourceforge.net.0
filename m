Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E572F1937
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Jan 2021 16:11:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kyyr3-0001PO-9O; Mon, 11 Jan 2021 15:11:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack@suse.cz>) id 1kyyr1-0001Ox-CB
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Jan 2021 15:11:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BE8Q7EbFdfK8p1KWDuQrFCi7ZiyHO1y04kvGhQifKBc=; b=DUOkr7ZKbOHeOiSIE3i5uNYOg5
 lymnZ0Wlg2GFZ91It++GX5f7C2ehvtkpEgX16niJPs0IvgTDtL9LfFeD1OvnIO5FthVyk+b0B4Rua
 qCxaUJjQzQVuKt5xRDDwh7555cU0ZdxlkOFXHmSB9lqINDG6T+Q6Sw2NOP1V2EzYVR8M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BE8Q7EbFdfK8p1KWDuQrFCi7ZiyHO1y04kvGhQifKBc=; b=KlJbKfK9rtFa3ElM+3UohKIC8Y
 RwkIL8KvTIEe1vlhHdvjLTRpf3hPiwCdOai20bC/VQ7bcb+NF5QbxUbzspLzvNsagfPAfnkQdG2lS
 yDw/2kH2bc/FGqtPIJCbKCYqRmfgaiWUmeADRR4LirXN9kEJNkIfvLg72TCY2VR9qR1A=;
Received: from mx2.suse.de ([195.135.220.15])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kyyqt-001Oej-6b
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Jan 2021 15:11:35 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DDFB2AB3E;
 Mon, 11 Jan 2021 15:11:20 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 868C51E0807; Mon, 11 Jan 2021 16:11:20 +0100 (CET)
Date: Mon, 11 Jan 2021 16:11:20 +0100
From: Jan Kara <jack@suse.cz>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20210111151120.GJ18475@quack2.suse.cz>
References: <20210109075903.208222-1-ebiggers@kernel.org>
 <20210109075903.208222-12-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210109075903.208222-12-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.135.220.15 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kyyqt-001Oej-6b
Subject: Re: [f2fs-dev] [PATCH v2 11/12] ext4: simplify i_state checks in
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

On Fri 08-01-21 23:59:02, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Since I_DIRTY_TIME and I_DIRTY_INODE are mutually exclusive in i_state,
> there's no need to check for I_DIRTY_TIME && !I_DIRTY_INODE.  Just check
> for I_DIRTY_TIME.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Looks good to me. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/ext4/inode.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
> index 4cc6c7834312f..00bca5c18eb65 100644
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
>  
>  	spin_lock(&inode->i_lock);
> -	if (((inode->i_state & (I_FREEING | I_WILL_FREE | I_NEW |
> -				I_DIRTY_INODE)) == 0) &&
> -	    (inode->i_state & I_DIRTY_TIME)) {
> +	if ((inode->i_state & (I_FREEING | I_WILL_FREE | I_NEW |
> +			       I_DIRTY_TIME)) == I_DIRTY_TIME) {
>  		struct ext4_inode_info	*ei = EXT4_I(inode);
>  
>  		inode->i_state &= ~I_DIRTY_TIME;
> -- 
> 2.30.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
