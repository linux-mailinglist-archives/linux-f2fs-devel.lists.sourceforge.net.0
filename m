Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B148A522A6F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 May 2022 05:30:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nod3w-0000Lj-NL; Wed, 11 May 2022 03:30:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nod3v-0000LS-49
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 May 2022 03:30:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5WA9PA5INVtneTO9WoHHq0XDSjbNpPgCLpTMmo6WZmM=; b=WknMKjJC/luMaymBbtq9hYuzU/
 5TnuHH3jQOlTC0SmsM2Wxis70pVvwZGKpp4dYnRUk3LodxxH+L6q9dGBG2XVXxbzIPKkcwzYyPFnI
 p/3xbwjVFsngvY+hs91WdvINt8jHJv+Je57WBq8x/uifWiNegc1Yhk0H4qf0dwfOrmmE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5WA9PA5INVtneTO9WoHHq0XDSjbNpPgCLpTMmo6WZmM=; b=W6Z9ZI5NIbco/X4fYFv857n+Tk
 KN0LuJwvABRaRxBds30OyCxSul2RS3S0eiNh+SLLqEmxkI/0sPBVu/WbHG7GO3c+NKXV6+AB3xV8c
 9vM9SibP5/GjtaN0wuGfBj0bAQtwlN+hIMhmayvXX4NvpA2A7eBTbOg/EqYxSFOZuKWY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nod3e-008RYJ-Er
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 May 2022 03:30:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1C38560FEB
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 11 May 2022 03:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC46DC385A4;
 Wed, 11 May 2022 03:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652239832;
 bh=LCu9ZDp9CN/7vd9liNbcMeChr+buxDxk3VjPo34ywlA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F2hk3I4btQ1IH09Gr/sBohI5zBaRmmQHuI7wjOW92aze2UgOsRTR0zq12D9ovsBI/
 0uNM3lCt74K02P/LoftdnGBE7Q9+SEA4Aur6X+QSHKpNQX3ctIoCnvgwG6WUy3M7Qw
 2wxIwE03brAW0gXkVgJOtgkLPoO4pqSeK9bqB+DSlGnhAwL89Tq4yxv0r2iAU4zEXO
 /SZwyYKRbMDhGnLr5E51ou0H++Mhviy+477FiEhMDko24yQshoQ8PPDVy9sZRJale/
 XRw2jiUVOwn3cfnwIyiBxF7dHKyz72i3ccXSBexRSv2cGt1rUutLyxWnQ03wMH9LdQ
 qq48FAMUR3wNg==
Date: Tue, 10 May 2022 20:30:31 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <Ynst13cs86AHMLQ8@google.com>
References: <20220506232032.1264078-1-jaegeuk@kernel.org>
 <20220506232032.1264078-2-jaegeuk@kernel.org>
 <YnlFiz/IgsjtGhqu@google.com>
 <0a58b401-6fa4-4314-d7b4-029993cb7a75@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0a58b401-6fa4-4314-d7b4-029993cb7a75@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 05/11, Chao Yu wrote: > Jaegeuk, > > Seems it includes
 a wrong android tracepoint patch? Oops. :) > > Thanks, > > On 2022/5/10 0:47, 
 Jaegeuk Kim wrote: > > This was used in Android for a long time. Let's
 upstream
 it. > > > > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> > > --- > > Change
 log fr [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nod3e-008RYJ-Er
Subject: Re: [f2fs-dev] [PATCH 2/5 v2] f2fs: introduce f2fs_gc_control to
 consolidate f2fs_gc parameters
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

On 05/11, Chao Yu wrote:
> Jaegeuk,
> 
> Seems it includes a wrong android tracepoint patch?

Oops. :)

> 
> Thanks,
> 
> On 2022/5/10 0:47, Jaegeuk Kim wrote:
> > This was used in Android for a long time. Let's upstream it.
> > 
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > ---
> >   Change log from v1:
> >    - fix tracepoint for the "don't care" entry
> > 
> >   fs/f2fs/file.c              | 58 ++++++++++++++++++++---
> >   include/trace/events/f2fs.h | 94 +++++++++++++++++++++++++++++++++++++
> >   2 files changed, 145 insertions(+), 7 deletions(-)
> > 
> > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > index 68ddf4c7ca64..51df34f95984 100644
> > --- a/fs/f2fs/file.c
> > +++ b/fs/f2fs/file.c
> > @@ -4329,17 +4329,39 @@ static ssize_t f2fs_dio_read_iter(struct kiocb *iocb, struct iov_iter *to)
> >   static ssize_t f2fs_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
> >   {
> >   	struct inode *inode = file_inode(iocb->ki_filp);
> > +	const loff_t pos = iocb->ki_pos;
> >   	ssize_t ret;
> >   	if (!f2fs_is_compress_backend_ready(inode))
> >   		return -EOPNOTSUPP;
> > -	if (f2fs_should_use_dio(inode, iocb, to))
> > -		return f2fs_dio_read_iter(iocb, to);
> > +	if (trace_f2fs_dataread_start_enabled()) {
> > +		char *p = f2fs_kmalloc(F2FS_I_SB(inode), PATH_MAX, GFP_KERNEL);
> > +		char *path;
> > +
> > +		if (!p)
> > +			goto skip_read_trace;
> > +
> > +		path = dentry_path_raw(file_dentry(iocb->ki_filp), p, PATH_MAX);
> > +		if (IS_ERR(path)) {
> > +			kfree(p);
> > +			goto skip_read_trace;
> > +		}
> > -	ret = filemap_read(iocb, to, 0);
> > -	if (ret > 0)
> > -		f2fs_update_iostat(F2FS_I_SB(inode), APP_BUFFERED_READ_IO, ret);
> > +		trace_f2fs_dataread_start(inode, pos, iov_iter_count(to),
> > +					current->pid, path, current->comm);
> > +		kfree(p);
> > +	}
> > +skip_read_trace:
> > +	if (f2fs_should_use_dio(inode, iocb, to)) {
> > +		ret = f2fs_dio_read_iter(iocb, to);
> > +	} else {
> > +		ret = filemap_read(iocb, to, 0);
> > +		if (ret > 0)
> > +			f2fs_update_iostat(F2FS_I_SB(inode), APP_BUFFERED_READ_IO, ret);
> > +	}
> > +	if (trace_f2fs_dataread_end_enabled())
> > +		trace_f2fs_dataread_end(inode, pos, ret);
> >   	return ret;
> >   }
> > @@ -4637,14 +4659,36 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
> >   	/* Possibly preallocate the blocks for the write. */
> >   	target_size = iocb->ki_pos + iov_iter_count(from);
> >   	preallocated = f2fs_preallocate_blocks(iocb, from, dio);
> > -	if (preallocated < 0)
> > +	if (preallocated < 0) {
> >   		ret = preallocated;
> > -	else
> > +	} else {
> > +		if (trace_f2fs_datawrite_start_enabled()) {
> > +			char *p = f2fs_kmalloc(F2FS_I_SB(inode),
> > +						PATH_MAX, GFP_KERNEL);
> > +			char *path;
> > +
> > +			if (!p)
> > +				goto skip_write_trace;
> > +			path = dentry_path_raw(file_dentry(iocb->ki_filp),
> > +								p, PATH_MAX);
> > +			if (IS_ERR(path)) {
> > +				kfree(p);
> > +				goto skip_write_trace;
> > +			}
> > +			trace_f2fs_datawrite_start(inode, orig_pos, orig_count,
> > +					current->pid, path, current->comm);
> > +			kfree(p);
> > +		}
> > +skip_write_trace:
> >   		/* Do the actual write. */
> >   		ret = dio ?
> >   			f2fs_dio_write_iter(iocb, from, &may_need_sync):
> >   			f2fs_buffered_write_iter(iocb, from);
> > +		if (trace_f2fs_datawrite_end_enabled())
> > +			trace_f2fs_datawrite_end(inode, orig_pos, ret);
> > +	}
> > +
> >   	/* Don't leave any preallocated blocks around past i_size. */
> >   	if (preallocated && i_size_read(inode) < target_size) {
> >   		f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> > diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
> > index f701bb23f83c..11f6b7147be2 100644
> > --- a/include/trace/events/f2fs.h
> > +++ b/include/trace/events/f2fs.h
> > @@ -2068,6 +2068,100 @@ TRACE_EVENT(f2fs_fiemap,
> >   		__entry->ret)
> >   );
> > +DECLARE_EVENT_CLASS(f2fs__rw_start,
> > +
> > +	TP_PROTO(struct inode *inode, loff_t offset, int bytes,
> > +			pid_t pid, char *pathname, char *command),
> > +
> > +	TP_ARGS(inode, offset, bytes, pid, pathname, command),
> > +
> > +	TP_STRUCT__entry(
> > +		__string(pathbuf, pathname)
> > +		__field(loff_t, offset)
> > +		__field(int, bytes)
> > +		__field(loff_t, i_size)
> > +		__string(cmdline, command)
> > +		__field(pid_t, pid)
> > +		__field(ino_t, ino)
> > +	),
> > +
> > +	TP_fast_assign(
> > +		/*
> > +		 * Replace the spaces in filenames and cmdlines
> > +		 * because this screws up the tooling that parses
> > +		 * the traces.
> > +		 */
> > +		__assign_str(pathbuf, pathname);
> > +		(void)strreplace(__get_str(pathbuf), ' ', '_');
> > +		__entry->offset = offset;
> > +		__entry->bytes = bytes;
> > +		__entry->i_size = i_size_read(inode);
> > +		__assign_str(cmdline, command);
> > +		(void)strreplace(__get_str(cmdline), ' ', '_');
> > +		__entry->pid = pid;
> > +		__entry->ino = inode->i_ino;
> > +	),
> > +
> > +	TP_printk("entry_name %s, offset %llu, bytes %d, cmdline %s,"
> > +		" pid %d, i_size %llu, ino %lu",
> > +		__get_str(pathbuf), __entry->offset, __entry->bytes,
> > +		__get_str(cmdline), __entry->pid, __entry->i_size,
> > +		(unsigned long) __entry->ino)
> > +);
> > +
> > +DECLARE_EVENT_CLASS(f2fs__rw_end,
> > +
> > +	TP_PROTO(struct inode *inode, loff_t offset, int bytes),
> > +
> > +	TP_ARGS(inode, offset, bytes),
> > +
> > +	TP_STRUCT__entry(
> > +		__field(ino_t,	ino)
> > +		__field(loff_t,	offset)
> > +		__field(int,	bytes)
> > +	),
> > +
> > +	TP_fast_assign(
> > +		__entry->ino		= inode->i_ino;
> > +		__entry->offset		= offset;
> > +		__entry->bytes		= bytes;
> > +	),
> > +
> > +	TP_printk("ino %lu, offset %llu, bytes %d",
> > +		(unsigned long) __entry->ino,
> > +		__entry->offset, __entry->bytes)
> > +);
> > +
> > +DEFINE_EVENT(f2fs__rw_start, f2fs_dataread_start,
> > +
> > +	TP_PROTO(struct inode *inode, loff_t offset, int bytes,
> > +		pid_t pid, char *pathname, char *command),
> > +
> > +	TP_ARGS(inode, offset, bytes, pid, pathname, command)
> > +);
> > +
> > +DEFINE_EVENT(f2fs__rw_end, f2fs_dataread_end,
> > +
> > +	TP_PROTO(struct inode *inode, loff_t offset, int bytes),
> > +
> > +	TP_ARGS(inode, offset, bytes)
> > +);
> > +
> > +DEFINE_EVENT(f2fs__rw_start, f2fs_datawrite_start,
> > +
> > +	TP_PROTO(struct inode *inode, loff_t offset, int bytes,
> > +		pid_t pid, char *pathname, char *command),
> > +
> > +	TP_ARGS(inode, offset, bytes, pid, pathname, command)
> > +);
> > +
> > +DEFINE_EVENT(f2fs__rw_end, f2fs_datawrite_end,
> > +
> > +	TP_PROTO(struct inode *inode, loff_t offset, int bytes),
> > +
> > +	TP_ARGS(inode, offset, bytes)
> > +);
> > +
> >   #endif /* _TRACE_F2FS_H */
> >    /* This part must be outside protection */


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
