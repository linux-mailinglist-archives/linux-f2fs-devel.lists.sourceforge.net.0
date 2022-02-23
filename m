Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 925774C175B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Feb 2022 16:44:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nMtoC-0003G8-K6; Wed, 23 Feb 2022 15:44:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jlayton@kernel.org>) id 1nMtoB-0003G2-RY
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Feb 2022 15:44:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JJi8sxKVEc12op/bOFCZgFbhQnRFfPbh+mll+aEwZMg=; b=dmF3+n0lb6NHvz1yDb4Asp2xiE
 wVnQDQDLq9yP/O9PNpQpbi9bOux+HlhBjBvKe2uH3rcapr+U0vdYFqBbAQji86OSo5jTPx+KyZfAV
 0e26E2Hdv6/h2s2k+WH2Lu0aar7Zye9eaySjs8mf+IhY7ic+5Oq5ml+oeO1KxoY55Qf0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JJi8sxKVEc12op/bOFCZgFbhQnRFfPbh+mll+aEwZMg=; b=Qv6Gr0OKer1Q0uladZSoLS6urd
 zWeewXMrP5tQEiyWALZd7myjGCPdIm69KqKKe24VM7L0mqVZyuvOzURnSDZa8K4jt3geZ5Ac/8+Eg
 S3SXJL13tKOBHMkVWZix4yhVo3nkusbJLZbXVbcgmL460vKuJ+Kn/5OeAUbeXDzadCiI=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nMto5-00CcNE-QT
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Feb 2022 15:44:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3503DB82086;
 Wed, 23 Feb 2022 15:43:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 882EAC340EB;
 Wed, 23 Feb 2022 15:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645631025;
 bh=GlQlJ7gTsSs+29mQwM51uU8EyiUWcBAHlmovzgZMq5A=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=ZO1F7n8icLu0SS8LTbbOz3ZX6I0UObRkMZp430mjGi8LrVJUfF2OldgHMoIAzghD1
 At9AE3VGPsI1ocidqHDOgU8k0/e6MLECtGV+lC7G/btQp4HrkDP1F9XVJc9Yse7aUL
 mf0cqqw5PbI7fNrGwG0UzZkZyYXVB+Ml/GZggGje4XPizTwSQvNDVGk/tnmWbsfw2l
 lEnLltwKC4sGbZcxl2yUy66AgXuv+/maAOaFl30j3WzRX1NMcz+bNn6oSbA9LnFLzL
 wFifgLSN3AYjBd/Ue6eziysvQHRY1lFlZ1BnUJkJQNvSyDlpcBXxF1ZkxyYDbu3pSD
 T2gR1yrBxcBIQ==
Message-ID: <ccc81eb5c23f933137c5da8d5050540cc54e58f0.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: NeilBrown <neilb@suse.de>, Andrew Morton <akpm@linux-foundation.org>, 
 Jan Kara <jack@suse.cz>, Wu Fengguang <fengguang.wu@intel.com>, Jaegeuk Kim
 <jaegeuk@kernel.org>,  Chao Yu <chao@kernel.org>, Ilya Dryomov
 <idryomov@gmail.com>, Miklos Szeredi <miklos@szeredi.hu>,  Trond Myklebust
 <trond.myklebust@hammerspace.com>, Anna Schumaker
 <anna.schumaker@netapp.com>, Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 "Darrick J. Wong" <djwong@kernel.org>, Philipp Reisner
 <philipp.reisner@linbit.com>, Lars Ellenberg <lars.ellenberg@linbit.com>,
 Paolo Valente <paolo.valente@linaro.org>, Jens Axboe <axboe@kernel.dk>
Date: Wed, 23 Feb 2022 10:43:42 -0500
In-Reply-To: <164549983739.9187.14895675781408171186.stgit@noble.brown>
References: <164549971112.9187.16871723439770288255.stgit@noble.brown>
 <164549983739.9187.14895675781408171186.stgit@noble.brown>
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35) 
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, 2022-02-22 at 14:17 +1100, NeilBrown wrote: > The
 bdi congestion tracking in not widely used and will be removed. > > CEPHfs
 is one of a small number of filesystems that uses it, setting > jus [...]
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nMto5-00CcNE-QT
Subject: Re: [f2fs-dev] [PATCH 06/11] ceph: remove reliance on bdi congestion
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
Cc: linux-nfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, 2022-02-22 at 14:17 +1100, NeilBrown wrote:
> The bdi congestion tracking in not widely used and will be removed.
> 
> CEPHfs is one of a small number of filesystems that uses it, setting
> just the async (write) congestion flags at what it determines are
> appropriate times.
> 
> The only remaining effect of the async flag is to cause (some)
> WB_SYNC_NONE writes to be skipped.
> 
> So instead of setting the flag, set an internal flag and change:
>  - .writepages to do nothing if WB_SYNC_NONE and the flag is set
>  - .writepage to return AOP_WRITEPAGE_ACTIVATE if WB_SYNC_NONE
>     and the flag is set.
> 
> The writepages change causes a behavioural change in that pageout() can
> now return PAGE_ACTIVATE instead of PAGE_KEEP, so SetPageActive() will
> be called on the page which (I think) wil further delay the next attempt
> at writeout.  This might be a good thing.
> 
> Signed-off-by: NeilBrown <neilb@suse.de>

Maybe. I have to wonder whether all of this is really useful.

When things are congested we'll avoid trying to issue new writeback
requests. Note that we don't prevent new pages from being dirtied here -
- only their being written back.

This also doesn't do anything in the DIO or sync_write cases, so if we
lose caps or are doing DIO, we'll just keep churning out "unlimited"
writes in those cases anyway.

With ceph too, we're not likely to be dealing with a single server as
well. One OSD could be struggling to keep up but others are OK. Do we
really want to throttle writeback to the ones that are fine?

FWIW, the original patch that added this stuff was this:

commit 2baba25019ec564cd247af74013873d69a0b8190
Author: Yehuda Sadeh <yehuda@hq.newdream.net>
Date:   Fri Dec 18 13:51:57 2009 -0800

    ceph: writeback congestion control
    
    Set bdi congestion bit when amount of write data in flight exceeds adjustable
    threshold.
    
    Signed-off-by: Yehuda Sadeh <yehuda@hq.newdream.net>
    Signed-off-by: Sage Weil <sage@newdream.net>

...but it's pretty scant on details.

The only reason I can see to throttle writeback like this is to prevent
you from having too much memory tied up in writeback requests, but we
aren't limiting other requests in the same way.

Maybe we would do better to just rip this stuff out?

> ---
>  fs/ceph/addr.c  |   22 +++++++++++++---------
>  fs/ceph/super.c |    1 +
>  fs/ceph/super.h |    1 +
>  3 files changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
> index c98e5238a1b6..dc7af34640dd 100644
> --- a/fs/ceph/addr.c
> +++ b/fs/ceph/addr.c
> @@ -563,7 +563,7 @@ static int writepage_nounlock(struct page *page, struct writeback_control *wbc)
>  
>  	if (atomic_long_inc_return(&fsc->writeback_count) >
>  	    CONGESTION_ON_THRESH(fsc->mount_options->congestion_kb))
> -		set_bdi_congested(inode_to_bdi(inode), BLK_RW_ASYNC);
> +		fsc->write_congested = true;
>  
>  	req = ceph_osdc_new_request(osdc, &ci->i_layout, ceph_vino(inode), page_off, &len, 0, 1,
>  				    CEPH_OSD_OP_WRITE, CEPH_OSD_FLAG_WRITE, snapc,
> @@ -623,7 +623,7 @@ static int writepage_nounlock(struct page *page, struct writeback_control *wbc)
>  
>  	if (atomic_long_dec_return(&fsc->writeback_count) <
>  	    CONGESTION_OFF_THRESH(fsc->mount_options->congestion_kb))
> -		clear_bdi_congested(inode_to_bdi(inode), BLK_RW_ASYNC);
> +		fsc->write_congested = false;
>  
>  	return err;
>  }
> @@ -635,6 +635,10 @@ static int ceph_writepage(struct page *page, struct writeback_control *wbc)
>  	BUG_ON(!inode);
>  	ihold(inode);
>  
> +	if (wbc->sync_mode == WB_SYNC_NONE &&
> +	    ceph_inode_to_client(inode)->write_congested)
> +		return AOP_WRITEPAGE_ACTIVATE;
> +
>  	wait_on_page_fscache(page);
>  
>  	err = writepage_nounlock(page, wbc);
> @@ -707,8 +711,7 @@ static void writepages_finish(struct ceph_osd_request *req)
>  			if (atomic_long_dec_return(&fsc->writeback_count) <
>  			     CONGESTION_OFF_THRESH(
>  					fsc->mount_options->congestion_kb))
> -				clear_bdi_congested(inode_to_bdi(inode),
> -						    BLK_RW_ASYNC);
> +				fsc->write_congested = false;
>  
>  			ceph_put_snap_context(detach_page_private(page));
>  			end_page_writeback(page);
> @@ -760,6 +763,10 @@ static int ceph_writepages_start(struct address_space *mapping,
>  	bool done = false;
>  	bool caching = ceph_is_cache_enabled(inode);
>  
> +	if (wbc->sync_mode == WB_SYNC_NONE &&
> +	    fsc->write_congested)
> +		return 0;
> +
>  	dout("writepages_start %p (mode=%s)\n", inode,
>  	     wbc->sync_mode == WB_SYNC_NONE ? "NONE" :
>  	     (wbc->sync_mode == WB_SYNC_ALL ? "ALL" : "HOLD"));
> @@ -954,11 +961,8 @@ static int ceph_writepages_start(struct address_space *mapping,
>  
>  			if (atomic_long_inc_return(&fsc->writeback_count) >
>  			    CONGESTION_ON_THRESH(
> -				    fsc->mount_options->congestion_kb)) {
> -				set_bdi_congested(inode_to_bdi(inode),
> -						  BLK_RW_ASYNC);
> -			}
> -
> +				    fsc->mount_options->congestion_kb))
> +				fsc->write_congested = true;
>  
>  			pages[locked_pages++] = page;
>  			pvec.pages[i] = NULL;
> diff --git a/fs/ceph/super.c b/fs/ceph/super.c
> index bf79f369aec6..4a3b77d049c7 100644
> --- a/fs/ceph/super.c
> +++ b/fs/ceph/super.c
> @@ -802,6 +802,7 @@ static struct ceph_fs_client *create_fs_client(struct ceph_mount_options *fsopt,
>  	fsc->have_copy_from2 = true;
>  
>  	atomic_long_set(&fsc->writeback_count, 0);
> +	fsc->write_congested = false;
>  
>  	err = -ENOMEM;
>  	/*
> diff --git a/fs/ceph/super.h b/fs/ceph/super.h
> index 67f145e1ae7a..0bd97aea2319 100644
> --- a/fs/ceph/super.h
> +++ b/fs/ceph/super.h
> @@ -121,6 +121,7 @@ struct ceph_fs_client {
>  	struct ceph_mds_client *mdsc;
>  
>  	atomic_long_t writeback_count;
> +	bool write_congested;
>  
>  	struct workqueue_struct *inode_wq;
>  	struct workqueue_struct *cap_wq;
> 
> 

-- 
Jeff Layton <jlayton@kernel.org>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
