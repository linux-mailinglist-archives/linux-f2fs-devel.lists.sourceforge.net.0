Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7A949E05C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Jan 2022 12:12:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nD2ha-00018q-DU; Thu, 27 Jan 2022 11:12:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jlayton@kernel.org>) id 1nD2hZ-00018a-5c
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 27 Jan 2022 11:12:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1JKwaqpZCdZgHbwr4QtAQyvcbn7cQQ+NNBT5zYIJnrU=; b=caY99Vl+S5ONxeK1cp2aojntZK
 xunPLTLvNr1hbrp6+yEE0lsxOkq6v4XJICx0wsrxfgbFhlC9p05kNzFQX7n7wBXMnZIOTk09pZNHx
 36b3WSdmuqDQ4UYQP9DtgsSdj2eJmfwP9sGIRjw+QvZFDtiLaNWWreS5fYaBB5LgUuWI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1JKwaqpZCdZgHbwr4QtAQyvcbn7cQQ+NNBT5zYIJnrU=; b=mdPex/UDNBz1SoMnbGCojylVYi
 bFtkj2baLAUmy65QtP+jOktRmEsfgL9TEY545gDW/1ZsSQtodgGBXgb0UPSUwMHv873IZzN3C2sec
 FGP7ykaDbJfKM4Ao+smFqaEVCjG+JaLwvv91yv1S5YtYxPATF486YgjNi+epAetiugKs=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1nD2hW-00045U-I1
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 27 Jan 2022 11:12:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3905CB820FC;
 Thu, 27 Jan 2022 11:12:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A0ECC340E4;
 Thu, 27 Jan 2022 11:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643281939;
 bh=V5HYgTWJFQ5JJsKuBtDbntq5jM8gqYnHqlB+WwVQUg0=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=qs+oygNUvOkZojCS4tbIHBbHNnN2c83jSwVTtC+PXReiKpUgTryV/Jn9i4kA11TCx
 wQIA8T/xXWysKr5FVnBsdp7s6T57gZuXoA8b+6AKW4GBWhPcMDiC878wFDfjGOUfSX
 5ddnmsg5pr+FfS6jpyfRuWWfH+qIetrTGJZM1PAYwXCjUJyQB7D1Wcs5o++QKht+ze
 N6Qaj6XKvoxOKPWxiTmKIzgNkaDO61bAS7aaPRXf+qfG+7pz/a1932PlgtYdjIokd4
 zXshthMZgvLd9Pe0iKyNgu1FzP9P91fWoKA6y5OydLOCZNYRF9sJ2Iz0TLFNBDx5FN
 vYRqTrnWEMhKw==
Message-ID: <2e66ef3e8f5df0529d3c289f8ed0be6a051d95ea.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: NeilBrown <neilb@suse.de>, Andrew Morton <akpm@linux-foundation.org>, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, Ilya Dryomov
 <idryomov@gmail.com>, Miklos Szeredi <miklos@szeredi.hu>, Trond Myklebust
 <trond.myklebust@hammerspace.com>, Anna Schumaker
 <anna.schumaker@netapp.com>, Ryusuke Konishi <konishi.ryusuke@gmail.com>, 
 "Darrick J. Wong" <djwong@kernel.org>, Philipp Reisner
 <philipp.reisner@linbit.com>, Lars Ellenberg <lars.ellenberg@linbit.com>,
 Paolo Valente <paolo.valente@linaro.org>, Jens Axboe <axboe@kernel.dk>
Date: Thu, 27 Jan 2022 06:12:15 -0500
In-Reply-To: <164325158958.29787.8840004338500709466.stgit@noble.brown>
References: <164325106958.29787.4865219843242892726.stgit@noble.brown>
 <164325158958.29787.8840004338500709466.stgit@noble.brown>
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35) 
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, 2022-01-27 at 13:46 +1100, NeilBrown wrote: > The
 bdi congestion framework is no-longer used - writeback uses other > mechanisms
 to manage throughput. > > So remove calls to set_bdi_congested( [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nD2hW-00045U-I1
Subject: Re: [f2fs-dev] [PATCH 5/9] cephfs: don't set/clear bdi_congestion
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
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, 2022-01-27 at 13:46 +1100, NeilBrown wrote:
> The bdi congestion framework is no-longer used - writeback uses other
> mechanisms to manage throughput.
> 
> So remove calls to set_bdi_congested() and clear_bdi_congested(), and
> remove the writeback_count which is used only to guide the setting and
> clearing.
> 
> The congestion_kb mount option is no longer meaningful, but as it is
> visible to user-space, removing it needs more consideration.
> 
> Signed-off-by: NeilBrown <neilb@suse.de>
> ---
>  fs/ceph/addr.c  |   27 ---------------------------
>  fs/ceph/super.c |    2 --
>  fs/ceph/super.h |    2 --
>  3 files changed, 31 deletions(-)
> 
> diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
> index c98e5238a1b6..9147667f8cd5 100644
> --- a/fs/ceph/addr.c
> +++ b/fs/ceph/addr.c
> @@ -57,11 +57,6 @@
>   * accounting is preserved.
>   */
>  
> -#define CONGESTION_ON_THRESH(congestion_kb) (congestion_kb >> (PAGE_SHIFT-10))
> -#define CONGESTION_OFF_THRESH(congestion_kb)				\
> -	(CONGESTION_ON_THRESH(congestion_kb) -				\
> -	 (CONGESTION_ON_THRESH(congestion_kb) >> 2))
> -
>  static int ceph_netfs_check_write_begin(struct file *file, loff_t pos, unsigned int len,
>  					struct folio *folio, void **_fsdata);
>  
> @@ -561,10 +556,6 @@ static int writepage_nounlock(struct page *page, struct writeback_control *wbc)
>  	dout("writepage %p page %p index %lu on %llu~%llu snapc %p seq %lld\n",
>  	     inode, page, page->index, page_off, len, snapc, snapc->seq);
>  
> -	if (atomic_long_inc_return(&fsc->writeback_count) >
> -	    CONGESTION_ON_THRESH(fsc->mount_options->congestion_kb))
> -		set_bdi_congested(inode_to_bdi(inode), BLK_RW_ASYNC);
> -
>  	req = ceph_osdc_new_request(osdc, &ci->i_layout, ceph_vino(inode), page_off, &len, 0, 1,
>  				    CEPH_OSD_OP_WRITE, CEPH_OSD_FLAG_WRITE, snapc,
>  				    ceph_wbc.truncate_seq, ceph_wbc.truncate_size,
> @@ -621,10 +612,6 @@ static int writepage_nounlock(struct page *page, struct writeback_control *wbc)
>  	ceph_put_wrbuffer_cap_refs(ci, 1, snapc);
>  	ceph_put_snap_context(snapc);  /* page's reference */
>  
> -	if (atomic_long_dec_return(&fsc->writeback_count) <
> -	    CONGESTION_OFF_THRESH(fsc->mount_options->congestion_kb))
> -		clear_bdi_congested(inode_to_bdi(inode), BLK_RW_ASYNC);
> -
>  	return err;
>  }
>  
> @@ -704,12 +691,6 @@ static void writepages_finish(struct ceph_osd_request *req)
>  			BUG_ON(!page);
>  			WARN_ON(!PageUptodate(page));
>  
> -			if (atomic_long_dec_return(&fsc->writeback_count) <
> -			     CONGESTION_OFF_THRESH(
> -					fsc->mount_options->congestion_kb))
> -				clear_bdi_congested(inode_to_bdi(inode),
> -						    BLK_RW_ASYNC);
> -
>  			ceph_put_snap_context(detach_page_private(page));
>  			end_page_writeback(page);
>  			dout("unlocking %p\n", page);
> @@ -952,14 +933,6 @@ static int ceph_writepages_start(struct address_space *mapping,
>  			dout("%p will write page %p idx %lu\n",
>  			     inode, page, page->index);
>  
> -			if (atomic_long_inc_return(&fsc->writeback_count) >
> -			    CONGESTION_ON_THRESH(
> -				    fsc->mount_options->congestion_kb)) {
> -				set_bdi_congested(inode_to_bdi(inode),
> -						  BLK_RW_ASYNC);
> -			}
> -
> -
>  			pages[locked_pages++] = page;
>  			pvec.pages[i] = NULL;
>  
> diff --git a/fs/ceph/super.c b/fs/ceph/super.c
> index bf79f369aec6..b2f38af9fca8 100644
> --- a/fs/ceph/super.c
> +++ b/fs/ceph/super.c
> @@ -801,8 +801,6 @@ static struct ceph_fs_client *create_fs_client(struct ceph_mount_options *fsopt,
>  	fsc->filp_gen = 1;
>  	fsc->have_copy_from2 = true;
>  
> -	atomic_long_set(&fsc->writeback_count, 0);
> -
>  	err = -ENOMEM;
>  	/*
>  	 * The number of concurrent works can be high but they don't need
> diff --git a/fs/ceph/super.h b/fs/ceph/super.h
> index 67f145e1ae7a..fc58adf1d36a 100644
> --- a/fs/ceph/super.h
> +++ b/fs/ceph/super.h
> @@ -120,8 +120,6 @@ struct ceph_fs_client {
>  
>  	struct ceph_mds_client *mdsc;
>  
> -	atomic_long_t writeback_count;
> -
>  	struct workqueue_struct *inode_wq;
>  	struct workqueue_struct *cap_wq;
>  
> 
> 

Thanks Neil.

I'll plan to pull this into the ceph testing branch and do some testing
with it, but at a quick glance I don't forsee any issues. This should
make v5.18, but we may be able to get it in sooner.
-- 
Jeff Layton <jlayton@kernel.org>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
