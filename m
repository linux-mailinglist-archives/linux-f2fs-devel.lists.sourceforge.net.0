Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B56B2BC73F5
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 09 Oct 2025 04:55:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tXB5FZs4HcLsPMMD0eEqRl9cNJrfliVaQqLfOe2PlHg=; b=gwvJWG9Kz0z10rNzX2ga4L/TMB
	8tis3VHgY26diXwCyrYQ4cwz5M4Qt95p8cWs+12paGIDYCvT7aIT197Lh6c6tQlOGM3VPZc6thkNz
	/I4pAeqkJjditqPA0BHaAj/gN6AXe/LXtM2KFduoupesTzunU6cWUyoF+9I3RK5c99Y8=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v6gnt-0006Rb-1D;
	Thu, 09 Oct 2025 02:54:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1v6gnm-0006RQ-Hj
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Oct 2025 02:54:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DZ7Q7MpWX+O88TdNvGkKlCOR7/xj37VGLKkOnUI0uNE=; b=SA+zrbTsi48ZZlIMXs6cwo/w73
 El9zai3gL1Rh3uEZdgkXH7S4A4qgx4Q9Qvzq24St28ZaaDIpzPaqtTCFQum7z5X+JMbc9l0vpUTLK
 q4E0TvXtB6RJNFuJSr47QBNFIsuP79ZZ6RE3fmtDYjUf6NkC3lsHcDbQ7GvpIG/8IINE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DZ7Q7MpWX+O88TdNvGkKlCOR7/xj37VGLKkOnUI0uNE=; b=m4l3qgeov+FTXs3jTwjal96/3u
 0MEok1fhQnXnWD5LPO0/STU+HTAC+0aAqbJjeBSeY48OlCGZiFApblvWJx/8YHjAQKe+etHZ9QTjg
 PNoZv1YWvpIz+H3C/F5jiyRt3oEaVhpvO+Ea8VAtb6T8DPvrL1SwevNSQfufSP99eFlA=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v6gnl-0004kf-Tr for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Oct 2025 02:54:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3F360604B9;
 Thu,  9 Oct 2025 02:54:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20C88C4CEE7;
 Thu,  9 Oct 2025 02:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759978479;
 bh=kU5PxDxBp1d0PsDmsVzbq+Nz2rncNHm3ujLYt76sjLY=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=F2YBtp+Hr7oeHB53LuWJDS2ZGtvsB+33yOPbkCZnPdlGUCr+7nl13LNGL7JLJrANq
 /HN03mDlHraJQe0zByt9dNNuT/AhAw3P9ekE+/bTkWCXcehaHinwvM8WrS9Ys1SfRy
 VAGQhlYRXyuSJ6xtbLxU8OYlpw56DWeIl8YR2hv8Qp5CAx6kCQih6Vm6jSUwJi+vLB
 9Tk5fF3JLFXzHNtf1CZI8YRguU/Giyl3RSvCRHBV8LOy372zE6ZP3vTLeIfxIasnHP
 6pXWuimXc/i41MG2V6mtvKiRlsLuj+A86EcxPoB33DDYFkOzeevSunBV3aOWIieW5t
 X6i8b6fMugG0g==
Message-ID: <839306c1-5f7a-4e89-b2cf-7534d279a03c@kernel.org>
Date: Thu, 9 Oct 2025 10:54:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Nikola Z. Ivanov" <zlatistiv@gmail.com>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20251003134731.470392-1-zlatistiv@gmail.com>
Content-Language: en-US
In-Reply-To: <20251003134731.470392-1-zlatistiv@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/3/2025 9:47 PM,
 Nikola Z. Ivanov wrote: > Current i_nlink
 corruption check does not take into account > directory inodes which have
 one additional i_nlink for their "." entry. > > Add additional [...] 
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
X-Headers-End: 1v6gnl-0004kf-Tr
Subject: Re: [f2fs-dev] [PATCH] f2fs: Perform sanity check before unlinking
 directory inode
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
Cc: david.hunter.linux@gmail.com,
 syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, khalid@kernel.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 10/3/2025 9:47 PM, Nikola Z. Ivanov wrote:
> Current i_nlink corruption check does not take into account
> directory inodes which have one additional i_nlink for their "." entry.
> 
> Add additional check and a common corruption path.
> 
> Reported-by: syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=c07d47c7bc68f47b9083
> Fixes: 81edb983b3f5 ("f2fs: add check for deleted inode")
> Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>
> ---
>   fs/f2fs/namei.c | 28 ++++++++++++++++++++--------
>   1 file changed, 20 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
> index b882771e4699..68b33e8089b0 100644
> --- a/fs/f2fs/namei.c
> +++ b/fs/f2fs/namei.c
> @@ -502,12 +502,14 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
>   		goto out;
>   	}
>   
> -	if (inode->i_nlink == 0) {
> +	if (unlikely(inode->i_nlink == 0)) {
>   		f2fs_warn(F2FS_I_SB(inode), "%s: inode (ino=%lx) has zero i_nlink",
>   			  __func__, inode->i_ino);
> -		err = -EFSCORRUPTED;
> -		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
> -		goto out_iput;
> +		goto corrupted;
> +	} else if (unlikely(S_ISDIR(inode->i_mode) && inode->i_nlink == 1)) {
> +		f2fs_warn(F2FS_I_SB(inode), "%s: directory inode (ino=%lx) has a single i_nlink",
> +			  __func__, inode->i_ino);
> +		goto corrupted;

Can we detect such corruption in sanity_check_inode() as well? So that if
f2fs internal flow calls f2fs_iget() on corrupted inode, we can set SBI_NEED_FSCK
flag and then triggering fsck repairment later.

Thanks,

>   	}
>   
>   	if (IS_ENCRYPTED(dir) &&
> @@ -533,6 +535,9 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
>   	trace_f2fs_lookup_end(dir, !IS_ERR_OR_NULL(new) ? new : dentry,
>   				ino, IS_ERR(new) ? PTR_ERR(new) : err);
>   	return new;
> +corrupted:
> +	err = -EFSCORRUPTED;
> +	set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
>   out_iput:
>   	iput(inode);
>   out:
> @@ -572,10 +577,11 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
>   	if (unlikely(inode->i_nlink == 0)) {
>   		f2fs_warn(F2FS_I_SB(inode), "%s: inode (ino=%lx) has zero i_nlink",
>   			  __func__, inode->i_ino);
> -		err = -EFSCORRUPTED;
> -		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
> -		f2fs_folio_put(folio, false);
> -		goto fail;
> +		goto corrupted;
> +	} else if (unlikely(S_ISDIR(inode->i_mode) && inode->i_nlink == 1)) {
> +		f2fs_warn(F2FS_I_SB(inode), "%s: directory inode (ino=%lx) has a single i_nlink",
> +			  __func__, inode->i_ino);
> +		goto corrupted;
>   	}
>   
>   	f2fs_balance_fs(sbi, true);
> @@ -601,6 +607,12 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
>   
>   	if (IS_DIRSYNC(dir))
>   		f2fs_sync_fs(sbi->sb, 1);
> +
> +	goto fail;
> +corrupted:
> +	err = -EFSCORRUPTED;
> +	set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
> +	f2fs_folio_put(folio, false);
>   fail:
>   	trace_f2fs_unlink_exit(inode, err);
>   	return err;



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
