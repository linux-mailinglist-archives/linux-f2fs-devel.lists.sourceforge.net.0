Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1688267FE3B
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 29 Jan 2023 11:37:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pM53S-0006Bm-GH;
	Sun, 29 Jan 2023 10:36:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pM53N-0006BZ-FZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 29 Jan 2023 10:36:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R/V48kuzz36I6vB/dtd1Mf1ErCuMYFi4SwUs1CxrmG8=; b=TSh9Nz7g9Q+O8WSlaQVasS9u++
 HCkdJiCPXZZRImmkpfXUyGCKmT50Nnvf+VJq+MFNx6lHyWLoVVjWp0wH+BE4LDFgRjg02FDYKKUNB
 zZHCXXSasOvFRkRbCgjIZvpQOkzynzYDV/1DuW2o1gNoQP6XxriPwY5/xX8XrezHBce4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=R/V48kuzz36I6vB/dtd1Mf1ErCuMYFi4SwUs1CxrmG8=; b=HvzFpX0vtSSY4k6E1AZYyTszRL
 FJZYwV6tNrfbk+1krMwmWIdz6JlV3SkEVk5Vkhoda+W/3VPCg8tOMrsSCPQu6z8e6C21xF9PNIbKM
 ymwZ4P600Lm59ahiXqs77PnKQnktGoDF/KfmetZ4tuA/M3GN8SsydEO1GzMNrvyKnPs0=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pM53K-0006rq-I9 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 29 Jan 2023 10:36:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0E922B80BEC;
 Sun, 29 Jan 2023 10:36:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DE6FC433D2;
 Sun, 29 Jan 2023 10:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674988603;
 bh=OM/HU7ww+shmhNxrcTxaDsUcOrkwhIwggjoSNq4UhCM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Ey8hPCX1R5F+mhx9uTXtpsg77RQY+o6GBGzDs8xPeOg/kbFarGs8KKcNETo8RlAnb
 qIKYh8ikEGljfF2to+E/SbgJnr7v+jyiOpd7/kFao24TepamjFN3KFH+zeXRgHWCL+
 lVLoz+plZZfifLrBueagM1Uv3hvXHQtRxFfT6HNtydmc46i8f2vaxwcQ7rqmuo8TAK
 fBmGHKQhnKPk36RQRMZrZx+nOL69NPYuQcf42VZoFjZDfVXqyBP9Pp6v0P1NoVulLZ
 wYUQVhVkWiRrG9EzYY3ntlEOnhc1IVq3HgWwLrX+JHt5UVJ5JGR1ini8eNCZW/mZ5V
 kgS4CbhJOx4cw==
Message-ID: <3e0e4fa3-f1d1-a8f0-507a-e9321dcc759f@kernel.org>
Date: Sun, 29 Jan 2023 18:36:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230119063625.466485-1-hch@lst.de>
 <20230119063625.466485-5-hch@lst.de>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230119063625.466485-5-hch@lst.de>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/1/19 14:36, Christoph Hellwig wrote: > Factor the
 logic to log a path for reads and writs into a helper > shared between the
 read_iter and write_iter methods. > > Signed-off-by: Christoph Hell [...]
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pM53K-0006rq-I9
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/1/19 14:36, Christoph Hellwig wrote:
> Factor the logic to log a path for reads and writs into a helper
> shared between the read_iter and write_iter methods.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   fs/f2fs/file.c | 60 +++++++++++++++++++++-----------------------------
>   1 file changed, 25 insertions(+), 35 deletions(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index f5c1b78149540c..305be6ac024196 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -4340,6 +4340,27 @@ static ssize_t f2fs_dio_read_iter(struct kiocb *iocb, struct iov_iter *to)
>   	return ret;
>   }
>   
> +static void f2fs_trace_rw_file_path(struct kiocb *iocb, size_t count, int rw)
> +{
> +	struct inode *inode = file_inode(iocb->ki_filp);
> +	char *buf, *path;
> +
> +	buf = f2fs_kmalloc(F2FS_I_SB(inode), PATH_MAX, GFP_KERNEL);
> +	if (!buf)
> +		return;
> +	path = dentry_path_raw(file_dentry(iocb->ki_filp), buf, PATH_MAX);
> +	if (IS_ERR(path))
> +		goto free_buf;
> +	if (rw == WRITE)
> +		trace_f2fs_datawrite_start(inode, iocb->ki_pos, count,
> +				current->pid, path, current->comm);
> +	else
> +		trace_f2fs_dataread_start(inode, iocb->ki_pos, count,
> +				current->pid, path, current->comm);
> +free_buf:
> +	kfree(buf);
> +}
> +
>   static ssize_t f2fs_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
>   {
>   	struct inode *inode = file_inode(iocb->ki_filp);
> @@ -4349,24 +4370,9 @@ static ssize_t f2fs_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
>   	if (!f2fs_is_compress_backend_ready(inode))
>   		return -EOPNOTSUPP;
>   
> -	if (trace_f2fs_dataread_start_enabled()) {
> -		char *p = f2fs_kmalloc(F2FS_I_SB(inode), PATH_MAX, GFP_KERNEL);
> -		char *path;
> -
> -		if (!p)
> -			goto skip_read_trace;
> +	if (trace_f2fs_dataread_start_enabled())
> +		f2fs_trace_rw_file_path(iocb, iov_iter_count(to), READ);
>   
> -		path = dentry_path_raw(file_dentry(iocb->ki_filp), p, PATH_MAX);
> -		if (IS_ERR(path)) {
> -			kfree(p);
> -			goto skip_read_trace;
> -		}
> -
> -		trace_f2fs_dataread_start(inode, pos, iov_iter_count(to),
> -					current->pid, path, current->comm);
> -		kfree(p);
> -	}
> -skip_read_trace:
>   	if (f2fs_should_use_dio(inode, iocb, to)) {
>   		ret = f2fs_dio_read_iter(iocb, to);
>   	} else {
> @@ -4672,24 +4678,8 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>   	if (preallocated < 0) {
>   		ret = preallocated;
>   	} else {
> -		if (trace_f2fs_datawrite_start_enabled()) {
> -			char *p = f2fs_kmalloc(F2FS_I_SB(inode),
> -						PATH_MAX, GFP_KERNEL);
> -			char *path;
> -
> -			if (!p)
> -				goto skip_write_trace;
> -			path = dentry_path_raw(file_dentry(iocb->ki_filp),
> -								p, PATH_MAX);
> -			if (IS_ERR(path)) {
> -				kfree(p);
> -				goto skip_write_trace;
> -			}
> -			trace_f2fs_datawrite_start(inode, orig_pos, orig_count,
> -					current->pid, path, current->comm);
> -			kfree(p);
> -		}
> -skip_write_trace:
> +		f2fs_trace_rw_file_path(iocb, orig_count, WRITE);

if (trace_f2fs_datawrite_start_enabled())
	f2fs_trace_rw_file_path(..);

Thanks,

> +
>   		/* Do the actual write. */
>   		ret = dio ?
>   			f2fs_dio_write_iter(iocb, from, &may_need_sync) :


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
