Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEB54EA5B1
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Mar 2022 05:04:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nZ29p-0006dk-PD; Tue, 29 Mar 2022 03:04:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nZ29n-0006dd-KW
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 29 Mar 2022 03:04:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pTkPxNZreP0vF0utq+zz81OZD9h4DK0WQk031lmaK94=; b=WjjGH7V+e/+KzcDzPUVWbPP6p+
 ZhWD/8vSt1kPlu6ghzF2c7ybCk+vt7buqt9yKUpH7eMstDeXOEBFrf9182Kaoll7ytwodlPlfR8nl
 GBhzkrekiQUzbxUnTWctnCDUdaXCyKnKFOfc0E6HyLmRiEdbmnjzaS+WU+fv8CipYKqs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pTkPxNZreP0vF0utq+zz81OZD9h4DK0WQk031lmaK94=; b=dVqGla7yx1kz2LhUSg2sgj+Kul
 Cd8wgQZZW2qdnDwJ/NC4Z93cg3fH499cG1I6kjakq+wDtmSsq2eKfQgi5x0RH0Maz8DT8ps8zo632
 49M5pfkP7QKoeqWH5dUs4LLe1V31wcfXYKtsqJs9L8HTePq692VXLw1+DiYVywXFVFDs=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nZ29g-0003TR-N3
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 29 Mar 2022 03:04:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 64096B81658
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 29 Mar 2022 03:04:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC64AC340ED;
 Tue, 29 Mar 2022 03:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648523052;
 bh=OMBV8b/XH53FXt/14a/2cNIo9THLs/ZF/h22zBqZ2ks=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=Yt4miJHUJO3BaSfYOXmWuICIA8z8S9t10fc3CyJja0VjYJeIircQghekEHje/F7eR
 UVKLbz4W0fu3c7W7Rrnhr9Ovq7sbuTRWBAaFqaW2AOjwPbfmSwzyhca0LrcaZGjXrt
 DpvD8MEwrtJF8P3O5lok/PC0fJgOrOj39JC7G8VW4FPkyxgDgzU9brhNNqNuvOgsv1
 ul+h7dbhKueeiXHGXGuNsWPROMdIuLUbccLoiBsLLJphF9bRE1csvR/5saRjsln597
 h6IjmqGPcnjDXB8ES3eqVT2FJd6TMx1j5Xi/WdzUbZbYO7VEOPggc7Hkw3nkM2gp9K
 EIPIeZKhHHgPg==
Message-ID: <3b20d122-1716-4225-9f47-7b5ba21c05db@kernel.org>
Date: Tue, 29 Mar 2022 11:04:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20220321223315.3228326-1-jaegeuk@kernel.org>
 <YjkUvRKhyX8AUoTm@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <YjkUvRKhyX8AUoTm@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/3/22 8:13,
 Jaegeuk Kim wrote: > This was used in Android
 for a long time. Let's upstream it. > > Signed-off-by: Jaegeuk Kim
 <jaegeuk@kernel.org>
 > --- > > Change log from v1: > - remove unnece [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nZ29g-0003TR-N3
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: introduce data read/write showing
 path info
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/3/22 8:13, Jaegeuk Kim wrote:
> This was used in Android for a long time. Let's upstream it.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
> 
>   Change log from v1:
>    - remove unnecessary path lookup
> 
>   fs/f2fs/file.c              | 48 ++++++++++++++++---
>   include/trace/events/f2fs.h | 94 +++++++++++++++++++++++++++++++++++++
>   2 files changed, 135 insertions(+), 7 deletions(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 68ddf4c7ca64..19bc916c1eb7 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -4329,17 +4329,34 @@ static ssize_t f2fs_dio_read_iter(struct kiocb *iocb, struct iov_iter *to)
>   static ssize_t f2fs_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
>   {
>   	struct inode *inode = file_inode(iocb->ki_filp);
> +	const loff_t pos = iocb->ki_pos;
>   	ssize_t ret;
>   
>   	if (!f2fs_is_compress_backend_ready(inode))
>   		return -EOPNOTSUPP;
>   
> -	if (f2fs_should_use_dio(inode, iocb, to))
> -		return f2fs_dio_read_iter(iocb, to);
> +	if (trace_f2fs_dataread_start_enabled()) {
> +		char *path, *p = kmalloc(PATH_MAX, GFP_KERNEL);

f2fs_kmalloc();

> +		if (!p)
> +			goto skip_read_trace;
> +
> +		path = dentry_path_raw(file_dentry(iocb->ki_filp), p, PATH_MAX);
> +		if (IS_ERR(path))

kfree();

> +			goto skip_read_trace;
>   
> -	ret = filemap_read(iocb, to, 0);
> -	if (ret > 0)
> -		f2fs_update_iostat(F2FS_I_SB(inode), APP_BUFFERED_READ_IO, ret);
> +		trace_f2fs_dataread_start(inode, pos, iov_iter_count(to),
> +					current->pid, path, current->comm);
> +		kfree(p);
> +	}
> +skip_read_trace:
> +	if (f2fs_should_use_dio(inode, iocb, to)) {
> +		ret = f2fs_dio_read_iter(iocb, to);
> +	} else {
> +		ret = filemap_read(iocb, to, 0);
> +		if (ret > 0)
> +			f2fs_update_iostat(F2FS_I_SB(inode), APP_BUFFERED_READ_IO, ret);
> +	}

if (trace_f2fs_dataread_end_enabled())

Thanks,

> +	trace_f2fs_dataread_end(inode, pos, ret);
>   	return ret;
>   }
>   
> @@ -4637,14 +4654,31 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>   	/* Possibly preallocate the blocks for the write. */
>   	target_size = iocb->ki_pos + iov_iter_count(from);
>   	preallocated = f2fs_preallocate_blocks(iocb, from, dio);
> -	if (preallocated < 0)
> +	if (preallocated < 0) {
>   		ret = preallocated;
> -	else
> +	} else {
> +		if (trace_f2fs_datawrite_start_enabled()) {
> +			char *path, *p = kmalloc(PATH_MAX, GFP_KERNEL);

f2fs_kmalloc()

> +			if (!p)
> +				goto skip_write_trace;
> +			path = dentry_path_raw(file_dentry(iocb->ki_filp),
> +								p, PATH_MAX);
> +			if (IS_ERR(path))

kfree();

> +				goto skip_write_trace;
> +			trace_f2fs_datawrite_start(inode, orig_pos, orig_count,
> +					current->pid, path, current->comm);
> +			kfree(p);
> +		}
> +skip_write_trace:
>   		/* Do the actual write. */
>   		ret = dio ?
>   			f2fs_dio_write_iter(iocb, from, &may_need_sync):
>   			f2fs_buffered_write_iter(iocb, from);
>   
> +		if (trace_f2fs_datawrite_end_enabled())
> +			trace_f2fs_datawrite_end(inode, orig_pos, ret);
> +	}
> +
>   	/* Don't leave any preallocated blocks around past i_size. */
>   	if (preallocated && i_size_read(inode) < target_size) {
>   		f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
> index f701bb23f83c..11f6b7147be2 100644
> --- a/include/trace/events/f2fs.h
> +++ b/include/trace/events/f2fs.h
> @@ -2068,6 +2068,100 @@ TRACE_EVENT(f2fs_fiemap,
>   		__entry->ret)
>   );
>   
> +DECLARE_EVENT_CLASS(f2fs__rw_start,
> +
> +	TP_PROTO(struct inode *inode, loff_t offset, int bytes,
> +			pid_t pid, char *pathname, char *command),
> +
> +	TP_ARGS(inode, offset, bytes, pid, pathname, command),
> +
> +	TP_STRUCT__entry(
> +		__string(pathbuf, pathname)
> +		__field(loff_t, offset)
> +		__field(int, bytes)
> +		__field(loff_t, i_size)
> +		__string(cmdline, command)
> +		__field(pid_t, pid)
> +		__field(ino_t, ino)
> +	),
> +
> +	TP_fast_assign(
> +		/*
> +		 * Replace the spaces in filenames and cmdlines
> +		 * because this screws up the tooling that parses
> +		 * the traces.
> +		 */
> +		__assign_str(pathbuf, pathname);
> +		(void)strreplace(__get_str(pathbuf), ' ', '_');
> +		__entry->offset = offset;
> +		__entry->bytes = bytes;
> +		__entry->i_size = i_size_read(inode);
> +		__assign_str(cmdline, command);
> +		(void)strreplace(__get_str(cmdline), ' ', '_');
> +		__entry->pid = pid;
> +		__entry->ino = inode->i_ino;
> +	),
> +
> +	TP_printk("entry_name %s, offset %llu, bytes %d, cmdline %s,"
> +		" pid %d, i_size %llu, ino %lu",
> +		__get_str(pathbuf), __entry->offset, __entry->bytes,
> +		__get_str(cmdline), __entry->pid, __entry->i_size,
> +		(unsigned long) __entry->ino)
> +);
> +
> +DECLARE_EVENT_CLASS(f2fs__rw_end,
> +
> +	TP_PROTO(struct inode *inode, loff_t offset, int bytes),
> +
> +	TP_ARGS(inode, offset, bytes),
> +
> +	TP_STRUCT__entry(
> +		__field(ino_t,	ino)
> +		__field(loff_t,	offset)
> +		__field(int,	bytes)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->ino		= inode->i_ino;
> +		__entry->offset		= offset;
> +		__entry->bytes		= bytes;
> +	),
> +
> +	TP_printk("ino %lu, offset %llu, bytes %d",
> +		(unsigned long) __entry->ino,
> +		__entry->offset, __entry->bytes)
> +);
> +
> +DEFINE_EVENT(f2fs__rw_start, f2fs_dataread_start,
> +
> +	TP_PROTO(struct inode *inode, loff_t offset, int bytes,
> +		pid_t pid, char *pathname, char *command),
> +
> +	TP_ARGS(inode, offset, bytes, pid, pathname, command)
> +);
> +
> +DEFINE_EVENT(f2fs__rw_end, f2fs_dataread_end,
> +
> +	TP_PROTO(struct inode *inode, loff_t offset, int bytes),
> +
> +	TP_ARGS(inode, offset, bytes)
> +);
> +
> +DEFINE_EVENT(f2fs__rw_start, f2fs_datawrite_start,
> +
> +	TP_PROTO(struct inode *inode, loff_t offset, int bytes,
> +		pid_t pid, char *pathname, char *command),
> +
> +	TP_ARGS(inode, offset, bytes, pid, pathname, command)
> +);
> +
> +DEFINE_EVENT(f2fs__rw_end, f2fs_datawrite_end,
> +
> +	TP_PROTO(struct inode *inode, loff_t offset, int bytes),
> +
> +	TP_ARGS(inode, offset, bytes)
> +);
> +
>   #endif /* _TRACE_F2FS_H */
>   
>    /* This part must be outside protection */


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
