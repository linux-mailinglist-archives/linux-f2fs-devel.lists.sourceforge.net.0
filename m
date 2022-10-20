Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F268605886
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Oct 2022 09:29:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1olPzT-0001zu-9j;
	Thu, 20 Oct 2022 07:29:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhangqilong3@huawei.com>) id 1olPzF-0001zh-G7
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Oct 2022 07:29:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jDou42oN+oU9CNlIbuML9UZRMAMFIdZcWfERGu0YO1Y=; b=Tb95bve0QRk2/wDrr/4O0rjeO0
 upl1PeUJ+4ARKovczXOk5tOs2fc1LKNyFn4/oyMg13xo7Ia0nZc4ai1kTLnpiU3wjPKeG+k0IJdDT
 13+Bb8RjsHr3GCW8eYJIn9gv9BMje1ERIvFNhseFHwFprgwk6LJDCdH83gHVHrZtluHg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jDou42oN+oU9CNlIbuML9UZRMAMFIdZcWfERGu0YO1Y=; b=dusVBYX85A2QTeaMdQ+ka42Orv
 mCE6GhoDYdYH9t4tPItk+nEKEphtKXjR4c+dNYQJvfVOsRrHh2BpFHCZsMU70G6MCtZGUDl5owMJI
 1gwjMmdlIva2vTnFn1zhMygH1vxpAf1o/j2ZLT7HaSQG2FSrQ8u7Q15tWXIVudGnwjNA=;
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1olPzB-00Abu7-H8 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Oct 2022 07:29:05 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MtK2w6Bp6zHv2v;
 Thu, 20 Oct 2022 15:28:40 +0800 (CST)
Received: from kwepemm600016.china.huawei.com (7.193.23.20) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 20 Oct 2022 15:27:53 +0800
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 kwepemm600016.china.huawei.com (7.193.23.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 20 Oct 2022 15:27:52 +0800
Received: from kwepemm600014.china.huawei.com ([7.193.23.54]) by
 kwepemm600014.china.huawei.com ([7.193.23.54]) with mapi id 15.01.2375.031;
 Thu, 20 Oct 2022 15:27:52 +0800
To: Chao Yu <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>
Thread-Topic: [PATCH] f2fs: Fix data consistency in f2fs_move_file_range()
Thread-Index: AQHY5CN6Oz230BbkvUqpMiz4T2TVqK4W4MLQ
Date: Thu, 20 Oct 2022 07:27:52 +0000
Message-ID: <1e8cf37922cc4c87aff770449bbba4ab@huawei.com>
References: <20221018024532.44184-1-zhangqilong3@huawei.com>
 <35811a40-cc69-a50d-b348-62eed5ed1227@kernel.org>
In-Reply-To: <35811a40-cc69-a50d-b348-62eed5ed1227@kernel.org>
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
 Content preview:  > On 2022/10/18 10:45,
 Zhang Qilong wrote: > > In the following
 case: > > process 1 process 2 > > ->open A > > ->mmap > > ->read # the first
 time > > ->ioctl w/h F2FS_IOC_MOVE_RANGE > > # (range A->B) [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.188 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1olPzB-00Abu7-H8
Subject: [f2fs-dev] =?utf-8?b?562U5aSNOiBbUEFUQ0hdIGYyZnM6IEZpeCBkYXRhIGNv?=
 =?utf-8?q?nsistency_in_f2fs=5Fmove=5Ffile=5Frange=28=29?=
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

> On 2022/10/18 10:45, Zhang Qilong wrote:
> > In the following case:
> > process 1			process 2
> >   ->open A
> >    ->mmap
> >     ->read # the first time
> >     				 ->ioctl w/h F2FS_IOC_MOVE_RANGE
> > 				        	# (range A->B)
> >     ->read # the second time
> 
> How about checking B as well? Previous mapped data can still be accessed
> after F2FS_IOC_MOVE_RANGE?
> 

Hi

I have checked B as well. Previous mapped data can't be accessed after
F2FS_IOC_MOVE_RANGE.

In addition, this patch could be applied to mainline if possible? 

Thanks

> Thanks,
> 
> >
> > We will read old data at the second time. The root cause is that user
> > still can see the previous source data after being moved. We fix it by
> > adding truncating after __exchange_data_block.
> >
> > Fixes: 4dd6f977fc77 ("f2fs: support an ioctl to move a range of data
> > blocks")
> > Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> > ---
> > v2:
> > - moving truncating to the range of f2fs_lock_op()
> >
> > v3:
> > - modify the title and commit message
> > ---
> >   fs/f2fs/file.c | 3 +++
> >   1 file changed, 3 insertions(+)
> >
> > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c index
> > 82cda1258227..e9dfa41baf9e 100644
> > --- a/fs/f2fs/file.c
> > +++ b/fs/f2fs/file.c
> > @@ -2824,6 +2824,7 @@ static int f2fs_move_file_range(struct file *file_in,
> loff_t pos_in,
> >   			goto out_src;
> >   	}
> >
> > +	filemap_invalidate_lock(src->i_mapping);
> >   	f2fs_lock_op(sbi);
> >   	ret = __exchange_data_block(src, dst, pos_in >> F2FS_BLKSIZE_BITS,
> >   				pos_out >> F2FS_BLKSIZE_BITS,
> > @@ -2835,7 +2836,9 @@ static int f2fs_move_file_range(struct file *file_in,
> loff_t pos_in,
> >   		else if (dst_osize != dst->i_size)
> >   			f2fs_i_size_write(dst, dst_osize);
> >   	}
> > +	truncate_pagecache_range(src, pos_in, pos_in + len - 1);
> >   	f2fs_unlock_op(sbi);
> > +	filemap_invalidate_unlock(src->i_mapping);
> >
> >   	if (src != dst)
> >   		f2fs_up_write(&F2FS_I(dst)->i_gc_rwsem[WRITE]);

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
