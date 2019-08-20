Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A47F09530B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Aug 2019 03:16:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hzsku-0002Q7-JR; Tue, 20 Aug 2019 01:16:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1hzsks-0002Pz-HH
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 20 Aug 2019 01:16:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mE0YcZq5dpTeBg0a7nFSXR7aazlBYHJPQ/LA4HCjC/8=; b=Av+3QLfUoYlbqFAvtj6XmGU4Te
 OBNwC+vQdyRgCXV60xzVtPvCUJxMN7l7mDfHbD2/69l2d/fJyn95aDkXe3+xRB/dsx7IQ3BxSLuft
 cStUb0T/ruRVp0HmufcNPUioHhFk+g4Q50TuIr6kOoWrVSejqtUcQM9hDmCe4xjezQ8E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mE0YcZq5dpTeBg0a7nFSXR7aazlBYHJPQ/LA4HCjC/8=; b=EVv5yQ4vcXyD3GD0MFnwZZGqwP
 4CE/aopflcDxqwGoQ74L0svO2VJ6G9Zx46q5EwO/gQuDhdbYjDUTZSDh4CmE4WYIpquYe/iLxLre1
 9ZIdolHLjJqpmslN4frbfKrHW++v7soZdUwhIYphxoxVEGWjWy+3ns5dGHZ9dl6B0owg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hzskr-009H6S-FC
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 20 Aug 2019 01:16:10 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C442C2070B;
 Tue, 20 Aug 2019 01:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566263763;
 bh=+BFQo2SHYjBL0mleW+nU2k80nyRU3HOJfziNAFqydrg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lBD16T4kdB2xq2stRFr+5IRQcChaEvf5zieNsvkO0EoPyKwcMPpOyYhsEmbu2I0ma
 ptcK1AxTUvLW0ZzrTD1xLxnZrRY9NbZcdErlSYxO7Gw6hOWUhObkJzlljrbMDJc4hC
 Jlf4kb9kcM/Y+V1QNqrYu3JKAZhveI+OPQRFDu64=
Date: Mon, 19 Aug 2019 18:16:02 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <20190820011602.GB45681@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190817010325.36501-1-jaegeuk@kernel.org>
 <723dac7b-2223-cf03-78ac-c417af5a404d@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <723dac7b-2223-cf03-78ac-c417af5a404d@kernel.org>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hzskr-009H6S-FC
Subject: Re: [f2fs-dev] [PATCH] fsck.f2fs: check only max extra_isize
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

On 08/18, Chao Yu wrote:
> On 2019-8-17 9:03, Jaegeuk Kim wrote:
> > If we use later kernel having larger extra_isize, old fsck will delete
> > entire old files.
> 
> Would it be better to construct the length based on existed features?

We can't judge the size for future fields.

> 
> Thanks,
> 
> > 
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > ---
> >  fsck/fsck.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/fsck/fsck.c b/fsck/fsck.c
> > index 1708abe..b4e53db 100644
> > --- a/fsck/fsck.c
> > +++ b/fsck/fsck.c
> > @@ -731,7 +731,7 @@ void fsck_chk_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
> >  	if (f2fs_has_extra_isize(&node_blk->i)) {
> >  		if (c.feature & cpu_to_le32(F2FS_FEATURE_EXTRA_ATTR)) {
> >  			if (node_blk->i.i_extra_isize >
> > -				cpu_to_le16(F2FS_TOTAL_EXTRA_ATTR_SIZE)) {
> > +						4 * DEF_ADDRS_PER_INODE) {
> >  				FIX_MSG("ino[0x%x] recover i_extra_isize "
> >  					"from %u to %u",
> >  					nid,
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
