Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAFF10869B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 Nov 2019 03:57:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iZ4ZL-0004xY-UT; Mon, 25 Nov 2019 02:57:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iZ4ZJ-0004x4-Fx
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 25 Nov 2019 02:57:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PutI3XMz8SJCw+yDKrv2njTAAskc/N6LAUn1oLNtvA8=; b=Uq4OmNUOqcLZ2BH/gDv59vDigx
 3Hs6lfKbYPiBn7eMNqDoCQUl9kFfC3QZAQfwCkgTgOG9/ORLoXdpOLmtjY8FNRH3+byl1LnHdGiJs
 UPah7hK/ES+rNrcDbhaSqemUlY9eZMJkG5V05KdHWK3F3R3X6OZSdOx7/Kc86d3d0UEc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PutI3XMz8SJCw+yDKrv2njTAAskc/N6LAUn1oLNtvA8=; b=kT3ZPhJovLfrX4/C5ORcLXQ6lC
 nfGIfCXpDXePEPxO5RtQcx8shCmfP3twvlFYUkRw1IyaMqcFSFcDbBjlJLXFSZU9Gq2ukIDpR9sR6
 N+Jy0HCNWfY534g9NY2dN2rsF6dfXCyQ/SiguqrNMBv9U5C87w40oLVdCCTwt7Hb9xMQ=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iZ4ZG-004CWX-K4
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 25 Nov 2019 02:57:41 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id D5955710900FCDCAF7AC;
 Mon, 25 Nov 2019 10:57:29 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.202) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 25 Nov
 2019 10:57:26 +0800
To: Chengguang Xu <cgxu519@mykernel.net>, <jaegeuk@kernel.org>,
 <chao@kernel.org>
References: <20191113030731.3488-1-cgxu519@mykernel.net>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <23150aa0-e0ea-461d-bc37-6a0d38b8173c@huawei.com>
Date: Mon, 25 Nov 2019 10:57:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191113030731.3488-1-cgxu519@mykernel.net>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: mykernel.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1iZ4ZG-004CWX-K4
Subject: Re: [f2fs-dev] [PATCH] f2fs: choose hardlimit when softlimit is
 larger than hardlimit in f2fs_statfs_project()
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/11/13 11:07, Chengguang Xu wrote:
> Setting softlimit larger than hardlimit seems meaningless
> for disk quota but currently it is allowed. In this case,
> there may be a bit of comfusion for users when they run
> df comamnd to directory which has project quota.
> 
> For example, we set 20M softlimit and 10M hardlimit of
> block usage limit for project quota of test_dir(project id 123).
> 
> [root@hades f2fs]# repquota -P -a
> *** Report for project quotas on device /dev/nvme0n1p8
> Block grace time: 7days; Inode grace time: 7days
>                         Block limits                File limits
> Project         used    soft    hard  grace    used  soft  hard  grace
> ----------------------------------------------------------------------
> 0        --       4       0       0              1     0     0
> 123      +-   10248   20480   10240              2     0     0
> 
> The result of df command as below:
> 
> [root@hades f2fs]# df -h /mnt/f2fs/test
> Filesystem      Size  Used Avail Use% Mounted on
> /dev/nvme0n1p8   20M   11M   10M  51% /mnt/f2fs
> 
> Even though it looks like there is another 10M free space to use,
> if we write new data to diretory test(inherit project id),
> the write will fail with errno(-EDQUOT).
> 
> After this patch, the df result looks like below.
> 
> [root@hades f2fs]# df -h /mnt/f2fs/test
> Filesystem      Size  Used Avail Use% Mounted on
> /dev/nvme0n1p8   10M   10M     0 100% /mnt/f2fs
> 
> Signed-off-by: Chengguang Xu <cgxu519@mykernel.net>
> ---
>  fs/f2fs/super.c | 23 +++++++++++++++++------
>  1 file changed, 17 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 1443cee15863..5bf6e619a8e2 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -1213,9 +1213,15 @@ static int f2fs_statfs_project(struct super_block *sb,
>  		return PTR_ERR(dquot);
>  	spin_lock(&dquot->dq_dqb_lock);
>  
> -	limit = (dquot->dq_dqb.dqb_bsoftlimit ?
> -		 dquot->dq_dqb.dqb_bsoftlimit :
> -		 dquot->dq_dqb.dqb_bhardlimit) >> sb->s_blocksize_bits;
> +	limit = 0;
> +	if (dquot->dq_dqb.dqb_bsoftlimit &&
> +	   (!limit || dquot->dq_dqb.dqb_bsoftlimit < limit))

It looks above (!limit || dquot->dq_dqb.dqb_bsoftlimit < limit) is unneeded, as
limit was assigned as zero.

> +		limit = dquot->dq_dqb.dqb_bsoftlimit;
> +	if (dquot->dq_dqb.dqb_bhardlimit &&
> +	   (!limit || dquot->dq_dqb.dqb_bhardlimit < limit))
> +		limit = dquot->dq_dqb.dqb_bhardlimit;
> +	limit >>= sb->s_blocksize_bits;
> +
>  	if (limit && buf->f_blocks > limit) {
>  		curblock = dquot->dq_dqb.dqb_curspace >> sb->s_blocksize_bits;
>  		buf->f_blocks = limit;
> @@ -1224,9 +1230,14 @@ static int f2fs_statfs_project(struct super_block *sb,
>  			 (buf->f_blocks - curblock) : 0;
>  	}
>  
> -	limit = dquot->dq_dqb.dqb_isoftlimit ?
> -		dquot->dq_dqb.dqb_isoftlimit :
> -		dquot->dq_dqb.dqb_ihardlimit;
> +	limit = 0;
> +	if (dquot->dq_dqb.dqb_isoftlimit &&
> +	   (!limit || dquot->dq_dqb.dqb_isoftlimit < limit))

Ditto.

BTW, please fix the coding style issue due to now f2fs use indent rather than
space (ext4 or other subsystem... style) for the above splitting condition code
block.

Otherwise, it looks good to me.

Thanks,

> +		limit = dquot->dq_dqb.dqb_isoftlimit;
> +	if (dquot->dq_dqb.dqb_ihardlimit &&
> +	   (!limit || dquot->dq_dqb.dqb_ihardlimit < limit))
> +		limit = dquot->dq_dqb.dqb_ihardlimit;
> +
>  	if (limit && buf->f_files > limit) {
>  		buf->f_files = limit;
>  		buf->f_ffree =
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
