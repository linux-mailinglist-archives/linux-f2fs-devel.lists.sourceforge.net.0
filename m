Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 697E09B2CF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Aug 2019 16:57:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i1B0d-000269-Vu; Fri, 23 Aug 2019 14:57:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1i1B0c-000261-GL
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Aug 2019 14:57:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+WsmhZfCA2XpWjQThfiUvWh9yNCwurD2aJSdDdDlMpc=; b=c1mvLSmCqz5HS14ggcjWbPita4
 bDTVHjQKspZB5mKVhQCSjRUwSwQ1G8rrQ0GLJc/2QZTk7sxh2j2mIl9dh0ubU+GS+ep/Y5zvh5nZe
 OXW5vY2NAvxBXSs3BammNuf45mnDYb5+SxFlJi0IiVJp7v31Qu1jmwZhFy1wwPANNhMI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+WsmhZfCA2XpWjQThfiUvWh9yNCwurD2aJSdDdDlMpc=; b=AyUmXNbZOg8R8sp9H5GwSabMrI
 xM5j02tvkrJ9k7RVnPiaW76Zuuoa5w+/cvB6Zt/3B1O1t4A5oVBbAi0Rt3FSndeCLro5fALLA28sr
 Vs0ddlxmdqZPT9joqFa+epQIzHiG3qj2TrfFA4ZQMc4aSf3F+FdyqdoDYn+EIam5p6/M=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i1B0a-00D5yN-N8
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Aug 2019 14:57:46 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0C57922CEC;
 Fri, 23 Aug 2019 14:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566572259;
 bh=lUZVzj62LY1E4yZhmdisUFDLbkNHl2Ewg/KwzQn5eck=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D55i0IXM4OYqcIZA6lxzHWwEBKjkxSBCkpBSixu0Osu7AcKt9NYWzKCUlRTCVroJ6
 VyZnUwoSgGFsrpK0FSnfmUuU2UuZP/JSUDEHc7Wh0LhnUaIDLpTFYvzmPWubmp3p9A
 p6X8oji0CLLMdSblC0oVI9Im0hxsT90NNA/xfUO8=
Date: Fri, 23 Aug 2019 07:57:38 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20190823145738.GA35310@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190712085542.4068-1-yuchao0@huawei.com>
 <28424a84-67aa-c8e9-99c3-475be89206ac@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <28424a84-67aa-c8e9-99c3-475be89206ac@huawei.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1i1B0a-00D5yN-N8
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: introduce {page,
 io}_is_mergeable() for readability
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

On 08/23, Chao Yu wrote:
> On 2019/7/12 16:55, Chao Yu wrote:
> > Wrap merge condition into function for readability, no logic change.
> > 
> > Signed-off-by: Chao Yu <yuchao0@huawei.com>
> > ---
> > v2: remove bio validation check in page_is_mergeable().
> >  fs/f2fs/data.c | 40 +++++++++++++++++++++++++++++++++-------
> >  1 file changed, 33 insertions(+), 7 deletions(-)
> > 
> > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> > index 6a8db4abdf5f..f1e401f9fc13 100644
> > --- a/fs/f2fs/data.c
> > +++ b/fs/f2fs/data.c
> > @@ -482,6 +482,33 @@ int f2fs_submit_page_bio(struct f2fs_io_info *fio)
> >  	return 0;
> >  }
> >  
> > +static bool page_is_mergeable(struct f2fs_sb_info *sbi, struct bio *bio,
> > +				block_t last_blkaddr, block_t cur_blkaddr)
> > +{
> > +	if (last_blkaddr != cur_blkaddr)
> 
> if (last_blkaddr + 1 != cur_blkaddr)
> 
> Merge condition is wrong here.
> 
> > +		return false;
> > +	return __same_bdev(sbi, cur_blkaddr, bio);
> > +}
> > +
> > +static bool io_type_is_mergeable(struct f2fs_bio_info *io,
> > +						struct f2fs_io_info *fio)
> > +{
> > +	if (io->fio.op != fio->op)
> > +		return false;
> > +	return io->fio.op_flags == fio->op_flags;
> > +}
> > +
> > +static bool io_is_mergeable(struct f2fs_sb_info *sbi, struct bio *bio,
> > +					struct f2fs_bio_info *io,
> > +					struct f2fs_io_info *fio,
> > +					block_t last_blkaddr,
> > +					block_t cur_blkaddr)
> > +{
> > +	if (!page_is_mergeable(sbi, bio, last_blkaddr, cur_blkaddr))
> > +		return false;
> > +	return io_type_is_mergeable(io, fio);
> > +}
> > +
> >  int f2fs_merge_page_bio(struct f2fs_io_info *fio)
> >  {
> >  	struct bio *bio = *fio->bio;
> > @@ -495,8 +522,8 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
> >  	trace_f2fs_submit_page_bio(page, fio);
> >  	f2fs_trace_ios(fio, 0);
> >  
> > -	if (bio && (*fio->last_block + 1 != fio->new_blkaddr ||
> > -			!__same_bdev(fio->sbi, fio->new_blkaddr, bio))) {
> > +	if (bio && !page_is_mergeable(fio->sbi, bio, *fio->last_block,
> > +						fio->new_blkaddr)) {
> >  		__submit_bio(fio->sbi, bio, fio->type);
> >  		bio = NULL;
> >  	}
> > @@ -569,9 +596,8 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
> >  
> >  	inc_page_count(sbi, WB_DATA_TYPE(bio_page));
> >  
> > -	if (io->bio && (io->last_block_in_bio != fio->new_blkaddr - 1 ||
> > -	    (io->fio.op != fio->op || io->fio.op_flags != fio->op_flags) ||
> > -			!__same_bdev(sbi, fio->new_blkaddr, io->bio)))
> > +	if (io->bio && !io_is_mergeable(sbi, io->bio, io, fio,
> > +			io->last_block_in_bio, fio->new_blkaddr))
> >  		__submit_merged_bio(io);
> >  alloc_new:
> >  	if (io->bio == NULL) {
> > @@ -1643,8 +1669,8 @@ static int f2fs_read_single_page(struct inode *inode, struct page *page,
> >  	 * This page will go to BIO.  Do we need to send this
> >  	 * BIO off first?
> >  	 */
> > -	if (bio && (*last_block_in_bio != block_nr - 1 ||
> > -		!__same_bdev(F2FS_I_SB(inode), block_nr, bio))) {
> > +	if (bio && !page_is_mergeable(F2FS_I_SB(inode), bio,
> > +				*last_block_in_bio, block_nr - 1)) {
> 
> *last_block_in_bio, block_nr)
> 
> Sorry, anyway, let me send v2.

Fixed, thanks,

> 
> >  submit_and_realloc:
> >  		__submit_bio(F2FS_I_SB(inode), bio, DATA);
> >  		bio = NULL;
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
