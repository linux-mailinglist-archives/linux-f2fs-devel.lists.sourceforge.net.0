Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F3A8F844
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Aug 2019 03:03:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hyQeN-0007Cl-1e; Fri, 16 Aug 2019 01:03:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1hyQeL-0007CY-8y
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Aug 2019 01:03:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7H4KuDUhuDGOLu2fPdaF4S5g/z2zE7lvQUd8rG+kclY=; b=Dv6P5cbPT0u6YEoFfYtP/vWieW
 6aBjGAf2MBSMWgREcsZr1NYSUwolJmKDSrwJ9TCfBMhgLtQuUnPVJGOcKh/sWEfrcS1yq8ajYO5u2
 KBnMgFJyVX6Ms6U5rliALiO5G+MNdlG7KZerlKD/DJt8Z6DDI3Bgf1sxoZ4Tl2SaLJQE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7H4KuDUhuDGOLu2fPdaF4S5g/z2zE7lvQUd8rG+kclY=; b=gF5P1YL8V5QV5zFfTcSox8NdVb
 TR/d1/BJQCNfKvGi20hXI1gRo+lMvFbPWfM452ix8f8Ji6F0HnruWx9MSbNIWh3k3DJAen4BK+x46
 SMtHVyztmP4ACEDXfFVuLAsjl1iR9fTItJ52SXKXSpblKG9p1UHRwh+1NxlAAQGe3n7s=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hyQe5-007ipR-Kq
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Aug 2019 01:03:25 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E8928206C1;
 Fri, 16 Aug 2019 01:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565917384;
 bh=wOWdUettUhbb4WB9IE23ORfMqjoQ3+VRxh+Gxc33AyU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KPsQ+kT/6Urc5NSQV9nG9U/l7Sj3T0j+5sdjQinjJ1POtBVEM+HobnEOr35itrbz2
 oEOwdaeTLplEsNL9dPdVpou+T/VfCSDnhjV0MKuRYzReIFKQHdaHE/FXCzYuhcs+yu
 I6FYYWHBEj8kA3P9qIQiSrZpy9MA/z1RS7IaQVw8=
Date: Thu, 15 Aug 2019 18:03:03 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20190816010303.GA66488@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190812114527.34613-1-yuchao0@huawei.com>
 <20190815223934.GB61672@jaegeuk-macbookpro.roam.corp.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190815223934.GB61672@jaegeuk-macbookpro.roam.corp.google.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 TIME_LIMIT_EXCEEDED    Exceeded time limit / deadline
X-Headers-End: 1hyQe5-007ipR-Kq
Subject: Re: [f2fs-dev] [PATCH 1/4] fsck.f2fs: fix to recover out-of-border
 inline size
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 08/15, Jaegeuk Kim wrote:
> On 08/12, Chao Yu wrote:
> > It tries to let fsck be noticed wrong inline size, and do the fix.
> > 
> > Signed-off-by: Chao Yu <yuchao0@huawei.com>
> > ---
> >  fsck/fsck.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/fsck/fsck.c b/fsck/fsck.c
> > index d53317c..7eb599d 100644
> > --- a/fsck/fsck.c
> > +++ b/fsck/fsck.c
> > @@ -771,6 +771,8 @@ void fsck_chk_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
> >  	ofs = get_extra_isize(node_blk);
> >  
> >  	if ((node_blk->i.i_inline & F2FS_INLINE_DATA)) {
> > +		unsigned int inline_size = MAX_INLINE_DATA(node_blk);
> > +
> >  		if (le32_to_cpu(node_blk->i.i_addr[ofs]) != 0) {
> >  			/* should fix this bug all the time */
> >  			FIX_MSG("inline_data has wrong 0'th block = %x",
> > @@ -779,6 +781,12 @@ void fsck_chk_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
> >  			node_blk->i.i_blocks = cpu_to_le64(*blk_cnt);
> >  			need_fix = 1;
> >  		}
> > +		if (!i_size || i_size > inline_size) {
> 
> i_size=0 should be fine?

Missed v2.

> 
> > +			node_blk->i.i_size = cpu_to_le64(inline_size);
> > +			FIX_MSG("inline_data has wrong i_size %lu",
> > +						(unsigned long)i_size);
> > +			need_fix = 1;
> > +		}
> >  		if (!(node_blk->i.i_inline & F2FS_DATA_EXIST)) {
> >  			char buf[MAX_INLINE_DATA(node_blk)];
> >  			memset(buf, 0, MAX_INLINE_DATA(node_blk));
> > -- 
> > 2.18.0.rc1
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
