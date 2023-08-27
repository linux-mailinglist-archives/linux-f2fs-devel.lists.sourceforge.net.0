Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 260E578A200
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 27 Aug 2023 23:45:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qaNZv-0005Wj-B6;
	Sun, 27 Aug 2023 21:45:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <viro@ftp.linux.org.uk>) id 1qaNZt-0005Wa-VT
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 27 Aug 2023 21:45:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kY05MXjwCqUKuXNwucsgt/McL4F7q7Pfbjm7IIALTG0=; b=Swf9kquZaBVJedAarT8TCbaREC
 CfolvVLbNABF/dVTFRBIzt2zsqWQLpkcu+SRedKWUo6Ctwv2Nyk0M385K4atTcCRFCJii3z3GIoJI
 4f7u0LlmBc27q/y8LITO4PsonFzrIVQHqYLSDTP1spzokHtIVXW7nH4WVhOpv32wcL2U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kY05MXjwCqUKuXNwucsgt/McL4F7q7Pfbjm7IIALTG0=; b=ZSnAcFKWo+t7Mw8SwiJw+gyvyB
 1uM/+udvb03WPdrYwcZSz14wHW5KYuxhluxj6qPixbQh7/8THyMzrpHnQ5/f0f+8LYSGfsKxdIWqf
 eWRpE6c+4zyedty8IY6Qrl9apSRiHf3/905LWWLbZtcfQYXxUk1N7P/+6dTFqc11sVXs=;
Received: from zeniv.linux.org.uk ([62.89.141.173])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qaNZn-00HNnF-MS for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 27 Aug 2023 21:45:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=kY05MXjwCqUKuXNwucsgt/McL4F7q7Pfbjm7IIALTG0=; b=rwicGoUvL4VgCd8/Qp1uGcvFJj
 2egMEWh2qIptB38yz3LkaovCgsrzYd5qWYzYVrLDB0+2cvC8Hq94M95X4EXXJUaYQexvV5ydz/PhQ
 3oSRutUhsOumwt9db2so3z+etJXEF+Wi2+NHOmG8HlbMqrIjqtB+TQ9YoLhUuiexvk8+I1LYJ/xSV
 ZlLyerq6Wcockw2BEhGC0e7r/uJgQmeAavj3yTO2QGyQwB10XYMkDDZ1Bff7wCxS6uqmy7RDsW0tE
 LxV9EZ6t5yOJ6J5Tl0xTjIsbFSoYFc5//Rfxs/6ERxlTJUc4/DLKribj0NNKKwb+gHZab/RxADkLO
 htbC578A==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qaNZO-001P52-2K; Sun, 27 Aug 2023 21:45:18 +0000
Date: Sun, 27 Aug 2023 22:45:18 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20230827214518.GU3390869@ZenIV>
References: <20230601145904.1385409-1-hch@lst.de>
 <20230601145904.1385409-4-hch@lst.de>
 <20230827194122.GA325446@ZenIV>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230827194122.GA325446@ZenIV>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, Aug 27, 2023 at 08:41:22PM +0100, Al Viro wrote: >
 On Thu, Jun 01, 2023 at 04:58:55PM +0200, Christoph Hellwig wrote: > > All
 callers of generic_perform_write need to updated ki_pos, move it i [...] 
 Content analysis details:   (-0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1qaNZn-00HNnF-MS
Subject: Re: [f2fs-dev] [PATCH 03/12] filemap: update ki_pos in
 generic_perform_write
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
Cc: "Darrick J. Wong" <djwong@kernel.org>, linux-mm@kvack.org,
 Andreas Gruenbacher <agruenba@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>,
 Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-block@vger.kernel.org,
 Damien Le Moal <dlemoal@kernel.org>, Hannes Reinecke <hare@suse.de>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Xiubo Li <xiubli@redhat.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, Aug 27, 2023 at 08:41:22PM +0100, Al Viro wrote:
> On Thu, Jun 01, 2023 at 04:58:55PM +0200, Christoph Hellwig wrote:
> > All callers of generic_perform_write need to updated ki_pos, move it into
> > common code.
> 
> > @@ -4034,7 +4037,6 @@ ssize_t __generic_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
> >  		endbyte = pos + status - 1;
> >  		err = filemap_write_and_wait_range(mapping, pos, endbyte);
> >  		if (err == 0) {
> > -			iocb->ki_pos = endbyte + 1;
> >  			written += status;
> >  			invalidate_mapping_pages(mapping,
> >  						 pos >> PAGE_SHIFT,
> > @@ -4047,8 +4049,6 @@ ssize_t __generic_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
> >  		}
> >  	} else {
> >  		written = generic_perform_write(iocb, from);
> > -		if (likely(written > 0))
> > -			iocb->ki_pos += written;
> >  	}
> >  out:
> >  	return written ? written : err;
> 
> [another late reply, sorry]
> 
> That part is somewhat fishy - there's a case where you return a positive value
> and advance ->ki_pos by more than that amount.  I really wonder if all callers
> of ->write_iter() are OK with that.  Consider e.g. this:
> 
> ssize_t ksys_write(unsigned int fd, const char __user *buf, size_t count)
> {
>         struct fd f = fdget_pos(fd);
>         ssize_t ret = -EBADF;
> 
>         if (f.file) {
>                 loff_t pos, *ppos = file_ppos(f.file);
>                 if (ppos) {
>                         pos = *ppos;   
>                         ppos = &pos;
>                 }
>                 ret = vfs_write(f.file, buf, count, ppos);
>                 if (ret >= 0 && ppos)
>                         f.file->f_pos = pos;
>                 fdput_pos(f);
>         }
> 
>         return ret;
> }
> 
> ssize_t vfs_write(struct file *file, const char __user *buf, size_t count, loff_t *pos)
> {
>         ssize_t ret;
> 
>         if (!(file->f_mode & FMODE_WRITE))
>                 return -EBADF;
>         if (!(file->f_mode & FMODE_CAN_WRITE))
>                 return -EINVAL;
>         if (unlikely(!access_ok(buf, count)))
>                 return -EFAULT;
> 
>         ret = rw_verify_area(WRITE, file, pos, count);
>         if (ret)
>                 return ret;
>         if (count > MAX_RW_COUNT)
>                 count =  MAX_RW_COUNT;
>         file_start_write(file);
>         if (file->f_op->write)
>                 ret = file->f_op->write(file, buf, count, pos);
>         else if (file->f_op->write_iter)
>                 ret = new_sync_write(file, buf, count, pos);
>         else   
>                 ret = -EINVAL;
>         if (ret > 0) {
>                 fsnotify_modify(file);
>                 add_wchar(current, ret);
>         }
>         inc_syscw(current);
>         file_end_write(file);
>         return ret;
> }
> 
> static ssize_t new_sync_write(struct file *filp, const char __user *buf, size_t len, loff_t *ppos)
> {
>         struct kiocb kiocb;
>         struct iov_iter iter;
>         ssize_t ret; 
> 
>         init_sync_kiocb(&kiocb, filp);
>         kiocb.ki_pos = (ppos ? *ppos : 0);
>         iov_iter_ubuf(&iter, ITER_SOURCE, (void __user *)buf, len);
> 
>         ret = call_write_iter(filp, &kiocb, &iter);
>         BUG_ON(ret == -EIOCBQUEUED);
>         if (ret > 0 && ppos)
>                 *ppos = kiocb.ki_pos;
>         return ret;
> } 
> 
> Suppose ->write_iter() ends up doing returning a positive value smaller than
> the increment of kiocb.ki_pos.  What do we get?  ret is positive, so
> kiocb.ki_pos gets copied into *ppos, which is ksys_write's pos and there
> we copy it into file->f_pos.
> 
> Is it really OK to have write() return 4096 and advance the file position
> by 16K?  AFAICS, userland wouldn't get any indication of something
> odd going on - just a short write to a regular file, with followup write
> of remaining 12K getting quietly written in the range 16K..28K.
> 
> I don't remember what POSIX says about that, but it would qualify as
> nasty surprise for any userland program - sure, one can check fsync()
> results before closing the sucker and see if everything looks fine,
> but the way it's usually discussed could easily lead to assumption that
> (synchronous) O_DIRECT writes would not be affected by anything of that
> sort.

IOW, I suspect that the right thing to do would be something along the lines
of

direct_write_fallback(): on error revert the ->ki_pos update from buffered write

If we fail filemap_write_and_wait_range() on the range the buffered write went
into, we only report the "number of bytes which we direct-written", to quote
the comment in there.  Which is fine, but buffered write has already advanced
iocb->ki_pos, so we need to roll that back.  Otherwise we end up with e.g.
write(2) advancing position by more than the amount it reports having written.

Fixes: 182c25e9c157 "filemap: update ki_pos in generic_perform_write"
Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
diff --git a/fs/libfs.c b/fs/libfs.c
index 5b851315eeed..712c57828c0e 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -1646,6 +1646,7 @@ ssize_t direct_write_fallback(struct kiocb *iocb, struct iov_iter *iter,
 		 * We don't know how much we wrote, so just return the number of
 		 * bytes which were direct-written
 		 */
+		iocb->ki_pos -= buffered_written;
 		if (direct_written)
 			return direct_written;
 		return err;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
