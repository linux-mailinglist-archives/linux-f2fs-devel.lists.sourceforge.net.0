Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6D4681F36
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 31 Jan 2023 00:00:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pMd8U-0004yJ-Hf;
	Mon, 30 Jan 2023 23:00:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pMd8S-0004y7-T4
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Jan 2023 23:00:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AdMt85tYZ5Jv8O0PNu7VsLHFjODIDwPP/RgeKsXDHyI=; b=EVutQc5dZnQ3B8I+CCPlCLgRH8
 S9UUN6rg+75neDtTIdC9FSMWE6KRUSpVz6rhbwRVfHjbLlDJtxIX4htcQpDfvPyzxnpZ79ds5o1nc
 vrIXb25SHxCJCfBWMZ7yp8Q2LWuy/H1Ks3N5fJmdFAgA8Amj+oY4fNIXWPf4OkLdMysw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AdMt85tYZ5Jv8O0PNu7VsLHFjODIDwPP/RgeKsXDHyI=; b=M736Eqh6Pe9NqMLqR6NzrDFZ3H
 r2KMWxU1WLPx3bU3oCxAZJoJBeUPjcW7cZ2x92n6J1wZv/IWHy2x2JF7ZfOtUVW2Epq0pTx275oiB
 dgrxGj9Tz74rdgIMKyfe4Cm4zBh3Tu62f40WOu4QIISCl9ngGV5WPra2p2Ag+gPak2HY=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pMd8Q-0002fM-8e for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Jan 2023 23:00:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BCDC2B816AA;
 Mon, 30 Jan 2023 23:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E336C433D2;
 Mon, 30 Jan 2023 23:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675119615;
 bh=DlN53o7IVttqfaO+XI+AgKN6LdvPF0HyJERncPThIPM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ObNB60Is0uSRjMGdWrhgQkHAEMN5R/nwFjCvBVRgg097PrHunZrXNtjsfyDJnfCFE
 MSwbL+YD+nNk/R6lYDngG3+oBpyCafW4e5T8L+4yymj5NrySJ47uClDIl/q+w7fwnS
 WtsCn001k7ANV6m4QBsRwHS2YSnum5Yg4hWyaklukZKmcuXUccqjz6ljmv6I9H/eWB
 WhtD56q5kYETlbgMHlrTHXLaL7RdsCEOI7v7agxU6WqgCybBCPqC+2R8Hcs7NlvytI
 8W4I4IXQofuDlW7kUBZNpPDRHmc1RzEWxAeQyOh3lh4tOKEt/DwuxexK1x2UATVZG2
 cOIywl2aCi98g==
Date: Mon, 30 Jan 2023 15:00:13 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <Y9hL/Z2TSCRzmHiy@google.com>
References: <20230119063625.466485-1-hch@lst.de>
 <20230119063625.466485-5-hch@lst.de>
 <3e0e4fa3-f1d1-a8f0-507a-e9321dcc759f@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3e0e4fa3-f1d1-a8f0-507a-e9321dcc759f@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 01/29, Chao Yu wrote: > On 2023/1/19 14:36,
 Christoph Hellwig
 wrote: > > Factor the logic to log a path for reads and writs into a helper
 > > shared between the read_iter and write_iter methods. > [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pMd8Q-0002fM-8e
Subject: Re: [f2fs-dev] [PATCH 4/8] f2fs: factor the read/write tracing
 logic into a helper
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
Cc: Christoph Hellwig <hch@lst.de>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 01/29, Chao Yu wrote:
> On 2023/1/19 14:36, Christoph Hellwig wrote:
> > Factor the logic to log a path for reads and writs into a helper
> > shared between the read_iter and write_iter methods.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > ---
> >   fs/f2fs/file.c | 60 +++++++++++++++++++++-----------------------------
> >   1 file changed, 25 insertions(+), 35 deletions(-)
> > 
> > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > index f5c1b78149540c..305be6ac024196 100644
> > --- a/fs/f2fs/file.c
> > +++ b/fs/f2fs/file.c
> > @@ -4340,6 +4340,27 @@ static ssize_t f2fs_dio_read_iter(struct kiocb *iocb, struct iov_iter *to)
> >   	return ret;
> >   }
> > +static void f2fs_trace_rw_file_path(struct kiocb *iocb, size_t count, int rw)
> > +{
> > +	struct inode *inode = file_inode(iocb->ki_filp);
> > +	char *buf, *path;
> > +
> > +	buf = f2fs_kmalloc(F2FS_I_SB(inode), PATH_MAX, GFP_KERNEL);
> > +	if (!buf)
> > +		return;
> > +	path = dentry_path_raw(file_dentry(iocb->ki_filp), buf, PATH_MAX);
> > +	if (IS_ERR(path))
> > +		goto free_buf;
> > +	if (rw == WRITE)
> > +		trace_f2fs_datawrite_start(inode, iocb->ki_pos, count,
> > +				current->pid, path, current->comm);
> > +	else
> > +		trace_f2fs_dataread_start(inode, iocb->ki_pos, count,
> > +				current->pid, path, current->comm);
> > +free_buf:
> > +	kfree(buf);
> > +}
> > +
> >   static ssize_t f2fs_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
> >   {
> >   	struct inode *inode = file_inode(iocb->ki_filp);
> > @@ -4349,24 +4370,9 @@ static ssize_t f2fs_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
> >   	if (!f2fs_is_compress_backend_ready(inode))
> >   		return -EOPNOTSUPP;
> > -	if (trace_f2fs_dataread_start_enabled()) {
> > -		char *p = f2fs_kmalloc(F2FS_I_SB(inode), PATH_MAX, GFP_KERNEL);
> > -		char *path;
> > -
> > -		if (!p)
> > -			goto skip_read_trace;
> > +	if (trace_f2fs_dataread_start_enabled())
> > +		f2fs_trace_rw_file_path(iocb, iov_iter_count(to), READ);
> > -		path = dentry_path_raw(file_dentry(iocb->ki_filp), p, PATH_MAX);
> > -		if (IS_ERR(path)) {
> > -			kfree(p);
> > -			goto skip_read_trace;
> > -		}
> > -
> > -		trace_f2fs_dataread_start(inode, pos, iov_iter_count(to),
> > -					current->pid, path, current->comm);
> > -		kfree(p);
> > -	}
> > -skip_read_trace:
> >   	if (f2fs_should_use_dio(inode, iocb, to)) {
> >   		ret = f2fs_dio_read_iter(iocb, to);
> >   	} else {
> > @@ -4672,24 +4678,8 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
> >   	if (preallocated < 0) {
> >   		ret = preallocated;
> >   	} else {
> > -		if (trace_f2fs_datawrite_start_enabled()) {
> > -			char *p = f2fs_kmalloc(F2FS_I_SB(inode),
> > -						PATH_MAX, GFP_KERNEL);
> > -			char *path;
> > -
> > -			if (!p)
> > -				goto skip_write_trace;
> > -			path = dentry_path_raw(file_dentry(iocb->ki_filp),
> > -								p, PATH_MAX);
> > -			if (IS_ERR(path)) {
> > -				kfree(p);
> > -				goto skip_write_trace;
> > -			}
> > -			trace_f2fs_datawrite_start(inode, orig_pos, orig_count,
> > -					current->pid, path, current->comm);
> > -			kfree(p);
> > -		}
> > -skip_write_trace:
> > +		f2fs_trace_rw_file_path(iocb, orig_count, WRITE);
> 
> if (trace_f2fs_datawrite_start_enabled())
> 	f2fs_trace_rw_file_path(..);

I queued the patch with this change in dev-test first.

Thanks,

> 
> Thanks,
> 
> > +
> >   		/* Do the actual write. */
> >   		ret = dio ?
> >   			f2fs_dio_write_iter(iocb, from, &may_need_sync) :


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
