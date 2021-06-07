Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8007339E49B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Jun 2021 18:58:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lqIaC-0003Gw-71; Mon, 07 Jun 2021 16:58:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lqIaB-0003Gj-DG
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Jun 2021 16:58:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kwUPqwMcLKnOiGuTJSAVFbnwt1076LmJkRKsd/LFwe4=; b=FapiZ8kZKg+wD/OyUVYTIUwgdG
 WfJ8XTmvswwvuC3qAC98a2Upj7ysYIu7iqAiTJK5WVodeLQEtddnRrdrand0U35AA7e3W7puHzqBF
 v2/KU8RPUiTbRup0sbfQ8+Dh8NrMEGHjwdnGaioNp0KTReSON30zOSEvzVaUJPXnGrz4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kwUPqwMcLKnOiGuTJSAVFbnwt1076LmJkRKsd/LFwe4=; b=jbJLCBeCE5rU1mDiTj3gm7pDyN
 C38DVwWsEcC9w/Majw+y2f8lqR56nw477+arJH5umVcPpovXX1t5lGpUUVgTAX19hiqJWr7PKPg+y
 CrZh8f5NLyauYxvJyEKgOCqFGVDp641padpb6zVMhmC6veX4Bn1dcf6GSmKM6fecsI1c=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lqIa2-0004MW-Al
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Jun 2021 16:58:35 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C06C161003;
 Mon,  7 Jun 2021 16:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623085101;
 bh=3OHaxHnrqCqFc0XRzdeLGi3zdP/7IfOv5Abe7zqPa7A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KgtpeJ8qZx2HSNVeYNsZuWDcOfoWb8mf5uM9QGjl321kTmaTz2y+ne3B6ie9cs1K1
 Wvt8sm9k4C2IRs5qFpMiSS+aCiZpfpHrCKBnoRlQ5sshUfPDLXELSM88QG32nMlzHw
 oa1TUkrfZoCsCHncc9DFm035yv2rk0QI3wDzVAhPUFMm8p8YxEvGL+fMVjCxxJOrKH
 5lF1rQqOb3rpfy/p+pePY1x0hnKCsCk9yRyHynXyo/2iVLu4OFqwyMyioCvKinnAAc
 1t7LoUWMLrfxoTYyi+IvTJxKf1UDz9QxZPglFf2xE8EorawrGmuEN/8sKyTmTaeoxQ
 sI2CIj0ccW2NQ==
Date: Mon, 7 Jun 2021 09:58:20 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YL5QLFl4RKpL/vAR@google.com>
References: <20210605003210.856458-1-jaegeuk@kernel.org>
 <20210605003210.856458-3-jaegeuk@kernel.org>
 <YLxeynwR0v23c3sV@google.com>
 <f8edad10-dfad-d12e-9c60-e007d132fbda@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f8edad10-dfad-d12e-9c60-e007d132fbda@kernel.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lqIa2-0004MW-Al
Subject: Re: [f2fs-dev] [PATCH 3/3 v2] f2fs: clean up
 /sys/fs/f2fs/<disk>/features
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

On 06/07, Chao Yu wrote:
> On 2021/6/6 13:36, Jaegeuk Kim wrote:
> > Let's create /sys/fs/f2fs/<disk>/feature_list/ to meet sysfs rule.
> > 
> > Note that there are three feature list entries:
> > 1) /sys/fs/f2fs/features
> >    : shows runtime features supported by in-kernel f2fs along with Kconfig.
> >      - ref. F2FS_FEATURE_RO_ATTR()
> > 
> > 2) /sys/fs/f2fs/$s_id/features <deprecated>
> >    : shows on-disk features enabled by mkfs.f2fs, used for old kernels. This
> >      won't add new feature anymore, and thus, users should check entries in 3)
> >      instead of this 2).
> > 
> > 3) /sys/fs/f2fs/$s_id/feature_list
> >    : shows on-disk features enabled by mkfs.f2fs per instance, which follows
> >      sysfs entry rule where each entry should expose single value.
> >      This list covers old feature list provided by 2) and beyond. Therefore,
> >      please add new on-disk feature in this list only.
> >      - ref. F2FS_SB_FEATURE_RO_ATTR()
> > 
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> 
> Reviewed-by: Chao Yu <yuchao0@huawei.com>
> 
> > +static struct kobj_type f2fs_feature_list_ktype = {
> > +	.default_groups = f2fs_sb_feat_groups,
> > +	.sysfs_ops	= &f2fs_feature_list_attr_ops,
> > +	.release	= f2fs_feature_list_kobj_release,
> > +};
> > +
> > +
> 
> Nitpick, one redundant blank line.

Done.

> 
> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
