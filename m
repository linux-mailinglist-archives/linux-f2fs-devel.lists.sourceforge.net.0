Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F30E37EE77
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  2 Aug 2019 10:10:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1htSe2-0002wn-9d; Fri, 02 Aug 2019 08:10:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1htSe1-0002wP-3o
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 02 Aug 2019 08:10:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BmjSmeq720AcxHjuio8SH0/a4IXxYC65AdGeznHqZ2M=; b=il9Rg0tfOLUziM8BOYkbqXTEhj
 5XsYZ8ohr+9kkdLPZTldnbIJWzOGHNWoa05i2Nthot0rGIlVsm/5WiCiUk/gqD2sRE4SQcEkSPsje
 OLy35Y70cEKaY01j41Wgu3poAgjgC1JiW1vwIgPNnJyMJWmXTe9ZoWnTj9GGf8qe6WEw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BmjSmeq720AcxHjuio8SH0/a4IXxYC65AdGeznHqZ2M=; b=h3VZi5EDdA/T60l4mKKwR6GgPY
 bQu6OvSd7myaZZXLwYB5y1CgGsRsihFYyuXvql4yVTXOHkT9PcT8qPS4mGcAi9vtkNgdF8KKF7lGk
 7gEDuaFEG5RuHmDOu8ySxKCSPWsJ8VIyBzZgD1005mMHTzUFVsKA1cYTArlIFBty1HJc=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1htSdx-007tct-2L
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 02 Aug 2019 08:10:33 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id BB2431235F7661B2BA51;
 Fri,  2 Aug 2019 16:10:21 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.213) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 2 Aug 2019
 16:10:17 +0800
To: Eric Biggers <ebiggers@kernel.org>, <linux-fscrypt@vger.kernel.org>
References: <20190726224141.14044-1-ebiggers@kernel.org>
 <20190726224141.14044-15-ebiggers@kernel.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <e3cf53a7-faf2-0321-22de-07d2e2783752@huawei.com>
Date: Fri, 2 Aug 2019 16:10:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190726224141.14044-15-ebiggers@kernel.org>
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
X-Headers-End: 1htSdx-007tct-2L
Subject: Re: [f2fs-dev] [PATCH v7 14/16] f2fs: wire up new fscrypt ioctls
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
Cc: Satya Tangirala <satyat@google.com>, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, keyrings@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Eric,

On 2019/7/27 6:41, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Wire up the new ioctls for adding and removing fscrypt keys to/from the
> filesystem, and the new ioctl for retrieving v2 encryption policies.
> 
> FS_IOC_REMOVE_ENCRYPTION_KEY also required making f2fs_drop_inode() call
> fscrypt_drop_inode().
> 
> For more details see Documentation/filesystems/fscrypt.rst and the
> fscrypt patches that added the implementation of these ioctls.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

BTW, do you think it needs to make xxfs_has_support_encrypt() function be a
common interface defined in struct fscrypt_operations, as I see all
fscrypt_ioctl_*() needs to check with it, tho such cleanup is minor...

Thanks,

> ---
>  fs/f2fs/file.c  | 46 ++++++++++++++++++++++++++++++++++++++++++++++
>  fs/f2fs/super.c |  2 ++
>  2 files changed, 48 insertions(+)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index f8d46df8fa9ee..d81dda290b829 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -2184,6 +2184,40 @@ static int f2fs_ioc_get_encryption_pwsalt(struct file *filp, unsigned long arg)
>  	return err;
>  }
>  
> +static int f2fs_ioc_get_encryption_policy_ex(struct file *filp,
> +					     unsigned long arg)
> +{
> +	if (!f2fs_sb_has_encrypt(F2FS_I_SB(file_inode(filp))))
> +		return -EOPNOTSUPP;
> +
> +	return fscrypt_ioctl_get_policy_ex(filp, (void __user *)arg);
> +}
> +
> +static int f2fs_ioc_add_encryption_key(struct file *filp, unsigned long arg)
> +{
> +	if (!f2fs_sb_has_encrypt(F2FS_I_SB(file_inode(filp))))
> +		return -EOPNOTSUPP;
> +
> +	return fscrypt_ioctl_add_key(filp, (void __user *)arg);
> +}
> +
> +static int f2fs_ioc_remove_encryption_key(struct file *filp, unsigned long arg)
> +{
> +	if (!f2fs_sb_has_encrypt(F2FS_I_SB(file_inode(filp))))
> +		return -EOPNOTSUPP;
> +
> +	return fscrypt_ioctl_remove_key(filp, (const void __user *)arg);
> +}
> +
> +static int f2fs_ioc_get_encryption_key_status(struct file *filp,
> +					      unsigned long arg)
> +{
> +	if (!f2fs_sb_has_encrypt(F2FS_I_SB(file_inode(filp))))
> +		return -EOPNOTSUPP;
> +
> +	return fscrypt_ioctl_get_key_status(filp, (void __user *)arg);
> +}
> +
>  static int f2fs_ioc_gc(struct file *filp, unsigned long arg)
>  {
>  	struct inode *inode = file_inode(filp);
> @@ -3109,6 +3143,14 @@ long f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>  		return f2fs_ioc_get_encryption_policy(filp, arg);
>  	case F2FS_IOC_GET_ENCRYPTION_PWSALT:
>  		return f2fs_ioc_get_encryption_pwsalt(filp, arg);
> +	case FS_IOC_GET_ENCRYPTION_POLICY_EX:
> +		return f2fs_ioc_get_encryption_policy_ex(filp, arg);
> +	case FS_IOC_ADD_ENCRYPTION_KEY:
> +		return f2fs_ioc_add_encryption_key(filp, arg);
> +	case FS_IOC_REMOVE_ENCRYPTION_KEY:
> +		return f2fs_ioc_remove_encryption_key(filp, arg);
> +	case FS_IOC_GET_ENCRYPTION_KEY_STATUS:
> +		return f2fs_ioc_get_encryption_key_status(filp, arg);
>  	case F2FS_IOC_GARBAGE_COLLECT:
>  		return f2fs_ioc_gc(filp, arg);
>  	case F2FS_IOC_GARBAGE_COLLECT_RANGE:
> @@ -3236,6 +3278,10 @@ long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>  	case F2FS_IOC_SET_ENCRYPTION_POLICY:
>  	case F2FS_IOC_GET_ENCRYPTION_PWSALT:
>  	case F2FS_IOC_GET_ENCRYPTION_POLICY:
> +	case FS_IOC_GET_ENCRYPTION_POLICY_EX:
> +	case FS_IOC_ADD_ENCRYPTION_KEY:
> +	case FS_IOC_REMOVE_ENCRYPTION_KEY:
> +	case FS_IOC_GET_ENCRYPTION_KEY_STATUS:
>  	case F2FS_IOC_GARBAGE_COLLECT:
>  	case F2FS_IOC_GARBAGE_COLLECT_RANGE:
>  	case F2FS_IOC_WRITE_CHECKPOINT:
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 6de6cda440315..f5fae8d511a20 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -913,6 +913,8 @@ static int f2fs_drop_inode(struct inode *inode)
>  		return 0;
>  	}
>  	ret = generic_drop_inode(inode);
> +	if (!ret)
> +		ret = fscrypt_drop_inode(inode);
>  	trace_f2fs_drop_inode(inode, ret);
>  	return ret;
>  }
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
