Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BD61086D7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 Nov 2019 04:32:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iZ573-0006R3-MN; Mon, 25 Nov 2019 03:32:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iZ570-0006Qr-Te
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 25 Nov 2019 03:32:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2NDoTAnm8CjDxS1JTUw+Aqy5mnFHcPpaNIqoXP8MbIA=; b=CaVddBk9lvPcw0iAUfcy/6Q/bi
 98LKGywbmLWt25BbA1MOjPcrGhwZtdMdzNHemoQ5e/x+wtXwCOVLJx5BhaV/HMN8E0PbPr13ZfpU2
 0/9SrGh0UCrzKRhSFW5JdAnvQ7avE3YwpMQyluE5A9ni0ZjOpfbTa8skpj8jem50sxd0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2NDoTAnm8CjDxS1JTUw+Aqy5mnFHcPpaNIqoXP8MbIA=; b=AEBV6djWPlSbeJ4IaC6U6iOhDb
 xuGswqBXSI1/9b45Y/sII6L2sljNRnFjfvcROvMm5eRTqJt47+eNre0LjqfzAWpAsTFvpqRdXesSK
 0b5SSoio5dEOQB8wQCOShR09k4zfWmMMJbRMg3Dzt+d1TRQWUI6ENjIpy52RFhwCOVbs=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iZ56x-004Ehx-5P
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 25 Nov 2019 03:32:30 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 3ADD37EBAA183FC35935;
 Mon, 25 Nov 2019 11:32:18 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.203) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 25 Nov
 2019 11:32:17 +0800
To: Chengguang Xu <cgxu519@mykernel.net>, <jaegeuk@kernel.org>,
 <chao@kernel.org>
References: <20191125032036.30490-1-cgxu519@mykernel.net>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <27d5df1b-2953-b94a-48ea-761ac7ee5ced@huawei.com>
Date: Mon, 25 Nov 2019 11:32:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191125032036.30490-1-cgxu519@mykernel.net>
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
X-Headers-End: 1iZ56x-004Ehx-5P
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: choose hardlimit when softlimit is
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

On 2019/11/25 11:20, Chengguang Xu wrote:
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
> Block limits File limits
> Project used soft hard grace used soft hard grace
> ----------------------------------------------------------------------
> 0 -- 4 0 0 1 0 0
> 123 +- 10248 20480 10240 2 0 0
> 
> The result of df command as below:
> 
> [root@hades f2fs]# df -h /mnt/f2fs/test
> Filesystem Size Used Avail Use% Mounted on
> /dev/nvme0n1p8 20M 11M 10M 51% /mnt/f2fs
> 
> Even though it looks like there is another 10M free space to use,
> if we write new data to diretory test(inherit project id),
> the write will fail with errno(-EDQUOT).
> 
> After this patch, the df result looks like below.
> 
> [root@hades f2fs]# df -h /mnt/f2fs/test
> Filesystem Size Used Avail Use% Mounted on
> /dev/nvme0n1p8 10M 10M 0 100% /mnt/f2fs
> 
> Signed-off-by: Chengguang Xu <cgxu519@mykernel.net>

Thanks for the quick response. :)

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
