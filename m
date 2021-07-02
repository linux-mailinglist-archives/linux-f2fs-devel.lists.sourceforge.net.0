Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA673B9A89
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  2 Jul 2021 03:32:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lz831-0005fV-5o; Fri, 02 Jul 2021 01:32:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lz830-0005fP-D6
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 02 Jul 2021 01:32:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ulv1FJzULn0dd9IP5aigoUr3c7XPiMg3FsuarWrDE/0=; b=J76igqKydUCD7gp80+QIPHMh5/
 UjR7jvPo7CCVi4rXxsopFOPCtNwKr6FndRD8+6zDVStNKYWArKLUGIlPzpXmptmwUzQOzsw0G0WhA
 uonN4jL0FZ34xRsNhdcFR31OMKpl5+hfp1kq9xSU0T69wgOVb+dFW0bSKXc8TxTBHYJQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ulv1FJzULn0dd9IP5aigoUr3c7XPiMg3FsuarWrDE/0=; b=fS3ijCZ0xUrrpU1E6tAzewvJcM
 TPYB2DejOfK+1CcD3/pnFJ9uUJUjoiO4ua7vUH5uYXDVc29zCs2OQgYyLAOdqZ6t1+13vw9de/lF6
 VGDx1NZjytn2sKPNNlM4ixTGEcQEJnUJAFvRKI6jiG5BnFEFLeHF/3V5Mu++ddoBUnMU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lz82p-0004Xj-SQ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 02 Jul 2021 01:32:50 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7E1AA613BC;
 Fri,  2 Jul 2021 01:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625189549;
 bh=x/cZLU8gLdFXi9n2Y5IATFQF9pEIi5JCiI99YW3rBRE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VfMcQoeK3ZoEMkwoJqws8BVhZSz4DxiT6HAGhBVmKqaAb6IiHe1b5epTXAtdDqHu+
 nDICz5+SGgFnKFT5rUk6ZhNnPoamJ1SRBNNPnmt7nCTv33T+UE8BHEAqb1hTdFVNIQ
 wF84i5f1Y0KO4H0mJCTibirBqDCk1G+4jg44w8izkKP/oeYuvNWhQr08QgSOf4EDTp
 gUbjeS9dM2p0HNPYD39d6z7jKHbCZW5MJr8rK0babaX/wSbTTGo4r4F2NUl26k3cUb
 OAF4NgUnO9wvyuWtnxO0MUMhM+n+klNroU7rjZAPXreinZx+R+QZig3c7KFytBJ9R8
 pVUhk6XvGICHg==
Date: Thu, 1 Jul 2021 18:32:28 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YN5srPRZaPN9gpZ0@google.com>
References: <20210601101024.119356-1-yuchao0@huawei.com>
 <YN32/NsjqJONbvz7@google.com>
 <648a96f7-2c83-e9ed-0cbd-4ee8e4797724@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <648a96f7-2c83-e9ed-0cbd-4ee8e4797724@kernel.org>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: mail-archive.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lz82p-0004Xj-SQ
Subject: Re: [f2fs-dev] [PATCH v2 RFC] f2fs: fix to force keeping write
 barrier for strict fsync mode
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

On 07/02, Chao Yu wrote:
> On 2021/7/2 1:10, Jaegeuk Kim wrote:
> > On 06/01, Chao Yu wrote:
> > > [1] https://www.mail-archive.com/linux-f2fs-devel@lists.sourceforge.net/msg15126.html
> > > 
> > > As [1] reported, if lower device doesn't support write barrier, in below
> > > case:
> > > 
> > > - write page #0; persist
> > > - overwrite page #0
> > > - fsync
> > >   - write data page #0 OPU into device's cache
> > >   - write inode page into device's cache
> > >   - issue flush
> > 
> > Well, we have preflush for node writes, so I don't think this is the case.
> > 
> >   fio.op_flags |= REQ_PREFLUSH | REQ_FUA;
> 
> This is only used for atomic write case, right?
> 
> I mean the common case which is called from f2fs_issue_flush() in
> f2fs_do_sync_file().

How about adding PREFLUSH when writing node blocks aligned to the above set?

> 
> And please see do_checkpoint(), we call f2fs_flush_device_cache() and
> commit_checkpoint() separately to keep persistence order of CP datas.
> 
> See commit 46706d5917f4 ("f2fs: flush cp pack except cp pack 2 page at first")
> for details.
> 
> Thanks,
> 
> > 
> > > 
> > > If SPO is triggered during flush command, inode page can be persisted
> > > before data page #0, so that after recovery, inode page can be recovered
> > > with new physical block address of data page #0, however there may
> > > contains dummy data in new physical block address.
> > > 
> > > Then what user will see is: after overwrite & fsync + SPO, old data in
> > > file was corrupted, if any user do care about such case, we can suggest
> > > user to use STRICT fsync mode, in this mode, we will force to trigger
> > > preflush command to persist data in device cache in prior to node
> > > writeback, it avoids potential data corruption during fsync().
> > > 
> > > Signed-off-by: Chao Yu <yuchao0@huawei.com>
> > > ---
> > > v2:
> > > - fix this by adding additional preflush command rather than using
> > > atomic write flow.
> > >   fs/f2fs/file.c | 14 ++++++++++++++
> > >   1 file changed, 14 insertions(+)
> > > 
> > > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > > index 7d5311d54f63..238ca2a733ac 100644
> > > --- a/fs/f2fs/file.c
> > > +++ b/fs/f2fs/file.c
> > > @@ -301,6 +301,20 @@ static int f2fs_do_sync_file(struct file *file, loff_t start, loff_t end,
> > >   				f2fs_exist_written_data(sbi, ino, UPDATE_INO))
> > >   			goto flush_out;
> > >   		goto out;
> > > +	} else {
> > > +		/*
> > > +		 * for OPU case, during fsync(), node can be persisted before
> > > +		 * data when lower device doesn't support write barrier, result
> > > +		 * in data corruption after SPO.
> > > +		 * So for strict fsync mode, force to trigger preflush to keep
> > > +		 * data/node write order to avoid potential data corruption.
> > > +		 */
> > > +		if (F2FS_OPTION(sbi).fsync_mode == FSYNC_MODE_STRICT &&
> > > +								!atomic) {
> > > +			ret = f2fs_issue_flush(sbi, inode->i_ino);
> > > +			if (ret)
> > > +				goto out;
> > > +		}
> > >   	}
> > >   go_write:
> > >   	/*
> > > -- 
> > > 2.29.2


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
