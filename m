Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FF25B6701
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Sep 2022 06:37:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oXxfv-00041z-8k;
	Tue, 13 Sep 2022 04:37:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhangqilong3@huawei.com>) id 1oXxft-00041s-Q0
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Sep 2022 04:37:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UdI5sybPI248h1nQctAeVfdlILGYXfIzVG9kmLl4ldE=; b=C5ZEdSYapmcnbC8yhXW8H8VKtN
 MG6a9mzCyfBep5f23qxhwktxZvmV5x3ojDL/FtfU7eVSo4MFeoxDCZdV1iIBIJmDPtMa6UVQxaRbZ
 nb2LbSkc35AcTAgiQ4ZWQ4xQtXezxXoUIICx8l9WMrOrB9SEXpHCDEQXbLdbGXFoLpA4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UdI5sybPI248h1nQctAeVfdlILGYXfIzVG9kmLl4ldE=; b=M5vSzQMmx2hBXrUW7GYm4ZSIKI
 9PFxGv95UyNjbdKcBUKqRTbx4bxkIbQx28IWSNHzqtlM+FIUCnvQngCdK0/KcLDUzcyR9aw3tkvC5
 B+t9U830p+Sn+xR+4HYQndvfYJQp6H26kjdARrwZK+rAbnfqwsen1cHUpWmindQynXq8=;
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oXxfs-00083l-DK for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Sep 2022 04:37:29 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MRVx95w2MznV2X;
 Tue, 13 Sep 2022 12:34:37 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (7.193.23.81) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 13 Sep 2022 12:37:17 +0800
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 13 Sep 2022 12:37:17 +0800
Received: from kwepemm600014.china.huawei.com ([7.193.23.54]) by
 kwepemm600014.china.huawei.com ([7.193.23.54]) with mapi id 15.01.2375.031;
 Tue, 13 Sep 2022 12:37:17 +0800
To: Chao Yu <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>
Thread-Topic: =?utf-8?B?562U5aSNOiBbUEFUQ0ggLW5leHRdIGYyZnM6IGFkZGluZyB0cnVuY2F0ZSBw?=
 =?utf-8?Q?age_cache_after_being_moved?=
Thread-Index: AQHYxx+z7HSWJPdxBUGNkR78i+7hia3ctEag//9/RYCAAJFX4A==
Date: Tue, 13 Sep 2022 04:37:17 +0000
Message-ID: <ae929a5c21b441f49fc187e7e893fe61@huawei.com>
References: <20220913030529.3944-1-zhangqilong3@huawei.com>
 <293a41a4-7c7d-aac8-0bc2-15d47b7bd538@kernel.org>
 <4430326a24364b6aa92332c1393509f4@huawei.com>
 <0cf48a6c-79ff-ef04-b630-a76faaca34c6@kernel.org>
In-Reply-To: <0cf48a6c-79ff-ef04-b630-a76faaca34c6@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.177.246]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > > On 2022/9/13 11:41, zhangqilong wrote: > >> On 2022/9/13
 11:05, Zhang Qilong wrote: > >>> If we do not truncate source page cache,
 user can still see the > >>> previous source data after being mov [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.187 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1oXxfs-00083l-DK
Subject: [f2fs-dev] =?utf-8?b?562U5aSNOiDnrZTlpI06IFtQQVRDSCAtbmV4dF0gZjJm?=
 =?utf-8?q?s=3A_adding_truncate_page_cache_after_being_moved?=
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
From: zhangqilong via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: zhangqilong <zhangqilong3@huawei.com>
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

> 
> On 2022/9/13 11:41, zhangqilong wrote:
> >> On 2022/9/13 11:05, Zhang Qilong wrote:
> >>> If we do not truncate source page cache, user can still see the
> >>> previous source data after being moved. We fix it by adding
> >>> truncating after __exchange_data_block.
> >>>
> >>> Fixes:4dd6f977fc778 ("f2fs: support an ioctl to move a range of data
> >>> blocks")
> >>> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> >>> ---
> >>>    fs/f2fs/file.c | 4 ++++
> >>>    1 file changed, 4 insertions(+)
> >>>
> >>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c index
> >>> 771f1f7f3690..e3ff648aa496 100644
> >>> --- a/fs/f2fs/file.c
> >>> +++ b/fs/f2fs/file.c
> >>> @@ -2789,6 +2789,10 @@ static int f2fs_move_file_range(struct file
> >> *file_in, loff_t pos_in,
> >>>    	}
> >>>    	f2fs_unlock_op(sbi);
> >>>
> >>> +	filemap_invalidate_lock(src->i_mapping);
> >>
> >> invalidate lock should cover __exchange_data_block()?
> >>
> >>> +	truncate_pagecache_range(src, pos_in, pos_in + len - 1);
> >>
> >> truncate_pagecache_range() should be called before
> >> __exchange_data_block()?
> >
> > I have tried it, but it do not work. So I move the truncate operation
> > to the back of __exchange_data_block that it works well. I don't know
> > much enough, what do you think of this issue.
> 
> Can you describe details about the testcase?
> 
> Thanks,
> 

Process 1 						process 2
-> open A
-> mmap
	Read the data and save
								-> ioctl with F2FS_IOC_MOVE_RANGE   A  ->  B

-> mmap
	Read the data that offset is same with first time and save

Compare the consistency of the data that read twice.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
