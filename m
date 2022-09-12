Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C335B5738
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Sep 2022 11:31:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oXfmV-0006zf-Tv;
	Mon, 12 Sep 2022 09:31:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhangqilong3@huawei.com>) id 1oXfm3-0006yO-Fo
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Sep 2022 09:30:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K1k971ZQgZFYYqy5OZOhSUTMMezU4EEkDKOmtCeyxcg=; b=M4CnHxMrYXuilD9RBJb0gWslS7
 ogzlzA774TnTrxJqNtfHrgnaotz9ozpSNeZufQ76bcc0HLX4Zkt3yBFQVEpHJSxhX3jGgTu8uk7YC
 K5mwO5X0FJYIHxW/mmvFdNyElFK1xnXsGEkln6FZfXx2lIGDJxiUERxGlZhDYda83L0k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=K1k971ZQgZFYYqy5OZOhSUTMMezU4EEkDKOmtCeyxcg=; b=FUX5xrU+r+Eg7kGm+SrSAomgpL
 ikepVdyFwprAwNYtq2hbGrJjgkPs62/c8jBH5g4rYr7kBbZS3k3UaLHxtsqPbOKL2arvIVIhCgTPn
 EoB1o0b6Lp3/jaf46tdLc5a0FC8IDPW80k9LroJoIbaqFIMkPPkBvIMo69DUN+4r25wI=;
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oXflx-0006Mp-Vy for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Sep 2022 09:30:35 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MR1SQ3bkQz14QNW;
 Mon, 12 Sep 2022 17:26:30 +0800 (CST)
Received: from kwepemm000014.china.huawei.com (7.193.23.6) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 12 Sep 2022 17:30:25 +0800
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 kwepemm000014.china.huawei.com (7.193.23.6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 12 Sep 2022 17:30:24 +0800
Received: from kwepemm600014.china.huawei.com ([7.193.23.54]) by
 kwepemm600014.china.huawei.com ([7.193.23.54]) with mapi id 15.01.2375.031;
 Mon, 12 Sep 2022 17:30:24 +0800
To: Chao Yu <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>
Thread-Topic: [PATCH -next] f2fs: add flush_dcache_page after page was written
Thread-Index: AQHYwZvdHfXKu6+yHk+rNkFeNZ6jq63bgVBw
Date: Mon, 12 Sep 2022 09:30:24 +0000
Message-ID: <acfb1d9c7879402dae6fe4b70a46303b@huawei.com>
References: <20220825024102.120651-1-zhangqilong3@huawei.com>
 <bf003c19-7d0b-9045-0df5-baf423bdb8e9@kernel.org>
In-Reply-To: <bf003c19-7d0b-9045-0df5-baf423bdb8e9@kernel.org>
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
 Content preview:  > > On 2022/8/25 10:41,
 Zhang Qilong wrote: > > If the written
 page was mapped more than twice, the written data here > > will not be seen
 by others. We add the flush_dcache_page to fix it. > > > > Fi [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.255 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1oXflx-0006Mp-Vy
Subject: [f2fs-dev] =?utf-8?b?562U5aSNOiBbUEFUQ0ggLW5leHRdIGYyZnM6IGFkZCBm?=
 =?utf-8?q?lush=5Fdcache=5Fpage_after_page_was_written?=
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
> On 2022/8/25 10:41, Zhang Qilong wrote:
> > If the written page was mapped more than twice, the written data here
> > will not be seen by others. We add the flush_dcache_page to fix it.
> >
> > Fixes:0a2aa8fbb9693 ("f2fs: refactor __exchange_data_block for speed
> > up")
> > Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> > ---
> >   fs/f2fs/file.c | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c index
> > ab9844eaa62c..b593e41dbfb3 100644
> > --- a/fs/f2fs/file.c
> > +++ b/fs/f2fs/file.c
> > @@ -1273,6 +1273,7 @@ static int __clone_blkaddrs(struct inode
> *src_inode, struct inode *dst_inode,
> >   				return PTR_ERR(pdst);
> >   			}
> >   			memcpy_page(pdst, 0, psrc, 0, PAGE_SIZE);
> > +			flush_dcache_page(pdst);
> 
> __clone_blkaddrs() was introduced for fallocate() w/
> FALLOC_FL_COLLAPSE_RANGE and FALLOC_FL_INSERT_RANGE cases, they
> are both covered w/ invalidate_lock, and before __clone_blkaddrs(), it
> will call truncate_pagecache() to drop all mapping of pagecache, so it's
> safe here?
> 
> Instead, in f2fs_move_file_range(), we need to cover
> __exchange_data_block() w/ invalidate_lock and drop pagecache as well
> as fallocate() does?

Yes ,it seems has the problem. I test it just now through the POC( ioctl(fd1, F2FS_IOC_MOVE_RANGE, &arg). I read the old data before dropping the cache. It refreshes the source file data after manually dropping cache. I will propose a new patch to solve this problem.

Thanks,

> 
> Thanks,
> 
> >   			set_page_dirty(pdst);
> >   			f2fs_put_page(pdst, 1);
> >   			f2fs_put_page(psrc, 1);

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
