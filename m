Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEE55BCB5B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Sep 2022 14:00:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oaFRZ-0005Zl-UL;
	Mon, 19 Sep 2022 12:00:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhangqilong3@huawei.com>) id 1oaFRX-0005Zf-V0
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Sep 2022 12:00:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N+Un4eY9JOLEidfA5fri4igNyZ+BsC0A2m54HIFv574=; b=AR+KfRcSmxluCpm9Sy1s0ucyrJ
 76NR64rb09ZpjEe79D1INhwo9T1AydLRbWwX5sTz744823gAH7xU6ucFBwCrlb2AdslJmCpIlc/+N
 LZq54c7CxQRwFun0McdtssW9/Alw8KNYekhk6gNfvn57d3FsSLXree+N9+reclqGvPGY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=N+Un4eY9JOLEidfA5fri4igNyZ+BsC0A2m54HIFv574=; b=eli1hDDi7jt5IT2X6ke9IixvFB
 EOysq3wY1D0qvHctdu7oxbFXlWYal03YYkSeb1r5/OmlweUCqbV0Y0CU4tPiladud3jWeV3twPISF
 vz73+t0NUfkEzbkfmEhMjA+A4U+hGrmdi5AFkpaL9IPMzEpNSGsGFzMYMLaj6cKiTDCc=;
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oaFRj-0006vU-Dy for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Sep 2022 12:00:20 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MWNR65CgrzMn4j;
 Mon, 19 Sep 2022 19:55:30 +0800 (CST)
Received: from kwepemm600015.china.huawei.com (7.193.23.52) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 19 Sep 2022 20:00:10 +0800
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 kwepemm600015.china.huawei.com (7.193.23.52) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 19 Sep 2022 20:00:10 +0800
Received: from kwepemm600014.china.huawei.com ([7.193.23.54]) by
 kwepemm600014.china.huawei.com ([7.193.23.54]) with mapi id 15.01.2375.031;
 Mon, 19 Sep 2022 20:00:10 +0800
To: Chao Yu <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>
Thread-Topic: [PATCH -next] f2fs: add a trace interface for
 f2fs_update_extent_tree_range_compressed
Thread-Index: AQHYy0w3ozXFeIFk70mjO3c4+WWPXK3mo2Mg
Date: Mon, 19 Sep 2022 12:00:10 +0000
Message-ID: <f6deb275bc5441cebc20fa2369380bb7@huawei.com>
References: <20220915134408.69886-1-zhangqilong3@huawei.com>
 <2f5e8d93-ea68-70cf-4c9b-07a8bbc3220b@kernel.org>
In-Reply-To: <2f5e8d93-ea68-70cf-4c9b-07a8bbc3220b@kernel.org>
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
 Content preview:  > On 2022/9/15 21:44,
 Zhang Qilong wrote: > > For f2fs_update_extent_tree_range_compressed, 
 keeping the trace > and > > function name consistent to distinguish from
 trace of > > f2fs_update_extent_tre [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.188 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1oaFRj-0006vU-Dy
Subject: [f2fs-dev] =?utf-8?b?562U5aSNOiBbUEFUQ0ggLW5leHRdIGYyZnM6IGFkZCBh?=
 =?utf-8?q?_trace_interface_for_f2fs=5Fupdate=5Fextent=5Ftree=5Frange=5Fco?=
 =?utf-8?q?mpressed?=
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

> On 2022/9/15 21:44, Zhang Qilong wrote:
> > For f2fs_update_extent_tree_range_compressed, keeping the trace
> and
> > function name consistent to distinguish from trace of
> > f2fs_update_extent_tree_range. And we add "c_len" into the trace,
> > result like:
> >
> >    [003] .....   228.568157:
> f2fs_update_extent_tree_range_compressed:
> >                  dev = (8,0), ino = 5, pgofs = 96, blkaddr = 2548760,
> >                  len = 4, c_len = 1
> >
> > Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> > ---
> >   fs/f2fs/extent_cache.c      |  2 +-
> >   include/trace/events/f2fs.h | 36
> ++++++++++++++++++++++++++++++++++++
> >   2 files changed, 37 insertions(+), 1 deletion(-)
> >
> > diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c index
> > 761fd42c93f2..df41eca6386a 100644
> > --- a/fs/f2fs/extent_cache.c
> > +++ b/fs/f2fs/extent_cache.c
> > @@ -675,7 +675,7 @@ void
> f2fs_update_extent_tree_range_compressed(struct inode *inode,
> >   	struct rb_node **insert_p = NULL, *insert_parent = NULL;
> >   	bool leftmost = false;
> >
> > -	trace_f2fs_update_extent_tree_range(inode, fofs, blkaddr, llen);
> > +	trace_f2fs_update_extent_tree_range_compressed(inode, fofs,
> blkaddr,
> > +llen, c_len);
> >
> >   	/* it is safe here to check FI_NO_EXTENT w/o et->lock in ro image
> */
> >   	if (is_inode_flag_set(inode, FI_NO_EXTENT)) diff --git
> > a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h index
> > b262985f0c3a..54a9f6feca1b 100644
> > --- a/include/trace/events/f2fs.h
> > +++ b/include/trace/events/f2fs.h
> > @@ -1606,6 +1606,42 @@
> TRACE_EVENT(f2fs_update_extent_tree_range,
> >   		__entry->len)
> >   );
> >
> > +TRACE_EVENT(f2fs_update_extent_tree_range_compressed,
> 
> Why not adding parameter c_len in
> trace_f2fs_update_extent_tree_range()
> to avoid duplicated codes...

That is good, I have send a new patch(f2fs: add "c_len" into trace_f2fs_update_extent_tree_range for compressed file).
This session could be closed :).

Thanks.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
