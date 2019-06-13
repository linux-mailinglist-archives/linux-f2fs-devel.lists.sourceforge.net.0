Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 181344330F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 13 Jun 2019 09:09:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hbJrk-0002Mv-Fx; Thu, 13 Jun 2019 07:09:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hbJrj-0002MG-0b
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 13 Jun 2019 07:09:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0klQn5ySzeEawnJDhTovmEbEV6thriLUQzThfbijIJY=; b=CFCMkygOKoGS8iBzx+sDc/2PHR
 hqAvrktvB7oVdapc6Z8zcOUNCDi7alGkSP3e3gJvJ5H4MXwtQKdUWguYV/Zgr/gv3yt2HCxoNYr+X
 seRzDSq9/wjvdayiD+p6VTnhZvzLSNb9q2FpnuUqMMY1pdCZqXIcDv5O3eyVzfk81Kjc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0klQn5ySzeEawnJDhTovmEbEV6thriLUQzThfbijIJY=; b=W0l4ZX1ZrnYmFJ+553wlFkcx4+
 slvO3xTS3DFMczimdwGHYEWIUgMxqv2YTq2ma1i82sv69ghZcRuMdNFJF5fEmmZPKI1T0AnGcjCVR
 7liblFg/O2TZLENZ8qe+/sCcSR6OyBDL7tyj0eKBVq1wT9x+t+dPNF1qpgei+XhPjKWA=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hbJre-00Bb8J-KE
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 13 Jun 2019 07:09:40 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 1ABB06BE73A68DD261B2;
 Thu, 13 Jun 2019 15:09:28 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.211) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 13 Jun
 2019 15:09:25 +0800
To: Randall Huang <huangrandall@google.com>, <jaegeuk@kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <linux-kernel@vger.kernel.org>
References: <20190612085800.11947-1-huangrandall@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <e54b84ee-39a3-c518-8c9b-192fb9a92d27@huawei.com>
Date: Thu, 13 Jun 2019 15:09:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190612085800.11947-1-huangrandall@google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hbJre-00Bb8J-KE
Subject: Re: [f2fs-dev] [PATCH] f2fs: add boundary check in inline_data_addr
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Randall,

On 2019/6/12 16:58, Randall Huang wrote:
> Add boundary check in case of extra_size is larger
> than sizeof array "i_addr"
> 
> Signed-off-by: Randall Huang <huangrandall@google.com>
> ---
>  fs/f2fs/f2fs.h | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 760390f380b6..17f3858a00c3 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -2660,11 +2660,25 @@ static inline bool f2fs_is_drop_cache(struct inode *inode)
>  	return is_inode_flag_set(inode, FI_DROP_CACHE);
>  }
>  
> +#define F2FS_TOTAL_EXTRA_ATTR_SIZE			\
> +	(offsetof(struct f2fs_inode, i_extra_end) -	\
> +	offsetof(struct f2fs_inode, i_extra_isize))	\
> +
>  static inline void *inline_data_addr(struct inode *inode, struct page *page)
>  {
>  	struct f2fs_inode *ri = F2FS_INODE(page);
>  	int extra_size = get_extra_isize(inode);
>  
> +	if (extra_size < 0 || extra_size > F2FS_TOTAL_EXTRA_ATTR_SIZE ||
> +		extra_size % sizeof(__le32)) {
> +		f2fs_msg(F2FS_I_SB(inode)->sb, KERN_ERR,
> +			"%s: inode (ino=%lx) has corrupted i_extra_isize: %d, "
> +			"max: %zu",
> +			__func__, inode->i_ino, extra_size,
> +			F2FS_TOTAL_EXTRA_ATTR_SIZE);
> +		extra_size = 0;
> +	}

Oh, we have already did the sanity check on .i_extra_isize field in
sanity_check_inode(), why can it be changed after that? bit-transition of cache
or memory overflow?

Thanks,

> +
>  	return (void *)&(ri->i_addr[extra_size + DEF_INLINE_RESERVED_SIZE]);
>  }
>  
> @@ -2817,10 +2831,6 @@ static inline int get_inline_xattr_addrs(struct inode *inode)
>  	((is_inode_flag_set(i, FI_ACL_MODE)) ? \
>  	 (F2FS_I(i)->i_acl_mode) : ((i)->i_mode))
>  
> -#define F2FS_TOTAL_EXTRA_ATTR_SIZE			\
> -	(offsetof(struct f2fs_inode, i_extra_end) -	\
> -	offsetof(struct f2fs_inode, i_extra_isize))	\
> -
>  #define F2FS_OLD_ATTRIBUTE_SIZE	(offsetof(struct f2fs_inode, i_addr))
>  #define F2FS_FITS_IN_INODE(f2fs_inode, extra_isize, field)		\
>  		((offsetof(typeof(*(f2fs_inode)), field) +	\
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
