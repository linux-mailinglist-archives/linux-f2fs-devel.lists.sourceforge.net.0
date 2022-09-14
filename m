Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF255B7E19
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Sep 2022 03:08:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oYGtU-0003o2-Ks;
	Wed, 14 Sep 2022 01:08:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhangqilong3@huawei.com>) id 1oYGtT-0003mn-GC
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Sep 2022 01:08:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8OkWytkVLPyU8n9idMsla540fo2iCwcrGPTE7WGIEj4=; b=A0OENs2lQItR1xQqOKsOdoQfef
 cda/8iWesVE/LyRdhM0BGY9hkMqMFsgURe6ZtUQEJ/+NgRtW4/OBSBWQwgjpH7Yb4WIza7afDDBH4
 CkXFCS40XsUTEG9Vd68T+lM7lurW8MCKafEimETVbEh5MiNwkuIy6dGKqjWHZgOABjqg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8OkWytkVLPyU8n9idMsla540fo2iCwcrGPTE7WGIEj4=; b=Kr3XEJmVsu08LJO63gjZtuka6Z
 XJQmPxj6J+0CGr+g42Jb1wmQBSOioyESdsotya+ME+PLo4J4vAAu8NNFq+2fS797t8sGhZeyQVqJJ
 7B95Z4ASqyxpyVQR0BlprMVY99H1y2SQLQfsRu7UbiKmjbpPGho5VqNAdiVJi9nI//Io=;
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oYGtQ-007Q7P-7M for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Sep 2022 01:08:47 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MS2Dc4TwKzmVPG;
 Wed, 14 Sep 2022 09:04:48 +0800 (CST)
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 14 Sep 2022 09:08:33 +0800
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 kwepemm600014.china.huawei.com (7.193.23.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 14 Sep 2022 09:08:32 +0800
Received: from kwepemm600014.china.huawei.com ([7.193.23.54]) by
 kwepemm600014.china.huawei.com ([7.193.23.54]) with mapi id 15.01.2375.031;
 Wed, 14 Sep 2022 09:08:32 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
Thread-Topic: [PATCH -next 0/3] f2fs: clean code and fix type error
Thread-Index: AQHYx4jZKaOYjHWA10O1VPBW8oz7ea3eHZ8g
Date: Wed, 14 Sep 2022 01:08:32 +0000
Message-ID: <9b6e711f27d3410e9d86418375977933@huawei.com>
References: <20220913150604.45447-1-zhangqilong3@huawei.com>
 <YyCnOsjAmWCsP9G9@google.com>
In-Reply-To: <YyCnOsjAmWCsP9G9@google.com>
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
 Content preview:  > > On 09/13, Zhang Qilong wrote: > > Found serveral code
 type errors when review the code and fix it. > > There is no function change.
 > > Could you please combine them into single patch? > Thanks, > [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.188 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1oYGtQ-007Q7P-7M
Subject: [f2fs-dev] =?gb2312?b?tPC4tDogW1BBVENIIC1uZXh0IDAvM10gZjJmczog?=
 =?gb2312?b?Y2xlYW4gY29kZSBhbmQgZml4IHR5cGUgZXJyb3I=?=
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
> On 09/13, Zhang Qilong wrote:
> > Found serveral code type errors when review the code and fix it.
> > There is no function change.
> 
> Could you please combine them into single patch?
> Thanks,
> 

Just fine :), I will send a new patch.

Thanks,

> >
> > Zhang Qilong (3):
> >   f2fs: insert a space around colon
> >   f2fs: replace spaces with tabs
> >   f2fs: fix a stype error in f2fs_update_extent_tree_range
> >
> >  fs/f2fs/data.c         | 2 +-
> >  fs/f2fs/debug.c        | 2 +-
> >  fs/f2fs/extent_cache.c | 2 +-
> >  fs/f2fs/file.c         | 2 +-
> >  fs/f2fs/node.c         | 2 +-
> >  5 files changed, 5 insertions(+), 5 deletions(-)
> >
> > --
> > 2.25.1

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
