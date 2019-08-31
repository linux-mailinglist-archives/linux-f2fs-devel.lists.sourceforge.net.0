Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDA5A41A6
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 31 Aug 2019 04:16:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i3sw2-0003Y3-Fc; Sat, 31 Aug 2019 02:16:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1i3sw1-0003Xs-Oe
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 31 Aug 2019 02:16:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WxR1RG8TpP0BoZMwpyNTFwvKNb7sDXuX1CbPDdTMl7o=; b=KcBJUffzy2H7MwpsqlrT5oKW45
 BppZrcaqfuK0cZ+EPZlWdetMzv2S6dWIbkO2oUf1kAyI7qBG3DJ++9Eyi4cmJycSffJyYUHDks5Kk
 WI1H0EtQxxiZ7v12HW9SHs8Nps82jfUQRPdfk6CNH1cmLAfp8sMKt8yCy1NQOdoRvhBc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WxR1RG8TpP0BoZMwpyNTFwvKNb7sDXuX1CbPDdTMl7o=; b=evw813QvvGImVvBR/bpFIPendH
 ANxYnHQyTblDksKBkhFAnW4YepKIuNKGF35rDftjtb6bUznip48e3AK/QUEZ5YgTZfLJzFtfIlvJr
 5ntlERfbNezphWIN+twqq0lt8lpBoky/5mJK75Et2bjBmUhErpP8wyKlWvnkeKKFMahI=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i3svz-009zXv-So
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 31 Aug 2019 02:16:13 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id AE9B3C599C90EDFDA3D8;
 Sat, 31 Aug 2019 10:16:04 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.209) with Microsoft SMTP Server (TLS) id 14.3.439.0; Sat, 31 Aug
 2019 10:16:02 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20190830153453.24684-1-jaegeuk@kernel.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <d441bdaa-5155-3144-cdfe-01e8dcc7eff2@huawei.com>
Date: Sat, 31 Aug 2019 10:16:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190830153453.24684-1-jaegeuk@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1i3svz-009zXv-So
Subject: Re: [f2fs-dev] [PATCH] f2fs: convert inline_data in prior to
 i_size_write
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

On 2019/8/30 23:34, Jaegeuk Kim wrote:
> This can guarantee inline_data has smaller i_size.

So I guess "f2fs: fix to avoid corruption during inline conversion" didn't fix
such corruption right, I guess checkpoint & SPO before i_size recovery will
cause this issue?

	err = f2fs_convert_inline_inode(inode);
	if (err) {

-->

		/* recover old i_size */
		i_size_write(inode, old_size);
		return err;

> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

> ---
>  fs/f2fs/file.c | 25 +++++++++----------------
>  1 file changed, 9 insertions(+), 16 deletions(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 08caaead6f16..a43193dd27cb 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -815,14 +815,20 @@ int f2fs_setattr(struct dentry *dentry, struct iattr *attr)
>  
>  	if (attr->ia_valid & ATTR_SIZE) {
>  		loff_t old_size = i_size_read(inode);
> -		bool to_smaller = (attr->ia_size <= old_size);
> +
> +		if (attr->ia_size > MAX_INLINE_DATA(inode)) {
> +			/* should convert inline inode here */

Would it be better:

/* should convert inline inode here in piror to i_size_write to avoid
inconsistent status in between inline flag and i_size */

Thanks,

> +			err = f2fs_convert_inline_inode(inode);
> +			if (err)
> +				return err;
> +		}
>  
>  		down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>  		down_write(&F2FS_I(inode)->i_mmap_sem);
>  
>  		truncate_setsize(inode, attr->ia_size);
>  
> -		if (to_smaller)
> +		if (attr->ia_size <= old_size)
>  			err = f2fs_truncate(inode);
>  		/*
>  		 * do not trim all blocks after i_size if target size is
> @@ -830,24 +836,11 @@ int f2fs_setattr(struct dentry *dentry, struct iattr *attr)
>  		 */
>  		up_write(&F2FS_I(inode)->i_mmap_sem);
>  		up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> -
>  		if (err)
>  			return err;
>  
> -		if (!to_smaller) {
> -			/* should convert inline inode here */
> -			if (!f2fs_may_inline_data(inode)) {
> -				err = f2fs_convert_inline_inode(inode);
> -				if (err) {
> -					/* recover old i_size */
> -					i_size_write(inode, old_size);
> -					return err;
> -				}
> -			}
> -			inode->i_mtime = inode->i_ctime = current_time(inode);
> -		}
> -
>  		down_write(&F2FS_I(inode)->i_sem);
> +		inode->i_mtime = inode->i_ctime = current_time(inode);
>  		F2FS_I(inode)->last_disk_size = i_size_read(inode);
>  		up_write(&F2FS_I(inode)->i_sem);
>  	}
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
