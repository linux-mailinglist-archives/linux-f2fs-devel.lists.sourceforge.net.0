Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BB69A17B41E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Mar 2020 02:59:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jA2H3-0002TO-PE; Fri, 06 Mar 2020 01:59:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jA2H0-0002St-Cf
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Mar 2020 01:59:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=enWO7ZdqKDunipiE6KYyxoMigaSFs51tIz5SiYrvzdU=; b=e+B5JVixvYU2gu4rxipExz38Dg
 7AyMKZAlSGlYWEX7UGlqaQkNj7QWS9VkLv9QBUoN1lIvedKe47PAnGE/tkzuvB/YX37bDv/dzs9LX
 CTrkjHlxsuO2Ls6eIRTpnd5JRsrlOlzv5YzTvwvRoQWM91fOmGAvVSN9txnL4J+HX0Wk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=enWO7ZdqKDunipiE6KYyxoMigaSFs51tIz5SiYrvzdU=; b=HgtqJhRER6zdSdIjUGP7jXYa69
 Wqy+TXQP3gHl9hy4omCtNWwdIowT2xmmVhPDQBKPfCTvo1/lYqUixkFwkRZxFmLN+aIPYj2N6306l
 QYk5Bthkqw9SmOmkQxeofVutgPkUxfDDeDL28GjsMErtPQxXzU6Xdy06a1/0+NB+uVLg=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jA2Gw-00HWd8-9k
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Mar 2020 01:59:34 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 0297F88034623412B26A;
 Fri,  6 Mar 2020 09:39:06 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.201) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 6 Mar 2020
 09:39:04 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20200305234822.178708-1-jaegeuk@kernel.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <1e8389fb-2416-d191-cdb3-cd4714ed7756@huawei.com>
Date: Fri, 6 Mar 2020 09:39:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200305234822.178708-1-jaegeuk@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1jA2Gw-00HWd8-9k
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix wrong check on F2FS_IOC_FSSETXATTR
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
Cc: Daniel Rosenberg <drosen@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/3/6 7:48, Jaegeuk Kim wrote:
> This fixes the incorrect failure when enabling project quota on casefold-enabled
> file.
> 
> Cc: Daniel Rosenberg <drosen@google.com>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/file.c | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index fb070816a8a5..8a41afac0346 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -1789,12 +1789,15 @@ static int f2fs_file_flush(struct file *file, fl_owner_t id)
>  static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
>  {
>  	struct f2fs_inode_info *fi = F2FS_I(inode);
> +	u32 masked_flags = fi->i_flags & mask;
> +
> +	f2fs_bug_on(F2FS_I_SB(inode), (iflags & ~mask));
>  
>  	/* Is it quota file? Do not allow user to mess with it */
>  	if (IS_NOQUOTA(inode))
>  		return -EPERM;
>  
> -	if ((iflags ^ fi->i_flags) & F2FS_CASEFOLD_FL) {
> +	if ((iflags ^ masked_flags) & F2FS_CASEFOLD_FL) {
>  		if (!f2fs_sb_has_casefold(F2FS_I_SB(inode)))
>  			return -EOPNOTSUPP;
>  		if (!f2fs_empty_dir(inode))
> @@ -1808,9 +1811,9 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
>  			return -EINVAL;
>  	}
>  
> -	if ((iflags ^ fi->i_flags) & F2FS_COMPR_FL) {
> +	if ((iflags ^ masked_flags) & F2FS_COMPR_FL) {
>  		if (S_ISREG(inode->i_mode) &&
> -			(fi->i_flags & F2FS_COMPR_FL || i_size_read(inode) ||
> +			(masked_flags & F2FS_COMPR_FL || i_size_read(inode) ||
>  						F2FS_HAS_BLOCKS(inode)))
>  			return -EINVAL;
>  		if (iflags & F2FS_NOCOMP_FL)
> @@ -1827,16 +1830,16 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
>  			set_compress_context(inode);
>  		}
>  	}
> -	if ((iflags ^ fi->i_flags) & F2FS_NOCOMP_FL) {
> -		if (fi->i_flags & F2FS_COMPR_FL)
> +	if ((iflags ^ masked_flags) & F2FS_NOCOMP_FL) {
> +		if (masked_flags & F2FS_COMPR_FL)
>  			return -EINVAL;
>  	}
>  
>  	fi->i_flags = iflags | (fi->i_flags & ~mask);
> -	f2fs_bug_on(F2FS_I_SB(inode), (fi->i_flags & F2FS_COMPR_FL) &&
> -					(fi->i_flags & F2FS_NOCOMP_FL));
> +	f2fs_bug_on(F2FS_I_SB(inode), (masked_flags & F2FS_COMPR_FL) &&
> +					(masked_flags & F2FS_NOCOMP_FL));

We don't need to change here due to we should check final status in fi->i_flags
rather than checking previous status in masked_flags?

>  
> -	if (fi->i_flags & F2FS_PROJINHERIT_FL)
> +	if (masked_flags & F2FS_PROJINHERIT_FL)

Ditto.

Thanks,

>  		set_inode_flag(inode, FI_PROJ_INHERIT);
>  	else
>  		clear_inode_flag(inode, FI_PROJ_INHERIT);
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
