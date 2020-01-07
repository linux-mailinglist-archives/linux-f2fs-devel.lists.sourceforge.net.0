Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CF31324D6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Jan 2020 12:28:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ion2C-0000BC-L2; Tue, 07 Jan 2020 11:28:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1ion2B-0000B4-6W
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Jan 2020 11:28:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zepZT5GAIrt6gL4fqQqcvuRxCuZBtIF9GS4ZKBl5cWw=; b=YpHZBN937ztYWntjhz2+RPsiTF
 lhwynCKdznZogFg0fIm7eNqj3QP8mUJlkOcImOeU1SjatStc3i1hDgjdmNbX7wLY6BMvycJCdRDJC
 tJY3Wuq60vVZxSv3oqgrLzzV2CB2MCn1nI0q3nQ0vPspSbR7KRQUZzwU+P9q5T62NXyI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zepZT5GAIrt6gL4fqQqcvuRxCuZBtIF9GS4ZKBl5cWw=; b=f8bl8fJtUv6/fJXsnye2vAHT91
 x9dRubXqKrKThhpjLll0yvZ6YcdeiR8micOYVEkHLABpjemzCRKjLfMI7ICi+SZzT+/CDRGmzOFyc
 uAggeEuQEc/LsA9/rUX9YEcXGGR4w9RMbm8/7vLFrRvs2J2P5ZZImktEx9nzdPScx4lc=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ion24-00CFjo-4Q
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Jan 2020 11:28:27 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id ECD2ACAFF8A55516728D;
 Tue,  7 Jan 2020 19:28:12 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.209) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 7 Jan 2020
 19:28:11 +0800
To: Chengguang Xu <cgxu519@mykernel.net>, <jaegeuk@kernel.org>,
 <chao@kernel.org>
References: <20200104142004.12883-1-cgxu519@mykernel.net>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <a3fd21e0-1f54-0f36-b016-e474ff50fdda@huawei.com>
Date: Tue, 7 Jan 2020 19:28:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200104142004.12883-1-cgxu519@mykernel.net>
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
X-Headers-End: 1ion24-00CFjo-4Q
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: fix miscounted block limit in
 f2fs_statfs_project()
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

On 2020/1/4 22:20, Chengguang Xu wrote:
> statfs calculates Total/Used/Avail disk space in block unit,
> so we should translate soft/hard prjquota limit to block unit
> as well.
> 
> Below testing result shows the block/inode numbers of
> Total/Used/Avail from df command are all correct afer
> applying this patch.
> 
> [root@localhost quota-tools]\# ./repquota -P /dev/sdb1
> *** Report for project quotas on device /dev/sdb1
> Block grace time: 7days; Inode grace time: 7days
>               Block limits                File limits
> Project   used soft    hard  grace  used  soft  hard  grace
> -----------------------------------------------------------
> \#0   --   4       0       0         1     0     0
> \#101 --   0       0       0         2     0     0
> \#102 --   0   10240       0         2    10     0
> \#103 --   0       0   20480         2     0    20
> \#104 --   0   10240   20480         2    10    20
> \#105 --   0   20480   10240         2    20    10
> 
> [root@localhost sdb1]\# lsattr -p t{1,2,3,4,5}
>   101 ----------------N-- t1/a1
>   102 ----------------N-- t2/a2
>   103 ----------------N-- t3/a3
>   104 ----------------N-- t4/a4
>   105 ----------------N-- t5/a5
> 
> [root@localhost sdb1]\# df -hi t{1,2,3,4,5}
> Filesystem     Inodes IUsed IFree IUse% Mounted on
> /dev/sdb1        2.4M    21  2.4M    1% /mnt/sdb1
> /dev/sdb1          10     2     8   20% /mnt/sdb1
> /dev/sdb1          20     2    18   10% /mnt/sdb1
> /dev/sdb1          10     2     8   20% /mnt/sdb1
> /dev/sdb1          10     2     8   20% /mnt/sdb1
> 
> [root@localhost sdb1]\# df -h t{1,2,3,4,5}
> Filesystem      Size  Used Avail Use% Mounted on
> /dev/sdb1        10G  489M  9.6G   5% /mnt/sdb1
> /dev/sdb1        10M     0   10M   0% /mnt/sdb1
> /dev/sdb1        20M     0   20M   0% /mnt/sdb1
> /dev/sdb1        10M     0   10M   0% /mnt/sdb1
> /dev/sdb1        10M     0   10M   0% /mnt/sdb1
> 
> Fixes: 909110c060f2 ("f2fs: choose hardlimit when softlimit is larger than hardlimit in f2fs_statfs_project()")
> Signed-off-by: Chengguang Xu <cgxu519@mykernel.net>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
