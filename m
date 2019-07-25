Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4212C74365
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Jul 2019 04:42:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hqTiF-0001CY-UC; Thu, 25 Jul 2019 02:42:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hqTiE-0001CF-5O
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 25 Jul 2019 02:42:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4kCAnAX5CNR55RcRwWvkKgkaY840pX0gzLbTRWFZ8+A=; b=hzp52WKaJYLJnDpe6eduzUJ8X8
 G+olnRlAvuRs3mENA3ufNJkDfGHnRNL0H+ZsAHLV3MDtzFDKaEdwwJys+HBGbQrN1IQ9tf1YgmQy8
 VK/qxZX6eGeM3KEsV9HheJAAYIaz4X3MmL963H9oB+TSDYU7YBYsi0Txq6EFRlDaC/OQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4kCAnAX5CNR55RcRwWvkKgkaY840pX0gzLbTRWFZ8+A=; b=JC9pycmC+iISYRI8116g0coq92
 PFjyI/5LvzJowkE9UNUbJQnrzOnHubtY/WidGMbKqS8JigJTJvkj85bGEwqFsC3MV+4F+JZbCiwXc
 5fT6kZSgrCqIh8ojnsAmhkz6GvgYJi/nQGp+WOCX2uY7vyHnkxjFI8geAmEx6R+0R6DA=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hqTiA-00H5ym-Pa
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 25 Jul 2019 02:42:33 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 92F071EC6B027ABCF126;
 Thu, 25 Jul 2019 10:42:21 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.209) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 25 Jul
 2019 10:42:19 +0800
To: Icenowy Zheng <icenowy@aosc.io>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20190724130656.29436-1-icenowy@aosc.io>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <eb0b1035-6554-61b6-a4c8-9c67b707c6a2@huawei.com>
Date: Thu, 25 Jul 2019 10:42:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190724130656.29436-1-icenowy@aosc.io>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: aosc.io]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hqTiA-00H5ym-Pa
Subject: Re: [f2fs-dev] [PATCH] f2fs: use EINVAL for invalid superblock
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Icenowy,

Yes, I can see that mount_block_root() calls ksys_mount(), however it handles 0,
EACCES and EINVAL error code..., but as manual of mount(2) said that there are
lots of error number it can return, so I suggest we'd better fix below error
handling.

		int err = do_mount_root(name, p, flags, root_mount_data);
		switch (err) {
			case 0:
				goto out;
			case -EACCES:
			case -EINVAL:
				continue;
		}

In another point, I agreed that we should not just return -EFSCORRUPTED for all
failure cases of sanity_check_raw_super(), EINVAL should be returned correctly
if the filesystem magic number is not f2fs' one, and EFSCORRUPTED for the other
cases.

Thanks,

On 2019/7/24 21:06, Icenowy Zheng wrote:
> The kernel mount_block_root() function expects -EACESS or -EINVAL for a
> unmountable filesystem when trying to mount the root with different
> filesystem types.
> 
> However, in 5.3-rc1 the behavior when F2FS code cannot find valid block
> changed to return -EFSCORRUPTED(-EUCLEAN), and this error code makes
> mount_block_root() fail when trying to probe F2FS. As invalid
> superblocks mean the filesystem cannot be recognized as F2FS (it might
> be another FS), returning -EINVAL seems more reasonable, and other
> filesystems also do this.
> 
> Change back the return value to -EINVAL when no valid superblocks are
> found.
> 
> Fixes: 10f966bbf521 ("f2fs: use generic EFSBADCRC/EFSCORRUPTED")
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
> This commit fixes a regression introduced in v5.3-rc1, which leads to
> btrfs / cannot be mounted if no initrd is used and both f2fs and btrfs
> are built-in.
> 
>  fs/f2fs/super.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 6de6cda44031..949309b9f1b8 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -2873,7 +2873,7 @@ static int read_raw_super_block(struct f2fs_sb_info *sbi,
>  		if (sanity_check_raw_super(sbi, bh)) {
>  			f2fs_err(sbi, "Can't find valid F2FS filesystem in %dth superblock",
>  				 block + 1);
> -			err = -EFSCORRUPTED;
> +			err = -EINVAL;
>  			brelse(bh);
>  			continue;
>  		}
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
