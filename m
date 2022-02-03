Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5374A7D89
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Feb 2022 02:51:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nFRHw-0002Cj-6j; Thu, 03 Feb 2022 01:51:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nFRHu-0002Cc-0R
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Feb 2022 01:51:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TFYlKFgP0v+J7uoZm+hN0l73jxmz0VMctXOcFuOgzGE=; b=ahiewil+ZGkl3QzmXEyLgHuYPB
 KT1UPCmA/dirSxSY3a5qGddHDsFiOKS1XVDZNs+HSaPpANBPbKeQw9k1XNxrUWNDDuetQdKWeiTaq
 /yJ0I/8Isx2zPUZZJawAMCdI85+TKH2gyf0QgldS5OuvXF5y7FZZZxdr/O0Gi06g0D+k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TFYlKFgP0v+J7uoZm+hN0l73jxmz0VMctXOcFuOgzGE=; b=eEfPO0z0vGczqCIjBIUBwNl+wV
 WDelIgB+mTzJxE054WjBFNaeV3QR9Ln1u3XIRpfUhdHYz7ngOH2f8+8VH3DrEJu7FB8jQWn0aL8A4
 45/JYJHcbYFWIrAELRSC15gQcde9jorHxBhQerL2i3ZHMVNDW1XODcOnmSI0QKhIhdVM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nFRHq-00EDXV-4M
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Feb 2022 01:51:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ED1C6612B9;
 Thu,  3 Feb 2022 01:51:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B437C004E1;
 Thu,  3 Feb 2022 01:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643853099;
 bh=5xWMoKazPBC7l0qgnFDC3xj6OCZTLGyt4YlZVtHxSeE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ufs5LljrmMBqF2sJN+x2I2nMIQGp1G+e9lt0ne6Di5D8BOUMCTIm7y0m+Lc3ZVJYn
 l0xEFSmgeNSgvZGlTCuT13JrCpLt2gvRJ9Ye39e668VAV/d624+Z29xNZgdameXg1M
 V+58ONiSVJmoo6uznFybe04Jh8v5IBzpSaIffE0MXRCevOMGYwlulFB4xOd/ycjk2B
 pRxaSA1HoZYuR1dSBYocVl7akzZsjdSHmEQK35BISYHYOr549nukIt1SYA+XuDF1Ne
 TyxORKH4ADCC+cdCkYOLexQYWLocX+eVxPpj4tFepQdU7fnSq7EgsXgCnvtSxGmBbZ
 X8+PjhC1EHnEw==
Date: Wed, 2 Feb 2022 17:51:37 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <Yfs1KRgwgzSOvocR@google.com>
References: <20220127054449.24711-1-chao@kernel.org>
 <YfMVxzdhat01ca7m@google.com>
 <e434b0a4-a66a-eebc-cafc-f0bad03c3fa5@kernel.org>
 <YfSMMpj2GrYXAJK2@google.com>
 <51be77f1-6e85-d46d-d0d3-c06d2055a190@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <51be77f1-6e85-d46d-d0d3-c06d2055a190@kernel.org>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 01/29, Chao Yu wrote: > On 2022/1/29 8:37, Jaegeuk Kim
 wrote: > > On 01/28, Chao Yu wrote: > > > On 2022/1/28 5:59, Jaegeuk Kim wrote:
 > > > > On 01/27, Chao Yu wrote: > > > > > Quoted from Jing Xi [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nFRHq-00EDXV-4M
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid potential deadlock
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
Cc: Jing Xia <jing.xia@unisoc.com>, Zhiguo Niu <zhiguo.niu@unisoc.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 01/29, Chao Yu wrote:
> On 2022/1/29 8:37, Jaegeuk Kim wrote:
> > On 01/28, Chao Yu wrote:
> > > On 2022/1/28 5:59, Jaegeuk Kim wrote:
> > > > On 01/27, Chao Yu wrote:
> > > > > Quoted from Jing Xia's report, there is a potential deadlock may happen
> > > > > between kworker and checkpoint as below:
> > > > > 
> > > > > [T:writeback]				[T:checkpoint]
> > > > > - wb_writeback
> > > > >    - blk_start_plug
> > > > > bio contains NodeA was plugged in writeback threads
> > > > 
> > > > I'm still trying to understand more precisely. So, how is it possible to
> > > > have bio having node write in this current context?
> > > 
> > > IMO, after above blk_start_plug(), it may plug some inode's node page in kworker
> > > during writebacking node_inode's data page (which should be node page)?
> > 
> > Wasn't that added into a different task->plug?
> 
> I'm not sure I've got your concern correctly...
> 
> Do you mean NodeA and other IOs from do_writepages() were plugged in
> different local plug variables?

I think so.

> 
> Thanks,
> 
> > 
> > > 
> > > Thanks,
> > > 
> > > > 
> > > > > 					- do_writepages  -- sync write inodeB, inc wb_sync_req[DATA]
> > > > > 					 - f2fs_write_data_pages
> > > > > 					  - f2fs_write_single_data_page -- write last dirty page
> > > > > 					   - f2fs_do_write_data_page
> > > > > 					    - set_page_writeback  -- clear page dirty flag and
> > > > > 					    PAGECACHE_TAG_DIRTY tag in radix tree
> > > > > 					    - f2fs_outplace_write_data
> > > > > 					     - f2fs_update_data_blkaddr
> > > > > 					      - f2fs_wait_on_page_writeback -- wait NodeA to writeback here
> > > > > 					   - inode_dec_dirty_pages
> > > > >    - writeback_sb_inodes
> > > > >     - writeback_single_inode
> > > > >      - do_writepages
> > > > >       - f2fs_write_data_pages -- skip writepages due to wb_sync_req[DATA]
> > > > >        - wbc->pages_skipped += get_dirty_pages() -- PAGECACHE_TAG_DIRTY is not set but get_dirty_pages() returns one
> > > > >     - requeue_inode -- requeue inode to wb->b_dirty queue due to non-zero.pages_skipped
> > > > >    - blk_finish_plug
> > > > > 
> > > > > Let's try to avoid deadlock condition by forcing unplugging previous bio via
> > > > > blk_finish_plug(current->plug) once we'v skipped writeback in writepages()
> > > > > due to valid sbi->wb_sync_req[DATA/NODE].
> > > > > 
> > > > > Fixes: 687de7f1010c ("f2fs: avoid IO split due to mixed WB_SYNC_ALL and WB_SYNC_NONE")
> > > > > Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> > > > > Signed-off-by: Jing Xia <jing.xia@unisoc.com>
> > > > > Signed-off-by: Chao Yu <chao@kernel.org>
> > > > > ---
> > > > >    fs/f2fs/data.c | 6 +++++-
> > > > >    fs/f2fs/node.c | 6 +++++-
> > > > >    2 files changed, 10 insertions(+), 2 deletions(-)
> > > > > 
> > > > > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> > > > > index 76d6fe7b0c8f..932a4c81acaf 100644
> > > > > --- a/fs/f2fs/data.c
> > > > > +++ b/fs/f2fs/data.c
> > > > > @@ -3174,8 +3174,12 @@ static int __f2fs_write_data_pages(struct address_space *mapping,
> > > > >    	/* to avoid spliting IOs due to mixed WB_SYNC_ALL and WB_SYNC_NONE */
> > > > >    	if (wbc->sync_mode == WB_SYNC_ALL)
> > > > >    		atomic_inc(&sbi->wb_sync_req[DATA]);
> > > > > -	else if (atomic_read(&sbi->wb_sync_req[DATA]))
> > > > > +	else if (atomic_read(&sbi->wb_sync_req[DATA])) {
> > > > > +		/* to avoid potential deadlock */
> > > > > +		if (current->plug)
> > > > > +			blk_finish_plug(current->plug);
> > > > >    		goto skip_write;
> > > > > +	}
> > > > >    	if (__should_serialize_io(inode, wbc)) {
> > > > >    		mutex_lock(&sbi->writepages);
> > > > > diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> > > > > index 556fcd8457f3..69c6bcaf5aae 100644
> > > > > --- a/fs/f2fs/node.c
> > > > > +++ b/fs/f2fs/node.c
> > > > > @@ -2106,8 +2106,12 @@ static int f2fs_write_node_pages(struct address_space *mapping,
> > > > >    	if (wbc->sync_mode == WB_SYNC_ALL)
> > > > >    		atomic_inc(&sbi->wb_sync_req[NODE]);
> > > > > -	else if (atomic_read(&sbi->wb_sync_req[NODE]))
> > > > > +	else if (atomic_read(&sbi->wb_sync_req[NODE])) {
> > > > > +		/* to avoid potential deadlock */
> > > > > +		if (current->plug)
> > > > > +			blk_finish_plug(current->plug);
> > > > >    		goto skip_write;
> > > > > +	}
> > > > >    	trace_f2fs_writepages(mapping->host, wbc, NODE);
> > > > > -- 
> > > > > 2.32.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
