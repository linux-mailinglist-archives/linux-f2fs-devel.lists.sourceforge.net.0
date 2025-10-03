Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AC295BB5C07
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 03 Oct 2025 03:39:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yrQBYvy1Bq/snHYBiA89f1lJD7HBE0+TRTv53Gq+yM0=; b=YD5LZ0TBtmWu/c9Y61hAFR2+Nq
	2EGpssV2Rkyos2ya40PEO2PfkflNEWFsmdB2QKkpjebcjp+WUIcggNY4IDqIPDZ7l/l0VbvXnffLW
	KIphpo3cppQ3y0DqZNBsyaHo0tbFmrARMEiihEjGFAqlcdipewcX19NUaR7nUQxxj/iY=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v4Ulu-0000bs-N1;
	Fri, 03 Oct 2025 01:39:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1v4Ult-0000bl-DM
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Oct 2025 01:39:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TwQ4JWWywmHvG10OqEsJdzHlF2paQGZWp9/9StihkmU=; b=WLGyv9riakLDAsd34a0dp8NcgZ
 /u3lS2bWJ5EXo2c/Rg3wcn2lkTQJ87xs/fHsJFxbPcZ8SNNI85eDEpVJr+bwIrngQD7zRoHb/tcx7
 CAo0v4HgH35Hfsngfqb6JugzMU64j3ydu49Fd6Is8vcZs7Vv3Y5YK1Sr5dOt1F1RopSA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TwQ4JWWywmHvG10OqEsJdzHlF2paQGZWp9/9StihkmU=; b=csHFJnHcU5hdyaqVSmlkSv7+AF
 0jCzA+6EBg0OPK78NuTM3f67pbWq6kZLvaI2lcizCxbeNSnBO/PMVFMqy4VjizWe0RDGQhu9KVuze
 wa8WYW3+tAFRPZH4sw0IXXlp5xzBE1FG0WfN1x573ukdznaq03QadMkWfeWCuH6phOWc=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v4Uls-0005Rq-Vs for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Oct 2025 01:39:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8ECE741789;
 Fri,  3 Oct 2025 01:39:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56CDFC4CEF4;
 Fri,  3 Oct 2025 01:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759455574;
 bh=2t8WtuzSBZrNp+wg5ELsadbjX0swbzseuyJ3gNoctCA=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=OOcQlOiiSu/3uwzm422Y1tEfMH+LEPwRT8fe231g11Z51+tgEZ8FId/90tzHet8/h
 NeVYZTaqnGAkxThjaWJAmqzqLIBjUoZJdgHO2HMcyCaaxAghGuYp7YUxTh3zVc+lsf
 csC98vhNl345Mq8vErbIIy2z7D5EazbVI9TP+zQamm/lqryKUVvDYTWHqldc6detkU
 4HXbT2eE9o1JL7hdxYFf+vJ+pXIx47wtNW6HmUHR0X4squzA0NTbR3JKKfhaV29dkC
 Za+quClVGzapNtnc2kfNGLuUt9KCjexNueO9w7/zIyb5Y47t5OC96BjKB1ivyrjUV0
 oitRDQV8iQmxw==
Message-ID: <3bdcdb11-2d67-4842-b21c-2b41ce5faea9@kernel.org>
Date: Fri, 3 Oct 2025 09:39:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Haofeng Li <920484857@qq.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <tencent_3FA2C956B557ED4D050EB26922B50D3CF40A@qq.com>
Content-Language: en-US
In-Reply-To: <tencent_3FA2C956B557ED4D050EB26922B50D3CF40A@qq.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/9/30 17:16,
 Haofeng Li wrote: > From: Haofeng Li <lihaofeng@kylinos.cn>
 > > Fixes a memory leak issue in f2fs_move_inline_dirents() where > the ifolio
 is not properly released in certain error [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v4Uls-0005Rq-Vs
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix ifolio memory leak in
 f2fs_move_inline_dirents error path
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: Haofeng Li <13266079573@163.com>, Haofeng Li <lihaofeng@kylinos.cn>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2025/9/30 17:16, Haofeng Li wrote:
> From: Haofeng Li <lihaofeng@kylinos.cn>
> 
> Fixes a memory leak issue in f2fs_move_inline_dirents() where
> the ifolio is not properly released in certain error paths.
> 
> Problem Analysis:
> - In f2fs_try_convert_inline_dir(), ifolio is acquired via f2fs_get_inode_folio()
> - When do_convert_inline_dir() fails, the caller expects ifolio to be released
> - However, in f2fs_move_inline_dirents(), two specific error paths don't release ifolio
> 
> Fixes: 201a05be9628a ("f2fs: add key function to handle inline dir")
> Signed-off-by: Haofeng Li <lihaofeng@kylinos.cn>
> ---
>   fs/f2fs/inline.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
> index 58ac831ef704..2496866fc45d 100644
> --- a/fs/f2fs/inline.c
> +++ b/fs/f2fs/inline.c
> @@ -425,7 +425,7 @@ static int f2fs_move_inline_dirents(struct inode *dir, struct folio *ifolio,
>   	set_new_dnode(&dn, dir, ifolio, NULL, 0);
>   	err = f2fs_reserve_block(&dn, 0);

f2fs_reserve_block() will call f2fs_put_dnode() in its error path, it has
unlocked & released inode folio?

>   	if (err)
> -		goto out;
> +		goto out_put_ifolio;
>   
>   	if (unlikely(dn.data_blkaddr != NEW_ADDR)) {
>   		f2fs_put_dnode(&dn);

Ditto, or am I missing something?

Thanks,

> @@ -434,7 +434,7 @@ static int f2fs_move_inline_dirents(struct inode *dir, struct folio *ifolio,
>   			  __func__, dir->i_ino, dn.data_blkaddr);
>   		f2fs_handle_error(F2FS_F_SB(folio), ERROR_INVALID_BLKADDR);
>   		err = -EFSCORRUPTED;
> -		goto out;
> +		goto out_put_ifolio;
>   	}
>   
>   	f2fs_folio_wait_writeback(folio, DATA, true, true);
> @@ -479,6 +479,10 @@ static int f2fs_move_inline_dirents(struct inode *dir, struct folio *ifolio,
>   out:
>   	f2fs_folio_put(folio, true);
>   	return err;
> +
> +out_put_ifolio:
> +	f2fs_folio_put(ifolio, true);
> +	goto out;
>   }
>   
>   static int f2fs_add_inline_entries(struct inode *dir, void *inline_dentry)



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
