Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA285AE0B6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Sep 2022 09:14:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oVSnM-0002yC-Eh;
	Tue, 06 Sep 2022 07:14:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhangqilong3@huawei.com>) id 1oVSnH-0002xz-8J
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Sep 2022 07:14:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E05FQc5/bq5Nj2RaKQR/u/jwiDTI+f93+Nb++LrDEGA=; b=UqGmwI6tRmE5M9hEVyEdKbfVhy
 WkVJxr2N/xsGLMfe5bso0/FpObOx1zXInyEu3ojZrt8TKUDpXrg5tBigwS0QkxW9AtFma6fhR3pC+
 4fkT8OPh+XUTWVzECVic1ioCa2pu1vv8EPf2NXh9J5FCSaEOJIDQOGm6nerrJzb1n1eo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=E05FQc5/bq5Nj2RaKQR/u/jwiDTI+f93+Nb++LrDEGA=; b=E1qNNDZ9SYILSCAstXsal4w0U8
 1nfdR8FbK1qxXx6HD1fkyB0CAbE7CxOF4QxMzGgLiDA33u1hAgU5zqDzXT+/POs1e5AYPoDS+BQnS
 fQdLY4QmeG7X6aleRCy/N6eUrL+guY2AhBW7G5XHVDOqAG4d2mwnNQltrBdFWwOqHaXc=;
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oVSnF-00H2b9-Mh for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Sep 2022 07:14:47 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MMGm24WXgznVCZ;
 Tue,  6 Sep 2022 15:12:02 +0800 (CST)
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 6 Sep 2022 15:14:32 +0800
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 kwepemm600014.china.huawei.com (7.193.23.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 6 Sep 2022 15:14:32 +0800
Received: from kwepemm600014.china.huawei.com ([7.193.23.54]) by
 kwepemm600014.china.huawei.com ([7.193.23.54]) with mapi id 15.01.2375.024;
 Tue, 6 Sep 2022 15:14:32 +0800
To: Chao Yu <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>
Thread-Topic: [PATCH -next] f2fs: total hit count should only be increased
 when entry found
Thread-Index: AQHYwZ4wwW6Jznhtgkmy7JH988GDna3R+zsA
Date: Tue, 6 Sep 2022 07:14:32 +0000
Message-ID: <b6698fca7dc04a84ae17c3eab658612a@huawei.com>
References: <20220905141225.26456-1-zhangqilong3@huawei.com>
 <6813adb8-73c4-0fd7-5ee4-a1d4a97e6552@kernel.org>
In-Reply-To: <6813adb8-73c4-0fd7-5ee4-a1d4a97e6552@kernel.org>
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
 Content preview:  > when entry found > > On 2022/9/5 22:12, Zhang Qilong wrote:
 > > We should not increase total hit count when not found the entry in >
 > cache extent tree. Remove the stat_inc_total_hit when > > f2fs_ [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.187 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1oVSnF-00H2b9-Mh
Subject: [f2fs-dev] =?utf-8?b?562U5aSNOiBbUEFUQ0ggLW5leHRdIGYyZnM6IHRvdGFs?=
 =?utf-8?q?_hit_count_should_only_be_increased_when_entry_found?=
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

> when entry found
> 
> On 2022/9/5 22:12, Zhang Qilong wrote:
> > We should not increase total hit count when not found the entry in
> > cache extent tree. Remove the stat_inc_total_hit when
> > f2fs_lookup_rb_tree returns nullptr.
> 
> Actually, f2fs will account total lookup count into sbi->total_hit_ext.
> 
> Thanks,
OK, I get it. The name confused me :). Maybe we could consider changing the names of member variable and function?
Like total_access_count or total_lookup_count, etc, just a little suggestion for reference only.

Thanks,
> 
> >
> > Fixes:54c2258cd63a8 ("f2fs: extract rb-tree operation infrastructure")
> > Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> > ---
> >   fs/f2fs/extent_cache.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c index
> > 866e72b29bd5..264682eebcd1 100644
> > --- a/fs/f2fs/extent_cache.c
> > +++ b/fs/f2fs/extent_cache.c
> > @@ -426,6 +426,7 @@ static bool f2fs_lookup_extent_tree(struct
> inode *inode, pgoff_t pgofs,
> >   		*ei = et->largest;
> >   		ret = true;
> >   		stat_inc_largest_node_hit(sbi);
> > +		stat_inc_total_hit(sbi);
> >   		goto out;
> >   	}
> >
> > @@ -447,8 +448,8 @@ static bool f2fs_lookup_extent_tree(struct
> inode *inode, pgoff_t pgofs,
> >   	}
> >   	spin_unlock(&sbi->extent_lock);
> >   	ret = true;
> > -out:
> >   	stat_inc_total_hit(sbi);
> > +out:
> >   	read_unlock(&et->lock);
> >
> >   	trace_f2fs_lookup_extent_tree_end(inode, pgofs, ei);

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
