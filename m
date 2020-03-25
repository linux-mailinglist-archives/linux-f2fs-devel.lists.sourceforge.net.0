Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 76546192D98
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Mar 2020 16:58:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jH8Q9-00072L-Ve; Wed, 25 Mar 2020 15:58:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jH8Q8-00072D-Ri
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Mar 2020 15:58:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Bgo+Wra9hmQz7pHxUHMG3wIw7vOhUiz/LWeqeYLGvqc=; b=GdXIfwnl8FBIa1dayYRHrQwDBh
 if6tsbdvd3dySe4g1/1vj/rbFBP1ZtEMEE73ZHO0imwpMOCSaIUvLPaHSJaaX6ALHj0DeOjcry4MN
 doejxomb7yUfjS0VP4fP8SEhYkXuFLP/Q1s6FAFnXYAn0RWznjZLlBjgHFXIf1awe6gM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Bgo+Wra9hmQz7pHxUHMG3wIw7vOhUiz/LWeqeYLGvqc=; b=BB6Onx6xLHY9ZznVy1YRK7HE9I
 ukd60yz7/d1SydWpm5v0encgytx9pfdHjA/5Z+4NnfOlJTDnMPB9K2nW7rMb8Zyq+QKICAYJjK2uZ
 Liqvn8MjLAxehlBhNTFve5jhkj/VGm6L+6/nDWVEhcXQkDWCAI79A+tLlfnoeyoHsMx0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jH8Q0-0037CE-Ov
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Mar 2020 15:58:20 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1F0202073E;
 Wed, 25 Mar 2020 15:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585151887;
 bh=yuKPw9zHwSe4jPNUbVFEbNmFqcIFFFDut0JgQS3oKmM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V+62TTJEnnakM8FVs3+TfAH+O1aXF1HvMmeMiJl/SqXlqkbVYSu62irvYLvhOUN74
 9ev7B2Xcdw4Owa+w+k2grU+BoD5RMypGl7iUXrhiOEp6YankzEDZfP3nlJ56BPJpPl
 /sEtWZSo85MnjUDhIvS/bwuNA1k8K0yE3Prk7BcM=
Date: Wed, 25 Mar 2020 08:58:06 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200325155806.GC65658@google.com>
References: <20200325092754.63411-1-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200325092754.63411-1-yuchao0@huawei.com>
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
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jH8Q0-0037CE-Ov
Subject: Re: [f2fs-dev] [PATCH RFC] f2fs: don't inline compressed inode
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

On 03/25, Chao Yu wrote:
> f2fs_may_inline_data() only check compressed flag on current inode
> rather than on parent inode, however at this time compressed flag
> has not been inherited yet.

When write() or other allocation happens, it'll be reset.

> 
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
> 
> Jaegeuk,
> 
> I'm not sure about this, whether inline_data flag can be compatible with
> compress flag, thoughts?
> 
>  fs/f2fs/namei.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
> index f54119da2217..3807d1b4c4bc 100644
> --- a/fs/f2fs/namei.c
> +++ b/fs/f2fs/namei.c
> @@ -86,7 +86,8 @@ static struct inode *f2fs_new_inode(struct inode *dir, umode_t mode)
>  	if (test_opt(sbi, INLINE_XATTR))
>  		set_inode_flag(inode, FI_INLINE_XATTR);
>  
> -	if (test_opt(sbi, INLINE_DATA) && f2fs_may_inline_data(inode))
> +	if (test_opt(sbi, INLINE_DATA) && f2fs_may_inline_data(inode) &&
> +					!f2fs_compressed_file(dir))
>  		set_inode_flag(inode, FI_INLINE_DATA);
>  	if (f2fs_may_inline_dentry(inode))
>  		set_inode_flag(inode, FI_INLINE_DENTRY);
> -- 
> 2.18.0.rc1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
