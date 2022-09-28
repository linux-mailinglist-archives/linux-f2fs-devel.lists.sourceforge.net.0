Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 276A75ED2E9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Sep 2022 04:11:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1odMXe-0006AE-Ck;
	Wed, 28 Sep 2022 02:11:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhangqilong3@huawei.com>) id 1odMXd-0006A8-6q
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Sep 2022 02:11:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7dfu8Jrod8WdnaF6zHgR31Uy+vOLjtGSSUexU5OyF4A=; b=ZOA48GyKR7HVs/ZfB6od/HNl49
 iKbkb12kbzXwBawAUpw6QP+BQ+1HOxJsJOOwkpSL58W4bTK5BWvAMe3ui4An2iyP/mlY11tPJVRDr
 AyKXhGJn/8m8G1ppc8icFvMsIhJVGFGb8GRHwOGldLaiUYZkOnb+mlxDw4R80IXhNK7k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7dfu8Jrod8WdnaF6zHgR31Uy+vOLjtGSSUexU5OyF4A=; b=IRjkpnhpF4A8gtaOSc3A56TJfW
 U+1wBCR2/I3f7c7OOtjfnPAUt6UABJ+D57uhPFxLjBqPm/Q8d5SjG50q0HK9/kxok/tLZ0Npl0ZZw
 juYQcxpZBgp0nwcB7jL5niPWZu3dmqphOvmekmiRhcTcLniprKZmsWtTT21ADMIjqgFE=;
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1odMXZ-0055eC-08 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Sep 2022 02:11:17 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4McfzD2Ch1zpVML;
 Wed, 28 Sep 2022 10:08:08 +0800 (CST)
Received: from kwepemm000014.china.huawei.com (7.193.23.6) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 28 Sep 2022 10:11:04 +0800
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 kwepemm000014.china.huawei.com (7.193.23.6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 28 Sep 2022 10:11:03 +0800
Received: from kwepemm600014.china.huawei.com ([7.193.23.54]) by
 kwepemm600014.china.huawei.com ([7.193.23.54]) with mapi id 15.01.2375.031;
 Wed, 28 Sep 2022 10:11:03 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
Thread-Topic: [f2fs-dev] [PATCH] mkfs.f2fs: update allocation policy for ro
 feature
Thread-Index: AQHY0Om5Gb87Y4MWzUaw9McrH3kN7q3y9+iAgAEf1DA=
Date: Wed, 28 Sep 2022 02:11:03 +0000
Message-ID: <75b9bfd8d6ea4674914119edbee2e6a7@huawei.com>
References: <20220925055802.11955-1-chao@kernel.org>
 <YzMnm4vx7dxb+vAA@google.com>
In-Reply-To: <YzMnm4vx7dxb+vAA@google.com>
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
 Content preview:  > On 09/25, Chao Yu wrote: > > Update allocation policy for
 ro feature: > > - hot_data: allocating blocks by LBA ascending order > >
 - hot_node: allocating blocks by LBA descending order > > This will [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.187 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1odMXZ-0055eC-08
Subject: [f2fs-dev] =?gb2312?b?tPC4tDogIFtQQVRDSF0gbWtmcy5mMmZzOiB1cGRh?=
 =?gb2312?b?dGUgYWxsb2NhdGlvbiBwb2xpY3kgZm9yIHJvIGZlYXR1cmU=?=
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

> On 09/25, Chao Yu wrote:
> > Update allocation policy for ro feature:
> > - hot_data: allocating blocks by LBA ascending order
> > - hot_node: allocating blocks by LBA descending order
> 
> This will increase the RO image size.
> 
> >
> > Signed-off-by: Chao Yu <chao@kernel.org>
> > ---
> >  mkfs/f2fs_format.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c index
> > 40ac589..8d0f410 100644
> > --- a/mkfs/f2fs_format.c
> > +++ b/mkfs/f2fs_format.c
> > @@ -544,10 +544,10 @@ static int f2fs_prepare_super_block(void)
> >  	}
> >
> >  	if (c.feature & cpu_to_le32(F2FS_FEATURE_RO)) {
> > -		c.cur_seg[CURSEG_HOT_NODE] = 0;
> > +		c.cur_seg[CURSEG_HOT_NODE] =
> last_section(last_zone(total_zones));
> >  		c.cur_seg[CURSEG_WARM_NODE] = 0;
> >  		c.cur_seg[CURSEG_COLD_NODE] = 0;
> > -		c.cur_seg[CURSEG_HOT_DATA] = 1;
> > +		c.cur_seg[CURSEG_HOT_DATA] = 0;

Hi,

I want to know that, does this change try to reduce the possibility of the 3rd situation that
previous referred (f2fs: extent cache: support extent for no-compressed file)? The largest
extent maybe only cover one part of continuous blocks in f2fs ro-image.

Thanks,

> >  		c.cur_seg[CURSEG_COLD_DATA] = 0;
> >  		c.cur_seg[CURSEG_WARM_DATA] = 0;
> >  	} else if (c.heap) {
> > --
> > 2.36.1
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
