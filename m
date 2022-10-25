Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EB24760C49F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Oct 2022 09:01:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1onDwh-0003cm-5h;
	Tue, 25 Oct 2022 07:01:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhangqilong3@huawei.com>) id 1onDwd-0003cf-2X
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Oct 2022 07:01:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TkCa5SBYN5y6Iayyr0ODrardcVzJFpKa3ly0ajozrBU=; b=nS2EAX8V37l3B+vv6kWUuJ+DiQ
 dx8Q0/5zefupiUdpiJ/60aKdLykiMXgSb05WBqP2L6dCNfgoHwYnkDR5wcTkyGVqTK523BEWpkVhu
 uY3Q3DSbVqtQ2qXHenDDq7fzKR5AEaYeIvPYkmCbwsRa+lEI6Wju6sHau50H+ngyWxqk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TkCa5SBYN5y6Iayyr0ODrardcVzJFpKa3ly0ajozrBU=; b=MqCNcCOGNW/r0NMX7wmXtCiy06
 gnk+D/QAeMVbD1xPMvlJG/X+plDdenv5bUhvq5gHXUgZSJG1N1qHUpQ9F7Ga5UpavRgB/I3g9q+Y+
 pQl03DANA5bS7Z23nSDy5RWd4JlAy1VktiMagYZ9AWGBt5Fp7fBAUsIO/9pHIN7uMHJI=;
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1onDwZ-0001Mm-A7 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Oct 2022 07:01:51 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MxN7R5hn6zpVtd;
 Tue, 25 Oct 2022 14:58:11 +0800 (CST)
Received: from kwepemm600016.china.huawei.com (7.193.23.20) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 25 Oct 2022 15:01:36 +0800
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 kwepemm600016.china.huawei.com (7.193.23.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 25 Oct 2022 15:01:35 +0800
Received: from kwepemm600014.china.huawei.com ([7.193.23.54]) by
 kwepemm600014.china.huawei.com ([7.193.23.54]) with mapi id 15.01.2375.031;
 Tue, 25 Oct 2022 15:01:35 +0800
To: Chao Yu <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>
Thread-Topic: =?utf-8?B?562U5aSNOiBbZjJmcy1kZXZdIOetlOWkjTogW1BBVENIXSBmMmZzOiBGaXgg?=
 =?utf-8?B?ZGF0YSBjb25zaXN0ZW5jeSBpbiBmMmZzX21vdmVfZmlsZV9yYW5nZSgp?=
Thread-Index: AQHY5CN6Oz230BbkvUqpMiz4T2TVqK4W4MLQgAbv7gCAAIhhUP//0ioAgACGiZA=
Date: Tue, 25 Oct 2022 07:01:35 +0000
Message-ID: <411daf4a5ff94907bc298579f1e99d49@huawei.com>
References: <20221018024532.44184-1-zhangqilong3@huawei.com>
 <35811a40-cc69-a50d-b348-62eed5ed1227@kernel.org>
 <1e8cf37922cc4c87aff770449bbba4ab@huawei.com>
 <07348e12-142b-228c-e5fe-6f4fc9a74421@kernel.org>
 <d1d56450ccd24c1091ae67894ce8cc69@huawei.com>
 <959ca5cb-947c-d693-5e6f-79736ada7664@kernel.org>
In-Reply-To: <959ca5cb-947c-d693-5e6f-79736ada7664@kernel.org>
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
 Content preview:  > On 2022/10/25 14:27, zhangqilong wrote: > >> On 2022/10/20
 15:27, zhangqilong via Linux-f2fs-devel wrote: > >>>> On 2022/10/18 10:45,
 Zhang Qilong wrote: > >>>>> In the following case: > >>>>> proce [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.187 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1onDwZ-0001Mm-A7
Subject: [f2fs-dev] =?utf-8?b?562U5aSNOiDnrZTlpI06ICDnrZTlpI06IFtQQVRDSF0g?=
 =?utf-8?q?f2fs=3A_Fix_data_consistency_in_f2fs=5Fmove=5Ffile=5Frange=28?=
 =?utf-8?q?=29?=
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

> On 2022/10/25 14:27, zhangqilong wrote:
> >> On 2022/10/20 15:27, zhangqilong via Linux-f2fs-devel wrote:
> >>>> On 2022/10/18 10:45, Zhang Qilong wrote:
> >>>>> In the following case:
> >>>>> process 1			process 2
> >>>>>     ->open A
> >>>>>      ->mmap
> >>>>>       ->read # the first time
> >>>>>       				 ->ioctl w/h F2FS_IOC_MOVE_RANGE
> >>>>> 				        	# (range A->B)
> >>>>>       ->read # the second time
> >>>>
> >>>> How about checking B as well? Previous mapped data can still be
> >>>> accessed after F2FS_IOC_MOVE_RANGE?
> >>>>
> >>>
> >>> Hi
> >>>
> >>> I have checked B as well. Previous mapped data can't be accessed
> >>> after F2FS_IOC_MOVE_RANGE.
> >>
> >> I doubt that we didn't call flush_dcache_page() in below branch, so
> >> user may see stall data after F2FS_IOC_MOVE_RANGE? Am I missing
> something?
> >>
> >
> > Hi,
> >
> > You are right, it needs flush_dcache_page, but it is unnecessary here,
> > the __clone_blkaddrs() is called by FALLOC_FL_COLLAPSE_RANGE/
> FALLOC_FL_INSERT_RANGE /F2FS_IOC_MOVE_RANGE.
> > ->__exchange_data_block()
> >   ->__clone_blkaddrs()
> >
> > f2fs_do_collapse()  and f2fs_insert_range() have truncate_pagecache
> > after __exchange_data_block() It seem we have analyzed before. So we
> only need to add a truncate operation for F2FS_IOC_MOVE_RANGE.
> 
> I mean it needs to call truncate_pagecache_range(dst, ...) in
> f2fs_move_file_range() as well, right?

Yes, I think it should call truncate_pagecache_range(dst, ...) or flush_dcache_page() here.
I submitted a patch before, it seems to be forgetten.

https://lore.kernel.org/linux-f2fs-devel/20220825024102.120651-1-zhangqilong3@huawei.com/

But, I test it w/o truncate_pagecache_range(dst, ...) or flush_dcache_page(), user can not
see stall dst data, maybe It is a bit difficult to construct the scene for me.

Thanks,
> 
> Thanks,
> 
> >
> >> __clone_blkaddrs()
> >> {
> >> ...
> >> 		} else {
> >> 			struct page *psrc, *pdst;
> >>
> >> 			psrc = f2fs_get_lock_data_page(src_inode,
> >> 							src + i, true);
> >> 			if (IS_ERR(psrc))
> >> 				return PTR_ERR(psrc);
> >> 			pdst = f2fs_get_new_data_page(dst_inode, NULL,
> dst + i,
> >> 								true);
> >> 			if (IS_ERR(pdst)) {
> >> 				f2fs_put_page(psrc, 1);
> >> 				return PTR_ERR(pdst);
> >> 			}
> >> 			memcpy_page(pdst, 0, psrc, 0, PAGE_SIZE);
> >> 			set_page_dirty(pdst);
> >> 			f2fs_put_page(pdst, 1);
> >> 			f2fs_put_page(psrc, 1);
> >>
> >> 			ret = f2fs_truncate_hole(src_inode,
> >> 						src + i, src + i + 1);
> >> 			if (ret)
> >> 				return ret;
> >> 			i++;
> >> 		}
> >> ...
> >> }
> >>
> >> Thanks,
> >>
> >>>
> >>> In addition, this patch could be applied to mainline if possible?
> >>>
> >>> Thanks
> >>>
> >>>> Thanks,
> >>>>
> >>>>>
> >>>>> We will read old data at the second time. The root cause is that
> >>>>> user still can see the previous source data after being moved. We
> >>>>> fix it by adding truncating after __exchange_data_block.
> >>>>>
> >>>>> Fixes: 4dd6f977fc77 ("f2fs: support an ioctl to move a range of
> >>>>> data
> >>>>> blocks")
> >>>>> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> >>>>> ---
> >>>>> v2:
> >>>>> - moving truncating to the range of f2fs_lock_op()
> >>>>>
> >>>>> v3:
> >>>>> - modify the title and commit message
> >>>>> ---
> >>>>>     fs/f2fs/file.c | 3 +++
> >>>>>     1 file changed, 3 insertions(+)
> >>>>>
> >>>>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c index
> >>>>> 82cda1258227..e9dfa41baf9e 100644
> >>>>> --- a/fs/f2fs/file.c
> >>>>> +++ b/fs/f2fs/file.c
> >>>>> @@ -2824,6 +2824,7 @@ static int f2fs_move_file_range(struct file
> >>>>> *file_in,
> >>>> loff_t pos_in,
> >>>>>     			goto out_src;
> >>>>>     	}
> >>>>>
> >>>>> +	filemap_invalidate_lock(src->i_mapping);
> >>>>>     	f2fs_lock_op(sbi);
> >>>>>     	ret = __exchange_data_block(src, dst, pos_in >>
> F2FS_BLKSIZE_BITS,
> >>>>>     				pos_out >> F2FS_BLKSIZE_BITS, @@
> -2835,7
> >> +2836,9 @@ static
> >>>>> int f2fs_move_file_range(struct file *file_in,
> >>>> loff_t pos_in,
> >>>>>     		else if (dst_osize != dst->i_size)
> >>>>>     			f2fs_i_size_write(dst, dst_osize);
> >>>>>     	}
> >>>>> +	truncate_pagecache_range(src, pos_in, pos_in + len - 1);
> >>>>>     	f2fs_unlock_op(sbi);
> >>>>> +	filemap_invalidate_unlock(src->i_mapping);
> >>>>>
> >>>>>     	if (src != dst)
> >>>>>     		f2fs_up_write(&F2FS_I(dst)->i_gc_rwsem[WRITE]);
> >>>
> >>> _______________________________________________
> >>> Linux-f2fs-devel mailing list
> >>> Linux-f2fs-devel@lists.sourceforge.net
> >>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
