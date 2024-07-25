Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0201493C9EC
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Jul 2024 22:54:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sX5Tr-000669-8p;
	Thu, 25 Jul 2024 20:54:31 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1sX5Tp-00065r-IC
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jul 2024 20:54:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/QYT0rzPLuApfQeI6j5NFgV7WR4KNyqVVfH6646Ngvs=; b=Sr7qFP1WJSjjwKkHhKIKewpQX8
 W1XvG2vXjt/ET84FUQBM5P5wtDefdnaytqYM1b9OyuvIHOg9K9ZJFvVoh56BoObHzRfYJvEqfr+n9
 0LgGzWNyJS3saV2us9RHYIW3GmXviRDMO9XCF9Pp4BS6Ke8fePrwl7rTK1hYL6wc+3+A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/QYT0rzPLuApfQeI6j5NFgV7WR4KNyqVVfH6646Ngvs=; b=OAAk6I+Bx2rDoCwvyfr08ZG6vs
 t37YBS3/5CBqunVRqRfqREkv0r6ufQwcvxYyic8/dDYzX3QbV15kL6pIjlinr703h7a7sqBiNdSGd
 b5Af0/+jEKUuuo5CgvTNvbtZKSazbbi+U2ZosGAs1B+MoLa8gpDQTPkHvBhKL5jj0DWg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sX5To-0001qo-TH for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jul 2024 20:54:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 512F96123C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 25 Jul 2024 20:54:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8D80C116B1;
 Thu, 25 Jul 2024 20:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721940858;
 bh=k5XgKfZKuQaShbPcQ6ThZs8P3ZYbgS7XfbQSn8nih/M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rLgvLDDj/jasD2/pDtM49kkJ73pgckmTKb+fEsomssWcydRi7ggyWe8W/aipUNKO+
 J5F8Gmt2d7PLHw/6elTZEG8kU6W3QDAE/TV4sp0VxN1LWbcIuIn+TES/IhTmNza0yw
 x6AcKKCui7WnsXGMe2d0kQzF+3BmdmE4s0cmJy/AVVv012YJp1+PRaT1f2JJ/4SqZT
 72BVaur7u7PpesAI1oMYHku9zbf7Mvqs65VP0AN51oH83+fFkkNVwoa9KnjlSZFKOz
 EOOi05ETs9X82PYug+aOE2q76RAie1OOXjLttCt4QV4qsOUiPr4kx6wczrG2+rFkkR
 9L3ftWZG+6niw==
Date: Thu, 25 Jul 2024 20:54:16 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZqK7eC9W9HVweTOJ@google.com>
References: <20240625031351.3586955-1-chao@kernel.org>
 <20240625031351.3586955-3-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240625031351.3586955-3-chao@kernel.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 06/25,
 Chao Yu wrote: > We should always truncate pagecache
 while truncating on-disk data. > > Fixes: a46bebd502fe ("f2fs: synchronize
 atomic write aborts") > Signed-off-by: Chao Yu <chao@kernel.or [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sX5To-0001qo-TH
Subject: Re: [f2fs-dev] [PATCH 3/4] f2fs: atomic: fix to truncate pagecache
 before on-disk metadata truncation
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

On 06/25, Chao Yu wrote:
> We should always truncate pagecache while truncating on-disk data.
> 
> Fixes: a46bebd502fe ("f2fs: synchronize atomic write aborts")
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/file.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 2203904383a6..0355cb054521 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -2185,6 +2185,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
>  		clear_inode_flag(fi->cow_inode, FI_INLINE_DATA);
>  	} else {
>  		/* Reuse the already created COW inode */
> +		truncate_setsize(inode, 0);

		fi->cow_inode?

>  		ret = f2fs_do_truncate_blocks(fi->cow_inode, 0, true);
>  		if (ret) {
>  			f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
> -- 
> 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
