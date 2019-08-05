Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CBF81516
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  5 Aug 2019 11:13:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1huZ3s-0008QV-9V; Mon, 05 Aug 2019 09:13:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1huZ3q-0008QN-C4
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Aug 2019 09:13:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UtZzTsrBuSO5uLo39jfBGpfx3dv8aY0kBpJ4VLiO0Uc=; b=fr0WILfHQx599W9Ux+QF+sMOFH
 YzO7smYkXkzsUhDUtff7huCEb7hRjCs4YAp6YL7tiGht0vWKzFUAE0YW0csdngg7M92Ty0T2G7fZk
 EKwY/V+stVUlLsCXucLl0Je70tR0UDjFsIDbUiwqK+6lhE/b7yzSEVVeEomh+2gtTjnE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UtZzTsrBuSO5uLo39jfBGpfx3dv8aY0kBpJ4VLiO0Uc=; b=iEnmzVaR9S+qMPd/4k4YMmT77b
 ss3BmKFdz1yA+pA7mDdc/ClvaP7KSuoj+bwPOFLKuz0sphLHeLhD9trTWr05whvtTq/n9o3kR+uIe
 bwIJod9rNSecVyPHmd5+D1l94zNC6+Bq8x1ulXrcVkvFJ7Rg6VQHVgFrvrp1ow8ZiboY=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1huZ3o-00B2kq-2S
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Aug 2019 09:13:46 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 2583221CD27B0BFEEFD3;
 Mon,  5 Aug 2019 17:13:37 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.210) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 5 Aug 2019
 17:13:32 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>
References: <20181002020223.76087-1-jaegeuk@kernel.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <bece1226-ae59-d9be-a5b0-be836ba04e69@huawei.com>
Date: Mon, 5 Aug 2019 17:13:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20181002020223.76087-1-jaegeuk@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1huZ3o-00B2kq-2S
Subject: Re: [f2fs-dev] [PATCH] fsck.f2fs: don't allocate new blocks on
 unclean shutdown
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

Hi Jaegeuk,

On 2018/10/2 10:02, Jaegeuk Kim wrote:
> +	if (!is_set_ckpt_flags(cp, CP_UMOUNT_FLAG)) {
> +		c.alloc_failed = 1;
> +		return -EINVAL;
> +	}

When I test por_fsstress case w/ quota feature enabled, I suffer below error
during repair:

Info: superblock features = f8 :  extra_attr project_quota inode_checksum
flexible_inline_xattr quota_ino
Info: superblock encrypt level = 0, salt = 00000000000000000000000000000000
Info: total FS sectors = 2097152 (8192 MB)
Info: CKPT version = 452b7568
Info: checkpoint state = 846 :  quota_need_fsck crc compacted_summary
orphan_inodes sudden-power-off
[fsck_chk_quota_files:1784] Fixing Quota file ([  0] ino [0x4])
[ERROR] quotaio_tree.c:83:write_blk:: Cannot write block (7188): Inappropriate
ioctl for device
[ERROR] quotaio_tree.c:110:get_free_dqblk:: Cannot allocate new quota block (out
of disk space).

I found new_data_block() will reject block allocation on an unclean umounted
image, result in quota file repair failure.

With current implementation, I think we should mount that image again for
recovery, then umount and run fsck on it again to repair quota file.

However, user didn't be noticed that how to fix this... I know there is no such
report tho, I think we'd better fix this case in fsck, any thoughts? let
allocation skip fsynced datas?

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
