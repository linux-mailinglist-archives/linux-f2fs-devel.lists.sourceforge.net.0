Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BDD2E0727
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Dec 2020 09:25:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1krcyu-0006U8-GN; Tue, 22 Dec 2020 08:25:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1krcys-0006Tu-UG
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Dec 2020 08:25:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7ruw6zzzBZZAjLqLpwQEsTFaW6Pz6q8xuc9DB2wYuQQ=; b=mZK0EO8Vq7NN1MNZdT33Me3rc0
 H5YLhK4qpyaiPLiiduyFsybdObZEoxkWJgs5dGBv0Sx+FoHrOdUywBCmPyTDf2znI+P0Bi19Sp98d
 e9xSoFmOwO37b3RHcIbpGefXzKCcASa9NpIISguUssj2BrK8dC6lIrePBHBbANotOhlM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7ruw6zzzBZZAjLqLpwQEsTFaW6Pz6q8xuc9DB2wYuQQ=; b=SnHqEUCnoLxbcqNHm9T2oWnZAD
 dimA7HRY5BtCVlu/lH7A1PUQR1rNBcBCovVWB0FCNz+viTEYB+4cfltORvElLzsNuDH6RR8hsE4Fi
 0lqlhmsIqmHHWI9uU7FqMVZraO6cO/bIzhr9ZwrC6hTQ8aiZXnX1hympnnW0BdBco9Ds=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1krcym-004WTU-Ad
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Dec 2020 08:25:18 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4D0Trr13nczhwn5;
 Tue, 22 Dec 2020 16:24:12 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.210) with Microsoft SMTP Server (TLS) id 14.3.498.0; Tue, 22 Dec
 2020 16:24:51 +0800
To: Weichao Guo <guoweichao@oppo.com>, <jaegeuk@kernel.org>, <chao@kernel.org>
References: <1607918093-204-1-git-send-email-guoweichao@oppo.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <7129ad3d-cf60-2106-dcd6-783ec7470620@huawei.com>
Date: Tue, 22 Dec 2020 16:24:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1607918093-204-1-git-send-email-guoweichao@oppo.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.5 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1krcym-004WTU-Ad
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to set inode->i_mode correctly for
 posix_acl_update_mode
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
Cc: fh@oppo.com, Bin Shu <shubin@oppo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/12/14 11:54, Weichao Guo wrote:
> We should update the ~S_IRWXUGO part of inode->i_mode in __setattr_copy,
> because posix_acl_update_mode updates mode based on inode->i_mode,
> which finally overwrites the ~S_IRWXUGO part of i_acl_mode with old i_mode.
> 
> Testcase to reproduce this bug:
> 0. adduser abc
> 1. mkfs.f2fs /dev/sdd
> 2. mount -t f2fs /dev/sdd /mnt/f2fs
> 3. mkdir /mnt/f2fs/test
> 4. setfacl -m u:abc:r /mnt/f2fs/test
> 5. chmod +s /mnt/f2fs/test
> 
> Signed-off-by: Weichao Guo <guoweichao@oppo.com>
> Signed-off-by: Bin Shu <shubin@oppo.com>
> ---
>   fs/f2fs/file.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 16ea10f..4d355f9 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -850,6 +850,7 @@ static void __setattr_copy(struct inode *inode, const struct iattr *attr)
>   
>   		if (!in_group_p(inode->i_gid) && !capable(CAP_FSETID))
>   			mode &= ~S_ISGID;
> +		inode->i_mode = (inode->i_mode & S_IRWXUGO) | (mode & ~S_IRWXUGO);

Sorry, I still have problem with this patch.

I think this equals to inode->i_mode = mode;

Because in chmod_common(), @mode was assigned as:

newattrs.ia_mode = (mode & S_IALLUGO) | (inode->i_mode & ~S_IALLUGO);

and only S_ISUID and S_ISGID bits of newattrs.ia_mode can be changed during chmod()

That's why setattr_copy() in fs/attr.c just uses "inode->i_mode = mode;"

>   		set_acl_inode(inode, mode);

Another problem is if i_acl_mode is used for error path handling, here i_acl_mode
and i_mode have the same value, that's not correct?

Jaegeuk,

IIUC, i_acl_mode was introduced for i_mode recovery once acl progress fails?

Thanks,

>   	}
>   }
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
