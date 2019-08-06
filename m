Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4737C82953
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Aug 2019 03:42:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1huoUc-0000aI-Fh; Tue, 06 Aug 2019 01:42:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1huoUb-0000aB-CF
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 06 Aug 2019 01:42:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WTaBuDVqnmY3BEPCPi2XyfBJHhOyKESztRJP15rIGoU=; b=iqbASl1TyRXKf6AWitQGXiK7rz
 lQVnbXGXIn/8zweE9h7qBiwC/sQx47rkgxx0WUHHP+Pc930Vq1V1a7XbAGCQBMexx+nW9leDKdd+B
 zSUMNozBgd2RwYxW9vv3wNkB4OcWk9tx7jsfSfJGsmb9Rn9mR9SD9Q+WJWSCJnrLL7RA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WTaBuDVqnmY3BEPCPi2XyfBJHhOyKESztRJP15rIGoU=; b=Ya9mIIiTf9+upg8FtR8hwFJ66h
 fFtReZEVrAYSAMx/JHuZkyjMQc8WuZr3NUCqEoXMrXftSSYsINbUvujJBKUC4+/WNjlyFFs6ffloF
 F1UTcO3RBA3JGkHs3YDZGqitq8m8/kx1ciQGou6YUA+zxlRbKFYC0WJNvvkaGqOfCeE8=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1huoUZ-00CMe5-OF
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 06 Aug 2019 01:42:25 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id C005B14AC473876108DB;
 Tue,  6 Aug 2019 09:42:16 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.203) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 6 Aug 2019
 09:42:13 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20181002020223.76087-1-jaegeuk@kernel.org>
 <bece1226-ae59-d9be-a5b0-be836ba04e69@huawei.com>
 <20190806004742.GD98101@jaegeuk-macbookpro.roam.corp.google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <be4ad896-31bd-a6cf-4089-9f3761305c78@huawei.com>
Date: Tue, 6 Aug 2019 09:42:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190806004742.GD98101@jaegeuk-macbookpro.roam.corp.google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1huoUZ-00CMe5-OF
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/8/6 8:47, Jaegeuk Kim wrote:
> On 08/05, Chao Yu wrote:
>> Hi Jaegeuk,
>>
>> On 2018/10/2 10:02, Jaegeuk Kim wrote:
>>> +	if (!is_set_ckpt_flags(cp, CP_UMOUNT_FLAG)) {
>>> +		c.alloc_failed = 1;
>>> +		return -EINVAL;
>>> +	}
>>
>> When I test por_fsstress case w/ quota feature enabled, I suffer below error
>> during repair:
>>
>> Info: superblock features = f8 :  extra_attr project_quota inode_checksum
>> flexible_inline_xattr quota_ino
>> Info: superblock encrypt level = 0, salt = 00000000000000000000000000000000
>> Info: total FS sectors = 2097152 (8192 MB)
>> Info: CKPT version = 452b7568
>> Info: checkpoint state = 846 :  quota_need_fsck crc compacted_summary
>> orphan_inodes sudden-power-off
>> [fsck_chk_quota_files:1784] Fixing Quota file ([  0] ino [0x4])
>> [ERROR] quotaio_tree.c:83:write_blk:: Cannot write block (7188): Inappropriate
>> ioctl for device
>> [ERROR] quotaio_tree.c:110:get_free_dqblk:: Cannot allocate new quota block (out
>> of disk space).
>>
>> I found new_data_block() will reject block allocation on an unclean umounted
>> image, result in quota file repair failure.
>>
>> With current implementation, I think we should mount that image again for
>> recovery, then umount and run fsck on it again to repair quota file.
> 
> Yes.
> 
>>
>> However, user didn't be noticed that how to fix this... I know there is no such
>> report tho, I think we'd better fix this case in fsck, any thoughts? let
>> allocation skip fsynced datas?
> 
> Actually, that was my TODO, but I had no time to fix it, but had to stop it to
> avoid further corruption.

Copied, maybe I can help to fix it. It looks it will be easy to skip fsyned
datas during block allocation than porting recovery flow from kernel to tools.

Thanks,

> 
>>
>> Thanks,
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
