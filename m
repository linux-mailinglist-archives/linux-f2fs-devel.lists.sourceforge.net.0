Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AABC7C34392
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 05 Nov 2025 08:28:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sCyyJpvMOTKDsNWM+eAkMIjBZEHZJh3mtQyTa2mVA2M=; b=KCfetHRw3tPgGSGevqek+Aqo4q
	cX293rtkVDXi6wzfQsk9/ESsRvNk7k4ViaX0HJ5cqfpbXiK3tO0I3iluv41jXR2VaUCneFPWili9O
	K7NIytqjpola2dM7J2fvVrwXA/q0Iexiwe8VEdw9Phvy/Yslp5rOURSx+0Vj6OswV7SA=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vGXwI-0008F2-An;
	Wed, 05 Nov 2025 07:28:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vGXw4-0008Eo-KO
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Nov 2025 07:28:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BreZaN33PZ598yGnZg7QsvDIJF1kUGpCYcH++rzYwDI=; b=UrL7n1z9EIc/F2DD6DjFVKd4uX
 HgHXnnScDIQNBXteVzoG53WjQhc2Oi14X2sv230ZQrNKh7IunPqa8mbI/GPFDfetXmyuL7YCcNEyr
 hinfXsA4P3I2ygT10IZVr6ByMBjJe6cv/3kJJTC13vsk8F4UC82FlE3dsJEm+gqqJfMc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BreZaN33PZ598yGnZg7QsvDIJF1kUGpCYcH++rzYwDI=; b=ENwY5bQlUcET2/6Hp4ZZLWabFX
 fFP19tZyDAgxYUI9XGs3ifym36jWT7n4AzJEzeK/LdgOHs8vRD/gWJI9HWnpIlHeVsYvcwCcSLnH9
 zRdrXF8XALzRsbD+wLGEWBP8kJ7OwunOejxLnxSxRo+wQZSrIqEOfrWN8wlGWpPYk6ww=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vGXw4-0007sz-1n for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Nov 2025 07:28:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7BEA5441F6;
 Wed,  5 Nov 2025 07:27:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4709CC4CEF8;
 Wed,  5 Nov 2025 07:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762327673;
 bh=EhjlRgr0Zz3gYIc8lUoq4HU98swwwkkjz5E00lxldWk=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=EDwZRhO1fIvJOYYFu75knuac2cdZexAfjfMIpqAoj12aYTS5E121G2z5axjjFqYC4
 I95IuKH9Af8ea9W5yVQlY8J376LJMoe8jBQ8VGRAD577bbni1QaSGZY8eq0rnirZjv
 rxawhV8/DwUTtZLFfVlYbtlU/t3k8pso3s7NKn4eB0XNBrkM4JjN5VPYaul617iVHM
 XalUcxnbIkEdgBTMBZP3nCmfFaJiQSTNOq0nq3UAeMTlP4KcBdM6/au/XlMfD8vPQR
 YXRaQRnCibxr4Liy+88hZAzTNBRslXUXChgTh/3D5CWppXdWFeO8/UHVoLxn3XqRFw
 u+2GGOzeNnYgQ==
Message-ID: <4de88613-54a2-4ef3-9b56-7963cd3e42e6@kernel.org>
Date: Wed, 5 Nov 2025 15:27:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Nikola Z. Ivanov" <zlatistiv@gmail.com>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <cover.1762184787.git.zlatistiv@gmail.com>
 <ef5cfc5cee26e34586e7415de41d865a360e0d98.1762184787.git.zlatistiv@gmail.com>
Content-Language: en-US
In-Reply-To: <ef5cfc5cee26e34586e7415de41d865a360e0d98.1762184787.git.zlatistiv@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/4/25 16:46, Nikola Z. Ivanov wrote: > Add check for
 inode->i_nlink == 1 for directories during unlink,
 > as their value is decremented
 twice, which can trigger a warning in > drop_nlink. In such [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vGXw4-0007sz-1n
Subject: Re: [f2fs-dev] [PATCH v3 2/2] f2fs: Add sanity checks before
 unlinking and loading inodes
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/4/25 16:46, Nikola Z. Ivanov wrote:
> Add check for inode->i_nlink == 1 for directories during unlink,
> as their value is decremented twice, which can trigger a warning in
> drop_nlink. In such case mark the filesystem as corrupted and return
> from the function call with the relevant failure return value.
> 
> Additionally add the check for i_nlink == 1 in
> sanity_check_inode in order to detect on-disk corruption early.
> 

Cc: stable@kernel.org

> Reported-by: syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=c07d47c7bc68f47b9083
> Tested-by: syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com
> Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>
> ---
>  fs/f2fs/inode.c |  6 ++++++
>  fs/f2fs/namei.c | 15 +++++++++++----
>  2 files changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> index 8c4eafe9ffac..b808e1dc2ae7 100644
> --- a/fs/f2fs/inode.c
> +++ b/fs/f2fs/inode.c
> @@ -294,6 +294,12 @@ static bool sanity_check_inode(struct inode *inode, struct folio *node_folio)
>  		return false;
>  	}
>  
> +	if (S_ISDIR(inode->i_mode) && unlikely(inode->i_nlink == 1)) {
> +		f2fs_warn(F2FS_I_SB(inode), "%s: directory inode (ino=%lx) has a single i_nlink",

s/F2FS_I_SB(inode)/sbi

> +			  __func__, inode->i_ino);
> +		return false;
> +	}
> +
>  	if (f2fs_has_extra_attr(inode)) {
>  		if (!f2fs_sb_has_extra_attr(sbi)) {
>  			f2fs_warn(sbi, "%s: inode (ino=%lx) is with extra_attr, but extra_attr feature is off",
> diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
> index 40cf80fd9d9a..65af1d56a99e 100644
> --- a/fs/f2fs/namei.c
> +++ b/fs/f2fs/namei.c
> @@ -572,10 +572,11 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
>  	if (unlikely(inode->i_nlink == 0)) {
>  		f2fs_warn(F2FS_I_SB(inode), "%s: inode (ino=%lx) has zero i_nlink",
>  			  __func__, inode->i_ino);
> -		err = -EFSCORRUPTED;
> -		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
> -		f2fs_folio_put(folio, false);
> -		goto out;
> +		goto corrupted;
> +	} else if (S_ISDIR(inode->i_mode) && unlikely(inode->i_nlink == 1)) {
> +		f2fs_warn(F2FS_I_SB(inode), "%s: directory inode (ino=%lx) has a single i_nlink",

Ditto,

> +			  __func__, inode->i_ino);
> +		goto corrupted;
>  	}
>  
>  	f2fs_balance_fs(sbi, true);
> @@ -601,6 +602,12 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
>  
>  	if (IS_DIRSYNC(dir))
>  		f2fs_sync_fs(sbi->sb, 1);
> +
> +	goto out;
> +corrupted:
> +	err = -EFSCORRUPTED;
> +	set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);

Ditto,

Thanks,

> +	f2fs_folio_put(folio, false);
>  out:
>  	trace_f2fs_unlink_exit(inode, err);
>  	return err;



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
