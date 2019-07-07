Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6301261776
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  7 Jul 2019 22:42:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hkDyc-0008Gg-8q; Sun, 07 Jul 2019 20:41:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <darrick.wong@oracle.com>) id 1hkDya-0008GZ-Vh
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 07 Jul 2019 20:41:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tFrWHg/aAE67pxauKL0omt7gMkY1t0PbRirUnZNOjFA=; b=LE1t0x8xiG6x9ox+VDwD42Nojg
 wpn+xPHkjwbbxaIQz+Ly3nfpruYhfvLls5o2RGJSC2Ir7yUMlRHSOB5/KMP9M8fLU8eMbRF8U2vAc
 Uqq+R0hcOG3BO2dujGozyahM3CeY3by705q7uB2SYmFOsfUxh4oahoMnn65yX1N/As9g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tFrWHg/aAE67pxauKL0omt7gMkY1t0PbRirUnZNOjFA=; b=HxehURwzYOyMaPkn3pI8bArVlf
 zThUlPn3tkk+alJ40SQMZfxr9zDmP2mq0JHV2qdrqDAiA0jvQElNEd/+Rt8RjWwh5FApMebq+ILHe
 7n7ahHMhDbS+Eib54GVJH0DUAXamEiYdVWwticKhTquM1XOygheZqdV3mW/7R8KBrJkk=;
Received: from userp2120.oracle.com ([156.151.31.85])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hkDyr-009PGQ-ML
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 07 Jul 2019 20:41:58 +0000
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x67Kdg6j040664;
 Sun, 7 Jul 2019 20:41:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=tFrWHg/aAE67pxauKL0omt7gMkY1t0PbRirUnZNOjFA=;
 b=BFEbX3npPed4HkYp+Np8xDXCIBvbU4jZUtYeTUf4rGO4CCrpJn8aMtXHx2qnWARtQwj9
 qk83CNMM/r2f10EVrcytEf96lHRdz1o6++hrMKFFGB/ey+aBdknesc9PWBfAC8Rngemt
 ZCV9wQ+k0ZpxY+KbQuexV+j/OP30UN5bm9loeCLOZuTTJDIO6/6i2LL5K1OLn6st/Y8n
 Ss4qtasRWvPWx37PZbSPFlgaNl77uma1leMPoBl5LoLo0ChXhV1TWbidOr3m/VX7Okhw
 l6pIDMnIctEFgjlmlKQYHL8wUoZcnkV3VbcxkZBa+8vbwUxD6U48M1qHKwx7qdAYoG2D xg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 2tjm9qb80k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 07 Jul 2019 20:41:44 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x67KcIiB014195;
 Sun, 7 Jul 2019 20:41:44 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 2tjjyjx0mw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 07 Jul 2019 20:41:44 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x67Kfh0C018360;
 Sun, 7 Jul 2019 20:41:43 GMT
Received: from localhost (/67.169.218.210)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Sun, 07 Jul 2019 13:41:43 -0700
Date: Sun, 7 Jul 2019 13:41:39 -0700
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20190707204139.GJ1654093@magnolia>
References: <20190701202630.43776-1-ebiggers@kernel.org>
 <20190701202630.43776-3-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190701202630.43776-3-ebiggers@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9311
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1907070289
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9311
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1907070289
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hkDyr-009PGQ-ML
Subject: Re: [f2fs-dev] [PATCH 2/3] f2fs: use generic checking function for
 FS_IOC_FSSETXATTR
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
Cc: linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jul 01, 2019 at 01:26:29PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Make the f2fs implementation of FS_IOC_FSSETXATTR use the new VFS helper
> function vfs_ioc_fssetxattr_check(), and remove the project quota check
> since it's now done by the helper function.
> 
> This is based on a patch from Darrick Wong, but reworked to apply after
> commit 360985573b55 ("f2fs: separate f2fs i_flags from fs_flags and ext4
> i_flags").
> 
> Originally-from: Darrick J. Wong <darrick.wong@oracle.com>
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Looks ok,
Reviewed-by: Darrick J. Wong <darrick.wong@oracle.com>

--D

> ---
>  fs/f2fs/file.c | 45 ++++++++++++++-------------------------------
>  1 file changed, 14 insertions(+), 31 deletions(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index b5b941e6448657..ae1a54ecc9fccc 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -2857,52 +2857,32 @@ static inline u32 f2fs_xflags_to_iflags(u32 xflags)
>  	return iflags;
>  }
>  
> -static int f2fs_ioc_fsgetxattr(struct file *filp, unsigned long arg)
> +static void f2fs_fill_fsxattr(struct inode *inode, struct fsxattr *fa)
>  {
> -	struct inode *inode = file_inode(filp);
>  	struct f2fs_inode_info *fi = F2FS_I(inode);
> -	struct fsxattr fa;
>  
> -	memset(&fa, 0, sizeof(struct fsxattr));
> -	fa.fsx_xflags = f2fs_iflags_to_xflags(fi->i_flags);
> +	simple_fill_fsxattr(fa, f2fs_iflags_to_xflags(fi->i_flags));
>  
>  	if (f2fs_sb_has_project_quota(F2FS_I_SB(inode)))
> -		fa.fsx_projid = (__u32)from_kprojid(&init_user_ns,
> -							fi->i_projid);
> -
> -	if (copy_to_user((struct fsxattr __user *)arg, &fa, sizeof(fa)))
> -		return -EFAULT;
> -	return 0;
> +		fa->fsx_projid = from_kprojid(&init_user_ns, fi->i_projid);
>  }
>  
> -static int f2fs_ioctl_check_project(struct inode *inode, struct fsxattr *fa)
> +static int f2fs_ioc_fsgetxattr(struct file *filp, unsigned long arg)
>  {
> -	/*
> -	 * Project Quota ID state is only allowed to change from within the init
> -	 * namespace. Enforce that restriction only if we are trying to change
> -	 * the quota ID state. Everything else is allowed in user namespaces.
> -	 */
> -	if (current_user_ns() == &init_user_ns)
> -		return 0;
> -
> -	if (__kprojid_val(F2FS_I(inode)->i_projid) != fa->fsx_projid)
> -		return -EINVAL;
> +	struct inode *inode = file_inode(filp);
> +	struct fsxattr fa;
>  
> -	if (F2FS_I(inode)->i_flags & F2FS_PROJINHERIT_FL) {
> -		if (!(fa->fsx_xflags & FS_XFLAG_PROJINHERIT))
> -			return -EINVAL;
> -	} else {
> -		if (fa->fsx_xflags & FS_XFLAG_PROJINHERIT)
> -			return -EINVAL;
> -	}
> +	f2fs_fill_fsxattr(inode, &fa);
>  
> +	if (copy_to_user((struct fsxattr __user *)arg, &fa, sizeof(fa)))
> +		return -EFAULT;
>  	return 0;
>  }
>  
>  static int f2fs_ioc_fssetxattr(struct file *filp, unsigned long arg)
>  {
>  	struct inode *inode = file_inode(filp);
> -	struct fsxattr fa;
> +	struct fsxattr fa, old_fa;
>  	u32 iflags;
>  	int err;
>  
> @@ -2925,9 +2905,12 @@ static int f2fs_ioc_fssetxattr(struct file *filp, unsigned long arg)
>  		return err;
>  
>  	inode_lock(inode);
> -	err = f2fs_ioctl_check_project(inode, &fa);
> +
> +	f2fs_fill_fsxattr(inode, &old_fa);
> +	err = vfs_ioc_fssetxattr_check(inode, &old_fa, &fa);
>  	if (err)
>  		goto out;
> +
>  	err = f2fs_setflags_common(inode, iflags,
>  			f2fs_xflags_to_iflags(F2FS_SUPPORTED_XFLAGS));
>  	if (err)
> -- 
> 2.22.0.410.gd8fdbe21b5-goog
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
